

class US_CollectionPrefabSystem : UECSScriptSystem
{
    US_CollectionPrefabSystem()
    {
        return;
    }
    void PlayInstantFX(const FECSEntity &inout Entity, const TArray<FPlayFXCallParam> &inout FXConfigs) const
    {
        for (auto& local_16 : FXConfigs)
        {
            ::FFXUtils::PlayFXInstant(Entity, local_16.FXActorClass, local_16.OverrideParam, local_16.AttachSocket, (int(local_16.bIsAttached) != 0), EFXBaseTransformResolveModeWithAttachmentOption(0), local_16.LocationOrOffset, EFXOffsetSpaceWithAttachmentOption(3), local_16.RotationOrOffset, EFXOffsetSpaceWithAttachmentOption(3), true, FECSEntity());
        }
        return;
    }
    void PlayInstantFX(const FECSEntity &inout Entity, const TArray<FCollectionPrefabPlayFXCallParam> &inout FXConfigs) const
    {
        for (auto& local_16 : FXConfigs)
        {
            ::FFXUtils::PlayFXInstant(Entity, local_16.FXActorClass, local_16.OverrideParam, NAME_None, true, EFXBaseTransformResolveModeWithAttachmentOption(0), local_16.LocationOrOffset, EFXOffsetSpaceWithAttachmentOption(3), local_16.RotationOrOffset, EFXOffsetSpaceWithAttachmentOption(3), true, FECSEntity());
        }
        return;
    }
    TArray<FECSEntity> PlayDurationalFX(const FECSEntity &inout Entity, const TArray<FPlayFXCallParam> &inout FXConfigs) const
    {
        TArray<FECSEntity> local_4;
        for (auto& local_20 : FXConfigs)
        {
            local_4.Add(::FFXUtils::PlayFXDurational(Entity, local_20.FXActorClass, local_20.OverrideParam, local_20.AttachSocket, (int(local_20.bIsAttached) != 0), EFXBaseTransformResolveModeWithAttachmentOption(0), local_20.LocationOrOffset, EFXOffsetSpaceWithAttachmentOption(3), local_20.RotationOrOffset, EFXOffsetSpaceWithAttachmentOption(3), true, FECSEntity(), EAttachFXStopMethod(0)));
        }
        return local_4;
    }
    TArray<FECSEntity> PlayDurationalFX(const FECSEntity &inout Entity, const TArray<FCollectionPrefabPlayFXCallParam> &inout FXConfigs) const
    {
        TArray<FECSEntity> local_4;
        for (auto& local_20 : FXConfigs)
        {
            local_4.Add(::FFXUtils::PlayFXDurational(Entity, local_20.FXActorClass, local_20.OverrideParam, NAME_None, true, EFXBaseTransformResolveModeWithAttachmentOption(0), local_20.LocationOrOffset, EFXOffsetSpaceWithAttachmentOption(3), local_20.RotationOrOffset, EFXOffsetSpaceWithAttachmentOption(3), true, FECSEntity(), EAttachFXStopMethod(0)));
        }
        return local_4;
    }
    void ProcessCollectionPrefabPresentation_Show(const FECSEntity &inout Entity, const FC_CollectionPrefabPresentationState &inout CollectionPrefabPresentationState, const FC_CollectionPrefabPresentationConfig &inout CollectionPrefabPresentationConfig) const
    {
        if ((int(CollectionPrefabPresentationState.GetState())) != 1)
        {
            return;
        }
        if (!(CollectionPrefabPresentationConfig))
        {
            return;
        }
        if ((CollectionPrefabPresentationConfig.StateShow.DelayTimeSeconds) > 0.0f)
        {
            FC_CollectionPrefabPresentationStateDelayTimer_Show local_12;
            Assign local_10;
            FC_CollectionPrefabPresentationStateDelayTimer_Show& local_14 = local_10.opCall(local_12);
            if (local_14)
            {
                local_14.TargetTime = FFPTime((ECS::GetRuntimeInfo().Time.ToSeconds() + CollectionPrefabPresentationConfig.StateShow.DelayTimeSeconds));
            }
            return;
        }
        if (CollectionPrefabPresentationConfig.StateShow.InstantFXConfigs.IsEmpty())
        {
            this.PlayInstantFX(Entity, CollectionPrefabPresentationConfig.StateShow.FXConfigs);
            return;
        }
        this.PlayInstantFX(Entity, CollectionPrefabPresentationConfig.StateShow.InstantFXConfigs);
        return;
    }
    void ProcessCollectionPrefabPresentation_Normal(const FECSEntity &inout Entity, const FC_CollectionPrefabPresentationState &inout CollectionPrefabPresentationState, const FC_CollectionPrefabPresentationConfig &inout CollectionPrefabPresentationConfig) const
    {
        if ((int(CollectionPrefabPresentationState.GetState())) != 1)
        {
            return;
        }
        if (!(CollectionPrefabPresentationConfig))
        {
            return;
        }
        if ((CollectionPrefabPresentationConfig.StateNormal.DelayTimeSeconds) > 0.0f)
        {
            FC_CollectionPrefabPresentationStateDelayTimer_Normal local_12;
            Assign local_10;
            FC_CollectionPrefabPresentationStateDelayTimer_Normal& local_14 = local_10.opCall(local_12);
            if (local_14)
            {
                local_14.TargetTime = FFPTime((ECS::GetRuntimeInfo().Time.ToSeconds() + CollectionPrefabPresentationConfig.StateNormal.DelayTimeSeconds));
            }
            return;
        }
        FC_CollectionPrefabPresentationCache& local_26 = FECSEntity::ModifyOrAdd<FC_CollectionPrefabPresentationCache>(Entity).opCall();
        if (local_26)
        {
            if (CollectionPrefabPresentationConfig.StateNormal.DurationalFXConfigs.IsEmpty())
            {
                local_26.NormalDurationalFXEntities.Append(this.PlayDurationalFX(Entity, CollectionPrefabPresentationConfig.StateNormal.FXConfigs));
                return;
            }
            local_26.NormalDurationalFXEntities.Append(this.PlayDurationalFX(Entity, CollectionPrefabPresentationConfig.StateNormal.DurationalFXConfigs));
        }
        return;
    }
    void ProcessCollectionPrefabPresentation_InteractedDisappear(const FECSEntity &inout Entity, const FC_CollectionPrefabPresentationState &inout CollectionPrefabPresentationState, const FC_CollectionPrefabPresentationConfig &inout CollectionPrefabPresentationConfig) const
    {
        if ((int(CollectionPrefabPresentationState.GetState())) != 2)
        {
            return;
        }
        if (!(CollectionPrefabPresentationConfig))
        {
            return;
        }
        if (CollectionPrefabPresentationConfig.StateInteractedDisappear.InstantFXConfigs.IsEmpty())
        {
            this.PlayInstantFX(Entity, CollectionPrefabPresentationConfig.StateInteractedDisappear.FXConfigs);
        }
        else
        {
            this.PlayInstantFX(Entity, CollectionPrefabPresentationConfig.StateInteractedDisappear.InstantFXConfigs);
        }
        Get local_8;
        const FC_CollectionPrefabPresentationCache& local_10 = local_8.opCall();
        if (local_10)
        {
            for (auto& local_24 : local_10.NormalDurationalFXEntities)
            {
                ::FFXUtils::StopFX(local_24, true);
            }
        }
        return;
    }
    void ProcessCollectionPrefabPresentation_LifeCycleDisappear(const FECSEntity &inout Entity, const FC_CollectionPrefabPresentationState &inout CollectionPrefabPresentationState, const FC_CollectionPrefabPresentationConfig &inout CollectionPrefabPresentationConfig) const
    {
        if ((int(CollectionPrefabPresentationState.GetState())) != 3)
        {
            return;
        }
        if (!(CollectionPrefabPresentationConfig))
        {
            return;
        }
        if (CollectionPrefabPresentationConfig.StateLifeCycleDisappear.InstantFXConfigs.IsEmpty())
        {
            this.PlayInstantFX(Entity, CollectionPrefabPresentationConfig.StateLifeCycleDisappear.FXConfigs);
        }
        else
        {
            this.PlayInstantFX(Entity, CollectionPrefabPresentationConfig.StateLifeCycleDisappear.InstantFXConfigs);
        }
        Get local_8;
        const FC_CollectionPrefabPresentationCache& local_10 = local_8.opCall();
        if (local_10)
        {
            for (auto& local_24 : local_10.NormalDurationalFXEntities)
            {
                ::FFXUtils::StopFX(local_24, true);
            }
        }
        return;
    }
    UFUNCTION()
    void MonitorJob_ClientProcessCollectionPrefabPresentation(const FC_CollectionPrefabPresentationState &inout CollectionPrefabPresentationState, const FECSEntity &inout Entity) const
    {
        int local_6 = 0;
        if (!(local_6))
        {
            return;
        }
        else
        {
            if (int(CollectionPrefabPresentationState.GetState()) == 1)
            {
                this.ProcessCollectionPrefabPresentation_Show(Entity, CollectionPrefabPresentationState, local_6);
                this.ProcessCollectionPrefabPresentation_Normal(Entity, CollectionPrefabPresentationState, local_6);
                return;
            }
            else
            {
                if ((int(CollectionPrefabPresentationState.GetState())) == 2)
                {
                    this.ProcessCollectionPrefabPresentation_InteractedDisappear(Entity, CollectionPrefabPresentationState, local_6);
                    return;
                }
                else
                {
                    if (int(CollectionPrefabPresentationState.GetState()) == 3)
                    {
                        this.ProcessCollectionPrefabPresentation_LifeCycleDisappear(Entity, CollectionPrefabPresentationState, local_6);
                        return;
                    }
                    else
                    {
                        return;
                    }
                }
            }
        }
    }
    UFUNCTION()
    void ClientJob_ProcessCollectionPrefabPresentation_Show_Timer(const FC_CollectionPrefabPresentationStateDelayTimer_Show &inout DelayTimer, const FECSEntity &inout Entity) const
    {
        int local_6 = 0;
        if (!(local_6))
        {
            return;
        }
        if (FFPTime(ECS::GetRuntimeInfo().Time).opCmp(DelayTimer.TargetTime) >= 0)
        {
            if (local_6.StateShow.InstantFXConfigs.IsEmpty())
            {
                this.PlayInstantFX(Entity, local_6.StateShow.FXConfigs);
            }
            else
            {
                this.PlayInstantFX(Entity, local_6.StateShow.InstantFXConfigs);
            }
            Remove local_16;
            local_16.opCall();
        }
        return;
    }
    UFUNCTION()
    void ClientJob_ProcessCollectionPrefabPresentation_Normal_Timer(const FC_CollectionPrefabPresentationStateDelayTimer_Normal &inout DelayTimer, const FECSEntity &inout Entity) const
    {
        int local_6 = 0;
        if (!(local_6))
        {
            return;
        }
        if (FFPTime(ECS::GetRuntimeInfo().Time).opCmp(DelayTimer.TargetTime) >= 0)
        {
            ModifyOrAdd local_16;
            FC_CollectionPrefabPresentationCache& local_18 = local_16.opCall();
            if (local_18)
            {
                if (local_6.StateNormal.DurationalFXConfigs.IsEmpty())
                {
                    local_18.NormalDurationalFXEntities.Append(this.PlayDurationalFX(Entity, local_6.StateNormal.FXConfigs));
                }
                else
                {
                    local_18.NormalDurationalFXEntities.Append(this.PlayDurationalFX(Entity, local_6.StateNormal.DurationalFXConfigs));
                }
            }
            Remove local_26;
            local_26.opCall();
        }
        return;
    }
    UFUNCTION()
    void Run_MonitorJob_ClientProcessCollectionPrefabPresentation() const
    {
        int local_50 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorCollectionPrefabPresentationStateOnModifyView(this.GetECSWorld(), EECSRegType(0), false, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_48 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.MonitorJob_ClientProcessCollectionPrefabPresentation(local_50, local_52);
        }
        FECSMonitorRuntimeView local_16 = ::__GetMonitorCollectionPrefabPresentationStateOnActiveView(this.GetECSWorld(), EECSRegType(0), false, true);
        FECSMonitorRuntimeViewIterator local_40 = local_16.Iterator();
        for (; local_40.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42_2 = local_40.Proceed();
            FECSEntityScopeCycleCounter local_43_2 = FECSEntityScopeCycleCounter(local_42_2.Entity);
            GetComponent local_48_2 = FECSMonitorRuntimeViewItem::GetComponent(local_42_2);
            this.MonitorJob_ClientProcessCollectionPrefabPresentation(local_50, local_52);
        }
        return;
    }
    void Monitor___JobTimer_Pre___ClientJob_ProcessCollectionPrefabPresentation_Show_Timer(const FC_CollectionPrefabPresentationStateDelayTimer_Show &inout TimerComp, const FECSEntity &inout Entity) const
    {
        if (!(TimerComp))
        {
            return;
        }
        FFPTime local_6 = TimerComp.TargetTime;
        FName local_8 = FName("S_CollectionPrefabSystem::ClientJob_ProcessCollectionPrefabPresentation_Show_Timer");
        if (local_6.opCmp(0.0) >= 0 && (local_6.opCmp(FPTIME_MAX) < 0))
        {
            ECS::ScheduleJobTimer(local_8, local_6, Entity.GetId(), true);
        }
        return;
    }
    void Monitor___JobTimer_Post___ClientJob_ProcessCollectionPrefabPresentation_Show_Timer(const FC_CollectionPrefabPresentationStateDelayTimer_Show &inout TimerComp, const FECSEntity &inout Entity) const
    {
        if (!(TimerComp))
        {
            return;
        }
        FFPTime local_6 = TimerComp.TargetTime;
        FName local_8 = FName("S_CollectionPrefabSystem::ClientJob_ProcessCollectionPrefabPresentation_Show_Timer");
        if (local_6.opCmp(0.0) >= 0 && (local_6.opCmp(FPTIME_MAX) < 0))
        {
            ECS::ScheduleJobTimer(local_8, local_6, Entity.GetId(), false);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor___JobTimer_Pre___ClientJob_ProcessCollectionPrefabPresentation_Show_Timer() const
    {
        int local_52 = 0;
        int local_54 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_14 = ::__GetMonitorCollectionPrefabPresentationStateDelayTimer_ShowOnModifyView(this.GetECSWorld(), EECSRegType(0), false, false);
        FECSMonitorRuntimeViewIterator local_30 = local_14.Iterator();
        for (; local_30.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44 = local_30.Proceed();
            FECSEntityScopeCycleCounter local_45 = FECSEntityScopeCycleCounter(local_44.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_44);
            this.Monitor___JobTimer_Pre___ClientJob_ProcessCollectionPrefabPresentation_Show_Timer(local_52, local_54);
        }
        FECSMonitorRuntimeView local_18 = ::__GetMonitorCollectionPrefabPresentationStateDelayTimer_ShowOnActiveView(this.GetECSWorld(), EECSRegType(0), false, false);
        FECSMonitorRuntimeViewIterator local_42 = local_18.Iterator();
        for (; local_42.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44_2 = local_42.Proceed();
            FECSEntityScopeCycleCounter local_45_2 = FECSEntityScopeCycleCounter(local_44_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_44_2);
            this.Monitor___JobTimer_Pre___ClientJob_ProcessCollectionPrefabPresentation_Show_Timer(local_52, local_54);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor___JobTimer_Post___ClientJob_ProcessCollectionPrefabPresentation_Show_Timer() const
    {
        int local_52 = 0;
        int local_54 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_14 = ::__GetMonitorCollectionPrefabPresentationStateDelayTimer_ShowOnModifyView(this.GetECSWorld(), EECSRegType(0), false, true);
        FECSMonitorRuntimeViewIterator local_30 = local_14.Iterator();
        for (; local_30.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44 = local_30.Proceed();
            FECSEntityScopeCycleCounter local_45 = FECSEntityScopeCycleCounter(local_44.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_44);
            this.Monitor___JobTimer_Post___ClientJob_ProcessCollectionPrefabPresentation_Show_Timer(local_52, local_54);
        }
        FECSMonitorRuntimeView local_18 = ::__GetMonitorCollectionPrefabPresentationStateDelayTimer_ShowOnActiveView(this.GetECSWorld(), EECSRegType(0), false, true);
        FECSMonitorRuntimeViewIterator local_42 = local_18.Iterator();
        for (; local_42.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44_2 = local_42.Proceed();
            FECSEntityScopeCycleCounter local_45_2 = FECSEntityScopeCycleCounter(local_44_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_44_2);
            this.Monitor___JobTimer_Post___ClientJob_ProcessCollectionPrefabPresentation_Show_Timer(local_52, local_54);
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_ProcessCollectionPrefabPresentation_Show_Timer() const
    {
        int local_38 = 0;
        int local_46 = 0;
        int local_48 = 0;
        const FECSJob& local_2 = ECS::GetContextJob();
        FECSWorldPtr local_4 = ECS::GetECSWorld();
        local_2.MarkIteratingExternalEntityList(true);
        const TArray<FECSEntityId>& local_10 = local_2.GetExternalEntityList();
        FECSEntity local_28;
        for (auto& local_24 : local_10)
        {
            local_24;
            FECSEntityScopeCycleCounter local_29 = FECSEntityScopeCycleCounter(local_28);
            bool local_7 = false;
            bool local_31 = !(false);
            if (!(local_28.IsActive()) == local_31)
            {
                continue;
            }
            if (!(local_38))
            {
                continue;
            }
            FFPTime local_40 = local_38.TargetTime;
            if (local_40.opCmp(0.0) < 0 || (local_38.TargetTime == FPTIME_MAX))
            {
                continue;
            }
            if (local_7)
            {
                continue;
            }
            this.ClientJob_ProcessCollectionPrefabPresentation_Show_Timer(local_46, local_48);
        }
        local_2.MarkIteratingExternalEntityList(false);
        ECS::ClearCurJobExternalEntityList();
        return;
    }
    void Monitor___JobTimer_Pre___ClientJob_ProcessCollectionPrefabPresentation_Normal_Timer(const FC_CollectionPrefabPresentationStateDelayTimer_Normal &inout TimerComp, const FECSEntity &inout Entity) const
    {
        if (!(TimerComp))
        {
            return;
        }
        FFPTime local_6 = TimerComp.TargetTime;
        FName local_8 = FName("S_CollectionPrefabSystem::ClientJob_ProcessCollectionPrefabPresentation_Normal_Timer");
        if (local_6.opCmp(0.0) >= 0 && (local_6.opCmp(FPTIME_MAX) < 0))
        {
            ECS::ScheduleJobTimer(local_8, local_6, Entity.GetId(), true);
        }
        return;
    }
    void Monitor___JobTimer_Post___ClientJob_ProcessCollectionPrefabPresentation_Normal_Timer(const FC_CollectionPrefabPresentationStateDelayTimer_Normal &inout TimerComp, const FECSEntity &inout Entity) const
    {
        if (!(TimerComp))
        {
            return;
        }
        FFPTime local_6 = TimerComp.TargetTime;
        FName local_8 = FName("S_CollectionPrefabSystem::ClientJob_ProcessCollectionPrefabPresentation_Normal_Timer");
        if (local_6.opCmp(0.0) >= 0 && (local_6.opCmp(FPTIME_MAX) < 0))
        {
            ECS::ScheduleJobTimer(local_8, local_6, Entity.GetId(), false);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor___JobTimer_Pre___ClientJob_ProcessCollectionPrefabPresentation_Normal_Timer() const
    {
        int local_52 = 0;
        int local_54 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_14 = ::__GetMonitorCollectionPrefabPresentationStateDelayTimer_NormalOnModifyView(this.GetECSWorld(), EECSRegType(0), false, false);
        FECSMonitorRuntimeViewIterator local_30 = local_14.Iterator();
        for (; local_30.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44 = local_30.Proceed();
            FECSEntityScopeCycleCounter local_45 = FECSEntityScopeCycleCounter(local_44.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_44);
            this.Monitor___JobTimer_Pre___ClientJob_ProcessCollectionPrefabPresentation_Normal_Timer(local_52, local_54);
        }
        FECSMonitorRuntimeView local_18 = ::__GetMonitorCollectionPrefabPresentationStateDelayTimer_NormalOnActiveView(this.GetECSWorld(), EECSRegType(0), false, false);
        FECSMonitorRuntimeViewIterator local_42 = local_18.Iterator();
        for (; local_42.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44_2 = local_42.Proceed();
            FECSEntityScopeCycleCounter local_45_2 = FECSEntityScopeCycleCounter(local_44_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_44_2);
            this.Monitor___JobTimer_Pre___ClientJob_ProcessCollectionPrefabPresentation_Normal_Timer(local_52, local_54);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor___JobTimer_Post___ClientJob_ProcessCollectionPrefabPresentation_Normal_Timer() const
    {
        int local_52 = 0;
        int local_54 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_14 = ::__GetMonitorCollectionPrefabPresentationStateDelayTimer_NormalOnModifyView(this.GetECSWorld(), EECSRegType(0), false, true);
        FECSMonitorRuntimeViewIterator local_30 = local_14.Iterator();
        for (; local_30.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44 = local_30.Proceed();
            FECSEntityScopeCycleCounter local_45 = FECSEntityScopeCycleCounter(local_44.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_44);
            this.Monitor___JobTimer_Post___ClientJob_ProcessCollectionPrefabPresentation_Normal_Timer(local_52, local_54);
        }
        FECSMonitorRuntimeView local_18 = ::__GetMonitorCollectionPrefabPresentationStateDelayTimer_NormalOnActiveView(this.GetECSWorld(), EECSRegType(0), false, true);
        FECSMonitorRuntimeViewIterator local_42 = local_18.Iterator();
        for (; local_42.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44_2 = local_42.Proceed();
            FECSEntityScopeCycleCounter local_45_2 = FECSEntityScopeCycleCounter(local_44_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_44_2);
            this.Monitor___JobTimer_Post___ClientJob_ProcessCollectionPrefabPresentation_Normal_Timer(local_52, local_54);
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_ProcessCollectionPrefabPresentation_Normal_Timer() const
    {
        int local_38 = 0;
        int local_46 = 0;
        int local_48 = 0;
        const FECSJob& local_2 = ECS::GetContextJob();
        FECSWorldPtr local_4 = ECS::GetECSWorld();
        local_2.MarkIteratingExternalEntityList(true);
        const TArray<FECSEntityId>& local_10 = local_2.GetExternalEntityList();
        FECSEntity local_28;
        for (auto& local_24 : local_10)
        {
            local_24;
            FECSEntityScopeCycleCounter local_29 = FECSEntityScopeCycleCounter(local_28);
            bool local_7 = false;
            bool local_31 = !(false);
            if (!(local_28.IsActive()) == local_31)
            {
                continue;
            }
            if (!(local_38))
            {
                continue;
            }
            FFPTime local_40 = local_38.TargetTime;
            if (local_40.opCmp(0.0) < 0 || (local_38.TargetTime == FPTIME_MAX))
            {
                continue;
            }
            if (local_7)
            {
                continue;
            }
            this.ClientJob_ProcessCollectionPrefabPresentation_Normal_Timer(local_46, local_48);
        }
        local_2.MarkIteratingExternalEntityList(false);
        ECS::ClearCurJobExternalEntityList();
        return;
    }
}

