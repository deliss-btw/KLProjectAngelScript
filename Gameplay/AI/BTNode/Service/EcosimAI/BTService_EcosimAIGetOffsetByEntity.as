

class UBTService_EcosimAIGetOffsetByEntity : UBTService_ECSScriptBase
{
    UPROPERTY()
    FAISmart_EntityId SelfEntityID;
    UPROPERTY()
    FAISmart_EntityId TargetEntityID;
    UPROPERTY()
    FBlackboardKeySelector OffsetByTargetEntity;
    UPROPERTY()
    float32 OffsetDistance;

    default SetNodeName("EcosimAIGetOffsetByEntity");

    UBTService_EcosimAIGetOffsetByEntity()
    {
        this.SelfEntityID = FAISmart_EntityId(n"SelfEntityID", EAISmartValue(0));
        this.TargetEntityID = FAISmart_EntityId(n"TargetEntityID", EAISmartValue(0));
        this.OffsetDistance = 1500.0f;
        this.OffsetByTargetEntity.SelectedKeyName = n"OffsetByTargetEntity";
        this.OffsetByTargetEntity.AddVectorFilter(this, n"OffsetByTargetEntity");
        return;
    }
    UFUNCTION()
    void TickNode_Implementation(const FAIBehaviorTreeContext &inout Context, const FBTNodeMemory &inout NodeMemory, const float32 DeltaSeconds) const
    {
        int local_28 = 0;
        int local_30 = 0;
        UBlackboardComponent local_2 = Context.GetBlackboardComponent();
        FECSEntity local_8 = FECSEntity(this.SelfEntityID.GetValue(Context.opImplConv()));
        FECSEntity local_16 = FECSEntity(this.TargetEntityID.GetValue(Context.opImplConv()));
        if (local_8.IsValid() && local_16.IsValid())
        {
            FVector local_66 = local_30.ToFTransform().InverseTransformPosition(local_28.GetPosition());
            local_66.Normalize(9.99999993922529e-9);
            local_2.SetValueAsVector(this.OffsetByTargetEntity.SelectedKeyName, (local_66 * this.OffsetDistance));
        }
        return;
    }
}

