

class UBTService_LineTraceForScene : UBTService_ECSScriptBase
{
    UPROPERTY()
    float32 LineTraceDistance;
    UPROPERTY()
    float32 LineTraceHeightOffset;
    UPROPERTY()
    FBlackboardKeySelector LineTraceResult;

    default SetNodeName("е‰Ќж–№е°„зєїе€¤ж–­жЇеђ¦ж’ћеў™");

    UBTService_LineTraceForScene()
    {
        this.LineTraceDistance = 500.0f;
        this.LineTraceHeightOffset = 0.0f;
        this.LineTraceResult.SelectedKeyName = n"LineTraceResult";
        this.LineTraceResult.AddBoolFilter(this, n"LineTraceResult");
        return;
    }
    UFUNCTION()
    void OnBecomeRelevant_Implementation(const FAIBehaviorTreeContext &inout Context, const FBTNodeMemory &inout NodeMemory) const
    {
        UBlackboardComponent local_2 = Context.GetOwnerComponent().GetBlackboardComponent();
        local_2.SetValueAsBool(this.LineTraceResult.SelectedKeyName, false);
        return;
    }
    UFUNCTION()
    void OnCeaseRelevant_Implementation(const FAIBehaviorTreeContext &inout Context, const FBTNodeMemory &inout NodeMemory) const
    {
        UBlackboardComponent local_2 = Context.GetOwnerComponent().GetBlackboardComponent();
        local_2.SetValueAsBool(this.LineTraceResult.SelectedKeyName, false);
        return;
    }
    UFUNCTION()
    void TickNode_Implementation(const FAIBehaviorTreeContext &inout Context, const FBTNodeMemory &inout NodeMemory, const float32 DeltaSeconds) const
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
    }
}

