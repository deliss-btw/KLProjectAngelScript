

class UBTTask_GetEntityRotationWithOffset : UBTTask_ECSScriptBase
{
    UPROPERTY()
    FBlackboardKeySelector OuputRotation;
    UPROPERTY()
    FAISmart_EntityId TargetEntityID;
    UPROPERTY()
    FRotator RotationOffset;

    default SetNodeName("Get Entity Rotation With Offset");

    UBTTask_GetEntityRotationWithOffset()
    {
        this.TargetEntityID = FAISmart_EntityId(n"TargetEntityID", EAISmartValue(0));
        this.OuputRotation.AddRotatorFilter(this, n"OuputRotation");
        return;
    }
    UFUNCTION()
    EBTNodeResult ExecuteTask_Implementation(const FAIBehaviorTreeContext &inout Context, const FBTNodeMemory &inout NodeMemory) const
    {
        UBlackboardComponent local_2 = Context.GetBlackboardComponent();
        FECSEntityId local_7 = this.TargetEntityID.GetValue(Context.opImplConv());
        if ((!((local_7 == ENTITY_ID_NULL))))
        {
            FECSEntity local_18 = FECSEntity(local_7);
            GetDefaulted local_28;
            FRotator local_34 = FRotator(local_28.opCall().GetRotation());
            local_2.SetValueAsRotator(this.OuputRotation.SelectedKeyName, FRotator::ApplyDelta(local_34, this.RotationOffset));
            return EBTNodeResult(0);
        }
        return EBTNodeResult(1);
    }
}

