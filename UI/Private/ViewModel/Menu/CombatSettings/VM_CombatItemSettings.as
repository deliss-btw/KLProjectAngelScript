
namespace FVM_CombatItemSettings
{
    const int ModelId = 0;

}
struct FVM_CombatItemSettings : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TDataObjectPtr<FItemQuickSlotConfig> m_ItemQuickSlotConfig;
    UPROPERTY()
    TArray<FEUIModelContainer> m_DisplayingItems;
    UPROPERTY()
    TEUIModelRef<FVM_Item> m_SelectedItem;

    FVM_CombatItemSettings()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVM_CombatItemSettings(const FVM_CombatItemSettings &inout Other)
    {
        this.m_ItemQuickSlotConfig = Other.m_ItemQuickSlotConfig;
        this.m_DisplayingItems = Other.m_DisplayingItems;
        this.m_SelectedItem = Other.m_SelectedItem;
        return;
    }
    FVM_CombatItemSettings& opAssign(const FVM_CombatItemSettings &inout Other)
    {
        this.m_ItemQuickSlotConfig = Other.m_ItemQuickSlotConfig;
        this.m_DisplayingItems = Other.m_DisplayingItems;
        return Other.m_SelectedItem;
    }
    void LoadConfig(const FConfigVM_CombatItemSettings &inout InConfig)
    {
        this.SetItemQuickSlotConfig(InConfig.ItemQuickSlotConfig);
        return;
    }
    void PostLoad()
    {
        if (!(this.GetItemQuickSlotConfig()))
        {
            XError(ELog(16), "ItemQuickSlotConfig not set");
            return;
        }
        for (auto& local_24 : ::InventoryUtils::GetAllValidItemsForQuickSlot(this.GetContext().GetLocalPlayer(), this.GetItemQuickSlotConfig()))
        {
            FItemModelData local_26;
            local_26.ItemDataModel = ::FMS_PlayerInventory::Get(this.GetContext().Manager).GetSumItem(local_24);
            Make local_42;
            this.GetModify_DisplayingItems().Add(local_42.opImplConv());
        }
        return;
    }
    const TDataObjectPtr<FItemQuickSlotConfig> GetItemQuickSlotConfig() const property
    {
        const TDataObjectPtr<FItemQuickSlotConfig> __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    TDataObjectPtr<FItemQuickSlotConfig> GetModify_ItemQuickSlotConfig() property
    {
        TDataObjectPtr<FItemQuickSlotConfig> __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetItemQuickSlotConfig(const TDataObjectPtr<FItemQuickSlotConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_ItemQuickSlotConfig = __Value;
        return;
    }
    const TArray<FEUIModelContainer> GetDisplayingItems() const property
    {
        const TArray<FEUIModelContainer> __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    TArray<FEUIModelContainer> GetModify_DisplayingItems() property
    {
        TArray<FEUIModelContainer> __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetDisplayingItems(const TArray<FEUIModelContainer> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_DisplayingItems = __Value;
        return;
    }
    TEUIModelRef<FVM_Item> GetSelectedItem() const property
    {
        this.TrackPropertyRead(2);
        return this.m_SelectedItem;
    }
    void SetSelectedItem(const TEUIModelRef<FVM_Item> &inout __Value) property
    {
        TEUIModelRef<FVM_Item> local_2;
        local_2 = this.m_SelectedItem;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_SelectedItem = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_CombatItemSettings
{
    UPROPERTY()
    TEUIModelRef<FVM_CombatItemSettings> Self;

    __GeneratedProperties_FVM_CombatItemSettings()
    {
        return;
    }
}

namespace FVM_CombatItemSettings
{
FVM_CombatItemSettings& Create(const UObject ContextObject)
{
    return FVM_CombatItemSettings::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_CombatItemSettings CreateByManager(const UEUIManagerSubsystem Manager)
{
    FVM_CombatItemSettings __r;
    TEUIModelRef<FVM_CombatItemSettings> local_6 = TEUIModelRef<FVM_CombatItemSettings>(EUIInternal::MakeModelWithManager(Manager, FVM_CombatItemSettings::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostLoad(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(true);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "DisplayingItems";
    local_14.TypeName = "TArray<FEUIModelContainer>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "SelectedItem";
    local_14.TypeName = "TEUIModelRef<FVM_Item>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_CombatItemSettings>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_CombatItemSettings;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_CombatItemSettings;
}
TArray<FEUIModelContainer> __UIGetter_DisplayingItems(const FVM_CombatItemSettings &inout Model)
{
    return Model.GetDisplayingItems();
}
TEUIModelRef<FVM_Item> __UIGetter_SelectedItem(const FVM_CombatItemSettings &inout Model)
{
    return Model.GetSelectedItem();
}
TEUIModelRef<FVM_CombatItemSettings> __UIGetter_Self(const FVM_CombatItemSettings &inout Model)
{
    return TEUIModelRef<FVM_CombatItemSettings>(Model);
}
int __IndexOf_ItemQuickSlotConfig()
{
    return 0;
}
int __IndexOf_DisplayingItems()
{
    return 1;
}
int __IndexOf_SelectedItem()
{
    return 2;
}
}
namespace __GeneratedProperties_FVM_CombatItemSettings
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
