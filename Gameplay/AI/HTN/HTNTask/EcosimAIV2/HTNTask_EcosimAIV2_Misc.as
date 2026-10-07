

class UHTNTask_EcosimAIV2_Test : UHTNTask_ECSScriptBase
{
    UPROPERTY()
    FBlackboardKeySelector TestBBValue;

    UHTNTask_EcosimAIV2_Test()
    {
        this.TestBBValue.AddIntFilter(this, n"Desc");
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
        XLog(ELog(0), FString().Append("Execute ").Append(this.TestBBValue.SelectedKeyName));
        this.FinishExecuteWithContext(Context, true);
        return;
    }
}

struct FHTNTask_SimpleEntityPublicSpeakInstanceData
{
    UPROPERTY()
    float32 TimeCount = 0.0f;


}

class UHTNTask_EcosimAIV2_SimpleEntityPublicSpeak : UHTNTask_ECSScriptBase
{
    UPROPERTY()
    FAISmart_EntityId EntityID;
    UPROPERTY()
    FAISmart_Name Content;
    UPROPERTY()
    float32 Duration;
    UPROPERTY()
    bool bWaitUntilSpeakEnd;

    default SetNodeName("SimpleEntityPublicSpeak");

    UHTNTask_EcosimAIV2_SimpleEntityPublicSpeak()
    {
        this.Duration = 5.0f;
        this.bWaitUntilSpeakEnd = true;
        this.EntityID.SetKey(n"SelfEntity");
        return;
    }
    UFUNCTION()
    UScriptStruct GetInstanceDataType_Implementation() const
    {
        return FHTNTask_SimpleEntityPublicSpeakInstanceData;
    }
    UFUNCTION()
    void Execute_Implementation(const FHTNContext &inout Context)
    {
        FHTNTask_SimpleEntityPublicSpeakInstanceData local_2;
        local_2.TimeCount = 0.0f;
        FECSEntity local_16 = FECSEntity(this.EntityID.GetValue(Context.opImplConv()));
        if (local_16.IsValid())
        {
            FString local_28 = this.Content.GetValue(Context.opImplConv()).ToString();
            ::FEcosimAIV2Utils::AddLLMSpeakMemoryToEntity(local_16, local_28);
            ::FEcosimAIV2Utils::EntityPublicSpeak(local_16, local_28, this.Duration);
            if (!(this.bWaitUntilSpeakEnd))
            {
                this.FinishExecuteWithContext(Context, true);
            }
        }
        else
        {
            this.FinishExecuteWithContext(Context, false);
        }
        return;
    }
    UFUNCTION()
    void Tick_Implementation(const FHTNContext &inout Context, const float32 DeltaSeconds)
    {
        FHTNTask_SimpleEntityPublicSpeakInstanceData local_2;
        local_2.TimeCount += DeltaSeconds;
        if (local_2.TimeCount >= this.Duration)
        {
            this.FinishExecuteWithContext(Context, true);
        }
        return;
    }
    FHTNTask_SimpleEntityPublicSpeakInstanceData GetInstanceData(const FHTNContext &inout Context) const
    {
        FHTNTask_SimpleEntityPublicSpeakInstanceData __r;
        return __r;
    }
}

class UHTNTask_EcosimAIV2_EntityPublicSpeakByData : UHTNTask_ECSScriptBase
{
    UPROPERTY()
    FAISmart_EntityId EntityID;
    UPROPERTY()
    TDataObjectPtr<FEcosimAIV2LLMPublicSpeakData> SpeakData;

    UHTNTask_EcosimAIV2_EntityPublicSpeakByData()
    {
        return;
    }
    UFUNCTION()
    void Execute_Implementation(const FHTNContext &inout Context)
    {
        FECSEntity local_12 = FECSEntity(this.EntityID.GetValue(Context.opImplConv()));
        if (local_12.IsValid())
        {
            ::FEcosimAIV2Utils::EntityPublicSpeakByLLMPublicSpeakData(local_12, this.SpeakData);
            this.FinishExecuteWithContext(Context, true);
        }
        else
        {
            this.FinishExecuteWithContext(Context, false);
        }
        return;
    }
}

class UHTNTask_EcosimAIV2_EntityClearPublicSpeakDataKeyTimeRecord : UHTNTask_ECSScriptBase
{
    UPROPERTY()
    FAISmart_EntityId EntityID;
    UPROPERTY()
    TDataObjectPtr<FEcosimAIV2LLMPublicSpeakData> SpeakData;

    UHTNTask_EcosimAIV2_EntityClearPublicSpeakDataKeyTimeRecord()
    {
        return;
    }
    UFUNCTION()
    void Execute_Implementation(const FHTNContext &inout Context)
    {
        FECSEntity local_12 = FECSEntity(this.EntityID.GetValue(Context.opImplConv()));
        if (local_12.IsValid())
        {
            ::FEcosimAIV2Utils::EntityClearPublicSpeakDataKeyTimeRecord(local_12, this.SpeakData);
            this.FinishExecuteWithContext(Context, true);
        }
        else
        {
            this.FinishExecuteWithContext(Context, false);
        }
        return;
    }
}

class UHTNTask_EcosimAIV2_TestExecusionFlow : UHTNTask_ECSScriptBase
{
    UPROPERTY()
    bool bPlanSuccess;

    UHTNTask_EcosimAIV2_TestExecusionFlow()
    {
        return;
    }
    UFUNCTION()
    void CreatePlanSteps_Implementation(const FHTNContext &inout Context) const
    {
        if (this.bPlanSuccess)
        {
            XLog(ELog(0), FString().Append("TestExecusionFlow Plan: ").Append(this.GetNodeName()).Append(", true"));
            this.SubmitPlanStep(1, "");
            return;
        }
        XLog(ELog(0), FString().Append("TestExecusionFlow Plan: ").Append(this.GetNodeName()));
        return;
    }
    UFUNCTION()
    void Execute_Implementation(const FHTNContext &inout Context)
    {
        XLog(ELog(0), FString().Append("TestExecusionFlow Execute: ").Append(this.GetNodeName()));
        this.FinishExecuteWithContext(Context, true);
        return;
    }
}

class UHTNTask_EcosimAIV2_InitSelfEntity : UHTNTask_ECSScriptBase
{
    UPROPERTY()
    FBlackboardKeySelector SelfEntityID;

    UHTNTask_EcosimAIV2_InitSelfEntity()
    {
        return;
    }
    UFUNCTION()
    void CreatePlanSteps_Implementation(const FHTNContext &inout Context) const
    {
        FECSEntity local_4 = FECSEntity(Context.PawnEntity);
        local_4.GetId();
        this.SubmitPlanStep(1, "");
        return;
    }
    UFUNCTION()
    void Execute_Implementation(const FHTNContext &inout Context)
    {
        FECSEntity local_4 = FECSEntity(Context.PawnEntity);
        local_4.GetId();
        this.FinishExecuteWithContext(Context, true);
        return;
    }
}

class UHTNTask_EcosimAIV2_DebugStopHTN : UHTNTask_ECSScriptBase
{
    FECSEntity MountEntity;

    UHTNTask_EcosimAIV2_DebugStopHTN()
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
        FECSEntity local_4 = FECSEntity(Context.PawnEntity);
        ::FEcosimAIV2Utils::EntityStopHTN(local_4);
        this.FinishExecuteWithContext(Context, true);
        return;
    }
}

struct FHTNTask_EcosimAIV2DoInteractToTargetInstanceData
{
    UPROPERTY()
    FECSEntity InteractSourceEntity;
    UPROPERTY()
    FECSEntity InteractTargetEntity;
    UPROPERTY()
    int InteractPointIndex = -1;
    UPROPERTY()
    int InteractBehaviorIndex = -1;
    UPROPERTY()
    bool bExecutingInteract = false;
    UPROPERTY()
    float32 TimeCount;
    UPROPERTY()
    float32 TimeOutTime;
    UPROPERTY()
    FGameplayTagContainer MergedSuccessTags;


}

class UHTNTask_EcosimAIV2_DoInteractToTarget : UHTNTask_ECSScriptBase
{
    UPROPERTY()
    bool bByIndex = false;
    UPROPERTY()
    TSoftClassPtr<UInteractionBehaviorBase> InteractBehaviorClass;
    UPROPERTY()
    FAISmart_Int32 InteractPointIndex;
    UPROPERTY()
    FAISmart_Int32 InteractBehaviorIndex;
    UPROPERTY()
    FAISmart_EntityId InteractSourceEntityID;
    UPROPERTY()
    FAISmart_EntityId InteractTargetEntityID;
    UPROPERTY()
    FGameplayTagContainer SuccessWhenMatchAnyGameplayTags;
    UPROPERTY()
    FAISmart_Float TimeOutTime = 2.0f;


    UFUNCTION()
    UScriptStruct GetInstanceDataType_Implementation() const
    {
        return FHTNTask_EcosimAIV2DoInteractToTargetInstanceData;
    }
    UFUNCTION()
    void OnPlanExecutionStarted_Implementation(const FHTNContext &inout Context)
    {
        FECSEntityId local_5 = this.InteractSourceEntityID.GetValue(Context.opImplConv());
        FECSEntityId local_1 = this.InteractTargetEntityID.GetValue(Context.opImplConv());
        XLog(ELog(14), FString().Append("[DoInteractToTarget] PlanStart - SourceId:").Append(local_5.GetIdValue()).Append(" Valid:").Append(FECSEntity(local_5).IsValid()).Append(", TargetId:").Append(local_1.GetIdValue()).Append(" Valid:").Append(FECSEntity(local_1).IsValid()));
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
        // body not fully recovered вЂ” stub [argmismatch:argtype]
    }
    UFUNCTION()
    void Tick_Implementation(const FHTNContext &inout Context, const float32 DeltaSeconds)
    {
        FHTNTask_EcosimAIV2DoInteractToTargetInstanceData local_2;
        local_2.TimeCount += DeltaSeconds;
        FECSEntity local_8 = FECSEntity(Context.PawnEntity);
        Has local_12;
        bool local_13 = local_12.opCall();
        if (local_13)
        {
            return;
        }
        if (local_2.MergedSuccessTags.IsEmpty())
        {
            this.FinishExecuteWithContext(Context, true);
            return;
        }
        if (local_8.MatchAnyGameplayTags(local_2.MergedSuccessTags))
        {
            this.FinishExecuteWithContext(Context, true);
            return;
        }
        if ((local_2.TimeOutTime >= 0.0f && (local_2.TimeCount >= local_2.TimeOutTime)))
        {
            this.FinishExecuteWithContext(Context, false);
            return;
        }
        return;
    }
    UFUNCTION()
    void OnFinished_Implementation(const FHTNContext &inout Context, const EHTNNodeResult Result)
    {
        return;
    }
    FHTNTask_EcosimAIV2DoInteractToTargetInstanceData GetInstanceData(const FHTNContext &inout Context) const
    {
        FHTNTask_EcosimAIV2DoInteractToTargetInstanceData __r;
        return __r;
    }
}

class UHTNTask_EcosimAIV2_QuitMount : UHTNTask_ECSScriptBase
{
    default SetNodeName("QuitMount");

    UHTNTask_EcosimAIV2_QuitMount()
    {
        return;
    }
    UFUNCTION()
    void Execute_Implementation(const FHTNContext &inout Context)
    {
        ::FMountUtils::EntityQuitPublicMount(Context.PawnEntity);
        this.FinishExecuteWithContext(Context, true);
        return;
    }
}

struct FHTNTask_RideAsPassengerWaitInstanceData
{
    UPROPERTY()
    float32 AbortTimeCount = 0.0f;


}

class UHTNTask_EcosimAIV2_RideAsPassengerWait : UHTNTask_ECSScriptBase
{
    UPROPERTY()
    float32 AbortTimeout = 5.0f;

    default SetNodeName("RideAsPassengerWait");


    UFUNCTION()
    UScriptStruct GetInstanceDataType_Implementation() const
    {
        return FHTNTask_RideAsPassengerWaitInstanceData;
    }
    UFUNCTION()
    void Execute_Implementation(const FHTNContext &inout Context)
    {
        Has local_10;
        if (!(FECSEntity(Context.PawnEntity).IsValid()) || !(local_10.opCall()))
        {
            this.FinishExecuteWithContext(Context, true);
        }
        return;
    }
    UFUNCTION()
    void Abort_Implementation(const FHTNContext &inout Context)
    {
        bool local_8;
        FECSEntity local_4 = FECSEntity(Context.PawnEntity);
        FHTNTask_RideAsPassengerWaitInstanceData local_6;
        local_6.AbortTimeCount = 0.0f;
        if (!(local_4.IsValid()))
        {
            local_8 = false;
        }
        else
        {
            Has local_12;
            local_8 = local_12.opCall();
        }
        if (local_8)
        {
            ::FMountUtils::EntityQuitPublicMount(local_4);
        }
        else
        {
            this.FinishAbortWithContext(Context);
        }
        return;
    }
    UFUNCTION()
    void Tick_Implementation(const FHTNContext &inout Context, const float32 DeltaSeconds)
    {
        if (!(this.IsTaskAborting()))
        {
            return;
        }
        FHTNTask_RideAsPassengerWaitInstanceData local_4;
        local_4.AbortTimeCount += DeltaSeconds;
        Has local_14;
        if (!(FECSEntity(Context.PawnEntity).IsValid()) || !(local_14.opCall()) || (local_4.AbortTimeCount >= this.AbortTimeout))
        {
            this.FinishAbortWithContext(Context);
        }
        return;
    }
    FHTNTask_RideAsPassengerWaitInstanceData GetInstanceData(const FHTNContext &inout Context) const
    {
        FHTNTask_RideAsPassengerWaitInstanceData __r;
        return __r;
    }
}

class UHTNTask_EcosimAIV2_TimeCountByTag : UHTNTask_ECSScriptBase
{
    UPROPERTY()
    FAISmart_GameplayTag CountByTag;
    UPROPERTY()
    float32 TimeOutValue = 2.0f;

    default SetNodeName("TimeCountByTag");


    UFUNCTION()
    void Tick_Implementation(const FHTNContext &inout Context, const float32 DeltaSeconds)
    {
        int local_18 = 0;
        FGameplayTag local_6 = this.CountByTag.GetValue(Context.opImplConv());
        if (!(local_6.IsValid()))
        {
            return;
        }
        FECSEntity local_12 = FECSEntity(Context.PawnEntity);
        if ((local_18.TimeCountByTagMap.FindOrAdd(local_6) + DeltaSeconds) >= this.TimeOutValue)
        {
            this.FinishExecuteWithContext(Context, true);
            return;
        }
        return;
    }
}

class UHTNTask_EcosimAIV2_ClearTimeCountByTag : UHTNTask_ECSScriptBase
{
    UPROPERTY()
    FAISmart_GameplayTag Tag;

    default SetNodeName("ClearTimeCountByTag");

    UHTNTask_EcosimAIV2_ClearTimeCountByTag()
    {
        return;
    }
    UFUNCTION()
    void Execute_Implementation(const FHTNContext &inout Context)
    {
        if (!(this.Tag.GetValue(Context.opImplConv()).IsValid()))
        {
            return;
        }
        FECSEntity local_12 = FECSEntity(Context.PawnEntity);
        this.FinishExecuteWithContext(Context, true);
        return;
    }
}

class UHTNTask_EcosimAIV2_LevelControl_MoveToSpecifiedTransformFinished : UHTNTask_ECSScriptBase
{
    UPROPERTY()
    FAISmart_EntityId EntityID;

    default SetNodeName("LevelControl_MoveToSpecifiedTransform");

    UHTNTask_EcosimAIV2_LevelControl_MoveToSpecifiedTransformFinished()
    {
        return;
    }
    UFUNCTION()
    void Execute_Implementation(const FHTNContext &inout Context)
    {
        int local_30 = 0;
        FECSEntity local_12 = FECSEntity(this.EntityID.GetValue(Context.opImplConv()));
        if (local_12.IsValid())
        {
            Get local_18;
            const FC_EcosimAIV2LevelControl& local_20 = local_18.opCall();
            if (local_20)
            {
                FFPTime local_26 = FFPTime(-1);
                local_30.MoveToKeyName = local_20.MoveToKeyName;
            }
            ::FEcosimAIV2Utils::RemoveLevelControlMoveToSpecifiedTransform(local_12);
            this.FinishExecuteWithContext(Context, true);
            return;
        }
        this.FinishExecuteWithContext(Context, false);
        return;
    }
}

class UHTNTask_EcosimAIV2_LevelControl_EventFinished : UHTNTask_ECSScriptBase
{
    UPROPERTY()
    FAISmart_EntityId EntityID;

    default SetNodeName("LevelControl_EventFinished");

    UHTNTask_EcosimAIV2_LevelControl_EventFinished()
    {
        return;
    }
    UFUNCTION()
    void Execute_Implementation(const FHTNContext &inout Context)
    {
        if (FECSEntity(this.EntityID.GetValue(Context.opImplConv())).IsValid())
        {
            FFPTime local_20 = FFPTime(-1);
            ModifyOrAdd local_28;
            FC_EcologyKnowledge& local_30 = local_28.opCall();
            if (local_30)
            {
                local_30.SetBool(FEcologyKnowledgeKey(FName("bUnderLevelControlChangePose")), false);
                local_30.SetBool(FEcologyKnowledgeKey(FName("bUnderLevelControlESMTrigger")), false);
                local_30.SetBool(FEcologyKnowledgeKey(FName("bUnderLevelControlMove")), false);
                local_30.SetBool(FEcologyKnowledgeKey(FName("bUnderLevelControlPlayAction")), false);
                local_30.SetBool(FEcologyKnowledgeKey(FName("bUnderLevelControlInteract")), false);
            }
            this.FinishExecuteWithContext(Context, true);
            return;
        }
        this.FinishExecuteWithContext(Context, false);
        return;
    }
}

struct FHTNTask_EcosimAIV2NPCDoInteractToTargetInstanceData : FHTNTask_EcosimAIV2DoInteractToTargetInstanceData
{
    FHTNTask_EcosimAIV2DoInteractToTargetInstanceData _base_FHTNTask_EcosimAIV2DoInteractToTargetInstanceData;
    UPROPERTY()
    FGameplayTagContainer SuccessWhenMatchAnyGameplayTags;

    FHTNTask_EcosimAIV2NPCDoInteractToTargetInstanceData()
    {
        super();
        return;
    }
}

class UHTNTask_EcosimAIV2_NPCInteractToTarget : UHTNTask_ECSScriptBase
{
    UPROPERTY()
    FAISmart_Int32 InteractPointIndex;
    UPROPERTY()
    FAISmart_Int32 InteractBehaviorIndex;
    UPROPERTY()
    FAISmart_EntityId InteractSourceEntityID;
    UPROPERTY()
    FAISmart_EntityId InteractTargetEntityID;
    UPROPERTY()
    FAISmart_Float TimeOutTime;

    UHTNTask_EcosimAIV2_NPCInteractToTarget()
    {
        return;
    }
    UFUNCTION()
    UScriptStruct GetInstanceDataType_Implementation() const
    {
        return FHTNTask_EcosimAIV2NPCDoInteractToTargetInstanceData;
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
        int local_11 = 0;
        FHTNTask_EcosimAIV2DoInteractToTargetInstanceData local_2;
        local_2._base_FHTNTask_EcosimAIV2DoInteractToTargetInstanceData = FECSEntity(this.InteractSourceEntityID.GetValue(Context.opImplConv()));
        local_2.InteractTargetEntity = FECSEntity(this.InteractTargetEntityID.GetValue(Context.opImplConv()));
        FAISmartValueContext local_4 = Context.opImplConv();
        local_2.InteractPointIndex = local_11;
        FAISmartValueContext local_4_2 = Context.opImplConv();
        local_2.InteractBehaviorIndex = local_11;
        Has local_18;
        if (!(local_2._base_FHTNTask_EcosimAIV2DoInteractToTargetInstanceData.IsValid()) || !(local_2.InteractTargetEntity.IsValid()) || !(local_18.opCall()) || (int(local_2.InteractPointIndex) < 0))
        {
            this.FinishExecuteWithContext(Context, false);
            return;
        }
        local_2.bExecutingInteract = false;
        float32 local_20 = 0.0f;
        local_2.TimeCount = 0.0f;
        FAISmartValueContext local_4_3 = Context.opImplConv();
        local_2.TimeOutTime = local_20;
        Get local_24;
        const FC_EcologyKnowledge& local_26 = local_24.opCall();
        if (local_26)
        {
            FC_EcologyKnowledge::GetStruct(local_26).opCall(FEcologyKnowledgeKey(FName("SuccessWhenMatchAnyGameplayTags")), local_2.SuccessWhenMatchAnyGameplayTags);
        }
        FInteractionPointAndBehaviorIndex local_36;
        local_36.SetPointIndex(int(local_2.InteractPointIndex));
        local_36.SetBehaviorIndex(int(local_2.InteractBehaviorIndex));
        FFPTime local_42 = FFPTime(-1);
        FCE_ServerTriggerBeginInteractEvent local_44;
        local_44.bIsSecondaryInteract = false;
        local_44.TargetEntity = local_2.InteractTargetEntity;
        local_44.InteractTargetPointAndBehaviorIndex = local_36;
        return;
    }
    UFUNCTION()
    void Tick_Implementation(const FHTNContext &inout Context, const float32 DeltaSeconds)
    {
        FHTNTask_EcosimAIV2DoInteractToTargetInstanceData local_2;
        local_2.TimeCount += DeltaSeconds;
        FECSEntity local_8 = FECSEntity(Context.PawnEntity);
        Has local_12;
        bool local_13 = local_12.opCall();
        if (local_13)
        {
            return;
        }
        FGameplayTagContainer local_26 = FGameplayTagContainer(local_2.SuccessWhenMatchAnyGameplayTags);
        if (local_26.IsEmpty())
        {
            this.FinishExecuteWithContext(Context, true);
            return;
        }
        if ((local_2.TimeOutTime > 0.0f && (local_2.TimeCount >= local_2.TimeOutTime)))
        {
            this.FinishExecuteWithContext(Context, false);
            return;
        }
        if (local_8.MatchAnyGameplayTags(local_26))
        {
            this.FinishExecuteWithContext(Context, true);
            return;
        }
        return;
    }
    UFUNCTION()
    void OnFinished_Implementation(const FHTNContext &inout Context, const EHTNNodeResult Result)
    {
        return;
    }
    FHTNTask_EcosimAIV2NPCDoInteractToTargetInstanceData GetInstanceData(const FHTNContext &inout Context) const
    {
        FHTNTask_EcosimAIV2NPCDoInteractToTargetInstanceData __r;
        return __r;
    }
}

class UHTNTask_EcosimAIV2_GetPathLength : UHTNTask_ECSScriptBase
{
    UPROPERTY()
    FAISmart_EntityId EntityID;
    UPROPERTY()
    FAISmart_Vector TargetLocation;
    UPROPERTY()
    FBlackboardKeySelector PathLength;

    default SetNodeName("GetPathLength");

    UHTNTask_EcosimAIV2_GetPathLength()
    {
        this.PathLength.AddFloatFilter(this, n"PathLength");
        return;
    }
    UFUNCTION()
    void Execute_Implementation(const FHTNContext &inout Context)
    {
        FECSEntity local_8 = FECSEntity(this.EntityID.GetValue(Context.opImplConv()));
        if (local_8.IsValid())
        {
            HTNNode::SetWorldStateValueAsFloat(Context, this.PathLength, FAINavigationUtils::EstimateGroundPathLengthTo(local_8, this.TargetLocation.GetValue(Context.opImplConv())));
            this.FinishExecuteWithContext(Context, true);
            return;
        }
        this.FinishExecuteWithContext(Context, false);
        return;
    }
}

class UHTNTask_EcosimAIV2_SendActionEvent : UHTNTask_ECSScriptBase
{
    UPROPERTY()
    bool bSendTeamEvent = true;
    UPROPERTY()
    EEcosimAIV2ActionEventType ActionEventType;

    default SetNodeName("SendActionEvent");


    UFUNCTION()
    void Execute_Implementation(const FHTNContext &inout Context)
    {
        FCE_EcosimAIV2ActionEvent local_26;
        if (!(FECSEntity(Context.PawnEntity).IsValid()))
        {
            this.FinishExecuteWithContext(Context, false);
            return;
        }
        if (this.bSendTeamEvent)
        {
            Get local_10;
            const FC_EcosimAIV2TeamMember& local_12 = local_10.opCall();
            if (local_12)
            {
                if (FECSEntity(local_12.TeamEntity).IsValid())
                {
                    FFPTime local_22 = FFPTime(-1);
                    local_26.ActionEventType = this.ActionEventType;
                    this.FinishExecuteWithContext(Context, true);
                    return;
                }
            }
            this.FinishExecuteWithContext(Context, false);
            return;
        }
        FFPTime local_22_2 = FFPTime(-1);
        local_26.ActionEventType = this.ActionEventType;
        this.FinishExecuteWithContext(Context, true);
        return;
    }
}

class UHTNTask_EcosimAIV2_RequestTeamMove : UHTNTask_ECSScriptBase
{
    default SetNodeName("RequestTeamMove");

    UHTNTask_EcosimAIV2_RequestTeamMove()
    {
        return;
    }
    UFUNCTION()
    void Execute_Implementation(const FHTNContext &inout Context)
    {
        FECSEntity local_4 = FECSEntity(Context.PawnEntity);
        if (!(local_4.IsValid()))
        {
            this.FinishExecuteWithContext(Context, false);
            return;
        }
        ::FEcosimAIV2Utils::EntityRequestMoveInTeam(local_4);
        this.FinishExecuteWithContext(Context, true);
        return;
    }
}

class UHTNTask_EcosimAIV2_ResolveTeamLeader : UHTNTask_ECSScriptBase
{
    UPROPERTY()
    FBlackboardKeySelector bIsTeamLeader;

    default SetNodeName("ResolveTeamLeader");

    UHTNTask_EcosimAIV2_ResolveTeamLeader()
    {
        this.bIsTeamLeader.SelectedKeyName = n"bIsTeamLeader";
        this.bIsTeamLeader.AddBoolFilter(this, n"bIsTeamLeader");
        return;
    }
    UFUNCTION()
    void Execute_Implementation(const FHTNContext &inout Context)
    {
        int local_12 = 0;
        int local_20 = 0;
        FECSEntity local_4 = FECSEntity(Context.PawnEntity);
        if (!(local_4.IsValid()))
        {
            this.FinishExecuteWithContext(Context, false);
            return;
        }
        if (!(local_12) || !(local_12.TeamEntity.IsValid()))
        {
            this.FinishExecuteWithContext(Context, false);
            return;
        }
        if (!(local_20))
        {
            this.FinishExecuteWithContext(Context, false);
            return;
        }
        local_20.ResolveLeader();
        HTNNode::SetWorldStateValueAsBool(Context, this.bIsTeamLeader, (local_20.LeaderEntity == local_4));
        this.FinishExecuteWithContext(Context, true);
        return;
    }
}

class UHTNTask_EcosimAIV2_GetTeamMoveTargetTransform : UHTNTask_ECSScriptBase
{
    UPROPERTY()
    FBlackboardKeySelector TargetLocation;

    default SetNodeName("GetTeamMoveTargetTransform");

    UHTNTask_EcosimAIV2_GetTeamMoveTargetTransform()
    {
        this.TargetLocation.AddVectorFilter(this, n"TargetLocation");
        return;
    }
    UFUNCTION()
    void Execute_Implementation(const FHTNContext &inout Context)
    {
        FECSEntity local_4 = FECSEntity(Context.PawnEntity);
        if (!(local_4.IsValid()))
        {
            this.FinishExecuteWithContext(Context, false);
            return;
        }
        Get local_10;
        if (local_10.opCall())
        {
            Modify local_16;
            FC_EcosimAIV2Team& local_18 = local_16.opCall();
            if (local_18)
            {
                FEcosimaiV2TeamMoveContext local_30;
                if (local_18.GetMoveContext(local_4, local_30))
                {
                    HTNNode::SetWorldStateValueAsVector(Context, this.TargetLocation, local_30.TargetLocation);
                    this.FinishExecuteWithContext(Context, true);
                    return;
                }
            }
        }
        this.FinishExecuteWithContext(Context, false);
        return;
    }
}

