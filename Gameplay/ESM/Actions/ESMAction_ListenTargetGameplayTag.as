

class UESMAction_ListenTargetGameplayTag : UESMBPBaseSpanTickAction
{
    UPROPERTY()
    FNameHandle_EntityBBVarEntity TargetEntityBBVar;
    UPROPERTY()
    EESMBlackboardConditionTagQueryType CheckTagCondition = EESMBlackboardConditionTagQueryType(2);
    UPROPERTY()
    FGameplayTagContainer TagsToCheck;
    UPROPERTY()
    FNameHandle_ESMBBTrigger TriggerToActivate;


    UFUNCTION()
    void Tick_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        FNameHandle_EntityBBVarEntity local_4;
        local_4;
        FECSEntity local_8 = Context.GetEntity().GetBB_Entity(local_4);
        if (local_8.IsValid() && !((FName(this.TriggerToActivate.Name) == NAME_None)))
        {
            if ((int(this.CheckTagCondition) == 0 && local_8.MatchAnyGameplayTags(this.TagsToCheck)) || (int(this.CheckTagCondition) == 2 && !(local_8.MatchAnyGameplayTags(this.TagsToCheck))))
            {
                FESMTriggerUtils::ActivateESMTrigger(Context.GetEntity(), this.TriggerToActivate.Name, Time.WorldTime, FFPTime(0), 0);
            }
        }
        return;
    }
}

