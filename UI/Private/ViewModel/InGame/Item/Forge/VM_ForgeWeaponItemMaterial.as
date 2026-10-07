
namespace FVM_ForgeWeaponItemMaterial
{
    const int ModelId = 0;

}
struct FVM_ForgeWeaponItemMaterial : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    bool m_bUnlock;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_ForgeWeaponItemMaterialItem>> m_ConsumeItemList;
    UPROPERTY()
    FItemParamConfig m_CurrencyConfig;
    UPROPERTY()
    FSoftBrush m_CurrencyImage;
    UPROPERTY()
    int m_CurrencyNum;
    UPROPERTY()
    ESlateVisibility m_CurrencyVisibility;
    UPROPERTY()
    TEUIModelRef<FM_ItemData> m_InventoryItemData;

    FVM_ForgeWeaponItemMaterial()
    {
        this.m_CurrencyNum = 0;
        this.m_CurrencyVisibility = ESlateVisibility(0);
        this.m_bUnlock = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_ForgeWeaponItemMaterial' by default constructor.");
        return;
    }
    FVM_ForgeWeaponItemMaterial(const FVM_ForgeWeaponItemMaterial &inout Other)
    {
        this.m_CurrencyNum = 0;
        this.m_CurrencyVisibility = ESlateVisibility(0);
        this.m_bUnlock = false;
        this.m_bUnlock = Other.m_bUnlock;
        this.m_ConsumeItemList = Other.m_ConsumeItemList;
        this.m_CurrencyImage = Other.m_CurrencyImage;
        this.m_CurrencyNum = int(Other.m_CurrencyNum);
        this.m_CurrencyVisibility = Other.m_CurrencyVisibility;
        this.m_InventoryItemData = Other.m_InventoryItemData;
        return;
    }
    FVM_ForgeWeaponItemMaterial(const bool InbUnlock, const TArray<TEUIModelRef<FVM_ForgeWeaponItemMaterialItem>> &inout InConsumeItemList, const FItemParamConfig &inout InCurrencyConfig)
    {
        this.m_CurrencyNum = 0;
        this.m_CurrencyVisibility = ESlateVisibility(0);
        this.m_bUnlock = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetbUnlock(InbUnlock);
        this.SetConsumeItemList(InConsumeItemList);
        this.SetCurrencyConfig(InCurrencyConfig);
        return;
    }
    FVM_ForgeWeaponItemMaterial& opAssign(const FVM_ForgeWeaponItemMaterial &inout Other)
    {
        this.m_bUnlock = Other.m_bUnlock;
        this.m_ConsumeItemList = Other.m_ConsumeItemList;
        this.m_CurrencyImage = Other.m_CurrencyImage;
        this.m_CurrencyNum = int(Other.m_CurrencyNum);
        this.m_CurrencyVisibility = Other.m_CurrencyVisibility;
        return Other.m_InventoryItemData;
    }
    void PostConstruct()
    {
        int local_32;
        if (this.GetCurrencyConfig().Item)
        {
            TDataObjectPtr<FItemConfig> local_26;
            this.SetInventoryItemData(::FMS_PlayerInventory::Get(this.GetContext().Manager).GetSumItem(local_26));
        }
        this.SetCurrencyNum(this.GetCurrencyConfig().Count);
        if (this.GetCurrencyNum() > 0)
        {
            int local_33;
            local_33 = 4;
            local_32 = local_33;
        }
        else
        {
            int local_33;
            local_33 = 1;
            local_32 = local_33;
        }
        this.SetCurrencyVisibility(ESlateVisibility(local_32));
        return;
    }
    FSlateColor GetCurrencyTextColor() const
    {
        const UUtilitySettings local_2;
        GetGameplaySettings<UUtilitySettings> local_4;
        local_2 = local_4;
        bool local_15 = this.GetInventoryItemData();
        if (!(local_15))
        {
            local_15 = false;
        }
        else
        {
            TEUIModelRef<FM_ItemData> local_14 = this.GetInventoryItemData();
            local_15 = (GetNum() < this.GetCurrencyNum());
        }
        if (local_15)
        {
            return FSlateColor(local_2.ItemInsufficientQuantityTextColor);
        }
        return FSlateColor(local_2.ItemSufficientQuantityTextColor);
    }
    bool GetbUnlock() const property
    {
        this.TrackPropertyRead(0);
        return this.m_bUnlock;
    }
    void SetbUnlock(const bool __Value) property
    {
        if (!(this.m_bUnlock) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_bUnlock = __Value;
        return;
    }
    const TArray<TEUIModelRef<FVM_ForgeWeaponItemMaterialItem>> GetConsumeItemList() const property
    {
        const TArray<TEUIModelRef<FVM_ForgeWeaponItemMaterialItem>> __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    TArray<TEUIModelRef<FVM_ForgeWeaponItemMaterialItem>> GetModify_ConsumeItemList() property
    {
        TArray<TEUIModelRef<FVM_ForgeWeaponItemMaterialItem>> __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetConsumeItemList(const TArray<TEUIModelRef<FVM_ForgeWeaponItemMaterialItem>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_ConsumeItemList = __Value;
        return;
    }
    const FItemParamConfig GetCurrencyConfig() const property
    {
        const FItemParamConfig __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    FItemParamConfig GetModify_CurrencyConfig() property
    {
        FItemParamConfig __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetCurrencyConfig(const FItemParamConfig &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        return;
    }
    const FSoftBrush GetCurrencyImage() const property
    {
        const FSoftBrush __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    FSoftBrush GetModify_CurrencyImage() property
    {
        FSoftBrush __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetCurrencyImage(const FSoftBrush &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_CurrencyImage = __Value;
        return;
    }
    int GetCurrencyNum() const property
    {
        this.TrackPropertyRead(4);
        return this.m_CurrencyNum;
    }
    void SetCurrencyNum(const int __Value) property
    {
        if (this.m_CurrencyNum == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_CurrencyNum = __Value;
        return;
    }
    ESlateVisibility GetCurrencyVisibility() const property
    {
        this.TrackPropertyRead(5);
        return this.m_CurrencyVisibility;
    }
    void SetCurrencyVisibility(const ESlateVisibility __Value) property
    {
        if (int(this.m_CurrencyVisibility) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_CurrencyVisibility = __Value;
        return;
    }
    TEUIModelRef<FM_ItemData> GetInventoryItemData() const property
    {
        this.TrackPropertyRead(6);
        return this.m_InventoryItemData;
    }
    void SetInventoryItemData(const TEUIModelRef<FM_ItemData> &inout __Value) property
    {
        TEUIModelRef<FM_ItemData> local_2;
        local_2 = this.m_InventoryItemData;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_InventoryItemData = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_ForgeWeaponItemMaterial
{
    UPROPERTY()
    FSlateColor CurrencyTextColor;
    UPROPERTY()
    TEUIModelRef<FVM_ForgeWeaponItemMaterial> Self;

    __GeneratedProperties_FVM_ForgeWeaponItemMaterial()
    {
        return;
    }
}

namespace FVM_ForgeWeaponItemMaterial
{
FVM_ForgeWeaponItemMaterial& Create(const UObject ContextObject, const bool bUnlock, const TArray<TEUIModelRef<FVM_ForgeWeaponItemMaterialItem>> &inout ConsumeItemList, const FItemParamConfig &inout CurrencyConfig)
{
    return FVM_ForgeWeaponItemMaterial::CreateByManager(EUIInternal::GetContextManager(ContextObject), bUnlock, ConsumeItemList, CurrencyConfig);
}
FVM_ForgeWeaponItemMaterial CreateByManager(const UEUIManagerSubsystem Manager, const bool bUnlock, const TArray<TEUIModelRef<FVM_ForgeWeaponItemMaterialItem>> &inout ConsumeItemList, const FItemParamConfig &inout CurrencyConfig)
{
    FVM_ForgeWeaponItemMaterial __r;
    TEUIModelRef<FVM_ForgeWeaponItemMaterial> local_6 = TEUIModelRef<FVM_ForgeWeaponItemMaterial>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_ForgeWeaponItemMaterial::ModelId, 0, bUnlock, ConsumeItemList, CurrencyConfig));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "bUnlock";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ConsumeItemList";
    local_14.TypeName = "TArray<TEUIModelRef<FVM_ForgeWeaponItemMaterialItem>>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CurrencyImage";
    local_14.TypeName = "FSoftBrush";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CurrencyNum";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CurrencyVisibility";
    local_14.TypeName = "ESlateVisibility";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CurrencyTextColor";
    local_14.TypeName = "FSlateColor";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_ForgeWeaponItemMaterial>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_ForgeWeaponItemMaterial;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_ForgeWeaponItemMaterial;
}
bool __UIGetter_bUnlock(const FVM_ForgeWeaponItemMaterial &inout Model)
{
    return Model.GetbUnlock();
}
TArray<TEUIModelRef<FVM_ForgeWeaponItemMaterialItem>> __UIGetter_ConsumeItemList(const FVM_ForgeWeaponItemMaterial &inout Model)
{
    return Model.GetConsumeItemList();
}
FSoftBrush __UIGetter_CurrencyImage(const FVM_ForgeWeaponItemMaterial &inout Model)
{
    return Model.GetCurrencyImage();
}
int __UIGetter_CurrencyNum(const FVM_ForgeWeaponItemMaterial &inout Model)
{
    return Model.GetCurrencyNum();
}
ESlateVisibility __UIGetter_CurrencyVisibility(const FVM_ForgeWeaponItemMaterial &inout Model)
{
    return Model.GetCurrencyVisibility();
}
FSlateColor __UIGetter_CurrencyTextColor(const FVM_ForgeWeaponItemMaterial &inout Model)
{
    return Model.GetCurrencyTextColor();
}
TEUIModelRef<FVM_ForgeWeaponItemMaterial> __UIGetter_Self(const FVM_ForgeWeaponItemMaterial &inout Model)
{
    return TEUIModelRef<FVM_ForgeWeaponItemMaterial>(Model);
}
int __IndexOf_bUnlock()
{
    return 0;
}
int __IndexOf_ConsumeItemList()
{
    return 1;
}
int __IndexOf_CurrencyConfig()
{
    return 2;
}
int __IndexOf_CurrencyImage()
{
    return 3;
}
int __IndexOf_CurrencyNum()
{
    return 4;
}
int __IndexOf_CurrencyVisibility()
{
    return 5;
}
int __IndexOf_InventoryItemData()
{
    return 6;
}
}
namespace __GeneratedProperties_FVM_ForgeWeaponItemMaterial
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
