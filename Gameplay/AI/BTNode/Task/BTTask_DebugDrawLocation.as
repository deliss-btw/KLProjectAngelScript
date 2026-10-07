

class UBTTask_DebugDrawLocation : UBTTask_ECSScriptBase
{
    UPROPERTY()
    FBlackboardKeySelector TargetLocation;
    UPROPERTY()
    FAISmart_EntityId TargetEntityID;
    UPROPERTY()
    float32 DrawLastTime;

    default SetNodeName("Debug Draw Location");

    UBTTask_DebugDrawLocation()
    {
        this.TargetEntityID = FAISmart_EntityId(n"TargetEntityID", EAISmartValue(0));
        this.DrawLastTime = 1.0f;
        this.TargetLocation.SelectedKeyName = n"TargetLocation";
        this.TargetLocation.AddVectorFilter(this, n"TargetLocation");
        return;
    }
    UFUNCTION()
    EBTNodeResult ExecuteTask_Implementation(const FAIBehaviorTreeContext &inout Context, const FBTNodeMemory &inout NodeMemory) const
    {
        UBlackboardComponent local_2 = Context.GetBlackboardComponent();
        FVector local_16 = local_2.GetValueAsVector(this.TargetLocation.SelectedKeyName);
        System::DrawDebugSphere(__GetWorldContext(), local_16, 100.0f, 12, FLinearColor::Red, this.DrawLastTime, 0.0f, EDrawDebugSceneDepthPriorityGroup(0));
        FECSEntityId local_27 = this.TargetEntityID.GetValue(Context.opImplConv());
        if ((!((local_27 == ENTITY_ID_NULL))))
        {
            FECSEntity local_38 = FECSEntity(local_27);
            GetDefaulted local_48;
            System::DrawDebugLine(__GetWorldContext(), FVector(local_48.opCall().GetPosition()), local_16, FLinearColor::Red, this.DrawLastTime, 0.0f, EDrawDebugSceneDepthPriorityGroup(0));
        }
        return EBTNodeResult(0);
    }
}

