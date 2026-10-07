

class UBTService_RequestFlockReAllocateBehaviorHandle : UBTService_ECSScriptBase
{
    default SetNodeName("RequestFlockReAllocateBehaviorHandle");

    UBTService_RequestFlockReAllocateBehaviorHandle()
    {
        return;
    }
    UFUNCTION()
    void TickNode_Implementation(const FAIBehaviorTreeContext &inout Context, const FBTNodeMemory &inout NodeMemory, const float32 DeltaSeconds) const
    {
        int local_10 = 0;
        TDataObjectPtr<FEcologyActivityDefinitionRow> local_22;
        FC_FlockMember local_28;
        int local_40;
        int local_52 = 0;
        int local_58 = 0;
        FECSEntity local_4 = FECSEntity(Context.PawnEntity);
        if (!(local_10))
        {
            return;
        }
        FECSEntityId local_12 = FECSEntityId(local_10.ActivityData.RuntimeSlotData.TargetResourceId);
        if (!(FECSEntity(local_12).IsValid()))
        {
            return;
        }
        FECSEntity local_16 = FECSEntity(local_12);
        if (!(local_22))
        {
            return;
        }
        if (!(local_28))
        {
            return;
        }
        FECSEntity local_20 = FECSEntity(local_28.FlockProxyEntity);
        if (!(local_20.IsValid()))
        {
            return;
        }
        bool local_33_2 = !(::FEcologyUtils::CheckCurrentActivityValid(local_4, local_16, local_22));
        if (!(local_33_2))
        {
            local_33_2 = ::FEcologyUtils::CheckNeedChangeToSpecialFeatureActivity(local_4, local_16, local_22);
        }
        if (local_33_2)
        {
            if (!(local_40))
            {
                return;
            }
            if (int(local_40.SlotAllocator.AllocatorType) == 0)
            {
                if (local_28.bIsLeader)
                {
                    FFPTime local_50 = FFPTime(-1);
                    local_52.Entity = local_4;
                    local_52.FlockEntity = local_20;
                }
                ::FEcologyBehaviorUtils::ModifyCreatureNeedReAllocateState(local_4, true);
            }
            else
            {
                if (int(local_40.SlotAllocator.AllocatorType) == 1)
                {
                    ::FEcologyBehaviorUtils::ReAllocateSingleCreatureRequestByBTree(local_20, local_4);
                    local_58.ActivityData.bForceResetBehavior = true;
                }
            }
        }
        return;
    }
}

