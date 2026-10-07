
namespace FVM_ForgeWeaponItemMaterialItem
{
    const int ModelId = 0;

}
struct FVM_ForgeWeaponItemMaterialItem : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TEUIModelRef<FM_ItemData> m_InventoryItemData;
    UPROPERTY()
    FSoftBrush m_ItemImage;
    UPROPERTY()
    int m_CostNum;
    UPROPERTY()
    FLinearColor m_ItemImageBGColor;

    FVM_ForgeWeaponItemMaterialItem()
    {
        this.m_CostNum = 0;
        this.m_ItemImageBGColor = FLinearColor::White;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_ForgeWeaponItemMaterialItem' by default constructor.");
        return;
    }
    FVM_ForgeWeaponItemMaterialItem(const FVM_ForgeWeaponItemMaterialItem &inout Other)
    {
        this.m_CostNum = 0;
        this.m_ItemImageBGColor = FLinearColor::White;
        this.m_InventoryItemData = Other.m_InventoryItemData;
        this.m_ItemImage = Other.m_ItemImage;
        this.m_CostNum = int(Other.m_CostNum);
        this.m_ItemImageBGColor = Other.m_ItemImageBGColor;
        return;
    }
    FVM_ForgeWeaponItemMaterialItem(const TEUIModelRef<FM_ItemData> &inout InInventoryItemData, const FSoftBrush &inout InItemImage, const int InCostNum)
    {
        this.m_CostNum = 0;
        this.m_ItemImageBGColor = FLinearColor::White;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetInventoryItemData(InInventoryItemData);
        this.SetItemImage(InItemImage);
        this.SetCostNum(InCostNum);
        return;
    }
    FVM_ForgeWeaponItemMaterialItem& opAssign(const FVM_ForgeWeaponItemMaterialItem &inout Other)
    {
        this.m_InventoryItemData = Other.m_InventoryItemData;
        this.m_ItemImage = Other.m_ItemImage;
        this.m_CostNum = int(Other.m_CostNum);
        return Other.m_ItemImageBGColor;
    }
    void PostConstruct()
    {
        int local_7 = 0;
        TEUIModelRef<FM_ItemData> local_2 = this.GetInventoryItemData();
        if (GetConfig())
        {
            TEUIModelRef<FM_ItemData> local_2_2 = this.GetInventoryItemData();
            if (::UGlobalItemSettings::Get().GetRarityConfig(EItemRarity(local_7)))
            {
            }
        }
        return;
    }
    FSlateColor GetInventoryTextColor() const
    {
        const UUtilitySettings local_2;
        GetGameplaySettings<UUtilitySettings> local_4;
        local_2 = local_4;
        TEUIModelRef<FM_ItemData> local_8 = this.GetInventoryItemData();
        if (GetNum() < this.GetCostNum())
        {
        }
        else
        {
        }
        return FSlateColor();
    }
    int GetInventoryNum() const
    {
        TEUIModelRef<FM_ItemData> local_2 = this.GetInventoryItemData();
        return GetNum();
    }
    FEUIModelContainer GetHoverModels() const
    {
        return ::CommonItemTip::MakeModels(this.GetContext().Manager, ::CommonItemTip::MakeSimpleFromItemData(this.GetInventoryItemData()));
    }
    TEUIModelRef<FM_ItemData> GetInventoryItemData() const property
    {
        this.TrackPropertyRead(0);
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
        this.MarkPropertyDirty(0);
        this.m_InventoryItemData = __Value;
        return;
    }
    const FSoftBrush GetItemImage() const property
    {
        const FSoftBrush __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    FSoftBrush GetModify_ItemImage() property
    {
        FSoftBrush __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetItemImage(const FSoftBrush &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_ItemImage = __Value;
        return;
    }
    int GetCostNum() const property
    {
        this.TrackPropertyRead(2);
        return this.m_CostNum;
    }
    void SetCostNum(const int __Value) property
    {
        if (this.m_CostNum == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_CostNum = __Value;
        return;
    }
    FLinearColor GetItemImageBGColor() const property
    {
        FLinearColor __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    FLinearColor GetModify_ItemImageBGColor() property
    {
        FLinearColor __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetItemImageBGColor(const FLinearColor &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_ItemImageBGColor = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_ForgeWeaponItemMaterialItem
{
    UPROPERTY()
    FSlateColor InventoryTextColor;
    UPROPERTY()
    int InventoryNum;
    UPROPERTY()
    FEUIModelContainer HoverModels;
    UPROPERTY()
    TEUIModelRef<FVM_ForgeWeaponItemMaterialItem> Self;


}

namespace FVM_ForgeWeaponItemMaterialItem
{
FVM_ForgeWeaponItemMaterialItem& Create(const UObject ContextObject, const TEUIModelRef<FM_ItemData> &inout InventoryItemData, const FSoftBrush &inout ItemImage, const int CostNum)
{
    return FVM_ForgeWeaponItemMaterialItem::CreateByManager(EUIInternal::GetContextManager(ContextObject), InventoryItemData, ItemImage, CostNum);
}
FVM_ForgeWeaponItemMaterialItem CreateByManager(const UEUIManagerSubsystem Manager, const TEUIModelRef<FM_ItemData> &inout InventoryItemData, const FSoftBrush &inout ItemImage, const int CostNum)
{
    FVM_ForgeWeaponItemMaterialItem __r;
    TEUIModelRef<FVM_ForgeWeaponItemMaterialItem> local_6 = TEUIModelRef<FVM_ForgeWeaponItemMaterialItem>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_ForgeWeaponItemMaterialItem::ModelId, 0, InventoryItemData, ItemImage, CostNum));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "ItemImage";
    local_14.TypeName = "FSoftBrush";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CostNum";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ItemImageBGColor";
    local_14.TypeName = "FLinearColor";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "InventoryTextColor";
    local_14.TypeName = "FSlateColor";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "InventoryNum";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "HoverModels";
    local_14.TypeName = "FEUIModelContainer";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_ForgeWeaponItemMaterialItem>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_ForgeWeaponItemMaterialItem;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_ForgeWeaponItemMaterialItem;
}
FSoftBrush __UIGetter_ItemImage(const FVM_ForgeWeaponItemMaterialItem &inout Model)
{
    return Model.GetItemImage();
}
int __UIGetter_CostNum(const FVM_ForgeWeaponItemMaterialItem &inout Model)
{
    return Model.GetCostNum();
}
FLinearColor __UIGetter_ItemImageBGColor(const FVM_ForgeWeaponItemMaterialItem &inout Model)
{
    return Model.GetItemImageBGColor();
}
FSlateColor __UIGetter_InventoryTextColor(const FVM_ForgeWeaponItemMaterialItem &inout Model)
{
    return Model.GetInventoryTextColor();
}
int __UIGetter_InventoryNum(const FVM_ForgeWeaponItemMaterialItem &inout Model)
{
    return Model.GetInventoryNum();
}
FEUIModelContainer __UIGetter_HoverModels(const FVM_ForgeWeaponItemMaterialItem &inout Model)
{
    return Model.GetHoverModels();
}
TEUIModelRef<FVM_ForgeWeaponItemMaterialItem> __UIGetter_Self(const FVM_ForgeWeaponItemMaterialItem &inout Model)
{
    return TEUIModelRef<FVM_ForgeWeaponItemMaterialItem>(Model);
}
int __IndexOf_InventoryItemData()
{
    return 0;
}
int __IndexOf_ItemImage()
{
    return 1;
}
int __IndexOf_CostNum()
{
    return 2;
}
int __IndexOf_ItemImageBGColor()
{
    return 3;
}
}
namespace __GeneratedProperties_FVM_ForgeWeaponItemMaterialItem
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
