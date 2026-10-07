

class US_EcologySensor : UECSScriptSystem
{
    US_EcologySensor()
    {
        return;
    }
    UFUNCTION()
    void ServerJob_HandleTimeSegmentChanged(const FCE_EcologyTimeSegmentsChangedEvent &inout Event) const
    {
        int local_8 = 0;
        int local_12 = 0;
        int local_160 = 0;
        int local_166 = 0;
        int local_167 = 0;
        bool local_2 = true;
        int local_1 = local_2;
        FScopeCycleCounter local_3 = FScopeCycleCounter(FStatID(n"Sensor_HandleTimeSegmentChanged"), false);
        FECSWorldPtr local_10 = ECS::GetECSWorld();
        FECSWorldPtr local_10_2 = ECS::GetECSWorld();
        FECSEntity local_16 = FECSEntity(ENTITY_ID_NULL);
        FECSRuntimeQuery local_64 = FECSRuntimeQueryHelper::MakeRuntimeQuery(local_16, EECSQueryRegsitryType(7), false);
        Include local_108;
        local_108.opCall();
        FECSRuntimeQueryIterator local_130 = local_64.Iterator();
        for (; local_130.CanProceed;)
        {
            const FECSEntity& local_154 = local_130.Proceed();
            bool local_2_2 = false;
            local_167 = local_2_2;
            if (!(local_160))
            {
                local_2_2 = false;
            }
            else
            {
                local_2_2 = local_166;
            }
            if (local_2_2)
            {
                ::FEcologySensorUtils::UpdateAllDOTSensorUnit(local_154, local_160, FEcologyConditionWorldContext(int(Event.NewTimeSegments), ::FEcologySceneInfoUtils::GetWeatherByPosition(local_12, local_166.GetPosition()), ECS::GetECSWorld()), local_8);
            }
        }
        return;
    }
    UFUNCTION()
    void ServerJob_HandleWeatherChanged(const FCE_RegionWeatherChanged &inout Event) const
    {
        int local_16;
        int local_26 = 0;
        int local_30 = 0;
        int local_212 = 0;
        int local_218 = 0;
        int local_1 = true;
        FScopeCycleCounter local_3 = FScopeCycleCounter(FStatID(n"Sensor_HandleWeatherChanged"), false);
        FName local_7 = ::FWeatherUtils::GetWeatherNameFromRegionEntity(Event.Sender);
        AActor local_18;
        bool local_2 = !(local_16) || (local_18 == nullptr);
        if (local_2)
        {
            return;
        }
        AECSRegionVolume local_24 = (Cast<AECSRegionVolume>(local_18));
        FECSWorldPtr local_28 = ECS::GetECSWorld();
        FECSWorldPtr local_28_2 = ECS::GetECSWorld();
        FEcologyConditionWorldContext local_62 = FEcologyConditionWorldContext(::FEcologySceneInfoUtils::GetCurrentTimeSegments(local_30), local_7, ECS::GetECSWorld());
        FECSEntity local_66 = FECSEntity(ENTITY_ID_NULL);
        FECSRuntimeQuery local_112 = FECSRuntimeQueryHelper::MakeRuntimeQuery(local_66, EECSQueryRegsitryType(7), false);
        Include local_156;
        local_156.opCall();
        Include local_160;
        local_160.opCall();
        FECSRuntimeQueryIterator local_182 = local_112.Iterator();
        for (; local_182.CanProceed;)
        {
            const FECSEntity& local_206 = local_182.Proceed();
            if (!(local_212))
            {
                local_2 = false;
            }
            else
            {
                local_2 = local_218;
            }
            if (local_2)
            {
                if (!(local_24.QuickEncompassesPoint(local_218.GetPosition())))
                {
                    continue;
                }
                ::FEcologySensorUtils::UpdateAllDOTSensorUnit(local_206, local_212, local_62, local_26);
            }
        }
        return;
    }
    UFUNCTION()
    void ServerJob_HandleDOTSensorEntityBeginOverlap(const FCE_BeginOverlap &inout BeginOverlap) const
    {
        this.RefreshDOTSensorOnRegionOverlap(BeginOverlap.Sender, BeginOverlap.OverlappingEntity);
        return;
    }
    UFUNCTION()
    void ServerJob_HandleDOTSensorEntityEndOverlap(const FCE_EndOverlap &inout EndOverlap) const
    {
        this.RefreshDOTSensorOnRegionOverlap(EndOverlap.Sender, EndOverlap.OverlappingEntity);
        return;
    }
    void RefreshDOTSensorOnRegionOverlap(const FECSEntity &inout Entity, const FECSEntity &inout OverlappingEntity) const
    {
        int local_18 = 0;
        int local_24 = 0;
        int local_26 = 0;
        int local_30 = 0;
        Has local_6;
        bool local_1 = !(Entity.IsValid()) || !(local_6.opCall());
        if (local_1)
        {
            return;
        }
        if (::FLevelUtils::TryGetWeatherRegionVolumeActor(OverlappingEntity) == nullptr)
        {
            return;
        }
        if (!(local_18))
        {
            local_1 = false;
        }
        else
        {
            local_1 = local_24;
        }
        if (local_1)
        {
            FECSWorldPtr local_28 = ECS::GetECSWorld();
            FECSWorldPtr local_28_2 = ECS::GetECSWorld();
            ::FEcologySensorUtils::UpdateAllDOTSensorUnit(Entity, local_18, FEcologyConditionWorldContext(::FEcologySceneInfoUtils::GetCurrentTimeSegments(local_30), ::FEcologySceneInfoUtils::GetWeatherByPosition(local_30, local_24.GetPosition()), ECS::GetECSWorld()), local_26);
        }
        return;
    }
    UFUNCTION()
    void Job_DispatchEcosimAIStateChange(const FCE_DOTSensorStateChange &inout Event) const
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
    }
    UFUNCTION()
    void Run_ServerJob_HandleTimeSegmentChanged() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_EcologyTimeSegmentsChangedEvent> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
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
        TECSEventConstIterator<FCE_RegionWeatherChanged> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
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
    UFUNCTION()
    void Run_ServerJob_HandleDOTSensorEntityBeginOverlap() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_BeginOverlap> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_BeginOverlap& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_HandleDOTSensorEntityBeginOverlap(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_HandleDOTSensorEntityEndOverlap() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_EndOverlap> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_EndOverlap& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_HandleDOTSensorEntityEndOverlap(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_DispatchEcosimAIStateChange() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_DOTSensorStateChange> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_DOTSensorStateChange& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_DispatchEcosimAIStateChange(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
}

