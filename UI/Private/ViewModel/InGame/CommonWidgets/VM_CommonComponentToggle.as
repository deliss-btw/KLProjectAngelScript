
namespace FVM_CommonComponentToggle
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature IncreaseCurrentSelectedIndex = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature DecreaseCurrentSelectedIndex = FEUIModelCallbackSignature();

}
struct FVM_CommonComponentToggle : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TArray<FText> m_OptionTexts;
    UPROPERTY()
    int m_DefaultIndex;
    UPROPERTY()
    FOnCommonComponentToggleSelected m_OnComponentToggleSelected;
    UPROPERTY()
    FText m_DisplayText;
    UPROPERTY()
    int m_CurrentSelectedIndex;
    UPROPERTY()
    int m_MultipleSelectionState;
    UPROPERTY()
    int m_RightArrowHoverState;
    UPROPERTY()
    int m_LeftArrowHoverState;
    UPROPERTY()
    int m_BtnHoverState;
    UPROPERTY()
    bool m_RightArrowEnabled;
    UPROPERTY()
    bool m_LeftArrowEnabled;
    UPROPERTY()
    bool m_SwitcherEnabled;

    FVM_CommonComponentToggle()
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    FVM_CommonComponentToggle(const FVM_CommonComponentToggle &inout Other)
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    FVM_CommonComponentToggle(const TArray<FText> &inout InOptionTexts, const int InDefaultIndex, const FOnCommonComponentToggleSelected &inout InOnComponentToggleSelected)
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    FVM_CommonComponentToggle opAssign(const FVM_CommonComponentToggle &inout Other)
    {
        FVM_CommonComponentToggle __r;
        this.m_OptionTexts = Other.m_OptionTexts;
        this.m_DefaultIndex = int(Other.m_DefaultIndex);
        this.m_DisplayText = Other.m_DisplayText;
        this.m_CurrentSelectedIndex = int(Other.m_CurrentSelectedIndex);
        this.m_MultipleSelectionState = int(Other.m_MultipleSelectionState);
        this.m_RightArrowHoverState = int(Other.m_RightArrowHoverState);
        this.m_LeftArrowHoverState = int(Other.m_LeftArrowHoverState);
        this.m_BtnHoverState = int(Other.m_BtnHoverState);
        this.m_RightArrowEnabled = Other.m_RightArrowEnabled;
        this.m_LeftArrowEnabled = Other.m_LeftArrowEnabled;
        this.m_SwitcherEnabled = Other.m_SwitcherEnabled;
        return __r;
    }
    void PostConstruct()
    {
        this.SetCurrentSelectedIndex(this.GetDefaultIndex());
        int local_4 = this.GetOptionTexts().Num() > 2 ? 1 : 0;
        this.SetMultipleSelectionState(local_4);
        return;
    }
    void ChangeCurrentSelectedIndex(const int Index, const bool bBroadcast = true)
    {
        this.SetCurrentSelectedIndex(FMath::Clamp(Index, 0, (this.GetOptionTexts().Num() - 1)));
        if (bBroadcast)
        {
            this.GetOnComponentToggleSelected().Broadcast(this.GetCurrentSelectedIndex());
        }
        return;
    }
    void IncreaseCurrentSelectedIndex()
    {
        if (this.GetRightArrowEnabled())
        {
            this.SetRightArrowHoverState(1);
            this.SetLeftArrowHoverState(0);
            this.SetCurrentSelectedIndex((this.GetCurrentSelectedIndex() + 1));
            if (this.GetCurrentSelectedIndex() >= this.GetOptionTexts().Num())
            {
                this.SetCurrentSelectedIndex(0);
            }
            this.GetOnComponentToggleSelected().Broadcast(this.GetCurrentSelectedIndex());
        }
        return;
    }
    void DecreaseCurrentSelectedIndex()
    {
        if (this.GetLeftArrowEnabled())
        {
            this.SetLeftArrowHoverState(1);
            this.SetRightArrowHoverState(0);
            this.SetCurrentSelectedIndex((this.GetCurrentSelectedIndex() - 1));
            if (this.GetCurrentSelectedIndex() < 0)
            {
                this.SetCurrentSelectedIndex((this.GetOptionTexts().Num() - 1));
            }
            this.GetOnComponentToggleSelected().Broadcast(this.GetCurrentSelectedIndex());
        }
        return;
    }
    void UpdateDisplayText()
    {
        this.UpdateArrowState();
        this.GenerateDisplayText();
        return;
    }
    void UpdateArrowState()
    {
        int local_4;
        int local_6;
        int local_7;
        if (this.GetOptionTexts().Num() == 2)
        {
            bool local_3 = true;
            local_6 = local_3;
        }
        else
        {
            bool local_5;
            local_5 = (this.GetCurrentSelectedIndex() < (this.GetOptionTexts().Num() - 1));
            local_6 = local_5;
        }
        this.SetRightArrowEnabled((local_6 != 0));
        this.SetLeftArrowEnabled(this.GetOptionTexts().Num() == 2 || (this.GetCurrentSelectedIndex() > 0));
        if (this.GetRightArrowEnabled())
        {
            local_7 = this.GetRightArrowHoverState() != 2 ? this.GetRightArrowHoverState() : 0;
        }
        else
        {
            local_7 = 2;
        }
        this.SetRightArrowHoverState(local_7);
        if (this.GetLeftArrowEnabled())
        {
            local_4 = this.GetLeftArrowHoverState() != 2 ? this.GetLeftArrowHoverState() : 0;
        }
        else
        {
            local_4 = 2;
        }
        this.SetLeftArrowHoverState(local_4);
        return;
    }
    void GenerateDisplayText()
    {
        this.SetDisplayText(this.GetOptionTexts()[this.GetCurrentSelectedIndex()]);
        return;
    }
    const TArray<FText> GetOptionTexts() const property
    {
        const TArray<FText> __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    TArray<FText> GetModify_OptionTexts() property
    {
        TArray<FText> __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetOptionTexts(const TArray<FText> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_OptionTexts = __Value;
        return;
    }
    int GetDefaultIndex() const property
    {
        this.TrackPropertyRead(1);
        return this.m_DefaultIndex;
    }
    void SetDefaultIndex(const int __Value) property
    {
        if (this.m_DefaultIndex == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_DefaultIndex = __Value;
        return;
    }
    const FOnCommonComponentToggleSelected GetOnComponentToggleSelected() const property
    {
        const FOnCommonComponentToggleSelected __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    FOnCommonComponentToggleSelected GetModify_OnComponentToggleSelected() property
    {
        FOnCommonComponentToggleSelected __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetOnComponentToggleSelected(const FOnCommonComponentToggleSelected &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        return;
    }
    const FText GetDisplayText() const property
    {
        const FText __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    FText GetModify_DisplayText() property
    {
        FText __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetDisplayText(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_DisplayText = __Value;
        return;
    }
    int GetCurrentSelectedIndex() const property
    {
        this.TrackPropertyRead(4);
        return this.m_CurrentSelectedIndex;
    }
    void SetCurrentSelectedIndex(const int __Value) property
    {
        if (this.m_CurrentSelectedIndex == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_CurrentSelectedIndex = __Value;
        return;
    }
    int GetMultipleSelectionState() const property
    {
        this.TrackPropertyRead(5);
        return this.m_MultipleSelectionState;
    }
    void SetMultipleSelectionState(const int __Value) property
    {
        if (this.m_MultipleSelectionState == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_MultipleSelectionState = __Value;
        return;
    }
    int GetRightArrowHoverState() const property
    {
        this.TrackPropertyRead(6);
        return this.m_RightArrowHoverState;
    }
    void SetRightArrowHoverState(const int __Value) property
    {
        if (this.m_RightArrowHoverState == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_RightArrowHoverState = __Value;
        return;
    }
    int GetLeftArrowHoverState() const property
    {
        this.TrackPropertyRead(7);
        return this.m_LeftArrowHoverState;
    }
    void SetLeftArrowHoverState(const int __Value) property
    {
        if (this.m_LeftArrowHoverState == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(7);
        this.m_LeftArrowHoverState = __Value;
        return;
    }
    int GetBtnHoverState() const property
    {
        this.TrackPropertyRead(8);
        return this.m_BtnHoverState;
    }
    void SetBtnHoverState(const int __Value) property
    {
        if (this.m_BtnHoverState == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(8);
        this.m_BtnHoverState = __Value;
        return;
    }
    bool GetRightArrowEnabled() const property
    {
        this.TrackPropertyRead(9);
        return this.m_RightArrowEnabled;
    }
    void SetRightArrowEnabled(const bool __Value) property
    {
        if (!(this.m_RightArrowEnabled) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(9);
        this.m_RightArrowEnabled = __Value;
        return;
    }
    bool GetLeftArrowEnabled() const property
    {
        this.TrackPropertyRead(10);
        return this.m_LeftArrowEnabled;
    }
    void SetLeftArrowEnabled(const bool __Value) property
    {
        if (!(this.m_LeftArrowEnabled) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(10);
        this.m_LeftArrowEnabled = __Value;
        return;
    }
    bool GetSwitcherEnabled() const property
    {
        this.TrackPropertyRead(11);
        return this.m_SwitcherEnabled;
    }
    void SetSwitcherEnabled(const bool __Value) property
    {
        if (!(this.m_SwitcherEnabled) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(11);
        this.m_SwitcherEnabled = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_CommonComponentToggle
{
    UPROPERTY()
    TEUIModelRef<FVM_CommonComponentToggle> Self;

    __GeneratedProperties_FVM_CommonComponentToggle()
    {
        return;
    }
}

namespace FVM_CommonComponentToggle
{
FVM_CommonComponentToggle& Create(const UObject ContextObject, const TArray<FText> &inout OptionTexts, const int DefaultIndex, const FOnCommonComponentToggleSelected &inout OnComponentToggleSelected)
{
    return FVM_CommonComponentToggle::CreateByManager(EUIInternal::GetContextManager(ContextObject), OptionTexts, DefaultIndex, OnComponentToggleSelected);
}
FVM_CommonComponentToggle CreateByManager(const UEUIManagerSubsystem Manager, const TArray<FText> &inout OptionTexts, const int DefaultIndex, const FOnCommonComponentToggleSelected &inout OnComponentToggleSelected)
{
    FVM_CommonComponentToggle __r;
    TEUIModelRef<FVM_CommonComponentToggle> local_6 = TEUIModelRef<FVM_CommonComponentToggle>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_CommonComponentToggle::ModelId, 0, OptionTexts, DefaultIndex, OnComponentToggleSelected));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "DisplayText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CurrentSelectedIndex";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "MultipleSelectionState";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "RightArrowHoverState";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "LeftArrowHoverState";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "BtnHoverState";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "RightArrowEnabled";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "LeftArrowEnabled";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "SwitcherEnabled";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_CommonComponentToggle>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_CommonComponentToggle;
    FEUIModelDirtyDefine local_24;
    local_24.FunctionName = "__UpdateDisplayText";
    local_24.DirtyFlags.Set(FVM_CommonComponentToggle::__IndexOf_OptionTexts());
    local_24.DirtyFlags.Set(FVM_CommonComponentToggle::__IndexOf_DefaultIndex());
    local_24.DirtyFlags.Set(FVM_CommonComponentToggle::__IndexOf_CurrentSelectedIndex());
    Result.DirtyFunctions.Add(local_24);
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_CommonComponentToggle;
}
void __UpdateDisplayText(FVM_CommonComponentToggle &inout Model)
{
    Model.UpdateDisplayText();
    return;
}
FText __UIGetter_DisplayText(const FVM_CommonComponentToggle &inout Model)
{
    return Model.GetDisplayText();
}
int __UIGetter_CurrentSelectedIndex(const FVM_CommonComponentToggle &inout Model)
{
    return Model.GetCurrentSelectedIndex();
}
int __UIGetter_MultipleSelectionState(const FVM_CommonComponentToggle &inout Model)
{
    return Model.GetMultipleSelectionState();
}
int __UIGetter_RightArrowHoverState(const FVM_CommonComponentToggle &inout Model)
{
    return Model.GetRightArrowHoverState();
}
int __UIGetter_LeftArrowHoverState(const FVM_CommonComponentToggle &inout Model)
{
    return Model.GetLeftArrowHoverState();
}
int __UIGetter_BtnHoverState(const FVM_CommonComponentToggle &inout Model)
{
    return Model.GetBtnHoverState();
}
bool __UIGetter_RightArrowEnabled(const FVM_CommonComponentToggle &inout Model)
{
    return Model.GetRightArrowEnabled();
}
bool __UIGetter_LeftArrowEnabled(const FVM_CommonComponentToggle &inout Model)
{
    return Model.GetLeftArrowEnabled();
}
bool __UIGetter_SwitcherEnabled(const FVM_CommonComponentToggle &inout Model)
{
    return Model.GetSwitcherEnabled();
}
TEUIModelRef<FVM_CommonComponentToggle> __UIGetter_Self(const FVM_CommonComponentToggle &inout Model)
{
    return TEUIModelRef<FVM_CommonComponentToggle>(Model);
}
int __IndexOf_OptionTexts()
{
    return 0;
}
int __IndexOf_DefaultIndex()
{
    return 1;
}
int __IndexOf_OnComponentToggleSelected()
{
    return 2;
}
int __IndexOf_DisplayText()
{
    return 3;
}
int __IndexOf_CurrentSelectedIndex()
{
    return 4;
}
int __IndexOf_MultipleSelectionState()
{
    return 5;
}
int __IndexOf_RightArrowHoverState()
{
    return 6;
}
int __IndexOf_LeftArrowHoverState()
{
    return 7;
}
int __IndexOf_BtnHoverState()
{
    return 8;
}
int __IndexOf_RightArrowEnabled()
{
    return 9;
}
int __IndexOf_LeftArrowEnabled()
{
    return 10;
}
int __IndexOf_SwitcherEnabled()
{
    return 11;
}
}
namespace __GeneratedProperties_FVM_CommonComponentToggle
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
