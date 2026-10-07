

class US_ScalerResourceSystem : UECSScriptSystem
{
    US_ScalerResourceSystem()
    {
        return;
    }
    UFUNCTION()
    void Job_HandleScalerResourceTimer0(const FECSEntity &inout Entity, const FCS_FixedTime &inout FixedTime, const FC_ScalerResourceTimer_RecoverStartDelay0 &inout Comp) const
    {
        bool local_4;
        int local_10 = 0;
        int local_16 = 0;
        float32 local_23;
        if (FFPTime(FixedTime.Time).opCmp(Comp.GetTargetWorldTime()) >= 0)
        {
            if (!(local_10))
            {
                local_4 = false;
            }
            else
            {
                local_4 = local_16;
            }
            if (local_4)
            {
                const FScalerResourceConfigData& local_20 = local_16.ScalerResourceConfigData[0];
                if (!(::FScalerResourceUtils::IsReachConsumeExtreme(local_16, local_10, 0)))
                {
                    local_4 = false;
                }
                else
                {
                    local_4 = local_16.ScalerResourceConfigData[0].bRecoverInstantlyBackToExtremeWhenReachConsumeExtreme;
                }
                if (local_4)
                {
                    if (int(local_20.ChangeType) == 0 || (int(local_20.ChangeType) == 1))
                    {
                        local_23 = local_20.ValueMax;
                    }
                    else
                    {
                        local_23 = local_20.ValueMin;
                    }
                    local_10.GetModify_Values()[0] = local_23;
                }
                else
                {
                    FC_ScalerResource0RecoveringTag local_30;
                    Assign local_28;
                    local_28.opCall(local_30);
                }
            }
            Remove local_34;
            local_34.opCall();
        }
        return;
    }
    UFUNCTION()
    void Job_HandleScalerResourceTimer1(const FECSEntity &inout Entity, const FCS_FixedTime &inout FixedTime, const FC_ScalerResourceTimer_RecoverStartDelay1 &inout Comp) const
    {
        bool local_4;
        int local_10 = 0;
        int local_16 = 0;
        float32 local_23;
        if (FFPTime(FixedTime.Time).opCmp(Comp.GetTargetWorldTime()) >= 0)
        {
            if (!(local_10))
            {
                local_4 = false;
            }
            else
            {
                local_4 = local_16;
            }
            if (local_4)
            {
                const FScalerResourceConfigData& local_20 = local_16.ScalerResourceConfigData[1];
                if (!(::FScalerResourceUtils::IsReachConsumeExtreme(local_16, local_10, 1)))
                {
                    local_4 = false;
                }
                else
                {
                    local_4 = local_16.ScalerResourceConfigData[1].bRecoverInstantlyBackToExtremeWhenReachConsumeExtreme;
                }
                if (local_4)
                {
                    if (int(local_20.ChangeType) == 0 || (int(local_20.ChangeType) == 1))
                    {
                        local_23 = local_20.ValueMax;
                    }
                    else
                    {
                        local_23 = local_20.ValueMin;
                    }
                    local_10.GetModify_Values()[1] = local_23;
                }
                else
                {
                    FC_ScalerResource1RecoveringTag local_30;
                    Assign local_28;
                    local_28.opCall(local_30);
                }
            }
            Remove local_34;
            local_34.opCall();
        }
        return;
    }
    UFUNCTION()
    void Job_HandleScalerResourceTimer2(const FECSEntity &inout Entity, const FCS_FixedTime &inout FixedTime, const FC_ScalerResourceTimer_RecoverStartDelay2 &inout Comp) const
    {
        bool local_4;
        int local_10 = 0;
        int local_16 = 0;
        float32 local_23;
        if (FFPTime(FixedTime.Time).opCmp(Comp.GetTargetWorldTime()) >= 0)
        {
            if (!(local_10))
            {
                local_4 = false;
            }
            else
            {
                local_4 = local_16;
            }
            if (local_4)
            {
                const FScalerResourceConfigData& local_20 = local_16.ScalerResourceConfigData[2];
                if (!(::FScalerResourceUtils::IsReachConsumeExtreme(local_16, local_10, 2)))
                {
                    local_4 = false;
                }
                else
                {
                    local_4 = local_16.ScalerResourceConfigData[2].bRecoverInstantlyBackToExtremeWhenReachConsumeExtreme;
                }
                if (local_4)
                {
                    if (int(local_20.ChangeType) == 0 || (int(local_20.ChangeType) == 1))
                    {
                        local_23 = local_20.ValueMax;
                    }
                    else
                    {
                        local_23 = local_20.ValueMin;
                    }
                    local_10.GetModify_Values()[2] = local_23;
                }
                else
                {
                    FC_ScalerResource2RecoveringTag local_30;
                    Assign local_28;
                    local_28.opCall(local_30);
                }
            }
            Remove local_34;
            local_34.opCall();
        }
        return;
    }
    UFUNCTION()
    void Job_CheckAndClearCurrentFixedTickChangedBitMask0(const FECSEntity &inout Entity, const FCS_FixedTime &inout FixedTime, const FC_ScalerResourceConfig &inout ScalerResourceConfig, FC_ScalerResourceRuntime &inout ScalerResourceRuntime) const
    {
        bool local_5;
        if (!(ScalerResourceConfig.ScalerResourceConfigData.Num() > 0 && (ScalerResourceRuntime.GetValues().Num() > 0) && ScalerResourceConfig.ScalerResourceConfigData[0].bCanRecover))
        {
            local_5 = false;
        }
        else
        {
            int local_7 = ScalerResourceRuntime.GetCurrentFixedTickChangedBitMask() & 1;
            local_5 = (local_7 == 0);
        }
        if (local_5 && !(::FScalerResourceUtils::IsReachRecoverExtreme(ScalerResourceConfig, ScalerResourceRuntime, 0)))
        {
            float32 local_9;
            local_9 = ScalerResourceConfig.ScalerResourceConfigData[0].RecoverStartDelaySeconds;
            local_5 = ::FScalerResourceUtils::IsReachConsumeExtreme(ScalerResourceConfig, ScalerResourceRuntime, 0);
            if (local_5)
            {
                local_9 = local_9 + ScalerResourceConfig.ScalerResourceConfigData[0].ValueConsumeExtremeIrresponsiveDuration;
            }
            if (local_9 > 0.0f)
            {
                Has local_16;
                if (!(local_16.opCall()))
                {
                    FC_ScalerResourceTimer_RecoverStartDelay0 local_24;
                    Assign local_20;
                    FC_ScalerResourceTimer_RecoverStartDelay0& local_26 = local_20.opCall(local_24);
                    if (local_26)
                    {
                        local_26.SetTargetWorldTime(FFPTime((FixedTime.Time.ToSeconds() + local_9)));
                    }
                }
            }
            else
            {
                FC_ScalerResource0RecoveringTag local_38;
                Assign local_36;
                local_36.opCall(local_38);
            }
        }
        ScalerResourceRuntime.SetCurrentFixedTickChangedBitMask(uint8((ScalerResourceRuntime.GetCurrentFixedTickChangedBitMask() & 254)));
        return;
    }
    UFUNCTION()
    void Job_CheckAndClearCurrentFixedTickChangedBitMask1(const FECSEntity &inout Entity, const FCS_FixedTime &inout FixedTime, const FC_ScalerResourceConfig &inout ScalerResourceConfig, FC_ScalerResourceRuntime &inout ScalerResourceRuntime) const
    {
        bool local_5;
        if (!(ScalerResourceConfig.ScalerResourceConfigData.Num() > 1 && (ScalerResourceRuntime.GetValues().Num() > 1) && ScalerResourceConfig.ScalerResourceConfigData[1].bCanRecover))
        {
            local_5 = false;
        }
        else
        {
            int local_7 = ScalerResourceRuntime.GetCurrentFixedTickChangedBitMask() & 2;
            local_5 = (local_7 == 0);
        }
        if (local_5 && !(::FScalerResourceUtils::IsReachRecoverExtreme(ScalerResourceConfig, ScalerResourceRuntime, 1)))
        {
            float32 local_9;
            local_9 = ScalerResourceConfig.ScalerResourceConfigData[1].RecoverStartDelaySeconds;
            local_5 = ::FScalerResourceUtils::IsReachConsumeExtreme(ScalerResourceConfig, ScalerResourceRuntime, 1);
            if (local_5)
            {
                local_9 = local_9 + ScalerResourceConfig.ScalerResourceConfigData[1].ValueConsumeExtremeIrresponsiveDuration;
            }
            if (local_9 > 0.0f)
            {
                Has local_16;
                if (!(local_16.opCall()))
                {
                    FC_ScalerResourceTimer_RecoverStartDelay1 local_24;
                    Assign local_20;
                    FC_ScalerResourceTimer_RecoverStartDelay1& local_26 = local_20.opCall(local_24);
                    if (local_26)
                    {
                        local_26.SetTargetWorldTime(FFPTime((FixedTime.Time.ToSeconds() + local_9)));
                    }
                }
            }
            else
            {
                FC_ScalerResource1RecoveringTag local_38;
                Assign local_36;
                local_36.opCall(local_38);
            }
        }
        ScalerResourceRuntime.SetCurrentFixedTickChangedBitMask(uint8((ScalerResourceRuntime.GetCurrentFixedTickChangedBitMask() & 253)));
        return;
    }
    UFUNCTION()
    void Job_CheckAndClearCurrentFixedTickChangedBitMask2(const FECSEntity &inout Entity, const FCS_FixedTime &inout FixedTime, const FC_ScalerResourceConfig &inout ScalerResourceConfig, FC_ScalerResourceRuntime &inout ScalerResourceRuntime) const
    {
        bool local_5;
        if (!(ScalerResourceConfig.ScalerResourceConfigData.Num() > 2 && (ScalerResourceRuntime.GetValues().Num() > 2) && ScalerResourceConfig.ScalerResourceConfigData[2].bCanRecover))
        {
            local_5 = false;
        }
        else
        {
            int local_7 = ScalerResourceRuntime.GetCurrentFixedTickChangedBitMask() & 4;
            local_5 = (local_7 == 0);
        }
        if (local_5 && !(::FScalerResourceUtils::IsReachRecoverExtreme(ScalerResourceConfig, ScalerResourceRuntime, 2)))
        {
            float32 local_9;
            local_9 = ScalerResourceConfig.ScalerResourceConfigData[2].RecoverStartDelaySeconds;
            local_5 = ::FScalerResourceUtils::IsReachConsumeExtreme(ScalerResourceConfig, ScalerResourceRuntime, 2);
            if (local_5)
            {
                local_9 = local_9 + ScalerResourceConfig.ScalerResourceConfigData[2].ValueConsumeExtremeIrresponsiveDuration;
            }
            if (local_9 > 0.0f)
            {
                Has local_16;
                if (!(local_16.opCall()))
                {
                    FC_ScalerResourceTimer_RecoverStartDelay2 local_24;
                    Assign local_20;
                    FC_ScalerResourceTimer_RecoverStartDelay2& local_26 = local_20.opCall(local_24);
                    if (local_26)
                    {
                        local_26.SetTargetWorldTime(FFPTime((FixedTime.Time.ToSeconds() + local_9)));
                    }
                }
            }
            else
            {
                FC_ScalerResource2RecoveringTag local_38;
                Assign local_36;
                local_36.opCall(local_38);
            }
        }
        ScalerResourceRuntime.SetCurrentFixedTickChangedBitMask(uint8((ScalerResourceRuntime.GetCurrentFixedTickChangedBitMask() & 251)));
        return;
    }
    bool HandleRecoverScalerResource(const int ConfigIndex, const FECSEntity &inout Entity, const FCS_FixedTime &inout FixedTime) const
    {
        int local_6 = 0;
        int local_12 = 0;
        bool local_13;
        float32 local_21;
        Has local_36;
        Get local_40;
        if (!(local_6))
        {
            local_13 = false;
        }
        else
        {
            local_13 = local_12;
        }
        local_13 = !local_13;
        if (local_13)
        {
            return false;
        }
        if (local_12.GetValues().Num() > ConfigIndex && (local_6.ScalerResourceConfigData.Num() > ConfigIndex))
        {
            const FScalerResourceConfigData& local_18 = local_6.ScalerResourceConfigData[ConfigIndex];
            if (int(local_18.ChangeType) == 0 || (int(local_18.ChangeType) == 1))
            {
                local_21 = -1.0f;
            }
            else
            {
                local_21 = 1.0f;
            }
            float local_20_2 = (local_18.RecoverValueAbsPerSecond * FixedTime.DeltaTime.ToSeconds()) * local_21;
            local_21 = local_12.GetModify_Values()[ConfigIndex] - float32(local_20_2);
            if ((int(local_18.ChangeType) == 0 || (int(local_18.ChangeType) == 1)) && (local_12.GetValues()[ConfigIndex] >= local_18.ValueMax))
            {
                local_12.GetModify_Values()[ConfigIndex] = local_18.ValueMax;
                if (local_18.bValueRecoverExtremeActivateESMTrigger)
                {
                    ::FESMUtils::ActivateESMTrigger(Entity, local_18.ValueRecoverExtremeESMTrigger, 0.1f);
                    local_13 = local_36.opCall();
                    if (local_13)
                    {
                        const FC_Owner& local_42 = local_40.opCall();
                        if (local_42)
                        {
                            if (local_42.GetOwnerEntity().IsValid())
                            {
                                ::FESMUtils::ActivateESMTrigger(local_42.GetOwnerEntity(), local_18.ValueRecoverExtremeESMTrigger, 0.1f);
                            }
                        }
                    }
                }
                return true;
            }
            if (int(local_18.ChangeType) == 2 && (local_12.GetValues()[ConfigIndex] <= local_18.ValueMin))
            {
                local_12.GetModify_Values()[ConfigIndex] = local_18.ValueMin;
                if (local_18.bValueRecoverExtremeActivateESMTrigger)
                {
                    ::FESMUtils::ActivateESMTrigger(Entity, local_18.ValueRecoverExtremeESMTrigger, 0.1f);
                    local_13 = local_36.opCall();
                    if (local_13)
                    {
                        const FC_Owner& local_42_2 = local_40.opCall();
                        if (local_42_2)
                        {
                            if (local_42_2.GetOwnerEntity().IsValid())
                            {
                                ::FESMUtils::ActivateESMTrigger(local_42_2.GetOwnerEntity(), local_18.ValueRecoverExtremeESMTrigger, 0.1f);
                            }
                        }
                    }
                }
                return true;
            }
        }
        return false;
    }
    UFUNCTION()
    void Job_RecoverScalerResource0(const FECSEntity &inout Entity, const FCS_FixedTime &inout FixedTime) const
    {
        if (this.HandleRecoverScalerResource(0, Entity, FixedTime))
        {
            Remove local_6;
            local_6.opCall();
        }
        return;
    }
    UFUNCTION()
    void Job_RecoverScalerResource1(const FECSEntity &inout Entity, const FCS_FixedTime &inout FixedTime) const
    {
        if (this.HandleRecoverScalerResource(1, Entity, FixedTime))
        {
            Remove local_6;
            local_6.opCall();
        }
        return;
    }
    UFUNCTION()
    void Job_RecoverScalerResource2(const FECSEntity &inout Entity, const FCS_FixedTime &inout FixedTime) const
    {
        if (this.HandleRecoverScalerResource(2, Entity, FixedTime))
        {
            Remove local_6;
            local_6.opCall();
        }
        return;
    }
    UFUNCTION()
    void Monitor_InitScalerResource(const FC_ScalerResourceConfig &inout ScalerResourceConfig, const FECSEntity &inout Entity) const
    {
        if (ScalerResourceConfig.ScalerResourceConfigData.Num() > 0)
        {
            ModifyOrAdd local_8;
            FC_ScalerResourceRuntime& local_10 = local_8.opCall();
            if (local_10)
            {
                local_10.GetModify_Values().Empty(0);
                for (auto& local_24 : ScalerResourceConfig.ScalerResourceConfigData)
                {
                    local_10.GetModify_Values().Add(local_24.InitValue);
                }
                if (ScalerResourceConfig.ScalerResourceConfigData[0].bCanRecover)
                {
                    FC_ScalerResource0CanRecoverTag local_30;
                    Assign local_28;
                    local_28.opCall(local_30);
                }
                if (ScalerResourceConfig.ScalerResourceConfigData.Num() > 1 && ScalerResourceConfig.ScalerResourceConfigData[1].bCanRecover)
                {
                    FC_ScalerResource1CanRecoverTag local_38;
                    Assign local_36;
                    local_36.opCall(local_38);
                }
                if (ScalerResourceConfig.ScalerResourceConfigData.Num() > 2 && ScalerResourceConfig.ScalerResourceConfigData[2].bCanRecover)
                {
                    FC_ScalerResource2CanRecoverTag local_44;
                    Assign local_42;
                    local_42.opCall(local_44);
                }
            }
        }
        return;
    }
    UFUNCTION()
    void Monitor_DeinitScalerResource(const FC_ScalerResourceConfig &inout ScalerResourceConfig, const FECSEntity &inout Entity) const
    {
        if (!(Entity.IsValid()))
        {
            return;
        }
        Remove local_6;
        local_6.opCall();
        Remove local_10;
        local_10.opCall();
        Remove local_14;
        local_14.opCall();
        Remove local_18;
        local_18.opCall();
        return;
    }
    UFUNCTION()
    void Monitor_OnAssignScalerResourceTransferToOwnerTag(const FC_ScalerResourceTransferToOwner &inout ScalerResourceTransferToOwner, const FECSEntity &inout Entity) const
    {
        bool local_7;
        int local_42 = 0;
        int local_54 = 0;
        Modify local_4;
        FC_Owner& local_6 = local_4.opCall();
        if (local_6)
        {
            FC_ScalerResourceTransferToOwner& local_14 = FECSEntity::Modify<FC_ScalerResourceTransferToOwner>(Entity).opCall();
            if (local_14)
            {
                local_14.SetOwnerCacheId(local_6.GetOwnerEntityId());
            }
            FECSEntity local_20 = local_6.GetOwnerEntity();
            if (!(local_42))
            {
                local_7 = false;
            }
            else
            {
                FC_ScalerResourceConfig local_48;
                local_7 = local_48;
            }
            if (!(!(local_7)) && local_54)
            {
                TArray<FScalerResourceConfigData> local_60;
                local_42.SetValues(local_54.GetValues());
                local_42.GetModify_ConsumeExtremes().Empty(0);
                local_42.GetModify_RecoverExtremes().Empty(0);
                if (local_60.Num() > 0)
                {
                    if (int(local_60[0].ChangeType) == 0 || (int(local_60[0].ChangeType) == 1))
                    {
                    }
                    else
                    {
                    }
                    local_42.GetModify_ConsumeExtremes().Add();
                }
                if (local_60.Num() > 1)
                {
                    if (int(local_60[1].ChangeType) == 0 || (int(local_60[1].ChangeType) == 1))
                    {
                    }
                    else
                    {
                    }
                    local_42.GetModify_ConsumeExtremes().Add();
                }
                if (local_60.Num() > 2)
                {
                    if (int(local_60[2].ChangeType) == 0 || (int(local_60[2].ChangeType) == 1))
                    {
                    }
                    else
                    {
                    }
                    local_42.GetModify_ConsumeExtremes().Add();
                }
                if (local_60.Num() > 0)
                {
                    if (int(local_60[0].ChangeType) == 0 || (int(local_60[0].ChangeType) == 1))
                    {
                    }
                    else
                    {
                    }
                    local_42.GetModify_RecoverExtremes().Add();
                }
                if (local_60.Num() > 1)
                {
                    if (int(local_60[1].ChangeType) == 0 || (int(local_60[1].ChangeType) == 1))
                    {
                    }
                    else
                    {
                    }
                    local_42.GetModify_RecoverExtremes().Add();
                }
                if (local_60.Num() > 2)
                {
                    if (int(local_60[2].ChangeType) == 0 || (int(local_60[2].ChangeType) == 1))
                    {
                    }
                    else
                    {
                    }
                    local_42.GetModify_RecoverExtremes().Add();
                }
            }
            local_42.SetbInited(true);
        }
        return;
    }
    UFUNCTION()
    void Monitor_OnRemoveScalerResourceTransferToOwnerTag(const FC_ScalerResourceTransferToOwner &inout ScalerResourceTransferToOwner) const
    {
        if (FECSEntity(ScalerResourceTransferToOwner.GetOwnerCacheId()).IsValid())
        {
            Remove local_14;
            local_14.opCall();
        }
        return;
    }
    UFUNCTION()
    void Job_TransferScalerResourceValuesToOwner(const FC_Owner &inout OwnerComp, const FC_ScalerResourceRuntime &inout ScalerResourceRuntime) const
    {
        FECSEntity local_4 = OwnerComp.GetOwnerEntity();
        Modify local_8;
        FC_ScalerResourceInfoTransferredToOwner& local_10 = local_8.opCall();
        if (local_10)
        {
            local_10.SetValues(ScalerResourceRuntime.GetValues());
        }
        return;
    }
    void Monitor___JobTimer_Pre___Job_HandleScalerResourceTimer0(const FC_ScalerResourceTimer_RecoverStartDelay0 &inout TimerComp, const FECSEntity &inout Entity) const
    {
        if (!(TimerComp))
        {
            return;
        }
        FFPTime local_6 = FFPTime(TimerComp.GetTargetWorldTime());
        FName local_8 = FName("S_ScalerResourceSystem::Job_HandleScalerResourceTimer0");
        if (local_6.opCmp(0.0) >= 0 && (local_6.opCmp(FPTIME_MAX) < 0))
        {
            ECS::ScheduleJobTimer(local_8, local_6, Entity.GetId(), true);
        }
        return;
    }
    void Monitor___JobTimer_Post___Job_HandleScalerResourceTimer0(const FC_ScalerResourceTimer_RecoverStartDelay0 &inout TimerComp, const FECSEntity &inout Entity) const
    {
        if (!(TimerComp))
        {
            return;
        }
        FFPTime local_6 = FFPTime(TimerComp.GetTargetWorldTime());
        FName local_8 = FName("S_ScalerResourceSystem::Job_HandleScalerResourceTimer0");
        if (local_6.opCmp(0.0) >= 0 && (local_6.opCmp(FPTIME_MAX) < 0))
        {
            ECS::ScheduleJobTimer(local_8, local_6, Entity.GetId(), false);
        }
        return;
    }
    void Monitor___JobTimer_OnSync___Job_HandleScalerResourceTimer0(const FC_ScalerResourceTimer_RecoverStartDelay0 &inout TimerComp, const FECSEntity &inout Entity) const
    {
        if (!(TimerComp))
        {
            return;
        }
        FFPTime local_6 = FFPTime(TimerComp.GetTargetWorldTime());
        FName local_8 = FName("S_ScalerResourceSystem::Job_HandleScalerResourceTimer0");
        if (local_6.opCmp(0.0) >= 0 && (local_6.opCmp(FPTIME_MAX) < 0))
        {
            ECS::ScheduleJobTimer(local_8, local_6, Entity.GetId(), false);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor___JobTimer_Pre___Job_HandleScalerResourceTimer0() const
    {
        int local_52 = 0;
        int local_54 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_14 = ::__GetMonitorScalerResourceTimer_RecoverStartDelay0OnModifyView(this.GetECSWorld(), EECSRegType(0), true, false);
        FECSMonitorRuntimeViewIterator local_30 = local_14.Iterator();
        for (; local_30.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44 = local_30.Proceed();
            FECSEntityScopeCycleCounter local_45 = FECSEntityScopeCycleCounter(local_44.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_44);
            this.Monitor___JobTimer_Pre___Job_HandleScalerResourceTimer0(local_52, local_54);
        }
        FECSMonitorRuntimeView local_18 = ::__GetMonitorScalerResourceTimer_RecoverStartDelay0OnActiveView(this.GetECSWorld(), EECSRegType(0), true, false);
        FECSMonitorRuntimeViewIterator local_42 = local_18.Iterator();
        for (; local_42.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44_2 = local_42.Proceed();
            FECSEntityScopeCycleCounter local_45_2 = FECSEntityScopeCycleCounter(local_44_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_44_2);
            this.Monitor___JobTimer_Pre___Job_HandleScalerResourceTimer0(local_52, local_54);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor___JobTimer_Post___Job_HandleScalerResourceTimer0() const
    {
        int local_52 = 0;
        int local_54 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_14 = ::__GetMonitorScalerResourceTimer_RecoverStartDelay0OnModifyView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_30 = local_14.Iterator();
        for (; local_30.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44 = local_30.Proceed();
            FECSEntityScopeCycleCounter local_45 = FECSEntityScopeCycleCounter(local_44.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_44);
            this.Monitor___JobTimer_Post___Job_HandleScalerResourceTimer0(local_52, local_54);
        }
        FECSMonitorRuntimeView local_18 = ::__GetMonitorScalerResourceTimer_RecoverStartDelay0OnActiveView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_42 = local_18.Iterator();
        for (; local_42.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44_2 = local_42.Proceed();
            FECSEntityScopeCycleCounter local_45_2 = FECSEntityScopeCycleCounter(local_44_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_44_2);
            this.Monitor___JobTimer_Post___Job_HandleScalerResourceTimer0(local_52, local_54);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor___JobTimer_OnSync___Job_HandleScalerResourceTimer0() const
    {
        int local_52 = 0;
        int local_54 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_14 = ::__GetMonitorScalerResourceTimer_RecoverStartDelay0OnModifyView(this.GetECSWorld(), EECSRegType(0), false, false);
        FECSMonitorRuntimeViewIterator local_30 = local_14.Iterator();
        for (; local_30.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44 = local_30.Proceed();
            FECSEntityScopeCycleCounter local_45 = FECSEntityScopeCycleCounter(local_44.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_44);
            this.Monitor___JobTimer_OnSync___Job_HandleScalerResourceTimer0(local_52, local_54);
        }
        FECSMonitorRuntimeView local_18 = ::__GetMonitorScalerResourceTimer_RecoverStartDelay0OnActiveView(this.GetECSWorld(), EECSRegType(0), false, false);
        FECSMonitorRuntimeViewIterator local_42 = local_18.Iterator();
        for (; local_42.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44_2 = local_42.Proceed();
            FECSEntityScopeCycleCounter local_45_2 = FECSEntityScopeCycleCounter(local_44_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_44_2);
            this.Monitor___JobTimer_OnSync___Job_HandleScalerResourceTimer0(local_52, local_54);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_HandleScalerResourceTimer0() const
    {
        int local_6 = 0;
        bool local_34;
        int local_42 = 0;
        int local_68 = 0;
        int local_70 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        FECSWorldPtr local_8 = ECS::GetECSWorld();
        local_4.MarkIteratingExternalEntityList(true);
        const TArray<FECSEntityId>& local_14 = local_4.GetExternalEntityList();
        FECSEntity local_32;
        Has local_52;
        for (auto& local_28 : local_14)
        {
            local_28;
            FECSEntityScopeCycleCounter local_33 = FECSEntityScopeCycleCounter(local_32);
            local_34 = false;
            bool local_35 = !(false);
            if (!(local_32.IsActive()) == local_35)
            {
                continue;
            }
            if (!(local_42))
            {
                continue;
            }
            FFPTime local_44 = FFPTime(local_42.GetTargetWorldTime());
            if (local_44.opCmp(0.0) < 0 || (FFPTime(local_42.GetTargetWorldTime()) == FPTIME_MAX))
            {
                continue;
            }
            if (!(local_52.opCall()) == !(false))
            {
                FString local_56 = "Timer job error: 'FC_LocalTag' included by job but not exist on ";
                FString local_60 = local_32.ToString();
                local_34 = true;
            }
            if (local_34)
            {
                continue;
            }
            this.Job_HandleScalerResourceTimer0(local_68, local_6, local_70);
        }
        local_4.MarkIteratingExternalEntityList(false);
        ECS::ClearCurJobExternalEntityList();
        return;
    }
    void Monitor___JobTimer_Pre___Job_HandleScalerResourceTimer1(const FC_ScalerResourceTimer_RecoverStartDelay1 &inout TimerComp, const FECSEntity &inout Entity) const
    {
        if (!(TimerComp))
        {
            return;
        }
        FFPTime local_6 = FFPTime(TimerComp.GetTargetWorldTime());
        FName local_8 = FName("S_ScalerResourceSystem::Job_HandleScalerResourceTimer1");
        if (local_6.opCmp(0.0) >= 0 && (local_6.opCmp(FPTIME_MAX) < 0))
        {
            ECS::ScheduleJobTimer(local_8, local_6, Entity.GetId(), true);
        }
        return;
    }
    void Monitor___JobTimer_Post___Job_HandleScalerResourceTimer1(const FC_ScalerResourceTimer_RecoverStartDelay1 &inout TimerComp, const FECSEntity &inout Entity) const
    {
        if (!(TimerComp))
        {
            return;
        }
        FFPTime local_6 = FFPTime(TimerComp.GetTargetWorldTime());
        FName local_8 = FName("S_ScalerResourceSystem::Job_HandleScalerResourceTimer1");
        if (local_6.opCmp(0.0) >= 0 && (local_6.opCmp(FPTIME_MAX) < 0))
        {
            ECS::ScheduleJobTimer(local_8, local_6, Entity.GetId(), false);
        }
        return;
    }
    void Monitor___JobTimer_OnSync___Job_HandleScalerResourceTimer1(const FC_ScalerResourceTimer_RecoverStartDelay1 &inout TimerComp, const FECSEntity &inout Entity) const
    {
        if (!(TimerComp))
        {
            return;
        }
        FFPTime local_6 = FFPTime(TimerComp.GetTargetWorldTime());
        FName local_8 = FName("S_ScalerResourceSystem::Job_HandleScalerResourceTimer1");
        if (local_6.opCmp(0.0) >= 0 && (local_6.opCmp(FPTIME_MAX) < 0))
        {
            ECS::ScheduleJobTimer(local_8, local_6, Entity.GetId(), false);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor___JobTimer_Pre___Job_HandleScalerResourceTimer1() const
    {
        int local_52 = 0;
        int local_54 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_14 = ::__GetMonitorScalerResourceTimer_RecoverStartDelay1OnModifyView(this.GetECSWorld(), EECSRegType(0), true, false);
        FECSMonitorRuntimeViewIterator local_30 = local_14.Iterator();
        for (; local_30.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44 = local_30.Proceed();
            FECSEntityScopeCycleCounter local_45 = FECSEntityScopeCycleCounter(local_44.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_44);
            this.Monitor___JobTimer_Pre___Job_HandleScalerResourceTimer1(local_52, local_54);
        }
        FECSMonitorRuntimeView local_18 = ::__GetMonitorScalerResourceTimer_RecoverStartDelay1OnActiveView(this.GetECSWorld(), EECSRegType(0), true, false);
        FECSMonitorRuntimeViewIterator local_42 = local_18.Iterator();
        for (; local_42.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44_2 = local_42.Proceed();
            FECSEntityScopeCycleCounter local_45_2 = FECSEntityScopeCycleCounter(local_44_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_44_2);
            this.Monitor___JobTimer_Pre___Job_HandleScalerResourceTimer1(local_52, local_54);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor___JobTimer_Post___Job_HandleScalerResourceTimer1() const
    {
        int local_52 = 0;
        int local_54 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_14 = ::__GetMonitorScalerResourceTimer_RecoverStartDelay1OnModifyView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_30 = local_14.Iterator();
        for (; local_30.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44 = local_30.Proceed();
            FECSEntityScopeCycleCounter local_45 = FECSEntityScopeCycleCounter(local_44.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_44);
            this.Monitor___JobTimer_Post___Job_HandleScalerResourceTimer1(local_52, local_54);
        }
        FECSMonitorRuntimeView local_18 = ::__GetMonitorScalerResourceTimer_RecoverStartDelay1OnActiveView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_42 = local_18.Iterator();
        for (; local_42.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44_2 = local_42.Proceed();
            FECSEntityScopeCycleCounter local_45_2 = FECSEntityScopeCycleCounter(local_44_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_44_2);
            this.Monitor___JobTimer_Post___Job_HandleScalerResourceTimer1(local_52, local_54);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor___JobTimer_OnSync___Job_HandleScalerResourceTimer1() const
    {
        int local_52 = 0;
        int local_54 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_14 = ::__GetMonitorScalerResourceTimer_RecoverStartDelay1OnModifyView(this.GetECSWorld(), EECSRegType(0), false, false);
        FECSMonitorRuntimeViewIterator local_30 = local_14.Iterator();
        for (; local_30.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44 = local_30.Proceed();
            FECSEntityScopeCycleCounter local_45 = FECSEntityScopeCycleCounter(local_44.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_44);
            this.Monitor___JobTimer_OnSync___Job_HandleScalerResourceTimer1(local_52, local_54);
        }
        FECSMonitorRuntimeView local_18 = ::__GetMonitorScalerResourceTimer_RecoverStartDelay1OnActiveView(this.GetECSWorld(), EECSRegType(0), false, false);
        FECSMonitorRuntimeViewIterator local_42 = local_18.Iterator();
        for (; local_42.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44_2 = local_42.Proceed();
            FECSEntityScopeCycleCounter local_45_2 = FECSEntityScopeCycleCounter(local_44_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_44_2);
            this.Monitor___JobTimer_OnSync___Job_HandleScalerResourceTimer1(local_52, local_54);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_HandleScalerResourceTimer1() const
    {
        int local_6 = 0;
        bool local_34;
        int local_42 = 0;
        int local_68 = 0;
        int local_70 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        FECSWorldPtr local_8 = ECS::GetECSWorld();
        local_4.MarkIteratingExternalEntityList(true);
        const TArray<FECSEntityId>& local_14 = local_4.GetExternalEntityList();
        FECSEntity local_32;
        Has local_52;
        for (auto& local_28 : local_14)
        {
            local_28;
            FECSEntityScopeCycleCounter local_33 = FECSEntityScopeCycleCounter(local_32);
            local_34 = false;
            bool local_35 = !(false);
            if (!(local_32.IsActive()) == local_35)
            {
                continue;
            }
            if (!(local_42))
            {
                continue;
            }
            FFPTime local_44 = FFPTime(local_42.GetTargetWorldTime());
            if (local_44.opCmp(0.0) < 0 || (FFPTime(local_42.GetTargetWorldTime()) == FPTIME_MAX))
            {
                continue;
            }
            if (!(local_52.opCall()) == !(false))
            {
                FString local_56 = "Timer job error: 'FC_LocalTag' included by job but not exist on ";
                FString local_60 = local_32.ToString();
                local_34 = true;
            }
            if (local_34)
            {
                continue;
            }
            this.Job_HandleScalerResourceTimer1(local_68, local_6, local_70);
        }
        local_4.MarkIteratingExternalEntityList(false);
        ECS::ClearCurJobExternalEntityList();
        return;
    }
    void Monitor___JobTimer_Pre___Job_HandleScalerResourceTimer2(const FC_ScalerResourceTimer_RecoverStartDelay2 &inout TimerComp, const FECSEntity &inout Entity) const
    {
        if (!(TimerComp))
        {
            return;
        }
        FFPTime local_6 = FFPTime(TimerComp.GetTargetWorldTime());
        FName local_8 = FName("S_ScalerResourceSystem::Job_HandleScalerResourceTimer2");
        if (local_6.opCmp(0.0) >= 0 && (local_6.opCmp(FPTIME_MAX) < 0))
        {
            ECS::ScheduleJobTimer(local_8, local_6, Entity.GetId(), true);
        }
        return;
    }
    void Monitor___JobTimer_Post___Job_HandleScalerResourceTimer2(const FC_ScalerResourceTimer_RecoverStartDelay2 &inout TimerComp, const FECSEntity &inout Entity) const
    {
        if (!(TimerComp))
        {
            return;
        }
        FFPTime local_6 = FFPTime(TimerComp.GetTargetWorldTime());
        FName local_8 = FName("S_ScalerResourceSystem::Job_HandleScalerResourceTimer2");
        if (local_6.opCmp(0.0) >= 0 && (local_6.opCmp(FPTIME_MAX) < 0))
        {
            ECS::ScheduleJobTimer(local_8, local_6, Entity.GetId(), false);
        }
        return;
    }
    void Monitor___JobTimer_OnSync___Job_HandleScalerResourceTimer2(const FC_ScalerResourceTimer_RecoverStartDelay2 &inout TimerComp, const FECSEntity &inout Entity) const
    {
        if (!(TimerComp))
        {
            return;
        }
        FFPTime local_6 = FFPTime(TimerComp.GetTargetWorldTime());
        FName local_8 = FName("S_ScalerResourceSystem::Job_HandleScalerResourceTimer2");
        if (local_6.opCmp(0.0) >= 0 && (local_6.opCmp(FPTIME_MAX) < 0))
        {
            ECS::ScheduleJobTimer(local_8, local_6, Entity.GetId(), false);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor___JobTimer_Pre___Job_HandleScalerResourceTimer2() const
    {
        int local_52 = 0;
        int local_54 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_14 = ::__GetMonitorScalerResourceTimer_RecoverStartDelay2OnModifyView(this.GetECSWorld(), EECSRegType(0), true, false);
        FECSMonitorRuntimeViewIterator local_30 = local_14.Iterator();
        for (; local_30.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44 = local_30.Proceed();
            FECSEntityScopeCycleCounter local_45 = FECSEntityScopeCycleCounter(local_44.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_44);
            this.Monitor___JobTimer_Pre___Job_HandleScalerResourceTimer2(local_52, local_54);
        }
        FECSMonitorRuntimeView local_18 = ::__GetMonitorScalerResourceTimer_RecoverStartDelay2OnActiveView(this.GetECSWorld(), EECSRegType(0), true, false);
        FECSMonitorRuntimeViewIterator local_42 = local_18.Iterator();
        for (; local_42.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44_2 = local_42.Proceed();
            FECSEntityScopeCycleCounter local_45_2 = FECSEntityScopeCycleCounter(local_44_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_44_2);
            this.Monitor___JobTimer_Pre___Job_HandleScalerResourceTimer2(local_52, local_54);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor___JobTimer_Post___Job_HandleScalerResourceTimer2() const
    {
        int local_52 = 0;
        int local_54 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_14 = ::__GetMonitorScalerResourceTimer_RecoverStartDelay2OnModifyView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_30 = local_14.Iterator();
        for (; local_30.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44 = local_30.Proceed();
            FECSEntityScopeCycleCounter local_45 = FECSEntityScopeCycleCounter(local_44.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_44);
            this.Monitor___JobTimer_Post___Job_HandleScalerResourceTimer2(local_52, local_54);
        }
        FECSMonitorRuntimeView local_18 = ::__GetMonitorScalerResourceTimer_RecoverStartDelay2OnActiveView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_42 = local_18.Iterator();
        for (; local_42.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44_2 = local_42.Proceed();
            FECSEntityScopeCycleCounter local_45_2 = FECSEntityScopeCycleCounter(local_44_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_44_2);
            this.Monitor___JobTimer_Post___Job_HandleScalerResourceTimer2(local_52, local_54);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor___JobTimer_OnSync___Job_HandleScalerResourceTimer2() const
    {
        int local_52 = 0;
        int local_54 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_14 = ::__GetMonitorScalerResourceTimer_RecoverStartDelay2OnModifyView(this.GetECSWorld(), EECSRegType(0), false, false);
        FECSMonitorRuntimeViewIterator local_30 = local_14.Iterator();
        for (; local_30.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44 = local_30.Proceed();
            FECSEntityScopeCycleCounter local_45 = FECSEntityScopeCycleCounter(local_44.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_44);
            this.Monitor___JobTimer_OnSync___Job_HandleScalerResourceTimer2(local_52, local_54);
        }
        FECSMonitorRuntimeView local_18 = ::__GetMonitorScalerResourceTimer_RecoverStartDelay2OnActiveView(this.GetECSWorld(), EECSRegType(0), false, false);
        FECSMonitorRuntimeViewIterator local_42 = local_18.Iterator();
        for (; local_42.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44_2 = local_42.Proceed();
            FECSEntityScopeCycleCounter local_45_2 = FECSEntityScopeCycleCounter(local_44_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_44_2);
            this.Monitor___JobTimer_OnSync___Job_HandleScalerResourceTimer2(local_52, local_54);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_HandleScalerResourceTimer2() const
    {
        int local_6 = 0;
        bool local_34;
        int local_42 = 0;
        int local_68 = 0;
        int local_70 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        FECSWorldPtr local_8 = ECS::GetECSWorld();
        local_4.MarkIteratingExternalEntityList(true);
        const TArray<FECSEntityId>& local_14 = local_4.GetExternalEntityList();
        FECSEntity local_32;
        Has local_52;
        for (auto& local_28 : local_14)
        {
            local_28;
            FECSEntityScopeCycleCounter local_33 = FECSEntityScopeCycleCounter(local_32);
            local_34 = false;
            bool local_35 = !(false);
            if (!(local_32.IsActive()) == local_35)
            {
                continue;
            }
            if (!(local_42))
            {
                continue;
            }
            FFPTime local_44 = FFPTime(local_42.GetTargetWorldTime());
            if (local_44.opCmp(0.0) < 0 || (FFPTime(local_42.GetTargetWorldTime()) == FPTIME_MAX))
            {
                continue;
            }
            if (!(local_52.opCall()) == !(false))
            {
                FString local_56 = "Timer job error: 'FC_LocalTag' included by job but not exist on ";
                FString local_60 = local_32.ToString();
                local_34 = true;
            }
            if (local_34)
            {
                continue;
            }
            this.Job_HandleScalerResourceTimer2(local_68, local_6, local_70);
        }
        local_4.MarkIteratingExternalEntityList(false);
        ECS::ClearCurJobExternalEntityList();
        return;
    }
    UFUNCTION()
    void Run_Job_CheckAndClearCurrentFixedTickChangedBitMask0() const
    {
        int local_6 = 0;
        const FECSEntity& local_40;
        int local_42 = 0;
        int local_48 = 0;
        int local_188 = 0;
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
                this.Job_CheckAndClearCurrentFixedTickChangedBitMask0(local_40, local_6, local_42, local_48);
                FECSEntity::MarkModifiedIfDirty<FC_ScalerResourceRuntime> local_56;
                local_56.opCall(local_48);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_94 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_98;
        local_98.opCall();
        Include local_102;
        local_102.opCall();
        Include local_106;
        local_106.opCall();
        Include local_110;
        local_110.opCall();
        Exclude(local_94).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_116 = 0;
        FECSRuntimeViewIterator local_150 = local_94.Iterator();
        for (; local_150.CanProceed;)
        {
            local_40 = local_150.Proceed();
            ++local_116;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.Job_CheckAndClearCurrentFixedTickChangedBitMask0(local_188, local_6, local_42, local_48);
            FECSEntity::MarkModifiedIfDirty<FC_ScalerResourceRuntime>(local_40).opCall(local_48);
        }
        local_4.UpdateCachedEntityCount(local_116);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_CheckAndClearCurrentFixedTickChangedBitMask1() const
    {
        int local_6 = 0;
        const FECSEntity& local_40;
        int local_42 = 0;
        int local_48 = 0;
        int local_188 = 0;
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
                this.Job_CheckAndClearCurrentFixedTickChangedBitMask1(local_40, local_6, local_42, local_48);
                FECSEntity::MarkModifiedIfDirty<FC_ScalerResourceRuntime> local_56;
                local_56.opCall(local_48);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_94 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_98;
        local_98.opCall();
        Include local_102;
        local_102.opCall();
        Include local_106;
        local_106.opCall();
        Include local_110;
        local_110.opCall();
        Exclude(local_94).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_116 = 0;
        FECSRuntimeViewIterator local_150 = local_94.Iterator();
        for (; local_150.CanProceed;)
        {
            local_40 = local_150.Proceed();
            ++local_116;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.Job_CheckAndClearCurrentFixedTickChangedBitMask1(local_188, local_6, local_42, local_48);
            FECSEntity::MarkModifiedIfDirty<FC_ScalerResourceRuntime>(local_40).opCall(local_48);
        }
        local_4.UpdateCachedEntityCount(local_116);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_CheckAndClearCurrentFixedTickChangedBitMask2() const
    {
        int local_6 = 0;
        const FECSEntity& local_40;
        int local_42 = 0;
        int local_48 = 0;
        int local_188 = 0;
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
                this.Job_CheckAndClearCurrentFixedTickChangedBitMask2(local_40, local_6, local_42, local_48);
                FECSEntity::MarkModifiedIfDirty<FC_ScalerResourceRuntime> local_56;
                local_56.opCall(local_48);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_94 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_98;
        local_98.opCall();
        Include local_102;
        local_102.opCall();
        Include local_106;
        local_106.opCall();
        Include local_110;
        local_110.opCall();
        Exclude(local_94).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_116 = 0;
        FECSRuntimeViewIterator local_150 = local_94.Iterator();
        for (; local_150.CanProceed;)
        {
            local_40 = local_150.Proceed();
            ++local_116;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.Job_CheckAndClearCurrentFixedTickChangedBitMask2(local_188, local_6, local_42, local_48);
            FECSEntity::MarkModifiedIfDirty<FC_ScalerResourceRuntime>(local_40).opCall(local_48);
        }
        local_4.UpdateCachedEntityCount(local_116);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_RecoverScalerResource0() const
    {
        int local_6 = 0;
        const FECSEntity& local_40;
        int local_168 = 0;
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
                this.Job_RecoverScalerResource0(local_40, local_6);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_78 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_82;
        local_82.opCall();
        Include local_86;
        local_86.opCall();
        Include local_90;
        local_90.opCall();
        Exclude(local_78).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_96 = 0;
        FECSRuntimeViewIterator local_130 = local_78.Iterator();
        for (; local_130.CanProceed;)
        {
            local_40 = local_130.Proceed();
            ++local_96;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.Job_RecoverScalerResource0(local_168, local_6);
        }
        local_4.UpdateCachedEntityCount(local_96);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_RecoverScalerResource1() const
    {
        int local_6 = 0;
        const FECSEntity& local_40;
        int local_168 = 0;
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
                this.Job_RecoverScalerResource1(local_40, local_6);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_78 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_82;
        local_82.opCall();
        Include local_86;
        local_86.opCall();
        Include local_90;
        local_90.opCall();
        Exclude(local_78).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_96 = 0;
        FECSRuntimeViewIterator local_130 = local_78.Iterator();
        for (; local_130.CanProceed;)
        {
            local_40 = local_130.Proceed();
            ++local_96;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.Job_RecoverScalerResource1(local_168, local_6);
        }
        local_4.UpdateCachedEntityCount(local_96);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_RecoverScalerResource2() const
    {
        int local_6 = 0;
        const FECSEntity& local_40;
        int local_168 = 0;
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
                this.Job_RecoverScalerResource2(local_40, local_6);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_78 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_82;
        local_82.opCall();
        Include local_86;
        local_86.opCall();
        Include local_90;
        local_90.opCall();
        Exclude(local_78).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_96 = 0;
        FECSRuntimeViewIterator local_130 = local_78.Iterator();
        for (; local_130.CanProceed;)
        {
            local_40 = local_130.Proceed();
            ++local_96;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.Job_RecoverScalerResource2(local_168, local_6);
        }
        local_4.UpdateCachedEntityCount(local_96);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_InitScalerResource() const
    {
        int local_50 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorScalerResourceConfigOnAssignView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_48 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_InitScalerResource(local_50, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_DeinitScalerResource() const
    {
        int local_50 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorScalerResourceConfigOnRemoveView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_48 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_DeinitScalerResource(local_50, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_OnAssignScalerResourceTransferToOwnerTag() const
    {
        int local_50 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorScalerResourceTransferToOwnerOnAssignView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_48 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_OnAssignScalerResourceTransferToOwnerTag(local_50, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_OnRemoveScalerResourceTransferToOwnerTag() const
    {
        int local_50 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorScalerResourceTransferToOwnerOnRemoveView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_48 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_OnRemoveScalerResourceTransferToOwnerTag(local_50);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_TransferScalerResourceValuesToOwner() const
    {
        int local_36 = 0;
        int local_42 = 0;
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
                this.Job_TransferScalerResourceValuesToOwner(local_36, local_42);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_84 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_88;
        local_88.opCall();
        Include local_92;
        local_92.opCall();
        Include local_96;
        local_96.opCall();
        Include local_100;
        local_100.opCall();
        Exclude(local_84).opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_106 = 0;
        FECSRuntimeViewIterator local_140 = local_84.Iterator();
        for (; local_140.CanProceed;)
        {
            const FECSEntity& local_176 = local_140.Proceed();
            ++local_106;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_176.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_176);
            this.Job_TransferScalerResourceValuesToOwner(local_36, local_42);
        }
        local_2.UpdateCachedEntityCount(local_106);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
}

