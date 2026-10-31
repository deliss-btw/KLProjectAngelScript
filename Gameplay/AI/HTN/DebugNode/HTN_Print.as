class UHTNTask_Print : UHTNTask_ECSScriptBase
{
    UPROPERTY()
    FBlackboardKeySelector Desc;
    UPROPERTY()
    FAISmart_GameplayTag GamePlayTag;
    UPROPERTY()
    FAISmart_EntityId Entity;

    UHTNTask_Print()
    {
        this.Desc.AddIntFilter(this, n"Desc");
        return;
    }
    UFUNCTION()
    void CreatePlanSteps_Implementation(const FHTNContext &inout Context) const
    {
        HTNNode::SetWorldStateValueAsInt(Context, this.Desc, 10);
        this.SubmitPlanStep(1, "");
        return;
    }
    UFUNCTION()
    void Execute_Implementation(const FHTNContext &inout Context)
    {
        XLog(ELog(0), FString().Append("Execute ").Append(this.Desc.SelectedKeyName));
        this.FinishExecuteWithContext(Context, true);
        return;
    }
}

class UHTNTask_TestInterrupt : UHTNTask_ECSScriptBase
{
    UPROPERTY()
    FGameplayTag InterruptTag;

    UHTNTask_TestInterrupt()
    {
        return;
    }
    UFUNCTION()
    void CreatePlanSteps_Implementation(const FHTNContext &inout Context) const
    {
        this.SubmitPlanStep(1, "");
        return;
    }
    UFUNCTION()
    void Execute_Implementation(const FHTNContext &inout Context)
    {
        Context.GetHTNComponent().NotifyInterrupt(this.InterruptTag);
        this.FinishExecuteWithContext(Context, true);
        return;
    }
}

class UHTNTask_PrintVector : UHTNTask_ECSScriptBase
{
    UPROPERTY()
    FBlackboardKeySelector VectorKey;

    UHTNTask_PrintVector()
    {
        this.VectorKey.AddVectorFilter(this, n"VectorKey");
        return;
    }
    UFUNCTION()
    void CreatePlanSteps_Implementation(const FHTNContext &inout Context) const
    {
        XLog(ELog(0), FString().Append(" Planing PrintVector ").Append(this.VectorKey.SelectedKeyName).Append(" : ").Append(HTNNode::GetWorldStateValueAsVector(Context, this.VectorKey)));
        this.SubmitPlanStep(1, "");
        return;
    }
    UFUNCTION()
    void Execute_Implementation(const FHTNContext &inout Context)
    {
        XLog(ELog(0), FString().Append("Execution PrintVector ").Append(this.VectorKey.SelectedKeyName).Append(" : ").Append(HTNNode::GetWorldStateValueAsVector(Context, this.VectorKey)));
        this.FinishExecuteWithContext(Context, true);
        return;
    }
}

