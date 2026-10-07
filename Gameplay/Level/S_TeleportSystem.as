

class US_TeleportSystemAS : UECSScriptSystem
{
    bool bLoadingScreenVisible = false;
    ELoadingScreenAction LastLoadingScreenAction = ELoadingScreenAction(0);
    bool bLastCloseUIVisible = false;
    uint64 CloseUIVisibilityRevision = 0;
    uint64 LastCloseUIVisibleRevision = 0;


    UFUNCTION()
    void Init_Implementation()
    {
        UKLLoadingScreenSubsystem local_4 = UKLLoadingScreenSubsystem::Get();
        if (local_4 != nullptr)
        {
            local_4.GetOnLoadingScreenVisibilityChangedDelegate().AddUFunction(this, n"OnLoadingScreenVisibilityChanged");
        }
        this.bLoadingScreenVisible = KLLoadingScreen::IsLoadingScreenVisible(__GetWorldContext());
        UCharacterGlobalSetting local_12 = ::UCharacterGlobalSetting::Get();
        if (local_12 != nullptr)
        {
            local_12.TeleportCondition.InitConditionRuntime(false);
        }
        return;
    }
    UFUNCTION()
    void OnLoadingScreenVisibilityChanged(const bool bVisible, const ELoadingScreenAction Action)
    {
        this.bLoadingScreenVisible = bVisible;
        this.LastLoadingScreenAction = Action;
        if (int(Action) != 1)
        {
            return;
        }
        this.CloseUIVisibilityRevision += 1;
        this.bLastCloseUIVisible = bVisible;
        if (bVisible)
        {
            this.LastCloseUIVisibleRevision = this.CloseUIVisibilityRevision;
        }
        return;
    }
    UFUNCTION()
    void ClientJob_CheckTeleportLoadingScreenStateChanged() const
    {
        FCS_TeleportLoadingScreenState local_2;
        FECSWorldPtr local_4 = ECS::GetECSWorld();
        if (local_2.Serial == 0)
        {
            return;
        }
        else
        {
            if (local_2.ConsumedCloseUIVisibilityRevision != this.CloseUIVisibilityRevision)
            {
                int64 local_16;
                local_16 = local_2.ConsumedCloseUIVisibilityRevision;
                local_2.bLastVisible = this.bLastCloseUIVisible;
                if ((this.LastCloseUIVisibleRevision > local_16 && ((this.LastCloseUIVisibleRevision <= this.CloseUIVisibilityRevision))))
                {
                    local_2.bSawVisible = true;
                }
                local_2.ConsumedCloseUIVisibilityRevision = this.CloseUIVisibilityRevision;
            }
            if (!(local_2.TransactionEntity.IsValid()))
            {
                XLog(ELog(22), FString().Append("[TeleportLoadingTx][ClientClear] Sender=").Append(local_2.TransactionEntity).Append(" Serial=").Append(local_2.Serial).Append(" Visible=").Append(this.bLoadingScreenVisible).Append(" Reason=InvalidOriginalSender"));
                local_2.TransactionEntity = FECSEntity();
                local_2.Serial = 0;
                local_2.bLastVisible = false;
                local_2.bSawVisible = false;
                local_2.ConsumedCloseUIVisibilityRevision = this.CloseUIVisibilityRevision;
                return;
            }
        }
    }
    UFUNCTION()
    void ClientJob_CheckCrossDSLand(const FCS_LocalPlayer &inout LocalPlayer) const
    {
        int local_22 = 0;
        if (this.bLoadingScreenVisible)
        {
            return;
        }
        Has local_14;
        bool local_1 = !(FECSEntity(LocalPlayer.GetPlayerPawnEntity()).IsValid()) || !(local_14.opCall());
        if (local_1)
        {
            return;
        }
        if (!(local_22))
        {
            local_1 = false;
        }
        else
        {
            int64 local_24 = local_22.GetTransactionSerial();
            local_1 = (local_24 == 0);
        }
        local_1 = local_1 && local_22.GetbReleaseRequested();
        if (local_1)
        {
            return;
        }
        SendEvent local_30;
        local_30.opCall(FFPTime(-1));
        return;
    }
    void SetTeleportViewEntityHidden(const FECSEntity &inout ViewEntity, const bool bHidden) const
    {
        if (!(ViewEntity.IsValid()))
        {
            return;
        }
        FECSViewEntityProxy local_6;
        local_6.ViewEntity = ViewEntity;
        local_6.ModifyInVisibleCount(bHidden, EViewEntityInvisibleReason(5));
        return;
    }
    void SetTeleportViewHideMeshes(const FECSEntity &inout Entity, const TArray<FName> &inout MeshNames, const bool bHidden) const
    {
        bool local_25;
        if (!(Entity.IsValid()))
        {
            return;
        }
        for (auto& local_16 : MeshNames)
        {
            if ((local_16 == NAME_None))
            {
                continue;
            }
            FECSActorComponentProxy local_20 = Entity.ModifyActorComponent(local_16);
            if (!(local_20.IsValid()))
            {
                continue;
            }
            if (bHidden)
            {
                local_20.SetVisible(false);
                continue;
            }
            local_25 = true;
            Get local_30;
            const FC_ViewEntityActorComponentData& local_32 = local_30.opCall();
            if (local_32)
            {
                local_25 = local_32.bDefaultVisible;
            }
            Get local_36;
            const FC_CompHidden& local_38 = local_36.opCall();
            if (local_38)
            {
                int local_39 = 0;
                if (local_38.GetHiddenCountByName().Find(local_16, local_39))
                {
                    if (local_39 > 0)
                    {
                        local_25 = false;
                    }
                    else
                    {
                        if (local_39 < 0)
                        {
                        }
                    }
                }
            }
            Get local_44;
            const FC_ViewEntityInvisibleCounter& local_46 = local_44.opCall();
            if (local_46)
            {
                if (int(local_46.Count) > 0)
                {
                    local_25 = false;
                }
            }
            local_20.SetVisible(local_25);
        }
        return;
    }
    void UpdateTeleportViewHideWeapon(const FECSEntity &inout Entity, FC_TeleportViewHideRuntime &inout Runtime) const
    {
        bool local_5;
        FECSEntity local_4;
        if (Entity.IsValid())
        {
            Get local_10;
            const FC_CharacterWeapon& local_12 = local_10.opCall();
            if (local_12)
            {
                FECSEntity local_16 = local_12.GetCurrentWeaponEntity();
                if (!(local_16.IsValid()))
                {
                    local_5 = false;
                }
                else
                {
                    Has local_20;
                    local_5 = local_20.opCall();
                }
                if (local_5)
                {
                    FECSActorProxy local_26 = local_16.ModifyActor();
                    if (local_26.IsValid())
                    {
                        local_4 = local_26.ViewEntity;
                    }
                }
            }
        }
        if ((Runtime.GuardedWeaponViewEntity == local_4))
        {
            return;
        }
        this.SetTeleportViewEntityHidden(Runtime.GuardedWeaponViewEntity, false);
        Runtime.GuardedWeaponViewEntity = FECSEntity();
        if (local_4.IsValid())
        {
            this.SetTeleportViewEntityHidden(local_4, true);
            Runtime.GuardedWeaponViewEntity = local_4;
        }
        return;
    }
    void EnsureTeleportViewHideApplied(const FECSEntity &inout Entity, FC_TeleportViewHideRuntime &inout Runtime) const
    {
        if (!(Runtime.bInitialized))
        {
            ULevelGlobalSettings local_6 = ::ULevelGlobalSettings::Get();
            if (local_6 != nullptr)
            {
                Runtime.GuardedMeshNames = local_6.TeleportHideMeshNames;
                Runtime.bInitialized = true;
            }
        }
        if (Runtime.bInitialized)
        {
            this.SetTeleportViewHideMeshes(Entity, Runtime.GuardedMeshNames, true);
        }
        this.UpdateTeleportViewHideWeapon(Entity, Runtime);
        return;
    }
    bool IsTeleportViewHideApplied(const FECSEntity &inout Entity, const FC_TeleportViewHideRuntime &inout Runtime) const
    {
        const UActorComponent local_26;
        USceneComponent local_30;
        const AActor local_34;
        if (!(Runtime.bInitialized) || Runtime.GuardedMeshNames.IsEmpty())
        {
            return false;
        }
        for (auto& local_16 : Runtime.GuardedMeshNames)
        {
            if ((local_16 == NAME_None))
            {
                return false;
            }
            FECSActorComponentProxy local_20 = Entity.ModifyActorComponent(local_16);
            if (!(local_20.IsValid()))
            {
                return false;
            }
            local_30 = Cast<USceneComponent>(local_26);
            if (local_30 == nullptr || local_30.IsVisible())
            {
                return false;
            }
        }
        if (Runtime.GuardedWeaponViewEntity.IsValid())
        {
            local_34 = Runtime.GuardedWeaponViewEntity.GetActor();
            if (local_34 != nullptr && !(local_34.IsHidden()))
            {
                return false;
            }
        }
        return true;
    }
    void ClearTeleportViewHideRuntime(const FECSEntity &inout Entity, FC_TeleportViewHideRuntime &inout Runtime) const
    {
        this.SetTeleportViewHideMeshes(Entity, Runtime.GuardedMeshNames, false);
        Runtime.GuardedMeshNames.Reset(0);
        this.SetTeleportViewEntityHidden(Runtime.GuardedWeaponViewEntity, false);
        Runtime.GuardedWeaponViewEntity = FECSEntity();
        Runtime.bInitialized = false;
        return;
    }
    UFUNCTION()
    void Monitor_TeleportViewHideState(const FECSEntity &inout Entity, const FC_TeleportViewHideState &inout State) const
    {
        FC_TeleportViewHideRuntime local_6;
        if (local_6.TransactionSerial != State.GetTransactionSerial())
        {
            local_6.TransactionSerial = State.GetTransactionSerial();
            local_6.bReadyReported = false;
            local_6.bLoadingVisibleReported = false;
            local_6.bCloseReported = false;
            local_6.bWaitLogged = false;
            local_6.bGuardAppliedLogged = false;
        }
        return;
    }
    UFUNCTION()
    void Monitor_OnRemoveTeleportViewHideState(const FECSEntity &inout Entity, const FC_TeleportViewHideState &inout State) const
    {
        Has local_4;
        if (!(local_4.opCall()))
        {
            return;
        }
        XWarning(ELog(22), FString().Append("[TeleportViewHide][ClientReleaseStateRemoved] Entity=").Append(Entity));
        Remove local_16;
        local_16.opCall();
        return;
    }
    UFUNCTION()
    void ClientJob_EnforceTeleportViewHide(const FECSEntity &inout Entity, FC_TeleportViewHideRuntime &inout Runtime) const
    {
        int local_6 = 0;
        this.EnsureTeleportViewHideApplied(Entity, Runtime);
        if (!(local_6))
        {
            return;
        }
        if (Runtime.TransactionSerial != local_6.GetTransactionSerial())
        {
            Runtime.TransactionSerial = local_6.GetTransactionSerial();
            Runtime.bReadyReported = false;
            Runtime.bLoadingVisibleReported = false;
            Runtime.bCloseReported = false;
            Runtime.bWaitLogged = false;
            Runtime.bGuardAppliedLogged = false;
        }
        return;
    }
    UFUNCTION()
    void ClientJob_ReportTeleportViewHideReady(const FECSEntity &inout Entity, FC_TeleportViewHideRuntime &inout Runtime, const FCS_LocalPlayer &inout LocalPlayer) const
    {
        int local_6 = 0;
        bool local_13;
        FCS_TeleportLoadingScreenState local_40;
        bool local_7 = !(local_6);
        if (local_7)
        {
            local_7 = true;
        }
        else
        {
            int64 local_10 = local_6.GetTransactionSerial();
            local_7 = (local_10 == 0);
        }
        local_7 = local_7 || local_6.GetbReleaseRequested();
        if (local_7)
        {
            return;
        }
        if (!(this.IsTeleportViewHideApplied(Entity, Runtime)))
        {
            return;
        }
        if (!(Runtime.bGuardAppliedLogged))
        {
            local_13 = true;
            Runtime.bGuardAppliedLogged = local_13;
            XLog(ELog(22), FString().Append("[TeleportViewHide][ClientGuardApplied] Entity=").Append(Entity).Append(" Serial=").Append(Runtime.TransactionSerial).Append(" Meshes=").Append(Runtime.GuardedMeshNames.Num()).Append(" WeaponView=").Append(Runtime.GuardedWeaponViewEntity));
            FName local_22(NAME_None);
            FFPTime local_26;
            bool local_7_2 = Entity.ESMGetCurrentViewState(n"MainSM", local_22, local_26);
            XLog(ELog(22), FString().Append("[TeleportOrder][ClientMeshHidden] Entity=").Append(Entity).Append(" Serial=").Append(Runtime.TransactionSerial).Append(" MeshHidden=true ViewState=").Append(local_22).Append(" HasViewState=").Append(local_7_2).Append(" ConsumedKeyFrameWorldTime=").Append(local_26));
        }
        if (!(Runtime.bReadyReported) && LocalPlayer.PlayerEntity.IsValid())
        {
            bool local_27;
            FCE_TeleportViewHideReady local_34;
            FFPTime local_24 = FFPTime(-1);
            local_34.TargetEntity = Entity;
            local_34.Serial = local_6.GetTransactionSerial();
            local_27 = true;
            Runtime.bReadyReported = local_27;
            XLog(ELog(22), FString().Append("[TeleportViewHide][ClientGuardReady] Reporter=").Append(LocalPlayer.PlayerEntity).Append(" Target=").Append(Entity).Append(" Serial=").Append(local_6.GetTransactionSerial()));
        }
        if (!((LocalPlayer.GetPlayerPawnEntity() == Entity)))
        {
            return;
        }
        FECSWorldPtr local_42 = ECS::GetECSWorld();
        if (!((local_40.TransactionEntity == Entity)) || (local_40.Serial != local_6.GetTransactionSerial()))
        {
            return;
        }
        if (!(Runtime.bLoadingVisibleReported))
        {
            FCE_TeleportLoadingScreenStateChanged local_52;
            bool local_27;
            if (!(this.bLoadingScreenVisible))
            {
                if (local_40.bSawVisible && !(local_40.bLastVisible) && !(Runtime.bCloseReported))
                {
                    FFPTime local_24_2 = FFPTime(-1);
                    local_52.TargetEntity = Entity;
                    local_27 = false;
                    local_52.bVisible = local_27;
                    local_52.Action = ELoadingScreenAction(1);
                    local_52.Serial = local_6.GetTransactionSerial();
                    local_13 = true;
                    Runtime.bCloseReported = local_13;
                    local_40.TransactionEntity = FECSEntity();
                    local_40.Serial = 0;
                    local_13 = false;
                    local_40.bLastVisible = local_13;
                    local_27 = false;
                    local_40.bSawVisible = local_27;
                    XWarning(ELog(22), FString().Append("[TeleportLoadingTx][ClientClosedBeforeBarrier] Sender=").Append(Entity).Append(" Serial=").Append(local_6.GetTransactionSerial()));
                }
                return;
            }
            FFPTime local_24_3 = FFPTime(-1);
            local_52.TargetEntity = Entity;
            local_13 = true;
            local_52.bVisible = local_13;
            local_52.Action = ELoadingScreenAction(1);
            local_52.Serial = local_6.GetTransactionSerial();
            local_27 = true;
            Runtime.bLoadingVisibleReported = local_27;
            XLog(ELog(22), FString().Append("[TeleportLoadingTx][ClientLoadingVisible] Sender=").Append(Entity).Append(" Serial=").Append(local_6.GetTransactionSerial()));
            return;
        }
        local_13 = !(Runtime.bCloseReported);
        if (!(local_13))
        {
            local_13 = false;
        }
        else
        {
            local_13 = local_40.bSawVisible;
        }
        local_13 = local_13 && !(local_40.bLastVisible);
        if (local_13)
        {
            FCE_TeleportLoadingScreenStateChanged local_52;
            bool local_27;
            FFPTime local_24_4 = FFPTime(-1);
            local_52.TargetEntity = Entity;
            local_13 = false;
            local_52.bVisible = local_13;
            local_52.Action = ELoadingScreenAction(1);
            local_52.Serial = local_6.GetTransactionSerial();
            local_13 = true;
            Runtime.bCloseReported = local_13;
            local_40.TransactionEntity = FECSEntity();
            local_40.Serial = 0;
            local_13 = false;
            local_40.bLastVisible = local_13;
            local_27 = false;
            local_40.bSawVisible = local_27;
            XLog(ELog(22), FString().Append("[TeleportLoadingTx][ClientLoadingClosed] Sender=").Append(Entity).Append(" Serial=").Append(local_6.GetTransactionSerial()));
        }
        return;
    }
    UFUNCTION()
    void ClientJob_UpdateTeleportViewHide(const FECSEntity &inout Entity, FC_TeleportViewHideRuntime &inout Runtime, const FCS_FixedTime &inout FixedTime) const
    {
        int local_34 = 0;
        FName local_2(NAME_None);
        FFPTime local_6;
        bool local_7_2 = Entity.ESMGetCurrentViewState(n"MainSM", local_2, local_6);
        FName local_13 = ::ULevelGlobalSettings::GetTeleportLoopStateName();
        Has local_18;
        bool local_8 = local_18.opCall();
        if (local_8)
        {
            Remove local_28;
            this.ClearTeleportViewHideRuntime(Entity, Runtime);
            XWarning(ELog(22), FString().Append("[TeleportViewHide][ClientReleaseESMInvalid] Entity=").Append(Entity).Append(" ViewState=").Append(local_2));
            local_28.opCall();
            return;
        }
        if (!(local_34))
        {
            Remove local_28;
            this.ClearTeleportViewHideRuntime(Entity, Runtime);
            XWarning(ELog(22), FString().Append("[TeleportViewHide][ClientReleaseMissingState] Entity=").Append(Entity).Append(" ViewState=").Append(local_2));
            local_28.opCall();
            return;
        }
        if (local_34.GetbReleaseRequested() && local_7_2 && !((local_2 == local_13)) && (local_6.opCmp(local_34.GetReleaseRequestTime()) >= 0))
        {
            Remove local_28;
            this.ClearTeleportViewHideRuntime(Entity, Runtime);
            XLog(ELog(22), FString().Append("[TeleportViewHide][ClientRelease] Entity=").Append(Entity).Append(" ViewState=").Append(local_2).Append(" ConsumedKeyFrameWorldTime=").Append(local_6).Append(" ReleaseRequestTime=").Append(local_34.GetReleaseRequestTime()));
            local_28.opCall();
            return;
        }
        if (FFPTime(FixedTime.Time).opCmp(local_34.GetForceReleaseTime()) >= 0)
        {
            Remove local_28;
            this.ClearTeleportViewHideRuntime(Entity, Runtime);
            XWarning(ELog(22), FString().Append("[TeleportViewHide][ClientForceRelease] Entity=").Append(Entity).Append(" ViewState=").Append(local_2).Append(" HasViewState=").Append(local_7_2).Append(" ReleaseRequested=").Append(local_34.GetbReleaseRequested()));
            local_28.opCall();
            return;
        }
        if (!(local_34.GetbReleaseRequested()))
        {
            return;
        }
        if (!(Runtime.bWaitLogged))
        {
            Runtime.bWaitLogged = true;
            XLog(ELog(22), FString().Append("[TeleportViewHide][ClientWaitView] Entity=").Append(Entity).Append(" ViewState=").Append(local_2).Append(" HasViewState=").Append(local_7_2).Append(" ConsumedKeyFrameWorldTime=").Append(local_6).Append(" ReleaseRequestTime=").Append(local_34.GetReleaseRequestTime()));
        }
        return;
    }
    UFUNCTION()
    void Monitor_OnRemoveTeleportViewHideRuntime(const FECSEntity &inout Entity, const FC_TeleportViewHideRuntime &inout Runtime) const
    {
        bool local_4 = (Runtime.GuardedMeshNames.Num() > 0);
        this.SetTeleportViewHideMeshes(Entity, Runtime.GuardedMeshNames, false);
        if (Runtime.GuardedWeaponViewEntity.IsValid())
        {
            this.SetTeleportViewEntityHidden(Runtime.GuardedWeaponViewEntity, false);
            local_4 = true;
        }
        if (local_4)
        {
            XWarning(ELog(22), FString().Append("[TeleportViewHide][ClientCleanup] Entity=").Append(Entity).Append(" Reason=RuntimeRemovedWhileApplied"));
        }
        return;
    }
    void RequestSameDSTeleportViewHideRelease(const FECSEntity &inout Entity, const uint64 TransactionSerial, const bool bWaitForViewLand) const
    {
        int local_10 = 0;
        if (TransactionSerial == 0)
        {
            return;
        }
        FECSEntity::Modify<FC_TeleportViewHideState> local_8 = FECSEntity::Modify<FC_TeleportViewHideState>(Entity);
        if (!(local_10) || (local_10.GetTransactionSerial() != TransactionSerial))
        {
            return;
        }
        FECSWorldPtr local_16 = ECS::GetECSWorld();
        Get local_20;
        FFPTime local_14 = FFPTime(local_20.opCall().Time);
        local_10.SetReleaseRequestTime(local_14);
        FFPTime local_30;
        if (bWaitForViewLand)
        {
            local_30 = (local_14 + FFPTime(::ULevelGlobalSettings::GetTeleportCrossDSLandMaxWaitTime()));
        }
        else
        {
            local_30 = local_14;
        }
        local_10.SetForceReleaseTime(local_30);
        local_10.SetbReleaseRequested(true);
        return;
    }
    void FailOpenSameDSTeleportBarrier(const FECSEntity &inout Entity, const uint64 TransactionSerial, const FString &inout Reason) const
    {
        FC_TeleportLoadingTransaction local_6;
        FC_TeleportLoadingTransaction local_36;
        if (!(local_6) || !(local_6.bActive) || (local_6.Serial != TransactionSerial))
        {
            return;
        }
        Get local_14;
        const FC_PendingTeleport& local_16 = local_14.opCall();
        if (local_16)
        {
            if (local_16.bWaitLoadingVisible && (local_16.LoadingSerial == TransactionSerial))
            {
                FC_PendingTeleport local_22;
                local_22.bWaitLoadingVisible = false;
                local_22.LoadingSerial = 0;
            }
        }
        FName local_26 = ::ULevelGlobalSettings::GetTeleportLoopStateName();
        bool local_8 = this.IsCurrentMainSMState(Entity, local_26);
        bool local_27 = local_6.bLoopTransitPending && Entity.ESMHasPendingExternalTransit(NAME_None, local_26);
        bool local_7 = !(Entity.IsActive());
        bool local_28 = local_8 || (!(local_7) && local_27);
        if (local_28 && !(local_7))
        {
            this.TryRequestTeleportLand(Entity, local_27);
        }
        bool local_30 = !(local_7);
        this.RequestSameDSTeleportViewHideRelease(Entity, TransactionSerial, local_30 && local_28);
        ::TeleporterUtils::RestoreSameDSTeleportVisualHide(Entity, TransactionSerial);
        if (local_36 && (local_36.Serial == TransactionSerial))
        {
            local_36.bActive = local_28;
            bool local_30_2 = false;
            local_36.bBarrierOpened = local_30_2;
            local_36.bLoopTransitPending = (local_28 && local_27);
            if (local_28)
            {
                FECSWorldPtr local_40 = ECS::GetECSWorld();
                Get local_44;
                FFPTime local_38 = FFPTime(local_44.opCall().Time);
                bool local_30_3 = true;
                local_36.bCloseRequested = local_30_3;
                local_36.GuardReadyDeadline = local_38;
                local_36.ForceCloseTime = local_38;
            }
        }
        XWarning(ELog(22), FString().Append("[TeleportLoadingTx][ServerBarrierFailOpen] Sender=").Append(Entity).Append(" Serial=").Append(TransactionSerial).Append(" Reason=").Append(Reason).Append(" ExpectedMask=").Append(local_6.ExpectedGuardReadyMask).Append(" ReadyMask=").Append(local_6.GuardReadyMask).Append(" LoadingVisible=").Append(local_6.bLoadingVisible).Append(" WasInLoop=").Append(local_8).Append(" LoopTransitQueued=").Append(local_27).Append(" NeedsLandCleanup=").Append(local_28).Append(" Inactive=").Append(local_7));
        return;
    }
    void TryOpenSameDSTeleportBarrier(const FECSEntity &inout Entity, const uint64 TransactionSerial) const
    {
        FC_TeleportLoadingTransaction local_6;
        bool local_8;
        bool local_7 = !(local_6) || !(local_6.bActive) || (local_6.Serial != TransactionSerial);
        if (local_7)
        {
            local_8 = true;
        }
        else
        {
            local_8 = local_6.bBarrierOpened;
        }
        if (local_8)
        {
            local_7 = true;
        }
        else
        {
            local_7 = local_6.bCloseRequested;
        }
        if (local_7)
        {
            return;
        }
        local_8 = !(local_6.bLoadingVisible);
        if (local_8 || (local_6.ExpectedGuardReadyMask == 0))
        {
            local_8 = true;
        }
        else
        {
            local_8 = ((local_6.GuardReadyMask & local_6.ExpectedGuardReadyMask) != local_6.ExpectedGuardReadyMask);
        }
        if (local_8)
        {
            return;
        }
        if (!(Entity.IsActive()))
        {
            this.FailOpenSameDSTeleportBarrier(Entity, TransactionSerial, "InactiveBeforeBarrierOpen");
            return;
        }
        FC_PendingTeleport local_22;
        local_8 = !(local_22);
        if ((local_8 || !(local_22.bWaitLoadingVisible)) || (local_22.LoadingSerial != TransactionSerial))
        {
            this.FailOpenSameDSTeleportBarrier(Entity, TransactionSerial, "MissingBarrierPending");
            return;
        }
        FName local_26 = ::ULevelGlobalSettings::GetTeleportLoopStateName();
        FName local_24 = ::ULevelGlobalSettings::GetTeleportLandStateName();
        bool local_7_3 = ::FESMUtils::MainSMHasState(Entity, local_26);
        bool local_12 = ::FESMUtils::MainSMHasState(Entity, local_24);
        bool local_29 = !(local_7_3);
        if (local_29 || !(local_12))
        {
            this.FailOpenSameDSTeleportBarrier(Entity, TransactionSerial, FString().Append("InvalidESM HasLoop=").Append(local_7_3).Append(" HasLand=").Append(local_12));
            return;
        }
        bool local_29_2 = this.IsCurrentMainSMState(Entity, local_26);
        bool local_11 = !(local_29_2);
        if (local_11 && Entity.ESMHasPendingExternalTransit(NAME_None, NAME_None))
        {
            this.FailOpenSameDSTeleportBarrier(Entity, TransactionSerial, "MainSMTransitPendingBeforeLoop");
            return;
        }
        bool local_11_2 = true;
        FC_TeleportLoadingTransaction local_42;
        local_42.bBarrierOpened = local_11_2;
        bool local_30 = !(local_29_2);
        local_42.bLoopTransitPending = local_30;
        if (!(local_29_2))
        {
            FESMExternalTransitHandle local_52 = Entity.ESMExternalTransitMainSM(local_26, NAME_None);
            FString local_34 = FString();
        }
        FESMExternalTransitHandle local_52_2 = Entity.ESMExternalTransit(n"UpperSM", n"UB_Empty", n"TeleportUpperReset");
        XLog(ELog(22), FString().Append("[TeleportLoadingTx][ServerBarrierOpen] Sender=").Append(Entity).Append(" Serial=").Append(TransactionSerial).Append(" ExpectedMask=").Append(local_6.ExpectedGuardReadyMask).Append(" ReadyMask=").Append(local_6.GuardReadyMask).Append(" AlreadyInLoop=").Append(local_29_2));
        return;
    }
    UFUNCTION()
    void ServerJob_HandleTeleportViewHideReady(const FCE_TeleportViewHideReady &inout Event) const
    {
        FC_TeleportLoadingTransaction local_10;
        int local_16;
        FC_TeleportLoadingTransaction local_34;
        FECSEntity local_4 = Event.TargetEntity;
        if ((!(local_10) || !(local_16) || !(local_10.bActive) || (local_10.Serial != Event.Serial)))
        {
            return;
        }
        int64 local_20 = 1 << local_16.GetPlayerIndex();
        int64 local_24 = local_10.ExpectedGuardReadyMask & local_20;
        if (local_24 == 0)
        {
            return;
        }
        local_34.GuardReadyMask |= local_20;
        XLog(ELog(22), FString().Append("[TeleportViewHide][ServerGuardReady] Reporter=").Append(Event.Sender).Append(" Target=").Append(local_4).Append(" Serial=").Append(Event.Serial).Append(" PlayerIndex=").Append(local_16.GetPlayerIndex()).Append(" ReadyMask=").Append(local_34.GuardReadyMask).Append(" ExpectedMask=").Append(local_34.ExpectedGuardReadyMask));
        this.TryOpenSameDSTeleportBarrier(local_4, Event.Serial);
        return;
    }
    UFUNCTION()
    void Job_HandleTeleportAnimTransit(const FCE_TeleportLoadingScreenStateChanged &inout Event) const
    {
        FC_TeleportLoadingTransaction local_32;
        FC_TeleportLoadingTransaction local_62;
        FECSEntity local_4 = Event.TargetEntity;
        if (!((::FASCommonUtils::GetUniquePlayerEntity(local_4) == Event.Sender)))
        {
            XWarning(ELog(22), FString().Append("[TeleportLoadingTx][ServerReject] Reporter=").Append(Event.Sender).Append(" Target=").Append(local_4).Append(" Serial=").Append(Event.Serial).Append(" Visible=").Append(Event.bVisible).Append(" Reason=NotTargetOwner"));
            return;
        }
        if (!(::BlueprintFunctions_Common::IsEntityControlledByPlayer(FECSEntityAdapter(local_4))))
        {
            XWarning(ELog(22), FString().Append("[TeleportLoadingTx][ServerReject] Sender=").Append(local_4).Append(" Serial=").Append(Event.Serial).Append(" Visible=").Append(Event.bVisible).Append(" Action=").Append(Event.Action).Append(" Reason=NotPlayerControlled"));
            return;
        }
        if (int(Event.Action) != 1)
        {
            XWarning(ELog(22), FString().Append("[TeleportLoadingTx][ServerReject] Sender=").Append(local_4).Append(" Serial=").Append(Event.Serial).Append(" Visible=").Append(Event.bVisible).Append(" Action=").Append(Event.Action).Append(" Reason=InvalidAction"));
            return;
        }
        if (!(local_32))
        {
            XWarning(ELog(22), FString().Append("[TeleportLoadingTx][ServerReject] Sender=").Append(local_4).Append(" Serial=").Append(Event.Serial).Append(" Visible=").Append(Event.bVisible).Append(" Reason=MissingTransaction"));
            return;
        }
        if (!(local_32.bActive) || (local_32.Serial != Event.Serial))
        {
            XWarning(ELog(22), FString().Append("[TeleportLoadingTx][ServerReject] Sender=").Append(local_4).Append(" EventSerial=").Append(Event.Serial).Append(" CurrentSerial=").Append(local_32.Serial).Append(" Active=").Append(local_32.bActive).Append(" Visible=").Append(Event.bVisible).Append(" Reason=StaleOrInactive"));
            return;
        }
        if (Event.bVisible)
        {
            FC_TeleportLoadingTransaction local_50;
            if (!(local_32.bLoadingVisible))
            {
                FC_PendingTeleport local_44;
                if (!(local_44) || !(local_44.bWaitLoadingVisible) || (local_44.LoadingSerial != Event.Serial))
                {
                    XWarning(ELog(22), FString().Append("[TeleportLoadingTx][ServerReject] Sender=").Append(local_4).Append(" Serial=").Append(Event.Serial).Append(" Visible=true Reason=MissingBarrierPending"));
                    return;
                }
            }
            local_50.bLoadingVisible = true;
            XLog(ELog(22), FString().Append("[TeleportLoadingTx][ServerLoadingVisible] Sender=").Append(local_4).Append(" Serial=").Append(Event.Serial).Append(" ReadyMask=").Append(local_50.GuardReadyMask).Append(" ExpectedMask=").Append(local_50.ExpectedGuardReadyMask));
            this.TryOpenSameDSTeleportBarrier(local_4, Event.Serial);
        }
        else
        {
            FC_TeleportLoadingTransaction local_50;
            bool local_58;
            bool local_53;
            bool local_52;
            bool local_51;
            if (local_32.bCloseRequested)
            {
                return;
            }
            local_51 = local_32.bTeleportApplied;
            local_52 = local_32.bLoopTransitPending;
            local_53 = local_32.bBarrierOpened;
            if (!(local_50) || (local_50.Serial != Event.Serial))
            {
                return;
            }
            local_50.bCloseRequested = true;
            if (!(local_51))
            {
                if (!(local_53))
                {
                    this.FailOpenSameDSTeleportBarrier(local_4, Event.Serial, "LoadingClosedBeforeBarrier");
                    return;
                }
                XLog(ELog(22), FString().Append("[TeleportLoadingTx][ServerCloseDeferred] Sender=").Append(local_4).Append(" Serial=").Append(Event.Serial).Append(" TeleportApplied=false"));
                return;
            }
            FName local_57 = ::ULevelGlobalSettings::GetTeleportLoopStateName();
            bool local_9 = this.IsCurrentMainSMState(local_4, local_57);
            local_58 = local_52 && local_4.ESMHasPendingExternalTransit(NAME_None, local_57);
            bool local_37 = !(local_4.IsActive());
            if (((local_9 || local_58) && !(local_37)))
            {
                this.TryRequestTeleportLand(local_4, local_58);
            }
            this.RequestSameDSTeleportViewHideRelease(local_4, Event.Serial, (!(local_37) && ((local_9 || local_58))));
            if (local_37)
            {
                ::TeleporterUtils::RestoreSameDSTeleportVisualHide(local_4, Event.Serial);
                if ((local_62 && (local_62.Serial == Event.Serial)))
                {
                    FECSWorldPtr local_64 = ECS::GetECSWorld();
                    Get local_68;
                    local_62.ForceCloseTime = local_68.opCall().Time;
                }
            }
            if ((local_62 && (local_62.Serial == Event.Serial)))
            {
                local_62.bLoopTransitPending = false;
            }
            XLog(ELog(22), FString().Append("[TeleportLoadingTx][ServerClose] Sender=").Append(local_4).Append(" Serial=").Append(Event.Serial).Append(" Visible=false WasInLoop=").Append(local_9).Append(" LoopTransitPending=").Append(local_52).Append(" LoopTransitQueued=").Append(local_58).Append(" TeleportApplied=").Append(local_51).Append(" Inactive=").Append(local_37).Append(" AwaitingAuthorityRelease=true"));
        }
        return;
    }
    UFUNCTION()
    void ServerJob_ClearConsumedTeleportLoopTransitPending(const FECSEntity &inout Entity, FC_TeleportLoadingTransaction &inout Transaction) const
    {
        if (!(Transaction.bLoopTransitPending))
        {
            return;
        }
        int local_6 = Transaction.Serial;
        int local_4 = local_6;
        Transaction.bLoopTransitPending = false;
        XLog(ELog(22), FString().Append("[TeleportOrder][ServerLoopTransitAfterTickESM] Sender=").Append(Entity).Append(" Serial=").Append(local_4).Append(" ViewStateAfterTickESM=").Append(::FESMUtils::GetCurrentMainSMStateName(Entity)));
        if (!(Transaction.bActive) || !(Transaction.bBarrierOpened) || this.IsCurrentMainSMState(Entity, ::ULevelGlobalSettings::GetTeleportLoopStateName()))
        {
            return;
        }
        this.FailOpenSameDSTeleportBarrier(Entity, local_4, "LoopTransitNotConsumed");
        return;
    }
    UFUNCTION()
    void ServerJob_FinalizeSameDSTeleportAuthorityHide(const FECSEntity &inout Entity, FC_TeleportLoadingTransaction &inout Transaction, const FCS_FixedTime &inout FixedTime) const
    {
        bool local_1;
        bool local_2;
        int local_12 = 0;
        if (!(Transaction.bActive) || !(Transaction.bTeleportApplied) || !(Transaction.bCloseRequested))
        {
            return;
        }
        int64 local_4 = Transaction.Serial;
        if (!(local_12) || (local_12.GetTransactionSerial() != local_4) || !(local_12.GetbReleaseRequested()))
        {
            ::TeleporterUtils::RestoreSameDSTeleportVisualHide(Entity, local_4);
            local_1 = this.IsCurrentMainSMState(Entity, ::ULevelGlobalSettings::GetTeleportLoopStateName());
            Transaction.bActive = local_1;
            local_2 = false;
            Transaction.bBarrierOpened = local_2;
            Transaction.bLoopTransitPending = false;
            if (local_1)
            {
                local_2 = true;
                Transaction.bCloseRequested = local_2;
                Transaction.ForceCloseTime = FixedTime.Time;
            }
            XWarning(ELog(22), FString().Append("[TeleportLoadingTx][ServerAuthorityReleaseFailOpen] Sender=").Append(Entity).Append(" Serial=").Append(local_4).Append(" Reason=MissingReleaseState WasInLoop=").Append(local_1));
            return;
        }
        bool local_13 = this.IsCurrentMainSMState(Entity, ::ULevelGlobalSettings::GetTeleportLoopStateName());
        if (local_13)
        {
            ::TeleporterUtils::RestoreSameDSTeleportVisualHide(Entity, local_4);
            local_2 = false;
            Transaction.bBarrierOpened = local_2;
            Transaction.bLoopTransitPending = false;
            return;
        }
        if (FFPTime(FixedTime.Time).opCmp(local_12.GetReleaseRequestTime()) <= 0)
        {
            return;
        }
        ::TeleporterUtils::RestoreSameDSTeleportVisualHide(Entity, local_4);
        Transaction.bActive = false;
        local_2 = false;
        Transaction.bBarrierOpened = local_2;
        Transaction.bLoopTransitPending = false;
        XLog(ELog(22), FString().Append("[TeleportLoadingTx][ServerAuthorityReleased] Sender=").Append(Entity).Append(" Serial=").Append(local_4).Append(" ReleaseRequestTime=").Append(local_12.GetReleaseRequestTime()).Append(" ReleaseTime=").Append(FixedTime.Time));
        return;
    }
    void TryLandCrossDSPawn(const FECSEntity &inout Entity) const
    {
        int local_6 = 0;
        bool local_12;
        Remove local_18;
        int local_34 = 0;
        if (!(local_6))
        {
            local_12 = false;
        }
        else
        {
            int64 local_8 = local_6.GetTransactionSerial();
            local_12 = (local_8 != 0);
        }
        if (local_12)
        {
            int64 local_14;
            local_14 = local_6.GetTransactionSerial();
            local_18.opCall();
            XWarning(ELog(22), FString().Append("[TeleportViewHide][CrossDSLandSuperseded] Entity=").Append(Entity).Append(" CurrentTransactionSerial=").Append(local_14));
            return;
        }
        bool local_11 = this.IsCurrentMainSMState(Entity, ::ULevelGlobalSettings::GetTeleportLoopStateName());
        if (local_11 && Entity.IsActive())
        {
            this.TryRequestTeleportLand(Entity, false);
        }
        local_12 = !(local_34.GetbReleaseRequested());
        if (local_12)
        {
            FECSWorldPtr local_40 = ECS::GetECSWorld();
            Get local_44;
            FFPTime local_38 = FFPTime(local_44.opCall().Time);
            local_34.SetReleaseRequestTime(local_38);
            FFPTime local_54;
            if (local_11)
            {
                local_54 = (local_38 + FFPTime(::ULevelGlobalSettings::GetTeleportCrossDSLandMaxWaitTime()));
            }
            else
            {
                local_54 = local_38;
            }
            local_34.SetForceReleaseTime(local_54);
            local_34.SetbReleaseRequested(true);
        }
        ::TeleporterUtils::RestoreTeleportVisualHide(Entity);
        if (local_11)
        {
            if (local_12)
            {
                XLog(ELog(22), FString().Append("[TeleportViewHide][LandRequested] Entity=").Append(Entity).Append(" Active=").Append(Entity.IsActive()));
            }
            return;
        }
        local_18.opCall();
        XLog(ELog(22), FString().Append("[TeleportViewHide][LandComplete] Entity=").Append(Entity));
        return;
    }
    UFUNCTION()
    void ServerJob_HandleCrossDSLand(const FCE_TeleportCrossDSLandRequest &inout Event) const
    {
        FECSEntity local_4 = FECSEntity(Event.Sender);
        Has local_10;
        if (!(local_4.IsValid()) || !(local_10.opCall()))
        {
            return;
        }
        this.TryLandCrossDSPawn(local_4);
        return;
    }
    UFUNCTION()
    void Job_TimeoutCrossDSLand(const FECSEntity &inout Entity, FC_TeleportLandOnLoadingClose &inout LandMarker) const
    {
        this.TryLandCrossDSPawn(Entity);
        return;
    }
    UFUNCTION()
    void ServerJob_RetryCrossDSLand(const FECSEntity &inout Entity) const
    {
        int local_8 = 0;
        if (!(Entity.IsActive()))
        {
            return;
        }
        bool local_1 = !(local_8);
        if (local_1)
        {
            local_1 = true;
        }
        else
        {
            int64 local_10 = local_8.GetTransactionSerial();
            local_1 = (local_10 != 0);
        }
        local_1 = local_1 || !(local_8.GetbReleaseRequested());
        if (local_1)
        {
            return;
        }
        this.TryLandCrossDSPawn(Entity);
        return;
    }
    UFUNCTION()
    void ServerJob_HandleClientTeleportRequest(const FCE_ClientTeleportToLocationRequest &inout Event) const
    {
        FECSEntity local_4 = FECSEntity(Event.Sender);
        int local_5 = 1232348160;
        FVector local_18 = FVector(Event.Location.X, Event.Location.Y, 1000000.0);
        FVector local_12 = FVector(Event.Location.X, Event.Location.Y, -1000000.0);
        FHitResult local_96;
        FCollisionQueryParams local_134;
        FCollisionResponseParams local_145;
        bool local_148 = FPhysicsUtils::LineTraceSingle(local_4, false, EPhysicsTraceTag(24), local_96, local_18, local_12, FPhysicsUtils::ConvertToCollisionChannel(ETraceTypeQuery(5)), local_134, local_145);
        if (local_148)
        {
            float32 local_149;
            local_149 = 500.0f;
            Get local_154;
            const FC_Collision& local_156 = local_154.opCall();
            if (local_156)
            {
                local_149 = local_156.GetScaledHeight();
            }
            FQuat local_164 = FQuat(Event.Rotation);
            FVector local_176(local_96.Location);
            this.TeleportEntityToPosition(local_4, (local_176 + (FVector(FVector::UpVector) * local_149)), local_164, false, FQuat::Identity, false, true, ELoadingScreenAction(0), true);
        }
        else
        {
            XWarning(ELog(16), FString().Append("Failed to find teleport landscape location for ").Append(Event.Location));
        }
        return;
    }
    bool IsTeleportSettled(const FECSEntity &inout Entity, const bool bWaitSelfDetached, const FECSEntity &inout WaitDetachChild) const
    {
        bool local_5;
        bool local_11;
        if (!(bWaitSelfDetached))
        {
            local_11 = false;
        }
        else
        {
            Has local_4;
            if (local_4.opCall())
            {
                local_5 = true;
            }
            else
            {
                Has local_10;
                local_5 = local_10.opCall();
            }
            local_11 = local_5;
        }
        if (local_11)
        {
            return false;
        }
        if (WaitDetachChild.IsValid())
        {
            Get local_16;
            const FC_AttachmentParent& local_18 = local_16.opCall();
            if (local_18)
            {
                if ((FECSEntity(local_18.GetParent()) == Entity))
                {
                    return false;
                }
            }
        }
        return true;
    }
    bool IsCurrentMainSMState(const FECSEntity &inout Entity, const FName &inout StateName) const
    {
        int local_2 = 0;
        UESMStateMachine local_16;
        int local_20 = 0;
        UESMAsset local_8 = local_2.Asset;
        if (local_8 == nullptr)
        {
            return false;
        }
        int local_10 = -1;
        int local_12 = 0;
        while (true)
        {
            local_16 = local_2.Asset.GetStateMachine(local_12);
            if (local_16 == nullptr)
            {
                break;
            }
            if ((local_16.GetDataName() == n"MainSM"))
            {
                local_10 = local_12;
                break;
            }
            local_12 = local_12 + 1;
        }
        if (local_10 < 0)
        {
            return false;
        }
        if (local_10 >= local_20.Player.GetSMRuntime().Num())
        {
            return false;
        }
        local_16 = local_2.Asset.GetStateMachine(local_10);
        if (local_16 == nullptr)
        {
            return false;
        }
        UESMBaseState local_28 = local_16.GetBaseState(local_20.Player.GetSMRuntime()[].GetStateIndex());
        return local_28 != nullptr && (local_28.GetDataName() == StateName);
    }
    bool TryRequestTeleportLand(const FECSEntity &inout Entity, const bool bAllowReplaceQueuedLoop = false) const
    {
        if (!(Entity.IsActive()))
        {
            return false;
        }
        bool local_1 = Entity.ESMHasPendingExternalTransit(NAME_None, ::ULevelGlobalSettings::GetTeleportLoopStateName());
        bool local_6 = Entity.ESMHasPendingExternalTransit(NAME_None, NAME_None);
        if (local_6 && !(bAllowReplaceQueuedLoop && local_1))
        {
            return false;
        }
        FESMExternalTransitHandle local_16 = Entity.ESMExternalTransitMainSM(::ULevelGlobalSettings::GetTeleportLandStateName(), NAME_None);
        return true;
    }
    UFUNCTION()
    void ServerJob_HandleTeleportRequest(const FCE_TeleportToLocationRequest &inout Event) const
    {
        bool local_5;
        bool local_34;
        const FC_TeleportLoadingTransaction& local_40;
        FECSEntity local_4 = FECSEntity(Event.Sender);
        if (Event.bShowBlackScreen && (int(Event.Action) == 1) && ::BlueprintFunctions_Common::IsEntityControlledByPlayer(FECSEntityAdapter(local_4)))
        {
            Get local_68;
            FC_PendingTeleport local_62;
            Get local_44;
            Has local_20;
            int64 local_56;
            if (!(local_20.opCall()))
            {
                XError(ELog(22), "FCE_TeleportToLocationRequest sender No Transform!");
                return;
            }
            this.ApplyTeleportSideEffects(local_4, Event.bShowBlackScreen, Event.Action, Event.bBlockInput, Event.bTeleportCamera, Event.bSetCameraRotation, FQuat(Event.CameraRotation));
            if ((!(local_40) || !(local_40.bActive)))
            {
                const FC_TeleportViewHideState& local_46 = local_44.opCall();
                if (local_46)
                {
                    int64 local_48 = local_46.GetTransactionSerial();
                    if (local_48 != 0 && !(local_46.GetbReleaseRequested()))
                    {
                        this.RequestSameDSTeleportViewHideRelease(local_4, local_46.GetTransactionSerial(), false);
                        ::TeleporterUtils::RestoreSameDSTeleportVisualHide(local_4, local_46.GetTransactionSerial());
                    }
                }
                XError(ELog(22), FString().Append("[TeleportLoadingTx][ServerQueueFailed] Sender=").Append(local_4).Append(" Reason=MissingActiveTransaction"));
                return;
            }
            local_56 = local_40.Serial;
            local_62.Location = Event.Location;
            local_62.Rotation = Event.Rotation;
            local_62.bWaitSelfDetached = Event.bWaitSelfDetached;
            local_62.WaitDetachChild = Event.WaitDetachChild;
            local_62.bWaitLoadingVisible = true;
            local_62.LoadingSerial = local_56;
            FECSWorldPtr local_64 = ECS::GetECSWorld();
            local_62.DeadlineTime = (FFPTime(local_68.opCall().Time) + FFPTime(::ULevelGlobalSettings::GetTeleportSettleMaxWaitTime()));
            XLog(ELog(22), FString().Append("[TeleportLoadingTx][ServerQueued] Sender=").Append(local_4).Append(" Serial=").Append(local_56).Append(" WaitSelfDetached=").Append(Event.bWaitSelfDetached).Append(" WaitDetachChild=").Append(Event.WaitDetachChild));
            return;
        }
        bool local_79 = false;
        Get local_38;
        local_40 = local_38.opCall();
        if (local_40)
        {
            if (local_40.bActive)
            {
                local_79 = true;
                this.FailOpenSameDSTeleportBarrier(local_4, local_40.Serial, "SupersededByNonBarrierTeleport");
            }
        }
        local_34 = !(local_79);
        if (local_34)
        {
            Get local_44;
            const FC_TeleportViewHideState& local_46_2 = local_44.opCall();
            if (local_46_2)
            {
                int64 local_50 = local_46_2.GetTransactionSerial();
                if (local_50 != 0 && !(local_46_2.GetbReleaseRequested()))
                {
                    this.RequestSameDSTeleportViewHideRelease(local_4, local_46_2.GetTransactionSerial(), false);
                    ::TeleporterUtils::RestoreSameDSTeleportVisualHide(local_4, local_46_2.GetTransactionSerial());
                }
            }
        }
        if (!(Event.bWaitSelfDetached || Event.WaitDetachChild.IsValid()))
        {
            local_34 = false;
        }
        else
        {
            Has local_20;
            local_34 = local_20.opCall();
        }
        if (local_34 && !(this.IsTeleportSettled(local_4, Event.bWaitSelfDetached, Event.WaitDetachChild)))
        {
            Get local_68;
            FC_PendingTeleport local_62;
            local_5 = Event.bBlockInput;
            local_34 = Event.bShowBlackScreen;
            this.ApplyTeleportSideEffects(local_4, local_34, Event.Action, local_5, Event.bTeleportCamera, Event.bSetCameraRotation, FQuat(Event.CameraRotation));
            local_62.Location = Event.Location;
            local_62.Rotation = Event.Rotation;
            local_62.bWaitSelfDetached = Event.bWaitSelfDetached;
            local_62.WaitDetachChild = Event.WaitDetachChild;
            local_62.bWaitLoadingVisible = false;
            int64 local_48_3 = 0;
            local_62.LoadingSerial = local_48_3;
            FECSWorldPtr local_64_2 = ECS::GetECSWorld();
            local_62.DeadlineTime = (FFPTime(local_68.opCall().Time) + FFPTime(::ULevelGlobalSettings::GetTeleportSettleMaxWaitTime()));
            return;
        }
        Has local_84;
        local_5 = local_84.opCall();
        if (local_5)
        {
            Remove local_88;
            local_88.opCall();
        }
        local_34 = Event.bTeleportCamera;
        bool local_80_2 = Event.bSetCameraRotation;
        this.TeleportEntityToPosition(local_4, Event.Location, FQuat(Event.Rotation), local_80_2, FQuat(Event.CameraRotation), local_34, Event.bShowBlackScreen, Event.Action, Event.bBlockInput);
        return;
    }
    UFUNCTION()
    void ServerJob_ResolvePendingTeleport(const FECSEntity &inout Entity, const FC_PendingTeleport &inout Pending, const FCS_FixedTime &inout FixedTime) const
    {
        bool local_2;
        bool local_14;
        Remove local_32;
        bool local_1 = Pending.bWaitLoadingVisible;
        int64 local_4 = Pending.LoadingSerial;
        if (local_1)
        {
            bool local_13;
            FC_TeleportLoadingTransaction local_12;
            local_2 = !(local_12) || !(local_12.bActive);
            if (local_2)
            {
                FC_PendingTeleport local_22;
                local_13 = this.IsCurrentMainSMState(Entity, ::ULevelGlobalSettings::GetTeleportLoopStateName());
                if (local_13)
                {
                    this.TryRequestTeleportLand(Entity, false);
                }
                this.RequestSameDSTeleportViewHideRelease(Entity, local_4, local_13);
                ::TeleporterUtils::RestoreSameDSTeleportVisualHide(Entity, local_4);
                if (!(local_22))
                {
                    local_14 = false;
                }
                else
                {
                    local_14 = local_22.bWaitLoadingVisible;
                }
                local_14 = local_14 && ((local_22.LoadingSerial == local_4));
                if (local_14)
                {
                    local_2 = false;
                    local_22.bWaitLoadingVisible = local_2;
                    int64 local_6 = 0;
                    local_22.LoadingSerial = local_6;
                }
                local_2 = false;
                local_1 = local_2;
                local_4 = 0;
                XWarning(ELog(22), FString().Append("[TeleportLoadingTx][ServerResolverFailOpen] Sender=").Append(Entity).Append(" Reason=MissingOrInactiveTransaction WasInLoop=").Append(local_13));
            }
            else
            {
                if (local_12.Serial != local_4)
                {
                    this.RequestSameDSTeleportViewHideRelease(Entity, local_4, false);
                    ::TeleporterUtils::RestoreSameDSTeleportVisualHide(Entity, local_4);
                    XWarning(ELog(22), FString().Append("[TeleportLoadingTx][ServerResolverSuperseded] Sender=").Append(Entity).Append(" PendingSerial=").Append(local_4).Append(" CurrentSerial=").Append(local_32.opCall()));
                    return;
                }
                if (!(local_12.bBarrierOpened))
                {
                    return;
                }
                if (!(this.IsCurrentMainSMState(Entity, ::ULevelGlobalSettings::GetTeleportLoopStateName())))
                {
                    local_2 = local_12.bLoopTransitPending;
                    if (local_2)
                    {
                        return;
                    }
                    this.FailOpenSameDSTeleportBarrier(Entity, local_4, "LeftLoopBeforeTeleportApplied");
                    local_1 = false;
                    local_4 = 0;
                }
                else
                {
                    FC_TeleportLoadingTransaction local_38;
                    if (!(local_38))
                    {
                        local_2 = false;
                    }
                    else
                    {
                        local_2 = local_38.bActive;
                    }
                    local_2 = local_2 && ((local_38.Serial == local_4));
                    if (local_2)
                    {
                        local_14 = false;
                        local_38.bLoopTransitPending = local_14;
                    }
                }
            }
        }
        local_14 = this.IsTeleportSettled(Entity, Pending.bWaitSelfDetached, Pending.WaitDetachChild);
        local_2 = (FFPTime(FixedTime.Time).opCmp(Pending.DeadlineTime) >= 0);
        if (!(local_14) && !(local_2))
        {
            return;
        }
        local_32.opCall();
        this.ApplyTeleportPosition(Entity, Pending.Location, FQuat(Pending.Rotation));
        if (local_1)
        {
            bool local_13;
            FC_TeleportLoadingTransaction local_12;
            bool local_65;
            local_13 = false;
            local_65 = local_13;
            if (!(local_12))
            {
                local_13 = false;
            }
            else
            {
                local_13 = local_12.bActive;
            }
            local_13 = local_13 && ((local_12.Serial == local_4));
            if (local_13)
            {
                local_12.bLoopTransitPending = false;
                local_12.bTeleportApplied = true;
                local_65 = local_12.bCloseRequested;
            }
            if (local_65)
            {
                bool local_39 = this.IsCurrentMainSMState(Entity, ::ULevelGlobalSettings::GetTeleportLoopStateName());
                if (local_39)
                {
                    this.TryRequestTeleportLand(Entity, false);
                }
                this.RequestSameDSTeleportViewHideRelease(Entity, local_4, local_39);
            }
            XLog(ELog(22), FString().Append("[TeleportLoadingTx][ServerPositionApplied] Sender=").Append(Entity).Append(" Serial=").Append(local_4).Append(" Settled=").Append(local_14).Append(" SettleTimeout=").Append(local_2).Append(" CloseRequested=").Append(local_65));
        }
        return;
    }
    UFUNCTION()
    void ServerJob_TimeoutTeleportLoadingTransaction(const FECSEntity &inout Entity, FC_TeleportLoadingTransaction &inout Transaction, const FCS_FixedTime &inout FixedTime) const
    {
        FC_TeleportLoadingTransaction local_54;
        if (!(Transaction.bActive))
        {
            return;
        }
        if (Transaction.bCloseRequested && !(Transaction.bBarrierOpened))
        {
            if (Transaction.bLoopTransitPending)
            {
                return;
            }
            if (!(this.IsCurrentMainSMState(Entity, ::ULevelGlobalSettings::GetTeleportLoopStateName())))
            {
                Transaction.bActive = false;
                Transaction.bLoopTransitPending = false;
                XLog(ELog(22), FString().Append("[TeleportLoadingTx][ServerLandCleanupComplete] Sender=").Append(Entity).Append(" Serial=").Append(Transaction.Serial));
                return;
            }
            if (Entity.IsActive())
            {
                this.TryRequestTeleportLand(Entity, false);
            }
            return;
        }
        if (!(Transaction.bBarrierOpened) && !(Transaction.bCloseRequested) && ((FFPTime(FixedTime.Time).opCmp(Transaction.GuardReadyDeadline) >= 0)))
        {
            this.FailOpenSameDSTeleportBarrier(Entity, Transaction.Serial, "GuardReadyTimeout");
            return;
        }
        FFPTime local_14 = FFPTime(FixedTime.Time);
        if (local_14.opCmp(Transaction.ForceCloseTime) < 0)
        {
            return;
        }
        int64 local_18 = Transaction.Serial;
        bool local_21 = Transaction.bLoopTransitPending;
        bool local_22 = Transaction.bTeleportApplied;
        bool local_23 = false;
        Get local_28;
        const FC_PendingTeleport& local_30 = local_28.opCall();
        if (local_30)
        {
            if (local_30.bWaitLoadingVisible && ((local_30.LoadingSerial == local_18)))
            {
                FC_PendingTeleport local_36;
                local_36.bWaitLoadingVisible = false;
                int64 local_20_2 = 0;
                local_36.LoadingSerial = local_20_2;
                local_23 = true;
            }
        }
        FName local_4 = ::ULevelGlobalSettings::GetTeleportLoopStateName();
        bool local_1 = this.IsCurrentMainSMState(Entity, local_4);
        bool local_37 = local_21 && Entity.ESMHasPendingExternalTransit(NAME_None, local_4);
        bool local_2 = !(Entity.IsActive());
        bool local_38 = local_1 || (!(local_2) && local_37);
        if (local_38 && !(local_2))
        {
            this.TryRequestTeleportLand(Entity, local_37);
        }
        bool local_41 = false;
        Get local_46;
        const FC_TeleportViewHideState& local_48 = local_46.opCall();
        if (local_48)
        {
            local_41 = local_48.GetTransactionSerial() == local_18 && local_48.GetbReleaseRequested();
        }
        if (!(local_2) || !(local_41))
        {
            bool local_39;
            local_39 = !(local_2);
            this.RequestSameDSTeleportViewHideRelease(Entity, local_18, local_39 && local_38);
        }
        ::TeleporterUtils::RestoreSameDSTeleportVisualHide(Entity, local_18);
        if (local_54 && ((local_54.Serial == local_18)))
        {
            bool local_39;
            local_39 = local_38 && local_37;
            local_54.bLoopTransitPending = local_39;
            local_54.bActive = local_38;
            local_54.bBarrierOpened = false;
            if (local_38)
            {
                local_54.bCloseRequested = true;
                local_54.ForceCloseTime = FixedTime.Time;
            }
        }
        XWarning(ELog(22), FString().Append("[TeleportLoadingTx][ServerForceClose] Sender=").Append(Entity).Append(" Serial=").Append(local_18).Append(" WasInLoop=").Append(local_1).Append(" LoopTransitPending=").Append(local_21).Append(" LoopTransitQueued=").Append(local_37).Append(" NeedsLandCleanup=").Append(local_38).Append(" PendingFailOpen=").Append(local_23).Append(" TeleportApplied=").Append(local_22).Append(" Inactive=").Append(local_2));
        return;
    }
    UFUNCTION()
    void ServerJob_HandlePlayerRequestMoveToTeleporter(const FCE_PlayerRequestMoveToTeleporter &inout Event) const
    {
        int local_43 = 0;
        XLog(ELog(22), FString().Append("HandlePlayerRequestMoveToTeleporter Sender=").Append(Event.Sender).Append(" TeleporterConfig=").Append(Event.TeleporterConfig));
        FECSEntity local_10 = ::TeleporterUtils::GetTeleportRequestPawnEntity(Event.Sender);
        if (!(local_10.IsValid()) || !(::TeleporterUtils::IsTeleportAllowed(local_10)))
        {
            XLog(ELog(22), FString().Append("HandlePlayerRequestMoveToTeleporter Sender=").Append(Event.Sender).Append(" TeleporterConfig=").Append(Event.TeleporterConfig).Append(" PawnEntity=").Append(local_10).Append(" is not allowed to teleport"));
            return;
        }
        if (Event.TeleporterConfig)
        {
            bool local_17;
            local_17 = false;
            FVector local_24;
            FRotator local_30;
            FECSWorldPtr local_32 = ECS::GetECSWorld();
            GetDefaulted local_36;
            FECSEntity local_14 = local_36.opCall().GetTeleporter(Event.TeleporterConfig);
            if (local_14.IsValid())
            {
                local_17 = true;
            }
            if (local_17)
            {
                if (!(::TeleporterUtils::TeleportPawnToEntity(local_10, local_14, Event.Action, true)))
                {
                    XWarning(ELog(22), FString().Append("HandlePlayerRequestMoveToTeleporter Sender=").Append(Event.Sender).Append(" TeleporterConfig=").Append(Event.TeleporterConfig).Append(" TeleporterEntity=").Append(local_14).Append(" failed to get teleport location and rotation"));
                }
            }
            else
            {
                int local_44;
                local_44 = local_43;
                ::UGameDSConnectionSubsystem::Get().PlayerRequestEnterDS(Event.Sender, false, (local_44 != 0));
            }
        }
        return;
    }
    UFUNCTION()
    void ServerJob_HandleTeleportToPublicEventRequest(const FCE_TeleportToPublicEventRequest &inout Event) const
    {
        XLog(ELog(22), FString().Append("HandleTeleportToPublicEventRequest Sender=").Append(Event.Sender).Append(" PublicEventEntity=").Append(Event.PublicEventEntity));
        FECSEntity local_10 = ::TeleporterUtils::GetTeleportRequestPawnEntity(Event.Sender);
        if (!(local_10.IsValid()) || !(::TeleporterUtils::IsTeleportAllowed(local_10)))
        {
            XLog(ELog(22), FString().Append("HandleTeleportToPublicEventRequest Sender=").Append(Event.Sender).Append(" PublicEventEntity=").Append(Event.PublicEventEntity).Append(" PawnEntity=").Append(local_10).Append(" is not allowed to teleport"));
            return;
        }
        if (!(::TeleporterUtils::TeleportPawnToEntity(local_10, Event.PublicEventEntity, Event.Action, true)))
        {
            XLog(ELog(22), FString().Append("HandleTeleportToPublicEventRequest Sender=").Append(Event.Sender).Append(" PublicEventEntity=").Append(Event.PublicEventEntity).Append(" failed to teleport to valid position"));
        }
        return;
    }
    UFUNCTION()
    void ServerJob_HandleAssembleTravelToTeammate(const FCE_AssembleTravelToTeammate &inout Event) const
    {
        int local_26 = 0;
        XLog(ELog(22), FString().Append("HandleAssembleTravelToTeammate InvitedSender=").Append(Event.Sender).Append(" Assembler=").Append(Event.AssemblerPlayerEntity));
        FECSEntity local_10 = ::TeleporterUtils::GetTeleportRequestPawnEntity(Event.Sender);
        if (!(local_10.IsValid()) || !(::TeleporterUtils::IsTeleportAllowed(local_10)))
        {
            XLog(ELog(22), FString().Append("HandleAssembleTravelToTeammate InvitedSender=").Append(Event.Sender).Append(" InvitedPawn=").Append(local_10).Append(" is not allowed to teleport"));
            return;
        }
        FECSEntity local_14;
        ::TeleporterUtils::GetTeleportRequestPawnEntity(local_14);
        if (!(local_14.IsValid()))
        {
            XWarning(ELog(22), FString().Append("HandleAssembleTravelToTeammate Assembler=").Append(Event.AssemblerPlayerEntity).Append(" has no valid pawn"));
            return;
        }
        if (!(local_26))
        {
            XWarning(ELog(22), FString().Append("HandleAssembleTravelToTeammate AssemblerPawn=").Append(local_14).Append(" has no transform"));
            return;
        }
        FECSEntity local_20 = ::TeleporterUtils::FindNearestActiveTeleporter(Event.Sender, local_26.GetPosition());
        if (!(local_20.IsValid()))
        {
            XWarning(ELog(22), FString().Append("HandleAssembleTravelToTeammate InvitedSender=").Append(Event.Sender).Append(" has no active teleporter near assembler"));
            return;
        }
        if (!(::TeleporterUtils::TeleportPawnToEntity(local_10, local_20, ELoadingScreenAction(1), true)))
        {
            XLog(ELog(22), FString().Append("HandleAssembleTravelToTeammate InvitedSender=").Append(Event.Sender).Append(" TeleporterEntity=").Append(local_20).Append(" failed to teleport to valid position"));
        }
        return;
    }
    void ApplyTeleportPosition(const FECSEntity &inout Entity, const FVector &inout Location, const FQuat &inout Rotation) const
    {
        Has local_4;
        bool local_5;
        int local_56 = 0;
        int local_74 = 0;
        if (!(local_4.opCall()))
        {
            XError(ELog(22), "FCE_TeleportToLocationRequest sender No Transform!");
            return;
        }
        Get local_16;
        FVector local_12 = local_16.opCall().GetPosition();
        FRotator local_28 = local_16.opCall().GetRotation().Rotator();
        FECSEntity local_32 = ::FASCommonUtils::GetPlayerPawnOrMountEntity(Entity, true);
        if (local_32.IsValid())
        {
            local_32.TeleportTo(Location, Rotation, FFPTime(-1));
            Has local_44;
            if (!(local_44.opCall()))
            {
                local_5 = false;
            }
            else
            {
                Has local_48;
                local_5 = local_48.opCall();
            }
            if (local_5)
            {
                local_56.SetCheckLocation(local_16.opCall().GetPosition());
                Assign local_60;
                local_60.opCall(FC_ImmediatelyCheckOverlappingTag());
            }
            Modify local_66;
            FC_CharacterMovementControl& local_68 = local_66.opCall();
            if (local_68)
            {
                local_68.SetDesiredRotation(Rotation.Rotator());
            }
        }
        FFPTime local_38 = FFPTime(-1);
        local_74.PreviousLocation = local_12;
        local_74.PreviousRotation = local_28;
        return;
    }
    void ApplyTeleportSideEffects(const FECSEntity &inout Entity, const bool bShowBlackScreen, const ELoadingScreenAction LoadingScreenAction, const bool bBlockInput, const bool bTeleportCamera, const bool bSetCameraRotation, const FQuat &inout CameraRotation) const
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
    }
    void TeleportEntityToPosition(const FECSEntity &inout Entity, const FVector &inout Location, const FQuat &inout Rotation, const bool bSetCameraRotation = false, const FQuat &inout CameraRotation = FQuat::Identity, const bool bTeleportCamera = false, const bool bShowBlackScreen = true, const ELoadingScreenAction LoadingScreenAction = ELoadingScreenAction::None, const bool bBlockInput = true) const
    {
        Has local_4;
        if (!(local_4.opCall()))
        {
            XError(ELog(22), "FCE_TeleportToLocationRequest sender No Transform!");
            return;
        }
        this.ApplyTeleportPosition(Entity, Location, Rotation);
        this.ApplyTeleportSideEffects(Entity, bShowBlackScreen, ELoadingScreenAction(LoadingScreenAction), bBlockInput, bTeleportCamera, bSetCameraRotation, CameraRotation);
        return;
    }
    UFUNCTION()
    void ClientJob_ShowTeleportLoadingScreen(const FCE_ShowTeleportLoadingScreen &inout Event) const
    {
        if (int(Event.Action) == 1 && (Event.Serial != 0) && Event.Sender.IsValid())
        {
            FCS_TeleportLoadingScreenState local_18;
            FECSWorldPtr local_12 = ECS::GetECSWorld();
            local_18.TransactionEntity = Event.Sender;
            local_18.Serial = Event.Serial;
            local_18.bLastVisible = this.bLoadingScreenVisible;
            local_18.bSawVisible = this.bLoadingScreenVisible;
            local_18.ConsumedCloseUIVisibilityRevision = this.CloseUIVisibilityRevision;
            XLog(ELog(22), FString().Append("[TeleportLoadingTx][ClientBind] Sender=").Append(Event.Sender).Append(" Serial=").Append(Event.Serial).Append(" InitialVisible=").Append(this.bLoadingScreenVisible).Append(" Action=").Append(Event.Action));
        }
        UKLLoadingScreenSubsystem::Get().WantsLevelStreaming(Event.Action);
        return;
    }
    UFUNCTION()
    void Job_RestoreTeleportInput(const FECSEntity &inout Entity, FC_TeleportBlockInput &inout BlockInput) const
    {
        if (BlockInput.bInputDisabled)
        {
            if (BlockInput.PlayerEntity.IsValid())
            {
                FCE_SetTeleportInputBlocked local_12;
                FFPTime local_8 = FFPTime(-1);
                local_12.SourceDsId = ::UGameDSConnectionSubsystem::Get().GetDsID();
                local_12.bBlocked = false;
            }
            BlockInput.bInputDisabled = false;
        }
        Remove local_20;
        local_20.opCall();
        return;
    }
    UFUNCTION()
    void Monitor_OnRemoveTeleportBlockInput(const FECSEntity &inout Entity, const FC_TeleportBlockInput &inout BlockInput) const
    {
        if (!(BlockInput.bInputDisabled))
        {
            return;
        }
        if (BlockInput.PlayerEntity.IsValid())
        {
            FCE_SetTeleportInputBlocked local_12;
            FFPTime local_8 = FFPTime(-1);
            local_12.SourceDsId = ::UGameDSConnectionSubsystem::Get().GetDsID();
            local_12.bBlocked = false;
        }
        return;
    }
    UFUNCTION()
    void Monitor_OnRemoveTeleportHideVisual(const FECSEntity &inout Entity, const FC_TeleportHideVisual &inout HideVisual) const
    {
        if (!(HideVisual.bHidden))
        {
            return;
        }
        ::TeleporterUtils::SetTeleportVisualHidden(HideVisual.PlayerEntity, HideVisual.HiddenMeshNames, false);
        return;
    }
    UFUNCTION()
    void Run_ClientJob_CheckTeleportLoadingScreenStateChanged() const
    {
        ECS::GetContextJob();
        this.ClientJob_CheckTeleportLoadingScreenStateChanged();
        return;
    }
    UFUNCTION()
    void Run_ClientJob_CheckCrossDSLand() const
    {
        int local_12 = 0;
        ECS::GetContextJob();
        FECSWorldPtr local_4 = this.GetECSWorld();
        Has local_8;
        if (!(local_8.opCall()))
        {
            return;
        }
        FECSWorldPtr local_4_2 = this.GetECSWorld();
        this.ClientJob_CheckCrossDSLand(local_12);
        return;
    }
    UFUNCTION()
    void Run_Monitor_TeleportViewHideState() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorTeleportViewHideStateOnAssignView(this.GetECSWorld(), EECSRegType(0), false, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_TeleportViewHideState(local_46, local_52);
        }
        FECSMonitorRuntimeView local_16 = ::__GetMonitorTeleportViewHideStateOnModifyView(this.GetECSWorld(), EECSRegType(0), false, true);
        FECSMonitorRuntimeViewIterator local_40 = local_16.Iterator();
        for (; local_40.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42_2 = local_40.Proceed();
            FECSEntityScopeCycleCounter local_43_2 = FECSEntityScopeCycleCounter(local_42_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_42_2);
            this.Monitor_TeleportViewHideState(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_OnRemoveTeleportViewHideState() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorTeleportViewHideStateOnRemoveView(this.GetECSWorld(), EECSRegType(0), false, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_OnRemoveTeleportViewHideState(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_EnforceTeleportViewHide() const
    {
        const FECSEntity& local_36;
        int local_38 = 0;
        MarkModifiedIfDirty local_46;
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
                this.ClientJob_EnforceTeleportViewHide(local_36, local_38);
                local_46.opCall(local_38);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_84 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_88;
        local_88.opCall();
        local_88.opCall();
        Exclude(local_84).opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_94 = 0;
        FECSRuntimeViewIterator local_128 = local_84.Iterator();
        for (; local_128.CanProceed;)
        {
            local_36 = local_128.Proceed();
            ++local_94;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.ClientJob_EnforceTeleportViewHide(local_166, local_38);
            local_46.opCall(local_38);
        }
        local_2.UpdateCachedEntityCount(local_94);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_ReportTeleportViewHideReady() const
    {
        int local_12 = 0;
        const FECSEntity& local_46;
        int local_48 = 0;
        MarkModifiedIfDirty local_56;
        int local_176 = 0;
        const FECSJob& local_2 = ECS::GetContextJob();
        FECSWorldPtr local_4 = this.GetECSWorld();
        Has local_8;
        if (!(local_8.opCall()))
        {
            return;
        }
        FECSWorldPtr local_4_2 = this.GetECSWorld();
        int local_18 = 0;
        int local_17 = local_18;
        if (local_2.IsViewCacheUsable())
        {
            FECSWorldPtr local_4_3 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_22 = local_2.GetViewCacheEntities();
            int local_23 = 0;
            for (auto& local_38 : local_22)
            {
                local_38;
                FECSEntity local_42;
                if (!(local_42.IsValid()))
                {
                    continue;
                }
                ++local_23;
                FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42);
                this.ClientJob_ReportTeleportViewHideReady(local_46, local_48, local_12);
                local_56.opCall(local_48);
            }
            local_2.UpdateCachedEntityCount(local_23);
            return;
        }
        FECSRuntimeView local_94 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_98;
        local_98.opCall();
        local_98.opCall();
        Exclude(local_94).opCall();
        bool local_9 = local_2.BeginViewCacheBuild();
        int local_24 = local_2.GetViewCacheEpoch();
        int local_104 = 0;
        FECSRuntimeViewIterator local_138 = local_94.Iterator();
        for (; local_138.CanProceed;)
        {
            local_46 = local_138.Proceed();
            ++local_104;
            if (local_9)
            {
                local_2.AddViewCacheEntity(local_46.GetId());
            }
            FECSEntityScopeCycleCounter local_43_2 = FECSEntityScopeCycleCounter(local_46);
            this.ClientJob_ReportTeleportViewHideReady(local_176, local_48, local_12);
            local_56.opCall(local_48);
        }
        local_2.UpdateCachedEntityCount(local_104);
        if (local_9)
        {
            local_2.CommitViewCacheBuild(local_24);
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_UpdateTeleportViewHide() const
    {
        int local_6 = 0;
        const FECSEntity& local_40;
        int local_42 = 0;
        MarkModifiedIfDirty local_50;
        int local_170 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        int local_8 = 0;
        int local_7 = local_8;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_12 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_16 = local_4.GetViewCacheEntities();
            int local_17 = 0;
            for (auto& local_32 : local_16)
            {
                local_32;
                FECSEntity local_36;
                if (!(local_36.IsValid()))
                {
                    continue;
                }
                ++local_17;
                FECSEntityScopeCycleCounter local_37 = FECSEntityScopeCycleCounter(local_36);
                this.ClientJob_UpdateTeleportViewHide(local_40, local_42, local_6);
                local_50.opCall(local_42);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_88 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_92;
        local_92.opCall();
        local_92.opCall();
        Exclude(local_88).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_98 = 0;
        FECSRuntimeViewIterator local_132 = local_88.Iterator();
        for (; local_132.CanProceed;)
        {
            local_40 = local_132.Proceed();
            ++local_98;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.ClientJob_UpdateTeleportViewHide(local_170, local_42, local_6);
            local_50.opCall(local_42);
        }
        local_4.UpdateCachedEntityCount(local_98);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_OnRemoveTeleportViewHideRuntime() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorTeleportViewHideRuntimeOnRemoveView(this.GetECSWorld(), EECSRegType(0), false, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_OnRemoveTeleportViewHideRuntime(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_HandleTeleportViewHideReady() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_TeleportViewHideReady> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_TeleportViewHideReady& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            if (local_60.Validate() == false)
            {
                FString local_70 = "Validate Failed: FCE_TeleportViewHideReady, sender";
                FString local_66 = local_60.Sender.ToString();
                continue;
            }
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_HandleTeleportViewHideReady(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_HandleTeleportAnimTransit() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_TeleportLoadingScreenStateChanged> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_TeleportLoadingScreenStateChanged& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            if (local_60.Validate() == false)
            {
                FString local_70 = "Validate Failed: FCE_TeleportLoadingScreenStateChanged, sender";
                FString local_66 = local_60.Sender.ToString();
                continue;
            }
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_HandleTeleportAnimTransit(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_ClearConsumedTeleportLoopTransitPending() const
    {
        const FECSEntity& local_36;
        int local_38 = 0;
        MarkModifiedIfDirty local_46;
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
                this.ServerJob_ClearConsumedTeleportLoopTransitPending(local_36, local_38);
                local_46.opCall(local_38);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_84 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_88;
        local_88.opCall();
        local_88.opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_90 = 0;
        FECSRuntimeViewIterator local_124 = local_84.Iterator();
        for (; local_124.CanProceed;)
        {
            local_36 = local_124.Proceed();
            ++local_90;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.ServerJob_ClearConsumedTeleportLoopTransitPending(local_162, local_38);
            local_46.opCall(local_38);
        }
        local_2.UpdateCachedEntityCount(local_90);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_FinalizeSameDSTeleportAuthorityHide() const
    {
        int local_6 = 0;
        const FECSEntity& local_40;
        int local_42 = 0;
        MarkModifiedIfDirty local_50;
        int local_166 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        int local_8 = 0;
        int local_7 = local_8;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_12 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_16 = local_4.GetViewCacheEntities();
            int local_17 = 0;
            for (auto& local_32 : local_16)
            {
                local_32;
                FECSEntity local_36;
                if (!(local_36.IsValid()))
                {
                    continue;
                }
                ++local_17;
                FECSEntityScopeCycleCounter local_37 = FECSEntityScopeCycleCounter(local_36);
                this.ServerJob_FinalizeSameDSTeleportAuthorityHide(local_40, local_42, local_6);
                local_50.opCall(local_42);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_88 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_92;
        local_92.opCall();
        local_92.opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_94 = 0;
        FECSRuntimeViewIterator local_128 = local_88.Iterator();
        for (; local_128.CanProceed;)
        {
            local_40 = local_128.Proceed();
            ++local_94;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.ServerJob_FinalizeSameDSTeleportAuthorityHide(local_166, local_42, local_6);
            local_50.opCall(local_42);
        }
        local_4.UpdateCachedEntityCount(local_94);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_HandleCrossDSLand() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_TeleportCrossDSLandRequest> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_TeleportCrossDSLandRequest& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_HandleCrossDSLand(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    void Monitor___JobTimer_Pre___Job_TimeoutCrossDSLand(const FC_TeleportLandOnLoadingClose &inout TimerComp, const FECSEntity &inout Entity) const
    {
        if (!(TimerComp))
        {
            return;
        }
        FFPTime local_6 = FFPTime(TimerComp.GetDeadlineTime());
        FName local_8 = FName("S_TeleportSystemAS::Job_TimeoutCrossDSLand");
        if (local_6.opCmp(0.0) >= 0 && (local_6.opCmp(FPTIME_MAX) < 0))
        {
            ECS::ScheduleJobTimer(local_8, local_6, Entity.GetId(), true);
        }
        return;
    }
    void Monitor___JobTimer_Post___Job_TimeoutCrossDSLand(const FC_TeleportLandOnLoadingClose &inout TimerComp, const FECSEntity &inout Entity) const
    {
        if (!(TimerComp))
        {
            return;
        }
        FFPTime local_6 = FFPTime(TimerComp.GetDeadlineTime());
        FName local_8 = FName("S_TeleportSystemAS::Job_TimeoutCrossDSLand");
        if (local_6.opCmp(0.0) >= 0 && (local_6.opCmp(FPTIME_MAX) < 0))
        {
            ECS::ScheduleJobTimer(local_8, local_6, Entity.GetId(), false);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor___JobTimer_Pre___Job_TimeoutCrossDSLand() const
    {
        int local_52 = 0;
        int local_54 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_14 = ::__GetMonitorTeleportLandOnLoadingCloseOnModifyView(this.GetECSWorld(), EECSRegType(0), true, false);
        FECSMonitorRuntimeViewIterator local_30 = local_14.Iterator();
        for (; local_30.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44 = local_30.Proceed();
            FECSEntityScopeCycleCounter local_45 = FECSEntityScopeCycleCounter(local_44.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_44);
            this.Monitor___JobTimer_Pre___Job_TimeoutCrossDSLand(local_52, local_54);
        }
        FECSMonitorRuntimeView local_18 = ::__GetMonitorTeleportLandOnLoadingCloseOnActiveView(this.GetECSWorld(), EECSRegType(0), true, false);
        FECSMonitorRuntimeViewIterator local_42 = local_18.Iterator();
        for (; local_42.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44_2 = local_42.Proceed();
            FECSEntityScopeCycleCounter local_45_2 = FECSEntityScopeCycleCounter(local_44_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_44_2);
            this.Monitor___JobTimer_Pre___Job_TimeoutCrossDSLand(local_52, local_54);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor___JobTimer_Post___Job_TimeoutCrossDSLand() const
    {
        int local_52 = 0;
        int local_54 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_14 = ::__GetMonitorTeleportLandOnLoadingCloseOnModifyView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_30 = local_14.Iterator();
        for (; local_30.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44 = local_30.Proceed();
            FECSEntityScopeCycleCounter local_45 = FECSEntityScopeCycleCounter(local_44.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_44);
            this.Monitor___JobTimer_Post___Job_TimeoutCrossDSLand(local_52, local_54);
        }
        FECSMonitorRuntimeView local_18 = ::__GetMonitorTeleportLandOnLoadingCloseOnActiveView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_42 = local_18.Iterator();
        for (; local_42.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44_2 = local_42.Proceed();
            FECSEntityScopeCycleCounter local_45_2 = FECSEntityScopeCycleCounter(local_44_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_44_2);
            this.Monitor___JobTimer_Post___Job_TimeoutCrossDSLand(local_52, local_54);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_TimeoutCrossDSLand() const
    {
        int local_38 = 0;
        int local_46 = 0;
        int local_48 = 0;
        const FECSJob& local_2 = ECS::GetContextJob();
        FECSWorldPtr local_4 = ECS::GetECSWorld();
        local_2.MarkIteratingExternalEntityList(true);
        const TArray<FECSEntityId>& local_10 = local_2.GetExternalEntityList();
        FECSEntity local_28;
        for (auto& local_24 : local_10)
        {
            local_24;
            FECSEntityScopeCycleCounter local_29 = FECSEntityScopeCycleCounter(local_28);
            bool local_7 = false;
            bool local_31 = !(false);
            if (!(local_28.IsActive()) == local_31)
            {
                continue;
            }
            if (!(local_38))
            {
                continue;
            }
            FFPTime local_40 = FFPTime(local_38.GetDeadlineTime());
            if (local_40.opCmp(0.0) < 0 || (FFPTime(local_38.GetDeadlineTime()) == FPTIME_MAX))
            {
                continue;
            }
            if (local_7)
            {
                continue;
            }
            this.Job_TimeoutCrossDSLand(local_46, local_48);
            MarkModifiedIfDirty local_56;
            local_56.opCall(local_48);
        }
        local_2.MarkIteratingExternalEntityList(false);
        ECS::ClearCurJobExternalEntityList();
        return;
    }
    UFUNCTION()
    void Run_ServerJob_RetryCrossDSLand() const
    {
        const FECSEntity& local_36;
        int local_152 = 0;
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
                this.ServerJob_RetryCrossDSLand(local_36);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_74 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_78;
        local_78.opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_80 = 0;
        FECSRuntimeViewIterator local_114 = local_74.Iterator();
        for (; local_114.CanProceed;)
        {
            local_36 = local_114.Proceed();
            ++local_80;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.ServerJob_RetryCrossDSLand(local_152);
        }
        local_2.UpdateCachedEntityCount(local_80);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_HandleClientTeleportRequest() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_ClientTeleportToLocationRequest> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_ClientTeleportToLocationRequest& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_HandleClientTeleportRequest(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_HandleTeleportRequest() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_TeleportToLocationRequest> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_TeleportToLocationRequest& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_HandleTeleportRequest(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_ResolvePendingTeleport() const
    {
        int local_6 = 0;
        const FECSEntity& local_40;
        int local_42 = 0;
        int local_166 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        int local_8 = 0;
        int local_7 = local_8;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_12 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_16 = local_4.GetViewCacheEntities();
            int local_17 = 0;
            for (auto& local_32 : local_16)
            {
                local_32;
                FECSEntity local_36;
                if (!(local_36.IsValid()))
                {
                    continue;
                }
                ++local_17;
                FECSEntityScopeCycleCounter local_37 = FECSEntityScopeCycleCounter(local_36);
                this.ServerJob_ResolvePendingTeleport(local_40, local_42, local_6);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_84 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_88;
        local_88.opCall();
        local_88.opCall();
        Exclude(local_84).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_94 = 0;
        FECSRuntimeViewIterator local_128 = local_84.Iterator();
        for (; local_128.CanProceed;)
        {
            local_40 = local_128.Proceed();
            ++local_94;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.ServerJob_ResolvePendingTeleport(local_166, local_42, local_6);
        }
        local_4.UpdateCachedEntityCount(local_94);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_TimeoutTeleportLoadingTransaction() const
    {
        int local_6 = 0;
        const FECSEntity& local_40;
        int local_42 = 0;
        MarkModifiedIfDirty local_50;
        int local_166 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        int local_8 = 0;
        int local_7 = local_8;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_12 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_16 = local_4.GetViewCacheEntities();
            int local_17 = 0;
            for (auto& local_32 : local_16)
            {
                local_32;
                FECSEntity local_36;
                if (!(local_36.IsValid()))
                {
                    continue;
                }
                ++local_17;
                FECSEntityScopeCycleCounter local_37 = FECSEntityScopeCycleCounter(local_36);
                this.ServerJob_TimeoutTeleportLoadingTransaction(local_40, local_42, local_6);
                local_50.opCall(local_42);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_88 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_92;
        local_92.opCall();
        local_92.opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_94 = 0;
        FECSRuntimeViewIterator local_128 = local_88.Iterator();
        for (; local_128.CanProceed;)
        {
            local_40 = local_128.Proceed();
            ++local_94;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.ServerJob_TimeoutTeleportLoadingTransaction(local_166, local_42, local_6);
            local_50.opCall(local_42);
        }
        local_4.UpdateCachedEntityCount(local_94);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_HandlePlayerRequestMoveToTeleporter() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_PlayerRequestMoveToTeleporter> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_PlayerRequestMoveToTeleporter& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_HandlePlayerRequestMoveToTeleporter(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_HandleTeleportToPublicEventRequest() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_TeleportToPublicEventRequest> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_TeleportToPublicEventRequest& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            if (local_60.Validate() == false)
            {
                FString local_70 = "Validate Failed: FCE_TeleportToPublicEventRequest, sender";
                FString local_66 = local_60.Sender.ToString();
                continue;
            }
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_HandleTeleportToPublicEventRequest(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_HandleAssembleTravelToTeammate() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_AssembleTravelToTeammate> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_AssembleTravelToTeammate& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_HandleAssembleTravelToTeammate(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_ShowTeleportLoadingScreen() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_ShowTeleportLoadingScreen> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(2)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_ShowTeleportLoadingScreen& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ClientJob_ShowTeleportLoadingScreen(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    void Monitor___JobTimer_Pre___Job_RestoreTeleportInput(const FC_TeleportBlockInput &inout TimerComp, const FECSEntity &inout Entity) const
    {
        if (!(TimerComp))
        {
            return;
        }
        FFPTime local_6 = TimerComp.EndTime;
        FName local_8 = FName("S_TeleportSystemAS::Job_RestoreTeleportInput");
        if (local_6.opCmp(0.0) >= 0 && (local_6.opCmp(FPTIME_MAX) < 0))
        {
            ECS::ScheduleJobTimer(local_8, local_6, Entity.GetId(), true);
        }
        return;
    }
    void Monitor___JobTimer_Post___Job_RestoreTeleportInput(const FC_TeleportBlockInput &inout TimerComp, const FECSEntity &inout Entity) const
    {
        if (!(TimerComp))
        {
            return;
        }
        FFPTime local_6 = TimerComp.EndTime;
        FName local_8 = FName("S_TeleportSystemAS::Job_RestoreTeleportInput");
        if (local_6.opCmp(0.0) >= 0 && (local_6.opCmp(FPTIME_MAX) < 0))
        {
            ECS::ScheduleJobTimer(local_8, local_6, Entity.GetId(), false);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor___JobTimer_Pre___Job_RestoreTeleportInput() const
    {
        int local_52 = 0;
        int local_54 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_14 = ::__GetMonitorTeleportBlockInputOnModifyView(this.GetECSWorld(), EECSRegType(0), true, false);
        FECSMonitorRuntimeViewIterator local_30 = local_14.Iterator();
        for (; local_30.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44 = local_30.Proceed();
            FECSEntityScopeCycleCounter local_45 = FECSEntityScopeCycleCounter(local_44.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_44);
            this.Monitor___JobTimer_Pre___Job_RestoreTeleportInput(local_52, local_54);
        }
        FECSMonitorRuntimeView local_18 = ::__GetMonitorTeleportBlockInputOnActiveView(this.GetECSWorld(), EECSRegType(0), true, false);
        FECSMonitorRuntimeViewIterator local_42 = local_18.Iterator();
        for (; local_42.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44_2 = local_42.Proceed();
            FECSEntityScopeCycleCounter local_45_2 = FECSEntityScopeCycleCounter(local_44_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_44_2);
            this.Monitor___JobTimer_Pre___Job_RestoreTeleportInput(local_52, local_54);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor___JobTimer_Post___Job_RestoreTeleportInput() const
    {
        int local_52 = 0;
        int local_54 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_14 = ::__GetMonitorTeleportBlockInputOnModifyView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_30 = local_14.Iterator();
        for (; local_30.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44 = local_30.Proceed();
            FECSEntityScopeCycleCounter local_45 = FECSEntityScopeCycleCounter(local_44.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_44);
            this.Monitor___JobTimer_Post___Job_RestoreTeleportInput(local_52, local_54);
        }
        FECSMonitorRuntimeView local_18 = ::__GetMonitorTeleportBlockInputOnActiveView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_42 = local_18.Iterator();
        for (; local_42.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44_2 = local_42.Proceed();
            FECSEntityScopeCycleCounter local_45_2 = FECSEntityScopeCycleCounter(local_44_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_44_2);
            this.Monitor___JobTimer_Post___Job_RestoreTeleportInput(local_52, local_54);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_RestoreTeleportInput() const
    {
        int local_38 = 0;
        int local_46 = 0;
        int local_48 = 0;
        const FECSJob& local_2 = ECS::GetContextJob();
        FECSWorldPtr local_4 = ECS::GetECSWorld();
        local_2.MarkIteratingExternalEntityList(true);
        const TArray<FECSEntityId>& local_10 = local_2.GetExternalEntityList();
        FECSEntity local_28;
        for (auto& local_24 : local_10)
        {
            local_24;
            FECSEntityScopeCycleCounter local_29 = FECSEntityScopeCycleCounter(local_28);
            bool local_7 = false;
            bool local_31 = !(false);
            if (!(local_28.IsActive()) == local_31)
            {
                continue;
            }
            if (!(local_38))
            {
                continue;
            }
            FFPTime local_40 = local_38.EndTime;
            if (local_40.opCmp(0.0) < 0 || (local_38.EndTime == FPTIME_MAX))
            {
                continue;
            }
            if (local_7)
            {
                continue;
            }
            this.Job_RestoreTeleportInput(local_46, local_48);
            MarkModifiedIfDirty local_56;
            local_56.opCall(local_48);
        }
        local_2.MarkIteratingExternalEntityList(false);
        ECS::ClearCurJobExternalEntityList();
        return;
    }
    UFUNCTION()
    void Run_Monitor_OnRemoveTeleportBlockInput() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorTeleportBlockInputOnRemoveView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_OnRemoveTeleportBlockInput(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_OnRemoveTeleportHideVisual() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorTeleportHideVisualOnRemoveView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_OnRemoveTeleportHideVisual(local_46, local_52);
        }
        return;
    }
}

