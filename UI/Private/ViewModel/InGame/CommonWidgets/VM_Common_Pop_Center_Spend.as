
namespace FVM_CommonPopCenterSpendItem
{
    const int ModelId = 0;
}
namespace FVM_Common_Pop_Center_Spend
{
    const int ModelId = 0;

}
struct FVM_CommonPopCenterSpendItem : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    FEUIModelContainer m_ItemModels;

    FVM_CommonPopCenterSpendItem()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_CommonPopCenterSpendItem' by default constructor.");
        return;
    }
    FVM_CommonPopCenterSpendItem(const FVM_CommonPopCenterSpendItem &inout Other)
    {
        this.m_ItemModels = Other.m_ItemModels;
        return;
    }
    FVM_CommonPopCenterSpendItem(const FEUIModelContainer &inout InItemModels)
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetItemModels(InItemModels);
        return;
    }
    FVM_CommonPopCenterSpendItem& opAssign(const FVM_CommonPopCenterSpendItem &inout Other)
    {
        return Other.m_ItemModels;
    }
    FSoftBrush GetItemIcon() const
    {
        if (this.GetItem().IsNull())
        {
            return FSoftBrush();
        }
        return this.GetItem().opArrow().GetItemConfig().opArrow().ItemIcon;
    }
    FText GetItemNum() const
    {
        if (this.GetItem().IsNull())
        {
            return FText::FromString("0");
        }
        return FText::FromString(FString::Format("{0}", this.GetItem().opArrow().GetNum()));
    }
    TEUIModelRef<FVM_Item> GetItem() const property
    {
        return TEUIModelRef<FVM_Item>(FEUIModelContainer::RequireModel(this.GetItemModels()).opCall());
    }
    FEUIModelContainer GetItemTooltip() const property
    {
        return this.GetItemModels();
    }
    FLinearColor GetItemImageBGColor() const
    {
        if (!(this.GetItem().IsNull()))
        {
            FLinearColor local_7;
            TEUIModelRef<FVM_Item> local_2 = this.GetItem();
            local_7.GetRarityColor();
            return local_7;
        }
        return FLinearColor::White;
    }
    FEUIModelContainer GetItemModels() const property
    {
        FEUIModelContainer __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    FEUIModelContainer GetModify_ItemModels() property
    {
        FEUIModelContainer __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetItemModels(const FEUIModelContainer &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_ItemModels = __Value;
        return;
    }
}

struct FVM_Common_Pop_Center_Spend : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_CommonPopCenterSpendItem>> m_SpendItems;
    UPROPERTY()
    FText m_TitleText;
    UPROPERTY()
    FText m_DescriptionText;
    UPROPERTY()
    FText m_ConfirmButtonText;
    UPROPERTY()
    FText m_CancelButtonText;
    UPROPERTY()
    bool m_bShowCancelButton;

    FVM_Common_Pop_Center_Spend()
    {
        this.m_bShowCancelButton = true;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVM_Common_Pop_Center_Spend(const FVM_Common_Pop_Center_Spend &inout Other)
    {
        this.m_bShowCancelButton = true;
        this.m_SpendItems = Other.m_SpendItems;
        this.m_TitleText = Other.m_TitleText;
        this.m_DescriptionText = Other.m_DescriptionText;
        this.m_ConfirmButtonText = Other.m_ConfirmButtonText;
        this.m_CancelButtonText = Other.m_CancelButtonText;
        this.m_bShowCancelButton = Other.m_bShowCancelButton;
        return;
    }
    FVM_Common_Pop_Center_Spend opAssign(const FVM_Common_Pop_Center_Spend &inout Other)
    {
        FVM_Common_Pop_Center_Spend __r;
        this.m_SpendItems = Other.m_SpendItems;
        this.m_TitleText = Other.m_TitleText;
        this.m_DescriptionText = Other.m_DescriptionText;
        this.m_ConfirmButtonText = Other.m_ConfirmButtonText;
        this.m_CancelButtonText = Other.m_CancelButtonText;
        this.m_bShowCancelButton = Other.m_bShowCancelButton;
        return __r;
    }
    void LoadConfig(const FConfigVM_Common_Pop_Center_Spend &inout InConfig)
    {
        this.SetDescriptionText(InConfig.DescriptionText);
        this.SetConfirmButtonText(InConfig.ConfirmButtonText);
        this.SetCancelButtonText(InConfig.CancelButtonText);
        this.SetbShowCancelButton(InConfig.bShowCancelButton);
        this.SetTitleText(InConfig.TitleText);
        return;
    }
    int GetSpendItemsCount() const
    {
        return this.GetSpendItems().Num();
    }
    bool HasSpendItems() const
    {
        return !(this.GetSpendItems().IsEmpty());
    }
    const TArray<TEUIModelRef<FVM_CommonPopCenterSpendItem>> GetSpendItems() const property
    {
        const TArray<TEUIModelRef<FVM_CommonPopCenterSpendItem>> __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    TArray<TEUIModelRef<FVM_CommonPopCenterSpendItem>> GetModify_SpendItems() property
    {
        TArray<TEUIModelRef<FVM_CommonPopCenterSpendItem>> __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetSpendItems(const TArray<TEUIModelRef<FVM_CommonPopCenterSpendItem>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_SpendItems = __Value;
        return;
    }
    FText GetTitleText() const property
    {
        FText __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    FText GetModify_TitleText() property
    {
        FText __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetTitleText(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_TitleText = __Value;
        return;
    }
    const FText GetDescriptionText() const property
    {
        const FText __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    FText GetModify_DescriptionText() property
    {
        FText __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetDescriptionText(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_DescriptionText = __Value;
        return;
    }
    const FText GetConfirmButtonText() const property
    {
        const FText __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    FText GetModify_ConfirmButtonText() property
    {
        FText __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetConfirmButtonText(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_ConfirmButtonText = __Value;
        return;
    }
    const FText GetCancelButtonText() const property
    {
        const FText __r;
        this.TrackPropertyRead(4);
        return __r;
    }
    FText GetModify_CancelButtonText() property
    {
        FText __r;
        this.MarkPropertyDirty(4);
        return __r;
    }
    void SetCancelButtonText(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_CancelButtonText = __Value;
        return;
    }
    bool GetbShowCancelButton() const property
    {
        this.TrackPropertyRead(5);
        return this.m_bShowCancelButton;
    }
    void SetbShowCancelButton(const bool __Value) property
    {
        if (!(this.m_bShowCancelButton) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_bShowCancelButton = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_CommonPopCenterSpendItem
{
    UPROPERTY()
    FSoftBrush ItemIcon;
    UPROPERTY()
    FText ItemNum;
    UPROPERTY()
    TEUIModelRef<FVM_Item> Item;
    UPROPERTY()
    FEUIModelContainer ItemTooltip;
    UPROPERTY()
    FLinearColor ItemImageBGColor;
    UPROPERTY()
    TEUIModelRef<FVM_CommonPopCenterSpendItem> Self;

    __GeneratedProperties_FVM_CommonPopCenterSpendItem()
    {
        return;
    }
}

struct __GeneratedProperties_FVM_Common_Pop_Center_Spend
{
    UPROPERTY()
    int SpendItemsCount;
    UPROPERTY()
    bool HasSpendItems;
    UPROPERTY()
    TEUIModelRef<FVM_Common_Pop_Center_Spend> Self;


}

namespace FVM_CommonPopCenterSpendItem
{
FVM_CommonPopCenterSpendItem& Create(const UObject ContextObject, const FEUIModelContainer &inout ItemModels)
{
    return FVM_CommonPopCenterSpendItem::CreateByManager(EUIInternal::GetContextManager(ContextObject), ItemModels);
}
FVM_CommonPopCenterSpendItem CreateByManager(const UEUIManagerSubsystem Manager, const FEUIModelContainer &inout ItemModels)
{
    FVM_CommonPopCenterSpendItem __r;
    TEUIModelRef<FVM_CommonPopCenterSpendItem> local_6 = TEUIModelRef<FVM_CommonPopCenterSpendItem>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_CommonPopCenterSpendItem::ModelId, 0, ItemModels));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "ItemIcon";
    local_14.TypeName = "FSoftBrush";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ItemNum";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Item";
    local_14.TypeName = "TEUIModelRef<FVM_Item>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ItemTooltip";
    local_14.TypeName = "FEUIModelContainer";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ItemImageBGColor";
    local_14.TypeName = "FLinearColor";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_CommonPopCenterSpendItem>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_CommonPopCenterSpendItem;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_CommonPopCenterSpendItem;
}
FSoftBrush __UIGetter_ItemIcon(const FVM_CommonPopCenterSpendItem &inout Model)
{
    return Model.GetItemIcon();
}
FText __UIGetter_ItemNum(const FVM_CommonPopCenterSpendItem &inout Model)
{
    return Model.GetItemNum();
}
TEUIModelRef<FVM_Item> __UIGetter_Item(const FVM_CommonPopCenterSpendItem &inout Model)
{
    return Model.GetItem();
}
FEUIModelContainer __UIGetter_ItemTooltip(const FVM_CommonPopCenterSpendItem &inout Model)
{
    return Model.GetItemTooltip();
}
FLinearColor __UIGetter_ItemImageBGColor(const FVM_CommonPopCenterSpendItem &inout Model)
{
    return Model.GetItemImageBGColor();
}
TEUIModelRef<FVM_CommonPopCenterSpendItem> __UIGetter_Self(const FVM_CommonPopCenterSpendItem &inout Model)
{
    return TEUIModelRef<FVM_CommonPopCenterSpendItem>(Model);
}
int __IndexOf_ItemModels()
{
    return 0;
}
}
namespace __GeneratedProperties_FVM_CommonPopCenterSpendItem
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
namespace FVM_Common_Pop_Center_Spend
{
FVM_Common_Pop_Center_Spend& Create(const UObject ContextObject)
{
    return FVM_Common_Pop_Center_Spend::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_Common_Pop_Center_Spend CreateByManager(const UEUIManagerSubsystem Manager)
{
    FVM_Common_Pop_Center_Spend __r;
    TEUIModelRef<FVM_Common_Pop_Center_Spend> local_6 = TEUIModelRef<FVM_Common_Pop_Center_Spend>(EUIInternal::MakeModelWithManager(Manager, FVM_Common_Pop_Center_Spend::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(true);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "SpendItems";
    local_14.TypeName = "TArray<TEUIModelRef<FVM_CommonPopCenterSpendItem>>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "TitleText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "DescriptionText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ConfirmButtonText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CancelButtonText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bShowCancelButton";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "SpendItemsCount";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "HasSpendItems";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_Common_Pop_Center_Spend>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_Common_Pop_Center_Spend;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_Common_Pop_Center_Spend;
}
TArray<TEUIModelRef<FVM_CommonPopCenterSpendItem>> __UIGetter_SpendItems(const FVM_Common_Pop_Center_Spend &inout Model)
{
    return Model.GetSpendItems();
}
FText __UIGetter_TitleText(const FVM_Common_Pop_Center_Spend &inout Model)
{
    return Model.GetTitleText();
}
FText __UIGetter_DescriptionText(const FVM_Common_Pop_Center_Spend &inout Model)
{
    return Model.GetDescriptionText();
}
FText __UIGetter_ConfirmButtonText(const FVM_Common_Pop_Center_Spend &inout Model)
{
    return Model.GetConfirmButtonText();
}
FText __UIGetter_CancelButtonText(const FVM_Common_Pop_Center_Spend &inout Model)
{
    return Model.GetCancelButtonText();
}
bool __UIGetter_bShowCancelButton(const FVM_Common_Pop_Center_Spend &inout Model)
{
    return Model.GetbShowCancelButton();
}
int __UIGetter_SpendItemsCount(const FVM_Common_Pop_Center_Spend &inout Model)
{
    return Model.GetSpendItemsCount();
}
bool __UIGetter_HasSpendItems(const FVM_Common_Pop_Center_Spend &inout Model)
{
    return Model.HasSpendItems();
}
TEUIModelRef<FVM_Common_Pop_Center_Spend> __UIGetter_Self(const FVM_Common_Pop_Center_Spend &inout Model)
{
    return TEUIModelRef<FVM_Common_Pop_Center_Spend>(Model);
}
int __IndexOf_SpendItems()
{
    return 0;
}
int __IndexOf_TitleText()
{
    return 1;
}
int __IndexOf_DescriptionText()
{
    return 2;
}
int __IndexOf_ConfirmButtonText()
{
    return 3;
}
int __IndexOf_CancelButtonText()
{
    return 4;
}
int __IndexOf_bShowCancelButton()
{
    return 5;
}
}
namespace __GeneratedProperties_FVM_Common_Pop_Center_Spend
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
