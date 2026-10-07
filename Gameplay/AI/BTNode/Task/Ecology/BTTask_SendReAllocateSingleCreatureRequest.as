

class UBTTask_SendReAllocateSingleCreatureRequest : UBTTask_ECSScriptBase
{
    UPROPERTY()
    FBlackboardKeySelector Result;

    default SetNodeName("SendReAllocateSingleCreatureRequest");

    UBTTask_SendReAllocateSingleCreatureRequest()
    {
        this.Result.SelectedKeyName = n"LbSingleReAllocateSucc";
        this.Result.AddBoolFilter(this, n"LbSingleReAllocateSucc");
        return;
    }
    UFUNCTION()
    EBTNodeResult ExecuteTask_Implementation(const FAIBehaviorTreeContext &inout Context, const FBTNodeMemory &inout NodeMemory) const
    {
        int local_14 = 0;
        FECSEntity local_4 = FECSEntity(Context.PawnEntity);
        UBlackboardComponent local_6 = Context.GetBlackboardComponent();
        if (!(local_14))
        {
            return EBTNodeResult(1);
        }
        FECSEntity local_26 = FECSEntity(FECSEntityId(local_14.FlockProxyEntity));
        if (!(local_26.IsValid()))
        {
            return EBTNodeResult(1);
        }
        local_6.SetValueAsBool(this.Result.SelectedKeyName, ::FEcologyBehaviorUtils::ReAllocateSingleCreatureRequestByBTree(local_26, local_4));
        return EBTNodeResult(0);
    }
}

class UBTTask_SendReAllocateNotifyToFlock : UBTTask_ECSScriptBase
{
    default SetNodeName("SendReAllocateNotifyToFlock");

    UBTTask_SendReAllocateNotifyToFlock()
    {
        return;
    }
    UFUNCTION()
    EBTNodeResult ExecuteTask_Implementation(const FAIBehaviorTreeContext &inout Context, const FBTNodeMemory &inout NodeMemory) const
    {
        int local_14 = 0;
        int local_36 = 0;
        FECSEntity local_4 = FECSEntity(Context.PawnEntity);
        UBlackboardComponent local_6 = Context.GetBlackboardComponent();
        if (!(local_14))
        {
            return EBTNodeResult(1);
        }
        FECSEntity local_26 = FECSEntity(FECSEntityId(local_14.FlockProxyEntity));
        if (!(local_26.IsValid()))
        {
            return EBTNodeResult(1);
        }
        FFPTime local_32 = FFPTime(-1);
        local_36.Entity = local_4;
        local_36.FlockEntity = local_26;
        return EBTNodeResult(0);
    }
}

