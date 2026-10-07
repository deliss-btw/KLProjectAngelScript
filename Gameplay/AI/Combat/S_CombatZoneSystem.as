

struct FCombatIndexedScore
{
    UPROPERTY()
    int Index;
    UPROPERTY()
    float32 Score;


    int opCmp(const FCombatIndexedScore &inout Other) const
    {
        if (Other.Score == this.Score)
        {
            return 0;
        }
        if (Other.Score > this.Score)
        {
        }
        else
        {
        }
        return -1;
    }
}

class US_CombatZoneSystem : UECSScriptSystem
{
    UPROPERTY()
    float CombatZoneRadius = 5000.0;
    UPROPERTY()
    float CombatZoneRadiusSQ = 25000000.0;
    UPROPERTY()
    float CombatZoneMergeRadiusSQ = 16000000.0;


    UFUNCTION()
    void Job_InitCombatZone() const
    {
        FCS_CombatZoneManager local_14;
        FECSWorldPtr local_2 = this.GetECSWorld();
        Assign local_6;
        local_6.opCall(local_14);
        return;
    }
    UFUNCTION()
    void Job_UpdateCombatZoneEntities(FCS_CombatZoneManager &inout Manager) const
    {
        bool local_7;
        FECSEntity local_38;
        int local_46 = 0;
        int local_52 = 0;
        Get local_84;
        FC_CombatZone& local_86;
        FC_CombatGroupMember& local_104;
        FC_CombatGroup& local_112;
        FECSWorldPtr local_2 = this.GetECSWorld();
        Remove local_6;
        local_6.opCall();
        for (auto& local_22 : Manager.CombatZoneEntityUpdateRequests)
        {
            local_7 = (int(local_22.UpdateType) == 1);
            if (int(local_22.UpdateType) == 0)
            {
                FECSEntity local_30 = FECSEntity(local_22.EntityId);
                FECSEntityId local_39;
                if (!(!(local_52)) && local_46)
                {
                    FVector2D local_58 = FVector2D(local_52.GetPosition().X, local_52.GetPosition().Y);
                    for (auto& local_80 : Manager.CombatZones)
                    {
                        if (!(local_86.bMerged))
                        {
                            if ((local_58 - local_86.ZoneCenter).SizeSquared() < this.CombatZoneRadiusSQ)
                            {
                                local_38 = local_80;
                                break;
                            }
                        }
                    }
                    if ((local_38 == ENTITY_NULL))
                    {
                        local_38 = this.CreateZone(local_58);
                        Manager.CombatZones.Add(local_38);
                    }
                    int local_97 = int(local_46.GetFactionId());
                    FECSEntity local_96 = FECSEntity(local_84.opCall().FindCombatGroup());
                    if ((local_96 == ENTITY_NULL))
                    {
                        local_96 = this.CreateZoneCombatGroup(local_38, local_46.GetFactionId());
                    }
                    if (!((local_104.GroupId == local_96.GetId())))
                    {
                        if (local_112)
                        {
                            local_112.Members.Add(local_30);
                        }
                        local_104.UpdateBelongGroup(local_38.GetId(), local_96.GetId());
                    }
                    local_39 = local_96.GetId();
                }
                if (!((local_22.GroupId == local_39)))
                {
                    local_7 = true;
                }
            }
            if (local_7)
            {
                FECSEntity local_34 = FECSEntity(local_22.GroupId);
                Modify local_110;
                local_112 = local_110.opCall();
                if (local_112)
                {
                    FECSEntity local_96_2 = FECSEntity(local_22.EntityId);
                    if (local_112.Members.Num() == 0)
                    {
                        local_38 = FECSEntity(local_112.Zone);
                        Modify local_116;
                        local_86 = local_116.opCall();
                        if (local_86)
                        {
                            if (local_86.RemoveCombatGroup(local_22.GroupId))
                            {
                                if (local_86.CombatGroups.Num() == 0)
                                {
                                    local_38.DestroyDeferred();
                                }
                            }
                        }
                        local_34.DestroyDeferred();
                    }
                }
                FECSEntity local_30_2 = FECSEntity(local_22.EntityId);
                Modify local_120;
                local_104 = local_120.opCall();
                if (local_104)
                {
                    if ((local_34 == local_104.GroupId))
                    {
                        local_104.UpdateBelongGroup(ENTITY_ID_NULL, ENTITY_ID_NULL);
                        Remove local_124;
                        local_124.opCall();
                        Remove local_128;
                        local_128.opCall();
                    }
                }
            }
        }
        for (auto& local_80 : Manager.CombatZones)
        {
            bool local_53 = !(local_84.opCall().bMerged);
        }
        Manager.CombatZoneEntityUpdateRequests.Reset(0);
        return;
    }
    UFUNCTION()
    void Job_DispatchSpecialToken(const FCE_AISpecialCombatTokenGenerate &inout SpecialTokenGen, const FCS_FixedTime &inout FixedTime) const
    {
        int local_6 = 0;
        int local_16;
        bool local_27;
        int local_158 = 0;
        int local_178 = 0;
        FECSEntity local_10 = FECSEntity(local_6.GroupId);
        GetDefaulted local_146;
        if (local_16)
        {
            const FAISpecialCombatTokenConfig& local_20;
            bool local_17 = !(local_20.FilterByTags.IsEmpty());
            local_27 = int(local_20.FilterByTokenType) == 1 || !(local_20.GetFilterByTokens().IsEmpty());
            TInlineArray<FECSEntity, auto> local_64;
            if (int(SpecialTokenGen.DispatchMode) == 1)
            {
                for (auto& local_80 : SpecialTokenGen.TargetEntities)
                {
                    FECSEntity local_10_2 = FECSEntity(local_80);
                    if (local_10_2.IsValid() && !((local_10_2 == SpecialTokenGen.Sender)))
                    {
                        local_64.Add(local_10_2);
                    }
                }
            }
            else
            {
                auto local_90 = local_16.Members.Iterator();
                for (; local_90.CanProceed;)
                {
                    FECSEntity local_98 = local_90.Proceed();
                    if ((local_98 == SpecialTokenGen.Sender))
                    {
                        continue;
                    }
                    Get local_102;
                    const FC_AISpecialCombatTokenReceiver& local_104 = local_102.opCall();
                    if (local_104)
                    {
                        if (local_104.AcceptTokens.Contains(SpecialTokenGen.TokenConfg))
                        {
                            local_64.Add(local_98);
                        }
                    }
                }
            }
            TInlineArray<FECSEntity, auto> local_140;
            int local_141 = 0;
            for (; local_141 < local_64.Num(); ++local_141)
            {
                FECSEntity local_98_2 = local_64[local_141];
                if (local_17 && !(FAICommonUtils::QueryTagContainerCondition(local_98_2, local_20.FilterByTags, EESMBlackboardConditionTagQueryType(local_20.FilterByTagType))))
                {
                    continue;
                }
                if (local_27 && !(local_20.PassTokenFilter(local_146.opCall().SpecialToken.TokenUid)))
                {
                    continue;
                }
                local_140.Add(local_98_2);
            }
            int local_25 = local_140.Num();
            if (local_25 > 0)
            {
                FFPTime local_150 = FFPTime(FixedTime.Time);
                local_25 = local_20.GenerateTokenNum.CalculateNum(local_140.Num());
                if (local_25 >= local_140.Num())
                {
                    int local_151 = 0;
                    for (; local_151 < local_140.Num(); )
                    {
                        ::FAICombatTokenUtils::AssignSpecialToken(local_140[local_151], local_158, FAISpecialCombatTokenHandle(SpecialTokenGen.TokenConfg, local_150), SpecialTokenGen.Sender);
                        ++local_151;
                    }
                }
                else
                {
                    TArray<FCombatIndexedScore> local_168;
                    local_168.SetNumZeroed(local_140.Num());
                    int local_151_2 = 0;
                    for (; local_151_2 < local_140.Num(); )
                    {
                        FCombatIndexedScore& local_170 = local_168[local_151_2];
                        local_170.Index = local_151_2;
                        float32 local_171 = 0.0f;
                        if (::FAITargetingUtils::GetCurrentAttackTarget(local_140[local_151_2]).IsValid())
                        {
                            Get local_176;
                            const FC_Transform& local_180 = local_176.opCall();
                            if (local_180)
                            {
                                local_171 = 100.0f / FMath::Max(float32(local_178.GetPosition().DistSquared2D(local_180.GetPosition())), 1.0f);
                            }
                        }
                        local_170.Score = local_171;
                        ++local_151_2;
                    }
                    local_151_2 = 0;
                    for (; local_151_2 < local_25; )
                    {
                        FCombatIndexedScore& local_170_2 = local_168[local_151_2];
                        int local_24 = int(local_170_2.Index);
                        local_158.ParamValues = SpecialTokenGen.ParamValues;
                        ::FAICombatTokenUtils::AssignSpecialToken(local_140[int(local_170_2.Index)], local_158, FAISpecialCombatTokenHandle(SpecialTokenGen.TokenConfg, local_150), SpecialTokenGen.Sender);
                        ++local_151_2;
                    }
                }
            }
        }
        return;
    }
    UFUNCTION()
    void Job_UpdateCombatZoneLocation(const FC_CombatGroupMember &inout CombatMember, const FECSEntity &inout Entity, const FC_Transform &inout Transform) const
    {
        bool local_1 = false;
        FECSEntity local_6 = FECSEntity(CombatMember.ZoneId);
        Modify local_10;
        FC_CombatZone& local_12 = local_10.opCall();
        if (local_12)
        {
            for (auto local_26 : local_12.CombatVolumes)
            {
                if (local_26.EncompassesPoint(Transform.GetPosition(), 0.0f))
                {
                    local_1 = true;
                    break;
                }
            }
            ++local_12.ZoneEntitiesNum;
            local_12.ZoneEntitiesCenter += FVector2D(Transform.GetPosition().X, Transform.GetPosition().Y);
        }
        if (local_1)
        {
            FC_CombatMemberInCombatVolumeTag local_46;
            Assign local_44;
            local_44.opCall(local_46);
            return;
        }
        Remove local_50;
        local_50.opCall();
        return;
    }
    UFUNCTION()
    void Job_MergeCombatZone(FCS_CombatZoneManager &inout Manager) const
    {
        FC_CombatZone local_22;
        int local_23 = 0;
        FC_CombatZone local_40;
        int local_68;
        for (auto local_16 : Manager.CombatZones)
        {
            local_23 = int(local_22.ZoneEntitiesNum);
            if (local_23 > 0)
            {
                FVector2D local_28 = local_22.ZoneEntitiesCenter;
                local_22.ZoneCenter = (local_28 / int(local_22.ZoneEntitiesNum));
                local_22.ZoneEntitiesCenter = local_28;
                local_23 = 0;
                local_22.ZoneEntitiesNum = local_23;
            }
        }
        bool local_35 = false;
        int local_36 = 0;
        while (local_36 < local_23)
        {
            int local_38 = local_36 + 1;
            while (local_38 < 0)
            {
                if (local_22.ZoneCenter.DistSquared(local_40.ZoneCenter) < this.CombatZoneMergeRadiusSQ)
                {
                    local_40.bMerged = true;
                    FVector2D local_28_2 = local_22.ZoneCenter;
                    local_22.ZoneCenter = ((local_28_2 + local_40.ZoneCenter) * 0.5);
                    for (auto& local_56 : local_40.CombatGroups)
                    {
                        FECSEntity local_60 = FECSEntity(this.GetECSWorld(), local_56.GroupId);
                        for (auto local_16 : local_68.Members)
                        {
                            Manager.RequestAddZoneCombatEntity(local_16.GetId(), local_56.GroupId);
                            local_35 = true;
                        }
                    }
                }
                ++local_38;
            }
            ++local_36;
        }
        if (local_35)
        {
            FECSWorldPtr local_62 = this.GetECSWorld();
            FCS_CombatZoneEntityNeedUpdateTag local_88;
            Assign local_86;
            local_86.opCall(local_88);
        }
        return;
    }
    UFUNCTION()
    void Monitor_EnterCombat(const FC_AICombatTag &inout EnterCombat, const FECSEntity &inout Entity) const
    {
        FECSEntityId local_7 = Entity.GetId();
        FECSWorldPtr local_2 = this.GetECSWorld();
        Modify local_6;
        local_6.opCall().RequestAddZoneCombatEntity(local_7, ENTITY_ID_NULL);
        FECSWorldPtr local_2_2 = this.GetECSWorld();
        FCS_CombatZoneEntityNeedUpdateTag local_14;
        Assign local_12;
        local_12.opCall(local_14);
        return;
    }
    UFUNCTION()
    void Monitor_QuictCombat(const FC_AICombatTag &inout QuitCombat, const FECSEntity &inout Entity) const
    {
        Get local_4;
        const FC_CombatGroupMember& local_6 = local_4.opCall();
        if (local_6)
        {
            FECSEntityId local_15 = Entity.GetId();
            FECSWorldPtr local_10 = this.GetECSWorld();
            Modify local_14;
            local_14.opCall().RequestRemoveZoneCombatEntity(local_15, local_6.GroupId);
            FECSWorldPtr local_10_2 = this.GetECSWorld();
            FCS_CombatZoneEntityNeedUpdateTag local_22;
            Assign local_20;
            local_20.opCall(local_22);
        }
        return;
    }
    UFUNCTION()
    void Monitor_OnCombatMemberInactive(const FC_CombatGroupMember &inout Member, const FECSEntity &inout Entity) const
    {
        FECSEntityId local_7 = Entity.GetId();
        FECSWorldPtr local_2 = this.GetECSWorld();
        Modify local_6;
        local_6.opCall().RequestRemoveZoneCombatEntity(local_7, Member.GroupId);
        FECSWorldPtr local_2_2 = this.GetECSWorld();
        FCS_CombatZoneEntityNeedUpdateTag local_14;
        Assign local_12;
        local_12.opCall(local_14);
        return;
    }
    FECSEntity CreateZoneCombatGroup(const FECSEntity &inout ZoneEntity, const EFaction GroupFaction) const
    {
        int local_40 = 0;
        FName local_12 = FName((FString("CombatGroup:") + GroupFaction));
        FECSEntity local_18 = this.GetECSWorld().Create(EEntityType(8), local_12);
        FC_CombatGroup local_34;
        Assign local_26;
        local_26.opCall(local_34).Zone = ZoneEntity;
        FCombatGroupHandle local_42;
        local_42.Faction = GroupFaction;
        local_42.GroupId = local_18.GetId();
        local_40.CombatGroups.Add(local_42);
        return local_18;
    }
    FECSEntity CreateZone(const FVector2D &inout ZoneCenter) const
    {
        int local_38 = 0;
        AECSRegionVolume local_200;
        FECSEntity local_8 = this.GetECSWorld().Create(EEntityType(8), n"CombatZone");
        local_38.ZoneCenter = ZoneCenter;
        FVector local_50 = FVector(ZoneCenter.X, ZoneCenter.Y, 0.0);
        FECSRuntimeQuery local_100 = FECSRuntimeQueryHelper::MakeRuntimeQuery(local_8, EECSQueryRegsitryType(1), false);
        Include local_144;
        local_144.opCall();
        FECSRuntimeQueryIterator local_166 = local_100.Iterator();
        for (; local_166.CanProceed;)
        {
            local_166.Proceed();
            AActor local_196;
            local_200 = Cast<AECSRegionVolume>(local_196);
            if (local_200 != nullptr && local_200.bAffectCombat && local_200.GetBounds().GetBox().IsInsideXY(local_50))
            {
                local_38.CombatVolumes.Add(local_200);
            }
        }
        return local_8;
    }
    UFUNCTION()
    void Run_Job_InitCombatZone() const
    {
        ECS::GetContextJob();
        this.Job_InitCombatZone();
        return;
    }
    UFUNCTION()
    void Run_Job_UpdateCombatZoneEntities() const
    {
        int local_16 = 0;
        ECS::GetContextJob();
        FECSWorldPtr local_4 = this.GetECSWorld();
        Has local_8;
        if (!(local_8.opCall()))
        {
            return;
        }
        FECSWorldPtr local_4_2 = this.GetECSWorld();
        Has local_14;
        if (!(local_14.opCall()))
        {
            return;
        }
        FECSWorldPtr local_4_3 = this.GetECSWorld();
        this.Job_UpdateCombatZoneEntities(local_16);
        FECSWorldPtr local_4_4 = this.GetECSWorld();
        MarkModifiedIfDirty local_24;
        local_24.opCall(local_16);
        return;
    }
    UFUNCTION()
    void Run_Job_DispatchSpecialToken() const
    {
        int local_6 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_AISpecialCombatTokenGenerate> local_40 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_40.CanProceed;)
        {
            const FCE_AISpecialCombatTokenGenerate& local_64 = local_40.Proceed();
            FECSEntityScopeCycleCounter local_65 = FECSEntityScopeCycleCounter(local_64.Sender);
            ECSInternal::PushContextTime(local_64.GetHandleTime());
            this.Job_DispatchSpecialToken(local_64, local_6);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_UpdateCombatZoneLocation() const
    {
        int local_40 = 0;
        const FECSEntity& local_46;
        int local_48 = 0;
        int local_176 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        if (!(local_2.IsOnInterval(FFPTime(1))))
        {
            return;
        }
        int local_10 = 0;
        int local_9 = local_10;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_12 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_16 = local_4.GetViewCacheEntities();
            int local_17 = 0;
            for (auto& local_32 : local_16)
            {
                local_32;
                FECSEntity local_36;
                if (!(local_36.IsValid()))
                {
                    continue;
                }
                ++local_17;
                FECSEntityScopeCycleCounter local_37 = FECSEntityScopeCycleCounter(local_36);
                this.Job_UpdateCombatZoneLocation(local_40, local_46, local_48);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_90 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_94;
        local_94.opCall();
        Include local_98;
        local_98.opCall();
        Exclude(local_90).opCall();
        bool local_8 = local_4.BeginViewCacheBuild();
        int local_7 = local_4.GetViewCacheEpoch();
        int local_104 = 0;
        FECSRuntimeViewIterator local_138 = local_90.Iterator();
        for (; local_138.CanProceed;)
        {
            local_46 = local_138.Proceed();
            ++local_104;
            if (local_8)
            {
                local_4.AddViewCacheEntity(local_46.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_46);
            this.Job_UpdateCombatZoneLocation(local_40, local_176, local_48);
        }
        local_4.UpdateCachedEntityCount(local_104);
        if (local_8)
        {
            local_4.CommitViewCacheBuild(local_7);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_MergeCombatZone() const
    {
        int local_16 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        ECS::GetContextJob();
        if (!(local_2.IsOnInterval(FFPTime(1))))
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
        this.Job_MergeCombatZone(local_16);
        FECSWorldPtr local_10_3 = this.GetECSWorld();
        MarkModifiedIfDirty local_24;
        local_24.opCall(local_16);
        return;
    }
    UFUNCTION()
    void Run_Monitor_EnterCombat() const
    {
        int local_50 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorAICombatTagOnActiveView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_48 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_EnterCombat(local_50, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_QuictCombat() const
    {
        int local_50 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorAICombatTagOnInactiveView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_48 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_QuictCombat(local_50, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_OnCombatMemberInactive() const
    {
        int local_50 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorCombatGroupMemberOnInactiveView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_48 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_OnCombatMemberInactive(local_50, local_52);
        }
        return;
    }
}

