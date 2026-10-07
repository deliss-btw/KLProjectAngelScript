

class US_MinimapGuidingPathSystem : UECSScriptSystem
{
    US_MinimapGuidingPathSystem()
    {
        return;
    }
    UFUNCTION()
    void Monitor_OnGuidingPathPointsChanged(const FECSEntity &inout Entity, const FC_GuidingPathPoints &inout GuidingPathPoints) const
    {
        Has local_4;
        SendEvent local_14;
        int local_24 = 0;
        const UMinimapGlobalConfig local_26;
        if (!(local_4.opCall()))
        {
            if (::FTeamUtils::IsInSameTeam(Entity, ::FASCommonUtils::GetLocalUniquePlayerEntity()))
            {
                local_14.opCall(FFPTime(-1));
            }
            return;
        }
        ::FASCommonUtils::GetUniqueAvatarPawnEntity(Entity);
        if (!(local_24))
        {
            return;
        }
        GetGameplaySettings<UMinimapGlobalConfig> local_28;
        local_26 = local_28;
        FMinimapPath local_36;
        if (GuidingPathPoints.GetbLastFindPathSuccess())
        {
            TArray<FVector2D> local_40;
            TArray<int> local_44;
            TArray<FMinimapPathStyle> local_48;
            if (!(GuidingPathPoints.GetbGoodSourceLocation()))
            {
                local_40.Add(::MinimapUtils::GamePositionToMapPosition(local_24.GetPosition()));
                local_44.Add(1);
                local_48.Add(local_26.UncertainGuidingPathStyle);
            }
            int local_54 = 0;
            for (auto& local_68 : GuidingPathPoints.GetPoints())
            {
                FVector2D local_52 = ::MinimapUtils::GamePositionToMapPosition(local_68);
                if ((local_40.IsEmpty() || !(((local_52 - local_40.Last(0))).IsNearlyZero(9.999999747378752e-5))))
                {
                    local_40.Add(local_52);
                    local_54 = local_54 + 1;
                }
            }
            local_44.Add(local_54 - 1);
            local_48.Add(local_26.GuidingPathStyle);
            FVector2D local_72 = ::MinimapUtils::GamePositionToMapPosition(GuidingPathPoints.GetTargetLocation());
            if (GuidingPathPoints.GetTargetEntity().IsValid())
            {
                Get local_22;
                const FC_Transform& local_78 = local_22.opCall();
                if (local_78)
                {
                    local_72 = ::MinimapUtils::GamePositionToMapPosition(local_78.GetPosition());
                }
            }
            FVector2D local_52_2 = (local_72 - local_40.Last(0));
            if (!(local_52_2.IsNearlyZero(9.999999747378752e-5)))
            {
                local_40.Add(local_72);
                local_44.Add(1);
                if (GuidingPathPoints.GetbGoodSourceLocation())
                {
                }
                else
                {
                }
                local_48.Add();
            }
            local_36 = Minimap::MakeMinimapPath(local_40, local_44, local_48, local_26.GuidingPathTension);
        }
        ModifyOrAdd local_90;
        local_90.opCall().Path = local_36;
        local_14.opCall(FFPTime(-1));
        return;
    }
    UFUNCTION()
    void Monitor_OnGuidingPathPointsRemoved(const FECSEntity &inout Entity, const FC_GuidingPathPoints &inout GuidingPathPoints) const
    {
        int local_8 = 0;
        FECSWorldPtr local_2 = ECS::GetECSWorld();
        if (!(local_8))
        {
            return;
        }
        Modify local_14;
        FC_GuidingMinimapPath& local_16 = local_14.opCall();
        if (local_16)
        {
            local_16.Path = FMinimapPath();
            SendEvent local_26;
            local_26.opCall(FFPTime(-1));
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_OnGuidingPathPointsChanged() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorGuidingPathPointsOnAssignView(this.GetECSWorld(), EECSRegType(0), false, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_OnGuidingPathPointsChanged(local_46, local_52);
        }
        FECSMonitorRuntimeView local_16 = ::__GetMonitorGuidingPathPointsOnModifyView(this.GetECSWorld(), EECSRegType(0), false, true);
        FECSMonitorRuntimeViewIterator local_40 = local_16.Iterator();
        for (; local_40.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42_2 = local_40.Proceed();
            FECSEntityScopeCycleCounter local_43_2 = FECSEntityScopeCycleCounter(local_42_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_42_2);
            this.Monitor_OnGuidingPathPointsChanged(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_OnGuidingPathPointsRemoved() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorGuidingPathPointsOnRemoveView(this.GetECSWorld(), EECSRegType(0), false, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_OnGuidingPathPointsRemoved(local_46, local_52);
        }
        return;
    }
}

