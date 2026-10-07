

class UBTService_EcosimAIFollowTarget : UBTService_ECSScriptBase
{
    UPROPERTY()
    FAISmart_EntityId FollowTargetEntityID;
    UPROPERTY()
    FBlackboardKeySelector FollowTargetLocalOffset;

    default SetNodeName("EcosimAIFollowTarget");

    UBTService_EcosimAIFollowTarget()
    {
        this.FollowTargetEntityID = FAISmart_EntityId(n"FollowTargetEntityID", EAISmartValue(0));
        this.FollowTargetLocalOffset.SelectedKeyName = n"FollowTargetLocalOffset";
        this.FollowTargetLocalOffset.AddVectorFilter(this, n"FollowTargetLocalOffset");
        return;
    }
    UFUNCTION()
    void OnBecomeRelevant_Implementation(const FAIBehaviorTreeContext &inout Context, const FBTNodeMemory &inout NodeMemory) const
    {
        UBlackboardComponent local_2 = Context.GetOwnerComponent().GetBlackboardComponent();
        return;
    }
    UFUNCTION()
    void OnCeaseRelevant_Implementation(const FAIBehaviorTreeContext &inout Context, const FBTNodeMemory &inout NodeMemory) const
    {
        return;
    }
}

