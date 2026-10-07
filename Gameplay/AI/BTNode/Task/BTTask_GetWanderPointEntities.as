

class UBTTask_GetWanderPointEntities : UBTTask_ECSScriptBase
{
    UPROPERTY()
    FBlackboardKeySelector WanderPointEntityID;
    UPROPERTY()
    FBlackboardKeySelector WanderPointIndex;

    default SetNodeName("Get Wander Point Entit By Index");

    UBTTask_GetWanderPointEntities()
    {
        this.WanderPointEntityID.SelectedKeyName = n"WanderPointEntityID";
        this.WanderPointEntityID.AddEntityIdFilter(this, n"WanderPointEntityID");
        this.WanderPointIndex.SelectedKeyName = n"WanderPointIndex";
        this.WanderPointIndex.AddIntFilter(this, n"WanderPointIndex");
        return;
    }
    UFUNCTION()
    EBTNodeResult ExecuteTask_Implementation(const FAIBehaviorTreeContext &inout Context, const FBTNodeMemory &inout NodeMemory) const
    {
        UBlackboardComponent local_2 = Context.GetOwnerComponent().GetBlackboardComponent();
        return EBTNodeResult(1);
    }
}

