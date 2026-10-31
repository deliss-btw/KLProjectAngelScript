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
        UBlackboardComponent local_2 = Context.GetBlackboardComponent();
        FECSEntityId local_7 = this.TargetEntityID.GetValue(Context.opImplConv());
        if (!((local_7 == ENTITY_ID_NULL)))
        {
            GetDefaulted local_28;
            FECSEntity local_18 = FECSEntity(local_7);
            FVector local_52 = (FVector(local_28.opCall().GetPosition()) + FRotator(local_28.opCall().GetRotation()).RotateVector(this.LocalOffset.GetValue(Context.opImplConv())));
            if (this.bProjectLocationToGroundAfterOffset)
            {
                bool local_170;
                FHitResult local_130;
                FCollisionQueryParams local_168;
                local_168.bTraceComplex = false;
                local_168.AddIgnoredEntityId(local_18.GetIdValue());
                local_170 = false;
                if (this.bProjectWithCollisionRadius)
                {
                    float32 local_171;
                    local_171 = local_18.GetCollisionRadius();
                    FCollisionResponseParams local_192;
                    FVector local_46 = (local_52 - FVector(0.0, 0.0, 99999.0));
                    local_170 = FPhysicsUtils::SweepSingle(local_18, false, EPhysicsTraceTag(27), local_130, local_52, local_46, FQuat::Identity, FPhysicsUtils::ConvertToCollisionChannel(ETraceTypeQuery(5)), FCollisionShape::MakeSphere(local_171), local_168, local_192);
                }
                else
                {
                    FCollisionResponseParams local_192;
                    FVector local_46_2 = (local_52 - FVector(0.0, 0.0, 99999.0));
                    local_170 = FPhysicsUtils::LineTraceSingle(local_18, false, EPhysicsTraceTag(27), local_130, local_52, local_46_2, FPhysicsUtils::ConvertToCollisionChannel(ETraceTypeQuery(5)), local_168, local_192);
                }
                if (local_170)
                {
                    local_52 = local_130.ImpactPoint;
                }
            }
            local_2.SetValueAsVector(this.OuputLocation.SelectedKeyName, local_52);
            return EBTNodeResult(0);
        }
        return EBTNodeResult(1);
    }
}

