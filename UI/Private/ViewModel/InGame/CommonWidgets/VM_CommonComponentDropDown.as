
namespace FVM_CommonComponentDropDown
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature OnInnerDropdownSelected = FEUIModelCallbackSignature();

}
struct FVM_CommonComponentDropDown : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TArray<FText> m_OptionTexts;
    UPROPERTY()
    int m_DefaultIndex;
    UPROPERTY()
    FOnCommonComponentDropDownSelected m_OnComponentDropDownSelected;
    UPROPERTY()
    TEUIModelRef<FVM_CommonDropdown> m_CommonDropdownVM;
    UPROPERTY()
    bool bBroadcast;

    FVM_CommonComponentDropDown()
    {
        this.m_DefaultIndex = 0;
        this.bBroadcast = true;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_CommonComponentDropDown' by default constructor.");
        return;
    }
    FVM_CommonComponentDropDown(const FVM_CommonComponentDropDown &inout Other)
    {
        this.m_DefaultIndex = 0;
        this.bBroadcast = true;
        this.m_OptionTexts = Other.m_OptionTexts;
        this.m_DefaultIndex = int(Other.m_DefaultIndex);
        this.m_CommonDropdownVM = Other.m_CommonDropdownVM;
        return;
    }
    FVM_CommonComponentDropDown(const TArray<FText> &inout InOptionTexts, const int InDefaultIndex, const FOnCommonComponentDropDownSelected &inout InOnComponentDropDownSelected)
    {
        this.m_DefaultIndex = 0;
        this.bBroadcast = true;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetOptionTexts(InOptionTexts);
        this.SetDefaultIndex(InDefaultIndex);
        this.SetOnComponentDropDownSelected(InOnComponentDropDownSelected);
        return;
    }
    FVM_CommonComponentDropDown& opAssign(const FVM_CommonComponentDropDown &inout Other)
    {
        this.m_OptionTexts = Other.m_OptionTexts;
        this.m_DefaultIndex = int(Other.m_DefaultIndex);
        return Other.m_CommonDropdownVM;
    }
    void PostConstruct()
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    void OnOptionTextsChanged()
    {
        TArray<FEUIModelContainer> local_4;
        for (auto& local_20 : this.GetOptionTexts())
        {
            local_20;
            UEUIManagerSubsystem local_22 = this.GetManager();
            local_4.Add(FEUIModelContainer());
        }
        TEUIModelRef<FVM_CommonDropdown> local_40 = this.GetCommonDropdownVM();
        local_4.SetOptionDatas();
        return;
    }
    void SelectByIndex(const int Index, const bool _bBroadcast = true)
    {
        TEUIModelRef<FVM_CommonDropdown> local_2 = this.GetCommonDropdownVM();
        Index.SelectByIndex(_bBroadcast);
        return;
    }
    void UpdateOptionDisabledIndices(const TArray<int> &inout OptionDisabledIndices)
    {
        TEUIModelRef<FVM_CommonDropdown> local_2 = this.GetCommonDropdownVM();
        OptionDisabledIndices.SetOptionDisabledIndices();
        return;
    }
    void OnInnerDropdownSelected(const int Index)
    {
        if (this.bBroadcast)
        {
            this.GetOnComponentDropDownSelected().Broadcast(Index);
            return;
        }
        this.bBroadcast = true;
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
    const FOnCommonComponentDropDownSelected GetOnComponentDropDownSelected() const property
    {
        const FOnCommonComponentDropDownSelected __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    FOnCommonComponentDropDownSelected GetModify_OnComponentDropDownSelected() property
    {
        FOnCommonComponentDropDownSelected __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetOnComponentDropDownSelected(const FOnCommonComponentDropDownSelected &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        return;
    }
    TEUIModelRef<FVM_CommonDropdown> GetCommonDropdownVM() const property
    {
        this.TrackPropertyRead(3);
        return this.m_CommonDropdownVM;
    }
    void SetCommonDropdownVM(const TEUIModelRef<FVM_CommonDropdown> &inout __Value) property
    {
        TEUIModelRef<FVM_CommonDropdown> local_2;
        local_2 = this.m_CommonDropdownVM;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_CommonDropdownVM = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_CommonComponentDropDown
{
    UPROPERTY()
    TEUIModelRef<FVM_CommonComponentDropDown> Self;

    __GeneratedProperties_FVM_CommonComponentDropDown()
    {
        return;
    }
}

namespace FVM_CommonComponentDropDown
{
FVM_CommonComponentDropDown& Create(const UObject ContextObject, const TArray<FText> &inout OptionTexts, const int DefaultIndex, const FOnCommonComponentDropDownSelected &inout OnComponentDropDownSelected)
{
    return FVM_CommonComponentDropDown::CreateByManager(EUIInternal::GetContextManager(ContextObject), OptionTexts, DefaultIndex, OnComponentDropDownSelected);
}
FVM_CommonComponentDropDown CreateByManager(const UEUIManagerSubsystem Manager, const TArray<FText> &inout OptionTexts, const int DefaultIndex, const FOnCommonComponentDropDownSelected &inout OnComponentDropDownSelected)
{
    FVM_CommonComponentDropDown __r;
    TEUIModelRef<FVM_CommonComponentDropDown> local_6 = TEUIModelRef<FVM_CommonComponentDropDown>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_CommonComponentDropDown::ModelId, 0, OptionTexts, DefaultIndex, OnComponentDropDownSelected));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "CommonDropdownVM";
    local_14.TypeName = "TEUIModelRef<FVM_CommonDropdown>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_CommonComponentDropDown>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_CommonComponentDropDown;
    FEUIModelDirtyDefine local_24;
    local_24.FunctionName = "__OnOptionTextsChanged";
    local_24.DirtyFlags.Set(FVM_CommonComponentDropDown::__IndexOf_OptionTexts());
    Result.DirtyFunctions.Add(local_24);
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_CommonComponentDropDown;
}
void __OnOptionTextsChanged(FVM_CommonComponentDropDown &inout Model)
{
    Model.OnOptionTextsChanged();
    return;
}
TEUIModelRef<FVM_CommonDropdown> __UIGetter_CommonDropdownVM(const FVM_CommonComponentDropDown &inout Model)
{
    return Model.GetCommonDropdownVM();
}
TEUIModelRef<FVM_CommonComponentDropDown> __UIGetter_Self(const FVM_CommonComponentDropDown &inout Model)
{
    return TEUIModelRef<FVM_CommonComponentDropDown>(Model);
}
int __IndexOf_OptionTexts()
{
    return 0;
}
int __IndexOf_DefaultIndex()
{
    return 1;
}
int __IndexOf_OnComponentDropDownSelected()
{
    return 2;
}
int __IndexOf_CommonDropdownVM()
{
    return 3;
}
}
namespace __GeneratedProperties_FVM_CommonComponentDropDown
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
