
namespace ItemFeature_EquipMark_Util
{
    const int EQUIPMENT_ITEM_STATE_LIMIT = 0;
    const int EQUIPMENT_ITEM_STATE_EQUIP_CURRENT = 1;
    const int EQUIPMENT_ITEM_STATE_EQUIP_OTHER = 2;
    const int EQUIPMENT_ITEM_STATE_CHECKABLE = 3;
    const int EQUIPMENT_ITEM_STATE_NORMAL = 4;
}
namespace FVM_ItemFeature_EquipMark
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature OnItemSelect = FEUIModelCallbackSignature();

}
struct FVM_ItemFeature_EquipMark : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TEUIModelRef<FVM_CommonItem> m_CommonItemVM;
    UPROPERTY()
    int m_CurItemState;
    UPROPERTY()
    bool m_bCheckableSelected;
    UPROPERTY()
    int m_LimitCount;

    FVM_ItemFeature_EquipMark()
    {
        this.m_CurItemState = 4;
        this.m_bCheckableSelected = false;
        this.m_LimitCount = 0;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_ItemFeature_EquipMark' by default constructor.");
        return;
    }
    FVM_ItemFeature_EquipMark(const FVM_ItemFeature_EquipMark &inout Other)
    {
        this.m_CurItemState = 4;
        this.m_bCheckableSelected = false;
        this.m_LimitCount = 0;
        this.m_CommonItemVM = Other.m_CommonItemVM;
        this.m_CurItemState = int(Other.m_CurItemState);
        this.m_bCheckableSelected = Other.m_bCheckableSelected;
        this.m_LimitCount = int(Other.m_LimitCount);
        return;
    }
    FVM_ItemFeature_EquipMark(const TEUIModelRef<FVM_CommonItem> &inout InCommonItemVM)
    {
        this.m_CurItemState = 4;
        this.m_bCheckableSelected = false;
        this.m_LimitCount = 0;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetCommonItemVM(InCommonItemVM);
        return;
    }
    FVM_ItemFeature_EquipMark opAssign(const FVM_ItemFeature_EquipMark &inout Other)
    {
        FVM_ItemFeature_EquipMark __r;
        this.m_CommonItemVM = Other.m_CommonItemVM;
        this.m_CurItemState = int(Other.m_CurItemState);
        this.m_bCheckableSelected = Other.m_bCheckableSelected;
        this.m_LimitCount = int(Other.m_LimitCount);
        return __r;
    }
    void PostConstruct()
    {
        if (this.GetCommonItemVM().IsValid())
        {
            TEUIModelRef<FVM_CommonItem> local_2 = this.GetCommonItemVM();
            GetOnCommonItemClicked().AddUnique(this, FVM_ItemFeature_EquipMark::OnItemSelect);
        }
        return;
    }
    void BeginDestroy()
    {
        if (this.GetCommonItemVM().IsValid())
        {
            TEUIModelRef<FVM_CommonItem> local_2 = this.GetCommonItemVM();
        }
        return;
    }
    ESlateVisibility GetCurItemDisplayStateVisibility() const
    {
        int local_4;
        if (this.GetCurItemState() == 4)
        {
            local_4 = 1;
        }
        else
        {
            local_4 = 4;
        }
        return ESlateVisibility(local_4);
    }
    void OnItemSelect()
    {
        TEUIModelRef<FVM_Item> local_8;
        if (this.GetCurItemState() == 3)
        {
            this.SetbCheckableSelected(!(this.GetbCheckableSelected()));
            bool local_3 = this.GetCommonItemVM().IsValid();
            if (!(local_3))
            {
                local_3 = false;
            }
            else
            {
                TEUIModelRef<FVM_CommonItem> local_6 = this.GetCommonItemVM();
                local_8.GetItemVM();
                local_3 = local_8.IsValid();
            }
            if (local_3)
            {
                TEUIModelRef<FM_Equipment> local_12;
                TEUIModelRef<FVM_CommonItem> local_6_2 = this.GetCommonItemVM();
                local_8.GetItemVM();
                local_12.GetValidEquipmentModel();
                if (local_12.IsValid())
                {
                    FMsg_ItemFeature_EquipMark_CheckableSelectedUpdate local_16;
                    FEUIModelRef local_22 = FEUIModelRef(this);
                    FEUIMessageBus::Publish(EUIMessageBus);
                    local_16.Equipment = local_12;
                    local_16.bCheckableSelected = this.GetbCheckableSelected();
                }
            }
        }
        return;
    }
    TEUIModelRef<FVM_CommonItem> GetCommonItemVM() const property
    {
        this.TrackPropertyRead(0);
        return this.m_CommonItemVM;
    }
    void SetCommonItemVM(const TEUIModelRef<FVM_CommonItem> &inout __Value) property
    {
        TEUIModelRef<FVM_CommonItem> local_2;
        local_2 = this.m_CommonItemVM;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_CommonItemVM = __Value;
        return;
    }
    int GetCurItemState() const property
    {
        this.TrackPropertyRead(1);
        return this.m_CurItemState;
    }
    void SetCurItemState(const int __Value) property
    {
        if (this.m_CurItemState == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_CurItemState = __Value;
        return;
    }
    bool GetbCheckableSelected() const property
    {
        this.TrackPropertyRead(2);
        return this.m_bCheckableSelected;
    }
    void SetbCheckableSelected(const bool __Value) property
    {
        if (!(this.m_bCheckableSelected) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_bCheckableSelected = __Value;
        return;
    }
    int GetLimitCount() const property
    {
        this.TrackPropertyRead(3);
        return this.m_LimitCount;
    }
    void SetLimitCount(const int __Value) property
    {
        if (this.m_LimitCount == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_LimitCount = __Value;
        return;
    }
}

struct FMsg_ItemFeature_EquipMark_CheckableSelectedUpdate : FEUIMessage
{
    UPROPERTY()
    TEUIModelRef<FM_Equipment> Equipment;
    UPROPERTY()
    bool bCheckableSelected = false;


}

struct __GeneratedProperties_FVM_ItemFeature_EquipMark
{
    UPROPERTY()
    ESlateVisibility CurItemDisplayStateVisibility;
    UPROPERTY()
    TEUIModelRef<FVM_ItemFeature_EquipMark> Self;


}

namespace ItemFeature_EquipMark_Util
{
int GetItemState(const FEUIModelContainer &inout ItemModelContainer)
{
    FVM_ItemFeature_EquipMark& local_2 = FEUIModelContainer::GetModel(ItemModelContainer).opCall();
    if (local_2)
    {
        return local_2.GetCurItemState();
    }
    return 4;
}
void SetItemState(const FEUIModelContainer &inout ItemModelContainer, const int CurItemState)
{
    FVM_ItemFeature_EquipMark& local_2 = FEUIModelContainer::GetModel(ItemModelContainer).opCall();
    if (local_2)
    {
        local_2.SetCurItemState(CurItemState);
    }
    return;
}
bool GetItemIsCheckableSelected(const FEUIModelContainer &inout ItemModelContainer)
{
    FVM_ItemFeature_EquipMark& local_2 = FEUIModelContainer::GetModel(ItemModelContainer).opCall();
    if (local_2)
    {
        return local_2.GetbCheckableSelected();
    }
    return false;
}
void SetItemIsCheckableSelected(const FEUIModelContainer &inout ItemModelContainer, const bool bCheckableSelected)
{
    FVM_ItemFeature_EquipMark& local_2 = FEUIModelContainer::GetModel(ItemModelContainer).opCall();
    if (local_2)
    {
        local_2.SetbCheckableSelected(bCheckableSelected);
    }
    return;
}
void SetItemLimitCount(const FEUIModelContainer &inout ItemModelContainer, const int LimitCount)
{
    FVM_ItemFeature_EquipMark& local_2 = FEUIModelContainer::GetModel(ItemModelContainer).opCall();
    if (local_2)
    {
        local_2.SetLimitCount(LimitCount);
    }
    return;
}
void TriggerCheckableItemSelectedChange(const FEUIModelContainer &inout ItemModelContainer)
{
    FVM_ItemFeature_EquipMark& local_2 = FEUIModelContainer::GetModel(ItemModelContainer).opCall();
    if (local_2)
    {
        local_2.OnItemSelect();
    }
    return;
}
}
namespace FVM_ItemFeature_EquipMark
{
FVM_ItemFeature_EquipMark& Create(const UObject ContextObject, const TEUIModelRef<FVM_CommonItem> &inout CommonItemVM)
{
    return FVM_ItemFeature_EquipMark::CreateByManager(EUIInternal::GetContextManager(ContextObject), CommonItemVM);
}
FVM_ItemFeature_EquipMark CreateByManager(const UEUIManagerSubsystem Manager, const TEUIModelRef<FVM_CommonItem> &inout CommonItemVM)
{
    FVM_ItemFeature_EquipMark __r;
    TEUIModelRef<FVM_ItemFeature_EquipMark> local_6 = TEUIModelRef<FVM_ItemFeature_EquipMark>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_ItemFeature_EquipMark::ModelId, 0, CommonItemVM));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasBeginDestroy(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "CurItemState";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bCheckableSelected";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "LimitCount";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CurItemDisplayStateVisibility";
    local_14.TypeName = "ESlateVisibility";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_ItemFeature_EquipMark>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_ItemFeature_EquipMark;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_ItemFeature_EquipMark;
}
int __UIGetter_CurItemState(const FVM_ItemFeature_EquipMark &inout Model)
{
    return Model.GetCurItemState();
}
bool __UIGetter_bCheckableSelected(const FVM_ItemFeature_EquipMark &inout Model)
{
    return Model.GetbCheckableSelected();
}
int __UIGetter_LimitCount(const FVM_ItemFeature_EquipMark &inout Model)
{
    return Model.GetLimitCount();
}
ESlateVisibility __UIGetter_CurItemDisplayStateVisibility(const FVM_ItemFeature_EquipMark &inout Model)
{
    return Model.GetCurItemDisplayStateVisibility();
}
TEUIModelRef<FVM_ItemFeature_EquipMark> __UIGetter_Self(const FVM_ItemFeature_EquipMark &inout Model)
{
    return TEUIModelRef<FVM_ItemFeature_EquipMark>(Model);
}
int __IndexOf_CommonItemVM()
{
    return 0;
}
int __IndexOf_CurItemState()
{
    return 1;
}
int __IndexOf_bCheckableSelected()
{
    return 2;
}
int __IndexOf_LimitCount()
{
    return 3;
}
}
namespace __GeneratedProperties_FVM_ItemFeature_EquipMark
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
