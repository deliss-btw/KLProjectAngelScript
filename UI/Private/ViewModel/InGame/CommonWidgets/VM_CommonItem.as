
namespace FVM_CommonItem
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature HandleCommonItemClicked = FEUIModelCallbackSignature();

}
struct FVM_CommonItem : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TEUIModelRef<FM_ItemData> m_ItemDataModel;
    UPROPERTY()
    FCommonItemClicked m_OnCommonItemClicked;
    UPROPERTY()
    TEUIModelRef<FVM_Item> m_ItemVM;
    UPROPERTY()
    TDataObjectPtr<FItemConfig> m_ItemConfig;
    UPROPERTY()
    FText m_ItemName;
    UPROPERTY()
    FSoftBrush m_ItemImage;
    UPROPERTY()
    FSoftBrush m_ItemImageHigh;
    UPROPERTY()
    FSoftBrush m_ItemImageTemp;
    UPROPERTY()
    FSoftBrush m_ItemImageBG;
    UPROPERTY()
    FLinearColor m_RarityColor;
    UPROPERTY()
    bool m_bIsCustomSelected;
    UPROPERTY()
    int m_CurDisplayState;

    FVM_CommonItem()
    {
        this.m_bIsCustomSelected = false;
        this.m_CurDisplayState = 0;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_CommonItem' by default constructor.");
        return;
    }
    FVM_CommonItem(const FVM_CommonItem &inout Other)
    {
        this.m_bIsCustomSelected = false;
        this.m_CurDisplayState = 0;
        this.m_ItemDataModel = Other.m_ItemDataModel;
        this.m_ItemVM = Other.m_ItemVM;
        this.m_ItemConfig = Other.m_ItemConfig;
        this.m_ItemName = Other.m_ItemName;
        this.m_ItemImage = Other.m_ItemImage;
        this.m_ItemImageHigh = Other.m_ItemImageHigh;
        this.m_ItemImageTemp = Other.m_ItemImageTemp;
        this.m_ItemImageBG = Other.m_ItemImageBG;
        this.m_RarityColor = Other.m_RarityColor;
        this.m_bIsCustomSelected = Other.m_bIsCustomSelected;
        this.m_CurDisplayState = int(Other.m_CurDisplayState);
        return;
    }
    FVM_CommonItem(const TEUIModelRef<FM_ItemData> &inout InItemDataModel)
    {
        this.m_bIsCustomSelected = false;
        this.m_CurDisplayState = 0;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetItemDataModel(InItemDataModel);
        return;
    }
    FVM_CommonItem opAssign(const FVM_CommonItem &inout Other)
    {
        FVM_CommonItem __r;
        this.m_ItemDataModel = Other.m_ItemDataModel;
        this.m_ItemVM = Other.m_ItemVM;
        this.m_ItemConfig = Other.m_ItemConfig;
        this.m_ItemName = Other.m_ItemName;
        this.m_ItemImage = Other.m_ItemImage;
        this.m_ItemImageHigh = Other.m_ItemImageHigh;
        this.m_ItemImageTemp = Other.m_ItemImageTemp;
        this.m_ItemImageBG = Other.m_ItemImageBG;
        this.m_RarityColor = Other.m_RarityColor;
        this.m_bIsCustomSelected = Other.m_bIsCustomSelected;
        this.m_CurDisplayState = int(Other.m_CurDisplayState);
        return __r;
    }
    void PostConstruct()
    {
        if (!(this.GetItemDataModel().IsValid()))
        {
            return;
        }
        this.SetItemVM(TEUIModelRef<FVM_Item>(::FVM_Item::Create(this.GetContext().Manager, this.GetItemDataModel())));
        TEUIModelRef<FM_ItemData> local_2 = this.GetItemDataModel();
        this.SetItemConfig(GetConfig());
        if (this.GetItemConfig().IsSet())
        {
            FSoftBrush local_52;
            FVector2f local_63;
            if (0 == 2)
            {
                local_63 = FVector2f(180.0f, 180.0f);
            }
            else
            {
                local_63 = FVector2f(144.0f, 144.0f);
            }
            local_52.ImageSize = local_63;
            this.SetItemImage(local_52);
            this.SetItemImageHigh(FSoftBrush());
            this.SetItemImageTemp(FSoftBrush());
        }
        this.RefreshDisplay(EItemDisplayType(1));
        this.ApplyDisplayState(0);
        return;
    }
    void RefreshDisplay(const EItemDisplayType DisplayType = EItemDisplayType::Normal)
    {
        int local_29 = 0;
        if (this.GetItemConfig().IsSet())
        {
            if (::UGlobalItemSettings::Get().GetRarityConfig(EItemRarity(local_29)).IsSet())
            {
                int local_55 = int(DisplayType);
                if (local_55 <= 2)
                {
                    if (local_55 != 1)
                    {
                        if (local_55 != 2)
                        {
                        }
                    }
                    else
                    {
                    }
                }
                return;
            }
            this.SetRarityColor(FLinearColor::White);
        }
        return;
    }
    void SetSpecialDisplayItemImage(const FSoftBrush &inout InItemImage)
    {
        this.SetItemImage(InItemImage);
        return;
    }
    void SetTempDisplayItemImage(const FSoftBrush &inout InItemImage)
    {
        this.SetItemImageTemp(InItemImage);
        return;
    }
    void SetupDisplayData(const TEUIModelRef<FM_DisplayItemData> &inout DisplayData)
    {
        FEUIModelRef local_2;
        this.SetItemVM(TEUIModelRef<FVM_Item>(local_2));
        TDataObjectPtr<FItemConfig> local_28;
        this.SetItemConfig(local_28);
        if (!(DisplayData.IsValid()))
        {
            this.SetItemName(FText());
            this.SetItemImage(FSoftBrush());
            this.SetItemImageHigh(FSoftBrush());
            this.SetItemImageTemp(FSoftBrush());
            this.SetItemImageBG(FSoftBrush());
            this.SetRarityColor(FLinearColor::White);
            this.ApplyDisplayState(0);
            return;
        }
        this.SetItemName(GetDisplayName());
        this.SetItemImage(GetItemImage());
        this.SetItemImageHigh(GetItemImageHigh());
        this.SetItemImageTemp(GetItemImageTemp());
        this.SetItemImageBG(GetItemImageBG());
        this.SetRarityColor(GetRarityColor());
        this.ApplyDisplayState(GetCurDisplayState());
        return;
    }
    void SetItemCustomSelection(const bool bIsSelected)
    {
        this.SetbIsCustomSelected(bIsSelected);
        return;
    }
    void ApplyDisplayState(const int InDisplayState)
    {
        if ((InDisplayState == 1 || (InDisplayState == 2) || (InDisplayState == 3)))
        {
            this.SetCurDisplayState(InDisplayState);
            return;
        }
        this.SetCurDisplayState(0);
        return;
    }
    void HandleCommonItemClicked()
    {
        if (this.GetOnCommonItemClicked().IsBound())
        {
            this.GetOnCommonItemClicked().Broadcast();
        }
        return;
    }
    TEUIModelRef<FM_ItemData> GetItemDataModel() const property
    {
        this.TrackPropertyRead(0);
        return this.m_ItemDataModel;
    }
    void SetItemDataModel(const TEUIModelRef<FM_ItemData> &inout __Value) property
    {
        TEUIModelRef<FM_ItemData> local_2;
        local_2 = this.m_ItemDataModel;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_ItemDataModel = __Value;
        return;
    }
    const FCommonItemClicked GetOnCommonItemClicked() const property
    {
        const FCommonItemClicked __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    FCommonItemClicked GetModify_OnCommonItemClicked() property
    {
        FCommonItemClicked __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetOnCommonItemClicked(const FCommonItemClicked &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        return;
    }
    TEUIModelRef<FVM_Item> GetItemVM() const property
    {
        this.TrackPropertyRead(2);
        return this.m_ItemVM;
    }
    void SetItemVM(const TEUIModelRef<FVM_Item> &inout __Value) property
    {
        TEUIModelRef<FVM_Item> local_2;
        local_2 = this.m_ItemVM;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_ItemVM = __Value;
        return;
    }
    TDataObjectPtr<FItemConfig> GetItemConfig() const property
    {
        TDataObjectPtr<FItemConfig> __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    TDataObjectPtr<FItemConfig> GetModify_ItemConfig() property
    {
        TDataObjectPtr<FItemConfig> __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetItemConfig(const TDataObjectPtr<FItemConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_ItemConfig = __Value;
        return;
    }
    FText GetItemName() const property
    {
        FText __r;
        this.TrackPropertyRead(4);
        return __r;
    }
    FText GetModify_ItemName() property
    {
        FText __r;
        this.MarkPropertyDirty(4);
        return __r;
    }
    void SetItemName(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_ItemName = __Value;
        return;
    }
    const FSoftBrush GetItemImage() const property
    {
        const FSoftBrush __r;
        this.TrackPropertyRead(5);
        return __r;
    }
    FSoftBrush GetModify_ItemImage() property
    {
        FSoftBrush __r;
        this.MarkPropertyDirty(5);
        return __r;
    }
    void SetItemImage(const FSoftBrush &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_ItemImage = __Value;
        return;
    }
    const FSoftBrush GetItemImageHigh() const property
    {
        const FSoftBrush __r;
        this.TrackPropertyRead(6);
        return __r;
    }
    FSoftBrush GetModify_ItemImageHigh() property
    {
        FSoftBrush __r;
        this.MarkPropertyDirty(6);
        return __r;
    }
    void SetItemImageHigh(const FSoftBrush &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_ItemImageHigh = __Value;
        return;
    }
    const FSoftBrush GetItemImageTemp() const property
    {
        const FSoftBrush __r;
        this.TrackPropertyRead(7);
        return __r;
    }
    FSoftBrush GetModify_ItemImageTemp() property
    {
        FSoftBrush __r;
        this.MarkPropertyDirty(7);
        return __r;
    }
    void SetItemImageTemp(const FSoftBrush &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(7);
        this.m_ItemImageTemp = __Value;
        return;
    }
    const FSoftBrush GetItemImageBG() const property
    {
        const FSoftBrush __r;
        this.TrackPropertyRead(8);
        return __r;
    }
    FSoftBrush GetModify_ItemImageBG() property
    {
        FSoftBrush __r;
        this.MarkPropertyDirty(8);
        return __r;
    }
    void SetItemImageBG(const FSoftBrush &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(8);
        this.m_ItemImageBG = __Value;
        return;
    }
    FLinearColor GetRarityColor() const property
    {
        FLinearColor __r;
        this.TrackPropertyRead(9);
        return __r;
    }
    FLinearColor GetModify_RarityColor() property
    {
        FLinearColor __r;
        this.MarkPropertyDirty(9);
        return __r;
    }
    void SetRarityColor(const FLinearColor &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(9);
        this.m_RarityColor = __Value;
        return;
    }
    bool GetbIsCustomSelected() const property
    {
        this.TrackPropertyRead(10);
        return this.m_bIsCustomSelected;
    }
    void SetbIsCustomSelected(const bool __Value) property
    {
        if (!(this.m_bIsCustomSelected) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(10);
        this.m_bIsCustomSelected = __Value;
        return;
    }
    int GetCurDisplayState() const property
    {
        this.TrackPropertyRead(11);
        return this.m_CurDisplayState;
    }
    void SetCurDisplayState(const int __Value) property
    {
        if (this.m_CurDisplayState == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(11);
        this.m_CurDisplayState = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_CommonItem
{
    UPROPERTY()
    TEUIModelRef<FVM_CommonItem> Self;

    __GeneratedProperties_FVM_CommonItem()
    {
        return;
    }
}

namespace FVM_CommonItem
{
FVM_CommonItem& Create(const UObject ContextObject, const TEUIModelRef<FM_ItemData> &inout ItemDataModel)
{
    return FVM_CommonItem::CreateByManager(EUIInternal::GetContextManager(ContextObject), ItemDataModel);
}
FVM_CommonItem CreateByManager(const UEUIManagerSubsystem Manager, const TEUIModelRef<FM_ItemData> &inout ItemDataModel)
{
    FVM_CommonItem __r;
    TEUIModelRef<FVM_CommonItem> local_6 = TEUIModelRef<FVM_CommonItem>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_CommonItem::ModelId, 0, ItemDataModel));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "ItemConfig";
    local_14.TypeName = "TDataObjectPtr<FItemConfig>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ItemName";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ItemImage";
    local_14.TypeName = "FSoftBrush";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ItemImageHigh";
    local_14.TypeName = "FSoftBrush";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ItemImageTemp";
    local_14.TypeName = "FSoftBrush";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ItemImageBG";
    local_14.TypeName = "FSoftBrush";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "RarityColor";
    local_14.TypeName = "FLinearColor";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bIsCustomSelected";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CurDisplayState";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_CommonItem>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_CommonItem;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_CommonItem;
}
TDataObjectPtr<FItemConfig> __UIGetter_ItemConfig(const FVM_CommonItem &inout Model)
{
    return Model.GetItemConfig();
}
FText __UIGetter_ItemName(const FVM_CommonItem &inout Model)
{
    return Model.GetItemName();
}
FSoftBrush __UIGetter_ItemImage(const FVM_CommonItem &inout Model)
{
    return Model.GetItemImage();
}
FSoftBrush __UIGetter_ItemImageHigh(const FVM_CommonItem &inout Model)
{
    return Model.GetItemImageHigh();
}
FSoftBrush __UIGetter_ItemImageTemp(const FVM_CommonItem &inout Model)
{
    return Model.GetItemImageTemp();
}
FSoftBrush __UIGetter_ItemImageBG(const FVM_CommonItem &inout Model)
{
    return Model.GetItemImageBG();
}
FLinearColor __UIGetter_RarityColor(const FVM_CommonItem &inout Model)
{
    return Model.GetRarityColor();
}
bool __UIGetter_bIsCustomSelected(const FVM_CommonItem &inout Model)
{
    return Model.GetbIsCustomSelected();
}
int __UIGetter_CurDisplayState(const FVM_CommonItem &inout Model)
{
    return Model.GetCurDisplayState();
}
TEUIModelRef<FVM_CommonItem> __UIGetter_Self(const FVM_CommonItem &inout Model)
{
    return TEUIModelRef<FVM_CommonItem>(Model);
}
int __IndexOf_ItemDataModel()
{
    return 0;
}
int __IndexOf_OnCommonItemClicked()
{
    return 1;
}
int __IndexOf_ItemVM()
{
    return 2;
}
int __IndexOf_ItemConfig()
{
    return 3;
}
int __IndexOf_ItemName()
{
    return 4;
}
int __IndexOf_ItemImage()
{
    return 5;
}
int __IndexOf_ItemImageHigh()
{
    return 6;
}
int __IndexOf_ItemImageTemp()
{
    return 7;
}
int __IndexOf_ItemImageBG()
{
    return 8;
}
int __IndexOf_RarityColor()
{
    return 9;
}
int __IndexOf_bIsCustomSelected()
{
    return 10;
}
int __IndexOf_CurDisplayState()
{
    return 11;
}
}
namespace __GeneratedProperties_FVM_CommonItem
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
