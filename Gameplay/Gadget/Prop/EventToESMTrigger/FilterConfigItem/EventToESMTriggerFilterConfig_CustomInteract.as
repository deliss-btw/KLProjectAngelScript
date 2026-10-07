
enum ECustomInteractFilterType
{
    Source,
    Target,
    SourceAndTarget,
}


struct FEventToESMTriggerFilterConfigItem_CustomInteract : FEventToESMTriggerFilterConfigItemBase
{
    FEventToESMTriggerFilterConfigItemBase _base_FEventToESMTriggerFilterConfigItemBase;
    UPROPERTY()
    ECustomInteractFilterType FilterType = ECustomInteractFilterType(1);
    UPROPERTY()
    TArray<FESMBlackboardCondition> ConditionsForSource;
    UPROPERTY()
    TArray<FESMBlackboardCondition> ConditionsForTarget;
    UPROPERTY()
    bool bCheckCustomEventName = false;
    UPROPERTY()
    FName CustomEventName = NAME_None;


    bool ShouldEvaluateSource() const
    {
        return (int(this.FilterType) == 0 || (int(this.FilterType) == 2));
    }
    bool ShouldEvaluateTarget() const
    {
        return (int(this.FilterType) == 1 || (int(this.FilterType) == 2));
    }
    bool EvaluateAndTrigger(const FCE_OnAbilityCustomInteract &inout Event, const FECSEntity &inout Entity) const
    {
        bool local_20;
        bool local_1 = true;
        if (this.ShouldEvaluateSource())
        {
            for (auto& local_16 : this.ConditionsForSource)
            {
                local_1 = local_1 && FEventToESMTriggerFilterUtils::EvaluateBlackboardCondition(local_16, Event.Sender);
                if (!(local_1))
                {
                    break;
                }
            }
        }
        if (local_1 && this.ShouldEvaluateTarget())
        {
            for (auto& local_16 : this.ConditionsForTarget)
            {
                local_1 = local_1 && FEventToESMTriggerFilterUtils::EvaluateBlackboardCondition(local_16, Event.InteractTarget);
                if (!(local_1))
                {
                    break;
                }
            }
        }
        if (local_1 && this.bCheckCustomEventName)
        {
            local_1 = local_1 && (Event.CustomEventName == this.CustomEventName);
        }
        if (this._base_FEventToESMTriggerFilterConfigItemBase)
        {
            local_20 = !(local_1);
        }
        else
        {
            local_20 = local_1;
        }
        local_1 = local_20;
        if (local_1)
        {
            ModifyOrAdd local_24;
            FC_EventToESMTriggerFilterContext& local_26 = local_24.opCall();
            if (local_26)
            {
                local_26.SetCustomInteract_InteractSource(Event.Sender);
                local_26.SetCustomInteract_CustomEventName(Event.CustomEventName);
            }
            if (this.bActivateESMTriggerIfConditionMet)
            {
                if (this.bSuccessClearAllTriggers)
                {
                    FESMTriggerUtils::ClearAllESMTriggers(Entity);
                }
                else
                {
                    for (auto& local_40 : this.SuccessClearTriggerNames)
                    {
                        FESMTriggerUtils::ClearESMTrigger(Entity, local_40.Name);
                    }
                }
                FESMTriggerUtils::ActivateESMTrigger(Entity, this.SuccessTriggerName.Name, ECS::GetContextTime(), FFPTime(this.ValidTime), 0);
            }
        }
        return local_1;
    }
}

