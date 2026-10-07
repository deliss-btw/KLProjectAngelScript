
enum EPropMovementHitSceneEventFilterType
{
    Self,
    HitEntity,
    SelfAndHitEntity,
}


struct FEventToESMTriggerFilterConfigItem_PropMovementHitSceneEvent : FEventToESMTriggerFilterConfigItemBase
{
    FEventToESMTriggerFilterConfigItemBase _base_FEventToESMTriggerFilterConfigItemBase;
    UPROPERTY()
    EPropMovementHitSceneEventFilterType FilterType = EPropMovementHitSceneEventFilterType(1);
    UPROPERTY()
    TArray<FESMBlackboardCondition> ConditionsForSelf;
    UPROPERTY()
    TArray<FESMBlackboardCondition> ConditionsForHitEntity;


    bool ShouldEvaluateSelf() const
    {
        return (int(this.FilterType) == 0 || (int(this.FilterType) == 2));
    }
    bool ShouldEvaluateHitEntity() const
    {
        return (int(this.FilterType) == 1 || (int(this.FilterType) == 2));
    }
    bool EvaluateAndTrigger(const FHitResult &inout HitResult, const FECSEntity &inout Entity) const
    {
        bool local_24;
        bool local_1 = true;
        if (this.ShouldEvaluateSelf())
        {
            for (auto& local_16 : this.ConditionsForSelf)
            {
                local_1 = local_1 && FEventToESMTriggerFilterUtils::EvaluateBlackboardCondition(local_16, Entity);
                if (!(local_1))
                {
                    break;
                }
            }
        }
        if (local_1 && this.ShouldEvaluateHitEntity())
        {
            for (auto& local_16 : this.ConditionsForHitEntity)
            {
                local_1 = local_1 && FEventToESMTriggerFilterUtils::EvaluateBlackboardCondition(local_16, FECSEntity(int(HitResult.ECSEntityId)));
                if (!(local_1))
                {
                    break;
                }
            }
        }
        if (this._base_FEventToESMTriggerFilterConfigItemBase)
        {
            local_24 = !(local_1);
        }
        else
        {
            local_24 = local_1;
        }
        local_1 = local_24;
        if (local_1)
        {
            ModifyOrAdd local_28;
            FC_EventToESMTriggerFilterContext& local_30 = local_28.opCall();
            if (local_30)
            {
                local_30.SetPropMovementHitScene_HitEntity(FECSEntity(int(HitResult.ECSEntityId)));
                local_30.SetPropMovementHitScene_ImpactPoint(HitResult.ImpactPoint);
            }
            if (this.bActivateESMTriggerIfConditionMet)
            {
                if (this.bSuccessClearAllTriggers)
                {
                    FESMTriggerUtils::ClearAllESMTriggers(Entity);
                }
                else
                {
                    for (auto& local_44 : this.SuccessClearTriggerNames)
                    {
                        FESMTriggerUtils::ClearESMTrigger(Entity, local_44.Name);
                    }
                }
                FESMTriggerUtils::ActivateESMTrigger(Entity, this.SuccessTriggerName.Name, ECS::GetContextTime(), FFPTime(this.ValidTime), 0);
            }
        }
        return local_1;
    }
}

