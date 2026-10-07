

class US_FakeCharacterSystem : UECSScriptSystem
{
    US_FakeCharacterSystem()
    {
        return;
    }
    UFUNCTION()
    void ServerJob_SpawnFakeCharacter(const FCE_SpawnFakeCharacterEvent &inout FakeEvent) const
    {
        int local_14 = 0;
        int local_34 = 0;
        int local_92 = 0;
        int local_106 = 0;
        int local_108 = 0;
        FECSEntity local_8 = FECSSpawnUtils::DisposeSpawnFakeCharacterEvent(FakeEvent);
        ::FSwitchPlayerUtils::SwitchOutPlayer(FakeEvent.SwitchOutAvatar);
        Get local_18;
        local_14.SetFactionId(local_18.opCall().GetFactionId());
        local_14.PostPrefabLoad(local_8);
        ::FSwitchPlayerUtils::SwitchPlayerControlledPawnEntity(FakeEvent.SwitchOutAvatar, local_8);
        UCombatGlobalSettings local_24 = ::UCombatGlobalSettings::Get();
        if (local_24.SafeZoneBuff.IsValid() && FBuffUtils::HasBuff(FakeEvent.SwitchOutAvatar, local_24.SafeZoneBuff))
        {
            FBuffUtils::RemoveBuff(FakeEvent.SwitchOutAvatar, local_24.SafeZoneBuff, ECS::GetContextTime(), EBuffEndType(0));
            if (!(FBuffUtils::HasBuff(local_8, local_24.SafeZoneBuff)))
            {
                FBuffUtils::AddBuff(local_8, local_24.SafeZoneBuff, ECS::GetContextTime(), ENTITY_NULL, false, -1.0f, 1, false);
            }
        }
        local_34.ExtractData = FakeEvent.ExtractData;
        local_34.SwitchOutEntity = FakeEvent.SwitchOutAvatar;
        local_34.Time = FakeEvent.Time;
        FNameHandle_EntityBBVarEntity local_42;
        local_42;
        if (FakeEvent.ExtractData.GetGameAttributeInheritConfig().IsSet())
        {
            local_92.SetInheritOwner(FakeEvent.SwitchOutAvatar);
            local_92.SetGameAttributeInheritConfig(FakeEvent.ExtractData.GetGameAttributeInheritConfig());
            ModifyOrAdd local_100;
            local_100.opCall().AddInheritEntity(local_8);
        }
        FFPTime local_30 = FFPTime(-1);
        local_106.BeSummonedEntity = local_8;
        local_108.SetSwitchOutEntity(FakeEvent.SwitchOutAvatar);
        local_108.SetRefCount((local_108.GetRefCount() + 1));
        FC_SpawnFakeCharacterResultComponent local_116;
        local_116.SwitchOutAvatar = FakeEvent.SwitchOutAvatar;
        local_116.FakeEntity = local_8;
        local_116.bSharedHP = FakeEvent.ExtractData.GetbSharedHP();
        return;
    }
    UFUNCTION()
    void Job_DispatchFakeCharacterSyncHPEvent(const FCE_FakeCharacterSyncHPEvent &inout Event) const
    {
        FGameAttributeUtils::ChangeConsumeValue(Event.Sender, Attribute::HP, Event.Time, Event.HPValuie, -1.0f);
        return;
    }
    UFUNCTION()
    void ServerJob_InitFakeCharacter(const FECSEntity &inout FakeEntity, const FC_FakeCharacterInit &inout FakeCharacterInit, const FCS_FixedTime &inout Time) const
    {
        int local_60 = 0;
        if (FakeCharacterInit.ExtractData.GetbCopySourceBuffs())
        {
            ::BlueprintFunctions_Common::CopyAllBuffsToTargetEntity(FECSEntityAdapter(FakeCharacterInit.SwitchOutEntity), FECSEntityAdapter(FakeEntity));
        }
        if (FakeCharacterInit.ExtractData.GetbCopySourceCapabilities())
        {
            ::BlueprintFunctions_Common::CopyAllCapAbilitiesToTargetEntity(FECSEntityAdapter(FakeCharacterInit.SwitchOutEntity), FECSEntityAdapter(FakeEntity));
        }
        if (FakeCharacterInit.ExtractData.GetBuffConfig().IsValid())
        {
            FBuffUtils::AddBuff(FakeEntity, FakeCharacterInit.ExtractData.GetBuffConfig(), Time.Time, FakeEntity, false, -1.0f, 1, false);
        }
        if (FakeCharacterInit.ExtractData.GetbCopySourceLockTarget())
        {
            ::FLockTargetUtils::KeepLockTargetWhenSwitchControlEntity(FakeCharacterInit.SwitchOutEntity, FakeEntity);
        }
        if (FakeCharacterInit.ExtractData.GetbSharedHP())
        {
            FCE_FakeCharacterSyncHPEvent local_28;
            FFPTime local_40 = (FFPTime(Time.Time) + FFPTime(0.038));
            local_28.SwitchOutEntity = FakeCharacterInit.SwitchOutEntity;
            local_28.HPValuie = FGameAttributeUtils::GetAttributeValue(FakeCharacterInit.SwitchOutEntity, Attribute::HP, Time.Time, true, 0.0f, false, FGameAttributeModificationValue());
        }
        FFPTime local_40_2 = FFPTime(-1);
        local_60.SwitchOutEntity = FakeCharacterInit.SwitchOutEntity;
        Remove local_64;
        local_64.opCall();
        FESMTriggerUtils::ActivateESMTrigger(FakeEntity, n"ControlSwitchIn", ECS::GetContextTime(), FFPTime(1), 0);
        FFPTime local_40_3 = FFPTime(-1);
        SendEvent local_70;
        local_70.opCall(local_40_3);
        Get local_74;
        const FC_CombatState& local_76 = local_74.opCall();
        if (local_76)
        {
            Assign local_80;
            local_80.opCall(local_76);
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_SpawnFakeCharacter() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_SpawnFakeCharacterEvent> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_SpawnFakeCharacterEvent& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_SpawnFakeCharacter(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_DispatchFakeCharacterSyncHPEvent() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_FakeCharacterSyncHPEvent> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_FakeCharacterSyncHPEvent& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_DispatchFakeCharacterSyncHPEvent(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_InitFakeCharacter() const
    {
        int local_6 = 0;
        const FECSEntity& local_40;
        int local_42 = 0;
        int local_166 = 0;
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
                this.ServerJob_InitFakeCharacter(local_40, local_42, local_6);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_84 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_88;
        local_88.opCall();
        Exclude(local_84).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_94 = 0;
        FECSRuntimeViewIterator local_128 = local_84.Iterator();
        for (; local_128.CanProceed;)
        {
            local_40 = local_128.Proceed();
            ++local_94;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.ServerJob_InitFakeCharacter(local_166, local_42, local_6);
        }
        local_4.UpdateCachedEntityCount(local_94);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
}

