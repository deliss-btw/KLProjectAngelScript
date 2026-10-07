
namespace FVM_CommonDropdownOption
{
    const int ModelId = 0;
}
namespace FVM_CommonDropdownList
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature OnDropdownItemSelected = FEUIModelCallbackSignature();
}
namespace FVM_CommonDropdownButton
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature TriggerDropdown = FEUIModelCallbackSignature();

}
struct FVM_CommonDropdownOption : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    int m_Index;
    UPROPERTY()
    TEUIModelWeakRef<FVM_CommonDropdown> m_Dropdown;
    UPROPERTY()
    ESlateVisibility m_Visibility;
    UPROPERTY()
    float32 m_EnabledOpacity;

    FVM_CommonDropdownOption()
    {
        this.m_Index = 0;
        this.m_Visibility = ESlateVisibility(0);
        this.m_EnabledOpacity = 1.0f;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_CommonDropdownOption' by default constructor.");
        return;
    }
    FVM_CommonDropdownOption(const FVM_CommonDropdownOption &inout Other)
    {
        this.m_Index = 0;
        this.m_Visibility = ESlateVisibility(0);
        this.m_EnabledOpacity = 1.0f;
        this.m_Index = int(Other.m_Index);
        this.m_Dropdown = Other.m_Dropdown;
        this.m_Visibility = Other.m_Visibility;
        this.m_EnabledOpacity = Other.m_EnabledOpacity;
        return;
    }
    FVM_CommonDropdownOption(const int InIndex, const TEUIModelWeakRef<FVM_CommonDropdown> &inout InDropdown)
    {
        this.m_Index = 0;
        this.m_Visibility = ESlateVisibility(0);
        this.m_EnabledOpacity = 1.0f;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetIndex(InIndex);
        this.SetDropdown(InDropdown);
        return;
    }
    FVM_CommonDropdownOption opAssign(const FVM_CommonDropdownOption &inout Other)
    {
        FVM_CommonDropdownOption __r;
        this.m_Index = int(Other.m_Index);
        this.m_Dropdown = Other.m_Dropdown;
        this.m_Visibility = Other.m_Visibility;
        this.m_EnabledOpacity = Other.m_EnabledOpacity;
        return __r;
    }
    bool IsSelected() const
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
        bool __r; return __r;
    }
    int GetIndex() const property
    {
        this.TrackPropertyRead(0);
        return this.m_Index;
    }
    void SetIndex(const int __Value) property
    {
        if (this.m_Index == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_Index = __Value;
        return;
    }
    TEUIModelWeakRef<FVM_CommonDropdown> GetDropdown() const property
    {
        this.TrackPropertyRead(1);
        return this.m_Dropdown;
    }
    void SetDropdown(const TEUIModelWeakRef<FVM_CommonDropdown> &inout __Value) property
    {
        TEUIModelWeakRef<FVM_CommonDropdown> local_2;
        local_2 = this.m_Dropdown;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_Dropdown = __Value;
        return;
    }
    ESlateVisibility GetVisibility() const property
    {
        this.TrackPropertyRead(2);
        return this.m_Visibility;
    }
    void SetVisibility(const ESlateVisibility __Value) property
    {
        if (int(this.m_Visibility) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_Visibility = __Value;
        return;
    }
    const float32 GetEnabledOpacity() const property
    {
        const float32 __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    float32 GetModify_EnabledOpacity() property
    {
        float32 __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetEnabledOpacity(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_EnabledOpacity = __Value;
        return;
    }
}

struct FMsg_DropdownOptionSelected : FEUIMessage
{
    UPROPERTY()
    TEUIModelWeakRef<FVM_CommonDropdownOption> Option;

    FMsg_DropdownOptionSelected()
    {
        return;
    }
}

struct FVM_CommonDropdownList : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TEUIModelWeakRef<FVM_CommonDropdown> m_Dropdown;
    UPROPERTY()
    TArray<FEUIModelContainer> m_Options;

    FVM_CommonDropdownList()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_CommonDropdownList' by default constructor.");
        return;
    }
    FVM_CommonDropdownList(const FVM_CommonDropdownList &inout Other)
    {
        this.m_Dropdown = Other.m_Dropdown;
        this.m_Options = Other.m_Options;
        return;
    }
    FVM_CommonDropdownList(const TEUIModelWeakRef<FVM_CommonDropdown> &inout InDropdown)
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetDropdown(InDropdown);
        return;
    }
    FVM_CommonDropdownList& opAssign(const FVM_CommonDropdownList &inout Other)
    {
        this.m_Dropdown = Other.m_Dropdown;
        return Other.m_Options;
    }
    void PostConstruct()
    {
        int local_22 = 0;
        if (this.GetDropdown().IsNull())
        {
            return;
        }
        int local_4 = 0;
        for (; local_4 < this.GetDropdown().opArrow().GetOptionDatas().Num(); ++local_4)
        {
            FEUIModelContainer local_20 = FEUIModelContainer(this.GetDropdown().opArrow().GetOptionDatas()[local_4]);
            TEUIModelWeakRef<FVM_CommonDropdown> local_2 = this.GetDropdown();
            if (this.GetDropdown().opArrow().GetOptionDisabledIndices().Contains(local_4))
            {
                continue;
            }
            local_20.AddModel(FEUIModelRef(local_22), false);
            this.GetModify_Options().Add(local_20);
        }
        return;
    }
    void OnOptionDatasChanged()
    {
        int local_22 = 0;
        this.GetModify_Options().Empty(0);
        int local_2 = 0;
        for (; local_2 < this.GetDropdown().opArrow().GetOptionDatas().Num(); ++local_2)
        {
            FEUIModelContainer local_20 = FEUIModelContainer(this.GetDropdown().opArrow().GetOptionDatas()[local_2]);
            TEUIModelWeakRef<FVM_CommonDropdown> local_4 = this.GetDropdown();
            if (this.GetDropdown().opArrow().GetOptionDisabledIndices().Contains(local_2))
            {
                continue;
            }
            local_20.AddModel(FEUIModelRef(local_22), false);
            this.GetModify_Options().Add(local_20);
        }
        return;
    }
    TEUIModelRef<FVM_CommonDropdownList> GetModelRef() const
    {
        return TEUIModelRef<FVM_CommonDropdownList>(this);
    }
    void OnDropdownItemSelected(const FEUIModelContainer &inout Item)
    {
        this.GetDropdown().opArrow().SelectByIndex(FEUIModelContainer::RequireModel(Item).opCall().GetIndex(), true);
        this.GetDropdown().opArrow().SetDropdownOpen(false);
        return;
    }
    void HandleMsgSelected(const FMsg_DropdownOptionSelected &inout Selected)
    {
        FVM_CommonDropdownOption& local_2;
        if (local_2)
        {
            this.GetDropdown().opArrow().SelectByIndex(local_2.GetIndex(), true);
        }
        return;
    }
    TEUIModelWeakRef<FVM_CommonDropdown> GetDropdown() const property
    {
        this.TrackPropertyRead(0);
        return this.m_Dropdown;
    }
    void SetDropdown(const TEUIModelWeakRef<FVM_CommonDropdown> &inout __Value) property
    {
        TEUIModelWeakRef<FVM_CommonDropdown> local_2;
        local_2 = this.m_Dropdown;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_Dropdown = __Value;
        return;
    }
    TArray<FEUIModelContainer> GetOptions() const property
    {
        TArray<FEUIModelContainer> __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    TArray<FEUIModelContainer> GetModify_Options() property
    {
        TArray<FEUIModelContainer> __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetOptions(const TArray<FEUIModelContainer> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_Options = __Value;
        return;
    }
}

struct FVM_CommonDropdownButton : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TEUIModelWeakRef<FVM_CommonDropdown> m_Dropdown;
    UPROPERTY()
    bool m_bWithIcon;

    FVM_CommonDropdownButton()
    {
        this.m_bWithIcon = true;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_CommonDropdownButton' by default constructor.");
        return;
    }
    FVM_CommonDropdownButton(const FVM_CommonDropdownButton &inout Other)
    {
        this.m_bWithIcon = true;
        this.m_Dropdown = Other.m_Dropdown;
        this.m_bWithIcon = Other.m_bWithIcon;
        return;
    }
    FVM_CommonDropdownButton(const TEUIModelWeakRef<FVM_CommonDropdown> &inout InDropdown)
    {
        this.m_bWithIcon = true;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetDropdown(InDropdown);
        return;
    }
    FVM_CommonDropdownButton opAssign(const FVM_CommonDropdownButton &inout Other)
    {
        FVM_CommonDropdownButton __r;
        this.m_Dropdown = Other.m_Dropdown;
        this.m_bWithIcon = Other.m_bWithIcon;
        return __r;
    }
    bool IsDropdownOpen() const
    {
        bool local_9;
        if (this.GetDropdown().IsNull())
        {
            return false;
        }
        if (this.GetbWithIcon())
        {
            local_9 = this.GetDropdown().opArrow().GetbDropdownOpen();
        }
        else
        {
            local_9 = !(this.GetDropdown().opArrow().GetbDropdownOpen());
        }
        return local_9;
    }
    bool IsArrowRotated() const
    {
        if (this.GetDropdown().IsNull())
        {
            return false;
        }
        bool local_8 = ((!((int(this.GetDropdown().opArrow().GetExpandDirection()) == 0))) != !(this.GetDropdown().opArrow().GetbDropdownOpen()));
        return local_8;
    }
    void TriggerDropdown()
    {
        FVM_CommonDropdown& local_4;
        TEUIModelWeakRef<FVM_CommonDropdown> local_2 = this.GetDropdown();
        if (local_4)
        {
            local_4.SetDropdownOpen(!(local_4.GetbDropdownOpen()));
        }
        return;
    }
    TEUIModelWeakRef<FVM_CommonDropdown> GetDropdown() const property
    {
        this.TrackPropertyRead(0);
        return this.m_Dropdown;
    }
    void SetDropdown(const TEUIModelWeakRef<FVM_CommonDropdown> &inout __Value) property
    {
        TEUIModelWeakRef<FVM_CommonDropdown> local_2;
        local_2 = this.m_Dropdown;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_Dropdown = __Value;
        return;
    }
    bool GetbWithIcon() const property
    {
        this.TrackPropertyRead(1);
        return this.m_bWithIcon;
    }
    void SetbWithIcon(const bool __Value) property
    {
        if (!(this.m_bWithIcon) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_bWithIcon = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_CommonDropdownOption
{
    UPROPERTY()
    bool IsSelected;
    UPROPERTY()
    TEUIModelRef<FVM_CommonDropdownOption> Self;


}

struct __GeneratedProperties_FVM_CommonDropdownList
{
    UPROPERTY()
    TEUIModelRef<FVM_CommonDropdownList> ModelRef;
    UPROPERTY()
    TEUIModelRef<FVM_CommonDropdownList> Self;

    __GeneratedProperties_FVM_CommonDropdownList()
    {
        return;
    }
}

struct __GeneratedProperties_FVM_CommonDropdownButton
{
    UPROPERTY()
    bool IsDropdownOpen;
    UPROPERTY()
    bool IsArrowRotated;
    UPROPERTY()
    TEUIModelRef<FVM_CommonDropdownButton> Self;


}

namespace FVM_CommonDropdownOption
{
FVM_CommonDropdownOption& Create(const UObject ContextObject, const int Index, const TEUIModelWeakRef<FVM_CommonDropdown> &inout Dropdown)
{
    return FVM_CommonDropdownOption::CreateByManager(EUIInternal::GetContextManager(ContextObject), Index, Dropdown);
}
FVM_CommonDropdownOption CreateByManager(const UEUIManagerSubsystem Manager, const int Index, const TEUIModelWeakRef<FVM_CommonDropdown> &inout Dropdown)
{
    FVM_CommonDropdownOption __r;
    TEUIModelRef<FVM_CommonDropdownOption> local_6 = TEUIModelRef<FVM_CommonDropdownOption>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_CommonDropdownOption::ModelId, 0, Index, Dropdown));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "Visibility";
    local_14.TypeName = "ESlateVisibility";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "EnabledOpacity";
    local_14.TypeName = "float32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IsSelected";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_CommonDropdownOption>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_CommonDropdownOption;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_CommonDropdownOption;
}
ESlateVisibility __UIGetter_Visibility(const FVM_CommonDropdownOption &inout Model)
{
    return Model.GetVisibility();
}
float32 __UIGetter_EnabledOpacity(const FVM_CommonDropdownOption &inout Model)
{
    return Model.GetEnabledOpacity();
}
bool __UIGetter_IsSelected(const FVM_CommonDropdownOption &inout Model)
{
    return Model.IsSelected();
}
TEUIModelRef<FVM_CommonDropdownOption> __UIGetter_Self(const FVM_CommonDropdownOption &inout Model)
{
    return TEUIModelRef<FVM_CommonDropdownOption>(Model);
}
int __IndexOf_Index()
{
    return 0;
}
int __IndexOf_Dropdown()
{
    return 1;
}
int __IndexOf_Visibility()
{
    return 2;
}
int __IndexOf_EnabledOpacity()
{
    return 3;
}
}
namespace __GeneratedProperties_FVM_CommonDropdownOption
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
namespace FVM_CommonDropdownList
{
FVM_CommonDropdownList& Create(const UObject ContextObject, const TEUIModelWeakRef<FVM_CommonDropdown> &inout Dropdown)
{
    return FVM_CommonDropdownList::CreateByManager(EUIInternal::GetContextManager(ContextObject), Dropdown);
}
FVM_CommonDropdownList CreateByManager(const UEUIManagerSubsystem Manager, const TEUIModelWeakRef<FVM_CommonDropdown> &inout Dropdown)
{
    FVM_CommonDropdownList __r;
    TEUIModelRef<FVM_CommonDropdownList> local_6 = TEUIModelRef<FVM_CommonDropdownList>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_CommonDropdownList::ModelId, 0, Dropdown));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    // body not fully recovered вЂ” stub [opcode-uncovered]
}
UScriptStruct GetModelStruct()
{
    return FVM_CommonDropdownList;
}
void __OnOptionDatasChanged(FVM_CommonDropdownList &inout Model)
{
    Model.OnOptionDatasChanged();
    return;
}
void __HandleMsgSelected(FVM_CommonDropdownList &inout Model, const FMsg_DropdownOptionSelected &inout Message)
{
    Model.HandleMsgSelected(Message);
    return;
}
TArray<FEUIModelContainer> __UIGetter_Options(const FVM_CommonDropdownList &inout Model)
{
    return Model.GetOptions();
}
TEUIModelRef<FVM_CommonDropdownList> __UIGetter_ModelRef(const FVM_CommonDropdownList &inout Model)
{
    return Model.GetModelRef();
}
TEUIModelRef<FVM_CommonDropdownList> __UIGetter_Self(const FVM_CommonDropdownList &inout Model)
{
    return TEUIModelRef<FVM_CommonDropdownList>(Model);
}
int __IndexOf_Dropdown()
{
    return 0;
}
int __IndexOf_Options()
{
    return 1;
}
}
namespace __GeneratedProperties_FVM_CommonDropdownList
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
namespace FVM_CommonDropdownButton
{
FVM_CommonDropdownButton& Create(const UObject ContextObject, const TEUIModelWeakRef<FVM_CommonDropdown> &inout Dropdown)
{
    return FVM_CommonDropdownButton::CreateByManager(EUIInternal::GetContextManager(ContextObject), Dropdown);
}
FVM_CommonDropdownButton CreateByManager(const UEUIManagerSubsystem Manager, const TEUIModelWeakRef<FVM_CommonDropdown> &inout Dropdown)
{
    FVM_CommonDropdownButton __r;
    TEUIModelRef<FVM_CommonDropdownButton> local_6 = TEUIModelRef<FVM_CommonDropdownButton>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_CommonDropdownButton::ModelId, 0, Dropdown));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "bWithIcon";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IsDropdownOpen";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IsArrowRotated";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_CommonDropdownButton>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_CommonDropdownButton;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_CommonDropdownButton;
}
bool __UIGetter_bWithIcon(const FVM_CommonDropdownButton &inout Model)
{
    return Model.GetbWithIcon();
}
bool __UIGetter_IsDropdownOpen(const FVM_CommonDropdownButton &inout Model)
{
    return Model.IsDropdownOpen();
}
bool __UIGetter_IsArrowRotated(const FVM_CommonDropdownButton &inout Model)
{
    return Model.IsArrowRotated();
}
TEUIModelRef<FVM_CommonDropdownButton> __UIGetter_Self(const FVM_CommonDropdownButton &inout Model)
{
    return TEUIModelRef<FVM_CommonDropdownButton>(Model);
}
int __IndexOf_Dropdown()
{
    return 0;
}
int __IndexOf_bWithIcon()
{
    return 1;
}
}
namespace __GeneratedProperties_FVM_CommonDropdownButton
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
