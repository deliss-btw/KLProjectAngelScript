class UHTNService_UpdateFloatDivideResult : UHTNService_ECSScriptBase
{
    UPROPERTY()
    FAISmart_Float ValueA;
    UPROPERTY()
    FAISmart_Float ValueB;
    UPROPERTY()
    FBlackboardKeySelector Result;

    default SetNodeName("UpdateFloatDivideResult");

    UHTNService_UpdateFloatDivideResult()
    {
        this.Result.AddFloatFilter(this, n"Result");
        return;
    }
    UFUNCTION()
    void ExecutionStart_Implementation(const FHTNContext &inout Context)
    {
        this.UpdateResult(Context);
        return;
    }
    UFUNCTION()
    void Tick_Implementation(const FHTNContext &inout Context, const float32 DeltaTime)
    {
        this.UpdateResult(Context);
        return;
    }
    void UpdateResult(const FHTNContext &inout Context)
    {
        float32 local_5 = this.ValueA.GetValue(Context.opImplConv());
        float32 local_1 = this.ValueB.GetValue(Context.opImplConv());
        if (local_1 == 0.0f)
        {
            return;
        }
        HTNNode::SetWorldStateValueAsFloat(Context, this.Result, local_5 / local_1);
        return;
    }
}

