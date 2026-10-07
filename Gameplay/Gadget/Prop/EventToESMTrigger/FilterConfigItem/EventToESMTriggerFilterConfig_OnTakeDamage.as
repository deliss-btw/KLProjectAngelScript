
enum EOnTakeDamageFilterType
{
    Self,
    Causer,
    DirectDamageCauser,
    SelfAndCauser,
    SelfAndDirectDamageCauser,
}


struct FEventToESMTriggerFilterConfigItem_OnTakeDamage : FEventToESMTriggerFilterConfigItemBase
{
    FEventToESMTriggerFilterConfigItemBase _base_FEventToESMTriggerFilterConfigItemBase;
    UPROPERTY()
    EOnTakeDamageFilterType FilterType = EOnTakeDamageFilterType(1);
    UPROPERTY()
    TArray<FESMBlackboardCondition> ConditionsForSelf;
    UPROPERTY()
    TArray<FESMBlackboardCondition> ConditionsForCauser;
    UPROPERTY()
    TArray<FESMBlackboardCondition> ConditionsForDirectDamageCauser;
    UPROPERTY()
    bool bFilterAttackType = false;
    UPROPERTY()
    int AttackTypesToFilter = 0;


    bool ShouldEvaluateSelf() const
    {
        return (int(this.FilterType) == 0 || (int(this.FilterType) == 3) || (int(this.FilterType) == 4));
    }
    bool ShouldEvaluateCauser() const
    {
        return (int(this.FilterType) == 1 || (int(this.FilterType) == 3));
    }
    bool ShouldEvaluateDirectDamageCauser() const
    {
        return (int(this.FilterType) == 2 || (int(this.FilterType) == 4));
    }
    bool FilterAttackType(const EAttackType AttackType) const
    {
        int local_1 = this.AttackTypesToFilter & (1 << int(AttackType));
        return (local_1 != 0);
    }
    bool EvaluateAndTrigger(const FCE_DamageEvent &inout Event, const FECSEntity &inout Entity) const
    {
        int local_18 = 0;
        bool local_19;
        bool local_1 = true;
        if (this.ShouldEvaluateSelf())
        {
            for (auto& local_16 : this.ConditionsForSelf)
            {
                local_1 = local_1 && FEventToESMTriggerFilterUtils::EvaluateBlackboardCondition(local_16, Event.Receiver);
                if (!(local_1))
                {
                    break;
                }
            }
        }
        if (local_1 && this.ShouldEvaluateCauser())
        {
            for (auto& local_16 : this.ConditionsForCauser)
            {
                local_1 = local_1 && FEventToESMTriggerFilterUtils::EvaluateBlackboardCondition(local_16, Event.FinalDamageSource);
                if (!(local_1))
                {
                    break;
                }
            }
        }
        if (local_1 && this.ShouldEvaluateDirectDamageCauser())
        {
            for (auto& local_16 : this.ConditionsForDirectDamageCauser)
            {
                local_1 = local_1 && FEventToESMTriggerFilterUtils::EvaluateBlackboardCondition(local_16, Event.DirectDamageCauser);
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
        bool local_2 = this._base_FEventToESMTriggerFilterConfigItemBase;
        if (local_2)
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
                local_26.SetOnTakeDamage_Causer(Event.FinalDamageSource);
                local_26.SetOnTakeDamage_DirectDamageCauser(Event.DirectDamageCauser);
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

