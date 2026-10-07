

class UHTNService_ResetBlackBoard : UHTNService_ECSScriptBase
{
    UPROPERTY()
    TArray<FBlackboardKeySelector> OnEnterResetBB;
    UPROPERTY()
    TArray<FBlackboardKeySelector> OnExitResetBB;

    default SetNodeName("ResetBlackBoard");

    UHTNService_ResetBlackBoard()
    {
        return;
    }
    UFUNCTION()
    void ExecutionStart_Implementation(const FHTNContext &inout Context)
    {
        for (auto& local_16 : this.OnEnterResetBB)
        {
            Context.ClearWorldState(local_16);
            Context.GetBlackboardComponent().ClearValue(local_16.SelectedKeyName);
        }
        return;
    }
    UFUNCTION()
    void ExecutionFinish_Implementation(const FHTNContext &inout Context, const EHTNNodeResult Result)
    {
        for (auto& local_16 : this.OnExitResetBB)
        {
            Context.ClearWorldState(local_16);
            Context.GetBlackboardComponent().ClearValue(local_16.SelectedKeyName);
        }
        return;
    }
}

