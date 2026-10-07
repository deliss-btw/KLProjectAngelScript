
namespace FVM_ShopGoodsItem
{
    const int ModelId = 0;

}
struct FVM_ShopGoodsItem : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TEUIModelRef<FM_ShopGoods> m_ShopGoods;
    UPROPERTY()
    TEUIModelRef<FVM_Item> m_Item;
    UPROPERTY()
    TEUIModelRef<FM_ItemData> m_ItemData;
    UPROPERTY()
    TEUIModelRef<FVM_ComposableItem> m_ComposableItem;
    UPROPERTY()
    TEUIModelRef<FVM_SelectableItem> m_Selectable;
    UPROPERTY()
    FShopGoodsItemSelected m_CallbackOnItemSelected;
    UPROPERTY()
    bool m_bCanShowEquipmentInfo;
    UPROPERTY()
    TEUIModelRef<FVM_EquipmentInfo> m_EquipmentInfo;
    UPROPERTY()
    FText m_EquipmentLevelText;
    UPROPERTY()
    TEUIModelRef<FVM_AvatarEquipmentItemInfoTitle> m_CurEquipItemInfoTitle;
    UPROPERTY()
    TEUIModelRef<FVM_AvatarEquipmentItemInfoDetail> m_CurEquipItemInfoDetail;

    FVM_ShopGoodsItem()
    {
        this.m_bCanShowEquipmentInfo = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_ShopGoodsItem' by default constructor.");
        return;
    }
    FVM_ShopGoodsItem(const FVM_ShopGoodsItem &inout Other)
    {
        this.m_bCanShowEquipmentInfo = false;
        this.m_ShopGoods = Other.m_ShopGoods;
        this.m_Item = Other.m_Item;
        this.m_ItemData = Other.m_ItemData;
        this.m_ComposableItem = Other.m_ComposableItem;
        this.m_Selectable = Other.m_Selectable;
        this.m_bCanShowEquipmentInfo = Other.m_bCanShowEquipmentInfo;
        this.m_EquipmentInfo = Other.m_EquipmentInfo;
        this.m_EquipmentLevelText = Other.m_EquipmentLevelText;
        this.m_CurEquipItemInfoTitle = Other.m_CurEquipItemInfoTitle;
        this.m_CurEquipItemInfoDetail = Other.m_CurEquipItemInfoDetail;
        return;
    }
    FVM_ShopGoodsItem(const TEUIModelRef<FM_ShopGoods> &inout InShopGoods)
    {
        this.m_bCanShowEquipmentInfo = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetShopGoods(InShopGoods);
        return;
    }
    FVM_ShopGoodsItem& opAssign(const FVM_ShopGoodsItem &inout Other)
    {
        this.m_ShopGoods = Other.m_ShopGoods;
        this.m_Item = Other.m_Item;
        this.m_ItemData = Other.m_ItemData;
        this.m_ComposableItem = Other.m_ComposableItem;
        this.m_Selectable = Other.m_Selectable;
        this.m_bCanShowEquipmentInfo = Other.m_bCanShowEquipmentInfo;
        this.m_EquipmentInfo = Other.m_EquipmentInfo;
        this.m_EquipmentLevelText = Other.m_EquipmentLevelText;
        this.m_CurEquipItemInfoTitle = Other.m_CurEquipItemInfoTitle;
        return Other.m_CurEquipItemInfoDetail;
    }
    void PostConstruct()
    {
        this.SetItemData(TEUIModelRef<FM_ItemData>(::FM_ItemData::Create(this.GetContext().Manager)));
        this.GetItemData().opArrow().SetConfig(this.GetShopGoods().opArrow().GetShopGoodsConfig().opArrow().GetItem());
        this.SetItem(TEUIModelRef<FVM_Item>(::FVM_Item::Create(this.GetContext().Manager, this.GetItemData())));
        this.SetSelectable(TEUIModelRef<FVM_SelectableItem>(::FVM_SelectableItem::Create(this.GetContext().Manager)));
        TEUIModelRef<FVM_ComposableItem> local_12 = TEUIModelRef<FVM_ComposableItem>(::FVM_ComposableItem::Create(this.GetContext().Manager, this.GetItemData(), EItemDisplayScenario(2)));
        this.SetComposableItem(local_12);
        if (this.GetShopGoods().opArrow().HasPersonalLimit())
        {
            TEUIModelRef<FVM_ComposableItem> local_12_2 = this.GetComposableItem();
        }
        TEUIModelRef<FVM_ComposableItem> local_12_3 = this.GetComposableItem();
        TEUIModelRef<FM_ShopGoods> local_4 = this.GetShopGoods();
        CastTo local_42;
        TDataObjectPtr<FEquipmentConfig> local_66 = local_42.opCall();
        if (local_66)
        {
            this.SetbCanShowEquipmentInfo(true);
            FText::AsCultureInvariant("Lv.{0}");
            FText local_74;
            this.SetEquipmentLevelText(local_74);
            TEUIModelRef<FVM_EquipmentInfo> local_78 = TEUIModelRef<FVM_EquipmentInfo>(::FVM_EquipmentInfo::Create(this.GetContext().Manager, ::FMS_EquipmentDataCache::Get(this.GetContext().Manager).CreateFromConfig(local_66)));
            this.SetEquipmentInfo(local_78);
            int local_14 = local_66.opArrow().GetMaxRandomTrait();
            TEUIModelRef<FVM_EquipmentInfo> local_78_2 = this.GetEquipmentInfo();
            local_14.SetPreviewMaxRandomTraitNum();
            TEUIModelRef<FVM_EquipmentInfo> local_78_3 = this.GetEquipmentInfo();
            this.SetCurEquipItemInfoTitle(TEUIModelRef<FVM_AvatarEquipmentItemInfoTitle>(::FVM_AvatarEquipmentItemInfoTitle::Create(this.GetContext().Manager, local_78_3)));
            TEUIModelRef<FVM_EquipmentInfo> local_78_4 = this.GetEquipmentInfo();
            TEUIModelRef<FVM_AvatarEquipmentItemInfoDetail> local_82 = TEUIModelRef<FVM_AvatarEquipmentItemInfoDetail>(::FVM_AvatarEquipmentItemInfoDetail::Create(this.GetContext().Manager, local_78_4));
            this.SetCurEquipItemInfoDetail(local_82);
            TEUIModelRef<FVM_AvatarEquipmentItemInfoDetail> local_82_2 = this.GetCurEquipItemInfoDetail();
            EnableShowRandomTraitText();
        }
        return;
    }
    void UpdateItemSelected()
    {
        if (this.GetSelectable() && this.GetSelectable().opArrow().GetbIsSelected())
        {
            this.GetCallbackOnItemSelected().Broadcast(FEUIModelRef(this));
        }
        return;
    }
    bool IsLocked() const
    {
        return !(this.GetShopGoods().opArrow().IsUnlocked());
    }
    bool IsSoldOut() const
    {
        return this.GetShopGoods().opArrow().IsSoldOut();
    }
    bool HasRemainingCount() const
    {
        return !(this.IsSoldOut());
    }
    bool CanPurchase() const
    {
        return this.GetShopGoods().opArrow().CanPurchase();
    }
    bool CannotPurchase() const
    {
        return !(this.CanPurchase());
    }
    void SyncRemainingCount()
    {
        int local_12 = 0;
        if (this.GetItemData())
        {
            this.GetItemData().opArrow().SetNum(this.GetShopGoods().opArrow().GetRemainingCount());
        }
        if (this.GetItem())
        {
            if (this.GetShopGoods().opArrow().HasPersonalLimit())
            {
                local_12 = 0;
            }
            else
            {
                local_12 = 1;
            }
            this.GetItem().opArrow().SetNumStyle();
        }
        if (this.GetComposableItem())
        {
            int local_7 = this.GetShopGoods().opArrow().GetRemainingCount();
            TEUIModelRef<FVM_ComposableItem> local_14 = this.GetComposableItem();
            bool local_3 = this.CannotPurchase();
            TEUIModelRef<FVM_ComposableItem> local_14_2 = this.GetComposableItem();
            ::ComposableItemUtility::SetItemMaskEnable(local_3);
        }
        return;
    }
    TEUIModelRef<FM_ShopGoods> GetShopGoods() const property
    {
        this.TrackPropertyRead(0);
        return this.m_ShopGoods;
    }
    void SetShopGoods(const TEUIModelRef<FM_ShopGoods> &inout __Value) property
    {
        TEUIModelRef<FM_ShopGoods> local_2;
        local_2 = this.m_ShopGoods;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_ShopGoods = __Value;
        return;
    }
    TEUIModelRef<FVM_Item> GetItem() const property
    {
        this.TrackPropertyRead(1);
        return this.m_Item;
    }
    void SetItem(const TEUIModelRef<FVM_Item> &inout __Value) property
    {
        TEUIModelRef<FVM_Item> local_2;
        local_2 = this.m_Item;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_Item = __Value;
        return;
    }
    TEUIModelRef<FM_ItemData> GetItemData() const property
    {
        this.TrackPropertyRead(2);
        return this.m_ItemData;
    }
    void SetItemData(const TEUIModelRef<FM_ItemData> &inout __Value) property
    {
        TEUIModelRef<FM_ItemData> local_2;
        local_2 = this.m_ItemData;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_ItemData = __Value;
        return;
    }
    TEUIModelRef<FVM_ComposableItem> GetComposableItem() const property
    {
        this.TrackPropertyRead(3);
        return this.m_ComposableItem;
    }
    void SetComposableItem(const TEUIModelRef<FVM_ComposableItem> &inout __Value) property
    {
        TEUIModelRef<FVM_ComposableItem> local_2;
        local_2 = this.m_ComposableItem;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_ComposableItem = __Value;
        return;
    }
    TEUIModelRef<FVM_SelectableItem> GetSelectable() const property
    {
        this.TrackPropertyRead(4);
        return this.m_Selectable;
    }
    void SetSelectable(const TEUIModelRef<FVM_SelectableItem> &inout __Value) property
    {
        TEUIModelRef<FVM_SelectableItem> local_2;
        local_2 = this.m_Selectable;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_Selectable = __Value;
        return;
    }
    const FShopGoodsItemSelected GetCallbackOnItemSelected() const property
    {
        const FShopGoodsItemSelected __r;
        this.TrackPropertyRead(5);
        return __r;
    }
    FShopGoodsItemSelected GetModify_CallbackOnItemSelected() property
    {
        FShopGoodsItemSelected __r;
        this.MarkPropertyDirty(5);
        return __r;
    }
    void SetCallbackOnItemSelected(const FShopGoodsItemSelected &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(5);
        return;
    }
    bool GetbCanShowEquipmentInfo() const property
    {
        this.TrackPropertyRead(6);
        return this.m_bCanShowEquipmentInfo;
    }
    void SetbCanShowEquipmentInfo(const bool __Value) property
    {
        if (!(this.m_bCanShowEquipmentInfo) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_bCanShowEquipmentInfo = __Value;
        return;
    }
    TEUIModelRef<FVM_EquipmentInfo> GetEquipmentInfo() const property
    {
        this.TrackPropertyRead(7);
        return this.m_EquipmentInfo;
    }
    void SetEquipmentInfo(const TEUIModelRef<FVM_EquipmentInfo> &inout __Value) property
    {
        TEUIModelRef<FVM_EquipmentInfo> local_2;
        local_2 = this.m_EquipmentInfo;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(7);
        this.m_EquipmentInfo = __Value;
        return;
    }
    FText GetEquipmentLevelText() const property
    {
        FText __r;
        this.TrackPropertyRead(8);
        return __r;
    }
    FText GetModify_EquipmentLevelText() property
    {
        FText __r;
        this.MarkPropertyDirty(8);
        return __r;
    }
    void SetEquipmentLevelText(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(8);
        this.m_EquipmentLevelText = __Value;
        return;
    }
    TEUIModelRef<FVM_AvatarEquipmentItemInfoTitle> GetCurEquipItemInfoTitle() const property
    {
        this.TrackPropertyRead(9);
        return this.m_CurEquipItemInfoTitle;
    }
    void SetCurEquipItemInfoTitle(const TEUIModelRef<FVM_AvatarEquipmentItemInfoTitle> &inout __Value) property
    {
        TEUIModelRef<FVM_AvatarEquipmentItemInfoTitle> local_2;
        local_2 = this.m_CurEquipItemInfoTitle;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(9);
        this.m_CurEquipItemInfoTitle = __Value;
        return;
    }
    TEUIModelRef<FVM_AvatarEquipmentItemInfoDetail> GetCurEquipItemInfoDetail() const property
    {
        this.TrackPropertyRead(10);
        return this.m_CurEquipItemInfoDetail;
    }
    void SetCurEquipItemInfoDetail(const TEUIModelRef<FVM_AvatarEquipmentItemInfoDetail> &inout __Value) property
    {
        TEUIModelRef<FVM_AvatarEquipmentItemInfoDetail> local_2;
        local_2 = this.m_CurEquipItemInfoDetail;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(10);
        this.m_CurEquipItemInfoDetail = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_ShopGoodsItem
{
    UPROPERTY()
    bool IsLocked;
    UPROPERTY()
    bool IsSoldOut;
    UPROPERTY()
    bool HasRemainingCount;
    UPROPERTY()
    bool CanPurchase;
    UPROPERTY()
    bool CannotPurchase;
    UPROPERTY()
    TEUIModelRef<FVM_ShopGoodsItem> Self;


}

namespace FVM_ShopGoodsItem
{
FVM_ShopGoodsItem& Create(const UObject ContextObject, const TEUIModelRef<FM_ShopGoods> &inout ShopGoods)
{
    return FVM_ShopGoodsItem::CreateByManager(EUIInternal::GetContextManager(ContextObject), ShopGoods);
}
FVM_ShopGoodsItem CreateByManager(const UEUIManagerSubsystem Manager, const TEUIModelRef<FM_ShopGoods> &inout ShopGoods)
{
    FVM_ShopGoodsItem __r;
    TEUIModelRef<FVM_ShopGoodsItem> local_6 = TEUIModelRef<FVM_ShopGoodsItem>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_ShopGoodsItem::ModelId, 0, ShopGoods));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "Item";
    local_14.TypeName = "TEUIModelRef<FVM_Item>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bCanShowEquipmentInfo";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "EquipmentLevelText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CurEquipItemInfoTitle";
    local_14.TypeName = "TEUIModelRef<FVM_AvatarEquipmentItemInfoTitle>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CurEquipItemInfoDetail";
    local_14.TypeName = "TEUIModelRef<FVM_AvatarEquipmentItemInfoDetail>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IsLocked";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IsSoldOut";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "HasRemainingCount";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CanPurchase";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CannotPurchase";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_ShopGoodsItem>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_ShopGoodsItem;
    FEUIModelEffectDefine local_20;
    local_20.FunctionName = "UpdateItemSelected";
    Result.EffectFunctions.Add(local_20);
    local_20.FunctionName = "SyncRemainingCount";
    Result.EffectFunctions.Add(local_20);
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_ShopGoodsItem;
}
TEUIModelRef<FVM_Item> __UIGetter_Item(const FVM_ShopGoodsItem &inout Model)
{
    return Model.GetItem();
}
bool __UIGetter_bCanShowEquipmentInfo(const FVM_ShopGoodsItem &inout Model)
{
    return Model.GetbCanShowEquipmentInfo();
}
FText __UIGetter_EquipmentLevelText(const FVM_ShopGoodsItem &inout Model)
{
    return Model.GetEquipmentLevelText();
}
TEUIModelRef<FVM_AvatarEquipmentItemInfoTitle> __UIGetter_CurEquipItemInfoTitle(const FVM_ShopGoodsItem &inout Model)
{
    return Model.GetCurEquipItemInfoTitle();
}
TEUIModelRef<FVM_AvatarEquipmentItemInfoDetail> __UIGetter_CurEquipItemInfoDetail(const FVM_ShopGoodsItem &inout Model)
{
    return Model.GetCurEquipItemInfoDetail();
}
bool __UIGetter_IsLocked(const FVM_ShopGoodsItem &inout Model)
{
    return Model.IsLocked();
}
bool __UIGetter_IsSoldOut(const FVM_ShopGoodsItem &inout Model)
{
    return Model.IsSoldOut();
}
bool __UIGetter_HasRemainingCount(const FVM_ShopGoodsItem &inout Model)
{
    return Model.HasRemainingCount();
}
bool __UIGetter_CanPurchase(const FVM_ShopGoodsItem &inout Model)
{
    return Model.CanPurchase();
}
bool __UIGetter_CannotPurchase(const FVM_ShopGoodsItem &inout Model)
{
    return Model.CannotPurchase();
}
TEUIModelRef<FVM_ShopGoodsItem> __UIGetter_Self(const FVM_ShopGoodsItem &inout Model)
{
    return TEUIModelRef<FVM_ShopGoodsItem>(Model);
}
int __IndexOf_ShopGoods()
{
    return 0;
}
int __IndexOf_Item()
{
    return 1;
}
int __IndexOf_ItemData()
{
    return 2;
}
int __IndexOf_ComposableItem()
{
    return 3;
}
int __IndexOf_Selectable()
{
    return 4;
}
int __IndexOf_CallbackOnItemSelected()
{
    return 5;
}
int __IndexOf_bCanShowEquipmentInfo()
{
    return 6;
}
int __IndexOf_EquipmentInfo()
{
    return 7;
}
int __IndexOf_EquipmentLevelText()
{
    return 8;
}
int __IndexOf_CurEquipItemInfoTitle()
{
    return 9;
}
int __IndexOf_CurEquipItemInfoDetail()
{
    return 10;
}
}
namespace __GeneratedProperties_FVM_ShopGoodsItem
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
