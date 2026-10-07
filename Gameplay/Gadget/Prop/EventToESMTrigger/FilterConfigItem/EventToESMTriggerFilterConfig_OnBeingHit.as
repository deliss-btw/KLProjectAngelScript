
enum EOnBeingHitFilterType
{
    Attacker,
    Receiver,
    AttackerAndReceiver,
}


struct FEventToESMTriggerFilterConfigItem_OnBeingHit : FEventToESMTriggerFilterConfigItemBase
{
    FEventToESMTriggerFilterConfigItemBase _base_FEventToESMTriggerFilterConfigItemBase;
    UPROPERTY()
    EOnBeingHitFilterType FilterType = EOnBeingHitFilterType(0);
    UPROPERTY()
    TArray<FESMBlackboardCondition> ConditionsForAttacker;
    UPROPERTY()
    TArray<FESMBlackboardCondition> ConditionsForReceiver;
    UPROPERTY()
    bool bFilterAttackType = false;
    UPROPERTY()
    int AttackTypesToFilter = 0;


    bool ShouldEvaluateAttacker() const
    {
        return (int(this.FilterType) == 0 || (int(this.FilterType) == 2));
    }
    bool ShouldEvaluateReceiver() const
    {
        return (int(this.FilterType) == 1 || (int(this.FilterType) == 2));
    }
    bool FilterAttackType(const EAttackType AttackType) const
    {
        int local_1 = this.AttackTypesToFilter & (1 << int(AttackType));
        return (local_1 != 0);
    }
    bool EvaluateAndTrigger(const FCE_HitEvent &inout Event, const FECSEntity &inout Entity) const
    {
        int local_18 = 0;
        bool local_19;
        bool local_1 = true;
        if (this.ShouldEvaluateAttacker())
        {
            for (auto& local_16 : this.ConditionsForAttacker)
            {
                local_1 = local_1 && FEventToESMTriggerFilterUtils::EvaluateBlackboardCondition(local_16, Event.Attacker);
                if (!(local_1))
                {
                    break;
                }
            }
        }
        if (local_1 && this.ShouldEvaluateReceiver())
        {
            for (auto& local_16 : this.ConditionsForReceiver)
            {
                local_1 = local_1 && FEventToESMTriggerFilterUtils::EvaluateBlackboardCondition(local_16, Event.Receiver);
                if (!(local_1))
                {
                    break;
                }
            }
        }
        if (local_1 && this.bFilterAttackType)
        {
            if (Event.AttackData.IsSet())
            {
                local_1 = local_1 && this.FilterAttackType(EAttackType(local_18));
            }
        }
        bool local_17 = this._base_FEventToESMTriggerFilterConfigItemBase;
        if (local_17)
        {
            local_19 = !(local_1);
        }
        else
        {
            local_19 = local_1;
        }
        local_1 = local_19;
        if (local_1)
        {
            ModifyOrAdd local_24;
            FC_EventToESMTriggerFilterContext& local_26 = local_24.opCall();
            if (local_26)
            {
                local_26.SetOnBeingHit_Attacker(Event.Attacker);
                local_26.SetOnBeingHit_Receiver(Event.Receiver);
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

