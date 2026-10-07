
enum EBeginOverlapFilterType
{
    Self,
    OverlappingEntity,
    SelfAndOverlappingEntity,
}


struct FEventToESMTriggerFilterConfigItem_BeginOverlap : FEventToESMTriggerFilterConfigItemBase
{
    FEventToESMTriggerFilterConfigItemBase _base_FEventToESMTriggerFilterConfigItemBase;
    UPROPERTY()
    EBeginOverlapFilterType FilterType = EBeginOverlapFilterType(1);
    UPROPERTY()
    TArray<FESMBlackboardCondition> ConditionsForSelf;
    UPROPERTY()
    TArray<FESMBlackboardCondition> ConditionsForOverlappingEntity;


    bool ShouldEvaluateSelf() const
    {
        return (int(this.FilterType) == 0 || (int(this.FilterType) == 2));
    }
    bool ShouldEvaluateOverlappingEntity() const
    {
        return (int(this.FilterType) == 1 || (int(this.FilterType) == 2));
    }
    bool EvaluateAndTrigger(const FCE_BeginOverlap &inout Event, const FECSEntity &inout Entity) const
    {
        bool local_18;
        bool local_1 = true;
        if (this.ShouldEvaluateSelf())
        {
            for (auto& local_16 : this.ConditionsForSelf)
            {
                local_1 = local_1 && FEventToESMTriggerFilterUtils::EvaluateBlackboardCondition(local_16, Event.Sender);
                if (!(local_1))
                {
                    break;
                }
            }
        }
        if (local_1 && this.ShouldEvaluateOverlappingEntity())
        {
            for (auto& local_16 : this.ConditionsForOverlappingEntity)
            {
                local_1 = local_1 && FEventToESMTriggerFilterUtils::EvaluateBlackboardCondition(local_16, Event.OverlappingEntity);
                if (!(local_1))
                {
                    break;
                }
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
            ModifyOrAdd local_22;
            FC_EventToESMTriggerFilterContext& local_24 = local_22.opCall();
            if (local_24)
            {
                local_24.SetBeginOverlap_OverlappingEntity(Event.OverlappingEntity);
            }
            if (this.bActivateESMTriggerIfConditionMet)
            {
                if (this.bSuccessClearAllTriggers)
                {
                    FESMTriggerUtils::ClearAllESMTriggers(Entity);
                }
                else
                {
                    for (auto& local_38 : this.SuccessClearTriggerNames)
                    {
                        FESMTriggerUtils::ClearESMTrigger(Entity, local_38.Name);
                    }
                }
                FESMTriggerUtils::ActivateESMTrigger(Entity, this.SuccessTriggerName.Name, ECS::GetContextTime(), FFPTime(this.ValidTime), 0);
            }
        }
        return local_1;
    }
}

