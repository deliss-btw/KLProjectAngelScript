class UHTNTask_Plan_GetFloatDivideResult : UHTNTask_ECSScriptBase
{
    UPROPERTY()
    FAISmart_Float ValueA;
    UPROPERTY()
    FAISmart_Float ValueB;
    UPROPERTY()
    FBlackboardKeySelector Result;

    default SetNodeName("Plan_GetFloatDivideResult");

    UHTNTask_Plan_GetFloatDivideResult()
    {
        this.Result.AddFloatFilter(this, n"Result");
        return;
    }
    UFUNCTION()
    void CreatePlanSteps_Implementation(const FHTNContext &inout Context) const
    {
        float32 local_5 = this.ValueA.GetValue(Context.opImplConv());
        float32 local_1 = this.ValueB.GetValue(Context.opImplConv());
        if (local_1 == 0.0f)
        {
            return;
        }
        HTNNode::SetWorldStateValueAsFloat(Context, this.Result, local_5 / local_1);
        this.SubmitPlanStep(100, "");
        return;
    }
}

