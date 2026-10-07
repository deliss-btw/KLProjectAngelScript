
namespace FVM_CreatePlayer
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature ConfirmNicknameStepReady = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature OnMaleSelected = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature OnFamaleSelected = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature OnConfirmCreate = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature OnGotoPrevPhase = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature OnGotoNextPhase = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature OnSelectFaceItem = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature OnSelectFashionSlotType = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature OnSelectFashionItem = FEUIModelCallbackSignature();

}
struct FVM_CreatePlayer : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TArray<TDataObjectPtr<FUIShowcaseConfig>> m_Configs;
    UPROPERTY()
    float32 m_MaskOpacity;
    UPROPERTY()
    float32 m_MaskElapsed;
    UPROPERTY()
    bool m_bMaskActive;
    UPROPERTY()
    int m_ShowcaseConfigIndex;
    UPROPERTY()
    uint m_ShowcaseUniqueID;
    UPROPERTY()
    bool m_bShowcaseLoaded;
    UPROPERTY()
    TArray<AActor> m_CachedLightActors;
    UPROPERTY()
    TArray<FName> m_CachedLightActorTags;
    UPROPERTY()
    bool m_bPhaseLightActorsReady;
    UPROPERTY()
    FText m_CurrentTitle;
    UPROPERTY()
    int m_ActivePhaseIndex;
    UPROPERTY()
    TArray<int> m_ActivePhaseOrder;
    UPROPERTY()
    int m_PhaseOrderCursor;
    UPROPERTY()
    ECreatePlayerPhase m_CreatePlayerPhase;
    UPROPERTY()
    bool m_bConfirmLocked;
    UPROPERTY()
    bool m_bCreateRequestInFlight;
    UPROPERTY()
    float32 m_CreateRequestElapsed;
    UPROPERTY()
    ULoginSettings m_LoginSettings;
    UPROPERTY()
    FLoginCreatePlayerConfig m_CreatePlayerConfig;
    UPROPERTY()
    ULocalPlayer m_TipsLocalPlayer;
    UPROPERTY()
    bool m_bIsMaleForbid;
    UPROPERTY()
    FText m_MaleForbidTip;
    UPROPERTY()
    bool m_bIsMaleSelected;
    UPROPERTY()
    bool m_bIsFamaleSelected;
    UPROPERTY()
    bool m_bGenderSelected;
    UPROPERTY()
    EGenderType m_CreatePlayerGender;
    UPROPERTY()
    FString m_InputNickname;
    UPROPERTY()
    FStringValidationHelper m_StringValidationHelper;
    UPROPERTY()
    bool m_bHasNameValidatorConfig;
    UPROPERTY()
    FString m_LastNicknameValidationTipsDedupeKey;
    UPROPERTY()
    uint m_SelectedFaceID;
    UPROPERTY()
    uint m_SelectedHairID;
    UPROPERTY()
    uint m_SelectedUpperID;
    UPROPERTY()
    uint m_SelectedLowerID;
    UPROPERTY()
    uint m_SelectedSuitID;
    UPROPERTY()
    TArray<FEUIModelContainer> m_FaceItems;
    UPROPERTY()
    FEUIModelContainer m_SelectedFaceItem;
    UPROPERTY()
    int m_SelectedFaceItemIndex;
    UPROPERTY()
    TArray<TDataObjectPtr<FFashionConfig>> m_AllAvailableFashions;
    UPROPERTY()
    TArray<FEUIModelContainer> m_AllFashionItems;
    UPROPERTY()
    TArray<EFashionSlotType> m_AvailableFashionSlotTypes;
    UPROPERTY()
    TArray<FEUIModelContainer> m_FashionSlotTabs;
    UPROPERTY()
    FEUIModelContainer m_SelectedFashionSlotTab;
    UPROPERTY()
    int m_SelectedFashionSlotTypeIndex;
    UPROPERTY()
    TArray<TDataObjectPtr<FFashionConfig>> m_FilteredFashions;
    UPROPERTY()
    TArray<FEUIModelContainer> m_FilteredFashionItems;
    UPROPERTY()
    FEUIModelContainer m_SelectedFashionItem;
    UPROPERTY()
    int m_SelectedFashionItemIndex;

    FVM_CreatePlayer()
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    FVM_CreatePlayer(const FVM_CreatePlayer &inout Other)
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    FVM_CreatePlayer opAssign(const FVM_CreatePlayer &inout Other)
    {
        FVM_CreatePlayer __r;
        this.m_Configs = Other.m_Configs;
        this.m_MaskOpacity = Other.m_MaskOpacity;
        this.m_MaskElapsed = Other.m_MaskElapsed;
        this.m_bMaskActive = Other.m_bMaskActive;
        this.m_ShowcaseConfigIndex = int(Other.m_ShowcaseConfigIndex);
        this.m_ShowcaseUniqueID = int(Other.m_ShowcaseUniqueID);
        this.m_bShowcaseLoaded = Other.m_bShowcaseLoaded;
        this.m_CachedLightActors = Other.m_CachedLightActors;
        this.m_CachedLightActorTags = Other.m_CachedLightActorTags;
        this.m_bPhaseLightActorsReady = Other.m_bPhaseLightActorsReady;
        this.m_CurrentTitle = Other.m_CurrentTitle;
        this.m_ActivePhaseIndex = int(Other.m_ActivePhaseIndex);
        this.m_ActivePhaseOrder = Other.m_ActivePhaseOrder;
        this.m_PhaseOrderCursor = int(Other.m_PhaseOrderCursor);
        this.m_CreatePlayerPhase = Other.m_CreatePlayerPhase;
        this.m_bConfirmLocked = Other.m_bConfirmLocked;
        this.m_bCreateRequestInFlight = Other.m_bCreateRequestInFlight;
        this.m_CreateRequestElapsed = Other.m_CreateRequestElapsed;
        this.m_LoginSettings = Other.m_LoginSettings;
        this.m_TipsLocalPlayer = Other.m_TipsLocalPlayer;
        this.m_bIsMaleForbid = Other.m_bIsMaleForbid;
        this.m_MaleForbidTip = Other.m_MaleForbidTip;
        this.m_bIsMaleSelected = Other.m_bIsMaleSelected;
        this.m_bIsFamaleSelected = Other.m_bIsFamaleSelected;
        this.m_bGenderSelected = Other.m_bGenderSelected;
        this.m_CreatePlayerGender = Other.m_CreatePlayerGender;
        this.m_InputNickname = Other.m_InputNickname;
        this.m_bHasNameValidatorConfig = Other.m_bHasNameValidatorConfig;
        this.m_LastNicknameValidationTipsDedupeKey = Other.m_LastNicknameValidationTipsDedupeKey;
        this.m_SelectedFaceID = int(Other.m_SelectedFaceID);
        this.m_SelectedHairID = int(Other.m_SelectedHairID);
        this.m_SelectedUpperID = int(Other.m_SelectedUpperID);
        this.m_SelectedLowerID = int(Other.m_SelectedLowerID);
        this.m_SelectedSuitID = int(Other.m_SelectedSuitID);
        this.m_FaceItems = Other.m_FaceItems;
        this.m_SelectedFaceItem = Other.m_SelectedFaceItem;
        this.m_SelectedFaceItemIndex = int(Other.m_SelectedFaceItemIndex);
        this.m_AllAvailableFashions = Other.m_AllAvailableFashions;
        this.m_AllFashionItems = Other.m_AllFashionItems;
        this.m_AvailableFashionSlotTypes = Other.m_AvailableFashionSlotTypes;
        this.m_FashionSlotTabs = Other.m_FashionSlotTabs;
        this.m_SelectedFashionSlotTab = Other.m_SelectedFashionSlotTab;
        this.m_SelectedFashionSlotTypeIndex = int(Other.m_SelectedFashionSlotTypeIndex);
        this.m_FilteredFashions = Other.m_FilteredFashions;
        this.m_FilteredFashionItems = Other.m_FilteredFashionItems;
        this.m_SelectedFashionItem = Other.m_SelectedFashionItem;
        this.m_SelectedFashionItemIndex = int(Other.m_SelectedFashionItemIndex);
        return __r;
    }
    void LoadConfig(const FConfigVM_CreatePlayer &inout InConfig)
    {
        this.SetConfigs(InConfig.Configs);
        return;
    }
    void PostConstruct()
    {
        const ULoginSettings local_4;
        const UPlayerInfoSettings local_12;
        GetGameplaySettings<ULoginSettings> local_2;
        this.SetLoginSettings(local_2);
        if (this.GetLoginSettings() == nullptr)
        {
            XError(ELog(16), "FVM_CreatePlayer: LoginSettings is null");
            return;
        }
        if (!(this.GetLoginSettings().LoginCreatePlayerConfig.IsSet()))
        {
            XError(ELog(16), "FVM_CreatePlayer: LoginCreatePlayerConfig is not set");
            return;
        }
        local_4 = this.GetLoginSettings();
        this.SetCreatePlayerConfig();
        this.SetCreatePlayerGender(this.GetCreatePlayerConfig().DefaultGender);
        this.SetbGenderSelected(this.GetCreatePlayerConfig().bForbidMaleSelect);
        this.SetbIsMaleForbid(this.GetCreatePlayerConfig().bForbidMaleSelect);
        this.SetMaleForbidTip(this.GetCreatePlayerConfig().NotSelectTip);
        this.InitMask();
        this.BuildActivePhaseOrder();
        this.BuildFaceItems();
        this.BuildAvailableFashions();
        this.RefreshFilteredFashionItems();
        if (this.GetActivePhaseOrder().Num() == 0)
        {
            XWarning(ELog(16), "UWidget_CreatePlayer: all create-player phases skipped by ULoginSettings::CreatePlayerStepInfos.");
            return;
        }
        this.SetPhaseOrderCursor(0);
        this.SetbHasNameValidatorConfig(false);
        GetGameplaySettings<UPlayerInfoSettings> local_14;
        local_12 = local_14;
        if ((local_12 != nullptr && ((local_12.PlayerNameValidator != nullptr))))
        {
            this.GetModify_StringValidationHelper().SetConfigAsset(local_12.PlayerNameValidator);
            this.SetbHasNameValidatorConfig(true);
        }
        else
        {
            XWarning(ELog(16), "FVM_CreatePlayer: PlayerNameValidator not set, nickname only checks non-empty.");
        }
        this.GotoPhaseAtCursor();
        return;
    }
    void PostLoad()
    {
        this.RefreshShowcase();
        return;
    }
    void BeginDestroy()
    {
        this.ResetCreatePlayerPhaseLighting();
        if (!(this.GetbShowcaseLoaded()))
        {
            return;
        }
        this.SetbShowcaseLoaded(false);
        UUIShowcaseManagerSubsystem local_6 = UUIShowcaseManagerSubsystem::Get();
        if (local_6 != nullptr)
        {
            if (local_6.GetUniqueID() == this.GetShowcaseUniqueID())
            {
                local_6.UnLoadShowcase(FEUIModelRef(this));
            }
        }
        return;
    }
    void WidgetTick(const float32 DeltaTime)
    {
        float32 local_9;
        if (this.GetbMaskActive())
        {
            this.TickMask(DeltaTime);
        }
        if (this.GetbCreateRequestInFlight())
        {
            this.SetCreateRequestElapsed((this.GetCreateRequestElapsed() + DeltaTime));
            if (this.GetLoginSettings() != nullptr && ((this.GetLoginSettings().LoginTimeoutSeconds > 0.0f)))
            {
                local_9 = this.GetLoginSettings().LoginTimeoutSeconds;
            }
            else
            {
                local_9 = 20.0f;
            }
            if (this.GetCreateRequestElapsed() >= local_9)
            {
                XWarning(ELog(78), FString().Append("FVM_CreatePlayer: create-player response timeout (").Append(this.GetCreateRequestElapsed()).Append("s >= ").Append(local_9).Append("s), reset in-flight latch to allow retry"));
                this.SetbCreateRequestInFlight(false);
                this.SetbConfirmLocked(false);
                this.SetCreateRequestElapsed(0.0f);
            }
        }
        if (int(this.GetCreatePlayerPhase()) == 3)
        {
            if (this.GetStringValidationHelper().IsInProgress())
            {
                this.GetModify_StringValidationHelper().TickValidation();
            }
            EStringValidationResult local_19 = this.GetStringValidationHelper().GetValidationResult();
            if ((int(local_19)) == 1)
            {
                this.TryPopNicknameValidationError();
                this.GetModify_StringValidationHelper().StopValidation();
                this.SetbConfirmLocked(false);
                this.SetbCreateRequestInFlight(false);
            }
            else
            {
                if (int(local_19) == 0)
                {
                    this.SetLastNicknameValidationTipsDedupeKey(FString());
                    this.TryConfirmAllPhase();
                }
            }
        }
        if (this.GetbShowcaseLoaded() && !(this.GetbPhaseLightActorsReady()))
        {
            this.TryResolveCreatePlayerPhaseLightingFromShowcase();
        }
        return;
    }
    void InitMask()
    {
        this.SetMaskElapsed(0.0f);
        if (this.GetCreatePlayerConfig().MaskTime <= 0.0f && (this.GetCreatePlayerConfig().MaskFadeOutTime <= 0.0f))
        {
            this.SetMaskOpacity(0.0f);
            this.SetbMaskActive(false);
            return;
        }
        this.SetMaskOpacity(1.0f);
        this.SetbMaskActive(true);
        return;
    }
    void TickMask(const float32 DeltaTime)
    {
        this.SetMaskElapsed((this.GetMaskElapsed() + DeltaTime));
        float32 local_2 = this.GetCreatePlayerConfig().MaskTime;
        float32 local_3 = this.GetCreatePlayerConfig().MaskFadeOutTime;
        float32 local_1_2 = local_2 + local_3;
        if (this.GetMaskElapsed() >= local_1_2)
        {
            this.SetMaskOpacity(0.0f);
            this.SetbMaskActive(false);
            return;
        }
        if (this.GetMaskElapsed() < local_2)
        {
            this.SetMaskOpacity(1.0f);
            return;
        }
        if (local_3 > 0.0f)
        {
            float32 local_6 = 1.0f;
            float32 local_4 = this.GetMaskElapsed() - local_2;
            float32 local_1_3 = local_4 / local_3;
            this.SetMaskOpacity(FMath::Clamp(local_6 - local_1_3, 0.0f, 1.0f));
            return;
        }
        this.SetMaskOpacity(0.0f);
        return;
    }
    bool IsMaskBlockingInput() const
    {
        return this.GetbMaskActive();
    }
    void InjectTipsLocalPlayerFromWidget(const ULocalPlayer InLocalPlayer)
    {
        this.SetTipsLocalPlayer(InLocalPlayer);
        return;
    }
    bool HasValidatorConfig() const
    {
        return this.GetbHasNameValidatorConfig();
    }
    EGenderType UIGetCreatePlayerGender() const
    {
        return this.GetCreatePlayerGender();
    }
    bool HasNicknameValidationError() const
    {
        if (!(this.GetbHasNameValidatorConfig()))
        {
            return false;
        }
        if (this.GetInputNickname().TrimStartAndEnd().IsEmpty())
        {
            return false;
        }
        return (int(this.GetStringValidationHelper().GetValidationResult()) == 1);
    }
    FText GetNicknameValidationError() const
    {
        if (!(this.HasNicknameValidationError()))
        {
            return FText();
        }
        return this.GetStringValidationHelper().GetFailReason();
    }
    EFashionSlotType GetSelectedFashionSlotType() const
    {
        if (this.GetAvailableFashionSlotTypes().IsValidIndex(this.GetSelectedFashionSlotTypeIndex()))
        {
            return this.GetAvailableFashionSlotTypes()[this.GetSelectedFashionSlotTypeIndex()];
        }
        return EFashionSlotType(0);
    }
    void RefreshCreatePlayerPhase()
    {
        FText local_28;
        if (this.GetLoginSettings() != nullptr)
        {
            for (auto& local_20 : this.GetLoginSettings().CreatePlayerStepInfos)
            {
                if (int(local_20.StepType) != int(this.GetCreatePlayerPhase()))
                {
                    continue;
                }
                if (int(this.GetCreatePlayerPhase()) == 2)
                {
                    FText local_38;
                    int local_33 = int(this.GetSelectedFashionSlotType());
                    ::FashionSettings::GetFashionSlotName(local_38);
                    this.SetCurrentTitle(FText::Format(local_28, local_38));
                }
                else
                {
                    this.SetCurrentTitle(local_28);
                }
                break;
            }
        }
        return;
    }
    void RefreshMaleSelected()
    {
        int local_5;
        if (!(this.GetbGenderSelected()))
        {
            local_5 = 0;
        }
        else
        {
            local_5 = (int(this.GetCreatePlayerGender()) == 0);
        }
        this.SetbIsMaleSelected((local_5 != 0));
        return;
    }
    void RefreshFamaleSelected()
    {
        int local_5;
        if (!(this.GetbGenderSelected()))
        {
            local_5 = 0;
        }
        else
        {
            local_5 = (int(this.GetCreatePlayerGender()) == 1);
        }
        this.SetbIsFamaleSelected((local_5 != 0));
        return;
    }
    void RefreshSelectedFaceItem()
    {
        if (this.GetCreatePlayerConfig().GetAvailableFace().IsValidIndex(this.GetSelectedFaceItemIndex()))
        {
            this.SetSelectedFaceID(this.GetFaceDataIdAtIndex(this.GetSelectedFaceItemIndex()));
            this.RefreshShowcaseActors();
        }
        int local_4 = 0;
        for (; local_4 < this.GetFaceItems().Num(); )
        {
            ::DisplayItemUtility::SetCustomSelection(this.GetFaceItems()[local_4], (local_4 == this.GetSelectedFaceItemIndex()));
            ++local_4;
        }
        FEUIModelContainer local_34;
        if (this.GetFaceItems().IsValidIndex(this.GetSelectedFaceItemIndex()))
        {
            local_34 = this.GetFaceItems()[this.GetSelectedFaceItemIndex()];
        }
        else
        {
            local_34 = FEUIModelContainer();
        }
        this.SetSelectedFaceItem(local_34);
        XLog(ELog(16), FString().Append("[CreatePlayer][DBG] RefreshSelectedFaceItem run SelectedFaceItemIndex=").Append(this.GetSelectedFaceItemIndex()).Append(" FaceItems=").Append(this.GetFaceItems().Num()).Append(" SelectedFaceID=").Append(this.GetSelectedFaceID()));
        return;
    }
    void RefreshFilteredFashionItems()
    {
        this.SyncSelectedFashionSlotTab();
        this.GetModify_FilteredFashions().Reset(0);
        this.GetModify_FilteredFashionItems().Reset(0);
        if (!(this.GetAvailableFashionSlotTypes().IsValidIndex(this.GetSelectedFashionSlotTypeIndex())))
        {
            return;
        }
        EFashionSlotType local_4 = this.GetAvailableFashionSlotTypes()[this.GetSelectedFashionSlotTypeIndex()];
        EFashionSlotType local_3 = local_4;
        int local_5 = 0;
        for (; local_5 < this.GetAllAvailableFashions().Num(); ++local_5)
        {
            const TDataObjectPtr<FFashionConfig>& local_8 = this.GetAllAvailableFashions()[local_5];
            if (!(local_8.IsSet()) || (int(local_4) != int(local_3)))
            {
                continue;
            }
            this.GetModify_FilteredFashions().Add(local_8);
            this.GetModify_FilteredFashionItems().Add(this.GetAllFashionItems()[local_5]);
        }
        this.SetSelectedFashionItemIndex(this.GetSelectedFashionItemIndex(EFashionSlotType(local_3)));
        return;
    }
    void SyncSelectedFashionSlotTab()
    {
        FEUIModelContainer local_14;
        if (this.GetFashionSlotTabs().IsValidIndex(this.GetSelectedFashionSlotTypeIndex()))
        {
            local_14 = this.GetFashionSlotTabs()[this.GetSelectedFashionSlotTypeIndex()];
        }
        this.SetSelectedFashionSlotTab(local_14);
        return;
    }
    void RefreshSelectedFashionItem()
    {
        XLog(ELog(16), FString().Append("[CreatePlayer][DBG] RefreshSelectedFashionItem run SelectedFashionItemIndex=").Append(this.GetSelectedFashionItemIndex()).Append(" FilteredFashionItems=").Append(this.GetFilteredFashionItems().Num()));
        int local_8 = 0;
        for (; local_8 < this.GetFilteredFashionItems().Num(); )
        {
            ::DisplayItemUtility::SetCustomSelection(this.GetFilteredFashionItems()[local_8], (local_8 == this.GetSelectedFashionItemIndex()));
            ++local_8;
        }
        FEUIModelContainer local_38;
        if (this.GetFilteredFashionItems().IsValidIndex(this.GetSelectedFashionItemIndex()))
        {
            local_38 = this.GetFilteredFashionItems()[this.GetSelectedFashionItemIndex()];
        }
        else
        {
            local_38 = FEUIModelContainer();
        }
        this.SetSelectedFashionItem(local_38);
        return;
    }
    bool ConfirmNicknameStepReady()
    {
        if (this.GetInputNickname().TrimStartAndEnd().IsEmpty())
        {
            return false;
        }
        if (!(this.GetbHasNameValidatorConfig()))
        {
            return true;
        }
        EStringValidationResult local_7 = this.GetStringValidationHelper().GetValidationResult();
        if ((int(local_7)) == 2)
        {
            if (!(this.GetStringValidationHelper().IsStarted()))
            {
                this.GetModify_StringValidationHelper().StartValidation();
            }
            return false;
        }
        return (int(local_7) == 0);
    }
    void OnMaleSelected()
    {
        if (this.IsMaskBlockingInput())
        {
            return;
        }
        if (this.GetCreatePlayerConfig().bForbidMaleSelect)
        {
            if (!(this.GetCreatePlayerConfig().SelectForbidTip.IsEmpty()))
            {
                FCommonTipsParam local_20;
                ::CommonPopup_Internal::OpenTips(this.GetCreatePlayerConfig().SelectForbidTip, local_20, ECommonTipsType(0), FEUIModelContainer(), this.GetTipsLocalPlayer());
            }
            return;
        }
        this.SelectGender(EGenderType(0));
        return;
    }
    void OnFamaleSelected()
    {
        if (this.IsMaskBlockingInput())
        {
            return;
        }
        this.SelectGender(EGenderType(1));
        return;
    }
    void OnConfirmCreate()
    {
        if (this.IsMaskBlockingInput())
        {
            return;
        }
        XLog(ELog(78), FString().Append("FVM_CreatePlayer: OnConfirmCreate"));
        bool local_1 = this.IsOnLastActivePhase();
        if (!(local_1))
        {
            return;
        }
        this.SetbConfirmLocked(true);
        if ((int(this.GetCreatePlayerPhase())) == 3)
        {
            this.SetLastNicknameValidationTipsDedupeKey(FString());
            if (!(this.GetStringValidationHelper().IsStarted()))
            {
                this.StartValidationNickname();
                return;
            }
            if ((int(this.GetStringValidationHelper().GetValidationResult())) != 0)
            {
                return;
            }
        }
        this.TryConfirmAllPhase();
        return;
    }
    void OnGotoPrevPhase()
    {
        if (this.IsMaskBlockingInput())
        {
            return;
        }
        XLog(ELog(78), FString().Append("FVM_CreatePlayer: OnGotoPrevPhase"));
        if (this.GetbConfirmLocked())
        {
            return;
        }
        if (this.GetPhaseOrderCursor() <= 0)
        {
            return;
        }
        if (int(this.GetCreatePlayerPhase()) == 2)
        {
            if (this.GetSelectedFashionSlotTypeIndex() > 0)
            {
                this.SetSelectedFashionSlotTypeIndex((this.GetSelectedFashionSlotTypeIndex() - 1));
                return;
            }
        }
        this.SetPhaseOrderCursor((this.GetPhaseOrderCursor() - 1));
        this.GotoPhaseAtCursor();
        return;
    }
    void OnGotoNextPhase()
    {
        if (this.IsMaskBlockingInput())
        {
            return;
        }
        XLog(ELog(78), FString().Append("FVM_CreatePlayer: OnGotoNextPhase"));
        if (int(this.GetCreatePlayerPhase()) == 3)
        {
            this.StartValidationNickname();
        }
        if (!(this.CanAdvanceFromCurrentPhase()))
        {
            return;
        }
        if (this.IsOnLastActivePhase())
        {
            return;
        }
        if (int(this.GetCreatePlayerPhase()) == 2)
        {
            if (this.GetSelectedFashionSlotTypeIndex() < (this.GetAvailableFashionSlotTypes().Num() - 1))
            {
                this.SetSelectedFashionSlotTypeIndex(this.GetSelectedFashionSlotTypeIndex() + 1);
                return;
            }
        }
        this.SetPhaseOrderCursor(this.GetPhaseOrderCursor() + 1);
        this.GotoPhaseAtCursor();
        return;
    }
    void OnSelectFaceItem(const int ItemIndex)
    {
        if (this.IsMaskBlockingInput())
        {
            return;
        }
        if ((int(this.GetCreatePlayerPhase())) != 1)
        {
            return;
        }
        if (!(this.GetCreatePlayerConfig().GetAvailableFace().IsValidIndex(ItemIndex)))
        {
            XLog(ELog(16), FString().Append("[CreatePlayer][DBG] OnSelectFaceItem invalid index, early return"));
            return;
        }
        this.SetSelectedFaceItemIndex(ItemIndex);
        return;
    }
    void OnSelectFashionSlotType(const int SlotTypeIndex)
    {
        if (this.IsMaskBlockingInput())
        {
            return;
        }
        if ((int(this.GetCreatePlayerPhase())) != 2)
        {
            return;
        }
        if (!(this.GetAvailableFashionSlotTypes().IsValidIndex(SlotTypeIndex)))
        {
            return;
        }
        this.SetSelectedFashionSlotTypeIndex(SlotTypeIndex);
        return;
    }
    void OnSelectFashionItem(const int ItemIndex)
    {
        int local_12 = 0;
        int local_13 = 0;
        if (this.IsMaskBlockingInput())
        {
            return;
        }
        if ((int(this.GetCreatePlayerPhase())) != 2)
        {
            return;
        }
        if (!(this.GetFilteredFashions().IsValidIndex(ItemIndex)))
        {
            return;
        }
        const TDataObjectPtr<FFashionConfig>& local_6 = this.GetFilteredFashions()[ItemIndex];
        if (!(local_6.IsSet()))
        {
            return;
        }
        FString local_10 = FString();
        this.SetSelectedFashionItemIndex(ItemIndex);
        this.ApplyFashionSelection(EFashionSlotType(local_13), local_12);
        return;
    }
    void OnFashionOptionClicked(FVM_CreatePlayerFashionOption &inout Option)
    {
        if (this.IsMaskBlockingInput())
        {
            return;
        }
        if ((int(Option.GetItemType())) == 0)
        {
            this.OnSelectFaceItem(Option.GetItemIndex());
            return;
        }
        int local_5 = 0;
        for (; local_5 < this.GetFilteredFashions().Num(); ++local_5)
        {
            if (this.GetFilteredFashions()[local_5].IsSet() && (0 == Option.GetDataId()))
            {
                this.OnSelectFashionItem(local_5);
                break;
            }
        }
        return;
    }
    void HandleCreatePlayerFailed(const FMsg_CreatePlayerFailed &inout Msg)
    {
        XLog(ELog(78), FString().Append("FVM_CreatePlayer: HandleCreatePlayerFailed retcode=").Append(Msg.Retcode).Append(", unlock prev-phase navigation"));
        this.SetbConfirmLocked(false);
        this.SetbCreateRequestInFlight(false);
        return;
    }
    void OnNextPhase()
    {
        if (this.IsMaskBlockingInput())
        {
            return;
        }
        if (int(this.GetCreatePlayerPhase()) == 3)
        {
            this.StartValidationNickname();
        }
        if (!(this.CanAdvanceFromCurrentPhase()))
        {
            return;
        }
        if (this.IsOnLastActivePhase())
        {
            return;
        }
        if (int(this.GetCreatePlayerPhase()) == 2)
        {
            if (this.GetSelectedFashionSlotTypeIndex() < (this.GetAvailableFashionSlotTypes().Num() - 1))
            {
                this.SetSelectedFashionSlotTypeIndex(this.GetSelectedFashionSlotTypeIndex() + 1);
                return;
            }
        }
        this.SetPhaseOrderCursor(this.GetPhaseOrderCursor() + 1);
        this.GotoPhaseAtCursor();
        return;
    }
    void OnConfirmPhase()
    {
        if (this.IsMaskBlockingInput())
        {
            return;
        }
        bool local_1 = this.IsOnLastActivePhase();
        if (!(local_1))
        {
            return;
        }
        this.SetbConfirmLocked(true);
        if ((int(this.GetCreatePlayerPhase())) == 3)
        {
            this.SetLastNicknameValidationTipsDedupeKey(FString());
            if (!(this.GetStringValidationHelper().IsStarted()))
            {
                this.StartValidationNickname();
                return;
            }
            if ((int(this.GetStringValidationHelper().GetValidationResult())) != 0)
            {
                return;
            }
        }
        this.TryConfirmAllPhase();
        return;
    }
    void OnNicknameTextChanged(const FText &inout Text)
    {
        this.SetInputNickname(Text.ToString());
        return;
    }
    void OnNicknameTextCommitted(const FText &inout Text, const ETextCommit CommitMethod)
    {
        if (int(CommitMethod) == 1)
        {
            this.SyncNicknameFromWidget(Text.ToString());
            this.OnConfirmCreate();
        }
        return;
    }
    bool IsOnLastActivePhase() const
    {
        return this.GetActivePhaseOrder().Num() > 0 && (this.GetPhaseOrderCursor() >= (this.GetActivePhaseOrder().Num() - 1));
    }
    bool CanAdvanceFromCurrentPhase()
    {
        if (int(this.GetCreatePlayerPhase()) == 0)
        {
            return this.GetbGenderSelected();
        }
        if (int(this.GetCreatePlayerPhase()) == 1)
        {
            return this.IsFaceSelectSucc();
        }
        if ((int(this.GetCreatePlayerPhase())) == 2)
        {
            return this.IsFashionSelectSucc();
        }
        if (int(this.GetCreatePlayerPhase()) == 3)
        {
            return this.CanNicknameAdvance();
        }
        return true;
    }
    void BuildActivePhaseOrder()
    {
        this.GetModify_ActivePhaseOrder().Empty(0);
        if (this.GetLoginSettings() == nullptr)
        {
            return;
        }
        for (auto& local_20 : this.GetLoginSettings().CreatePlayerStepInfos)
        {
            if (!(local_20.bIsSkip))
            {
                this.GetModify_ActivePhaseOrder().Add(int(local_20.StepType));
            }
        }
        return;
    }
    void GotoPhaseAtCursor()
    {
        ECreatePlayerPhase local_2 = this.GetCurrentCreatePlayerPhase();
        if (int(local_2) != 3)
        {
            if (this.HasValidatorConfig())
            {
                this.StopNicknameValidation();
            }
            this.SetLastNicknameValidationTipsDedupeKey(FString());
        }
        this.SetCreatePlayerPhase(ECreatePlayerPhase(local_2));
        this.SetActivePhaseIndex(int(this.GetCreatePlayerPhase()));
        if (int(this.GetCreatePlayerPhase()) == 0)
        {
            this.RestoreDefaultSelections();
        }
        if ((int(this.GetCreatePlayerPhase())) == 2)
        {
            this.SetSelectedFashionSlotTypeIndex(0);
        }
        this.RefreshShowcase();
        return;
    }
    void RefreshShowcase()
    {
        int local_1;
        local_1 = this.GetShowcaseConfigIndex();
        if (int(this.GetCreatePlayerPhase()) == 0)
        {
            this.SetShowcaseConfigIndex(0);
        }
        else
        {
            if (int(this.GetCreatePlayerPhase()) == 1)
            {
                this.SetShowcaseConfigIndex(1);
            }
            else
            {
                if (int(this.GetCreatePlayerPhase()) == 2)
                {
                    this.SetShowcaseConfigIndex(2);
                }
            }
        }
        bool local_5 = this.GetConfigs().IsValidIndex(this.GetShowcaseConfigIndex());
        if (local_5)
        {
            UUIShowcaseManagerSubsystem local_10 = UUIShowcaseManagerSubsystem::Get();
            if (local_10 != nullptr)
            {
                if (!(this.GetbShowcaseLoaded()))
                {
                    this.SetbShowcaseLoaded(true);
                    this.SetShowcaseUniqueID(local_10.GetUniqueID());
                }
                TArray<FUIShowcaseActorSpawnParams> local_16 = this.BuildSpawnParams();
                FEUIModelRef local_18 = FEUIModelRef(this);
                int local_2 = this.GetShowcaseConfigIndex();
                FDataObjectPtr local_42;
                local_42;
            }
        }
        this.TryResolveCreatePlayerPhaseLightingFromShowcase();
        return;
    }
    void RefreshShowcaseActors()
    {
        if (!(this.GetbShowcaseLoaded()) || !(this.GetConfigs().IsValidIndex(this.GetShowcaseConfigIndex())))
        {
            return;
        }
        UUIShowcaseManagerSubsystem local_8 = UUIShowcaseManagerSubsystem::Get();
        if (local_8 != nullptr)
        {
            local_8.RefreshCurrentActors(FEUIModelRef(this), this.BuildSpawnParams());
        }
        return;
    }
    TArray<FUIShowcaseActorSpawnParams> BuildSpawnParams() const
    {
        TArray<FUIShowcaseActorSpawnParams> local_4;
        float32 local_8 = 0.0f;
        bool local_6 = false;
        bool local_5 = local_6;
        float32 local_7 = 1.0f;
        if (!(this.GetConfigs().IsValidIndex(this.GetShowcaseConfigIndex())))
        {
            local_6 = false;
        }
        else
        {
            local_6 = this.GetConfigs()[this.GetShowcaseConfigIndex()];
        }
        if (local_6)
        {
            int local_9 = this.GetShowcaseConfigIndex();
            local_7 = local_8;
            int local_9_2 = this.GetShowcaseConfigIndex();
            local_5 = local_6;
        }
        if (int(this.GetCreatePlayerPhase()) == 0)
        {
            this.AppendDefaultFashionActor(local_4, this.GetCreatePlayerConfig().GetFemaleDefaultFashion(), local_7, local_5, false);
            this.AppendDefaultFashionActor(local_4, this.GetCreatePlayerConfig().GetMaleDefaultFashion(), local_7, local_5, false);
        }
        else
        {
            if ((int(this.GetCreatePlayerGender())) == 0)
            {
            }
            else
            {
            }
            TDataObjectPtr<FCharacterDefaultFashionConfig> local_62;
            this.AppendDefaultFashionActor(local_4, local_62, local_7, local_5, true);
        }
        return local_4;
    }
    void AppendDefaultFashionActor(TArray<FUIShowcaseActorSpawnParams> &inout Actors, const TDataObjectPtr<FCharacterDefaultFashionConfig> &inout DefaultFashion, const float32 RainDynamicControl, const bool bUseFaceAnim, const bool bUseFashion) const
    {
        const FCharacterDefaultFashionConfig& local_4;
        if (!(DefaultFashion))
        {
            return;
        }
        if (!(local_4.GetAvatar()))
        {
            return;
        }
        FUIShowcaseActorSpawnParams local_66;
        FAvatarPrefabConfig local_6;
        int local_67 = int(local_6.DataId);
        local_66.ActorClass = local_6.ShowcaseActor;
        local_66.Offset = local_6.ShowcaseOffset;
        local_66.DynamicRainControl = RainDynamicControl;
        local_66.bUseFaceAnim = bUseFaceAnim;
        local_66.bUseBathrobe = false;
        if (int(this.GetCreatePlayerPhase()) == 0)
        {
            local_66.FashionIds.Empty(0);
            if (this.GetCreatePlayerConfig().bGenderPhaseUseSelectFace)
            {
                int local_67_2 = this.GetFaceDataIdAtIndex(this.ResolveDefaultFaceIndex());
            }
            if (this.GetCreatePlayerConfig().bGenderPhaseUseSelectHair)
            {
                this.AppendFashionId(local_66.FashionIds, this.ResolveDefaultFashionId(this.GetCreatePlayerConfig().GetAvailableHair(), this.GetCreatePlayerConfig().DefaultHairIndex));
            }
            if (this.GetCreatePlayerConfig().bGenderPhaseUseSelectFashion)
            {
                int local_69 = this.GetCreatePlayerConfig().DefaultSuitIndex;
                int local_72 = this.ResolveDefaultFashionId(this.GetCreatePlayerConfig().GetAvailableSuit(), local_69);
                if (local_72 > 0)
                {
                    this.AppendFashionId(local_66.FashionIds, local_72);
                }
                else
                {
                    int local_67_3 = this.ResolveDefaultFashionId(this.GetCreatePlayerConfig().GetAvailableTop(), this.GetCreatePlayerConfig().DefaultTopIndex);
                    if (local_67_3 > 0)
                    {
                        this.AppendFashionId(local_66.FashionIds, local_67_3);
                    }
                    local_69 = this.GetCreatePlayerConfig().DefaultBottomIndex;
                    int local_73 = this.ResolveDefaultFashionId(this.GetCreatePlayerConfig().GetAvailableBottom(), local_69);
                    if (local_73 > 0)
                    {
                        this.AppendFashionId(local_66.FashionIds, local_73);
                    }
                }
            }
        }
        if (bUseFashion)
        {
            local_66.FashionIds.Empty(0);
            int local_74 = this.GetSelectedFaceID();
            this.AppendFashionId(local_66.FashionIds, this.GetSelectedHairID());
            if (this.GetSelectedSuitID() > 0)
            {
                this.AppendFashionId(local_66.FashionIds, this.GetSelectedSuitID());
            }
            else
            {
                if (this.GetSelectedUpperID() > 0)
                {
                    this.AppendFashionId(local_66.FashionIds, this.GetSelectedUpperID());
                }
                if (this.GetSelectedLowerID() > 0)
                {
                    this.AppendFashionId(local_66.FashionIds, this.GetSelectedLowerID());
                }
            }
        }
        Actors.Add(local_66);
        return;
    }
    void AppendFashionId(TArray<int> &inout FashionIds, const uint FashionId) const
    {
        if (FashionId > 0)
        {
            FashionIds.Add(FashionId);
        }
        return;
    }
    EUIShowcaseAvatarType GenderTypeToShowcaseType(const EGenderType Gender) const
    {
        int local_1 = int(Gender);
        if (local_1 <= 1)
        {
            if (local_1 != 0)
            {
                if (local_1 != 1)
                {
                }
                else
                {
                    return EUIShowcaseAvatarType(1);
                }
            }
        }
        return EUIShowcaseAvatarType(0);
    }
    ECreatePlayerPhase GetCurrentCreatePlayerPhase() const
    {
        if (this.GetPhaseOrderCursor() < 0 || (this.GetPhaseOrderCursor() >= this.GetActivePhaseOrder().Num()))
        {
            return ECreatePlayerPhase(0);
        }
        return ECreatePlayerPhase(this.GetActivePhaseOrder()[this.GetPhaseOrderCursor()]);
    }
    bool CanNicknameAdvance() const
    {
        FString local_8 = this.GetInputNickname().TrimStartAndEnd();
        if (local_8.IsEmpty())
        {
            return false;
        }
        return true;
    }
    void SyncNicknameFromWidget(const FString &inout InName)
    {
        this.SetInputNickname(InName);
        this.SetLastNicknameValidationTipsDedupeKey(FString());
        this.StartValidationNickname();
        return;
    }
    void StartValidationNickname()
    {
        if (!(this.GetbHasNameValidatorConfig()))
        {
            return;
        }
        this.StopNicknameValidation();
        this.GetModify_StringValidationHelper().SetString(this.GetInputNickname());
        this.GetModify_StringValidationHelper().StartValidation();
        this.TryPopNicknameValidationError();
        this.TryConfirmAllPhase();
        return;
    }
    void TryPopNicknameValidationError()
    {
        if (!(this.HasNicknameValidationError()))
        {
            return;
        }
        FText local_10 = this.GetStringValidationHelper().GetFailReason();
        FString local_18 = local_10.ToString();
        local_18 += FString("||");
        local_18 += this.GetInputNickname().TrimStartAndEnd();
        if ((local_18 == this.GetLastNicknameValidationTipsDedupeKey()))
        {
            return;
        }
        if ((!((this.GetTipsLocalPlayer() != nullptr))))
        {
            return;
        }
        this.SetLastNicknameValidationTipsDedupeKey(local_18);
        FCommonTipsParam local_38;
        ::CommonPopup_Internal::OpenTips(local_10, local_38, ECommonTipsType(0), FEUIModelContainer(), this.GetTipsLocalPlayer());
        return;
    }
    void StopNicknameValidation()
    {
        this.GetModify_StringValidationHelper().StopValidation();
        return;
    }
    void TryConfirmAllPhase()
    {
        bool local_2 = this.IsOnLastActivePhase();
        if (!(local_2))
        {
            return;
        }
        if (this.GetbConfirmLocked() && !(this.GetbCreateRequestInFlight()) && (int(this.GetStringValidationHelper().GetValidationResult()) == 0))
        {
            this.GS_Send();
        }
        return;
    }
    void GS_Send()
    {
        this.SetbCreateRequestInFlight(true);
        this.SetCreateRequestElapsed(0.0f);
        ::FMS_Login::Get(this.GetContext().UELocalPlayer).RequestCreatePlayer(this.GetInputNickname(), int(this.GetCreatePlayerGender()), this.GetSelectedFaceID(), this.GetSelectedHairID(), this.GetSelectedUpperID(), this.GetSelectedLowerID(), this.GetSelectedSuitID());
        return;
    }
    void SelectGender(const EGenderType InGender)
    {
        this.SetbGenderSelected(true);
        this.SetCreatePlayerGender(EGenderType(InGender));
        XLog(ELog(27), FString().Append("FVM_CreatePlayer: SelectGender ").Append(InGender));
        return;
    }
    void RestoreDefaultSelections()
    {
        this.SetCreatePlayerGender(this.GetCreatePlayerConfig().DefaultGender);
        this.SetbGenderSelected(this.GetCreatePlayerConfig().bForbidMaleSelect);
        this.SetSelectedFaceItemIndex(this.ResolveDefaultFaceIndex());
        this.SetSelectedFaceID(this.GetFaceDataIdAtIndex(this.GetSelectedFaceItemIndex()));
        this.ApplyDefaultFashionSelection();
        this.SetSelectedFashionSlotTypeIndex(0);
        if (this.GetAvailableFashionSlotTypes().IsValidIndex(this.GetSelectedFashionSlotTypeIndex()))
        {
            this.SetSelectedFashionItemIndex(this.GetSelectedFashionItemIndex(EFashionSlotType(this.GetAvailableFashionSlotTypes()[this.GetSelectedFashionSlotTypeIndex()])));
            return;
        }
        this.SetSelectedFashionItemIndex(0);
        return;
    }
    bool IsFaceSelectSucc() const
    {
        for (auto& local_16 : this.GetCreatePlayerConfig().GetAvailableFace())
        {
            if (!(local_16.IsSet()))
            {
                continue;
            }
            if (0 == this.GetSelectedFaceID())
            {
                return true;
            }
        }
        return false;
    }
    void BuildFaceItems()
    {
        int local_98;
        int local_99 = 0;
        this.GetModify_FaceItems().Reset(0);
        int local_4 = 0;
        for (; local_4 < this.GetCreatePlayerConfig().GetAvailableFace().Num(); )
        {
            const TDataObjectPtr<FFacePresetConfig>& local_8 = this.GetCreatePlayerConfig().GetAvailableFace()[local_4];
            local_98 = local_8.IsSet() ? local_99 : 0;
            TEUIModelRef<FVM_DisplayItem> local_104 = this.CreateSimpleIconDisplayItem(this.ResolveFaceDisplayIcon(local_8, this.GetCreatePlayerBodyType()), local_98);
            FVM_CreatePlayerFashionOption& local_106 = ::FVM_CreatePlayerFashionOption::Create(this.GetContext().Manager);
            local_106.Setup(this, ECreatePlayerFashionItemType(0), EFashionSlotType(0), local_98, local_4);
            FVM_SelectableItem& local_110 = ::FVM_SelectableItem::Create(this.GetContext().Manager);
            FEUIModelContainer local_124;
            local_124.AddModel(local_104.opImplConv(), false);
            local_124.AddModel(FEUIModelRef(local_106), false);
            local_124.AddModel(FEUIModelRef(local_110), false);
            ::DisplayItemUtility::BindDisplayItemClickCallback(local_124, FEUIModelRef(local_106), FVM_CreatePlayerFashionOption::HandleClicked);
            this.GetModify_FaceItems().Add(local_124);
            ++local_4;
        }
        this.SetSelectedFaceItemIndex(this.ResolveDefaultFaceIndex());
        return;
    }
    TEUIModelRef<FVM_DisplayItem> CreateSimpleIconDisplayItem(const FSoftBrush &inout Icon, const uint SourceId)
    {
        FM_DisplayItemData& local_2 = ::FM_DisplayItemData::Create(this.GetContext().Manager);
        local_2.SetSourceType(EDisplayItemSourceType(4));
        local_2.SetSourceId(SourceId);
        local_2.SetItemImage(Icon);
        local_2.SetItemImageHigh(Icon);
        local_2.SetCurDisplayState(0);
        return TEUIModelRef<FVM_DisplayItem>(::FVM_DisplayItem::Create(this.GetContext().Manager, (TEUIModelRef<FM_DisplayItemData>(local_2)), EItemDisplayScenario(7)));
    }
    FSoftBrush ResolveFaceDisplayIcon(const TDataObjectPtr<FFacePresetConfig> &inout FaceConfig, const EBodyType BodyType) const
    {
        bool local_1 = !(FaceConfig.IsSet());
        if (local_1)
        {
            return FSoftBrush();
        }
        local_1 = !local_1;
        if (local_1)
        {
            return FSoftBrush();
        }
        FSoftBrush local_116;
        FFashionDisplayIconByBody local_68;
        ::DisplayItemAdapter_Fashion::TryResolveDisplayIconForBody(local_68, EBodyType(BodyType), local_116);
        return local_116;
    }
    int ResolveDefaultFaceIndex() const
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
        int __r; return __r;
    }
    uint GetFaceDataIdAtIndex(const int Index) const
    {
        int local_4 = 0;
        if (Index < 0 || (Index >= this.GetCreatePlayerConfig().GetAvailableFace().Num()))
        {
            return 0;
        }
        const TDataObjectPtr<FFacePresetConfig>& local_6 = this.GetCreatePlayerConfig().GetAvailableFace()[Index];
        if (!(local_6.IsSet()))
        {
            return 0;
        }
        return local_4;
    }
    bool IsFashionSelectSucc() const
    {
        bool local_4;
        bool local_3 = this.IsFashionIdInList(this.GetSelectedHairID(), this.GetCreatePlayerConfig().GetAvailableHair());
        bool local_1 = !(local_3);
        if (local_1)
        {
            return false;
        }
        local_1 = this.IsFashionIdInList(this.GetSelectedSuitID(), this.GetCreatePlayerConfig().GetAvailableSuit());
        if (local_1)
        {
            int local_2 = this.GetSelectedUpperID();
            if (local_2 != 0)
            {
                local_4 = false;
            }
            else
            {
                int local_5 = this.GetSelectedLowerID();
                local_4 = (local_5 == 0);
            }
            return local_4;
        }
        int local_5_2 = this.GetSelectedSuitID();
        if (local_5_2 != 0)
        {
            return false;
        }
        local_4 = (this.GetCreatePlayerConfig().GetAvailableTop().Num() > 0);
        bool local_7 = (this.GetCreatePlayerConfig().GetAvailableBottom().Num() > 0);
        bool local_6 = !(local_4) || this.IsFashionIdInList(this.GetSelectedUpperID(), this.GetCreatePlayerConfig().GetAvailableTop());
        bool local_10 = !(local_7) || this.IsFashionIdInList(this.GetSelectedLowerID(), this.GetCreatePlayerConfig().GetAvailableBottom());
        if (!(local_6) || !(local_10))
        {
            return false;
        }
        if (!(local_4) && !(local_7))
        {
            return (this.GetCreatePlayerConfig().GetAvailableSuit().Num() == 0);
        }
        return true;
    }
    void BuildAvailableFashions()
    {
        EFashionSlotType local_21;
        this.GetModify_AllAvailableFashions().Reset(0);
        this.GetModify_AllFashionItems().Reset(0);
        this.AppendAvailableFashions(this.GetCreatePlayerConfig().GetAvailableHair());
        this.AppendAvailableFashions(this.GetCreatePlayerConfig().GetAvailableTop());
        this.AppendAvailableFashions(this.GetCreatePlayerConfig().GetAvailableBottom());
        this.AppendAvailableFashions(this.GetCreatePlayerConfig().GetAvailableSuit());
        this.GetModify_AvailableFashionSlotTypes().Reset(0);
        for (auto& local_18 : this.GetAllAvailableFashions())
        {
            if (!(local_18.IsSet()))
            {
                continue;
            }
        }
        this.GetModify_FashionSlotTabs().Reset(0);
        int local_19 = 0;
        for (; local_19 < this.GetAvailableFashionSlotTypes().Num(); )
        {
            local_21 = this.GetAvailableFashionSlotTypes()[local_19];
            FVM_SelectableItem& local_24 = ::FVM_SelectableItem::Create(this.GetContext().Manager);
            local_24.SetbIsSelected((local_19 == this.GetSelectedFashionSlotTypeIndex()));
            FVM_CommonTabItem& local_26 = ::FVM_CommonTabItem::Create(this.GetContext().Manager);
            local_26.SetTitleText(::FashionSettings::GetFashionSlotName(EFashionSlotType(local_21)));
            FEUIModelContainer local_44;
            FEUIModelRef local_46 = FEUIModelRef(local_24);
            local_44.AddModel(local_46, false);
            FSoftBrush local_92 = ::FashionSettings::GetSlotIcon(EFashionSlotType(local_21));
            local_44.AddModel(local_46, false);
            local_44.AddModel(FEUIModelRef(local_26), false);
            this.GetModify_FashionSlotTabs().Add(local_44);
            ++local_19;
        }
        this.SyncSelectedFashionSlotTab();
        this.ApplyDefaultFashionSelection();
        return;
    }
    void ApplyDefaultFashionSelection()
    {
        this.SetSelectedHairID(this.ResolveDefaultFashionId(this.GetCreatePlayerConfig().GetAvailableHair(), this.GetCreatePlayerConfig().DefaultHairIndex));
        int local_2 = this.ResolveDefaultFashionId(this.GetCreatePlayerConfig().GetAvailableSuit(), this.GetCreatePlayerConfig().DefaultSuitIndex);
        if (local_2 != 0)
        {
            this.SetSelectedSuitID(local_2);
            this.SetSelectedUpperID(0);
            this.SetSelectedLowerID(0);
            return;
        }
        this.SetSelectedSuitID(0);
        this.SetSelectedUpperID(this.ResolveDefaultFashionId(this.GetCreatePlayerConfig().GetAvailableTop(), this.GetCreatePlayerConfig().DefaultTopIndex));
        this.SetSelectedLowerID(this.ResolveDefaultFashionId(this.GetCreatePlayerConfig().GetAvailableBottom(), this.GetCreatePlayerConfig().DefaultBottomIndex));
        return;
    }
    void AppendAvailableFashions(const TArray<TDataObjectPtr<FFashionConfig>> &inout FashionList)
    {
        int local_35 = 0;
        int local_36 = 0;
        int local_2 = int(this.GetCreatePlayerBodyType());
        for (auto& local_18 : FashionList)
        {
            if (!(local_18.IsSet()))
            {
                continue;
            }
            this.GetModify_AllAvailableFashions().Add(local_18);
            FDisplayItemFashionRuntimeState local_26;
            local_26.bUnlocked = true;
            local_26.bEnableMask = false;
            local_26.MaskType = 0;
            TEUIModelRef<FVM_DisplayItem> local_32 = ::DisplayItemAdapter_Fashion::CreateDisplayItem(this.GetContext().Manager, local_18, local_26, EItemDisplayScenario(7));
            FVM_CreatePlayerFashionOption& local_34 = ::FVM_CreatePlayerFashionOption::Create(this.GetContext().Manager);
            local_34.Setup(this, ECreatePlayerFashionItemType(1), EFashionSlotType(local_36), local_35, INDEX_NONE);
            FVM_SelectableItem& local_40 = ::FVM_SelectableItem::Create(this.GetContext().Manager);
            FEUIModelContainer local_54;
            local_54.AddModel(local_32.opImplConv(), false);
            local_54.AddModel(FEUIModelRef(local_34), false);
            local_54.AddModel(FEUIModelRef(local_40), false);
            ::DisplayItemUtility::BindDisplayItemClickCallback(local_54, FEUIModelRef(local_34), FVM_CreatePlayerFashionOption::HandleClicked);
            this.GetModify_AllFashionItems().Add(local_54);
        }
        return;
    }
    EBodyType GetCreatePlayerBodyType() const
    {
        int local_5;
        if ((int(this.GetCreatePlayerGender())) == 1)
        {
            local_5 = 2;
        }
        else
        {
            local_5 = 1;
        }
        return EBodyType(local_5);
    }
    uint ResolveDefaultFashionId(const TArray<TDataObjectPtr<FFashionConfig>> &inout FashionList, const int PreferredIndex) const
    {
        int local_2 = this.GetFashionDataIdAtIndex(FashionList, PreferredIndex);
        if (local_2 != 0)
        {
            return local_2;
        }
        return (this.GetFashionDataIdAtIndex(FashionList, 0));
    }
    uint GetFashionDataIdAtIndex(const TArray<TDataObjectPtr<FFashionConfig>> &inout FashionList, const int Index) const
    {
        int local_4 = 0;
        if (Index < 0 || (Index >= FashionList.Num()))
        {
            return 0;
        }
        const TDataObjectPtr<FFashionConfig>& local_6 = FashionList[Index];
        if (!(local_6.IsSet()))
        {
            return 0;
        }
        return local_4;
    }
    bool IsFashionIdInList(const uint FashionId, const TArray<TDataObjectPtr<FFashionConfig>> &inout FashionList) const
    {
        if (FashionId == 0)
        {
            return false;
        }
        for (auto& local_16 : FashionList)
        {
            if (!(local_16.IsSet()))
            {
                continue;
            }
            if (0 == FashionId)
            {
                return true;
            }
        }
        return false;
    }
    int GetSelectedFashionItemIndex(const EFashionSlotType SlotType) const
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
        int __r; return __r;
    }
    uint GetSelectedIdForSlot(const EFashionSlotType SlotType) const
    {
        int local_3 = 0;
        switch (int(SlotType))
        {
        case 1:
        {
            return this.GetSelectedHairID();
        }
        case 2:
        {
            return this.GetSelectedUpperID();
        }
        case 3:
        {
            return this.GetSelectedLowerID();
        }
        case 4:
        {
            return this.GetSelectedSuitID();
        }
        default:
        {
            local_3 = 0;
        }
        }
        return local_3;
    }
    void ApplyFashionSelection(const EFashionSlotType SlotType, const uint PickedId)
    {
        switch (int(SlotType))
        {
        case 1:
        {
            this.SetSelectedHairID(PickedId);
            break;
        }
        case 2:
        {
            this.SetSelectedUpperID(PickedId);
            this.SetSelectedSuitID(0);
            break;
        }
        case 3:
        {
            this.SetSelectedLowerID(PickedId);
            this.SetSelectedSuitID(0);
            break;
        }
        case 4:
        {
            this.SetSelectedSuitID(PickedId);
            this.SetSelectedUpperID(0);
            this.SetSelectedLowerID(0);
            break;
        }
        }
        this.RefreshShowcaseActors();
        return;
    }
    void TryResolveCreatePlayerPhaseLightingFromShowcase()
    {
        if (!(this.GetbShowcaseLoaded()))
        {
            return;
        }
        if (!(this.GetbPhaseLightActorsReady()))
        {
            UKLShowcaseSubsystem local_4 = UKLShowcaseSubsystem::Get();
            if (local_4 == nullptr)
            {
                return;
            }
            UKLShowcaseInstance local_8 = local_4.GetCurrentShowcaseInstance();
            if (local_8 == nullptr)
            {
                return;
            }
            this.TryCacheCreatePlayerPhaseLightActors(local_8);
        }
        this.ApplyCreatePlayerPhaseLighting();
        return;
    }
    bool TryGetCreatePlayerStepConfig(FCreatePlayerStepConfig &inout OutConfig) const
    {
        if (this.GetLoginSettings() == nullptr)
        {
            return false;
        }
        for (auto& local_18 : this.GetLoginSettings().CreatePlayerStepInfos)
        {
            if (int(local_18.StepType) == (int(this.GetCreatePlayerPhase())))
            {
                return true;
            }
        }
        return false;
    }
    bool IsLightTagInList(const FName &inout LightTag, const TArray<FName> &inout LightTags) const
    {
        for (auto& local_16 : LightTags)
        {
            if ((local_16 == LightTag))
            {
                return true;
            }
        }
        return false;
    }
    bool IsLightActorCached(const FName &inout LightTag) const
    {
        return this.GetCachedLightActorTags().Contains(LightTag);
    }
    void TryCacheCreatePlayerPhaseLightActors(const UKLShowcaseInstance ShowcaseInstance)
    {
        if (this.GetbPhaseLightActorsReady() || (ShowcaseInstance == nullptr) || (this.GetLoginSettings() == nullptr))
        {
            return;
        }
        this.GetModify_CachedLightActors().Empty(0);
        this.GetModify_CachedLightActorTags().Empty(0);
        FName local_7(this.GetLoginSettings().CreatePlayerPhaseLightRootTag);
        if (local_7.IsNone())
        {
            this.SetbPhaseLightActorsReady(true);
            return;
        }
        TArray<AActor> local_16 = ShowcaseInstance.GetLevelActors();
        for (auto local_30 : local_16)
        {
            if (local_30 == nullptr || !(local_30.ActorHasTag(local_7)))
            {
                continue;
            }
            for (auto& local_44 : this.GetLoginSettings().CreatePlayerStepInfos)
            {
                for (auto& local_58 : local_44.EnabledLightTags)
                {
                    if (local_58.IsNone() || !(local_30.ActorHasTag(local_58)) || this.IsLightActorCached(local_58))
                    {
                        continue;
                    }
                    this.GetModify_CachedLightActors().Add(local_30);
                    this.GetModify_CachedLightActorTags().Add(local_58);
                }
            }
        }
        this.SetbPhaseLightActorsReady(true);
        for (auto& local_44 : this.GetLoginSettings().CreatePlayerStepInfos)
        {
            for (auto& local_58 : local_44.EnabledLightTags)
            {
                if (!(local_58.IsNone()) && !(this.IsLightActorCached(local_58)))
                {
                    XWarning(ELog(16), FString().Append("[CreatePlayer] Phase light actor missing: rootTag=").Append(local_7).Append(" lightTag=").Append(local_58).Append(" step=").Append(local_44.StepType));
                }
            }
        }
        return;
    }
    void ApplyCreatePlayerPhaseLighting()
    {
        if (!(this.GetbShowcaseLoaded()) || !(this.GetbPhaseLightActorsReady()))
        {
            return;
        }
        FCreatePlayerStepConfig local_32;
        if (!(this.TryGetCreatePlayerStepConfig(local_32)))
        {
            return;
        }
        int local_33 = 0;
        for (; local_33 < this.GetCachedLightActors().Num(); )
        {
            FName local_37(this.GetCachedLightActorTags()[local_33]);
            this.SetCreatePlayerLightActorEnabled(this.GetCachedLightActors()[local_33], this.IsLightTagInList(local_37, local_32.EnabledLightTags));
            ++local_33;
        }
        return;
    }
    void SetCreatePlayerLightActorEnabled(const AActor LightActor, const bool bEnabled)
    {
        if (LightActor == nullptr)
        {
            return;
        }
        this.SetLightComponentsVisibilityOnActor(LightActor, bEnabled);
        bool local_1 = !(bEnabled);
        LightActor.SetActorHiddenInGame(local_1);
        TArray<AActor> local_6;
        LightActor.GetAttachedActors(local_6, true, true);
        for (auto local_22 : local_6)
        {
            if (local_22 == nullptr)
            {
                continue;
            }
            this.SetLightComponentsVisibilityOnActor(local_22, bEnabled);
            local_22.SetActorHiddenInGame(!(bEnabled));
        }
        return;
    }
    void SetLightComponentsVisibilityOnActor(const AActor Actor, const bool bEnabled)
    {
        if (Actor == nullptr)
        {
            return;
        }
        TArray<ULightComponent> local_10 = Actor.GetComponentsByClass(ULightComponent);
        for (auto local_24 : local_10)
        {
            if (local_24 != nullptr)
            {
                local_24.SetVisibility(bEnabled, false);
            }
        }
        return;
    }
    void ResetCreatePlayerPhaseLighting()
    {
        if (this.GetbPhaseLightActorsReady())
        {
            for (auto local_16 : this.GetCachedLightActors())
            {
                this.SetCreatePlayerLightActorEnabled(local_16, false);
            }
        }
        this.GetModify_CachedLightActors().Empty(0);
        this.GetModify_CachedLightActorTags().Empty(0);
        this.SetbPhaseLightActorsReady(false);
        return;
    }
    const TArray<TDataObjectPtr<FUIShowcaseConfig>> GetConfigs() const property
    {
        const TArray<TDataObjectPtr<FUIShowcaseConfig>> __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    TArray<TDataObjectPtr<FUIShowcaseConfig>> GetModify_Configs() property
    {
        TArray<TDataObjectPtr<FUIShowcaseConfig>> __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetConfigs(const TArray<TDataObjectPtr<FUIShowcaseConfig>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_Configs = __Value;
        return;
    }
    const float32 GetMaskOpacity() const property
    {
        const float32 __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    float32 GetModify_MaskOpacity() property
    {
        float32 __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetMaskOpacity(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_MaskOpacity = __Value;
        return;
    }
    const float32 GetMaskElapsed() const property
    {
        const float32 __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    float32 GetModify_MaskElapsed() property
    {
        float32 __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetMaskElapsed(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_MaskElapsed = __Value;
        return;
    }
    bool GetbMaskActive() const property
    {
        this.TrackPropertyRead(3);
        return this.m_bMaskActive;
    }
    void SetbMaskActive(const bool __Value) property
    {
        if (!(this.m_bMaskActive) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_bMaskActive = __Value;
        return;
    }
    int GetShowcaseConfigIndex() const property
    {
        this.TrackPropertyRead(4);
        return this.m_ShowcaseConfigIndex;
    }
    void SetShowcaseConfigIndex(const int __Value) property
    {
        if (this.m_ShowcaseConfigIndex == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_ShowcaseConfigIndex = __Value;
        return;
    }
    uint GetShowcaseUniqueID() const property
    {
        this.TrackPropertyRead(5);
        return this.m_ShowcaseUniqueID;
    }
    void SetShowcaseUniqueID(const uint __Value) property
    {
        if (this.m_ShowcaseUniqueID == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_ShowcaseUniqueID = __Value;
        return;
    }
    bool GetbShowcaseLoaded() const property
    {
        this.TrackPropertyRead(6);
        return this.m_bShowcaseLoaded;
    }
    void SetbShowcaseLoaded(const bool __Value) property
    {
        if (!(this.m_bShowcaseLoaded) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_bShowcaseLoaded = __Value;
        return;
    }
    const TArray<AActor> GetCachedLightActors() const property
    {
        const TArray<AActor> __r;
        this.TrackPropertyRead(7);
        return __r;
    }
    TArray<AActor> GetModify_CachedLightActors() property
    {
        TArray<AActor> __r;
        this.MarkPropertyDirty(7);
        return __r;
    }
    void SetCachedLightActors(const TArray<AActor> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(7);
        this.m_CachedLightActors = __Value;
        return;
    }
    const TArray<FName> GetCachedLightActorTags() const property
    {
        const TArray<FName> __r;
        this.TrackPropertyRead(8);
        return __r;
    }
    TArray<FName> GetModify_CachedLightActorTags() property
    {
        TArray<FName> __r;
        this.MarkPropertyDirty(8);
        return __r;
    }
    void SetCachedLightActorTags(const TArray<FName> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(8);
        this.m_CachedLightActorTags = __Value;
        return;
    }
    bool GetbPhaseLightActorsReady() const property
    {
        this.TrackPropertyRead(9);
        return this.m_bPhaseLightActorsReady;
    }
    void SetbPhaseLightActorsReady(const bool __Value) property
    {
        if (!(this.m_bPhaseLightActorsReady) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(9);
        this.m_bPhaseLightActorsReady = __Value;
        return;
    }
    const FText GetCurrentTitle() const property
    {
        const FText __r;
        this.TrackPropertyRead(10);
        return __r;
    }
    FText GetModify_CurrentTitle() property
    {
        FText __r;
        this.MarkPropertyDirty(10);
        return __r;
    }
    void SetCurrentTitle(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(10);
        this.m_CurrentTitle = __Value;
        return;
    }
    int GetActivePhaseIndex() const property
    {
        this.TrackPropertyRead(11);
        return this.m_ActivePhaseIndex;
    }
    void SetActivePhaseIndex(const int __Value) property
    {
        if (this.m_ActivePhaseIndex == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(11);
        this.m_ActivePhaseIndex = __Value;
        return;
    }
    const TArray<int> GetActivePhaseOrder() const property
    {
        const TArray<int> __r;
        this.TrackPropertyRead(12);
        return __r;
    }
    TArray<int> GetModify_ActivePhaseOrder() property
    {
        TArray<int> __r;
        this.MarkPropertyDirty(12);
        return __r;
    }
    void SetActivePhaseOrder(const TArray<int> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(12);
        this.m_ActivePhaseOrder = __Value;
        return;
    }
    int GetPhaseOrderCursor() const property
    {
        this.TrackPropertyRead(13);
        return this.m_PhaseOrderCursor;
    }
    void SetPhaseOrderCursor(const int __Value) property
    {
        if (this.m_PhaseOrderCursor == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(13);
        this.m_PhaseOrderCursor = __Value;
        return;
    }
    ECreatePlayerPhase GetCreatePlayerPhase() const property
    {
        this.TrackPropertyRead(14);
        return this.m_CreatePlayerPhase;
    }
    void SetCreatePlayerPhase(const ECreatePlayerPhase __Value) property
    {
        if (int(this.m_CreatePlayerPhase) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(14);
        this.m_CreatePlayerPhase = __Value;
        return;
    }
    bool GetbConfirmLocked() const property
    {
        this.TrackPropertyRead(15);
        return this.m_bConfirmLocked;
    }
    void SetbConfirmLocked(const bool __Value) property
    {
        if (!(this.m_bConfirmLocked) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(15);
        this.m_bConfirmLocked = __Value;
        return;
    }
    bool GetbCreateRequestInFlight() const property
    {
        this.TrackPropertyRead(16);
        return this.m_bCreateRequestInFlight;
    }
    void SetbCreateRequestInFlight(const bool __Value) property
    {
        if (!(this.m_bCreateRequestInFlight) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(16);
        this.m_bCreateRequestInFlight = __Value;
        return;
    }
    const float32 GetCreateRequestElapsed() const property
    {
        const float32 __r;
        this.TrackPropertyRead(17);
        return __r;
    }
    float32 GetModify_CreateRequestElapsed() property
    {
        float32 __r;
        this.MarkPropertyDirty(17);
        return __r;
    }
    void SetCreateRequestElapsed(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(17);
        this.m_CreateRequestElapsed = __Value;
        return;
    }
    ULoginSettings GetLoginSettings() const property
    {
        this.TrackPropertyRead(18);
        return this.m_LoginSettings;
    }
    void SetLoginSettings(const ULoginSettings __Value) property
    {
        if (this.m_LoginSettings == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(18);
        return;
    }
    const FLoginCreatePlayerConfig GetCreatePlayerConfig() const property
    {
        const FLoginCreatePlayerConfig __r;
        this.TrackPropertyRead(19);
        return __r;
    }
    FLoginCreatePlayerConfig GetModify_CreatePlayerConfig() property
    {
        FLoginCreatePlayerConfig __r;
        this.MarkPropertyDirty(19);
        return __r;
    }
    void SetCreatePlayerConfig(const FLoginCreatePlayerConfig &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(19);
        return;
    }
    ULocalPlayer GetTipsLocalPlayer() const property
    {
        this.TrackPropertyRead(20);
        return this.m_TipsLocalPlayer;
    }
    void SetTipsLocalPlayer(const ULocalPlayer __Value) property
    {
        if (this.m_TipsLocalPlayer == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(20);
        return;
    }
    bool GetbIsMaleForbid() const property
    {
        this.TrackPropertyRead(21);
        return this.m_bIsMaleForbid;
    }
    void SetbIsMaleForbid(const bool __Value) property
    {
        if (!(this.m_bIsMaleForbid) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(21);
        this.m_bIsMaleForbid = __Value;
        return;
    }
    const FText GetMaleForbidTip() const property
    {
        const FText __r;
        this.TrackPropertyRead(22);
        return __r;
    }
    FText GetModify_MaleForbidTip() property
    {
        FText __r;
        this.MarkPropertyDirty(22);
        return __r;
    }
    void SetMaleForbidTip(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(22);
        this.m_MaleForbidTip = __Value;
        return;
    }
    bool GetbIsMaleSelected() const property
    {
        this.TrackPropertyRead(23);
        return this.m_bIsMaleSelected;
    }
    void SetbIsMaleSelected(const bool __Value) property
    {
        if (!(this.m_bIsMaleSelected) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(23);
        this.m_bIsMaleSelected = __Value;
        return;
    }
    bool GetbIsFamaleSelected() const property
    {
        this.TrackPropertyRead(24);
        return this.m_bIsFamaleSelected;
    }
    void SetbIsFamaleSelected(const bool __Value) property
    {
        if (!(this.m_bIsFamaleSelected) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(24);
        this.m_bIsFamaleSelected = __Value;
        return;
    }
    bool GetbGenderSelected() const property
    {
        this.TrackPropertyRead(25);
        return this.m_bGenderSelected;
    }
    void SetbGenderSelected(const bool __Value) property
    {
        if (!(this.m_bGenderSelected) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(25);
        this.m_bGenderSelected = __Value;
        return;
    }
    EGenderType GetCreatePlayerGender() const property
    {
        this.TrackPropertyRead(26);
        return this.m_CreatePlayerGender;
    }
    void SetCreatePlayerGender(const EGenderType __Value) property
    {
        if (int(this.m_CreatePlayerGender) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(26);
        this.m_CreatePlayerGender = __Value;
        return;
    }
    const FString GetInputNickname() const property
    {
        const FString __r;
        this.TrackPropertyRead(27);
        return __r;
    }
    FString GetModify_InputNickname() property
    {
        FString __r;
        this.MarkPropertyDirty(27);
        return __r;
    }
    void SetInputNickname(const FString &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(27);
        this.m_InputNickname = __Value;
        return;
    }
    const FStringValidationHelper GetStringValidationHelper() const property
    {
        const FStringValidationHelper __r;
        this.TrackPropertyRead(28);
        return __r;
    }
    FStringValidationHelper GetModify_StringValidationHelper() property
    {
        FStringValidationHelper __r;
        this.MarkPropertyDirty(28);
        return __r;
    }
    void SetStringValidationHelper(const FStringValidationHelper &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(28);
        return;
    }
    bool GetbHasNameValidatorConfig() const property
    {
        this.TrackPropertyRead(29);
        return this.m_bHasNameValidatorConfig;
    }
    void SetbHasNameValidatorConfig(const bool __Value) property
    {
        if (!(this.m_bHasNameValidatorConfig) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(29);
        this.m_bHasNameValidatorConfig = __Value;
        return;
    }
    const FString GetLastNicknameValidationTipsDedupeKey() const property
    {
        const FString __r;
        this.TrackPropertyRead(30);
        return __r;
    }
    FString GetModify_LastNicknameValidationTipsDedupeKey() property
    {
        FString __r;
        this.MarkPropertyDirty(30);
        return __r;
    }
    void SetLastNicknameValidationTipsDedupeKey(const FString &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(30);
        this.m_LastNicknameValidationTipsDedupeKey = __Value;
        return;
    }
    uint GetSelectedFaceID() const property
    {
        this.TrackPropertyRead(31);
        return this.m_SelectedFaceID;
    }
    void SetSelectedFaceID(const uint __Value) property
    {
        if (this.m_SelectedFaceID == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(31);
        this.m_SelectedFaceID = __Value;
        return;
    }
    uint GetSelectedHairID() const property
    {
        this.TrackPropertyRead(32);
        return this.m_SelectedHairID;
    }
    void SetSelectedHairID(const uint __Value) property
    {
        if (this.m_SelectedHairID == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(32);
        this.m_SelectedHairID = __Value;
        return;
    }
    uint GetSelectedUpperID() const property
    {
        this.TrackPropertyRead(33);
        return this.m_SelectedUpperID;
    }
    void SetSelectedUpperID(const uint __Value) property
    {
        if (this.m_SelectedUpperID == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(33);
        this.m_SelectedUpperID = __Value;
        return;
    }
    uint GetSelectedLowerID() const property
    {
        this.TrackPropertyRead(34);
        return this.m_SelectedLowerID;
    }
    void SetSelectedLowerID(const uint __Value) property
    {
        if (this.m_SelectedLowerID == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(34);
        this.m_SelectedLowerID = __Value;
        return;
    }
    uint GetSelectedSuitID() const property
    {
        this.TrackPropertyRead(35);
        return this.m_SelectedSuitID;
    }
    void SetSelectedSuitID(const uint __Value) property
    {
        if (this.m_SelectedSuitID == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(35);
        this.m_SelectedSuitID = __Value;
        return;
    }
    const TArray<FEUIModelContainer> GetFaceItems() const property
    {
        const TArray<FEUIModelContainer> __r;
        this.TrackPropertyRead(36);
        return __r;
    }
    TArray<FEUIModelContainer> GetModify_FaceItems() property
    {
        TArray<FEUIModelContainer> __r;
        this.MarkPropertyDirty(36);
        return __r;
    }
    void SetFaceItems(const TArray<FEUIModelContainer> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(36);
        this.m_FaceItems = __Value;
        return;
    }
    const FEUIModelContainer GetSelectedFaceItem() const property
    {
        const FEUIModelContainer __r;
        this.TrackPropertyRead(37);
        return __r;
    }
    FEUIModelContainer GetModify_SelectedFaceItem() property
    {
        FEUIModelContainer __r;
        this.MarkPropertyDirty(37);
        return __r;
    }
    void SetSelectedFaceItem(const FEUIModelContainer &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(37);
        this.m_SelectedFaceItem = __Value;
        return;
    }
    int GetSelectedFaceItemIndex() const property
    {
        this.TrackPropertyRead(38);
        return this.m_SelectedFaceItemIndex;
    }
    void SetSelectedFaceItemIndex(const int __Value) property
    {
        if (this.m_SelectedFaceItemIndex == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(38);
        this.m_SelectedFaceItemIndex = __Value;
        return;
    }
    const TArray<TDataObjectPtr<FFashionConfig>> GetAllAvailableFashions() const property
    {
        const TArray<TDataObjectPtr<FFashionConfig>> __r;
        this.TrackPropertyRead(39);
        return __r;
    }
    TArray<TDataObjectPtr<FFashionConfig>> GetModify_AllAvailableFashions() property
    {
        TArray<TDataObjectPtr<FFashionConfig>> __r;
        this.MarkPropertyDirty(39);
        return __r;
    }
    void SetAllAvailableFashions(const TArray<TDataObjectPtr<FFashionConfig>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(39);
        this.m_AllAvailableFashions = __Value;
        return;
    }
    const TArray<FEUIModelContainer> GetAllFashionItems() const property
    {
        const TArray<FEUIModelContainer> __r;
        this.TrackPropertyRead(40);
        return __r;
    }
    TArray<FEUIModelContainer> GetModify_AllFashionItems() property
    {
        TArray<FEUIModelContainer> __r;
        this.MarkPropertyDirty(40);
        return __r;
    }
    void SetAllFashionItems(const TArray<FEUIModelContainer> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(40);
        this.m_AllFashionItems = __Value;
        return;
    }
    const TArray<EFashionSlotType> GetAvailableFashionSlotTypes() const property
    {
        const TArray<EFashionSlotType> __r;
        this.TrackPropertyRead(41);
        return __r;
    }
    TArray<EFashionSlotType> GetModify_AvailableFashionSlotTypes() property
    {
        TArray<EFashionSlotType> __r;
        this.MarkPropertyDirty(41);
        return __r;
    }
    void SetAvailableFashionSlotTypes(const TArray<EFashionSlotType> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(41);
        this.m_AvailableFashionSlotTypes = __Value;
        return;
    }
    const TArray<FEUIModelContainer> GetFashionSlotTabs() const property
    {
        const TArray<FEUIModelContainer> __r;
        this.TrackPropertyRead(42);
        return __r;
    }
    TArray<FEUIModelContainer> GetModify_FashionSlotTabs() property
    {
        TArray<FEUIModelContainer> __r;
        this.MarkPropertyDirty(42);
        return __r;
    }
    void SetFashionSlotTabs(const TArray<FEUIModelContainer> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(42);
        this.m_FashionSlotTabs = __Value;
        return;
    }
    const FEUIModelContainer GetSelectedFashionSlotTab() const property
    {
        const FEUIModelContainer __r;
        this.TrackPropertyRead(43);
        return __r;
    }
    FEUIModelContainer GetModify_SelectedFashionSlotTab() property
    {
        FEUIModelContainer __r;
        this.MarkPropertyDirty(43);
        return __r;
    }
    void SetSelectedFashionSlotTab(const FEUIModelContainer &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(43);
        this.m_SelectedFashionSlotTab = __Value;
        return;
    }
    int GetSelectedFashionSlotTypeIndex() const property
    {
        this.TrackPropertyRead(44);
        return this.m_SelectedFashionSlotTypeIndex;
    }
    void SetSelectedFashionSlotTypeIndex(const int __Value) property
    {
        if (this.m_SelectedFashionSlotTypeIndex == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(44);
        this.m_SelectedFashionSlotTypeIndex = __Value;
        return;
    }
    const TArray<TDataObjectPtr<FFashionConfig>> GetFilteredFashions() const property
    {
        const TArray<TDataObjectPtr<FFashionConfig>> __r;
        this.TrackPropertyRead(45);
        return __r;
    }
    TArray<TDataObjectPtr<FFashionConfig>> GetModify_FilteredFashions() property
    {
        TArray<TDataObjectPtr<FFashionConfig>> __r;
        this.MarkPropertyDirty(45);
        return __r;
    }
    void SetFilteredFashions(const TArray<TDataObjectPtr<FFashionConfig>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(45);
        this.m_FilteredFashions = __Value;
        return;
    }
    const TArray<FEUIModelContainer> GetFilteredFashionItems() const property
    {
        const TArray<FEUIModelContainer> __r;
        this.TrackPropertyRead(46);
        return __r;
    }
    TArray<FEUIModelContainer> GetModify_FilteredFashionItems() property
    {
        TArray<FEUIModelContainer> __r;
        this.MarkPropertyDirty(46);
        return __r;
    }
    void SetFilteredFashionItems(const TArray<FEUIModelContainer> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(46);
        this.m_FilteredFashionItems = __Value;
        return;
    }
    const FEUIModelContainer GetSelectedFashionItem() const property
    {
        const FEUIModelContainer __r;
        this.TrackPropertyRead(47);
        return __r;
    }
    FEUIModelContainer GetModify_SelectedFashionItem() property
    {
        FEUIModelContainer __r;
        this.MarkPropertyDirty(47);
        return __r;
    }
    void SetSelectedFashionItem(const FEUIModelContainer &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(47);
        this.m_SelectedFashionItem = __Value;
        return;
    }
    int GetSelectedFashionItemIndex() const property
    {
        this.TrackPropertyRead(48);
        return this.m_SelectedFashionItemIndex;
    }
    void SetSelectedFashionItemIndex(const int __Value) property
    {
        if (this.m_SelectedFashionItemIndex == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(48);
        this.m_SelectedFashionItemIndex = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_CreatePlayer
{
    UPROPERTY()
    bool HasValidatorConfig;
    UPROPERTY()
    bool HasNicknameValidationError;
    UPROPERTY()
    FText NicknameValidationError;
    UPROPERTY()
    EFashionSlotType SelectedFashionSlotType;
    UPROPERTY()
    TEUIModelRef<FVM_CreatePlayer> Self;


}

namespace FVM_CreatePlayer
{
FVM_CreatePlayer& Create(const UObject ContextObject)
{
    return FVM_CreatePlayer::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_CreatePlayer CreateByManager(const UEUIManagerSubsystem Manager)
{
    FVM_CreatePlayer __r;
    TEUIModelRef<FVM_CreatePlayer> local_6 = TEUIModelRef<FVM_CreatePlayer>(EUIInternal::MakeModelWithManager(Manager, FVM_CreatePlayer::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasPostLoad(true);
    Result.SetbHasBeginDestroy(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(true);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "MaskOpacity";
    local_14.TypeName = "float32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CurrentTitle";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ActivePhaseIndex";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bIsMaleForbid";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "MaleForbidTip";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bIsMaleSelected";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bIsFamaleSelected";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CreatePlayerGender";
    local_14.TypeName = "EGenderType";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "FaceItems";
    local_14.TypeName = "TArray<FEUIModelContainer>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "SelectedFaceItem";
    local_14.TypeName = "FEUIModelContainer";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "FashionSlotTabs";
    local_14.TypeName = "TArray<FEUIModelContainer>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "SelectedFashionSlotTab";
    local_14.TypeName = "FEUIModelContainer";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "FilteredFashionItems";
    local_14.TypeName = "TArray<FEUIModelContainer>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "SelectedFashionItem";
    local_14.TypeName = "FEUIModelContainer";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "HasValidatorConfig";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "HasNicknameValidationError";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "NicknameValidationError";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "SelectedFashionSlotType";
    local_14.TypeName = "EFashionSlotType";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_CreatePlayer>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_CreatePlayer;
    FEUIModelEffectDefine local_20;
    local_20.FunctionName = "RefreshCreatePlayerPhase";
    Result.EffectFunctions.Add(local_20);
    local_20.FunctionName = "RefreshMaleSelected";
    Result.EffectFunctions.Add(local_20);
    local_20.FunctionName = "RefreshFamaleSelected";
    Result.EffectFunctions.Add(local_20);
    local_20.FunctionName = "RefreshSelectedFaceItem";
    Result.EffectFunctions.Add(local_20);
    FEUIModelDirtyDefine local_28;
    local_28.FunctionName = "__RefreshFilteredFashionItems";
    local_28.DirtyFlags.Set(FVM_CreatePlayer::__IndexOf_SelectedFashionSlotTypeIndex());
    Result.DirtyFunctions.Add(local_28);
    local_20.FunctionName = "RefreshSelectedFashionItem";
    Result.EffectFunctions.Add(local_20);
    FEUIModelMsgHandleDefine local_38;
    local_38.FunctionName = "__HandleCreatePlayerFailed";
    local_38.MessageTypeName = "Msg_CreatePlayerFailed";
    local_38.SourcePropertyModelRefs = FBitSet64(0);
    Result.MessageHandleFunctions.Add(local_38);
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_CreatePlayer;
}
void __RefreshFilteredFashionItems(FVM_CreatePlayer &inout Model)
{
    Model.RefreshFilteredFashionItems();
    return;
}
void __HandleCreatePlayerFailed(FVM_CreatePlayer &inout Model, const FMsg_CreatePlayerFailed &inout Message)
{
    Model.HandleCreatePlayerFailed(Message);
    return;
}
float32 __UIGetter_MaskOpacity(const FVM_CreatePlayer &inout Model)
{
    return Model.GetMaskOpacity();
}
FText __UIGetter_CurrentTitle(const FVM_CreatePlayer &inout Model)
{
    return Model.GetCurrentTitle();
}
int __UIGetter_ActivePhaseIndex(const FVM_CreatePlayer &inout Model)
{
    return Model.GetActivePhaseIndex();
}
bool __UIGetter_bIsMaleForbid(const FVM_CreatePlayer &inout Model)
{
    return Model.GetbIsMaleForbid();
}
FText __UIGetter_MaleForbidTip(const FVM_CreatePlayer &inout Model)
{
    return Model.GetMaleForbidTip();
}
bool __UIGetter_bIsMaleSelected(const FVM_CreatePlayer &inout Model)
{
    return Model.GetbIsMaleSelected();
}
bool __UIGetter_bIsFamaleSelected(const FVM_CreatePlayer &inout Model)
{
    return Model.GetbIsFamaleSelected();
}
EGenderType __UIGetter_CreatePlayerGender(const FVM_CreatePlayer &inout Model)
{
    return Model.UIGetCreatePlayerGender();
}
TArray<FEUIModelContainer> __UIGetter_FaceItems(const FVM_CreatePlayer &inout Model)
{
    return Model.GetFaceItems();
}
FEUIModelContainer __UIGetter_SelectedFaceItem(const FVM_CreatePlayer &inout Model)
{
    return Model.GetSelectedFaceItem();
}
TArray<FEUIModelContainer> __UIGetter_FashionSlotTabs(const FVM_CreatePlayer &inout Model)
{
    return Model.GetFashionSlotTabs();
}
FEUIModelContainer __UIGetter_SelectedFashionSlotTab(const FVM_CreatePlayer &inout Model)
{
    return Model.GetSelectedFashionSlotTab();
}
TArray<FEUIModelContainer> __UIGetter_FilteredFashionItems(const FVM_CreatePlayer &inout Model)
{
    return Model.GetFilteredFashionItems();
}
FEUIModelContainer __UIGetter_SelectedFashionItem(const FVM_CreatePlayer &inout Model)
{
    return Model.GetSelectedFashionItem();
}
bool __UIGetter_HasValidatorConfig(const FVM_CreatePlayer &inout Model)
{
    return Model.HasValidatorConfig();
}
bool __UIGetter_HasNicknameValidationError(const FVM_CreatePlayer &inout Model)
{
    return Model.HasNicknameValidationError();
}
FText __UIGetter_NicknameValidationError(const FVM_CreatePlayer &inout Model)
{
    return Model.GetNicknameValidationError();
}
EFashionSlotType __UIGetter_SelectedFashionSlotType(const FVM_CreatePlayer &inout Model)
{
    return Model.GetSelectedFashionSlotType();
}
TEUIModelRef<FVM_CreatePlayer> __UIGetter_Self(const FVM_CreatePlayer &inout Model)
{
    return TEUIModelRef<FVM_CreatePlayer>(Model);
}
int __IndexOf_Configs()
{
    return 0;
}
int __IndexOf_MaskOpacity()
{
    return 1;
}
int __IndexOf_MaskElapsed()
{
    return 2;
}
int __IndexOf_bMaskActive()
{
    return 3;
}
int __IndexOf_ShowcaseConfigIndex()
{
    return 4;
}
int __IndexOf_ShowcaseUniqueID()
{
    return 5;
}
int __IndexOf_bShowcaseLoaded()
{
    return 6;
}
int __IndexOf_CachedLightActors()
{
    return 7;
}
int __IndexOf_CachedLightActorTags()
{
    return 8;
}
int __IndexOf_bPhaseLightActorsReady()
{
    return 9;
}
int __IndexOf_CurrentTitle()
{
    return 10;
}
int __IndexOf_ActivePhaseIndex()
{
    return 11;
}
int __IndexOf_ActivePhaseOrder()
{
    return 12;
}
int __IndexOf_PhaseOrderCursor()
{
    return 13;
}
int __IndexOf_CreatePlayerPhase()
{
    return 14;
}
int __IndexOf_bConfirmLocked()
{
    return 15;
}
int __IndexOf_bCreateRequestInFlight()
{
    return 16;
}
int __IndexOf_CreateRequestElapsed()
{
    return 17;
}
int __IndexOf_LoginSettings()
{
    return 18;
}
int __IndexOf_CreatePlayerConfig()
{
    return 19;
}
int __IndexOf_TipsLocalPlayer()
{
    return 20;
}
int __IndexOf_bIsMaleForbid()
{
    return 21;
}
int __IndexOf_MaleForbidTip()
{
    return 22;
}
int __IndexOf_bIsMaleSelected()
{
    return 23;
}
int __IndexOf_bIsFamaleSelected()
{
    return 24;
}
int __IndexOf_bGenderSelected()
{
    return 25;
}
int __IndexOf_CreatePlayerGender()
{
    return 26;
}
int __IndexOf_InputNickname()
{
    return 27;
}
int __IndexOf_StringValidationHelper()
{
    return 28;
}
int __IndexOf_bHasNameValidatorConfig()
{
    return 29;
}
int __IndexOf_LastNicknameValidationTipsDedupeKey()
{
    return 30;
}
int __IndexOf_SelectedFaceID()
{
    return 31;
}
int __IndexOf_SelectedHairID()
{
    return 32;
}
int __IndexOf_SelectedUpperID()
{
    return 33;
}
int __IndexOf_SelectedLowerID()
{
    return 34;
}
int __IndexOf_SelectedSuitID()
{
    return 35;
}
int __IndexOf_FaceItems()
{
    return 36;
}
int __IndexOf_SelectedFaceItem()
{
    return 37;
}
int __IndexOf_SelectedFaceItemIndex()
{
    return 38;
}
int __IndexOf_AllAvailableFashions()
{
    return 39;
}
int __IndexOf_AllFashionItems()
{
    return 40;
}
int __IndexOf_AvailableFashionSlotTypes()
{
    return 41;
}
int __IndexOf_FashionSlotTabs()
{
    return 42;
}
int __IndexOf_SelectedFashionSlotTab()
{
    return 43;
}
int __IndexOf_SelectedFashionSlotTypeIndex()
{
    return 44;
}
int __IndexOf_FilteredFashions()
{
    return 45;
}
int __IndexOf_FilteredFashionItems()
{
    return 46;
}
int __IndexOf_SelectedFashionItem()
{
    return 47;
}
int __IndexOf_SelectedFashionItemIndex()
{
    return 48;
}
}
namespace __GeneratedProperties_FVM_CreatePlayer
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
