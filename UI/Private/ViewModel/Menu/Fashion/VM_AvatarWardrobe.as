
const int AVATAR_WARDROBE_CLOTH_OVERVIEW_SHOWCASE_CONFIG_INDEX = 0;
const int AVATAR_WARDROBE_PENDING_NAV_NONE = 0;
const int AVATAR_WARDROBE_PENDING_NAV_MAIN_TAB = 1;
const int AVATAR_WARDROBE_PENDING_NAV_OVERVIEW = 2;
namespace FVM_AvatarWardrobeSlotItem
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature HandleClicked = FEUIModelCallbackSignature();
}
namespace FVM_AvatarWardrobeFashionOption
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature HandleClicked = FEUIModelCallbackSignature();
}
namespace FVM_AvatarMainWardrobe
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature HandleSlotTabSelected = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature HandleMainTabSelected = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature HandleHighFashionOptionSelected = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature HandleTileFashionOptionSelected = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature HandleReturnConfirmAnswer = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature OnSaveOutfitAction = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature OnEquipAction = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature OnUnEquipAction = FEUIModelCallbackSignature();
}
namespace FVM_AvatarWardrobeEntrance
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature HandleWardrobeClicked = FEUIModelCallbackSignature();

}
struct FMsg_AvatarWardrobeRedDotChanged : FEUIMessage
{
    UPROPERTY()
    uint FashionId = 0;


}

struct FVM_AvatarWardrobeSlotItem : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    EFashionSlotType m_SlotType;
    UPROPERTY()
    EFashionSlotSubTab m_SlotSubTab;
    UPROPERTY()
    int m_SlotIndex;
    UPROPERTY()
    FText m_SlotTitle;
    UPROPERTY()
    FSoftBrush m_SlotIcon;
    UPROPERTY()
    FEUIModelWeakRef m_OwnerWardrobe;

    FVM_AvatarWardrobeSlotItem()
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    FVM_AvatarWardrobeSlotItem(const FVM_AvatarWardrobeSlotItem &inout Other)
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    FVM_AvatarWardrobeSlotItem& opAssign(const FVM_AvatarWardrobeSlotItem &inout Other)
    {
        this.m_SlotType = Other.m_SlotType;
        this.m_SlotSubTab = Other.m_SlotSubTab;
        this.m_SlotIndex = int(Other.m_SlotIndex);
        this.m_SlotTitle = Other.m_SlotTitle;
        this.m_SlotIcon = Other.m_SlotIcon;
        return Other.m_OwnerWardrobe;
    }
    void Setup(FVM_AvatarMainWardrobe &inout InOwner, const EFashionSlotType InSlotType, const EFashionSlotSubTab InSlotSubTab, const int InSlotIndex)
    {
        FEUIModelRef local_4;
        this.SetOwnerWardrobe(FEUIModelWeakRef(local_4));
        this.SetSlotType(EFashionSlotType(InSlotType));
        this.SetSlotSubTab(EFashionSlotSubTab(InSlotSubTab));
        this.SetSlotIndex(InSlotIndex);
        this.SetSlotTitle(::FashionSettings::GetFashionSlotName(this.GetSlotType()));
        this.SetSlotIcon(::FashionSettings::GetSlotIcon(this.GetSlotType()));
        return;
    }
    void HandleClicked()
    {
        bool local_5;
        if (!(this.GetOwnerWardrobe().AsRef().IsValid()))
        {
            local_5 = false;
        }
        else
        {
            FEUIModelRef::IsA local_10;
            local_5 = local_10.opCall();
        }
        if (local_5)
        {
            int local_17 = int(this.GetSlotSubTab());
            int local_18 = int(this.GetSlotType());
            Get local_16;
            local_16.opCall().EnterSelectionMode();
        }
        return;
    }
    EFashionSlotType GetSlotType() const property
    {
        this.TrackPropertyRead(0);
        return this.m_SlotType;
    }
    void SetSlotType(const EFashionSlotType __Value) property
    {
        if (int(this.m_SlotType) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_SlotType = __Value;
        return;
    }
    EFashionSlotSubTab GetSlotSubTab() const property
    {
        this.TrackPropertyRead(1);
        return this.m_SlotSubTab;
    }
    void SetSlotSubTab(const EFashionSlotSubTab __Value) property
    {
        if (int(this.m_SlotSubTab) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_SlotSubTab = __Value;
        return;
    }
    int GetSlotIndex() const property
    {
        this.TrackPropertyRead(2);
        return this.m_SlotIndex;
    }
    void SetSlotIndex(const int __Value) property
    {
        if (this.m_SlotIndex == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_SlotIndex = __Value;
        return;
    }
    const FText GetSlotTitle() const property
    {
        const FText __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    FText GetModify_SlotTitle() property
    {
        FText __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetSlotTitle(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_SlotTitle = __Value;
        return;
    }
    const FSoftBrush GetSlotIcon() const property
    {
        const FSoftBrush __r;
        this.TrackPropertyRead(4);
        return __r;
    }
    FSoftBrush GetModify_SlotIcon() property
    {
        FSoftBrush __r;
        this.MarkPropertyDirty(4);
        return __r;
    }
    void SetSlotIcon(const FSoftBrush &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_SlotIcon = __Value;
        return;
    }
    const FEUIModelWeakRef GetOwnerWardrobe() const property
    {
        const FEUIModelWeakRef __r;
        this.TrackPropertyRead(5);
        return __r;
    }
    FEUIModelWeakRef GetModify_OwnerWardrobe() property
    {
        FEUIModelWeakRef __r;
        this.MarkPropertyDirty(5);
        return __r;
    }
    void SetOwnerWardrobe(const FEUIModelWeakRef &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_OwnerWardrobe = __Value;
        return;
    }
}

struct FVM_AvatarWardrobeFashionOption : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    EFashionSlotType m_SlotType;
    UPROPERTY()
    EFashionSlotSubTab m_SlotSubTab;
    UPROPERTY()
    bool m_bIsUnequipOption;
    UPROPERTY()
    TDataObjectPtr<FFashionConfig> m_FashionConfig;
    UPROPERTY()
    FEUIModelWeakRef m_OwnerWardrobe;

    FVM_AvatarWardrobeFashionOption()
    {
        this.m_SlotType = EFashionSlotType(0);
        this.m_SlotSubTab = EFashionSlotSubTab(0);
        this.m_bIsUnequipOption = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVM_AvatarWardrobeFashionOption(const FVM_AvatarWardrobeFashionOption &inout Other)
    {
        this.m_SlotType = EFashionSlotType(0);
        this.m_SlotSubTab = EFashionSlotSubTab(0);
        this.m_bIsUnequipOption = false;
        this.m_SlotType = Other.m_SlotType;
        this.m_SlotSubTab = Other.m_SlotSubTab;
        this.m_bIsUnequipOption = Other.m_bIsUnequipOption;
        this.m_FashionConfig = Other.m_FashionConfig;
        this.m_OwnerWardrobe = Other.m_OwnerWardrobe;
        return;
    }
    FVM_AvatarWardrobeFashionOption& opAssign(const FVM_AvatarWardrobeFashionOption &inout Other)
    {
        this.m_SlotType = Other.m_SlotType;
        this.m_SlotSubTab = Other.m_SlotSubTab;
        this.m_bIsUnequipOption = Other.m_bIsUnequipOption;
        this.m_FashionConfig = Other.m_FashionConfig;
        return Other.m_OwnerWardrobe;
    }
    void Setup(FVM_AvatarMainWardrobe &inout InOwner, const EFashionSlotType InSlotType, const EFashionSlotSubTab InSlotSubTab, const TDataObjectPtr<FFashionConfig> &inout InFashionConfig, const bool bInUnequipOption)
    {
        FEUIModelRef local_4;
        this.SetOwnerWardrobe(FEUIModelWeakRef(local_4));
        this.SetSlotType(EFashionSlotType(InSlotType));
        this.SetSlotSubTab(EFashionSlotSubTab(InSlotSubTab));
        this.SetFashionConfig(InFashionConfig);
        this.SetbIsUnequipOption(bInUnequipOption);
        return;
    }
    void HandleClicked()
    {
        bool local_5;
        if (!(this.GetOwnerWardrobe().AsRef().IsValid()))
        {
            local_5 = false;
        }
        else
        {
            FEUIModelRef::IsA local_10;
            local_5 = local_10.opCall();
        }
        if (local_5)
        {
            Get local_16;
            local_16.opCall().HandleFashionOptionClicked(this);
        }
        return;
    }
    EFashionSlotType GetSlotType() const property
    {
        this.TrackPropertyRead(0);
        return this.m_SlotType;
    }
    void SetSlotType(const EFashionSlotType __Value) property
    {
        if (int(this.m_SlotType) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_SlotType = __Value;
        return;
    }
    EFashionSlotSubTab GetSlotSubTab() const property
    {
        this.TrackPropertyRead(1);
        return this.m_SlotSubTab;
    }
    void SetSlotSubTab(const EFashionSlotSubTab __Value) property
    {
        if (int(this.m_SlotSubTab) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_SlotSubTab = __Value;
        return;
    }
    bool GetbIsUnequipOption() const property
    {
        this.TrackPropertyRead(2);
        return this.m_bIsUnequipOption;
    }
    void SetbIsUnequipOption(const bool __Value) property
    {
        if (!(this.m_bIsUnequipOption) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_bIsUnequipOption = __Value;
        return;
    }
    const TDataObjectPtr<FFashionConfig> GetFashionConfig() const property
    {
        const TDataObjectPtr<FFashionConfig> __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    TDataObjectPtr<FFashionConfig> GetModify_FashionConfig() property
    {
        TDataObjectPtr<FFashionConfig> __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetFashionConfig(const TDataObjectPtr<FFashionConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_FashionConfig = __Value;
        return;
    }
    const FEUIModelWeakRef GetOwnerWardrobe() const property
    {
        const FEUIModelWeakRef __r;
        this.TrackPropertyRead(4);
        return __r;
    }
    FEUIModelWeakRef GetModify_OwnerWardrobe() property
    {
        FEUIModelWeakRef __r;
        this.MarkPropertyDirty(4);
        return __r;
    }
    void SetOwnerWardrobe(const FEUIModelWeakRef &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_OwnerWardrobe = __Value;
        return;
    }
}

struct FVM_AvatarMainWardrobe : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TEUIModelRef<FVM_AvatarInfo> m_EditingAvatar;
    UPROPERTY()
    TEUIModelRef<FVM_AvatarShowcase> m_Showcase;
    UPROPERTY()
    int m_ContentSwitcherIndex;
    UPROPERTY()
    int m_ListSwitcherIndex;
    UPROPERTY()
    int m_SelectedSlotIndex;
    UPROPERTY()
    EFashionSlotType m_SelectedSlotType;
    UPROPERTY()
    EFashionSlotSubTab m_SelectedSlotSubTab;
    UPROPERTY()
    EFashionSlotMainTab m_CurrentMainTab;
    UPROPERTY()
    TArray<FEUIModelContainer> m_MainTabItems;
    UPROPERTY()
    FEUIModelContainer m_SelectedMainTabItem;
    UPROPERTY()
    FText m_PageTitleText;
    UPROPERTY()
    FText m_WardrobeGroupTitleText;
    UPROPERTY()
    FText m_OrnamentGroupTitleText;
    UPROPERTY()
    bool m_bHasWardrobeGroupSlots;
    UPROPERTY()
    bool m_bHasOrnamentGroupSlots;
    UPROPERTY()
    TArray<FEUIDynamicWidgetData> m_ClothSlotEntryDataList;
    UPROPERTY()
    TArray<FEUIModelContainer> m_OrnamentSlotItems;
    UPROPERTY()
    TArray<FEUIModelContainer> m_HighFashionItems;
    UPROPERTY()
    FEUIModelContainer m_SelectedHighFashionItem;
    UPROPERTY()
    TArray<FEUIModelContainer> m_TileFashionItems;
    UPROPERTY()
    FEUIModelContainer m_SelectedTileFashionItem;
    UPROPERTY()
    TArray<FEUIModelContainer> m_SelectionTabItems;
    UPROPERTY()
    FEUIModelContainer m_SelectedSlotTabItem;
    UPROPERTY()
    TEUIModelRef<FVM_CommonDisplayDetail> m_SelectedDisplayDetail;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_AvatarWardrobeSlotItem>> m_ClothSlotModels;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_AvatarWardrobeSlotItem>> m_OrnamentSlotModels;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_AvatarWardrobeFashionOption>> m_CurrentFashionOptions;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_CommonTabItem>> m_SlotTabSelectableItems;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_CommonTabItem>> m_MainTabSelectableItems;
    UPROPERTY()
    EFashionSlotType m_ClothSavedSlotType;
    UPROPERTY()
    EFashionSlotSubTab m_ClothSavedSlotSubTab;
    UPROPERTY()
    bool m_bHasClothSavedSlot;
    UPROPERTY()
    EFashionSlotType m_MountSavedSlotType;
    UPROPERTY()
    EFashionSlotSubTab m_MountSavedSlotSubTab;
    UPROPERTY()
    bool m_bHasMountSavedSlot;
    UPROPERTY()
    FAvatarFashion m_PreviewFashion;
    UPROPERTY()
    FAvatarFashion m_OriginalFashion;
    UPROPERTY()
    bool m_bHasOriginalFashion;
    UPROPERTY()
    bool m_bPreviewInitialized;
    UPROPERTY()
    bool m_bPreviewAppliedToFashionModel;
    UPROPERTY()
    uint m_PreviewMountID;
    UPROPERTY()
    uint m_PreviewMountDecoID;
    UPROPERTY()
    bool m_bHasPreviewMountOverride;
    UPROPERTY()
    bool m_bIsFashionMountUnlocked;
    UPROPERTY()
    bool m_bHasSelectedFashionOptionInCurrentList;
    UPROPERTY()
    bool m_bHasProcessedBoundFashionOptionSelection;
    UPROPERTY()
    EFashionSlotType m_ProcessedBoundFashionSlotType;
    UPROPERTY()
    EFashionSlotSubTab m_ProcessedBoundFashionSlotSubTab;
    UPROPERTY()
    bool m_bProcessedBoundFashionIsUnequip;
    UPROPERTY()
    uint m_ProcessedBoundFashionId;
    UPROPERTY()
    int m_ActionStateRevision;
    UPROPERTY()
    int m_PendingNavigationType;
    UPROPERTY()
    EFashionSlotMainTab m_PendingMainTab;

    FVM_AvatarMainWardrobe()
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    FVM_AvatarMainWardrobe(const FVM_AvatarMainWardrobe &inout Other)
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    FVM_AvatarMainWardrobe opAssign(const FVM_AvatarMainWardrobe &inout Other)
    {
        FVM_AvatarMainWardrobe __r;
        this.m_EditingAvatar = Other.m_EditingAvatar;
        this.m_Showcase = Other.m_Showcase;
        this.m_ContentSwitcherIndex = int(Other.m_ContentSwitcherIndex);
        this.m_ListSwitcherIndex = int(Other.m_ListSwitcherIndex);
        this.m_SelectedSlotIndex = int(Other.m_SelectedSlotIndex);
        this.m_SelectedSlotType = Other.m_SelectedSlotType;
        this.m_SelectedSlotSubTab = Other.m_SelectedSlotSubTab;
        this.m_CurrentMainTab = Other.m_CurrentMainTab;
        this.m_MainTabItems = Other.m_MainTabItems;
        this.m_SelectedMainTabItem = Other.m_SelectedMainTabItem;
        this.m_PageTitleText = Other.m_PageTitleText;
        this.m_WardrobeGroupTitleText = Other.m_WardrobeGroupTitleText;
        this.m_OrnamentGroupTitleText = Other.m_OrnamentGroupTitleText;
        this.m_bHasWardrobeGroupSlots = Other.m_bHasWardrobeGroupSlots;
        this.m_bHasOrnamentGroupSlots = Other.m_bHasOrnamentGroupSlots;
        this.m_ClothSlotEntryDataList = Other.m_ClothSlotEntryDataList;
        this.m_OrnamentSlotItems = Other.m_OrnamentSlotItems;
        this.m_HighFashionItems = Other.m_HighFashionItems;
        this.m_SelectedHighFashionItem = Other.m_SelectedHighFashionItem;
        this.m_TileFashionItems = Other.m_TileFashionItems;
        this.m_SelectedTileFashionItem = Other.m_SelectedTileFashionItem;
        this.m_SelectionTabItems = Other.m_SelectionTabItems;
        this.m_SelectedSlotTabItem = Other.m_SelectedSlotTabItem;
        this.m_SelectedDisplayDetail = Other.m_SelectedDisplayDetail;
        this.m_ClothSlotModels = Other.m_ClothSlotModels;
        this.m_OrnamentSlotModels = Other.m_OrnamentSlotModels;
        this.m_CurrentFashionOptions = Other.m_CurrentFashionOptions;
        this.m_SlotTabSelectableItems = Other.m_SlotTabSelectableItems;
        this.m_MainTabSelectableItems = Other.m_MainTabSelectableItems;
        this.m_ClothSavedSlotType = Other.m_ClothSavedSlotType;
        this.m_ClothSavedSlotSubTab = Other.m_ClothSavedSlotSubTab;
        this.m_bHasClothSavedSlot = Other.m_bHasClothSavedSlot;
        this.m_MountSavedSlotType = Other.m_MountSavedSlotType;
        this.m_MountSavedSlotSubTab = Other.m_MountSavedSlotSubTab;
        this.m_bHasMountSavedSlot = Other.m_bHasMountSavedSlot;
        this.m_bHasOriginalFashion = Other.m_bHasOriginalFashion;
        this.m_bPreviewInitialized = Other.m_bPreviewInitialized;
        this.m_bPreviewAppliedToFashionModel = Other.m_bPreviewAppliedToFashionModel;
        this.m_PreviewMountID = int(Other.m_PreviewMountID);
        this.m_PreviewMountDecoID = int(Other.m_PreviewMountDecoID);
        this.m_bHasPreviewMountOverride = Other.m_bHasPreviewMountOverride;
        this.m_bIsFashionMountUnlocked = Other.m_bIsFashionMountUnlocked;
        this.m_bHasSelectedFashionOptionInCurrentList = Other.m_bHasSelectedFashionOptionInCurrentList;
        this.m_bHasProcessedBoundFashionOptionSelection = Other.m_bHasProcessedBoundFashionOptionSelection;
        this.m_ProcessedBoundFashionSlotType = Other.m_ProcessedBoundFashionSlotType;
        this.m_ProcessedBoundFashionSlotSubTab = Other.m_ProcessedBoundFashionSlotSubTab;
        this.m_bProcessedBoundFashionIsUnequip = Other.m_bProcessedBoundFashionIsUnequip;
        this.m_ProcessedBoundFashionId = int(Other.m_ProcessedBoundFashionId);
        this.m_ActionStateRevision = int(Other.m_ActionStateRevision);
        this.m_PendingNavigationType = int(Other.m_PendingNavigationType);
        this.m_PendingMainTab = Other.m_PendingMainTab;
        return __r;
    }
    void SetCurrentShowcase(const TEUIModelRef<FVM_AvatarShowcase> &inout InShowcase)
    {
        this.SetShowcase(InShowcase);
        this.EnsurePreviewInitialized();
        this.ResetMountPreviewFromFact();
        this.RefreshFashionMountUnlockState();
        this.SetCurrentMainTab(EFashionSlotMainTab(0));
        this.SetContentSwitcherIndex(0);
        this.RefreshAllWardrobeData();
        this.RefreshShowcaseAvatar(true);
        this.ApplyCurrentWardrobeShowcaseConfig();
        return;
    }
    void BeginDestroy()
    {
        this.RestoreOriginalFashionModel();
        return;
    }
    void EnterSelectionMode(const EFashionSlotType SlotType, const EFashionSlotSubTab SlotSubTab)
    {
        this.EnsurePreviewInitialized();
        this.SetContentSwitcherIndex(1);
        this.SetSelectedSlotType(EFashionSlotType(SlotType));
        this.SetSelectedSlotSubTab(EFashionSlotSubTab(SlotSubTab));
        int local_4 = int(SlotSubTab) == 0 ? 0 : 1;
        this.SetListSwitcherIndex(local_4);
        this.SetSelectedSlotIndex(this.FindCombinedSlotIndex(EFashionSlotType(SlotType), EFashionSlotSubTab(SlotSubTab)));
        this.SaveCurrentMainTabSelection();
        this.ApplySelectedSlotShowcaseConfig();
        if (this.GetSelectionTabItems().Num() == 0 || !(this.GetSelectionTabItems().IsValidIndex(this.GetSelectedSlotIndex())))
        {
            this.RefreshSelectionTabs();
        }
        else
        {
            this.SetSelectedSlotTabItem(this.GetSelectionTabItems()[this.GetSelectedSlotIndex()]);
        }
        this.RefreshFashionOptionList();
        this.RefreshWardrobeTextState();
        this.RefreshShowcaseAvatar(true);
        return;
    }
    void HandleSlotTabSelected(const int Index)
    {
        if (this.GetContentSwitcherIndex() != 1)
        {
            return;
        }
        EFashionSlotType local_4 = EFashionSlotType(0);
        EFashionSlotSubTab local_6 = EFashionSlotSubTab(0);
        if (!(this.ResolveCombinedSlot(Index, local_4, local_6)))
        {
            return;
        }
        if (int(local_4) == int(this.GetSelectedSlotType()) && (int(local_6) == int(this.GetSelectedSlotSubTab())))
        {
            this.SetSelectedSlotIndex(Index);
            FEUIModelContainer local_36;
            if (this.GetSelectionTabItems().IsValidIndex(Index))
            {
                local_36 = this.GetSelectionTabItems()[Index];
            }
            else
            {
                local_36 = FEUIModelContainer();
            }
            this.SetSelectedSlotTabItem(local_36);
            return;
        }
        this.EnterSelectionMode(EFashionSlotType(local_4), EFashionSlotSubTab(local_6));
        return;
    }
    void HandleMainTabSelected(const int Index)
    {
        int local_4;
        if (Index == 1)
        {
            int local_5;
            local_5 = 1;
            local_4 = local_5;
        }
        else
        {
            int local_5;
            local_5 = 0;
            local_4 = local_5;
        }
        if (!(this.CanShowMainTab(EFashionSlotMainTab(local_4))) || (local_4 == int(this.GetCurrentMainTab())))
        {
            return;
        }
        if (this.HasSaveableUnsavedPreviewForCurrentOperationArea())
        {
            this.SetPendingNavigationType(1);
            this.SetPendingMainTab(EFashionSlotMainTab(local_4));
            this.ShowReturnConfirmDialog();
            this.NotifyActionStateChanged();
            return;
        }
        if (this.HasUnsavedPreviewForCurrentOperationArea())
        {
            this.DiscardCurrentOperationAreaPreview();
        }
        this.SwitchMainTabAfterPreviewHandled(EFashionSlotMainTab(local_4));
        return;
    }
    void RequestMainTabByOffset(const int Offset)
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    void PreviewFashionOption(FVM_AvatarWardrobeFashionOption &inout Option)
    {
        this.EnsurePreviewInitialized();
        if (this.IsMountSlot(Option.GetSlotType()))
        {
            this.ApplyFashionIdToMountPreview(Option.GetSlotType(), this.GetOptionEffectiveFashionId(Option));
            if (!(this.RefreshFashionOptionSelectionState(Option)))
            {
                this.RefreshFashionOptionList();
                this.RefreshShowcaseAvatar(true);
                this.NotifyActionStateChanged();
                return;
            }
            this.RefreshSelectedDisplayDetail();
            this.RefreshShowcaseAvatar(true);
            this.NotifyActionStateChanged();
            return;
        }
        this.ApplyFashionIdToPreview(Option.GetSlotType(), this.GetOptionEffectiveFashionId(Option));
        this.ApplyPreviewToFashionModel();
        if (!(this.RefreshFashionOptionSelectionState(Option)))
        {
            this.RefreshFashionOptionList();
            this.RefreshShowcaseAvatar(true);
            this.NotifyActionStateChanged();
            return;
        }
        this.RefreshSelectedDisplayDetail();
        this.RefreshShowcaseAvatar(true);
        this.NotifyActionStateChanged();
        return;
    }
    void SelectFashionOptionContainer(const FEUIModelContainer &inout Item)
    {
        if (!(TEUIModelRef<FVM_AvatarWardrobeFashionOption>(FEUIModelContainer::GetModel(Item).opCall()).IsValid()))
        {
            return;
        }
        this.ApplyFashionOptionSelection();
        return;
    }
    void HandleHighFashionOptionSelected(const int Index)
    {
        this.HandleFashionOptionSelectedByIndex(Index, true);
        return;
    }
    void HandleTileFashionOptionSelected(const int Index)
    {
        this.HandleFashionOptionSelectedByIndex(Index, false);
        return;
    }
    void RefreshBoundFashionOptionSelection()
    {
        TEUIModelRef<FVM_AvatarWardrobeFashionOption> local_2 = TEUIModelRef<FVM_AvatarWardrobeFashionOption>(FEUIModelContainer::GetModel(this.GetSelectedHighFashionItem()).opCall());
        GetModel local_6 = FEUIModelContainer::GetModel(this.GetSelectedTileFashionItem());
        TEUIModelRef<FVM_AvatarWardrobeFashionOption> local_10 = TEUIModelRef<FVM_AvatarWardrobeFashionOption>(local_6.opCall());
        if (this.GetContentSwitcherIndex() != 1)
        {
            this.ClearProcessedBoundFashionOptionSelection();
            return;
        }
        if (int(this.GetSelectedSlotSubTab()) == 0)
        {
        }
        else
        {
        }
        if (!(TEUIModelRef<FVM_AvatarWardrobeFashionOption>(local_6.opCall()).IsValid()) || !(this.IsFashionOptionInCurrentSelectionContext()))
        {
            this.ClearProcessedBoundFashionOptionSelection();
            return;
        }
        if (this.IsProcessedBoundFashionOptionSelection())
        {
            return;
        }
        this.ApplyFashionOptionSelection();
        return;
    }
    bool SelectFashionOption(FVM_AvatarWardrobeFashionOption &inout Option)
    {
        if (!(this.RefreshFashionOptionSelectionState(Option)))
        {
            return false;
        }
        this.RefreshSelectedDisplayDetail();
        this.NotifyActionStateChanged();
        return true;
    }
    void HandleFashionOptionClicked(FVM_AvatarWardrobeFashionOption &inout Option)
    {
        this.ApplyFashionOptionSelection(Option);
        return;
    }
    void ApplyFashionOptionSelection(FVM_AvatarWardrobeFashionOption &inout Option)
    {
        if (!(this.IsFashionOptionInCurrentSelectionContext(Option)))
        {
            return;
        }
        if (this.IsFashionOptionSelectionNoOp(Option))
        {
            this.MarkProcessedBoundFashionOptionSelection(Option);
            if (this.ConsumeFashionNewRedDot(Option))
            {
                this.RefreshFashionAggregateRedDotsForConsumedOption(Option);
            }
            return;
        }
        if (!(this.SelectFashionOption(Option)))
        {
            return;
        }
        this.MarkProcessedBoundFashionOptionSelection(Option);
        if (this.ConsumeFashionNewRedDot(Option))
        {
            this.RefreshFashionAggregateRedDotsForConsumedOption(Option);
        }
        this.PreviewFashionOption(Option);
        return;
    }
    bool HandleReturnAction()
    {
        if (this.GetContentSwitcherIndex() == 1)
        {
            if (this.HasSaveableUnsavedPreviewForCurrentOperationArea())
            {
                this.SetPendingNavigationType(2);
                this.ShowReturnConfirmDialog();
                return false;
            }
            if (this.HasUnsavedPreviewForCurrentOperationArea())
            {
                this.DiscardCurrentOperationAreaPreview();
            }
            this.ReturnToOverviewAfterPreviewHandled();
            return false;
        }
        return true;
    }
    bool HandleReturnConfirmAnswer(const FCommonDialogAnswer &inout Answer)
    {
        if (int(Answer.OptionIndex) == 0 || (int(Answer.AnswerType) == 0))
        {
            this.ClearPendingNavigation();
            return true;
        }
        if (int(Answer.AnswerType) == 4 || (int(Answer.OptionIndex) == 2) || (int(Answer.AnswerType) == 1))
        {
            this.SaveCurrentOperationAreaPreview();
            this.ExecutePendingNavigation();
            return true;
        }
        this.DiscardCurrentOperationAreaPreview();
        this.ExecutePendingNavigation();
        return true;
    }
    bool CanShowSaveOutfitAction() const
    {
        return this.HasSaveableUnsavedPreviewForCurrentOperationArea();
    }
    void OnSaveOutfitAction()
    {
        this.SaveCurrentOperationAreaPreview();
        return;
    }
    void SaveCurrentOperationAreaPreview()
    {
        this.EnsurePreviewInitialized();
        if (this.IsCurrentOperationAreaMount())
        {
            this.SaveMountPreview();
            return;
        }
        this.SaveClothPreview();
        return;
    }
    bool CanShowEquipAction()
    {
        if (this.GetContentSwitcherIndex() != 1)
        {
            return false;
        }
        TEUIModelRef<FVM_AvatarWardrobeFashionOption> local_8 = this.GetSelectedFashionOption();
        if (!(local_8.IsValid()))
        {
            return false;
        }
        return this.IsFashionOptionWearable() && (this.GetOptionEffectiveFashionId() != this.GetEffectiveFactFashionIdForSlot(EFashionSlotType(GetSlotType())));
    }
    bool CanShowUnEquipAction()
    {
        int local_11 = 0;
        if (this.GetContentSwitcherIndex() != 1 || !(this.IsSelectedSlotAllowUnequip()))
        {
            return false;
        }
        TEUIModelRef<FVM_AvatarWardrobeFashionOption> local_8 = this.GetSelectedFashionOption();
        if (!(local_8.IsValid()))
        {
            return false;
        }
        if (GetbIsUnequipOption())
        {
            return this.IsFashionOptionWearable() && ((this.GetOptionEffectiveFashionId() == this.GetEffectiveFactFashionIdForSlot(EFashionSlotType(GetSlotType()))));
        }
        if (!(GetFashionConfig()))
        {
            return false;
        }
        int local_12 = local_11;
        return local_12 != 0 && ((local_12 == this.GetEffectiveFactFashionIdForSlot(EFashionSlotType(GetSlotType()))));
    }
    int GetCurrentMainTabListIndex() const
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
        int __r; return __r;
    }
    int GetSelectedHighFashionItemIndex() const
    {
        return this.GetHighFashionItems().IndexOfByKey(this.GetSelectedHighFashionItem());
    }
    int GetSelectedTileFashionItemIndex() const
    {
        return this.GetTileFashionItems().IndexOfByKey(this.GetSelectedTileFashionItem());
    }
    ESlateVisibility GetSelectedDisplayDetailVisibility() const
    {
        if (!(this.GetSelectedDisplayDetail().IsValid()))
        {
            return ESlateVisibility(1);
        }
        TEUIModelRef<FVM_CommonDisplayDetail> local_2 = this.GetSelectedDisplayDetail();
        return GetDetailVisibility();
    }
    void OnEquipAction()
    {
        if (!(this.CanShowEquipAction()))
        {
            return;
        }
        this.EnsurePreviewInitialized();
        if (!(this.GetSelectedFashionOption().IsValid()))
        {
            return;
        }
        FAvatarFashion local_18;
        int local_32 = this.GetOptionEffectiveFashionId();
        if (this.IsMountSlot(GetSlotType()))
        {
            this.RequestChangeMountFashion(GetSlotType(), local_32);
            return;
        }
        this.ApplyFashionIdToFashion(local_18, GetSlotType(), local_32);
        ::FMS_FashionModel::Get(this.GetContext().Manager).RequestChangeAvatarFashion(local_18);
        return;
    }
    void OnUnEquipAction()
    {
        if (!(this.CanShowUnEquipAction()))
        {
            return;
        }
        this.EnsurePreviewInitialized();
        int local_4 = this.GetUnequipFashionIdForSlot(this.GetSelectedSlotType());
        if (this.IsMountSlot(this.GetSelectedSlotType()))
        {
            this.RequestChangeMountFashion(this.GetSelectedSlotType(), local_4);
            return;
        }
        FAvatarFashion local_16;
        this.ApplyFashionIdToFashion(local_16, this.GetSelectedSlotType(), local_4);
        ::FMS_FashionModel::Get(this.GetContext().Manager).RequestChangeAvatarFashion(local_16);
        return;
    }
    void ReturnToOverviewAfterPreviewHandled()
    {
        this.SetContentSwitcherIndex(0);
        this.RefreshWardrobeTextState();
        this.RefreshShowcaseAvatar(true);
        this.ApplyCurrentWardrobeShowcaseConfig();
        this.NotifyActionStateChanged();
        return;
    }
    bool HasUnsavedPreviewForCurrentOperationArea() const
    {
        bool local_4;
        if (this.IsCurrentOperationAreaMount())
        {
            local_4 = this.HasUnsavedMountPreview();
        }
        else
        {
            local_4 = this.HasUnsavedClothPreview();
        }
        return local_4;
    }
    bool HasUnsavedClothPreview() const
    {
        TArray<EFashionSlotType> local_4;
        this.CollectConfiguredSlotsForCurrentMainTab(local_4);
        int local_5 = 0;
        for (; local_5 < local_4.Num(); ++local_5)
        {
            if (this.IsMountSlot(EFashionSlotType(local_4[local_5])))
            {
                continue;
            }
            if ((this.GetEffectiveFashionIdFromSnapshot(this.GetPreviewFashion(), EFashionSlotType(local_4[local_5]))) != this.GetEffectiveFashionIdFromSnapshot(this.GetOriginalFashion(), EFashionSlotType(local_4[local_5])))
            {
                return true;
            }
        }
        return false;
    }
    bool HasUnsavedMountPreview() const
    {
        FMS_FashionModel& local_2 = ::FMS_FashionModel::Get(this.GetContext().Manager);
        return this.GetPreviewMountID() != local_2.GetMountID() || (this.GetPreviewMountDecoID() != local_2.GetMountDecoID());
    }
    bool HasSaveableUnsavedPreviewForCurrentOperationArea() const
    {
        bool local_4;
        if (this.IsCurrentOperationAreaMount())
        {
            local_4 = this.HasSaveableUnsavedMountPreview();
        }
        else
        {
            local_4 = this.HasSaveableUnsavedClothPreview();
        }
        return local_4;
    }
    bool HasSaveableUnsavedClothPreview() const
    {
        EFashionSlotType local_9;
        TArray<EFashionSlotType> local_4;
        this.CollectConfiguredSlotsForCurrentMainTab(local_4);
        int local_5 = 0;
        for (; local_5 < local_4.Num(); ++local_5)
        {
            local_9 = local_4[local_5];
            if (this.IsMountSlot(EFashionSlotType(local_9)))
            {
                continue;
            }
            if (this.GetEffectiveFashionIdFromSnapshot(this.GetPreviewFashion()) == this.GetEffectiveFashionIdFromSnapshot(this.GetOriginalFashion()))
            {
                continue;
            }
            if (this.CanSaveFashionIdForSlot(EFashionSlotType(local_9), this.GetFashionIdFromSnapshot(this.GetPreviewFashion())))
            {
                return true;
            }
        }
        return false;
    }
    bool HasSaveableUnsavedMountPreview() const
    {
        FMS_FashionModel& local_2 = ::FMS_FashionModel::Get(this.GetContext().Manager);
        if (this.GetPreviewMountID() != local_2.GetMountID() && this.CanSaveFashionIdForSlot(EFashionSlotType(201), this.GetPreviewMountID()))
        {
            return true;
        }
        if (this.GetPreviewMountDecoID() != local_2.GetMountDecoID() && this.CanSaveFashionIdForSlot(EFashionSlotType(202), this.GetPreviewMountDecoID()))
        {
            return true;
        }
        return false;
    }
    bool IsCurrentOperationAreaMount() const
    {
        return (int(this.GetCurrentMainTab()) == 1);
    }
    bool IsSlotInCurrentOperationArea(const EFashionSlotType SlotType) const
    {
        bool local_1 = (!(this.IsCurrentOperationAreaMount()) == !(this.IsMountSlot(EFashionSlotType(SlotType))));
        return local_1;
    }
    void DiscardCurrentOperationAreaPreview()
    {
        if (this.IsCurrentOperationAreaMount())
        {
            this.ResetMountPreviewFromFact();
            this.RefreshShowcaseAvatar(true);
            this.NotifyActionStateChanged();
            return;
        }
        this.ResetPreviewToOriginalFashion();
        this.RestoreOriginalFashionModel();
        this.RefreshShowcaseAvatar(true);
        this.NotifyActionStateChanged();
        return;
    }
    uint GetEffectivePreviewFashionIdForSlotIncludingMount(const EFashionSlotType SlotType) const
    {
        if (int(SlotType) == -55)
        {
            return this.GetPreviewMountID();
        }
        if (int(SlotType) == -54)
        {
            return this.GetPreviewMountDecoID();
        }
        return this.GetEffectivePreviewFashionIdForSlot(EFashionSlotType(SlotType));
    }
    void SaveClothPreview()
    {
        EFashionSlotType local_34;
        FAvatarFashion local_12;
        bool local_25 = false;
        TArray<EFashionSlotType> local_30 = TArray<EFashionSlotType>();
        this.CollectConfiguredSlotsForCurrentMainTab(local_30);
        int local_31 = 0;
        for (; local_31 < local_30.Num(); ++local_31)
        {
            local_34 = local_30[local_31];
            if (this.IsMountSlot(EFashionSlotType(local_34)))
            {
                continue;
            }
            if (this.CanSaveFashionIdForSlot(EFashionSlotType(local_34), this.GetFashionIdFromSnapshot(this.GetPreviewFashion())))
            {
                continue;
            }
            this.SetFashionIdInSnapshotRaw(local_12, EFashionSlotType(local_34), this.GetFashionIdFromSnapshot(this.GetOriginalFashion()));
            local_25 = true;
        }
        if (local_25)
        {
            this.CopyFashionToPreview(local_12);
            this.ApplyPreviewToFashionModel();
            this.ShowPartialLockedOutfitNotSavedTips();
            if (!(this.RefreshCurrentFashionOptionRuntimeStates()))
            {
                this.RefreshFashionOptionList();
            }
            this.RefreshShowcaseAvatar(true);
        }
        local_12.NormalizeForChangeAvatarFashionReq();
        ::FMS_FashionModel::Get(this.GetContext().Manager).RequestChangeAvatarFashion(local_12);
        this.NotifyActionStateChanged();
        return;
    }
    void SaveMountPreview()
    {
        FMS_FashionModel& local_2 = ::FMS_FashionModel::Get(this.GetContext().Manager);
        int local_3 = this.GetPreviewMountID();
        int local_5 = this.GetPreviewMountDecoID();
        bool local_6 = false;
        if (!(this.CanSaveFashionIdForSlot(EFashionSlotType(201), local_3)))
        {
            local_3 = local_2.GetMountID();
            local_6 = true;
        }
        if (!(this.CanSaveFashionIdForSlot(EFashionSlotType(202), local_5)))
        {
            local_5 = local_2.GetMountDecoID();
            local_6 = true;
        }
        if (local_6)
        {
            this.SetPreviewMountID(local_3);
            this.SetPreviewMountDecoID(local_5);
            this.SetbHasPreviewMountOverride(this.HasUnsavedMountPreview());
            this.ShowPartialLockedOutfitNotSavedTips();
            if (!(this.RefreshCurrentFashionOptionRuntimeStates()))
            {
                this.RefreshFashionOptionList();
            }
            this.RefreshShowcaseAvatar(true);
        }
        local_2.RequestChangeMount(local_3, local_5);
        this.NotifyActionStateChanged();
        return;
    }
    bool CanSaveFashionIdForSlot(const EFashionSlotType SlotType, const uint FashionId) const
    {
        if (FashionId == 0 || (FashionId == this.GetDefaultFashionIdForSlot(EFashionSlotType(SlotType))))
        {
            return true;
        }
        TDataObjectPtr<FFashionConfig> local_52 = ::FFashionConfig::GetByDataId(FashionId);
        if ((!(local_52) || (0 != int(SlotType))))
        {
            return false;
        }
        return this.IsFashionConfigUnlocked(local_52);
    }
    void ShowPartialLockedOutfitNotSavedTips()
    {
        FCommonTipsParam local_8;
        ::CommonPopup::Tips(NSLOCTEXT("AvatarWardrobe_PartialLockedOutfitNotSaved", "йѓЁе€†жњЄи§Јй”Ѓе¤–и§‚жњЄдїќе­гЂ‚"), local_8);
        return;
    }
    void SwitchMainTabAfterPreviewHandled(const EFashionSlotMainTab NewMainTab)
    {
        this.SaveCurrentMainTabSelection();
        this.SetCurrentMainTab(EFashionSlotMainTab(NewMainTab));
        this.RestoreSavedMainTabSelectionOrDefault();
        this.RefreshAllWardrobeData();
        this.RefreshShowcaseAvatar(true);
        this.ApplyCurrentWardrobeShowcaseConfig();
        this.NotifyActionStateChanged();
        return;
    }
    void ExecutePendingNavigation()
    {
        int local_1;
        int local_3;
        local_1 = this.GetPendingNavigationType();
        local_3 = int(this.GetPendingMainTab());
        this.ClearPendingNavigation();
        if (local_1 == 1)
        {
            this.SwitchMainTabAfterPreviewHandled(EFashionSlotMainTab(local_3));
            return;
        }
        if (local_1 == 2)
        {
            this.ReturnToOverviewAfterPreviewHandled();
        }
        return;
    }
    void ClearPendingNavigation()
    {
        this.SetPendingNavigationType(0);
        this.SetPendingMainTab(this.GetCurrentMainTab());
        this.NotifyActionStateChanged();
        return;
    }
    void NotifyActionStateChanged()
    {
        this.SetActionStateRevision((this.GetActionStateRevision() + 1));
        return;
    }
    uint GetFashionIdFromSnapshot(const FAvatarFashion &inout Fashion, const EFashionSlotType SlotType) const
    {
        int local_3 = 0;
        switch (int(SlotType))
        {
        case 1:
        {
            return int(Fashion.HairID);
        }
        case 2:
        {
            return int(Fashion.TopID);
        }
        case 3:
        {
            return int(Fashion.BottomID);
        }
        case 4:
        {
            return int(Fashion.SuitID);
        }
        case 5:
        {
            return int(Fashion.BathrobeTopID);
        }
        case 6:
        {
            return int(Fashion.BathrobeBottomID);
        }
        default:
        {
            if (::DisplayItemAdapter_Fashion::IsFashionDecoSlot(EFashionSlotType(SlotType)))
            {
                for (auto& local_18 : Fashion.Decos)
                {
                    if (int(local_18.SlotType) == int(SlotType))
                    {
                        return int(local_18.FashionID);
                    }
                }
            }
            local_3 = 0;
        }
        }
        return local_3;
    }
    uint GetEffectiveFashionIdFromSnapshot(const FAvatarFashion &inout Fashion, const EFashionSlotType SlotType) const
    {
        int local_4;
        int local_2 = this.GetFashionIdFromSnapshot(Fashion, EFashionSlotType(SlotType));
        if (local_2 > 0)
        {
            local_4 = local_2;
        }
        else
        {
            local_4 = this.GetDefaultFashionIdForSlot(EFashionSlotType(SlotType));
        }
        return local_4;
    }
    void SetFashionIdInSnapshotRaw(FAvatarFashion &inout InOutFashion, const EFashionSlotType SlotType, const uint FashionId)
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    void ShowReturnConfirmDialog()
    {
        bool local_18;
        UCommonPopupSettings local_4 = ::CommonPopupSettings::Get();
        FEUIInputAction local_10;
        FEUIInputAction local_16;
        if (!(local_4.CommonDialogAction.Find(ECommonDialogAnswerType(3), local_10)))
        {
            local_18 = false;
        }
        else
        {
            local_18 = local_4.CommonDialogAction.Find(ECommonDialogAnswerType(4), local_16);
        }
        local_18 = !local_18;
        if (local_18)
        {
            return;
        }
        FEUIInputAction local_26;
        if (!(local_4.CommonDialogAction.Find(ECommonDialogAnswerType(0), local_26)))
        {
            FEUIInputAction local_32;
            if (!(local_4.CommonDialogAction.Find(ECommonDialogAnswerType(2), local_32)))
            {
                return;
            }
            local_26 = local_32;
        }
        TArray<FCommonDialogOption> local_36;
        FText local_52;
        local_36.Add(FCommonDialogOption(ECommonDialogAnswerType(0), local_26, local_52));
        local_36.Add(FCommonDialogOption(ECommonDialogAnswerType(3), local_10, local_52));
        local_36.Add(FCommonDialogOption(ECommonDialogAnswerType(4), local_16, local_52));
        FDialogModelCallback local_80;
        local_80.Bind(this, FVM_AvatarMainWardrobe::HandleReturnConfirmAnswer);
        FDialogCallback local_112 = FDialogCallback(local_80);
        local_52 = ::FashionSettings::GetReturnConfirmMessage();
        FText local_116 = ::FashionSettings::GetReturnConfirmTitle();
        FCommonDialogParam local_118;
        ::CommonPopup::Dialog(local_116, local_52, local_36, local_112, local_118);
        return;
    }
    void OnAvatarFashionChanged(const FMsg_AvatarFashionChanged &inout Msg)
    {
        int local_7 = 0;
        bool local_1 = !(this.GetbPreviewInitialized()) || !(this.GetEditingAvatar());
        if (local_1)
        {
            local_1 = true;
        }
        else
        {
            TEUIModelRef<FVM_AvatarInfo> local_4 = this.GetEditingAvatar();
            local_1 = !(GetAvatarConfig());
        }
        if (local_1)
        {
            return;
        }
        TEUIModelRef<FVM_AvatarInfo> local_4_2 = this.GetEditingAvatar();
        if (Msg.AvatarIds.Num() > 0 && !(Msg.AvatarIds.Contains(local_7)))
        {
            return;
        }
        this.SyncOriginalFashionFromModel();
        this.ResetPreviewToOriginalFashion();
        this.ResetMountPreviewFromFact();
        this.RestoreOriginalFashionModel();
        this.RefreshWardrobeDataStateWithoutRebuild();
        this.RefreshShowcaseAvatar(true);
        this.NotifyActionStateChanged();
        return;
    }
    void OnFashionMountChanged(const FMsg_FashionMountChanged &inout Msg)
    {
        this.ResetMountPreviewFromFact();
        this.RefreshWardrobeDataStateWithoutRebuild();
        this.RefreshShowcaseAvatar(true);
        this.NotifyActionStateChanged();
        return;
    }
    void OnSystemUnlockFromGS(const FMsg_SystemUnlockFromGS &inout Msg)
    {
        if (int(Msg.SystemModule) != 117)
        {
            return;
        }
        this.RefreshFashionMountUnlockState();
        this.RefreshAllWardrobeData();
        return;
    }
    void RefreshShowcaseAvatar(const bool bForce = false)
    {
        if (!(this.GetShowcase()))
        {
            return;
        }
        if ((int(this.GetCurrentMainTab())) == 1)
        {
            TArray<FAvatarShowcaseEntry> local_10;
            TEUIModelRef<FVM_AvatarShowcase> local_2 = this.GetShowcase();
            local_10.SetNextAvatarEntries();
            if (bForce)
            {
                TEUIModelRef<FVM_AvatarShowcase> local_2_2 = this.GetShowcase();
                ClearNextMountConfig();
            }
            TDataObjectPtr<FMountFashionConfig> local_34 = this.ResolvePreviewMountShowcaseConfig();
            TEUIModelRef<FVM_AvatarShowcase> local_2_3 = this.GetShowcase();
            local_34.SetNextMountConfig();
            return;
        }
        TEUIModelRef<FVM_AvatarShowcase> local_2_4 = this.GetShowcase();
        ClearNextMountConfig();
        TArray<FAvatarShowcaseEntry> local_38;
        if (this.GetEditingAvatar())
        {
            local_38.Add(::FAvatarShowcaseEntryUtils::FromAvatarInfo(this.GetEditingAvatar()));
        }
        if (bForce)
        {
            TArray<FAvatarShowcaseEntry> local_10;
            TEUIModelRef<FVM_AvatarShowcase> local_2_5 = this.GetShowcase();
            local_10.SetNextAvatarEntries();
        }
        TEUIModelRef<FVM_AvatarShowcase> local_2_6 = this.GetShowcase();
        local_38.SetNextAvatarEntries();
        return;
    }
    void RefreshAllWardrobeData()
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    void RefreshWardrobeDataStateWithoutRebuild()
    {
        this.RefreshFashionAggregateRedDots();
        if (!(this.RefreshOverviewSlotRuntimeStates()) && (this.GetContentSwitcherIndex() == 0))
        {
            this.RefreshOverviewSlots();
        }
        if (!(this.RefreshSelectionTabRuntimeStates()) && (this.GetContentSwitcherIndex() == 1))
        {
            this.RefreshSelectionTabs();
        }
        if (this.GetContentSwitcherIndex() == 1 && !(this.RefreshCurrentFashionOptionRuntimeStates()))
        {
            this.RefreshFashionOptionList();
        }
        this.RefreshWardrobeTextState();
        return;
    }
    FRedDotNodeData MakeFashionNewRedDotNodeData(const uint FashionId) const
    {
        FRedDotNodeData __r;
        int64 local_2 = FashionId;
        FRedDotNodeData local_6 = FRedDotNodeData(GameplayTags::RedDotSystem_Fashion_NewFashion, local_2);
        return __r;
    }
    FRedDotNodeData MakeFashionSlotRedDotNodeData(const EFashionSlotType SlotType) const
    {
        FRedDotNodeData __r;
        FRedDotNodeData local_8 = FRedDotNodeData(GameplayTags::RedDotSystem_Fashion_Slot, int(SlotType));
        return __r;
    }
    uint64 GetFashionMainTabRedDotExtraDataId(const EFashionSlotMainTab MainTab) const
    {
        return (int(MainTab) + 1);
    }
    FRedDotNodeData MakeFashionMainTabRedDotNodeData(const EFashionSlotMainTab MainTab) const
    {
        FRedDotNodeData __r;
        FRedDotNodeData local_6 = FRedDotNodeData(GameplayTags::RedDotSystem_Fashion_MainTab, this.GetFashionMainTabRedDotExtraDataId(EFashionSlotMainTab(MainTab)));
        return __r;
    }
    bool HasFashionNewRedDot(const TDataObjectPtr<FFashionConfig> &inout FashionConfig) const
    {
        bool local_2 = false;
        int local_3 = 0;
        if (!(FashionConfig) || local_2 || !(this.IsFashionConfigUnlocked(FashionConfig)))
        {
            return false;
        }
        return ::FMS_RedDotSystem::Get(this.GetContext().Manager).HasRedDot(this.MakeFashionNewRedDotNodeData(local_3));
    }
    TEUIModelRef<FVM_RedDot> CreateFashionNewRedDotVM(const TDataObjectPtr<FFashionConfig> &inout FashionConfig)
    {
        int local_5 = 0;
        if (!(this.HasFashionNewRedDot(FashionConfig)))
        {
            return TEUIModelRef<FVM_RedDot>();
        }
        return TEUIModelRef<FVM_RedDot>(::FVM_RedDot::Create(this.GetContext().Manager, this.MakeFashionNewRedDotNodeData(local_5)));
    }
    TEUIModelRef<FVM_RedDot> CreateFashionSlotRedDotVM(const EFashionSlotType SlotType)
    {
        return TEUIModelRef<FVM_RedDot>(::FVM_RedDot::Create(this.GetContext().Manager, this.MakeFashionSlotRedDotNodeData(EFashionSlotType(SlotType))));
    }
    TEUIModelRef<FVM_RedDot> CreateFashionMainTabRedDotVM(const EFashionSlotMainTab MainTab)
    {
        return TEUIModelRef<FVM_RedDot>(::FVM_RedDot::Create(this.GetContext().Manager, this.MakeFashionMainTabRedDotNodeData(EFashionSlotMainTab(MainTab))));
    }
    void DisableDisplayItemRedDotAutoConsume(const FVM_DisplayItem &inout DisplayItem)
    {
        ::ItemFeature_RedDot_Util::SetAutoConsumeOnClick(DisplayItem.GetFeature_RedDot().ModelContainer, false);
        return;
    }
    void RefreshFashionAggregateRedDots()
    {
        int local_73 = 0;
        bool local_75;
        int local_81 = 0;
        int local_101 = 0;
        this.ClearFashionAggregateRedDotNodes();
        TArray<EFashionSlotType> local_4;
        this.AppendKnownWardrobeSlotCandidates(local_4);
        TArray<EFashionSlotType> local_8;
        for (auto local_22 : local_4)
        {
            if (!(::FashionSettings::GetSlotConfig(EFashionSlotType(local_22))) || !(this.CanShowMainTab(EFashionSlotMainTab(local_73))))
            {
                continue;
            }
            local_75 = false;
            TArray<TDataObjectPtr<FFashionConfig>> local_80;
            this.CollectFashionConfigsForSlot(EFashionSlotType(local_22), EFashionSlotSubTab(local_81), local_80);
            for (auto& local_96 : local_80)
            {
                if (!(this.HasFashionNewRedDot(local_96)))
                {
                    continue;
                }
                FRedDotNodeData local_106 = this.MakeFashionNewRedDotNodeData(local_101);
                FRedDotNodeData local_100 = this.MakeFashionSlotRedDotNodeData(EFashionSlotType(local_22));
                TEUIModelWeakRef<FM_RedDotNode> local_112 = ::FMS_RedDotSystem::Get(this.GetContext().Manager).TryFindOrAddRedDotNode(local_100);
                if (local_112.IsValid())
                {
                    ::FMS_RedDotSystem::Get(this.GetContext().Manager).GenerateSpecificRedDot(local_100, 1, false);
                    local_106.AddChildNodeData();
                    local_75 = true;
                }
            }
            if (local_75 && !(local_8.Contains(local_22)))
            {
                local_8.Add(local_22);
            }
        }
        for (auto local_22 : local_8)
        {
            if (!(::FashionSettings::GetSlotConfig(EFashionSlotType(local_22))))
            {
                continue;
            }
            FRedDotNodeData local_110 = this.MakeFashionMainTabRedDotNodeData(EFashionSlotMainTab(local_73));
            if (::FMS_RedDotSystem::Get(this.GetContext().Manager).TryFindOrAddRedDotNode(local_110).IsValid())
            {
                ::FMS_RedDotSystem::Get(this.GetContext().Manager).GenerateSpecificRedDot(local_110, 1, false);
                this.MakeFashionSlotRedDotNodeData(EFashionSlotType(local_22)).AddChildNodeData();
            }
        }
        return;
    }
    void RefreshFashionAggregateRedDotsForConsumedOption(FVM_AvatarWardrobeFashionOption &inout Option)
    {
        int local_55 = 0;
        if (!(Option.GetFashionConfig()) || Option.GetbIsUnequipOption())
        {
            return;
        }
        EFashionSlotType local_4 = Option.GetSlotType();
        EFashionSlotType local_3 = local_4;
        if ((int(local_3)) == 0)
        {
            local_3 = local_4;
        }
        if (!(::FashionSettings::GetSlotConfig(EFashionSlotType(local_3))) || !(this.CanShowMainTab(EFashionSlotMainTab(local_55))))
        {
            return;
        }
        this.RefreshFashionSlotAggregateRedDot(EFashionSlotType(local_3));
        this.RefreshFashionMainTabAggregateRedDot(EFashionSlotMainTab(local_55));
        return;
    }
    void RefreshFashionSlotAggregateRedDot(const EFashionSlotType SlotType)
    {
        int local_69 = 0;
        int local_89 = 0;
        if (!(::FashionSettings::GetSlotConfig(EFashionSlotType(SlotType))) || !(this.CanShowMainTab(EFashionSlotMainTab(0))))
        {
            return;
        }
        FRedDotNodeData local_60 = this.MakeFashionSlotRedDotNodeData(EFashionSlotType(SlotType));
        this.ClearFashionAggregateRedDotNode(local_60);
        if (!(::FMS_RedDotSystem::Get(this.GetContext().Manager).TryFindOrAddRedDotNode(local_60).IsValid()))
        {
            return;
        }
        TArray<TDataObjectPtr<FFashionConfig>> local_68;
        this.CollectFashionConfigsForSlot(EFashionSlotType(SlotType), EFashionSlotSubTab(local_69), local_68);
        for (auto& local_84 : local_68)
        {
            if (!(this.HasFashionNewRedDot(local_84)))
            {
                continue;
            }
            FRedDotNodeData local_56 = this.MakeFashionNewRedDotNodeData(local_89);
            ::FMS_RedDotSystem::Get(this.GetContext().Manager).GenerateSpecificRedDot(local_60, 1, false);
            local_56.AddChildNodeData();
        }
        return;
    }
    void RefreshFashionMainTabAggregateRedDot(const EFashionSlotMainTab MainTab)
    {
        int local_81 = 0;
        FRedDotNodeData local_8 = this.MakeFashionMainTabRedDotNodeData(EFashionSlotMainTab(MainTab));
        this.ClearFashionAggregateRedDotNode(local_8);
        if (!(::FMS_RedDotSystem::Get(this.GetContext().Manager).TryFindOrAddRedDotNode(local_8).IsValid()))
        {
            return;
        }
        TArray<EFashionSlotType> local_18;
        this.AppendKnownWardrobeSlotCandidates(local_18);
        for (auto local_31 : local_18)
        {
            if (!(::FashionSettings::GetSlotConfig(EFashionSlotType(local_31))) || (local_81 != int(MainTab)) || !(this.CanShowMainTab(EFashionSlotMainTab(local_81))))
            {
                continue;
            }
            FRedDotNodeData local_4 = this.MakeFashionSlotRedDotNodeData(EFashionSlotType(local_31));
            if (!(::FMS_RedDotSystem::Get(this.GetContext().Manager).HasRedDot(local_4)))
            {
                continue;
            }
            ::FMS_RedDotSystem::Get(this.GetContext().Manager).GenerateSpecificRedDot(local_8, 1, false);
            local_4.AddChildNodeData();
        }
        return;
    }
    void ClearFashionAggregateRedDotNodes()
    {
        TArray<EFashionSlotType> local_4;
        this.AppendKnownWardrobeSlotCandidates(local_4);
        for (auto local_18 : local_4)
        {
            this.ClearFashionAggregateRedDotNode(this.MakeFashionSlotRedDotNodeData(EFashionSlotType(local_18)));
        }
        this.ClearFashionAggregateRedDotNode(this.MakeFashionMainTabRedDotNodeData(EFashionSlotMainTab(0)));
        this.ClearFashionAggregateRedDotNode(this.MakeFashionMainTabRedDotNodeData(EFashionSlotMainTab(1)));
        return;
    }
    void ClearFashionAggregateRedDotNode(const FRedDotNodeData &inout NodeData)
    {
        if (!(::FMS_RedDotSystem::Get(this.GetContext().Manager).TryFindOrAddRedDotNode(NodeData).IsValid()))
        {
            return;
        }
        RemoveAllChildNodeData();
        int local_7 = GetCount();
        if (local_7 > 0)
        {
            ::FMS_RedDotSystem::Get(this.GetContext().Manager).GenerateSpecificRedDot(NodeData, -local_7, false);
        }
        return;
    }
    bool ConsumeFashionNewRedDot(FVM_AvatarWardrobeFashionOption &inout Option)
    {
        int local_4 = 0;
        if (Option.GetbIsUnequipOption() || !(this.HasFashionNewRedDot(Option.GetFashionConfig())))
        {
            return false;
        }
        int local_3 = local_4;
        ::FMS_RedDotSystem::Get(this.GetContext().Manager).ConsumeRedDot(this.MakeFashionNewRedDotNodeData(local_3));
        FEUIModelRef local_16 = FEUIModelRef(this);
        FEUIMessageBus::PublishOrPatch(EUIMessageBus);
        FMsg_AvatarWardrobeRedDotChanged local_10;
        local_10.FashionId = local_3;
        return true;
    }
    void EnsurePreviewInitialized()
    {
        int local_6 = 0;
        FAvatarFashion local_20;
        bool local_4 = this.GetbPreviewInitialized() || !(this.GetEditingAvatar());
        if (local_4)
        {
            local_4 = true;
        }
        else
        {
            TEUIModelRef<FVM_AvatarInfo> local_2 = this.GetEditingAvatar();
            local_4 = !(GetAvatarConfig());
        }
        if (local_4)
        {
            return;
        }
        TEUIModelRef<FVM_AvatarInfo> local_2_2 = this.GetEditingAvatar();
        int local_5 = local_6;
        this.ResetPreviewFashion(local_5);
        this.ResetOriginalFashion(local_5);
        if (::FMS_FashionModel::Get(this.GetContext().Manager).GetAvatarFashionMap().Find(local_5, local_20))
        {
            this.SetbHasOriginalFashion(true);
            this.CopyFashionToOriginal(local_20);
            this.CopyFashionToPreview(local_20);
        }
        else
        {
            this.SetbHasOriginalFashion(false);
        }
        this.SetbPreviewInitialized(true);
        return;
    }
    void ResetPreviewFashion(const uint AvatarId)
    {
        this.GetModify_PreviewFashion().AvatarID = AvatarId;
        this.GetModify_PreviewFashion().HairID = 0;
        this.GetModify_PreviewFashion().TopID = 0;
        this.GetModify_PreviewFashion().BottomID = 0;
        this.GetModify_PreviewFashion().SuitID = 0;
        this.GetModify_PreviewFashion().BathrobeTopID = 0;
        this.GetModify_PreviewFashion().BathrobeBottomID = 0;
        this.GetModify_PreviewFashion().Decos.Empty(0);
        return;
    }
    void ResetOriginalFashion(const uint AvatarId)
    {
        this.GetModify_OriginalFashion().AvatarID = AvatarId;
        this.GetModify_OriginalFashion().HairID = 0;
        this.GetModify_OriginalFashion().TopID = 0;
        this.GetModify_OriginalFashion().BottomID = 0;
        this.GetModify_OriginalFashion().SuitID = 0;
        this.GetModify_OriginalFashion().BathrobeTopID = 0;
        this.GetModify_OriginalFashion().BathrobeBottomID = 0;
        this.GetModify_OriginalFashion().Decos.Empty(0);
        return;
    }
    void CopyFashionToPreview(const FAvatarFashion &inout SourceFashion)
    {
        this.ResetPreviewFashion(int(SourceFashion.AvatarID));
        this.GetModify_PreviewFashion().HairID = int(SourceFashion.HairID);
        this.GetModify_PreviewFashion().TopID = int(SourceFashion.TopID);
        this.GetModify_PreviewFashion().BottomID = int(SourceFashion.BottomID);
        this.GetModify_PreviewFashion().SuitID = int(SourceFashion.SuitID);
        this.GetModify_PreviewFashion().BathrobeTopID = int(SourceFashion.BathrobeTopID);
        this.GetModify_PreviewFashion().BathrobeBottomID = int(SourceFashion.BathrobeBottomID);
        for (auto& local_18 : SourceFashion.Decos)
        {
            this.GetModify_PreviewFashion().Decos.Add(local_18);
        }
        return;
    }
    void CopyFashionToOriginal(const FAvatarFashion &inout SourceFashion)
    {
        this.ResetOriginalFashion(int(SourceFashion.AvatarID));
        this.GetModify_OriginalFashion().HairID = int(SourceFashion.HairID);
        this.GetModify_OriginalFashion().TopID = int(SourceFashion.TopID);
        this.GetModify_OriginalFashion().BottomID = int(SourceFashion.BottomID);
        this.GetModify_OriginalFashion().SuitID = int(SourceFashion.SuitID);
        this.GetModify_OriginalFashion().BathrobeTopID = int(SourceFashion.BathrobeTopID);
        this.GetModify_OriginalFashion().BathrobeBottomID = int(SourceFashion.BathrobeBottomID);
        for (auto& local_18 : SourceFashion.Decos)
        {
            this.GetModify_OriginalFashion().Decos.Add(local_18);
        }
        return;
    }
    void ResetPreviewToOriginalFashion()
    {
        this.CopyFashionToPreview(this.GetOriginalFashion());
        return;
    }
    void SyncOriginalFashionFromModel()
    {
        int local_6 = 0;
        FAvatarFashion local_20;
        TEUIModelRef<FVM_AvatarInfo> local_2 = this.GetEditingAvatar();
        bool local_3 = !(local_2);
        if (local_3)
        {
            local_3 = true;
        }
        else
        {
            TEUIModelRef<FVM_AvatarInfo> local_2_2 = this.GetEditingAvatar();
            local_3 = !(GetAvatarConfig());
        }
        if (local_3)
        {
            return;
        }
        TEUIModelRef<FVM_AvatarInfo> local_2_3 = this.GetEditingAvatar();
        int local_5 = local_6;
        if (::FMS_FashionModel::Get(this.GetContext().Manager).GetAvatarFashionMap().Find(local_5, local_20))
        {
            this.CopyFashionToOriginal(local_20);
            this.SetbHasOriginalFashion(true);
            return;
        }
        this.ResetOriginalFashion(local_5);
        this.SetbHasOriginalFashion(false);
        return;
    }
    void RestoreOriginalFashionModel()
    {
        bool local_1 = !(this.GetbPreviewInitialized()) || !(this.GetbPreviewAppliedToFashionModel()) || !(this.GetEditingAvatar());
        if (local_1)
        {
            local_1 = true;
        }
        else
        {
            TEUIModelRef<FVM_AvatarInfo> local_4 = this.GetEditingAvatar();
            local_1 = !(GetAvatarConfig());
        }
        if (local_1)
        {
            return;
        }
        TEUIModelRef<FVM_AvatarInfo> local_4_2 = this.GetEditingAvatar();
        FMS_FashionModel& local_8 = ::FMS_FashionModel::Get(this.GetContext().Manager);
        if (this.GetbHasOriginalFashion())
        {
        }
        else
        {
        }
        this.SetbPreviewAppliedToFashionModel(false);
        return;
    }
    void ResetMountPreviewFromFact()
    {
        FMS_FashionModel& local_2 = ::FMS_FashionModel::Get(this.GetContext().Manager);
        this.SetPreviewMountID(local_2.GetMountID());
        this.SetPreviewMountDecoID(local_2.GetMountDecoID());
        this.SetbHasPreviewMountOverride(false);
        return;
    }
    void ApplyFashionIdToMountPreview(const EFashionSlotType SlotType, const uint FashionId)
    {
        if (int(SlotType) == -55)
        {
            this.SetPreviewMountID(FashionId);
            this.SetbHasPreviewMountOverride(true);
            return;
        }
        if (int(SlotType) == -54)
        {
            this.SetPreviewMountDecoID(FashionId);
            this.SetbHasPreviewMountOverride(true);
        }
        return;
    }
    TDataObjectPtr<FMountFashionConfig> ResolvePreviewMountShowcaseConfig() const
    {
        int local_5;
        if (this.GetbHasPreviewMountOverride())
        {
            local_5 = this.GetPreviewMountID();
        }
        else
        {
            local_5 = ::FMS_FashionModel::Get(this.GetContext().Manager).GetMountID();
        }
        if (local_5 > 0)
        {
            ::FFashionConfig::GetByDataId(local_5);
            CastTo local_58;
            TDataObjectPtr<FMountFashionConfig> local_82 = local_58.opCall();
            if (local_82)
            {
                return local_82;
            }
        }
        return ::FMS_FashionModel::Get(this.GetContext().Manager).GetCurrentMountFashionConfig();
    }
    void ApplyPreviewToFashionModel()
    {
        int local_6 = 0;
        TEUIModelRef<FVM_AvatarInfo> local_2 = this.GetEditingAvatar();
        bool local_3 = !(local_2);
        if (local_3)
        {
            local_3 = true;
        }
        else
        {
            TEUIModelRef<FVM_AvatarInfo> local_2_2 = this.GetEditingAvatar();
            local_3 = !(GetAvatarConfig());
        }
        if (local_3)
        {
            return;
        }
        TEUIModelRef<FVM_AvatarInfo> local_2_3 = this.GetEditingAvatar();
        this.GetModify_PreviewFashion().AvatarID = local_6;
        FMS_FashionModel& local_8 = ::FMS_FashionModel::Get(this.GetContext().Manager);
        this.SetbPreviewAppliedToFashionModel(true);
        return;
    }
    void CommitPreviewAsOriginal()
    {
        this.CopyFashionToOriginal(this.GetPreviewFashion());
        this.SetbHasOriginalFashion(true);
        return;
    }
    TEUIModelRef<FVM_AvatarWardrobeFashionOption> GetSelectedFashionOption() const
    {
        if ((int(this.GetSelectedSlotSubTab())) == 0)
        {
        }
        else
        {
        }
        FEUIModelContainer::GetModel local_22;
        return TEUIModelRef<FVM_AvatarWardrobeFashionOption>(local_22.opCall());
    }
    bool RefreshFashionOptionSelectionState(FVM_AvatarWardrobeFashionOption &inout Option)
    {
        bool local_8;
        if (int(this.GetSelectedSlotSubTab()) == 0)
        {
        }
        else
        {
        }
        TArray<FEUIModelContainer> local_4;
        FEUIModelContainer local_22;
        bool local_23 = false;
        if (local_4.Num() != this.GetCurrentFashionOptions().Num())
        {
            return false;
        }
        int local_24 = 0;
        for (; local_24 < local_4.Num(); ++local_24)
        {
            if (!(TEUIModelRef<FVM_AvatarWardrobeFashionOption>(FEUIModelContainer::GetModel(local_4[local_24]).opCall()).IsValid()) || !(TEUIModelRef<FVM_DisplayItem>(FEUIModelContainer::GetModel(local_4[local_24]).opCall()).IsValid()))
            {
                return false;
            }
            local_8 = this.IsSameFashionOption(Option);
            ::DisplayItemUtility::SetCustomSelection(local_8);
            if (local_8)
            {
                local_22 = local_4[local_24];
                local_23 = true;
            }
        }
        if (!(local_23))
        {
            return false;
        }
        if (int(this.GetSelectedSlotSubTab()) == 0)
        {
            this.SetSelectedHighFashionItem(local_22);
            this.SetSelectedTileFashionItem(FEUIModelContainer());
        }
        else
        {
            this.SetSelectedHighFashionItem(FEUIModelContainer());
            this.SetSelectedTileFashionItem(local_22);
        }
        return true;
    }
    bool RefreshCurrentFashionOptionRuntimeStates()
    {
        bool local_8;
        if (int(this.GetSelectedSlotSubTab()) == 0)
        {
        }
        else
        {
        }
        TArray<FEUIModelContainer> local_4;
        FEUIModelContainer local_22;
        if (local_4.Num() != this.GetCurrentFashionOptions().Num())
        {
            return false;
        }
        this.SetbHasSelectedFashionOptionInCurrentList(false);
        int local_23 = 0;
        for (; local_23 < local_4.Num(); )
        {
            if (!(TEUIModelRef<FVM_AvatarWardrobeFashionOption>(FEUIModelContainer::GetModel(local_4[local_23]).opCall()).IsValid()) || !(TEUIModelRef<FVM_DisplayItem>(FEUIModelContainer::GetModel(local_4[local_23]).opCall()).IsValid()))
            {
                return false;
            }
            int local_44 = this.GetEffectiveFactFashionIdForSlot(EFashionSlotType(GetSlotType()));
            int local_42 = this.GetEffectivePreviewFashionIdForSlotIncludingMount(EFashionSlotType(GetSlotType()));
            int local_45 = this.GetOptionEffectiveFashionId();
            local_8 = (local_44 == local_45);
            bool local_41 = (local_42 == local_45) && !(this.GetbHasSelectedFashionOptionInCurrentList());
            if (local_41)
            {
                this.SetbHasSelectedFashionOptionInCurrentList(true);
                local_22 = local_4[local_23];
            }
            this.RefreshFashionOptionDisplayRuntimeState(local_41, local_8);
            ++local_23;
        }
        if (int(this.GetSelectedSlotSubTab()) == 0)
        {
            this.SetSelectedHighFashionItem(local_22);
            this.SetSelectedTileFashionItem(FEUIModelContainer());
        }
        else
        {
            this.SetSelectedHighFashionItem(FEUIModelContainer());
            this.SetSelectedTileFashionItem(local_22);
        }
        this.RefreshSelectedDisplayDetail();
        this.NotifyActionStateChanged();
        return true;
    }
    void RefreshFashionOptionDisplayRuntimeState(FVM_AvatarWardrobeFashionOption &inout Option, FVM_DisplayItem &inout DisplayItem, const bool bSelected, const bool bEquipped)
    {
        if (Option.GetbIsUnequipOption())
        {
            ::DisplayItemUtility::SetCustomSelection(DisplayItem, bSelected);
            ::DisplayItemUtility::SetEquipStateByFlags(DisplayItem, bEquipped, false);
            return;
        }
        FDisplayItemFashionRuntimeState local_8;
        local_8.bUnlocked = this.IsFashionConfigUnlocked(Option.GetFashionConfig());
        local_8.bEquippedOnCurrentTarget = bEquipped;
        local_8.bSelected = bSelected;
        local_8.bEnableMask = !(local_8.bUnlocked);
        local_8.MaskType = local_8.bUnlocked ? 0 : 1;
        local_8.RedDotVM = this.CreateFashionNewRedDotVM(Option.GetFashionConfig());
        ::DisplayItemAdapter_Fashion::ApplyRuntimeState(DisplayItem, Option.GetFashionConfig(), local_8);
        this.DisableDisplayItemRedDotAutoConsume(DisplayItem);
        return;
    }
    void HandleFashionOptionSelectedByIndex(const int Index, const bool bMajorList)
    {
        if (this.GetContentSwitcherIndex() != 1)
        {
            return;
        }
        if (bMajorList)
        {
        }
        else
        {
        }
        TArray<FEUIModelContainer> local_8;
        if (!(local_8.IsValidIndex(Index)))
        {
            return;
        }
        if (!(TEUIModelRef<FVM_AvatarWardrobeFashionOption>(FEUIModelContainer::GetModel(local_8[Index]).opCall()).IsValid()))
        {
            return;
        }
        this.ApplyFashionOptionSelection();
        return;
    }
    bool IsFashionOptionInCurrentSelectionContext(FVM_AvatarWardrobeFashionOption &inout Option) const
    {
        if (this.GetContentSwitcherIndex() != 1)
        {
            return false;
        }
        if (int(Option.GetSlotType()) != int(this.GetSelectedSlotType()) || (int(Option.GetSlotSubTab()) != int(this.GetSelectedSlotSubTab())))
        {
            return false;
        }
        return this.IsSlotInCurrentOperationArea(EFashionSlotType(Option.GetSlotType()));
    }
    bool IsFashionOptionSelectionNoOp(FVM_AvatarWardrobeFashionOption &inout Option) const
    {
        bool local_6;
        TEUIModelRef<FVM_AvatarWardrobeFashionOption> local_4 = this.GetSelectedFashionOption();
        bool local_5 = !(local_4.IsValid()) || !(this.IsSameFashionOption(Option));
        if (local_5)
        {
            return false;
        }
        int local_8 = this.GetOptionEffectiveFashionId(Option);
        if (this.GetEffectivePreviewFashionIdForSlotIncludingMount(EFashionSlotType(Option.GetSlotType())) != local_8)
        {
            return false;
        }
        if (local_8 == 0)
        {
            return true;
        }
        switch (int(Option.GetSlotType()))
        {
        case 2:
        case 3:
        {
            int local_7 = this.GetPreviewFashion().SuitID;
            return (local_7 == 0);
        }
        case 4:
        {
            if ((this.GetPreviewFashion().TopID) != 0)
            {
                local_6 = false;
            }
            else
            {
                int local_7_2 = this.GetPreviewFashion().BottomID;
                local_6 = (local_7_2 == 0);
            }
            return local_6;
        }
        default:
        {
            local_5 = true;
        }
        }
        return local_5;
    }
    void ClearProcessedBoundFashionOptionSelection()
    {
        this.SetbHasProcessedBoundFashionOptionSelection(false);
        this.SetProcessedBoundFashionSlotType(EFashionSlotType(0));
        this.SetProcessedBoundFashionSlotSubTab(EFashionSlotSubTab(0));
        this.SetbProcessedBoundFashionIsUnequip(false);
        this.SetProcessedBoundFashionId(0);
        return;
    }
    void MarkProcessedBoundFashionOptionSelection(FVM_AvatarWardrobeFashionOption &inout Option)
    {
        this.SetbHasProcessedBoundFashionOptionSelection(true);
        this.SetProcessedBoundFashionSlotType(Option.GetSlotType());
        this.SetProcessedBoundFashionSlotSubTab(Option.GetSlotSubTab());
        this.SetbProcessedBoundFashionIsUnequip(Option.GetbIsUnequipOption());
        this.SetProcessedBoundFashionId(this.GetOptionEffectiveFashionId(Option));
        return;
    }
    bool IsProcessedBoundFashionOptionSelection(FVM_AvatarWardrobeFashionOption &inout Option) const
    {
        bool local_9;
        if (!(this.GetbHasProcessedBoundFashionOptionSelection() && (int(this.GetProcessedBoundFashionSlotType()) == int(Option.GetSlotType())) && (int(this.GetProcessedBoundFashionSlotSubTab()) == int(Option.GetSlotSubTab()))))
        {
            local_9 = false;
        }
        else
        {
            bool local_5;
            local_5 = !(this.GetbProcessedBoundFashionIsUnequip());
            local_5 = (local_5 == !(Option.GetbIsUnequipOption()));
            local_9 = local_5;
        }
        return local_9 && (this.GetProcessedBoundFashionId() == this.GetOptionEffectiveFashionId(Option));
    }
    bool IsFashionUnlocked(const uint FashionId)
    {
        if (FashionId == 0)
        {
            return false;
        }
        return ::FMS_FashionModel::Get(this.GetContext().Manager).IsFashionUnlocked(FashionId);
    }
    bool IsSelectedSlotAllowUnequip()
    {
        bool local_51 = false;
        return ::FashionSettings::GetSlotConfig(this.GetSelectedSlotType()) && local_51;
    }
    bool IsFashionMountUnlocked() const
    {
        return this.GetbIsFashionMountUnlocked();
    }
    void RefreshFashionMountUnlockState()
    {
        this.SetbIsFashionMountUnlocked(::FMS_SystemControl::Get(this.GetContext().Manager).IsSystemUnlock(ESystemModule(117), false));
        return;
    }
    void RefreshMainTabItems()
    {
        this.GetModify_MainTabItems().Empty(0);
        this.GetModify_MainTabSelectableItems().Empty(0);
        this.SetSelectedMainTabItem(FEUIModelContainer());
        if (this.CanShowMainTab(EFashionSlotMainTab(0)))
        {
            this.AddMainTabItem(EFashionSlotMainTab(0));
        }
        if (this.CanShowMainTab(EFashionSlotMainTab(1)))
        {
            this.AddMainTabItem(EFashionSlotMainTab(1));
        }
        return;
    }
    void AddMainTabItem(const EFashionSlotMainTab MainTab)
    {
        int local_38 = 0;
        FVM_SelectableItem& local_2 = ::FVM_SelectableItem::Create(this.GetContext().Manager);
        FVM_CommonTabItem& local_4 = ::FVM_CommonTabItem::Create(this.GetContext().Manager);
        local_4.SetTitleText(::FashionSettings::GetMainTabText(EFashionSlotMainTab(MainTab)));
        TEUIModelRef<FVM_RedDot> local_12 = this.CreateFashionMainTabRedDotVM(EFashionSlotMainTab(MainTab));
        local_38.InitializeCustomRedDotVM(local_12);
        FEUIModelContainer local_52;
        local_52.AddModel(FEUIModelRef(local_2), false);
        FEUIModelRef local_56 = FEUIModelRef(local_4);
        local_52.AddModel(local_56, false);
        ::FashionSettings::GetMainTabText(EFashionSlotMainTab(MainTab));
        local_52.AddModel(local_56, false);
        local_52.AddModel(FEUIModelRef(local_38), false);
        local_52.AddModel(local_12.opImplConv(), false);
        this.GetModify_MainTabSelectableItems().Add(TEUIModelRef<FVM_CommonTabItem>(local_4));
        this.GetModify_MainTabItems().Add(local_52);
        if (int(MainTab) == (int(this.GetCurrentMainTab())))
        {
            this.SetSelectedMainTabItem(local_52);
        }
        return;
    }
    void RefreshOverviewSlots()
    {
        this.GetModify_ClothSlotEntryDataList().Empty(0);
        this.GetModify_OrnamentSlotItems().Empty(0);
        this.GetModify_ClothSlotModels().Empty(0);
        this.GetModify_OrnamentSlotModels().Empty(0);
        TArray<EFashionSlotType> local_6;
        this.CollectConfiguredSlotsForSubTab(EFashionSlotSubTab(0), local_6);
        this.SetbHasWardrobeGroupSlots((local_6.Num() > 0));
        int local_10 = 0;
        for (; local_10 < local_6.Num(); )
        {
            FEUIDynamicWidgetData local_34;
            local_34.ModelContainer = this.BuildSlotDisplayContainer(EFashionSlotType(local_6[local_10]), EFashionSlotSubTab(0), local_10);
            this.GetModify_ClothSlotEntryDataList().Add(local_34);
            ++local_10;
        }
        TArray<EFashionSlotType> local_54;
        this.CollectConfiguredSlotsForSubTab(EFashionSlotSubTab(1), local_54);
        this.SetbHasOrnamentGroupSlots((local_54.Num() > 0));
        int local_10_2 = 0;
        for (; local_10_2 < local_54.Num(); )
        {
            this.GetModify_OrnamentSlotItems().Add(this.BuildSlotDisplayContainer(EFashionSlotType(local_54[local_10_2]), EFashionSlotSubTab(1), local_10_2));
            ++local_10_2;
        }
        return;
    }
    FEUIModelContainer BuildSlotDisplayContainer(const EFashionSlotType SlotType, const EFashionSlotSubTab SlotSubTab, const int SlotIndex)
    {
        FVM_AvatarWardrobeSlotItem& local_2 = ::FVM_AvatarWardrobeSlotItem::Create(this.GetContext().Manager);
        local_2.Setup(this, EFashionSlotType(SlotType), EFashionSlotSubTab(SlotSubTab), SlotIndex);
        TEUIModelRef<FVM_DisplayItem> local_6 = this.CreateSlotDisplayItem(EFashionSlotType(SlotType));
        TEUIModelRef<FVM_RedDot> local_10 = this.CreateFashionSlotRedDotVM(EFashionSlotType(SlotType));
        this.DisableDisplayItemRedDotAutoConsume();
        FEUIModelContainer local_24;
        local_24.AddModel(local_6.opImplConv(), false);
        local_24.AddModel(FEUIModelRef(local_2), false);
        local_24.AddModel(local_10.opImplConv(), false);
        ::DisplayItemUtility::BindDisplayItemClickCallback(local_24, FEUIModelRef(local_2), FVM_AvatarWardrobeSlotItem::HandleClicked);
        if (int(SlotSubTab) == 0)
        {
            this.GetModify_ClothSlotModels().Add(TEUIModelRef<FVM_AvatarWardrobeSlotItem>(local_2));
        }
        else
        {
            this.GetModify_OrnamentSlotModels().Add(TEUIModelRef<FVM_AvatarWardrobeSlotItem>(local_2));
        }
        return local_24;
    }
    TEUIModelRef<FVM_DisplayItem> CreateSlotDisplayItem(const EFashionSlotType SlotType)
    {
        int local_2 = this.GetEffectiveFactFashionIdForSlot(EFashionSlotType(SlotType));
        if (this.IsNonDefaultFashionIdForSlot(EFashionSlotType(SlotType), local_2))
        {
            TDataObjectPtr<FFashionConfig> local_52 = ::FFashionConfig::GetByDataId(local_2);
            if (local_52)
            {
                FDisplayItemFashionRuntimeState local_58;
                local_58.bUnlocked = true;
                local_58.bEquippedOnCurrentTarget = true;
                local_58.RedDotVM = this.CreateFashionSlotRedDotVM(EFashionSlotType(SlotType));
                int local_63 = int(this.GetEditingAvatarBodyType());
                TEUIModelRef<FVM_DisplayItem> local_66 = ::DisplayItemAdapter_Fashion::CreateDisplayItem(this.GetContext().Manager, local_52, local_58, EItemDisplayScenario(8));
                this.DisableDisplayItemRedDotAutoConsume();
                return local_66;
            }
        }
        TEUIModelRef<FM_DisplayItemData> local_68 = this.CreateSlotDisplayData(EFashionSlotType(SlotType), false);
        return TEUIModelRef<FVM_DisplayItem>(::FVM_DisplayItem::Create(this.GetContext().Manager, local_68, EItemDisplayScenario(8)));
    }
    bool RefreshOverviewSlotRuntimeStates()
    {
        int local_1 = 0;
        for (; local_1 < this.GetClothSlotEntryDataList().Num(); ++local_1)
        {
            if (!(this.RefreshOverviewSlotRuntimeState(this.GetClothSlotEntryDataList()[local_1].ModelContainer)))
            {
                return false;
            }
        }
        int local_1_2 = 0;
        for (; local_1_2 < this.GetOrnamentSlotItems().Num(); ++local_1_2)
        {
            if (!(this.RefreshOverviewSlotRuntimeState(this.GetOrnamentSlotItems()[local_1_2])))
            {
                return false;
            }
        }
        return true;
    }
    bool RefreshOverviewSlotRuntimeState(const FEUIModelContainer &inout SlotContainer)
    {
        if (!(TEUIModelRef<FVM_AvatarWardrobeSlotItem>(FEUIModelContainer::GetModel(SlotContainer).opCall()).IsValid()) || !(TEUIModelRef<FVM_DisplayItem>(FEUIModelContainer::GetModel(SlotContainer).opCall()).IsValid()))
        {
            return false;
        }
        int local_19 = int(GetSlotType());
        this.RefreshSlotDisplayItemRuntimeState();
        return true;
    }
    void RefreshSlotDisplayItemRuntimeState(FVM_DisplayItem &inout DisplayItem, const EFashionSlotType SlotType)
    {
        int local_2 = this.GetEffectiveFactFashionIdForSlot(EFashionSlotType(SlotType));
        if (this.IsNonDefaultFashionIdForSlot(EFashionSlotType(SlotType), local_2))
        {
            TDataObjectPtr<FFashionConfig> local_52 = ::FFashionConfig::GetByDataId(local_2);
            if (local_52)
            {
                int local_53 = int(this.GetEditingAvatarBodyType());
                DisplayItem.SetDisplayData(::DisplayItemAdapter_Fashion::MakeDisplayData(this.GetContext().Manager, local_52));
                DisplayItem.RefreshDisplayData();
                FDisplayItemFashionRuntimeState local_62;
                local_62.bUnlocked = true;
                local_62.bEquippedOnCurrentTarget = true;
                local_62.RedDotVM = this.CreateFashionSlotRedDotVM(EFashionSlotType(SlotType));
                ::DisplayItemAdapter_Fashion::ApplyRuntimeState(DisplayItem, local_52, local_62);
                this.DisableDisplayItemRedDotAutoConsume(DisplayItem);
                return;
            }
        }
        DisplayItem.SetDisplayData(this.CreateSlotDisplayData(EFashionSlotType(SlotType), false));
        DisplayItem.RefreshDisplayData();
        ::DisplayItemUtility::SetMask(DisplayItem, false, 0);
        ::DisplayItemUtility::SetEquipStateByFlags(DisplayItem, false, false);
        ::DisplayItemUtility::SetCustomSelection(DisplayItem, false);
        ::DisplayItemUtility::SetGradeImage(DisplayItem, FSoftBrush());
        ::DisplayItemUtility::SetRedDotVM(DisplayItem, this.CreateFashionSlotRedDotVM(EFashionSlotType(SlotType)));
        this.DisableDisplayItemRedDotAutoConsume(DisplayItem);
        return;
    }
    TEUIModelRef<FM_DisplayItemData> CreateSlotDisplayData(const EFashionSlotType SlotType, const bool bUnequipOption)
    {
        FM_DisplayItemData& local_2 = ::FM_DisplayItemData::Create(this.GetContext().Manager);
        local_2.SetSourceType(EDisplayItemSourceType(4));
        local_2.SetSourceId(int(SlotType));
        FText local_16 = bUnequipOption ? NSLOCTEXT("AvatarWardrobe_Unequip", "еЌёдё‹") : ::FashionSettings::GetFashionSlotName(EFashionSlotType(SlotType));
        local_2.SetDisplayName(local_16);
        if (bUnequipOption)
        {
            local_2.SetCurDisplayState(2);
        }
        else
        {
            local_2.SetItemImageTemp(::FashionSettings::GetSlotIcon(EFashionSlotType(SlotType)));
            local_2.SetCurDisplayState(3);
        }
        return TEUIModelRef<FM_DisplayItemData>(local_2);
    }
    void RefreshSelectionTabs()
    {
        int local_75 = 0;
        this.GetModify_SelectionTabItems().Empty(0);
        this.GetModify_SlotTabSelectableItems().Empty(0);
        this.SetSelectedSlotTabItem(FEUIModelContainer());
        TArray<EFashionSlotType> local_20;
        this.CollectConfiguredSlotsForCurrentMainTab(local_20);
        int local_21 = 0;
        for (; local_21 < local_20.Num(); ++local_21)
        {
            if (::FashionSettings::GetSlotConfig(EFashionSlotType(local_20[local_21])))
            {
                this.AddSelectionTab(EFashionSlotType(local_20[local_21]), EFashionSlotSubTab(local_75), local_21);
            }
        }
        FEUIModelContainer local_90;
        if (this.GetSelectionTabItems().IsValidIndex(this.GetSelectedSlotIndex()))
        {
            local_90 = this.GetSelectionTabItems()[this.GetSelectedSlotIndex()];
        }
        else
        {
            local_90 = FEUIModelContainer();
        }
        this.SetSelectedSlotTabItem(local_90);
        return;
    }
    void AddSelectionTab(const EFashionSlotType SlotType, const EFashionSlotSubTab SlotSubTab, const int CombinedIndex)
    {
        FVM_SelectableItem& local_2 = ::FVM_SelectableItem::Create(this.GetContext().Manager);
        FVM_CommonTabItem& local_4 = ::FVM_CommonTabItem::Create(this.GetContext().Manager);
        local_4.SetTitleText(::FashionSettings::GetFashionSlotName(EFashionSlotType(SlotType)));
        local_4.SetbWithEquipState(true);
        local_4.SetbIsEquip(this.IsSlotUsingNonDefaultFashion(EFashionSlotType(SlotType)));
        FEUIModelContainer local_24;
        local_24.AddModel(FEUIModelRef(local_2), false);
        FEUIModelRef local_26 = FEUIModelRef(local_4);
        local_24.AddModel(local_26, false);
        FSoftBrush local_72 = ::FashionSettings::GetSlotIcon(EFashionSlotType(SlotType));
        local_24.AddModel(local_26, false);
        local_24.AddModel(this.CreateFashionSlotRedDotVM(EFashionSlotType(SlotType)).opImplConv(), false);
        this.GetModify_SlotTabSelectableItems().Add(TEUIModelRef<FVM_CommonTabItem>(local_4));
        this.GetModify_SelectionTabItems().Add(local_24);
        return;
    }
    bool RefreshSelectionTabRuntimeStates()
    {
        TArray<EFashionSlotType> local_4;
        this.CollectConfiguredSlotsForCurrentMainTab(local_4);
        if (local_4.Num() != this.GetSelectionTabItems().Num())
        {
            return false;
        }
        int local_8 = 0;
        for (; local_8 < this.GetSelectionTabItems().Num(); )
        {
            if (!(TEUIModelRef<FVM_CommonTabItem>(FEUIModelContainer::GetModel(this.GetSelectionTabItems()[local_8]).opCall()).IsValid()))
            {
                return false;
            }
            this.IsSlotUsingNonDefaultFashion(EFashionSlotType(local_4[local_8])).SetbIsEquip();
            ++local_8;
        }
        FEUIModelContainer local_46;
        if (this.GetSelectionTabItems().IsValidIndex(this.GetSelectedSlotIndex()))
        {
            local_46 = this.GetSelectionTabItems()[this.GetSelectedSlotIndex()];
        }
        else
        {
            local_46 = FEUIModelContainer();
        }
        this.SetSelectedSlotTabItem(local_46);
        return true;
    }
    void RefreshFashionOptionList()
    {
        this.GetModify_HighFashionItems().Empty(0);
        this.GetModify_TileFashionItems().Empty(0);
        this.GetModify_CurrentFashionOptions().Empty(0);
        this.SetSelectedHighFashionItem(FEUIModelContainer());
        this.SetSelectedTileFashionItem(FEUIModelContainer());
        this.SetSelectedDisplayDetail(TEUIModelRef<FVM_CommonDisplayDetail>(::FVM_CommonDisplayDetail::Create(this.GetContext().Manager)));
        TEUIModelRef<FVM_CommonDisplayDetail> local_18 = this.GetSelectedDisplayDetail();
        SetupEmpty();
        bool local_19 = false;
        this.SetbHasSelectedFashionOptionInCurrentList(local_19);
        if ((int(this.GetSelectedSlotType())) == 0)
        {
            return;
        }
        if (::FashionSettings::GetSlotConfig(EFashionSlotType(this.GetSelectedSlotType())) && local_19)
        {
            this.AddFashionOption(TDataObjectPtr<FFashionConfig>(), true);
        }
        TArray<TDataObjectPtr<FFashionConfig>> local_100;
        int local_101 = int(this.GetSelectedSlotSubTab());
        EFashionSlotType local_20 = this.GetSelectedSlotType();
        TArray<TDataObjectPtr<FFashionConfig>> local_106;
        TArray<TDataObjectPtr<FFashionConfig>> local_110;
        for (auto& local_124 : local_100)
        {
            if (this.IsFashionConfigUnlocked(local_124))
            {
                local_106.Add(local_124);
                continue;
            }
            local_110.Add(local_124);
        }
        for (auto& local_124 : local_106)
        {
            this.AddFashionOption(local_124, false);
        }
        for (auto& local_124 : local_110)
        {
            this.AddFashionOption(local_124, false);
        }
        this.RefreshSelectedDisplayDetail();
        return;
    }
    void AddFashionOption(const TDataObjectPtr<FFashionConfig> &inout FashionConfig, const bool bUnequipOption)
    {
        int local_12;
        FVM_AvatarWardrobeFashionOption& local_2 = ::FVM_AvatarWardrobeFashionOption::Create(this.GetContext().Manager);
        EFashionSlotSubTab local_3 = this.GetSelectedSlotSubTab();
        int local_4 = int(this.GetSelectedSlotType());
        TEUIModelRef<FVM_DisplayItem> local_6;
        int local_8 = this.GetEffectiveFactFashionIdForSlot(this.GetSelectedSlotType());
        int local_7 = this.GetEffectivePreviewFashionIdForSlotIncludingMount(this.GetSelectedSlotType());
        if (bUnequipOption)
        {
            local_12 = this.GetUnequipFashionIdForSlot(this.GetSelectedSlotType());
        }
        else
        {
            local_12 = this.GetFashionConfigDataId(FashionConfig);
        }
        bool local_14 = (local_8 == local_12);
        bool local_13 = (local_7 == local_12) && !(this.GetbHasSelectedFashionOptionInCurrentList());
        if (local_13)
        {
            this.SetbHasSelectedFashionOptionInCurrentList(true);
        }
        if (bUnequipOption)
        {
            TEUIModelRef<FM_DisplayItemData> local_18 = this.CreateSlotDisplayData(this.GetSelectedSlotType(), true);
            local_6 = TEUIModelRef<FVM_DisplayItem>(::FVM_DisplayItem::Create(this.GetContext().Manager, local_18, EItemDisplayScenario(7)));
            ::DisplayItemUtility::SetCustomSelection(local_13);
            ::DisplayItemUtility::SetEquipStateByFlags(local_14, false);
        }
        else
        {
            FDisplayItemFashionRuntimeState local_32;
            local_32.bUnlocked = this.IsFashionConfigUnlocked(FashionConfig);
            local_32.bEquippedOnCurrentTarget = local_14;
            local_32.bSelected = local_13;
            local_32.bEnableMask = !(local_32.bUnlocked);
            local_32.MaskType = local_32.bUnlocked ? 0 : 1;
            local_32.RedDotVM = this.CreateFashionNewRedDotVM(FashionConfig);
            int local_37 = int(this.GetEditingAvatarBodyType());
            local_6 = ::DisplayItemAdapter_Fashion::CreateDisplayItem(this.GetContext().Manager, FashionConfig, local_32, EItemDisplayScenario(7));
            this.DisableDisplayItemRedDotAutoConsume();
        }
        FVM_SelectableItem& local_40 = ::FVM_SelectableItem::Create(this.GetContext().Manager);
        FEUIModelContainer local_54;
        local_54.AddModel(local_6.opImplConv(), false);
        local_54.AddModel(FEUIModelRef(local_2), false);
        local_54.AddModel(FEUIModelRef(local_40), false);
        ::DisplayItemUtility::BindDisplayItemClickCallback(local_54, FEUIModelRef(local_2), FVM_AvatarWardrobeFashionOption::HandleClicked);
        this.GetModify_CurrentFashionOptions().Add(TEUIModelRef<FVM_AvatarWardrobeFashionOption>(local_2));
        if (int(this.GetSelectedSlotSubTab()) == 0)
        {
            this.GetModify_HighFashionItems().Add(local_54);
            if (local_13)
            {
                this.SetSelectedHighFashionItem(local_54);
            }
        }
        else
        {
            this.GetModify_TileFashionItems().Add(local_54);
            if (local_13)
            {
                this.SetSelectedTileFashionItem(local_54);
            }
        }
        return;
    }
    void RefreshSelectedDisplayDetail()
    {
        FVM_CommonDisplayDetail& local_2 = ::FVM_CommonDisplayDetail::Create(this.GetContext().Manager);
        local_2.SetupEmpty();
        if (!(!(this.GetSelectedFashionOption().IsValid() && !(GetbIsUnequipOption()))) && GetFashionConfig())
        {
            local_2.SetupFashion(GetFashionConfig(), this.IsFashionConfigUnlocked(GetFashionConfig()));
        }
        this.SetSelectedDisplayDetail(TEUIModelRef<FVM_CommonDisplayDetail>(local_2));
        return;
    }
    bool IsFashionConfigUnlocked(const TDataObjectPtr<FFashionConfig> &inout FashionConfig) const
    {
        return ::DisplayItemAdapter_Fashion::IsUnlocked(FashionConfig, ::FMS_FashionModel::Get(this.GetContext().Manager));
    }
    void CollectFashionConfigsForSlot(const EFashionSlotType SlotType, const EFashionSlotSubTab SlotSubTab, TArray<TDataObjectPtr<FFashionConfig>> &inout OutConfigs) const
    {
        if (int(SlotSubTab) == 0)
        {
            if (int(SlotType) == -55)
            {
                TDataObjectIterator<FMountFashionConfig> local_20;
                for (; local_20; )
                {
                    TDataObjectPtr<FMountFashionConfig> local_60 = local_20.GetDataPtr();
                    CastTo local_64;
                    TDataObjectPtr<FFashionConfig> local_88 = local_64.opCall();
                    if (this.ShouldShowFashionConfigForCurrentAvatar(local_88, EFashionSlotType(SlotType)))
                    {
                        OutConfigs.Add(local_88);
                    }
                    local_20.Next();
                }
                return;
            }
            TDataObjectIterator<FClothFashionConfig> local_128;
            for (; local_128; )
            {
                TDataObjectPtr<FClothFashionConfig> local_168 = local_128.GetDataPtr();
                CastTo local_172;
                TDataObjectPtr<FFashionConfig> local_112 = local_172.opCall();
                if (this.ShouldShowFashionConfigForCurrentAvatar(local_112, EFashionSlotType(SlotType)))
                {
                    OutConfigs.Add(local_112);
                }
                local_128.Next();
            }
            return;
        }
        TDataObjectIterator<FDecoFashionConfig> local_188;
        for (; local_188; )
        {
            TDataObjectPtr<FDecoFashionConfig> local_228 = local_188.GetDataPtr();
            CastTo local_232;
            TDataObjectPtr<FFashionConfig> local_88_2 = local_232.opCall();
            if (this.ShouldShowFashionConfigForCurrentAvatar(local_88_2, EFashionSlotType(SlotType)))
            {
                OutConfigs.Add(local_88_2);
            }
            local_188.Next();
        }
        return;
    }
    bool ShouldShowFashionConfigForCurrentAvatar(const TDataObjectPtr<FFashionConfig> &inout FashionConfig, const EFashionSlotType SlotType) const
    {
        int local_9 = 0;
        bool local_1 = !(FashionConfig) || (0 != int(SlotType)) || !(this.GetEditingAvatar());
        if (local_1)
        {
            local_1 = true;
        }
        else
        {
            TEUIModelRef<FVM_AvatarInfo> local_8 = this.GetEditingAvatar();
            local_1 = !(GetAvatarConfig());
        }
        if (local_1)
        {
            return false;
        }
        int local_3 = local_9;
        if (local_3 != 0)
        {
            return false;
        }
        if (0 == this.GetDefaultFashionIdForSlot(EFashionSlotType(SlotType)))
        {
            return false;
        }
        TEUIModelRef<FVM_AvatarInfo> local_8_2 = this.GetEditingAvatar();
        TDataObjectPtr<FAvatarPrefabConfig> local_36 = GetAvatarConfig();
        if (GetAvatarTypes().Num() > 0 && !(GetAvatarTypes().Contains(local_36)))
        {
            return false;
        }
        return this.HasFashionUsableResourceForCurrentAvatar(FashionConfig, EFashionSlotType(SlotType));
    }
    bool HasFashionUsableResourceForCurrentAvatar(const TDataObjectPtr<FFashionConfig> &inout FashionConfig, const EFashionSlotType SlotType) const
    {
        bool local_57;
        bool local_1 = !(FashionConfig);
        if (local_1)
        {
            return false;
        }
        if ((int(SlotType)) == -55)
        {
            CastTo local_8;
            if (!(local_8.opCall()))
            {
                local_57 = false;
            }
            else
            {
                local_1 = !local_1;
                local_57 = local_1;
            }
            return local_57;
        }
        TSoftObjectPtr<USkeletalMesh> local_68;
        EBodyType local_70 = this.GetEditingAvatarBodyType();
        if (!(unresolved.MeshAssets.Find(local_70, local_68)))
        {
            local_1 = false;
        }
        else
        {
            local_1 = !(local_68.IsNull());
        }
        if (local_1)
        {
            return true;
        }
        if ((int(local_70)) != 0 && local_1 && !(local_68.IsNull()))
        {
            return true;
        }
        return false;
    }
    EBodyType GetEditingAvatarBodyType() const
    {
        bool local_3 = !(this.GetEditingAvatar());
        if (local_3)
        {
            local_3 = true;
        }
        else
        {
            TEUIModelRef<FVM_AvatarInfo> local_2 = this.GetEditingAvatar();
            local_3 = !(GetAvatarConfig());
        }
        if (local_3)
        {
            return EBodyType(0);
        }
        TEUIModelRef<FVM_AvatarInfo> local_2_2 = this.GetEditingAvatar();
        return ::FashionUtils::GetBodyTypeFromAvatar(GetAvatarConfig());
    }
    uint GetDefaultFashionIdForSlot(const EFashionSlotType SlotType) const
    {
        int local_5 = 0;
        int local_8 = 0;
        bool local_3 = !(this.GetEditingAvatar());
        if (local_3)
        {
            local_3 = true;
        }
        else
        {
            TEUIModelRef<FVM_AvatarInfo> local_2 = this.GetEditingAvatar();
            local_3 = !(GetAvatarConfig());
        }
        if (local_3)
        {
            local_3 = true;
        }
        else
        {
            TEUIModelRef<FVM_AvatarInfo> local_2_2 = this.GetEditingAvatar();
            local_3 = !(GetDefaultFashion());
        }
        if (local_3)
        {
            return 0;
        }
        TEUIModelRef<FVM_AvatarInfo> local_2_3 = this.GetEditingAvatar();
        switch (int(SlotType))
        {
        case 1:
        {
            return this.GetFashionConfigDataId(local_8.GetInitHair());
        }
        case 2:
        {
            return this.GetFashionConfigDataId(local_8.GetInitTop());
        }
        case 3:
        {
            return this.GetFashionConfigDataId(local_8.GetInitBottom());
        }
        case 4:
        {
            return this.GetFashionConfigDataId(local_8.GetInitSuit());
        }
        case 5:
        {
            return this.GetFashionConfigDataId(local_8.GetInitBathrobeTop());
        }
        case 6:
        {
            return this.GetFashionConfigDataId(local_8.GetInitBathrobeBottom());
        }
        default:
        {
            local_5 = 0;
        }
        }
        return local_5;
    }
    uint GetFashionConfigDataId(const TDataObjectPtr<FFashionConfig> &inout FashionConfig) const
    {
        int local_3 = 0;
        int local_2 = FashionConfig ? local_3 : 0;
        return local_2;
    }
    uint GetUnequipFashionIdForSlot(const EFashionSlotType SlotType) const
    {
        return this.GetDefaultFashionIdForSlot(EFashionSlotType(SlotType));
    }
    uint GetOptionEffectiveFashionId(FVM_AvatarWardrobeFashionOption &inout Option) const
    {
        if (Option.GetbIsUnequipOption())
        {
            return this.GetUnequipFashionIdForSlot(Option.GetSlotType());
        }
        return this.GetFashionConfigDataId(Option.GetFashionConfig());
    }
    uint GetEffectivePreviewFashionIdForSlot(const EFashionSlotType SlotType) const
    {
        int local_4;
        int local_2 = this.GetPreviewFashionIdForSlot(EFashionSlotType(SlotType));
        if (local_2 > 0)
        {
            local_4 = local_2;
        }
        else
        {
            local_4 = this.GetDefaultFashionIdForSlot(EFashionSlotType(SlotType));
        }
        return local_4;
    }
    uint GetEffectiveOriginalFashionIdForSlot(const EFashionSlotType SlotType) const
    {
        int local_4;
        int local_2 = this.GetOriginalFashionIdForSlot(EFashionSlotType(SlotType));
        if (local_2 > 0)
        {
            local_4 = local_2;
        }
        else
        {
            local_4 = this.GetDefaultFashionIdForSlot(EFashionSlotType(SlotType));
        }
        return local_4;
    }
    uint GetEffectiveFactFashionIdForSlot(const EFashionSlotType SlotType) const
    {
        if (this.IsMountSlot(EFashionSlotType(SlotType)))
        {
            return this.GetCurrentMountFashionIdForSlot(EFashionSlotType(SlotType));
        }
        return this.GetEffectiveOriginalFashionIdForSlot(EFashionSlotType(SlotType));
    }
    bool IsNonDefaultFashionIdForSlot(const EFashionSlotType SlotType, const uint FashionId) const
    {
        if (FashionId == 0)
        {
            return false;
        }
        int local_1 = this.GetDefaultFashionIdForSlot(EFashionSlotType(SlotType));
        return (local_1 == 0 || (FashionId != local_1));
    }
    bool IsSlotUsingNonDefaultFashion(const EFashionSlotType SlotType) const
    {
        return this.IsNonDefaultFashionIdForSlot(EFashionSlotType(SlotType), this.GetEffectiveFactFashionIdForSlot(EFashionSlotType(SlotType)));
    }
    bool IsSameFashionOption(FVM_AvatarWardrobeFashionOption &inout A, FVM_AvatarWardrobeFashionOption &inout B) const
    {
        if (int(A.GetSlotType()) != int(B.GetSlotType()) || (int(A.GetSlotSubTab()) != int(B.GetSlotSubTab())) || (!(A.GetbIsUnequipOption()) != !(B.GetbIsUnequipOption())))
        {
            return false;
        }
        if (A.GetbIsUnequipOption())
        {
            return true;
        }
        return (this.GetFashionConfigDataId(A.GetFashionConfig()) == this.GetFashionConfigDataId(B.GetFashionConfig()));
    }
    bool IsMountSlot(const EFashionSlotType SlotType) const
    {
        int local_1 = int(SlotType);
        return (local_1 == -55 || ((int(SlotType) == -54)));
    }
    uint GetCurrentMountFashionIdForSlot(const EFashionSlotType SlotType) const
    {
        FMS_FashionModel& local_2 = ::FMS_FashionModel::Get(this.GetContext().Manager);
        if (int(SlotType) == -55)
        {
            return local_2.GetMountID();
        }
        if (int(SlotType) == -54)
        {
            return local_2.GetMountDecoID();
        }
        return 0;
    }
    void RequestChangeMountFashion(const EFashionSlotType SlotType, const uint FashionId)
    {
        FMS_FashionModel& local_2 = ::FMS_FashionModel::Get(this.GetContext().Manager);
        int local_3 = local_2.GetMountID();
        int local_5 = local_2.GetMountDecoID();
        if (int(SlotType) == -55)
        {
            local_3 = FashionId;
        }
        else
        {
            if (int(SlotType) == -54)
            {
                local_5 = FashionId;
            }
            else
            {
                return;
            }
        }
        local_2.RequestChangeMount(local_3, local_5);
        return;
    }
    bool IsFashionOptionWearable(FVM_AvatarWardrobeFashionOption &inout Option)
    {
        bool local_1 = false;
        if (Option.GetbIsUnequipOption())
        {
            return ::FashionSettings::GetSlotConfig(Option.GetSlotType()) && local_1;
        }
        return Option.GetFashionConfig() && this.IsFashionConfigUnlocked(Option.GetFashionConfig());
    }
    uint GetPreviewFashionIdForSlot(const EFashionSlotType SlotType) const
    {
        int local_3 = 0;
        switch (int(SlotType))
        {
        case 1:
        {
            return this.GetPreviewFashion().HairID;
        }
        case 2:
        {
            return this.GetPreviewFashion().TopID;
        }
        case 3:
        {
            return this.GetPreviewFashion().BottomID;
        }
        case 4:
        {
            return this.GetPreviewFashion().SuitID;
        }
        case 5:
        {
            return this.GetPreviewFashion().BathrobeTopID;
        }
        case 6:
        {
            return this.GetPreviewFashion().BathrobeBottomID;
        }
        default:
        {
            if (::DisplayItemAdapter_Fashion::IsFashionDecoSlot(EFashionSlotType(SlotType)))
            {
                for (auto& local_18 : this.GetPreviewFashion().Decos)
                {
                    if (int(local_18.SlotType) == int(SlotType))
                    {
                        return int(local_18.FashionID);
                    }
                }
            }
            local_3 = 0;
        }
        }
        return local_3;
    }
    uint GetOriginalFashionIdForSlot(const EFashionSlotType SlotType) const
    {
        int local_3 = 0;
        switch (int(SlotType))
        {
        case 1:
        {
            return this.GetOriginalFashion().HairID;
        }
        case 2:
        {
            return this.GetOriginalFashion().TopID;
        }
        case 3:
        {
            return this.GetOriginalFashion().BottomID;
        }
        case 4:
        {
            return this.GetOriginalFashion().SuitID;
        }
        case 5:
        {
            return this.GetOriginalFashion().BathrobeTopID;
        }
        case 6:
        {
            return this.GetOriginalFashion().BathrobeBottomID;
        }
        default:
        {
            if (::DisplayItemAdapter_Fashion::IsFashionDecoSlot(EFashionSlotType(SlotType)))
            {
                for (auto& local_18 : this.GetOriginalFashion().Decos)
                {
                    if (int(local_18.SlotType) == int(SlotType))
                    {
                        return int(local_18.FashionID);
                    }
                }
            }
            local_3 = 0;
        }
        }
        return local_3;
    }
    void ApplyFashionIdToPreview(const EFashionSlotType SlotType, const uint FashionId)
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    void ApplyFashionIdToFashion(FAvatarFashion &inout InOutFashion, const EFashionSlotType SlotType, const uint FashionId)
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    void ApplyDecoFashionIdToFashion(FAvatarFashion &inout InOutFashion, const EFashionSlotType SlotType, const uint FashionId)
    {
        int local_4 = InOutFashion.Decos.Num() - 1;
        for (; local_4 >= 0; --local_4)
        {
            if (InOutFashion.Decos[local_4].SlotType == int(SlotType))
            {
                InOutFashion.Decos.RemoveAt(local_4);
            }
        }
        if (FashionId == 0)
        {
            return;
        }
        FFashionDecoPoint local_22;
        local_22.SlotType = int(SlotType);
        local_22.FashionID = FashionId;
        if (::FFashionConfig::GetByDataId(FashionId))
        {
            CastTo local_74;
            if (local_74.opCall())
            {
                FFloat3 local_126;
                FFloat3 local_130;
                local_126 = local_130;
                local_22.AttachOffset = FVector(local_126.X, local_126.Y, local_126.Z);
                FFloat3 local_148;
                local_148 = local_130;
                float32 local_137 = local_148.X;
                local_22.AttachRotation = FVector(local_137, local_148.Y, local_148.Z);
                local_22.AttachScale = local_137;
            }
        }
        InOutFashion.Decos.Add(local_22);
        return;
    }
    void ApplyDecoFashionIdToPreview(const EFashionSlotType SlotType, const uint FashionId)
    {
        int local_4 = this.GetPreviewFashion().Decos.Num() - 1;
        for (; local_4 >= 0; --local_4)
        {
            if (this.GetPreviewFashion().Decos[local_4].SlotType == int(SlotType))
            {
                this.GetModify_PreviewFashion().Decos.RemoveAt(local_4);
            }
        }
        if (FashionId == 0)
        {
            return;
        }
        FFashionDecoPoint local_22;
        local_22.SlotType = int(SlotType);
        local_22.FashionID = FashionId;
        if (::FFashionConfig::GetByDataId(FashionId))
        {
            CastTo local_74;
            if (local_74.opCall())
            {
                FFloat3 local_126;
                FFloat3 local_130;
                local_126 = local_130;
                local_22.AttachOffset = FVector(local_126.X, local_126.Y, local_126.Z);
                FFloat3 local_148;
                local_148 = local_130;
                float32 local_137 = local_148.X;
                local_22.AttachRotation = FVector(local_137, local_148.Y, local_148.Z);
                local_22.AttachScale = local_137;
            }
        }
        this.GetModify_PreviewFashion().Decos.Add(local_22);
        return;
    }
    int FindCombinedSlotIndex(const EFashionSlotType SlotType, const EFashionSlotSubTab SlotSubTab) const
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
        int __r; return __r;
    }
    bool ResolveCombinedSlot(const int CombinedIndex, EFashionSlotType &inout OutSlotType, EFashionSlotSubTab &inout OutSlotSubTab) const
    {
        TArray<EFashionSlotType> local_4;
        int local_57 = 0;
        this.CollectConfiguredSlotsForCurrentMainTab(local_4);
        if (local_4.IsValidIndex(CombinedIndex))
        {
            if (::FashionSettings::GetSlotConfig(EFashionSlotType(local_4[CombinedIndex])))
            {
                OutSlotType = EFashionSlotType(local_4[CombinedIndex]);
                OutSlotSubTab = EFashionSlotSubTab(local_57);
                return true;
            }
        }
        return false;
    }
    void SaveCurrentMainTabSelection()
    {
        if (int(this.GetSelectedSlotType()) == 0)
        {
            return;
        }
        if (int(this.GetCurrentMainTab()) == 1)
        {
            this.SetMountSavedSlotType(EFashionSlotType(this.GetSelectedSlotType()));
            this.SetMountSavedSlotSubTab(this.GetSelectedSlotSubTab());
            this.SetbHasMountSavedSlot(true);
            return;
        }
        this.SetClothSavedSlotType(EFashionSlotType(this.GetSelectedSlotType()));
        this.SetClothSavedSlotSubTab(this.GetSelectedSlotSubTab());
        this.SetbHasClothSavedSlot(true);
        return;
    }
    void RestoreSavedMainTabSelectionOrDefault()
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    void RefreshWardrobeTextState()
    {
        this.SetWardrobeGroupTitleText(::FashionSettings::GetSubTabText(this.GetCurrentMainTab(), EFashionSlotSubTab(0)));
        this.SetOrnamentGroupTitleText(::FashionSettings::GetSubTabText(this.GetCurrentMainTab(), EFashionSlotSubTab(1)));
        if (this.GetContentSwitcherIndex() == 0 || (int(this.GetSelectedSlotType()) == 0))
        {
            this.SetPageTitleText(::FashionSettings::GetSystemName());
            return;
        }
        int local_1 = int(this.GetSelectedSlotSubTab());
        this.SetPageTitleText(FText::Format(NSLOCTEXT("AvatarWardrobe_PageTitleFormat", "{0} <Beige24>/ {1}</>"), ::FashionSettings::GetSubTabText(this.GetCurrentMainTab()), ::FashionSettings::GetFashionSlotName(EFashionSlotType(this.GetSelectedSlotType()))));
        return;
    }
    void SelectDefaultSlotForCurrentMainTab()
    {
        EFashionSlotSubTab local_9;
        TArray<EFashionSlotType> local_4;
        this.CollectConfiguredSlotsForCurrentMainTab(local_4);
        if ((local_4.Num()) == 0)
        {
            this.SetSelectedSlotType(EFashionSlotType(EFashionSlotType(0)));
            local_9 = EFashionSlotSubTab(0);
            this.SetSelectedSlotSubTab(EFashionSlotSubTab(local_9));
            this.SetSelectedSlotIndex(INDEX_NONE);
            this.SetListSwitcherIndex(0);
            return;
        }
        this.SetSelectedSlotType(EFashionSlotType(local_4[0]));
        if (::FashionSettings::GetSlotConfig(EFashionSlotType(this.GetSelectedSlotType())))
        {
            EFashionSlotSubTab local_59;
            local_9 = local_59;
        }
        else
        {
            local_9 = EFashionSlotSubTab(0);
        }
        this.SetSelectedSlotSubTab(EFashionSlotSubTab(local_9));
        this.SetSelectedSlotIndex(0);
        int local_60 = (int(this.GetSelectedSlotSubTab())) == 0 ? 0 : 1;
        this.SetListSwitcherIndex(local_60);
        this.SaveCurrentMainTabSelection();
        return;
    }
    void CollectConfiguredSlotsForSubTab(const EFashionSlotSubTab SlotSubTab, TArray<EFashionSlotType> &inout OutSlots) const
    {
        OutSlots.Empty(0);
        TArray<EFashionSlotType> local_6;
        this.CollectConfiguredSlotsForCurrentMainTab(local_6);
        int local_7 = 0;
        for (; local_7 < local_6.Num(); ++local_7)
        {
            if (::FashionSettings::GetSlotConfig(EFashionSlotType(local_6[local_7])) && (0 == int(SlotSubTab)))
            {
                OutSlots.Add(local_6[local_7]);
            }
        }
        return;
    }
    void CollectConfiguredSlotsForCurrentMainTab(TArray<EFashionSlotType> &inout OutSlots) const
    {
        int local_64 = 0;
        OutSlots.Empty(0);
        if (!(this.CanShowMainTab(EFashionSlotMainTab(this.GetCurrentMainTab()))))
        {
            return;
        }
        TArray<EFashionSlotType> local_8;
        this.AppendKnownWardrobeSlotCandidates(local_8);
        int local_9 = 0;
        for (; local_9 < local_8.Num(); ++local_9)
        {
            if (::FashionSettings::GetSlotConfig(EFashionSlotType(local_8[local_9])) && (0 == int(this.GetCurrentMainTab())) && this.HasVisibleFashionForSlot(EFashionSlotType(local_8[local_9]), EFashionSlotSubTab(local_64)))
            {
                OutSlots.Add(local_8[local_9]);
            }
        }
        return;
    }
    bool HasVisibleFashionForSlot(const EFashionSlotType SlotType, const EFashionSlotSubTab SlotSubTab) const
    {
        TArray<TDataObjectPtr<FFashionConfig>> local_4;
        this.CollectFashionConfigsForSlot(EFashionSlotType(SlotType), EFashionSlotSubTab(SlotSubTab), local_4);
        return (local_4.Num() > 0);
    }
    void AppendKnownWardrobeSlotCandidates(TArray<EFashionSlotType> &inout OutSlots) const
    {
        OutSlots.Add(EFashionSlotType(1));
        OutSlots.Add(EFashionSlotType(2));
        OutSlots.Add(EFashionSlotType(3));
        OutSlots.Add(EFashionSlotType(4));
        OutSlots.Add(EFashionSlotType(5));
        OutSlots.Add(EFashionSlotType(6));
        OutSlots.Add(EFashionSlotType(101));
        OutSlots.Add(EFashionSlotType(102));
        OutSlots.Add(EFashionSlotType(103));
        OutSlots.Add(EFashionSlotType(104));
        OutSlots.Add(EFashionSlotType(105));
        OutSlots.Add(EFashionSlotType(106));
        OutSlots.Add(EFashionSlotType(107));
        OutSlots.Add(EFashionSlotType(108));
        OutSlots.Add(EFashionSlotType(201));
        OutSlots.Add(EFashionSlotType(202));
        return;
    }
    void ApplyCurrentWardrobeShowcaseConfig()
    {
        if (this.GetContentSwitcherIndex() == 1)
        {
            this.ApplySelectedSlotShowcaseConfig();
            return;
        }
        this.ApplyOverviewShowcaseConfig();
        return;
    }
    void ApplySelectedSlotShowcaseConfig()
    {
        if (!(this.GetShowcase()))
        {
            return;
        }
        if (!(::FashionSettings::GetSlotConfig(EFashionSlotType(this.GetSelectedSlotType()))) || !(GetShowcaseConfig()))
        {
            return;
        }
        TEUIModelRef<FVM_AvatarShowcase> local_2 = this.GetShowcase();
        GetShowcaseConfig().EnsureShowcaseConfigAndSwitch();
        return;
    }
    void ApplyOverviewShowcaseConfig()
    {
        if (!(this.GetShowcase()))
        {
            return;
        }
        if ((int(this.GetCurrentMainTab())) != 1)
        {
            TEUIModelRef<FVM_AvatarShowcase> local_2 = this.GetShowcase();
            0.ChangeShowcaseConfigIndex();
            return;
        }
        TDataObjectPtr<FUIShowcaseConfig> local_54 = this.ResolveMountOverviewShowcaseConfig();
        if (!(local_54))
        {
            return;
        }
        TEUIModelRef<FVM_AvatarShowcase> local_2_2 = this.GetShowcase();
        local_54.EnsureShowcaseConfigAndSwitch();
        return;
    }
    TDataObjectPtr<FUIShowcaseConfig> ResolveMountOverviewShowcaseConfig() const
    {
        if (!(!(::FashionSettings::GetSlotConfig(EFashionSlotType(201)))) && GetShowcaseConfig())
        {
            return GetShowcaseConfig();
        }
        return TDataObjectPtr<FUIShowcaseConfig>();
    }
    bool CanShowMainTab(const EFashionSlotMainTab MainTab) const
    {
        if (int(MainTab) == 1)
        {
            return this.IsFashionMountUnlocked();
        }
        return true;
    }
    void EnsureCurrentMainTabAllowed()
    {
        if (!(this.CanShowMainTab(this.GetCurrentMainTab())))
        {
            this.SetCurrentMainTab(EFashionSlotMainTab(0));
            this.SetSelectedSlotType(EFashionSlotType(0));
            this.SetSelectedSlotSubTab(EFashionSlotSubTab(0));
            this.SetSelectedSlotIndex(INDEX_NONE);
        }
        return;
    }
    TEUIModelRef<FVM_AvatarInfo> GetEditingAvatar() const property
    {
        this.TrackPropertyRead(0);
        return this.m_EditingAvatar;
    }
    void SetEditingAvatar(const TEUIModelRef<FVM_AvatarInfo> &inout __Value) property
    {
        TEUIModelRef<FVM_AvatarInfo> local_2;
        local_2 = this.m_EditingAvatar;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_EditingAvatar = __Value;
        return;
    }
    TEUIModelRef<FVM_AvatarShowcase> GetShowcase() const property
    {
        this.TrackPropertyRead(1);
        return this.m_Showcase;
    }
    void SetShowcase(const TEUIModelRef<FVM_AvatarShowcase> &inout __Value) property
    {
        TEUIModelRef<FVM_AvatarShowcase> local_2;
        local_2 = this.m_Showcase;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_Showcase = __Value;
        return;
    }
    int GetContentSwitcherIndex() const property
    {
        this.TrackPropertyRead(2);
        return this.m_ContentSwitcherIndex;
    }
    void SetContentSwitcherIndex(const int __Value) property
    {
        if (this.m_ContentSwitcherIndex == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_ContentSwitcherIndex = __Value;
        return;
    }
    int GetListSwitcherIndex() const property
    {
        this.TrackPropertyRead(3);
        return this.m_ListSwitcherIndex;
    }
    void SetListSwitcherIndex(const int __Value) property
    {
        if (this.m_ListSwitcherIndex == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_ListSwitcherIndex = __Value;
        return;
    }
    int GetSelectedSlotIndex() const property
    {
        this.TrackPropertyRead(4);
        return this.m_SelectedSlotIndex;
    }
    void SetSelectedSlotIndex(const int __Value) property
    {
        if (this.m_SelectedSlotIndex == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_SelectedSlotIndex = __Value;
        return;
    }
    EFashionSlotType GetSelectedSlotType() const property
    {
        this.TrackPropertyRead(5);
        return this.m_SelectedSlotType;
    }
    void SetSelectedSlotType(const EFashionSlotType __Value) property
    {
        if (int(this.m_SelectedSlotType) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_SelectedSlotType = __Value;
        return;
    }
    EFashionSlotSubTab GetSelectedSlotSubTab() const property
    {
        this.TrackPropertyRead(6);
        return this.m_SelectedSlotSubTab;
    }
    void SetSelectedSlotSubTab(const EFashionSlotSubTab __Value) property
    {
        if (int(this.m_SelectedSlotSubTab) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_SelectedSlotSubTab = __Value;
        return;
    }
    EFashionSlotMainTab GetCurrentMainTab() const property
    {
        this.TrackPropertyRead(7);
        return this.m_CurrentMainTab;
    }
    void SetCurrentMainTab(const EFashionSlotMainTab __Value) property
    {
        if (int(this.m_CurrentMainTab) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(7);
        this.m_CurrentMainTab = __Value;
        return;
    }
    const TArray<FEUIModelContainer> GetMainTabItems() const property
    {
        const TArray<FEUIModelContainer> __r;
        this.TrackPropertyRead(8);
        return __r;
    }
    TArray<FEUIModelContainer> GetModify_MainTabItems() property
    {
        TArray<FEUIModelContainer> __r;
        this.MarkPropertyDirty(8);
        return __r;
    }
    void SetMainTabItems(const TArray<FEUIModelContainer> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(8);
        this.m_MainTabItems = __Value;
        return;
    }
    const FEUIModelContainer GetSelectedMainTabItem() const property
    {
        const FEUIModelContainer __r;
        this.TrackPropertyRead(9);
        return __r;
    }
    FEUIModelContainer GetModify_SelectedMainTabItem() property
    {
        FEUIModelContainer __r;
        this.MarkPropertyDirty(9);
        return __r;
    }
    void SetSelectedMainTabItem(const FEUIModelContainer &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(9);
        this.m_SelectedMainTabItem = __Value;
        return;
    }
    const FText GetPageTitleText() const property
    {
        const FText __r;
        this.TrackPropertyRead(10);
        return __r;
    }
    FText GetModify_PageTitleText() property
    {
        FText __r;
        this.MarkPropertyDirty(10);
        return __r;
    }
    void SetPageTitleText(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(10);
        this.m_PageTitleText = __Value;
        return;
    }
    const FText GetWardrobeGroupTitleText() const property
    {
        const FText __r;
        this.TrackPropertyRead(11);
        return __r;
    }
    FText GetModify_WardrobeGroupTitleText() property
    {
        FText __r;
        this.MarkPropertyDirty(11);
        return __r;
    }
    void SetWardrobeGroupTitleText(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(11);
        this.m_WardrobeGroupTitleText = __Value;
        return;
    }
    const FText GetOrnamentGroupTitleText() const property
    {
        const FText __r;
        this.TrackPropertyRead(12);
        return __r;
    }
    FText GetModify_OrnamentGroupTitleText() property
    {
        FText __r;
        this.MarkPropertyDirty(12);
        return __r;
    }
    void SetOrnamentGroupTitleText(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(12);
        this.m_OrnamentGroupTitleText = __Value;
        return;
    }
    bool GetbHasWardrobeGroupSlots() const property
    {
        this.TrackPropertyRead(13);
        return this.m_bHasWardrobeGroupSlots;
    }
    void SetbHasWardrobeGroupSlots(const bool __Value) property
    {
        if (!(this.m_bHasWardrobeGroupSlots) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(13);
        this.m_bHasWardrobeGroupSlots = __Value;
        return;
    }
    bool GetbHasOrnamentGroupSlots() const property
    {
        this.TrackPropertyRead(14);
        return this.m_bHasOrnamentGroupSlots;
    }
    void SetbHasOrnamentGroupSlots(const bool __Value) property
    {
        if (!(this.m_bHasOrnamentGroupSlots) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(14);
        this.m_bHasOrnamentGroupSlots = __Value;
        return;
    }
    const TArray<FEUIDynamicWidgetData> GetClothSlotEntryDataList() const property
    {
        const TArray<FEUIDynamicWidgetData> __r;
        this.TrackPropertyRead(15);
        return __r;
    }
    TArray<FEUIDynamicWidgetData> GetModify_ClothSlotEntryDataList() property
    {
        TArray<FEUIDynamicWidgetData> __r;
        this.MarkPropertyDirty(15);
        return __r;
    }
    void SetClothSlotEntryDataList(const TArray<FEUIDynamicWidgetData> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(15);
        this.m_ClothSlotEntryDataList = __Value;
        return;
    }
    const TArray<FEUIModelContainer> GetOrnamentSlotItems() const property
    {
        const TArray<FEUIModelContainer> __r;
        this.TrackPropertyRead(16);
        return __r;
    }
    TArray<FEUIModelContainer> GetModify_OrnamentSlotItems() property
    {
        TArray<FEUIModelContainer> __r;
        this.MarkPropertyDirty(16);
        return __r;
    }
    void SetOrnamentSlotItems(const TArray<FEUIModelContainer> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(16);
        this.m_OrnamentSlotItems = __Value;
        return;
    }
    const TArray<FEUIModelContainer> GetHighFashionItems() const property
    {
        const TArray<FEUIModelContainer> __r;
        this.TrackPropertyRead(17);
        return __r;
    }
    TArray<FEUIModelContainer> GetModify_HighFashionItems() property
    {
        TArray<FEUIModelContainer> __r;
        this.MarkPropertyDirty(17);
        return __r;
    }
    void SetHighFashionItems(const TArray<FEUIModelContainer> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(17);
        this.m_HighFashionItems = __Value;
        return;
    }
    const FEUIModelContainer GetSelectedHighFashionItem() const property
    {
        const FEUIModelContainer __r;
        this.TrackPropertyRead(18);
        return __r;
    }
    FEUIModelContainer GetModify_SelectedHighFashionItem() property
    {
        FEUIModelContainer __r;
        this.MarkPropertyDirty(18);
        return __r;
    }
    void SetSelectedHighFashionItem(const FEUIModelContainer &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(18);
        this.m_SelectedHighFashionItem = __Value;
        return;
    }
    const TArray<FEUIModelContainer> GetTileFashionItems() const property
    {
        const TArray<FEUIModelContainer> __r;
        this.TrackPropertyRead(19);
        return __r;
    }
    TArray<FEUIModelContainer> GetModify_TileFashionItems() property
    {
        TArray<FEUIModelContainer> __r;
        this.MarkPropertyDirty(19);
        return __r;
    }
    void SetTileFashionItems(const TArray<FEUIModelContainer> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(19);
        this.m_TileFashionItems = __Value;
        return;
    }
    const FEUIModelContainer GetSelectedTileFashionItem() const property
    {
        const FEUIModelContainer __r;
        this.TrackPropertyRead(20);
        return __r;
    }
    FEUIModelContainer GetModify_SelectedTileFashionItem() property
    {
        FEUIModelContainer __r;
        this.MarkPropertyDirty(20);
        return __r;
    }
    void SetSelectedTileFashionItem(const FEUIModelContainer &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(20);
        this.m_SelectedTileFashionItem = __Value;
        return;
    }
    const TArray<FEUIModelContainer> GetSelectionTabItems() const property
    {
        const TArray<FEUIModelContainer> __r;
        this.TrackPropertyRead(21);
        return __r;
    }
    TArray<FEUIModelContainer> GetModify_SelectionTabItems() property
    {
        TArray<FEUIModelContainer> __r;
        this.MarkPropertyDirty(21);
        return __r;
    }
    void SetSelectionTabItems(const TArray<FEUIModelContainer> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(21);
        this.m_SelectionTabItems = __Value;
        return;
    }
    const FEUIModelContainer GetSelectedSlotTabItem() const property
    {
        const FEUIModelContainer __r;
        this.TrackPropertyRead(22);
        return __r;
    }
    FEUIModelContainer GetModify_SelectedSlotTabItem() property
    {
        FEUIModelContainer __r;
        this.MarkPropertyDirty(22);
        return __r;
    }
    void SetSelectedSlotTabItem(const FEUIModelContainer &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(22);
        this.m_SelectedSlotTabItem = __Value;
        return;
    }
    TEUIModelRef<FVM_CommonDisplayDetail> GetSelectedDisplayDetail() const property
    {
        this.TrackPropertyRead(23);
        return this.m_SelectedDisplayDetail;
    }
    void SetSelectedDisplayDetail(const TEUIModelRef<FVM_CommonDisplayDetail> &inout __Value) property
    {
        TEUIModelRef<FVM_CommonDisplayDetail> local_2;
        local_2 = this.m_SelectedDisplayDetail;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(23);
        this.m_SelectedDisplayDetail = __Value;
        return;
    }
    const TArray<TEUIModelRef<FVM_AvatarWardrobeSlotItem>> GetClothSlotModels() const property
    {
        const TArray<TEUIModelRef<FVM_AvatarWardrobeSlotItem>> __r;
        this.TrackPropertyRead(24);
        return __r;
    }
    TArray<TEUIModelRef<FVM_AvatarWardrobeSlotItem>> GetModify_ClothSlotModels() property
    {
        TArray<TEUIModelRef<FVM_AvatarWardrobeSlotItem>> __r;
        this.MarkPropertyDirty(24);
        return __r;
    }
    void SetClothSlotModels(const TArray<TEUIModelRef<FVM_AvatarWardrobeSlotItem>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(24);
        this.m_ClothSlotModels = __Value;
        return;
    }
    const TArray<TEUIModelRef<FVM_AvatarWardrobeSlotItem>> GetOrnamentSlotModels() const property
    {
        const TArray<TEUIModelRef<FVM_AvatarWardrobeSlotItem>> __r;
        this.TrackPropertyRead(25);
        return __r;
    }
    TArray<TEUIModelRef<FVM_AvatarWardrobeSlotItem>> GetModify_OrnamentSlotModels() property
    {
        TArray<TEUIModelRef<FVM_AvatarWardrobeSlotItem>> __r;
        this.MarkPropertyDirty(25);
        return __r;
    }
    void SetOrnamentSlotModels(const TArray<TEUIModelRef<FVM_AvatarWardrobeSlotItem>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(25);
        this.m_OrnamentSlotModels = __Value;
        return;
    }
    const TArray<TEUIModelRef<FVM_AvatarWardrobeFashionOption>> GetCurrentFashionOptions() const property
    {
        const TArray<TEUIModelRef<FVM_AvatarWardrobeFashionOption>> __r;
        this.TrackPropertyRead(26);
        return __r;
    }
    TArray<TEUIModelRef<FVM_AvatarWardrobeFashionOption>> GetModify_CurrentFashionOptions() property
    {
        TArray<TEUIModelRef<FVM_AvatarWardrobeFashionOption>> __r;
        this.MarkPropertyDirty(26);
        return __r;
    }
    void SetCurrentFashionOptions(const TArray<TEUIModelRef<FVM_AvatarWardrobeFashionOption>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(26);
        this.m_CurrentFashionOptions = __Value;
        return;
    }
    const TArray<TEUIModelRef<FVM_CommonTabItem>> GetSlotTabSelectableItems() const property
    {
        const TArray<TEUIModelRef<FVM_CommonTabItem>> __r;
        this.TrackPropertyRead(27);
        return __r;
    }
    TArray<TEUIModelRef<FVM_CommonTabItem>> GetModify_SlotTabSelectableItems() property
    {
        TArray<TEUIModelRef<FVM_CommonTabItem>> __r;
        this.MarkPropertyDirty(27);
        return __r;
    }
    void SetSlotTabSelectableItems(const TArray<TEUIModelRef<FVM_CommonTabItem>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(27);
        this.m_SlotTabSelectableItems = __Value;
        return;
    }
    const TArray<TEUIModelRef<FVM_CommonTabItem>> GetMainTabSelectableItems() const property
    {
        const TArray<TEUIModelRef<FVM_CommonTabItem>> __r;
        this.TrackPropertyRead(28);
        return __r;
    }
    TArray<TEUIModelRef<FVM_CommonTabItem>> GetModify_MainTabSelectableItems() property
    {
        TArray<TEUIModelRef<FVM_CommonTabItem>> __r;
        this.MarkPropertyDirty(28);
        return __r;
    }
    void SetMainTabSelectableItems(const TArray<TEUIModelRef<FVM_CommonTabItem>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(28);
        this.m_MainTabSelectableItems = __Value;
        return;
    }
    EFashionSlotType GetClothSavedSlotType() const property
    {
        this.TrackPropertyRead(29);
        return this.m_ClothSavedSlotType;
    }
    void SetClothSavedSlotType(const EFashionSlotType __Value) property
    {
        if (int(this.m_ClothSavedSlotType) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(29);
        this.m_ClothSavedSlotType = __Value;
        return;
    }
    EFashionSlotSubTab GetClothSavedSlotSubTab() const property
    {
        this.TrackPropertyRead(30);
        return this.m_ClothSavedSlotSubTab;
    }
    void SetClothSavedSlotSubTab(const EFashionSlotSubTab __Value) property
    {
        if (int(this.m_ClothSavedSlotSubTab) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(30);
        this.m_ClothSavedSlotSubTab = __Value;
        return;
    }
    bool GetbHasClothSavedSlot() const property
    {
        this.TrackPropertyRead(31);
        return this.m_bHasClothSavedSlot;
    }
    void SetbHasClothSavedSlot(const bool __Value) property
    {
        if (!(this.m_bHasClothSavedSlot) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(31);
        this.m_bHasClothSavedSlot = __Value;
        return;
    }
    EFashionSlotType GetMountSavedSlotType() const property
    {
        this.TrackPropertyRead(32);
        return this.m_MountSavedSlotType;
    }
    void SetMountSavedSlotType(const EFashionSlotType __Value) property
    {
        if (int(this.m_MountSavedSlotType) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(32);
        this.m_MountSavedSlotType = __Value;
        return;
    }
    EFashionSlotSubTab GetMountSavedSlotSubTab() const property
    {
        this.TrackPropertyRead(33);
        return this.m_MountSavedSlotSubTab;
    }
    void SetMountSavedSlotSubTab(const EFashionSlotSubTab __Value) property
    {
        if (int(this.m_MountSavedSlotSubTab) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(33);
        this.m_MountSavedSlotSubTab = __Value;
        return;
    }
    bool GetbHasMountSavedSlot() const property
    {
        this.TrackPropertyRead(34);
        return this.m_bHasMountSavedSlot;
    }
    void SetbHasMountSavedSlot(const bool __Value) property
    {
        if (!(this.m_bHasMountSavedSlot) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(34);
        this.m_bHasMountSavedSlot = __Value;
        return;
    }
    const FAvatarFashion GetPreviewFashion() const property
    {
        const FAvatarFashion __r;
        this.TrackPropertyRead(35);
        return __r;
    }
    FAvatarFashion GetModify_PreviewFashion() property
    {
        FAvatarFashion __r;
        this.MarkPropertyDirty(35);
        return __r;
    }
    void SetPreviewFashion(const FAvatarFashion &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(35);
        return;
    }
    const FAvatarFashion GetOriginalFashion() const property
    {
        const FAvatarFashion __r;
        this.TrackPropertyRead(36);
        return __r;
    }
    FAvatarFashion GetModify_OriginalFashion() property
    {
        FAvatarFashion __r;
        this.MarkPropertyDirty(36);
        return __r;
    }
    void SetOriginalFashion(const FAvatarFashion &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(36);
        return;
    }
    bool GetbHasOriginalFashion() const property
    {
        this.TrackPropertyRead(37);
        return this.m_bHasOriginalFashion;
    }
    void SetbHasOriginalFashion(const bool __Value) property
    {
        if (!(this.m_bHasOriginalFashion) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(37);
        this.m_bHasOriginalFashion = __Value;
        return;
    }
    bool GetbPreviewInitialized() const property
    {
        this.TrackPropertyRead(38);
        return this.m_bPreviewInitialized;
    }
    void SetbPreviewInitialized(const bool __Value) property
    {
        if (!(this.m_bPreviewInitialized) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(38);
        this.m_bPreviewInitialized = __Value;
        return;
    }
    bool GetbPreviewAppliedToFashionModel() const property
    {
        this.TrackPropertyRead(39);
        return this.m_bPreviewAppliedToFashionModel;
    }
    void SetbPreviewAppliedToFashionModel(const bool __Value) property
    {
        if (!(this.m_bPreviewAppliedToFashionModel) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(39);
        this.m_bPreviewAppliedToFashionModel = __Value;
        return;
    }
    uint GetPreviewMountID() const property
    {
        this.TrackPropertyRead(40);
        return this.m_PreviewMountID;
    }
    void SetPreviewMountID(const uint __Value) property
    {
        if (this.m_PreviewMountID == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(40);
        this.m_PreviewMountID = __Value;
        return;
    }
    uint GetPreviewMountDecoID() const property
    {
        this.TrackPropertyRead(41);
        return this.m_PreviewMountDecoID;
    }
    void SetPreviewMountDecoID(const uint __Value) property
    {
        if (this.m_PreviewMountDecoID == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(41);
        this.m_PreviewMountDecoID = __Value;
        return;
    }
    bool GetbHasPreviewMountOverride() const property
    {
        this.TrackPropertyRead(42);
        return this.m_bHasPreviewMountOverride;
    }
    void SetbHasPreviewMountOverride(const bool __Value) property
    {
        if (!(this.m_bHasPreviewMountOverride) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(42);
        this.m_bHasPreviewMountOverride = __Value;
        return;
    }
    bool GetbIsFashionMountUnlocked() const property
    {
        this.TrackPropertyRead(43);
        return this.m_bIsFashionMountUnlocked;
    }
    void SetbIsFashionMountUnlocked(const bool __Value) property
    {
        if (!(this.m_bIsFashionMountUnlocked) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(43);
        this.m_bIsFashionMountUnlocked = __Value;
        return;
    }
    bool GetbHasSelectedFashionOptionInCurrentList() const property
    {
        this.TrackPropertyRead(44);
        return this.m_bHasSelectedFashionOptionInCurrentList;
    }
    void SetbHasSelectedFashionOptionInCurrentList(const bool __Value) property
    {
        if (!(this.m_bHasSelectedFashionOptionInCurrentList) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(44);
        this.m_bHasSelectedFashionOptionInCurrentList = __Value;
        return;
    }
    bool GetbHasProcessedBoundFashionOptionSelection() const property
    {
        this.TrackPropertyRead(45);
        return this.m_bHasProcessedBoundFashionOptionSelection;
    }
    void SetbHasProcessedBoundFashionOptionSelection(const bool __Value) property
    {
        if (!(this.m_bHasProcessedBoundFashionOptionSelection) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(45);
        this.m_bHasProcessedBoundFashionOptionSelection = __Value;
        return;
    }
    EFashionSlotType GetProcessedBoundFashionSlotType() const property
    {
        this.TrackPropertyRead(46);
        return this.m_ProcessedBoundFashionSlotType;
    }
    void SetProcessedBoundFashionSlotType(const EFashionSlotType __Value) property
    {
        if (int(this.m_ProcessedBoundFashionSlotType) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(46);
        this.m_ProcessedBoundFashionSlotType = __Value;
        return;
    }
    EFashionSlotSubTab GetProcessedBoundFashionSlotSubTab() const property
    {
        this.TrackPropertyRead(47);
        return this.m_ProcessedBoundFashionSlotSubTab;
    }
    void SetProcessedBoundFashionSlotSubTab(const EFashionSlotSubTab __Value) property
    {
        if (int(this.m_ProcessedBoundFashionSlotSubTab) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(47);
        this.m_ProcessedBoundFashionSlotSubTab = __Value;
        return;
    }
    bool GetbProcessedBoundFashionIsUnequip() const property
    {
        this.TrackPropertyRead(48);
        return this.m_bProcessedBoundFashionIsUnequip;
    }
    void SetbProcessedBoundFashionIsUnequip(const bool __Value) property
    {
        if (!(this.m_bProcessedBoundFashionIsUnequip) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(48);
        this.m_bProcessedBoundFashionIsUnequip = __Value;
        return;
    }
    uint GetProcessedBoundFashionId() const property
    {
        this.TrackPropertyRead(49);
        return this.m_ProcessedBoundFashionId;
    }
    void SetProcessedBoundFashionId(const uint __Value) property
    {
        if (this.m_ProcessedBoundFashionId == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(49);
        this.m_ProcessedBoundFashionId = __Value;
        return;
    }
    int GetActionStateRevision() const property
    {
        this.TrackPropertyRead(50);
        return this.m_ActionStateRevision;
    }
    void SetActionStateRevision(const int __Value) property
    {
        if (this.m_ActionStateRevision == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(50);
        this.m_ActionStateRevision = __Value;
        return;
    }
    int GetPendingNavigationType() const property
    {
        this.TrackPropertyRead(51);
        return this.m_PendingNavigationType;
    }
    void SetPendingNavigationType(const int __Value) property
    {
        if (this.m_PendingNavigationType == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(51);
        this.m_PendingNavigationType = __Value;
        return;
    }
    EFashionSlotMainTab GetPendingMainTab() const property
    {
        this.TrackPropertyRead(52);
        return this.m_PendingMainTab;
    }
    void SetPendingMainTab(const EFashionSlotMainTab __Value) property
    {
        if (int(this.m_PendingMainTab) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(52);
        this.m_PendingMainTab = __Value;
        return;
    }
}

struct FVM_AvatarWardrobeEntrance : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    bool m_bIsVisible;
    UPROPERTY()
    bool m_bIsUnlocked;
    UPROPERTY()
    TEUIModelRef<FVM_RedDot> m_RedDotVM;
    UPROPERTY()
    bool m_bDisplayHasRedDot;

    FVM_AvatarWardrobeEntrance()
    {
        this.m_bIsVisible = true;
        this.m_bIsUnlocked = true;
        this.m_bDisplayHasRedDot = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVM_AvatarWardrobeEntrance(const FVM_AvatarWardrobeEntrance &inout Other)
    {
        this.m_bIsVisible = true;
        this.m_bIsUnlocked = true;
        this.m_bDisplayHasRedDot = false;
        this.m_bIsVisible = Other.m_bIsVisible;
        this.m_bIsUnlocked = Other.m_bIsUnlocked;
        this.m_RedDotVM = Other.m_RedDotVM;
        this.m_bDisplayHasRedDot = Other.m_bDisplayHasRedDot;
        return;
    }
    FVM_AvatarWardrobeEntrance opAssign(const FVM_AvatarWardrobeEntrance &inout Other)
    {
        FVM_AvatarWardrobeEntrance __r;
        this.m_bIsVisible = Other.m_bIsVisible;
        this.m_bIsUnlocked = Other.m_bIsUnlocked;
        this.m_RedDotVM = Other.m_RedDotVM;
        this.m_bDisplayHasRedDot = Other.m_bDisplayHasRedDot;
        return __r;
    }
    void PostLoad()
    {
        this.RefreshCurrentAvatarWardrobeRedDotState();
        return;
    }
    bool HasRedDot() const
    {
        return this.GetbDisplayHasRedDot();
    }
    void RefreshRedDotDisplayState()
    {
        this.RefreshCurrentAvatarWardrobeRedDotState();
        return;
    }
    void OnAvatarWardrobeRedDotChanged(const FMsg_AvatarWardrobeRedDotChanged &inout Msg)
    {
        this.RefreshCurrentAvatarWardrobeRedDotState();
        return;
    }
    ESlateVisibility GetEntranceVisibility() const
    {
        int local_2;
        if (this.GetbIsVisible())
        {
            local_2 = 4;
        }
        else
        {
            local_2 = 1;
        }
        return ESlateVisibility(local_2);
    }
    bool GetIsSelectedAvatarLocked() const
    {
        return !(this.IsSelectedAvatarUnlocked(this.ResolveSelectedAvatar()));
    }
    void HandleWardrobeClicked()
    {
        TEUIModelRef<FVM_AvatarInfo> local_4 = this.ResolveSelectedAvatar();
        if (!(this.GetbIsVisible()) || !(this.GetbIsUnlocked()) || !(this.IsSelectedAvatarUnlocked(local_4)))
        {
            return;
        }
        bool local_6 = true;
        if (!(::FMS_SystemControl::Get(this.GetContext().Manager).IsSystemUnlock(ESystemModule(18), local_6)))
        {
            return;
        }
        FVM_AvatarMainWardrobe& local_10 = ::FVM_AvatarMainWardrobe::Create(this.GetManager());
        local_10.SetEditingAvatar(local_4);
        FEUIWidget::AddWidget(this.GetContext().UELocalPlayer, GameplayTags::UI_Type_Wardrobe, FEUIModelRef(local_10), FEUIModelRef(::FVM_AvatarShowcase::Create(this.GetManager())));
        return;
    }
    bool IsSelectedAvatarUnlocked(const TEUIModelRef<FVM_AvatarInfo> &inout SelectedAvatar) const
    {
        TEUIModelRef<FM_Avatar> local_4;
        bool local_1 = !(SelectedAvatar);
        if (local_1)
        {
            local_1 = true;
        }
        else
        {
            local_4.GetAvatar();
            local_1 = !(local_4);
        }
        if (local_1)
        {
            return false;
        }
        local_4.GetAvatar();
        return GetbIsUnlocked();
    }
    TEUIModelRef<FVM_AvatarInfo> ResolveSelectedAvatar() const
    {
        FVM_MainMenuAvatar& local_8 = FEUIWidgetRef::GetViewModel(this.GetOwnerWidget()).opCall(NAME_None);
        if (local_8)
        {
            return local_8.GetSelectedAvatar();
        }
        return TEUIModelRef<FVM_AvatarInfo>();
    }
    FRedDotNodeData MakeWardrobeEntranceRedDotNodeData(const TEUIModelRef<FVM_AvatarInfo> &inout SelectedAvatar) const
    {
        FRedDotNodeData __r;
        FRedDotNodeData local_6 = FRedDotNodeData(GameplayTags::RedDotSystem_Fashion_AvatarWardrobeEntrance, this.GetWardrobeEntranceRedDotExtraDataId(SelectedAvatar));
        return __r;
    }
    void RefreshCurrentAvatarWardrobeRedDotState()
    {
        TEUIModelRef<FVM_AvatarInfo> local_4 = this.ResolveSelectedAvatar();
        FRedDotNodeData local_12 = this.MakeWardrobeEntranceRedDotNodeData(local_4);
        this.EnsureWardrobeEntranceRedDotVM(local_12);
        bool local_14 = local_12.NodeTag.IsValid() && this.HasCurrentAvatarWardrobeRedDot(local_4);
        this.SetbDisplayHasRedDot(local_14);
        this.RefreshWardrobeEntranceRedDotNode(local_12, local_14);
        return;
    }
    void EnsureWardrobeEntranceRedDotVM(const FRedDotNodeData &inout NodeData)
    {
        bool local_3 = !(this.GetRedDotVM().IsValid());
        if (local_3)
        {
            local_3 = true;
        }
        else
        {
            TEUIModelRef<FVM_RedDot> local_2 = this.GetRedDotVM();
            local_3 = (GetNodeData().ExtraDataId != NodeData.ExtraDataId);
        }
        if (local_3)
        {
            local_3 = true;
        }
        else
        {
            TEUIModelRef<FVM_RedDot> local_2_2 = this.GetRedDotVM();
            local_3 = !((GetNodeData().NodeTag.GetTagName() == NodeData.NodeTag.GetTagName()));
        }
        if (local_3)
        {
            this.SetRedDotVM(TEUIModelRef<FVM_RedDot>(::FVM_RedDot::Create(this.GetContext().Manager, NodeData)));
        }
        return;
    }
    void RefreshWardrobeEntranceRedDotNode(const FRedDotNodeData &inout NodeData, const bool bHasCurrentAvatarRedDot)
    {
        if (!(this.GetRedDotVM().IsValid()) || !(NodeData.NodeTag.IsValid()))
        {
            return;
        }
        if (!(::FMS_RedDotSystem::Get(this.GetContext().Manager).TryFindOrAddRedDotNode(NodeData).IsValid()))
        {
            return;
        }
        int local_10 = bHasCurrentAvatarRedDot ? 1 : 0;
        int local_11 = GetCount();
        if (local_11 != local_10)
        {
            ::FMS_RedDotSystem::Get(this.GetContext().Manager).GenerateSpecificRedDot(NodeData, local_10 - local_11, false);
        }
        return;
    }
    bool HasCurrentAvatarWardrobeRedDot(const TEUIModelRef<FVM_AvatarInfo> &inout SelectedAvatar) const
    {
        if (!(this.GetbIsVisible()) || !(this.GetbIsUnlocked()) || !(this.IsSelectedAvatarUnlocked(SelectedAvatar)))
        {
            return false;
        }
        if (!(SelectedAvatar) || !(GetAvatarConfig()))
        {
            return false;
        }
        return ::FMS_FashionModel::Get(this.GetContext().Manager).HasNewWardrobeFashionForAvatar(GetAvatarConfig());
    }
    uint64 GetWardrobeEntranceRedDotExtraDataId(const TEUIModelRef<FVM_AvatarInfo> &inout SelectedAvatar) const
    {
        int local_5 = 0;
        if (!(SelectedAvatar) || !(GetAvatarConfig()))
        {
            return 0;
        }
        int64 local_4 = local_5;
        return local_4;
    }
    bool GetbIsVisible() const property
    {
        this.TrackPropertyRead(0);
        return this.m_bIsVisible;
    }
    void SetbIsVisible(const bool __Value) property
    {
        if (!(this.m_bIsVisible) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_bIsVisible = __Value;
        return;
    }
    bool GetbIsUnlocked() const property
    {
        this.TrackPropertyRead(1);
        return this.m_bIsUnlocked;
    }
    void SetbIsUnlocked(const bool __Value) property
    {
        if (!(this.m_bIsUnlocked) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_bIsUnlocked = __Value;
        return;
    }
    TEUIModelRef<FVM_RedDot> GetRedDotVM() const property
    {
        this.TrackPropertyRead(2);
        return this.m_RedDotVM;
    }
    void SetRedDotVM(const TEUIModelRef<FVM_RedDot> &inout __Value) property
    {
        TEUIModelRef<FVM_RedDot> local_2;
        local_2 = this.m_RedDotVM;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_RedDotVM = __Value;
        return;
    }
    bool GetbDisplayHasRedDot() const property
    {
        this.TrackPropertyRead(3);
        return this.m_bDisplayHasRedDot;
    }
    void SetbDisplayHasRedDot(const bool __Value) property
    {
        if (!(this.m_bDisplayHasRedDot) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_bDisplayHasRedDot = __Value;
        return;
    }
}

struct __Lambda_UI_Private_ViewModel_Menu_Fashion_VM_AvatarWardrobe_2665
{
    __Lambda_UI_Private_ViewModel_Menu_Fashion_VM_AvatarWardrobe_2665()
    {
        return;
    }
    bool opCall(const TDataObjectPtr<FFashionConfig> &inout A, const TDataObjectPtr<FFashionConfig> &inout B)
    {
        int local_1 = 0;
        int local_2 = 0;
        int local_8 = 0;
        int local_3 = local_1;
        int local_4 = local_2;
        if (local_3 != local_4)
        {
            local_4 = local_1;
            local_3 = local_2;
            local_8 = local_3;
            return (local_4 > local_8);
        }
        if (local_8 == local_3)
        {
            return (0 < 0);
        }
        return (local_3 > local_4);
    }
}

struct __Lambda_UI_Private_ViewModel_Menu_Fashion_VM_AvatarWardrobe_2666
{
    __Lambda_UI_Private_ViewModel_Menu_Fashion_VM_AvatarWardrobe_2666()
    {
        return;
    }
    bool opCall(const TDataObjectPtr<FFashionConfig> &inout A, const TDataObjectPtr<FFashionConfig> &inout B)
    {
        int local_1 = 0;
        int local_2 = 0;
        int local_8 = 0;
        int local_3 = local_1;
        int local_4 = local_2;
        if (local_3 != local_4)
        {
            local_4 = local_1;
            local_3 = local_2;
            local_8 = local_3;
            return (local_4 > local_8);
        }
        if (local_8 == local_3)
        {
            return (0 < 0);
        }
        return (local_3 > local_4);
    }
}

struct __Lambda_UI_Private_ViewModel_Menu_Fashion_VM_AvatarWardrobe_3422
{
    __Lambda_UI_Private_ViewModel_Menu_Fashion_VM_AvatarWardrobe_3422()
    {
        return;
    }
    bool opCall(const EFashionSlotType &inout A, const EFashionSlotType &inout B)
    {
        int local_78 = 0;
        TDataObjectPtr<FFashionSlotConfig> local_50 = ::FashionSettings::GetSlotConfig(A);
        TDataObjectPtr<FFashionSlotConfig> local_24 = ::FashionSettings::GetSlotConfig(B);
        int local_77 = local_50 ? local_78 : 0;
        int local_75 = local_24 ? local_78 : 0;
        if (local_77 == local_75)
        {
            int local_79 = int(A);
            local_78 = int(B);
            return (local_79 < local_78);
        }
        return (local_77 > local_75);
    }
}

struct __GeneratedProperties_FVM_AvatarWardrobeSlotItem
{
    UPROPERTY()
    TEUIModelRef<FVM_AvatarWardrobeSlotItem> Self;

    __GeneratedProperties_FVM_AvatarWardrobeSlotItem()
    {
        return;
    }
}

struct __GeneratedProperties_FVM_AvatarWardrobeFashionOption
{
    UPROPERTY()
    TEUIModelRef<FVM_AvatarWardrobeFashionOption> Self;

    __GeneratedProperties_FVM_AvatarWardrobeFashionOption()
    {
        return;
    }
}

struct __GeneratedProperties_FVM_AvatarMainWardrobe
{
    UPROPERTY()
    ESlateVisibility SelectedDisplayDetailVisibility;
    UPROPERTY()
    bool IsFashionMountUnlocked;
    UPROPERTY()
    TEUIModelRef<FVM_AvatarMainWardrobe> Self;


}

struct __GeneratedProperties_FVM_AvatarWardrobeEntrance
{
    UPROPERTY()
    bool HasRedDot;
    UPROPERTY()
    ESlateVisibility EntranceVisibility;
    UPROPERTY()
    bool IsSelectedAvatarLocked;
    UPROPERTY()
    TEUIModelRef<FVM_AvatarWardrobeEntrance> Self;


}

namespace FVM_AvatarWardrobeSlotItem
{
FVM_AvatarWardrobeSlotItem& Create(const UObject ContextObject)
{
    return FVM_AvatarWardrobeSlotItem::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_AvatarWardrobeSlotItem CreateByManager(const UEUIManagerSubsystem Manager)
{
    FVM_AvatarWardrobeSlotItem __r;
    TEUIModelRef<FVM_AvatarWardrobeSlotItem> local_6 = TEUIModelRef<FVM_AvatarWardrobeSlotItem>(EUIInternal::MakeModelWithManager(Manager, FVM_AvatarWardrobeSlotItem::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "SlotType";
    local_14.TypeName = "EFashionSlotType";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "SlotSubTab";
    local_14.TypeName = "EFashionSlotSubTab";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "SlotIndex";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "SlotTitle";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "SlotIcon";
    local_14.TypeName = "FSoftBrush";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_AvatarWardrobeSlotItem>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_AvatarWardrobeSlotItem;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_AvatarWardrobeSlotItem;
}
EFashionSlotType __UIGetter_SlotType(const FVM_AvatarWardrobeSlotItem &inout Model)
{
    return Model.GetSlotType();
}
EFashionSlotSubTab __UIGetter_SlotSubTab(const FVM_AvatarWardrobeSlotItem &inout Model)
{
    return Model.GetSlotSubTab();
}
int __UIGetter_SlotIndex(const FVM_AvatarWardrobeSlotItem &inout Model)
{
    return Model.GetSlotIndex();
}
FText __UIGetter_SlotTitle(const FVM_AvatarWardrobeSlotItem &inout Model)
{
    return Model.GetSlotTitle();
}
FSoftBrush __UIGetter_SlotIcon(const FVM_AvatarWardrobeSlotItem &inout Model)
{
    return Model.GetSlotIcon();
}
TEUIModelRef<FVM_AvatarWardrobeSlotItem> __UIGetter_Self(const FVM_AvatarWardrobeSlotItem &inout Model)
{
    return TEUIModelRef<FVM_AvatarWardrobeSlotItem>(Model);
}
int __IndexOf_SlotType()
{
    return 0;
}
int __IndexOf_SlotSubTab()
{
    return 1;
}
int __IndexOf_SlotIndex()
{
    return 2;
}
int __IndexOf_SlotTitle()
{
    return 3;
}
int __IndexOf_SlotIcon()
{
    return 4;
}
int __IndexOf_OwnerWardrobe()
{
    return 5;
}
}
namespace __GeneratedProperties_FVM_AvatarWardrobeSlotItem
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
namespace FVM_AvatarWardrobeFashionOption
{
FVM_AvatarWardrobeFashionOption& Create(const UObject ContextObject)
{
    return FVM_AvatarWardrobeFashionOption::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_AvatarWardrobeFashionOption CreateByManager(const UEUIManagerSubsystem Manager)
{
    FVM_AvatarWardrobeFashionOption __r;
    TEUIModelRef<FVM_AvatarWardrobeFashionOption> local_6 = TEUIModelRef<FVM_AvatarWardrobeFashionOption>(EUIInternal::MakeModelWithManager(Manager, FVM_AvatarWardrobeFashionOption::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "SlotType";
    local_14.TypeName = "EFashionSlotType";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "SlotSubTab";
    local_14.TypeName = "EFashionSlotSubTab";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bIsUnequipOption";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "FashionConfig";
    local_14.TypeName = "TDataObjectPtr<FFashionConfig>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_AvatarWardrobeFashionOption>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_AvatarWardrobeFashionOption;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_AvatarWardrobeFashionOption;
}
EFashionSlotType __UIGetter_SlotType(const FVM_AvatarWardrobeFashionOption &inout Model)
{
    return Model.GetSlotType();
}
EFashionSlotSubTab __UIGetter_SlotSubTab(const FVM_AvatarWardrobeFashionOption &inout Model)
{
    return Model.GetSlotSubTab();
}
bool __UIGetter_bIsUnequipOption(const FVM_AvatarWardrobeFashionOption &inout Model)
{
    return Model.GetbIsUnequipOption();
}
TDataObjectPtr<FFashionConfig> __UIGetter_FashionConfig(const FVM_AvatarWardrobeFashionOption &inout Model)
{
    return Model.GetFashionConfig();
}
TEUIModelRef<FVM_AvatarWardrobeFashionOption> __UIGetter_Self(const FVM_AvatarWardrobeFashionOption &inout Model)
{
    return TEUIModelRef<FVM_AvatarWardrobeFashionOption>(Model);
}
int __IndexOf_SlotType()
{
    return 0;
}
int __IndexOf_SlotSubTab()
{
    return 1;
}
int __IndexOf_bIsUnequipOption()
{
    return 2;
}
int __IndexOf_FashionConfig()
{
    return 3;
}
int __IndexOf_OwnerWardrobe()
{
    return 4;
}
}
namespace __GeneratedProperties_FVM_AvatarWardrobeFashionOption
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
namespace FVM_AvatarMainWardrobe
{
FVM_AvatarMainWardrobe& Create(const UObject ContextObject)
{
    return FVM_AvatarMainWardrobe::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_AvatarMainWardrobe CreateByManager(const UEUIManagerSubsystem Manager)
{
    FVM_AvatarMainWardrobe __r;
    TEUIModelRef<FVM_AvatarMainWardrobe> local_6 = TEUIModelRef<FVM_AvatarMainWardrobe>(EUIInternal::MakeModelWithManager(Manager, FVM_AvatarMainWardrobe::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasBeginDestroy(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "EditingAvatar";
    local_14.TypeName = "TEUIModelRef<FVM_AvatarInfo>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ContentSwitcherIndex";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ListSwitcherIndex";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "SelectedSlotIndex";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "SelectedSlotType";
    local_14.TypeName = "EFashionSlotType";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "SelectedSlotSubTab";
    local_14.TypeName = "EFashionSlotSubTab";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CurrentMainTab";
    local_14.TypeName = "EFashionSlotMainTab";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "MainTabItems";
    local_14.TypeName = "TArray<FEUIModelContainer>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "SelectedMainTabItem";
    local_14.TypeName = "FEUIModelContainer";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "PageTitleText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "WardrobeGroupTitleText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "OrnamentGroupTitleText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bHasWardrobeGroupSlots";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bHasOrnamentGroupSlots";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ClothSlotEntryDataList";
    local_14.TypeName = "TArray<FEUIDynamicWidgetData>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "OrnamentSlotItems";
    local_14.TypeName = "TArray<FEUIModelContainer>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "HighFashionItems";
    local_14.TypeName = "TArray<FEUIModelContainer>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "SelectedHighFashionItem";
    local_14.TypeName = "FEUIModelContainer";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "TileFashionItems";
    local_14.TypeName = "TArray<FEUIModelContainer>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "SelectedTileFashionItem";
    local_14.TypeName = "FEUIModelContainer";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "SelectionTabItems";
    local_14.TypeName = "TArray<FEUIModelContainer>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "SelectedSlotTabItem";
    local_14.TypeName = "FEUIModelContainer";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "SelectedDisplayDetail";
    local_14.TypeName = "TEUIModelRef<FVM_CommonDisplayDetail>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ActionStateRevision";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "SelectedDisplayDetailVisibility";
    local_14.TypeName = "ESlateVisibility";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IsFashionMountUnlocked";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_AvatarMainWardrobe>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_AvatarMainWardrobe;
    FEUIModelEffectDefine local_20;
    local_20.FunctionName = "RefreshBoundFashionOptionSelection";
    Result.EffectFunctions.Add(local_20);
    FEUIModelMsgHandleDefine local_30;
    local_30.FunctionName = "__OnAvatarFashionChanged";
    local_30.MessageTypeName = "Msg_AvatarFashionChanged";
    local_30.SourcePropertyModelRefs = FBitSet64(0);
    Result.MessageHandleFunctions.Add(local_30);
    local_30.FunctionName = "__OnFashionMountChanged";
    local_30.MessageTypeName = "Msg_FashionMountChanged";
    local_30.SourcePropertyModelRefs = FBitSet64(0);
    Result.MessageHandleFunctions.Add(local_30);
    local_30.FunctionName = "__OnSystemUnlockFromGS";
    local_30.MessageTypeName = "Msg_SystemUnlockFromGS";
    local_30.SourcePropertyModelRefs = FBitSet64(0);
    Result.MessageHandleFunctions.Add(local_30);
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_AvatarMainWardrobe;
}
void __OnAvatarFashionChanged(FVM_AvatarMainWardrobe &inout Model, const FMsg_AvatarFashionChanged &inout Message)
{
    Model.OnAvatarFashionChanged(Message);
    return;
}
void __OnFashionMountChanged(FVM_AvatarMainWardrobe &inout Model, const FMsg_FashionMountChanged &inout Message)
{
    Model.OnFashionMountChanged(Message);
    return;
}
void __OnSystemUnlockFromGS(FVM_AvatarMainWardrobe &inout Model, const FMsg_SystemUnlockFromGS &inout Message)
{
    Model.OnSystemUnlockFromGS(Message);
    return;
}
TEUIModelRef<FVM_AvatarInfo> __UIGetter_EditingAvatar(const FVM_AvatarMainWardrobe &inout Model)
{
    return Model.GetEditingAvatar();
}
int __UIGetter_ContentSwitcherIndex(const FVM_AvatarMainWardrobe &inout Model)
{
    return Model.GetContentSwitcherIndex();
}
int __UIGetter_ListSwitcherIndex(const FVM_AvatarMainWardrobe &inout Model)
{
    return Model.GetListSwitcherIndex();
}
int __UIGetter_SelectedSlotIndex(const FVM_AvatarMainWardrobe &inout Model)
{
    return Model.GetSelectedSlotIndex();
}
EFashionSlotType __UIGetter_SelectedSlotType(const FVM_AvatarMainWardrobe &inout Model)
{
    return Model.GetSelectedSlotType();
}
EFashionSlotSubTab __UIGetter_SelectedSlotSubTab(const FVM_AvatarMainWardrobe &inout Model)
{
    return Model.GetSelectedSlotSubTab();
}
EFashionSlotMainTab __UIGetter_CurrentMainTab(const FVM_AvatarMainWardrobe &inout Model)
{
    return Model.GetCurrentMainTab();
}
TArray<FEUIModelContainer> __UIGetter_MainTabItems(const FVM_AvatarMainWardrobe &inout Model)
{
    return Model.GetMainTabItems();
}
FEUIModelContainer __UIGetter_SelectedMainTabItem(const FVM_AvatarMainWardrobe &inout Model)
{
    return Model.GetSelectedMainTabItem();
}
FText __UIGetter_PageTitleText(const FVM_AvatarMainWardrobe &inout Model)
{
    return Model.GetPageTitleText();
}
FText __UIGetter_WardrobeGroupTitleText(const FVM_AvatarMainWardrobe &inout Model)
{
    return Model.GetWardrobeGroupTitleText();
}
FText __UIGetter_OrnamentGroupTitleText(const FVM_AvatarMainWardrobe &inout Model)
{
    return Model.GetOrnamentGroupTitleText();
}
bool __UIGetter_bHasWardrobeGroupSlots(const FVM_AvatarMainWardrobe &inout Model)
{
    return Model.GetbHasWardrobeGroupSlots();
}
bool __UIGetter_bHasOrnamentGroupSlots(const FVM_AvatarMainWardrobe &inout Model)
{
    return Model.GetbHasOrnamentGroupSlots();
}
TArray<FEUIDynamicWidgetData> __UIGetter_ClothSlotEntryDataList(const FVM_AvatarMainWardrobe &inout Model)
{
    return Model.GetClothSlotEntryDataList();
}
TArray<FEUIModelContainer> __UIGetter_OrnamentSlotItems(const FVM_AvatarMainWardrobe &inout Model)
{
    return Model.GetOrnamentSlotItems();
}
TArray<FEUIModelContainer> __UIGetter_HighFashionItems(const FVM_AvatarMainWardrobe &inout Model)
{
    return Model.GetHighFashionItems();
}
FEUIModelContainer __UIGetter_SelectedHighFashionItem(const FVM_AvatarMainWardrobe &inout Model)
{
    return Model.GetSelectedHighFashionItem();
}
TArray<FEUIModelContainer> __UIGetter_TileFashionItems(const FVM_AvatarMainWardrobe &inout Model)
{
    return Model.GetTileFashionItems();
}
FEUIModelContainer __UIGetter_SelectedTileFashionItem(const FVM_AvatarMainWardrobe &inout Model)
{
    return Model.GetSelectedTileFashionItem();
}
TArray<FEUIModelContainer> __UIGetter_SelectionTabItems(const FVM_AvatarMainWardrobe &inout Model)
{
    return Model.GetSelectionTabItems();
}
FEUIModelContainer __UIGetter_SelectedSlotTabItem(const FVM_AvatarMainWardrobe &inout Model)
{
    return Model.GetSelectedSlotTabItem();
}
TEUIModelRef<FVM_CommonDisplayDetail> __UIGetter_SelectedDisplayDetail(const FVM_AvatarMainWardrobe &inout Model)
{
    return Model.GetSelectedDisplayDetail();
}
int __UIGetter_ActionStateRevision(const FVM_AvatarMainWardrobe &inout Model)
{
    return Model.GetActionStateRevision();
}
ESlateVisibility __UIGetter_SelectedDisplayDetailVisibility(const FVM_AvatarMainWardrobe &inout Model)
{
    return Model.GetSelectedDisplayDetailVisibility();
}
bool __UIGetter_IsFashionMountUnlocked(const FVM_AvatarMainWardrobe &inout Model)
{
    return Model.IsFashionMountUnlocked();
}
TEUIModelRef<FVM_AvatarMainWardrobe> __UIGetter_Self(const FVM_AvatarMainWardrobe &inout Model)
{
    return TEUIModelRef<FVM_AvatarMainWardrobe>(Model);
}
int __IndexOf_EditingAvatar()
{
    return 0;
}
int __IndexOf_Showcase()
{
    return 1;
}
int __IndexOf_ContentSwitcherIndex()
{
    return 2;
}
int __IndexOf_ListSwitcherIndex()
{
    return 3;
}
int __IndexOf_SelectedSlotIndex()
{
    return 4;
}
int __IndexOf_SelectedSlotType()
{
    return 5;
}
int __IndexOf_SelectedSlotSubTab()
{
    return 6;
}
int __IndexOf_CurrentMainTab()
{
    return 7;
}
int __IndexOf_MainTabItems()
{
    return 8;
}
int __IndexOf_SelectedMainTabItem()
{
    return 9;
}
int __IndexOf_PageTitleText()
{
    return 10;
}
int __IndexOf_WardrobeGroupTitleText()
{
    return 11;
}
int __IndexOf_OrnamentGroupTitleText()
{
    return 12;
}
int __IndexOf_bHasWardrobeGroupSlots()
{
    return 13;
}
int __IndexOf_bHasOrnamentGroupSlots()
{
    return 14;
}
int __IndexOf_ClothSlotEntryDataList()
{
    return 15;
}
int __IndexOf_OrnamentSlotItems()
{
    return 16;
}
int __IndexOf_HighFashionItems()
{
    return 17;
}
int __IndexOf_SelectedHighFashionItem()
{
    return 18;
}
int __IndexOf_TileFashionItems()
{
    return 19;
}
int __IndexOf_SelectedTileFashionItem()
{
    return 20;
}
int __IndexOf_SelectionTabItems()
{
    return 21;
}
int __IndexOf_SelectedSlotTabItem()
{
    return 22;
}
int __IndexOf_SelectedDisplayDetail()
{
    return 23;
}
int __IndexOf_ClothSlotModels()
{
    return 24;
}
int __IndexOf_OrnamentSlotModels()
{
    return 25;
}
int __IndexOf_CurrentFashionOptions()
{
    return 26;
}
int __IndexOf_SlotTabSelectableItems()
{
    return 27;
}
int __IndexOf_MainTabSelectableItems()
{
    return 28;
}
int __IndexOf_ClothSavedSlotType()
{
    return 29;
}
int __IndexOf_ClothSavedSlotSubTab()
{
    return 30;
}
int __IndexOf_bHasClothSavedSlot()
{
    return 31;
}
int __IndexOf_MountSavedSlotType()
{
    return 32;
}
int __IndexOf_MountSavedSlotSubTab()
{
    return 33;
}
int __IndexOf_bHasMountSavedSlot()
{
    return 34;
}
int __IndexOf_PreviewFashion()
{
    return 35;
}
int __IndexOf_OriginalFashion()
{
    return 36;
}
int __IndexOf_bHasOriginalFashion()
{
    return 37;
}
int __IndexOf_bPreviewInitialized()
{
    return 38;
}
int __IndexOf_bPreviewAppliedToFashionModel()
{
    return 39;
}
int __IndexOf_PreviewMountID()
{
    return 40;
}
int __IndexOf_PreviewMountDecoID()
{
    return 41;
}
int __IndexOf_bHasPreviewMountOverride()
{
    return 42;
}
int __IndexOf_bIsFashionMountUnlocked()
{
    return 43;
}
int __IndexOf_bHasSelectedFashionOptionInCurrentList()
{
    return 44;
}
int __IndexOf_bHasProcessedBoundFashionOptionSelection()
{
    return 45;
}
int __IndexOf_ProcessedBoundFashionSlotType()
{
    return 46;
}
int __IndexOf_ProcessedBoundFashionSlotSubTab()
{
    return 47;
}
int __IndexOf_bProcessedBoundFashionIsUnequip()
{
    return 48;
}
int __IndexOf_ProcessedBoundFashionId()
{
    return 49;
}
int __IndexOf_ActionStateRevision()
{
    return 50;
}
int __IndexOf_PendingNavigationType()
{
    return 51;
}
int __IndexOf_PendingMainTab()
{
    return 52;
}
}
namespace __GeneratedProperties_FVM_AvatarMainWardrobe
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
namespace FVM_AvatarWardrobeEntrance
{
FVM_AvatarWardrobeEntrance& Create(const UObject ContextObject)
{
    return FVM_AvatarWardrobeEntrance::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_AvatarWardrobeEntrance CreateByManager(const UEUIManagerSubsystem Manager)
{
    FVM_AvatarWardrobeEntrance __r;
    TEUIModelRef<FVM_AvatarWardrobeEntrance> local_6 = TEUIModelRef<FVM_AvatarWardrobeEntrance>(EUIInternal::MakeModelWithManager(Manager, FVM_AvatarWardrobeEntrance::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostLoad(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "bIsVisible";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bIsUnlocked";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "RedDotVM";
    local_14.TypeName = "TEUIModelRef<FVM_RedDot>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "HasRedDot";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "EntranceVisibility";
    local_14.TypeName = "ESlateVisibility";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IsSelectedAvatarLocked";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_AvatarWardrobeEntrance>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_AvatarWardrobeEntrance;
    FEUIModelEffectDefine local_20;
    local_20.FunctionName = "RefreshRedDotDisplayState";
    Result.EffectFunctions.Add(local_20);
    FEUIModelMsgHandleDefine local_30;
    local_30.FunctionName = "__OnAvatarWardrobeRedDotChanged";
    local_30.MessageTypeName = "Msg_AvatarWardrobeRedDotChanged";
    local_30.SourcePropertyModelRefs = FBitSet64(0);
    Result.MessageHandleFunctions.Add(local_30);
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_AvatarWardrobeEntrance;
}
void __OnAvatarWardrobeRedDotChanged(FVM_AvatarWardrobeEntrance &inout Model, const FMsg_AvatarWardrobeRedDotChanged &inout Message)
{
    Model.OnAvatarWardrobeRedDotChanged(Message);
    return;
}
bool __UIGetter_bIsVisible(const FVM_AvatarWardrobeEntrance &inout Model)
{
    return Model.GetbIsVisible();
}
bool __UIGetter_bIsUnlocked(const FVM_AvatarWardrobeEntrance &inout Model)
{
    return Model.GetbIsUnlocked();
}
TEUIModelRef<FVM_RedDot> __UIGetter_RedDotVM(const FVM_AvatarWardrobeEntrance &inout Model)
{
    return Model.GetRedDotVM();
}
bool __UIGetter_HasRedDot(const FVM_AvatarWardrobeEntrance &inout Model)
{
    return Model.HasRedDot();
}
ESlateVisibility __UIGetter_EntranceVisibility(const FVM_AvatarWardrobeEntrance &inout Model)
{
    return Model.GetEntranceVisibility();
}
bool __UIGetter_IsSelectedAvatarLocked(const FVM_AvatarWardrobeEntrance &inout Model)
{
    return Model.GetIsSelectedAvatarLocked();
}
TEUIModelRef<FVM_AvatarWardrobeEntrance> __UIGetter_Self(const FVM_AvatarWardrobeEntrance &inout Model)
{
    return TEUIModelRef<FVM_AvatarWardrobeEntrance>(Model);
}
int __IndexOf_bIsVisible()
{
    return 0;
}
int __IndexOf_bIsUnlocked()
{
    return 1;
}
int __IndexOf_RedDotVM()
{
    return 2;
}
int __IndexOf_bDisplayHasRedDot()
{
    return 3;
}
}
namespace __GeneratedProperties_FVM_AvatarWardrobeEntrance
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
