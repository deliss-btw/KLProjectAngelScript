
enum ESyncBindDir
{
    MasterSide,
    SlaveSide,
}

enum ESyncPairRefSource
{
    FromEntityBB,
    FromBlackboard,
}


class UBTService_SyncTargetingFromMaster : UBTService_ECSScriptBase
{
    UPROPERTY()
    ESyncBindDir BindDir;
    UPROPERTY()
    ESyncPairRefSource PairRefSource;
    UPROPERTY()
    FNameHandle_EntityBBVarEntity PairEntityBBKey;
    UPROPERTY()
    FBlackboardKeySelector PairBlackboardKey;

    default SetNodeName("SyncTargetingFromMaster");

    UBTService_SyncTargetingFromMaster()
    {
        this.BindDir = ESyncBindDir(0);
        this.PairRefSource = ESyncPairRefSource(0);
        FNameHandle_EntityBBVarEntity local_6;
        local_6;
        this.PairEntityBBKey = local_6;
        this.PairBlackboardKey.AddEntityIdFilter(this, n"PairBlackboardKey");
        return;
    }
    UFUNCTION()
    void OnBecomeRelevant_Implementation(const FAIBehaviorTreeContext &inout Context, const FBTNodeMemory &inout NodeMemory) const
    {
        FECSEntity local_4;
        FECSEntity local_8;
        if (!(this.ResolveRoles(Context, local_4, local_8)))
        {
            return;
        }
        ::FAITargetingUtils::SetTargetingMaster(local_8, local_4);
        ::FAIQuitCombatUtils::SetQuitCombatRuleOverride(local_8, EAIQuitCombatRule(2));
        FC_AINeedUpdateAITargetingTag local_16;
        Assign local_14;
        local_14.opCall(local_16);
        return;
    }
    UFUNCTION()
    void OnCeaseRelevant_Implementation(const FAIBehaviorTreeContext &inout Context, const FBTNodeMemory &inout NodeMemory) const
    {
        FECSEntity local_4;
        FECSEntity local_8;
        if (!(this.ResolveRoles(Context, local_4, local_8)))
        {
            return;
        }
        ::FAITargetingUtils::ClearTargetingMaster(local_8);
        ::FAIQuitCombatUtils::ClearQuitCombatRuleOverride(local_8);
        FC_AINeedUpdateAITargetingTag local_16;
        Assign local_14;
        local_14.opCall(local_16);
        return;
    }
    bool ResolveRoles(const FAIBehaviorTreeContext &inout Context, FECSEntity &inout OutMaster, FECSEntity &inout OutSlave) const
    {
        FECSEntity local_4 = FECSEntity(Context.PawnEntity);
        if (!(local_4.IsValid()))
        {
            return false;
        }
        FECSEntity local_14 = this.ResolvePairEntity(Context, local_4);
        if (!(local_14.IsValid()))
        {
            return false;
        }
        if (int(this.BindDir) == 0)
        {
            OutMaster = local_4;
            OutSlave = local_14;
        }
        else
        {
            OutMaster = local_14;
            OutSlave = local_4;
        }
        return true;
    }
    FECSEntity ResolvePairEntity(const FAIBehaviorTreeContext &inout Context, const FECSEntity &inout Self) const
    {
        if (int(this.PairRefSource) == 0)
        {
            return Self.GetBB_Entity(this.PairEntityBBKey);
        }
        UBlackboardComponent local_10 = Context.GetOwnerComponent().GetBlackboardComponent();
        if (local_10 == nullptr)
        {
            return FECSEntity();
        }
        FECSEntity local_8 = FECSEntity(local_10.GetValueAsEntityId(this.PairBlackboardKey.SelectedKeyName));
        return local_8;
    }
}

