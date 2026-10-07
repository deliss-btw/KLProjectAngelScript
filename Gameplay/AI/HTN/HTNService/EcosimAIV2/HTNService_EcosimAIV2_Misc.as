

class UHTNService_EcosimAIV2_Test : UHTNService_ECSScriptBase
{
    UHTNService_EcosimAIV2_Test()
    {
        return;
    }
}

class UHTNService_EcosimAIV2_TestExecusionFlow : UHTNService_ECSScriptBase
{
    UHTNService_EcosimAIV2_TestExecusionFlow()
    {
        return;
    }
    UFUNCTION()
    void ExecutionStart_Implementation(const FHTNContext &inout Context)
    {
        XLog(ELog(0), FString().Append("Service TestExecusionFlow ExecutionStart ").Append(this.GetNodeName()));
        return;
    }
    UFUNCTION()
    void ExecutionFinish_Implementation(const FHTNContext &inout Context, const EHTNNodeResult NodeResult)
    {
        XLog(ELog(0), FString().Append("Service TestExecusionFlow ExecutionFinish ").Append(this.GetNodeName()));
        return;
    }
}

class UHTNService_EcosimAIV2_RequestTeamMove : UHTNService_ECSScriptBase
{
    UPROPERTY()
    bool bRequestWhileExecutionStart = false;
    UPROPERTY()
    bool bQuitWhileExecutionFinish = false;


    UFUNCTION()
    void ExecutionStart_Implementation(const FHTNContext &inout Context)
    {
        if (!(this.bRequestWhileExecutionStart))
        {
            return;
        }
        ::FEcosimAIV2Utils::EntityRequestMoveInTeam(FECSEntity(Context.PawnEntity));
        return;
    }
    UFUNCTION()
    void ExecutionFinish_Implementation(const FHTNContext &inout Context, const EHTNNodeResult NodeResult)
    {
        if (!(this.bQuitWhileExecutionFinish))
        {
            return;
        }
        ::FEcosimAIV2Utils::EntityQuitMoveInTeam(FECSEntity(Context.PawnEntity));
        return;
    }
}

class UHTNService_EcosimAIV2_LookatTarget : UHTNService_ECSScriptBase
{
    UPROPERTY()
    FBlackboardKeySelector LookatTargetEntityID;
    FTargetEntity LookatTargetEntity;

    UHTNService_EcosimAIV2_LookatTarget()
    {
        return;
    }
    UFUNCTION()
    void ExecutionStart_Implementation(const FHTNContext &inout Context)
    {
        FECSEntity local_4 = FECSEntity(Context.PawnEntity);
        this.LookatTargetEntity = FTargetEntity(FECSEntity(HTNNode::GetWorldStateValueAsEntityId(Context, this.LookatTargetEntityID)));
        GetDefaulted local_26;
        FECSEntity local_10 = this.LookatTargetEntity.GetEntity();
        FVector local_44 = (FVector(local_26.opCall().GetPosition()) - local_26.opCall().GetPosition());
        FAIInputUtils::SimulateViewInput(local_4, FRotator::MakeFromX(local_44));
        return;
    }
    UFUNCTION()
    void Tick_Implementation(const FHTNContext &inout Context, const float32 DeltaTime)
    {
        FECSEntity local_4 = FECSEntity(Context.PawnEntity);
        GetDefaulted local_14;
        FECSEntity local_24 = this.LookatTargetEntity.GetEntity();
        FVector local_36 = (FVector(local_14.opCall().GetPosition()) - local_14.opCall().GetPosition());
        FAIInputUtils::SimulateViewInput(local_4, FRotator::MakeFromX(local_36));
        return;
    }
    UFUNCTION()
    void ExecutionFinish_Implementation(const FHTNContext &inout Context, const EHTNNodeResult NodeResult)
    {
        FAIInputUtils::SimulateViewInput(FECSEntity(Context.PawnEntity), FRotator::ZeroRotator);
        return;
    }
}

class UHTNService_EcosimAIV2_LevelControlLookatTarget : UHTNService_ECSScriptBase
{
    UPROPERTY()
    FAISmart_Vector LookatTargetLocation;
    UPROPERTY()
    FAISmart_Bool bLookAtEntity;
    UPROPERTY()
    FAISmart_EntityId LookatTargetEntityID;
    UPROPERTY()
    FAISmart_Bool bEnableLookAtTarget;

    UHTNService_EcosimAIV2_LevelControlLookatTarget()
    {
        return;
    }
    UFUNCTION()
    void ExecutionStart_Implementation(const FHTNContext &inout Context)
    {
        bool local_3 = false;
        GetDefaulted local_24;
        FAISmartValueContext local_2 = Context.opImplConv();
        local_3 = !local_3;
        if (local_3)
        {
            FAIInputUtils::SimulateViewInput(FECSEntity(Context.PawnEntity), FRotator::ZeroRotator);
            return;
        }
        FVector local_14;
        FAISmartValueContext local_2_2 = Context.opImplConv();
        if (local_3)
        {
            FECSEntity local_20 = FECSEntity(this.LookatTargetEntityID.GetValue(Context.opImplConv()));
            local_14 = local_24.opCall().GetPosition();
        }
        else
        {
            local_14 = this.LookatTargetLocation.GetValue(Context.opImplConv());
        }
        FVector local_30 = (local_14 - FVector(local_24.opCall().GetPosition()));
        FECSEntity local_48;
        FAIInputUtils::SimulateViewInput(local_48, Context.PawnEntity);
        return;
    }
    UFUNCTION()
    void Tick_Implementation(const FHTNContext &inout Context, const float32 DeltaTime)
    {
        bool local_3 = false;
        GetDefaulted local_24;
        FAISmartValueContext local_2 = Context.opImplConv();
        local_3 = !local_3;
        if (local_3)
        {
            FAIInputUtils::SimulateViewInput(FECSEntity(Context.PawnEntity), FRotator::ZeroRotator);
            return;
        }
        FVector local_14;
        FAISmartValueContext local_2_2 = Context.opImplConv();
        if (local_3)
        {
            FECSEntity local_20 = FECSEntity(this.LookatTargetEntityID.GetValue(Context.opImplConv()));
            local_14 = local_24.opCall().GetPosition();
        }
        else
        {
            local_14 = this.LookatTargetLocation.GetValue(Context.opImplConv());
        }
        FVector local_30 = (local_14 - FVector(local_24.opCall().GetPosition()));
        FECSEntity local_48;
        FAIInputUtils::SimulateViewInput(local_48, Context.PawnEntity);
        return;
    }
    UFUNCTION()
    void ExecutionFinish_Implementation(const FHTNContext &inout Context, const EHTNNodeResult NodeResult)
    {
        FAIInputUtils::SimulateViewInput(FECSEntity(Context.PawnEntity), FRotator::ZeroRotator);
        return;
    }
}

class UHTNService_EcosimAIV2_PlanRelationWithTarget : UHTNService_ECSScriptBase
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


    UFUNCTION()
    void OnPlanExecutionStarted_Implementation(const FHTNContext &inout Context)
    {
        FECSEntity local_4;
        FECSEntity local_8;
        EEcosimAIV2EntityRelation local_9 = EEcosimAIV2EntityRelation(0);
        int local_11 = -1;
        int local_13 = -1;
        if (!(this.ResolveRelation(Context, local_4, local_8, local_9, local_11, local_13)))
        {
            return;
        }
        ::FEcosimAIV2Utils::AddEntityRelation(local_4, local_8, EEcosimAIV2EntityRelation(local_9), true);
        if (local_11 >= 0)
        {
            ::FEcosimAIV2Utils::AddInteractRelation(local_4, local_8, local_11, local_13, true);
        }
        this.OnPlanRelationChange(local_4);
        return;
    }
    UFUNCTION()
    void ExecutionFinish_Implementation(const FHTNContext &inout Context, const EHTNNodeResult NodeResult)
    {
        FECSEntity local_4;
        FECSEntity local_8;
        EEcosimAIV2EntityRelation local_9 = EEcosimAIV2EntityRelation(0);
        int local_11 = -1;
        int local_13 = -1;
        if (!(this.ResolveRelation(Context, local_4, local_8, local_9, local_11, local_13)))
        {
            return;
        }
        ::FEcosimAIV2Utils::RemoveEntityRelation(local_4, local_8, EEcosimAIV2EntityRelation(local_9), true);
        if (local_11 >= 0)
        {
            ::FEcosimAIV2Utils::RemoveInteractRelation(local_4, local_8, local_11, local_13, true);
        }
        this.OnPlanRelationChange(local_4);
        return;
    }
    UFUNCTION()
    void OnPlanExecutionFinished_Implementation(const FHTNContext &inout Context, const EHTNPlanExecutionFinishedResult Result)
    {
        FECSEntity local_4;
        FECSEntity local_8;
        EEcosimAIV2EntityRelation local_9 = EEcosimAIV2EntityRelation(0);
        int local_11 = -1;
        int local_13 = -1;
        if (!(this.ResolveRelation(Context, local_4, local_8, local_9, local_11, local_13)))
        {
            return;
        }
        ::FEcosimAIV2Utils::RemoveEntityRelation(local_4, local_8, EEcosimAIV2EntityRelation(local_9), true);
        if (local_11 >= 0)
        {
            ::FEcosimAIV2Utils::RemoveInteractRelation(local_4, local_8, local_11, local_13, true);
        }
        this.OnPlanRelationChange(local_4);
        return;
    }
    bool ResolveRelation(const FHTNContext &inout Context, FECSEntity &inout OutSource, FECSEntity &inout OutTarget, EEcosimAIV2EntityRelation &inout OutRelation, int &inout OutPointIndex, int &inout OutBehaviorIndex)
    {
        FECSEntityId local_3;
        UInteractionBehaviorBase local_18;
        FAISmartValueContext local_2 = Context.opImplConv();
        OutSource = FECSEntity();
        FAISmartValueContext local_2_2 = Context.opImplConv();
        OutTarget = FECSEntity();
        OutRelation = EEcosimAIV2EntityRelation(0);
        OutPointIndex = -1;
        int local_10 = -1;
        OutBehaviorIndex = local_10;
        if (!(OutSource.IsValid()) || !(OutTarget.IsValid()))
        {
            return false;
        }
        if (this.bByIndex)
        {
            FAISmartValueContext local_2_3 = Context.opImplConv();
            OutPointIndex = local_10;
            FAISmartValueContext local_2_4 = Context.opImplConv();
            OutBehaviorIndex = local_10;
        }
        else
        {
            if (!(this.InteractBehaviorClass.IsNull()))
            {
                FInteractionPointAndBehaviorIndex local_14;
                bool local_11 = ::FInteractUtils::GetInteractionPointAndBehaviorIndexByBehaviorClass(OutTarget, this.InteractBehaviorClass.Get(), local_14, true);
                if (local_11)
                {
                    OutPointIndex = local_14.GetPointIndex();
                    OutBehaviorIndex = local_14.GetBehaviorIndex();
                }
            }
        }
        if (this.bByIndex)
        {
            if (OutPointIndex >= 0)
            {
                local_18 = ::FInteractUtils::GetInteractionBehaviorCDO(OutTarget, OutPointIndex, OutBehaviorIndex);
            }
        }
        else
        {
            if (!(this.InteractBehaviorClass.IsNull()))
            {
                local_18 = this.InteractBehaviorClass.Get().GetDefaultObject();
            }
        }
        if (local_18 != nullptr)
        {
            OutRelation = local_18.NPCPostInteractRelation;
            if (int(OutRelation) == 0)
            {
                OutTarget.GetId();
                OutSource.GetId();
                XError(ELog(30), FString().Append("[PlanRelationWithTarget] Behavior ").Append(local_18.GetClass().GetName()).Append(" NPCPostInteractRelation is None, must be configured for plan execution. Source=").Append(local_3).Append(local_3).Append(" Target="));
            }
        }
        return (int(OutRelation) != 0);
    }
    void OnPlanRelationChange(const FECSEntity &inout Entity)
    {
        if (::FEcosimAIV2Utils::IsEntityInTeamMovingState(Entity))
        {
            ::FEcosimAIV2Utils::EntityRequestMoveInTeam(Entity);
        }
        return;
    }
}

class UHTNService_EcosimAIV2_GetTeamMoveTargetTransform : UHTNService_ECSScriptBase
{
    UPROPERTY()
    FBlackboardKeySelector TargetLocation;

    UHTNService_EcosimAIV2_GetTeamMoveTargetTransform()
    {
        this.TargetLocation.AddVectorFilter(this, n"TargetLocation");
        return;
    }
    UFUNCTION()
    void ExecutionStart_Implementation(const FHTNContext &inout Context)
    {
        this.SetValue(Context, Context.PawnEntity);
        return;
    }
    UFUNCTION()
    void Tick_Implementation(const FHTNContext &inout Context, const float32 DeltaTime)
    {
        this.SetValue(Context, Context.PawnEntity);
        return;
    }
    void SetValue(const FHTNContext &inout Context, const FECSEntity &inout Entity)
    {
        Get local_4;
        if (local_4.opCall())
        {
            Get local_12;
            const FC_EcosimAIV2Team& local_14 = local_12.opCall();
            if (local_14)
            {
                FEcosimaiV2TeamMoveContext local_26;
                if (local_14.GetMoveContext(Entity, local_26))
                {
                    HTNNode::SetWorldStateValueAsVector(Context, this.TargetLocation, local_26.TargetLocation);
                }
            }
        }
        return;
    }
}

struct FHTNService_GetTargetEntityInteractTransformInstanceData
{
    UPROPERTY()
    int InteractPointIndex = -1;


}

class UHTNService_EcosimAIV2_GetEntityInteractTransform : UHTNService_ECSScriptBase
{
    UPROPERTY()
    bool bByIndex;
    UPROPERTY()
    TSoftClassPtr<UInteractionBehaviorBase> InteractBehaviorClass;
    UPROPERTY()
    FAISmart_Int32 InteractPointIndex;
    UPROPERTY()
    FAISmart_EntityId EntityID;
    UPROPERTY()
    FBlackboardKeySelector TargetLocation;

    default SetNodeName("GetEntityInteractTransform");

    UHTNService_EcosimAIV2_GetEntityInteractTransform()
    {
        this.bByIndex = false;
        this.TargetLocation.AddVectorFilter(this, n"TargetLocation");
        this.TargetLocation.SelectedKeyName = n"TargetLocation";
        return;
    }
    UFUNCTION()
    UScriptStruct GetInstanceDataType_Implementation() const
    {
        return FHTNService_GetTargetEntityInteractTransformInstanceData;
    }
    UFUNCTION()
    void ExecutionStart_Implementation(const FHTNContext &inout Context)
    {
        int local_3 = -1;
        FHTNService_GetTargetEntityInteractTransformInstanceData local_2;
        local_2.InteractPointIndex = local_3;
        FECSEntity local_12 = FECSEntity(this.EntityID.GetValue(Context.opImplConv()));
        if (this.bByIndex)
        {
            FAISmartValueContext local_6 = Context.opImplConv();
            local_2.InteractPointIndex = local_3;
        }
        else
        {
            if (!(this.InteractBehaviorClass.IsNull()))
            {
                FInteractionPointAndBehaviorIndex local_20;
                bool local_23 = ::FInteractUtils::GetInteractionPointAndBehaviorIndexByBehaviorClass(local_12, this.InteractBehaviorClass.Get(), local_20, true);
                if (local_23)
                {
                    local_2.InteractPointIndex = local_20.GetPointIndex();
                }
            }
        }
        this.GetLocation(Context);
        return;
    }
    UFUNCTION()
    void Tick_Implementation(const FHTNContext &inout Context, const float32 DeltaTime)
    {
        this.GetLocation(Context);
        return;
    }
    FHTNService_GetTargetEntityInteractTransformInstanceData GetInstanceData(const FHTNContext &inout Context) const
    {
        FHTNService_GetTargetEntityInteractTransformInstanceData __r;
        return __r;
    }
    void GetLocation(const FHTNContext &inout Context)
    {
        FHTNService_GetTargetEntityInteractTransformInstanceData& local_2;
        FECSEntity local_10 = FECSEntity(this.EntityID.GetValue(Context.opImplConv()));
        if (int(local_2.InteractPointIndex) >= 0)
        {
            FVector local_24;
            FQuat local_32;
            if (::FInteractUtils::GetInteractTargetLocationAndRotation(local_10, int(local_2.InteractPointIndex), ECS::GetContextTime(), local_24, local_32, false))
            {
                HTNNode::SetWorldStateValueAsVector(Context, this.TargetLocation, local_24);
            }
        }
        return;
    }
}

class UHTNService_EcosimAIV2_ChangeMainStance : UHTNService_ECSScriptBase
{
    UPROPERTY()
    FAISmart_EntityId TargetEntityID;
    UPROPERTY()
    EEcosimAIHumanityMainStance MainStance;

    UHTNService_EcosimAIV2_ChangeMainStance()
    {
        return;
    }
    UFUNCTION()
    void ExecutionStart_Implementation(const FHTNContext &inout Context)
    {
        ::FEcosimAIV2Utils::SetNPCMainStance(FECSEntity(this.TargetEntityID.GetValue(Context.opImplConv())), this.MainStance);
        return;
    }
    UFUNCTION()
    void ExecutionFinish_Implementation(const FHTNContext &inout Context, const EHTNNodeResult NodeResult)
    {
        ::FEcosimAIV2Utils::SetNPCMainStance(FECSEntity(this.TargetEntityID.GetValue(Context.opImplConv())), EEcosimAIHumanityMainStance(0));
        return;
    }
}

class UHTNService_EcosimAIV2_ChangeMainPose : UHTNService_ECSScriptBase
{
    UPROPERTY()
    FAISmart_EntityId TargetEntityID;
    UPROPERTY()
    EEcosimAIHumanityMainPose EnterPose;
    UPROPERTY()
    EEcosimAIHumanityMainPose ExitPose;

    default SetNodeName("ChangeMainPose");

    UHTNService_EcosimAIV2_ChangeMainPose()
    {
        return;
    }
    UFUNCTION()
    void ExecutionStart_Implementation(const FHTNContext &inout Context)
    {
        FECSEntity local_12 = FECSEntity(this.TargetEntityID.GetValue(Context.opImplConv()));
        if (local_12.IsValid())
        {
            ::FEcosimAIV2Utils::SetNPCMainPose(local_12, this.EnterPose);
        }
        return;
    }
    UFUNCTION()
    void ExecutionFinish_Implementation(const FHTNContext &inout Context, const EHTNNodeResult NodeResult)
    {
        FECSEntity local_12 = FECSEntity(this.TargetEntityID.GetValue(Context.opImplConv()));
        if (local_12.IsValid())
        {
            ::FEcosimAIV2Utils::SetNPCMainPose(local_12, this.ExitPose);
        }
        return;
    }
}

class UHTNService_EcosimAIV2_PlanInteractRelationWithTarget : UHTNService_ECSScriptBase
{
    UPROPERTY()
    FAISmart_EntityId EntityID;
    UPROPERTY()
    FAISmart_EntityId TargetEntityID;
    UPROPERTY()
    FAISmart_Int32 InteractPointIndex;
    UPROPERTY()
    FAISmart_Int32 InteractBehaviorIndex;

    default SetNodeName("PlanInteractRelationWithTarget");

    UHTNService_EcosimAIV2_PlanInteractRelationWithTarget()
    {
        return;
    }
    UFUNCTION()
    void OnPlanExecutionStarted_Implementation(const FHTNContext &inout Context)
    {
        int local_17 = 0;
        int local_18 = 0;
        FECSEntity local_12 = FECSEntity(this.EntityID.GetValue(Context.opImplConv()));
        FECSEntity local_4 = FECSEntity(this.TargetEntityID.GetValue(Context.opImplConv()));
        FAISmartValueContext local_6 = Context.opImplConv();
        FAISmartValueContext local_6_2 = Context.opImplConv();
        if (!(local_12.IsValid()) || !(local_4.IsValid()))
        {
            return;
        }
        ::FEcosimAIV2Utils::AddInteractRelation(local_12, local_4, local_18, local_17, true);
        return;
    }
    UFUNCTION()
    void ExecutionFinish_Implementation(const FHTNContext &inout Context, const EHTNNodeResult NodeResult)
    {
        int local_17 = 0;
        int local_18 = 0;
        FECSEntity local_12 = FECSEntity(this.EntityID.GetValue(Context.opImplConv()));
        FECSEntity local_4 = FECSEntity(this.TargetEntityID.GetValue(Context.opImplConv()));
        FAISmartValueContext local_6 = Context.opImplConv();
        FAISmartValueContext local_6_2 = Context.opImplConv();
        if (!(local_12.IsValid()) || !(local_4.IsValid()))
        {
            return;
        }
        ::FEcosimAIV2Utils::RemoveInteractRelation(local_12, local_4, local_18, local_17, true);
        return;
    }
    UFUNCTION()
    void OnPlanExecutionFinished_Implementation(const FHTNContext &inout Context, const EHTNPlanExecutionFinishedResult Result)
    {
        int local_17 = 0;
        int local_18 = 0;
        FECSEntity local_12 = FECSEntity(this.EntityID.GetValue(Context.opImplConv()));
        FECSEntity local_4 = FECSEntity(this.TargetEntityID.GetValue(Context.opImplConv()));
        FAISmartValueContext local_6 = Context.opImplConv();
        FAISmartValueContext local_6_2 = Context.opImplConv();
        if (!(local_12.IsValid()) || !(local_4.IsValid()))
        {
            return;
        }
        ::FEcosimAIV2Utils::RemoveInteractRelation(local_12, local_4, local_18, local_17, true);
        return;
    }
}

class UHTNService_EcosimAIV2_SetHUDIndicatorConfig : UHTNService_ECSScriptBase
{
    UPROPERTY()
    FAISmart_EntityId TargetEntityID;

    default SetNodeName("SetHUDIndicatorConfig");

    UHTNService_EcosimAIV2_SetHUDIndicatorConfig()
    {
        this.TargetEntityID.SetKey(n"SelfEntity");
        return;
    }
    UFUNCTION()
    void ExecutionStart_Implementation(const FHTNContext &inout Context)
    {
        XWarning(ELog(22), "UHTNService_EcosimAIV2_SetHUDIndicatorConfig е·Іеєџејѓдё”дёЌе†Ќз”џж•€пјљHUDIndicatorSystem е·Іиў«еџєдєЋ Spot зљ„ Indicator / HeadsUpDisplay дЅ“зі»еЏ–д»ЈгЂ‚");
        return;
    }
    UFUNCTION()
    void ExecutionFinish_Implementation(const FHTNContext &inout Context, const EHTNNodeResult NodeResult)
    {
        return;
    }
}

class UHTNService_EcosimAIV3_UpdateMountSeatInfo : UHTNService_ECSScriptBase
{
    UPROPERTY()
    FBlackboardKeySelector VehicleEntityID;
    UPROPERTY()
    bool ReservedDriverSeat = false;


    UFUNCTION()
    void OnPlanExecutionStarted_Implementation(const FHTNContext &inout Context)
    {
        bool local_15;
        Get local_40;
        FECSEntity local_4 = FECSEntity(Context.PawnEntity);
        if (!(FECSEntity(HTNNode::GetWorldStateValueAsEntityId(Context, this.VehicleEntityID)).IsValid()))
        {
            local_15 = false;
        }
        else
        {
            Has local_20;
            local_15 = local_20.opCall();
        }
        if (!(local_15))
        {
            local_15 = false;
        }
        else
        {
            Has local_26;
            local_15 = local_26.opCall();
        }
        if (local_15)
        {
            Modify local_30;
            FC_RuntimeMountSeatInfo& local_32 = local_30.opCall();
            if (local_32)
            {
                if (this.ReservedDriverSeat)
                {
                    int local_33 = local_32.GetModify_ReservedByEntities().Num();
                    if (local_33 < 1)
                    {
                        local_32.GetModify_ReservedByEntities().SetNum(local_40.opCall().MountSeatInfos.Num());
                    }
                    local_33 = local_32.GetModify_ReservedByEntities().Num();
                    if (local_33 >= 1)
                    {
                        local_32.GetModify_ReservedByEntities()[0] = local_4;
                    }
                }
                else
                {
                    int local_33_2 = local_32.GetAvailableSeatIndex(false);
                    if (local_33_2 >= 0 && (local_33_2 < local_40.opCall().MountSeatInfos.Num()))
                    {
                        if (local_32.GetModify_ReservedByEntities().Num() <= local_33_2)
                        {
                            local_32.GetModify_ReservedByEntities().SetNum(local_33_2 + 1);
                        }
                        if (local_32.GetModify_ReservedByEntities().Num() > local_33_2)
                        {
                            local_32.GetModify_ReservedByEntities()[local_33_2] = local_4;
                        }
                    }
                }
            }
        }
        return;
    }
    UFUNCTION()
    void OnPlanExecutionFinished_Implementation(const FHTNContext &inout Context, const EHTNPlanExecutionFinishedResult Result)
    {
        bool local_15;
        FECSEntity local_4 = FECSEntity(Context.PawnEntity);
        if (!(FECSEntity(HTNNode::GetWorldStateValueAsEntityId(Context, this.VehicleEntityID)).IsValid()))
        {
            local_15 = false;
        }
        else
        {
            Has local_20;
            local_15 = local_20.opCall();
        }
        if (local_15)
        {
            Modify local_26;
            FC_RuntimeMountSeatInfo& local_28 = local_26.opCall();
            if (local_28)
            {
                int local_29 = 0;
                for (; local_29 < local_28.GetModify_ReservedByEntities().Num(); ++local_29)
                {
                    if ((FECSEntity(local_28.GetModify_ReservedByEntities()[local_29]) == local_4))
                    {
                        local_28.GetModify_ReservedByEntities()[local_29] = FECSEntity();
                    }
                }
            }
        }
        return;
    }
}

class UHTNService_DebugPrintInfo : UHTNService_ECSScriptBase
{
    UPROPERTY()
    FAISmart_Name Info;

    UHTNService_DebugPrintInfo()
    {
        return;
    }
    UFUNCTION()
    void OnPlanExecutionStarted_Implementation(const FHTNContext &inout Context)
    {
        FString local_4 = FString().Append("ExecutionStart: ").Append(this.Info.GetValue(Context.opImplConv()));
        XLog(ELog(0), FString().Append("DebugPrintInfo: ").Append(local_4));
        return;
    }
    UFUNCTION()
    void OnPlanExecutionFinished_Implementation(const FHTNContext &inout Context, const EHTNPlanExecutionFinishedResult Result)
    {
        FString local_4 = FString().Append("ExecutionFinished: ").Append(this.Info.GetValue(Context.opImplConv()));
        XLog(ELog(0), FString().Append("DebugPrintInfo: ").Append(local_4));
        return;
    }
}

class UHTNService_EcosimAIV2_ResolveTeamLeader : UHTNService_ECSScriptBase
{
    UPROPERTY()
    FBlackboardKeySelector bIsTeamLeader;
    UPROPERTY()
    FBlackboardKeySelector TeamLeaderEntityID;

    default SetNodeName("ResolveTeamLeader");

    UHTNService_EcosimAIV2_ResolveTeamLeader()
    {
        this.bIsTeamLeader.SelectedKeyName = n"bIsTeamLeader";
        this.bIsTeamLeader.AddBoolFilter(this, n"bIsTeamLeader");
        this.TeamLeaderEntityID.SelectedKeyName = n"TeamLeaderEntityID";
        this.TeamLeaderEntityID.AddEntityIdFilter(this, n"TeamLeaderEntityID");
        return;
    }
    UFUNCTION()
    void ExecutionStart_Implementation(const FHTNContext &inout Context)
    {
        int local_12 = 0;
        int local_20 = 0;
        FECSEntity local_4 = FECSEntity(Context.PawnEntity);
        if (!(local_4.IsValid()))
        {
            return;
        }
        if (!(local_12) || !(local_12.TeamEntity.IsValid()))
        {
            return;
        }
        if (!(local_20))
        {
            return;
        }
        local_20.ResolveLeader();
        HTNNode::SetWorldStateValueAsBool(Context, this.bIsTeamLeader, (local_20.LeaderEntity == local_4));
        local_20.LeaderEntity.GetId();
        return;
    }
    UFUNCTION()
    void Tick_Implementation(const FHTNContext &inout Context, const float32 DeltaTime)
    {
        int local_12 = 0;
        int local_20 = 0;
        FECSEntity local_4 = FECSEntity(Context.PawnEntity);
        if (!(local_4.IsValid()))
        {
            return;
        }
        if (!(local_12) || !(local_12.TeamEntity.IsValid()))
        {
            return;
        }
        if (!(local_20))
        {
            return;
        }
        HTNNode::SetWorldStateValueAsBool(Context, this.bIsTeamLeader, (local_20.LeaderEntity == local_4));
        local_20.LeaderEntity.GetId();
        return;
    }
}

class UHTNService_EcosimAIV2_CopySmartValueToBlackboard : UHTNService_ECSScriptBase
{
    UPROPERTY()
    FAISmart_AnyValue SourceValue;
    UPROPERTY()
    FBlackboardKeySelector DestKey;

    default SetNodeName("CopySmartValueToBlackboard");

    UHTNService_EcosimAIV2_CopySmartValueToBlackboard()
    {
        this.SourceValue.AddValueFilter(FAISmart_Float);
        this.SourceValue.AddValueFilter(FAISmart_Vector);
        this.SourceValue.AddValueFilter(FAISmart_Int32);
        this.DestKey.AddFloatFilter(this, n"DestKey");
        this.DestKey.AddVectorFilter(this, n"DestKey");
        this.DestKey.AddIntFilter(this, n"DestKey");
        return;
    }
    UFUNCTION()
    void ExecutionStart_Implementation(const FHTNContext &inout Context)
    {
        this.DoCopy(Context);
        return;
    }
    UFUNCTION()
    void Tick_Implementation(const FHTNContext &inout Context, const float32 DeltaTime)
    {
        this.DoCopy(Context);
        return;
    }
    void DoCopy(const FHTNContext &inout Context)
    {
        int local_1 = 0;
        GetValue local_6;
        if (local_6.opCall(Context.opImplConv(), local_1))
        {
            HTNNode::SetWorldStateValueAsFloat(Context, this.DestKey, local_1);
            return;
        }
        else
        {
            FVector local_16;
            GetValue local_20;
            if (local_20.opCall(Context.opImplConv(), local_16))
            {
                HTNNode::SetWorldStateValueAsVector(Context, this.DestKey, local_16);
                return;
            }
            else
            {
                int local_21 = 0;
                GetValue local_26;
                if (local_26.opCall(Context.opImplConv(), local_21))
                {
                    HTNNode::SetWorldStateValueAsInt(Context, this.DestKey, local_21);
                    return;
                }
            }
        }
    }
}

