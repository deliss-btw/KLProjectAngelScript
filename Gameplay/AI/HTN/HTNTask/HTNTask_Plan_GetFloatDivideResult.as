

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
        float32 local_1 = 0.0f;
        FAISmartValueContext local_4 = Context.opImplConv();
        FAISmartValueContext local_4_2 = Context.opImplConv();
        if (local_1 == 0.0f)
        {
            return;
        }
        HTNNode::SetWorldStateValueAsFloat(Context, this.Result, 0.0f / local_1);
        this.SubmitPlanStep(100, "");
        return;
    }
}

