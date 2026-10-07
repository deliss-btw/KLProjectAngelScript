

class UBTTask_GetEntityLocationWithOffset : UBTTask_ECSScriptBase
{
    UPROPERTY()
    FBlackboardKeySelector OuputLocation;
    UPROPERTY()
    FAISmart_EntityId TargetEntityID;
    UPROPERTY()
    FAISmart_Vector LocalOffset;
    UPROPERTY()
    bool bProjectLocationToGroundAfterOffset;
    UPROPERTY()
    bool bProjectWithCollisionRadius;

    default SetNodeName("Get Entity Location With Offset");

    UBTTask_GetEntityLocationWithOffset()
    {
        this.TargetEntityID = FAISmart_EntityId(n"TargetEntityID", EAISmartValue(0));
        this.bProjectLocationToGroundAfterOffset = false;
        this.bProjectWithCollisionRadius = false;
        this.OuputLocation.AddVectorFilter(this, n"OuputLocation");
        return;
    }
    UFUNCTION()
    EBTNodeResult ExecuteTask_Implementation(const FAIBehaviorTreeContext &inout Context, const FBTNodeMemory &inout NodeMemory) const
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
        EBTNodeResult __r; return __r;
    }
}

