

class UHTNTask_Quest_Plan_GetPoint : UHTNTask_ECSScriptBase
{
    UPROPERTY()
    EESMBlackboardConditionTagQueryType TagQueryType;
    UPROPERTY()
    FGameplayTagContainer Tags;
    UPROPERTY()
    FBlackboardKeySelector PointEntityID;

    default SetNodeName("Plan_GetPoint");

    UHTNTask_Quest_Plan_GetPoint()
    {
        return;
    }
    UFUNCTION()
    void CreatePlanSteps_Implementation(const FHTNContext &inout Context) const
    {
        FECSRuntimeView local_22 = ECS::GetECSWorld().GetRuntimeView(EECSRuntimeViewType(2));
        Include local_44;
        local_44.opCall();
        FECSRuntimeViewIterator local_78 = local_22.Iterator();
        for (; local_78.CanProceed;)
        {
            const FECSEntity& local_116 = local_78.Proceed();
            if ((int(this.TagQueryType) == 0 || (int(this.TagQueryType) == 2)))
            {
                if (local_116.MatchAnyGameplayTags(this.Tags))
                {
                    if (int(this.TagQueryType) == 0)
                    {
                        local_116.GetId();
                        this.SubmitPlanStep(1, "");
                    }
                }
                else
                {
                    if (int(this.TagQueryType) == 2)
                    {
                        local_116.GetId();
                        this.SubmitPlanStep(1, "");
                    }
                }
                continue;
            }
            if (int(this.TagQueryType) == 1)
            {
                if (FGameplayTagsUtils::MatchAll(local_116, this.Tags))
                {
                    local_116.GetId();
                    this.SubmitPlanStep(1, "");
                }
            }
        }
        return;
    }
    UFUNCTION()
    void Execute_Implementation(const FHTNContext &inout Context)
    {
        this.FinishExecuteWithContext(Context, true);
        return;
    }
}

