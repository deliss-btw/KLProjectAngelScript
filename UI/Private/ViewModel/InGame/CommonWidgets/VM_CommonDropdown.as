
namespace FVM_CommonDropdown
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature SetDropdownOpen = FEUIModelCallbackSignature();

}
struct FCommonDropdownDefaultOption
{
    UPROPERTY()
    int DefaultIndex;
    UPROPERTY()
    FEUIModelRef DefaultModel;

    FCommonDropdownDefaultOption()
    {
        this.DefaultIndex = 0;
        return;
    }
    FCommonDropdownDefaultOption(const int InDefaultIndex)
    {
        this.DefaultIndex = 0;
        this.DefaultIndex = InDefaultIndex;
        return;
    }
    FCommonDropdownDefaultOption(const FEUIModelRef &inout InDefaultModel)
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
}

struct FVM_CommonDropdown : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TArray<FEUIModelContainer> m_OptionDatas;
    UPROPERTY()
    FCommonDropdownDefaultOption m_DefaultOption;
    UPROPERTY()
    FOnCommonDropdownSelected m_OnDropdownSelected;
    UPROPERTY()
    TArray<int> m_OptionDisabledIndices;
    UPROPERTY()
    FEUIModelContainer m_ButtonData;
    UPROPERTY()
    TEUIModelRef<FVM_CommonDropdownList> m_DropdownList;
    UPROPERTY()
    bool m_bDropdownOpen;
    UPROPERTY()
    ECommonDropdownExpandDirection m_ExpandDirection;
    UPROPERTY()
    bool m_bWithIcon;
    UPROPERTY()
    bool m_bBroadcast;
    UPROPERTY()
    int m_PrivateSelectedIndex;

    FVM_CommonDropdown()
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    FVM_CommonDropdown(const FVM_CommonDropdown &inout Other)
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    FVM_CommonDropdown(const TArray<FEUIModelContainer> &inout InOptionDatas, const FCommonDropdownDefaultOption &inout InDefaultOption, const FOnCommonDropdownSelected &inout InOnDropdownSelected)
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    FVM_CommonDropdown opAssign(const FVM_CommonDropdown &inout Other)
    {
        FVM_CommonDropdown __r;
        this.m_OptionDatas = Other.m_OptionDatas;
        this.m_OptionDisabledIndices = Other.m_OptionDisabledIndices;
        this.m_ButtonData = Other.m_ButtonData;
        this.m_DropdownList = Other.m_DropdownList;
        this.m_bDropdownOpen = Other.m_bDropdownOpen;
        this.m_ExpandDirection = Other.m_ExpandDirection;
        this.m_bWithIcon = Other.m_bWithIcon;
        this.m_bBroadcast = Other.m_bBroadcast;
        this.m_PrivateSelectedIndex = int(Other.m_PrivateSelectedIndex);
        return __r;
    }
    void PostConstruct()
    {
        this.SetPrivateSelectedIndex(this.GetDefaultOption().DefaultIndex);
        this.SetOptionDisabledIndices(TArray<int>());
        return;
    }
    void UpdateOptionDisabledIndices()
    {
        this.InitDropdownList();
        return;
    }
    void InitDropdownList()
    {
        this.SetDropdownList(TEUIModelRef<FVM_CommonDropdownList>(::FVM_CommonDropdownList::Create(this.GetContext().Manager, (TEUIModelWeakRef<FVM_CommonDropdown>(this)))));
        this.UpdateButtonData();
        return;
    }
    int GetSelectedIndex() const property
    {
        return this.GetPrivateSelectedIndex();
    }
    void SetDropdownOpen(const bool bInDropdownOpen)
    {
        this.SetbDropdownOpen(bInDropdownOpen);
        return;
    }
    void SelectByIndex(const int Index, const bool _bBroadcast = true)
    {
        this.SetSelectedIndex(Index, _bBroadcast);
        return;
    }
    void SelectByData(const FEUIModelContainer &inout OptionData)
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    void UpdateButtonData()
    {
        this.SetButtonData(this.MakeButtonData());
        return;
    }
    void SetSelectedIndex(const int Index, const bool _bBroadcast = true)
    {
        if (this.GetOptionDatas().IsValidIndex(Index))
        {
            if (_bBroadcast && (this.GetPrivateSelectedIndex() != Index))
            {
                this.GetOnDropdownSelected().Broadcast(Index);
            }
            this.SetPrivateSelectedIndex(Index);
            this.SetbDropdownOpen(false);
            return;
        }
        XError(ELog(16), FString().Append("Invalid index: ").Append(Index));
        return;
    }
    FEUIModelContainer MakeButtonData() const
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
        FEUIModelContainer __r; return __r;
    }
    const TArray<FEUIModelContainer> GetOptionDatas() const property
    {
        const TArray<FEUIModelContainer> __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    TArray<FEUIModelContainer> GetModify_OptionDatas() property
    {
        TArray<FEUIModelContainer> __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetOptionDatas(const TArray<FEUIModelContainer> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_OptionDatas = __Value;
        return;
    }
    const FCommonDropdownDefaultOption GetDefaultOption() const property
    {
        const FCommonDropdownDefaultOption __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    FCommonDropdownDefaultOption GetModify_DefaultOption() property
    {
        FCommonDropdownDefaultOption __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetDefaultOption(const FCommonDropdownDefaultOption &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        return;
    }
    const FOnCommonDropdownSelected GetOnDropdownSelected() const property
    {
        const FOnCommonDropdownSelected __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    FOnCommonDropdownSelected GetModify_OnDropdownSelected() property
    {
        FOnCommonDropdownSelected __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetOnDropdownSelected(const FOnCommonDropdownSelected &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        return;
    }
    const TArray<int> GetOptionDisabledIndices() const property
    {
        const TArray<int> __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    TArray<int> GetModify_OptionDisabledIndices() property
    {
        TArray<int> __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetOptionDisabledIndices(const TArray<int> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_OptionDisabledIndices = __Value;
        return;
    }
    const FEUIModelContainer GetButtonData() const property
    {
        const FEUIModelContainer __r;
        this.TrackPropertyRead(4);
        return __r;
    }
    FEUIModelContainer GetModify_ButtonData() property
    {
        FEUIModelContainer __r;
        this.MarkPropertyDirty(4);
        return __r;
    }
    void SetButtonData(const FEUIModelContainer &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_ButtonData = __Value;
        return;
    }
    TEUIModelRef<FVM_CommonDropdownList> GetDropdownList() const property
    {
        this.TrackPropertyRead(5);
        return this.m_DropdownList;
    }
    void SetDropdownList(const TEUIModelRef<FVM_CommonDropdownList> &inout __Value) property
    {
        TEUIModelRef<FVM_CommonDropdownList> local_2;
        local_2 = this.m_DropdownList;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_DropdownList = __Value;
        return;
    }
    bool GetbDropdownOpen() const property
    {
        this.TrackPropertyRead(6);
        return this.m_bDropdownOpen;
    }
    void SetbDropdownOpen(const bool __Value) property
    {
        if (!(this.m_bDropdownOpen) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_bDropdownOpen = __Value;
        return;
    }
    ECommonDropdownExpandDirection GetExpandDirection() const property
    {
        this.TrackPropertyRead(7);
        return this.m_ExpandDirection;
    }
    void SetExpandDirection(const ECommonDropdownExpandDirection __Value) property
    {
        if (int(this.m_ExpandDirection) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(7);
        this.m_ExpandDirection = __Value;
        return;
    }
    bool GetbWithIcon() const property
    {
        this.TrackPropertyRead(8);
        return this.m_bWithIcon;
    }
    void SetbWithIcon(const bool __Value) property
    {
        if (!(this.m_bWithIcon) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(8);
        this.m_bWithIcon = __Value;
        return;
    }
    bool GetbBroadcast() const property
    {
        this.TrackPropertyRead(9);
        return this.m_bBroadcast;
    }
    void SetbBroadcast(const bool __Value) property
    {
        if (!(this.m_bBroadcast) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(9);
        this.m_bBroadcast = __Value;
        return;
    }
    int GetPrivateSelectedIndex() const property
    {
        this.TrackPropertyRead(10);
        return this.m_PrivateSelectedIndex;
    }
    void SetPrivateSelectedIndex(const int __Value) property
    {
        if (this.m_PrivateSelectedIndex == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(10);
        this.m_PrivateSelectedIndex = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_CommonDropdown
{
    UPROPERTY()
    TEUIModelRef<FVM_CommonDropdown> Self;

    __GeneratedProperties_FVM_CommonDropdown()
    {
        return;
    }
}

namespace FVM_CommonDropdown
{
FVM_CommonDropdown& Create(const UObject ContextObject, const TArray<FEUIModelContainer> &inout OptionDatas, const FCommonDropdownDefaultOption &inout DefaultOption, const FOnCommonDropdownSelected &inout OnDropdownSelected)
{
    return FVM_CommonDropdown::CreateByManager(EUIInternal::GetContextManager(ContextObject), OptionDatas, DefaultOption, OnDropdownSelected);
}
FVM_CommonDropdown CreateByManager(const UEUIManagerSubsystem Manager, const TArray<FEUIModelContainer> &inout OptionDatas, const FCommonDropdownDefaultOption &inout DefaultOption, const FOnCommonDropdownSelected &inout OnDropdownSelected)
{
    FVM_CommonDropdown __r;
    TEUIModelRef<FVM_CommonDropdown> local_6 = TEUIModelRef<FVM_CommonDropdown>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_CommonDropdown::ModelId, 0, OptionDatas, DefaultOption, OnDropdownSelected));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "ButtonData";
    local_14.TypeName = "FEUIModelContainer";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bWithIcon";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_CommonDropdown>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_CommonDropdown;
    FEUIModelDirtyDefine local_24;
    local_24.FunctionName = "__UpdateOptionDisabledIndices";
    local_24.DirtyFlags.Set(FVM_CommonDropdown::__IndexOf_OptionDisabledIndices());
    Result.DirtyFunctions.Add(local_24);
    FEUIModelEffectDefine local_28;
    local_28.FunctionName = "InitDropdownList";
    Result.EffectFunctions.Add(local_28);
    local_24.FunctionName = "__UpdateButtonData";
    local_24.DirtyFlags.Set(FVM_CommonDropdown::__IndexOf_PrivateSelectedIndex());
    local_24.DirtyFlags.Set(FVM_CommonDropdown::__IndexOf_OptionDatas());
    local_24.DirtyFlags.Set(FVM_CommonDropdown::__IndexOf_DefaultOption());
    Result.DirtyFunctions.Add(local_24);
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_CommonDropdown;
}
void __UpdateOptionDisabledIndices(FVM_CommonDropdown &inout Model)
{
    Model.UpdateOptionDisabledIndices();
    return;
}
void __UpdateButtonData(FVM_CommonDropdown &inout Model)
{
    Model.UpdateButtonData();
    return;
}
FEUIModelContainer __UIGetter_ButtonData(const FVM_CommonDropdown &inout Model)
{
    return Model.GetButtonData();
}
bool __UIGetter_bWithIcon(const FVM_CommonDropdown &inout Model)
{
    return Model.GetbWithIcon();
}
TEUIModelRef<FVM_CommonDropdown> __UIGetter_Self(const FVM_CommonDropdown &inout Model)
{
    return TEUIModelRef<FVM_CommonDropdown>(Model);
}
int __IndexOf_OptionDatas()
{
    return 0;
}
int __IndexOf_DefaultOption()
{
    return 1;
}
int __IndexOf_OnDropdownSelected()
{
    return 2;
}
int __IndexOf_OptionDisabledIndices()
{
    return 3;
}
int __IndexOf_ButtonData()
{
    return 4;
}
int __IndexOf_DropdownList()
{
    return 5;
}
int __IndexOf_bDropdownOpen()
{
    return 6;
}
int __IndexOf_ExpandDirection()
{
    return 7;
}
int __IndexOf_bWithIcon()
{
    return 8;
}
int __IndexOf_bBroadcast()
{
    return 9;
}
int __IndexOf_PrivateSelectedIndex()
{
    return 10;
}
}
namespace __GeneratedProperties_FVM_CommonDropdown
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
