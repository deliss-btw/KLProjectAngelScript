
namespace FVM_SettingItem
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature OnComponentHovered = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature OnComponentUnhovered = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature OnItemSelectedOrValueChanged = FEUIModelCallbackSignature();

}
struct FVM_SettingItem : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    FText m_ItemName;
    UPROPERTY()
    FText m_ItemDesc;
    UPROPERTY()
    FGameplayTag m_ItemTag;
    UPROPERTY()
    FEUIDynamicWidgetData m_ComponentWidgetData;
    UPROPERTY()
    TEUIModelWeakRef<FVM_SettingSubTitle> m_OwnerSubTitle;
    UPROPERTY()
    TEUIModelWeakRef<FVMS_SettingPage> m_OwnerPage;
    UPROPERTY()
    TDataObjectPtr<FSettingItemConfig> m_ItemConfig;
    UPROPERTY()
    FInstancedStruct m_ApplyEffect;
    UPROPERTY()
    FSettingComponentWidgetClass m_SettingComponentWidgetClass;
    UPROPERTY()
    TEUIModelRef<FVM_PlayerKeyMappingPair> m_KeyMappingVM;
    UPROPERTY()
    bool m_bRefreshComponentWidget;
    UPROPERTY()
    bool m_bHasResolutionOptionChanged;
    UPROPERTY()
    bool m_bNeedCheckGraphicsQualityPreset;
    UPROPERTY()
    float32 m_CurrentValue;
    UPROPERTY()
    float32 m_ChangedValue;
    UPROPERTY()
    float32 m_PreviousValue;
    UPROPERTY()
    FKey m_PreviousKey0;
    UPROPERTY()
    FKey m_PreviousKey1;
    UPROPERTY()
    FKey m_PreviousChordKey0;
    UPROPERTY()
    FKey m_PreviousChordKey1;
    UPROPERTY()
    bool m_bShowWarningMessage;
    UPROPERTY()
    bool m_bIsHovered;
    UPROPERTY()
    bool m_bIsEnabled;
    UPROPERTY()
    bool m_bNeedApply;
    UPROPERTY()
    bool m_bIsDisplayOrGraphics;
    UPROPERTY()
    int m_SwitchIndex;
    UPROPERTY()
    TEUIModelWeakRef<FVM_CommonComponentToggle> m_ToggleVM;
    UPROPERTY()
    TEUIModelWeakRef<FVM_CommonComponentDropDown> m_DropdownVM;
    UPROPERTY()
    TEUIModelWeakRef<FVM_CommonComponentSlider> m_SliderVM;
    UPROPERTY()
    TEUIModelWeakRef<FVM_CommonComponentFilter> m_LinkVM;
    UPROPERTY()
    float32 m_ComponentWidgetOpacity;

    FVM_SettingItem()
    {
        this.m_CurrentValue = 0.0f;
        this.m_ChangedValue = 0.0f;
        this.m_PreviousValue = 0.0f;
        this.m_bRefreshComponentWidget = false;
        this.m_bHasResolutionOptionChanged = false;
        this.m_bNeedCheckGraphicsQualityPreset = true;
        this.m_bShowWarningMessage = false;
        this.m_bIsHovered = false;
        this.m_bIsEnabled = true;
        this.m_bNeedApply = false;
        this.m_bIsDisplayOrGraphics = false;
        this.m_SwitchIndex = 0;
        this.m_ComponentWidgetOpacity = 1.0f;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_SettingItem' by default constructor.");
        return;
    }
    FVM_SettingItem(const FVM_SettingItem &inout Other)
    {
        this.m_CurrentValue = 0.0f;
        this.m_ChangedValue = 0.0f;
        this.m_PreviousValue = 0.0f;
        this.m_bRefreshComponentWidget = false;
        this.m_bHasResolutionOptionChanged = false;
        this.m_bNeedCheckGraphicsQualityPreset = true;
        this.m_bShowWarningMessage = false;
        this.m_bIsHovered = false;
        this.m_bIsEnabled = true;
        this.m_bNeedApply = false;
        this.m_bIsDisplayOrGraphics = false;
        this.m_SwitchIndex = 0;
        this.m_ComponentWidgetOpacity = 1.0f;
        this.m_ItemName = Other.m_ItemName;
        this.m_ItemDesc = Other.m_ItemDesc;
        this.m_ItemTag = Other.m_ItemTag;
        this.m_ComponentWidgetData = Other.m_ComponentWidgetData;
        this.m_OwnerSubTitle = Other.m_OwnerSubTitle;
        this.m_OwnerPage = Other.m_OwnerPage;
        this.m_ItemConfig = Other.m_ItemConfig;
        this.m_ApplyEffect = Other.m_ApplyEffect;
        this.m_KeyMappingVM = Other.m_KeyMappingVM;
        this.m_bRefreshComponentWidget = Other.m_bRefreshComponentWidget;
        this.m_bHasResolutionOptionChanged = Other.m_bHasResolutionOptionChanged;
        this.m_bNeedCheckGraphicsQualityPreset = Other.m_bNeedCheckGraphicsQualityPreset;
        this.m_CurrentValue = Other.m_CurrentValue;
        this.m_ChangedValue = Other.m_ChangedValue;
        this.m_PreviousValue = Other.m_PreviousValue;
        this.m_PreviousKey0 = Other.m_PreviousKey0;
        this.m_PreviousKey1 = Other.m_PreviousKey1;
        this.m_PreviousChordKey0 = Other.m_PreviousChordKey0;
        this.m_PreviousChordKey1 = Other.m_PreviousChordKey1;
        this.m_bShowWarningMessage = Other.m_bShowWarningMessage;
        this.m_bIsHovered = Other.m_bIsHovered;
        this.m_bIsEnabled = Other.m_bIsEnabled;
        this.m_bNeedApply = Other.m_bNeedApply;
        this.m_bIsDisplayOrGraphics = Other.m_bIsDisplayOrGraphics;
        this.m_SwitchIndex = int(Other.m_SwitchIndex);
        this.m_ToggleVM = Other.m_ToggleVM;
        this.m_DropdownVM = Other.m_DropdownVM;
        this.m_SliderVM = Other.m_SliderVM;
        this.m_LinkVM = Other.m_LinkVM;
        this.m_ComponentWidgetOpacity = Other.m_ComponentWidgetOpacity;
        return;
    }
    FVM_SettingItem(const TEUIModelWeakRef<FVM_SettingSubTitle> &inout InOwnerSubTitle, const TEUIModelWeakRef<FVMS_SettingPage> &inout InOwnerPage, const TDataObjectPtr<FSettingItemConfig> &inout InItemConfig, const FSettingComponentWidgetClass &inout InSettingComponentWidgetClass, const TEUIModelRef<FVM_PlayerKeyMappingPair> &inout InKeyMappingVM)
    {
        this.m_CurrentValue = 0.0f;
        this.m_ChangedValue = 0.0f;
        this.m_PreviousValue = 0.0f;
        this.m_bRefreshComponentWidget = false;
        this.m_bHasResolutionOptionChanged = false;
        this.m_bNeedCheckGraphicsQualityPreset = true;
        this.m_bShowWarningMessage = false;
        this.m_bIsHovered = false;
        this.m_bIsEnabled = true;
        this.m_bNeedApply = false;
        this.m_bIsDisplayOrGraphics = false;
        this.m_SwitchIndex = 0;
        this.m_ComponentWidgetOpacity = 1.0f;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetOwnerSubTitle(InOwnerSubTitle);
        this.SetOwnerPage(InOwnerPage);
        this.SetItemConfig(InItemConfig);
        this.SetSettingComponentWidgetClass(InSettingComponentWidgetClass);
        this.SetKeyMappingVM(InKeyMappingVM);
        return;
    }
    FVM_SettingItem opAssign(const FVM_SettingItem &inout Other)
    {
        FVM_SettingItem __r;
        this.m_ItemName = Other.m_ItemName;
        this.m_ItemDesc = Other.m_ItemDesc;
        this.m_ItemTag = Other.m_ItemTag;
        this.m_ComponentWidgetData = Other.m_ComponentWidgetData;
        this.m_OwnerSubTitle = Other.m_OwnerSubTitle;
        this.m_OwnerPage = Other.m_OwnerPage;
        this.m_ItemConfig = Other.m_ItemConfig;
        this.m_ApplyEffect = Other.m_ApplyEffect;
        this.m_KeyMappingVM = Other.m_KeyMappingVM;
        this.m_bRefreshComponentWidget = Other.m_bRefreshComponentWidget;
        this.m_bHasResolutionOptionChanged = Other.m_bHasResolutionOptionChanged;
        this.m_bNeedCheckGraphicsQualityPreset = Other.m_bNeedCheckGraphicsQualityPreset;
        this.m_CurrentValue = Other.m_CurrentValue;
        this.m_ChangedValue = Other.m_ChangedValue;
        this.m_PreviousValue = Other.m_PreviousValue;
        this.m_PreviousKey0 = Other.m_PreviousKey0;
        this.m_PreviousKey1 = Other.m_PreviousKey1;
        this.m_PreviousChordKey0 = Other.m_PreviousChordKey0;
        this.m_PreviousChordKey1 = Other.m_PreviousChordKey1;
        this.m_bShowWarningMessage = Other.m_bShowWarningMessage;
        this.m_bIsHovered = Other.m_bIsHovered;
        this.m_bIsEnabled = Other.m_bIsEnabled;
        this.m_bNeedApply = Other.m_bNeedApply;
        this.m_bIsDisplayOrGraphics = Other.m_bIsDisplayOrGraphics;
        this.m_SwitchIndex = int(Other.m_SwitchIndex);
        this.m_ToggleVM = Other.m_ToggleVM;
        this.m_DropdownVM = Other.m_DropdownVM;
        this.m_SliderVM = Other.m_SliderVM;
        this.m_LinkVM = Other.m_LinkVM;
        this.m_ComponentWidgetOpacity = Other.m_ComponentWidgetOpacity;
        return __r;
    }
    void PostConstruct()
    {
        this.InitData();
        this.CreateComponentWidget();
        TEUIModelWeakRef<FVMS_SettingPage> local_2 = this.GetOwnerPage();
        if (this.GetItemTag().IsDisplayOrGraphicsItem())
        {
        }
        return;
    }
    float32 GetDefaultValue()
    {
        float32 local_1;
        float32 local_2 = 0.0f;
        float32 local_3 = ::SettingUtils::GetDefaultValue(this.GetApplyEffect(), local_2);
        if (local_3 != 3.4028235e38f)
        {
            local_1 = local_3;
        }
        else
        {
            local_1 = local_2;
        }
        return local_1;
    }
    void UpdateSwitchIndex()
    {
        int local_10;
        if (!(this.GetOwnerPage().IsValid()))
        {
            return;
        }
        TEUIModelWeakRef<FVMS_SettingPage> local_2 = this.GetOwnerPage();
        if (!(GetbIsKeyMapping()))
        {
            int local_4 = this.GetbIsHovered() ? 1 : 0;
            this.SetSwitchIndex(local_4);
            return;
        }
        TEUIModelRef<FVM_PlayerKeyMappingPair> local_8 = this.GetKeyMappingVM();
        bool local_3 = this.GetPreviousKey0().DifferentFromPreviousKey(this.GetPreviousChordKey0(), this.GetPreviousKey1(), this.GetPreviousChordKey1());
        if (this.GetbIsHovered())
        {
            local_10 = (local_3 ? 3 : 1);
        }
        else
        {
            int local_5 = local_3 ? 2 : 0;
            local_10 = local_5;
        }
        this.SetSwitchIndex(local_10);
        return;
    }
    void OnComponentHovered()
    {
        TEUIModelWeakRef<FVMS_SettingPage> local_2 = this.GetOwnerPage();
        this.GetItemConfig().RefreshSelectedItem(this.GetbShowWarningMessage());
        this.SetbIsHovered(true);
        return;
    }
    void OnComponentUnhovered()
    {
        this.SetbIsHovered(false);
        return;
    }
    void UpdateCurrentValue(const float32 Value)
    {
        this.SetCurrentValue(Value);
        return;
    }
    void SyncPreviousValue()
    {
        this.SetPreviousValue(this.GetCurrentValue());
        TEUIModelRef<FVM_PlayerKeyMappingPair> local_2 = this.GetKeyMappingVM();
        if (GetbIsKeyMapping())
        {
            TEUIModelRef<FVM_PlayerKeyMapping> local_6;
            TEUIModelRef<FVM_PlayerKeyMappingPair> local_2_2 = this.GetKeyMappingVM();
            local_6.GetMapping0();
            if (local_6.IsValid())
            {
                TEUIModelRef<FVM_PlayerKeyMappingPair> local_2_3 = this.GetKeyMappingVM();
                local_6.GetMapping0();
                this.SetPreviousKey0(GetCurrentKey());
                TEUIModelRef<FVM_PlayerKeyMappingPair> local_2_4 = this.GetKeyMappingVM();
                local_6.GetMapping0();
                this.SetPreviousChordKey0(GetChordKey());
            }
            TEUIModelRef<FVM_PlayerKeyMappingPair> local_2_5 = this.GetKeyMappingVM();
            local_6.GetMapping1();
            if (local_6.IsValid())
            {
                TEUIModelRef<FVM_PlayerKeyMappingPair> local_2_6 = this.GetKeyMappingVM();
                local_6.GetMapping1();
                this.SetPreviousKey1(GetCurrentKey());
                TEUIModelRef<FVM_PlayerKeyMappingPair> local_2_7 = this.GetKeyMappingVM();
                local_6.GetMapping1();
                this.SetPreviousChordKey1(GetChordKey());
            }
        }
        return;
    }
    void ApplyChangedValue()
    {
        this.SetbHasResolutionOptionChanged(false);
        this.UpdateCurrentValue(this.GetChangedValue());
        ::SettingUtils::Apply(this.GetModify_ApplyEffect(), this.GetCurrentValue());
        return;
    }
    void InitializeApplyValue(const float32 Value, const bool bApply = false)
    {
        if (!(this.GetApplyEffect().IsValid()))
        {
            return;
        }
        this.UpdateCurrentValue(Value);
        this.SetChangedValue(Value);
        this.UpdateComponentValue(Value, false);
        this.SetbHasResolutionOptionChanged(false);
        if (bApply)
        {
            ::SettingUtils::Apply(this.GetModify_ApplyEffect(), Value);
        }
        return;
    }
    void ApplyDisplayAndGraphicOptions()
    {
        this.SetbNeedApply(true);
        return;
    }
    void ResetValueDisplay()
    {
        bool local_2 = false;
        this.UpdateCurrentValue(this.GetDefaultValue());
        this.SetChangedValue(this.GetCurrentValue());
        UScriptStruct local_6;
        local_2 = this.GetItemConfig() && local_2 && (local_6 != nullptr);
        if (local_2)
        {
            this.UpdateComponentValue(this.GetCurrentValue(), false);
        }
        this.SetbHasResolutionOptionChanged(false);
        this.SyncPreviousValue();
        return;
    }
    void RevertValue()
    {
        bool local_3;
        TEUIModelRef<FVM_PlayerKeyMappingPair> local_2 = this.GetKeyMappingVM();
        local_3 = GetbIsKeyMapping();
        if (local_3)
        {
            TEUIModelRef<FVM_PlayerKeyMapping> local_6;
            TEUIModelRef<FVM_PlayerKeyMappingPair> local_2_2 = this.GetKeyMappingVM();
            local_6.GetMapping0();
            if (local_6.IsValid())
            {
                TEUIModelRef<FVM_PlayerKeyMappingPair> local_2_3 = this.GetKeyMappingVM();
                local_6.GetMapping0();
                this.GetPreviousKey0().SetCurrentKey();
                local_3 = false;
                TEUIModelRef<FVM_PlayerKeyMappingPair> local_2_4 = this.GetKeyMappingVM();
                local_6.GetMapping0();
                local_3.SetbHasChanged();
                TEUIModelRef<FVM_PlayerKeyMappingPair> local_2_5 = this.GetKeyMappingVM();
                local_6.GetMapping0();
                this.GetPreviousChordKey0().SetChordKey();
            }
            TEUIModelRef<FVM_PlayerKeyMappingPair> local_2_6 = this.GetKeyMappingVM();
            local_6.GetMapping1();
            if (local_6.IsValid())
            {
                TEUIModelRef<FVM_PlayerKeyMappingPair> local_2_7 = this.GetKeyMappingVM();
                local_6.GetMapping1();
                this.GetPreviousKey1().SetCurrentKey();
                TEUIModelRef<FVM_PlayerKeyMappingPair> local_2_8 = this.GetKeyMappingVM();
                local_6.GetMapping1();
                this.GetPreviousChordKey1().SetChordKey();
                local_3 = false;
                TEUIModelRef<FVM_PlayerKeyMappingPair> local_2_9 = this.GetKeyMappingVM();
                local_6.GetMapping1();
                local_3.SetbHasChanged();
            }
            local_3 = false;
            TEUIModelRef<FVM_PlayerKeyMappingPair> local_2_10 = this.GetKeyMappingVM();
            local_3.SetbHasChanged();
            return;
        }
        if (!(unresolved.VisualConfig.IsValid()))
        {
            local_3 = false;
        }
        else
        {
            local_3 = (this.GetPreviousValue() != this.GetCurrentValue());
        }
        if (local_3)
        {
            this.UpdateCurrentValue(this.GetPreviousValue());
            this.UpdateComponentValue(this.GetCurrentValue(), true);
            this.SetbHasResolutionOptionChanged(false);
        }
        return;
    }
    void ResetValue()
    {
        this.UpdateCurrentValue(this.GetDefaultValue());
        this.UpdateComponentValue(this.GetCurrentValue(), true);
        this.SetbHasResolutionOptionChanged(false);
        this.SyncPreviousValue();
        return;
    }
    void RefreshKeyMappingDisplay()
    {
        this.SyncPreviousValue();
        this.UpdateSwitchIndex();
        return;
    }
    bool CanBeNavigationItem()
    {
        bool local_8;
        if (this.GetKeyMappingVM().IsValid() && (this.GetKeyMappingVM().opArrow().GetbIsKeyMapping() || this.GetKeyMappingVM().opArrow().GetbIsGamepadSelector()))
        {
            local_8 = this.GetKeyMappingVM().opArrow().GetMapping0().IsValid();
            local_8 = (local_8 && this.GetKeyMappingVM().opArrow().GetMapping0().opArrow().GetbConfigurable()) || (this.GetKeyMappingVM().opArrow().GetMapping1().IsValid() && this.GetKeyMappingVM().opArrow().GetMapping1().opArrow().GetbConfigurable());
            return local_8;
        }
        return true;
    }
    void UpdateDropDownOptions(const TEUIModelRef<FVM_SettingItem> &inout ItemVM, const int DefaultIndex = -1)
    {
        FText local_18;
        int local_4 = uint(int(GetCurrentValue()));
        TEUIModelWeakRef<FVM_CommonComponentDropDown> local_2;
        local_2.GetDropdownVM();
        if (GetOptionTexts().IsValidIndex(local_4))
        {
            int local_4_2 = uint(int(GetCurrentValue()));
            local_2.GetDropdownVM();
            local_18 = GetOptionTexts()[local_4_2];
        }
        else
        {
            local_18 = FText::FromString(FString());
        }
        bool local_23 = true;
        TArray<FSettingOption> local_28;
        ::SettingUtils::BuildOptions(GetApplyEffect(), local_28);
        TArray<FText> local_32;
        for (auto& local_46 : local_28)
        {
            local_32.Add(local_46.Name);
            if ((local_46.Name == local_18))
            {
                local_23 = false;
            }
        }
        local_2.GetDropdownVM();
        local_32.SetOptionTexts();
        TArray<int> local_50;
        local_2.GetDropdownVM();
        local_50.UpdateOptionDisabledIndices();
        if (local_28.IsEmpty())
        {
            return;
        }
        if (local_23 || local_50.Contains(uint(int(GetCurrentValue()))) || (int(GetCurrentValue()) == local_32.Num()))
        {
            TEUIModelWeakRef<FVMS_SettingPage> local_54 = this.GetOwnerPage();
            float32 local_52 = ::SettingUtils::GetCurrentValue(GetApplyEffect(), GetItemTag().IsDisplayOrGraphicsItem());
            if (DefaultIndex != -1)
            {
                local_52 = DefaultIndex;
            }
            local_52.UpdateComponentValue(false);
            local_52.UpdateCurrentValue();
            local_52.SetChangedValue();
            SyncPreviousValue();
            false.SetbHasResolutionOptionChanged();
        }
        return;
    }
    void UpdateFrameGenerationDropDownOptions(const TEUIModelRef<FVM_SettingItem> &inout ItemVM)
    {
        TArray<int> local_4;
        local_4.Add(FSettingApply_FrameGeneration::FrameGenerationIndexMap[EKLFrameGenerationMode(1)]);
        TArray<EKLFrameGenerationMode> local_12 = UKLGameUserSettings::Get().GetSupportedFrameGenerationModes();
        if (int(UKLGameUserSettings::Get().GetAAMethod()) == 1)
        {
            if (!(local_12.Contains(EKLFrameGenerationMode(2))))
            {
                local_4.Add(FSettingApply_FrameGeneration::FrameGenerationIndexMap[EKLFrameGenerationMode(2)]);
            }
            if (!(local_12.Contains(EKLFrameGenerationMode(4))))
            {
                local_4.Add(FSettingApply_FrameGeneration::FrameGenerationIndexMap[EKLFrameGenerationMode(4)]);
            }
        }
        else
        {
            local_4.Add(FSettingApply_FrameGeneration::FrameGenerationIndexMap[EKLFrameGenerationMode(2)]);
            local_4.Add(FSettingApply_FrameGeneration::FrameGenerationIndexMap[EKLFrameGenerationMode(4)]);
        }
        TEUIModelWeakRef<FVM_CommonComponentDropDown> local_22;
        local_22.GetDropdownVM();
        local_4.UpdateOptionDisabledIndices();
        if (local_4.Contains(uint(GetCurrentValue())))
        {
            FSettingApply_FrameGeneration::FrameGenerationIndexMap[EKLFrameGenerationMode(0)].UpdateComponentValue(true);
        }
        return;
    }
    void OnShowWarningMessageChanged()
    {
        float32 local_2;
        if (this.GetbShowWarningMessage())
        {
            local_2 = 0.5f;
        }
        else
        {
            local_2 = 1.0f;
        }
        this.SetComponentWidgetOpacity(local_2);
        return;
    }
    void FrameGenerationCheck()
    {
        if (this.GetItemTag().MatchesTag(FGameplayTag::RequestGameplayTag(n"Setting.Display.Display.UpscalingMethod", true)))
        {
            FGameplayTag local_4 = FGameplayTag::RequestGameplayTag(n"Setting.Display.Display.FrameGeneration", true);
            TEUIModelWeakRef<FVMS_SettingPage> local_8 = this.GetOwnerPage();
            if (GetItems().Contains(local_4))
            {
                TEUIModelWeakRef<FVMS_SettingPage> local_8_2 = this.GetOwnerPage();
                this.UpdateFrameGenerationDropDownOptions(GetItems()[local_4]);
            }
        }
        return;
    }
    void GraphicsQualityPresetCheck(const float32 Value)
    {
        TEUIModelWeakRef<FVM_CommonComponentToggle> local_30;
        if (!(this.GetbNeedCheckGraphicsQualityPreset()))
        {
            this.SetbNeedCheckGraphicsQualityPreset(true);
            return;
        }
        if (this.GetItemTag().MatchesTag(FGameplayTag::RequestGameplayTag(n"Setting.Graphics.GraphicsQuality.GraphicsQualityPreset", true)))
        {
            FInstancedStruct::GetMutablePtr(this.GetModify_ApplyEffect()).opCall().opArrow().bIsRecommended = (Value == 4.0f);
            if (Value == 5.0f)
            {
                return;
            }
            TEUIModelWeakRef<FVM_SettingSubTitle> local_14 = this.GetOwnerSubTitle();
            for (auto& local_28 : GetItems())
            {
                local_28;
                local_30.GetToggleVM();
                if (local_30.IsValid() && (GetChangedValue() != Value))
                {
                    bool local_31 = false;
                    local_31.SetbNeedCheckGraphicsQualityPreset();
                    (::SettingUtils::GetPresetValue(GetApplyEffect(), Value)).InitializeApplyValue(true);
                }
            }
        }
        return;
    }
    void OnItemSelectedOrValueChanged(const float32 Value)
    {
        int local_1 = 0;
        this.SetChangedValue(Value);
        int local_2 = local_1;
        if (local_2 == 0)
        {
            this.GraphicsQualityPresetCheck(Value);
            this.ApplyChangedValue();
            TEUIModelWeakRef<FVMS_SettingPage> local_6 = this.GetOwnerPage();
            if (this.GetItemTag().IsDisplayOrGraphicsItem())
            {
                this.ApplyDisplayAndGraphicOptions();
            }
            this.FrameGenerationCheck();
            return;
        }
        this.SetbHasResolutionOptionChanged(true);
        return;
    }
    void InitData()
    {
        FGameplayTag local_2;
        local_2;
        this.SetItemTag(local_2);
        TEUIModelRef<FVM_PlayerKeyMappingPair> local_4 = this.GetKeyMappingVM();
        if (GetbIsKeyMapping())
        {
            return;
        }
        this.UpdateCurrentValue(this.GetDefaultValue());
        this.SetChangedValue(this.GetCurrentValue());
        return;
    }
    void UpdateComponentValue(const float32 Value, const bool bBroadcast = true)
    {
        UScriptStruct local_4;
        if (Value == 3.4028235e38f)
        {
            return;
        }
        if (local_4.IsChildOf(FSettingDropDown) && this.GetDropdownVM().IsValid())
        {
            int local_10 = uint(Value);
            TEUIModelWeakRef<FVM_CommonComponentDropDown> local_8 = this.GetDropdownVM();
            local_10.SelectByIndex(bBroadcast);
            return;
        }
        if (local_4.IsChildOf(FSettingSlider) && this.GetSliderVM().IsValid())
        {
            TEUIModelWeakRef<FVM_CommonComponentSlider> local_12 = this.GetSliderVM();
            Value.SetValue(bBroadcast);
            return;
        }
        if (local_4.IsChildOf(FSettingLink) && this.GetLinkVM().IsValid())
        {
            return;
        }
        if (local_4.IsChildOf(FSettingToggle) && this.GetToggleVM().IsValid())
        {
            int local_10_2 = uint(Value);
            TEUIModelWeakRef<FVM_CommonComponentToggle> local_16 = this.GetToggleVM();
            local_10_2.ChangeCurrentSelectedIndex(bBroadcast);
        }
        return;
    }
    void CreateComponentWidget()
    {
        FEUIDynamicWidgetData local_24;
        bool local_31 = false;
        TEUIModelRef<FVM_PlayerKeyMapping> local_50;
        UScriptStruct local_52;
        TEUIModelRef<FVM_PlayerKeyMappingPair> local_26 = this.GetKeyMappingVM();
        if (GetbIsKeyMapping())
        {
            FEUIModelRef local_48;
            TEUIModelRef<FVM_PlayerKeyMapping> local_30;
            if (!(this.GetKeyMappingVM().IsValid()))
            {
                return;
            }
            TEUIModelRef<FVM_PlayerKeyMappingPair> local_26_2 = this.GetKeyMappingVM();
            local_30.GetMapping0();
            bool local_27 = local_30.IsValid();
            if (!(local_27))
            {
                local_27 = false;
            }
            else
            {
                TEUIModelRef<FVM_PlayerKeyMappingPair> local_26_3 = this.GetKeyMappingVM();
                local_30.GetMapping1();
                local_27 = local_30.IsValid();
            }
            if (local_27)
            {
                local_24.WidgetClass = this.GetSettingComponentWidgetClass().KeyboardWidgetClass;
                local_24.ModelContainer = FEUIModelContainer();
                TEUIModelRef<FVM_PlayerKeyMappingPair> local_26_4 = this.GetKeyMappingVM();
                local_24.ModelContainer.AddModel(local_48, false);
                TEUIModelRef<FVM_PlayerKeyMappingPair> local_26_5 = this.GetKeyMappingVM();
                local_30.GetMapping0();
                local_31 = local_30.opArrow().GetbConfigurable();
                if (local_31)
                {
                    local_31 = true;
                }
                else
                {
                    TEUIModelRef<FVM_PlayerKeyMappingPair> local_26_6 = this.GetKeyMappingVM();
                    local_50.GetMapping1();
                    local_31 = local_50.opArrow().GetbConfigurable();
                }
                local_31 = !local_31;
                this.SetbShowWarningMessage(local_31);
            }
            else
            {
                TEUIModelRef<FVM_PlayerKeyMappingPair> local_26_7 = this.GetKeyMappingVM();
                local_30.GetMapping0();
                local_31 = local_30.IsValid();
                if (local_31)
                {
                    local_24.WidgetClass = this.GetSettingComponentWidgetClass().GamepadWidgetClass;
                    local_24.ModelContainer = FEUIModelContainer();
                    TEUIModelRef<FVM_PlayerKeyMappingPair> local_26_8 = this.GetKeyMappingVM();
                    local_24.ModelContainer.AddModel(local_48, false);
                    TEUIModelRef<FVM_PlayerKeyMappingPair> local_26_9 = this.GetKeyMappingVM();
                    local_30.GetMapping0();
                    local_31 = !(local_30.opArrow().GetbConfigurable());
                    this.SetbShowWarningMessage(local_31);
                    TEUIModelRef<FVM_PlayerKeyMappingPair> local_26_10 = this.GetKeyMappingVM();
                    local_50.GetMapping0();
                    this.SetPreviousKey0(GetCurrentKey());
                    TEUIModelRef<FVM_PlayerKeyMappingPair> local_26_11 = this.GetKeyMappingVM();
                    local_30.GetMapping0();
                    this.SetPreviousChordKey0(GetChordKey());
                }
            }
            this.SyncPreviousValue();
        }
        else
        {
            FEUIModelRef local_48;
            local_31 = !local_31;
            if (local_31)
            {
                return;
            }
            if (local_52.IsChildOf(FSettingDropDown))
            {
                local_24.WidgetClass = this.GetSettingComponentWidgetClass().DropDownWidgetClass;
                local_24.ModelContainer = FEUIModelContainer();
                TArray<FSettingOption> local_64;
                ::SettingUtils::BuildOptions(this.GetApplyEffect(), local_64);
                TArray<FText> local_68;
                for (auto& local_82 : local_64)
                {
                    local_68.Add(local_82.Name);
                }
                FOnCommonComponentDropDownSelected local_106;
                local_106.Add(this, FVM_SettingItem::OnItemSelectedOrValueChanged);
                this.SetDropdownVM(TEUIModelWeakRef<FVM_CommonComponentDropDown>(::FVM_CommonComponentDropDown::Create(this.GetContext().Manager, local_68, uint(this.GetCurrentValue()), local_106)));
                TArray<int> local_114;
                int local_115 = 0;
                for (; local_115 < local_64.Num(); ++local_115)
                {
                    if (local_64[local_115].IsDisabled)
                    {
                        local_114.Add(local_115);
                    }
                }
                TEUIModelWeakRef<FVM_CommonComponentDropDown> local_110 = this.GetDropdownVM();
                local_114.UpdateOptionDisabledIndices();
                TEUIModelWeakRef<FVM_CommonComponentDropDown> local_110_2 = this.GetDropdownVM();
                local_24.ModelContainer.AddModel(local_48, false);
            }
            else
            {
                if (local_52.IsChildOf(FSettingSlider))
                {
                    FSettingSlider local_118;
                    local_24.WidgetClass = this.GetSettingComponentWidgetClass().SliderWidgetClass;
                    local_24.ModelContainer = FEUIModelContainer();
                    FVM_CommonComponentSliderConfig local_130;
                    local_130.MinValue = local_118.MinValue;
                    local_130.MaxValue = local_118._base_FSettingItemBase;
                    local_130.Step = local_118.Step;
                    local_130.DefaultValue = this.GetDefaultValue();
                    local_130.CurrentValue = this.GetCurrentValue();
                    local_130.MidValue = local_118.MidValue;
                    local_130.Precision = this.GetDecimalPlaces(local_118.Step);
                    FOnCommonComponentSliderSelected local_152;
                    local_152.Add(this, FVM_SettingItem::OnItemSelectedOrValueChanged);
                    this.SetSliderVM(TEUIModelWeakRef<FVM_CommonComponentSlider>(::FVM_CommonComponentSlider::Create(this.GetContext().Manager, local_130, local_152)));
                    TEUIModelWeakRef<FVM_CommonComponentSlider> local_154 = this.GetSliderVM();
                    local_24.ModelContainer.AddModel(local_48, false);
                }
                else
                {
                    if (local_52.IsChildOf(FSettingLink))
                    {
                        local_24.WidgetClass = this.GetSettingComponentWidgetClass().LinkWidgetClass;
                        local_24.ModelContainer = FEUIModelContainer();
                        FGameplayTag local_168;
                        local_168;
                        FOnCommonComponentFilterSelected local_190;
                        FVM_CommonComponentFilterConfig local_166;
                        this.SetLinkVM(TEUIModelWeakRef<FVM_CommonComponentFilter>(::FVM_CommonComponentFilter::Create(this.GetContext().Manager, local_166, local_190)));
                        TEUIModelWeakRef<FVM_CommonComponentFilter> local_192 = this.GetLinkVM();
                        local_24.ModelContainer.AddModel(local_48, false);
                    }
                    else
                    {
                        if (local_52.IsChildOf(FSettingToggle))
                        {
                            local_24.WidgetClass = this.GetSettingComponentWidgetClass().ToggleWidgetClass;
                            local_24.ModelContainer = FEUIModelContainer();
                            TArray<FSettingOption> local_64;
                            ::SettingUtils::BuildOptions(this.GetApplyEffect(), local_64);
                            TArray<FText> local_68;
                            for (auto& local_82 : local_64)
                            {
                                local_68.Add(local_82.Name);
                            }
                            FOnCommonComponentToggleSelected local_220;
                            local_220.Add(this, FVM_SettingItem::OnItemSelectedOrValueChanged);
                            this.SetToggleVM(TEUIModelWeakRef<FVM_CommonComponentToggle>(::FVM_CommonComponentToggle::Create(this.GetContext().Manager, local_68, uint(this.GetCurrentValue()), local_220)));
                            TEUIModelWeakRef<FVMS_SettingPage> local_224 = this.GetOwnerPage();
                            this.SetbShowWarningMessage(GetbShowWarningMessage());
                            TEUIModelWeakRef<FVM_CommonComponentToggle> local_222 = this.GetToggleVM();
                            local_24.ModelContainer.AddModel(local_48, false);
                        }
                    }
                }
            }
        }
        this.SetComponentWidgetData(local_24);
        this.SetbRefreshComponentWidget(!(this.GetbRefreshComponentWidget()));
        this.SyncPreviousValue();
        return;
    }
    int GetDecimalPlaces(const float32 Value)
    {
        int local_1 = 0;
        float32 local_4 = Value - FMath::FloorToInt(Value);
        while (FMath::Abs(local_4) > 0.0001f && (local_1 < 7))
        {
            local_4 = local_4 * 10.0f;
            local_4 = local_4 - FMath::FloorToInt(local_4);
            ++local_1;
        }
        return local_1;
    }
    FText GetItemName() const property
    {
        FText __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    FText GetModify_ItemName() property
    {
        FText __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetItemName(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_ItemName = __Value;
        return;
    }
    const FText GetItemDesc() const property
    {
        const FText __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    FText GetModify_ItemDesc() property
    {
        FText __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetItemDesc(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_ItemDesc = __Value;
        return;
    }
    const FGameplayTag GetItemTag() const property
    {
        const FGameplayTag __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    FGameplayTag GetModify_ItemTag() property
    {
        FGameplayTag __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetItemTag(const FGameplayTag &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_ItemTag = __Value;
        return;
    }
    const FEUIDynamicWidgetData GetComponentWidgetData() const property
    {
        const FEUIDynamicWidgetData __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    FEUIDynamicWidgetData GetModify_ComponentWidgetData() property
    {
        FEUIDynamicWidgetData __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetComponentWidgetData(const FEUIDynamicWidgetData &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_ComponentWidgetData = __Value;
        return;
    }
    TEUIModelWeakRef<FVM_SettingSubTitle> GetOwnerSubTitle() const property
    {
        this.TrackPropertyRead(4);
        return this.m_OwnerSubTitle;
    }
    void SetOwnerSubTitle(const TEUIModelWeakRef<FVM_SettingSubTitle> &inout __Value) property
    {
        TEUIModelWeakRef<FVM_SettingSubTitle> local_2;
        local_2 = this.m_OwnerSubTitle;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_OwnerSubTitle = __Value;
        return;
    }
    TEUIModelWeakRef<FVMS_SettingPage> GetOwnerPage() const property
    {
        this.TrackPropertyRead(5);
        return this.m_OwnerPage;
    }
    void SetOwnerPage(const TEUIModelWeakRef<FVMS_SettingPage> &inout __Value) property
    {
        TEUIModelWeakRef<FVMS_SettingPage> local_2;
        local_2 = this.m_OwnerPage;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_OwnerPage = __Value;
        return;
    }
    TDataObjectPtr<FSettingItemConfig> GetItemConfig() const property
    {
        TDataObjectPtr<FSettingItemConfig> __r;
        this.TrackPropertyRead(6);
        return __r;
    }
    TDataObjectPtr<FSettingItemConfig> GetModify_ItemConfig() property
    {
        TDataObjectPtr<FSettingItemConfig> __r;
        this.MarkPropertyDirty(6);
        return __r;
    }
    void SetItemConfig(const TDataObjectPtr<FSettingItemConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_ItemConfig = __Value;
        return;
    }
    const FInstancedStruct GetApplyEffect() const property
    {
        const FInstancedStruct __r;
        this.TrackPropertyRead(7);
        return __r;
    }
    FInstancedStruct GetModify_ApplyEffect() property
    {
        FInstancedStruct __r;
        this.MarkPropertyDirty(7);
        return __r;
    }
    void SetApplyEffect(const FInstancedStruct &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(7);
        this.m_ApplyEffect = __Value;
        return;
    }
    const FSettingComponentWidgetClass GetSettingComponentWidgetClass() const property
    {
        const FSettingComponentWidgetClass __r;
        this.TrackPropertyRead(8);
        return __r;
    }
    FSettingComponentWidgetClass GetModify_SettingComponentWidgetClass() property
    {
        FSettingComponentWidgetClass __r;
        this.MarkPropertyDirty(8);
        return __r;
    }
    void SetSettingComponentWidgetClass(const FSettingComponentWidgetClass &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(8);
        return;
    }
    TEUIModelRef<FVM_PlayerKeyMappingPair> GetKeyMappingVM() const property
    {
        this.TrackPropertyRead(9);
        return this.m_KeyMappingVM;
    }
    void SetKeyMappingVM(const TEUIModelRef<FVM_PlayerKeyMappingPair> &inout __Value) property
    {
        TEUIModelRef<FVM_PlayerKeyMappingPair> local_2;
        local_2 = this.m_KeyMappingVM;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(9);
        this.m_KeyMappingVM = __Value;
        return;
    }
    bool GetbRefreshComponentWidget() const property
    {
        this.TrackPropertyRead(10);
        return this.m_bRefreshComponentWidget;
    }
    void SetbRefreshComponentWidget(const bool __Value) property
    {
        if (!(this.m_bRefreshComponentWidget) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(10);
        this.m_bRefreshComponentWidget = __Value;
        return;
    }
    bool GetbHasResolutionOptionChanged() const property
    {
        this.TrackPropertyRead(11);
        return this.m_bHasResolutionOptionChanged;
    }
    void SetbHasResolutionOptionChanged(const bool __Value) property
    {
        if (!(this.m_bHasResolutionOptionChanged) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(11);
        this.m_bHasResolutionOptionChanged = __Value;
        return;
    }
    bool GetbNeedCheckGraphicsQualityPreset() const property
    {
        this.TrackPropertyRead(12);
        return this.m_bNeedCheckGraphicsQualityPreset;
    }
    void SetbNeedCheckGraphicsQualityPreset(const bool __Value) property
    {
        if (!(this.m_bNeedCheckGraphicsQualityPreset) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(12);
        this.m_bNeedCheckGraphicsQualityPreset = __Value;
        return;
    }
    float32 GetCurrentValue() const property
    {
        float32 __r;
        this.TrackPropertyRead(13);
        return __r;
    }
    float32 GetModify_CurrentValue() property
    {
        float32 __r;
        this.MarkPropertyDirty(13);
        return __r;
    }
    void SetCurrentValue(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(13);
        this.m_CurrentValue = __Value;
        return;
    }
    const float32 GetChangedValue() const property
    {
        const float32 __r;
        this.TrackPropertyRead(14);
        return __r;
    }
    float32 GetModify_ChangedValue() property
    {
        float32 __r;
        this.MarkPropertyDirty(14);
        return __r;
    }
    void SetChangedValue(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(14);
        this.m_ChangedValue = __Value;
        return;
    }
    const float32 GetPreviousValue() const property
    {
        const float32 __r;
        this.TrackPropertyRead(15);
        return __r;
    }
    float32 GetModify_PreviousValue() property
    {
        float32 __r;
        this.MarkPropertyDirty(15);
        return __r;
    }
    void SetPreviousValue(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(15);
        this.m_PreviousValue = __Value;
        return;
    }
    const FKey GetPreviousKey0() const property
    {
        const FKey __r;
        this.TrackPropertyRead(16);
        return __r;
    }
    FKey GetModify_PreviousKey0() property
    {
        FKey __r;
        this.MarkPropertyDirty(16);
        return __r;
    }
    void SetPreviousKey0(const FKey &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(16);
        this.m_PreviousKey0 = __Value;
        return;
    }
    const FKey GetPreviousKey1() const property
    {
        const FKey __r;
        this.TrackPropertyRead(17);
        return __r;
    }
    FKey GetModify_PreviousKey1() property
    {
        FKey __r;
        this.MarkPropertyDirty(17);
        return __r;
    }
    void SetPreviousKey1(const FKey &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(17);
        this.m_PreviousKey1 = __Value;
        return;
    }
    const FKey GetPreviousChordKey0() const property
    {
        const FKey __r;
        this.TrackPropertyRead(18);
        return __r;
    }
    FKey GetModify_PreviousChordKey0() property
    {
        FKey __r;
        this.MarkPropertyDirty(18);
        return __r;
    }
    void SetPreviousChordKey0(const FKey &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(18);
        this.m_PreviousChordKey0 = __Value;
        return;
    }
    const FKey GetPreviousChordKey1() const property
    {
        const FKey __r;
        this.TrackPropertyRead(19);
        return __r;
    }
    FKey GetModify_PreviousChordKey1() property
    {
        FKey __r;
        this.MarkPropertyDirty(19);
        return __r;
    }
    void SetPreviousChordKey1(const FKey &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(19);
        this.m_PreviousChordKey1 = __Value;
        return;
    }
    bool GetbShowWarningMessage() const property
    {
        this.TrackPropertyRead(20);
        return this.m_bShowWarningMessage;
    }
    void SetbShowWarningMessage(const bool __Value) property
    {
        if (!(this.m_bShowWarningMessage) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(20);
        this.m_bShowWarningMessage = __Value;
        return;
    }
    bool GetbIsHovered() const property
    {
        this.TrackPropertyRead(21);
        return this.m_bIsHovered;
    }
    void SetbIsHovered(const bool __Value) property
    {
        if (!(this.m_bIsHovered) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(21);
        this.m_bIsHovered = __Value;
        return;
    }
    bool GetbIsEnabled() const property
    {
        this.TrackPropertyRead(22);
        return this.m_bIsEnabled;
    }
    void SetbIsEnabled(const bool __Value) property
    {
        if (!(this.m_bIsEnabled) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(22);
        this.m_bIsEnabled = __Value;
        return;
    }
    bool GetbNeedApply() const property
    {
        this.TrackPropertyRead(23);
        return this.m_bNeedApply;
    }
    void SetbNeedApply(const bool __Value) property
    {
        if (!(this.m_bNeedApply) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(23);
        this.m_bNeedApply = __Value;
        return;
    }
    bool GetbIsDisplayOrGraphics() const property
    {
        this.TrackPropertyRead(24);
        return this.m_bIsDisplayOrGraphics;
    }
    void SetbIsDisplayOrGraphics(const bool __Value) property
    {
        if (!(this.m_bIsDisplayOrGraphics) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(24);
        this.m_bIsDisplayOrGraphics = __Value;
        return;
    }
    int GetSwitchIndex() const property
    {
        this.TrackPropertyRead(25);
        return this.m_SwitchIndex;
    }
    void SetSwitchIndex(const int __Value) property
    {
        if (this.m_SwitchIndex == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(25);
        this.m_SwitchIndex = __Value;
        return;
    }
    TEUIModelWeakRef<FVM_CommonComponentToggle> GetToggleVM() const property
    {
        this.TrackPropertyRead(26);
        return this.m_ToggleVM;
    }
    void SetToggleVM(const TEUIModelWeakRef<FVM_CommonComponentToggle> &inout __Value) property
    {
        TEUIModelWeakRef<FVM_CommonComponentToggle> local_2;
        local_2 = this.m_ToggleVM;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(26);
        this.m_ToggleVM = __Value;
        return;
    }
    TEUIModelWeakRef<FVM_CommonComponentDropDown> GetDropdownVM() const property
    {
        this.TrackPropertyRead(27);
        return this.m_DropdownVM;
    }
    void SetDropdownVM(const TEUIModelWeakRef<FVM_CommonComponentDropDown> &inout __Value) property
    {
        TEUIModelWeakRef<FVM_CommonComponentDropDown> local_2;
        local_2 = this.m_DropdownVM;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(27);
        this.m_DropdownVM = __Value;
        return;
    }
    TEUIModelWeakRef<FVM_CommonComponentSlider> GetSliderVM() const property
    {
        this.TrackPropertyRead(28);
        return this.m_SliderVM;
    }
    void SetSliderVM(const TEUIModelWeakRef<FVM_CommonComponentSlider> &inout __Value) property
    {
        TEUIModelWeakRef<FVM_CommonComponentSlider> local_2;
        local_2 = this.m_SliderVM;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(28);
        this.m_SliderVM = __Value;
        return;
    }
    TEUIModelWeakRef<FVM_CommonComponentFilter> GetLinkVM() const property
    {
        this.TrackPropertyRead(29);
        return this.m_LinkVM;
    }
    void SetLinkVM(const TEUIModelWeakRef<FVM_CommonComponentFilter> &inout __Value) property
    {
        TEUIModelWeakRef<FVM_CommonComponentFilter> local_2;
        local_2 = this.m_LinkVM;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(29);
        this.m_LinkVM = __Value;
        return;
    }
    const float32 GetComponentWidgetOpacity() const property
    {
        const float32 __r;
        this.TrackPropertyRead(30);
        return __r;
    }
    float32 GetModify_ComponentWidgetOpacity() property
    {
        float32 __r;
        this.MarkPropertyDirty(30);
        return __r;
    }
    void SetComponentWidgetOpacity(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(30);
        this.m_ComponentWidgetOpacity = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_SettingItem
{
    UPROPERTY()
    TEUIModelRef<FVM_SettingItem> Self;

    __GeneratedProperties_FVM_SettingItem()
    {
        return;
    }
}

namespace FVM_SettingItem
{
FVM_SettingItem& Create(const UObject ContextObject, const TEUIModelWeakRef<FVM_SettingSubTitle> &inout OwnerSubTitle, const TEUIModelWeakRef<FVMS_SettingPage> &inout OwnerPage, const TDataObjectPtr<FSettingItemConfig> &inout ItemConfig, const FSettingComponentWidgetClass &inout SettingComponentWidgetClass, const TEUIModelRef<FVM_PlayerKeyMappingPair> &inout KeyMappingVM)
{
    return FVM_SettingItem::CreateByManager(EUIInternal::GetContextManager(ContextObject), OwnerSubTitle, OwnerPage, ItemConfig, SettingComponentWidgetClass, KeyMappingVM);
}
FVM_SettingItem CreateByManager(const UEUIManagerSubsystem Manager, const TEUIModelWeakRef<FVM_SettingSubTitle> &inout OwnerSubTitle, const TEUIModelWeakRef<FVMS_SettingPage> &inout OwnerPage, const TDataObjectPtr<FSettingItemConfig> &inout ItemConfig, const FSettingComponentWidgetClass &inout SettingComponentWidgetClass, const TEUIModelRef<FVM_PlayerKeyMappingPair> &inout KeyMappingVM)
{
    FVM_SettingItem __r;
    TEUIModelRef<FVM_SettingItem> local_6 = TEUIModelRef<FVM_SettingItem>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_SettingItem::ModelId, 0, OwnerSubTitle, OwnerPage, ItemConfig, SettingComponentWidgetClass, KeyMappingVM));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    // body not fully recovered вЂ” stub [opcode-uncovered]
}
UScriptStruct GetModelStruct()
{
    return FVM_SettingItem;
}
void __UpdateSwitchIndex(FVM_SettingItem &inout Model)
{
    Model.UpdateSwitchIndex();
    return;
}
void __OnShowWarningMessageChanged(FVM_SettingItem &inout Model)
{
    Model.OnShowWarningMessageChanged();
    return;
}
FText __UIGetter_ItemName(const FVM_SettingItem &inout Model)
{
    return Model.GetItemName();
}
FText __UIGetter_ItemDesc(const FVM_SettingItem &inout Model)
{
    return Model.GetItemDesc();
}
FGameplayTag __UIGetter_ItemTag(const FVM_SettingItem &inout Model)
{
    return Model.GetItemTag();
}
FEUIDynamicWidgetData __UIGetter_ComponentWidgetData(const FVM_SettingItem &inout Model)
{
    return Model.GetComponentWidgetData();
}
void __UISetter_ComponentWidgetData(FVM_SettingItem &inout Model, const FEUIDynamicWidgetData &inout Value)
{
    Model.SetComponentWidgetData(Value);
    return;
}
float32 __UIGetter_CurrentValue(const FVM_SettingItem &inout Model)
{
    return Model.GetCurrentValue();
}
bool __UIGetter_bIsEnabled(const FVM_SettingItem &inout Model)
{
    return Model.GetbIsEnabled();
}
bool __UIGetter_bNeedApply(const FVM_SettingItem &inout Model)
{
    return Model.GetbNeedApply();
}
bool __UIGetter_bIsDisplayOrGraphics(const FVM_SettingItem &inout Model)
{
    return Model.GetbIsDisplayOrGraphics();
}
int __UIGetter_SwitchIndex(const FVM_SettingItem &inout Model)
{
    return Model.GetSwitchIndex();
}
float32 __UIGetter_ComponentWidgetOpacity(const FVM_SettingItem &inout Model)
{
    return Model.GetComponentWidgetOpacity();
}
TEUIModelRef<FVM_SettingItem> __UIGetter_Self(const FVM_SettingItem &inout Model)
{
    return TEUIModelRef<FVM_SettingItem>(Model);
}
int __IndexOf_ItemName()
{
    return 0;
}
int __IndexOf_ItemDesc()
{
    return 1;
}
int __IndexOf_ItemTag()
{
    return 2;
}
int __IndexOf_ComponentWidgetData()
{
    return 3;
}
int __IndexOf_OwnerSubTitle()
{
    return 4;
}
int __IndexOf_OwnerPage()
{
    return 5;
}
int __IndexOf_ItemConfig()
{
    return 6;
}
int __IndexOf_ApplyEffect()
{
    return 7;
}
int __IndexOf_SettingComponentWidgetClass()
{
    return 8;
}
int __IndexOf_KeyMappingVM()
{
    return 9;
}
int __IndexOf_bRefreshComponentWidget()
{
    return 10;
}
int __IndexOf_bHasResolutionOptionChanged()
{
    return 11;
}
int __IndexOf_bNeedCheckGraphicsQualityPreset()
{
    return 12;
}
int __IndexOf_CurrentValue()
{
    return 13;
}
int __IndexOf_ChangedValue()
{
    return 14;
}
int __IndexOf_PreviousValue()
{
    return 15;
}
int __IndexOf_PreviousKey0()
{
    return 16;
}
int __IndexOf_PreviousKey1()
{
    return 17;
}
int __IndexOf_PreviousChordKey0()
{
    return 18;
}
int __IndexOf_PreviousChordKey1()
{
    return 19;
}
int __IndexOf_bShowWarningMessage()
{
    return 20;
}
int __IndexOf_bIsHovered()
{
    return 21;
}
int __IndexOf_bIsEnabled()
{
    return 22;
}
int __IndexOf_bNeedApply()
{
    return 23;
}
int __IndexOf_bIsDisplayOrGraphics()
{
    return 24;
}
int __IndexOf_SwitchIndex()
{
    return 25;
}
int __IndexOf_ToggleVM()
{
    return 26;
}
int __IndexOf_DropdownVM()
{
    return 27;
}
int __IndexOf_SliderVM()
{
    return 28;
}
int __IndexOf_LinkVM()
{
    return 29;
}
int __IndexOf_ComponentWidgetOpacity()
{
    return 30;
}
}
namespace __GeneratedProperties_FVM_SettingItem
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
