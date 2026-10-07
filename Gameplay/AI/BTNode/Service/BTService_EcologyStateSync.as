

class UBTService_EcologyBaseInfoSync : UBTService_ECSScriptBase
{
    UPROPERTY()
    FBlackboardKeySelector CanNaviWalk;
    UPROPERTY()
    FBlackboardKeySelector SelfEntityCanFly;

    default SetNodeName("EcologyBaseInfoSync");

    UBTService_EcologyBaseInfoSync()
    {
        this.CanNaviWalk.SelectedKeyName = n"CanNaviWalk";
        this.CanNaviWalk.AddBoolFilter(this, n"CanNaviWalk");
        this.SelfEntityCanFly.SelectedKeyName = n"SelfEntityCanFly";
        this.SelfEntityCanFly.AddBoolFilter(this, n"SelfEntityCanFly");
        this.SetbCallTickOnSearchStart(true);
        return;
    }
    UFUNCTION()
    void TickNode_Implementation(const FAIBehaviorTreeContext &inout Context, const FBTNodeMemory &inout NodeMemory, const float32 DeltaSeconds) const
    {
        UBlackboardComponent local_2 = Context.GetOwnerComponent().GetBlackboardComponent();
        this.UpdateKnowledge(local_2, Context.PawnEntity, DeltaSeconds);
        return;
    }
    void UpdateKnowledge(const UBlackboardComponent BlackBoard, const FECSEntity &inout Entity, const float32 DeltaSeconds) const
    {
        int local_18 = 0;
        Get local_4;
        const FC_CreatureEcologyState& local_6 = local_4.opCall();
        if (local_6)
        {
            FECSEntity::Get<FC_EcologyFlockComponent> local_16 = FECSEntity::Get<FC_EcologyFlockComponent>(FECSEntity(local_6.FlockProxyEntity));
            if (!(local_18))
            {
                return;
            }
            BlackBoard.SetValueAsBool(this.CanNaviWalk.SelectedKeyName, local_6.bCanNaviWalk);
            BlackBoard.SetValueAsBool(this.SelfEntityCanFly.SelectedKeyName, local_6.bCanFly);
        }
        return;
    }
}

class UBTService_SyncFlockBehaviorState : UBTService_ECSScriptBase
{
    UPROPERTY()
    FBlackboardKeySelector FlockBehaviorState;

    default SetNodeName("SyncFlockBehaviorState");

    UBTService_SyncFlockBehaviorState()
    {
        this.FlockBehaviorState.SelectedKeyName = n"FlockBehaviorState";
        this.SetbCallTickOnSearchStart(true);
        return;
    }
    UFUNCTION()
    void TickNode_Implementation(const FAIBehaviorTreeContext &inout Context, const FBTNodeMemory &inout NodeMemory, const float32 DeltaSeconds) const
    {
        UBlackboardComponent local_2 = Context.GetOwnerComponent().GetBlackboardComponent();
        this.UpdateKnowledge(local_2, Context.PawnEntity, DeltaSeconds);
        return;
    }
    void UpdateKnowledge(const UBlackboardComponent BlackBoard, const FECSEntity &inout Entity, const float32 DeltaSeconds) const
    {
        if ((!((BlackBoard != nullptr))))
        {
            return;
        }
        if (!(::FEcologyUtils::GetFlockEntity(Entity)))
        {
            return;
        }
        Get local_14;
        BlackBoard.SetValueAsInt(this.FlockBehaviorState.SelectedKeyName, int(local_14.opCall().MainState));
        return;
    }
}

