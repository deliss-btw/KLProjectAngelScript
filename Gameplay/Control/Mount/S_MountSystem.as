

class US_MountSystem : UECSScriptSystem
{
    UPROPERTY()
    FName BeginMountTriggerName = n"BeginMountTrigger";
    UPROPERTY()
    FName EndMountTriggerName = n"EndMountTrigger";
    UPROPERTY()
    FESMBlackboardConditionAndArray MountTriggerCondition;
    UPROPERTY()
    float32 MountInputTriggerValidateTime = 1.0f;
    UPROPERTY()
    FName InactiveStateName = n"Inactive";
    UPROPERTY()
    FName ActiveStateName = n"Default";
    UPROPERTY()
    float32 PrivateMountInactiveDelay = 1.0f;


    UFUNCTION()
    void Init_Implementation()
    {
        this.MountTriggerCondition.InitConditionRuntime(false);
        return;
    }
    UFUNCTION()
    void ServerJob_InitMount(const FECSEntity &inout PlayerControllerEntity) const
    {
        ::FMountUtils::NotifyServerEquipMount(PlayerControllerEntity);
        Remove local_4;
        local_4.opCall();
        return;
    }
    UFUNCTION()
    void ServerJob_ChangeMount(const FECSEntity &inout PlayerControllerEntity) const
    {
        Get local_4;
        const FC_ControllerEquipMount& local_6 = local_4.opCall();
        if (local_6)
        {
            if (local_6.GetMountEntity().IsActive())
            {
                return;
            }
        }
        ::FMountUtils::NotifyServerEquipMount(PlayerControllerEntity);
        Remove local_12;
        local_12.opCall();
        return;
    }
    UFUNCTION()
    void ServerJob_ApplyGameRuleMountRestriction(const FECSEntity &inout PawnEntity) const
    {
        bool local_50 = false;
        if (!(::FLevelUtils::GetCurrentLevelInfoConfig(nullptr).IsSet()) || !(GetGameRuleConfig().IsSet()))
        {
            return;
        }
        local_50 = !local_50;
        if (local_50)
        {
            return;
        }
        ModifyOrAdd local_56;
        local_56.opCall().SetbIsDisallowed(true);
        Has local_60;
        local_50 = local_60.opCall();
        if (local_50)
        {
            ::FMountUtils::EndMountAsDriver(PawnEntity, ECS::GetECSWorld().GetFixedTime().Time);
        }
        return;
    }
    UFUNCTION()
    void ServerJob_ApplyGameRuleCombatRestriction() const
    {
        int local_52 = 0;
        if (!(::FLevelUtils::GetCurrentLevelInfoConfig(nullptr).IsSet()) || !(GetGameRuleConfig().IsSet()))
        {
            return;
        }
        int local_51 = local_52;
        if (local_51 == 0)
        {
            return;
        }
        FECSWorldPtr local_54 = ECS::GetECSWorld();
        ModifyOrAdd local_58;
        int local_59 = local_58.opCall().GetCombatRestrictionFlags() | local_51;
        local_52.SetCombatRestrictionFlags(local_59);
        return;
    }
    UFUNCTION()
    void Job_HandleMountInput(const FECSEntity &inout Entity, FC_ControlledByPlayer &inout PlayerComp, const FC_Input &inout Input, const FCS_FixedTime &inout FixedTime, FC_ESMTrigger &inout ESMTrigger) const
    {
        FECSEntity local_4 = PlayerComp.GetPlayerEntity();
        TObjectPtr<UESMInputTriggerAsset> local_6 = ::UCharacterGlobalSetting::Get().MountInputTrigger;
        if ((!((local_6 == nullptr))))
        {
            FActiveTriggerResult local_28 = local_6.opArrow().TestTrigger(Input.State, FixedTime.LastTime, FixedTime.Time, ESMTrigger.Storage);
            if (local_28.bClear)
            {
                FESMTriggerUtils::ClearTrigger(Entity, ESMTrigger.Storage, local_6.opArrow().OutputTrigger);
            }
            else
            {
                if (local_28.bActive)
                {
                    if (!(this.MountTriggerCondition.Evaluate(Entity)))
                    {
                        return;
                    }
                    Get local_32;
                    const FC_PawnRiddingMount& local_34 = local_32.opCall();
                    if (local_34)
                    {
                        if (local_34.IsDriver())
                        {
                            if (!(this.MountTriggerCondition.Evaluate(local_34.GetMountEntity())))
                            {
                                return;
                            }
                            FESMTriggerUtils::ActivateESMTrigger(Entity, this.EndMountTriggerName, local_28.TriggerTime, FFPTime(this.MountInputTriggerValidateTime), 0);
                        }
                    }
                    else
                    {
                        if (this.CanRideMount(local_4, Entity))
                        {
                            FESMTriggerUtils::ActivateESMTrigger(Entity, this.BeginMountTriggerName, local_28.TriggerTime, FFPTime(this.MountInputTriggerValidateTime), 0);
                        }
                    }
                }
            }
        }
        return;
    }
    bool CanRideMount(const FECSEntity &inout PlayerControllerEntity, const FECSEntity &inout PlayerPawnEntity) const
    {
        Has local_4;
        bool local_5;
        int local_12 = 0;
        if (local_4.opCall())
        {
            return false;
        }
        if (!(local_12) || !(local_12.GetMountEntity().IsValid()))
        {
            local_5 = true;
        }
        else
        {
            Has local_18;
            local_5 = local_18.opCall();
        }
        if (local_5)
        {
            return false;
        }
        Get local_22;
        const FC_MountDisallowed& local_24 = local_22.opCall();
        if (local_24)
        {
            if (local_24.GetbIsDisallowed())
            {
                return false;
            }
        }
        return true;
    }
    UFUNCTION()
    void Job_SyncClientTimeOffsetToMount(const FC_PawnRiddingMount &inout PawnRiddingMount, const FC_ClientTimeOffset &inout ClientTimeOffset, const FCS_FixedTime &inout FixedTime) const
    {
        int local_12 = 0;
        if (!(PawnRiddingMount.IsDriver()))
        {
            return;
        }
        if (!(FECSEntity(PawnRiddingMount.GetMountEntity()).IsValid()))
        {
            return;
        }
        local_12.Enqueue(int(FixedTime.Frame), ClientTimeOffset.GetOffsetFrame(int(FixedTime.Frame)), ClientTimeOffset.GetOffsetTime(int(FixedTime.Frame)));
        return;
    }
    UFUNCTION()
    void Job_UpdateChildEntityMovmentParam(const FECSEntity &inout Entity, FC_CharacterMovementControl &inout CharacterMovementControl, const FC_PawnRiddingMount &inout PawnRiddingMount) const
    {
        if (PawnRiddingMount.GetMountEntity().IsValid() && PawnRiddingMount.IsDriver())
        {
            Get local_6;
            const FC_CharacterMovementControl& local_8 = local_6.opCall();
            if (local_8)
            {
                CharacterMovementControl.SetDesiredRotation(local_8.GetDesiredRotation());
                CharacterMovementControl.SetRelativeDesiredRotationYaw(local_8.GetRelativeDesiredRotationYaw());
                CharacterMovementControl.SetRelativeDesiredViewRotationYaw(local_8.GetRelativeDesiredViewRotationYaw());
            }
        }
        return;
    }
    UFUNCTION()
    void Monitor_OnRiddingMount(const FECSEntity &inout Entity, const FC_PawnRiddingMount &inout RiddingMount) const
    {
        Has local_4;
        if (local_4.opCall() && RiddingMount.GetMountEntity().IsValid() && RiddingMount.IsDriver())
        {
            Modify local_38;
            FNavAgentProperties local_20 = FAINavigationUtils::GetGroundNavAgent(RiddingMount.GetMountEntity());
            local_38.opCall().SetMountEntity(RiddingMount.GetMountEntity());
            local_38.opCall().SetbIsDriver((RiddingMount.GetSeatIndex() == 0));
            local_38.opCall().SetMountRadius(local_20.AgentRadius);
            local_38.opCall().SetMountHeight(local_20.AgentHeight);
        }
        return;
    }
    UFUNCTION()
    void Monitor_OnChangeMountData(const FECSEntity &inout Entity, const FC_PawnRiddingMount &inout RiddingMount) const
    {
        Has local_4;
        if (local_4.opCall() && RiddingMount.GetMountEntity().IsValid() && RiddingMount.IsDriver())
        {
            Modify local_38;
            FNavAgentProperties local_20 = FAINavigationUtils::GetGroundNavAgent(RiddingMount.GetMountEntity());
            local_38.opCall().SetMountEntity(RiddingMount.GetMountEntity());
            local_38.opCall().SetbIsDriver((RiddingMount.GetSeatIndex() == 0));
            local_38.opCall().SetMountRadius(local_20.AgentRadius);
            local_38.opCall().SetMountHeight(local_20.AgentHeight);
        }
        return;
    }
    UFUNCTION()
    void Monitor_OnQuitRiddingMount(const FECSEntity &inout Entity, const FC_PawnRiddingMount &inout RiddingMount) const
    {
        if (!(Entity.IsValid()))
        {
            return;
        }
        Has local_6;
        if (local_6.opCall() && RiddingMount.IsDriver())
        {
            Modify local_16;
            local_16.opCall().SetMountEntity(FECSEntity());
            local_16.opCall().SetbIsDriver(false);
            local_16.opCall().SetMountRadius(0.0f);
            local_16.opCall().SetMountHeight(0.0f);
        }
        return;
    }
    UFUNCTION()
    void Monitor_OnMountPendingInactiveChanged(const FECSEntity &inout Entity, const FC_MountPendingInactive &inout Pending) const
    {
        Has local_4;
        if (!(local_4.opCall()))
        {
            return;
        }
        Has local_10;
        bool local_5 = local_10.opCall();
        Modify local_14;
        FC_Collision& local_16 = local_14.opCall();
        if (local_16)
        {
            if (local_5)
            {
                local_16.DisableByReason(ECollisionDisableReason(16));
            }
            else
            {
                local_16.EnableByReason(ECollisionDisableReason(16));
            }
        }
        ::FInteractUtils::SetEntityInteractTargetEnabled(Entity, !(local_5), -1);
        return;
    }
    UFUNCTION()
    void Job_HandlePrivateMountPendingInactive(const FECSEntity &inout Entity, const FC_MountPendingInactive &inout Pending, const FCS_FixedTime &inout FixedTime) const
    {
        if (FFPTime(FixedTime.Time).opCmp(Pending.GetInactiveTime()) < 0)
        {
            return;
        }
        Entity.SetActive(false, FFPTime(-1));
        Assign local_8;
        local_8.opCall(FC_CharacterInBackgroundTag());
        Remove local_14;
        local_14.opCall();
        return;
    }
    UFUNCTION()
    void Monitor_EndMountOnPawnInactive(const FECSEntity &inout Entity, const FC_PawnRiddingMount &inout PawnRiddingMount) const
    {
        if (PawnRiddingMount)
        {
            if (PawnRiddingMount.IsDriver())
            {
                ::FMountUtils::EndMountAsDriver(Entity, ECS::GetContextTime());
                return;
            }
            ::FMountUtils::EndMountAsPassenger(Entity, ECS::GetContextTime());
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_InitMount() const
    {
        const FECSEntity& local_36;
        int local_156 = 0;
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
                this.ServerJob_InitMount(local_36);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_74 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_78;
        local_78.opCall();
        Exclude(local_74).opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_84 = 0;
        FECSRuntimeViewIterator local_118 = local_74.Iterator();
        for (; local_118.CanProceed;)
        {
            local_36 = local_118.Proceed();
            ++local_84;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.ServerJob_InitMount(local_156);
        }
        local_2.UpdateCachedEntityCount(local_84);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_ChangeMount() const
    {
        const FECSEntity& local_36;
        int local_156 = 0;
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
                this.ServerJob_ChangeMount(local_36);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_74 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_78;
        local_78.opCall();
        Exclude(local_74).opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_84 = 0;
        FECSRuntimeViewIterator local_118 = local_74.Iterator();
        for (; local_118.CanProceed;)
        {
            local_36 = local_118.Proceed();
            ++local_84;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.ServerJob_ChangeMount(local_156);
        }
        local_2.UpdateCachedEntityCount(local_84);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_ApplyGameRuleMountRestriction() const
    {
        const FECSEntity& local_36;
        int local_152 = 0;
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
                this.ServerJob_ApplyGameRuleMountRestriction(local_36);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_74 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_78;
        local_78.opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_80 = 0;
        FECSRuntimeViewIterator local_114 = local_74.Iterator();
        for (; local_114.CanProceed;)
        {
            local_36 = local_114.Proceed();
            ++local_80;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.ServerJob_ApplyGameRuleMountRestriction(local_152);
        }
        local_2.UpdateCachedEntityCount(local_80);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_ApplyGameRuleCombatRestriction() const
    {
        ECS::GetContextJob();
        this.ServerJob_ApplyGameRuleCombatRestriction();
        return;
    }
    UFUNCTION()
    void Run_Job_HandleMountInput() const
    {
        int local_6 = 0;
        const FECSEntity& local_40;
        int local_42 = 0;
        int local_48 = 0;
        int local_54 = 0;
        MarkModifiedIfDirty local_62;
        MarkModifiedIfDirty local_66;
        int local_202 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        int local_8 = 0;
        int local_7 = local_8;
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
                this.Job_HandleMountInput(local_40, local_42, local_48, local_6, local_54);
                local_62.opCall(local_42);
                local_66.opCall(local_54);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_104 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_108;
        local_108.opCall();
        Include local_112;
        local_112.opCall();
        Include local_116;
        local_116.opCall();
        Include local_120;
        local_120.opCall();
        Exclude(local_104).opCall();
        Exclude(local_104).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_130 = 0;
        FECSRuntimeViewIterator local_164 = local_104.Iterator();
        for (; local_164.CanProceed;)
        {
            local_40 = local_164.Proceed();
            ++local_130;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.Job_HandleMountInput(local_202, local_42, local_48, local_6, local_54);
            local_62.opCall(local_42);
            local_66.opCall(local_54);
        }
        local_4.UpdateCachedEntityCount(local_130);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_SyncClientTimeOffsetToMount() const
    {
        int local_6 = 0;
        int local_40 = 0;
        int local_46 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        int local_8 = 0;
        int local_7 = local_8;
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
                this.Job_SyncClientTimeOffsetToMount(local_40, local_46, local_6);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_88 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_92;
        local_92.opCall();
        Include local_96;
        local_96.opCall();
        Include local_100;
        local_100.opCall();
        Exclude(local_88).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_106 = 0;
        FECSRuntimeViewIterator local_140 = local_88.Iterator();
        for (; local_140.CanProceed;)
        {
            const FECSEntity& local_176 = local_140.Proceed();
            ++local_106;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_176.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_176);
            this.Job_SyncClientTimeOffsetToMount(local_40, local_46, local_6);
        }
        local_4.UpdateCachedEntityCount(local_106);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_UpdateChildEntityMovmentParam() const
    {
        const FECSEntity& local_36;
        int local_38 = 0;
        int local_44 = 0;
        MarkModifiedIfDirty local_52;
        int local_180 = 0;
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
                this.Job_UpdateChildEntityMovmentParam(local_36, local_38, local_44);
                local_52.opCall(local_38);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_90 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_94;
        local_94.opCall();
        Include local_98;
        local_98.opCall();
        Include local_102;
        local_102.opCall();
        Exclude(local_90).opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_108 = 0;
        FECSRuntimeViewIterator local_142 = local_90.Iterator();
        for (; local_142.CanProceed;)
        {
            local_36 = local_142.Proceed();
            ++local_108;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.Job_UpdateChildEntityMovmentParam(local_180, local_38, local_44);
            local_52.opCall(local_38);
        }
        local_2.UpdateCachedEntityCount(local_108);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_OnRiddingMount() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorPawnRiddingMountOnAssignView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_OnRiddingMount(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_OnChangeMountData() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorPawnRiddingMountOnModifyView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_OnChangeMountData(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_OnQuitRiddingMount() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorPawnRiddingMountOnRemoveView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_OnQuitRiddingMount(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_OnMountPendingInactiveChanged() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorMountPendingInactiveOnAssignView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_OnMountPendingInactiveChanged(local_46, local_52);
        }
        FECSMonitorRuntimeView local_16 = ::__GetMonitorMountPendingInactiveOnRemoveView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_40 = local_16.Iterator();
        for (; local_40.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42_2 = local_40.Proceed();
            FECSEntityScopeCycleCounter local_43_2 = FECSEntityScopeCycleCounter(local_42_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_42_2);
            this.Monitor_OnMountPendingInactiveChanged(local_46, local_52);
        }
        return;
    }
    void Monitor___JobTimer_Pre___Job_HandlePrivateMountPendingInactive(const FC_MountPendingInactive &inout TimerComp, const FECSEntity &inout Entity) const
    {
        if (!(TimerComp))
        {
            return;
        }
        FFPTime local_6 = FFPTime(TimerComp.GetInactiveTime());
        FName local_8 = FName("S_MountSystem::Job_HandlePrivateMountPendingInactive");
        if (local_6.opCmp(0.0) >= 0 && (local_6.opCmp(FPTIME_MAX) < 0))
        {
            ECS::ScheduleJobTimer(local_8, local_6, Entity.GetId(), true);
        }
        return;
    }
    void Monitor___JobTimer_Post___Job_HandlePrivateMountPendingInactive(const FC_MountPendingInactive &inout TimerComp, const FECSEntity &inout Entity) const
    {
        if (!(TimerComp))
        {
            return;
        }
        FFPTime local_6 = FFPTime(TimerComp.GetInactiveTime());
        FName local_8 = FName("S_MountSystem::Job_HandlePrivateMountPendingInactive");
        if (local_6.opCmp(0.0) >= 0 && (local_6.opCmp(FPTIME_MAX) < 0))
        {
            ECS::ScheduleJobTimer(local_8, local_6, Entity.GetId(), false);
        }
        return;
    }
    void Monitor___JobTimer_OnSync___Job_HandlePrivateMountPendingInactive(const FC_MountPendingInactive &inout TimerComp, const FECSEntity &inout Entity) const
    {
        if (!(TimerComp))
        {
            return;
        }
        FFPTime local_6 = FFPTime(TimerComp.GetInactiveTime());
        FName local_8 = FName("S_MountSystem::Job_HandlePrivateMountPendingInactive");
        if (local_6.opCmp(0.0) >= 0 && (local_6.opCmp(FPTIME_MAX) < 0))
        {
            ECS::ScheduleJobTimer(local_8, local_6, Entity.GetId(), false);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor___JobTimer_Pre___Job_HandlePrivateMountPendingInactive() const
    {
        int local_52 = 0;
        int local_54 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_14 = ::__GetMonitorMountPendingInactiveOnModifyView(this.GetECSWorld(), EECSRegType(0), true, false);
        FECSMonitorRuntimeViewIterator local_30 = local_14.Iterator();
        for (; local_30.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44 = local_30.Proceed();
            FECSEntityScopeCycleCounter local_45 = FECSEntityScopeCycleCounter(local_44.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_44);
            this.Monitor___JobTimer_Pre___Job_HandlePrivateMountPendingInactive(local_52, local_54);
        }
        FECSMonitorRuntimeView local_18 = ::__GetMonitorMountPendingInactiveOnAssignView(this.GetECSWorld(), EECSRegType(0), true, false);
        FECSMonitorRuntimeViewIterator local_42 = local_18.Iterator();
        for (; local_42.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44_2 = local_42.Proceed();
            FECSEntityScopeCycleCounter local_45_2 = FECSEntityScopeCycleCounter(local_44_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_44_2);
            this.Monitor___JobTimer_Pre___Job_HandlePrivateMountPendingInactive(local_52, local_54);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor___JobTimer_Post___Job_HandlePrivateMountPendingInactive() const
    {
        int local_52 = 0;
        int local_54 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_14 = ::__GetMonitorMountPendingInactiveOnModifyView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_30 = local_14.Iterator();
        for (; local_30.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44 = local_30.Proceed();
            FECSEntityScopeCycleCounter local_45 = FECSEntityScopeCycleCounter(local_44.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_44);
            this.Monitor___JobTimer_Post___Job_HandlePrivateMountPendingInactive(local_52, local_54);
        }
        FECSMonitorRuntimeView local_18 = ::__GetMonitorMountPendingInactiveOnAssignView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_42 = local_18.Iterator();
        for (; local_42.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44_2 = local_42.Proceed();
            FECSEntityScopeCycleCounter local_45_2 = FECSEntityScopeCycleCounter(local_44_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_44_2);
            this.Monitor___JobTimer_Post___Job_HandlePrivateMountPendingInactive(local_52, local_54);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor___JobTimer_OnSync___Job_HandlePrivateMountPendingInactive() const
    {
        int local_52 = 0;
        int local_54 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_14 = ::__GetMonitorMountPendingInactiveOnModifyView(this.GetECSWorld(), EECSRegType(0), false, false);
        FECSMonitorRuntimeViewIterator local_30 = local_14.Iterator();
        for (; local_30.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44 = local_30.Proceed();
            FECSEntityScopeCycleCounter local_45 = FECSEntityScopeCycleCounter(local_44.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_44);
            this.Monitor___JobTimer_OnSync___Job_HandlePrivateMountPendingInactive(local_52, local_54);
        }
        FECSMonitorRuntimeView local_18 = ::__GetMonitorMountPendingInactiveOnAssignView(this.GetECSWorld(), EECSRegType(0), false, false);
        FECSMonitorRuntimeViewIterator local_42 = local_18.Iterator();
        for (; local_42.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44_2 = local_42.Proceed();
            FECSEntityScopeCycleCounter local_45_2 = FECSEntityScopeCycleCounter(local_44_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_44_2);
            this.Monitor___JobTimer_OnSync___Job_HandlePrivateMountPendingInactive(local_52, local_54);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_HandlePrivateMountPendingInactive() const
    {
        int local_6 = 0;
        bool local_34;
        int local_40 = 0;
        int local_66 = 0;
        int local_68 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        FECSWorldPtr local_8 = ECS::GetECSWorld();
        local_4.MarkIteratingExternalEntityList(true);
        const TArray<FECSEntityId>& local_14 = local_4.GetExternalEntityList();
        FECSEntity local_32;
        Has local_50;
        for (auto& local_28 : local_14)
        {
            local_28;
            FECSEntityScopeCycleCounter local_33 = FECSEntityScopeCycleCounter(local_32);
            local_34 = false;
            if (!(local_40))
            {
                continue;
            }
            FFPTime local_42 = FFPTime(local_40.GetInactiveTime());
            if (local_42.opCmp(0.0) < 0 || (FFPTime(local_40.GetInactiveTime()) == FPTIME_MAX))
            {
                continue;
            }
            if (!(local_50.opCall()) == !(false))
            {
                FString local_54 = "Timer job error: 'FC_LocalTag' included by job but not exist on ";
                FString local_58 = local_32.ToString();
                local_34 = true;
            }
            if (local_34)
            {
                continue;
            }
            this.Job_HandlePrivateMountPendingInactive(local_66, local_68, local_6);
        }
        local_4.MarkIteratingExternalEntityList(false);
        ECS::ClearCurJobExternalEntityList();
        return;
    }
    UFUNCTION()
    void Run_Monitor_EndMountOnPawnInactive() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorPawnRiddingMountOnInactiveView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_EndMountOnPawnInactive(local_46, local_52);
        }
        return;
    }
}

