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
        int local_34 = 0;
        FECSEntity local_4 = FECSEntity(Context.PawnEntity);
        if (!(local_4.IsValid()))
        {
            return EBTNodeResult(1);
        }
        TDataObjectPtr<FNPCDailyRouteConfig> local_30;
        if (!(::FNPCDailyRouteUtils::TryGetRouteConfig(local_4, local_30)) || !(local_30.Get().HasRouteNodes()) || local_30.Get().RouteSourceId.IsNone() || !(local_30.Get().IsLoopStartIndexValid()))
        {
            ::FNPCDailyRouteUtils::ClearPreparedTarget(local_4);
            return EBTNodeResult(1);
        }
        if (!(local_34.RouteConfig.IsSet()) || !((local_34.RouteConfig.GetDataName() == local_30.GetDataName())))
        {
            ::FNPCDailyRouteUtils::InitializeRouteState(local_4, local_30, -1);
        }
        FC_NPCDailyRouteRuntime local_46;
        ::FNPCDailyRouteUtils::ClearPreparedRuntime(local_46);
        int local_53 = int(local_46.CurrentNodeIndex) < 0 ? 0 : local_30.Get().GetNextNodeIndex(int(local_46.CurrentNodeIndex));
        if (!(local_30.Get().Nodes.IsValidIndex(local_53)))
        {
            return EBTNodeResult(1);
        }
        FNPCDailyRouteNodeConfig local_60;
        local_60 = local_30.Get().Nodes[local_53];
        FNPCDailyRouteRuntimePointInfo local_76;
        if (!(::NPCDailyRouteRuntimeLibrary::GetRoutePointInfo(Context.GetOwnerComponent(), local_30.Get().RouteSourceId, local_60.PointId, local_76)))
        {
            return EBTNodeResult(1);
        }
        local_46.PendingTargetNodeIndex = local_53;
        local_46.TargetPointId = local_60.PointId;
        local_46.TargetAcceptRadius = local_76.AcceptRadius;
        local_46.SelectedStayTime = ::FNPCDailyRouteUtils::SelectStayTime(local_60.StayTime);
        local_46.ActivePathPoints.Empty(0);
        local_46.ActivePathPointIndex = 0;
        local_46.bHasPreparedTarget = true;
        if (local_30.Get().Nodes.IsValidIndex(int(local_46.CurrentNodeIndex)))
        {
            FName local_81(local_30.Get().Nodes[int(local_46.CurrentNodeIndex)].PointId);
            if ((local_81 == local_60.PointId))
            {
                ::FNPCDailyRouteUtils::ClearPreparedRuntime(local_46);
                return EBTNodeResult(1);
            }
            FNPCDailyRouteRuntimeConnectionInfo local_88;
            if (!(::NPCDailyRouteRuntimeLibrary::GetRouteConnectionInfo(Context.GetOwnerComponent(), local_30.Get().RouteSourceId, local_81, local_60.PointId, local_88)))
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

