

class US_AppearanceSystem : UECSScriptSystem
{
    US_AppearanceSystem()
    {
        return;
    }
    UFUNCTION()
    void Monitor_InitViewAppearance(const FECSEntity &inout LogicEntity, const FC_ViewEntityManager &inout ViewEntityManager) const
    {
        int local_99 = 0;
        if (!(ViewEntityManager.GetGameActorEntity().IsValid()))
        {
            return;
        }
        bool local_9 = !(::GetAvatarConfig(LogicEntity));
        if (local_9)
        {
            return;
        }
        local_9 = !local_9;
        if (local_9)
        {
            return;
        }
        FC_ViewEntityAppearance local_98;
        local_98.AvatarId = local_99;
        Get local_104;
        const FC_FacePresetState& local_106 = local_104.opCall();
        if (local_106)
        {
            local_98.FacePresetId = local_106.GetFacePresetId();
        }
        Get local_110;
        const FC_FashionState& local_112 = local_110.opCall();
        if (local_112)
        {
            local_98.FashionInfo = local_112.GetFashionInfo();
        }
        return;
    }
    UFUNCTION()
    void Monitor_UpdateViewFacePreset(const FECSEntity &inout LogicEntity, const FC_FacePresetState &inout FacePresetState) const
    {
        int local_6 = 0;
        FC_ViewEntityAppearance local_22;
        if (!(local_6))
        {
            return;
        }
        if (!(local_6.GetGameActorEntity().IsValid()))
        {
            return;
        }
        if (!(local_22))
        {
            return;
        }
        local_22.FacePresetId = FacePresetState.GetFacePresetId();
        return;
    }
    UFUNCTION()
    void Monitor_UpdateViewFashion(const FECSEntity &inout LogicEntity, const FC_FashionState &inout FashionState) const
    {
        int local_6 = 0;
        int local_22 = 0;
        if (!(local_6))
        {
            return;
        }
        if (!(local_6.GetGameActorEntity().IsValid()))
        {
            return;
        }
        if (!(local_22))
        {
            return;
        }
        local_22.FashionInfo = FashionState.GetFashionInfo();
        return;
    }
    UFUNCTION()
    void Monitor_ApplyAppearanceToActor(const FECSEntity &inout ViewEntity, const FC_ViewEntityAppearance &inout ViewAppearance) const
    {
        int local_6 = 0;
        if (!(local_6))
        {
            return;
        }
        AActor local_10;
        ::FaceCustomizeUtils::ApplyFacePresetToActor(local_10, int(ViewAppearance.AvatarId), int(ViewAppearance.FacePresetId));
        ::FashionUtils::ApplyFashionToActor(local_10, int(ViewAppearance.AvatarId), ViewAppearance.FashionInfo);
        ::FaceCustomizeUtils::ApplyFacePresetBodyMaterialToActor(local_10, int(ViewAppearance.AvatarId), int(ViewAppearance.FacePresetId));
        return;
    }
    bool ApplyAvatarFashionNotifyToPawn(const FECSEntity &inout AvatarEntity, const FAvatarFashionNotifyData &inout AvatarFashion) const
    {
        int local_8 = 0;
        if (!(AvatarEntity.IsValid()))
        {
            return false;
        }
        local_8.GetFashionInfo().GetModify_FashionIds().Empty(0);
        local_8.GetFashionInfo().GetModify_DecoAttachOffsets().Empty(0);
        local_8.AddFashion(AvatarFashion.GetHairId());
        int local_10 = AvatarFashion.GetSuitId();
        if (local_10 != 0)
        {
            local_8.AddFashion(AvatarFashion.GetSuitId());
        }
        else
        {
            local_8.AddFashion(AvatarFashion.GetTopId());
            local_8.AddFashion(AvatarFashion.GetBottomId());
        }
        for (auto& local_26 : AvatarFashion.GetDecos())
        {
            local_8.AddDeco(local_26.GetFashionId(), local_26.GetAttachOffset(), local_26.GetAttachRotation(), local_26.GetAttachScale());
        }
        XLog(ELog(79), FString().Append("[ApplyAvatarFashionNotifyFromDS] AvatarEntity=").Append(AvatarEntity).Append(" AvatarId=").Append(AvatarFashion.GetAvatarId()).Append(" Hair=").Append(AvatarFashion.GetHairId()).Append(" Suit=").Append(AvatarFashion.GetSuitId()).Append(" Top=").Append(AvatarFashion.GetTopId()).Append(" Bottom=").Append(AvatarFashion.GetBottomId()).Append(" DecoCount=").Append(AvatarFashion.GetDecos().Num()).Append(" FinalFashionIdCount=").Append(local_8.GetFashionInfo().GetFashionIds().Num()));
        return true;
    }
    FAvatarFashionNotifyData MakeAvatarFashionNotifyData(const FPbAvatarFashionBin &inout AvatarFashion) const
    {
        FAvatarFashionNotifyData local_14;
        local_14.SetAvatarId(AvatarFashion.GetAvatarId());
        local_14.SetHairId(AvatarFashion.GetHairId());
        local_14.SetTopId(AvatarFashion.GetTopId());
        local_14.SetBottomId(AvatarFashion.GetBottomId());
        local_14.SetSuitId(AvatarFashion.GetSuitId());
        local_14.SetBathrobeTopId(AvatarFashion.GetBathrobeTopId());
        local_14.SetBathrobeBottomId(AvatarFashion.GetBathrobeBottomId());
        TArray<FPbDecoPointBin> local_20;
        AvatarFashion.GetDecos(local_20);
        for (auto& local_36 : local_20)
        {
            FPbFloat3 local_56 = local_36.GetAttachOffset();
            FPbFloat3 local_46 = local_36.GetAttachRotation();
            FAvatarFashionDecoNotifyData local_76;
            local_76.SetFashionId(local_36.GetFashionId());
            local_76.SetAttachOffset(FVector3f(local_56.GetX(), local_56.GetY(), local_56.GetZ()));
            local_76.SetAttachRotation(FRotator3f(local_46.GetX(), local_46.GetY(), local_46.GetZ()));
            local_76.SetAttachScale(local_36.GetAttachScale());
            local_14.GetModify_Decos().Add(local_76);
        }
        return local_14;
    }
    void ApplyMainAvatarFacePreset(const FECSEntity &inout AvatarEntity, const TDataObjectPtr<FAvatarPrefabConfig> &inout AvatarConfig, const uint FacePresetId, const FString &inout LogPrefix) const
    {
        bool local_2 = false;
        int local_14 = 0;
        bool local_1 = !(AvatarEntity.IsValid()) || !(AvatarConfig);
        if (local_1)
        {
            local_1 = true;
        }
        else
        {
            local_2 = !local_2;
            local_1 = local_2;
        }
        if (local_1)
        {
            return;
        }
        FString local_6 = FString();
        if (FacePresetId == 0)
        {
            return;
        }
        local_14.SetFacePreset(FacePresetId);
        return;
    }
    void ApplyPlayerFashionSnapshot(const FECSEntity &inout PlayerEntity, const uint MountId, const uint MountDecoId, const FString &inout LogPrefix) const
    {
        int local_8 = 0;
        if (!(PlayerEntity.IsValid()))
        {
            return;
        }
        local_8.GetModify_FashionIds().Empty(0);
        if (MountId != 0)
        {
            local_8.AddFashion(MountId);
        }
        if (MountDecoId != 0)
        {
            local_8.AddFashion(MountDecoId);
        }
        XLog(ELog(79), FString().Append(LogPrefix).Append(" PlayerEntity=").Append(PlayerEntity).Append(" MountId=").Append(MountId).Append(" MountDecoId=").Append(MountDecoId).Append(" PlayerFashionCount=").Append(local_8.GetFashionIds().Num()));
        return;
    }
    UFUNCTION()
    void ServerJob_ApplyPlayerFashionChangedFromDS(const FCE_PlayerFashionChangedFromDS &inout Event) const
    {
        int local_12 = 0;
        bool local_27;
        FECSEntity local_4 = FECSEntity(Event.Sender);
        if (!(local_4.IsValid()))
        {
            return;
        }
        if (!(local_12))
        {
            return;
        }
        for (auto& local_26 : Event.Snapshot.GetAvatarFashions())
        {
            local_27 = false;
            for (auto& local_42 : local_12.GetAllPlayerPawnEntities())
            {
                if (!(local_42.IsValid()))
                {
                    continue;
                }
                TDataObjectPtr<FAvatarPrefabConfig> local_90 = ::GetAvatarConfig(local_42);
                if (!(local_90) || (0 != local_26.GetAvatarId()))
                {
                    continue;
                }
                this.ApplyAvatarFashionNotifyToPawn(local_42, local_26);
                this.ApplyMainAvatarFacePreset(local_42, local_90, Event.Snapshot.GetFacePresetId(), "[ApplyAvatarFashionNotifyFromDS]");
                local_27 = true;
            }
            if (!(local_27))
            {
                XWarning(ELog(79), FString().Append("[ApplyAvatarFashionNotifyFromDS] no matching pawn AvatarId=").Append(local_26.GetAvatarId()));
            }
        }
        int local_91 = Event.Snapshot.GetMountDecoId();
        this.ApplyPlayerFashionSnapshot(local_4, Event.Snapshot.GetMountId(), "[ApplyAvatarFashionNotifyFromDS]");
        XLog(ELog(79), FString().Append("[ApplyAvatarFashionNotifyFromDS] PlayerEntity=").Append(local_4).Append(" AvatarFashionCount=").Append(Event.Snapshot.GetAvatarFashions().Num()));
        return;
    }
    UFUNCTION()
    void ClientJob_ForwardPlayerFashionSnapshotToModel(const FCE_PlayerFashionSnapshotSyncedToClient &inout Event) const
    {
        int local_8 = 0;
        int local_20 = 0;
        FECSWorldPtr local_2 = ECS::GetECSWorld();
        if (!(local_8.PlayerEntity.IsValid()))
        {
            return;
        }
        FFPTime local_16 = FFPTime(-1);
        local_20.Snapshot = Event.Snapshot;
        XLog(ELog(79), FString().Append("[ClientFashionSnapshotFromDS] AvatarFashionCount=").Append(Event.Snapshot.GetAvatarFashions().Num()).Append(" MountId=").Append(Event.Snapshot.GetMountId()).Append(" MountDecoId=").Append(Event.Snapshot.GetMountDecoId()).Append(" FacePresetId=").Append(Event.Snapshot.GetFacePresetId()));
        return;
    }
    UFUNCTION()
    void Monitor_InitAvatarFashionFromDS(const FECSEntity &inout AvatarEntity, const FC_PrefabConfig &inout PrefabConfig) const
    {
        int local_56 = 0;
        int local_64 = 0;
        int local_112 = 0;
        TDataObjectPtr<FAvatarPrefabConfig> local_48 = ::GetAvatarConfig(AvatarEntity);
        if (!(local_48))
        {
            return;
        }
        if (!(local_56) || !(local_56.GetPlayerEntity().IsValid()))
        {
            return;
        }
        if (!(local_64))
        {
            return;
        }
        UGameDSConnectionSubsystem local_68 = ::UGameDSConnectionSubsystem::Get();
        if (local_68 == nullptr)
        {
            return;
        }
        FPbDsPlayerInfo local_90 = local_68.GetPlayerInfo(local_64.GetPlayerId());
        if (!(local_90.IsValid()))
        {
            return;
        }
        FPbDsPlayerFashionInfo local_110 = local_90.GetFashionInfo();
        int local_111 = local_112;
        TArray<FPbAvatarFashionBin> local_116;
        local_110.GetAvatarFashionList(local_116);
        int local_121 = local_116.Num();
        int local_79 = local_64.GetPlayerId();
        FString local_120 = FString();
        bool local_123 = false;
        for (auto& local_138 : local_116)
        {
            local_112 = local_138.GetAvatarId();
            if (local_112 != local_111)
            {
                XLog(ELog(79), FString().Append("[InitAvatarFashionFromDS] skip entry EntryAvatarId=").Append(local_112).Append(" != Target=").Append(local_111));
                continue;
            }
            FAvatarFashionNotifyData local_168 = this.MakeAvatarFashionNotifyData(local_138);
            this.ApplyAvatarFashionNotifyToPawn(AvatarEntity, local_168);
            XLog(ELog(79), FString().Append("[InitAvatarFashionFromDS] applied AvatarId=").Append(local_111).Append(" via shared fashion apply logic"));
            local_123 = true;
            break;
        }
        if (!(local_123))
        {
            XWarning(ELog(79), FString().Append("[InitAvatarFashionFromDS] no matching DS AvatarFashion for AvatarId=").Append(local_111).Append(", keep default appearance"));
        }
        this.ApplyMainAvatarFacePreset(AvatarEntity, local_48, local_110.GetFacePresetId(), "[InitAvatarFashionFromDS]");
        return;
    }
    UFUNCTION()
    void Monitor_InitPlayerFashionFromDS(const FECSEntity &inout PlayerControllerEntity, const FC_PlayerController &inout PlayerController) const
    {
        UGameDSConnectionSubsystem local_4 = ::UGameDSConnectionSubsystem::Get();
        if (local_4 == nullptr)
        {
            return;
        }
        FPbDsPlayerInfo local_28 = local_4.GetPlayerInfo(PlayerController.GetPlayerId());
        if (!(local_28.IsValid()))
        {
            return;
        }
        FPbDsPlayerFashionInfo local_48 = local_28.GetFashionInfo();
        this.ApplyPlayerFashionSnapshot(PlayerControllerEntity, local_48.GetMountId(), local_48.GetMountDecoId(), "[InitPlayerFashionFromDS]");
        return;
    }
    UFUNCTION()
    void Monitor_OnPlayerFashionStateChanged(const FECSEntity &inout PlayerControllerEntity, const FC_PlayerFashionState &inout PlayerFashionState) const
    {
        if (!(::FMountUtils::IsEquippedMountPrefabMismatch(PlayerControllerEntity)))
        {
            return;
        }
        FC_MountPendingChangeTag local_8;
        Assign local_6;
        local_6.opCall(local_8);
        return;
    }
    UFUNCTION()
    void Run_Monitor_InitViewAppearance() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = this.GetECSWorld().__GetMonitorViewEntityManagerOnAssignView(EECSRegType(0), false, false);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_InitViewAppearance(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_UpdateViewFacePreset() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorFacePresetStateOnAssignView(this.GetECSWorld(), EECSRegType(0), false, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_UpdateViewFacePreset(local_46, local_52);
        }
        FECSMonitorRuntimeView local_16 = ::__GetMonitorFacePresetStateOnModifyView(this.GetECSWorld(), EECSRegType(0), false, true);
        FECSMonitorRuntimeViewIterator local_40 = local_16.Iterator();
        for (; local_40.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42_2 = local_40.Proceed();
            FECSEntityScopeCycleCounter local_43_2 = FECSEntityScopeCycleCounter(local_42_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_42_2);
            this.Monitor_UpdateViewFacePreset(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_UpdateViewFashion() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorFashionStateOnAssignView(this.GetECSWorld(), EECSRegType(0), false, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_UpdateViewFashion(local_46, local_52);
        }
        FECSMonitorRuntimeView local_16 = ::__GetMonitorFashionStateOnModifyView(this.GetECSWorld(), EECSRegType(0), false, true);
        FECSMonitorRuntimeViewIterator local_40 = local_16.Iterator();
        for (; local_40.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42_2 = local_40.Proceed();
            FECSEntityScopeCycleCounter local_43_2 = FECSEntityScopeCycleCounter(local_42_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_42_2);
            this.Monitor_UpdateViewFashion(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_ApplyAppearanceToActor() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorViewEntityAppearanceOnAssignView(this.GetECSWorld(), EECSRegType(2), false, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_ApplyAppearanceToActor(local_46, local_52);
        }
        FECSMonitorRuntimeView local_16 = ::__GetMonitorViewEntityAppearanceOnModifyView(this.GetECSWorld(), EECSRegType(2), false, true);
        FECSMonitorRuntimeViewIterator local_40 = local_16.Iterator();
        for (; local_40.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42_2 = local_40.Proceed();
            FECSEntityScopeCycleCounter local_43_2 = FECSEntityScopeCycleCounter(local_42_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_42_2);
            this.Monitor_ApplyAppearanceToActor(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_ApplyPlayerFashionChangedFromDS() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_PlayerFashionChangedFromDS> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(0)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_PlayerFashionChangedFromDS& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_ApplyPlayerFashionChangedFromDS(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_ForwardPlayerFashionSnapshotToModel() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_PlayerFashionSnapshotSyncedToClient> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(2)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_PlayerFashionSnapshotSyncedToClient& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ClientJob_ForwardPlayerFashionSnapshotToModel(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_InitAvatarFashionFromDS() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorPrefabConfigOnAssignView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_InitAvatarFashionFromDS(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_InitPlayerFashionFromDS() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = this.GetECSWorld().__GetMonitorPlayerControllerOnAssignView(EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_InitPlayerFashionFromDS(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_OnPlayerFashionStateChanged() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorPlayerFashionStateOnAssignView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_OnPlayerFashionStateChanged(local_46, local_52);
        }
        FECSMonitorRuntimeView local_16 = ::__GetMonitorPlayerFashionStateOnModifyView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_40 = local_16.Iterator();
        for (; local_40.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42_2 = local_40.Proceed();
            FECSEntityScopeCycleCounter local_43_2 = FECSEntityScopeCycleCounter(local_42_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_42_2);
            this.Monitor_OnPlayerFashionStateChanged(local_46, local_52);
        }
        return;
    }
}

