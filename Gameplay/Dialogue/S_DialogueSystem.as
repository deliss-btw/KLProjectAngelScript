

class US_DialogueSystem : UECSScriptSystem
{
    US_DialogueSystem()
    {
        return;
    }
    UFUNCTION()
    void ClientJob_PreloadDialogueAssets() const
    {
        ::UDialogueSubtitleSubsystem::Get().InitAndPreloadDialogueAssets();
        return;
    }
    UFUNCTION()
    void ServerJob_InitDailyDialogue() const
    {
        bool local_71;
        int local_132 = 0;
        XLog(ELog(64), FString().Append("[Dialogue] Init Daily Dialogue Pending List"));
        TDataObjectPtr<FLevelInfoConfig> local_30 = ::FLevelUtils::GetCurrentLevelInfoConfig(nullptr);
        TDataObjectIterator<FDailyDialogueConfig> local_70;
        for (; local_70; )
        {
            const FDailyDialogueConfig& local_74 = local_70.GetData();
            if (!(local_74.GetLevelInfo().IsSet()))
            {
                local_71 = false;
            }
            else
            {
                TDataObjectPtr<FLevelInfoConfig> local_54;
                local_54 = local_74.GetLevelInfo();
                local_71 = !((local_54 == local_30.opImplConv()));
            }
            if (local_71)
            {
            }
            else
            {
                FECSWorldPtr local_126 = ECS::GetECSWorld();
                if (local_74.GetInteractTargetNPC().IsSet())
                {
                    FName local_188 = local_74.GetDataName();
                    local_132.NPCDialogueMap.FindOrAdd(local_74.GetInteractTargetNPC()).GetDialogueInfos().FindOrAdd(local_188) = FDialogueInfo(TDataObjectPtr<FDialogueConfig>(local_74));
                }
            }
            local_70.Next();
        }
        return;
    }
    UFUNCTION()
    void Monitor_UpdatePendingDialoguesForNpc(const FECSEntity &inout Entity, const FC_NPCReadyTag &inout Tag) const
    {
        int local_14 = 0;
        FECSWorldPtr local_2 = ECS::GetECSWorld();
        Has local_6;
        if (!(local_6.opCall()))
        {
            return;
        }
        FECSWorldPtr local_2_2 = ECS::GetECSWorld();
        Get local_18;
        const FC_NPCInfo& local_20 = local_18.opCall();
        if (local_20)
        {
            TDataObjectPtr<FNPCMainConfig> local_44 = local_20.GetMainConfig();
            if (!(local_44.IsSet()) || !(local_14.NPCDialogueMap.Contains(local_44)))
            {
                return;
            }
            if (!(Entity.IsValid()))
            {
                XWarning(ELog(64), FString().Append("Try Activate Dialogue, but Entity is invalid ").Append(Entity.GetIdValue()));
            }
            FECSWorldPtr local_2_3 = ECS::GetECSWorld();
            Modify local_80;
            FCS_DialoguePendingList& local_82 = local_80.opCall();
            if (local_82)
            {
                TArray<FName> local_86;
                FDialogueInfoList& local_88 = local_82.NPCDialogueMap[local_44];
                for (auto& local_106 : local_88.GetDialogueInfos())
                {
                    if (::DialogueUtils::ActivateGlobalDialogue(GetDialogueConfig(), Entity))
                    {
                        XLog(ELog(64), FString().Append("[Dialogue] Pending NPC Dialogue for Entity Activated: ").Append(Entity.GetEntityName()).Append(", Dialogue: ").Append(local_106.GetKey()));
                        local_86.Add(local_106.GetKey());
                    }
                }
                if (local_86.Num() == local_88.GetDialogueInfos().Num())
                {
                }
                else
                {
                    for (auto& local_124 : local_86)
                    {
                        local_124;
                    }
                }
            }
        }
        return;
    }
    UFUNCTION()
    void ServerJob_HandleNotifyStartAmbientDialogue(const FCE_NotifyStartAmbientDialogue &inout Event) const
    {
        int local_12 = 0;
        FName local_20;
        int local_73 = 0;
        const UDialogueSettings local_106;
        float local_118;
        Has local_4;
        bool local_5 = local_4.opCall();
        if (local_5)
        {
            local_20 = local_12.GetDialogueContext().GetDialogueName();
            XError(ELog(64), FString().Append("[Dialogue] Start ambient dialogue failed, ").Append(Event.DialogueEntity.GetEntityName()).Append(" is already playing: ").Append(local_20));
            return;
        }
        FName local_23;
        if (Event.DialogueConfig.IsSet())
        {
            local_20.GetDataName();
            local_23 = local_20;
        }
        else
        {
            local_23 = FName("Unknown");
        }
        XLog(ELog(64), FString().Append("[Dialogue] Handle Notify Start Ambient Dialogue: ").Append(Event.DialogueEntity.GetEntityName()).Append(", Dialogue: ").Append(local_23));
        FDialogueDeliveryContext local_72;
        local_72.SetDialogueName(local_23);
        local_72.SetDialogueType(EDialogueType(local_73));
        local_72.SetInteractTarget(Event.DialogueEntity);
        CastTo local_78;
        local_72.SetDialogueConfig(local_78.opCall());
        local_72.SetStartAtNodeId(0);
        GetGameplaySettings<UDialogueSettings> local_108;
        local_106 = local_108;
        float local_114 = (Event.InterruptDistance * Event.InterruptDistance);
        local_72.SetInterruptDistanceSquared(local_114);
        if (Event.ResumeDistance < 0.0f)
        {
            local_118 = (Event.InterruptDistance * 0.8f);
        }
        else
        {
            local_118 = Event.ResumeDistance;
        }
        float local_114_2 = FMath::Min(local_106.AmbientDialogueResumeDistanceMin, Event.InterruptDistance);
        float local_116 = FMath::Clamp(local_118, local_114_2, Event.InterruptDistance);
        local_72.SetResumeDistanceSquared((local_116 * local_116));
        local_72.SetSubtitleInterval(local_106.DialogueSubtitleInterval);
        local_12.SetTriggerPlayer(Event.TriggerPlayer);
        local_12.SetDialogueContext(local_72);
        local_12.SetBroadcastScope(Event.BroadcastScope);
        local_73 = int(local_72.GetDialogueType());
        local_20 = local_72.GetDialogueName();
        FDialogueSection local_306;
        local_12.SetSection(local_306);
        FC_DialogueNextSectionTag local_312;
        Assign local_310;
        local_310.opCall(local_312);
        return;
    }
    UFUNCTION()
    void ServerJob_HandleOnDialogueInteraction(const FCE_OnDialogueInteraction &inout Event) const
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
    }
    void StartSimpleDialogue(const FECSEntity &inout PlayerEntity, const FECSEntity &inout InteractTarget, const TDataObjectPtr<FDialogueConfig> &inout DialogueConfig, const bool bAddAttachableDialogues) const
    {
        int local_57 = 0;
        const UDialogueSettings local_60;
        float local_104;
        int local_184 = 0;
        int local_232 = 0;
        if (!(PlayerEntity.IsValid()) || !(InteractTarget.IsValid()) || !(DialogueConfig.IsSet()))
        {
            XError(ELog(64), FString().Append("Invalid parameters for start simple dialogue"));
            return;
        }
        FDialogueDeliveryContext local_54;
        FName local_56;
        local_56.GetDataName();
        local_54.SetDialogueName(local_56);
        local_54.SetDialogueType(EDialogueType(local_57));
        local_54.SetInteractTarget(InteractTarget);
        local_54.SetDialogueConfig(DialogueConfig);
        local_54.SetStartAtNodeId(0);
        GetGameplaySettings<UDialogueSettings> local_62;
        local_60 = local_62;
        Has local_68;
        if (!(local_68.opCall()))
        {
            XError(ELog(64), FString().Append("StartSimpleDialogue failed: Entity ").Append(PlayerEntity.GetEntityName()).Append(" missing FC_PlayerController"));
            return;
        }
        Get local_76;
        FVector local_82 = ::FASCommonUtils::GetEntityLocation(FECSEntity(local_76.opCall().GetPlayerPawnEntity()));
        float local_98 = local_82.DistSquared(::FASCommonUtils::GetEntityLocation(InteractTarget));
        if (local_98 <= (local_60.DialogueInterruptDistance * local_60.DialogueInterruptDistance))
        {
            local_104 = local_60.DialogueInterruptDistance;
        }
        else
        {
            local_104 = FMath::Sqrt(local_98) + local_60.DialogueInterruptDistanceExtra;
        }
        float local_100 = local_104 * local_104;
        local_54.SetInterruptDistanceSquared(local_100);
        local_54.SetSubtitleInterval(local_60.DialogueSubtitleInterval);
        if (bAddAttachableDialogues)
        {
            TArray<FDialogueInfo> local_110;
            if (this.TryFindAttachableDialogues(PlayerEntity, InteractTarget, local_110))
            {
                local_54.SetAttachableDialogues(local_110);
            }
        }
        local_184.SetDialogueContext(local_54);
        local_232.SetSection(FDialogueSection(local_54.GetDialogueName(), EDialogueType(local_57), PlayerEntity));
        FC_DialogueNextSectionTag local_278;
        Assign local_276;
        local_276.opCall(local_278);
        return;
    }
    UFUNCTION()
    void ServerJob_HandleDialogueSimpleQuickStart(const FECSEntity &inout Entity, const FC_DialogueSimpleQuickStart &inout DialogueSimpleQuickStart) const
    {
        FName local_8;
        local_8.GetDataName();
        XLog(ELog(64), FString().Append("Handle dialogue simple quick start: ").Append(Entity.GetEntityName()).Append(", dialogue config: ").Append(local_8));
        this.StartSimpleDialogue(Entity, DialogueSimpleQuickStart.GetInteractTarget(), DialogueSimpleQuickStart.GetDialogueConfig(), false);
        Remove local_14;
        local_14.opCall();
        return;
    }
    UFUNCTION()
    void ClientJob_TickDialogueInterrupt(const FC_DialogueSection &inout DialogueSection, const FCS_LocalPlayer &inout LocalPlayer) const
    {
        FDialogueDeliveryContext local_50;
        int local_56 = 0;
        int local_62 = 0;
        if ((int(DialogueSection.GetSection().GetDialogueType())) == 1)
        {
            return;
        }
        if (!(::DialogueUtils::TryFindDialogueContext(DialogueSection.GetSection().GetDialogueContextEntity(), local_50)))
        {
            return;
        }
        FECSEntity local_60 = LocalPlayer.GetPlayerPawnEntity();
        if (local_56.GetPosition().DistSquared(local_62.GetPosition()) > local_50.GetInterruptDistanceSquared())
        {
            this.InteruptDialogue(LocalPlayer.PlayerEntity, local_50.GetInteractTarget());
        }
        return;
    }
    TArray<FDialogueInfo> FindValidDialoguesSortedByPriority(const FCE_OnDialogueInteraction &inout Event) const
    {
        TArray<FDialogueInfo> local_4;
        Get local_8;
        const FC_PlayerDialogues& local_10 = local_8.opCall();
        if (local_10)
        {
            Get local_16;
            const FC_NPCInfo& local_18 = local_16.opCall();
            if (local_18)
            {
                TDataObjectPtr<FNPCMainConfig> local_42 = local_18.GetMainConfig();
                if (local_42.IsSet() && local_10.GetNPCDialogueMap().Contains(local_42))
                {
                    const FDialogueInfoList& local_70 = local_10.GetNPCDialogueMap()[local_42];
                    for (auto& local_88 : local_70.GetDialogueInfos())
                    {
                        local_88;
                        local_4.Add();
                    }
                }
            }
        }
        Get local_94;
        const FC_GlobalDialogues& local_96 = local_94.opCall();
        if (local_96)
        {
            for (auto& local_88 : local_96.GetDialogueInfos())
            {
                local_88;
                local_4.Add();
            }
        }
        return local_4;
    }
    TDataObjectPtr<FDialogueConfig> FindBestDialogue(const FCE_OnDialogueInteraction &inout Event) const
    {
        TArray<FDialogueInfo> local_4 = this.FindValidDialoguesSortedByPriority(Event);
        if (local_4.Num() == 0)
        {
            return TDataObjectPtr<FDialogueConfig>();
        }
        FDialogueInfo& local_62 = local_4[0];
        if (local_62.GetbHasAttachPoint() || !(local_62.GetbIsAttachable()))
        {
            return local_62.GetDialogueConfig();
        }
        int local_64 = 1;
        for (; local_64 < local_4.Num(); ++local_64)
        {
            if (local_4[local_64].GetbHasAttachPoint())
            {
                return local_4[local_64].GetDialogueConfig();
            }
        }
        return local_62.GetDialogueConfig();
    }
    bool TryFindAttachableDialogues(const FECSEntity &inout PlayerEntity, const FECSEntity &inout InteractTarget, TArray<FDialogueInfo> &out AttachableDialogues) const
    {
        TArray<FDialogueInfo> local_4;
        AttachableDialogues = local_4;
        Get local_8;
        const FC_PlayerDialogues& local_10 = local_8.opCall();
        if (local_10)
        {
            Get local_16;
            const FC_NPCInfo& local_18 = local_16.opCall();
            if (local_18)
            {
                TDataObjectPtr<FNPCMainConfig> local_42 = local_18.GetMainConfig();
                if (local_42.IsSet() && local_10.GetNPCDialogueMap().Contains(local_42))
                {
                    const FDialogueInfoList& local_70 = local_10.GetNPCDialogueMap()[local_42];
                    for (auto& local_88 : local_70.GetDialogueInfos())
                    {
                        local_88;
                        if (GetbIsAttachable())
                        {
                            AttachableDialogues.Add();
                        }
                    }
                }
            }
        }
        return (AttachableDialogues.Num() > 0);
    }
    void InteruptDialogue(const FECSEntity &inout PlayerEntity, const FECSEntity &inout InteractTarget) const
    {
        Has local_4;
        int local_68 = 0;
        int local_88 = 0;
        if (!(local_4.opCall()))
        {
            XError(ELog(64), FString().Append("[Dialogue] No current dialogue found"));
            return;
        }
        Has local_16;
        bool local_5 = local_16.opCall();
        if (local_5)
        {
            return;
        }
        FDialogueDeliveryContext local_62;
        if (!(::DialogueUtils::TryFindDialogueContext(local_68.GetSection().GetDialogueContextEntity(), local_62)))
        {
            XError(ELog(64), FString().Append("[Dialogue] No dialogue context found"));
            return;
        }
        if ((!((FECSEntity(local_62.GetInteractTarget()) == InteractTarget))))
        {
            XError(ELog(64), FString().Append("[Dialogue] Current dialogue target entity mismatch, ").Append(local_62.GetInteractTarget()).Append(" != ").Append(InteractTarget));
            return;
        }
        FC_DialogueInterruptRequestedTag local_78;
        Assign local_76;
        local_76.opCall(local_78);
        FFPTime local_84 = FFPTime(-1);
        local_88.PlayerEntity = PlayerEntity;
        local_88.InteractTarget = InteractTarget;
        return;
    }
    UFUNCTION()
    void Run_ClientJob_PreloadDialogueAssets() const
    {
        ECS::GetContextJob();
        this.ClientJob_PreloadDialogueAssets();
        return;
    }
    UFUNCTION()
    void Run_ServerJob_InitDailyDialogue() const
    {
        ECS::GetContextJob();
        this.ServerJob_InitDailyDialogue();
        return;
    }
    UFUNCTION()
    void Run_Monitor_UpdatePendingDialoguesForNpc() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorNPCReadyTagOnAssignView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_UpdatePendingDialoguesForNpc(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_HandleNotifyStartAmbientDialogue() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_NotifyStartAmbientDialogue> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_NotifyStartAmbientDialogue& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_HandleNotifyStartAmbientDialogue(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_HandleOnDialogueInteraction() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_OnDialogueInteraction> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_OnDialogueInteraction& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_HandleOnDialogueInteraction(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_HandleDialogueSimpleQuickStart() const
    {
        const FECSEntity& local_36;
        int local_38 = 0;
        int local_174 = 0;
        const FECSJob& local_2 = ECS::GetContextJob();
        int local_4 = 0;
        int local_3 = local_4;
        if (local_2.IsViewCacheUsable())
        {
            FECSWorldPtr local_8 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_12 = local_2.GetViewCacheEntities();
            int local_13 = 0;
            for (auto& local_28 : local_12)
            {
                local_28;
                FECSEntity local_32;
                if (!(local_32.IsValid()))
                {
                    continue;
                }
                ++local_13;
                FECSEntityScopeCycleCounter local_33 = FECSEntityScopeCycleCounter(local_32);
                this.ServerJob_HandleDialogueSimpleQuickStart(local_36, local_38);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_80 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_84;
        local_84.opCall();
        Exclude(local_80).opCall();
        Exclude(local_80).opCall();
        Exclude(local_80).opCall();
        Exclude(local_80).opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_102 = 0;
        FECSRuntimeViewIterator local_136 = local_80.Iterator();
        for (; local_136.CanProceed;)
        {
            local_36 = local_136.Proceed();
            ++local_102;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.ServerJob_HandleDialogueSimpleQuickStart(local_174, local_38);
        }
        local_2.UpdateCachedEntityCount(local_102);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_TickDialogueInterrupt() const
    {
        int local_16 = 0;
        int local_50 = 0;
        const FECSJob& local_2 = ECS::GetContextJob();
        if (!(this.GetECSRuntime().IsOnInterval(FFPTime(0.1))))
        {
            return;
        }
        FECSWorldPtr local_10 = this.GetECSWorld();
        Has local_14;
        if (!(local_14.opCall()))
        {
            return;
        }
        FECSWorldPtr local_10_2 = this.GetECSWorld();
        int local_22 = 0;
        int local_21 = local_22;
        if (local_2.IsViewCacheUsable())
        {
            FECSWorldPtr local_10_3 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_26 = local_2.GetViewCacheEntities();
            int local_27 = 0;
            for (auto& local_42 : local_26)
            {
                local_42;
                FECSEntity local_46;
                if (!(local_46.IsValid()))
                {
                    continue;
                }
                ++local_27;
                FECSEntityScopeCycleCounter local_47 = FECSEntityScopeCycleCounter(local_46);
                this.ClientJob_TickDialogueInterrupt(local_50, local_16);
            }
            local_2.UpdateCachedEntityCount(local_27);
            return;
        }
        FECSRuntimeView local_92 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_96;
        local_96.opCall();
        Exclude(local_92).opCall();
        bool local_7 = local_2.BeginViewCacheBuild();
        int local_28 = local_2.GetViewCacheEpoch();
        int local_102 = 0;
        FECSRuntimeViewIterator local_136 = local_92.Iterator();
        for (; local_136.CanProceed;)
        {
            const FECSEntity& local_172 = local_136.Proceed();
            ++local_102;
            if (local_7)
            {
                local_2.AddViewCacheEntity(local_172.GetId());
            }
            FECSEntityScopeCycleCounter local_47_2 = FECSEntityScopeCycleCounter(local_172);
            this.ClientJob_TickDialogueInterrupt(local_50, local_16);
        }
        local_2.UpdateCachedEntityCount(local_102);
        if (local_7)
        {
            local_2.CommitViewCacheBuild(local_28);
        }
        return;
    }
}

struct __Lambda_Gameplay_Dialogue_S_DialogueSystem_275
{
    __Lambda_Gameplay_Dialogue_S_DialogueSystem_275()
    {
        return;
    }
    bool opCall(const FDialogueInfo &inout A, const FDialogueInfo &inout B)
    {
        return (0 > 0);
    }
}

