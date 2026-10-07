
namespace FVM_CommonItemTipDisplayAdapter
{
    const int ModelId = 0;

}
struct FVM_CommonItemTipDisplayAdapter : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    FText m_ItemName;
    UPROPERTY()
    FText m_ItemCategory;
    UPROPERTY()
    FText m_ItemDescription;
    UPROPERTY()
    FText m_ItemBackgroundDescription;
    UPROPERTY()
    FSlateBrush m_ItemIcon;
    UPROPERTY()
    FSoftBrush m_ItemSpecialBgImage;
    UPROPERTY()
    FSlateBrush m_TipRarityImage;
    UPROPERTY()
    int m_ItemOwnNum;
    UPROPERTY()
    TEUIModelRef<FVM_AvatarEquipmentItemInfoDetail> m_CurEquipItemInfoDetail;
    UPROPERTY()
    bool m_CanShowEquipInfoDetail;
    UPROPERTY()
    bool m_IsEquiped;
    UPROPERTY()
    bool m_CanShowItemInfoTips;
    UPROPERTY()
    FText m_EquiptingAvatarTextWithoutColor;
    UPROPERTY()
    bool m_HasBankLimit;
    UPROPERTY()
    int m_ItemBankOwnNum;
    UPROPERTY()
    int m_ItemOwnInfoTipsIndex;
    UPROPERTY()
    FText m_ItemOwnLimit;
    UPROPERTY()
    FText m_EquipmentLevelText;

    FVM_CommonItemTipDisplayAdapter()
    {
        this.m_ItemOwnNum = 0;
        this.m_CanShowEquipInfoDetail = false;
        this.m_IsEquiped = false;
        this.m_CanShowItemInfoTips = true;
        this.m_HasBankLimit = false;
        this.m_ItemBankOwnNum = 0;
        this.m_ItemOwnInfoTipsIndex = 0;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVM_CommonItemTipDisplayAdapter(const FVM_CommonItemTipDisplayAdapter &inout Other)
    {
        this.m_ItemOwnNum = 0;
        this.m_CanShowEquipInfoDetail = false;
        this.m_IsEquiped = false;
        this.m_CanShowItemInfoTips = true;
        this.m_HasBankLimit = false;
        this.m_ItemBankOwnNum = 0;
        this.m_ItemOwnInfoTipsIndex = 0;
        this.m_ItemName = Other.m_ItemName;
        this.m_ItemCategory = Other.m_ItemCategory;
        this.m_ItemDescription = Other.m_ItemDescription;
        this.m_ItemBackgroundDescription = Other.m_ItemBackgroundDescription;
        this.m_ItemIcon = Other.m_ItemIcon;
        this.m_ItemSpecialBgImage = Other.m_ItemSpecialBgImage;
        this.m_TipRarityImage = Other.m_TipRarityImage;
        this.m_ItemOwnNum = int(Other.m_ItemOwnNum);
        this.m_CurEquipItemInfoDetail = Other.m_CurEquipItemInfoDetail;
        this.m_CanShowEquipInfoDetail = Other.m_CanShowEquipInfoDetail;
        this.m_IsEquiped = Other.m_IsEquiped;
        this.m_CanShowItemInfoTips = Other.m_CanShowItemInfoTips;
        this.m_EquiptingAvatarTextWithoutColor = Other.m_EquiptingAvatarTextWithoutColor;
        this.m_HasBankLimit = Other.m_HasBankLimit;
        this.m_ItemBankOwnNum = int(Other.m_ItemBankOwnNum);
        this.m_ItemOwnInfoTipsIndex = int(Other.m_ItemOwnInfoTipsIndex);
        this.m_ItemOwnLimit = Other.m_ItemOwnLimit;
        this.m_EquipmentLevelText = Other.m_EquipmentLevelText;
        return;
    }
    FVM_CommonItemTipDisplayAdapter& opAssign(const FVM_CommonItemTipDisplayAdapter &inout Other)
    {
        this.m_ItemName = Other.m_ItemName;
        this.m_ItemCategory = Other.m_ItemCategory;
        this.m_ItemDescription = Other.m_ItemDescription;
        this.m_ItemBackgroundDescription = Other.m_ItemBackgroundDescription;
        this.m_ItemIcon = Other.m_ItemIcon;
        this.m_ItemSpecialBgImage = Other.m_ItemSpecialBgImage;
        this.m_TipRarityImage = Other.m_TipRarityImage;
        this.m_ItemOwnNum = int(Other.m_ItemOwnNum);
        this.m_CurEquipItemInfoDetail = Other.m_CurEquipItemInfoDetail;
        this.m_CanShowEquipInfoDetail = Other.m_CanShowEquipInfoDetail;
        this.m_IsEquiped = Other.m_IsEquiped;
        this.m_CanShowItemInfoTips = Other.m_CanShowItemInfoTips;
        this.m_EquiptingAvatarTextWithoutColor = Other.m_EquiptingAvatarTextWithoutColor;
        this.m_HasBankLimit = Other.m_HasBankLimit;
        this.m_ItemBankOwnNum = int(Other.m_ItemBankOwnNum);
        this.m_ItemOwnInfoTipsIndex = int(Other.m_ItemOwnInfoTipsIndex);
        this.m_ItemOwnLimit = Other.m_ItemOwnLimit;
        return Other.m_EquipmentLevelText;
    }
    bool TrySetupFromTip(const TEUIModelRef<FVM_CommonItemTip> &inout InTip)
    {
        if (!(InTip.IsValid()))
        {
            return false;
        }
        TEUIModelRef<FVM_Item> local_4;
        local_4.GetItem();
        if (local_4.IsValid())
        {
            local_4.GetItem();
            return this.TrySetupFromItem(local_4);
        }
        TEUIModelRef<FVM_DisplayItem> local_6;
        local_6.GetDisplayItem();
        if (local_6.IsValid())
        {
            local_6.GetDisplayItem();
            return this.TrySetupFromDisplayItem(local_6);
        }
        return this.TrySetupFromDisplayData(GetData().DisplayData);
    }
    bool TrySetupFromItem(const TEUIModelRef<FVM_Item> &inout InItem)
    {
        int local_53 = 0;
        bool local_1 = !(InItem.IsValid()) || !(GetItemConfig().IsSet());
        if (local_1)
        {
            return false;
        }
        TDataObjectPtr<FItemConfig> local_26 = GetItemConfig();
        TDataObjectPtr<FItemRarityConfig> local_78 = ::UGlobalItemSettings::Get().GetRarityConfig(EItemRarity(local_53));
        FText local_106;
        local_106.GetItemCategory();
        this.SetItemCategory(local_106);
        FSlateBrush local_152;
        local_152.GetItemIcon();
        this.SetItemIcon(local_152);
        this.SetItemSpecialBgImage(::ItemFeature_SpecialBg_Util::GetSpecialBgImage(local_26));
        FSlateBrush local_284 = (local_78 && local_1) ? local_152 : FSlateBrush();
        this.SetTipRarityImage(local_284);
        this.SetItemOwnNum(GetItemOwnNum());
        TEUIModelRef<FVM_AvatarEquipmentItemInfoDetail> local_288;
        local_288.GetCurEquipItemInfoDetail();
        this.SetCurEquipItemInfoDetail(local_288);
        this.SetCanShowEquipInfoDetail(GetCanShowEquipInfoDetail());
        this.SetIsEquiped(GetIsEquiped());
        this.SetCanShowItemInfoTips(CanShowItemInfoTips());
        local_106.GetEquiptingAvatarTextWithoutColor();
        this.SetEquiptingAvatarTextWithoutColor(local_106);
        this.SetHasBankLimit(HasBankLimit());
        this.SetItemBankOwnNum(GetItemBankOwnNum());
        this.SetItemOwnInfoTipsIndex(GetItemOwnInfoTipsIndex());
        local_106.GetItemOwnLimit();
        this.SetItemOwnLimit(local_106);
        local_106.GetEquipmentLevelText();
        this.SetEquipmentLevelText(local_106);
        return true;
    }
    bool TrySetupFromDisplayItem(const TEUIModelRef<FVM_DisplayItem> &inout InDisplayItem)
    {
        if (!(InDisplayItem.IsValid()))
        {
            return false;
        }
        TEUIModelRef<FM_DisplayItemData> local_4;
        local_4.GetDisplayData();
        return this.TrySetupFromDisplayData(local_4);
    }
    bool TrySetupFromDisplayData(const TEUIModelRef<FM_DisplayItemData> &inout DisplayData)
    {
        int local_83 = 0;
        int local_109 = 0;
        FSlateBrush local_160;
        bool local_1 = !(DisplayData.IsValid()) || (int(GetSourceType()) != 2);
        if (local_1)
        {
            local_1 = true;
        }
        else
        {
            int local_6 = GetSourceId();
            local_1 = (local_6 == 0);
        }
        if (local_1)
        {
            return false;
        }
        TDataObjectPtr<FFashionConfig> local_56 = ::FFashionConfig::GetByDataId(GetSourceId());
        if (!(local_56))
        {
            return false;
        }
        int local_84 = int(::DisplayItemAdapter_Fashion::ConvertFashionRarity(EFashionRarity(local_83)));
        TDataObjectPtr<FItemRarityConfig> local_108 = ::UGlobalItemSettings::Get().GetRarityConfig();
        FText local_114 = ::FashionSettings::GetFashionSlotName(EFashionSlotType(local_109));
        this.SetItemCategory(local_114);
        this.SetItemDescription(local_114);
        FSlateBrush local_248;
        if (GetItemImage().IsSet())
        {
            local_160 = GetItemImage().LoadBrush();
            local_248 = local_160;
        }
        else
        {
            local_248 = FSlateBrush();
        }
        this.SetItemIcon(FSlateBrush());
        CastTo local_252;
        this.SetItemSpecialBgImage(::ItemFeature_SpecialBg_Util::GetSpecialBgImage(local_252.opCall()));
        local_248 = (local_108 && local_1) ? local_160 : FSlateBrush();
        this.SetTipRarityImage(local_248);
        int local_3 = ::DisplayItemAdapter_Fashion::IsUnlocked(local_56, ::FMS_FashionModel::Get(this.GetContext().Manager)) ? 1 : 0;
        this.SetItemOwnNum(local_3);
        this.SetCurEquipItemInfoDetail(TEUIModelRef<FVM_AvatarEquipmentItemInfoDetail>());
        this.SetCanShowEquipInfoDetail(false);
        this.SetIsEquiped(false);
        this.SetCanShowItemInfoTips(true);
        this.SetEquiptingAvatarTextWithoutColor(FText());
        this.SetHasBankLimit(false);
        this.SetItemBankOwnNum(0);
        this.SetItemOwnInfoTipsIndex(0);
        this.SetItemOwnLimit(FText());
        this.SetEquipmentLevelText(FText());
        return true;
    }
    FText GetItemName() const property
    {
        FText __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    FText GetModify_ItemName() property
    {
        FText __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetItemName(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_ItemName = __Value;
        return;
    }
    FText GetItemCategory() const property
    {
        FText __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    FText GetModify_ItemCategory() property
    {
        FText __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetItemCategory(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_ItemCategory = __Value;
        return;
    }
    const FText GetItemDescription() const property
    {
        const FText __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    FText GetModify_ItemDescription() property
    {
        FText __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetItemDescription(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_ItemDescription = __Value;
        return;
    }
    const FText GetItemBackgroundDescription() const property
    {
        const FText __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    FText GetModify_ItemBackgroundDescription() property
    {
        FText __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetItemBackgroundDescription(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_ItemBackgroundDescription = __Value;
        return;
    }
    FSlateBrush GetItemIcon() const property
    {
        FSlateBrush __r;
        this.TrackPropertyRead(4);
        return __r;
    }
    FSlateBrush GetModify_ItemIcon() property
    {
        FSlateBrush __r;
        this.MarkPropertyDirty(4);
        return __r;
    }
    void SetItemIcon(const FSlateBrush &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_ItemIcon = __Value;
        return;
    }
    FSoftBrush GetItemSpecialBgImage() const property
    {
        FSoftBrush __r;
        this.TrackPropertyRead(5);
        return __r;
    }
    FSoftBrush GetModify_ItemSpecialBgImage() property
    {
        FSoftBrush __r;
        this.MarkPropertyDirty(5);
        return __r;
    }
    void SetItemSpecialBgImage(const FSoftBrush &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_ItemSpecialBgImage = __Value;
        return;
    }
    FSlateBrush GetTipRarityImage() const property
    {
        FSlateBrush __r;
        this.TrackPropertyRead(6);
        return __r;
    }
    FSlateBrush GetModify_TipRarityImage() property
    {
        FSlateBrush __r;
        this.MarkPropertyDirty(6);
        return __r;
    }
    void SetTipRarityImage(const FSlateBrush &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_TipRarityImage = __Value;
        return;
    }
    int GetItemOwnNum() const property
    {
        this.TrackPropertyRead(7);
        return this.m_ItemOwnNum;
    }
    void SetItemOwnNum(const int __Value) property
    {
        if (this.m_ItemOwnNum == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(7);
        this.m_ItemOwnNum = __Value;
        return;
    }
    TEUIModelRef<FVM_AvatarEquipmentItemInfoDetail> GetCurEquipItemInfoDetail() const property
    {
        this.TrackPropertyRead(8);
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
        this.MarkPropertyDirty(8);
        this.m_CurEquipItemInfoDetail = __Value;
        return;
    }
    bool GetCanShowEquipInfoDetail() const property
    {
        this.TrackPropertyRead(9);
        return this.m_CanShowEquipInfoDetail;
    }
    void SetCanShowEquipInfoDetail(const bool __Value) property
    {
        if (!(this.m_CanShowEquipInfoDetail) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(9);
        this.m_CanShowEquipInfoDetail = __Value;
        return;
    }
    bool GetIsEquiped() const property
    {
        this.TrackPropertyRead(10);
        return this.m_IsEquiped;
    }
    void SetIsEquiped(const bool __Value) property
    {
        if (!(this.m_IsEquiped) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(10);
        this.m_IsEquiped = __Value;
        return;
    }
    bool GetCanShowItemInfoTips() const property
    {
        this.TrackPropertyRead(11);
        return this.m_CanShowItemInfoTips;
    }
    void SetCanShowItemInfoTips(const bool __Value) property
    {
        if (!(this.m_CanShowItemInfoTips) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(11);
        this.m_CanShowItemInfoTips = __Value;
        return;
    }
    FText GetEquiptingAvatarTextWithoutColor() const property
    {
        FText __r;
        this.TrackPropertyRead(12);
        return __r;
    }
    FText GetModify_EquiptingAvatarTextWithoutColor() property
    {
        FText __r;
        this.MarkPropertyDirty(12);
        return __r;
    }
    void SetEquiptingAvatarTextWithoutColor(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(12);
        this.m_EquiptingAvatarTextWithoutColor = __Value;
        return;
    }
    bool GetHasBankLimit() const property
    {
        this.TrackPropertyRead(13);
        return this.m_HasBankLimit;
    }
    void SetHasBankLimit(const bool __Value) property
    {
        if (!(this.m_HasBankLimit) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(13);
        this.m_HasBankLimit = __Value;
        return;
    }
    int GetItemBankOwnNum() const property
    {
        this.TrackPropertyRead(14);
        return this.m_ItemBankOwnNum;
    }
    void SetItemBankOwnNum(const int __Value) property
    {
        if (this.m_ItemBankOwnNum == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(14);
        this.m_ItemBankOwnNum = __Value;
        return;
    }
    int GetItemOwnInfoTipsIndex() const property
    {
        this.TrackPropertyRead(15);
        return this.m_ItemOwnInfoTipsIndex;
    }
    void SetItemOwnInfoTipsIndex(const int __Value) property
    {
        if (this.m_ItemOwnInfoTipsIndex == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(15);
        this.m_ItemOwnInfoTipsIndex = __Value;
        return;
    }
    FText GetItemOwnLimit() const property
    {
        FText __r;
        this.TrackPropertyRead(16);
        return __r;
    }
    FText GetModify_ItemOwnLimit() property
    {
        FText __r;
        this.MarkPropertyDirty(16);
        return __r;
    }
    void SetItemOwnLimit(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(16);
        this.m_ItemOwnLimit = __Value;
        return;
    }
    FText GetEquipmentLevelText() const property
    {
        FText __r;
        this.TrackPropertyRead(17);
        return __r;
    }
    FText GetModify_EquipmentLevelText() property
    {
        FText __r;
        this.MarkPropertyDirty(17);
        return __r;
    }
    void SetEquipmentLevelText(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(17);
        this.m_EquipmentLevelText = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_CommonItemTipDisplayAdapter
{
    UPROPERTY()
    TEUIModelRef<FVM_CommonItemTipDisplayAdapter> Self;

    __GeneratedProperties_FVM_CommonItemTipDisplayAdapter()
    {
        return;
    }
}

namespace FVM_CommonItemTipDisplayAdapter
{
FVM_CommonItemTipDisplayAdapter& Create(const UObject ContextObject)
{
    return FVM_CommonItemTipDisplayAdapter::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_CommonItemTipDisplayAdapter CreateByManager(const UEUIManagerSubsystem Manager)
{
    FVM_CommonItemTipDisplayAdapter __r;
    TEUIModelRef<FVM_CommonItemTipDisplayAdapter> local_6 = TEUIModelRef<FVM_CommonItemTipDisplayAdapter>(EUIInternal::MakeModelWithManager(Manager, FVM_CommonItemTipDisplayAdapter::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "ItemName";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ItemCategory";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ItemDescription";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ItemBackgroundDescription";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ItemIcon";
    local_14.TypeName = "FSlateBrush";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ItemSpecialBgImage";
    local_14.TypeName = "FSoftBrush";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "TipRarityImage";
    local_14.TypeName = "FSlateBrush";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ItemOwnNum";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CurEquipItemInfoDetail";
    local_14.TypeName = "TEUIModelRef<FVM_AvatarEquipmentItemInfoDetail>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CanShowEquipInfoDetail";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IsEquiped";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CanShowItemInfoTips";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "EquiptingAvatarTextWithoutColor";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "HasBankLimit";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ItemBankOwnNum";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ItemOwnInfoTipsIndex";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ItemOwnLimit";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "EquipmentLevelText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_CommonItemTipDisplayAdapter>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_CommonItemTipDisplayAdapter;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_CommonItemTipDisplayAdapter;
}
FText __UIGetter_ItemName(const FVM_CommonItemTipDisplayAdapter &inout Model)
{
    return Model.GetItemName();
}
FText __UIGetter_ItemCategory(const FVM_CommonItemTipDisplayAdapter &inout Model)
{
    return Model.GetItemCategory();
}
FText __UIGetter_ItemDescription(const FVM_CommonItemTipDisplayAdapter &inout Model)
{
    return Model.GetItemDescription();
}
FText __UIGetter_ItemBackgroundDescription(const FVM_CommonItemTipDisplayAdapter &inout Model)
{
    return Model.GetItemBackgroundDescription();
}
FSlateBrush __UIGetter_ItemIcon(const FVM_CommonItemTipDisplayAdapter &inout Model)
{
    return Model.GetItemIcon();
}
FSoftBrush __UIGetter_ItemSpecialBgImage(const FVM_CommonItemTipDisplayAdapter &inout Model)
{
    return Model.GetItemSpecialBgImage();
}
FSlateBrush __UIGetter_TipRarityImage(const FVM_CommonItemTipDisplayAdapter &inout Model)
{
    return Model.GetTipRarityImage();
}
int __UIGetter_ItemOwnNum(const FVM_CommonItemTipDisplayAdapter &inout Model)
{
    return Model.GetItemOwnNum();
}
TEUIModelRef<FVM_AvatarEquipmentItemInfoDetail> __UIGetter_CurEquipItemInfoDetail(const FVM_CommonItemTipDisplayAdapter &inout Model)
{
    return Model.GetCurEquipItemInfoDetail();
}
bool __UIGetter_CanShowEquipInfoDetail(const FVM_CommonItemTipDisplayAdapter &inout Model)
{
    return Model.GetCanShowEquipInfoDetail();
}
bool __UIGetter_IsEquiped(const FVM_CommonItemTipDisplayAdapter &inout Model)
{
    return Model.GetIsEquiped();
}
bool __UIGetter_CanShowItemInfoTips(const FVM_CommonItemTipDisplayAdapter &inout Model)
{
    return Model.GetCanShowItemInfoTips();
}
FText __UIGetter_EquiptingAvatarTextWithoutColor(const FVM_CommonItemTipDisplayAdapter &inout Model)
{
    return Model.GetEquiptingAvatarTextWithoutColor();
}
bool __UIGetter_HasBankLimit(const FVM_CommonItemTipDisplayAdapter &inout Model)
{
    return Model.GetHasBankLimit();
}
int __UIGetter_ItemBankOwnNum(const FVM_CommonItemTipDisplayAdapter &inout Model)
{
    return Model.GetItemBankOwnNum();
}
int __UIGetter_ItemOwnInfoTipsIndex(const FVM_CommonItemTipDisplayAdapter &inout Model)
{
    return Model.GetItemOwnInfoTipsIndex();
}
FText __UIGetter_ItemOwnLimit(const FVM_CommonItemTipDisplayAdapter &inout Model)
{
    return Model.GetItemOwnLimit();
}
FText __UIGetter_EquipmentLevelText(const FVM_CommonItemTipDisplayAdapter &inout Model)
{
    return Model.GetEquipmentLevelText();
}
TEUIModelRef<FVM_CommonItemTipDisplayAdapter> __UIGetter_Self(const FVM_CommonItemTipDisplayAdapter &inout Model)
{
    return TEUIModelRef<FVM_CommonItemTipDisplayAdapter>(Model);
}
int __IndexOf_ItemName()
{
    return 0;
}
int __IndexOf_ItemCategory()
{
    return 1;
}
int __IndexOf_ItemDescription()
{
    return 2;
}
int __IndexOf_ItemBackgroundDescription()
{
    return 3;
}
int __IndexOf_ItemIcon()
{
    return 4;
}
int __IndexOf_ItemSpecialBgImage()
{
    return 5;
}
int __IndexOf_TipRarityImage()
{
    return 6;
}
int __IndexOf_ItemOwnNum()
{
    return 7;
}
int __IndexOf_CurEquipItemInfoDetail()
{
    return 8;
}
int __IndexOf_CanShowEquipInfoDetail()
{
    return 9;
}
int __IndexOf_IsEquiped()
{
    return 10;
}
int __IndexOf_CanShowItemInfoTips()
{
    return 11;
}
int __IndexOf_EquiptingAvatarTextWithoutColor()
{
    return 12;
}
int __IndexOf_HasBankLimit()
{
    return 13;
}
int __IndexOf_ItemBankOwnNum()
{
    return 14;
}
int __IndexOf_ItemOwnInfoTipsIndex()
{
    return 15;
}
int __IndexOf_ItemOwnLimit()
{
    return 16;
}
int __IndexOf_EquipmentLevelText()
{
    return 17;
}
}
namespace __GeneratedProperties_FVM_CommonItemTipDisplayAdapter
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
