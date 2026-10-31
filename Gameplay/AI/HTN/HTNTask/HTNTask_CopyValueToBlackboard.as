class UHTNTask_CopyVectorValueToBlackboard : UHTNTask_ECSScriptBase
{
    UPROPERTY()
    FAISmart_Vector VectorValue;
    UPROPERTY()
    FBlackboardKeySelector CopyTo;

    default SetNodeName("CopyVectorValueToBlackboard");

    UHTNTask_CopyVectorValueToBlackboard()
    {
        this.CopyTo.AddVectorFilter(this, n"CopyTo");
        return;
    }
    UFUNCTION()
    void Execute_Implementation(const FHTNContext &inout Context)
    {
        HTNNode::SetWorldStateValueAsVector(Context, this.CopyTo, this.VectorValue.GetValue(Context.opImplConv()));
        this.FinishExecuteWithContext(Context, true);
        return;
    }
}

