

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
        // body not fully recovered вЂ” stub [argmismatch:argtype]
    }
}

