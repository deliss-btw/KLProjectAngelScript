

class UHTNTask_SetBlackBoardValue : UHTNTask_ECSScriptBase
{
    UPROPERTY()
    FBlackboardKeySelector KeyName;
    UPROPERTY()
    FVector Value;

    UHTNTask_SetBlackBoardValue()
    {
        this.KeyName.AddVectorFilter(this, n"KeyName");
        return;
    }
    UFUNCTION()
    void CreatePlanSteps_Implementation(const FHTNContext &inout Context) const
    {
        this.SubmitPlanStep(0, "");
        return;
    }
    UFUNCTION()
    void Execute_Implementation(const FHTNContext &inout Context)
    {
        HTNNode::SetWorldStateValueAsVector(Context, this.KeyName, this.Value);
        FString local_16 = FString();
        this.FinishExecuteWithContext(Context, true);
        return;
    }
}

class UHTNTask_Test_CompareAndSet : UHTNTask_ECSScriptBase
{
    UPROPERTY()
    FBlackboardKeySelector KeyName;
    UPROPERTY()
    int TargetValue;
    UPROPERTY()
    int SetValue;

    UHTNTask_Test_CompareAndSet()
    {
        this.KeyName.AddIntFilter(this, n"KeyName");
        return;
    }
    UFUNCTION()
    void CreatePlanSteps_Implementation(const FHTNContext &inout Context) const
    {
        if (HTNNode::GetWorldStateValueAsInt(Context, this.KeyName) != this.TargetValue)
        {
            return;
        }
        HTNNode::SetWorldStateValueAsInt(Context, this.KeyName, this.SetValue);
        this.SubmitPlanStep(1, "");
        return;
    }
    UFUNCTION()
    void Execute_Implementation(const FHTNContext &inout Context)
    {
        XLog(ELog(43), FString().Append("Execution Test_CompareAndSet ").Append(this.KeyName.SelectedKeyName).Append(" : ").Append(this.SetValue));
        this.FinishExecuteWithContext(Context, true);
        return;
    }
}

class UHTNTask_Test_Add : UHTNTask_ECSScriptBase
{
    UPROPERTY()
    FBlackboardKeySelector KeyName;
    UPROPERTY()
    int AddValue;

    UHTNTask_Test_Add()
    {
        this.KeyName.AddIntFilter(this, n"KeyName");
        return;
    }
    UFUNCTION()
    void CreatePlanSteps_Implementation(const FHTNContext &inout Context) const
    {
        HTNNode::SetWorldStateValueAsInt(Context, this.KeyName, ((HTNNode::GetWorldStateValueAsInt(Context, this.KeyName)) + 1));
        this.SubmitPlanStep(100, "");
        return;
    }
    UFUNCTION()
    void Execute_Implementation(const FHTNContext &inout Context)
    {
        this.FinishExecuteWithContext(Context, true);
        return;
    }
}

