

class UHTNTask_ReAllocateFlockSlot : UHTNTask_ECSScriptBase
{
    UPROPERTY()
    FAISmart_Bool NeedResetOffset;
    UPROPERTY()
    FAISmart_Float ModCountRatiokey = 1.0f;

    UHTNTask_ReAllocateFlockSlot()
    {
        return;
    }
    UFUNCTION()
    void CreatePlanSteps_Implementation(const FHTNContext &inout Context) const
    {
        this.SubmitPlanStep(1, "");
        return;
    }
    UFUNCTION()
    void Execute_Implementation(const FHTNContext &inout Context)
    {
        float32 local_10 = 0.0f;
        bool local_14 = false;
        FECSEntity local_4 = Context.GetControllerEntity();
        float32 local_9 = 1.0f;
        FAISmartValueContext local_12 = Context.opImplConv();
        if (local_10 != 0.0f)
        {
            FAISmartValueContext local_12_2 = Context.opImplConv();
            local_9 = local_10;
        }
        FAISmartValueContext local_12_3 = Context.opImplConv();
        ::FEcologyBehaviorUtils::AllocateChildSlotData(local_4, local_14, local_9);
        this.FinishExecuteWithContext(Context, true);
        return;
    }
}

class UHTNTask_FlockStartActivity : UHTNTask_ECSScriptBase
{
    UHTNTask_FlockStartActivity()
    {
        return;
    }
    UFUNCTION()
    void CreatePlanSteps_Implementation(const FHTNContext &inout Context) const
    {
        FECSEntity local_4 = Context.GetControllerEntity();
        Get local_12;
        if (local_12.opCall())
        {
            this.SubmitPlanStep(1, "");
        }
        return;
    }
    UFUNCTION()
    void Execute_Implementation(const FHTNContext &inout Context)
    {
        FECSEntity local_4 = Context.GetControllerEntity();
        this.FinishExecuteWithContext(Context, true);
        return;
    }
}

class UHTNTask_FlockStartChangeArea : UHTNTask_ECSScriptBase
{
    UPROPERTY()
    FAISmart_EntityId TargetAreaEntityId;
    UPROPERTY()
    bool bNeedChangeAreaServerTrack = false;


    UFUNCTION()
    void CreatePlanSteps_Implementation(const FHTNContext &inout Context) const
    {
        FECSEntity local_4 = FECSEntity(Context.PawnEntity);
        Get local_8;
        if (local_8.opCall())
        {
            this.SubmitPlanStep(1, "");
        }
        return;
    }
    UFUNCTION()
    void Execute_Implementation(const FHTNContext &inout Context)
    {
        FECSEntity local_4 = FECSEntity(Context.PawnEntity);
        float32 local_5 = 800.0f;
        Get local_10;
        const FC_EcologyFlockComponent& local_12 = local_10.opCall();
        if (local_12)
        {
            FECSEntity local_24 = FECSEntity(local_12.LeaderEntity);
            if (!(local_24.IsValid()))
            {
                this.FinishExecuteWithContext(Context, false);
                return;
            }
            local_5 = FECSAIUtils::GetEntityAgentRadius(local_24) * 6.0f;
            FC_ChangeAreaHintRequestTag local_32;
            Assign local_30;
            local_30.opCall(local_32);
        }
        if (!(::FEcologyBehaviorUtils::PrepareChangeAreaData(local_4, this.TargetAreaEntityId.GetValue(Context.opImplConv()), local_5)))
        {
            this.FinishExecuteWithContext(Context, false);
            return;
        }
        if (this.bNeedChangeAreaServerTrack)
        {
            ::FEcologyBehaviorUtils::ChangeAreaStartServerTrackHandler(local_4);
        }
        this.FinishExecuteWithContext(Context, true);
        return;
    }
}

class UHTNTask_StartIdle : UHTNTask_ECSScriptBase
{
    UHTNTask_StartIdle()
    {
        return;
    }
    UFUNCTION()
    void CreatePlanSteps_Implementation(const FHTNContext &inout Context) const
    {
        FECSEntity local_4 = Context.GetControllerEntity();
        Get local_12;
        if (local_12.opCall())
        {
            this.SubmitPlanStep(1, "");
        }
        return;
    }
    UFUNCTION()
    void Execute_Implementation(const FHTNContext &inout Context)
    {
        FECSEntity local_4 = Context.GetControllerEntity();
        ::FEcologyBehaviorUtils::ModifyFlockState(local_4, EFlockBehaviorState(0));
        this.FinishExecuteWithContext(Context, true);
        return;
    }
}

class UHTNTask_ModifyFlockState : UHTNTask_ECSScriptBase
{
    UPROPERTY()
    EFlockBehaviorState NextFlockState;
    UPROPERTY()
    bool ForceModifyOnSameState = false;


    UFUNCTION()
    void CreatePlanSteps_Implementation(const FHTNContext &inout Context) const
    {
        FECSEntity local_4 = Context.GetControllerEntity();
        Get local_12;
        if (local_12.opCall())
        {
            this.SubmitPlanStep(1, "");
        }
        return;
    }
    UFUNCTION()
    void Execute_Implementation(const FHTNContext &inout Context)
    {
        FECSEntity local_4 = Context.GetControllerEntity();
        ::FEcologyBehaviorUtils::ModifyFlockState(local_4, this.NextFlockState);
        this.FinishExecuteWithContext(Context, true);
        return;
    }
}

class UHTNTask_FlockClaimResource : UHTNTask_ECSScriptBase
{
    UPROPERTY()
    FAISmart_EntityId TargetResourceEntityId;
    UPROPERTY()
    bool SendLeaderChangeAreaEvent = false;

    default SetNodeName("FlockClaimResource");


    UFUNCTION()
    void CreatePlanSteps_Implementation(const FHTNContext &inout Context) const
    {
        this.SubmitPlanStep(100, "");
        return;
    }
    UFUNCTION()
    void Execute_Implementation(const FHTNContext &inout Context)
    {
        int local_26 = 0;
        int local_40 = 0;
        FECSEntity local_4 = Context.GetControllerEntity();
        FECSEntity local_8 = FECSEntity(this.TargetResourceEntityId.GetValue(Context.opImplConv()));
        ::FEcologyBehaviorUtils::FlockClaimNewResource(local_4, local_8, true);
        if (this.SendLeaderChangeAreaEvent)
        {
            Get local_68;
            Get local_16;
            if (!(local_16.opCall()))
            {
                this.FinishExecuteWithContext(Context, true);
                return;
            }
            FECSEntity local_8_2 = FECSEntity(local_16.opCall().LeaderEntity);
            if (!(local_26))
            {
                this.FinishExecuteWithContext(Context, true);
                return;
            }
            FECSEntity local_20 = FECSEntity(this.TargetResourceEntityId.GetValue(Context.opImplConv()));
            FFPTime local_36 = FFPTime(-1);
            local_40.LeaderEntity = local_8_2;
            local_40.LeaderCreautreRowData = local_26.Creature;
            local_40.TargetResource = local_20;
            if (local_68.opCall())
            {
                local_40.TargetLocation = local_68.opCall().GetPosition();
            }
        }
        this.FinishExecuteWithContext(Context, true);
        return;
    }
}

class UHTNTask_FlockChangeEmergencyState : UHTNTask_ECSScriptBase
{
    UPROPERTY()
    bool IsEmergency = false;
    UPROPERTY()
    FBlackboardKeySelector DebugOutPut;

    default SetNodeName("FlockChangeEmergencyState");


    UFUNCTION()
    void CreatePlanSteps_Implementation(const FHTNContext &inout Context) const
    {
        this.SubmitPlanStep(1, "");
        return;
    }
    UFUNCTION()
    void Execute_Implementation(const FHTNContext &inout Context)
    {
        ::FEcologyBehaviorUtils::ModifyFlockEmergencyState(0, this.IsEmergency);
        UBlackboardComponent local_6 = Context.GetBlackboardComponent();
        local_6.SetValueAsBool(this.DebugOutPut.SelectedKeyName, this.IsEmergency);
        this.FinishExecuteWithContext(Context, true);
        return;
    }
}

