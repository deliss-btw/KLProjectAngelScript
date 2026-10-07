
namespace FVM_ShopPanel
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature OnShopCategorySelected = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature OnShopGoodsItemSelected = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature Purchase = FEUIModelCallbackSignature();

}
struct FVM_ShopPanel : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TDataObjectPtr<FShopConfig> m_ShopConfig;
    UPROPERTY()
    TEUIModelRef<FM_Shop> m_ShopModel;
    UPROPERTY()
    TArray<FEUIModelContainer> m_GoodsCategories;
    UPROPERTY()
    int m_SelectedCategoryIndex;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_ShopGoodsItem>> m_DisplayingGoodsItems;
    UPROPERTY()
    TArray<FEUIModelContainer> m_DisplayingComposableItems;
    UPROPERTY()
    TEUIModelRef<FVM_ShopGoodsItem> m_SelectedGoodsItem;
    UPROPERTY()
    TEUIModelRef<FVM_QualitySelector> m_PurchaseQuantitySelector;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_CommonItemBar>> m_DisplayingCostItems;
    UPROPERTY()
    TSoftClassPtr<UEUIUserWidget> m_PopupClass;

    FVM_ShopPanel()
    {
        this.m_SelectedCategoryIndex = 0;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_ShopPanel' by default constructor.");
        return;
    }
    FVM_ShopPanel(const FVM_ShopPanel &inout Other)
    {
        this.m_SelectedCategoryIndex = 0;
        this.m_ShopConfig = Other.m_ShopConfig;
        this.m_ShopModel = Other.m_ShopModel;
        this.m_GoodsCategories = Other.m_GoodsCategories;
        this.m_SelectedCategoryIndex = int(Other.m_SelectedCategoryIndex);
        this.m_DisplayingGoodsItems = Other.m_DisplayingGoodsItems;
        this.m_DisplayingComposableItems = Other.m_DisplayingComposableItems;
        this.m_SelectedGoodsItem = Other.m_SelectedGoodsItem;
        this.m_PurchaseQuantitySelector = Other.m_PurchaseQuantitySelector;
        this.m_DisplayingCostItems = Other.m_DisplayingCostItems;
        this.m_PopupClass = Other.m_PopupClass;
        return;
    }
    FVM_ShopPanel(const TDataObjectPtr<FShopConfig> &inout InShopConfig)
    {
        this.m_SelectedCategoryIndex = 0;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetShopConfig(InShopConfig);
        return;
    }
    FVM_ShopPanel& opAssign(const FVM_ShopPanel &inout Other)
    {
        this.m_ShopConfig = Other.m_ShopConfig;
        this.m_ShopModel = Other.m_ShopModel;
        this.m_GoodsCategories = Other.m_GoodsCategories;
        this.m_SelectedCategoryIndex = int(Other.m_SelectedCategoryIndex);
        this.m_DisplayingGoodsItems = Other.m_DisplayingGoodsItems;
        this.m_DisplayingComposableItems = Other.m_DisplayingComposableItems;
        this.m_SelectedGoodsItem = Other.m_SelectedGoodsItem;
        this.m_PurchaseQuantitySelector = Other.m_PurchaseQuantitySelector;
        this.m_DisplayingCostItems = Other.m_DisplayingCostItems;
        return Other.m_PopupClass;
    }
    void LoadConfig(const FConfigVM_ShopPanel &inout InConfig)
    {
        this.SetPopupClass(InConfig.PopupClass);
        return;
    }
    void PostConstruct()
    {
        this.SetShopModel(TEUIModelRef<FM_Shop>(::FM_Shop::Create(this.GetContext().Manager, this.GetShopConfig())));
        for (auto& local_18 : this.GetShopModel().opArrow().GetShopCategories())
        {
            if (local_18.IsValid())
            {
                FEUIModelContainer local_32;
                FSoftBrush local_76 = local_18.opArrow().GetCategoryIcon();
                local_32.AddModel(FEUIModelRef(), false);
                FVM_CommonTabItem& local_80 = ::FVM_CommonTabItem::Create(this.GetContext().Manager);
                local_80.SetTitleText(local_18.opArrow().GetCategoryName());
                local_32.AddModel(FEUIModelRef(local_80), false);
                this.GetModify_GoodsCategories().Add(local_32);
            }
        }
        this.SetPurchaseQuantitySelector(TEUIModelRef<FVM_QualitySelector>(::FVM_QualitySelector::Create(this.GetContext().Manager)));
        auto local_94 = this.GetShopModel().opArrow().GetShopConfig().opArrow().GetShowCostTypes().Iterator();
        for (; local_94.CanProceed;)
        {
            FVM_CommonItemBar& local_104 = ::FVM_CommonItemBar::Create(this.GetContext().Manager);
            local_104.SetItemData(::FMS_PlayerInventory::Get(this.GetContext().Manager).GetSumItem(local_94.Proceed()));
            this.GetModify_DisplayingCostItems().Add(TEUIModelRef<FVM_CommonItemBar>(local_104));
        }
        this.OnSelectedCategoryIndexChanged();
        return;
    }
    FEUIModelContainer GetSelectedCategoryItem() const
    {
        if (this.GetGoodsCategories().IsValidIndex(this.GetSelectedCategoryIndex()))
        {
            return this.GetGoodsCategories()[this.GetSelectedCategoryIndex()];
        }
        return FEUIModelContainer();
    }
    bool ShowCategories() const
    {
        return this.GetShopModel().opArrow().HasMultipleCategories();
    }
    int GetSumCostItemNum() const
    {
        if (this.GetSelectedGoodsItem())
        {
            return (this.GetSelectedGoodsItem().opArrow().GetShopGoods().opArrow().GetCostItemNum() * this.GetPurchaseQuantitySelector().opArrow().GetCurrentNum());
        }
        return 0;
    }
    FSoftBrush GetCostItemIcon() const
    {
        if (this.GetSelectedGoodsItem())
        {
            return this.GetSelectedGoodsItem().opArrow().GetShopGoods().opArrow().GetCostItemIcon();
        }
        return FSoftBrush();
    }
    bool CanAffordCost() const
    {
        TEUIModelRef<FVM_ShopGoodsItem> local_2 = this.GetSelectedGoodsItem();
        if (local_2)
        {
            TEUIModelRef<FVM_ShopGoodsItem> local_2_2 = this.GetSelectedGoodsItem();
            TEUIModelRef<FM_ShopGoods> local_6 = local_2_2.opArrow().GetShopGoods();
            TDataObjectPtr<FItemConfig> local_30 = local_6.opArrow().GetShopGoodsConfig().opArrow().GetCostItem();
            if (local_30)
            {
                return (::FMS_PlayerInventory::Get(this.GetContext().Manager).GetTotalItemNum(local_30) >= this.GetSumCostItemNum());
            }
        }
        return false;
    }
    bool CanPurchase() const
    {
        if (!(this.GetSelectedGoodsItem()))
        {
            return false;
        }
        if (this.GetPurchaseQuantitySelector().opArrow().GetCurrentNum() <= 0)
        {
            return false;
        }
        if (!(this.CanAffordCost()))
        {
            return false;
        }
        return true;
    }
    bool IsSoldOut() const
    {
        if (this.GetSelectedGoodsItem())
        {
            return this.GetSelectedGoodsItem().opArrow().GetShopGoods().opArrow().IsSoldOut();
        }
        return false;
    }
    bool HasRemainingCount() const
    {
        return this.GetSelectedGoodsItem() && !(this.IsSoldOut());
    }
    FText GetPersonalLimitCountText() const
    {
        FText __return;
        FText local_70;
        if (this.GetSelectedGoodsItem())
        {
            TDataObjectPtr<FRefreshRuleConfig> local_30 = this.GetSelectedGoodsItem().opArrow().GetShopGoods().opArrow().GetRefreshRuleConfig();
            if (local_30)
            {
                if (this.HasRemainingCount())
                {
                    return FText::Format(NSLOCTEXT("PersonalLimitCountText", "{0}й™ђиґ­пјљ{1}/{2}"), local_30.opArrow().Description, this.GetSelectedGoodsItem().opArrow().GetShopGoods().opArrow().GetRemainingCount(), this.GetSelectedGoodsItem().opArrow().GetShopGoods().opArrow().GetShopGoodsConfig().opArrow().PersonalLimitCount);
                }
                local_70 = NSLOCTEXT("PersonalLimitCountText_SoldOut", "{0}й™ђиґ­пјљ<Red18B>{1}</>/{2}");
                __return = FText::Format(local_70, local_30.opArrow().Description, this.GetSelectedGoodsItem().opArrow().GetShopGoods().opArrow().GetRemainingCount(), this.GetSelectedGoodsItem().opArrow().GetShopGoods().opArrow().GetShopGoodsConfig().opArrow().PersonalLimitCount);
            }
            else
            {
            }
        }
        return local_70;
    }
    void OnShopCategorySelected(const int Index)
    {
        this.SetSelectedCategoryIndex(Index);
        return;
    }
    void OnShopGoodsItemSelected(const TEUIModelRef<FVM_ShopGoodsItem> &inout Item)
    {
        this.SetSelectedGoodsItem(Item);
        return;
    }
    FEUIModelContainer GetSelectedComposableItem() const
    {
        if (this.GetSelectedGoodsItem())
        {
            FEUIModelContainer local_18;
            local_18.AddModel(this.GetSelectedGoodsItem().opArrow().GetSelectable().opImplConv(), false);
            local_18.AddModel(this.GetSelectedGoodsItem().opArrow().GetComposableItem().opImplConv(), false);
            return local_18;
        }
        return local_18;
    }
    void OnSelectedCategoryIndexChanged()
    {
        this.UpdateDisplayingGoodsItems();
        if (this.GetDisplayingGoodsItems().Num() > 0)
        {
            this.SetSelectedGoodsItem(this.GetDisplayingGoodsItems()[0]);
            return;
        }
        this.SetSelectedGoodsItem(TEUIModelRef<FVM_ShopGoodsItem>(nullptr));
        return;
    }
    void OnSelectedGoodsItemChanged()
    {
        this.UpdatePurchageQuantitySelectorMaxNum();
        this.GetPurchaseQuantitySelector().opArrow().SetCurrentNumValue(1);
        return;
    }
    void OnPlayerInventoryItemChanged(const FMsg_PlayerInventoryChanged &inout Msg)
    {
        this.UpdatePurchageQuantitySelectorMaxNum();
        return;
    }
    void OnShopGoodsDataUpdated(const FMsg_ShopGoodsDataUpdated &inout Msg)
    {
        this.UpdateDisplayingGoodsItems();
        return;
    }
    void Purchase() const
    {
        if (this.GetSelectedGoodsItem() && (this.GetPurchaseQuantitySelector().opArrow().GetCurrentNum() > 0))
        {
            ::FMS_ShopGoodsData::Get(this.GetContext().Manager).GS_RequestShopping(this.GetSelectedGoodsItem().opArrow().GetShopGoods(), this.GetPurchaseQuantitySelector().opArrow().GetCurrentNum());
        }
        return;
    }
    void UpdateDisplayingGoodsItems()
    {
        this.GetModify_DisplayingGoodsItems().Empty(0);
        if (this.GetShopModel().opArrow().GetShopCategories().IsValidIndex(this.GetSelectedCategoryIndex()))
        {
            for (auto& local_20 : this.GetShopModel().opArrow().GetShopCategories()[this.GetSelectedCategoryIndex()].opArrow().GetShopGoods())
            {
                if (local_20.opArrow().IsUnlocked())
                {
                    this.GetModify_DisplayingGoodsItems().Add(TEUIModelRef<FVM_ShopGoodsItem>(::FVM_ShopGoodsItem::Create(this.GetContext().Manager, local_20)));
                }
            }
        }
        this.GetModify_DisplayingComposableItems().Empty(0);
        for (auto& local_38 : this.GetModify_DisplayingGoodsItems())
        {
            FEUIModelContainer local_52;
            local_52.AddModel(local_38.opArrow().GetSelectable().opImplConv(), false);
            local_52.AddModel(local_38.opArrow().GetComposableItem().opImplConv(), false);
            this.GetModify_DisplayingComposableItems().Add(local_52);
            local_38.opArrow().GetCallbackOnItemSelected().Add(this, FVM_ShopPanel::OnShopGoodsItemSelected);
        }
        return;
    }
    void UpdatePurchageQuantitySelectorMaxNum()
    {
        this.GetPurchaseQuantitySelector().opArrow().SetMaxNum(this.CalculateMaxPurchaseQuantity());
        return;
    }
    int CalculateMaxPurchaseQuantity() const
    {
        int local_1 = 0;
        TEUIModelRef<FVM_ShopGoodsItem> local_4 = this.GetSelectedGoodsItem();
        if (local_4)
        {
            TEUIModelRef<FVM_ShopGoodsItem> local_4_2 = this.GetSelectedGoodsItem();
            TDataObjectPtr<FItemConfig> local_32 = local_4_2.opArrow().GetShopGoods().opArrow().GetShopGoodsConfig().opArrow().GetCostItem();
            if (local_32)
            {
                float32 local_63 = ::FMS_PlayerInventory::Get(this.GetContext().Manager).GetTotalItemNum(local_32);
                TEUIModelRef<FVM_ShopGoodsItem> local_58 = this.GetSelectedGoodsItem();
                local_63 = local_63 / local_58.opArrow().GetShopGoods().opArrow().GetCostItemNum();
                local_1 = FMath::Min(2147483647, FMath::FloorToInt(local_63));
            }
            TEUIModelRef<FVM_ShopGoodsItem> local_58_2 = this.GetSelectedGoodsItem();
            if (local_58_2.opArrow().GetShopGoods().opArrow().HasPersonalLimit())
            {
                TEUIModelRef<FVM_ShopGoodsItem> local_58_3 = this.GetSelectedGoodsItem();
                local_1 = FMath::Min(local_1, local_58_3.opArrow().GetShopGoods().opArrow().GetRemainingCount());
            }
            TEUIModelRef<FVM_ShopGoodsItem> local_58_4 = this.GetSelectedGoodsItem();
            TDataObjectPtr<FItemConfig> local_32_2 = local_58_4.opArrow().GetShopGoods().opArrow().GetShopGoodsConfig().opArrow().GetItem();
            if (local_32_2)
            {
                if (::ItemConfigUtils::LimitOwnMax(local_32_2) || ::ItemConfigUtils::LimitInventoryMax(local_32_2) || ::ItemConfigUtils::LimitTrunkMax(local_32_2))
                {
                    local_1 = FMath::Min(local_1, ::FMS_PlayerInventory::Get(this.GetContext().Manager).GetItemNumToReachInventoryAndBankLimit(local_32_2));
                }
                if (!(::ItemConfigUtils::IsStackable(local_32_2)))
                {
                    local_1 = 1;
                }
            }
        }
        return FMath::Max(local_1, 1);
    }
    void ShowShoppingResult(const FMsg_DoShoppingResult &inout Result)
    {
        UWidget_EquipmentCraftPopup local_32;
        if (Result.Items.Num() > 0)
        {
            TEUIModelRef<FM_Equipment> local_8 = ::FMS_EquipmentDataCache::Get(this.GetContext().Manager).GetEquipment(Result.Items[0].ItemGuid);
            if (local_8.IsValid() && GetEquipmentConfig().IsSet())
            {
                FVM_EquipmentInfo& local_14 = ::FVM_EquipmentInfo::Create(this.GetContext().Manager, local_8);
                for (auto& local_28 : local_14.GetEquipmentTraits())
                {
                    local_28;
                    TEUIModelRef<FM_Trait> local_30;
                    local_30.GetTrait();
                    GetbIsRandomTrait().SetbHighlight();
                }
                local_32 = (Cast<UWidget_EquipmentCraftPopup>(FEUIWidget::AddWidgetByClass(this.GetContext().UELocalPlayer, this.GetPopupClass(), FEUIModelRef(local_14)).RequireWidget()));
                if (local_32 != nullptr)
                {
                    local_32.SetIsGotoEquipEnable(false);
                }
            }
        }
        return;
    }
    const TDataObjectPtr<FShopConfig> GetShopConfig() const property
    {
        const TDataObjectPtr<FShopConfig> __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    TDataObjectPtr<FShopConfig> GetModify_ShopConfig() property
    {
        TDataObjectPtr<FShopConfig> __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetShopConfig(const TDataObjectPtr<FShopConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_ShopConfig = __Value;
        return;
    }
    TEUIModelRef<FM_Shop> GetShopModel() const property
    {
        this.TrackPropertyRead(1);
        return this.m_ShopModel;
    }
    void SetShopModel(const TEUIModelRef<FM_Shop> &inout __Value) property
    {
        TEUIModelRef<FM_Shop> local_2;
        local_2 = this.m_ShopModel;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_ShopModel = __Value;
        return;
    }
    const TArray<FEUIModelContainer> GetGoodsCategories() const property
    {
        const TArray<FEUIModelContainer> __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    TArray<FEUIModelContainer> GetModify_GoodsCategories() property
    {
        TArray<FEUIModelContainer> __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetGoodsCategories(const TArray<FEUIModelContainer> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_GoodsCategories = __Value;
        return;
    }
    int GetSelectedCategoryIndex() const property
    {
        this.TrackPropertyRead(3);
        return this.m_SelectedCategoryIndex;
    }
    void SetSelectedCategoryIndex(const int __Value) property
    {
        if (this.m_SelectedCategoryIndex == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_SelectedCategoryIndex = __Value;
        return;
    }
    const TArray<TEUIModelRef<FVM_ShopGoodsItem>> GetDisplayingGoodsItems() const property
    {
        const TArray<TEUIModelRef<FVM_ShopGoodsItem>> __r;
        this.TrackPropertyRead(4);
        return __r;
    }
    TArray<TEUIModelRef<FVM_ShopGoodsItem>> GetModify_DisplayingGoodsItems() property
    {
        TArray<TEUIModelRef<FVM_ShopGoodsItem>> __r;
        this.MarkPropertyDirty(4);
        return __r;
    }
    void SetDisplayingGoodsItems(const TArray<TEUIModelRef<FVM_ShopGoodsItem>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_DisplayingGoodsItems = __Value;
        return;
    }
    const TArray<FEUIModelContainer> GetDisplayingComposableItems() const property
    {
        const TArray<FEUIModelContainer> __r;
        this.TrackPropertyRead(5);
        return __r;
    }
    TArray<FEUIModelContainer> GetModify_DisplayingComposableItems() property
    {
        TArray<FEUIModelContainer> __r;
        this.MarkPropertyDirty(5);
        return __r;
    }
    void SetDisplayingComposableItems(const TArray<FEUIModelContainer> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_DisplayingComposableItems = __Value;
        return;
    }
    TEUIModelRef<FVM_ShopGoodsItem> GetSelectedGoodsItem() const property
    {
        this.TrackPropertyRead(6);
        return this.m_SelectedGoodsItem;
    }
    void SetSelectedGoodsItem(const TEUIModelRef<FVM_ShopGoodsItem> &inout __Value) property
    {
        TEUIModelRef<FVM_ShopGoodsItem> local_2;
        local_2 = this.m_SelectedGoodsItem;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_SelectedGoodsItem = __Value;
        return;
    }
    TEUIModelRef<FVM_QualitySelector> GetPurchaseQuantitySelector() const property
    {
        this.TrackPropertyRead(7);
        return this.m_PurchaseQuantitySelector;
    }
    void SetPurchaseQuantitySelector(const TEUIModelRef<FVM_QualitySelector> &inout __Value) property
    {
        TEUIModelRef<FVM_QualitySelector> local_2;
        local_2 = this.m_PurchaseQuantitySelector;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(7);
        this.m_PurchaseQuantitySelector = __Value;
        return;
    }
    const TArray<TEUIModelRef<FVM_CommonItemBar>> GetDisplayingCostItems() const property
    {
        const TArray<TEUIModelRef<FVM_CommonItemBar>> __r;
        this.TrackPropertyRead(8);
        return __r;
    }
    TArray<TEUIModelRef<FVM_CommonItemBar>> GetModify_DisplayingCostItems() property
    {
        TArray<TEUIModelRef<FVM_CommonItemBar>> __r;
        this.MarkPropertyDirty(8);
        return __r;
    }
    void SetDisplayingCostItems(const TArray<TEUIModelRef<FVM_CommonItemBar>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(8);
        this.m_DisplayingCostItems = __Value;
        return;
    }
    TSoftClassPtr<UEUIUserWidget> GetPopupClass() const property
    {
        this.TrackPropertyRead(9);
        return this.m_PopupClass;
    }
    void SetPopupClass(const TSoftClassPtr<UEUIUserWidget> &inout __Value) property
    {
        if ((this.m_PopupClass == __Value))
        {
            return;
        }
        this.MarkPropertyDirty(9);
        this.m_PopupClass = __Value;
        return;
    }
}

struct __Lambda_UI_Private_ViewModel_Menu_Shop_VM_ShopPanel_254
{
    __Lambda_UI_Private_ViewModel_Menu_Shop_VM_ShopPanel_254()
    {
        return;
    }
    bool opCall(const TEUIModelRef<FVM_ShopGoodsItem> &inout A, const TEUIModelRef<FVM_ShopGoodsItem> &inout B)
    {
        TEUIModelRef<FM_ShopGoods> local_4 = B.opArrow().GetShopGoods();
        return A.opArrow().GetShopGoods().opArrow().CmpWith();
    }
}

struct __GeneratedProperties_FVM_ShopPanel
{
    UPROPERTY()
    FEUIModelContainer SelectedCategoryItem;
    UPROPERTY()
    bool ShowCategories;
    UPROPERTY()
    int SumCostItemNum;
    UPROPERTY()
    FSoftBrush CostItemIcon;
    UPROPERTY()
    bool CanAffordCost;
    UPROPERTY()
    bool CanPurchase;
    UPROPERTY()
    bool IsSoldOut;
    UPROPERTY()
    bool HasRemainingCount;
    UPROPERTY()
    FText PersonalLimitCountText;
    UPROPERTY()
    FEUIModelContainer SelectedComposableItem;
    UPROPERTY()
    TEUIModelRef<FVM_ShopPanel> Self;


}

namespace FVM_ShopPanel
{
FVM_ShopPanel& Create(const UObject ContextObject, const TDataObjectPtr<FShopConfig> &inout ShopConfig)
{
    return FVM_ShopPanel::CreateByManager(EUIInternal::GetContextManager(ContextObject), ShopConfig);
}
FVM_ShopPanel CreateByManager(const UEUIManagerSubsystem Manager, const TDataObjectPtr<FShopConfig> &inout ShopConfig)
{
    FVM_ShopPanel __r;
    TEUIModelRef<FVM_ShopPanel> local_6 = TEUIModelRef<FVM_ShopPanel>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_ShopPanel::ModelId, 0, ShopConfig));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(true);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "ShopConfig";
    local_14.TypeName = "TDataObjectPtr<FShopConfig>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "GoodsCategories";
    local_14.TypeName = "TArray<FEUIModelContainer>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "DisplayingGoodsItems";
    local_14.TypeName = "TArray<TEUIModelRef<FVM_ShopGoodsItem>>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "DisplayingComposableItems";
    local_14.TypeName = "TArray<FEUIModelContainer>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "SelectedGoodsItem";
    local_14.TypeName = "TEUIModelRef<FVM_ShopGoodsItem>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "PurchaseQuantitySelector";
    local_14.TypeName = "TEUIModelRef<FVM_QualitySelector>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "DisplayingCostItems";
    local_14.TypeName = "TArray<TEUIModelRef<FVM_CommonItemBar>>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "SelectedCategoryItem";
    local_14.TypeName = "FEUIModelContainer";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ShowCategories";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "SumCostItemNum";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CostItemIcon";
    local_14.TypeName = "FSoftBrush";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CanAffordCost";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CanPurchase";
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
    local_14.PropertyName = "PersonalLimitCountText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "SelectedComposableItem";
    local_14.TypeName = "FEUIModelContainer";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_ShopPanel>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_ShopPanel;
    FEUIModelDirtyDefine local_24;
    local_24.FunctionName = "__OnSelectedCategoryIndexChanged";
    local_24.DirtyFlags.Set(FVM_ShopPanel::__IndexOf_SelectedCategoryIndex());
    Result.DirtyFunctions.Add(local_24);
    local_24.FunctionName = "__OnSelectedGoodsItemChanged";
    local_24.DirtyFlags.Set(FVM_ShopPanel::__IndexOf_SelectedGoodsItem());
    Result.DirtyFunctions.Add(local_24);
    FEUIModelMsgHandleDefine local_34;
    local_34.FunctionName = "__OnPlayerInventoryItemChanged";
    local_34.MessageTypeName = "Msg_PlayerInventoryChanged";
    local_34.SourcePropertyModelRefs = FBitSet64(0);
    Result.MessageHandleFunctions.Add(local_34);
    local_34.FunctionName = "__OnShopGoodsDataUpdated";
    local_34.MessageTypeName = "Msg_ShopGoodsDataUpdated";
    local_34.SourcePropertyModelRefs = FBitSet64(0);
    Result.MessageHandleFunctions.Add(local_34);
    local_34.FunctionName = "__ShowShoppingResult";
    local_34.MessageTypeName = "Msg_DoShoppingResult";
    local_34.SourcePropertyModelRefs = FBitSet64(0);
    Result.MessageHandleFunctions.Add(local_34);
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_ShopPanel;
}
void __OnSelectedCategoryIndexChanged(FVM_ShopPanel &inout Model)
{
    Model.OnSelectedCategoryIndexChanged();
    return;
}
void __OnSelectedGoodsItemChanged(FVM_ShopPanel &inout Model)
{
    Model.OnSelectedGoodsItemChanged();
    return;
}
void __OnPlayerInventoryItemChanged(FVM_ShopPanel &inout Model, const FMsg_PlayerInventoryChanged &inout Message)
{
    Model.OnPlayerInventoryItemChanged(Message);
    return;
}
void __OnShopGoodsDataUpdated(FVM_ShopPanel &inout Model, const FMsg_ShopGoodsDataUpdated &inout Message)
{
    Model.OnShopGoodsDataUpdated(Message);
    return;
}
void __ShowShoppingResult(FVM_ShopPanel &inout Model, const FMsg_DoShoppingResult &inout Message)
{
    Model.ShowShoppingResult(Message);
    return;
}
TDataObjectPtr<FShopConfig> __UIGetter_ShopConfig(const FVM_ShopPanel &inout Model)
{
    return Model.GetShopConfig();
}
TArray<FEUIModelContainer> __UIGetter_GoodsCategories(const FVM_ShopPanel &inout Model)
{
    return Model.GetGoodsCategories();
}
TArray<TEUIModelRef<FVM_ShopGoodsItem>> __UIGetter_DisplayingGoodsItems(const FVM_ShopPanel &inout Model)
{
    return Model.GetDisplayingGoodsItems();
}
TArray<FEUIModelContainer> __UIGetter_DisplayingComposableItems(const FVM_ShopPanel &inout Model)
{
    return Model.GetDisplayingComposableItems();
}
TEUIModelRef<FVM_ShopGoodsItem> __UIGetter_SelectedGoodsItem(const FVM_ShopPanel &inout Model)
{
    return Model.GetSelectedGoodsItem();
}
TEUIModelRef<FVM_QualitySelector> __UIGetter_PurchaseQuantitySelector(const FVM_ShopPanel &inout Model)
{
    return Model.GetPurchaseQuantitySelector();
}
TArray<TEUIModelRef<FVM_CommonItemBar>> __UIGetter_DisplayingCostItems(const FVM_ShopPanel &inout Model)
{
    return Model.GetDisplayingCostItems();
}
FEUIModelContainer __UIGetter_SelectedCategoryItem(const FVM_ShopPanel &inout Model)
{
    return Model.GetSelectedCategoryItem();
}
bool __UIGetter_ShowCategories(const FVM_ShopPanel &inout Model)
{
    return Model.ShowCategories();
}
int __UIGetter_SumCostItemNum(const FVM_ShopPanel &inout Model)
{
    return Model.GetSumCostItemNum();
}
FSoftBrush __UIGetter_CostItemIcon(const FVM_ShopPanel &inout Model)
{
    return Model.GetCostItemIcon();
}
bool __UIGetter_CanAffordCost(const FVM_ShopPanel &inout Model)
{
    return Model.CanAffordCost();
}
bool __UIGetter_CanPurchase(const FVM_ShopPanel &inout Model)
{
    return Model.CanPurchase();
}
bool __UIGetter_IsSoldOut(const FVM_ShopPanel &inout Model)
{
    return Model.IsSoldOut();
}
bool __UIGetter_HasRemainingCount(const FVM_ShopPanel &inout Model)
{
    return Model.HasRemainingCount();
}
FText __UIGetter_PersonalLimitCountText(const FVM_ShopPanel &inout Model)
{
    return Model.GetPersonalLimitCountText();
}
FEUIModelContainer __UIGetter_SelectedComposableItem(const FVM_ShopPanel &inout Model)
{
    return Model.GetSelectedComposableItem();
}
TEUIModelRef<FVM_ShopPanel> __UIGetter_Self(const FVM_ShopPanel &inout Model)
{
    return TEUIModelRef<FVM_ShopPanel>(Model);
}
int __IndexOf_ShopConfig()
{
    return 0;
}
int __IndexOf_ShopModel()
{
    return 1;
}
int __IndexOf_GoodsCategories()
{
    return 2;
}
int __IndexOf_SelectedCategoryIndex()
{
    return 3;
}
int __IndexOf_DisplayingGoodsItems()
{
    return 4;
}
int __IndexOf_DisplayingComposableItems()
{
    return 5;
}
int __IndexOf_SelectedGoodsItem()
{
    return 6;
}
int __IndexOf_PurchaseQuantitySelector()
{
    return 7;
}
int __IndexOf_DisplayingCostItems()
{
    return 8;
}
int __IndexOf_PopupClass()
{
    return 9;
}
}
namespace __GeneratedProperties_FVM_ShopPanel
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
