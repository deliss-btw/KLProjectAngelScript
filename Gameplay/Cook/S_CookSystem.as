
const FConsoleVariable CVar_Debug_CookAutoFinish = FConsoleVariable();

struct FCookConsumeCallback
{
    UPROPERTY()
    FECSEntity CookPropEntity;
    UPROPERTY()
    FECSEntity PlayerPawnEntity;
    UPROPERTY()
    TArray<FCookPlayerCostItem> CookCostItems;

    FCookConsumeCallback()
    {
        return;
    }
    void opCall(const EAwaitGsResourceResult Result, bool &inout bIsConfirmed)
    {
        int local_14 = 0;
        XLog(ELog(46), FString().Append("[Cook] ConsumeCallback Result=").Append(Result).Append(", PlayerPawn=").Append(this.PlayerPawnEntity));
        Has local_10;
        if (!(this.IsValid()) || !(local_10.opCall()))
        {
            XLog(ELog(46), FString().Append("[Cook] CookPropEntity invalid, PlayerPawn=").Append(this.PlayerPawnEntity));
            return;
        }
        if (int(Result) != 2)
        {
            XLog(ELog(46), FString().Append("[Cook] GS Resource Request Failed, PlayerPawn=").Append(this.PlayerPawnEntity));
            local_14.SetConfirmedFailCount((local_14.GetConfirmedFailCount() + 1));
            this.CheckAndFinalizeCook(this, local_14);
            return;
        }
        bIsConfirmed = true;
        XLog(ELog(46), FString().Append("[Cook] GS Resource Confirmed, PlayerPawn=").Append(this.PlayerPawnEntity));
        local_14.SetConfirmedSuccessCount((local_14.GetConfirmedSuccessCount() + 1));
        this.CheckAndFinalizeCook(this, local_14);
        return;
    }
    void CheckAndFinalizeCook(const FECSEntity &inout InCookPropEntity, FC_CookProp &inout CookProp)
    {
        FCE_CookFinisehd local_36;
        XLog(ELog(46), FString().Append("[Cook] CheckFinalize: Pending=").Append(CookProp.GetPendingConfirmCount()).Append(", Success=").Append(CookProp.GetConfirmedSuccessCount()).Append(", Fail=").Append(CookProp.GetConfirmedFailCount()));
        if ((CookProp.GetConfirmedSuccessCount() + CookProp.GetConfirmedFailCount()) < CookProp.GetPendingConfirmCount())
        {
            return;
        }
        bool local_11 = (CookProp.GetConfirmedFailCount() == 0);
        for (auto& local_26 : CookProp.GetCookPlayerDatas())
        {
            if (!(local_26.GetPlayerEntity().IsValid()))
            {
                continue;
            }
            FECSWorldPtr local_28 = local_26.GetPlayerEntity().GetWorld();
            Get local_32;
            FFPTime local_34 = FFPTime(local_32.opCall().Time);
            if (local_11)
            {
                FFPTime local_50 = (local_34 + FFPTime(::CookSettings::Get().DelayFinishedEventTime));
                local_36.bSuccess = true;
                local_36.FinishedFoodProduct = CookProp.GetPendingProductFood();
                local_36.FinishedModifiers = CookProp.GetPendingModifiers();
                local_36.CookPropEntity = InCookPropEntity;
                FESMTriggerUtils::ActivateESMTrigger(local_26.GetPlayerEntity(), ::CookSettings::Get().CookStartESMTriggerName, local_34, FFPTime(::CookSettings::Get().CookESMTriggerValidataTime), 0);
                FFPTime local_50_2 = FFPTime(-1);
                FCE_CookEventForPresentation local_76;
                local_76.bStart = true;
            }
            else
            {
                local_36.bSuccess = false;
                local_36.CookPropEntity = InCookPropEntity;
            }
        }
        if (!(local_11))
        {
            for (auto& local_26 : CookProp.GetCookPlayerDatas())
            {
                if (local_26.GetPlayerEntity().IsValid())
                {
                    local_26.GetPlayerEntity().RemoveGameplayTag(GameplayTags::ESM_Ban_Teleport, NAME_None);
                }
            }
            CookProp.Reset();
        }
        return;
    }
}

struct FFoodCraftConfigData
{
    UPROPERTY()
    FFoodCraftConfig FoodCraftConfig;
    UPROPERTY()
    FFoodProductConfig RuntimeProductFood;

    FFoodCraftConfigData()
    {
        return;
    }
}

class US_CookSystem : UECSScriptSystem
{
    UPROPERTY()
    UDataTable FoodCraftDataTable;
    UPROPERTY()
    UDataTable EnergyThresholdDataTable;
    UPROPERTY()
    UDataTable StatModifierLadderDataTable;
    UPROPERTY()
    TArray<FCookRecipeRuntime> FoodCraftConfigs;
    UPROPERTY()
    TArray<FCookEnergyThresholdConfig> EnergyThresholdConfigs;
    UPROPERTY()
    TArray<FCookStatModifierLadderConfig> StatModifierLadderConfigs;

    US_CookSystem()
    {
        return;
    }
    UFUNCTION()
    void Init_Implementation()
    {
        FScopeCycleCounter local_1 = FScopeCycleCounter(FStatID(n"CookSystem Init"), false);
        this.FoodCraftConfigs.Empty(0);
        int local_5 = 0;
        TDataObjectIterator<FFoodCraftConfig> local_22;
        for (; local_22; )
        {
            FCookRecipeRuntime local_82;
            local_82.LoadOrder = local_5;
            this.FoodCraftConfigs.Add(local_82);
            local_5 = local_5 + 1;
            local_22.Next();
        }
        this.EnergyThresholdConfigs.Empty(0);
        TDataObjectIterator<FCookEnergyThresholdConfig> local_100;
        for (; local_100; )
        {
            this.EnergyThresholdConfigs.Add(local_100.GetData());
            local_100.Next();
        }
        if (this.EnergyThresholdConfigs.IsEmpty())
        {
            XError(ELog(46), "[Cook] DT_CookEnergyThreshold is empty. No tier can be resolved.");
        }
        this.StatModifierLadderConfigs.Empty(0);
        TDataObjectIterator<FCookStatModifierLadderConfig> local_118;
        for (; local_118; )
        {
            this.StatModifierLadderConfigs.Add(local_118.GetData());
            local_118.Next();
        }
        bool local_121 = false;
        bool local_122 = false;
        bool local_123 = false;
        for (auto& local_138 : this.StatModifierLadderConfigs)
        {
            if (int(local_138.StatType) == 0)
            {
                local_121 = true;
                continue;
            }
            if (int(local_138.StatType) == 1)
            {
                local_122 = true;
                continue;
            }
            if (int(local_138.StatType) == 2)
            {
                local_123 = true;
            }
        }
        if (!(local_121) || !(local_122) || !(local_123))
        {
            XError(ELog(46), FString().Append("[Cook] SDT_CookStatModifierLadder missing rows. HP=").Append(local_121).Append(", SP=").Append(local_122).Append(", ATK=").Append(local_123));
        }
        return;
    }
    UFUNCTION()
    void Monitor_CookPropInterationChanged(const FECSEntity &inout CookPropEntity, const FC_RuntimeInteractTargetStatus &inout InteractionRuntime) const
    {
        Has local_4;
        int local_8 = 0;
        Remove local_24;
        FECSEntity local_42;
        bool local_47;
        if (!(local_4.opCall()))
        {
            return;
        }
        Get local_16;
        local_8.ResizeCookPlayerDatas(local_16.opCall().MaxCookerCount);
        if (int(local_8.GetCookState()) == 1)
        {
            if (InteractionRuntime.GetInteractionPointStatus().Num() == 0)
            {
                local_8.Reset();
                this.EnableCookPropInteraction(CookPropEntity, true, true);
            }
            local_24.opCall();
        }
        if (int(local_8.GetCookState()) == 2)
        {
            return;
        }
        for (auto& local_38 : InteractionRuntime.GetInteractionPointStatus())
        {
            if ((FECSEntity(local_8.GetCookPlayerDatas()[local_38.GetPointAndBehaviorIndex().GetPointIndex()].GetPlayerEntity()) == ENTITY_NULL) || !(local_38.GetInteractingSourceEntities().Contains(local_8.GetCookPlayerDatas()[local_38.GetPointAndBehaviorIndex().GetPointIndex()].GetPlayerEntity())))
            {
                if (local_38.GetInteractingSourceEntities().Num() > 0)
                {
                    local_42 = local_38.GetInteractingSourceEntities()[0];
                }
                else
                {
                    local_42 = ENTITY_NULL;
                }
                local_8.GetModify_CookPlayerDatas()[local_38.GetPointAndBehaviorIndex().GetPointIndex()].SetPlayerEntity(local_42);
                local_8.GetModify_CookPlayerDatas()[local_38.GetPointAndBehaviorIndex().GetPointIndex()].SetbPlayerReady(false);
                local_8.GetModify_CookPlayerDatas()[local_38.GetPointAndBehaviorIndex().GetPointIndex()].GetModify_CookCostItems().Empty(0);
            }
        }
        int local_43 = 0;
        for (; local_43 < local_8.GetCookPlayerDatas().Num(); ++local_43)
        {
            FCookPlayerData& local_46 = local_8.GetModify_CookPlayerDatas()[local_43];
            local_47 = false;
            for (auto& local_38 : InteractionRuntime.GetInteractionPointStatus())
            {
                if (local_38.GetInteractingSourceEntities().Contains(local_46.GetPlayerEntity()))
                {
                    local_47 = true;
                }
            }
            if (!(local_47))
            {
                local_46.SetPlayerEntity(ENTITY_NULL);
                local_46.SetbPlayerReady(false);
                local_46.GetModify_CookCostItems().Empty(0);
                Has local_52;
                if (local_52.opCall() && !(local_8.FoodCostFull()))
                {
                    local_24.opCall();
                }
            }
        }
        return;
    }
    UFUNCTION()
    void ServerJob_HandlePushCostFood(const FCE_PushCostFood &inout Event) const
    {
        int local_10 = 0;
        int local_56 = 0;
        Has local_6;
        if (!(Event.CookPropEntity.IsValid()) || !(local_6.opCall()))
        {
            XError(ELog(46), "[ServerJob_HandleDPushCostFood]: Event.CookPropEntity not valid");
            return;
        }
        if (int(local_10.GetCookState()) == 2)
        {
            XLog(ELog(46), "[ServerJob_HandlePushCostFood]: Cannot push food while cooking!");
            return;
        }
        Get local_22;
        local_10.ResizeCookPlayerDatas(local_22.opCall().MaxCookerCount);
        Get local_26;
        const FC_RuntimeInteractTargetStatus& local_28 = local_26.opCall();
        if (local_28)
        {
            Get local_54;
            for (auto& local_42 : local_28.GetInteractionPointStatus())
            {
                if (local_42.GetInteractingSourceEntities().Contains(Event.Sender))
                {
                    int local_43;
                    local_43 = local_42.GetPointAndBehaviorIndex().GetPointIndex();
                    if ((!((FECSEntity(local_10.GetCookPlayerDatas()[local_43].GetPlayerEntity()) == Event.Sender))))
                    {
                        local_10.GetModify_CookPlayerDatas()[local_43].SetPlayerEntity(Event.Sender);
                        local_10.GetModify_CookPlayerDatas()[local_43].GetModify_CookCostItems().Empty(0);
                        local_10.GetModify_CookPlayerDatas()[local_43].SetbPlayerReady(false);
                    }
                    if (local_10.GetCookPlayerDatas()[local_43].GetbPlayerReady())
                    {
                        break;
                    }
                    FECSWorldPtr local_50 = Event.Sender.GetWorld();
                    local_10.PushFoodCostItem(local_43, Event.FoodItem, local_54.opCall().Time, Event.ClientItemNum);
                    local_10.GetModify_CookPlayerDatas()[local_43].SetbPlayerReady(false);
                }
            }
        }
        if (local_10.FoodCostFull())
        {
            Get local_54;
            FECSWorldPtr local_50_2 = Event.Sender.GetWorld();
            local_56.SetAutoReadyTime((FFPTime(local_54.opCall().Time) + FFPTime(::CookSettings::Get().DelayAutoReadtEventTime)));
        }
        return;
    }
    UFUNCTION()
    void ServerJob_HandlePopCostFood(const FCE_PopCostFood &inout Event) const
    {
        int local_10 = 0;
        Has local_6;
        if (!(Event.CookPropEntity.IsValid()) || !(local_6.opCall()))
        {
            XError(ELog(46), "[ServerJob_HandlePopCostFood]: Event.CookPropEntity not valid");
            return;
        }
        int local_16 = int(local_10.GetCookState());
        if (local_16 == 2)
        {
            XLog(ELog(46), "[ServerJob_HandlePopCostFood]: Cannot pop food while cooking!");
            return;
        }
        Get local_22;
        const FC_RuntimeInteractTargetStatus& local_24 = local_22.opCall();
        if (local_24)
        {
            for (auto& local_38 : local_24.GetInteractionPointStatus())
            {
                if (local_38.GetInteractingSourceEntities().Contains(Event.Sender))
                {
                    int local_39;
                    local_39 = local_38.GetPointAndBehaviorIndex().GetPointIndex();
                    if (local_10.GetCookPlayerDatas()[local_39].GetbPlayerReady())
                    {
                        break;
                    }
                    if (!((FECSEntity(local_10.GetCookPlayerDatas()[local_39].GetPlayerEntity()) == Event.Sender)))
                    {
                        break;
                    }
                    int local_45 = 0;
                    while (local_45 < local_16)
                    {
                        if (0 == 0)
                        {
                            Remove local_52;
                            local_52.opCall();
                            local_10.GetModify_CookPlayerDatas()[local_39].GetModify_CookCostItems().RemoveAt(local_45);
                            break;
                        }
                        ++local_45;
                    }
                    local_10.GetModify_CookPlayerDatas()[local_39].SetbPlayerReady(false);
                }
            }
        }
        return;
    }
    UFUNCTION()
    void Job_ServerTickCookPropAutoReady(const FECSEntity &inout CookPropEntity, FC_CookPropAutoReady &inout CookPropAutoReady, const FCS_FixedTime &inout Time) const
    {
        int local_6 = 0;
        Remove local_14;
        if (FFPTime(Time.Time).opCmp(CookPropAutoReady.GetAutoReadyTime()) >= 0)
        {
            if (!(local_6.FoodCostFull()))
            {
                local_14.opCall();
                return;
            }
            for (auto& local_28 : local_6.GetCookPlayerDatas())
            {
                if (local_28.GetPlayerEntity().IsValid() && !(local_28.GetbPlayerReady()))
                {
                    this.DisposePlayerReady(local_28.GetPlayerEntity(), CookPropEntity);
                }
            }
            local_14.opCall();
        }
        return;
    }
    UFUNCTION()
    void Monitor_CookPropAutoReady(const FECSEntity &inout CookPropEntity, const FC_CookPropAutoReady &inout CookPropAutoReady) const
    {
        Get local_4;
        const FC_CookProp& local_6 = local_4.opCall();
        if (local_6)
        {
            for (auto& local_22 : local_6.GetCookPlayerDatas())
            {
                if (local_22.GetPlayerEntity().IsValid() && !(local_22.GetbPlayerReady()))
                {
                    FECSWorldPtr local_30 = this.GetECSWorld();
                    SendEvent local_28;
                    Get local_34;
                    local_28.opCall(local_34.opCall().Time);
                }
            }
        }
        return;
    }
    UFUNCTION()
    void ClientJob_ReceiveCookEventForPresentation(const FCE_CookEventForPresentation &inout Event) const
    {
        int local_4 = 0;
        int local_182 = 0;
        if (!(Event.Sender.IsValid()))
        {
            return;
        }
        if (!(local_4) || local_4.CookStartFX.IsNull())
        {
            return;
        }
        if (Event.bStart)
        {
            FFXConfig local_126;
            local_126.SetAsset(FSoftClassPath(local_4.CookStartFX.ToString()));
            local_126.SetbDetach(true);
            GetDefaulted local_142;
            GetDefaulted local_146;
            local_126.SetLocationOffset((FVector(local_142.opCall().GetPosition()) + local_146.opCall().CookStartFXLOcationOffset));
            local_126.SetbUseWorldOriginAsBaseTransformSource(true);
            local_126.SetLocationOffsetSpace(EFXOffsetSpace(2));
            local_126.SetRotationOffset(FRotator::ZeroRotator);
            local_126.SetOverrideParams(TArray<FFXOverrideParam>());
            FECSEntity local_172 = FECSEntity();
            ECS::GetContextTime();
            FECSEntity local_180;
            local_182.StartCookFX = local_180;
            return;
        }
        if (local_182.StartCookFX.IsValid())
        {
            ECSFX::StopFX(local_182.StartCookFX, false, false, 0.0f);
            local_182.StartCookFX = ENTITY_NULL;
        }
        return;
    }
    UFUNCTION()
    void ClientJob_HandleAutoReadyTip(const FCE_CookAutoReadyTip &inout Event) const
    {
        FCommonTipsParam local_8;
        ::CommonPopup::Tips(NSLOCTEXT("Cook", "Cook_Tips_AutoReady", "йЈџжќђе·Іж»ЎпјЊејЂе§‹и‡ЄеЉЁе‡†е¤‡еЂ’и®Ўж—¶"), local_8);
        return;
    }
    UFUNCTION()
    void ServerJob_HandlePlayerExitCook(const FCE_ExitCook &inout Event) const
    {
        int local_10 = 0;
        int local_24;
        Has local_6;
        if (!(Event.CookPropEntity.IsValid()) || !(local_6.opCall()))
        {
            XError(ELog(46), "[ServerJob_HandlePlayerExitCook]: Event.CookPropEntity not valid");
            return;
        }
        if (local_10 && ((int(local_10.GetCookState())) == 1 || (int(local_10.GetCookState()) == 2)))
        {
            XLog(ELog(46), "[ServerJob_HandlePlayerExitCook]: Cannot exit during countdown or cooking!");
            return;
        }
        for (auto& local_38 : local_24.GetInteractionPointStatus())
        {
            if (local_38.GetInteractingSourceEntities().Contains(Event.Sender))
            {
                ::FInteractUtils::ExecuteInteractEndAction(Event.Sender, Event.CookPropEntity, local_38.GetPointAndBehaviorIndex());
                break;
            }
        }
        return;
    }
    UFUNCTION()
    void ServerJob_HandlePlayerCookReady(const FCE_PlayerCookReady &inout Event) const
    {
        Has local_6;
        if (!(Event.CookPropEntity.IsValid()) || !(local_6.opCall()))
        {
            XError(ELog(46), "[ServerJob_HandlePlayerCookReady]: Event.CookPropEntity not valid");
            return;
        }
        this.DisposePlayerReady(Event.Sender, Event.CookPropEntity);
        return;
    }
    UFUNCTION()
    void ServerJob_HandlePlayerCookAllReady(const FCE_CookAllReady &inout Event) const
    {
        int local_10 = 0;
        Has local_192;
        Has local_6;
        bool local_1 = !(Event.CookPropEntity.IsValid()) || !(local_6.opCall());
        if (local_1)
        {
            XError(ELog(46), "[ServerJob_HandlePlayerCookAllReady]: Event.CookPropEntity not valid");
            return;
        }
        if (int(local_10.GetCookState()) != 1)
        {
            return;
        }
        TArray<TDataObjectPtr<FItemConfig>> local_22;
        for (auto& local_36 : local_10.GetCookPlayerDatas())
        {
            for (auto& local_50 : local_36.GetCookCostItems())
            {
                local_22.Add(local_50.GetCookCostItem());
            }
        }
        if (local_22.Num() != 4)
        {
            XError(ELog(46), FString().Append("[Cook] CookAllReady rejected: ingredient count must be 4, Current = ").Append(local_22.Num()));
            local_10.Reset();
            this.EnableCookPropInteraction(Event.CookPropEntity, true, true);
            return;
        }
        FCookOutcome local_118 = ::FCookUtils::ResolveCookOutcome(this.FoodCraftConfigs, this.EnergyThresholdConfigs, this.StatModifierLadderConfigs, local_22);
        if ((!(local_118.bSuccess) || (local_118.ProductFood == nullptr)))
        {
            for (auto& local_36 : local_10.GetCookPlayerDatas())
            {
                if (local_36.GetPlayerEntity().IsValid())
                {
                    FCE_CookFinisehd local_168;
                    FECSWorldPtr local_174 = this.GetECSWorld();
                    local_168.CookPropEntity = Event.CookPropEntity;
                    bool local_7_2 = false;
                    local_168.bSuccess = local_7_2;
                }
            }
            return;
        }
        int local_179 = this.GenerateCookSessionId(Event.CookPropEntity);
        local_10.SetCurrentSessionId(local_179);
        this.ReportCookStart(Event.CookPropEntity, local_10);
        int local_180 = 0;
        for (auto& local_36 : local_10.GetCookPlayerDatas())
        {
            if (local_36.GetPlayerEntity().IsValid() && (local_36.GetCookCostItems().Num() > 0))
            {
                FECSEntity local_188 = ::FASCommonUtils::GetUniquePlayerEntity(local_36.GetPlayerEntity());
                if (!(local_188.IsValid()))
                {
                    local_1 = false;
                }
                else
                {
                    local_1 = local_192.opCall();
                }
                if (local_1)
                {
                    ++local_180;
                }
            }
        }
        if ((local_180 == 0 && local_22.IsEmpty()) || CVar_Debug_CookAutoFinish.GetBool())
        {
            FCookConsumeCallback local_204;
            local_10.SetCookState(ECookState(ECookState(2)));
            this.SetCookParticipantsTeleportBan(local_10, true);
            this.EnableCookPropInteraction(Event.CookPropEntity, false, false);
            local_10.SetConfirmedSuccessCount(100);
            local_10.SetPendingProductFood(local_118.ProductFood);
            local_10.SetPendingModifiers(local_118.Modifiers);
            local_204.CheckAndFinalizeCook(Event.CookPropEntity, local_10);
            return;
        }
        local_10.SetCookState(ECookState(ECookState(2)));
        this.SetCookParticipantsTeleportBan(local_10, true);
        this.EnableCookPropInteraction(Event.CookPropEntity, false, false);
        local_10.SetPendingConfirmCount(local_180);
        local_10.SetConfirmedSuccessCount(0);
        local_10.SetConfirmedFailCount(0);
        local_10.SetPendingProductFood(local_118.ProductFood);
        local_10.SetPendingModifiers(local_118.Modifiers);
        XLog(ELog(46), FString().Append("[Cook] start and wait ").Append(local_180).Append(" players"));
        for (auto& local_36 : local_10.GetCookPlayerDatas())
        {
            if (!(local_36.GetPlayerEntity().IsValid()) || (local_36.GetCookCostItems().Num() == 0))
            {
                continue;
            }
            FECSEntity local_184 = ::FASCommonUtils::GetUniquePlayerEntity(local_36.GetPlayerEntity());
            if (!(local_184.IsValid()) || !(local_192.opCall()))
            {
                XLog(ELog(46), FString().Append("[Cook] Invalid PlayerController, Pawn=").Append(local_36.GetPlayerEntity()));
                continue;
            }
            FPbGetGsResourceReq local_208;
            FPbGsResource local_228 = local_208.GetResource();
            local_228.SetReason(1);
            for (auto& local_50 : local_36.GetCookCostItems())
            {
                local_50;
                FPbGsCostItem local_258 = local_228.AddContentList().GetCostItem();
                local_258.SetItemId(local_179);
                local_258.SetCount(1);
            }
            FCookConsumeCallback local_204;
            local_204.CookPropEntity = Event.CookPropEntity;
            local_204.PlayerPawnEntity = local_36.GetPlayerEntity();
            local_204.CookCostItems = local_36.GetCookCostItems();
            XLog(ELog(46), FString().Append("[Cook] SendAwaitGsResourceRequest,  Player=").Append(local_184).Append(", Result=").Append(::UGameDSConnectionSubsystem::Get().SendAwaitGsResourceRequest(local_184, local_208, FInstancedStruct::Make(local_204))));
        }
        return;
    }
    UFUNCTION()
    void ClientJob_HandlePlayerCookFinisehd(const FCE_CookFinisehd &inout CookFinisehdEvent) const
    {
        int local_18 = 0;
        if ((!((FECSEntity(CookFinisehdEvent.Sender) == ::FASCommonUtils::GetLocalPlayerPawnEntity()))))
        {
            return;
        }
        if (CookFinisehdEvent.bSuccess)
        {
            FECSWorldPtr local_12 = ECS::GetECSWorld();
            FVM_CookCompleted& local_20 = ::FVM_CookCompleted::Create(local_18.UEPlayerController.GetLocalPlayer());
            local_20.SetCookPropEntity(CookFinisehdEvent.CookPropEntity);
            local_20.SetProductFood(CookFinisehdEvent.FinishedFoodProduct);
            local_20.SetFoodModifiers(CookFinisehdEvent.FinishedModifiers);
            ::ECSWorldLifetimePage::Open(GameplayTags::UI_Type_Interact_CookCompleted, FEUIModelContainer(local_20));
            local_20.OnProductFoodChanged();
            Remove local_44;
            local_44.opCall();
        }
        return;
    }
    UFUNCTION()
    void ServerJob_HandlePlayerCookFinisehd(const FCE_CookFinisehd &inout Event) const
    {
        const FC_RuntimeInteractTargetStatus& local_14;
        Modify local_6;
        FC_CookProp& local_2 = local_6.opCall();
        if (local_2)
        {
            if (!(Event.bSuccess))
            {
                for (auto& local_28 : local_14.GetInteractionPointStatus())
                {
                    if (local_28.GetInteractingSourceEntities().Contains(Event.Sender))
                    {
                        ::FInteractUtils::ExecuteInteractEndAction(Event.Sender, Event.CookPropEntity, local_28.GetPointAndBehaviorIndex());
                        break;
                    }
                }
                local_2.Reset();
                this.EnableCookPropInteraction(Event.CookPropEntity, true, true);
                FFPTime local_38 = FFPTime(-1);
                FCE_CookEventForPresentation local_32;
                local_32.bStart = false;
                return;
            }
            this.ReportCookEnd(Event.Sender, Event.CookPropEntity, local_2);
            Get local_12;
            local_14 = local_12.opCall();
            if (local_14)
            {
                int local_40 = 0;
                while (local_40 < 0)
                {
                    if (local_2.GetCookPlayerDatas()[local_40].GetPlayerEntity().IsValid())
                    {
                        ::FInteractUtils::SetEntityInteractTargetEnabled(Event.CookPropEntity, false, local_40);
                    }
                    ++local_40;
                }
            }
            FECSWorldPtr local_52 = Event.CookPropEntity.GetWorld();
            float local_62 = ::CookSettings::Get().DelayAddMetaBuffAndReset;
            SendEvent local_50;
            Get local_56;
            local_50.opCall((FFPTime(local_56.opCall().Time) + FFPTime(local_62)));
        }
        return;
    }
    UFUNCTION()
    void ServerJob_HandleCookConfirmMetaBuff(const FCE_CookConfirmMetaBuff &inout Event) const
    {
        int local_10 = 0;
        Has local_6;
        if (!(Event.CookPropEntity.IsValid()) || !(local_6.opCall()))
        {
            XError(ELog(46), "[ServerJob_HandlePlayerCookAllReady]: Event.CookPropEntity not valid");
            return;
        }
        for (auto& local_28 : local_10.GetModify_CookPlayerDatas())
        {
            if (!(local_28.GetPlayerEntity().IsValid()) || !((FECSEntity(local_28.GetPlayerEntity()) == Event.Sender)))
            {
                continue;
            }
            TDataObjectPtr<FFoodProductConfig> local_56;
            local_56 = local_10.GetPendingProductFood();
            bool local_7 = (local_56 == nullptr);
            if (local_7)
            {
                local_7 = true;
            }
            else
            {
                TDataObjectPtr<FMetaBuffConfig> local_104;
                local_104 = GetMetaBuffConfig();
                local_7 = (local_104 == nullptr);
            }
            if (local_7)
            {
                XError(ELog(46), FString().Append("[Cook] ServerJob_HandleCookConfirmMetaBuff: PendingProductFood == nullptr || CookProp.PendingProductFood.Get().MetaBuffConfig == nullptr"));
            }
            else
            {
                FDataObjectPtr local_156;
                TDataObjectPtr<FFoodProductConfig> local_80;
                local_80 = local_10.GetPendingProductFood();
                local_156;
                if (!((local_80 == local_156)))
                {
                    XError(ELog(46), FString().Append("[Cook] ServerJob_HandleCookConfirmMetaBuff: CookProp.PendingProductFood != Event.GetProductFood"));
                }
                else
                {
                    ::FMetaBuffUtils::AddMetaBuff(local_28.GetPlayerEntity(), GetMetaBuffConfig(), local_10.GetPendingModifiers(), TArray<TDataObjectPtr<FMetaBuffCapabilityConfig>>());
                }
            }
            local_28.SetbCancelMetaBuff(true);
        }
        return;
    }
    UFUNCTION()
    void ServerJob_HandleCookCancelMetaBuff(const FCE_CookCancelMetaBuff &inout Event) const
    {
        int local_10;
        Has local_6;
        if (!(Event.CookPropEntity.IsValid()) || !(local_6.opCall()))
        {
            XError(ELog(46), "[ServerJob_HandlePlayerCookAllReady]: Event.CookPropEntity not valid");
            return;
        }
        for (auto& local_28 : local_10.GetModify_CookPlayerDatas())
        {
            if (!(local_28.GetPlayerEntity().IsValid()) || !((FECSEntity(local_28.GetPlayerEntity()) == Event.Sender)))
            {
                continue;
            }
            local_28.SetbCancelMetaBuff(true);
        }
        return;
    }
    UFUNCTION()
    void ServerJob_HandleCookReset(const FCE_CookReset &inout Event) const
    {
        int local_28;
        Modify local_6;
        FC_CookProp& local_2 = local_6.opCall();
        if (local_2)
        {
            for (auto& local_22 : local_2.GetCookPlayerDatas())
            {
                if (!(local_22.GetPlayerEntity().IsValid()))
                {
                    continue;
                }
                for (auto& local_42 : local_28.GetInteractionPointStatus())
                {
                    if (local_42.GetInteractingSourceEntities().Contains(local_22.GetPlayerEntity()))
                    {
                        ::FInteractUtils::ExecuteInteractEndAction(local_22.GetPlayerEntity(), Event.Sender, local_42.GetPointAndBehaviorIndex());
                        break;
                    }
                }
                if (!(local_22.GetbCancelMetaBuff()))
                {
                    ::FMetaBuffUtils::AddMetaBuff(local_22.GetPlayerEntity(), GetMetaBuffConfig(), local_2.GetPendingModifiers(), TArray<TDataObjectPtr<FMetaBuffCapabilityConfig>>());
                }
            }
            this.SetCookParticipantsTeleportBan(local_2, false);
            local_2.Reset();
            FFPTime local_54 = FFPTime(-1);
            FCE_CookEventForPresentation local_48;
            local_48.bStart = false;
        }
        this.EnableCookPropInteraction(Event.Sender, true, true);
        return;
    }
    void DisposePlayerReady(const FECSEntity &inout PLayerEntity, const FECSEntity &inout CookPropEntity) const
    {
        int local_2 = 0;
        int local_78 = 0;
        Get local_10;
        int local_11 = local_10.opCall().MaxCookerCount;
        local_2.ResizeCookPlayerDatas(local_11);
        Get local_16;
        const FC_RuntimeInteractTargetStatus& local_18 = local_16.opCall();
        if (local_18)
        {
            Get local_54;
            for (auto& local_34 : local_18.GetInteractionPointStatus())
            {
                if (local_34.GetInteractingSourceEntities().Contains(PLayerEntity))
                {
                    int local_35;
                    local_35 = local_34.GetPointAndBehaviorIndex().GetPointIndex();
                    if ((!((FECSEntity(local_2.GetCookPlayerDatas()[local_35].GetPlayerEntity()) == PLayerEntity))))
                    {
                        local_2.GetModify_CookPlayerDatas()[local_35].SetPlayerEntity(PLayerEntity);
                        local_2.GetModify_CookPlayerDatas()[local_35].GetModify_CookCostItems().Empty(0);
                    }
                    local_2.GetModify_CookPlayerDatas()[local_35].SetbPlayerReady(true);
                    FFPTime local_44 = FFPTime(::CookSettings::Get().CookESMTriggerValidataTime);
                    FECSWorldPtr local_50 = PLayerEntity.GetWorld();
                    FESMTriggerUtils::ActivateESMTrigger(PLayerEntity, ::CookSettings::Get().CookPlayerReadyESMTriggerName, local_54.opCall().Time, local_44, 0);
                }
            }
        }
        if (!(local_2.FoodCostReadyToCook()))
        {
            XLog(ELog(46), FString().Append("[Cook] Cannot ready before 4 ingredients. Current=").Append(local_2.GetFoodCostCount()));
            return;
        }
        if (local_2.AllBeReady())
        {
            Get local_54;
            local_2.SetCookState(ECookState(1));
            this.EnableCookPropInteraction(CookPropEntity, false, false);
            for (auto& local_76 : local_2.GetCookPlayerDatas())
            {
                if (local_76.GetPlayerEntity().IsValid())
                {
                    FECSWorldPtr local_50_2 = this.GetECSWorld();
                    FFPTime local_86 = (FFPTime(local_54.opCall().Time) + FFPTime(::CookSettings::Get().DelayAllReadyEventTime));
                    local_78.CookPropEntity = CookPropEntity;
                }
            }
        }
        return;
    }
    void EnableCookPropInteraction(const FECSEntity &inout CookPropEntity, const bool bEnable, const bool bForced = false) const
    {
        int local_2 = 0;
        Get local_10;
        local_2.ResizeCookPlayerDatas(local_10.opCall().MaxCookerCount);
        Get local_16;
        if (local_16.opCall())
        {
            int local_20 = 0;
            for (; local_20 < local_10.opCall().MaxCookerCount; ++local_20)
            {
                if (!(local_2.GetCookPlayerDatas()[local_20].GetPlayerEntity().IsValid()) || bForced)
                {
                    ::FInteractUtils::SetEntityInteractTargetEnabled(CookPropEntity, bEnable, local_20);
                }
            }
        }
        return;
    }
    uint GetCookParticipantCount(const FC_CookProp &inout CookProp) const
    {
        int local_1 = 0;
        for (auto& local_18 : CookProp.GetCookPlayerDatas())
        {
            if (local_18.GetPlayerEntity().IsValid())
            {
                local_1 = local_1 + 1;
            }
        }
        return local_1;
    }
    void SetCookParticipantsTeleportBan(const FC_CookProp &inout CookProp, const bool bBan) const
    {
        for (auto& local_16 : CookProp.GetCookPlayerDatas())
        {
            FECSEntity local_20 = FECSEntity(local_16.GetPlayerEntity());
            if (!(local_20.IsValid()))
            {
                continue;
            }
            if (bBan)
            {
                local_20.AddGameplayTag(GameplayTags::ESM_Ban_Teleport, NAME_None);
            }
            else
            {
                local_20.RemoveGameplayTag(GameplayTags::ESM_Ban_Teleport, NAME_None);
            }
        }
        return;
    }
    void ReportCookStart(const FECSEntity &inout CookPropEntity, const FC_CookProp &inout CookProp) const
    {
        int local_1;
        local_1 = CookProp.GetCurrentSessionId();
        int local_2 = this.GetCookParticipantCount(CookProp);
        int local_4 = int(::FLevelUtils::GetCurrentLevelType());
        for (auto& local_22 : CookProp.GetCookPlayerDatas())
        {
            if (!(local_22.GetPlayerEntity().IsValid()))
            {
                continue;
            }
            FPbPlayerLogDsCookStart local_32;
            local_32.SetCookingSessionId(local_1);
            local_32.SetPlayerCount(local_2);
            local_32.SetSource(local_4);
            XLog(ELog(80), FString().Append("[CookDataTracker] COOK_START report: session=").Append(local_1).Append(" player_count=").Append(local_2).Append(" source=").Append(local_4).Append(" pawn=").Append(local_22.GetPlayerEntity()));
            ::ServerDataTrackerHelper::LogProtoMessage3WithPawn(local_22.GetPlayerEntity(), 109001, local_32.ToWrapper());
        }
        return;
    }
    void ReportCookEnd(const FECSEntity &inout PawnEntity, const FECSEntity &inout CookPropEntity, const FC_CookProp &inout CookProp) const
    {
        FPbPlayerLogDsCookEnd local_10;
        int local_70 = 0;
        local_10.SetCookingSessionId(CookProp.GetCurrentSessionId());
        int local_11 = this.GetCookParticipantCount(CookProp);
        local_10.SetPlayerCount(local_11);
        local_10.SetSource(int(::FLevelUtils::GetCurrentLevelType()));
        TDataObjectPtr<FFoodProductConfig> local_38;
        local_38 = CookProp.GetPendingProductFood();
        if ((local_38 == nullptr))
        {
            local_11 = local_10.GetCookingSessionId();
            XError(ELog(80), FString().Append("[CookDataTracker] COOK_END: PendingProductFood is null, skip dish/material fields. session=").Append(local_11));
        }
        else
        {
            local_10.SetResultDishId(local_11);
            int local_13 = local_70;
            local_10.SetResultQuality(local_13);
            this.FillCookEndMaterials(CookProp, local_10);
        }
        XLog(ELog(80), FString().Append("[CookDataTracker] COOK_END report: session=").Append(local_10.GetCookingSessionId()).Append(" player_count=").Append(local_10.GetPlayerCount()).Append(" source=").Append(local_10.GetSource()).Append(" dish=").Append(local_10.GetResultDishId()).Append(" quality=").Append(local_10.GetResultQuality()).Append(" pawn=").Append(PawnEntity));
        ::ServerDataTrackerHelper::LogProtoMessage3WithPawn(PawnEntity, 109002, local_10.ToWrapper());
        return;
    }
    void FillCookEndMaterials(const FC_CookProp &inout CookProp, FPbPlayerLogDsCookEnd &inout Body) const
    {
        int local_51;
        TMap<uint, uint> local_20;
        int local_52 = 0;
        for (auto& local_36 : CookProp.GetCookPlayerDatas())
        {
            for (auto& local_50 : local_36.GetCookCostItems())
            {
                if (!(local_50.GetCookCostItem().IsSet()))
                {
                    continue;
                }
                local_51 = local_52;
                int local_54 = local_20.FindOrAdd(local_51);
                local_52 = int(local_54);
                local_52 = local_52 + 1;
                local_54 = local_52;
            }
        }
        for (auto& local_74 : local_20)
        {
            Body.AddMaterialList(local_74.GetKey());
            Body.AddMaterialCount(local_52);
        }
        return;
    }
    uint MixSessionHash(const uint Hash, const uint Value) const
    {
        return (HashCombine(Hash, Value));
    }
    uint GenerateCookSessionId(const FECSEntity &inout CookPropEntity) const
    {
        int local_3 = CookPropEntity.GetId();
        int local_10 = FDateTime::Now().GetTicks();
        int local_16 = ::UGameDSConnectionSubsystem::Get().GetDsID();
        int local_17_2 = this.MixSessionHash(2166136261, local_3);
        int local_1 = local_10;
        local_17_2 = this.MixSessionHash(local_17_2, local_1);
        int local_1_2 = (local_10 >> 32);
        local_17_2 = this.MixSessionHash(local_17_2, local_1_2);
        local_17_2 = this.MixSessionHash(local_17_2, local_16);
        int local_1_4 = (local_16 >> 32);
        local_17_2 = this.MixSessionHash(local_17_2, local_1_4);
        if (local_17_2 == 0)
        {
            local_17_2 = 1;
        }
        return local_17_2;
    }
    UFUNCTION()
    void Run_Monitor_CookPropInterationChanged() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorRuntimeInteractTargetStatusOnAssignView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_CookPropInterationChanged(local_46, local_52);
        }
        FECSMonitorRuntimeView local_16 = ::__GetMonitorRuntimeInteractTargetStatusOnModifyView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_40 = local_16.Iterator();
        for (; local_40.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42_2 = local_40.Proceed();
            FECSEntityScopeCycleCounter local_43_2 = FECSEntityScopeCycleCounter(local_42_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_42_2);
            this.Monitor_CookPropInterationChanged(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_HandlePushCostFood() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_PushCostFood> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_PushCostFood& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_HandlePushCostFood(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_HandlePopCostFood() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_PopCostFood> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_PopCostFood& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_HandlePopCostFood(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_ServerTickCookPropAutoReady() const
    {
        int local_12 = 0;
        const FECSEntity& local_44;
        int local_46 = 0;
        MarkModifiedIfDirty local_54;
        int local_174 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        if (!(local_2.IsOnInterval(FFPTime(1.0))))
        {
            return;
        }
        int local_14 = 0;
        int local_13 = local_14;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_16 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_20 = local_4.GetViewCacheEntities();
            int local_21 = 0;
            for (auto& local_36 : local_20)
            {
                local_36;
                FECSEntity local_40;
                if (!(local_40.IsValid()))
                {
                    continue;
                }
                ++local_21;
                FECSEntityScopeCycleCounter local_41 = FECSEntityScopeCycleCounter(local_40);
                this.Job_ServerTickCookPropAutoReady(local_44, local_46, local_12);
                local_54.opCall(local_46);
            }
            local_4.UpdateCachedEntityCount(local_21);
            return;
        }
        FECSRuntimeView local_92 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_96;
        local_96.opCall();
        Exclude(local_92).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_22 = local_4.GetViewCacheEpoch();
        int local_102 = 0;
        FECSRuntimeViewIterator local_136 = local_92.Iterator();
        for (; local_136.CanProceed;)
        {
            local_44 = local_136.Proceed();
            ++local_102;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_44.GetId());
            }
            FECSEntityScopeCycleCounter local_41_2 = FECSEntityScopeCycleCounter(local_44);
            this.Job_ServerTickCookPropAutoReady(local_174, local_46, local_12);
            local_54.opCall(local_46);
        }
        local_4.UpdateCachedEntityCount(local_102);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_22);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_CookPropAutoReady() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorCookPropAutoReadyOnAssignView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_CookPropAutoReady(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_ReceiveCookEventForPresentation() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_CookEventForPresentation> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(2)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_CookEventForPresentation& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ClientJob_ReceiveCookEventForPresentation(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_HandleAutoReadyTip() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_CookAutoReadyTip> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_CookAutoReadyTip& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ClientJob_HandleAutoReadyTip(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_HandlePlayerExitCook() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_ExitCook> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_ExitCook& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_HandlePlayerExitCook(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_HandlePlayerCookReady() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_PlayerCookReady> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_PlayerCookReady& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_HandlePlayerCookReady(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_HandlePlayerCookAllReady() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_CookAllReady> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_CookAllReady& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_HandlePlayerCookAllReady(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_HandlePlayerCookFinisehd() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_CookFinisehd> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(2)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_CookFinisehd& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ClientJob_HandlePlayerCookFinisehd(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_HandlePlayerCookFinisehd() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_CookFinisehd> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_CookFinisehd& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_HandlePlayerCookFinisehd(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_HandleCookConfirmMetaBuff() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_CookConfirmMetaBuff> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_CookConfirmMetaBuff& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_HandleCookConfirmMetaBuff(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_HandleCookCancelMetaBuff() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_CookCancelMetaBuff> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_CookCancelMetaBuff& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_HandleCookCancelMetaBuff(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_HandleCookReset() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_CookReset> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_CookReset& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_HandleCookReset(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
}

struct FCookFoodProdectData
{
    UPROPERTY()
    bool bUsed = false;
    UPROPERTY()
    TDataObjectPtr<FItemConfig> CookCostItem;


}

struct __Lambda_Gameplay_Cook_S_CookSystem_154
{
    __Lambda_Gameplay_Cook_S_CookSystem_154()
    {
        return;
    }
    bool opCall(const FCookRecipeRuntime &inout A, const FCookRecipeRuntime &inout B)
    {
        if (A.Recipe.Priority == B.Recipe.Priority)
        {
            return (A.LoadOrder < B.LoadOrder);
        }
        return (A.Recipe.Priority > B.Recipe.Priority);
    }
}

struct __Lambda_Gameplay_Cook_S_CookSystem_172
{
    __Lambda_Gameplay_Cook_S_CookSystem_172()
    {
        return;
    }
    bool opCall(const FCookStatModifierLadderConfig &inout A, const FCookStatModifierLadderConfig &inout B)
    {
        if (int(A.StatType) == int(B.StatType))
        {
            return (A.LookupValue < B.LookupValue);
        }
        return (int(A.StatType) < int(B.StatType));
    }
}

