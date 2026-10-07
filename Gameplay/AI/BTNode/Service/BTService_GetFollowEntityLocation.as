

struct FGetFollowEntityLocationBTServiceInstanceData
{
    UPROPERTY()
    FVector FollowWorldOffset;

    FGetFollowEntityLocationBTServiceInstanceData()
    {
        return;
    }
}

class UBTService_GetFollowEntityLocation : UBTService_ECSScriptBase
{
    UPROPERTY()
    FBlackboardKeySelector TargetLocation;
    UPROPERTY()
    FAISmart_EntityId TargetEntityID;

    default SetNodeName("Get Follow Entity Location");

    UBTService_GetFollowEntityLocation()
    {
        this.TargetEntityID = FAISmart_EntityId(n"TargetEntityID", EAISmartValue(0));
        this.TargetLocation.SelectedKeyName = n"TargetLocation";
        this.TargetLocation.AddVectorFilter(this, n"TargetLocation");
        this.SetbCallTickOnSearchStart(true);
        return;
    }
    UFUNCTION()
    UScriptStruct GetNodeMemoryType_Implementation() const
    {
        return FGetFollowEntityLocationBTServiceInstanceData;
    }
    UFUNCTION()
    void OnSearchStart_Implementation(const FAIBehaviorTreeSearchContext &inout SearchContext) const
    {
        int local_2 = 0;
        FAIBehaviorTreeSearchContext::CastNodeMemory(SearchContext);
        float32 local_7 = FMath::RandRange(100, 300);
        float32 local_12 = FMath::RandRange(0, 360);
        local_2.FollowWorldOffset = FVector(FMath::Cos(local_12), FMath::Sin(local_12), 0.0);
        local_2.FollowWorldOffset *= local_7;
        return;
    }
    UFUNCTION()
    void TickNode_Implementation(const FAIBehaviorTreeContext &inout Context, const FBTNodeMemory &inout NodeMemory, const float32 DeltaSeconds) const
    {
        UBlackboardComponent local_8 = Context.GetBlackboardComponent();
        FECSEntityId local_13 = this.TargetEntityID.GetValue(Context.opImplConv());
        if ((!((local_13 == ENTITY_ID_NULL))))
        {
            FECSEntity local_24 = FECSEntity(local_13);
            GetDefaulted local_34;
            local_8.SetValueAsVector(this.TargetLocation.SelectedKeyName, (FVector(local_34.opCall().GetPosition()) + 0.FollowWorldOffset));
        }
        return;
    }
    FGetFollowEntityLocationBTServiceInstanceData GetInstanceData(const FBTNodeMemory &inout NodeMemory) const
    {
        FGetFollowEntityLocationBTServiceInstanceData __r;
        return __r;
    }
}

