

struct FEventToESMTriggerFilterConfigItem_DeathEvent : FEventToESMTriggerFilterConfigItemBase
{
    FEventToESMTriggerFilterConfigItemBase _base_FEventToESMTriggerFilterConfigItemBase;
    UPROPERTY()
    TArray<FESMBlackboardCondition> ConditionsForSelf;

    FEventToESMTriggerFilterConfigItem_DeathEvent()
    {
        super();
        return;
    }
    bool EvaluateAndTrigger(const FCE_DeathEvent &inout Event, const FECSEntity &inout Entity) const
    {
        bool local_18;
        bool local_1 = true;
        for (auto& local_16 : this.ConditionsForSelf)
        {
            local_1 = local_1 && FEventToESMTriggerFilterUtils::EvaluateBlackboardCondition(local_16, Event.Sender);
            if (!(local_1))
            {
                break;
            }
        }
        if (this._base_FEventToESMTriggerFilterConfigItemBase)
        {
            local_18 = !(local_1);
        }
        else
        {
            local_18 = local_1;
        }
        local_1 = local_18;
        if (local_1)
        {
            if (this.bActivateESMTriggerIfConditionMet)
            {
                if (this.bSuccessClearAllTriggers)
                {
                    FESMTriggerUtils::ClearAllESMTriggers(Entity);
                }
                else
                {
                    for (auto& local_32 : this.SuccessClearTriggerNames)
                    {
                        FESMTriggerUtils::ClearESMTrigger(Entity, local_32.Name);
                    }
                }
                FESMTriggerUtils::ActivateESMTrigger(Entity, this.SuccessTriggerName.Name, ECS::GetContextTime(), FFPTime(this.ValidTime), 0);
            }
        }
        return local_1;
    }
}

