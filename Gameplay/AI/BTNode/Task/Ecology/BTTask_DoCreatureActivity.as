

class UBTTask_EcologySyncCreatureActivityData : UBTTask_ECSScriptBase
{
    UPROPERTY()
    FBlackboardKeySelector ResourceAllocated;
    UPROPERTY()
    FBlackboardKeySelector HasConfigSlot;
    UPROPERTY()
    FBlackboardKeySelector TargetPosition;
    UPROPERTY()
    FBlackboardKeySelector TargetLookAt;
    UPROPERTY()
    FBlackboardKeySelector TargetActivityName;
    UPROPERTY()
    FBlackboardKeySelector NeedRandomPosition;

    default SetNodeName("SyncActivityData");

    UBTTask_EcologySyncCreatureActivityData()
    {
        this.ResourceAllocated.SelectedKeyName = n"LbResourceAllocated";
        this.ResourceAllocated.AddBoolFilter(this, n"LbResourceAllocated");
        this.HasConfigSlot.SelectedKeyName = n"HasConfigSlot";
        this.HasConfigSlot.AddBoolFilter(this, n"HasConfigSlot");
        this.TargetPosition.SelectedKeyName = n"TargetPosition";
        this.TargetPosition.AddVectorFilter(this, n"TargetPosition");
        this.TargetLookAt.SelectedKeyName = n"TargetLookAt";
        this.TargetLookAt.AddVectorFilter(this, n"TargetLookAt");
        this.TargetActivityName.SelectedKeyName = n"TargetActivityName";
        this.TargetActivityName.AddNameFilter(this, n"TargetActivityName");
        this.NeedRandomPosition.SelectedKeyName = n"NeedRandomPosition";
        this.NeedRandomPosition.AddBoolFilter(this, n"NeedRandomPosition");
        return;
    }
    UFUNCTION()
    EBTNodeResult ExecuteTask_Implementation(const FAIBehaviorTreeContext &inout Context, const FBTNodeMemory &inout NodeMemory) const
    {
        FC_CreatureEcologyState local_10;
        UEcologyBehaviorDefine local_28;
        FECSEntity local_4 = FECSEntity(Context.PawnEntity);
        if (!(local_10))
        {
            return EBTNodeResult(1);
        }
        FCreatureActivityData local_14 = local_10.ActivityData;
        UBlackboardComponent local_18 = Context.GetBlackboardComponent();
        bool local_11 = FECSEntity(local_14.RuntimeSlotData.TargetResourceId).IsValid();
        local_18.SetValueAsBool(this.ResourceAllocated.SelectedKeyName, local_11);
        if (!(local_11))
        {
            return EBTNodeResult(0);
        }
        local_18.SetValueAsBool(this.HasConfigSlot.SelectedKeyName, local_14.RuntimeSlotData.bHasSlotConfig);
        FName local_32;
        if (local_28 != nullptr)
        {
            UEcologyBehaviorDefine local_30;
            local_32 = local_30.BehaviorName;
        }
        else
        {
            local_32 = NAME_None;
        }
        local_18.SetValueAsName(this.TargetActivityName.SelectedKeyName, local_32);
        local_18.SetValueAsBool(this.NeedRandomPosition.SelectedKeyName, !(local_14.RuntimeSlotData.HasSlotConfig()));
        return EBTNodeResult(0);
    }
}

class UBTTask_EcologySyncChangeAreaData : UBTTask_ECSScriptBase
{
    UPROPERTY()
    FBlackboardKeySelector TargetPosition;

    default SetNodeName("SyncChangeAreaData");

    UBTTask_EcologySyncChangeAreaData()
    {
        this.TargetPosition.SelectedKeyName = n"TargetPosition";
        this.TargetPosition.AddVectorFilter(this, n"TargetPosition");
        return;
    }
    UFUNCTION()
    EBTNodeResult ExecuteTask_Implementation(const FAIBehaviorTreeContext &inout Context, const FBTNodeMemory &inout NodeMemory) const
    {
        FC_FlockMember local_14;
        FC_EcologyFlockBehaviorComponent local_32;
        FECSEntity local_4 = FECSEntity(Context.PawnEntity);
        UBlackboardComponent local_6 = Context.GetBlackboardComponent();
        if (!(local_14))
        {
            return EBTNodeResult(1);
        }
        FECSEntity local_26 = FECSEntity(local_14.FlockProxyEntity);
        if (!(local_32))
        {
            return EBTNodeResult(1);
        }
        local_6.SetValueAsVector(this.TargetPosition.SelectedKeyName, local_32.ChangeAreaData.TargetPosition);
        return EBTNodeResult(0);
    }
}

class UBTTask_EcologyDoCreatureActivity : UBTTask_ECSScriptBase
{
    FNameHandle_EntityBBVarName BehaviorNameKey;

    default SetNodeName("EcologyDoCreatureActivity");

    UBTTask_EcologyDoCreatureActivity()
    {
        FNameHandle_EntityBBVarName local_6;
        local_6;
        this.BehaviorNameKey = local_6;
        return;
    }
    UFUNCTION()
    EBTNodeResult ExecuteTask_Implementation(const FAIBehaviorTreeContext &inout Context, const FBTNodeMemory &inout NodeMemory) const
    {
        FC_CreatureEcologyState local_10;
        UEcologyBehaviorDefine local_18;
        FECSEntity local_4 = FECSEntity(Context.PawnEntity);
        if (!(local_10))
        {
            return EBTNodeResult(1);
        }
        FCreatureActivityData local_14 = local_10.ActivityData;
        if ((!((local_18 != nullptr))))
        {
            return EBTNodeResult(1);
        }
        UEcologyBehaviorDefine local_20;
        local_4.SetBB_Name(this.BehaviorNameKey, local_20.LegacyBehaviorName);
        return EBTNodeResult(0);
    }
    UFUNCTION()
    void TickTask_Implementation(const FAIBehaviorTreeContext &inout Context, const FBTNodeMemory &inout NodeMemory, const float32 DeltaSeconds) const
    {
        return;
    }
}

class UBTTask_ResetInterruptBehaviorMark : UBTTask_ECSScriptBase
{
    default SetNodeName("ResetInterruptBehaviorMark");

    UBTTask_ResetInterruptBehaviorMark()
    {
        return;
    }
    UFUNCTION()
    EBTNodeResult ExecuteTask_Implementation(const FAIBehaviorTreeContext &inout Context, const FBTNodeMemory &inout NodeMemory) const
    {
        FECSEntity local_4 = FECSEntity(Context.PawnEntity);
        ::FEcologyBehaviorUtils::ResetForceResetBehaviorMark(local_4.GetId());
        return EBTNodeResult(0);
    }
}

class UBTTask_NormalizeCreatureActivityData : UBTTask_ECSScriptBase
{
    UPROPERTY()
    FBlackboardKeySelector HasVaildBehavior;

    default SetNodeName("NormalizeCreatureActivityData");

    UBTTask_NormalizeCreatureActivityData()
    {
        this.HasVaildBehavior.SelectedKeyName = n"LbHasVaildBehavior";
        this.HasVaildBehavior.AddBoolFilter(this, n"LbHasVaildBehavior");
        return;
    }
    UFUNCTION()
    EBTNodeResult ExecuteTask_Implementation(const FAIBehaviorTreeContext &inout Context, const FBTNodeMemory &inout NodeMemory) const
    {
        FECSEntity local_4 = FECSEntity(Context.PawnEntity);
        UBlackboardComponent local_6 = Context.GetBlackboardComponent();
        local_6.SetValueAsBool(this.HasVaildBehavior.SelectedKeyName, ::FEcologyBehaviorUtils::NormalizeCreatureActivityData(local_4));
        return EBTNodeResult(0);
    }
}

class UBTTask_ModifyNeedReAllocateMark : UBTTask_ECSScriptBase
{
    UPROPERTY()
    bool NeedReAllocate;

    default SetNodeName("ModifyNeedReAllocateMark");

    UBTTask_ModifyNeedReAllocateMark()
    {
        return;
    }
    UFUNCTION()
    EBTNodeResult ExecuteTask_Implementation(const FAIBehaviorTreeContext &inout Context, const FBTNodeMemory &inout NodeMemory) const
    {
        FECSEntity local_4 = FECSEntity(Context.PawnEntity);
        ::FEcologyBehaviorUtils::ModifyCreatureNeedReAllocateState(local_4, this.NeedReAllocate);
        return EBTNodeResult(0);
    }
}

class UBTTask_ModifyNeedDoDefaultBehaviorMark : UBTTask_ECSScriptBase
{
    UPROPERTY()
    bool NeedDoDefaultBehavior;

    default SetNodeName("ModifyNeedDoDefaultBehaviorMark");

    UBTTask_ModifyNeedDoDefaultBehaviorMark()
    {
        return;
    }
    UFUNCTION()
    EBTNodeResult ExecuteTask_Implementation(const FAIBehaviorTreeContext &inout Context, const FBTNodeMemory &inout NodeMemory) const
    {
        FECSEntity local_4 = FECSEntity(Context.PawnEntity);
        ::FEcologyBehaviorUtils::ModifyCreatureNeedDoDefaultBehavior(local_4, this.NeedDoDefaultBehavior);
        return EBTNodeResult(0);
    }
}

class UBTTask_ClearSelfTargeting : UBTTask_ECSScriptBase
{
    default SetNodeName("ClearSelfTargeting");

    UBTTask_ClearSelfTargeting()
    {
        return;
    }
    UFUNCTION()
    EBTNodeResult ExecuteTask_Implementation(const FAIBehaviorTreeContext &inout Context, const FBTNodeMemory &inout NodeMemory) const
    {
        FECSEntity local_4 = FECSEntity(Context.PawnEntity);
        ::FAITargetingUtils::ClearSelfTargeting(local_4);
        return EBTNodeResult(0);
    }
}

class UBTTask_EndQuitCombatCheck : UBTTask_ECSScriptBase
{
    default SetNodeName("EndQuitCombatCheck");

    UBTTask_EndQuitCombatCheck()
    {
        return;
    }
    UFUNCTION()
    EBTNodeResult ExecuteTask_Implementation(const FAIBehaviorTreeContext &inout Context, const FBTNodeMemory &inout NodeMemory) const
    {
        FECSEntity local_4 = FECSEntity(Context.PawnEntity);
        ::FAIQuitCombatUtils::EndQuitCombatCheck(local_4, true);
        return EBTNodeResult(0);
    }
}

