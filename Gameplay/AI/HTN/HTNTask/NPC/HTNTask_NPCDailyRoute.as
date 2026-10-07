

struct FHTNTask_NPCDailyRouteMoveInstanceData
{
    UPROPERTY()
    int PathPointIndex = 0;
    UPROPERTY()
    float32 BlockedElapsedTime = 0.0f;
    UPROPERTY()
    FVector LastLocation = FVector::ZeroVector;


}

struct FHTNTask_NPCDailyRouteWaitInstanceData
{
    UPROPERTY()
    float32 ElapsedTime = 0.0f;
    UPROPERTY()
    float32 WaitTime = 0.0f;


}

class UHTNTask_NPCDailyRoutePrepareNext : UHTNTask_ECSScriptBase
{
    default SetNodeName("NPC Daily Route Prepare Next");

    UHTNTask_NPCDailyRoutePrepareNext()
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
        bool local_31 = false;
        int local_34 = 0;
        int local_53;
        FECSEntity local_4 = FECSEntity(Context.PawnEntity);
        if (!(local_4.IsValid()))
        {
            this.FinishExecuteWithContext(Context, false);
            return;
        }
        TDataObjectPtr<FNPCDailyRouteConfig> local_30;
        if (!(::FNPCDailyRouteUtils::TryGetRouteConfig(local_4, local_30)) || !(HasRouteNodes()) || local_31 || !(IsLoopStartIndexValid()))
        {
            ::FNPCDailyRouteUtils::ClearPreparedTarget(local_4);
            this.FinishExecuteWithContext(Context, false);
            return;
        }
        bool local_5 = !(local_34.RouteConfig.IsSet()) || !((local_34.RouteConfig.GetDataName() == local_30.GetDataName()));
        if (local_5)
        {
            ::FNPCDailyRouteUtils::InitializeRouteState(local_4, local_30, -1);
        }
        FC_NPCDailyRouteRuntime local_46;
        ::FNPCDailyRouteUtils::ClearPreparedRuntime(local_46);
        if (int(local_46.CurrentNodeIndex) < 0)
        {
            local_53 = 0;
        }
        else
        {
            local_53 = int(local_46.CurrentNodeIndex).GetNextNodeIndex();
        }
        local_5 = !local_5;
        if (local_5)
        {
            this.FinishExecuteWithContext(Context, false);
            return;
        }
        FNPCDailyRouteNodeConfig local_60;
        FNPCDailyRouteNodeConfig local_66;
        local_60 = local_66;
        FNPCDailyRouteRuntimePointInfo local_76;
        UECSHTNComponent local_78 = Context.GetHTNComponent();
        local_5 = !local_5;
        if (local_5)
        {
            local_31 = false;
            this.FinishExecuteWithContext(Context, local_31);
            return;
        }
        local_46.PendingTargetNodeIndex = local_53;
        local_46.TargetPointId = local_60.PointId;
        local_46.TargetAcceptRadius = local_76.AcceptRadius;
        local_46.SelectedStayTime = ::FNPCDailyRouteUtils::SelectStayTime(local_60.StayTime);
        local_46.ActivePathPoints.Empty(0);
        local_46.ActivePathPointIndex = 0;
        local_46.bHasPreparedTarget = true;
        if (unresolved.Nodes.IsValidIndex(int(local_46.CurrentNodeIndex)))
        {
            int local_43 = int(local_46.CurrentNodeIndex);
            FName local_81;
            if ((local_81 == local_60.PointId))
            {
                ::FNPCDailyRouteUtils::ClearPreparedRuntime(local_46);
                this.FinishExecuteWithContext(Context, false);
                return;
            }
            FNPCDailyRouteRuntimeConnectionInfo local_88;
            UECSHTNComponent local_78_2 = Context.GetHTNComponent();
            local_31 = !local_31;
            if (local_31)
            {
                ::FNPCDailyRouteUtils::ClearPreparedRuntime(local_46);
                this.FinishExecuteWithContext(Context, false);
                return;
            }
            local_46.ActivePathPoints = local_88.WorldPathPoints;
        }
        if (local_46.ActivePathPoints.Num() == 0)
        {
            local_46.ActivePathPoints.Add(local_76.Location);
        }
        this.FinishExecuteWithContext(Context, true);
        return;
    }
}

class UHTNTask_NPCDailyRouteMoveAlongPath : UHTNTask_ECSScriptBase
{
    UPROPERTY()
    float32 DefaultAcceptRadius = 100.0f;
    UPROPERTY()
    float32 BlockedTimeout = 1.5f;
    UPROPERTY()
    float32 BlockedMoveDistanceThreshold = 5.0f;

    default SetNodeName("NPC Daily Route Move Along Path");


    UFUNCTION()
    UScriptStruct GetInstanceDataType_Implementation() const
    {
        return FHTNTask_NPCDailyRouteMoveInstanceData;
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
        FC_NPCDailyRouteRuntime local_38;
        Has local_46;
        if (!(::FNPCDailyRouteUtils::TryGetPreparedTarget(Context.PawnEntity, local_38)) || (local_38.ActivePathPoints.Num() == 0) || !(local_46.opCall()))
        {
            if (Context.PawnEntity.IsValid())
            {
                FAIInputUtils::SimulateMoveInputLocal(Context.PawnEntity, FVector::ZeroVector, EAIMoveSimulateType(0), false);
            }
            this.FinishExecuteWithContext(Context, false);
            return;
        }
        FHTNTask_NPCDailyRouteMoveInstanceData local_50;
        local_50.PathPointIndex = FMath::Clamp(int(local_38.ActivePathPointIndex), 0, (local_38.ActivePathPoints.Num() - 1));
        local_50.BlockedElapsedTime = 0.0f;
        Get local_58;
        local_50.LastLocation = local_58.opCall().GetPosition();
        return;
    }
    UFUNCTION()
    void Tick_Implementation(const FHTNContext &inout Context, const float32 DeltaSeconds)
    {
        FHTNTask_NPCDailyRouteMoveInstanceData& local_52;
        int local_56 = 0;
        float32 local_67;
        float32 local_69 = 0.0f;
        FECSEntity local_4 = FECSEntity(Context.PawnEntity);
        FC_NPCDailyRouteRuntime local_42;
        Has local_48;
        if (!(::FNPCDailyRouteUtils::TryGetPreparedTarget(local_4, local_42)) || !(local_48.opCall()))
        {
            if (local_4.IsValid())
            {
                FAIInputUtils::SimulateMoveInputLocal(local_4, FVector::ZeroVector, EAIMoveSimulateType(0), false);
            }
            this.FinishExecuteWithContext(Context, false);
            return;
        }
        if (!(local_42.ActivePathPoints.IsValidIndex(int(local_52.PathPointIndex))))
        {
            FAIInputUtils::SimulateMoveInputLocal(local_4, FVector::ZeroVector, EAIMoveSimulateType(0), false);
            this.FinishExecuteWithContext(Context, true);
            return;
        }
        FVector local_66(local_42.ActivePathPoints[int(local_52.PathPointIndex)]);
        if ((int(local_52.PathPointIndex) + 1) >= local_42.ActivePathPoints.Num())
        {
        }
        else
        {
        }
        float32 local_71 = FMath::Max(1.0f, local_69);
        if (local_56.GetPosition().Distance(local_66) <= local_71)
        {
            ++local_52.PathPointIndex;
            local_69 = 0.0f;
            local_52.BlockedElapsedTime = 0.0f;
            Modify local_80;
            FC_NPCDailyRouteRuntime& local_82 = local_80.opCall();
            if (local_82)
            {
                local_82.ActivePathPointIndex = int(local_52.PathPointIndex);
            }
            if (!(local_42.ActivePathPoints.IsValidIndex(int(local_52.PathPointIndex))))
            {
                FAIInputUtils::SimulateMoveInputLocal(local_4, FVector::ZeroVector, EAIMoveSimulateType(0), false);
                this.FinishExecuteWithContext(Context, true);
            }
            return;
        }
        if (float32(local_56.GetPosition().Distance(local_52.LastLocation)) <= this.BlockedMoveDistanceThreshold)
        {
            local_67 = local_52.BlockedElapsedTime + DeltaSeconds;
        }
        else
        {
            local_67 = 0.0f;
        }
        local_52.BlockedElapsedTime = local_67;
        local_52.LastLocation = local_56.GetPosition();
        if ((this.BlockedTimeout > 0.0f && (local_52.BlockedElapsedTime >= this.BlockedTimeout)))
        {
            FAIInputUtils::SimulateMoveInputLocal(local_4, FVector::ZeroVector, EAIMoveSimulateType(0), false);
            return;
        }
        FAIInputUtils::SimulateViewInput(local_4, FAIInputUtils::GetAimInput(local_56.GetPosition(), local_66, local_56.GetRotation().GetUpVector()));
        FAIInputUtils::SimulateMoveInputLocal(local_4, FVector::ForwardVector, EAIMoveSimulateType(0), false);
        return;
    }
    UFUNCTION()
    void OnFinished_Implementation(const FHTNContext &inout Context, const EHTNNodeResult Result)
    {
        if (Context.PawnEntity.IsValid())
        {
            FAIInputUtils::SimulateMoveInputLocal(Context.PawnEntity, FVector::ZeroVector, EAIMoveSimulateType(0), false);
        }
        return;
    }
    FHTNTask_NPCDailyRouteMoveInstanceData GetInstanceData(const FHTNContext &inout Context) const
    {
        FHTNTask_NPCDailyRouteMoveInstanceData __r;
        return __r;
    }
}

class UHTNTask_NPCDailyRouteWaitAndAdvance : UHTNTask_ECSScriptBase
{
    default SetNodeName("NPC Daily Route Wait And Advance");

    UHTNTask_NPCDailyRouteWaitAndAdvance()
    {
        return;
    }
    UFUNCTION()
    UScriptStruct GetInstanceDataType_Implementation() const
    {
        return FHTNTask_NPCDailyRouteWaitInstanceData;
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
        FC_NPCDailyRouteRuntime local_38;
        if (!(::FNPCDailyRouteUtils::TryGetPreparedTarget(Context.PawnEntity, local_38)))
        {
            if (Context.PawnEntity.IsValid())
            {
                FAIInputUtils::SimulateMoveInputLocal(Context.PawnEntity, FVector::ZeroVector, EAIMoveSimulateType(0), false);
            }
            this.FinishExecuteWithContext(Context, false);
            return;
        }
        FAIInputUtils::SimulateMoveInputLocal(Context.PawnEntity, FVector::ZeroVector, EAIMoveSimulateType(0), false);
        FHTNTask_NPCDailyRouteWaitInstanceData local_42;
        local_42.WaitTime = FMath::Max(0.0f, local_38.SelectedStayTime);
        local_42.ElapsedTime = 0.0f;
        if (local_42.WaitTime <= 0.0f)
        {
            ::FNPCDailyRouteUtils::AdvancePreparedTarget(Context.PawnEntity);
            this.FinishExecuteWithContext(Context, true);
        }
        return;
    }
    UFUNCTION()
    void Tick_Implementation(const FHTNContext &inout Context, const float32 DeltaSeconds)
    {
        FC_NPCDailyRouteRuntime local_38;
        if (!(::FNPCDailyRouteUtils::TryGetPreparedTarget(local_38, Context.PawnEntity)))
        {
            if (Context.PawnEntity.IsValid())
            {
                FAIInputUtils::SimulateMoveInputLocal(Context.PawnEntity, FVector::ZeroVector, EAIMoveSimulateType(0), false);
            }
            this.FinishExecuteWithContext(Context, false);
            return;
        }
        FHTNTask_NPCDailyRouteWaitInstanceData local_42;
        local_42.ElapsedTime += DeltaSeconds;
        if (local_42.ElapsedTime >= local_42.WaitTime)
        {
            ::FNPCDailyRouteUtils::AdvancePreparedTarget(Context.PawnEntity);
            this.FinishExecuteWithContext(Context, true);
        }
        return;
    }
    UFUNCTION()
    void OnFinished_Implementation(const FHTNContext &inout Context, const EHTNNodeResult Result)
    {
        if (Context.PawnEntity.IsValid())
        {
            FAIInputUtils::SimulateMoveInputLocal(Context.PawnEntity, FVector::ZeroVector, EAIMoveSimulateType(0), false);
        }
        return;
    }
    FHTNTask_NPCDailyRouteWaitInstanceData GetInstanceData(const FHTNContext &inout Context) const
    {
        FHTNTask_NPCDailyRouteWaitInstanceData __r;
        return __r;
    }
}

