class UBTService_LineTraceForScene : UBTService_ECSScriptBase
{
    UPROPERTY()
    float32 LineTraceDistance;
    UPROPERTY()
    float32 LineTraceHeightOffset;
    UPROPERTY()
    FBlackboardKeySelector LineTraceResult;

    default SetNodeName("前方射线判断是否撞墙");

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
        int local_16 = 0;
        int local_171;
        FECSEntity local_4 = FECSEntity(Context.PawnEntity);
        UBlackboardComponent local_6 = Context.GetOwnerComponent().GetBlackboardComponent();
        FVector local_48 = (FVector(local_16.GetPosition()) + FVector(0.0, 0.0, this.LineTraceHeightOffset));
        FVector local_22 = (local_48 + (local_16.GetRotation().GetForwardVector() * this.LineTraceDistance));
        TArray<uint> local_62 = {local_4.GetIdValue()};
        FHitResult local_132;
        FCollisionQueryParams local_170;
        local_170.bTraceComplex = false;
        local_170.AddIgnoredActors(TArray<AActor>());
        local_170.AddIgnoredEntityIds(local_62);
        FCollisionResponseParams local_182;
        bool local_184 = FPhysicsUtils::LineTraceSingle(local_4, false, EPhysicsTraceTag(11), local_132, local_48, local_22, FPhysicsUtils::ConvertToCollisionChannel(ETraceTypeQuery(9)), local_170, local_182);
        if (!(local_184))
        {
            local_171 = 0;
        }
        else
        {
            bool local_172 = (local_132.ImpactNormal.DotProduct(FVector::UpVector) < 0.707);
            local_171 = local_172;
        }
        if (local_171 != 0)
        {
            local_6.SetValueAsBool(this.LineTraceResult.SelectedKeyName, true);
        }
        else
        {
            local_6.SetValueAsBool(this.LineTraceResult.SelectedKeyName, false);
        }
        return;
    }
}

