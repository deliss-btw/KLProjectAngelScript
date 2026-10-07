

class US_CameraOverrideSystem : UECSScriptSystem
{
    US_CameraOverrideSystem()
    {
        return;
    }
    UFUNCTION()
    void ClientJob_HandleAddCameraOverrideEvent(const FCE_AddCameraOverrideEvent &inout Event) const
    {
        ::FCameraOverrideUtils::AddLocalCameraOverrideLayer(Event.Sender, Event.CameraOverrideParam);
        return;
    }
    UFUNCTION()
    void ClientJob_HandleRemoveCameraOverrideEvent(const FCE_RemoveCameraOverrideEvent &inout Event) const
    {
        ::FCameraOverrideUtils::RemoveLocalCameraOverrideLayer(Event.Sender, Event.Layer);
        return;
    }
    UFUNCTION()
    void Monitor_OnAssignOrModifySyncCameraOverride(const FECSEntity &inout Entity, const FC_SyncCameraOverride &inout SyncCameraOverride) const
    {
        ModifyOrAdd local_4;
        local_4.opCall().SetSyncCameraOverrides(SyncCameraOverride.GetCameraOverrideParams());
        return;
    }
    UFUNCTION()
    void Monitor_OnRemoveSyncCameraOverride(const FECSEntity &inout Entity, const FC_SyncCameraOverride &inout SyncCameraOverride) const
    {
        if (Entity.IsValid())
        {
            Modify local_6;
            FC_CameraOverrides& local_8 = local_6.opCall();
            if (local_8)
            {
                local_8.SetSyncCameraOverrides(TArray<FCameraOverrideParam>());
                if (local_8.CameraOverridesIndex.Num() == 0)
                {
                    Remove local_18;
                    local_18.opCall();
                }
            }
        }
        return;
    }
    UFUNCTION()
    void Monitor_OnAssignCharacterInBackgroundTag(const FECSEntity &inout Entity, const FC_CharacterInBackgroundTag &inout CharacterInBackgroundTag) const
    {
        if (Entity.IsValid())
        {
            Remove local_6;
            local_6.opCall();
        }
        return;
    }
    UFUNCTION()
    void Monitor_OnRemoveCameraOverride(const FECSEntity &inout Entity, const FC_CameraOverrides &inout C_CameraOverrides) const
    {
        if (Entity.IsValid())
        {
            Remove local_6;
            local_6.opCall();
            Remove local_10;
            local_10.opCall();
            Modify local_14;
            FC_OverrideCameraData& local_16 = local_14.opCall();
            if (local_16)
            {
                local_16.SetBlendOut(ECS::GetContextTime());
            }
        }
        return;
    }
    UFUNCTION()
    void ClientJob_UpdateCameraOverride(const FECSEntity &inout Entity, const FC_CameraOverrides &inout C_CameraOverrides) const
    {
        int local_10 = 0;
        int local_40 = 0;
        const FCameraOverrideParam& local_2 = C_CameraOverrides.GetCameraOverrideParam(int(C_CameraOverrides.CurrentActiveIndex));
        if (local_2.GetLookAtTargetEntity().IsValid())
        {
            local_10.TargetEntity = local_2.GetLookAtTargetEntity();
            local_10.Offset = local_2.GetLookAtTargetOffset();
            local_10.SocketName = local_2.GetLookAtTargetSocketName();
            local_10.LookAtConfig = local_2.GetLookAtConfig();
        }
        else
        {
            Remove local_16;
            local_16.opCall();
        }
        if (local_2.GetUseOverrideCameraData())
        {
            FC_OverrideCameraData& local_22;
            if (local_22.CameraData.GetDataID() != local_2.GetOverrideCamera().GetDataID())
            {
                local_22.CameraData = local_2.GetOverrideCamera();
                local_22.SetBlendIn(ECS::GetContextTime());
            }
        }
        else
        {
            Modify local_32;
            FC_OverrideCameraData& local_22;
            local_22 = local_32.opCall();
            if (local_22)
            {
                local_22.SetBlendOut(ECS::GetContextTime());
            }
        }
        if (!(local_2.GetUseOverrideCameraData()) && local_2.GetCameraState().IsValid())
        {
            Modify local_32;
            FC_OverrideCameraData& local_22;
            local_40.CameraState.SetStateRef(local_2.GetCameraState());
            local_40.CameraState.SetStartTime(ECS::GetContextTime());
            local_22 = local_32.opCall();
            if (local_22)
            {
                local_22.SetBlendOut(ECS::GetContextTime());
            }
            return;
        }
        Remove local_44;
        local_44.opCall();
        return;
    }
    UFUNCTION()
    void Job_ApplyCameraLookAtTargetOverride(const FECSEntity &inout Entity, const FC_CameraLookAtTargetOverride &inout CameraLookAtTargetOverride) const
    {
        const AActor local_12;
        FVector local_6;
        bool local_7 = false;
        if (CameraLookAtTargetOverride.TargetEntity.IsValid())
        {
            if (!(CameraLookAtTargetOverride.SocketName.IsNone()))
            {
                local_12 = CameraLookAtTargetOverride.TargetEntity.GetActor();
                if (local_12 != nullptr && local_12.DoesSocketExist(CameraLookAtTargetOverride.SocketName))
                {
                    FTransform local_68 = local_12.GetSocketTransform(CameraLookAtTargetOverride.SocketName, ERelativeTransformSpace(0));
                    local_6 = local_68.TransformPosition(CameraLookAtTargetOverride.Offset);
                    local_7 = true;
                }
            }
            if (!(local_7))
            {
                Get local_78;
                const FC_Transform& local_80 = local_78.opCall();
                if (local_80)
                {
                    local_6 = local_80.ToFTransform().TransformPosition(CameraLookAtTargetOverride.Offset);
                    local_7 = true;
                }
            }
        }
        if (local_7)
        {
            FCameraUtils::UpdateCameraLookAt(Entity, local_6, FVector3f::ZeroVector, 0.0f, CameraLookAtTargetOverride.LookAtConfig);
            return;
        }
        FCameraUtils::ClearCameraLookAt(Entity);
        return;
    }
    UFUNCTION()
    void Run_ClientJob_HandleAddCameraOverrideEvent() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_AddCameraOverrideEvent> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(2)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_AddCameraOverrideEvent& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ClientJob_HandleAddCameraOverrideEvent(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_HandleRemoveCameraOverrideEvent() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_RemoveCameraOverrideEvent> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(2)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_RemoveCameraOverrideEvent& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ClientJob_HandleRemoveCameraOverrideEvent(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_OnAssignOrModifySyncCameraOverride() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorSyncCameraOverrideOnAssignView(this.GetECSWorld(), EECSRegType(0), false, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_OnAssignOrModifySyncCameraOverride(local_46, local_52);
        }
        FECSMonitorRuntimeView local_16 = ::__GetMonitorSyncCameraOverrideOnModifyView(this.GetECSWorld(), EECSRegType(0), false, true);
        FECSMonitorRuntimeViewIterator local_40 = local_16.Iterator();
        for (; local_40.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42_2 = local_40.Proceed();
            FECSEntityScopeCycleCounter local_43_2 = FECSEntityScopeCycleCounter(local_42_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_42_2);
            this.Monitor_OnAssignOrModifySyncCameraOverride(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_OnRemoveSyncCameraOverride() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorSyncCameraOverrideOnRemoveView(this.GetECSWorld(), EECSRegType(0), false, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_OnRemoveSyncCameraOverride(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_OnAssignCharacterInBackgroundTag() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = this.GetECSWorld().__GetMonitorCharacterInBackgroundTagOnAssignView(EECSRegType(0), false, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_OnAssignCharacterInBackgroundTag(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_OnRemoveCameraOverride() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorCameraOverridesOnRemoveView(this.GetECSWorld(), EECSRegType(0), false, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_OnRemoveCameraOverride(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_UpdateCameraOverride() const
    {
        const FECSEntity& local_36;
        int local_38 = 0;
        int local_162 = 0;
        const FECSJob& local_2 = ECS::GetContextJob();
        int local_4 = 0;
        int local_3 = local_4;
        if (local_2.IsViewCacheUsable())
        {
            FECSWorldPtr local_8 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_12 = local_2.GetViewCacheEntities();
            int local_13 = 0;
            for (auto& local_28 : local_12)
            {
                local_28;
                FECSEntity local_32;
                if (!(local_32.IsValid()))
                {
                    continue;
                }
                ++local_13;
                FECSEntityScopeCycleCounter local_33 = FECSEntityScopeCycleCounter(local_32);
                this.ClientJob_UpdateCameraOverride(local_36, local_38);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_80 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_84;
        local_84.opCall();
        Exclude(local_80).opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_90 = 0;
        FECSRuntimeViewIterator local_124 = local_80.Iterator();
        for (; local_124.CanProceed;)
        {
            local_36 = local_124.Proceed();
            ++local_90;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.ClientJob_UpdateCameraOverride(local_162, local_38);
        }
        local_2.UpdateCachedEntityCount(local_90);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_ApplyCameraLookAtTargetOverride() const
    {
        const FECSEntity& local_36;
        int local_38 = 0;
        int local_166 = 0;
        const FECSJob& local_2 = ECS::GetContextJob();
        int local_4 = 0;
        int local_3 = local_4;
        if (local_2.IsViewCacheUsable())
        {
            FECSWorldPtr local_8 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_12 = local_2.GetViewCacheEntities();
            int local_13 = 0;
            for (auto& local_28 : local_12)
            {
                local_28;
                FECSEntity local_32;
                if (!(local_32.IsValid()))
                {
                    continue;
                }
                ++local_13;
                FECSEntityScopeCycleCounter local_33 = FECSEntityScopeCycleCounter(local_32);
                this.Job_ApplyCameraLookAtTargetOverride(local_36, local_38);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_80 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_84;
        local_84.opCall();
        Include local_88;
        local_88.opCall();
        Exclude(local_80).opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_94 = 0;
        FECSRuntimeViewIterator local_128 = local_80.Iterator();
        for (; local_128.CanProceed;)
        {
            local_36 = local_128.Proceed();
            ++local_94;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.Job_ApplyCameraLookAtTargetOverride(local_166, local_38);
        }
        local_2.UpdateCachedEntityCount(local_94);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
}

