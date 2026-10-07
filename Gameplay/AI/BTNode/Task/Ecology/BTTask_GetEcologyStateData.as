

class UBTTask_GetEcologyStateData : UBTTask_ECSScriptBase
{
    UPROPERTY()
    FBlackboardKeySelector CanFly;
    UPROPERTY()
    FBlackboardKeySelector OverSlotWanderInnerRadiusKey;
    UPROPERTY()
    FBlackboardKeySelector OverSlotWanderOuterRadiusKey;
    UPROPERTY()
    FBlackboardKeySelector ArriveDistance;

    default SetNodeName("GetEcologyStateData");

    UBTTask_GetEcologyStateData()
    {
        this.CanFly.SelectedKeyName = n"LbCanFly";
        this.CanFly.AddBoolFilter(this, n"LbCanFly");
        this.OverSlotWanderInnerRadiusKey.SelectedKeyName = n"LOverSlotInnerRadius";
        this.OverSlotWanderInnerRadiusKey.AddFloatFilter(this, n"LOverSlotInnerRadius");
        this.OverSlotWanderOuterRadiusKey.SelectedKeyName = n"LOverSlotOuterRadius";
        this.OverSlotWanderOuterRadiusKey.AddFloatFilter(this, n"LOverSlotOuterRadius");
        this.ArriveDistance.SelectedKeyName = n"ArriveDistance";
        this.ArriveDistance.AddFloatFilter(this, n"ArriveDistance");
        return;
    }
    UFUNCTION()
    EBTNodeResult ExecuteTask_Implementation(const FAIBehaviorTreeContext &inout Context, const FBTNodeMemory &inout NodeMemory) const
    {
        FC_CreatureEcologyState local_10;
        FECSEntity local_4 = FECSEntity(Context.PawnEntity);
        if (!(local_10))
        {
            return EBTNodeResult(1);
        }
        UBlackboardComponent local_14 = Context.GetBlackboardComponent();
        local_14.SetValueAsBool(this.CanFly.SelectedKeyName, local_10.bCanFly);
        local_14.SetValueAsFloat(this.OverSlotWanderInnerRadiusKey.SelectedKeyName, local_10.OverSlotWanderInnerRadius);
        local_14.SetValueAsFloat(this.OverSlotWanderOuterRadiusKey.SelectedKeyName, local_10.OverSlotWanderOuterRadius);
        local_14.SetValueAsFloat(this.ArriveDistance.SelectedKeyName, FECSAIUtils::GetEntityAgentRadius(local_4));
        return EBTNodeResult(0);
    }
}

