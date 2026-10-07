
namespace FVM_InventoryMainItem
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature PinAndOpenOperations = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature HandleCommonItemClicked = FEUIModelCallbackSignature();
}
namespace FVM_InventoryMain
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature SelectRootCategory = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature SelectCategory = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature PrevRootCategory = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature NextRootCategory = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature PrevCategory = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature NextCategory = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature ConfirmSort = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature OnFilterSelected = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature OnSorterSelected = FEUIModelCallbackSignature();

}
struct FVM_InventoryMainItem : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TEUIModelRef<FM_ItemData> m_Item;
    UPROPERTY()
    bool m_bIsValid;
    UPROPERTY()
    bool m_bHasItem;
    UPROPERTY()
    bool m_bPendingPinnedTipSelectionSync;
    UPROPERTY()
    TEUIModelRef<FVM_ComposableItem> m_ComposableItem;
    UPROPERTY()
    FItemTipHandle m_TipHandle;
    UPROPERTY()
    FEUIModelContainer m_TipHoverModels;
    UPROPERTY()
    int m_PinnedTipRequestVersion;
    UPROPERTY()
    FCommonHoverHandle m_PinnedTipHoverHandle;
    UPROPERTY()
    TWeakObjectPtr<UWidget> m_SharedHoverAnchor;
    UPROPERTY()
    ECommonHoverLayout m_SharedHoverLayout;
    UPROPERTY()
    TEUIModelWeakRef<FVM_CommonItem> m_BoundCommonItemClickModel;

    FVM_InventoryMainItem()
    {
        this.m_bIsValid = false;
        this.m_bHasItem = false;
        this.m_bPendingPinnedTipSelectionSync = false;
        this.m_PinnedTipRequestVersion = 0;
        this.m_SharedHoverLayout = ECommonHoverLayout(0);
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_InventoryMainItem' by default constructor.");
        return;
    }
    FVM_InventoryMainItem(const FVM_InventoryMainItem &inout Other)
    {
        this.m_bIsValid = false;
        this.m_bHasItem = false;
        this.m_bPendingPinnedTipSelectionSync = false;
        this.m_PinnedTipRequestVersion = 0;
        this.m_SharedHoverLayout = ECommonHoverLayout(0);
        this.m_Item = Other.m_Item;
        this.m_bIsValid = Other.m_bIsValid;
        this.m_bHasItem = Other.m_bHasItem;
        this.m_bPendingPinnedTipSelectionSync = Other.m_bPendingPinnedTipSelectionSync;
        this.m_ComposableItem = Other.m_ComposableItem;
        this.m_TipHoverModels = Other.m_TipHoverModels;
        this.m_PinnedTipRequestVersion = int(Other.m_PinnedTipRequestVersion);
        this.m_SharedHoverAnchor = Other.m_SharedHoverAnchor;
        this.m_SharedHoverLayout = Other.m_SharedHoverLayout;
        this.m_BoundCommonItemClickModel = Other.m_BoundCommonItemClickModel;
        return;
    }
    FVM_InventoryMainItem(const TEUIModelRef<FM_ItemData> &inout InItem)
    {
        this.m_bIsValid = false;
        this.m_bHasItem = false;
        this.m_bPendingPinnedTipSelectionSync = false;
        this.m_PinnedTipRequestVersion = 0;
        this.m_SharedHoverLayout = ECommonHoverLayout(0);
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetItem(InItem);
        return;
    }
    FVM_InventoryMainItem& opAssign(const FVM_InventoryMainItem &inout Other)
    {
        this.m_Item = Other.m_Item;
        this.m_bIsValid = Other.m_bIsValid;
        this.m_bHasItem = Other.m_bHasItem;
        this.m_bPendingPinnedTipSelectionSync = Other.m_bPendingPinnedTipSelectionSync;
        this.m_ComposableItem = Other.m_ComposableItem;
        this.m_TipHoverModels = Other.m_TipHoverModels;
        this.m_PinnedTipRequestVersion = int(Other.m_PinnedTipRequestVersion);
        this.m_SharedHoverAnchor = Other.m_SharedHoverAnchor;
        this.m_SharedHoverLayout = Other.m_SharedHoverLayout;
        return Other.m_BoundCommonItemClickModel;
    }
    void PostConstruct()
    {
        this.RefreshItemModel();
        return;
    }
    void BeginDestroy()
    {
        this.UnbindCommonItemClickIntent();
        this.ClosePinnedTipHover();
        return;
    }
    void OnInventoryChanged(const FMsg_PlayerInventoryChanged &inout Msg)
    {
        this.RefreshItemModel();
        return;
    }
    void PinAndOpenOperations()
    {
        this.SetbPendingPinnedTipSelectionSync(true);
        this.GetTipHandle().PinAndOpenOperations();
        this.SetTipHoverModels(this.GetTipHandle().GetModels());
        this.SetPinnedTipRequestVersion((this.GetPinnedTipRequestVersion() + 1));
        FMS_RedDotSystem& local_20 = ::FMS_RedDotSystem::Get(this.GetContext().Manager);
        int64 local_22 = 0;
        if (::FMS_ItemDataCache::Get(this.GetContext().Manager).TryGetItemUid(this.GetItem(), local_22) && (local_22 > 0))
        {
            TEUIModelRef<FM_ItemData> local_26 = this.GetItem();
            ::FMS_PlayerInventory::Get(this.GetContext().Manager).ConsumeRootCategoryRedDot(local_22, GetConfig());
        }
        return;
    }
    bool ConsumePendingPinnedTipSelectionSync()
    {
        if (!(this.GetbPendingPinnedTipSelectionSync()))
        {
            return false;
        }
        this.SetbPendingPinnedTipSelectionSync(false);
        return true;
    }
    void UpdatePinnedTipHoverHandle(const FCommonHoverHandle &inout HoverHandle)
    {
        this.SetPinnedTipHoverHandle(HoverHandle);
        return;
    }
    void ClosePinnedTipHover()
    {
        if (this.GetPinnedTipHoverHandle().IsValid())
        {
            ::CommonPopup::CloseHover(this.GetPinnedTipHoverHandle(), this.GetContext().Manager, false);
            this.SetPinnedTipHoverHandle(FCommonHoverHandle::InvalidHandle);
        }
        return;
    }
    void PrepareHoverPreview()
    {
        this.ResetHoverPreview();
        this.GetTipHandle().PrepareForDisplay();
        this.SetTipHoverModels(this.GetTipHandle().GetModels());
        return;
    }
    void ResetHoverPreview()
    {
        this.GetTipHandle().Unpin();
        this.SetTipHoverModels(this.GetTipHandle().GetModels());
        return;
    }
    void SetSharedHoverAnchor(const UWidget InHoverAnchor, const ECommonHoverLayout InHoverLayout)
    {
        this.SetSharedHoverAnchor(TWeakObjectPtr<UWidget>(InHoverAnchor));
        this.SetSharedHoverLayout(ECommonHoverLayout(InHoverLayout));
        return;
    }
    UWidget ResolveSharedHoverAnchorWidget() const
    {
        TWeakObjectPtr<UWidget> local_2 = this.GetSharedHoverAnchor();
        UWidget local_4;
        return local_4;
    }
    ECommonHoverLayout ResolveSharedHoverLayout() const
    {
        return this.GetSharedHoverLayout();
    }
    void RefreshItemModel()
    {
        bool local_3;
        int local_22 = 0;
        this.UnbindCommonItemClickIntent();
        if (!(this.GetItem().IsValid()))
        {
            local_3 = false;
        }
        else
        {
            local_3 = this.GetItem().opArrow().GetConfig();
        }
        local_3 = local_3 && (this.GetItem().opArrow().GetNum() > 0);
        this.SetbHasItem(local_3);
        this.SetbIsValid(this.GetbHasItem() || !(this.GetItem().IsValid()));
        if (!(this.GetbHasItem()))
        {
            TEUIModelRef<FVM_ComposableItem> local_10 = TEUIModelRef<FVM_ComposableItem>(::FVM_ComposableItem::Create(this.GetContext().Manager, this.GetItem(), EItemDisplayScenario(1)));
            this.SetComposableItem(local_10);
            TEUIModelRef<FVM_ComposableItem> local_10_2 = this.GetComposableItem();
            1.SetCurDisplayState();
            FItemTipHandle local_12;
            this.SetTipHandle(local_12);
            return;
        }
        TEUIModelRef<FVM_ComposableItem> local_10_3 = TEUIModelRef<FVM_ComposableItem>(::FVM_ComposableItem::Create(this.GetContext().Manager, this.GetItem(), EItemDisplayScenario(1)));
        this.SetComposableItem(local_10_3);
        TEUIModelRef<FVM_ComposableItem> local_10_4 = this.GetComposableItem();
        0.SetCurDisplayState();
        int64 local_14 = 0;
        if (::FMS_ItemDataCache::Get(this.GetContext().Manager).TryGetItemUid(this.GetItem(), local_14) && (local_14 > 0))
        {
            FRedDotNodeData local_20 = FRedDotNodeData(GameplayTags::RedDotSystem_Inventory_NewItem, local_14);
            TEUIModelRef<FVM_RedDot> local_24 = TEUIModelRef<FVM_RedDot>(local_22);
            TEUIModelRef<FVM_ComposableItem> local_10_5 = this.GetComposableItem();
        }
        this.EnsureComposableItemCountFeature();
        this.RefreshComposableItemCountText();
        this.RefreshEquipmentDisplayFeatures();
        this.RebuildTipHoverModels();
        this.BindCommonItemClickIntent();
        return;
    }
    void RefreshEquipmentDisplayFeatures()
    {
        if (!(this.GetbHasItem()) || !(this.GetComposableItem().IsValid()))
        {
            return;
        }
        TEUIModelRef<FM_Equipment> local_10 = this.GetDisplayEquipmentModel();
        bool local_5 = local_10.IsValid();
        bool local_11 = local_5 && GetEquiptingAvatar().IsSet();
        FText local_20 = this.GetDisplayEquipmentLevelText(local_10);
        if (local_5 && !(local_20.IsEmpty()))
        {
            this.EnsureComposableItemLevelFeature();
        }
        if (local_5 || local_11)
        {
            this.EnsureComposableItemEquipMarkFeature();
        }
        this.RefreshComposableItemLevelVisibility(local_20);
        this.RefreshComposableItemEquipMarkState(local_11);
        return;
    }
    TEUIModelRef<FM_Equipment> GetDisplayEquipmentModel() const
    {
        int64 local_2 = 0;
        if (::FMS_ItemDataCache::Get(this.GetContext().Manager).TryGetItemUid(this.GetItem(), local_2) && (local_2 > 0))
        {
            TEUIModelRef<FM_Equipment> local_12 = ::FMS_EquipmentDataCache::Get(this.GetContext().Manager).GetEquipment(local_2);
            if (local_12.IsValid() && GetEquipmentConfig().IsSet())
            {
                return local_12;
            }
        }
        return TEUIModelRef<FM_Equipment>();
    }
    FText GetDisplayEquipmentLevelText(const TEUIModelRef<FM_Equipment> &inout Equipment) const
    {
        int local_2 = 0;
        int local_1 = 0;
        if (Equipment.IsValid() && GetEquipmentConfig().IsSet())
        {
            local_1 = local_2;
        }
        FText local_16;
        if (local_1 > 0)
        {
            FText local_8;
            local_8 = FText::AsCultureInvariant("Lv.{0}");
            local_16 = FText::Format(local_8, local_1);
        }
        else
        {
            FText local_8;
            local_16 = local_8;
        }
        return local_16;
    }
    void HandleCommonItemClicked()
    {
        if (!(this.GetbHasItem()))
        {
            return;
        }
        this.PinAndOpenOperations();
        return;
    }
    void BindCommonItemClickIntent()
    {
        TEUIModelRef<FVM_CommonItem> local_8;
        bool local_1 = !(this.GetbHasItem()) || !(this.GetComposableItem().IsValid());
        if (local_1)
        {
            local_1 = true;
        }
        else
        {
            TEUIModelRef<FVM_ComposableItem> local_4 = this.GetComposableItem();
            local_8.GetCommonItemVM();
            local_1 = !(local_8.IsValid());
        }
        if (local_1)
        {
            return;
        }
        TEUIModelRef<FVM_ComposableItem> local_4_2 = this.GetComposableItem();
        local_8.GetCommonItemVM();
        GetOnCommonItemClicked().AddUnique(this, FVM_InventoryMainItem::HandleCommonItemClicked);
        this.SetBoundCommonItemClickModel(TEUIModelWeakRef<FVM_CommonItem>());
        return;
    }
    void UnbindCommonItemClickIntent()
    {
        TEUIModelWeakRef<FVM_CommonItem> local_2 = this.GetBoundCommonItemClickModel();
        if (local_2.IsValid())
        {
            local_2 = this.GetBoundCommonItemClickModel();
        }
        this.SetBoundCommonItemClickModel(local_2);
        return;
    }
    void EnsureComposableItemCountFeature()
    {
        TEUIModelRef<FVM_CommonItem> local_6;
        bool local_3 = !(this.GetComposableItem().IsValid());
        if (local_3)
        {
            local_3 = true;
        }
        else
        {
            TEUIModelRef<FVM_ComposableItem> local_2 = this.GetComposableItem();
            local_3 = !(GetFeature_Count().IsEmpty());
        }
        if (local_3)
        {
            local_3 = true;
        }
        else
        {
            TEUIModelRef<FVM_ComposableItem> local_2_2 = this.GetComposableItem();
            local_6.GetCommonItemVM();
            local_3 = !(local_6.IsValid());
        }
        if (local_3)
        {
            return;
        }
        FEUIDynamicWidgetData local_30;
        TEUIModelRef<FVM_ComposableItem> local_2_3 = this.GetComposableItem();
        local_6.GetCommonItemVM();
        FEUIModelContainer local_44;
        local_30.ModelContainer = local_44;
        TEUIModelRef<FVM_ComposableItem> local_2_4 = this.GetComposableItem();
        if (GetRegistry() != nullptr)
        {
            TEUIModelRef<FVM_ComposableItem> local_2_5 = this.GetComposableItem();
            local_30.WidgetClass = GetRegistry().GetWidgetClassForFeature(EItemDisplayType(1), EItemDisplayFeature(1));
        }
        TEUIModelRef<FVM_ComposableItem> local_2_6 = this.GetComposableItem();
        local_30.SetFeature_Count();
        return;
    }
    void EnsureComposableItemLevelFeature()
    {
        TEUIModelRef<FVM_CommonItem> local_6;
        bool local_3 = !(this.GetComposableItem().IsValid());
        if (local_3)
        {
            local_3 = true;
        }
        else
        {
            TEUIModelRef<FVM_ComposableItem> local_2 = this.GetComposableItem();
            local_3 = !(GetFeature_Level().IsEmpty());
        }
        if (local_3)
        {
            local_3 = true;
        }
        else
        {
            TEUIModelRef<FVM_ComposableItem> local_2_2 = this.GetComposableItem();
            local_6.GetCommonItemVM();
            local_3 = !(local_6.IsValid());
        }
        if (local_3)
        {
            return;
        }
        FEUIDynamicWidgetData local_30;
        TEUIModelRef<FVM_ComposableItem> local_2_3 = this.GetComposableItem();
        local_6.GetCommonItemVM();
        FEUIModelContainer local_44;
        local_30.ModelContainer = local_44;
        TEUIModelRef<FVM_ComposableItem> local_2_4 = this.GetComposableItem();
        if (GetRegistry() != nullptr)
        {
            TEUIModelRef<FVM_ComposableItem> local_2_5 = this.GetComposableItem();
            local_30.WidgetClass = GetRegistry().GetWidgetClassForFeature(EItemDisplayType(1), EItemDisplayFeature(2));
        }
        TEUIModelRef<FVM_ComposableItem> local_2_6 = this.GetComposableItem();
        local_30.SetFeature_Level();
        return;
    }
    void EnsureComposableItemEquipMarkFeature()
    {
        TEUIModelRef<FVM_CommonItem> local_6;
        bool local_3 = !(this.GetComposableItem().IsValid());
        if (local_3)
        {
            local_3 = true;
        }
        else
        {
            TEUIModelRef<FVM_ComposableItem> local_2 = this.GetComposableItem();
            local_3 = !(GetFeature_EquipMark().IsEmpty());
        }
        if (local_3)
        {
            local_3 = true;
        }
        else
        {
            TEUIModelRef<FVM_ComposableItem> local_2_2 = this.GetComposableItem();
            local_6.GetCommonItemVM();
            local_3 = !(local_6.IsValid());
        }
        if (local_3)
        {
            return;
        }
        FEUIDynamicWidgetData local_30;
        TEUIModelRef<FVM_ComposableItem> local_2_3 = this.GetComposableItem();
        local_6.GetCommonItemVM();
        FEUIModelContainer local_44;
        local_30.ModelContainer = local_44;
        TEUIModelRef<FVM_ComposableItem> local_2_4 = this.GetComposableItem();
        if (GetRegistry() != nullptr)
        {
            TEUIModelRef<FVM_ComposableItem> local_2_5 = this.GetComposableItem();
            local_30.WidgetClass = GetRegistry().GetWidgetClassForFeature(EItemDisplayType(1), EItemDisplayFeature(3));
        }
        TEUIModelRef<FVM_ComposableItem> local_2_6 = this.GetComposableItem();
        local_30.SetFeature_EquipMark();
        return;
    }
    void RefreshComposableItemCountText()
    {
        bool local_7;
        bool local_3 = !(this.GetComposableItem().IsValid());
        if (local_3)
        {
            local_3 = true;
        }
        else
        {
            TEUIModelRef<FVM_CommonItem> local_6;
            TEUIModelRef<FVM_ComposableItem> local_2 = this.GetComposableItem();
            local_6.GetCommonItemVM();
            local_3 = !(local_6.IsValid());
        }
        if (local_3)
        {
            return;
        }
        FText local_12;
        if (!(this.GetItem().IsValid()))
        {
            local_7 = false;
        }
        else
        {
            local_7 = this.GetItem().opArrow().GetConfig();
        }
        local_7 = local_7 && (this.GetItem().opArrow().GetNum() > 0);
        local_7 = local_7 && !(this.GetDisplayEquipmentModel().IsValid());
        if (local_7)
        {
            local_12 = FText::AsNumber(this.GetItem().opArrow().GetNum(), FNumberFormattingOptions::DefaultWithGrouping());
        }
        TEUIModelRef<FVM_ComposableItem> local_2_2 = this.GetComposableItem();
        return;
    }
    void RefreshComposableItemLevelVisibility(const FText &inout LevelText)
    {
        if (!(this.GetComposableItem().IsValid()))
        {
            return;
        }
        TEUIModelRef<FVM_ComposableItem> local_2 = this.GetComposableItem();
        ::ItemFeature_Level_Util::SetDisplayLevelText(GetFeature_Level().ModelContainer, LevelText);
        bool local_3 = !(LevelText.IsEmpty());
        TEUIModelRef<FVM_ComposableItem> local_2_2 = this.GetComposableItem();
        ::ComposableItemUtility::SetIsShowLevel(local_3);
        return;
    }
    void RefreshComposableItemEquipMarkState(const bool bIsEquipped)
    {
        if (!(this.GetComposableItem().IsValid()))
        {
            return;
        }
        if (bIsEquipped)
        {
        }
        TEUIModelRef<FVM_ComposableItem> local_2 = this.GetComposableItem();
        return;
    }
    void RebuildTipHoverModels()
    {
        FItemTipHandle local_2;
        this.SetTipHandle(local_2);
        if (!(this.GetbHasItem()))
        {
            return;
        }
        FItemTipData local_74 = ::CommonItemTip::MakeSimpleFromItemData(this.GetItem());
        ::CommonItemTip::AddAction(local_74, EItemTipActionId(1));
        FSimpleModelEvent local_98;
        local_98.Add(this, FVM_InventoryMainItem::PinAndOpenOperations);
        this.SetTipHandle(::CommonItemTip::MakeHandle(this.GetContext().Manager, local_74));
        this.SetTipHoverModels(this.GetTipHandle().GetModels());
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
    bool GetbIsValid() const property
    {
        this.TrackPropertyRead(1);
        return this.m_bIsValid;
    }
    void SetbIsValid(const bool __Value) property
    {
        if (!(this.m_bIsValid) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_bIsValid = __Value;
        return;
    }
    bool GetbHasItem() const property
    {
        this.TrackPropertyRead(2);
        return this.m_bHasItem;
    }
    void SetbHasItem(const bool __Value) property
    {
        if (!(this.m_bHasItem) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_bHasItem = __Value;
        return;
    }
    bool GetbPendingPinnedTipSelectionSync() const property
    {
        this.TrackPropertyRead(3);
        return this.m_bPendingPinnedTipSelectionSync;
    }
    void SetbPendingPinnedTipSelectionSync(const bool __Value) property
    {
        if (!(this.m_bPendingPinnedTipSelectionSync) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_bPendingPinnedTipSelectionSync = __Value;
        return;
    }
    TEUIModelRef<FVM_ComposableItem> GetComposableItem() const property
    {
        this.TrackPropertyRead(4);
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
        this.MarkPropertyDirty(4);
        this.m_ComposableItem = __Value;
        return;
    }
    const FItemTipHandle GetTipHandle() const property
    {
        const FItemTipHandle __r;
        this.TrackPropertyRead(5);
        return __r;
    }
    FItemTipHandle GetModify_TipHandle() property
    {
        FItemTipHandle __r;
        this.MarkPropertyDirty(5);
        return __r;
    }
    void SetTipHandle(const FItemTipHandle &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(5);
        return;
    }
    const FEUIModelContainer GetTipHoverModels() const property
    {
        const FEUIModelContainer __r;
        this.TrackPropertyRead(6);
        return __r;
    }
    FEUIModelContainer GetModify_TipHoverModels() property
    {
        FEUIModelContainer __r;
        this.MarkPropertyDirty(6);
        return __r;
    }
    void SetTipHoverModels(const FEUIModelContainer &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_TipHoverModels = __Value;
        return;
    }
    int GetPinnedTipRequestVersion() const property
    {
        this.TrackPropertyRead(7);
        return this.m_PinnedTipRequestVersion;
    }
    void SetPinnedTipRequestVersion(const int __Value) property
    {
        if (this.m_PinnedTipRequestVersion == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(7);
        this.m_PinnedTipRequestVersion = __Value;
        return;
    }
    const FCommonHoverHandle GetPinnedTipHoverHandle() const property
    {
        const FCommonHoverHandle __r;
        this.TrackPropertyRead(8);
        return __r;
    }
    FCommonHoverHandle GetModify_PinnedTipHoverHandle() property
    {
        FCommonHoverHandle __r;
        this.MarkPropertyDirty(8);
        return __r;
    }
    void SetPinnedTipHoverHandle(const FCommonHoverHandle &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(8);
        return;
    }
    TWeakObjectPtr<UWidget> GetSharedHoverAnchor() const property
    {
        this.TrackPropertyRead(9);
        return this.m_SharedHoverAnchor;
    }
    void SetSharedHoverAnchor(const TWeakObjectPtr<UWidget> &inout __Value) property
    {
        if ((this.m_SharedHoverAnchor == __Value))
        {
            return;
        }
        this.MarkPropertyDirty(9);
        this.m_SharedHoverAnchor = __Value;
        return;
    }
    ECommonHoverLayout GetSharedHoverLayout() const property
    {
        this.TrackPropertyRead(10);
        return this.m_SharedHoverLayout;
    }
    void SetSharedHoverLayout(const ECommonHoverLayout __Value) property
    {
        if (int(this.m_SharedHoverLayout) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(10);
        this.m_SharedHoverLayout = __Value;
        return;
    }
    TEUIModelWeakRef<FVM_CommonItem> GetBoundCommonItemClickModel() const property
    {
        this.TrackPropertyRead(11);
        return this.m_BoundCommonItemClickModel;
    }
    void SetBoundCommonItemClickModel(const TEUIModelWeakRef<FVM_CommonItem> &inout __Value) property
    {
        TEUIModelWeakRef<FVM_CommonItem> local_2;
        local_2 = this.m_BoundCommonItemClickModel;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(11);
        this.m_BoundCommonItemClickModel = __Value;
        return;
    }
}

struct FVM_InventoryMain : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_InventoryMainRootCategory>> m_RootCategories;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_RedDot>> m_RedDots;
    UPROPERTY()
    TArray<FEUIModelContainer> m_RootCategoryListItems;
    UPROPERTY()
    FEUIModelContainer m_SelectedRootCategoryItem;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_SelectableItem>> m_RootCategorySelectableItems;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_InventoryMainCategory>> m_Categories;
    UPROPERTY()
    TArray<TEUIModelRef<FM_ItemData>> m_CurrentCategoryItems;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_InventoryMainItem>> m_CurrentDisplayItems;
    UPROPERTY()
    FEUIModelContainer m_SelectedItem;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_CommonItemBar>> m_ItemBarItems;
    UPROPERTY()
    TEUIModelRef<FVM_CommonDropdown> m_FilterLeft;
    UPROPERTY()
    TEUIModelRef<FVM_CommonDropdown> m_FilterRight;
    UPROPERTY()
    TEUIModelRef<FVM_InventoryQuickSlots> m_InventoryQuickSlots;
    UPROPERTY()
    int m_RootCategoryIndex;
    UPROPERTY()
    int m_CurrentCategoryIndex;
    UPROPERTY()
    int m_SelectedItemIndex;
    UPROPERTY()
    UItemFilterBase m_ApplyingFilter;
    UPROPERTY()
    UItemSorterBase m_SelectedSorter;
    UPROPERTY()
    UItemSorterBase m_ApplyingSorter;
    UPROPERTY()
    TEUIModelRef<FMS_PlayerInventory> m_PlayerInventory;
    UPROPERTY()
    TEUIModelRef<FMS_CommonHoverManager> m_CommonHoverManager;
    UPROPERTY()
    int64 m_CurrentCategoryLastSortTimestamp;
    UPROPERTY()
    bool m_bIsInventoryQuickSlotUnlocked;
    UPROPERTY()
    TMap<uint64, TDataObjectPtr<FItemConfig>> ViewedRedDotItemUids;

    FVM_InventoryMain()
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    FVM_InventoryMain(const FVM_InventoryMain &inout Other)
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    FVM_InventoryMain opAssign(const FVM_InventoryMain &inout Other)
    {
        FVM_InventoryMain __r;
        this.m_RootCategories = Other.m_RootCategories;
        this.m_RedDots = Other.m_RedDots;
        this.m_RootCategoryListItems = Other.m_RootCategoryListItems;
        this.m_SelectedRootCategoryItem = Other.m_SelectedRootCategoryItem;
        this.m_RootCategorySelectableItems = Other.m_RootCategorySelectableItems;
        this.m_Categories = Other.m_Categories;
        this.m_CurrentCategoryItems = Other.m_CurrentCategoryItems;
        this.m_CurrentDisplayItems = Other.m_CurrentDisplayItems;
        this.m_SelectedItem = Other.m_SelectedItem;
        this.m_ItemBarItems = Other.m_ItemBarItems;
        this.m_FilterLeft = Other.m_FilterLeft;
        this.m_FilterRight = Other.m_FilterRight;
        this.m_InventoryQuickSlots = Other.m_InventoryQuickSlots;
        this.m_RootCategoryIndex = int(Other.m_RootCategoryIndex);
        this.m_CurrentCategoryIndex = int(Other.m_CurrentCategoryIndex);
        this.m_SelectedItemIndex = int(Other.m_SelectedItemIndex);
        this.m_ApplyingFilter = Other.m_ApplyingFilter;
        this.m_SelectedSorter = Other.m_SelectedSorter;
        this.m_ApplyingSorter = Other.m_ApplyingSorter;
        this.m_PlayerInventory = Other.m_PlayerInventory;
        this.m_CommonHoverManager = Other.m_CommonHoverManager;
        this.m_CurrentCategoryLastSortTimestamp = Other.m_CurrentCategoryLastSortTimestamp;
        this.m_bIsInventoryQuickSlotUnlocked = Other.m_bIsInventoryQuickSlotUnlocked;
        return __r;
    }
    void PostConstruct()
    {
        int local_40 = 0;
        this.SetPlayerInventory(TEUIModelRef<FMS_PlayerInventory>(::FMS_PlayerInventory::Get(this.GetContext().Manager)));
        this.SetCommonHoverManager(TEUIModelRef<FMS_CommonHoverManager>(::FMS_CommonHoverManager::Get(this.GetContext().Manager)));
        this.RefreshInventoryQuickSlotUnlockState();
        this.ResetSelectedItemIndex();
        this.RefreshItemBarItems();
        int local_5 = 0;
        for (; local_5 < this.GetInventorySettings().Categories.Num(); )
        {
            FVM_InventoryMainRootCategory& local_12 = this.MakeRootCategory(local_5);
            FVM_SelectableItem& local_14 = ::FVM_SelectableItem::Create(this.GetContext().Manager);
            local_14.SetbIsSelected((local_5 == this.GetRootCategoryIndex()));
            FEUIModelContainer local_28;
            local_28.AddModel(FEUIModelRef(local_12), false);
            FEUIModelRef local_30 = FEUIModelRef(local_14);
            local_28.AddModel(local_30, false);
            UInventorySettings local_8 = this.GetInventorySettings();
            local_28.AddModel(local_30, false);
            FVM_CommonTabItem& local_32 = ::FVM_CommonTabItem::Create(this.GetContext().Manager);
            local_32.SetTitleText(this.GetInventorySettings().Categories[local_5].DisplayName);
            local_28.AddModel(FEUIModelRef(local_32), false);
            int64 local_34 = local_5;
            FRedDotNodeData local_38 = FRedDotNodeData(GameplayTags::RedDotSystem_Inventory_Menu, local_34);
            local_28.AddModel(FEUIModelRef(local_40), false);
            this.GetModify_RedDots().Add(TEUIModelRef<FVM_RedDot>(local_40));
            this.GetModify_RootCategories().Add(TEUIModelRef<FVM_InventoryMainRootCategory>(local_12));
            this.GetModify_RootCategoryListItems().Add(local_28);
            this.GetModify_RootCategorySelectableItems().Add(TEUIModelRef<FVM_SelectableItem>(local_14));
            ++local_5;
        }
        this.RefreshSelectedRootCategoryItem();
        this.RefreshCategories();
        this.AddViewedRedDot();
        return;
    }
    void OnPlayerInventoryChanged(const FMsg_PlayerInventoryChanged &inout Msg)
    {
        this.RefreshCategoryItems();
        this.AddViewedRedDot();
        return;
    }
    void OnAvatarEquipmentChanged(const FMsg_AvatarEquipmentChanged &inout Msg)
    {
        for (auto& local_16 : this.GetCurrentDisplayItems())
        {
            if (local_16.IsValid())
            {
                RefreshEquipmentDisplayFeatures();
            }
        }
        return;
    }
    void OnSystemUnlockFromGS(const FMsg_SystemUnlockFromGS &inout Msg)
    {
        if (int(Msg.SystemModule) != 116)
        {
            return;
        }
        this.RefreshInventoryQuickSlotUnlockState();
        return;
    }
    void SelectRootCategory(const int Index)
    {
        if (!(this.GetRootCategories().IsValidIndex(Index)) || (this.GetRootCategoryIndex() == Index))
        {
            return;
        }
        this.SetRootCategoryIndex(Index);
        this.RefreshSelectedRootCategoryItem();
        this.RefreshRootCategorySelection();
        this.RefreshCategories();
        this.ClearItemSelection();
        this.FlushViewedRedDot();
        this.AddViewedRedDot();
        return;
    }
    void BeginDestroy()
    {
        this.FlushViewedRedDot();
        return;
    }
    void SelectCategory(const int Index)
    {
        if (!(this.GetCategories().IsValidIndex(Index)) || (this.GetCurrentCategoryIndex() == Index))
        {
            return;
        }
        this.SetCurrentCategoryIndex(Index);
        this.RefreshCategorySelection();
        this.InitCategorySaveData();
        this.InitFilterAndSorter();
        this.RefreshCategoryItems();
        this.ClearItemSelection();
        return;
    }
    void SelectItemIndex(const int Index)
    {
        if (this.GetSelectedItemIndex() == Index)
        {
            return;
        }
        this.SetSelectedItemIndex(Index);
        return;
    }
    void ClearSelection()
    {
        if (this.GetCurrentDisplayItems().IsValidIndex(this.GetSelectedItemIndex()) && this.GetCurrentDisplayItems()[this.GetSelectedItemIndex()].IsValid())
        {
            int local_1 = this.GetSelectedItemIndex();
            ClosePinnedTipHover();
        }
        this.SelectItemIndex(INDEX_NONE);
        return;
    }
    void SyncSelectionFromPinnedTipRequest()
    {
        int local_1 = 0;
        for (; local_1 < this.GetCurrentDisplayItems().Num(); ++local_1)
        {
            if (!(this.GetCurrentDisplayItems()[local_1].IsValid()))
            {
                continue;
            }
            if (!(ConsumePendingPinnedTipSelectionSync()))
            {
                continue;
            }
            if (GetbHasItem())
            {
                this.SelectItemIndex(local_1);
            }
            break;
        }
        return;
    }
    void SyncSelectedItemFromSelection()
    {
        bool local_2 = false;
        if (this.GetCurrentDisplayItems().IsValidIndex(this.GetSelectedItemIndex()) && this.GetCurrentDisplayItems()[this.GetSelectedItemIndex()].IsValid())
        {
            FEUIModelRef local_6;
            local_2 = false;
            int local_1 = this.GetSelectedItemIndex();
            local_6;
            this.GetModify_SelectedItem().AddModel(local_6, this.GetCurrentDisplayItems()[local_1]);
        }
        return;
    }
    void SyncSelectedItemTipHoverHandleFromSelectedItem()
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    void SetupQuickSlots(const UWidget HoverLimitationWidget)
    {
        if (!(this.GetInventoryQuickSlots().IsValid()))
        {
            this.SetInventoryQuickSlots(TEUIModelRef<FVM_InventoryQuickSlots>(::FVM_InventoryQuickSlots::Create(this.GetContext().Manager, HoverLimitationWidget)));
        }
        return;
    }
    bool GetIsInventoryQuickSlotUnlock() const
    {
        return this.GetbIsInventoryQuickSlotUnlocked();
    }
    void RefreshInventoryQuickSlotUnlockState()
    {
        this.SetbIsInventoryQuickSlotUnlocked(::FMS_SystemControl::Get(this.GetContext().Manager).IsSystemUnlock(ESystemModule(116), false));
        return;
    }
    bool GetHasMultipleCategories() const
    {
        return (this.GetCategories().Num() > 1);
    }
    int GetCurrentCategoryItemNum() const
    {
        return this.GetCurrentCategoryItems().Num();
    }
    int GetCurrentDisplayItemNum() const
    {
        return this.GetCurrentDisplayItems().Num();
    }
    FText GetCurrentTrunkSlotNumText() const
    {
        int local_2 = int(this.ResolveCurrentCategoryTrunk());
        if (::ItemConfigUtils::LimitTrunkMax(EItemTrunk(local_2)))
        {
            return FText::Format(FText::AsCultureInvariant("{0}/{1}"), this.GetPlayerInventory().opArrow().GetCurrentTrunkSlotNum(EItemTrunk(::ItemConfigUtils::GetTrunkMax(EItemTrunk(local_2)))));
        }
        return FText::Format(FText::AsCultureInvariant("{0}/в€ћ"), this.GetPlayerInventory().opArrow().GetCurrentTrunkSlotNum());
    }
    bool ShouldShowTrunkSlotNum() const
    {
        return (int(this.ResolveCurrentCategoryTrunk()) != 0);
    }
    bool ShouldShowFilterAndSorter() const
    {
        return !(this.IsPureDisplayCategory());
    }
    TArray<FEUIDynamicWidgetData> GetItemBarEntryDataList() const
    {
        TArray<FEUIDynamicWidgetData> local_4;
        for (auto& local_20 : this.GetItemBarItems())
        {
            if (!(local_20.IsValid()))
            {
                continue;
            }
            FEUIDynamicWidgetData local_44;
            local_44.ModelContainer = FEUIModelContainer(local_20.opImplConv());
            local_4.Add(local_44);
        }
        return local_4;
    }
    void PrevRootCategory()
    {
        this.SelectRootCategory(FMath::WrapIndex((this.GetRootCategoryIndex() - 1), 0, this.GetRootCategories().Num()));
        return;
    }
    void NextRootCategory()
    {
        this.SelectRootCategory(FMath::WrapIndex((this.GetRootCategoryIndex() + 1), 0, this.GetRootCategories().Num()));
        return;
    }
    void PrevCategory()
    {
        this.SelectCategory(FMath::WrapIndex((this.GetCurrentCategoryIndex() - 1), 0, this.GetCategories().Num()));
        return;
    }
    void NextCategory()
    {
        this.SelectCategory(FMath::WrapIndex((this.GetCurrentCategoryIndex() + 1), 0, this.GetCategories().Num()));
        return;
    }
    void ConfirmSort()
    {
        this.SaveCategorySortData(this.GetSelectedSorter());
        this.SetApplyingSorter(this.GetSelectedSorter());
        this.RefreshDisplayingItems();
        this.ClearItemSelection();
        return;
    }
    void AddViewedRedDot()
    {
        TEUIModelRef<FM_ItemData> local_24;
        for (auto& local_16 : this.GetCurrentDisplayItems())
        {
            if (!(local_16.IsValid()) || !(GetbHasItem()))
            {
                continue;
            }
            int64 local_20 = 0;
            local_24.GetItem();
            if (::FMS_ItemDataCache::Get(this.GetContext().Manager).TryGetItemUid(local_24, local_20) && (local_20 > 0))
            {
                local_24.GetItem();
                this.ViewedRedDotItemUids.Add(local_20, GetConfig());
            }
        }
        return;
    }
    void FlushViewedRedDot()
    {
        int local_24;
        FMS_RedDotSystem& local_2 = ::FMS_RedDotSystem::Get(this.GetContext().Manager);
        for (auto& local_22 : this.ViewedRedDotItemUids)
        {
            local_24 = local_22.GetKey();
            TDataObjectPtr<FItemConfig> local_74;
            TDataObjectPtr<FItemConfig> local_50 = local_74;
            ::FMS_PlayerInventory::Get(this.GetContext().Manager).ConsumeRootCategoryRedDot(local_24, local_50);
        }
        this.ViewedRedDotItemUids.Reset();
        return;
    }
    void OnFilterSelected(const int Index)
    {
        if (this.GetInventorySettings().GetFilterConfigAt(this.GetCurrentCategory(), Index).IsSet())
        {
        }
        else
        {
        }
        UItemFilterBase local_24;
        this.SetApplyingFilter(local_24);
        this.RefreshDisplayingItems();
        this.ClearItemSelection();
        local_24 = this.GetApplyingFilter();
        this.SaveCategoryFilterData(local_24);
        return;
    }
    void OnSorterSelected(const int Index)
    {
        if (this.GetInventorySettings().GetSorterConfigAt(this.GetCurrentCategory(), Index).IsSet())
        {
            this.ConfirmSort();
        }
        else
        {
            this.SetSelectedSorter(nullptr);
        }
        return;
    }
    FGameplayTag GetCurrentCategory() const property
    {
        if (this.GetCategories().IsValidIndex(this.GetCurrentCategoryIndex()))
        {
            return this.GetCategories()[this.GetCurrentCategoryIndex()].opArrow().GetCategory();
        }
        return FGameplayTag();
    }
    void RefreshCategories()
    {
        int local_7 = 0;
        this.GetModify_Categories().Empty(0);
        int local_1 = this.GetRootCategoryIndex();
        if (this.GetInventorySettings().Categories.IsValidIndex())
        {
            this.SetCurrentCategoryIndex(0);
            int local_6 = 0;
            while (local_6 < local_7)
            {
                local_7 = this.GetRootCategoryIndex();
                this.GetModify_Categories().Add(TEUIModelRef<FVM_InventoryMainCategory>(this.MakeCategory(this.GetInventorySettings().Categories[local_6].Categories[local_6])));
                ++local_6;
                local_7 = this.GetRootCategoryIndex();
                local_7 = this.GetInventorySettings().Categories[].Categories.Num();
            }
        }
        this.RefreshCategorySelection();
        this.InitCategorySaveData();
        this.InitFilterAndSorter();
        this.RefreshCategoryItems();
        return;
    }
    void RefreshItemBarItems()
    {
        this.GetModify_ItemBarItems().Empty(0);
        for (auto& local_20 : this.GetInventorySettings().ItemBarConfigs)
        {
            if (!(local_20))
            {
                continue;
            }
            FVM_CommonItemBar& local_22 = ::FVM_CommonItemBar::Create(this.GetContext().Manager);
            local_22.SetupItemConfig(local_20);
            this.GetModify_ItemBarItems().Add(TEUIModelRef<FVM_CommonItemBar>(local_22));
        }
        return;
    }
    void RefreshCategoryItems()
    {
        this.GetModify_CurrentCategoryItems().Empty(0);
        TRawPtr<FInventoryPureDisplayCategoryConfig> local_8 = this.GetInventorySettings().PureDisplayCategories.Find(this.GetCurrentCategory());
        if (local_8)
        {
            TArray<TEUIModelRef<FM_ItemData>> local_18;
            TEUIModelRef<FMS_PlayerInventory> local_14 = this.GetPlayerInventory();
            local_18.GetAllItemsByItemTags(local_8.opArrow().ItemTags);
            for (auto& local_32 : local_18)
            {
                this.GetModify_CurrentCategoryItems().Add(local_32);
            }
        }
        else
        {
            TArray<TEUIModelRef<FM_ItemData>> local_18;
            FGameplayTag local_34 = this.GetCurrentCategory();
            TEUIModelRef<FMS_PlayerInventory> local_14_2 = this.GetPlayerInventory();
            local_18.GetAllItemsByCategory(local_34);
            for (auto& local_32 : local_18)
            {
                this.GetModify_CurrentCategoryItems().Add(local_32);
            }
        }
        this.RefreshDisplayingItems();
        return;
    }
    void RefreshDisplayingItems()
    {
        this.GetModify_CurrentDisplayItems().Empty(0);
        TArray<TEUIModelRef<FM_ItemData>> local_6 = this.GetCurrentCategoryItems();
        this.KeepItemsMatchingCurrentCategory(local_6);
        ::ItemDataUtils::FilterItems(local_6, this.GetApplyingFilter());
        ::ItemDataUtils::SortItems(local_6, this.GetApplyingSorter(), this.GetCurrentCategoryLastSortTimestamp(), true);
        for (auto& local_28 : local_6)
        {
            TEUIModelRef<FVM_InventoryMainItem> local_30 = TEUIModelRef<FVM_InventoryMainItem>(::FVM_InventoryMainItem::Create(this.GetContext().Manager, local_28));
            this.GetModify_CurrentDisplayItems().Add(local_30);
        }
        int local_32 = int(this.ResolveCurrentCategoryTrunk());
        if (!(this.IsPureDisplayCategory()) && ::ItemConfigUtils::LimitTrunkMax(EItemTrunk(local_32)))
        {
            while (this.GetCurrentDisplayItems().Num() < ::ItemConfigUtils::GetTrunkMax(EItemTrunk(local_32)))
            {
                TEUIModelRef<FM_ItemData> local_36;
                TEUIModelRef<FVM_InventoryMainItem> local_30_2 = TEUIModelRef<FVM_InventoryMainItem>(::FVM_InventoryMainItem::Create(this.GetContext().Manager, local_36));
                this.GetModify_CurrentDisplayItems().Add(local_30_2);
            }
        }
        this.ResetSelectedItemIndex();
        return;
    }
    void KeepItemsMatchingCurrentCategory(TArray<TEUIModelRef<FM_ItemData>> &inout InOutItems) const
    {
        if (this.IsPureDisplayCategory())
        {
            return;
        }
        int local_2 = 0;
        int local_4 = 0;
        while (local_4 < InOutItems.Num())
        {
            if (this.DoesItemMatchCurrentCategory(InOutItems[local_4]))
            {
                InOutItems[local_2] = InOutItems[local_4];
                ++local_2;
            }
            ++local_4;
        }
        InOutItems.SetNum(local_2);
        return;
    }
    bool DoesItemMatchCurrentCategory(const TEUIModelRef<FM_ItemData> &inout Item) const
    {
        if (!(Item.IsValid()) || !(Item.opArrow().GetConfig()))
        {
            return false;
        }
        return Item.opArrow().GetConfig().opArrow().ItemCategory.AsGameplayTag().MatchesTag(this.GetCurrentCategory());
    }
    void InitFilterAndSorter()
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
    }
    void CloseInventoryDropdown(const TEUIModelRef<FVM_CommonDropdown> &inout Dropdown)
    {
        if (!(Dropdown.IsValid()))
        {
            return;
        }
        bool local_1 = false;
        local_1.SetDropdownOpen();
        return;
    }
    void InitCategorySaveData()
    {
        FInventoryCategorySortData local_18;
        TRawPtr<FInventoryPureDisplayCategoryConfig> local_6 = this.GetInventorySettings().PureDisplayCategories.Find(this.GetCurrentCategory());
        if (local_6)
        {
            this.SetApplyingFilter(nullptr);
            this.SetApplyingSorter(local_6.opArrow().CategorySorter);
            this.SetCurrentCategoryLastSortTimestamp(FDateTime::MaxValue().ToUnixTimestamp());
            return;
        }
        if (::InventorySaveGame::Get(this.GetPlayerId()).CategorySortData.Find(this.GetCurrentCategory(), local_18))
        {
            this.SetApplyingSorter(local_18.LastUsedSorter);
            this.SetCurrentCategoryLastSortTimestamp(local_18.LastSortTimestamp);
            return;
        }
        this.SetApplyingSorter(nullptr);
        this.SetCurrentCategoryLastSortTimestamp(0);
        return;
    }
    void ClearItemSelection()
    {
        this.ClearSelection();
        return;
    }
    void RefreshRootCategorySelection()
    {
        this.RefreshSelectedRootCategoryItem();
        int local_1 = 0;
        for (; local_1 < this.GetRootCategories().Num(); ++local_1)
        {
            if (this.GetRootCategories()[local_1].IsValid())
            {
                bool local_4 = (local_1 == this.GetRootCategoryIndex());
                local_4.SetbSelected();
                if (this.GetRootCategorySelectableItems().IsValidIndex(local_1) && this.GetRootCategorySelectableItems()[local_1].IsValid())
                {
                    local_4.SetbIsSelected();
                }
            }
        }
        return;
    }
    void RefreshSelectedRootCategoryItem()
    {
        FEUIModelContainer local_30;
        if (this.GetRootCategoryListItems().IsValidIndex(this.GetRootCategoryIndex()))
        {
            local_30 = this.GetRootCategoryListItems()[this.GetRootCategoryIndex()];
        }
        else
        {
            local_30 = FEUIModelContainer();
        }
        this.SetSelectedRootCategoryItem(local_30);
        return;
    }
    void RefreshCategorySelection()
    {
        int local_1 = 0;
        for (; local_1 < this.GetCategories().Num(); ++local_1)
        {
            if (this.GetCategories()[local_1].IsValid())
            {
                (local_1 == this.GetCurrentCategoryIndex()).SetbSelected();
            }
        }
        return;
    }
    void SaveCategorySortData(const UItemSorterBase Sorter)
    {
        UInventorySaveGame local_6 = ::InventorySaveGame::Get(this.GetPlayerId());
        FGameplayTag local_8 = this.GetCurrentCategory();
        this.SetCurrentCategoryLastSortTimestamp(::FASCommonUtils::GetTimestamp());
        FInventoryCategorySortData local_10;
        local_10.LastSortTimestamp = this.GetCurrentCategoryLastSortTimestamp();
        ::InventorySaveGame::Save(this.GetPlayerId(), local_6, true);
        return;
    }
    void SaveCategoryFilterData(const UItemFilterBase Filter)
    {
        UInventorySaveGame local_6 = ::InventorySaveGame::Get(this.GetPlayerId());
        FGameplayTag local_8 = this.GetCurrentCategory();
        ::InventorySaveGame::Save(this.GetPlayerId(), local_6, true);
        return;
    }
    FVM_InventoryMainRootCategory MakeRootCategory(const int Index)
    {
        int local_8 = 0;
        FVM_InventoryMainRootCategory __r;
        FInventoryCategoryConfig& local_4 = this.GetInventorySettings().Categories[];
        TEUIModelWeakRef<FVM_InventoryMain> local_6 = TEUIModelWeakRef<FVM_InventoryMain>(this);
        local_8.SetbSelected((Index == this.GetRootCategoryIndex()));
        return __r;
    }
    FVM_InventoryMainCategory MakeCategory(const FGameplayTag &inout Category, const int Index)
    {
        int local_4 = 0;
        FVM_InventoryMainCategory __r;
        TEUIModelWeakRef<FVM_InventoryMain> local_2 = TEUIModelWeakRef<FVM_InventoryMain>(this);
        local_4.SetbSelected((Index == this.GetCurrentCategoryIndex()));
        return __r;
    }
    TArray<FEUIModelContainer> MakeFilterDropdownOptions(const UItemFilterBase SelectedFilter, int &inout OutDefaultSelectedIndex) const
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
        TArray<FEUIModelContainer> __r; return __r;
    }
    UItemFilterBase ResolveFilterByIndex(const int Index) const
    {
        if (this.GetInventorySettings().GetFilterConfigAt(this.GetCurrentCategory(), Index).IsSet())
        {
        }
        else
        {
        }
        UItemFilterBase local_24;
        return local_24;
    }
    TArray<FEUIModelContainer> MakeSorterDropdownOptions(const UItemSorterBase InSelectedSorter, int &inout OutDefaultSelectedIndex) const
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
        TArray<FEUIModelContainer> __r; return __r;
    }
    UItemSorterBase ResolveSorterByIndex(const int Index) const
    {
        if (this.GetInventorySettings().GetSorterConfigAt(this.GetCurrentCategory(), Index).IsSet())
        {
        }
        else
        {
        }
        UItemSorterBase local_24;
        return local_24;
    }
    UInventorySettings GetInventorySettings() const property
    {
        return GetGameplaySettings<UInventorySettings>();
    }
    uint GetPlayerId() const property
    {
        FECSEntity local_4 = this.GetContext().GetLocalPlayer();
        Get local_8;
        return local_8.opCall().GetPlayerId();
    }
    bool IsPureDisplayCategory() const
    {
        return this.GetInventorySettings().PureDisplayCategories.Contains(this.GetCurrentCategory());
    }
    EItemTrunk ResolveCurrentCategoryTrunk() const
    {
        FGameplayTag local_2 = FGameplayTag(this.GetCurrentCategory());
        while (local_2.IsValid())
        {
            EItemTrunk local_7 = ::FItemCategoryTrunkBinding::FindTrunk(local_2);
            if ((int(local_7)) != 0)
            {
                return local_7;
            }
            FGameplayTag local_4 = local_2.RequestDirectParent();
            if ((local_4 == local_2))
            {
                break;
            }
            local_2 = local_4;
        }
        return EItemTrunk(0);
    }
    void ResetSelectedItemIndex()
    {
        this.ClearSelection();
        return;
    }
    const TArray<TEUIModelRef<FVM_InventoryMainRootCategory>> GetRootCategories() const property
    {
        const TArray<TEUIModelRef<FVM_InventoryMainRootCategory>> __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    TArray<TEUIModelRef<FVM_InventoryMainRootCategory>> GetModify_RootCategories() property
    {
        TArray<TEUIModelRef<FVM_InventoryMainRootCategory>> __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetRootCategories(const TArray<TEUIModelRef<FVM_InventoryMainRootCategory>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_RootCategories = __Value;
        return;
    }
    const TArray<TEUIModelRef<FVM_RedDot>> GetRedDots() const property
    {
        const TArray<TEUIModelRef<FVM_RedDot>> __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    TArray<TEUIModelRef<FVM_RedDot>> GetModify_RedDots() property
    {
        TArray<TEUIModelRef<FVM_RedDot>> __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetRedDots(const TArray<TEUIModelRef<FVM_RedDot>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_RedDots = __Value;
        return;
    }
    const TArray<FEUIModelContainer> GetRootCategoryListItems() const property
    {
        const TArray<FEUIModelContainer> __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    TArray<FEUIModelContainer> GetModify_RootCategoryListItems() property
    {
        TArray<FEUIModelContainer> __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetRootCategoryListItems(const TArray<FEUIModelContainer> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_RootCategoryListItems = __Value;
        return;
    }
    const FEUIModelContainer GetSelectedRootCategoryItem() const property
    {
        const FEUIModelContainer __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    FEUIModelContainer GetModify_SelectedRootCategoryItem() property
    {
        FEUIModelContainer __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetSelectedRootCategoryItem(const FEUIModelContainer &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_SelectedRootCategoryItem = __Value;
        return;
    }
    const TArray<TEUIModelRef<FVM_SelectableItem>> GetRootCategorySelectableItems() const property
    {
        const TArray<TEUIModelRef<FVM_SelectableItem>> __r;
        this.TrackPropertyRead(4);
        return __r;
    }
    TArray<TEUIModelRef<FVM_SelectableItem>> GetModify_RootCategorySelectableItems() property
    {
        TArray<TEUIModelRef<FVM_SelectableItem>> __r;
        this.MarkPropertyDirty(4);
        return __r;
    }
    void SetRootCategorySelectableItems(const TArray<TEUIModelRef<FVM_SelectableItem>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_RootCategorySelectableItems = __Value;
        return;
    }
    const TArray<TEUIModelRef<FVM_InventoryMainCategory>> GetCategories() const property
    {
        const TArray<TEUIModelRef<FVM_InventoryMainCategory>> __r;
        this.TrackPropertyRead(5);
        return __r;
    }
    TArray<TEUIModelRef<FVM_InventoryMainCategory>> GetModify_Categories() property
    {
        TArray<TEUIModelRef<FVM_InventoryMainCategory>> __r;
        this.MarkPropertyDirty(5);
        return __r;
    }
    void SetCategories(const TArray<TEUIModelRef<FVM_InventoryMainCategory>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_Categories = __Value;
        return;
    }
    const TArray<TEUIModelRef<FM_ItemData>> GetCurrentCategoryItems() const property
    {
        const TArray<TEUIModelRef<FM_ItemData>> __r;
        this.TrackPropertyRead(6);
        return __r;
    }
    TArray<TEUIModelRef<FM_ItemData>> GetModify_CurrentCategoryItems() property
    {
        TArray<TEUIModelRef<FM_ItemData>> __r;
        this.MarkPropertyDirty(6);
        return __r;
    }
    void SetCurrentCategoryItems(const TArray<TEUIModelRef<FM_ItemData>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_CurrentCategoryItems = __Value;
        return;
    }
    const TArray<TEUIModelRef<FVM_InventoryMainItem>> GetCurrentDisplayItems() const property
    {
        const TArray<TEUIModelRef<FVM_InventoryMainItem>> __r;
        this.TrackPropertyRead(7);
        return __r;
    }
    TArray<TEUIModelRef<FVM_InventoryMainItem>> GetModify_CurrentDisplayItems() property
    {
        TArray<TEUIModelRef<FVM_InventoryMainItem>> __r;
        this.MarkPropertyDirty(7);
        return __r;
    }
    void SetCurrentDisplayItems(const TArray<TEUIModelRef<FVM_InventoryMainItem>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(7);
        this.m_CurrentDisplayItems = __Value;
        return;
    }
    FEUIModelContainer GetSelectedItem() const property
    {
        FEUIModelContainer __r;
        this.TrackPropertyRead(8);
        return __r;
    }
    FEUIModelContainer GetModify_SelectedItem() property
    {
        FEUIModelContainer __r;
        this.MarkPropertyDirty(8);
        return __r;
    }
    void SetSelectedItem(const FEUIModelContainer &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(8);
        this.m_SelectedItem = __Value;
        return;
    }
    const TArray<TEUIModelRef<FVM_CommonItemBar>> GetItemBarItems() const property
    {
        const TArray<TEUIModelRef<FVM_CommonItemBar>> __r;
        this.TrackPropertyRead(9);
        return __r;
    }
    TArray<TEUIModelRef<FVM_CommonItemBar>> GetModify_ItemBarItems() property
    {
        TArray<TEUIModelRef<FVM_CommonItemBar>> __r;
        this.MarkPropertyDirty(9);
        return __r;
    }
    void SetItemBarItems(const TArray<TEUIModelRef<FVM_CommonItemBar>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(9);
        this.m_ItemBarItems = __Value;
        return;
    }
    TEUIModelRef<FVM_CommonDropdown> GetFilterLeft() const property
    {
        this.TrackPropertyRead(10);
        return this.m_FilterLeft;
    }
    void SetFilterLeft(const TEUIModelRef<FVM_CommonDropdown> &inout __Value) property
    {
        TEUIModelRef<FVM_CommonDropdown> local_2;
        local_2 = this.m_FilterLeft;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(10);
        this.m_FilterLeft = __Value;
        return;
    }
    TEUIModelRef<FVM_CommonDropdown> GetFilterRight() const property
    {
        this.TrackPropertyRead(11);
        return this.m_FilterRight;
    }
    void SetFilterRight(const TEUIModelRef<FVM_CommonDropdown> &inout __Value) property
    {
        TEUIModelRef<FVM_CommonDropdown> local_2;
        local_2 = this.m_FilterRight;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(11);
        this.m_FilterRight = __Value;
        return;
    }
    TEUIModelRef<FVM_InventoryQuickSlots> GetInventoryQuickSlots() const property
    {
        this.TrackPropertyRead(12);
        return this.m_InventoryQuickSlots;
    }
    void SetInventoryQuickSlots(const TEUIModelRef<FVM_InventoryQuickSlots> &inout __Value) property
    {
        TEUIModelRef<FVM_InventoryQuickSlots> local_2;
        local_2 = this.m_InventoryQuickSlots;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(12);
        this.m_InventoryQuickSlots = __Value;
        return;
    }
    int GetRootCategoryIndex() const property
    {
        this.TrackPropertyRead(13);
        return this.m_RootCategoryIndex;
    }
    void SetRootCategoryIndex(const int __Value) property
    {
        if (this.m_RootCategoryIndex == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(13);
        this.m_RootCategoryIndex = __Value;
        return;
    }
    int GetCurrentCategoryIndex() const property
    {
        this.TrackPropertyRead(14);
        return this.m_CurrentCategoryIndex;
    }
    void SetCurrentCategoryIndex(const int __Value) property
    {
        if (this.m_CurrentCategoryIndex == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(14);
        this.m_CurrentCategoryIndex = __Value;
        return;
    }
    int GetSelectedItemIndex() const property
    {
        this.TrackPropertyRead(15);
        return this.m_SelectedItemIndex;
    }
    void SetSelectedItemIndex(const int __Value) property
    {
        if (this.m_SelectedItemIndex == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(15);
        this.m_SelectedItemIndex = __Value;
        return;
    }
    UItemFilterBase GetApplyingFilter() const property
    {
        this.TrackPropertyRead(16);
        return this.m_ApplyingFilter;
    }
    void SetApplyingFilter(const UItemFilterBase __Value) property
    {
        if (this.m_ApplyingFilter == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(16);
        return;
    }
    UItemSorterBase GetSelectedSorter() const property
    {
        this.TrackPropertyRead(17);
        return this.m_SelectedSorter;
    }
    void SetSelectedSorter(const UItemSorterBase __Value) property
    {
        if (this.m_SelectedSorter == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(17);
        return;
    }
    UItemSorterBase GetApplyingSorter() const property
    {
        this.TrackPropertyRead(18);
        return this.m_ApplyingSorter;
    }
    void SetApplyingSorter(const UItemSorterBase __Value) property
    {
        if (this.m_ApplyingSorter == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(18);
        return;
    }
    TEUIModelRef<FMS_PlayerInventory> GetPlayerInventory() const property
    {
        this.TrackPropertyRead(19);
        return this.m_PlayerInventory;
    }
    void SetPlayerInventory(const TEUIModelRef<FMS_PlayerInventory> &inout __Value) property
    {
        TEUIModelRef<FMS_PlayerInventory> local_2;
        local_2 = this.m_PlayerInventory;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(19);
        this.m_PlayerInventory = __Value;
        return;
    }
    TEUIModelRef<FMS_CommonHoverManager> GetCommonHoverManager() const property
    {
        this.TrackPropertyRead(20);
        return this.m_CommonHoverManager;
    }
    void SetCommonHoverManager(const TEUIModelRef<FMS_CommonHoverManager> &inout __Value) property
    {
        TEUIModelRef<FMS_CommonHoverManager> local_2;
        local_2 = this.m_CommonHoverManager;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(20);
        this.m_CommonHoverManager = __Value;
        return;
    }
    int64 GetCurrentCategoryLastSortTimestamp() const property
    {
        this.TrackPropertyRead(21);
        return this.m_CurrentCategoryLastSortTimestamp;
    }
    void SetCurrentCategoryLastSortTimestamp(const int64 __Value) property
    {
        if (this.m_CurrentCategoryLastSortTimestamp == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(21);
        this.m_CurrentCategoryLastSortTimestamp = __Value;
        return;
    }
    bool GetbIsInventoryQuickSlotUnlocked() const property
    {
        this.TrackPropertyRead(22);
        return this.m_bIsInventoryQuickSlotUnlocked;
    }
    void SetbIsInventoryQuickSlotUnlocked(const bool __Value) property
    {
        if (!(this.m_bIsInventoryQuickSlotUnlocked) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(22);
        this.m_bIsInventoryQuickSlotUnlocked = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_InventoryMainItem
{
    UPROPERTY()
    TEUIModelRef<FVM_InventoryMainItem> Self;

    __GeneratedProperties_FVM_InventoryMainItem()
    {
        return;
    }
}

struct __GeneratedProperties_FVM_InventoryMain
{
    UPROPERTY()
    bool IsInventoryQuickSlotUnlock;
    UPROPERTY()
    bool HasMultipleCategories;
    UPROPERTY()
    int CurrentCategoryItemNum;
    UPROPERTY()
    int CurrentDisplayItemNum;
    UPROPERTY()
    FText CurrentTrunkSlotNumText;
    UPROPERTY()
    bool ShouldShowTrunkSlotNum;
    UPROPERTY()
    bool ShouldShowFilterAndSorter;
    UPROPERTY()
    TArray<FEUIDynamicWidgetData> ItemBarEntryDataList;
    UPROPERTY()
    TEUIModelRef<FVM_InventoryMain> Self;


}

namespace FVM_InventoryMainItem
{
FVM_InventoryMainItem& Create(const UObject ContextObject, const TEUIModelRef<FM_ItemData> &inout Item)
{
    return FVM_InventoryMainItem::CreateByManager(EUIInternal::GetContextManager(ContextObject), Item);
}
FVM_InventoryMainItem CreateByManager(const UEUIManagerSubsystem Manager, const TEUIModelRef<FM_ItemData> &inout Item)
{
    FVM_InventoryMainItem __r;
    TEUIModelRef<FVM_InventoryMainItem> local_6 = TEUIModelRef<FVM_InventoryMainItem>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_InventoryMainItem::ModelId, 0, Item));
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
    local_14.PropertyName = "bIsValid";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bHasItem";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ComposableItem";
    local_14.TypeName = "TEUIModelRef<FVM_ComposableItem>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "TipHoverModels";
    local_14.TypeName = "FEUIModelContainer";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "PinnedTipRequestVersion";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_InventoryMainItem>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_InventoryMainItem;
    FEUIModelMsgHandleDefine local_26;
    local_26.FunctionName = "__OnInventoryChanged";
    local_26.MessageTypeName = "Msg_PlayerInventoryChanged";
    local_26.SourcePropertyModelRefs = FBitSet64(0);
    Result.MessageHandleFunctions.Add(local_26);
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_InventoryMainItem;
}
void __OnInventoryChanged(FVM_InventoryMainItem &inout Model, const FMsg_PlayerInventoryChanged &inout Message)
{
    Model.OnInventoryChanged(Message);
    return;
}
bool __UIGetter_bIsValid(const FVM_InventoryMainItem &inout Model)
{
    return Model.GetbIsValid();
}
bool __UIGetter_bHasItem(const FVM_InventoryMainItem &inout Model)
{
    return Model.GetbHasItem();
}
TEUIModelRef<FVM_ComposableItem> __UIGetter_ComposableItem(const FVM_InventoryMainItem &inout Model)
{
    return Model.GetComposableItem();
}
FEUIModelContainer __UIGetter_TipHoverModels(const FVM_InventoryMainItem &inout Model)
{
    return Model.GetTipHoverModels();
}
int __UIGetter_PinnedTipRequestVersion(const FVM_InventoryMainItem &inout Model)
{
    return Model.GetPinnedTipRequestVersion();
}
TEUIModelRef<FVM_InventoryMainItem> __UIGetter_Self(const FVM_InventoryMainItem &inout Model)
{
    return TEUIModelRef<FVM_InventoryMainItem>(Model);
}
int __IndexOf_Item()
{
    return 0;
}
int __IndexOf_bIsValid()
{
    return 1;
}
int __IndexOf_bHasItem()
{
    return 2;
}
int __IndexOf_bPendingPinnedTipSelectionSync()
{
    return 3;
}
int __IndexOf_ComposableItem()
{
    return 4;
}
int __IndexOf_TipHandle()
{
    return 5;
}
int __IndexOf_TipHoverModels()
{
    return 6;
}
int __IndexOf_PinnedTipRequestVersion()
{
    return 7;
}
int __IndexOf_PinnedTipHoverHandle()
{
    return 8;
}
int __IndexOf_SharedHoverAnchor()
{
    return 9;
}
int __IndexOf_SharedHoverLayout()
{
    return 10;
}
int __IndexOf_BoundCommonItemClickModel()
{
    return 11;
}
}
namespace __GeneratedProperties_FVM_InventoryMainItem
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
namespace FVM_InventoryMain
{
FVM_InventoryMain& Create(const UObject ContextObject)
{
    return FVM_InventoryMain::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_InventoryMain CreateByManager(const UEUIManagerSubsystem Manager)
{
    FVM_InventoryMain __r;
    TEUIModelRef<FVM_InventoryMain> local_6 = TEUIModelRef<FVM_InventoryMain>(EUIInternal::MakeModelWithManager(Manager, FVM_InventoryMain::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasBeginDestroy(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "RootCategories";
    local_14.TypeName = "TArray<TEUIModelRef<FVM_InventoryMainRootCategory>>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "RedDots";
    local_14.TypeName = "TArray<TEUIModelRef<FVM_RedDot>>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "RootCategoryListItems";
    local_14.TypeName = "TArray<FEUIModelContainer>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "SelectedRootCategoryItem";
    local_14.TypeName = "FEUIModelContainer";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Categories";
    local_14.TypeName = "TArray<TEUIModelRef<FVM_InventoryMainCategory>>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CurrentDisplayItems";
    local_14.TypeName = "TArray<TEUIModelRef<FVM_InventoryMainItem>>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "SelectedItem";
    local_14.TypeName = "FEUIModelContainer";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "FilterLeft";
    local_14.TypeName = "TEUIModelRef<FVM_CommonDropdown>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "FilterRight";
    local_14.TypeName = "TEUIModelRef<FVM_CommonDropdown>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "InventoryQuickSlots";
    local_14.TypeName = "TEUIModelRef<FVM_InventoryQuickSlots>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IsInventoryQuickSlotUnlock";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "HasMultipleCategories";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CurrentCategoryItemNum";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CurrentDisplayItemNum";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CurrentTrunkSlotNumText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ShouldShowTrunkSlotNum";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ShouldShowFilterAndSorter";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ItemBarEntryDataList";
    local_14.TypeName = "TArray<FEUIDynamicWidgetData>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_InventoryMain>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_InventoryMain;
    FEUIModelMsgHandleDefine local_26;
    local_26.FunctionName = "__OnPlayerInventoryChanged";
    local_26.MessageTypeName = "Msg_PlayerInventoryChanged";
    local_26.SourcePropertyModelRefs = FBitSet64(0);
    Result.MessageHandleFunctions.Add(local_26);
    local_26.FunctionName = "__OnAvatarEquipmentChanged";
    local_26.MessageTypeName = "Msg_AvatarEquipmentChanged";
    local_26.SourcePropertyModelRefs = FBitSet64(0);
    Result.MessageHandleFunctions.Add(local_26);
    local_26.FunctionName = "__OnSystemUnlockFromGS";
    local_26.MessageTypeName = "Msg_SystemUnlockFromGS";
    local_26.SourcePropertyModelRefs = FBitSet64(0);
    Result.MessageHandleFunctions.Add(local_26);
    FEUIModelEffectDefine local_34;
    local_34.FunctionName = "SyncSelectionFromPinnedTipRequest";
    Result.EffectFunctions.Add(local_34);
    local_34.FunctionName = "SyncSelectedItemFromSelection";
    Result.EffectFunctions.Add(local_34);
    local_34.FunctionName = "SyncSelectedItemTipHoverHandleFromSelectedItem";
    Result.EffectFunctions.Add(local_34);
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_InventoryMain;
}
void __OnPlayerInventoryChanged(FVM_InventoryMain &inout Model, const FMsg_PlayerInventoryChanged &inout Message)
{
    Model.OnPlayerInventoryChanged(Message);
    return;
}
void __OnAvatarEquipmentChanged(FVM_InventoryMain &inout Model, const FMsg_AvatarEquipmentChanged &inout Message)
{
    Model.OnAvatarEquipmentChanged(Message);
    return;
}
void __OnSystemUnlockFromGS(FVM_InventoryMain &inout Model, const FMsg_SystemUnlockFromGS &inout Message)
{
    Model.OnSystemUnlockFromGS(Message);
    return;
}
TArray<TEUIModelRef<FVM_InventoryMainRootCategory>> __UIGetter_RootCategories(const FVM_InventoryMain &inout Model)
{
    return Model.GetRootCategories();
}
TArray<TEUIModelRef<FVM_RedDot>> __UIGetter_RedDots(const FVM_InventoryMain &inout Model)
{
    return Model.GetRedDots();
}
TArray<FEUIModelContainer> __UIGetter_RootCategoryListItems(const FVM_InventoryMain &inout Model)
{
    return Model.GetRootCategoryListItems();
}
FEUIModelContainer __UIGetter_SelectedRootCategoryItem(const FVM_InventoryMain &inout Model)
{
    return Model.GetSelectedRootCategoryItem();
}
TArray<TEUIModelRef<FVM_InventoryMainCategory>> __UIGetter_Categories(const FVM_InventoryMain &inout Model)
{
    return Model.GetCategories();
}
TArray<TEUIModelRef<FVM_InventoryMainItem>> __UIGetter_CurrentDisplayItems(const FVM_InventoryMain &inout Model)
{
    return Model.GetCurrentDisplayItems();
}
FEUIModelContainer __UIGetter_SelectedItem(const FVM_InventoryMain &inout Model)
{
    return Model.GetSelectedItem();
}
TEUIModelRef<FVM_CommonDropdown> __UIGetter_FilterLeft(const FVM_InventoryMain &inout Model)
{
    return Model.GetFilterLeft();
}
TEUIModelRef<FVM_CommonDropdown> __UIGetter_FilterRight(const FVM_InventoryMain &inout Model)
{
    return Model.GetFilterRight();
}
TEUIModelRef<FVM_InventoryQuickSlots> __UIGetter_InventoryQuickSlots(const FVM_InventoryMain &inout Model)
{
    return Model.GetInventoryQuickSlots();
}
bool __UIGetter_IsInventoryQuickSlotUnlock(const FVM_InventoryMain &inout Model)
{
    return Model.GetIsInventoryQuickSlotUnlock();
}
bool __UIGetter_HasMultipleCategories(const FVM_InventoryMain &inout Model)
{
    return Model.GetHasMultipleCategories();
}
int __UIGetter_CurrentCategoryItemNum(const FVM_InventoryMain &inout Model)
{
    return Model.GetCurrentCategoryItemNum();
}
int __UIGetter_CurrentDisplayItemNum(const FVM_InventoryMain &inout Model)
{
    return Model.GetCurrentDisplayItemNum();
}
FText __UIGetter_CurrentTrunkSlotNumText(const FVM_InventoryMain &inout Model)
{
    return Model.GetCurrentTrunkSlotNumText();
}
bool __UIGetter_ShouldShowTrunkSlotNum(const FVM_InventoryMain &inout Model)
{
    return Model.ShouldShowTrunkSlotNum();
}
bool __UIGetter_ShouldShowFilterAndSorter(const FVM_InventoryMain &inout Model)
{
    return Model.ShouldShowFilterAndSorter();
}
TArray<FEUIDynamicWidgetData> __UIGetter_ItemBarEntryDataList(const FVM_InventoryMain &inout Model)
{
    return Model.GetItemBarEntryDataList();
}
TEUIModelRef<FVM_InventoryMain> __UIGetter_Self(const FVM_InventoryMain &inout Model)
{
    return TEUIModelRef<FVM_InventoryMain>(Model);
}
int __IndexOf_RootCategories()
{
    return 0;
}
int __IndexOf_RedDots()
{
    return 1;
}
int __IndexOf_RootCategoryListItems()
{
    return 2;
}
int __IndexOf_SelectedRootCategoryItem()
{
    return 3;
}
int __IndexOf_RootCategorySelectableItems()
{
    return 4;
}
int __IndexOf_Categories()
{
    return 5;
}
int __IndexOf_CurrentCategoryItems()
{
    return 6;
}
int __IndexOf_CurrentDisplayItems()
{
    return 7;
}
int __IndexOf_SelectedItem()
{
    return 8;
}
int __IndexOf_ItemBarItems()
{
    return 9;
}
int __IndexOf_FilterLeft()
{
    return 10;
}
int __IndexOf_FilterRight()
{
    return 11;
}
int __IndexOf_InventoryQuickSlots()
{
    return 12;
}
int __IndexOf_RootCategoryIndex()
{
    return 13;
}
int __IndexOf_CurrentCategoryIndex()
{
    return 14;
}
int __IndexOf_SelectedItemIndex()
{
    return 15;
}
int __IndexOf_ApplyingFilter()
{
    return 16;
}
int __IndexOf_SelectedSorter()
{
    return 17;
}
int __IndexOf_ApplyingSorter()
{
    return 18;
}
int __IndexOf_PlayerInventory()
{
    return 19;
}
int __IndexOf_CommonHoverManager()
{
    return 20;
}
int __IndexOf_CurrentCategoryLastSortTimestamp()
{
    return 21;
}
int __IndexOf_bIsInventoryQuickSlotUnlocked()
{
    return 22;
}
}
namespace __GeneratedProperties_FVM_InventoryMain
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
