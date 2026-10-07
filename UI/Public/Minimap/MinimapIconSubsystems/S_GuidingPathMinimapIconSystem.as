

class US_GuidingPathMinimapIconSystem : UECSScriptSystem
{
    UPROPERTY()
    TSoftClassPtr<UUserWidget> GuidingTargetIconWidget;
    UPROPERTY()
    FMinimapIconDisplaySettings IconDisplaySettings;
    UPROPERTY()
    FVector2D IconSize;
    UPROPERTY()
    int ZOrder;
    UPROPERTY()
    TSubclassOf<UMinimapIconRegistryAsset> IconRegistry;

    US_GuidingPathMinimapIconSystem()
    {
        return;
    }
    UFUNCTION()
    void Monitor_OnGuidingPathUpdateInfoChanged(const FECSEntity &inout PlayerEntity, const FC_GuidingPathPoints &inout GuidingPathPoints) const
    {
        if (PlayerEntity.IsValid())
        {
            this.RefreshGuidingPathIconForPlayer(PlayerEntity);
        }
        return;
    }
    UFUNCTION()
    void Monitor_UpdateTeamMemberGuidingPathTarget(const FC_TeamInfo &inout TeamInfo) const
    {
        if (TeamInfo.HasMember(::FASCommonUtils::GetLocalUniquePlayerEntity()))
        {
            for (auto& local_24 : TeamInfo.GetMembers())
            {
                this.RefreshGuidingPathIconForPlayer(local_24.GetEntity());
            }
        }
        return;
    }
    UFUNCTION()
    void Monitor_RemoveTeammateGuidingTargetWhenExitTeam(const FC_PlayerInTeam &inout _) const
    {
        this.Run_Job_UpdateAllOtherPlayerGuidingTarget();
        return;
    }
    UFUNCTION()
    void Job_UpdateAllOtherPlayerGuidingTarget(const FECSEntity &inout Entity, const FC_GuidingPathTargetMinimapIcon &inout GuidingPathTargetMinimapIcon) const
    {
        this.RefreshGuidingPathIconForPlayer(Entity);
        return;
    }
    void RefreshGuidingPathIconForPlayer(const FECSEntity &inout PlayerEntity) const
    {
        bool local_10;
        int local_24 = 0;
        if (!(::FTeamUtils::IsInSameTeam(::FASCommonUtils::GetLocalUniquePlayerEntity(), PlayerEntity)))
        {
            local_10 = false;
        }
        else
        {
            Has local_14;
            local_10 = local_14.opCall();
        }
        bool local_9 = local_10 && ::FGuidingPathUtils::ExistsAnyGuidingPath(PlayerEntity);
        bool local_16 = local_9 && ::FGuidingPathUtils::IsGuidingPathToEntity(PlayerEntity);
        if (local_9)
        {
            if (local_16)
            {
                this.SetGuidingPathTargetToEntity(PlayerEntity, local_24.GetTargetEntity().GetId());
            }
            else
            {
                this.SetGuidingPathTargetToLocation(PlayerEntity, local_24.GetTargetLocation());
            }
        }
        else
        {
            this.RemoveGuidingPathTargetIcon(PlayerEntity);
        }
        return;
    }
    void SetGuidingPathTargetToEntity(const FECSEntity &inout PlayerEntity, const FECSEntityId &inout TargetEntityID) const
    {
        int local_6 = 0;
        FMinimapIconHandle local_9 = this.FindEntityGuidingTargetIcon(TargetEntityID);
        if ((!((local_6.TargetEntityID == ENTITY_ID_NULL))))
        {
            ::MinimapUtils::SetIconNeverHide(local_6.IconHandle, false);
        }
        else
        {
            ::MinimapUtils::UnregisterIcon(local_6.IconHandle);
        }
        ::MinimapUtils::SetIconNeverHide(local_9, true);
        local_6.IconHandle = local_9;
        local_6.TargetEntityID = TargetEntityID;
        return;
    }
    void SetGuidingPathTargetToLocation(const FECSEntity &inout PlayerEntity, const FVector &inout Location) const
    {
        int local_6 = 0;
        FVector2D local_10 = ::MinimapUtils::GamePositionToMapPosition(Location);
        if ((!((local_6.TargetEntityID == ENTITY_ID_NULL))))
        {
            ::MinimapUtils::SetIconNeverHide(local_6.IconHandle, false);
            local_6.IconHandle = this.RegisterNonEntityGuidingTargetIcon(local_10, PlayerEntity);
        }
        else
        {
            if (::MinimapUtils::IsValidHandle(local_6.IconHandle))
            {
                if ((local_10 - ::MinimapUtils::GetIconInfo(local_6.IconHandle).WorldPosition).Size() > 1.0)
                {
                    ::MinimapUtils::UnregisterIcon(local_6.IconHandle);
                    local_6.IconHandle = this.RegisterNonEntityGuidingTargetIcon(local_10, PlayerEntity);
                }
                else
                {
                    ::MinimapUtils::UpdateIconPosition(local_6.IconHandle, local_10);
                }
            }
            else
            {
                local_6.IconHandle = this.RegisterNonEntityGuidingTargetIcon(local_10, PlayerEntity);
            }
        }
        local_6.TargetEntityID = FECSEntityId();
        return;
    }
    void RemoveGuidingPathTargetIcon(const FECSEntity &inout PlayerEntity) const
    {
        Get local_4;
        const FC_GuidingPathTargetMinimapIcon& local_6 = local_4.opCall();
        if (local_6)
        {
            if ((!((local_6.TargetEntityID == ENTITY_ID_NULL))))
            {
                ::MinimapUtils::SetIconNeverHide(local_6.IconHandle, false);
            }
            else
            {
                ::MinimapUtils::UnregisterIcon(local_6.IconHandle);
            }
            Remove local_12;
            local_12.opCall();
        }
        return;
    }
    FMinimapIconHandle FindEntityGuidingTargetIcon(const FECSEntityId &inout EntityID) const
    {
        return FMinimapIconHandle();
    }
    FMinimapIconHandle RegisterNonEntityGuidingTargetIcon(const FVector2D &inout WorldPosition, const FECSEntity &inout Creater) const
    {
        if (this.GuidingTargetIconWidget.IsNull())
        {
            XWarning(ELog(51), "Guiding path target icon not shown, GuidingTargetIconWidget is empty.");
            return FMinimapIconHandle();
        }
        if (!(this.IconRegistry.IsValid()))
        {
            XWarning(ELog(51), "Guiding path target icon not shown, IconRegistry is empty.");
            return FMinimapIconHandle();
        }
        FMinimapIconInfo local_48;
        local_48.IconWidget = this.GuidingTargetIconWidget;
        local_48.DisplaySettings = this.IconDisplaySettings;
        local_48.IconSize = this.IconSize;
        local_48.WorldPosition = WorldPosition;
        FInstancedStruct::InitializeAs(local_48.UserData).opCall(Creater);
        return this.IconRegistry.GetDefaultObject().GetIconRegistry(__GetWorldContext()).AddIcon(local_48);
    }
    UFUNCTION()
    void Run_Monitor_OnGuidingPathUpdateInfoChanged() const
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
            this.Monitor_OnGuidingPathUpdateInfoChanged(local_46, local_52);
        }
        FECSMonitorRuntimeView local_16 = ::__GetMonitorGuidingPathPointsOnModifyView(this.GetECSWorld(), EECSRegType(0), false, true);
        FECSMonitorRuntimeViewIterator local_40 = local_16.Iterator();
        for (; local_40.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42_2 = local_40.Proceed();
            FECSEntityScopeCycleCounter local_43_2 = FECSEntityScopeCycleCounter(local_42_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_42_2);
            this.Monitor_OnGuidingPathUpdateInfoChanged(local_46, local_52);
        }
        FECSMonitorRuntimeView local_56 = ::__GetMonitorGuidingPathPointsOnRemoveView(this.GetECSWorld(), EECSRegType(0), false, true);
        FECSMonitorRuntimeViewIterator local_28_2 = local_56.Iterator();
        for (; local_28_2.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42_3 = local_28_2.Proceed();
            FECSEntityScopeCycleCounter local_43_3 = FECSEntityScopeCycleCounter(local_42_3.Entity);
            GetComponent local_50_3 = FECSMonitorRuntimeViewItem::GetComponent(local_42_3);
            this.Monitor_OnGuidingPathUpdateInfoChanged(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_UpdateTeamMemberGuidingPathTarget() const
    {
        int local_50 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorTeamInfoOnAssignView(this.GetECSWorld(), EECSRegType(0), false, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_48 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_UpdateTeamMemberGuidingPathTarget(local_50);
        }
        FECSMonitorRuntimeView local_16 = ::__GetMonitorTeamInfoOnModifyView(this.GetECSWorld(), EECSRegType(0), false, true);
        FECSMonitorRuntimeViewIterator local_40 = local_16.Iterator();
        for (; local_40.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42_2 = local_40.Proceed();
            FECSEntityScopeCycleCounter local_43_2 = FECSEntityScopeCycleCounter(local_42_2.Entity);
            GetComponent local_48_2 = FECSMonitorRuntimeViewItem::GetComponent(local_42_2);
            this.Monitor_UpdateTeamMemberGuidingPathTarget(local_50);
        }
        FECSMonitorRuntimeView local_54 = ::__GetMonitorTeamInfoOnRemoveView(this.GetECSWorld(), EECSRegType(0), false, true);
        FECSMonitorRuntimeViewIterator local_28_2 = local_54.Iterator();
        for (; local_28_2.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42_3 = local_28_2.Proceed();
            FECSEntityScopeCycleCounter local_43_3 = FECSEntityScopeCycleCounter(local_42_3.Entity);
            GetComponent local_48_3 = FECSMonitorRuntimeViewItem::GetComponent(local_42_3);
            this.Monitor_UpdateTeamMemberGuidingPathTarget(local_50);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_RemoveTeammateGuidingTargetWhenExitTeam() const
    {
        int local_50 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorPlayerInTeamOnRemoveView(this.GetECSWorld(), EECSRegType(0), false, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_48 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_RemoveTeammateGuidingTargetWhenExitTeam(local_50);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_UpdateAllOtherPlayerGuidingTarget() const
    {
        int local_136 = 0;
        int local_138 = 0;
        FECSManualJobStatScope local_1 = FECSManualJobStatScope(FName("[AS][ManualJob]S_GuidingPathMinimapIconSystem::Job_UpdateAllOtherPlayerGuidingTarget"));
        ECS::GetContextJob();
        int local_8 = 0;
        int local_7 = local_8;
        FECSRuntimeView local_48 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_52;
        local_52.opCall();
        Exclude(local_48).opCall();
        Exclude(local_48).opCall();
        FECSRuntimeViewIterator local_94 = local_48.Iterator();
        for (; local_94.CanProceed;)
        {
            FECSEntityScopeCycleCounter local_133 = FECSEntityScopeCycleCounter(local_94.Proceed());
            this.Job_UpdateAllOtherPlayerGuidingTarget(local_136, local_138);
        }
        return;
    }
}

