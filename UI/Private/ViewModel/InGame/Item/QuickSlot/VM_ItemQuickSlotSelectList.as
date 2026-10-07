
namespace FVM_ItemQuickSlotSelectListEntry
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature OnClick = FEUIModelCallbackSignature();
}
namespace FVM_ItemQuickSlotSelectList
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature CloseSelectList = FEUIModelCallbackSignature();

}
struct FVM_ItemQuickSlotSelectListEntry : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    FEUIModelRef m_List;
    UPROPERTY()
    TDataObjectPtr<FItemConfig> m_ItemConfig;
    UPROPERTY()
    TDataObjectPtr<FMountFashionConfig> m_MountFashionConfig;
    UPROPERTY()
    FEUIModelRef m_Item;
    UPROPERTY()
    TEUIModelRef<FVM_DisplayItem> m_DisplayItem;
    UPROPERTY()
    TEUIModelRef<FVM_CommonItem> m_CommonItem;
    UPROPERTY()
    FEUIModelContainer m_TipHoverModels;

    FVM_ItemQuickSlotSelectListEntry()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_ItemQuickSlotSelectListEntry' by default constructor.");
        return;
    }
    FVM_ItemQuickSlotSelectListEntry(const FVM_ItemQuickSlotSelectListEntry &inout Other)
    {
        this.m_List = Other.m_List;
        this.m_ItemConfig = Other.m_ItemConfig;
        this.m_MountFashionConfig = Other.m_MountFashionConfig;
        this.m_Item = Other.m_Item;
        this.m_DisplayItem = Other.m_DisplayItem;
        this.m_CommonItem = Other.m_CommonItem;
        this.m_TipHoverModels = Other.m_TipHoverModels;
        return;
    }
    FVM_ItemQuickSlotSelectListEntry(const FEUIModelRef &inout InList, const TDataObjectPtr<FItemConfig> &inout InItemConfig, const TDataObjectPtr<FMountFashionConfig> &inout InMountFashionConfig)
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetList(InList);
        this.SetItemConfig(InItemConfig);
        this.SetMountFashionConfig(InMountFashionConfig);
        return;
    }
    FVM_ItemQuickSlotSelectListEntry& opAssign(const FVM_ItemQuickSlotSelectListEntry &inout Other)
    {
        this.m_List = Other.m_List;
        this.m_ItemConfig = Other.m_ItemConfig;
        this.m_MountFashionConfig = Other.m_MountFashionConfig;
        this.m_Item = Other.m_Item;
        this.m_DisplayItem = Other.m_DisplayItem;
        this.m_CommonItem = Other.m_CommonItem;
        return Other.m_TipHoverModels;
    }
    void PostConstruct()
    {
        if (this.GetMountFashionConfig())
        {
            this.BuildMountEntry();
            return;
        }
        TEUIModelRef<FM_ItemData> local_6 = ::FMS_PlayerInventory::Get(this.GetContext().Manager).GetSumItem(this.GetItemConfig());
        this.SetItem(FItemModelFactory(local_6).Product_FVM_Item(this.GetContext().Manager).opImplConv());
        if (!(this.GetItemConfig()))
        {
            return;
        }
        this.RebuildTipHoverModels(local_6);
        return;
    }
    void BuildMountEntry()
    {
        FDisplayItemFashionRuntimeState local_6;
        local_6.bUnlocked = true;
        local_6.bEquippedOnCurrentTarget = (::FMS_FashionModel::Get(this.GetContext().Manager).GetMountID() == 0);
        CastTo local_14;
        this.SetDisplayItem(::DisplayItemAdapter_Fashion::CreateDisplayItem(this.GetContext().Manager, local_14.opCall(), local_6, EItemDisplayScenario(0), EBodyType(0)));
        if (this.GetDisplayItem().IsValid())
        {
            TEUIModelRef<FM_DisplayItemData> local_46;
            TEUIModelRef<FVM_CommonItem> local_44;
            TEUIModelRef<FVM_DisplayItem> local_42 = this.GetDisplayItem();
            local_44.GetCommonItemVM();
            this.SetCommonItem(local_44);
            TEUIModelRef<FVM_DisplayItem> local_42_2 = this.GetDisplayItem();
            local_46.GetDisplayData();
            this.RebuildMountTipHoverModels(local_46);
        }
        return;
    }
    void RebuildTipHoverModels(const TEUIModelRef<FM_ItemData> &inout ItemDataModel)
    {
        FItemTipData local_68 = ::CommonItemTip::MakeSimpleFromItemData(ItemDataModel);
        FSimpleModelEvent local_90;
        local_90.Add(this, FVM_ItemQuickSlotSelectListEntry::OnClick);
        this.SetTipHoverModels(::CommonItemTip::MakeModels(this.GetContext().Manager, local_68));
        return;
    }
    void RebuildMountTipHoverModels(const TEUIModelRef<FM_DisplayItemData> &inout DisplayDataModel)
    {
        FItemTipData local_68 = ::CommonItemTip::MakeSimpleFromDisplayData(DisplayDataModel);
        FSimpleModelEvent local_90;
        local_90.Add(this, FVM_ItemQuickSlotSelectListEntry::OnClick);
        this.SetTipHoverModels(::CommonItemTip::MakeModels(this.GetContext().Manager, local_68));
        return;
    }
    void OnClick()
    {
        int local_6 = 0;
        int local_12 = 0;
        if (this.GetMountFashionConfig())
        {
            FMS_FashionModel& local_10 = ::FMS_FashionModel::Get(this.GetContext().Manager);
            local_10.RequestChangeMount(local_12, local_10.GetMountDecoID());
            local_6.CloseSelectList();
            return;
        }
        ::InventoryUtils::SetQuickSlotItem(this.GetContext().GetLocalPlayer(), local_6.GetCurrentQuickSlot(), this.GetItemConfig());
        local_6.CloseSelectList();
        return;
    }
    int GetIconSwitcherIndex() const
    {
        bool local_1;
        if (this.GetItemConfig())
        {
            local_1 = true;
        }
        else
        {
            local_1 = this.GetMountFashionConfig();
        }
        return local_1 ? 0 : 1;
    }
    const FEUIModelRef GetList() const property
    {
        const FEUIModelRef __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    FEUIModelRef GetModify_List() property
    {
        FEUIModelRef __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetList(const FEUIModelRef &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_List = __Value;
        return;
    }
    TDataObjectPtr<FItemConfig> GetItemConfig() const property
    {
        TDataObjectPtr<FItemConfig> __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    TDataObjectPtr<FItemConfig> GetModify_ItemConfig() property
    {
        TDataObjectPtr<FItemConfig> __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetItemConfig(const TDataObjectPtr<FItemConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_ItemConfig = __Value;
        return;
    }
    const TDataObjectPtr<FMountFashionConfig> GetMountFashionConfig() const property
    {
        const TDataObjectPtr<FMountFashionConfig> __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    TDataObjectPtr<FMountFashionConfig> GetModify_MountFashionConfig() property
    {
        TDataObjectPtr<FMountFashionConfig> __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetMountFashionConfig(const TDataObjectPtr<FMountFashionConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_MountFashionConfig = __Value;
        return;
    }
    FEUIModelRef GetItem() const property
    {
        FEUIModelRef __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    FEUIModelRef GetModify_Item() property
    {
        FEUIModelRef __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetItem(const FEUIModelRef &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_Item = __Value;
        return;
    }
    TEUIModelRef<FVM_DisplayItem> GetDisplayItem() const property
    {
        this.TrackPropertyRead(4);
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
        this.MarkPropertyDirty(4);
        this.m_DisplayItem = __Value;
        return;
    }
    TEUIModelRef<FVM_CommonItem> GetCommonItem() const property
    {
        this.TrackPropertyRead(5);
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
        this.MarkPropertyDirty(5);
        this.m_CommonItem = __Value;
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
}

struct FVM_ItemQuickSlotSelectList : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TDataObjectPtr<FItemQuickSlotConfig> m_CurrentQuickSlot;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_ItemQuickSlotSelectListEntry>> m_Entries;

    FVM_ItemQuickSlotSelectList()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_ItemQuickSlotSelectList' by default constructor.");
        return;
    }
    FVM_ItemQuickSlotSelectList(const FVM_ItemQuickSlotSelectList &inout Other)
    {
        this.m_CurrentQuickSlot = Other.m_CurrentQuickSlot;
        this.m_Entries = Other.m_Entries;
        return;
    }
    FVM_ItemQuickSlotSelectList(const TDataObjectPtr<FItemQuickSlotConfig> &inout InCurrentQuickSlot)
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetCurrentQuickSlot(InCurrentQuickSlot);
        return;
    }
    FVM_ItemQuickSlotSelectList& opAssign(const FVM_ItemQuickSlotSelectList &inout Other)
    {
        this.m_CurrentQuickSlot = Other.m_CurrentQuickSlot;
        return Other.m_Entries;
    }
    FText GetTitleText() const
    {
        return this.GetCurrentQuickSlot().opArrow().DisplayName;
    }
    bool HasEntries() const
    {
        return (this.GetEntries().Num() > 0);
    }
    void PostConstruct()
    {
        this.GetModify_Entries().Empty(0);
        if (this.IsMountQuickSlot())
        {
            TArray<TDataObjectPtr<FMountFashionConfig>> local_6;
            ::FMS_FashionModel::Get(this.GetContext().Manager).CollectUnlockedMountFashionConfigsForQuickSlot(local_6);
            for (auto& local_20 : local_6)
            {
                TEUIModelRef<FVM_ItemQuickSlotSelectListEntry> local_48 = TEUIModelRef<FVM_ItemQuickSlotSelectListEntry>(::FVM_ItemQuickSlotSelectListEntry::Create(this.GetContext().Manager, FEUIModelRef(this), (TDataObjectPtr<FItemConfig>()), local_20));
                this.GetModify_Entries().Add(local_48);
            }
            return;
        }
        if (this.GetCurrentQuickSlot().opArrow().bAllowEmpty)
        {
            TDataObjectPtr<FMountFashionConfig> local_72;
            TEUIModelRef<FVM_ItemQuickSlotSelectListEntry> local_48_2 = TEUIModelRef<FVM_ItemQuickSlotSelectListEntry>(::FVM_ItemQuickSlotSelectListEntry::Create(this.GetContext().Manager, FEUIModelRef(this), (TDataObjectPtr<FItemConfig>()), local_72));
            this.GetModify_Entries().Add(local_48_2);
        }
        for (auto& local_94 : ::InventoryUtils::GetAllValidItemsForQuickSlot(this.GetContext().GetLocalPlayer(), this.GetCurrentQuickSlot()))
        {
            TDataObjectPtr<FMountFashionConfig> local_72;
            TEUIModelRef<FVM_ItemQuickSlotSelectListEntry> local_48_3 = TEUIModelRef<FVM_ItemQuickSlotSelectListEntry>(::FVM_ItemQuickSlotSelectListEntry::Create(this.GetContext().Manager, FEUIModelRef(this), local_94, local_72));
            this.GetModify_Entries().Add(local_48_3);
        }
        return;
    }
    bool IsMountQuickSlot() const
    {
        return this.GetCurrentQuickSlot() && (this.GetCurrentQuickSlot().GetDataName() == n"Mount");
    }
    void CloseSelectList()
    {
        ::CommonPopup::CloseAllHover();
        return;
    }
    const TDataObjectPtr<FItemQuickSlotConfig> GetCurrentQuickSlot() const property
    {
        const TDataObjectPtr<FItemQuickSlotConfig> __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    TDataObjectPtr<FItemQuickSlotConfig> GetModify_CurrentQuickSlot() property
    {
        TDataObjectPtr<FItemQuickSlotConfig> __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetCurrentQuickSlot(const TDataObjectPtr<FItemQuickSlotConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_CurrentQuickSlot = __Value;
        return;
    }
    const TArray<TEUIModelRef<FVM_ItemQuickSlotSelectListEntry>> GetEntries() const property
    {
        const TArray<TEUIModelRef<FVM_ItemQuickSlotSelectListEntry>> __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    TArray<TEUIModelRef<FVM_ItemQuickSlotSelectListEntry>> GetModify_Entries() property
    {
        TArray<TEUIModelRef<FVM_ItemQuickSlotSelectListEntry>> __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetEntries(const TArray<TEUIModelRef<FVM_ItemQuickSlotSelectListEntry>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_Entries = __Value;
        return;
    }
}

namespace FVM_ItemQuickSlotSelectList
{
struct FOpenSelectListParam
{
    UPROPERTY()
    TDataObjectPtr<FItemQuickSlotConfig> CurrentQuickSlot;

    FOpenSelectListParam()
    {
        return;
    }
}

}
struct __GeneratedProperties_FVM_ItemQuickSlotSelectListEntry
{
    UPROPERTY()
    int IconSwitcherIndex;
    UPROPERTY()
    TEUIModelRef<FVM_ItemQuickSlotSelectListEntry> Self;


}

struct __GeneratedProperties_FVM_ItemQuickSlotSelectList
{
    UPROPERTY()
    FText TitleText;
    UPROPERTY()
    bool HasEntries;
    UPROPERTY()
    TEUIModelRef<FVM_ItemQuickSlotSelectList> Self;


}

namespace FVM_ItemQuickSlotSelectList
{
FCommonHoverHandle OpenSelectList(const UWidget HoverForWidget, const UWidget HoverLimitationWidget, const TDataObjectPtr<FItemQuickSlotConfig> &inout QuickSlot)
{
    FCommonHoverHandle __r;
    if (!(QuickSlot))
    {
    }
    else
    {
        FCommonHoverInfo local_132;
        FVM_ItemQuickSlotSelectList::FOpenSelectListParam local_26;
        local_26.CurrentQuickSlot = QuickSlot;
        Make local_64;
        local_64;
        InventoryUtils::GetGlobalItemSettings();
        local_132.SetHoverLimitationByWidget(HoverLimitationWidget);
        local_132.SetClickClose(true);
        local_132.SetTargetLayer(FEUIWidget::GetWidgetLayoutLayer(HoverForWidget));
        CommonPopup::HoverWithCustomHoverInfo(HoverForWidget, local_132);
    }
    return __r;
}
}
namespace FVM_ItemQuickSlotSelectListEntry
{
FVM_ItemQuickSlotSelectListEntry& Create(const UObject ContextObject, const FEUIModelRef &inout List, const TDataObjectPtr<FItemConfig> &inout ItemConfig, const TDataObjectPtr<FMountFashionConfig> &inout MountFashionConfig)
{
    return FVM_ItemQuickSlotSelectListEntry::CreateByManager(EUIInternal::GetContextManager(ContextObject), List, ItemConfig, MountFashionConfig);
}
FVM_ItemQuickSlotSelectListEntry CreateByManager(const UEUIManagerSubsystem Manager, const FEUIModelRef &inout List, const TDataObjectPtr<FItemConfig> &inout ItemConfig, const TDataObjectPtr<FMountFashionConfig> &inout MountFashionConfig)
{
    FVM_ItemQuickSlotSelectListEntry __r;
    TEUIModelRef<FVM_ItemQuickSlotSelectListEntry> local_6 = TEUIModelRef<FVM_ItemQuickSlotSelectListEntry>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_ItemQuickSlotSelectListEntry::ModelId, 0, List, ItemConfig, MountFashionConfig));
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
    local_14.TypeName = "FEUIModelRef";
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
    local_14.PropertyName = "IconSwitcherIndex";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_ItemQuickSlotSelectListEntry>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_ItemQuickSlotSelectListEntry;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_ItemQuickSlotSelectListEntry;
}
FEUIModelRef __UIGetter_Item(const FVM_ItemQuickSlotSelectListEntry &inout Model)
{
    return Model.GetItem();
}
TEUIModelRef<FVM_DisplayItem> __UIGetter_DisplayItem(const FVM_ItemQuickSlotSelectListEntry &inout Model)
{
    return Model.GetDisplayItem();
}
TEUIModelRef<FVM_CommonItem> __UIGetter_CommonItem(const FVM_ItemQuickSlotSelectListEntry &inout Model)
{
    return Model.GetCommonItem();
}
FEUIModelContainer __UIGetter_TipHoverModels(const FVM_ItemQuickSlotSelectListEntry &inout Model)
{
    return Model.GetTipHoverModels();
}
int __UIGetter_IconSwitcherIndex(const FVM_ItemQuickSlotSelectListEntry &inout Model)
{
    return Model.GetIconSwitcherIndex();
}
TEUIModelRef<FVM_ItemQuickSlotSelectListEntry> __UIGetter_Self(const FVM_ItemQuickSlotSelectListEntry &inout Model)
{
    return TEUIModelRef<FVM_ItemQuickSlotSelectListEntry>(Model);
}
int __IndexOf_List()
{
    return 0;
}
int __IndexOf_ItemConfig()
{
    return 1;
}
int __IndexOf_MountFashionConfig()
{
    return 2;
}
int __IndexOf_Item()
{
    return 3;
}
int __IndexOf_DisplayItem()
{
    return 4;
}
int __IndexOf_CommonItem()
{
    return 5;
}
int __IndexOf_TipHoverModels()
{
    return 6;
}
}
namespace __GeneratedProperties_FVM_ItemQuickSlotSelectListEntry
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
namespace FVM_ItemQuickSlotSelectList
{
FVM_ItemQuickSlotSelectList& Create(const UObject ContextObject, const TDataObjectPtr<FItemQuickSlotConfig> &inout CurrentQuickSlot)
{
    return FVM_ItemQuickSlotSelectList::CreateByManager(EUIInternal::GetContextManager(ContextObject), CurrentQuickSlot);
}
FVM_ItemQuickSlotSelectList CreateByManager(const UEUIManagerSubsystem Manager, const TDataObjectPtr<FItemQuickSlotConfig> &inout CurrentQuickSlot)
{
    FVM_ItemQuickSlotSelectList __r;
    TEUIModelRef<FVM_ItemQuickSlotSelectList> local_6 = TEUIModelRef<FVM_ItemQuickSlotSelectList>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_ItemQuickSlotSelectList::ModelId, 0, CurrentQuickSlot));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "Entries";
    local_14.TypeName = "TArray<TEUIModelRef<FVM_ItemQuickSlotSelectListEntry>>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "TitleText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "HasEntries";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_ItemQuickSlotSelectList>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_ItemQuickSlotSelectList;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_ItemQuickSlotSelectList;
}
TArray<TEUIModelRef<FVM_ItemQuickSlotSelectListEntry>> __UIGetter_Entries(const FVM_ItemQuickSlotSelectList &inout Model)
{
    return Model.GetEntries();
}
FText __UIGetter_TitleText(const FVM_ItemQuickSlotSelectList &inout Model)
{
    return Model.GetTitleText();
}
bool __UIGetter_HasEntries(const FVM_ItemQuickSlotSelectList &inout Model)
{
    return Model.HasEntries();
}
TEUIModelRef<FVM_ItemQuickSlotSelectList> __UIGetter_Self(const FVM_ItemQuickSlotSelectList &inout Model)
{
    return TEUIModelRef<FVM_ItemQuickSlotSelectList>(Model);
}
int __IndexOf_CurrentQuickSlot()
{
    return 0;
}
int __IndexOf_Entries()
{
    return 1;
}
}
namespace __GeneratedProperties_FVM_ItemQuickSlotSelectList
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
