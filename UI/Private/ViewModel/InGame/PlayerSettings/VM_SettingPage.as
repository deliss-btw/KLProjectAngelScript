
namespace FVM_SettingSystemMainState
{
    const int ModelId = 0;
}
namespace FVMS_SettingPage
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature SelectCategory = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature UpdateResolutionDropDownOptions = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature SaveChangedSettings = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature ResetChangedSettings = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature RevertUnsavedSettings = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature BroadcastSettingsChanged = FEUIModelCallbackSignature();

}
struct FVM_SettingSystemMainState : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    bool m_bIsHiddenSystemMain;

    FVM_SettingSystemMainState()
    {
        this.m_bIsHiddenSystemMain = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVM_SettingSystemMainState(const FVM_SettingSystemMainState &inout Other)
    {
        this.m_bIsHiddenSystemMain = false;
        this.m_bIsHiddenSystemMain = Other.m_bIsHiddenSystemMain;
        return;
    }
    FVM_SettingSystemMainState opAssign(const FVM_SettingSystemMainState &inout Other)
    {
        FVM_SettingSystemMainState __r;
        this.m_bIsHiddenSystemMain = Other.m_bIsHiddenSystemMain;
        return __r;
    }
    ESlateVisibility GetSystemMainVisibility() const
    {
        int local_2;
        if (this.GetbIsHiddenSystemMain())
        {
            local_2 = 1;
        }
        else
        {
            local_2 = 0;
        }
        return ESlateVisibility(local_2);
    }
    bool GetbIsHiddenSystemMain() const property
    {
        this.TrackPropertyRead(0);
        return this.m_bIsHiddenSystemMain;
    }
    void SetbIsHiddenSystemMain(const bool __Value) property
    {
        if (!(this.m_bIsHiddenSystemMain) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_bIsHiddenSystemMain = __Value;
        return;
    }
}

struct FVMS_SettingPage : FEUIViewModelSingleton
{
    FEUIViewModelSingleton _base_FEUIViewModelSingleton;
    UPROPERTY()
    TEUIModelRef<FVMS_PlayerKeyMappings> m_KeyMappings;
    UPROPERTY()
    TArray<FEUIModelContainer> m_CategoryListItems;
    UPROPERTY()
    TArray<FEUIDynamicWidgetData> m_SelectedListItems;
    UPROPERTY()
    FEUIDynamicWidgetData m_FirstItem;
    UPROPERTY()
    FEUIDynamicWidgetData m_PrevSelectedItem;
    UPROPERTY()
    TSoftClassPtr<UEUIUserWidget> m_SettingSubTitleWidgetClass;
    UPROPERTY()
    TSoftClassPtr<UEUIUserWidget> m_SettingItemWidgetClass;
    UPROPERTY()
    TSoftClassPtr<UEUIUserWidget> m_DropDownWidgetClass;
    UPROPERTY()
    TSoftClassPtr<UEUIUserWidget> m_SliderWidgetClass;
    UPROPERTY()
    TSoftClassPtr<UEUIUserWidget> m_LinkWidgetClass;
    UPROPERTY()
    TSoftClassPtr<UEUIUserWidget> m_ToggleWidgetClass;
    UPROPERTY()
    TSoftClassPtr<UEUIUserWidget> m_KeyboardSelectorWidgetClass;
    UPROPERTY()
    TSoftClassPtr<UEUIUserWidget> m_GamepadSelectorWidgetClass;
    UPROPERTY()
    TDataObjectPtr<FSettingItemConfig> m_SelectedItemConfig;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_SettingCategory>> m_Categories;
    UPROPERTY()
    TMap<FGameplayTag, TEUIModelRef<FVM_SettingItem>> m_Items;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_SelectableItem>> m_CategorySelectableItems;
    UPROPERTY()
    UCameraSettings m_CameraSettings;
    UPROPERTY()
    bool isInmediateApply;
    UPROPERTY()
    FEUIWidgetTag NextTag;
    UPROPERTY()
    FEUIModelContainer NextMenuBarItem;
    UPROPERTY()
    int m_SelectedCategoryIndex;
    UPROPERTY()
    int NewSelectedCategoryIndex;
    UPROPERTY()
    int m_SelectedItemIndex;
    UPROPERTY()
    bool m_bHasVideoMemoryInfo;
    UPROPERTY()
    bool m_bIsKeySelecting;
    UPROPERTY()
    bool m_bHasSelectedCategoryChanged;
    UPROPERTY()
    bool m_bHasResolutionOptionChanged;
    UPROPERTY()
    bool m_bShowWarningMessage;
    UPROPERTY()
    FText m_WarningMessage;
    UPROPERTY()
    bool m_bCanRevert;
    UPROPERTY()
    bool m_bIsKeyMapping;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_SettingItem>> m_ChangedItemVMs;
    UPROPERTY()
    FGameUserSettingCollection m_SettingsCollection;
    UPROPERTY()
    TMap<FGameplayTag, float32> m_SettingsValues;
    UPROPERTY()
    bool bFreshCurrentMenuIndex;
    UPROPERTY()
    FOnSettingsChanged m_OnSettingsChanged;
    UPROPERTY()
    float32 m_ItemsOpacity;

    FVMS_SettingPage()
    {
        this.m_CameraSettings = nullptr;
        this.isInmediateApply = false;
        this.m_SelectedCategoryIndex = -1;
        this.NewSelectedCategoryIndex = -1;
        this.m_SelectedItemIndex = 0;
        this.m_bHasVideoMemoryInfo = true;
        this.m_bIsKeySelecting = false;
        this.m_bHasSelectedCategoryChanged = false;
        this.m_bHasResolutionOptionChanged = false;
        this.m_bShowWarningMessage = false;
        this.m_bCanRevert = false;
        this.m_bIsKeyMapping = false;
        this.bFreshCurrentMenuIndex = true;
        this.m_ItemsOpacity = 1.0f;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVMS_SettingPage(const FVMS_SettingPage &inout Other)
    {
        this.m_CameraSettings = nullptr;
        this.isInmediateApply = false;
        this.m_SelectedCategoryIndex = -1;
        this.NewSelectedCategoryIndex = -1;
        this.m_SelectedItemIndex = 0;
        this.m_bHasVideoMemoryInfo = true;
        this.m_bIsKeySelecting = false;
        this.m_bHasSelectedCategoryChanged = false;
        this.m_bHasResolutionOptionChanged = false;
        this.m_bShowWarningMessage = false;
        this.m_bCanRevert = false;
        this.m_bIsKeyMapping = false;
        this.bFreshCurrentMenuIndex = true;
        this.m_ItemsOpacity = 1.0f;
        this.m_KeyMappings = Other.m_KeyMappings;
        this.m_CategoryListItems = Other.m_CategoryListItems;
        this.m_SelectedListItems = Other.m_SelectedListItems;
        this.m_FirstItem = Other.m_FirstItem;
        this.m_PrevSelectedItem = Other.m_PrevSelectedItem;
        this.m_SettingSubTitleWidgetClass = Other.m_SettingSubTitleWidgetClass;
        this.m_SettingItemWidgetClass = Other.m_SettingItemWidgetClass;
        this.m_DropDownWidgetClass = Other.m_DropDownWidgetClass;
        this.m_SliderWidgetClass = Other.m_SliderWidgetClass;
        this.m_LinkWidgetClass = Other.m_LinkWidgetClass;
        this.m_ToggleWidgetClass = Other.m_ToggleWidgetClass;
        this.m_KeyboardSelectorWidgetClass = Other.m_KeyboardSelectorWidgetClass;
        this.m_GamepadSelectorWidgetClass = Other.m_GamepadSelectorWidgetClass;
        this.m_SelectedItemConfig = Other.m_SelectedItemConfig;
        this.m_Categories = Other.m_Categories;
        this.m_Items = Other.m_Items;
        this.m_CategorySelectableItems = Other.m_CategorySelectableItems;
        this.m_CameraSettings = Other.m_CameraSettings;
        this.m_SelectedCategoryIndex = int(Other.m_SelectedCategoryIndex);
        this.m_SelectedItemIndex = int(Other.m_SelectedItemIndex);
        this.m_bHasVideoMemoryInfo = Other.m_bHasVideoMemoryInfo;
        this.m_bIsKeySelecting = Other.m_bIsKeySelecting;
        this.m_bHasSelectedCategoryChanged = Other.m_bHasSelectedCategoryChanged;
        this.m_bHasResolutionOptionChanged = Other.m_bHasResolutionOptionChanged;
        this.m_bShowWarningMessage = Other.m_bShowWarningMessage;
        this.m_WarningMessage = Other.m_WarningMessage;
        this.m_bCanRevert = Other.m_bCanRevert;
        this.m_bIsKeyMapping = Other.m_bIsKeyMapping;
        this.m_ChangedItemVMs = Other.m_ChangedItemVMs;
        this.m_SettingsCollection = Other.m_SettingsCollection;
        this.m_SettingsValues = Other.m_SettingsValues;
        this.m_ItemsOpacity = Other.m_ItemsOpacity;
        return;
    }
    FVMS_SettingPage opAssign(const FVMS_SettingPage &inout Other)
    {
        FVMS_SettingPage __r;
        this.m_KeyMappings = Other.m_KeyMappings;
        this.m_CategoryListItems = Other.m_CategoryListItems;
        this.m_SelectedListItems = Other.m_SelectedListItems;
        this.m_FirstItem = Other.m_FirstItem;
        this.m_PrevSelectedItem = Other.m_PrevSelectedItem;
        this.m_SettingSubTitleWidgetClass = Other.m_SettingSubTitleWidgetClass;
        this.m_SettingItemWidgetClass = Other.m_SettingItemWidgetClass;
        this.m_DropDownWidgetClass = Other.m_DropDownWidgetClass;
        this.m_SliderWidgetClass = Other.m_SliderWidgetClass;
        this.m_LinkWidgetClass = Other.m_LinkWidgetClass;
        this.m_ToggleWidgetClass = Other.m_ToggleWidgetClass;
        this.m_KeyboardSelectorWidgetClass = Other.m_KeyboardSelectorWidgetClass;
        this.m_GamepadSelectorWidgetClass = Other.m_GamepadSelectorWidgetClass;
        this.m_SelectedItemConfig = Other.m_SelectedItemConfig;
        this.m_Categories = Other.m_Categories;
        this.m_Items = Other.m_Items;
        this.m_CategorySelectableItems = Other.m_CategorySelectableItems;
        this.m_CameraSettings = Other.m_CameraSettings;
        this.m_SelectedCategoryIndex = int(Other.m_SelectedCategoryIndex);
        this.m_SelectedItemIndex = int(Other.m_SelectedItemIndex);
        this.m_bHasVideoMemoryInfo = Other.m_bHasVideoMemoryInfo;
        this.m_bIsKeySelecting = Other.m_bIsKeySelecting;
        this.m_bHasSelectedCategoryChanged = Other.m_bHasSelectedCategoryChanged;
        this.m_bHasResolutionOptionChanged = Other.m_bHasResolutionOptionChanged;
        this.m_bShowWarningMessage = Other.m_bShowWarningMessage;
        this.m_WarningMessage = Other.m_WarningMessage;
        this.m_bCanRevert = Other.m_bCanRevert;
        this.m_bIsKeyMapping = Other.m_bIsKeyMapping;
        this.m_ChangedItemVMs = Other.m_ChangedItemVMs;
        this.m_SettingsCollection = Other.m_SettingsCollection;
        this.m_SettingsValues = Other.m_SettingsValues;
        this.m_ItemsOpacity = Other.m_ItemsOpacity;
        return __r;
    }
    void LoadConfigDefault(const FVMS_SettingPageConfigDefault &inout InConfig)
    {
        this.SetCameraSettings(InConfig.CameraSettings);
        return;
    }
    void PostConstruct()
    {
        this.CollectSettings();
        this.BuildFromDataTables();
        this.SyncItemValueDisplay();
        return;
    }
    void InitData()
    {
        this.SelectCategory(::FMS_SettingMain::Get(this.GetContext().Manager).PrevIndex);
        this.RefreshSettingValueCurrentValue();
        return;
    }
    void RefreshSettingValueCurrentValue()
    {
        for (auto& local_20 : this.GetItems())
        {
            FGameplayTag local_22 = local_20.GetKey();
            if (local_22.MatchesTag(FGameplayTag::RequestGameplayTag(n"Setting.Graphics.GraphicsQuality.GraphicsQualityPreset", true)) || this.IsKeyMappingOrGamepadItem(local_22))
            {
                continue;
            }
            (::SettingUtils::GetCurrentValue(GetApplyEffect(), this.IsDisplayOrGraphicsItem(local_22))).UpdateComponentValue(false);
            bool local_30 = false;
            local_30.SetbHasResolutionOptionChanged();
        }
        return;
    }
    void RefreshSettingValuePreviousValue()
    {
        if (!(this.GetCategories().IsValidIndex(this.GetSelectedCategoryIndex())))
        {
            return;
        }
        int local_1 = this.GetSelectedCategoryIndex();
        for (auto& local_16 : GetSubTitles())
        {
            local_16;
            for (auto& local_30 : GetItems())
            {
                local_30;
                SyncPreviousValue();
            }
        }
        return;
    }
    void CollectSettings()
    {
        UGameInputLocalPlayerSubsystem local_4 = UGameInputLocalPlayerSubsystem::Get(this.GetContext().UELocalPlayer);
        if (local_4 == nullptr)
        {
            return;
        }
        FGameUserSettingCollection& local_8 = this.GetModify_SettingsCollection();
        local_4.CollectUserSettings(local_8);
        for (auto& local_22 : local_8.Configs)
        {
            this.CollectSettingsValues(local_22);
        }
        return;
    }
    void SaveSettings(const bool bShowTips = true)
    {
        if (bShowTips)
        {
            FCommonTipsParam local_4;
            ::CommonPopup_Internal::OpenTipsWithoutECSWorld(this.GetContext().UELocalPlayer, NSLOCTEXT("SettingPage", "SaveSettingsSuccess", "дїќе­ж€ђеЉџ"), local_4, ECommonTipsType(0), FEUIModelContainer());
        }
        this.GetModify_SettingsCollection().Configs.Reset(0);
        for (auto& local_44 : this.GetItems())
        {
            if (this.IsKeyMappingOrGamepadItem(local_44.GetKey()))
            {
                continue;
            }
            float32 local_47 = GetCurrentValue();
            FGameplayTag local_49;
            local_49;
            FInstancedStruct local_54;
            this.GetModify_SettingsCollection().Configs.Add(local_54);
            SyncPreviousValue();
        }
        UGameInputLocalPlayerSubsystem local_58 = UGameInputLocalPlayerSubsystem::Get(this.GetContext().UELocalPlayer);
        local_58.SaveUserSettings(this.GetModify_SettingsCollection());
        return;
    }
    void CollectSettingsValues(const FInstancedStruct &inout ApplyEffect)
    {
        if (FInstancedStruct::GetPtr<FSettingApplyBase>(ApplyEffect).opCall())
        {
        }
        return;
    }
    FInstancedStruct SaveSettingsValues(const FInstancedStruct &inout ApplyEffect, const FGameplayTag &inout ItemTag, const float32 Value)
    {
        if (!(ApplyEffect.IsValid()))
        {
            return FInstancedStruct();
        }
        if (::SettingUtils::GetSettings() == nullptr)
        {
            return FInstancedStruct();
        }
        FInstancedStruct local_14 = ApplyEffect;
        TRawPtr<FSettingApplyBase> local_20 = FInstancedStruct::GetMutablePtr(local_14).opCall();
        if (local_20)
        {
            local_20.opArrow().SetSavedValue(ItemTag, Value);
        }
        return local_14;
    }
    void RefreshVideoMemoryVisibility()
    {
        if (!(KLProfilingFunctionRuntime::GetVideoMemoryInfo().bValid))
        {
            this.SetbHasVideoMemoryInfo(false);
        }
        else
        {
            this.SetbHasVideoMemoryInfo(this.IsGraphicsCategory() || this.IsDisplayCategory());
        }
        return;
    }
    void BuildFromDataTables()
    {
        TMap<FGameplayTag, TEUIModelRef<FVM_PlayerKeyMappingPair>> local_20;
        int local_230 = 0;
        FGameplayTag local_246;
        FGameplayTag local_248;
        int local_250 = 0;
        int local_468 = 0;
        this.BuildKeyMappings(local_20);
        TArray<TDataObjectPtr<FSettingComponentWidgetClass>> local_24;
        TDataObjectIterator<FSettingComponentWidgetClass> local_40;
        for (; local_40; )
        {
            local_24.Add(local_40.GetDataPtr());
            local_40.Next();
        }
        if (!(local_24.IsEmpty()))
        {
        }
        TArray<TDataObjectPtr<FSettingCategoryConfig>> local_72;
        TArray<TDataObjectPtr<FSettingSubTitleConfig>> local_76;
        TArray<TDataObjectPtr<FSettingItemConfig>> local_80;
        TDataObjectIterator<FSettingCategoryConfig> local_96;
        for (; local_96; )
        {
            local_72.Add(local_96.GetDataPtr());
            local_96.Next();
        }
        TDataObjectIterator<FSettingSubTitleConfig> local_136;
        for (; local_136; )
        {
            local_76.Add(local_136.GetDataPtr());
            local_136.Next();
        }
        TDataObjectIterator<FSettingItemConfig> local_176;
        for (; local_176; )
        {
            local_80.Add(local_176.GetDataPtr());
            local_176.Next();
        }
        int local_201 = 0;
        for (; local_201 < local_72.Num(); )
        {
            TDataObjectPtr<FSettingCategoryConfig> local_226 = local_72[local_201];
            TEUIModelWeakRef<FVMS_SettingPage> local_228 = TEUIModelWeakRef<FVMS_SettingPage>(this);
            for (auto& local_244 : local_76)
            {
                local_244;
                if (!(local_246.MatchesTag(local_248)))
                {
                    continue;
                }
                TEUIModelWeakRef<FVMS_SettingPage> local_228_2 = TEUIModelWeakRef<FVMS_SettingPage>(this);
                FSettingComponentWidgetClass local_342;
                local_342.DropDownWidgetClass = this.GetDropDownWidgetClass();
                local_342.SliderWidgetClass = this.GetSliderWidgetClass();
                local_342.LinkWidgetClass = this.GetLinkWidgetClass();
                local_342.ToggleWidgetClass = this.GetToggleWidgetClass();
                local_342.KeyboardWidgetClass = this.GetKeyboardSelectorWidgetClass();
                local_342.GamepadWidgetClass = this.GetGamepadSelectorWidgetClass();
                for (auto& local_458 : local_80)
                {
                    local_458;
                    if (!(local_246.MatchesTag(local_248)))
                    {
                        continue;
                    }
                    FVM_PlayerKeyMappingPair& local_460 = ::FVM_PlayerKeyMappingPair::Create(this.GetContext().Manager);
                    if (local_20.Find(local_246))
                    {
                        local_246;
                        local_246 = FGameplayTag::RequestGameplayTag(n"Setting.Gamepad", true);
                        local_460.UpdateGamepadSelector(local_248.MatchesTag(local_246));
                    }
                    else
                    {
                        local_460.SetbIsKeyMapping(false);
                    }
                    TEUIModelRef<FVM_PlayerKeyMappingPair> local_466 = TEUIModelRef<FVM_PlayerKeyMappingPair>(local_460);
                    TEUIModelWeakRef<FVMS_SettingPage> local_228_3 = TEUIModelWeakRef<FVMS_SettingPage>(this);
                    TEUIModelWeakRef<FVM_SettingSubTitle> local_464 = TEUIModelWeakRef<FVM_SettingSubTitle>(local_250);
                    local_250.GetModify_Items().Add(TEUIModelRef<FVM_SettingItem>(local_468));
                    local_248;
                    if (this.GetSettingsValues().Contains(local_248))
                    {
                        local_246;
                        bool local_41 = !(this.IsDisplayOrGraphicsItem(local_246));
                        local_248;
                        float32 local_471 = this.GetSettingsValues()[local_248];
                    }
                    else
                    {
                        local_246;
                        local_468.InitializeApplyValue(local_468.GetDefaultValue(), !(this.IsDisplayOrGraphicsItem(local_246)));
                    }
                    this.GetModify_Items().Add(local_468.GetItemTag(), TEUIModelRef<FVM_SettingItem>(local_468));
                }
                local_230.GetModify_SubTitles().Add(TEUIModelRef<FVM_SettingSubTitle>(local_250));
            }
            FVM_SelectableItem& local_476 = ::FVM_SelectableItem::Create(this.GetContext().Manager);
            local_476.SetbIsSelected((local_201 == this.GetSelectedCategoryIndex()));
            FVM_CommonTabItem& local_482 = ::FVM_CommonTabItem::Create(this.GetContext().Manager);
            this.GetModify_Categories().Add(TEUIModelRef<FVM_SettingCategory>(local_230));
            this.GetModify_CategorySelectableItems().Add(TEUIModelRef<FVM_SelectableItem>(local_476));
            FEUIModelContainer local_500;
            local_500.AddModel(FEUIModelRef(local_476), false);
            FVM_Image local_478;
            local_500.AddModel(FEUIModelRef(local_478), false);
            local_500.AddModel(FEUIModelRef(local_482), false);
            this.GetModify_CategoryListItems().Add(local_500);
            ++local_201;
        }
        return;
    }
    void BuildKeyMappings(TMap<FGameplayTag, TEUIModelRef<FVM_PlayerKeyMappingPair>> &inout KeyMappingMap)
    {
        int local_6;
        int local_8;
        if (!(this.GetKeyMappings().IsValid()))
        {
            this.SetKeyMappings(TEUIModelRef<FVMS_PlayerKeyMappings>(::FVMS_PlayerKeyMappings::Get(this.GetContext().Manager)));
        }
        TEUIModelRef<FVMS_PlayerKeyMappings> local_2 = this.GetKeyMappings();
        TEUIModelRef<FVMS_PlayerKeyMappings> local_2_2 = this.GetKeyMappings();
        for (auto& local_22 : local_6)
        {
            KeyMappingMap.Add(GetKeyboardTag(), local_22);
        }
        for (auto& local_22 : local_8)
        {
            KeyMappingMap.Add(GetGamepadTag(), local_22);
        }
        return;
    }
    void SelectCategory(const int Index)
    {
        if (!(this.GetCategories().IsValidIndex(Index)) || (this.GetSelectedCategoryIndex() == Index))
        {
            return;
        }
        this.ClearSelectedItem();
        if (!(this.GetKeyMappings().IsValid()))
        {
            this.SetKeyMappings(TEUIModelRef<FVMS_PlayerKeyMappings>(::FVMS_PlayerKeyMappings::Get(this.GetContext().Manager)));
        }
        this.SetWarningMessage(NSLOCTEXT("Settings", "CannotModifyKey", "ж— жі•дї®ж”№жЊ‰й”®"));
        if (!(this.CheckHasValueActuallyChanged()))
        {
            this.SetSelectedCategoryIndex(Index);
            this.SetbIsKeyMapping(this.IsKeyMappingCategory() || this.IsGamepadCategory());
            return;
        }
        this.NewSelectedCategoryIndex = Index;
        this.SetbHasSelectedCategoryChanged(!(this.GetbHasSelectedCategoryChanged()));
        return;
    }
    bool RequireSwitchMenuPage(const FEUIModelContainer &inout MenuBarItem, const FEUIWidgetTag &inout Tag = FEUIWidgetTag())
    {
        this.NextMenuBarItem = MenuBarItem;
        this.SetbHasSelectedCategoryChanged(!(this.GetbHasSelectedCategoryChanged()));
        if (Tag.IsValid())
        {
            this.NextTag = Tag;
        }
        else
        {
            this.NextTag = FEUIWidgetTag();
        }
        return this.CheckHasValueActuallyChanged();
    }
    void OnKeyMappingsIsKeySelectingChanged()
    {
        bool local_3 = this.GetKeyMappings().IsValid();
        if (!(local_3))
        {
            local_3 = false;
        }
        else
        {
            TEUIModelRef<FVMS_PlayerKeyMappings> local_2 = this.GetKeyMappings();
            local_3 = GetbIsKeySelecting();
        }
        this.SetbIsKeySelecting(local_3);
        return;
    }
    void CheckHasSettingsReset(const ECommonDialogAnswerType State)
    {
        int local_1 = int(State);
        if (local_1 <= 1)
        {
            if (local_1 != 1)
            {
                return;
            }
            else
            {
                this.ResetChangedSettings();
                return;
            }
        }
        return;
    }
    void CheckHasSettingsChangedForClose(const ECommonDialogAnswerType State)
    {
        int local_1 = int(State);
        if (local_1 <= 2)
        {
            if (local_1 != 1)
            {
                if (local_1 != 2)
                {
                    return;
                }
            }
            else
            {
                this.SaveChangedSettings();
                return;
            }
        }
        return;
    }
    void CheckHasSettingsChangedForSwitch(const ECommonDialogAnswerType State)
    {
        switch (int(State))
        {
        case 1:
        {
            this.SaveChangedSettings();
            this.SetbIsKeyMapping(this.IsKeyMappingCategory() || this.IsGamepadCategory());
            if (this.NextTag.IsValid())
            {
                this.NextTag = FEUIWidgetTag();
            }
            else
            {
                this.SetSelectedCategoryIndex(this.NewSelectedCategoryIndex);
            }
            return;
        }
        case 2:
        {
            this.RevertUnsavedSettings();
            this.SetbIsKeyMapping(this.IsKeyMappingCategory() || this.IsGamepadCategory());
            if (this.NextTag.IsValid())
            {
                this.NextTag = FEUIWidgetTag();
            }
            else
            {
                this.SetSelectedCategoryIndex(this.NewSelectedCategoryIndex);
            }
            return;
        }
        case 0:
        {
            if (this.NextTag.IsValid())
            {
                this.NextTag = FEUIWidgetTag();
                this.bFreshCurrentMenuIndex = false;
            }
            return;
        }
        }
        return;
    }
    bool IsDisplayOrGraphicsItem(const FGameplayTag &inout ItemTag) const
    {
        return ItemTag.MatchesTag(FGameplayTag::RequestGameplayTag(FName("Setting.Display"), true)) || ItemTag.MatchesTag(FGameplayTag::RequestGameplayTag(FName("Setting.Graphics"), true));
    }
    bool IsKeyMappingOrGamepadItem(const FGameplayTag &inout ItemTag) const
    {
        return ItemTag.MatchesTag(FGameplayTag::RequestGameplayTag(FName("Setting.KeyMapping"), true)) || ItemTag.MatchesTag(FGameplayTag::RequestGameplayTag(FName("Setting.Gamepad"), true));
    }
    bool IsMatchSelectedItemTag(const FGameplayTag &inout ItemTag)
    {
        bool local_2;
        if (!(this.GetCategories().IsValidIndex(this.GetSelectedCategoryIndex())))
        {
            local_2 = false;
        }
        else
        {
            int local_1 = this.GetSelectedCategoryIndex();
            local_2 = ItemTag.MatchesTag(GetCategoryTag());
        }
        return local_2;
    }
    void RefreshCategorySelection()
    {
        bool local_2;
        int local_152 = 0;
        TEUIModelRef<FVM_PlayerKeyMappingPair> local_170;
        if (!(this.GetCategories().IsValidIndex(this.GetSelectedCategoryIndex())))
        {
            return;
        }
        int local_3 = 0;
        for (; local_3 < this.GetCategorySelectableItems().Num(); )
        {
            local_2 = (local_3 == this.GetSelectedCategoryIndex());
            local_2.SetbIsSelected();
            ++local_3;
        }
        this.GetModify_SelectedListItems().Empty(0);
        this.SetFirstItem(FEUIDynamicWidgetData());
        this.SetPrevSelectedItem(FEUIDynamicWidgetData());
        if (!(this.GetCategories().IsValidIndex(this.GetSelectedCategoryIndex())))
        {
            return;
        }
        int local_4 = this.GetSelectedCategoryIndex();
        for (auto& local_42 : GetSubTitles())
        {
            FEUIDynamicWidgetData local_66;
            local_66.ModelContainer.AddModel(local_42.opImplConv(), false);
            local_66.WidgetClass = this.GetSettingSubTitleWidgetClass();
            local_2 = !(this.GetModify_SelectedListItems().IsEmpty());
            if (local_2)
            {
                FEUIDynamicWidgetData local_102;
                TEUIModelWeakRef<FVMS_SettingPage> local_126 = TEUIModelWeakRef<FVMS_SettingPage>(this);
                local_2 = false;
                local_102.ModelContainer.AddModel(FEUIModelRef(local_152), local_2);
                local_102.WidgetClass = this.GetSettingSubTitleWidgetClass();
                this.GetModify_SelectedListItems().Add(local_102);
            }
            this.GetModify_SelectedListItems().Add(local_66);
            for (auto& local_166 : GetItems())
            {
                if (local_2)
                {
                    continue;
                }
                local_2 = this.IsKeyMappingCategory() || this.IsGamepadCategory();
                if (!(local_2))
                {
                    local_2 = false;
                }
                else
                {
                    local_170.GetKeyMappingVM();
                    local_2 = !(GetbIsKeyMapping());
                }
                if (local_2)
                {
                    continue;
                }
                if (!(GetItemTag().MatchesTag(FGameplayTag::RequestGameplayTag(n"Setting.Graphics.GraphicsQuality.GraphicsQualityPreset", true))))
                {
                    float32 local_175 = ::SettingUtils::GetCurrentValue(GetApplyEffect(), this.IsDisplayOrGraphicsItem(GetItemTag()));
                    local_175.UpdateComponentValue(false);
                    local_175.UpdateCurrentValue();
                    false.SetbHasResolutionOptionChanged();
                }
                CreateComponentWidget();
                UpdateSwitchIndex();
                FEUIDynamicWidgetData local_102;
                local_102.ModelContainer.AddModel(local_166.opImplConv(), false);
                local_102.WidgetClass = this.GetSettingItemWidgetClass();
                this.GetModify_SelectedListItems().Add(local_102);
                if (this.GetFirstItem().IsEmpty() && CanBeNavigationItem())
                {
                    this.SetFirstItem(local_102);
                    this.SetPrevSelectedItem(local_102);
                }
            }
        }
        if (this.IsKeyMappingCategory())
        {
            TEUIModelRef<FVMS_PlayerKeyMappings> local_178 = this.GetKeyMappings();
            0.SetSettingCategoryIndex();
        }
        else
        {
            if (this.IsGamepadCategory())
            {
                TEUIModelRef<FVMS_PlayerKeyMappings> local_178_2 = this.GetKeyMappings();
                1.SetSettingCategoryIndex();
            }
        }
        TEUIModelRef<FVMS_PlayerKeyMappings> local_178_3 = this.GetKeyMappings();
        local_170.GetSelectingKeyPair();
        if (local_170.IsValid())
        {
            bool local_167 = false;
            TEUIModelRef<FVMS_PlayerKeyMappings> local_178_4 = this.GetKeyMappings();
            local_170.GetSelectingKeyPair();
            local_167.OnKeySelecting0();
            local_167 = false;
            TEUIModelRef<FVMS_PlayerKeyMappings> local_178_5 = this.GetKeyMappings();
            local_170.GetSelectingKeyPair();
            local_167.OnKeySelecting1();
        }
        return;
    }
    void UpdateResolutionDropDownOptions()
    {
        // body not fully recovered вЂ” stub [argmismatch:argint]
    }
    void SyncItemValueDisplay()
    {
        for (auto& local_20 : this.GetItems())
        {
            FGameplayTag local_22 = local_20.GetKey();
            if (local_22.MatchesTag(FGameplayTag::RequestGameplayTag(n"Setting.Graphics.GraphicsQuality.GraphicsQualityPreset", true)))
            {
                continue;
            }
            if (!(this.IsDisplayOrGraphicsItem(local_20.GetKey())))
            {
                continue;
            }
            GetDefaultValue().UpdateCurrentValue();
        }
        return;
    }
    bool CheckHasValueActuallyChanged()
    {
        int local_31 = 0;
        bool local_34;
        bool local_2 = !(this.GetCategories().IsValidIndex(this.GetSelectedCategoryIndex()));
        if (local_2)
        {
            return false;
        }
        this.SyncItemValueDisplay();
        int local_1 = this.GetSelectedCategoryIndex();
        for (auto& local_16 : GetSubTitles())
        {
            local_16;
            for (auto& local_30 : GetItems())
            {
                local_30;
                if (!(GetItemConfig()))
                {
                    local_34 = false;
                }
                else
                {
                    int local_32 = local_31;
                    local_2 = (local_32 == 0);
                    local_34 = local_2;
                }
                local_34 = local_34 && local_2;
                UScriptStruct local_36;
                local_34 = local_34 && !(local_36.IsChildOf(FSettingLink));
                local_34 = local_34 && (GetPreviousValue() != GetCurrentValue());
                if (local_34)
                {
                    return true;
                }
                if (this.IsKeyMappingOrGamepadItem(GetItemTag()))
                {
                    TEUIModelRef<FVM_PlayerKeyMappingPair> local_44;
                    local_44.GetKeyMappingVM();
                    if (GetPreviousKey0().DifferentFromPreviousKey(GetPreviousChordKey0(), GetPreviousKey1(), GetPreviousChordKey1()))
                    {
                        return true;
                    }
                }
            }
        }
        return false;
    }
    void OnKeyMappingsCanRevertChanged()
    {
        bool local_3 = this.GetKeyMappings().IsValid();
        if (!(local_3))
        {
            local_3 = false;
        }
        else
        {
            TEUIModelRef<FVMS_PlayerKeyMappings> local_2 = this.GetKeyMappings();
            local_3 = GetbCanRevert();
        }
        this.SetbCanRevert(local_3);
        return;
    }
    void SaveChangedSettings()
    {
        bool local_17;
        TEUIModelRef<FVM_PlayerKeyMappingPair> local_26;
        for (auto& local_20 : this.GetItems())
        {
            local_20;
            SyncPreviousValue();
        }
        if (this.IsGamepadCategory() || this.IsKeyMappingCategory())
        {
            for (auto& local_20 : this.GetItems())
            {
                local_20;
                local_26.GetKeyMappingVM();
                if (local_26.IsValid())
                {
                    local_17 = false;
                    local_26.GetKeyMappingVM();
                    local_17.SetbHasChanged();
                }
                RefreshKeyMappingDisplay();
            }
            TEUIModelRef<FVMS_PlayerKeyMappings> local_28 = this.GetKeyMappings();
            SaveKeySettings();
            FCommonTipsParam local_32;
            ::CommonPopup_Internal::OpenTipsWithoutECSWorld(this.GetContext().UELocalPlayer, NSLOCTEXT("SettingPage", "SaveSettingsSuccess", "дїќе­ж€ђеЉџ"), local_32, ECommonTipsType(0), FEUIModelContainer());
            return;
        }
        for (auto& local_66 : this.GetChangedItemVMs())
        {
            local_66;
            ApplyChangedValue();
        }
        if (this.GetbHasResolutionOptionChanged())
        {
            UKLGameUserSettings::Get().ApplyResolutionGraphicOptions();
            this.SetbHasResolutionOptionChanged(false);
        }
        else
        {
            UKLGameUserSettings::Get().ApplyNonResolutionGraphicOptions();
        }
        UKLGameUserSettings::Get().SaveGraphicOptions();
        this.GetModify_ChangedItemVMs().Empty(0);
        this.SaveSettings(true);
        return;
    }
    bool IsDisplayCategory() const
    {
        bool local_2 = !(this.GetCategories().IsValidIndex(this.GetSelectedCategoryIndex()));
        if (local_2)
        {
            local_2 = true;
        }
        else
        {
            FGameplayTag local_5 = FGameplayTag::RequestGameplayTag(n"Setting.Display", true);
            int local_1 = this.GetSelectedCategoryIndex();
            local_2 = GetCategoryTag().MatchesTag(local_5);
        }
        return local_2;
    }
    bool IsGraphicsCategory() const
    {
        bool local_2 = !(this.GetCategories().IsValidIndex(this.GetSelectedCategoryIndex()));
        if (local_2)
        {
            local_2 = true;
        }
        else
        {
            FGameplayTag local_5 = FGameplayTag::RequestGameplayTag(n"Setting.Graphics", true);
            int local_1 = this.GetSelectedCategoryIndex();
            local_2 = GetCategoryTag().MatchesTag(local_5);
        }
        return local_2;
    }
    bool IsKeyMappingCategory() const
    {
        bool local_2 = !(this.GetCategories().IsValidIndex(this.GetSelectedCategoryIndex()));
        if (local_2)
        {
            local_2 = true;
        }
        else
        {
            FGameplayTag local_5 = FGameplayTag::RequestGameplayTag(n"Setting.KeyMapping", true);
            int local_1 = this.GetSelectedCategoryIndex();
            local_2 = GetCategoryTag().MatchesTag(local_5);
        }
        return local_2;
    }
    bool IsGamepadCategory() const
    {
        bool local_2 = !(this.GetCategories().IsValidIndex(this.GetSelectedCategoryIndex()));
        if (local_2)
        {
            local_2 = true;
        }
        else
        {
            FGameplayTag local_5 = FGameplayTag::RequestGameplayTag(n"Setting.Gamepad", true);
            int local_1 = this.GetSelectedCategoryIndex();
            local_2 = GetCategoryTag().MatchesTag(local_5);
        }
        return local_2;
    }
    bool IsDisplayCategory(const int Index) const
    {
        return !(this.GetCategories().IsValidIndex(Index)) || GetCategoryTag().MatchesTag(FGameplayTag::RequestGameplayTag(n"Setting.Display", true));
    }
    bool IsGraphicsCategory(const int Index) const
    {
        return !(this.GetCategories().IsValidIndex(Index)) || GetCategoryTag().MatchesTag(FGameplayTag::RequestGameplayTag(n"Setting.Graphics", true));
    }
    bool IsKeyMappingCategory(const int Index) const
    {
        return !(this.GetCategories().IsValidIndex(Index)) || GetCategoryTag().MatchesTag(FGameplayTag::RequestGameplayTag(n"Setting.KeyMapping", true));
    }
    bool IsGamepadCategory(const int Index) const
    {
        return !(this.GetCategories().IsValidIndex(Index)) || GetCategoryTag().MatchesTag(FGameplayTag::RequestGameplayTag(n"Setting.Gamepad", true));
    }
    void ResetChangedSettings()
    {
        this.GetModify_ChangedItemVMs().Empty(0);
        this.SetbHasResolutionOptionChanged(false);
        if (this.IsKeyMappingCategory() || this.IsGamepadCategory())
        {
            if (this.GetKeyMappings().IsValid())
            {
                TEUIModelRef<FVMS_PlayerKeyMappings> local_6 = this.GetKeyMappings();
                ResetKeys();
            }
            int local_1 = this.GetSelectedCategoryIndex();
            for (auto& local_20 : GetSubTitles())
            {
                local_20;
                for (auto& local_34 : GetItems())
                {
                    local_34;
                    RefreshKeyMappingDisplay();
                }
            }
            return;
        }
        if (this.IsDisplayCategory())
        {
            UKLGameUserSettings::Get().ResetDisplayOptions();
            int local_1_2 = this.GetSelectedCategoryIndex();
            for (auto& local_20 : GetSubTitles())
            {
                local_20;
                for (auto& local_34 : GetItems())
                {
                    local_34;
                    ResetValueDisplay();
                }
            }
        }
        else
        {
            if (this.IsGraphicsCategory())
            {
                UKLGameUserSettings::Get().ResetQualityOptions();
                int local_1_3 = this.GetSelectedCategoryIndex();
                for (auto& local_20 : GetSubTitles())
                {
                    local_20;
                    for (auto& local_34 : GetItems())
                    {
                        local_34;
                        ResetValueDisplay();
                    }
                }
            }
            else
            {
                int local_1_4 = this.GetSelectedCategoryIndex();
                for (auto& local_20 : GetSubTitles())
                {
                    local_20;
                    for (auto& local_34 : GetItems())
                    {
                        local_34;
                        ResetValue();
                    }
                }
            }
        }
        this.SaveSettings(false);
        return;
    }
    void RevertUnsavedSettings()
    {
        int local_33 = 0;
        this.GetModify_ChangedItemVMs().Empty(0);
        this.SetbHasResolutionOptionChanged(false);
        if (this.IsKeyMappingCategory() || this.IsGamepadCategory())
        {
            ::FVMS_PlayerKeyMappings::Get(this.GetContext().Manager).Revert();
        }
        int local_1 = this.GetSelectedCategoryIndex();
        for (auto& local_18 : GetSubTitles())
        {
            local_18;
            for (auto& local_32 : GetItems())
            {
                local_32;
                int local_34 = local_33;
                if (local_34 == 0)
                {
                    RevertValue();
                }
                if (this.IsKeyMappingCategory() || this.IsGamepadCategory())
                {
                    RefreshKeyMappingDisplay();
                }
            }
        }
        this.SaveSettings(false);
        return;
    }
    void BroadcastSettingsChanged(const float32 Value)
    {
        this.GetOnSettingsChanged().Broadcast();
        return;
    }
    void RefreshSelectedItem(const TDataObjectPtr<FSettingItemConfig> &inout ItemConfig, const bool _bShowWarningMessage = false)
    {
        this.SetSelectedItemConfig(ItemConfig);
        this.SetbShowWarningMessage(_bShowWarningMessage);
        return;
    }
    void ClearSelectedItem()
    {
        this.SetSelectedItemConfig(TDataObjectPtr<FSettingItemConfig>(nullptr));
        this.SetbShowWarningMessage(false);
        return;
    }
    TEUIModelRef<FVMS_PlayerKeyMappings> GetKeyMappings() const property
    {
        this.TrackPropertyRead(0);
        return this.m_KeyMappings;
    }
    void SetKeyMappings(const TEUIModelRef<FVMS_PlayerKeyMappings> &inout __Value) property
    {
        TEUIModelRef<FVMS_PlayerKeyMappings> local_2;
        local_2 = this.m_KeyMappings;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_KeyMappings = __Value;
        return;
    }
    const TArray<FEUIModelContainer> GetCategoryListItems() const property
    {
        const TArray<FEUIModelContainer> __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    TArray<FEUIModelContainer> GetModify_CategoryListItems() property
    {
        TArray<FEUIModelContainer> __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetCategoryListItems(const TArray<FEUIModelContainer> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_CategoryListItems = __Value;
        return;
    }
    const TArray<FEUIDynamicWidgetData> GetSelectedListItems() const property
    {
        const TArray<FEUIDynamicWidgetData> __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    TArray<FEUIDynamicWidgetData> GetModify_SelectedListItems() property
    {
        TArray<FEUIDynamicWidgetData> __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetSelectedListItems(const TArray<FEUIDynamicWidgetData> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_SelectedListItems = __Value;
        return;
    }
    const FEUIDynamicWidgetData GetFirstItem() const property
    {
        const FEUIDynamicWidgetData __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    FEUIDynamicWidgetData GetModify_FirstItem() property
    {
        FEUIDynamicWidgetData __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetFirstItem(const FEUIDynamicWidgetData &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_FirstItem = __Value;
        return;
    }
    const FEUIDynamicWidgetData GetPrevSelectedItem() const property
    {
        const FEUIDynamicWidgetData __r;
        this.TrackPropertyRead(4);
        return __r;
    }
    FEUIDynamicWidgetData GetModify_PrevSelectedItem() property
    {
        FEUIDynamicWidgetData __r;
        this.MarkPropertyDirty(4);
        return __r;
    }
    void SetPrevSelectedItem(const FEUIDynamicWidgetData &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_PrevSelectedItem = __Value;
        return;
    }
    TSoftClassPtr<UEUIUserWidget> GetSettingSubTitleWidgetClass() const property
    {
        this.TrackPropertyRead(5);
        return this.m_SettingSubTitleWidgetClass;
    }
    void SetSettingSubTitleWidgetClass(const TSoftClassPtr<UEUIUserWidget> &inout __Value) property
    {
        if ((this.m_SettingSubTitleWidgetClass == __Value))
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_SettingSubTitleWidgetClass = __Value;
        return;
    }
    TSoftClassPtr<UEUIUserWidget> GetSettingItemWidgetClass() const property
    {
        this.TrackPropertyRead(6);
        return this.m_SettingItemWidgetClass;
    }
    void SetSettingItemWidgetClass(const TSoftClassPtr<UEUIUserWidget> &inout __Value) property
    {
        if ((this.m_SettingItemWidgetClass == __Value))
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_SettingItemWidgetClass = __Value;
        return;
    }
    TSoftClassPtr<UEUIUserWidget> GetDropDownWidgetClass() const property
    {
        this.TrackPropertyRead(7);
        return this.m_DropDownWidgetClass;
    }
    void SetDropDownWidgetClass(const TSoftClassPtr<UEUIUserWidget> &inout __Value) property
    {
        if ((this.m_DropDownWidgetClass == __Value))
        {
            return;
        }
        this.MarkPropertyDirty(7);
        this.m_DropDownWidgetClass = __Value;
        return;
    }
    TSoftClassPtr<UEUIUserWidget> GetSliderWidgetClass() const property
    {
        this.TrackPropertyRead(8);
        return this.m_SliderWidgetClass;
    }
    void SetSliderWidgetClass(const TSoftClassPtr<UEUIUserWidget> &inout __Value) property
    {
        if ((this.m_SliderWidgetClass == __Value))
        {
            return;
        }
        this.MarkPropertyDirty(8);
        this.m_SliderWidgetClass = __Value;
        return;
    }
    TSoftClassPtr<UEUIUserWidget> GetLinkWidgetClass() const property
    {
        this.TrackPropertyRead(9);
        return this.m_LinkWidgetClass;
    }
    void SetLinkWidgetClass(const TSoftClassPtr<UEUIUserWidget> &inout __Value) property
    {
        if ((this.m_LinkWidgetClass == __Value))
        {
            return;
        }
        this.MarkPropertyDirty(9);
        this.m_LinkWidgetClass = __Value;
        return;
    }
    TSoftClassPtr<UEUIUserWidget> GetToggleWidgetClass() const property
    {
        this.TrackPropertyRead(10);
        return this.m_ToggleWidgetClass;
    }
    void SetToggleWidgetClass(const TSoftClassPtr<UEUIUserWidget> &inout __Value) property
    {
        if ((this.m_ToggleWidgetClass == __Value))
        {
            return;
        }
        this.MarkPropertyDirty(10);
        this.m_ToggleWidgetClass = __Value;
        return;
    }
    TSoftClassPtr<UEUIUserWidget> GetKeyboardSelectorWidgetClass() const property
    {
        this.TrackPropertyRead(11);
        return this.m_KeyboardSelectorWidgetClass;
    }
    void SetKeyboardSelectorWidgetClass(const TSoftClassPtr<UEUIUserWidget> &inout __Value) property
    {
        if ((this.m_KeyboardSelectorWidgetClass == __Value))
        {
            return;
        }
        this.MarkPropertyDirty(11);
        this.m_KeyboardSelectorWidgetClass = __Value;
        return;
    }
    TSoftClassPtr<UEUIUserWidget> GetGamepadSelectorWidgetClass() const property
    {
        this.TrackPropertyRead(12);
        return this.m_GamepadSelectorWidgetClass;
    }
    void SetGamepadSelectorWidgetClass(const TSoftClassPtr<UEUIUserWidget> &inout __Value) property
    {
        if ((this.m_GamepadSelectorWidgetClass == __Value))
        {
            return;
        }
        this.MarkPropertyDirty(12);
        this.m_GamepadSelectorWidgetClass = __Value;
        return;
    }
    const TDataObjectPtr<FSettingItemConfig> GetSelectedItemConfig() const property
    {
        const TDataObjectPtr<FSettingItemConfig> __r;
        this.TrackPropertyRead(13);
        return __r;
    }
    TDataObjectPtr<FSettingItemConfig> GetModify_SelectedItemConfig() property
    {
        TDataObjectPtr<FSettingItemConfig> __r;
        this.MarkPropertyDirty(13);
        return __r;
    }
    void SetSelectedItemConfig(const TDataObjectPtr<FSettingItemConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(13);
        this.m_SelectedItemConfig = __Value;
        return;
    }
    const TArray<TEUIModelRef<FVM_SettingCategory>> GetCategories() const property
    {
        const TArray<TEUIModelRef<FVM_SettingCategory>> __r;
        this.TrackPropertyRead(14);
        return __r;
    }
    TArray<TEUIModelRef<FVM_SettingCategory>> GetModify_Categories() property
    {
        TArray<TEUIModelRef<FVM_SettingCategory>> __r;
        this.MarkPropertyDirty(14);
        return __r;
    }
    void SetCategories(const TArray<TEUIModelRef<FVM_SettingCategory>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(14);
        this.m_Categories = __Value;
        return;
    }
    const TMap<FGameplayTag, TEUIModelRef<FVM_SettingItem>> GetItems() const property
    {
        const TMap<FGameplayTag, TEUIModelRef<FVM_SettingItem>> __r;
        this.TrackPropertyRead(15);
        return __r;
    }
    TMap<FGameplayTag, TEUIModelRef<FVM_SettingItem>> GetModify_Items() property
    {
        TMap<FGameplayTag, TEUIModelRef<FVM_SettingItem>> __r;
        this.MarkPropertyDirty(15);
        return __r;
    }
    void SetItems(const TMap<FGameplayTag, TEUIModelRef<FVM_SettingItem>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(15);
        this.m_Items = __Value;
        return;
    }
    const TArray<TEUIModelRef<FVM_SelectableItem>> GetCategorySelectableItems() const property
    {
        const TArray<TEUIModelRef<FVM_SelectableItem>> __r;
        this.TrackPropertyRead(16);
        return __r;
    }
    TArray<TEUIModelRef<FVM_SelectableItem>> GetModify_CategorySelectableItems() property
    {
        TArray<TEUIModelRef<FVM_SelectableItem>> __r;
        this.MarkPropertyDirty(16);
        return __r;
    }
    void SetCategorySelectableItems(const TArray<TEUIModelRef<FVM_SelectableItem>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(16);
        this.m_CategorySelectableItems = __Value;
        return;
    }
    UCameraSettings GetCameraSettings() const property
    {
        this.TrackPropertyRead(17);
        return this.m_CameraSettings;
    }
    void SetCameraSettings(const UCameraSettings __Value) property
    {
        if (this.m_CameraSettings == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(17);
        return;
    }
    int GetSelectedCategoryIndex() const property
    {
        this.TrackPropertyRead(18);
        return this.m_SelectedCategoryIndex;
    }
    void SetSelectedCategoryIndex(const int __Value) property
    {
        if (this.m_SelectedCategoryIndex == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(18);
        this.m_SelectedCategoryIndex = __Value;
        return;
    }
    int GetSelectedItemIndex() const property
    {
        this.TrackPropertyRead(19);
        return this.m_SelectedItemIndex;
    }
    void SetSelectedItemIndex(const int __Value) property
    {
        if (this.m_SelectedItemIndex == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(19);
        this.m_SelectedItemIndex = __Value;
        return;
    }
    bool GetbHasVideoMemoryInfo() const property
    {
        this.TrackPropertyRead(20);
        return this.m_bHasVideoMemoryInfo;
    }
    void SetbHasVideoMemoryInfo(const bool __Value) property
    {
        if (!(this.m_bHasVideoMemoryInfo) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(20);
        this.m_bHasVideoMemoryInfo = __Value;
        return;
    }
    bool GetbIsKeySelecting() const property
    {
        this.TrackPropertyRead(21);
        return this.m_bIsKeySelecting;
    }
    void SetbIsKeySelecting(const bool __Value) property
    {
        if (!(this.m_bIsKeySelecting) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(21);
        this.m_bIsKeySelecting = __Value;
        return;
    }
    bool GetbHasSelectedCategoryChanged() const property
    {
        this.TrackPropertyRead(22);
        return this.m_bHasSelectedCategoryChanged;
    }
    void SetbHasSelectedCategoryChanged(const bool __Value) property
    {
        if (!(this.m_bHasSelectedCategoryChanged) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(22);
        this.m_bHasSelectedCategoryChanged = __Value;
        return;
    }
    bool GetbHasResolutionOptionChanged() const property
    {
        this.TrackPropertyRead(23);
        return this.m_bHasResolutionOptionChanged;
    }
    void SetbHasResolutionOptionChanged(const bool __Value) property
    {
        if (!(this.m_bHasResolutionOptionChanged) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(23);
        this.m_bHasResolutionOptionChanged = __Value;
        return;
    }
    bool GetbShowWarningMessage() const property
    {
        this.TrackPropertyRead(24);
        return this.m_bShowWarningMessage;
    }
    void SetbShowWarningMessage(const bool __Value) property
    {
        if (!(this.m_bShowWarningMessage) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(24);
        this.m_bShowWarningMessage = __Value;
        return;
    }
    const FText GetWarningMessage() const property
    {
        const FText __r;
        this.TrackPropertyRead(25);
        return __r;
    }
    FText GetModify_WarningMessage() property
    {
        FText __r;
        this.MarkPropertyDirty(25);
        return __r;
    }
    void SetWarningMessage(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(25);
        this.m_WarningMessage = __Value;
        return;
    }
    bool GetbCanRevert() const property
    {
        this.TrackPropertyRead(26);
        return this.m_bCanRevert;
    }
    void SetbCanRevert(const bool __Value) property
    {
        if (!(this.m_bCanRevert) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(26);
        this.m_bCanRevert = __Value;
        return;
    }
    bool GetbIsKeyMapping() const property
    {
        this.TrackPropertyRead(27);
        return this.m_bIsKeyMapping;
    }
    void SetbIsKeyMapping(const bool __Value) property
    {
        if (!(this.m_bIsKeyMapping) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(27);
        this.m_bIsKeyMapping = __Value;
        return;
    }
    const TArray<TEUIModelRef<FVM_SettingItem>> GetChangedItemVMs() const property
    {
        const TArray<TEUIModelRef<FVM_SettingItem>> __r;
        this.TrackPropertyRead(28);
        return __r;
    }
    TArray<TEUIModelRef<FVM_SettingItem>> GetModify_ChangedItemVMs() property
    {
        TArray<TEUIModelRef<FVM_SettingItem>> __r;
        this.MarkPropertyDirty(28);
        return __r;
    }
    void SetChangedItemVMs(const TArray<TEUIModelRef<FVM_SettingItem>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(28);
        this.m_ChangedItemVMs = __Value;
        return;
    }
    const FGameUserSettingCollection GetSettingsCollection() const property
    {
        const FGameUserSettingCollection __r;
        this.TrackPropertyRead(29);
        return __r;
    }
    FGameUserSettingCollection GetModify_SettingsCollection() property
    {
        FGameUserSettingCollection __r;
        this.MarkPropertyDirty(29);
        return __r;
    }
    void SetSettingsCollection(const FGameUserSettingCollection &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(29);
        this.m_SettingsCollection = __Value;
        return;
    }
    const TMap<FGameplayTag, float32> GetSettingsValues() const property
    {
        const TMap<FGameplayTag, float32> __r;
        this.TrackPropertyRead(30);
        return __r;
    }
    TMap<FGameplayTag, float32> GetModify_SettingsValues() property
    {
        TMap<FGameplayTag, float32> __r;
        this.MarkPropertyDirty(30);
        return __r;
    }
    void SetSettingsValues(const TMap<FGameplayTag, float32> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(30);
        this.m_SettingsValues = __Value;
        return;
    }
    const FOnSettingsChanged GetOnSettingsChanged() const property
    {
        const FOnSettingsChanged __r;
        this.TrackPropertyRead(31);
        return __r;
    }
    FOnSettingsChanged GetModify_OnSettingsChanged() property
    {
        FOnSettingsChanged __r;
        this.MarkPropertyDirty(31);
        return __r;
    }
    void SetOnSettingsChanged(const FOnSettingsChanged &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(31);
        return;
    }
    const float32 GetItemsOpacity() const property
    {
        const float32 __r;
        this.TrackPropertyRead(32);
        return __r;
    }
    float32 GetModify_ItemsOpacity() property
    {
        float32 __r;
        this.MarkPropertyDirty(32);
        return __r;
    }
    void SetItemsOpacity(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(32);
        this.m_ItemsOpacity = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_SettingSystemMainState
{
    UPROPERTY()
    ESlateVisibility SystemMainVisibility;
    UPROPERTY()
    TEUIModelRef<FVM_SettingSystemMainState> Self;


}

struct __GeneratedProperties_FVMS_SettingPage
{
    UPROPERTY()
    TEUIModelRef<FVMS_SettingPage> Self;

    __GeneratedProperties_FVMS_SettingPage()
    {
        return;
    }
}

namespace FVM_SettingSystemMainState
{
FVM_SettingSystemMainState& Create(const UObject ContextObject)
{
    return FVM_SettingSystemMainState::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_SettingSystemMainState CreateByManager(const UEUIManagerSubsystem Manager)
{
    FVM_SettingSystemMainState __r;
    TEUIModelRef<FVM_SettingSystemMainState> local_6 = TEUIModelRef<FVM_SettingSystemMainState>(EUIInternal::MakeModelWithManager(Manager, FVM_SettingSystemMainState::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "SystemMainVisibility";
    local_14.TypeName = "ESlateVisibility";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_SettingSystemMainState>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_SettingSystemMainState;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_SettingSystemMainState;
}
ESlateVisibility __UIGetter_SystemMainVisibility(const FVM_SettingSystemMainState &inout Model)
{
    return Model.GetSystemMainVisibility();
}
TEUIModelRef<FVM_SettingSystemMainState> __UIGetter_Self(const FVM_SettingSystemMainState &inout Model)
{
    return TEUIModelRef<FVM_SettingSystemMainState>(Model);
}
int __IndexOf_bIsHiddenSystemMain()
{
    return 0;
}
}
namespace __GeneratedProperties_FVM_SettingSystemMainState
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
namespace FVMS_SettingPage
{
FVMS_SettingPage& Get(const UObject ContextObject)
{
    return FVMS_SettingPage::GetByManager(EUIInternal::GetContextManager(ContextObject));
}
FVMS_SettingPage GetByManager(const UEUIManagerSubsystem Manager)
{
    FVMS_SettingPage __r;
    TEUIModelRef<FVMS_SettingPage> local_6 = TEUIModelRef<FVMS_SettingPage>(EUIInternal::MakeModelWithManager(Manager, FVMS_SettingPage::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    // body not fully recovered вЂ” stub [opcode-uncovered]
}
UScriptStruct GetModelStruct()
{
    return FVMS_SettingPage;
}
void __RefreshVideoMemoryVisibility(FVMS_SettingPage &inout Model)
{
    Model.RefreshVideoMemoryVisibility();
    return;
}
void __OnKeyMappingsIsKeySelectingChanged(FVMS_SettingPage &inout Model)
{
    Model.OnKeyMappingsIsKeySelectingChanged();
    return;
}
void __RefreshCategorySelection(FVMS_SettingPage &inout Model)
{
    Model.RefreshCategorySelection();
    return;
}
void __OnKeyMappingsCanRevertChanged(FVMS_SettingPage &inout Model)
{
    Model.OnKeyMappingsCanRevertChanged();
    return;
}
TEUIModelRef<FVMS_PlayerKeyMappings> __UIGetter_KeyMappings(const FVMS_SettingPage &inout Model)
{
    return Model.GetKeyMappings();
}
TArray<FEUIModelContainer> __UIGetter_CategoryListItems(const FVMS_SettingPage &inout Model)
{
    return Model.GetCategoryListItems();
}
TArray<FEUIDynamicWidgetData> __UIGetter_SelectedListItems(const FVMS_SettingPage &inout Model)
{
    return Model.GetSelectedListItems();
}
FEUIDynamicWidgetData __UIGetter_FirstItem(const FVMS_SettingPage &inout Model)
{
    return Model.GetFirstItem();
}
FEUIDynamicWidgetData __UIGetter_PrevSelectedItem(const FVMS_SettingPage &inout Model)
{
    return Model.GetPrevSelectedItem();
}
TDataObjectPtr<FSettingItemConfig> __UIGetter_SelectedItemConfig(const FVMS_SettingPage &inout Model)
{
    return Model.GetSelectedItemConfig();
}
bool __UIGetter_bHasVideoMemoryInfo(const FVMS_SettingPage &inout Model)
{
    return Model.GetbHasVideoMemoryInfo();
}
bool __UIGetter_bShowWarningMessage(const FVMS_SettingPage &inout Model)
{
    return Model.GetbShowWarningMessage();
}
FText __UIGetter_WarningMessage(const FVMS_SettingPage &inout Model)
{
    return Model.GetWarningMessage();
}
bool __UIGetter_bCanRevert(const FVMS_SettingPage &inout Model)
{
    return Model.GetbCanRevert();
}
bool __UIGetter_bIsKeyMapping(const FVMS_SettingPage &inout Model)
{
    return Model.GetbIsKeyMapping();
}
void __UISetter_ChangedItemVMs(FVMS_SettingPage &inout Model, const TArray<TEUIModelRef<FVM_SettingItem>> &inout Value)
{
    Model.SetChangedItemVMs(Value);
    return;
}
float32 __UIGetter_ItemsOpacity(const FVMS_SettingPage &inout Model)
{
    return Model.GetItemsOpacity();
}
TEUIModelRef<FVMS_SettingPage> __UIGetter_Self(const FVMS_SettingPage &inout Model)
{
    return TEUIModelRef<FVMS_SettingPage>(Model);
}
int __IndexOf_KeyMappings()
{
    return 0;
}
int __IndexOf_CategoryListItems()
{
    return 1;
}
int __IndexOf_SelectedListItems()
{
    return 2;
}
int __IndexOf_FirstItem()
{
    return 3;
}
int __IndexOf_PrevSelectedItem()
{
    return 4;
}
int __IndexOf_SettingSubTitleWidgetClass()
{
    return 5;
}
int __IndexOf_SettingItemWidgetClass()
{
    return 6;
}
int __IndexOf_DropDownWidgetClass()
{
    return 7;
}
int __IndexOf_SliderWidgetClass()
{
    return 8;
}
int __IndexOf_LinkWidgetClass()
{
    return 9;
}
int __IndexOf_ToggleWidgetClass()
{
    return 10;
}
int __IndexOf_KeyboardSelectorWidgetClass()
{
    return 11;
}
int __IndexOf_GamepadSelectorWidgetClass()
{
    return 12;
}
int __IndexOf_SelectedItemConfig()
{
    return 13;
}
int __IndexOf_Categories()
{
    return 14;
}
int __IndexOf_Items()
{
    return 15;
}
int __IndexOf_CategorySelectableItems()
{
    return 16;
}
int __IndexOf_CameraSettings()
{
    return 17;
}
int __IndexOf_SelectedCategoryIndex()
{
    return 18;
}
int __IndexOf_SelectedItemIndex()
{
    return 19;
}
int __IndexOf_bHasVideoMemoryInfo()
{
    return 20;
}
int __IndexOf_bIsKeySelecting()
{
    return 21;
}
int __IndexOf_bHasSelectedCategoryChanged()
{
    return 22;
}
int __IndexOf_bHasResolutionOptionChanged()
{
    return 23;
}
int __IndexOf_bShowWarningMessage()
{
    return 24;
}
int __IndexOf_WarningMessage()
{
    return 25;
}
int __IndexOf_bCanRevert()
{
    return 26;
}
int __IndexOf_bIsKeyMapping()
{
    return 27;
}
int __IndexOf_ChangedItemVMs()
{
    return 28;
}
int __IndexOf_SettingsCollection()
{
    return 29;
}
int __IndexOf_SettingsValues()
{
    return 30;
}
int __IndexOf_OnSettingsChanged()
{
    return 31;
}
int __IndexOf_ItemsOpacity()
{
    return 32;
}
}
namespace __GeneratedProperties_FVMS_SettingPage
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
