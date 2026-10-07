

struct FEventToESMTriggerFilterConfigItem_MovementEnd : FEventToESMTriggerFilterConfigItemBase
{
    FEventToESMTriggerFilterConfigItemBase _base_FEventToESMTriggerFilterConfigItemBase;
    UPROPERTY()
    TArray<FESMBlackboardCondition> ConditionsForSelf;
    UPROPERTY()
    bool bUseSignalName = true;
    UPROPERTY()
    FName SignalName;


    bool EvaluateAndTrigger(const FName &inout InSignalName, const FECSEntity &inout Entity) const
    {
        bool local_20;
        bool local_1 = true;
        for (auto& local_16 : this.ConditionsForSelf)
        {
            local_1 = local_1 && FEventToESMTriggerFilterUtils::EvaluateBlackboardCondition(local_16, Entity);
            if (!(local_1))
            {
                break;
            }
        }
        if (local_1)
        {
            local_1 = local_1 && (!(this.bUseSignalName) || (this.SignalName == InSignalName));
        }
        if (this._base_FEventToESMTriggerFilterConfigItemBase)
        {
            local_20 = !(local_1);
        }
        else
        {
            local_20 = local_1;
        }
        bool local_1_2 = local_20;
        if (local_1_2)
        {
            if (this.bActivateESMTriggerIfConditionMet)
            {
                if (this.bSuccessClearAllTriggers)
                {
                    FESMTriggerUtils::ClearAllESMTriggers(Entity);
                }
                else
                {
                    for (auto& local_34 : this.SuccessClearTriggerNames)
                    {
                        FESMTriggerUtils::ClearESMTrigger(Entity, local_34.Name);
                    }
                }
                FESMTriggerUtils::ActivateESMTrigger(Entity, this.SuccessTriggerName.Name, ECS::GetContextTime(), FFPTime(this.ValidTime), 0);
            }
        }
        return local_1_2;
    }
}

