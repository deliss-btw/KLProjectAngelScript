

class UBTTask_MakeNoResourceActivityInfo : UBTTask_ECSScriptBase
{
    UPROPERTY()
    FBlackboardKeySelector OutPivotLocation;
    UPROPERTY()
    FBlackboardKeySelector bNeedRandomPos;

    default SetNodeName("MakeNoResourceActivityInfo");

    UBTTask_MakeNoResourceActivityInfo()
    {
        this.OutPivotLocation.SelectedKeyName = n"OutPivotLocation";
        this.OutPivotLocation.AddVectorFilter(this, n"OutPivotLocation");
        this.bNeedRandomPos.SelectedKeyName = n"bNeedRandomPos";
        this.bNeedRandomPos.AddBoolFilter(this, n"bNeedRandomPos");
        return;
    }
    UFUNCTION()
    EBTNodeResult ExecuteTask_Implementation(const FAIBehaviorTreeContext &inout Context, const FBTNodeMemory &inout NodeMemory) const
    {
        int local_28 = 0;
        int local_32 = 0;
        FECSEntity local_4 = FECSEntity(Context.PawnEntity);
        UBlackboardComponent local_6 = Context.GetBlackboardComponent();
        FECSEntity local_16 = ::FEcologyUtils::GetFlockEntity(local_4);
        if (!(local_16.IsValid()))
        {
            return EBTNodeResult(1);
        }
        Has local_22;
        if (!(local_22.opCall()))
        {
            return EBTNodeResult(1);
        }
        local_6.SetValueAsBool(this.bNeedRandomPos.SelectedKeyName, local_28.NoResourceData.bAllowNoResourceWanderMove);
        local_6.SetValueAsVector(this.OutPivotLocation.SelectedKeyName, ::FEcologyBehaviorUtils::GetNoResourcePivotLocation(local_4, local_16, local_32));
        ::FEcologyUtils::TryUpdateOverResourceActivityArray(local_4, false);
        return EBTNodeResult(0);
    }
}

class UBTTask_UpdateLastActivityPivotLocation : UBTTask_ECSScriptBase
{
    default SetNodeName("UpdateLastActivityPivotLocation");

    UBTTask_UpdateLastActivityPivotLocation()
    {
        return;
    }
    UFUNCTION()
    EBTNodeResult ExecuteTask_Implementation(const FAIBehaviorTreeContext &inout Context, const FBTNodeMemory &inout NodeMemory) const
    {
        FECSEntity local_4 = FECSEntity(Context.PawnEntity);
        FECSEntity local_12 = ::FEcologyUtils::GetFlockEntity(local_4);
        if (!(local_12.IsValid()))
        {
            return EBTNodeResult(1);
        }
        ::FEcologyBehaviorUtils::UpdateLastActivityPivotLocationByMainTargetResource(local_4, local_12);
        return EBTNodeResult(0);
    }
}

