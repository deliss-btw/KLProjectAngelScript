
namespace FVM_PlayerKeyMapping
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature SelectionSetKey = FEUIModelCallbackSignature();
}
namespace FVM_PlayerMappableKey
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature InvokeOnSelect = FEUIModelCallbackSignature();
}
namespace FVM_PlayerKeyMappingPair
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature SetKey0 = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature SetKey1 = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature SetKeySelectingWithCheck0 = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature SetKeySelectingWithCheck1 = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature OnKeySelecting0 = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature OnKeySelecting1 = FEUIModelCallbackSignature();
}
namespace FVMS_PlayerKeyMappings
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature OnEntrySelected = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature ResetKeys = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature RevertKey = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature SaveKeySettings = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature HandleSwitchKey = FEUIModelCallbackSignature();

}
struct FVM_PlayerKeyMapping : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    uint16 m_Index;
    UPROPERTY()
    EGameUseKeyCategory m_Category;
    UPROPERTY()
    FEUIInputAction m_InputAction;
    UPROPERTY()
    bool m_bConfigurable;
    UPROPERTY()
    bool m_bHasChanged;
    UPROPERTY()
    bool m_bNeedRefreshHover;
    UPROPERTY()
    FKey m_CurrentKey;
    UPROPERTY()
    FKey m_DefaultKey;
    UPROPERTY()
    FKey m_ChordKey;

    FVM_PlayerKeyMapping()
    {
        this.m_Index = 0;
        this.m_Category = EGameUseKeyCategory(0);
        this.m_bConfigurable = false;
        this.m_bHasChanged = false;
        this.m_bNeedRefreshHover = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_PlayerKeyMapping' by default constructor.");
        return;
    }
    FVM_PlayerKeyMapping(const FVM_PlayerKeyMapping &inout Other)
    {
        this.m_Index = 0;
        this.m_Category = EGameUseKeyCategory(0);
        this.m_bConfigurable = false;
        this.m_bHasChanged = false;
        this.m_bNeedRefreshHover = false;
        this.m_Index = int(Other.m_Index);
        this.m_Category = Other.m_Category;
        this.m_InputAction = Other.m_InputAction;
        this.m_bConfigurable = Other.m_bConfigurable;
        this.m_bHasChanged = Other.m_bHasChanged;
        this.m_bNeedRefreshHover = Other.m_bNeedRefreshHover;
        this.m_CurrentKey = Other.m_CurrentKey;
        this.m_DefaultKey = Other.m_DefaultKey;
        this.m_ChordKey = Other.m_ChordKey;
        return;
    }
    FVM_PlayerKeyMapping(const int InIndex, const EGameUseKeyCategory InCategory, const FGameUserKeyMapping &inout UserKeyMapping)
    {
        this.m_Index = 0;
        this.m_Category = EGameUseKeyCategory(0);
        this.m_bConfigurable = false;
        this.m_bHasChanged = false;
        this.m_bNeedRefreshHover = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetIndex(uint16(InIndex));
        this.SetCategory(EGameUseKeyCategory(InCategory));
        this.SetbConfigurable((int(UserKeyMapping.bConfigurable) != 0));
        this.SetCurrentKey(UserKeyMapping.CurrentKey);
        this.SetDefaultKey(UserKeyMapping.DefaultKey);
        this.SetChordKey(UserKeyMapping.ChordKey);
        return;
    }
    FVM_PlayerKeyMapping& opAssign(const FVM_PlayerKeyMapping &inout Other)
    {
        this.m_Index = int(Other.m_Index);
        this.m_Category = Other.m_Category;
        this.m_InputAction = Other.m_InputAction;
        this.m_bConfigurable = Other.m_bConfigurable;
        this.m_bHasChanged = Other.m_bHasChanged;
        this.m_bNeedRefreshHover = Other.m_bNeedRefreshHover;
        this.m_CurrentKey = Other.m_CurrentKey;
        this.m_DefaultKey = Other.m_DefaultKey;
        return Other.m_ChordKey;
    }
    ESlateVisibility GetKeyConfigurableVisibility() const
    {
        int local_2;
        if (this.GetbConfigurable())
        {
            local_2 = 0;
        }
        else
        {
            local_2 = 3;
        }
        return ESlateVisibility(local_2);
    }
    EEUIInputType GetInputType() const
    {
        switch (int(this.GetCategory()))
        {
        case 2:
        {
            return EEUIInputType(0);
        }
        case 1:
        {
            return EEUIInputType(0);
        }
        case 3:
        {
            return EEUIInputType(1);
        }
        default:
        {
        }
        }
        return EEUIInputType(2);
    }
    void FlushSettings(FGameUserKeyMapping &inout Mapping)
    {
        Mapping.CurrentKey = this.GetCurrentKey();
        return;
    }
    TArray<TEUIModelRef<FVM_PlayerMappableKey>> GetMappableKeys()
    {
        TArray<TEUIModelRef<FVM_PlayerMappableKey>> local_4;
        int local_47 = 0;
        UGameInputLocalPlayerSubsystem local_8 = UGameInputLocalPlayerSubsystem::Get(this.GetContext().UELocalPlayer);
        if (local_8 != nullptr)
        {
            TArray<FKey> local_26 = local_8.GetKeySet(::FVMS_PlayerKeyMappings::Get(this.GetContext().Manager).GetDefaultKey(EGameUseKeyCategory(this.GetCategory()), this.GetIndex()));
            for (auto& local_44 : local_26)
            {
                if (int(this.GetCategory()) == 3)
                {
                    local_47 = 1;
                }
                else
                {
                    local_47 = 0;
                }
                local_4.Add(TEUIModelRef<FVM_PlayerMappableKey>(::FVM_PlayerMappableKey::Create(this.GetContext().Manager, local_44)));
            }
        }
        return local_4;
    }
    bool SelectionSetKey(const FKey &inout NewKey)
    {
        this.SetKey(NewKey, true);
        return true;
    }
    void GenerateDialogForConfirm(const FText &inout Message)
    {
        UCommonPopupSettings local_4 = ::CommonPopupSettings::Get();
        FEUIInputAction local_10;
        FEUIInputAction local_16;
        if (!(!(local_4.CommonDialogAction.Find(ECommonDialogAnswerType(1), local_10))) && local_4.CommonDialogAction.Find(ECommonDialogAnswerType(2), local_16))
        {
            TArray<FCommonDialogOption> local_24;
            local_24.Add(FCommonDialogOption(ECommonDialogAnswerType(2), local_16, FText()));
            local_24.Add(FCommonDialogOption(ECommonDialogAnswerType(1), local_10, FText()));
            FDialogCallback local_74;
            FCommonDialogParam local_76;
            ::CommonPopup_Internal::OpenDialogForLocalPlayer(this.GetContext().UELocalPlayer, FText(), Message, local_24, local_74, local_76);
        }
        return;
    }
    void SetKey(const FKey &inout NewKey, const bool bCanRevert = true)
    {
        FVMS_PlayerKeyMappings& local_2 = ::FVMS_PlayerKeyMappings::Get(this.GetContext().Manager);
        if ((NewKey.GetKeyName() == NAME_None) && !(this.CanSetEmptyKey()))
        {
            this.GenerateDialogForConfirm(local_2.GetConfig().CanNotEmptyError);
            FKey local_12 = FKey(this.GetModify_CurrentKey());
            return;
        }
        if (!((NewKey == this.GetCurrentKey())) && this.IsValid(NewKey))
        {
            FVMS_PlayerKeyMappings& local_14 = ::FVMS_PlayerKeyMappings::Get(this.GetContext().Manager);
            int local_15 = int(this.GetCategory());
            TEUIModelRef<FVM_PlayerKeyMapping> local_18 = local_14.FindInUsingKeyMapping(NewKey, this.GetChordKey());
            if (local_18)
            {
                if (local_18.opArrow().GetbConfigurable())
                {
                    if ((this.GetCurrentKey().GetKeyName() == NAME_None) && !(local_18.opArrow().CanSetEmptyKey()))
                    {
                        FKey local_12_2 = FKey(this.GetModify_CurrentKey());
                        this.GenerateDialogForConfirm(local_2.GetConfig().CanNotEmptyError);
                    }
                    else
                    {
                        local_14.ShowSwitchKeyPopup(TEUIModelRef<FVM_PlayerKeyMapping>(this), local_18);
                        FKey local_12_3 = FKey(this.GetModify_CurrentKey());
                    }
                }
                else
                {
                    local_14.ShowCanNotSwitchKeyPopup(local_18);
                }
            }
            else
            {
                if (bCanRevert)
                {
                    local_2.BeforeKeyModify(this);
                }
                this.SetCurrentKey(NewKey);
                this.SetbHasChanged(true);
                this.SetbNeedRefreshHover(!(this.GetbNeedRefreshHover()));
            }
        }
        return;
    }
    bool IsValid(const FKey &inout NewKey) const
    {
        UGameInputLocalPlayerSubsystem local_4 = UGameInputLocalPlayerSubsystem::Get(this.GetContext().UELocalPlayer);
        if (local_4 != nullptr)
        {
            FVMS_PlayerKeyMappings& local_8 = ::FVMS_PlayerKeyMappings::Get(this.GetContext().Manager);
            int local_19 = int(this.GetCategory());
            bool local_5 = local_4.IsValidKey(local_8.GetDefaultKey(this.GetCategory(), this.GetIndex()), NewKey);
            if (!(local_5))
            {
                local_8.SetbShowInvalidKeyError(true);
            }
            return local_5;
        }
        return false;
    }
    bool CanSetEmptyKey() const
    {
        FVMS_PlayerKeyMappings& local_2 = ::FVMS_PlayerKeyMappings::Get(this.GetContext().Manager);
        if ((int(this.GetCategory())) == 1 || (int(this.GetCategory()) == 2))
        {
            const TEUIModelRef<FVM_PlayerKeyMappingPair>& local_10 = local_2.GetKeyboardMouseKeys()[this.GetIndex()];
            TEUIModelRef<FVM_PlayerKeyMapping> local_16 = int(this.GetCategory()) == 1 ? local_10.opArrow().GetMapping1() : local_10.opArrow().GetMapping0();
            return !((local_16.opArrow().GetCurrentKey().GetKeyName() == NAME_None));
        }
        else
        {
            return true;
        }
    }
    uint16 GetIndex() const property
    {
        this.TrackPropertyRead(0);
        return this.m_Index;
    }
    void SetIndex(const uint16 __Value) property
    {
        if (this.m_Index == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_Index = __Value;
        return;
    }
    EGameUseKeyCategory GetCategory() const property
    {
        this.TrackPropertyRead(1);
        return this.m_Category;
    }
    void SetCategory(const EGameUseKeyCategory __Value) property
    {
        if (int(this.m_Category) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_Category = __Value;
        return;
    }
    FEUIInputAction GetInputAction() const property
    {
        FEUIInputAction __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    FEUIInputAction GetModify_InputAction() property
    {
        FEUIInputAction __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetInputAction(const FEUIInputAction &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_InputAction = __Value;
        return;
    }
    bool GetbConfigurable() const property
    {
        this.TrackPropertyRead(3);
        return this.m_bConfigurable;
    }
    void SetbConfigurable(const bool __Value) property
    {
        if (!(this.m_bConfigurable) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_bConfigurable = __Value;
        return;
    }
    bool GetbHasChanged() const property
    {
        this.TrackPropertyRead(4);
        return this.m_bHasChanged;
    }
    void SetbHasChanged(const bool __Value) property
    {
        if (!(this.m_bHasChanged) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_bHasChanged = __Value;
        return;
    }
    bool GetbNeedRefreshHover() const property
    {
        this.TrackPropertyRead(5);
        return this.m_bNeedRefreshHover;
    }
    void SetbNeedRefreshHover(const bool __Value) property
    {
        if (!(this.m_bNeedRefreshHover) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_bNeedRefreshHover = __Value;
        return;
    }
    const FKey GetCurrentKey() const property
    {
        const FKey __r;
        this.TrackPropertyRead(6);
        return __r;
    }
    FKey GetModify_CurrentKey() property
    {
        FKey __r;
        this.MarkPropertyDirty(6);
        return __r;
    }
    void SetCurrentKey(const FKey &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_CurrentKey = __Value;
        return;
    }
    FKey GetDefaultKey() const property
    {
        FKey __r;
        this.TrackPropertyRead(7);
        return __r;
    }
    FKey GetModify_DefaultKey() property
    {
        FKey __r;
        this.MarkPropertyDirty(7);
        return __r;
    }
    void SetDefaultKey(const FKey &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(7);
        this.m_DefaultKey = __Value;
        return;
    }
    const FKey GetChordKey() const property
    {
        const FKey __r;
        this.TrackPropertyRead(8);
        return __r;
    }
    FKey GetModify_ChordKey() property
    {
        FKey __r;
        this.MarkPropertyDirty(8);
        return __r;
    }
    void SetChordKey(const FKey &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(8);
        this.m_ChordKey = __Value;
        return;
    }
}

struct FVM_PlayerMappableKey : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    FKey m_Key;
    UPROPERTY()
    EEUIInputType m_InputType;
    UPROPERTY()
    FPlayerMappableKeyCallback m_OnSelect;
    UPROPERTY()
    FEUIWidgetRef m_OwnerPage;

    FVM_PlayerMappableKey()
    {
        this.m_InputType = EEUIInputType(1);
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_PlayerMappableKey' by default constructor.");
        return;
    }
    FVM_PlayerMappableKey(const FVM_PlayerMappableKey &inout Other)
    {
        this.m_InputType = EEUIInputType(1);
        this.m_Key = Other.m_Key;
        this.m_InputType = Other.m_InputType;
        this.m_OwnerPage = Other.m_OwnerPage;
        return;
    }
    FVM_PlayerMappableKey(const FKey &inout InKey, const EEUIInputType InInputType)
    {
        this.m_InputType = EEUIInputType(1);
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetKey(InKey);
        this.SetInputType(EEUIInputType(InInputType));
        return;
    }
    FVM_PlayerMappableKey& opAssign(const FVM_PlayerMappableKey &inout Other)
    {
        this.m_Key = Other.m_Key;
        this.m_InputType = Other.m_InputType;
        return Other.m_OwnerPage;
    }
    FSlateBrush GetKeyIcon() const
    {
        int local_1 = int(this.GetInputType());
        return EUIWidget::GetKeyBrush(this.GetKey());
    }
    void InvokeOnSelect() const
    {
        if (this.GetOnSelect().IsBound())
        {
            this.GetOnSelect().Execute(this.GetKey());
        }
        if (this.GetOwnerPage())
        {
            FEUIWidget::RemoveWidget(this.GetOwnerPage());
        }
        return;
    }
    FKey GetKey() const property
    {
        FKey __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    FKey GetModify_Key() property
    {
        FKey __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetKey(const FKey &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_Key = __Value;
        return;
    }
    EEUIInputType GetInputType() const property
    {
        this.TrackPropertyRead(1);
        return this.m_InputType;
    }
    void SetInputType(const EEUIInputType __Value) property
    {
        if (int(this.m_InputType) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_InputType = __Value;
        return;
    }
    const FPlayerMappableKeyCallback GetOnSelect() const property
    {
        const FPlayerMappableKeyCallback __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    FPlayerMappableKeyCallback GetModify_OnSelect() property
    {
        FPlayerMappableKeyCallback __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetOnSelect(const FPlayerMappableKeyCallback &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        return;
    }
    FEUIWidgetRef GetOwnerPage() const property
    {
        FEUIWidgetRef __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    FEUIWidgetRef GetModify_OwnerPage() property
    {
        FEUIWidgetRef __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetOwnerPage(const FEUIWidgetRef &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_OwnerPage = __Value;
        return;
    }
}

struct FVM_PlayerKeyMappingPair : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    FText m_ActionName;
    UPROPERTY()
    bool m_bIsKeyMapping;
    UPROPERTY()
    bool m_bIsGamepadSelector;
    UPROPERTY()
    TEUIModelRef<FVM_PlayerKeyMapping> m_Mapping0;
    UPROPERTY()
    TEUIModelRef<FVM_PlayerKeyMapping> m_Mapping1;
    UPROPERTY()
    FGameplayTag m_KeyboardTag;
    UPROPERTY()
    FGameplayTag m_GamepadTag;
    UPROPERTY()
    float32 m_RenderOpacity0;
    UPROPERTY()
    float32 m_RenderOpacity1;
    UPROPERTY()
    int m_SwitchKeyIndex0;
    UPROPERTY()
    int m_SwitchKeyIndex1;
    UPROPERTY()
    int m_SwitchVisibleIndex0;
    UPROPERTY()
    int m_SwitchVisibleIndex1;
    UPROPERTY()
    int m_HoverIndex0;
    UPROPERTY()
    int m_HoverIndex1;
    UPROPERTY()
    bool m_bHasChanged;
    UPROPERTY()
    bool m_bNeedRefreshHover;
    UPROPERTY()
    bool m_bIsKeySelecting0;
    UPROPERTY()
    bool m_bIsKeySelecting1;
    UPROPERTY()
    bool m_bHasChordKey0;
    UPROPERTY()
    bool m_bHasChordKey1;

    FVM_PlayerKeyMappingPair()
    {
        this.m_bIsKeyMapping = true;
        this.m_bIsGamepadSelector = false;
        this.m_RenderOpacity0 = 1.0f;
        this.m_RenderOpacity1 = 1.0f;
        this.m_SwitchKeyIndex0 = 0;
        this.m_SwitchKeyIndex1 = 0;
        this.m_SwitchVisibleIndex0 = 0;
        this.m_SwitchVisibleIndex1 = 0;
        this.m_HoverIndex0 = 0;
        this.m_HoverIndex1 = 0;
        this.m_bHasChanged = false;
        this.m_bNeedRefreshHover = false;
        this.m_bIsKeySelecting0 = false;
        this.m_bIsKeySelecting1 = false;
        this.m_bHasChordKey0 = false;
        this.m_bHasChordKey1 = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVM_PlayerKeyMappingPair(const FVM_PlayerKeyMappingPair &inout Other)
    {
        this.m_bIsKeyMapping = true;
        this.m_bIsGamepadSelector = false;
        this.m_RenderOpacity0 = 1.0f;
        this.m_RenderOpacity1 = 1.0f;
        this.m_SwitchKeyIndex0 = 0;
        this.m_SwitchKeyIndex1 = 0;
        this.m_SwitchVisibleIndex0 = 0;
        this.m_SwitchVisibleIndex1 = 0;
        this.m_HoverIndex0 = 0;
        this.m_HoverIndex1 = 0;
        this.m_bHasChanged = false;
        this.m_bNeedRefreshHover = false;
        this.m_bIsKeySelecting0 = false;
        this.m_bIsKeySelecting1 = false;
        this.m_bHasChordKey0 = false;
        this.m_bHasChordKey1 = false;
        this.m_ActionName = Other.m_ActionName;
        this.m_bIsKeyMapping = Other.m_bIsKeyMapping;
        this.m_bIsGamepadSelector = Other.m_bIsGamepadSelector;
        this.m_Mapping0 = Other.m_Mapping0;
        this.m_Mapping1 = Other.m_Mapping1;
        this.m_KeyboardTag = Other.m_KeyboardTag;
        this.m_GamepadTag = Other.m_GamepadTag;
        this.m_RenderOpacity0 = Other.m_RenderOpacity0;
        this.m_RenderOpacity1 = Other.m_RenderOpacity1;
        this.m_SwitchKeyIndex0 = int(Other.m_SwitchKeyIndex0);
        this.m_SwitchKeyIndex1 = int(Other.m_SwitchKeyIndex1);
        this.m_SwitchVisibleIndex0 = int(Other.m_SwitchVisibleIndex0);
        this.m_SwitchVisibleIndex1 = int(Other.m_SwitchVisibleIndex1);
        this.m_HoverIndex0 = int(Other.m_HoverIndex0);
        this.m_HoverIndex1 = int(Other.m_HoverIndex1);
        this.m_bHasChanged = Other.m_bHasChanged;
        this.m_bNeedRefreshHover = Other.m_bNeedRefreshHover;
        this.m_bIsKeySelecting0 = Other.m_bIsKeySelecting0;
        this.m_bIsKeySelecting1 = Other.m_bIsKeySelecting1;
        this.m_bHasChordKey0 = Other.m_bHasChordKey0;
        this.m_bHasChordKey1 = Other.m_bHasChordKey1;
        return;
    }
    FVM_PlayerKeyMappingPair opAssign(const FVM_PlayerKeyMappingPair &inout Other)
    {
        FVM_PlayerKeyMappingPair __r;
        this.m_ActionName = Other.m_ActionName;
        this.m_bIsKeyMapping = Other.m_bIsKeyMapping;
        this.m_bIsGamepadSelector = Other.m_bIsGamepadSelector;
        this.m_Mapping0 = Other.m_Mapping0;
        this.m_Mapping1 = Other.m_Mapping1;
        this.m_KeyboardTag = Other.m_KeyboardTag;
        this.m_GamepadTag = Other.m_GamepadTag;
        this.m_RenderOpacity0 = Other.m_RenderOpacity0;
        this.m_RenderOpacity1 = Other.m_RenderOpacity1;
        this.m_SwitchKeyIndex0 = int(Other.m_SwitchKeyIndex0);
        this.m_SwitchKeyIndex1 = int(Other.m_SwitchKeyIndex1);
        this.m_SwitchVisibleIndex0 = int(Other.m_SwitchVisibleIndex0);
        this.m_SwitchVisibleIndex1 = int(Other.m_SwitchVisibleIndex1);
        this.m_HoverIndex0 = int(Other.m_HoverIndex0);
        this.m_HoverIndex1 = int(Other.m_HoverIndex1);
        this.m_bHasChanged = Other.m_bHasChanged;
        this.m_bNeedRefreshHover = Other.m_bNeedRefreshHover;
        this.m_bIsKeySelecting0 = Other.m_bIsKeySelecting0;
        this.m_bIsKeySelecting1 = Other.m_bIsKeySelecting1;
        this.m_bHasChordKey0 = Other.m_bHasChordKey0;
        this.m_bHasChordKey1 = Other.m_bHasChordKey1;
        return __r;
    }
    void PostLoad()
    {
        float32 local_9;
        bool local_3 = this.GetMapping0().IsValid();
        if (!(local_3))
        {
            local_3 = false;
        }
        else
        {
            TEUIModelRef<FVM_PlayerKeyMapping> local_2 = this.GetMapping0();
            local_3 = GetbConfigurable();
        }
        if (!(local_3))
        {
            local_3 = false;
        }
        else
        {
            TEUIModelRef<FVM_PlayerKeyMapping> local_2_2 = this.GetMapping0();
            local_3 = (GetCurrentKey().GetKeyName() == NAME_None);
        }
        int local_7 = local_3 ? 2 : 0;
        this.SetSwitchVisibleIndex0(local_7);
        bool local_4 = this.GetMapping1().IsValid();
        if (!(local_4))
        {
            local_4 = false;
        }
        else
        {
            TEUIModelRef<FVM_PlayerKeyMapping> local_2_3 = this.GetMapping1();
            local_4 = GetbConfigurable();
        }
        if (!(local_4))
        {
            local_4 = false;
        }
        else
        {
            TEUIModelRef<FVM_PlayerKeyMapping> local_2_4 = this.GetMapping1();
            local_4 = (GetCurrentKey().GetKeyName() == NAME_None);
        }
        this.SetSwitchVisibleIndex1((local_4 ? 2 : 0));
        bool local_3_2 = this.GetMapping0().IsValid();
        if (!(local_3_2))
        {
            local_3_2 = false;
        }
        else
        {
            TEUIModelRef<FVM_PlayerKeyMapping> local_2_5 = this.GetMapping0();
            local_3_2 = GetbConfigurable();
        }
        if (local_3_2)
        {
            local_9 = 1.0f;
        }
        else
        {
            local_9 = 0.5f;
        }
        this.SetRenderOpacity0(local_9);
        bool local_4_2 = this.GetMapping1().IsValid();
        if (!(local_4_2))
        {
            local_4_2 = false;
        }
        else
        {
            TEUIModelRef<FVM_PlayerKeyMapping> local_2_6 = this.GetMapping1();
            local_4_2 = GetbConfigurable();
        }
        if (local_4_2)
        {
            local_9 = 1.0f;
        }
        else
        {
            local_9 = 0.5f;
        }
        this.SetRenderOpacity1(local_9);
        return;
    }
    bool DifferentFromPreviousKey(const FKey &inout PreviousKey0, const FKey &inout PreviousChordKey0, const FKey &inout PreviousKey1, const FKey &inout PreviousChordKey1) const
    {
        bool local_5;
        bool local_3 = this.GetMapping0().IsValid();
        if (!(local_3))
        {
            local_3 = false;
        }
        else
        {
            TEUIModelRef<FVM_PlayerKeyMapping> local_2 = this.GetMapping0();
            local_3 = !((PreviousKey0 == GetCurrentKey()));
        }
        if (local_3)
        {
            local_5 = true;
        }
        else
        {
            bool local_4;
            local_4 = this.GetMapping0().IsValid();
            if (!(local_4))
            {
                local_4 = false;
            }
            else
            {
                TEUIModelRef<FVM_PlayerKeyMapping> local_2_2 = this.GetMapping0();
                local_4 = !((PreviousChordKey0 == GetChordKey()));
            }
            local_5 = local_4;
        }
        if (local_5)
        {
            local_3 = true;
        }
        else
        {
            bool local_4;
            local_4 = this.GetMapping1().IsValid();
            if (!(local_4))
            {
                local_4 = false;
            }
            else
            {
                TEUIModelRef<FVM_PlayerKeyMapping> local_2_3 = this.GetMapping1();
                local_4 = !((PreviousKey1 == GetCurrentKey()));
            }
            local_3 = local_4;
        }
        if (local_3)
        {
            local_5 = true;
        }
        else
        {
            bool local_4;
            local_4 = this.GetMapping1().IsValid();
            if (!(local_4))
            {
                local_4 = false;
            }
            else
            {
                TEUIModelRef<FVM_PlayerKeyMapping> local_2_4 = this.GetMapping1();
                local_4 = !((PreviousChordKey1 == GetChordKey()));
            }
            local_5 = local_4;
        }
        return local_5;
    }
    void OnChordKeyChanged()
    {
        bool local_3 = this.GetMapping0().IsValid();
        if (!(local_3))
        {
            local_3 = false;
        }
        else
        {
            TEUIModelRef<FVM_PlayerKeyMapping> local_2 = this.GetMapping0();
            local_3 = !((GetChordKey().GetKeyName() == NAME_None));
        }
        this.SetbHasChordKey0(local_3);
        bool local_3_2 = this.GetMapping1().IsValid();
        if (!(local_3_2))
        {
            local_3_2 = false;
        }
        else
        {
            TEUIModelRef<FVM_PlayerKeyMapping> local_2_2 = this.GetMapping1();
            local_3_2 = !((GetChordKey().GetKeyName() == NAME_None));
        }
        this.SetbHasChordKey1(local_3_2);
        return;
    }
    void OnKeyChanged()
    {
        bool local_5;
        bool local_3 = this.GetMapping0().IsValid();
        if (!(local_3))
        {
            local_3 = false;
        }
        else
        {
            TEUIModelRef<FVM_PlayerKeyMapping> local_2 = this.GetMapping0();
            local_3 = GetbHasChanged();
        }
        if (local_3)
        {
            local_5 = true;
        }
        else
        {
            bool local_4 = this.GetMapping1().IsValid();
            if (!(local_4))
            {
                local_4 = false;
            }
            else
            {
                TEUIModelRef<FVM_PlayerKeyMapping> local_2_2 = this.GetMapping1();
                local_4 = GetbHasChanged();
            }
            local_5 = local_4;
        }
        this.SetbHasChanged(local_5);
        return;
    }
    void OnNeedRefreshHoverChanged()
    {
        bool local_5;
        bool local_3 = this.GetMapping0().IsValid();
        if (!(local_3))
        {
            local_3 = false;
        }
        else
        {
            TEUIModelRef<FVM_PlayerKeyMapping> local_2 = this.GetMapping0();
            local_3 = GetbNeedRefreshHover();
        }
        if (local_3)
        {
            local_5 = true;
        }
        else
        {
            bool local_4 = this.GetMapping1().IsValid();
            if (!(local_4))
            {
                local_4 = false;
            }
            else
            {
                TEUIModelRef<FVM_PlayerKeyMapping> local_2_2 = this.GetMapping1();
                local_4 = GetbNeedRefreshHover();
            }
            local_5 = local_4;
        }
        this.SetbNeedRefreshHover(local_5);
        return;
    }
    void UpdateGamepadSelector(const bool _bIsGamepadSelector)
    {
        this.SetbIsGamepadSelector(_bIsGamepadSelector);
        return;
    }
    FKey GetKey0() const
    {
        return this.GetMapping0().opArrow().GetCurrentKey();
    }
    FKey GetKey1() const
    {
        return this.GetMapping1().opArrow().GetCurrentKey();
    }
    bool GetKeyEnabled0() const
    {
        return this.GetMapping0().opArrow().GetbConfigurable();
    }
    bool GetKeyEnabled1() const
    {
        return this.GetMapping1().opArrow().GetbConfigurable();
    }
    bool GetKeyDisabled0() const
    {
        return !(this.GetMapping0().opArrow().GetbConfigurable());
    }
    bool GetKeyDisabled1() const
    {
        return !(this.GetMapping1().opArrow().GetbConfigurable());
    }
    ESlateVisibility GetKeyConfigurableVisibility0() const
    {
        int local_4;
        if (this.GetMapping0().opArrow().GetbConfigurable())
        {
            local_4 = 0;
        }
        else
        {
            local_4 = 3;
        }
        return ESlateVisibility(local_4);
    }
    ESlateVisibility GetKeyConfigurableVisibility1() const
    {
        int local_4;
        if (this.GetMapping1().opArrow().GetbConfigurable())
        {
            local_4 = 0;
        }
        else
        {
            local_4 = 3;
        }
        return ESlateVisibility(local_4);
    }
    bool GetKeyModified0() const
    {
        return this.GetMapping0() && !((FKey(this.GetMapping0().opArrow().GetCurrentKey()) == this.GetMapping0().opArrow().GetDefaultKey()));
    }
    bool GetKeyModified1() const
    {
        return this.GetMapping1() && !((FKey(this.GetMapping1().opArrow().GetCurrentKey()) == this.GetMapping1().opArrow().GetDefaultKey()));
    }
    bool GetAnyKeyModified() const
    {
        return this.GetKeyModified0() || this.GetKeyModified1();
    }
    FKey GetChordKey0() const
    {
        return this.GetMapping0().opArrow().GetChordKey();
    }
    FKey GetChordKey1() const
    {
        return this.GetMapping1().opArrow().GetChordKey();
    }
    void SetKey0(const FKey &inout NewKey)
    {
        this.GetMapping0().opArrow().SetKey(NewKey, true);
        return;
    }
    void SetKey1(const FKey &inout NewKey)
    {
        this.GetMapping1().opArrow().SetKey(NewKey, true);
        return;
    }
    void OnUnConfigurableKeySelecting()
    {
        FCommonTipsParam local_4;
        ::CommonPopup_Internal::OpenTipsWithoutECSWorld(this.GetContext().UELocalPlayer, NSLOCTEXT("SettingPage", "KeyCannotModify", "иЇҐжЊ‰й”®ж— жі•дї®ж”№"), local_4, ECommonTipsType(0), FEUIModelContainer());
        return;
    }
    void OnUnConfigurableKeySelectingByGamepad()
    {
        FCommonTipsParam local_4;
        ::CommonPopup_Internal::OpenTipsWithoutECSWorld(this.GetContext().UELocalPlayer, NSLOCTEXT("SettingPage", "PleaseUseKeyboardOrMouse", "иЇ·дЅїз”Ёй”®йј ж“ЌдЅњ"), local_4, ECommonTipsType(0), FEUIModelContainer());
        return;
    }
    void SetKeySelectingWithCheck0()
    {
        if (!(this.GetbIsGamepadSelector()) && (int(::UICommonUtil::GetCurrentInputType(this.GetContext().UELocalPlayer)) == 1))
        {
            this.OnUnConfigurableKeySelectingByGamepad();
            return;
        }
        TEUIModelRef<FVM_PlayerKeyMapping> local_8 = this.GetMapping0();
        if (!(GetbConfigurable()))
        {
            this.OnUnConfigurableKeySelecting();
            return;
        }
        this.OnKeySelecting0(!(this.GetbIsKeySelecting0()));
        return;
    }
    void SetKeySelectingWithCheck1()
    {
        if (!(this.GetbIsGamepadSelector()) && (int(::UICommonUtil::GetCurrentInputType(this.GetContext().UELocalPlayer)) == 1))
        {
            this.OnUnConfigurableKeySelectingByGamepad();
            return;
        }
        TEUIModelRef<FVM_PlayerKeyMapping> local_8 = this.GetMapping1();
        if (!(GetbConfigurable()))
        {
            this.OnUnConfigurableKeySelecting();
            return;
        }
        this.OnKeySelecting1(!(this.GetbIsKeySelecting1()));
        return;
    }
    void OnKeySelecting0(const bool bOnKeySelecting)
    {
        int local_23;
        if (bOnKeySelecting && !(this.GetbIsGamepadSelector()) && (int(::UICommonUtil::GetCurrentInputType(this.GetContext().UELocalPlayer)) == 1))
        {
            return;
        }
        FVMS_PlayerKeyMappings& local_8 = ::FVMS_PlayerKeyMappings::Get(this.GetContext().Manager);
        local_8.SetbIsKeySelecting(bOnKeySelecting);
        TEUIModelRef<FVM_PlayerKeyMapping> local_10;
        TEUIModelRef<FVM_PlayerKeyMapping> local_14 = bOnKeySelecting ? this.GetMapping0() : local_10;
        local_8.SetSelectingKey(local_14);
        TEUIModelRef<FVM_PlayerKeyMappingPair> local_20;
        if (bOnKeySelecting)
        {
            local_20 = TEUIModelRef<FVM_PlayerKeyMappingPair>(this);
        }
        else
        {
            local_20 = TEUIModelRef<FVM_PlayerKeyMappingPair>();
        }
        local_8.SetSelectingKeyPair(local_20);
        if (bOnKeySelecting)
        {
            local_23 = 1;
        }
        else
        {
            bool local_2;
            TEUIModelRef<FVM_PlayerKeyMapping> local_12 = this.GetMapping0();
            local_2 = GetbConfigurable();
            if (!(local_2))
            {
                local_2 = false;
            }
            else
            {
                local_10 = this.GetMapping0();
                local_2 = (GetCurrentKey().GetKeyName() == NAME_None);
            }
            local_23 = local_2 ? 2 : 0;
        }
        this.SetSwitchVisibleIndex0(local_23);
        local_8.RefreshCanRevert();
        this.SetbIsKeySelecting0(bOnKeySelecting);
        return;
    }
    void OnKeySelecting1(const bool bOnKeySelecting)
    {
        int local_23;
        if (bOnKeySelecting && !(this.GetbIsGamepadSelector()) && (int(::UICommonUtil::GetCurrentInputType(this.GetContext().UELocalPlayer)) == 1))
        {
            return;
        }
        FVMS_PlayerKeyMappings& local_8 = ::FVMS_PlayerKeyMappings::Get(this.GetContext().Manager);
        local_8.SetbIsKeySelecting(bOnKeySelecting);
        TEUIModelRef<FVM_PlayerKeyMapping> local_10;
        TEUIModelRef<FVM_PlayerKeyMapping> local_14 = bOnKeySelecting ? this.GetMapping1() : local_10;
        local_8.SetSelectingKey(local_14);
        TEUIModelRef<FVM_PlayerKeyMappingPair> local_20;
        if (bOnKeySelecting)
        {
            local_20 = TEUIModelRef<FVM_PlayerKeyMappingPair>(this);
        }
        else
        {
            local_20 = TEUIModelRef<FVM_PlayerKeyMappingPair>();
        }
        local_8.SetSelectingKeyPair(local_20);
        if (bOnKeySelecting)
        {
            local_23 = 1;
        }
        else
        {
            bool local_2;
            TEUIModelRef<FVM_PlayerKeyMapping> local_12 = this.GetMapping1();
            local_2 = GetbConfigurable();
            if (!(local_2))
            {
                local_2 = false;
            }
            else
            {
                local_10 = this.GetMapping1();
                local_2 = (GetCurrentKey().GetKeyName() == NAME_None);
            }
            local_23 = local_2 ? 2 : 0;
        }
        this.SetSwitchVisibleIndex1(local_23);
        local_8.RefreshCanRevert();
        this.SetbIsKeySelecting1(bOnKeySelecting);
        return;
    }
    bool IsValid0(const FKey &inout NewKey) const
    {
        return this.GetMapping0().opArrow().IsValid(NewKey);
    }
    bool IsValid1(const FKey &inout NewKey) const
    {
        return this.GetMapping1().opArrow().IsValid(NewKey);
    }
    const FText GetActionName() const property
    {
        const FText __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    FText GetModify_ActionName() property
    {
        FText __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetActionName(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_ActionName = __Value;
        return;
    }
    bool GetbIsKeyMapping() const property
    {
        this.TrackPropertyRead(1);
        return this.m_bIsKeyMapping;
    }
    void SetbIsKeyMapping(const bool __Value) property
    {
        if (!(this.m_bIsKeyMapping) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_bIsKeyMapping = __Value;
        return;
    }
    bool GetbIsGamepadSelector() const property
    {
        this.TrackPropertyRead(2);
        return this.m_bIsGamepadSelector;
    }
    void SetbIsGamepadSelector(const bool __Value) property
    {
        if (!(this.m_bIsGamepadSelector) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_bIsGamepadSelector = __Value;
        return;
    }
    TEUIModelRef<FVM_PlayerKeyMapping> GetMapping0() const property
    {
        this.TrackPropertyRead(3);
        return this.m_Mapping0;
    }
    void SetMapping0(const TEUIModelRef<FVM_PlayerKeyMapping> &inout __Value) property
    {
        TEUIModelRef<FVM_PlayerKeyMapping> local_2;
        local_2 = this.m_Mapping0;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_Mapping0 = __Value;
        return;
    }
    TEUIModelRef<FVM_PlayerKeyMapping> GetMapping1() const property
    {
        this.TrackPropertyRead(4);
        return this.m_Mapping1;
    }
    void SetMapping1(const TEUIModelRef<FVM_PlayerKeyMapping> &inout __Value) property
    {
        TEUIModelRef<FVM_PlayerKeyMapping> local_2;
        local_2 = this.m_Mapping1;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_Mapping1 = __Value;
        return;
    }
    const FGameplayTag GetKeyboardTag() const property
    {
        const FGameplayTag __r;
        this.TrackPropertyRead(5);
        return __r;
    }
    FGameplayTag GetModify_KeyboardTag() property
    {
        FGameplayTag __r;
        this.MarkPropertyDirty(5);
        return __r;
    }
    void SetKeyboardTag(const FGameplayTag &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_KeyboardTag = __Value;
        return;
    }
    const FGameplayTag GetGamepadTag() const property
    {
        const FGameplayTag __r;
        this.TrackPropertyRead(6);
        return __r;
    }
    FGameplayTag GetModify_GamepadTag() property
    {
        FGameplayTag __r;
        this.MarkPropertyDirty(6);
        return __r;
    }
    void SetGamepadTag(const FGameplayTag &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_GamepadTag = __Value;
        return;
    }
    const float32 GetRenderOpacity0() const property
    {
        const float32 __r;
        this.TrackPropertyRead(7);
        return __r;
    }
    float32 GetModify_RenderOpacity0() property
    {
        float32 __r;
        this.MarkPropertyDirty(7);
        return __r;
    }
    void SetRenderOpacity0(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(7);
        this.m_RenderOpacity0 = __Value;
        return;
    }
    const float32 GetRenderOpacity1() const property
    {
        const float32 __r;
        this.TrackPropertyRead(8);
        return __r;
    }
    float32 GetModify_RenderOpacity1() property
    {
        float32 __r;
        this.MarkPropertyDirty(8);
        return __r;
    }
    void SetRenderOpacity1(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(8);
        this.m_RenderOpacity1 = __Value;
        return;
    }
    int GetSwitchKeyIndex0() const property
    {
        this.TrackPropertyRead(9);
        return this.m_SwitchKeyIndex0;
    }
    void SetSwitchKeyIndex0(const int __Value) property
    {
        if (this.m_SwitchKeyIndex0 == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(9);
        this.m_SwitchKeyIndex0 = __Value;
        return;
    }
    int GetSwitchKeyIndex1() const property
    {
        this.TrackPropertyRead(10);
        return this.m_SwitchKeyIndex1;
    }
    void SetSwitchKeyIndex1(const int __Value) property
    {
        if (this.m_SwitchKeyIndex1 == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(10);
        this.m_SwitchKeyIndex1 = __Value;
        return;
    }
    int GetSwitchVisibleIndex0() const property
    {
        this.TrackPropertyRead(11);
        return this.m_SwitchVisibleIndex0;
    }
    void SetSwitchVisibleIndex0(const int __Value) property
    {
        if (this.m_SwitchVisibleIndex0 == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(11);
        this.m_SwitchVisibleIndex0 = __Value;
        return;
    }
    int GetSwitchVisibleIndex1() const property
    {
        this.TrackPropertyRead(12);
        return this.m_SwitchVisibleIndex1;
    }
    void SetSwitchVisibleIndex1(const int __Value) property
    {
        if (this.m_SwitchVisibleIndex1 == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(12);
        this.m_SwitchVisibleIndex1 = __Value;
        return;
    }
    int GetHoverIndex0() const property
    {
        this.TrackPropertyRead(13);
        return this.m_HoverIndex0;
    }
    void SetHoverIndex0(const int __Value) property
    {
        if (this.m_HoverIndex0 == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(13);
        this.m_HoverIndex0 = __Value;
        return;
    }
    int GetHoverIndex1() const property
    {
        this.TrackPropertyRead(14);
        return this.m_HoverIndex1;
    }
    void SetHoverIndex1(const int __Value) property
    {
        if (this.m_HoverIndex1 == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(14);
        this.m_HoverIndex1 = __Value;
        return;
    }
    bool GetbHasChanged() const property
    {
        this.TrackPropertyRead(15);
        return this.m_bHasChanged;
    }
    void SetbHasChanged(const bool __Value) property
    {
        if (!(this.m_bHasChanged) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(15);
        this.m_bHasChanged = __Value;
        return;
    }
    bool GetbNeedRefreshHover() const property
    {
        this.TrackPropertyRead(16);
        return this.m_bNeedRefreshHover;
    }
    void SetbNeedRefreshHover(const bool __Value) property
    {
        if (!(this.m_bNeedRefreshHover) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(16);
        this.m_bNeedRefreshHover = __Value;
        return;
    }
    bool GetbIsKeySelecting0() const property
    {
        this.TrackPropertyRead(17);
        return this.m_bIsKeySelecting0;
    }
    void SetbIsKeySelecting0(const bool __Value) property
    {
        if (!(this.m_bIsKeySelecting0) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(17);
        this.m_bIsKeySelecting0 = __Value;
        return;
    }
    bool GetbIsKeySelecting1() const property
    {
        this.TrackPropertyRead(18);
        return this.m_bIsKeySelecting1;
    }
    void SetbIsKeySelecting1(const bool __Value) property
    {
        if (!(this.m_bIsKeySelecting1) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(18);
        this.m_bIsKeySelecting1 = __Value;
        return;
    }
    bool GetbHasChordKey0() const property
    {
        this.TrackPropertyRead(19);
        return this.m_bHasChordKey0;
    }
    void SetbHasChordKey0(const bool __Value) property
    {
        if (!(this.m_bHasChordKey0) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(19);
        this.m_bHasChordKey0 = __Value;
        return;
    }
    bool GetbHasChordKey1() const property
    {
        this.TrackPropertyRead(20);
        return this.m_bHasChordKey1;
    }
    void SetbHasChordKey1(const bool __Value) property
    {
        if (!(this.m_bHasChordKey1) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(20);
        this.m_bHasChordKey1 = __Value;
        return;
    }
}

struct FPlayerKeyMappingModification
{
    UPROPERTY()
    int ModificationNum = 0;
    UPROPERTY()
    FKey BackupKey0;
    UPROPERTY()
    TEUIModelRef<FVM_PlayerKeyMapping> KeyMapping0;
    UPROPERTY()
    FKey BackupKey1;
    UPROPERTY()
    TEUIModelRef<FVM_PlayerKeyMapping> KeyMapping1;


    void Backup(const FVM_PlayerKeyMapping &inout InMapping)
    {
        ++this.ModificationNum;
        this.KeyMapping0 = TEUIModelRef<FVM_PlayerKeyMapping>(InMapping);
        this.BackupKey0 = InMapping.GetCurrentKey();
        return;
    }
    void BackupSwitch(const FVM_PlayerKeyMapping &inout InMapping0, const FVM_PlayerKeyMapping &inout InMapping1)
    {
        ++this.ModificationNum;
        this.KeyMapping0 = TEUIModelRef<FVM_PlayerKeyMapping>(InMapping0);
        this.BackupKey0 = InMapping0.GetCurrentKey();
        this.KeyMapping1 = TEUIModelRef<FVM_PlayerKeyMapping>(InMapping1);
        this.BackupKey1 = InMapping1.GetCurrentKey();
        return;
    }
    void ApplyRevert()
    {
        FVM_PlayerKeyMapping& local_2;
        if (local_2)
        {
            FVM_PlayerKeyMapping& local_8;
            if (this.ModificationNum == 0)
            {
                ++this.ModificationNum;
            }
            else
            {
                --this.ModificationNum;
            }
            local_2.SetCurrentKey(this.BackupKey0);
            this.KeyMapping0.Reset();
            if (local_8)
            {
                local_8.SetCurrentKey(this.BackupKey1);
                this.KeyMapping1.Reset();
            }
        }
        return;
    }
    void PostReset()
    {
        ++this.ModificationNum;
        this.KeyMapping0.Reset();
        return;
    }
    void Revert()
    {
        this.ModificationNum = 0;
        this.KeyMapping0.Reset();
        return;
    }
    bool CanRevert() const
    {
        return this.KeyMapping0;
    }
    bool AnyModification() const
    {
        return (this.ModificationNum > 0);
    }
}

struct FPlayerKeyMappingsConfig
{
    UPROPERTY()
    FText InvalidKeyError;
    UPROPERTY()
    FText CanNotSwitchKeyError;
    UPROPERTY()
    FText CanNotEmptyError;
    UPROPERTY()
    FText SwitchKeyTitle;

    FPlayerKeyMappingsConfig()
    {
        return;
    }
}

struct FVMS_PlayerKeyMappings : FEUIViewModelSingleton
{
    FEUIViewModelSingleton _base_FEUIViewModelSingleton;
    UPROPERTY()
    FPlayerKeyMappingsConfig m_Config;
    UPROPERTY()
    FGameUserKeyMappingCollection m_KeyMappingCollection;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_PlayerKeyMappingPair>> m_KeyboardMouseKeys;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_PlayerKeyMappingPair>> m_GamepadKeys;
    UPROPERTY()
    TArray<FEUIModelRef> m_KeyboardMouseItems;
    UPROPERTY()
    TArray<FEUIModelRef> m_GamepadItems;
    UPROPERTY()
    bool m_bShouldSave;
    UPROPERTY()
    TEUIModelRef<FVM_PlayerKeyMapping> m_SelectingKey;
    UPROPERTY()
    TEUIModelRef<FVM_PlayerKeyMappingPair> m_SelectingKeyPair;
    UPROPERTY()
    int m_SettingCategoryIndex;
    UPROPERTY()
    FPlayerKeyMappingModification m_KeyboardMouseModification;
    UPROPERTY()
    FPlayerKeyMappingModification m_GamepadModification;
    UPROPERTY()
    bool m_bShowInvalidKeyError;
    UPROPERTY()
    bool m_bCanRevert;
    UPROPERTY()
    bool m_bIsKeySelecting;
    UPROPERTY()
    TEUIModelRef<FVM_PlayerKeyMapping> m_PendingSwitchKey0;
    UPROPERTY()
    TEUIModelRef<FVM_PlayerKeyMapping> m_PendingSwitchKey1;
    UPROPERTY()
    FGameUserKeyMapping m_Dummy;

    FVMS_PlayerKeyMappings()
    {
        this.m_SettingCategoryIndex = 0;
        this.m_bShouldSave = true;
        this.m_bShowInvalidKeyError = false;
        this.m_bCanRevert = false;
        this.m_bIsKeySelecting = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVMS_PlayerKeyMappings(const FVMS_PlayerKeyMappings &inout Other)
    {
        this.m_SettingCategoryIndex = 0;
        this.m_bShouldSave = true;
        this.m_bShowInvalidKeyError = false;
        this.m_bCanRevert = false;
        this.m_bIsKeySelecting = false;
        this.m_KeyMappingCollection = Other.m_KeyMappingCollection;
        this.m_KeyboardMouseKeys = Other.m_KeyboardMouseKeys;
        this.m_GamepadKeys = Other.m_GamepadKeys;
        this.m_KeyboardMouseItems = Other.m_KeyboardMouseItems;
        this.m_GamepadItems = Other.m_GamepadItems;
        this.m_bShouldSave = Other.m_bShouldSave;
        this.m_SelectingKey = Other.m_SelectingKey;
        this.m_SelectingKeyPair = Other.m_SelectingKeyPair;
        this.m_SettingCategoryIndex = int(Other.m_SettingCategoryIndex);
        this.m_bShowInvalidKeyError = Other.m_bShowInvalidKeyError;
        this.m_bCanRevert = Other.m_bCanRevert;
        this.m_bIsKeySelecting = Other.m_bIsKeySelecting;
        this.m_PendingSwitchKey0 = Other.m_PendingSwitchKey0;
        this.m_PendingSwitchKey1 = Other.m_PendingSwitchKey1;
        this.m_Dummy = Other.m_Dummy;
        return;
    }
    FVMS_PlayerKeyMappings& opAssign(const FVMS_PlayerKeyMappings &inout Other)
    {
        this.m_KeyMappingCollection = Other.m_KeyMappingCollection;
        this.m_KeyboardMouseKeys = Other.m_KeyboardMouseKeys;
        this.m_GamepadKeys = Other.m_GamepadKeys;
        this.m_KeyboardMouseItems = Other.m_KeyboardMouseItems;
        this.m_GamepadItems = Other.m_GamepadItems;
        this.m_bShouldSave = Other.m_bShouldSave;
        this.m_SelectingKey = Other.m_SelectingKey;
        this.m_SelectingKeyPair = Other.m_SelectingKeyPair;
        this.m_SettingCategoryIndex = int(Other.m_SettingCategoryIndex);
        this.m_bShowInvalidKeyError = Other.m_bShowInvalidKeyError;
        this.m_bCanRevert = Other.m_bCanRevert;
        this.m_bIsKeySelecting = Other.m_bIsKeySelecting;
        this.m_PendingSwitchKey0 = Other.m_PendingSwitchKey0;
        this.m_PendingSwitchKey1 = Other.m_PendingSwitchKey1;
        return Other.m_Dummy;
    }
    void LoadConfigDefault(const FVMS_PlayerKeyMappingsConfigDefault &inout InConfig)
    {
        this.SetConfig(InConfig.Config);
        return;
    }
    FKey GetDefaultKey(const EGameUseKeyCategory Category, const int Index) const
    {
        return this.GetMapping(EGameUseKeyCategory(Category), Index).DefaultKey;
    }
    void BeforeKeyModify(const FVM_PlayerKeyMapping &inout KeyMapping)
    {
        if ((int(KeyMapping.GetCategory())) == 3)
        {
            this.GetModify_GamepadModification().Backup(KeyMapping);
            return;
        }
        this.GetModify_KeyboardMouseModification().Backup(KeyMapping);
        return;
    }
    void ExitKeySelecting()
    {
        this.SetSelectingKey(TEUIModelRef<FVM_PlayerKeyMapping>(nullptr));
        if (this.GetSelectingKeyPair().IsValid())
        {
            this.GetSelectingKeyPair().opArrow().OnKeySelecting0(false);
        }
        if (this.GetSelectingKeyPair().IsValid())
        {
            this.GetSelectingKeyPair().opArrow().OnKeySelecting1(false);
        }
        return;
    }
    bool IsEdittingKeyboardMouse() const
    {
        return (this.GetSettingCategoryIndex() == 0);
    }
    TEUIModelRef<FVM_PlayerKeyMapping> FindInUsingKeyMapping(const FKey &inout Key, const FKey &inout ChordKey, const EGameUseKeyCategory Category) const
    {
        if (int(Category) == 3)
        {
            return this.FindInUsingKeyMapping(Key, ChordKey, this.GetGamepadKeys());
        }
        return this.FindInUsingKeyMapping(Key, ChordKey, this.GetKeyboardMouseKeys());
    }
    void ShowCanNotSwitchKeyPopup(const TEUIModelRef<FVM_PlayerKeyMapping> &inout SwitchTarget)
    {
        FText local_80 = FText::Format(this.GetConfig().CanNotSwitchKeyError, (TDataObjectPtr<FGameUserMappableInputAction>(this.GetMapping(EGameUseKeyCategory(SwitchTarget.opArrow().GetCategory()), SwitchTarget.opArrow().GetIndex()).InputAction)).opArrow().Action.ActionDescription);
        if (this.GetSelectingKey().IsValid())
        {
            this.GetSelectingKey().opArrow().GetModify_CurrentKey();
        }
        UCommonPopupSettings local_92 = ::CommonPopupSettings::Get();
        FEUIInputAction local_98;
        if (local_92.CommonDialogAction.Find(ECommonDialogAnswerType(1), local_98))
        {
            TArray<FCommonDialogOption> local_104;
            local_104.Add(FCommonDialogOption(ECommonDialogAnswerType(1), local_98, FText()));
            FDialogCallback local_148;
            FCommonDialogParam local_150;
            ::CommonPopup_Internal::OpenDialogForLocalPlayer(this.GetContext().UELocalPlayer, FText(), local_80, local_104, local_148, local_150);
        }
        return;
    }
    void ShowSwitchKeyPopup(const TEUIModelRef<FVM_PlayerKeyMapping> &inout KeyA, const TEUIModelRef<FVM_PlayerKeyMapping> &inout KeyB)
    {
        this.SetPendingSwitchKey0(KeyA);
        this.SetPendingSwitchKey1(KeyB);
        FText local_80 = FText::Format(this.GetConfig().SwitchKeyTitle, (TDataObjectPtr<FGameUserMappableInputAction>(this.GetMapping(EGameUseKeyCategory(KeyB.opArrow().GetCategory()), KeyB.opArrow().GetIndex()).InputAction)).opArrow().Action.ActionDescription);
        FDialogModelCallback local_110;
        local_110.Bind(this, FVMS_PlayerKeyMappings::HandleSwitchKey);
        UCommonPopupSettings local_114 = ::CommonPopupSettings::Get();
        FEUIInputAction local_120;
        FEUIInputAction local_126;
        if (!(!(local_114.CommonDialogAction.Find(ECommonDialogAnswerType(1), local_120))) && local_114.CommonDialogAction.Find(ECommonDialogAnswerType(2), local_126))
        {
            TArray<FCommonDialogOption> local_134;
            local_134.Add(FCommonDialogOption(ECommonDialogAnswerType(2), local_126, FText()));
            local_134.Add(FCommonDialogOption(ECommonDialogAnswerType(1), local_120, FText()));
            FCommonDialogParam local_148;
            ::CommonPopup_Internal::OpenDialogForLocalPlayer(this.GetContext().UELocalPlayer, NSLOCTEXT("PlayerSettings", "SwitchKeyTitle", "й”®дЅЌдє’жЌў"), local_80, local_134, FDialogCallback(local_110), local_148);
        }
        if (this.GetSelectingKey().IsValid())
        {
            this.GetSelectingKey().opArrow().GetModify_CurrentKey();
        }
        return;
    }
    bool HasAnyModification() const
    {
        return this.GetKeyboardMouseModification().AnyModification() || this.GetGamepadModification().AnyModification();
    }
    void Revert()
    {
        this.GetModify_KeyboardMouseModification().Revert();
        this.GetModify_GamepadModification().Revert();
        this.SetbShouldSave(false);
        this.SetbCanRevert(false);
        return;
    }
    bool CanSave() const
    {
        bool local_6;
        if (this.GetSelectingKey())
        {
            return false;
        }
        if (this.IsEdittingKeyboardMouse())
        {
            local_6 = this.GetKeyboardMouseModification().AnyModification();
        }
        else
        {
            local_6 = this.GetGamepadModification().AnyModification();
        }
        return local_6;
    }
    bool CanRevert() const
    {
        bool local_5;
        if (this.GetSelectingKey())
        {
            return false;
        }
        if (this.IsEdittingKeyboardMouse())
        {
            local_5 = this.GetKeyboardMouseModification().CanRevert();
        }
        else
        {
            local_5 = false;
        }
        return local_5;
    }
    bool ShowDeleteKey() const
    {
        return this.GetSelectingKey() && this.GetSelectingKey().opArrow().GetCurrentKey().IsValid();
    }
    bool ShowResetKey() const
    {
        return !(this.GetSelectingKey());
    }
    bool ShowExitSelectingKey() const
    {
        return this.GetSelectingKey();
    }
    void ShowInvalidKeyError()
    {
        if (this.GetbShowInvalidKeyError())
        {
            FCommonTipsParam local_6;
            ::CommonPopup_Internal::OpenTipsWithoutECSWorld(this.GetContext().UELocalPlayer, this.GetConfig().InvalidKeyError, local_6, ECommonTipsType(1), FEUIModelContainer());
            this.SetbShowInvalidKeyError(false);
        }
        return;
    }
    void OnEntrySelected(const int Index)
    {
        this.SetSettingCategoryIndex(Index);
        return;
    }
    void ResetKeyWithoutSave()
    {
        if (this.IsEdittingKeyboardMouse())
        {
            this.ResetAllKeys(this.GetKeyboardMouseKeys());
            this.GetModify_KeyboardMouseModification().PostReset();
            return;
        }
        this.ResetAllKeys(this.GetGamepadKeys());
        this.GetModify_GamepadModification().PostReset();
        return;
    }
    void ResetKeys()
    {
        if (this.IsEdittingKeyboardMouse())
        {
            this.ResetAllKeys(this.GetKeyboardMouseKeys());
            this.GetModify_KeyboardMouseModification().PostReset();
            this.SaveKeySettings();
            return;
        }
        this.ResetAllKeys(this.GetGamepadKeys());
        this.GetModify_GamepadModification().PostReset();
        this.SaveKeySettings();
        return;
    }
    void RefreshCanRevert()
    {
        this.SetbCanRevert(this.CanRevert());
        return;
    }
    void RevertKey()
    {
        if (this.IsEdittingKeyboardMouse())
        {
            this.GetModify_KeyboardMouseModification().ApplyRevert();
        }
        else
        {
            this.GetModify_GamepadModification().ApplyRevert();
        }
        this.RefreshCanRevert();
        return;
    }
    void SaveKeySettings()
    {
        if (this.IsEdittingKeyboardMouse())
        {
            this.SaveSettings(true, false);
            for (auto& local_16 : this.GetKeyboardMouseKeys())
            {
                TEUIModelRef<FVM_PlayerKeyMapping> local_18 = local_16.opArrow().GetMapping0();
                0.SetbHasChanged();
                bool local_1 = false;
                TEUIModelRef<FVM_PlayerKeyMapping> local_18_2 = local_16.opArrow().GetMapping1();
                local_1.SetbHasChanged();
            }
            return;
        }
        this.SaveSettings(false, true);
        for (auto& local_16 : this.GetGamepadKeys())
        {
            int local_2_2 = 0;
            TEUIModelRef<FVM_PlayerKeyMapping> local_18_3 = local_16.opArrow().GetMapping0();
            local_2_2.SetbHasChanged();
        }
        return;
    }
    bool HandleSwitchKey(const FCommonDialogAnswer &inout Answer)
    {
        if (int(Answer.AnswerType) == 1)
        {
            if (int(this.GetPendingSwitchKey0().opArrow().GetCategory()) == 3)
            {
                TEUIModelRef<FVM_PlayerKeyMapping> local_6 = this.GetPendingSwitchKey1();
                TEUIModelRef<FVM_PlayerKeyMapping> local_10 = this.GetPendingSwitchKey0();
                this.GetModify_GamepadModification().BackupSwitch();
            }
            else
            {
                TEUIModelRef<FVM_PlayerKeyMapping> local_6_2 = this.GetPendingSwitchKey1();
                TEUIModelRef<FVM_PlayerKeyMapping> local_10_2 = this.GetPendingSwitchKey0();
                this.GetModify_KeyboardMouseModification().BackupSwitch();
            }
            FKey local_16 = FKey(this.GetPendingSwitchKey0().opArrow().GetCurrentKey());
            this.GetPendingSwitchKey0().opArrow().SetCurrentKey(this.GetPendingSwitchKey1().opArrow().GetCurrentKey());
            this.GetPendingSwitchKey1().opArrow().SetCurrentKey(local_16);
            this.GetPendingSwitchKey0().opArrow().SetbHasChanged(true);
            this.GetPendingSwitchKey1().opArrow().SetbHasChanged(true);
            this.GetPendingSwitchKey0().opArrow().SetbNeedRefreshHover(!(this.GetPendingSwitchKey0().opArrow().GetbNeedRefreshHover()));
            this.GetPendingSwitchKey1().opArrow().SetbNeedRefreshHover(!(this.GetPendingSwitchKey1().opArrow().GetbNeedRefreshHover()));
        }
        this.SetPendingSwitchKey0(TEUIModelRef<FVM_PlayerKeyMapping>(nullptr));
        this.SetPendingSwitchKey1(TEUIModelRef<FVM_PlayerKeyMapping>(nullptr));
        return true;
    }
    void PostConstruct()
    {
        UGameInputLocalPlayerSubsystem local_4 = UGameInputLocalPlayerSubsystem::Get(this.GetContext().UELocalPlayer);
        if (local_4 != nullptr)
        {
            FGameUserKeyMappingCollection& local_8 = this.GetModify_KeyMappingCollection();
            local_4.CollectUserKeyMappings(local_8);
            if (local_8.MouseMappings.Num() == local_8.KeyboardMappings.Num())
            {
                this.InitKeys(this.GetModify_KeyboardMouseKeys(), this.GetModify_KeyboardMouseItems(), EGameUseKeyCategory(1), local_8.KeyboardMappings, EGameUseKeyCategory(2), local_8.MouseMappings);
                this.InitKeys(this.GetModify_GamepadKeys(), this.GetModify_GamepadItems(), EGameUseKeyCategory(3), local_8.GamepadMappings, EGameUseKeyCategory(0), TArray<FGameUserKeyMapping>());
            }
        }
        return;
    }
    void BeginDestroy()
    {
        if (this.GetbShouldSave())
        {
            this.SaveSettings(true, true);
        }
        return;
    }
    void InitKeys(TArray<TEUIModelRef<FVM_PlayerKeyMappingPair>> &inout ResultKeys, TArray<FEUIModelRef> &inout KeyItems, const EGameUseKeyCategory KeyCategory0, const TArray<FGameUserKeyMapping> &inout Key0, const EGameUseKeyCategory KeyCategory1 = EGameUseKeyCategory::Invalid, const TArray<FGameUserKeyMapping> &inout Key1 = TArray<FGameUserKeyMapping>())
    {
        FEUIInputAction local_112;
        TEUIModelRef<FVM_PlayerKeyMapping> local_106;
        TDataObjectPtr<FGameUserMappableInputActionCategory> local_24;
        int local_28 = FMath::Max(Key0.Num(), Key1.Num());
        int local_29 = 0;
        for (; local_29 < local_28; )
        {
            TDataObjectPtr<FGameUserMappableInputAction> local_54 = TDataObjectPtr<FGameUserMappableInputAction>(Key0[local_29].InputAction);
            FVM_PlayerKeyMappingPair& local_104 = ::FVM_PlayerKeyMappingPair::Create(this.GetContext().Manager);
            local_104.SetActionName(local_54.opArrow().Action.ActionDescription);
            if (Key0.IsValidIndex(local_29))
            {
                local_104.SetMapping0(local_106);
                local_106 = local_104.GetMapping0();
                local_112.SetInputAction();
            }
            if (Key1.IsValidIndex(local_29))
            {
                local_104.SetMapping1(local_106);
                TDataObjectPtr<FGameUserMappableInputAction> local_136 = TDataObjectPtr<FGameUserMappableInputAction>(Key1[local_29].InputAction);
                local_106 = local_104.GetMapping1();
                local_112.SetInputAction();
            }
            ResultKeys.Add(TEUIModelRef<FVM_PlayerKeyMappingPair>(local_104));
            KeyItems.Add(FEUIModelRef(local_104));
            ++local_29;
        }
        return;
    }
    void SaveSettings(const bool bSaveKeyboardMouse = true, const bool bSaveGamepad = true)
    {
        int local_28 = 0;
        int local_30 = 0;
        UGameInputLocalPlayerSubsystem local_4 = UGameInputLocalPlayerSubsystem::Get(this.GetContext().UELocalPlayer);
        if (local_4 != nullptr)
        {
            FGameUserKeyMappingCollection& local_8 = this.GetModify_KeyMappingCollection();
            if (bSaveKeyboardMouse)
            {
                this.GetModify_KeyboardMouseModification().ModificationNum = 0;
                for (auto& local_24 : this.GetKeyboardMouseKeys())
                {
                    TEUIModelRef<FVM_PlayerKeyMapping> local_26 = local_24.opArrow().GetMapping0();
                    TEUIModelRef<FVM_PlayerKeyMapping> local_26_2 = local_24.opArrow().GetMapping1();
                    local_28.FlushSettings(local_8.KeyboardMappings[local_28.GetIndex()]);
                    local_30.FlushSettings(local_8.MouseMappings[local_30.GetIndex()]);
                }
            }
            if (bSaveGamepad)
            {
                this.GetModify_GamepadModification().ModificationNum = 0;
                for (auto& local_24 : this.GetGamepadKeys())
                {
                    TEUIModelRef<FVM_PlayerKeyMapping> local_26_3 = local_24.opArrow().GetMapping0();
                    local_28.FlushSettings(local_8.GamepadMappings[local_28.GetIndex()]);
                }
            }
            local_4.SaveUserKeyMappings(local_8);
        }
        return;
    }
    const FGameUserKeyMapping GetMapping(const EGameUseKeyCategory Category, const int Index) const
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
        const FGameUserKeyMapping __r; return __r;
    }
    void ResetAllKeys(const TArray<TEUIModelRef<FVM_PlayerKeyMappingPair>> &inout Keys) const
    {
        FVM_PlayerKeyMapping& local_18;
        for (auto& local_16 : Keys)
        {
            TEUIModelRef<FVM_PlayerKeyMapping> local_20 = local_16.opArrow().GetMapping0();
            if (local_18)
            {
                local_18.SetCurrentKey(this.GetDefaultKey(local_18.GetCategory(), local_18.GetIndex()));
                local_18.SetbNeedRefreshHover(!(local_18.GetbNeedRefreshHover()));
            }
            TEUIModelRef<FVM_PlayerKeyMapping> local_20_2 = local_16.opArrow().GetMapping1();
            if (local_18)
            {
                local_18.SetCurrentKey(this.GetDefaultKey(local_18.GetCategory(), local_18.GetIndex()));
                local_18.SetbNeedRefreshHover(!(local_18.GetbNeedRefreshHover()));
            }
        }
        return;
    }
    TEUIModelRef<FVM_PlayerKeyMapping> FindInUsingKeyMapping(const FKey &inout Key, const FKey &inout ChordKey, const TArray<TEUIModelRef<FVM_PlayerKeyMappingPair>> &inout Keys) const
    {
        FVM_PlayerKeyMapping& local_18;
        if (Key.IsValid())
        {
            for (auto& local_16 : Keys)
            {
                TEUIModelRef<FVM_PlayerKeyMapping> local_20 = local_16.opArrow().GetMapping0();
                if (local_18)
                {
                    if ((FKey(local_18.GetCurrentKey()) == Key) && (FKey(local_18.GetChordKey()) == ChordKey))
                    {
                        return (TEUIModelRef<FVM_PlayerKeyMapping>(local_18));
                    }
                }
                TEUIModelRef<FVM_PlayerKeyMapping> local_30 = local_16.opArrow().GetMapping1();
                if (local_18)
                {
                    if ((FKey(local_18.GetCurrentKey()) == Key))
                    {
                        return (TEUIModelRef<FVM_PlayerKeyMapping>(local_18));
                    }
                }
            }
        }
        return TEUIModelRef<FVM_PlayerKeyMapping>();
    }
    FPlayerKeyMappingsConfig GetConfig() const property
    {
        FPlayerKeyMappingsConfig __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    FPlayerKeyMappingsConfig GetModify_Config() property
    {
        FPlayerKeyMappingsConfig __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetConfig(const FPlayerKeyMappingsConfig &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        return;
    }
    const FGameUserKeyMappingCollection GetKeyMappingCollection() const property
    {
        const FGameUserKeyMappingCollection __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    FGameUserKeyMappingCollection GetModify_KeyMappingCollection() property
    {
        FGameUserKeyMappingCollection __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetKeyMappingCollection(const FGameUserKeyMappingCollection &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_KeyMappingCollection = __Value;
        return;
    }
    const TArray<TEUIModelRef<FVM_PlayerKeyMappingPair>> GetKeyboardMouseKeys() const property
    {
        const TArray<TEUIModelRef<FVM_PlayerKeyMappingPair>> __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    TArray<TEUIModelRef<FVM_PlayerKeyMappingPair>> GetModify_KeyboardMouseKeys() property
    {
        TArray<TEUIModelRef<FVM_PlayerKeyMappingPair>> __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetKeyboardMouseKeys(const TArray<TEUIModelRef<FVM_PlayerKeyMappingPair>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_KeyboardMouseKeys = __Value;
        return;
    }
    const TArray<TEUIModelRef<FVM_PlayerKeyMappingPair>> GetGamepadKeys() const property
    {
        const TArray<TEUIModelRef<FVM_PlayerKeyMappingPair>> __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    TArray<TEUIModelRef<FVM_PlayerKeyMappingPair>> GetModify_GamepadKeys() property
    {
        TArray<TEUIModelRef<FVM_PlayerKeyMappingPair>> __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetGamepadKeys(const TArray<TEUIModelRef<FVM_PlayerKeyMappingPair>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_GamepadKeys = __Value;
        return;
    }
    const TArray<FEUIModelRef> GetKeyboardMouseItems() const property
    {
        const TArray<FEUIModelRef> __r;
        this.TrackPropertyRead(4);
        return __r;
    }
    TArray<FEUIModelRef> GetModify_KeyboardMouseItems() property
    {
        TArray<FEUIModelRef> __r;
        this.MarkPropertyDirty(4);
        return __r;
    }
    void SetKeyboardMouseItems(const TArray<FEUIModelRef> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_KeyboardMouseItems = __Value;
        return;
    }
    const TArray<FEUIModelRef> GetGamepadItems() const property
    {
        const TArray<FEUIModelRef> __r;
        this.TrackPropertyRead(5);
        return __r;
    }
    TArray<FEUIModelRef> GetModify_GamepadItems() property
    {
        TArray<FEUIModelRef> __r;
        this.MarkPropertyDirty(5);
        return __r;
    }
    void SetGamepadItems(const TArray<FEUIModelRef> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_GamepadItems = __Value;
        return;
    }
    bool GetbShouldSave() const property
    {
        this.TrackPropertyRead(6);
        return this.m_bShouldSave;
    }
    void SetbShouldSave(const bool __Value) property
    {
        if (!(this.m_bShouldSave) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_bShouldSave = __Value;
        return;
    }
    TEUIModelRef<FVM_PlayerKeyMapping> GetSelectingKey() const property
    {
        this.TrackPropertyRead(7);
        return this.m_SelectingKey;
    }
    void SetSelectingKey(const TEUIModelRef<FVM_PlayerKeyMapping> &inout __Value) property
    {
        TEUIModelRef<FVM_PlayerKeyMapping> local_2;
        local_2 = this.m_SelectingKey;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(7);
        this.m_SelectingKey = __Value;
        return;
    }
    TEUIModelRef<FVM_PlayerKeyMappingPair> GetSelectingKeyPair() const property
    {
        this.TrackPropertyRead(8);
        return this.m_SelectingKeyPair;
    }
    void SetSelectingKeyPair(const TEUIModelRef<FVM_PlayerKeyMappingPair> &inout __Value) property
    {
        TEUIModelRef<FVM_PlayerKeyMappingPair> local_2;
        local_2 = this.m_SelectingKeyPair;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(8);
        this.m_SelectingKeyPair = __Value;
        return;
    }
    int GetSettingCategoryIndex() const property
    {
        this.TrackPropertyRead(9);
        return this.m_SettingCategoryIndex;
    }
    void SetSettingCategoryIndex(const int __Value) property
    {
        if (this.m_SettingCategoryIndex == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(9);
        this.m_SettingCategoryIndex = __Value;
        return;
    }
    const FPlayerKeyMappingModification GetKeyboardMouseModification() const property
    {
        const FPlayerKeyMappingModification __r;
        this.TrackPropertyRead(10);
        return __r;
    }
    FPlayerKeyMappingModification GetModify_KeyboardMouseModification() property
    {
        FPlayerKeyMappingModification __r;
        this.MarkPropertyDirty(10);
        return __r;
    }
    void SetKeyboardMouseModification(const FPlayerKeyMappingModification &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(10);
        return;
    }
    const FPlayerKeyMappingModification GetGamepadModification() const property
    {
        const FPlayerKeyMappingModification __r;
        this.TrackPropertyRead(11);
        return __r;
    }
    FPlayerKeyMappingModification GetModify_GamepadModification() property
    {
        FPlayerKeyMappingModification __r;
        this.MarkPropertyDirty(11);
        return __r;
    }
    void SetGamepadModification(const FPlayerKeyMappingModification &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(11);
        return;
    }
    bool GetbShowInvalidKeyError() const property
    {
        this.TrackPropertyRead(12);
        return this.m_bShowInvalidKeyError;
    }
    void SetbShowInvalidKeyError(const bool __Value) property
    {
        if (!(this.m_bShowInvalidKeyError) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(12);
        this.m_bShowInvalidKeyError = __Value;
        return;
    }
    bool GetbCanRevert() const property
    {
        this.TrackPropertyRead(13);
        return this.m_bCanRevert;
    }
    void SetbCanRevert(const bool __Value) property
    {
        if (!(this.m_bCanRevert) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(13);
        this.m_bCanRevert = __Value;
        return;
    }
    bool GetbIsKeySelecting() const property
    {
        this.TrackPropertyRead(14);
        return this.m_bIsKeySelecting;
    }
    void SetbIsKeySelecting(const bool __Value) property
    {
        if (!(this.m_bIsKeySelecting) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(14);
        this.m_bIsKeySelecting = __Value;
        return;
    }
    TEUIModelRef<FVM_PlayerKeyMapping> GetPendingSwitchKey0() const property
    {
        this.TrackPropertyRead(15);
        return this.m_PendingSwitchKey0;
    }
    void SetPendingSwitchKey0(const TEUIModelRef<FVM_PlayerKeyMapping> &inout __Value) property
    {
        TEUIModelRef<FVM_PlayerKeyMapping> local_2;
        local_2 = this.m_PendingSwitchKey0;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(15);
        this.m_PendingSwitchKey0 = __Value;
        return;
    }
    TEUIModelRef<FVM_PlayerKeyMapping> GetPendingSwitchKey1() const property
    {
        this.TrackPropertyRead(16);
        return this.m_PendingSwitchKey1;
    }
    void SetPendingSwitchKey1(const TEUIModelRef<FVM_PlayerKeyMapping> &inout __Value) property
    {
        TEUIModelRef<FVM_PlayerKeyMapping> local_2;
        local_2 = this.m_PendingSwitchKey1;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(16);
        this.m_PendingSwitchKey1 = __Value;
        return;
    }
    const FGameUserKeyMapping GetDummy() const property
    {
        const FGameUserKeyMapping __r;
        this.TrackPropertyRead(17);
        return __r;
    }
    FGameUserKeyMapping GetModify_Dummy() property
    {
        FGameUserKeyMapping __r;
        this.MarkPropertyDirty(17);
        return __r;
    }
    void SetDummy(const FGameUserKeyMapping &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(17);
        this.m_Dummy = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_PlayerKeyMapping
{
    UPROPERTY()
    ESlateVisibility KeyConfigurableVisibility;
    UPROPERTY()
    EEUIInputType InputType;
    UPROPERTY()
    TEUIModelRef<FVM_PlayerKeyMapping> Self;


}

struct __GeneratedProperties_FVM_PlayerMappableKey
{
    UPROPERTY()
    FSlateBrush KeyIcon;
    UPROPERTY()
    TEUIModelRef<FVM_PlayerMappableKey> Self;

    __GeneratedProperties_FVM_PlayerMappableKey()
    {
        return;
    }
}

struct __GeneratedProperties_FVM_PlayerKeyMappingPair
{
    UPROPERTY()
    FKey Key0;
    UPROPERTY()
    FKey Key1;
    UPROPERTY()
    bool KeyEnabled0;
    UPROPERTY()
    bool KeyEnabled1;
    UPROPERTY()
    bool KeyDisabled0;
    UPROPERTY()
    bool KeyDisabled1;
    UPROPERTY()
    ESlateVisibility KeyConfigurableVisibility0;
    UPROPERTY()
    ESlateVisibility KeyConfigurableVisibility1;
    UPROPERTY()
    bool KeyModified0;
    UPROPERTY()
    bool KeyModified1;
    UPROPERTY()
    bool AnyKeyModified;
    UPROPERTY()
    FKey ChordKey0;
    UPROPERTY()
    FKey ChordKey1;
    UPROPERTY()
    TEUIModelRef<FVM_PlayerKeyMappingPair> Self;


}

struct __GeneratedProperties_FVMS_PlayerKeyMappings
{
    UPROPERTY()
    bool CanSave;
    UPROPERTY()
    bool CanRevert;
    UPROPERTY()
    bool ShowDeleteKey;
    UPROPERTY()
    bool ShowResetKey;
    UPROPERTY()
    bool ShowExitSelectingKey;
    UPROPERTY()
    TEUIModelRef<FVMS_PlayerKeyMappings> Self;


}

namespace FVM_PlayerKeyMapping
{
FVM_PlayerKeyMapping Create(const UObject ContextObject, const int Index, const EGameUseKeyCategory Category, const FGameUserKeyMapping &inout UserKeyMapping)
{
    // body not fully recovered вЂ” stub [argmismatch:argtype]
    FVM_PlayerKeyMapping __r; return __r;
}
FVM_PlayerKeyMapping CreateByManager(const UEUIManagerSubsystem Manager, const int Index, const EGameUseKeyCategory Category, const FGameUserKeyMapping &inout UserKeyMapping)
{
    FVM_PlayerKeyMapping __r;
    TEUIModelRef<FVM_PlayerKeyMapping> local_6 = TEUIModelRef<FVM_PlayerKeyMapping>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_PlayerKeyMapping::ModelId, 0, Index, Category, UserKeyMapping));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "InputAction";
    local_14.TypeName = "FEUIInputAction";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bConfigurable";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bHasChanged";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bNeedRefreshHover";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CurrentKey";
    local_14.TypeName = "FKey";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "DefaultKey";
    local_14.TypeName = "FKey";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ChordKey";
    local_14.TypeName = "FKey";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "KeyConfigurableVisibility";
    local_14.TypeName = "ESlateVisibility";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "InputType";
    local_14.TypeName = "EEUIInputType";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_PlayerKeyMapping>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_PlayerKeyMapping;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_PlayerKeyMapping;
}
FEUIInputAction __UIGetter_InputAction(const FVM_PlayerKeyMapping &inout Model)
{
    return Model.GetInputAction();
}
bool __UIGetter_bConfigurable(const FVM_PlayerKeyMapping &inout Model)
{
    return Model.GetbConfigurable();
}
bool __UIGetter_bHasChanged(const FVM_PlayerKeyMapping &inout Model)
{
    return Model.GetbHasChanged();
}
bool __UIGetter_bNeedRefreshHover(const FVM_PlayerKeyMapping &inout Model)
{
    return Model.GetbNeedRefreshHover();
}
FKey __UIGetter_CurrentKey(const FVM_PlayerKeyMapping &inout Model)
{
    return Model.GetCurrentKey();
}
FKey __UIGetter_DefaultKey(const FVM_PlayerKeyMapping &inout Model)
{
    return Model.GetDefaultKey();
}
FKey __UIGetter_ChordKey(const FVM_PlayerKeyMapping &inout Model)
{
    return Model.GetChordKey();
}
ESlateVisibility __UIGetter_KeyConfigurableVisibility(const FVM_PlayerKeyMapping &inout Model)
{
    return Model.GetKeyConfigurableVisibility();
}
EEUIInputType __UIGetter_InputType(const FVM_PlayerKeyMapping &inout Model)
{
    return Model.GetInputType();
}
TEUIModelRef<FVM_PlayerKeyMapping> __UIGetter_Self(const FVM_PlayerKeyMapping &inout Model)
{
    return TEUIModelRef<FVM_PlayerKeyMapping>(Model);
}
int __IndexOf_Index()
{
    return 0;
}
int __IndexOf_Category()
{
    return 1;
}
int __IndexOf_InputAction()
{
    return 2;
}
int __IndexOf_bConfigurable()
{
    return 3;
}
int __IndexOf_bHasChanged()
{
    return 4;
}
int __IndexOf_bNeedRefreshHover()
{
    return 5;
}
int __IndexOf_CurrentKey()
{
    return 6;
}
int __IndexOf_DefaultKey()
{
    return 7;
}
int __IndexOf_ChordKey()
{
    return 8;
}
}
namespace __GeneratedProperties_FVM_PlayerKeyMapping
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
namespace FVM_PlayerMappableKey
{
FVM_PlayerMappableKey& Create(const UObject ContextObject, const FKey &inout Key, const EEUIInputType InputType)
{
    return FVM_PlayerMappableKey::CreateByManager(EUIInternal::GetContextManager(ContextObject), Key);
}
FVM_PlayerMappableKey CreateByManager(const UEUIManagerSubsystem Manager, const FKey &inout Key, const EEUIInputType InputType)
{
    FVM_PlayerMappableKey __r;
    TEUIModelRef<FVM_PlayerMappableKey> local_6 = TEUIModelRef<FVM_PlayerMappableKey>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_PlayerMappableKey::ModelId, 0, Key, InputType));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "Key";
    local_14.TypeName = "FKey";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "KeyIcon";
    local_14.TypeName = "FSlateBrush";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_PlayerMappableKey>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_PlayerMappableKey;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_PlayerMappableKey;
}
FKey __UIGetter_Key(const FVM_PlayerMappableKey &inout Model)
{
    return Model.GetKey();
}
FSlateBrush __UIGetter_KeyIcon(const FVM_PlayerMappableKey &inout Model)
{
    return Model.GetKeyIcon();
}
TEUIModelRef<FVM_PlayerMappableKey> __UIGetter_Self(const FVM_PlayerMappableKey &inout Model)
{
    return TEUIModelRef<FVM_PlayerMappableKey>(Model);
}
int __IndexOf_Key()
{
    return 0;
}
int __IndexOf_InputType()
{
    return 1;
}
int __IndexOf_OnSelect()
{
    return 2;
}
int __IndexOf_OwnerPage()
{
    return 3;
}
}
namespace __GeneratedProperties_FVM_PlayerMappableKey
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
namespace FVM_PlayerKeyMappingPair
{
FVM_PlayerKeyMappingPair& Create(const UObject ContextObject)
{
    return FVM_PlayerKeyMappingPair::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_PlayerKeyMappingPair CreateByManager(const UEUIManagerSubsystem Manager)
{
    FVM_PlayerKeyMappingPair __r;
    TEUIModelRef<FVM_PlayerKeyMappingPair> local_6 = TEUIModelRef<FVM_PlayerKeyMappingPair>(EUIInternal::MakeModelWithManager(Manager, FVM_PlayerKeyMappingPair::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    // body not fully recovered вЂ” stub [opcode-uncovered]
}
UScriptStruct GetModelStruct()
{
    return FVM_PlayerKeyMappingPair;
}
void __OnChordKeyChanged(FVM_PlayerKeyMappingPair &inout Model)
{
    Model.OnChordKeyChanged();
    return;
}
void __OnKeyChanged(FVM_PlayerKeyMappingPair &inout Model)
{
    Model.OnKeyChanged();
    return;
}
void __OnNeedRefreshHoverChanged(FVM_PlayerKeyMappingPair &inout Model)
{
    Model.OnNeedRefreshHoverChanged();
    return;
}
FText __UIGetter_ActionName(const FVM_PlayerKeyMappingPair &inout Model)
{
    return Model.GetActionName();
}
bool __UIGetter_bIsKeyMapping(const FVM_PlayerKeyMappingPair &inout Model)
{
    return Model.GetbIsKeyMapping();
}
bool __UIGetter_bIsGamepadSelector(const FVM_PlayerKeyMappingPair &inout Model)
{
    return Model.GetbIsGamepadSelector();
}
TEUIModelRef<FVM_PlayerKeyMapping> __UIGetter_Mapping0(const FVM_PlayerKeyMappingPair &inout Model)
{
    return Model.GetMapping0();
}
TEUIModelRef<FVM_PlayerKeyMapping> __UIGetter_Mapping1(const FVM_PlayerKeyMappingPair &inout Model)
{
    return Model.GetMapping1();
}
FGameplayTag __UIGetter_KeyboardTag(const FVM_PlayerKeyMappingPair &inout Model)
{
    return Model.GetKeyboardTag();
}
FGameplayTag __UIGetter_GamepadTag(const FVM_PlayerKeyMappingPair &inout Model)
{
    return Model.GetGamepadTag();
}
float32 __UIGetter_RenderOpacity0(const FVM_PlayerKeyMappingPair &inout Model)
{
    return Model.GetRenderOpacity0();
}
float32 __UIGetter_RenderOpacity1(const FVM_PlayerKeyMappingPair &inout Model)
{
    return Model.GetRenderOpacity1();
}
int __UIGetter_SwitchKeyIndex0(const FVM_PlayerKeyMappingPair &inout Model)
{
    return Model.GetSwitchKeyIndex0();
}
int __UIGetter_SwitchKeyIndex1(const FVM_PlayerKeyMappingPair &inout Model)
{
    return Model.GetSwitchKeyIndex1();
}
int __UIGetter_SwitchVisibleIndex0(const FVM_PlayerKeyMappingPair &inout Model)
{
    return Model.GetSwitchVisibleIndex0();
}
int __UIGetter_SwitchVisibleIndex1(const FVM_PlayerKeyMappingPair &inout Model)
{
    return Model.GetSwitchVisibleIndex1();
}
int __UIGetter_HoverIndex0(const FVM_PlayerKeyMappingPair &inout Model)
{
    return Model.GetHoverIndex0();
}
int __UIGetter_HoverIndex1(const FVM_PlayerKeyMappingPair &inout Model)
{
    return Model.GetHoverIndex1();
}
bool __UIGetter_bHasChanged(const FVM_PlayerKeyMappingPair &inout Model)
{
    return Model.GetbHasChanged();
}
bool __UIGetter_bNeedRefreshHover(const FVM_PlayerKeyMappingPair &inout Model)
{
    return Model.GetbNeedRefreshHover();
}
bool __UIGetter_bHasChordKey0(const FVM_PlayerKeyMappingPair &inout Model)
{
    return Model.GetbHasChordKey0();
}
bool __UIGetter_bHasChordKey1(const FVM_PlayerKeyMappingPair &inout Model)
{
    return Model.GetbHasChordKey1();
}
FKey __UIGetter_Key0(const FVM_PlayerKeyMappingPair &inout Model)
{
    return Model.GetKey0();
}
FKey __UIGetter_Key1(const FVM_PlayerKeyMappingPair &inout Model)
{
    return Model.GetKey1();
}
bool __UIGetter_KeyEnabled0(const FVM_PlayerKeyMappingPair &inout Model)
{
    return Model.GetKeyEnabled0();
}
bool __UIGetter_KeyEnabled1(const FVM_PlayerKeyMappingPair &inout Model)
{
    return Model.GetKeyEnabled1();
}
bool __UIGetter_KeyDisabled0(const FVM_PlayerKeyMappingPair &inout Model)
{
    return Model.GetKeyDisabled0();
}
bool __UIGetter_KeyDisabled1(const FVM_PlayerKeyMappingPair &inout Model)
{
    return Model.GetKeyDisabled1();
}
ESlateVisibility __UIGetter_KeyConfigurableVisibility0(const FVM_PlayerKeyMappingPair &inout Model)
{
    return Model.GetKeyConfigurableVisibility0();
}
ESlateVisibility __UIGetter_KeyConfigurableVisibility1(const FVM_PlayerKeyMappingPair &inout Model)
{
    return Model.GetKeyConfigurableVisibility1();
}
bool __UIGetter_KeyModified0(const FVM_PlayerKeyMappingPair &inout Model)
{
    return Model.GetKeyModified0();
}
bool __UIGetter_KeyModified1(const FVM_PlayerKeyMappingPair &inout Model)
{
    return Model.GetKeyModified1();
}
bool __UIGetter_AnyKeyModified(const FVM_PlayerKeyMappingPair &inout Model)
{
    return Model.GetAnyKeyModified();
}
FKey __UIGetter_ChordKey0(const FVM_PlayerKeyMappingPair &inout Model)
{
    return Model.GetChordKey0();
}
FKey __UIGetter_ChordKey1(const FVM_PlayerKeyMappingPair &inout Model)
{
    return Model.GetChordKey1();
}
TEUIModelRef<FVM_PlayerKeyMappingPair> __UIGetter_Self(const FVM_PlayerKeyMappingPair &inout Model)
{
    return TEUIModelRef<FVM_PlayerKeyMappingPair>(Model);
}
int __IndexOf_ActionName()
{
    return 0;
}
int __IndexOf_bIsKeyMapping()
{
    return 1;
}
int __IndexOf_bIsGamepadSelector()
{
    return 2;
}
int __IndexOf_Mapping0()
{
    return 3;
}
int __IndexOf_Mapping1()
{
    return 4;
}
int __IndexOf_KeyboardTag()
{
    return 5;
}
int __IndexOf_GamepadTag()
{
    return 6;
}
int __IndexOf_RenderOpacity0()
{
    return 7;
}
int __IndexOf_RenderOpacity1()
{
    return 8;
}
int __IndexOf_SwitchKeyIndex0()
{
    return 9;
}
int __IndexOf_SwitchKeyIndex1()
{
    return 10;
}
int __IndexOf_SwitchVisibleIndex0()
{
    return 11;
}
int __IndexOf_SwitchVisibleIndex1()
{
    return 12;
}
int __IndexOf_HoverIndex0()
{
    return 13;
}
int __IndexOf_HoverIndex1()
{
    return 14;
}
int __IndexOf_bHasChanged()
{
    return 15;
}
int __IndexOf_bNeedRefreshHover()
{
    return 16;
}
int __IndexOf_bIsKeySelecting0()
{
    return 17;
}
int __IndexOf_bIsKeySelecting1()
{
    return 18;
}
int __IndexOf_bHasChordKey0()
{
    return 19;
}
int __IndexOf_bHasChordKey1()
{
    return 20;
}
}
namespace __GeneratedProperties_FVM_PlayerKeyMappingPair
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
namespace FVMS_PlayerKeyMappings
{
FVMS_PlayerKeyMappings& Get(const UObject ContextObject)
{
    return FVMS_PlayerKeyMappings::GetByManager(EUIInternal::GetContextManager(ContextObject));
}
FVMS_PlayerKeyMappings GetByManager(const UEUIManagerSubsystem Manager)
{
    FVMS_PlayerKeyMappings __r;
    TEUIModelRef<FVMS_PlayerKeyMappings> local_6 = TEUIModelRef<FVMS_PlayerKeyMappings>(EUIInternal::MakeModelWithManager(Manager, FVMS_PlayerKeyMappings::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasBeginDestroy(true);
    Result.SetbHasLoadConfigDefault(true);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "KeyboardMouseItems";
    local_14.TypeName = "TArray<FEUIModelRef>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "GamepadItems";
    local_14.TypeName = "TArray<FEUIModelRef>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "SettingCategoryIndex";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CanSave";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CanRevert";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ShowDeleteKey";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ShowResetKey";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ShowExitSelectingKey";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVMS_PlayerKeyMappings>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVMS_PlayerKeyMappings;
    FEUIModelDirtyDefine local_24;
    local_24.FunctionName = "__ShowInvalidKeyError";
    local_24.DirtyFlags.Set(FVMS_PlayerKeyMappings::__IndexOf_bShowInvalidKeyError());
    Result.DirtyFunctions.Add(local_24);
    return;
}
UScriptStruct GetModelStruct()
{
    return FVMS_PlayerKeyMappings;
}
void __ShowInvalidKeyError(FVMS_PlayerKeyMappings &inout Model)
{
    Model.ShowInvalidKeyError();
    return;
}
TArray<FEUIModelRef> __UIGetter_KeyboardMouseItems(const FVMS_PlayerKeyMappings &inout Model)
{
    return Model.GetKeyboardMouseItems();
}
TArray<FEUIModelRef> __UIGetter_GamepadItems(const FVMS_PlayerKeyMappings &inout Model)
{
    return Model.GetGamepadItems();
}
int __UIGetter_SettingCategoryIndex(const FVMS_PlayerKeyMappings &inout Model)
{
    return Model.GetSettingCategoryIndex();
}
bool __UIGetter_CanSave(const FVMS_PlayerKeyMappings &inout Model)
{
    return Model.CanSave();
}
bool __UIGetter_CanRevert(const FVMS_PlayerKeyMappings &inout Model)
{
    return Model.CanRevert();
}
bool __UIGetter_ShowDeleteKey(const FVMS_PlayerKeyMappings &inout Model)
{
    return Model.ShowDeleteKey();
}
bool __UIGetter_ShowResetKey(const FVMS_PlayerKeyMappings &inout Model)
{
    return Model.ShowResetKey();
}
bool __UIGetter_ShowExitSelectingKey(const FVMS_PlayerKeyMappings &inout Model)
{
    return Model.ShowExitSelectingKey();
}
TEUIModelRef<FVMS_PlayerKeyMappings> __UIGetter_Self(const FVMS_PlayerKeyMappings &inout Model)
{
    return TEUIModelRef<FVMS_PlayerKeyMappings>(Model);
}
int __IndexOf_Config()
{
    return 0;
}
int __IndexOf_KeyMappingCollection()
{
    return 1;
}
int __IndexOf_KeyboardMouseKeys()
{
    return 2;
}
int __IndexOf_GamepadKeys()
{
    return 3;
}
int __IndexOf_KeyboardMouseItems()
{
    return 4;
}
int __IndexOf_GamepadItems()
{
    return 5;
}
int __IndexOf_bShouldSave()
{
    return 6;
}
int __IndexOf_SelectingKey()
{
    return 7;
}
int __IndexOf_SelectingKeyPair()
{
    return 8;
}
int __IndexOf_SettingCategoryIndex()
{
    return 9;
}
int __IndexOf_KeyboardMouseModification()
{
    return 10;
}
int __IndexOf_GamepadModification()
{
    return 11;
}
int __IndexOf_bShowInvalidKeyError()
{
    return 12;
}
int __IndexOf_bCanRevert()
{
    return 13;
}
int __IndexOf_bIsKeySelecting()
{
    return 14;
}
int __IndexOf_PendingSwitchKey0()
{
    return 15;
}
int __IndexOf_PendingSwitchKey1()
{
    return 16;
}
int __IndexOf_Dummy()
{
    return 17;
}
}
namespace __GeneratedProperties_FVMS_PlayerKeyMappings
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
