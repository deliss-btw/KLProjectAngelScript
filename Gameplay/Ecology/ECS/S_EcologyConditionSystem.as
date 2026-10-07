

class US_EcologyConditionSystem : UECSScriptSystem
{
    US_EcologyConditionSystem()
    {
        return;
    }
    UFUNCTION()
    void ServerJob_HandleTimeSegmentChanged(const FCE_EcologyTimeSegmentsChangedEvent &inout Event) const
    {
        int local_8 = 0;
        int local_12 = 0;
        FC_EcologyConditionComponent local_184;
        int local_190 = 0;
        bool local_191;
        int local_1 = true;
        FScopeCycleCounter local_3 = FScopeCycleCounter(FStatID(n"ProcessEcologyCondition"), false);
        FECSWorldPtr local_10 = ECS::GetECSWorld();
        FECSWorldPtr local_10_2 = ECS::GetECSWorld();
        FGameplayTagContainer local_24 = FGameplayTagContainer(::FEcologySceneInfoUtils::GetTimeSegmentsGameplayTagContaiers(local_8, int(Event.PreviousTimeSegments)));
        FGameplayTagContainer local_36 = FGameplayTagContainer(::FEcologySceneInfoUtils::GetTimeSegmentsGameplayTagContaiers(local_8, int(Event.NewTimeSegments)));
        bool local_2 = local_36.HasAll(local_24) && local_24.HasAll(local_36);
        if (local_2)
        {
            return;
        }
        FECSEntity local_42 = FECSEntity(ENTITY_ID_NULL);
        FECSRuntimeQuery local_88 = FECSRuntimeQueryHelper::MakeRuntimeQuery(local_42, EECSQueryRegsitryType(7), true);
        Include local_132;
        local_132.opCall();
        FECSRuntimeQueryIterator local_154 = local_88.Iterator();
        for (; local_154.CanProceed;)
        {
            const FECSEntity& local_178 = local_154.Proceed();
            local_191 = false;
            if (!(local_184))
            {
                local_2 = false;
            }
            else
            {
                local_2 = local_190;
            }
            if (local_2)
            {
                FName local_193 = ::FEcologySceneInfoUtils::GetWeatherByPosition(local_12, local_190.GetPosition());
                local_191 = ::FEcologyConditionUtils::UpdateEntityConditionResultAboutDOT(local_178, local_184, local_193, int(Event.NewTimeSegments), local_8);
                if (local_191)
                {
                    this.ProcessConditionChanged(local_178, local_184.bLastFinalResult);
                }
            }
        }
        return;
    }
    UFUNCTION()
    void ServerJob_HandleWeatherChanged(const FCE_RegionWeatherChanged &inout Event) const
    {
        int local_16;
        AActor local_18;
        bool local_19;
        int local_26 = 0;
        int local_30 = 0;
        FC_EcologyConditionComponent local_184;
        int local_190 = 0;
        bool local_191 = false;
        int local_1 = true;
        FScopeCycleCounter local_3 = FScopeCycleCounter(FStatID(n"ProcessEcologyCondition"), false);
        FName local_7 = ::FWeatherUtils::GetWeatherNameFromRegionEntity(Event.Sender);
        if (!(local_16) || (local_18 == nullptr))
        {
            return;
        }
        AECSRegionVolume local_24 = (Cast<AECSRegionVolume>(local_18));
        FECSWorldPtr local_28 = ECS::GetECSWorld();
        FECSWorldPtr local_28_2 = ECS::GetECSWorld();
        int local_4 = ::FEcologySceneInfoUtils::GetCurrentTimeSegments(local_30);
        FECSEntity local_36 = FECSEntity(ENTITY_ID_NULL);
        FECSRuntimeQuery local_84 = FECSRuntimeQueryHelper::MakeRuntimeQuery(local_36, EECSQueryRegsitryType(7), true);
        Include local_128;
        local_128.opCall();
        Include local_132;
        local_132.opCall();
        FECSRuntimeQueryIterator local_154 = local_84.Iterator();
        for (; local_154.CanProceed;)
        {
            const FECSEntity& local_178 = local_154.Proceed();
            local_191 = false;
            if (!(local_184))
            {
                local_19 = false;
            }
            else
            {
                local_19 = local_190;
            }
            if (local_19)
            {
                if (!(local_24.QuickEncompassesPoint(local_190.GetPosition())))
                {
                    continue;
                }
                if (::FEcologyConditionUtils::UpdateEntityConditionResultAboutDOT(local_178, local_184, local_7, local_4, local_26))
                {
                    this.ProcessConditionChanged(local_178, local_184.bLastFinalResult);
                }
            }
        }
        return;
    }
    void ProcessConditionChanged(const FECSEntity &inout Entity, const bool bNewState) const
    {
        bool local_2 = !(bNewState);
        Get local_6;
        const FC_EcologyResourceProviderSummary& local_8 = local_6.opCall();
        if (local_8)
        {
            ::FEcologyResourceUtils::ProcessResourceConditionChanged(Entity, local_8, local_2, bNewState);
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_HandleTimeSegmentChanged() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_EcologyTimeSegmentsChangedEvent> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(0)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_EcologyTimeSegmentsChangedEvent& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_HandleTimeSegmentChanged(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_HandleWeatherChanged() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_RegionWeatherChanged> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(0)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_RegionWeatherChanged& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_HandleWeatherChanged(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
}

