

class UBTTask_GetGroundMoveStance : UBTTask_ECSScriptBase
{
    UPROPERTY()
    FBlackboardKeySelector OutMoveStance;
    UPROPERTY()
    FBlackboardKeySelector RunMoveStanceDistance;

    default SetNodeName("GetGroundMoveStance");

    UBTTask_GetGroundMoveStance()
    {
        this.OutMoveStance.SelectedKeyName = n"LGroundMoveStance";
        this.OutMoveStance.AddIntFilter(this, n"LGroundMoveStance");
        this.RunMoveStanceDistance.SelectedKeyName = n"LRunMoveStanceDistance";
        this.RunMoveStanceDistance.AddFloatFilter(this, n"LRunMoveStanceDistance");
        return;
    }
    UFUNCTION()
    EBTNodeResult ExecuteTask_Implementation(const FAIBehaviorTreeContext &inout Context, const FBTNodeMemory &inout NodeMemory) const
    {
        int local_36 = 0;
        FECSEntity local_4 = FECSEntity(Context.PawnEntity);
        FC_CreatureEcologyState local_10;
        bool local_11 = !(local_10);
        if (local_11)
        {
            return EBTNodeResult(1);
        }
        UBlackboardComponent local_14 = Context.GetBlackboardComponent();
        ECreatureMoveStance local_17 = ECreatureMoveStance(0);
        float32 local_19 = 2000.0f;
        FECSEntity local_30 = FECSEntity(FECSEntityId(local_10.FlockProxyEntity));
        bool local_11_2 = !(local_36);
        if (local_11_2)
        {
            return EBTNodeResult(1);
        }
        bool local_11_3 = ::FEcologyBehaviorUtils::CheckFlockIsEmergencyState(local_30);
        if (local_11_3)
        {
            local_17 = local_10.ForceMoveStanceEmergency;
            local_19 = local_10.RunMoveStanceDistanceWithEmergency;
        }
        else
        {
            local_17 = local_10.ForceMoveStanceWithoutEmergency;
            local_19 = local_10.RunMoveStanceDistanceWithoutEmergency;
        }
        local_14.SetValueAsInt(this.OutMoveStance.SelectedKeyName, int(local_17));
        local_14.SetValueAsFloat(this.RunMoveStanceDistance.SelectedKeyName, local_19);
        return EBTNodeResult(0);
    }
}

