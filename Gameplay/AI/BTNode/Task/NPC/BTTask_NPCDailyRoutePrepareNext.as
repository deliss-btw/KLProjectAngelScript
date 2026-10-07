

class UBTTask_NPCDailyRoutePrepareNext : UBTTask_ECSScriptBase
{
    default SetNodeName("NPC Daily Route Prepare Next");

    UBTTask_NPCDailyRoutePrepareNext()
    {
        return;
    }
    UFUNCTION()
    FString GetStaticDescription_Implementation() const
    {
        return FString().Append(this.GetBaseStaticDescription()).Append("\nV1: choose next daily-route node and cache path points in FC_NPCDailyRouteRuntime.");
    }
    UFUNCTION()
    EBTNodeResult ExecuteTask_Implementation(const FAIBehaviorTreeContext &inout Context, const FBTNodeMemory &inout NodeMemory) const
    {
        bool local_31 = false;
        int local_34 = 0;
        int local_53;
        FECSEntity local_4 = FECSEntity(Context.PawnEntity);
        if (!(local_4.IsValid()))
        {
            return EBTNodeResult(1);
        }
        TDataObjectPtr<FNPCDailyRouteConfig> local_30;
        if (!(::FNPCDailyRouteUtils::TryGetRouteConfig(local_4, local_30)) || !(HasRouteNodes()) || local_31 || !(IsLoopStartIndexValid()))
        {
            ::FNPCDailyRouteUtils::ClearPreparedTarget(local_4);
            return EBTNodeResult(1);
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
            return EBTNodeResult(1);
        }
        FNPCDailyRouteNodeConfig local_60;
        FNPCDailyRouteNodeConfig local_66;
        local_60 = local_66;
        FNPCDailyRouteRuntimePointInfo local_76;
        UECSBehaviorTreeComponent local_78 = Context.GetOwnerComponent();
        local_5 = !local_5;
        if (local_5)
        {
            return EBTNodeResult(1);
        }
        local_46.PendingTargetNodeIndex = local_53;
        local_46.TargetPointId = local_60.PointId;
        local_46.TargetAcceptRadius = local_76.AcceptRadius;
        local_46.SelectedStayTime = ::FNPCDailyRouteUtils::SelectStayTime(local_60.StayTime);
        local_46.ActivePathPoints.Empty(0);
        local_46.ActivePathPointIndex = 0;
        local_31 = true;
        local_46.bHasPreparedTarget = local_31;
        if (unresolved.Nodes.IsValidIndex(int(local_46.CurrentNodeIndex)))
        {
            FName local_81;
            if ((local_81 == local_60.PointId))
            {
                ::FNPCDailyRouteUtils::ClearPreparedRuntime(local_46);
                return EBTNodeResult(1);
            }
            FNPCDailyRouteRuntimeConnectionInfo local_88;
            UECSBehaviorTreeComponent local_78_2 = Context.GetOwnerComponent();
            local_31 = !local_31;
            if (local_31)
            {
                ::FNPCDailyRouteUtils::ClearPreparedRuntime(local_46);
                return EBTNodeResult(1);
            }
            local_46.ActivePathPoints = local_88.WorldPathPoints;
        }
        if (local_46.ActivePathPoints.Num() == 0)
        {
            local_46.ActivePathPoints.Add(local_76.Location);
        }
        return EBTNodeResult(0);
    }
}

