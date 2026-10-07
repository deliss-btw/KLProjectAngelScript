
namespace FVM_SelectableItem
{
    const int ModelId = 0;
}
namespace FVM_CommonTabItem
{
    const int ModelId = 0;

}
struct FVM_SelectableItem : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    bool m_bIsSelected;

    FVM_SelectableItem()
    {
        this.m_bIsSelected = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVM_SelectableItem(const FVM_SelectableItem &inout Other)
    {
        this.m_bIsSelected = false;
        this.m_bIsSelected = Other.m_bIsSelected;
        return;
    }
    FVM_SelectableItem opAssign(const FVM_SelectableItem &inout Other)
    {
        FVM_SelectableItem __r;
        this.m_bIsSelected = Other.m_bIsSelected;
        return __r;
    }
    void OnItemSelectionChanged(const FMsg_OnItemSelectionChanged &inout Changed)
    {
        this.SetbIsSelected((int(Changed.bIsSelected) != 0));
        return;
    }
    bool GetbIsSelected() const property
    {
        this.TrackPropertyRead(0);
        return this.m_bIsSelected;
    }
    void SetbIsSelected(const bool __Value) property
    {
        if (!(this.m_bIsSelected) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_bIsSelected = __Value;
        return;
    }
}

struct FVM_CommonTabItem : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    FText m_TitleText;
    UPROPERTY()
    bool m_bWithEquipState;
    UPROPERTY()
    bool m_bIsEquip;

    FVM_CommonTabItem()
    {
        this.m_bWithEquipState = false;
        this.m_bIsEquip = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVM_CommonTabItem(const FVM_CommonTabItem &inout Other)
    {
        this.m_bWithEquipState = false;
        this.m_bIsEquip = false;
        this.m_TitleText = Other.m_TitleText;
        this.m_bWithEquipState = Other.m_bWithEquipState;
        this.m_bIsEquip = Other.m_bIsEquip;
        return;
    }
    FVM_CommonTabItem opAssign(const FVM_CommonTabItem &inout Other)
    {
        FVM_CommonTabItem __r;
        this.m_TitleText = Other.m_TitleText;
        this.m_bWithEquipState = Other.m_bWithEquipState;
        this.m_bIsEquip = Other.m_bIsEquip;
        return __r;
    }
    ESlateVisibility GetEquipStateVisibility() const
    {
        int local_2;
        if (this.GetbWithEquipState())
        {
            local_2 = 4;
        }
        else
        {
            local_2 = 1;
        }
        return ESlateVisibility(local_2);
    }
    int GetEquipStateSwitcherIndex() const
    {
        return this.GetbIsEquip() ? 1 : 0;
    }
    FText GetTitleText() const property
    {
        FText __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    FText GetModify_TitleText() property
    {
        FText __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetTitleText(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_TitleText = __Value;
        return;
    }
    bool GetbWithEquipState() const property
    {
        this.TrackPropertyRead(1);
        return this.m_bWithEquipState;
    }
    void SetbWithEquipState(const bool __Value) property
    {
        if (!(this.m_bWithEquipState) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_bWithEquipState = __Value;
        return;
    }
    bool GetbIsEquip() const property
    {
        this.TrackPropertyRead(2);
        return this.m_bIsEquip;
    }
    void SetbIsEquip(const bool __Value) property
    {
        if (!(this.m_bIsEquip) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_bIsEquip = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_SelectableItem
{
    UPROPERTY()
    TEUIModelRef<FVM_SelectableItem> Self;

    __GeneratedProperties_FVM_SelectableItem()
    {
        return;
    }
}

struct __GeneratedProperties_FVM_CommonTabItem
{
    UPROPERTY()
    ESlateVisibility EquipStateVisibility;
    UPROPERTY()
    int EquipStateSwitcherIndex;
    UPROPERTY()
    TEUIModelRef<FVM_CommonTabItem> Self;


}

namespace FVM_SelectableItem
{
FVM_SelectableItem& Create(const UObject ContextObject)
{
    return FVM_SelectableItem::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_SelectableItem CreateByManager(const UEUIManagerSubsystem Manager)
{
    FVM_SelectableItem __r;
    TEUIModelRef<FVM_SelectableItem> local_6 = TEUIModelRef<FVM_SelectableItem>(EUIInternal::MakeModelWithManager(Manager, FVM_SelectableItem::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "bIsSelected";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_SelectableItem>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_SelectableItem;
    FEUIModelMsgHandleDefine local_26;
    local_26.FunctionName = "__OnItemSelectionChanged";
    local_26.MessageTypeName = "Msg_OnItemSelectionChanged";
    local_26.SourcePropertyModelRefs = FBitSet64(-1);
    Result.MessageHandleFunctions.Add(local_26);
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_SelectableItem;
}
void __OnItemSelectionChanged(FVM_SelectableItem &inout Model, const FMsg_OnItemSelectionChanged &inout Message)
{
    Model.OnItemSelectionChanged(Message);
    return;
}
bool __UIGetter_bIsSelected(const FVM_SelectableItem &inout Model)
{
    return Model.GetbIsSelected();
}
TEUIModelRef<FVM_SelectableItem> __UIGetter_Self(const FVM_SelectableItem &inout Model)
{
    return TEUIModelRef<FVM_SelectableItem>(Model);
}
int __IndexOf_bIsSelected()
{
    return 0;
}
}
namespace __GeneratedProperties_FVM_SelectableItem
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
namespace FVM_CommonTabItem
{
FVM_CommonTabItem& Create(const UObject ContextObject)
{
    return FVM_CommonTabItem::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_CommonTabItem CreateByManager(const UEUIManagerSubsystem Manager)
{
    FVM_CommonTabItem __r;
    TEUIModelRef<FVM_CommonTabItem> local_6 = TEUIModelRef<FVM_CommonTabItem>(EUIInternal::MakeModelWithManager(Manager, FVM_CommonTabItem::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "TitleText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bWithEquipState";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bIsEquip";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "EquipStateVisibility";
    local_14.TypeName = "ESlateVisibility";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "EquipStateSwitcherIndex";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_CommonTabItem>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_CommonTabItem;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_CommonTabItem;
}
FText __UIGetter_TitleText(const FVM_CommonTabItem &inout Model)
{
    return Model.GetTitleText();
}
bool __UIGetter_bWithEquipState(const FVM_CommonTabItem &inout Model)
{
    return Model.GetbWithEquipState();
}
bool __UIGetter_bIsEquip(const FVM_CommonTabItem &inout Model)
{
    return Model.GetbIsEquip();
}
ESlateVisibility __UIGetter_EquipStateVisibility(const FVM_CommonTabItem &inout Model)
{
    return Model.GetEquipStateVisibility();
}
int __UIGetter_EquipStateSwitcherIndex(const FVM_CommonTabItem &inout Model)
{
    return Model.GetEquipStateSwitcherIndex();
}
TEUIModelRef<FVM_CommonTabItem> __UIGetter_Self(const FVM_CommonTabItem &inout Model)
{
    return TEUIModelRef<FVM_CommonTabItem>(Model);
}
int __IndexOf_TitleText()
{
    return 0;
}
int __IndexOf_bWithEquipState()
{
    return 1;
}
int __IndexOf_bIsEquip()
{
    return 2;
}
}
namespace __GeneratedProperties_FVM_CommonTabItem
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
