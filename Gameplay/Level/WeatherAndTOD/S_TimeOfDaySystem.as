

class US_TimeOfDaySystem : UECSScriptSystem
{
    US_TimeOfDaySystem()
    {
        return;
    }
    void InitTimeOfDay() const
    {
        int local_8 = 0;
        float32 local_27 = 0.0f;
        bool local_41 = false;
        FECSWorldPtr local_2 = this.GetECSWorld();
        AAS_ECSWorldSettings local_16 = (Cast<AAS_ECSWorldSettings>(ECS::GetUEWorld().GetWorldSettings()));
        if (local_16 != nullptr)
        {
            FCS_CommissionDSGlobalInfo local_26;
            float32 local_20;
            float32 local_18;
            local_18 = -1.0f;
            local_20 = -1.0f;
            FECSWorldPtr local_2_2 = this.GetECSWorld();
            if (local_26)
            {
                if (local_26.StartTimeInHoursOverride >= 0.0f)
                {
                    local_20 = local_26.StartTimeInHoursOverride;
                    XLog(ELog(22), FString().Append("CommissionDSGlobalInfo override Day Time: ").Append(local_20));
                }
                if (local_26.TimeSpeedOverride >= 0.0f)
                {
                    local_27 = local_26.TimeSpeedOverride;
                    local_18 = local_27;
                    XLog(ELog(22), FString().Append("CommissionDSGlobalInfo override Time Speed: ").Append(local_18));
                }
            }
            FECSWorldPtr local_2_3 = this.GetECSWorld();
            Get local_38;
            const FCS_CommissionInfo& local_40 = local_38.opCall();
            if (local_40)
            {
                if (local_40.CommissionConfig)
                {
                    if ((local_20 < 0.0f && (local_27 > 0.0f)))
                    {
                        local_20 = local_27;
                        XLog(ELog(22), FString().Append("CommissionDayTime override Day Time: ").Append(local_20));
                    }
                    if (local_41)
                    {
                        local_8.SetbPaused(true);
                    }
                }
            }
            if (local_20 < 0.0f)
            {
                local_20 = local_16.LogicStartTime;
                XLog(ELog(22), FString().Append("Use default Day Time: ").Append(local_20));
            }
            if (local_18 < 0.0f)
            {
                local_18 = local_16.LogicTimeSpeed;
                XLog(ELog(22), FString().Append("Use default Time Speed: ").Append(local_18));
            }
            local_8.SetTimeSpeed(local_18);
            local_8.UpdateTimeOfDaySeconds(::FTimeOfDayUtils::GetTimeOfDayInSeconds(local_20));
        }
        return;
    }
    UFUNCTION()
    void ServerJob_InitTimeOfDay() const
    {
        this.InitTimeOfDay();
        return;
    }
    UFUNCTION()
    void HandleEventSetCurrentTimeOfDay(const FCE_SetCurrentTimeOfDay &inout Event) const
    {
        FECSWorldPtr local_2 = this.GetECSWorld();
        0.UpdateTimeOfDaySeconds(::FTimeOfDayUtils::GetTimeOfDayInSeconds(Event.TimeOfDayInHours));
        return;
    }
    UFUNCTION()
    void ServerJob_UpdateTimeOfDay() const
    {
        int local_8 = 0;
        int local_14 = 0;
        float32 local_22;
        FECSWorldPtr local_2 = this.GetECSWorld();
        FECSWorldPtr local_2_2 = this.GetECSWorld();
        FECSWorldPtr local_2_3 = this.GetECSWorld();
        if (local_14.GetbPaused())
        {
            return;
        }
        local_22 = local_14.GetTimeSpeed();
        FECSWorldPtr local_2_4 = this.GetECSWorld();
        Modify local_28;
        FCS_FastForwardTODInfo& local_30 = local_28.opCall();
        if (local_30)
        {
            float local_32 = local_8.DeltaTime.ToSeconds();
            float32 local_23_2 = float32(local_32);
            local_30.RemainBlendTime -= local_23_2;
            float32 local_23_3 = local_30.RemainBlendTime;
            if (local_23_3 <= 0.0f)
            {
                local_22 = local_30.OriginTimeSpeed;
                int local_34 = int(local_30.TargetTimeOfDaySeconds);
                local_14.UpdateTimeOfDaySeconds(local_34);
                FECSWorldPtr local_36 = this.GetECSWorld();
                Remove local_40;
                local_40.opCall();
                return;
            }
            local_22 = local_30.TimeSpeed;
        }
        float local_32_2 = local_8.DeltaTime.ToSeconds();
        float32 local_33_2 = float32(local_32_2);
        float32 local_23_4 = local_33_2 * local_22;
        FCS_TODAccumulatedDeltaTime local_20;
        local_33_2 = local_20.AccumulatedDeltaTime + local_23_4;
        local_20.AccumulatedDeltaTime = local_33_2;
        float32 local_23_5 = local_20.AccumulatedDeltaTime;
        int local_34_2 = FMath::FloorToInt(local_23_5);
        if (local_34_2 > 0)
        {
            local_14.UpdateTimeOfDaySeconds((local_14.GetTimeOfDaySeconds() + local_34_2));
            float32 local_41_2 = local_20.AccumulatedDeltaTime;
            local_33_2 = local_34_2;
            float32 local_23_6 = local_41_2 - local_33_2;
            local_20.AccumulatedDeltaTime = local_23_6;
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_InitTimeOfDay() const
    {
        ECS::GetContextJob();
        this.ServerJob_InitTimeOfDay();
        return;
    }
    UFUNCTION()
    void Run_HandleEventSetCurrentTimeOfDay() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_SetCurrentTimeOfDay> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_SetCurrentTimeOfDay& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.HandleEventSetCurrentTimeOfDay(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_UpdateTimeOfDay() const
    {
        ECS::GetContextJob();
        this.ServerJob_UpdateTimeOfDay();
        return;
    }
}

