

class UBTService_GetEntityLocation : UBTService_ECSScriptBase
{
    UPROPERTY()
    FBlackboardKeySelector TargetLocation;
    UPROPERTY()
    FAISmart_EntityId TargetEntityID;

    default SetNodeName("Get Entity Location");

    UBTService_GetEntityLocation()
    {
        this.TargetEntityID = FAISmart_EntityId(n"TargetEntityID", EAISmartValue(0));
        this.TargetLocation.SelectedKeyName = n"TargetLocation";
        this.TargetLocation.AddVectorFilter(this, n"TargetLocation");
        this.SetbCallTickOnSearchStart(true);
        return;
    }
    UFUNCTION()
    void TickNode_Implementation(const FAIBehaviorTreeContext &inout Context, const FBTNodeMemory &inout NodeMemory, const float32 DeltaSeconds) const
    {
        UBlackboardComponent local_2 = Context.GetBlackboardComponent();
        FECSEntityId local_7 = this.TargetEntityID.GetValue(Context.opImplConv());
        if ((!((local_7 == ENTITY_ID_NULL))))
        {
            FECSEntity local_14 = FECSEntity(local_7);
            GetDefaulted local_22;
            local_2.SetValueAsVector(this.TargetLocation.SelectedKeyName, local_22.opCall().GetPosition());
        }
        return;
    }
}

