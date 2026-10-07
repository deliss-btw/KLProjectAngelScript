

class UBTTask_EcologyTryStartBossBattleForArea : UBTTask_ECSScriptBase
{
    UPROPERTY()
    FBlackboardKeySelector SelfEntityId;
    UPROPERTY()
    FBlackboardKeySelector TargetEntityId;

    default SetNodeName("TryStartBossBattleForArea");

    UBTTask_EcologyTryStartBossBattleForArea()
    {
        this.SelfEntityId.SelectedKeyName = n"SelfEntity";
        this.SelfEntityId.AddEntityIdFilter(this, n"SelfEntity");
        this.TargetEntityId.SelectedKeyName = n"TargetEntityID";
        this.TargetEntityId.AddEntityIdFilter(this, n"TargetEntityID");
        return;
    }
    UFUNCTION()
    EBTNodeResult ExecuteTask_Implementation(const FAIBehaviorTreeContext &inout Context, const FBTNodeMemory &inout NodeMemory) const
    {
        int local_2 = 0;
        int local_32 = 0;
        int local_34 = 0;
        FC_EcologyFlockBossBattleForAreaComponent local_48;
        FC_EcologyFlockBossBattleForAreaComponent local_50;
        int local_66 = 0;
        if (!(local_2.IsValid()))
        {
            return EBTNodeResult(1);
        }
        UBlackboardComponent local_6 = Context.GetBlackboardComponent();
        if ((!((local_6 != nullptr))))
        {
            return EBTNodeResult(1);
        }
        FECSEntityId local_9 = local_6.GetValueAsEntityId(this.TargetEntityId.SelectedKeyName);
        FECSEntityId local_10 = local_6.GetValueAsEntityId(this.SelfEntityId.SelectedKeyName);
        FECSEntity local_20 = FECSEntity(local_9);
        FECSEntity local_16 = FECSEntity(local_10);
        if (!(local_20.IsValid()) || !(local_16.IsValid()))
        {
            return EBTNodeResult(1);
        }
        if ((!(local_32) || !(local_34)))
        {
            return EBTNodeResult(1);
        }
        FECSEntity local_24 = FECSEntity(local_32.FlockProxyEntity);
        FECSEntity local_38 = FECSEntity(local_34.FlockProxyEntity);
        if (!(local_24.IsValid()) || !(local_38.IsValid()))
        {
            return EBTNodeResult(1);
        }
        if ((!(local_48) || !(local_50)))
        {
            return EBTNodeResult(1);
        }
        if ((int(local_48.BattleForAreaState) != 0 || (int(local_50.BattleForAreaState) != 0)))
        {
            return EBTNodeResult(1);
        }
        FFPTime local_64 = FFPTime(-1);
        local_66.AttackerCreature = local_16;
        local_66.AttackerFlock = local_38;
        local_66.DefenderCreature = local_20;
        local_66.DefenderFlock = local_24;
        return EBTNodeResult(0);
    }
}

class UBTTask_EcologyBattleForAreaIntoPrepare : UBTTask_ECSScriptBase
{
    default SetNodeName("BattleForAreaIntoPrepare");

    UBTTask_EcologyBattleForAreaIntoPrepare()
    {
        return;
    }
    UFUNCTION()
    EBTNodeResult ExecuteTask_Implementation(const FAIBehaviorTreeContext &inout Context, const FBTNodeMemory &inout NodeMemory) const
    {
        int local_2 = 0;
        int local_10 = 0;
        if (!(local_2.IsValid()))
        {
            return EBTNodeResult(1);
        }
        if (!(local_10))
        {
            return EBTNodeResult(1);
        }
        FECSEntity local_18 = FECSEntity(local_10.FlockProxyEntity);
        if (!(local_18.IsValid()))
        {
            return EBTNodeResult(1);
        }
        ::FEcologyBattleForAreaUtils::ModifyBattleForAreaState(local_18, EBossBattleForAreaState(2));
        return EBTNodeResult(0);
    }
}

class UBTTask_EcologyBattleForAreaFinishStayToNone : UBTTask_ECSScriptBase
{
    default SetNodeName("BattleForAreaFinishStayToNone");

    UBTTask_EcologyBattleForAreaFinishStayToNone()
    {
        return;
    }
    UFUNCTION()
    EBTNodeResult ExecuteTask_Implementation(const FAIBehaviorTreeContext &inout Context, const FBTNodeMemory &inout NodeMemory) const
    {
        int local_2 = 0;
        int local_10 = 0;
        FC_EcologyFlockBossBattleForAreaComponent local_24;
        if (!(local_2.IsValid()))
        {
            return EBTNodeResult(1);
        }
        if (!(local_10))
        {
            return EBTNodeResult(1);
        }
        FECSEntity local_18 = FECSEntity(local_10.FlockProxyEntity);
        if (!(local_18.IsValid()))
        {
            return EBTNodeResult(1);
        }
        if (!(local_24))
        {
            return EBTNodeResult(1);
        }
        if (int(local_24.BattleForAreaState) != 5)
        {
            return EBTNodeResult(1);
        }
        ::FEcologyBattleForAreaUtils::ModifyBattleForAreaState(local_18, EBossBattleForAreaState(0));
        return EBTNodeResult(0);
    }
}

class UBTTask_EcologyBattleForAreaChangeToInBattleNotify : UBTTask_ECSScriptBase
{
    default SetNodeName("BattleForAreaChangeToInBattleNotify");

    UBTTask_EcologyBattleForAreaChangeToInBattleNotify()
    {
        return;
    }
    UFUNCTION()
    EBTNodeResult ExecuteTask_Implementation(const FAIBehaviorTreeContext &inout Context, const FBTNodeMemory &inout NodeMemory) const
    {
        int local_2 = 0;
        int local_10 = 0;
        int local_24 = 0;
        int local_50 = 0;
        if (!(local_2.IsValid()))
        {
            return EBTNodeResult(1);
        }
        if (!(local_10))
        {
            return EBTNodeResult(1);
        }
        if (!(FECSEntity(local_10.FlockProxyEntity).IsValid()))
        {
            return EBTNodeResult(1);
        }
        if (!(local_24))
        {
            return EBTNodeResult(1);
        }
        FECSEntity local_28 = local_24.InstanceContext.AttackerFlock;
        FECSEntity local_32 = local_24.InstanceContext.AttackerBoss;
        FECSEntity local_36 = local_24.InstanceContext.DefenderFlock;
        FECSEntity local_40 = local_24.InstanceContext.DefenderBoss;
        FFPTime local_46 = FFPTime(-1);
        local_50.AttackerFlock = local_28;
        local_50.AttackerBoss = local_32;
        local_50.DefenderFlock = local_36;
        local_50.DefenderBoss = local_40;
        return EBTNodeResult(0);
    }
}

class UBTTask_EcologyTriggerChangeAreaByBattleForAreaFail : UBTTask_ECSScriptBase
{
    default SetNodeName("TriggerChangeAreaByBattleForAreaFail");

    UBTTask_EcologyTriggerChangeAreaByBattleForAreaFail()
    {
        return;
    }
    UFUNCTION()
    EBTNodeResult ExecuteTask_Implementation(const FAIBehaviorTreeContext &inout Context, const FBTNodeMemory &inout NodeMemory) const
    {
        int local_2 = 0;
        int local_10 = 0;
        if (!(local_2.IsValid()))
        {
            return EBTNodeResult(1);
        }
        if (!(local_10))
        {
            return EBTNodeResult(1);
        }
        FECSEntity local_18 = FECSEntity(local_10.FlockProxyEntity);
        if (!(local_18.IsValid()))
        {
            return EBTNodeResult(1);
        }
        FResourceRequestFilterConfig local_94;
        FChangeAreaMessageInfo local_120;
        Get local_128;
        const FC_CreatureMeta& local_130 = local_128.opCall();
        if (local_130)
        {
            if (local_130.CreatureType)
            {
                FEcologyCreatureDefinitionRow local_132;
                FEcologyBossBattleForAreaInfo local_134 = local_132.BossBattleForAreaInfo;
                ::FEcologyBehaviorUtils::AddFlockChangeAreaRequest(local_18, local_94, FEcologyGameplayTagDefine::Ecology_ChangeAreaReasonBattleForAreaForceFail, FEcologyGameplayTagDefine::Ecology_ChangeAreaSourceBTNode, true, local_120, 25000.0f, 50000.0f, 99, !(local_2.MatchGameplayTag(FEcologyGameplayTagDefine::Ecology_ForbidBattleforAreaHint)), true);
                return EBTNodeResult(0);
            }
        }
        return EBTNodeResult(1);
    }
}

