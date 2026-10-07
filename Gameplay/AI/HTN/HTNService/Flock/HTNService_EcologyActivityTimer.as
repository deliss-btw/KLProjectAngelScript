

class UHTNService_EcologyStateTimer : UHTNService_ECSScriptBase
{
    UPROPERTY()
    FBlackboardKeySelector ActivityTimer;
    UPROPERTY()
    bool ResetOnExecutionFinish;

    UHTNService_EcologyStateTimer()
    {
        return;
    }
    UFUNCTION()
    void Tick_Implementation(const FHTNContext &inout Context, const float32 DeltaTime)
    {
        UBlackboardComponent local_2 = Context.GetBlackboardComponent();
        local_2.SetValueAsFloat(this.ActivityTimer.SelectedKeyName, (local_2.GetValueAsFloat(this.ActivityTimer.SelectedKeyName) + DeltaTime));
        return;
    }
    UFUNCTION()
    void ExecutionFinish_Implementation(const FHTNContext &inout Context, const EHTNNodeResult NodeResult)
    {
        if (this.ResetOnExecutionFinish)
        {
            UBlackboardComponent local_4 = Context.GetBlackboardComponent();
            local_4.SetValueAsFloat(this.ActivityTimer.SelectedKeyName, 0.0f);
        }
        return;
    }
}

class UHTNService_EcologyCountdown : UHTNService_ECSScriptBase
{
    UPROPERTY()
    float32 InitCountdown = 20.0f;
    UPROPERTY()
    FBlackboardKeySelector CountdownKey;


    UFUNCTION()
    void Tick_Implementation(const FHTNContext &inout Context, const float32 DeltaTime)
    {
        float32 local_9;
        UBlackboardComponent local_2 = Context.GetBlackboardComponent();
        float32 local_6 = local_2.GetValueAsFloat(this.CountdownKey.SelectedKeyName);
        if (local_6 > 0.0f)
        {
            if ((local_6 - DeltaTime) < 0.0f)
            {
                local_9 = 0.0f;
            }
            else
            {
                local_9 = local_6 - DeltaTime;
            }
            local_2.SetValueAsFloat(this.CountdownKey.SelectedKeyName, local_9);
        }
        return;
    }
    UFUNCTION()
    void ExecutionStart_Implementation(const FHTNContext &inout Context)
    {
        UBlackboardComponent local_2 = Context.GetBlackboardComponent();
        local_2.SetValueAsFloat(this.CountdownKey.SelectedKeyName, this.InitCountdown);
        return;
    }
    UFUNCTION()
    void ExecutionFinish_Implementation(const FHTNContext &inout Context, const EHTNNodeResult NodeResult)
    {
        UBlackboardComponent local_2 = Context.GetBlackboardComponent();
        local_2.SetValueAsFloat(this.CountdownKey.SelectedKeyName, 0.0f);
        return;
    }
}

class UHTNService_EcologyMuteCombatState : UHTNService_ECSScriptBase
{
    UHTNService_EcologyMuteCombatState()
    {
        return;
    }
    UFUNCTION()
    void ExecutionStart_Implementation(const FHTNContext &inout Context)
    {
        int local_2 = 0;
        if (!(local_2.IsValid()))
        {
            return;
        }
        Get local_8;
        const FC_EcologyFlockComponent& local_10 = local_8.opCall();
        if (local_10)
        {
            FECSEntity local_18 = FECSEntity(local_10.LeaderEntity);
            if (local_18.IsValid())
            {
                ::FAIKnowledgeUtils::AddMuteCombat(local_18, n"NeedChangeAreaToTarget", false);
            }
        }
        return;
    }
    UFUNCTION()
    void ExecutionFinish_Implementation(const FHTNContext &inout Context, const EHTNNodeResult NodeResult)
    {
        int local_2 = 0;
        if (!(local_2.IsValid()))
        {
            return;
        }
        Get local_8;
        const FC_EcologyFlockComponent& local_10 = local_8.opCall();
        if (local_10)
        {
            FECSEntity local_18 = FECSEntity(local_10.LeaderEntity);
            if (local_18.IsValid())
            {
                ::FAIKnowledgeUtils::RemoveMuteCombat(local_18, n"NeedChangeAreaToTarget");
            }
        }
        return;
    }
}

class UHTNService_EcologyAttachGameplayTagToFlockLeader : UHTNService_ECSScriptBase
{
    UPROPERTY()
    FGameplayTagContainer GameplayTagContainer;
    UPROPERTY()
    FName TagSource = n"HTNService_EcologyAttachGameplayTagToFlockLeader";

    UHTNService_EcologyAttachGameplayTagToFlockLeader()
    {
        return;
    }
    UFUNCTION()
    void ExecutionStart_Implementation(const FHTNContext &inout Context)
    {
        int local_4 = 0;
        if (this.GameplayTagContainer.IsEmpty())
        {
            return;
        }
        if (!(local_4.IsValid()))
        {
            return;
        }
        Get local_8;
        const FC_EcologyFlockComponent& local_10 = local_8.opCall();
        if (local_10)
        {
            FECSEntity local_18 = FECSEntity(local_10.LeaderEntity);
            if (local_18.IsValid())
            {
                local_18.AddGameplayTags(this.GameplayTagContainer, this.TagSource);
            }
        }
        return;
    }
    UFUNCTION()
    void ExecutionFinish_Implementation(const FHTNContext &inout Context, const EHTNNodeResult NodeResult)
    {
        int local_4 = 0;
        if (this.GameplayTagContainer.IsEmpty())
        {
            return;
        }
        if (!(local_4.IsValid()))
        {
            return;
        }
        Get local_8;
        const FC_EcologyFlockComponent& local_10 = local_8.opCall();
        if (local_10)
        {
            FECSEntity local_18 = FECSEntity(local_10.LeaderEntity);
            if (local_18.IsValid())
            {
                local_18.RemoveGameplayTags(this.GameplayTagContainer, this.TagSource);
            }
        }
        return;
    }
}

class UHTNService_EcologyChangeAreaDistCheck : UHTNService_ECSScriptBase
{
    UHTNService_EcologyChangeAreaDistCheck()
    {
        return;
    }
    UFUNCTION()
    void ExecutionStart_Implementation(const FHTNContext &inout Context)
    {
        int local_10 = 0;
        FECSEntity::Modify<FC_EcologyFlockBehaviorComponent> local_8 = FECSEntity::Modify<FC_EcologyFlockBehaviorComponent>(FECSEntity(Context.PawnEntity));
        local_10.BehaviorSubTask.bUpdatePosition = true;
        local_10.BehaviorSubTask.bUpdateChangeAreaProgress = true;
        FC_UpdateFlockSubTaskTag local_18;
        Assign local_16;
        local_16.opCall(local_18);
        return;
    }
    UFUNCTION()
    void ExecutionFinish_Implementation(const FHTNContext &inout Context, const EHTNNodeResult NodeResult)
    {
        int local_16 = 0;
        FECSEntity local_4 = FECSEntity(Context.PawnEntity);
        Remove local_8;
        local_8.opCall();
        local_16.BehaviorSubTask.Reset();
        return;
    }
}

class UHTNService_EcologyChangeAreaSpecialCombatCheck : UHTNService_ECSScriptBase
{
    UHTNService_EcologyChangeAreaSpecialCombatCheck()
    {
        return;
    }
    UFUNCTION()
    void ExecutionStart_Implementation(const FHTNContext &inout Context)
    {
        int local_10 = 0;
        FECSEntity local_4 = FECSEntity(Context.PawnEntity);
        if (!(local_10))
        {
            return;
        }
        if (FECSEntity(local_10.LeaderEntity).IsValid())
        {
            FC_EcologyCheckCombatInChangeAreaMoveTag local_26;
            Assign local_24;
            local_24.opCall(local_26);
        }
        return;
    }
    UFUNCTION()
    void ExecutionFinish_Implementation(const FHTNContext &inout Context, const EHTNNodeResult NodeResult)
    {
        int local_10 = 0;
        FECSEntity local_4 = FECSEntity(Context.PawnEntity);
        if (!(local_10))
        {
            return;
        }
        if (FECSEntity(local_10.LeaderEntity).IsValid())
        {
            Has local_24;
            bool local_11 = local_24.opCall();
            if (local_11)
            {
                Remove local_28;
                local_28.opCall();
            }
        }
        return;
    }
}

class UHTNService_EcologyChangeAreaEmergencyHandle : UHTNService_ECSScriptBase
{
    UHTNService_EcologyChangeAreaEmergencyHandle()
    {
        return;
    }
    UFUNCTION()
    void ExecutionStart_Implementation(const FHTNContext &inout Context)
    {
        int local_10 = 0;
        if (!(::FEcologyBehaviorUtils::CheckFlockIsEmergencyState(FECSEntity(Context.PawnEntity))))
        {
            local_10.BehaviorSubTask.bNeedCheckCombatStateForEmergence = true;
            FC_CheckCombatForEmergencyTag local_18;
            Assign local_16;
            local_16.opCall(local_18);
        }
        return;
    }
    UFUNCTION()
    void ExecutionFinish_Implementation(const FHTNContext &inout Context, const EHTNNodeResult NodeResult)
    {
        FECSEntity local_4 = FECSEntity(Context.PawnEntity);
        Has local_14;
        bool local_15 = local_14.opCall();
        if (local_15)
        {
            Remove local_20;
            local_20.opCall();
        }
        Has local_24;
        bool local_15_2 = local_24.opCall();
        if (local_15_2)
        {
            Remove local_28;
            local_28.opCall();
        }
        return;
    }
}

class UHTNDecorator_EcologyFlockIsInCombat : UHTNDecorator_ECSScriptBase
{
    UPROPERTY()
    bool CheckNotInCombat;

    UHTNDecorator_EcologyFlockIsInCombat()
    {
        return;
    }
    UFUNCTION()
    bool PerformConditionCheck_Implementation(const FHTNContext &inout Context, const EHTNDecoratorConditionCheckType CheckType) const
    {
        bool local_2 = ::FEcologyBehaviorUtils::CheckFlockCombatState(Context.PawnEntity);
        if (this.CheckNotInCombat)
        {
            return !(local_2);
        }
        return local_2;
    }
}

class UHTNDecorator_EcologyCheckLeaderNeedReturnToHome : UHTNDecorator_ECSScriptBase
{
    UPROPERTY()
    bool Inverse;

    UHTNDecorator_EcologyCheckLeaderNeedReturnToHome()
    {
        return;
    }
    UFUNCTION()
    bool PerformConditionCheck_Implementation(const FHTNContext &inout Context, const EHTNDecoratorConditionCheckType CheckType) const
    {
        bool local_29;
        if (!(FECSEntity(Context.PawnEntity).IsValid()))
        {
            return false;
        }
        Get local_10;
        const FC_EcologyFlockComponent& local_12 = local_10.opCall();
        if (local_12)
        {
            if (FECSEntity(local_12.LeaderEntity).IsValid())
            {
                bool local_27;
                FC_AIQuitCombatInfo local_26;
                if (!(local_26))
                {
                    return false;
                }
                local_27 = local_26.bNeedReturnToHome;
                if (this.Inverse)
                {
                    local_29 = !(local_27);
                }
                else
                {
                    local_29 = local_27;
                }
                return local_29;
            }
        }
        return false;
    }
}

class UHTNDecorator_EcologyFlockIsEmergency : UHTNDecorator_ECSScriptBase
{
    UPROPERTY()
    bool CheckNotInEmergency;

    UHTNDecorator_EcologyFlockIsEmergency()
    {
        return;
    }
    UFUNCTION()
    bool PerformConditionCheck_Implementation(const FHTNContext &inout Context, const EHTNDecoratorConditionCheckType CheckType) const
    {
        bool local_2 = ::FEcologyBehaviorUtils::CheckFlockIsEmergencyState(Context.PawnEntity);
        if (this.CheckNotInEmergency)
        {
            return !(local_2);
        }
        return local_2;
    }
}

class UHTNDecorator_EcologyCheckForceMuteCombatInChangeArea : UHTNDecorator_ECSScriptBase
{
    UHTNDecorator_EcologyCheckForceMuteCombatInChangeArea()
    {
        return;
    }
    UFUNCTION()
    bool PerformConditionCheck_Implementation(const FHTNContext &inout Context, const EHTNDecoratorConditionCheckType CheckType) const
    {
        int local_12 = 0;
        bool local_2 = false;
        int local_1 = local_2;
        FECSEntity local_6 = FECSEntity(Context.PawnEntity);
        if (!(local_12))
        {
            return (local_1 != 0);
        }
        if (!(local_12.FlockMainCreature))
        {
            return (local_1 != 0);
        }
        FEcologyCreatureDefinitionRow local_14;
        return local_14.ForceMuteCombatInChangeArea;
    }
}

class UHTNDecorator_EcologyLeaderHPCheck : UHTNDecorator_ECSScriptBase
{
    UPROPERTY()
    FBlackboardKeySelector LeaderEntity;
    UPROPERTY()
    FBlackboardKeySelector LeaderHPViewer;
    UPROPERTY()
    FAISmart_Float CheckHpPercent;

    UHTNDecorator_EcologyLeaderHPCheck()
    {
        this.CheckHpPercent = 0.8f;
        this.LeaderEntity.SelectedKeyName = n"LeaderEntityId";
        this.LeaderEntity.AddEntityIdFilter(this, n"LeaderEntityId");
        return;
    }
    UFUNCTION()
    bool PerformConditionCheck_Implementation(const FHTNContext &inout Context, const EHTNDecoratorConditionCheckType CheckType) const
    {
        int local_20 = 0;
        UBlackboardComponent local_2 = Context.GetBlackboardComponent();
        FECSEntity local_14 = FECSEntity(local_2.GetValueAsEntityId(this.LeaderEntity.SelectedKeyName));
        if (!(local_20))
        {
            return false;
        }
        if (local_20.HasAttribute(Attribute::HPMax) && local_20.HasAttribute(Attribute::HP))
        {
            float32 local_27 = local_20.GetAttributeValue(Attribute::HPMax, ECS::GetContextTime());
            float32 local_24 = local_20.GetAttributeValue(Attribute::HP, ECS::GetContextTime());
            if (local_27 > 0.0f)
            {
                float32 local_23 = local_24 / local_27;
                local_2.SetValueAsFloat(this.LeaderHPViewer.SelectedKeyName, local_23);
                FAISmartValueContext local_32 = Context.opImplConv();
                if (local_23 <= 0.0f)
                {
                    return true;
                }
            }
        }
        return false;
    }
}

class UHTNTask_InitLeaderContext : UHTNTask_ECSScriptBase
{
    UPROPERTY()
    FBlackboardKeySelector LeaderEntity;
    UPROPERTY()
    FBlackboardKeySelector ArriveDistance;

    default SetNodeName("InitLeaderContext");

    UHTNTask_InitLeaderContext()
    {
        this.LeaderEntity.SelectedKeyName = n"LeaderEntityId";
        this.LeaderEntity.AddEntityIdFilter(this, n"LeaderEntityId");
        this.ArriveDistance.SelectedKeyName = n"ArriveDistance";
        this.ArriveDistance.AddFloatFilter(this, n"ArriveDistance");
        return;
    }
    UFUNCTION()
    void CreatePlanSteps_Implementation(const FHTNContext &inout Context) const
    {
        FC_EcologyFlockComponent local_8;
        if (!(local_8))
        {
            return;
        }
        UBlackboardComponent local_12 = Context.GetBlackboardComponent();
        FECSEntity local_24 = FECSEntity(local_8.LeaderEntity);
        Get local_28;
        const FC_Collision& local_30 = local_28.opCall();
        if (local_30)
        {
            local_12.SetValueAsFloat(this.ArriveDistance.SelectedKeyName, local_30.GetScaledRadius() * 6.0f);
        }
        local_12.SetValueAsEntityId(this.LeaderEntity.SelectedKeyName, local_8.LeaderEntity);
        this.SubmitPlanStep(1, "");
        return;
    }
    UFUNCTION()
    void Execute_Implementation(const FHTNContext &inout Context)
    {
        this.FinishExecuteWithContext(Context, true);
        return;
    }
}

class UHTNDecorator_CheckLevelChangeAreaRequest : UHTNDecorator_ECSScriptBase
{
    UHTNDecorator_CheckLevelChangeAreaRequest()
    {
        return;
    }
    UFUNCTION()
    bool PerformConditionCheck_Implementation(const FHTNContext &inout Context, const EHTNDecoratorConditionCheckType CheckType) const
    {
        int local_14 = 0;
        FECSEntity local_4 = Context.GetControllerEntity();
        if (local_14.ChangeAreaRequest.Num() > 0)
        {
            return true;
        }
        return false;
    }
}

class UHTNDecorator_CheckMuteAutoChangeArea : UHTNDecorator_ECSScriptBase
{
    UHTNDecorator_CheckMuteAutoChangeArea()
    {
        return;
    }
    UFUNCTION()
    bool PerformConditionCheck_Implementation(const FHTNContext &inout Context, const EHTNDecoratorConditionCheckType CheckType) const
    {
        FECSEntity local_4 = FECSEntity(Context.PawnEntity);
        Has local_10;
        bool local_11 = local_10.opCall();
        return !(local_11);
    }
}

class UHTNDecorator_CheckAllowAutoSearchResource : UHTNDecorator_ECSScriptBase
{
    UHTNDecorator_CheckAllowAutoSearchResource()
    {
        return;
    }
    UFUNCTION()
    bool PerformConditionCheck_Implementation(const FHTNContext &inout Context, const EHTNDecoratorConditionCheckType CheckType) const
    {
        int local_10 = 0;
        FECSEntity local_4 = FECSEntity(Context.PawnEntity);
        if (!(local_10))
        {
            return false;
        }
        return local_10.NoResourceData.bAllowAutoSearchResource;
    }
}

