
namespace FVM_InventoryItem
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature FixItem = FEUIModelCallbackSignature();

}
struct FItemModelData
{
    UPROPERTY()
    TEUIModelRef<FM_ItemData> ItemDataModel;

    FItemModelData()
    {
        return;
    }
    FItemModelData(const TEUIModelRef<FM_ItemData> &inout InItemDataModel)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
}

struct FVM_InventoryItem : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TEUIModelRef<FM_ItemData> m_Item;
    UPROPERTY()
    TEUIModelWeakRef<FVM_Inventory> m_Inventory;
    UPROPERTY()
    bool m_bIsValid;
    UPROPERTY()
    FEUIModelContainer m_ItemModels;
    UPROPERTY()
    TEUIModelRef<FVM_CommonItem> m_CommonItemVM;
    UPROPERTY()
    TEUIModelWeakRef<FVM_ItemOperationList> m_ItemOperationList;

    FVM_InventoryItem()
    {
        this.m_bIsValid = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_InventoryItem' by default constructor.");
        return;
    }
    FVM_InventoryItem(const FVM_InventoryItem &inout Other)
    {
        this.m_bIsValid = false;
        this.m_Item = Other.m_Item;
        this.m_Inventory = Other.m_Inventory;
        this.m_bIsValid = Other.m_bIsValid;
        this.m_ItemModels = Other.m_ItemModels;
        this.m_CommonItemVM = Other.m_CommonItemVM;
        this.m_ItemOperationList = Other.m_ItemOperationList;
        return;
    }
    FVM_InventoryItem(const TEUIModelRef<FM_ItemData> &inout InItem, const TEUIModelWeakRef<FVM_Inventory> &inout InInventory)
    {
        this.m_bIsValid = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetItem(InItem);
        this.SetInventory(InInventory);
        return;
    }
    FVM_InventoryItem& opAssign(const FVM_InventoryItem &inout Other)
    {
        this.m_Item = Other.m_Item;
        this.m_Inventory = Other.m_Inventory;
        this.m_bIsValid = Other.m_bIsValid;
        this.m_ItemModels = Other.m_ItemModels;
        this.m_CommonItemVM = Other.m_CommonItemVM;
        return Other.m_ItemOperationList;
    }
    void PostConstruct()
    {
        this.RefreshItemModel();
        return;
    }
    bool IsValid() const
    {
        bool local_3;
        if (!(this.GetItem().IsValid()))
        {
            local_3 = false;
        }
        else
        {
            local_3 = this.GetItem().opArrow().GetConfig();
        }
        return local_3;
    }
    bool IsFixed() const
    {
        FVM_Inventory& local_4;
        TEUIModelWeakRef<FVM_Inventory> local_2 = this.GetInventory();
        if (local_4)
        {
            return (local_4.GetFixedItem() == FEUIModelRef(this));
        }
        return false;
    }
    bool HasNoOtherFixedItem() const
    {
        FVM_Inventory& local_4;
        TEUIModelWeakRef<FVM_Inventory> local_2 = this.GetInventory();
        if (local_4)
        {
            return local_4.GetFixedItem() && !((local_4.GetFixedItem() == FEUIModelRef(this)));
        }
        return true;
    }
    bool GetIsEquiped() const
    {
        bool local_3 = this.GetCommonItemVM().IsValid();
        if (!(local_3))
        {
            local_3 = false;
        }
        else
        {
            TEUIModelRef<FVM_Item> local_6;
            TEUIModelRef<FVM_CommonItem> local_2 = this.GetCommonItemVM();
            local_6.GetItemVM();
            local_3 = local_6.IsValid();
        }
        if (local_3)
        {
            TEUIModelRef<FVM_Item> local_6;
            TEUIModelRef<FVM_CommonItem> local_2_2 = this.GetCommonItemVM();
            local_6.GetItemVM();
            return GetIsEquiped();
        }
        return false;
    }
    FText GetEquipItemLevelText() const
    {
        bool local_3 = this.GetCommonItemVM().IsValid();
        if (!(local_3))
        {
            local_3 = false;
        }
        else
        {
            TEUIModelRef<FVM_Item> local_6;
            TEUIModelRef<FVM_CommonItem> local_2 = this.GetCommonItemVM();
            local_6.GetItemVM();
            local_3 = local_6.IsValid();
        }
        FText local_12;
        if (local_3)
        {
            TEUIModelRef<FVM_Item> local_6;
            TEUIModelRef<FVM_CommonItem> local_2_2 = this.GetCommonItemVM();
            local_6.GetItemVM();
            local_12.GetEquipmentLevelText();
            return local_12;
        }
        return local_12;
    }
    int GetItemNum() const
    {
        bool local_3 = this.GetCommonItemVM().IsValid();
        if (!(local_3))
        {
            local_3 = false;
        }
        else
        {
            TEUIModelRef<FVM_Item> local_6;
            TEUIModelRef<FVM_CommonItem> local_2 = this.GetCommonItemVM();
            local_6.GetItemVM();
            local_3 = local_6.IsValid();
        }
        if (local_3)
        {
            TEUIModelRef<FVM_Item> local_6;
            TEUIModelRef<FVM_CommonItem> local_2_2 = this.GetCommonItemVM();
            local_6.GetItemVM();
            return GetNum();
        }
        return 0;
    }
    bool GetIsShowItemNum() const
    {
        bool local_1 = false;
        bool local_2 = this.GetCommonItemVM().IsValid();
        if (!(local_2))
        {
            local_2 = false;
        }
        else
        {
            TEUIModelRef<FVM_Item> local_6;
            TEUIModelRef<FVM_CommonItem> local_4 = this.GetCommonItemVM();
            local_6.GetItemVM();
            local_2 = local_6.IsValid();
        }
        if (local_2)
        {
            TEUIModelRef<FVM_Item> local_6;
            TEUIModelRef<FVM_CommonItem> local_4_2 = this.GetCommonItemVM();
            local_6.GetItemVM();
            local_1 = GetCanShowEquipInfoDetail();
        }
        return this.GetItemNum() > 0 && !(local_1);
    }
    void OnInventoryChanged(const FMsg_PlayerInventoryChanged &inout Msg)
    {
        this.RefreshItemModel();
        return;
    }
    void FixItem()
    {
        int local_4 = 0;
        TEUIModelRef<FVM_InventoryItem> local_8;
        TEUIModelWeakRef<FVM_Inventory> local_2 = this.GetInventory();
        if (this.IsValid())
        {
            if (local_4.GetFixedItem().IsValid() && !((local_4.GetFixedItem() == FEUIModelRef(this))))
            {
                local_8 = local_4.GetFixedItem();
                FVM_ItemOperationList& local_18 = FEUIModelContainer::GetModel(GetItemModels()).opCall();
                if (local_18)
                {
                    local_18.SetbShowList(false);
                }
            }
            local_8 = TEUIModelRef<FVM_InventoryItem>(this);
            local_4.SetFixedItem(local_8);
            this.SetItemOperationList(TEUIModelWeakRef<FVM_ItemOperationList>(FEUIModelContainer::GetModel(this.GetItemModels()).opCall()));
            if (this.GetItemOperationList().IsValid())
            {
                this.GetItemOperationList().opArrow().SetbShowList(true);
            }
            return;
        }
        local_4.SetFixedItem(local_8);
        return;
    }
    void OnItemOperationListShowListChanged()
    {
        if (!(this.GetItemOperationList().opArrow().GetbShowList()))
        {
            TEUIModelRef<FVM_InventoryItem> local_8 = this.GetInventory().opArrow().GetFixedItem();
            if ((local_8 == FEUIModelRef(this)))
            {
                this.GetInventory().opArrow().SetFixedItem(local_8);
            }
        }
        return;
    }
    void RefreshItemModel()
    {
        int local_4 = 0;
        bool local_7;
        int local_33;
        TEUIModelRef<FM_ItemData> local_2 = this.GetItem();
        TEUIModelRef<FVM_CommonItem> local_6 = this.GetCommonItemVM();
        if (!(local_6.IsValid()))
        {
            TEUIModelRef<FVM_CommonItem> local_6_2 = TEUIModelRef<FVM_CommonItem>(::FVM_CommonItem::Create(this.GetContext().Manager, this.GetItem()));
            this.SetCommonItemVM(local_6_2);
            FCommonItemClicked local_30;
            local_30.AddUnique(this, FVM_InventoryItem::FixItem);
            TEUIModelRef<FVM_CommonItem> local_6_3 = this.GetCommonItemVM();
            local_30.SetOnCommonItemClicked();
        }
        TEUIModelRef<FM_ItemData> local_2_2 = this.GetItem();
        TEUIModelRef<FVM_CommonItem> local_6_4 = this.GetCommonItemVM();
        local_2_2.SetItemDataModel();
        if (local_4)
        {
            local_33 = local_4.GetNum();
        }
        else
        {
            local_33 = 0;
        }
        if (local_33 <= 0)
        {
            local_7 = false;
        }
        else
        {
            local_7 = local_4.GetConfig();
        }
        this.SetbIsValid(local_7);
        if (!(this.GetbIsValid()))
        {
            return;
        }
        FItemModelData local_36;
        local_36.ItemDataModel = this.GetItem();
        FEUIModelContainer::MakeCached local_50;
        this.SetItemModels(local_50.opImplConv());
        this.SetItemOperationList(TEUIModelWeakRef<FVM_ItemOperationList>(FEUIModelContainer::GetModel(this.GetItemModels()).opCall()));
        if (this.GetItemOperationList().IsValid())
        {
            this.GetItemOperationList().opArrow().SetbShowList(false);
        }
        return;
    }
    TEUIModelRef<FM_ItemData> GetItem() const property
    {
        this.TrackPropertyRead(0);
        return this.m_Item;
    }
    void SetItem(const TEUIModelRef<FM_ItemData> &inout __Value) property
    {
        TEUIModelRef<FM_ItemData> local_2;
        local_2 = this.m_Item;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_Item = __Value;
        return;
    }
    TEUIModelWeakRef<FVM_Inventory> GetInventory() const property
    {
        this.TrackPropertyRead(1);
        return this.m_Inventory;
    }
    void SetInventory(const TEUIModelWeakRef<FVM_Inventory> &inout __Value) property
    {
        TEUIModelWeakRef<FVM_Inventory> local_2;
        local_2 = this.m_Inventory;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_Inventory = __Value;
        return;
    }
    bool GetbIsValid() const property
    {
        this.TrackPropertyRead(2);
        return this.m_bIsValid;
    }
    void SetbIsValid(const bool __Value) property
    {
        if (!(this.m_bIsValid) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_bIsValid = __Value;
        return;
    }
    FEUIModelContainer GetItemModels() const property
    {
        FEUIModelContainer __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    FEUIModelContainer GetModify_ItemModels() property
    {
        FEUIModelContainer __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetItemModels(const FEUIModelContainer &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_ItemModels = __Value;
        return;
    }
    TEUIModelRef<FVM_CommonItem> GetCommonItemVM() const property
    {
        this.TrackPropertyRead(4);
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
        this.MarkPropertyDirty(4);
        this.m_CommonItemVM = __Value;
        return;
    }
    TEUIModelWeakRef<FVM_ItemOperationList> GetItemOperationList() const property
    {
        this.TrackPropertyRead(5);
        return this.m_ItemOperationList;
    }
    void SetItemOperationList(const TEUIModelWeakRef<FVM_ItemOperationList> &inout __Value) property
    {
        TEUIModelWeakRef<FVM_ItemOperationList> local_2;
        local_2 = this.m_ItemOperationList;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_ItemOperationList = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_InventoryItem
{
    UPROPERTY()
    bool IsValid;
    UPROPERTY()
    bool IsFixed;
    UPROPERTY()
    bool HasNoOtherFixedItem;
    UPROPERTY()
    bool IsEquiped;
    UPROPERTY()
    FText EquipItemLevelText;
    UPROPERTY()
    int ItemNum;
    UPROPERTY()
    bool IsShowItemNum;
    UPROPERTY()
    TEUIModelRef<FVM_InventoryItem> Self;


}

namespace FVM_InventoryItem
{
FVM_InventoryItem& Create(const UObject ContextObject, const TEUIModelRef<FM_ItemData> &inout Item, const TEUIModelWeakRef<FVM_Inventory> &inout Inventory)
{
    return FVM_InventoryItem::CreateByManager(EUIInternal::GetContextManager(ContextObject), Item, Inventory);
}
FVM_InventoryItem CreateByManager(const UEUIManagerSubsystem Manager, const TEUIModelRef<FM_ItemData> &inout Item, const TEUIModelWeakRef<FVM_Inventory> &inout Inventory)
{
    FVM_InventoryItem __r;
    TEUIModelRef<FVM_InventoryItem> local_6 = TEUIModelRef<FVM_InventoryItem>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_InventoryItem::ModelId, 0, Item, Inventory));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    // body not fully recovered вЂ” stub [opcode-uncovered]
}
UScriptStruct GetModelStruct()
{
    return FVM_InventoryItem;
}
void __OnInventoryChanged(FVM_InventoryItem &inout Model, const FMsg_PlayerInventoryChanged &inout Message)
{
    Model.OnInventoryChanged(Message);
    return;
}
void __OnItemOperationListShowListChanged(FVM_InventoryItem &inout Model)
{
    Model.OnItemOperationListShowListChanged();
    return;
}
bool __UIGetter_bIsValid(const FVM_InventoryItem &inout Model)
{
    return Model.GetbIsValid();
}
FEUIModelContainer __UIGetter_ItemModels(const FVM_InventoryItem &inout Model)
{
    return Model.GetItemModels();
}
TEUIModelRef<FVM_CommonItem> __UIGetter_CommonItemVM(const FVM_InventoryItem &inout Model)
{
    return Model.GetCommonItemVM();
}
TEUIModelWeakRef<FVM_ItemOperationList> __UIGetter_ItemOperationList(const FVM_InventoryItem &inout Model)
{
    return Model.GetItemOperationList();
}
bool __UIGetter_IsValid(const FVM_InventoryItem &inout Model)
{
    return Model.IsValid();
}
bool __UIGetter_IsFixed(const FVM_InventoryItem &inout Model)
{
    return Model.IsFixed();
}
bool __UIGetter_HasNoOtherFixedItem(const FVM_InventoryItem &inout Model)
{
    return Model.HasNoOtherFixedItem();
}
bool __UIGetter_IsEquiped(const FVM_InventoryItem &inout Model)
{
    return Model.GetIsEquiped();
}
FText __UIGetter_EquipItemLevelText(const FVM_InventoryItem &inout Model)
{
    return Model.GetEquipItemLevelText();
}
int __UIGetter_ItemNum(const FVM_InventoryItem &inout Model)
{
    return Model.GetItemNum();
}
bool __UIGetter_IsShowItemNum(const FVM_InventoryItem &inout Model)
{
    return Model.GetIsShowItemNum();
}
TEUIModelRef<FVM_InventoryItem> __UIGetter_Self(const FVM_InventoryItem &inout Model)
{
    return TEUIModelRef<FVM_InventoryItem>(Model);
}
int __IndexOf_Item()
{
    return 0;
}
int __IndexOf_Inventory()
{
    return 1;
}
int __IndexOf_bIsValid()
{
    return 2;
}
int __IndexOf_ItemModels()
{
    return 3;
}
int __IndexOf_CommonItemVM()
{
    return 4;
}
int __IndexOf_ItemOperationList()
{
    return 5;
}
}
namespace __GeneratedProperties_FVM_InventoryItem
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
