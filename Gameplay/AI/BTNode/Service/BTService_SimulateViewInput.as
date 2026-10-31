class UBTService_SimulateViewInput : UBTService_ECSScriptBase
{
    UPROPERTY()
    FAISmart_EntityId TargetEntityID;

    default SetNodeName("SimulateViewInput");

    UBTService_SimulateViewInput()
    {
        this.TargetEntityID = FAISmart_EntityId(n"TargetEntityID", EAISmartValue(0));
        this.SetbCallTickOnSearchStart(true);
        return;
    }
    UFUNCTION()
    void TickNode_Implementation(const FAIBehaviorTreeContext &inout Context, const FBTNodeMemory &inout NodeMemory, const float32 DeltaSeconds) const
    {
        UBlackboardComponent local_2 = Context.GetBlackboardComponent();
        FECSEntity local_16 = FECSEntity(this.TargetEntityID.GetValue(Context.opImplConv()));
        if (local_16.IsValid())
        {
            GetDefaulted local_28;
            FVector local_46 = (FVector(local_28.opCall().GetPosition()) - FVector(local_28.opCall().GetPosition()));
            FAIInputUtils::SimulateViewInput(Context.PawnEntity, FRotator::MakeFromX(local_46));
        }
        return;
    }
}

