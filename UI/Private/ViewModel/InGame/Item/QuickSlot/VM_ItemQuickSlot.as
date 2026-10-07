
namespace FMS_ItemQuickSlotHoverCache
{
    const int ModelId = 0;
}
namespace FVM_ItemQuickSlot
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature OpenSelectList = FEUIModelCallbackSignature();

}
struct FMS_ItemQuickSlotHoverCache : FEUIModelSingleton
{
    FEUIModelSingleton _base_FEUIModelSingleton;
    UPROPERTY()
    FCommonHoverHandle m_OpenningHoverHandle;

    FMS_ItemQuickSlotHoverCache()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FMS_ItemQuickSlotHoverCache(const FMS_ItemQuickSlotHoverCache &inout Other)
    {
        return;
    }
    FMS_ItemQuickSlotHoverCache opAssign(const FMS_ItemQuickSlotHoverCache &inout Other)
    {
        FMS_ItemQuickSlotHoverCache __r;
        return __r;
    }
    const FCommonHoverHandle GetOpenningHoverHandle() const property
    {
        const FCommonHoverHandle __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    FCommonHoverHandle GetModify_OpenningHoverHandle() property
    {
        FCommonHoverHandle __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetOpenningHoverHandle(const FCommonHoverHandle &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        return;
    }
}

struct FVM_ItemQuickSlot : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TDataObjectPtr<FItemQuickSlotConfig> m_QuickSlot;
    UPROPERTY()
    UWidget m_HoverLimitationWidget;
    UPROPERTY()
    TEUIModelRef<FVM_Item> m_Item;
    UPROPERTY()
    TEUIModelRef<FVM_DisplayItem> m_DisplayItem;
    UPROPERTY()
    TEUIModelRef<FVM_CommonItem> m_CommonItem;
    UPROPERTY()
    UWidget m_OwnerUserWidget;
    UPROPERTY()
    EItemViewModelNumStyle m_ItemNumStyle;
    UPROPERTY()
    FEUIModelContainer m_TipHoverModels;

    FVM_ItemQuickSlot()
    {
        this.m_HoverLimitationWidget = nullptr;
        this.m_OwnerUserWidget = nullptr;
        this.m_ItemNumStyle = EItemViewModelNumStyle(0);
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_ItemQuickSlot' by default constructor.");
        return;
    }
    FVM_ItemQuickSlot(const FVM_ItemQuickSlot &inout Other)
    {
        this.m_HoverLimitationWidget = nullptr;
        this.m_OwnerUserWidget = nullptr;
        this.m_ItemNumStyle = EItemViewModelNumStyle(0);
        this.m_QuickSlot = Other.m_QuickSlot;
        this.m_HoverLimitationWidget = Other.m_HoverLimitationWidget;
        this.m_Item = Other.m_Item;
        this.m_DisplayItem = Other.m_DisplayItem;
        this.m_CommonItem = Other.m_CommonItem;
        this.m_OwnerUserWidget = Other.m_OwnerUserWidget;
        this.m_ItemNumStyle = Other.m_ItemNumStyle;
        this.m_TipHoverModels = Other.m_TipHoverModels;
        return;
    }
    FVM_ItemQuickSlot(const TDataObjectPtr<FItemQuickSlotConfig> &inout InQuickSlot, const UWidget InHoverLimitationWidget)
    {
        this.m_HoverLimitationWidget = nullptr;
        this.m_OwnerUserWidget = nullptr;
        this.m_ItemNumStyle = EItemViewModelNumStyle(0);
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetQuickSlot(InQuickSlot);
        this.SetHoverLimitationWidget(InHoverLimitationWidget);
        return;
    }
    FVM_ItemQuickSlot& opAssign(const FVM_ItemQuickSlot &inout Other)
    {
        this.m_QuickSlot = Other.m_QuickSlot;
        this.m_HoverLimitationWidget = Other.m_HoverLimitationWidget;
        this.m_Item = Other.m_Item;
        this.m_DisplayItem = Other.m_DisplayItem;
        this.m_CommonItem = Other.m_CommonItem;
        this.m_OwnerUserWidget = Other.m_OwnerUserWidget;
        this.m_ItemNumStyle = Other.m_ItemNumStyle;
        return Other.m_TipHoverModels;
    }
    FText GetKeyText() const
    {
        const UGameInputAction local_16;
        if (!(this.CanResolveInputAction()))
        {
            return FText();
        }
        EESMTriggerInputSlot local_7 = this.GetQuickSlot().opArrow().InputSlot;
        local_16 = FCharacterInputUtils::GetInputActionByInputSlot(this.GetContext().GetLocalPlayerPawn());
        if ((!((local_16 != nullptr))))
        {
            return FText();
        }
        FKey local_34 = ::UICommonUtil::GetFirstKeyForCurrentInputType(this.GetContext().UELocalPlayer, FEUIInputAction(local_16));
        if ((local_34 == EKeys::Invalid))
        {
            return FText();
        }
        return local_34.GetDisplayName(false);
    }
    TArray<FEUIInputAction> GetInputActions() const
    {
        const UGameInputAction local_16;
        TArray<FEUIInputAction> local_4;
        if (this.CanResolveInputAction())
        {
            EESMTriggerInputSlot local_6;
            local_6 = this.GetQuickSlot().opArrow().InputSlot;
            local_16 = FCharacterInputUtils::GetInputActionByInputSlot(this.GetContext().GetLocalPlayerPawn());
            if (local_16 != nullptr)
            {
                local_4.Add(FEUIInputAction(local_16));
            }
        }
        return local_4;
    }
    bool CanResolveInputAction() const
    {
        ULocalPlayer local_8;
        return this.GetQuickSlot() && this.GetContext().World.IsValid() && this.GetContext().GetLocalPlayerPawn().IsValid() && (local_8 != nullptr);
    }
    void PostConstruct()
    {
        this.RefreshDisplayingItem();
        return;
    }
    void ChangeItemNumStyle(const EItemViewModelNumStyle InStyle)
    {
        FVM_Item& local_4;
        this.SetItemNumStyle(EItemViewModelNumStyle(InStyle));
        TEUIModelRef<FVM_Item> local_2 = this.GetItem();
        if (local_4)
        {
            local_4.SetNumStyle(EItemViewModelNumStyle(InStyle));
        }
        return;
    }
    void OnInventoryChanged(const FMsg_PlayerInventoryChanged &inout Msg)
    {
        this.RefreshDisplayingItem();
        return;
    }
    void OnQuickSlotChanged(const FCE_NotifyQuickSlotItemChanged &inout Event)
    {
        FDataObjectPtr local_72;
        local_72;
        if ((Event.QuickSlot == local_72))
        {
            this.RefreshDisplayingItem();
        }
        return;
    }
    void OnRemnantSlotChanged(const FCE_RemnantSlotChangedEvent &inout Event)
    {
        this.RefreshDisplayingItem();
        return;
    }
    void OnFashionMountChanged(const FMsg_FashionMountChanged &inout Msg)
    {
        if (this.IsMountQuickSlot())
        {
            this.RefreshDisplayingItem();
        }
        return;
    }
    void OpenSelectList()
    {
        FCommonHoverHandle local_2;
        FCommonHoverHandle local_4;
        if (local_2.IsValid())
        {
            ::CommonPopup::CloseHover(local_2, this.GetManager(), true);
        }
        local_4 = ::FVM_ItemQuickSlotSelectList::OpenSelectList(this.GetOwnerUserWidget(), this.GetHoverLimitationWidget(), this.GetQuickSlot());
        ::FMS_ItemQuickSlotHoverCache::Get(this.GetContext().Manager).SetOpenningHoverHandle(local_4);
        return;
    }
    void RefreshDisplayingItem()
    {
        FVM_Item& local_70;
        if (this.IsMountQuickSlot())
        {
            this.RefreshDisplayingMount();
            return;
        }
        this.SetDisplayItem(TEUIModelRef<FVM_DisplayItem>());
        this.SetCommonItem(TEUIModelRef<FVM_CommonItem>());
        TDataObjectPtr<FItemConfig> local_36 = ::InventoryUtils::GetQuickSlotItem(this.GetContext().GetLocalPlayer(), this.GetQuickSlot());
        TEUIModelRef<FVM_Item> local_62;
        if (!(local_36))
        {
            this.SetItem(local_62);
            return;
        }
        TEUIModelRef<FM_ItemData> local_66 = ::FMS_PlayerInventory::Get(this.GetContext().Manager).GetSumItem(local_36);
        this.SetItem(FItemModelFactory(local_66).Product_FVM_Item(this.GetContext().Manager));
        local_62 = this.GetItem();
        if (local_70)
        {
            local_70.SetNumStyle(this.GetItemNumStyle());
        }
        this.RebuildTipHoverModels(local_66);
        return;
    }
    bool IsMountQuickSlot() const
    {
        return this.GetQuickSlot() && (this.GetQuickSlot().GetDataName() == n"Mount");
    }
    void RefreshDisplayingMount()
    {
        this.SetItem(TEUIModelRef<FVM_Item>(FEUIModelRef()));
        TEUIModelRef<FVM_DisplayItem> local_6;
        this.SetDisplayItem(local_6);
        TEUIModelRef<FVM_CommonItem> local_8;
        this.SetCommonItem(local_8);
        if (!(::FMS_FashionModel::Get(this.GetContext().Manager).GetCurrentMountFashionConfig()))
        {
            return;
        }
        FDisplayItemFashionRuntimeState local_64;
        local_64.bUnlocked = true;
        local_64.bEquippedOnCurrentTarget = true;
        CastTo local_68;
        this.SetDisplayItem(::DisplayItemAdapter_Fashion::CreateDisplayItem(this.GetContext().Manager, local_68.opCall(), local_64, EItemDisplayScenario(0), EBodyType(0)));
        if (this.GetDisplayItem().IsValid())
        {
            TEUIModelRef<FM_DisplayItemData> local_96;
            local_6 = this.GetDisplayItem();
            local_8.GetCommonItemVM();
            this.SetCommonItem(local_8);
            local_6 = this.GetDisplayItem();
            local_96.GetDisplayData();
            this.RebuildMountTipHoverModels(local_96);
        }
        return;
    }
    void RebuildTipHoverModels(const TEUIModelRef<FM_ItemData> &inout ItemDataModel)
    {
        FItemTipData local_68 = ::CommonItemTip::MakeSimpleFromItemData(ItemDataModel);
        FSimpleModelEvent local_90;
        local_90.Add(this, FVM_ItemQuickSlot::OpenSelectList);
        this.SetTipHoverModels(::CommonItemTip::MakeModels(this.GetContext().Manager, local_68));
        return;
    }
    void RebuildMountTipHoverModels(const TEUIModelRef<FM_DisplayItemData> &inout DisplayDataModel)
    {
        FItemTipData local_68 = ::CommonItemTip::MakeSimpleFromDisplayData(DisplayDataModel);
        FSimpleModelEvent local_90;
        local_90.Add(this, FVM_ItemQuickSlot::OpenSelectList);
        this.SetTipHoverModels(::CommonItemTip::MakeModels(this.GetContext().Manager, local_68));
        return;
    }
    void BeginDestroy()
    {
        if (this.GetManager() == nullptr)
        {
            return;
        }
        FMS_ItemQuickSlotHoverCache& local_6 = ::FMS_ItemQuickSlotHoverCache::Get(this.GetManager());
        if (local_6)
        {
            ::CommonPopup::CloseHover(local_6.GetOpenningHoverHandle(), this.GetManager(), true);
            local_6.SetOpenningHoverHandle(FCommonHoverHandle::InvalidHandle);
        }
        return;
    }
    const TDataObjectPtr<FItemQuickSlotConfig> GetQuickSlot() const property
    {
        const TDataObjectPtr<FItemQuickSlotConfig> __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    TDataObjectPtr<FItemQuickSlotConfig> GetModify_QuickSlot() property
    {
        TDataObjectPtr<FItemQuickSlotConfig> __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetQuickSlot(const TDataObjectPtr<FItemQuickSlotConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_QuickSlot = __Value;
        return;
    }
    UWidget GetHoverLimitationWidget() const property
    {
        this.TrackPropertyRead(1);
        return this.m_HoverLimitationWidget;
    }
    void SetHoverLimitationWidget(const UWidget __Value) property
    {
        if (this.m_HoverLimitationWidget == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        return;
    }
    TEUIModelRef<FVM_Item> GetItem() const property
    {
        this.TrackPropertyRead(2);
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
        this.MarkPropertyDirty(2);
        this.m_Item = __Value;
        return;
    }
    TEUIModelRef<FVM_DisplayItem> GetDisplayItem() const property
    {
        this.TrackPropertyRead(3);
        return this.m_DisplayItem;
    }
    void SetDisplayItem(const TEUIModelRef<FVM_DisplayItem> &inout __Value) property
    {
        TEUIModelRef<FVM_DisplayItem> local_2;
        local_2 = this.m_DisplayItem;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_DisplayItem = __Value;
        return;
    }
    TEUIModelRef<FVM_CommonItem> GetCommonItem() const property
    {
        this.TrackPropertyRead(4);
        return this.m_CommonItem;
    }
    void SetCommonItem(const TEUIModelRef<FVM_CommonItem> &inout __Value) property
    {
        TEUIModelRef<FVM_CommonItem> local_2;
        local_2 = this.m_CommonItem;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_CommonItem = __Value;
        return;
    }
    UWidget GetOwnerUserWidget() const property
    {
        this.TrackPropertyRead(5);
        return this.m_OwnerUserWidget;
    }
    void SetOwnerUserWidget(const UWidget __Value) property
    {
        if (this.m_OwnerUserWidget == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(5);
        return;
    }
    EItemViewModelNumStyle GetItemNumStyle() const property
    {
        this.TrackPropertyRead(6);
        return this.m_ItemNumStyle;
    }
    void SetItemNumStyle(const EItemViewModelNumStyle __Value) property
    {
        if (int(this.m_ItemNumStyle) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_ItemNumStyle = __Value;
        return;
    }
    const FEUIModelContainer GetTipHoverModels() const property
    {
        const FEUIModelContainer __r;
        this.TrackPropertyRead(7);
        return __r;
    }
    FEUIModelContainer GetModify_TipHoverModels() property
    {
        FEUIModelContainer __r;
        this.MarkPropertyDirty(7);
        return __r;
    }
    void SetTipHoverModels(const FEUIModelContainer &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(7);
        this.m_TipHoverModels = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_ItemQuickSlot
{
    UPROPERTY()
    FText KeyText;
    UPROPERTY()
    TArray<FEUIInputAction> InputActions;
    UPROPERTY()
    TEUIModelRef<FVM_ItemQuickSlot> Self;

    __GeneratedProperties_FVM_ItemQuickSlot()
    {
        return;
    }
}

namespace FMS_ItemQuickSlotHoverCache
{
FMS_ItemQuickSlotHoverCache& Get(const UObject ContextObject)
{
    return FMS_ItemQuickSlotHoverCache::GetByManager(EUIInternal::GetContextManager(ContextObject));
}
FMS_ItemQuickSlotHoverCache GetByManager(const UEUIManagerSubsystem Manager)
{
    FMS_ItemQuickSlotHoverCache __r;
    TEUIModelRef<FMS_ItemQuickSlotHoverCache> local_6 = TEUIModelRef<FMS_ItemQuickSlotHoverCache>(EUIInternal::MakeModelWithManager(Manager, FMS_ItemQuickSlotHoverCache::ModelId));
    return __r;
}
void GetModelInfo(FEUIModelOnlyMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    return;
}
UScriptStruct GetModelStruct()
{
    return FMS_ItemQuickSlotHoverCache;
}
int __IndexOf_OpenningHoverHandle()
{
    return 0;
}
}
namespace FVM_ItemQuickSlot
{
FVM_ItemQuickSlot& Create(const UObject ContextObject, const TDataObjectPtr<FItemQuickSlotConfig> &inout QuickSlot, const UWidget HoverLimitationWidget)
{
    return FVM_ItemQuickSlot::CreateByManager(EUIInternal::GetContextManager(ContextObject), QuickSlot, HoverLimitationWidget);
}
FVM_ItemQuickSlot CreateByManager(const UEUIManagerSubsystem Manager, const TDataObjectPtr<FItemQuickSlotConfig> &inout QuickSlot, const UWidget HoverLimitationWidget)
{
    FVM_ItemQuickSlot __r;
    TEUIModelRef<FVM_ItemQuickSlot> local_6 = TEUIModelRef<FVM_ItemQuickSlot>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_ItemQuickSlot::ModelId, 0, QuickSlot, HoverLimitationWidget));
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
    local_14.PropertyName = "Item";
    local_14.TypeName = "TEUIModelRef<FVM_Item>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "DisplayItem";
    local_14.TypeName = "TEUIModelRef<FVM_DisplayItem>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CommonItem";
    local_14.TypeName = "TEUIModelRef<FVM_CommonItem>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "TipHoverModels";
    local_14.TypeName = "FEUIModelContainer";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "KeyText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "InputActions";
    local_14.TypeName = "TArray<FEUIInputAction>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_ItemQuickSlot>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_ItemQuickSlot;
    FEUIModelMsgHandleDefine local_26;
    local_26.FunctionName = "__OnInventoryChanged";
    local_26.MessageTypeName = "Msg_PlayerInventoryChanged";
    local_26.SourcePropertyModelRefs = FBitSet64(0);
    Result.MessageHandleFunctions.Add(local_26);
    FEUIModelEventDefine local_36;
    local_36.FunctionName = "__OnQuickSlotChanged";
    local_36.EventType = FCE_NotifyQuickSlotItemChanged;
    Result.EventFunctions.Add(local_36);
    local_36.FunctionName = "__OnRemnantSlotChanged";
    local_36.EventType = FCE_RemnantSlotChangedEvent;
    Result.EventFunctions.Add(local_36);
    local_26.FunctionName = "__OnFashionMountChanged";
    local_26.MessageTypeName = "Msg_FashionMountChanged";
    local_26.SourcePropertyModelRefs = FBitSet64(0);
    Result.MessageHandleFunctions.Add(local_26);
    FEUIModelEffectDefine local_40;
    local_40.FunctionName = "RefreshDisplayingItem";
    Result.EffectFunctions.Add(local_40);
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_ItemQuickSlot;
}
void __OnInventoryChanged(FVM_ItemQuickSlot &inout Model, const FMsg_PlayerInventoryChanged &inout Message)
{
    Model.OnInventoryChanged(Message);
    return;
}
void __OnQuickSlotChanged(FVM_ItemQuickSlot &inout Model, const FCE_NotifyQuickSlotItemChanged &inout Event)
{
    Model.OnQuickSlotChanged(Event);
    return;
}
void __OnRemnantSlotChanged(FVM_ItemQuickSlot &inout Model, const FCE_RemnantSlotChangedEvent &inout Event)
{
    Model.OnRemnantSlotChanged(Event);
    return;
}
void __OnFashionMountChanged(FVM_ItemQuickSlot &inout Model, const FMsg_FashionMountChanged &inout Message)
{
    Model.OnFashionMountChanged(Message);
    return;
}
TEUIModelRef<FVM_Item> __UIGetter_Item(const FVM_ItemQuickSlot &inout Model)
{
    return Model.GetItem();
}
TEUIModelRef<FVM_DisplayItem> __UIGetter_DisplayItem(const FVM_ItemQuickSlot &inout Model)
{
    return Model.GetDisplayItem();
}
TEUIModelRef<FVM_CommonItem> __UIGetter_CommonItem(const FVM_ItemQuickSlot &inout Model)
{
    return Model.GetCommonItem();
}
FEUIModelContainer __UIGetter_TipHoverModels(const FVM_ItemQuickSlot &inout Model)
{
    return Model.GetTipHoverModels();
}
FText __UIGetter_KeyText(const FVM_ItemQuickSlot &inout Model)
{
    return Model.GetKeyText();
}
TArray<FEUIInputAction> __UIGetter_InputActions(const FVM_ItemQuickSlot &inout Model)
{
    return Model.GetInputActions();
}
TEUIModelRef<FVM_ItemQuickSlot> __UIGetter_Self(const FVM_ItemQuickSlot &inout Model)
{
    return TEUIModelRef<FVM_ItemQuickSlot>(Model);
}
int __IndexOf_QuickSlot()
{
    return 0;
}
int __IndexOf_HoverLimitationWidget()
{
    return 1;
}
int __IndexOf_Item()
{
    return 2;
}
int __IndexOf_DisplayItem()
{
    return 3;
}
int __IndexOf_CommonItem()
{
    return 4;
}
int __IndexOf_OwnerUserWidget()
{
    return 5;
}
int __IndexOf_ItemNumStyle()
{
    return 6;
}
int __IndexOf_TipHoverModels()
{
    return 7;
}
}
namespace __GeneratedProperties_FVM_ItemQuickSlot
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
