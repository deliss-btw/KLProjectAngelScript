

// NOTE: class defaults are not authored in this module: UBTDecorator_CheckBattleForAreaState (default scalar field UBTDecorator.FlowAbortMode has no declared value type; load the matching Binds.Cache to author this module's defaults, or rerun with --force to use unverified Binds.Cache types (the result may be wrong)).
// They are carried over byte-exact when this module is recompiled.

class UBTDecorator_CheckBattleForAreaState : UBTDecorator_ECSScriptBase
{
    UPROPERTY()
    FBlackboardKeySelector CheckTarget;
    UPROPERTY()
    EBossBattleForAreaState CheckState;
    UPROPERTY()
    bool CheckNot;

    UBTDecorator_CheckBattleForAreaState()
    {
        this.CheckState = EBossBattleForAreaState(0);
        this.CheckNot = false;
        this.CheckTarget.SelectedKeyName = n"TargetEntityID";
        this.CheckTarget.AddEntityIdFilter(this, n"TargetEntityID");
        return;
    }
    UFUNCTION()
    bool CalculateRawConditionValue_Implementation(const FAIBehaviorTreeContext &inout Context, const FBTNodeMemory &inout NodeMemory) const
    {
        int local_24 = 0;
        FC_EcologyFlockBossBattleForAreaComponent local_34;
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
        if ((int(this.CheckState)) == (int(local_34.BattleForAreaState)))
        {
            return !(this.CheckNot) && true;
        }
        return this.CheckNot || false;
    }
}

class UBTDecorator_CheckTargetAllowedBattleForArea : UBTDecorator_ECSScriptBase
{
    UPROPERTY()
    FBlackboardKeySelector CheckTarget;
    UPROPERTY()
    bool CheckNot;

    UBTDecorator_CheckTargetAllowedBattleForArea()
    {
        this.CheckTarget.SelectedKeyName = n"TargetEntityID";
        this.CheckTarget.AddEntityIdFilter(this, n"TargetEntityID");
        return;
    }
    UFUNCTION()
    bool CalculateRawConditionValue_Implementation(const FAIBehaviorTreeContext &inout Context, const FBTNodeMemory &inout NodeMemory) const
    {
        int local_24 = 0;
        bool local_29;
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
        if (!(local_24.CreatureType))
        {
            return false;
        }
        FEcologyCreatureDefinitionRow local_26;
        bool local_27 = local_26.bEnableBossBattleForArea;
        bool local_7 = !(this.CheckNot);
        bool local_28 = !(false);
        if (local_7 == local_28)
        {
            local_29 = local_27;
        }
        else
        {
            local_29 = !(local_27);
        }
        return local_29;
    }
}

