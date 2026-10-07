

class US_DropItemSystem : UECSScriptSystem
{
    US_DropItemSystem()
    {
        return;
    }
    UFUNCTION()
    void Job_DropItemConfigInitOverride(const FECSEntity &inout Entity, const FC_DropItemConfigInitOverride &inout DropItemConfigInitOverride) const
    {
        int local_12 = 0;
        if (DropItemConfigInitOverride.DropItems.IsEmpty())
        {
            Remove local_6;
            local_6.opCall();
        }
        else
        {
            local_12.DropItems.Reset(0);
            for (auto& local_28 : DropItemConfigInitOverride.DropItems)
            {
                local_12.AddDropItem(local_28.TriggerType, TDataObjectPtr<FDropItemConfigBase>());
            }
        }
        Remove local_58;
        local_58.opCall();
        return;
    }
    UFUNCTION()
    void Job_SpawnMonsterDropItems(const FCE_DeathEvent &inout Event) const
    {
        if (!(Event.bHasDropItem))
        {
            return;
        }
        FInventoryAddItemReasonScope local_4 = FInventoryAddItemReasonScope(12);
        ::DropItemsUtils::TryTriggerDropItems(EDropTriggerType(0), Event.Sender, FECSEntity(Event.KilledByEntity));
        return;
    }
    UFUNCTION()
    void Job_SpawnInteractDropItems(const FCE_InteractDropItem &inout Event) const
    {
        ::DropItemsUtils::TryTriggerDropItems(EDropTriggerType(1), Event.Sender, FECSEntity(Event.InteractByEntity));
        return;
    }
    UFUNCTION()
    void Job_SpawnBodyPartDestroyDropItems(const FCE_BodyPartDestroyEvent &inout Event) const
    {
        int local_6 = 0;
        FCharacterBodyPartConfig local_198;
        local_6.BodyPartData.BodyParts.Find(Event.BodyPart, local_198);
        if ((!((local_198.DestroyDropItem == nullptr))))
        {
            TArray<TDataObjectPtr<FDropItemConfigBase>> local_252;
            local_252.Add(TDataObjectPtr<FDropItemConfigBase>());
            ::DropItemsUtils::DropBodyPartDestroyDropItems(local_198, local_252, local_198.DropMovement, Event.Sender, Event.DestroyedByEntity);
        }
        return;
    }
    UFUNCTION()
    void Job_SpawnProjectileDropOnDestroy(const FECSEntity &inout Entity) const
    {
        ::DropItemsUtils::TryTriggerDropItems(EDropTriggerType(2), Entity, ENTITY_NULL);
        return;
    }
    UFUNCTION()
    void Monitor_OnDropItemLandOnGround(const FECSEntity &inout Entity, const FC_GravityFallingMovementRuntime &inout Falling) const
    {
        Modify local_4;
        FC_RotationWithDecreaseAngleVelocity& local_6 = local_4.opCall();
        if (local_6)
        {
            local_6.SetbEnable(true);
        }
        return;
    }
    UFUNCTION()
    void Monitor_OnActiveAutoDropItem(const FECSEntity &inout Entity, const FC_AutoDropItem &inout AutoDropItem) const
    {
        Has local_4;
        local_4.opCall();
        ::DropItemsUtils::TryTriggerDropItems(EDropTriggerType(3), Entity, ENTITY_NULL);
        if (AutoDropItem.bHasNonAutoDropItem)
        {
            Remove local_10;
            local_10.opCall();
            return;
        }
        Entity.DestroyDeferred();
        return;
    }
    UFUNCTION()
    void Job_DropItemLandEvent(const FCE_DropItemLandEvent &inout Event) const
    {
        if (DropItemsUtils::CVar_DropItem_ProjectToNavMesh.GetBool())
        {
            FECSEntity local_6 = FECSEntity(Event.Sender);
            Modify local_10;
            FC_Transform& local_12 = local_10.opCall();
            if (local_12)
            {
                FVector local_18 = local_12.GetPosition();
                FVector local_24;
                bool local_1 = UNavigationSystemV1::ProjectPointToNavigation(__GetWorldContext(), local_18, local_24, nullptr, TSubclassOf<UNavigationQueryFilter>(nullptr), (FVector(FVector::OneVector) * DropItemsUtils::CVar_DropItem_ProjectToNavMeshQueryExtent.GetFloat()));
                if (local_1)
                {
                    if (DropItemsUtils::CVar_DropItem_ProjectToNavMeshShowDebug.GetBool())
                    {
                        Print(FString().Append("NaviLocation find ").Append(local_1).Append(": ").Append(local_24), 10.0f, FLinearColor::Yellow);
                        DebugDraw::DrawDebugPoint(ECS::GetUEWorld(), local_24, 10.0f, FColor::Red, false, 10.0f, uint8(0));
                    }
                    FHitResult local_120;
                    FCollisionQueryParams local_158;
                    local_158.bTraceComplex = false;
                    local_158.AddIgnoredEntityId(local_6.GetId());
                    FVector local_32 = (local_24 + (FVector(FVector::UpVector) * DropItemsUtils::CVar_DropItem_ProjectToNavMeshCheckUpDistance.GetFloat()));
                    FVector local_42_2 = (FVector(FVector::DownVector) * (DropItemsUtils::CVar_DropItem_ProjectToNavMeshCheckUpDistance.GetFloat() + 100.0f));
                    FVector local_166 = (local_24 + local_42_2);
                    FCollisionResponseParams local_182;
                    bool local_184 = FPhysicsUtils::LineTraceSingle(local_6, false, EPhysicsTraceTag(21), local_120, local_32, local_166, FPhysicsUtils::ConvertToCollisionChannel(ETraceTypeQuery(5)), local_158, local_182);
                    if (local_184)
                    {
                        local_6.TeleportTo(local_120.ImpactPoint, FFPTime(-1));
                    }
                    else
                    {
                        local_6.TeleportTo(local_24, FFPTime(-1));
                    }
                }
            }
        }
        return;
    }
    UFUNCTION()
    void Job_ManualTriggerDropItem(const FCE_DropManualTrigger &inout Event) const
    {
        ::DropItemsUtils::TryTriggerDropItemsByManualEvent(Event);
        return;
    }
    UFUNCTION()
    void ServerJob_AutoDestroyDropItem(const FECSEntity &inout Entity, const FC_DropItemAutoDestroy &inout AutoDestory, const FCS_FixedTime &inout FixedTime) const
    {
        if (FFPTime(FixedTime.Time).opCmp(AutoDestory.GetDestroyTimer()) >= 0)
        {
            ModifyOrAdd local_8;
            FC_CollectionPrefabPresentationState& local_10 = local_8.opCall();
            if (local_10)
            {
                local_10.SetState(ECollectionPrefabPresentationState(3));
            }
            Entity.DestroyDeferred();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_DropItemConfigInitOverride() const
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
                this.Job_DropItemConfigInitOverride(local_36, local_38);
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
            this.Job_DropItemConfigInitOverride(local_162, local_38);
        }
        local_2.UpdateCachedEntityCount(local_90);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_SpawnMonsterDropItems() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_DeathEvent> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_DeathEvent& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_SpawnMonsterDropItems(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_SpawnInteractDropItems() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_InteractDropItem> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(0)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_InteractDropItem& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_SpawnInteractDropItems(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_SpawnBodyPartDestroyDropItems() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_BodyPartDestroyEvent> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(0)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_BodyPartDestroyEvent& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_SpawnBodyPartDestroyDropItems(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_SpawnProjectileDropOnDestroy() const
    {
        const FECSEntity& local_36;
        int local_160 = 0;
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
                this.Job_SpawnProjectileDropOnDestroy(local_36);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_74 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_78;
        local_78.opCall();
        Include local_82;
        local_82.opCall();
        Include local_86;
        local_86.opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_88 = 0;
        FECSRuntimeViewIterator local_122 = local_74.Iterator();
        for (; local_122.CanProceed;)
        {
            local_36 = local_122.Proceed();
            ++local_88;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.Job_SpawnProjectileDropOnDestroy(local_160);
        }
        local_2.UpdateCachedEntityCount(local_88);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_OnDropItemLandOnGround() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorGravityFallingMovementRuntimeOnRemoveView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_OnDropItemLandOnGround(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_OnActiveAutoDropItem() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorAutoDropItemOnActiveView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_OnActiveAutoDropItem(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_DropItemLandEvent() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_DropItemLandEvent> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_DropItemLandEvent& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_DropItemLandEvent(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_ManualTriggerDropItem() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_DropManualTrigger> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_DropManualTrigger& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_ManualTriggerDropItem(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    void Monitor___JobTimer_Pre___ServerJob_AutoDestroyDropItem(const FC_DropItemAutoDestroy &inout TimerComp, const FECSEntity &inout Entity) const
    {
        if (!(TimerComp))
        {
            return;
        }
        FFPTime local_6 = FFPTime(TimerComp.GetDestroyTimer());
        FName local_8 = FName("S_DropItemSystem::ServerJob_AutoDestroyDropItem");
        if (local_6.opCmp(0.0) >= 0 && (local_6.opCmp(FPTIME_MAX) < 0))
        {
            ECS::ScheduleJobTimer(local_8, local_6, Entity.GetId(), true);
        }
        return;
    }
    void Monitor___JobTimer_Post___ServerJob_AutoDestroyDropItem(const FC_DropItemAutoDestroy &inout TimerComp, const FECSEntity &inout Entity) const
    {
        if (!(TimerComp))
        {
            return;
        }
        FFPTime local_6 = FFPTime(TimerComp.GetDestroyTimer());
        FName local_8 = FName("S_DropItemSystem::ServerJob_AutoDestroyDropItem");
        if (local_6.opCmp(0.0) >= 0 && (local_6.opCmp(FPTIME_MAX) < 0))
        {
            ECS::ScheduleJobTimer(local_8, local_6, Entity.GetId(), false);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor___JobTimer_Pre___ServerJob_AutoDestroyDropItem() const
    {
        int local_52 = 0;
        int local_54 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_14 = ::__GetMonitorDropItemAutoDestroyOnModifyView(this.GetECSWorld(), EECSRegType(0), true, false);
        FECSMonitorRuntimeViewIterator local_30 = local_14.Iterator();
        for (; local_30.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44 = local_30.Proceed();
            FECSEntityScopeCycleCounter local_45 = FECSEntityScopeCycleCounter(local_44.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_44);
            this.Monitor___JobTimer_Pre___ServerJob_AutoDestroyDropItem(local_52, local_54);
        }
        FECSMonitorRuntimeView local_18 = ::__GetMonitorDropItemAutoDestroyOnActiveView(this.GetECSWorld(), EECSRegType(0), true, false);
        FECSMonitorRuntimeViewIterator local_42 = local_18.Iterator();
        for (; local_42.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44_2 = local_42.Proceed();
            FECSEntityScopeCycleCounter local_45_2 = FECSEntityScopeCycleCounter(local_44_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_44_2);
            this.Monitor___JobTimer_Pre___ServerJob_AutoDestroyDropItem(local_52, local_54);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor___JobTimer_Post___ServerJob_AutoDestroyDropItem() const
    {
        int local_52 = 0;
        int local_54 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_14 = ::__GetMonitorDropItemAutoDestroyOnModifyView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_30 = local_14.Iterator();
        for (; local_30.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44 = local_30.Proceed();
            FECSEntityScopeCycleCounter local_45 = FECSEntityScopeCycleCounter(local_44.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_44);
            this.Monitor___JobTimer_Post___ServerJob_AutoDestroyDropItem(local_52, local_54);
        }
        FECSMonitorRuntimeView local_18 = ::__GetMonitorDropItemAutoDestroyOnActiveView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_42 = local_18.Iterator();
        for (; local_42.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44_2 = local_42.Proceed();
            FECSEntityScopeCycleCounter local_45_2 = FECSEntityScopeCycleCounter(local_44_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_44_2);
            this.Monitor___JobTimer_Post___ServerJob_AutoDestroyDropItem(local_52, local_54);
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_AutoDestroyDropItem() const
    {
        int local_6 = 0;
        int local_42 = 0;
        int local_50 = 0;
        int local_52 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        FECSWorldPtr local_8 = ECS::GetECSWorld();
        local_4.MarkIteratingExternalEntityList(true);
        const TArray<FECSEntityId>& local_14 = local_4.GetExternalEntityList();
        FECSEntity local_32;
        for (auto& local_28 : local_14)
        {
            local_28;
            FECSEntityScopeCycleCounter local_33 = FECSEntityScopeCycleCounter(local_32);
            bool local_11 = false;
            bool local_35 = !(false);
            if (!(local_32.IsActive()) == local_35)
            {
                continue;
            }
            if (!(local_42))
            {
                continue;
            }
            FFPTime local_44 = FFPTime(local_42.GetDestroyTimer());
            if (local_44.opCmp(0.0) < 0 || (FFPTime(local_42.GetDestroyTimer()) == FPTIME_MAX))
            {
                continue;
            }
            if (local_11)
            {
                continue;
            }
            this.ServerJob_AutoDestroyDropItem(local_50, local_52, local_6);
        }
        local_4.MarkIteratingExternalEntityList(false);
        ECS::ClearCurJobExternalEntityList();
        return;
    }
}

