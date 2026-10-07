

class US_LocalConditionPlayerStats : UECSScriptSystem
{
    US_LocalConditionPlayerStats()
    {
        return;
    }
    UFUNCTION()
    void ServerJob_HandlePlayerStatsUpdatedEvent(const FCE_CommissionPlayerStatsUpdatedEvent &inout Event, FCS_PlayerStatsConditionManager &inout PlayerStatsConditionManager) const
    {
        Get local_4;
        int local_6 = 0;
        if (!(local_6))
        {
            return;
        }
        ECommissionPlayerStatsType local_8 = Event.PlayerStatsType;
        TMap<ECommissionPlayerStatsType, FPlayerStatsMonitorConditions> local_12 = PlayerStatsConditionManager.MonitoredStats;
        CastTo local_56;
        if (local_12.Contains(local_8))
        {
            TArray<FConditionInstanceHandle> local_14;
            for (auto& local_28 : local_14)
            {
                if (::ConditionUtils::IsReached(local_28))
                {
                    continue;
                }
                TDataObjectPtr<FConditionConfigBase> local_52 = local_28.GetConditionConfig();
                if (local_56.opCall())
                {
                    FInstancedStruct::GetPtr local_108;
                    TConstRawPtr<FConditionPlayerStatsConfig> local_110 = local_108.opCall();
                    if (local_110)
                    {
                        int local_114;
                        local_114 = ::ConditionUtils::GetCurrentValue(local_28);
                        const FLocalConditionInstanceData& local_116 = ::ConditionUtils_Internal::FindLocalConditionInstanceData(local_28.GetLocalConditionInstanceID());
                        if (local_116.IsValid())
                        {
                            const FECSEntity& local_118 = local_116.GetContextEntity();
                            switch (int(local_110.opArrow().PlayerStatsCountType))
                            {
                            case 0:
                            {
                                if ((FECSEntity(Event.Sender) == local_118))
                                {
                                    local_114 = local_6.GetPlayerStatsValue(ECommissionPlayerStatsType(local_8));
                                }
                                break;
                            }
                            case 1:
                            {
                                    Get local_128;
                                if (local_128.opCall())
                                {
                                        GetDefaulted local_134;
                                    local_114 = 0;
                                    for (auto& local_148 : local_134.opCall().GetMembers())
                                    {
                                        local_148;
                                        const FC_CommissionPlayerStats& local_150 = local_4.opCall();
                                        if (local_150)
                                        {
                                            local_114 = local_114 + local_150.GetPlayerStatsValue(ECommissionPlayerStatsType(local_8));
                                        }
                                    }
                                }
                                else
                                {
                                    local_114 = local_6.GetPlayerStatsValue(ECommissionPlayerStatsType(local_8));
                                }
                                break;
                            }
                            case 2:
                            {
                                    TArray<FECSEntity> local_154;
                                local_114 = 0;
                                local_154 = FGameUtils::GetAllPlayerControllerEntities(true);
                                for (auto& local_172 : local_154)
                                {
                                    local_172;
                                    const FC_CommissionPlayerStats& local_150_2 = local_4.opCall();
                                    if (local_150_2)
                                    {
                                        local_114 = local_114 + local_150_2.GetPlayerStatsValue(ECommissionPlayerStatsType(local_8));
                                    }
                                }
                                break;
                            }
                            }
                        }
                        ::ConditionUtils::SetLocalConditionValueForInstance(local_28, local_114);
                    }
                }
            }
        }
        return;
    }
    bool IsReachedCondition(const int CurrentValue, const int TargetValue, const ECondCmpType CompareType) const
    {
        switch (int(CompareType))
        {
        case 3:
        {
            return (CurrentValue > TargetValue);
        }
        case 4:
        {
            return (CurrentValue >= TargetValue);
        }
        case 5:
        {
            return (CurrentValue < TargetValue);
        }
        case 6:
        {
            return (CurrentValue <= TargetValue);
        }
        case 7:
        {
            return (CurrentValue == TargetValue);
        }
        case 8:
        {
            return (CurrentValue != TargetValue);
        }
        }
        return false;
    }
    UFUNCTION()
    void Run_ServerJob_HandlePlayerStatsUpdatedEvent() const
    {
        int local_12 = 0;
        ECS::GetContextJob();
        FECSWorldPtr local_4 = this.GetECSWorld();
        Has local_8;
        if (!(local_8.opCall()))
        {
            return;
        }
        FECSWorldPtr local_4_2 = this.GetECSWorld();
        TECSEventConstIterator<FCE_CommissionPlayerStatsUpdatedEvent> local_48 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_48.CanProceed;)
        {
            const FCE_CommissionPlayerStatsUpdatedEvent& local_70 = local_48.Proceed();
            FECSEntityScopeCycleCounter local_71 = FECSEntityScopeCycleCounter(local_70.Sender);
            ECSInternal::PushContextTime(local_70.GetHandleTime());
            this.ServerJob_HandlePlayerStatsUpdatedEvent(local_70, local_12);
            ECSInternal::PopContextTime();
        }
        FECSWorldPtr local_4_3 = this.GetECSWorld();
        MarkModifiedIfDirty local_78;
        local_78.opCall(local_12);
        return;
    }
}

