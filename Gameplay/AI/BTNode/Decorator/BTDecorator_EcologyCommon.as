

class UBTDecorator_CheckTargetFlockState : UBTDecorator_ECSScriptBase
{
    UPROPERTY()
    FBlackboardKeySelector CheckTarget;
    UPROPERTY()
    EFlockBehaviorState TargetState;
    UPROPERTY()
    bool CheckNot;

    UBTDecorator_CheckTargetFlockState()
    {
        this.CheckTarget.SelectedKeyName = n"TargetEntityID";
        this.CheckTarget.AddEntityIdFilter(this, n"TargetEntityID");
        return;
    }
    UFUNCTION()
    bool CalculateRawConditionValue_Implementation(const FAIBehaviorTreeContext &inout Context, const FBTNodeMemory &inout NodeMemory) const
    {
        int local_24 = 0;
        FC_EcologyFlockBehaviorComponent local_34;
        bool local_41;
        UBlackboardComponent local_4 = Context.GetOwnerComponent().GetBlackboardComponent();
        if (!((local_4 != nullptr)))
        {
            return false;
        }
        FECSEntityId local_9 = local_4.GetValueAsEntityId(this.CheckTarget.SelectedKeyName);
        if (!(FECSEntity(local_9).IsValid()))
        {
            return false;
        }
        if (!(local_24))
        {
            return false;
        }
        if (!(FECSEntity(local_24.FlockProxyEntity).IsValid()))
        {
            return false;
        }
        if (!(local_34))
        {
            return false;
        }
        bool local_7 = (int(local_34.MainState) == int(this.TargetState));
        if (this.CheckNot)
        {
            local_41 = !(local_7);
        }
        else
        {
            local_41 = local_7;
        }
        return local_41;
    }
}

class UBTDecorator_CheckTargetMonsterRank : UBTDecorator_ECSScriptBase
{
    UPROPERTY()
    FBlackboardKeySelector MainTarget;
    UPROPERTY()
    EMonsterRank MonsterRank;

    UBTDecorator_CheckTargetMonsterRank()
    {
        this.MainTarget.SelectedKeyName = n"TargetEntityID";
        this.MainTarget.AddEntityIdFilter(this, n"TargetEntityID");
        return;
    }
    UFUNCTION()
    bool CalculateRawConditionValue_Implementation(const FAIBehaviorTreeContext &inout Context, const FBTNodeMemory &inout NodeMemory) const
    {
        UBlackboardComponent local_4 = Context.GetOwnerComponent().GetBlackboardComponent();
        if ((!((local_4 != nullptr))))
        {
            return false;
        }
        FECSEntity local_18 = FECSEntity(local_4.GetValueAsEntityId(this.MainTarget.SelectedKeyName));
        if (!(local_18.IsValid()))
        {
            return false;
        }
        return ::FEcologyBattleForAreaUtils::CheckTargetMonsterRank(local_18, this.MonsterRank);
    }
}

class UBTDecorator_CheckCreatureNeedReAllocateActivity : UBTDecorator_ECSScriptBase
{
    default SetbAllowAbortLowerPri(true);
    default SetbAllowAbortChildNodes(true);

    UBTDecorator_CheckCreatureNeedReAllocateActivity()
    {
        return;
    }
    UFUNCTION()
    bool CalculateRawConditionValue_Implementation(const FAIBehaviorTreeContext &inout Context, const FBTNodeMemory &inout NodeMemory) const
    {
        return ::FEcologyBehaviorUtils::GetCreatureNeedReAllocateState(FECSEntity(Context.PawnEntity));
    }
}

class UBTDecorator_CheckCreatureNeedDoDefaultBehavior : UBTDecorator_ECSScriptBase
{
    default SetbAllowAbortLowerPri(true);
    default SetbAllowAbortChildNodes(true);

    UBTDecorator_CheckCreatureNeedDoDefaultBehavior()
    {
        return;
    }
    UFUNCTION()
    bool CalculateRawConditionValue_Implementation(const FAIBehaviorTreeContext &inout Context, const FBTNodeMemory &inout NodeMemory) const
    {
        return ::FEcologyBehaviorUtils::GetCreatureNeedDoDefaultBehavior(FECSEntity(Context.PawnEntity));
    }
}

class UBTDecorator_CheckFlockAllocateType : UBTDecorator_ECSScriptBase
{
    UPROPERTY()
    EFlockAllocatorType FlockAllocateType;

    UBTDecorator_CheckFlockAllocateType()
    {
        return;
    }
    UFUNCTION()
    bool CalculateRawConditionValue_Implementation(const FAIBehaviorTreeContext &inout Context, const FBTNodeMemory &inout NodeMemory) const
    {
        int local_10 = 0;
        int local_26 = 0;
        FECSEntity local_4 = FECSEntity(Context.PawnEntity);
        if (!(local_10))
        {
            return false;
        }
        if (!(FECSEntity(FECSEntityId(local_10.FlockProxyEntity)).IsValid()))
        {
            return false;
        }
        if (!(local_26))
        {
            return false;
        }
        int local_29 = int(local_26.SlotAllocator.AllocatorType);
        int local_30 = int(this.FlockAllocateType);
        return (local_29 == local_30);
    }
}

class UBTDecorator_NeedAllocateSlot : UBTDecorator_ECSScriptBase
{
    default SetNodeName("NeedAllocateSlot");

    UBTDecorator_NeedAllocateSlot()
    {
        return;
    }
    UFUNCTION()
    bool CalculateRawConditionValue_Implementation(const FAIBehaviorTreeContext &inout Context, const FBTNodeMemory &inout NodeMemory) const
    {
        FECSEntity local_4 = FECSEntity(Context.PawnEntity);
        FC_CreatureEcologyState local_10;
        bool local_11 = !(local_10);
        if (local_11)
        {
            return false;
        }
        return local_10.ActivityData.IsWaitReallocate() || ::FEcologyBehaviorUtils::GetCreatureNeedReAllocateState(local_4);
    }
}

class UBTDecorator_SelfEntityIsFlockLeader : UBTDecorator_ECSScriptBase
{
    default SetNodeName("SelfEntityIsFlockLeader");

    UBTDecorator_SelfEntityIsFlockLeader()
    {
        return;
    }
    UFUNCTION()
    bool CalculateRawConditionValue_Implementation(const FAIBehaviorTreeContext &inout Context, const FBTNodeMemory &inout NodeMemory) const
    {
        FC_FlockMember local_10;
        FECSEntity local_4 = FECSEntity(Context.PawnEntity);
        if (!(local_10))
        {
            return false;
        }
        return local_10.bIsLeader;
    }
}

