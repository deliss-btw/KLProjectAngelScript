
enum EItemViewModelNumStyle
{
    Default,
    HideNum,
    Ranged,
    NumSelect,
}

namespace FVM_Item
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature OnCustomSelected = FEUIModelCallbackSignature();
}
namespace FVM_ItemIconAdapter
{
    const int ModelId = 0;

}
struct FItemVMRaritySorter
{
    FItemVMRaritySorter()
    {
        return;
    }
    bool opCall(const TEUIModelRef<FVM_Item> &inout A, const TEUIModelRef<FVM_Item> &inout B) const
    {
        int local_3 = int(A.opArrow().GetItemConfig().opArrow().Rarity);
        int local_4 = int(B.opArrow().GetItemConfig().opArrow().Rarity);
        return (local_3 > local_4);
    }
}

struct FVM_Item : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TEUIModelRef<FM_ItemData> m_ItemDataModel;
    UPROPERTY()
    TDataObjectPtr<FItemConfig> m_ItemConfig;
    UPROPERTY()
    int m_Num;
    UPROPERTY()
    int m_OptionalNum;
    UPROPERTY()
    TEUIModelRef<FVM_AvatarEquipmentItemInfoDetail> m_CurEquipItemInfoDetail;
    UPROPERTY()
    EItemViewModelNumStyle m_NumStyle;
    UPROPERTY()
    FItemSelected m_CustomSelectedCallback;

    FVM_Item()
    {
        this.m_Num = 0;
        this.m_OptionalNum = 0;
        this.m_NumStyle = EItemViewModelNumStyle(0);
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_Item' by default constructor.");
        return;
    }
    FVM_Item(const FVM_Item &inout Other)
    {
        this.m_Num = 0;
        this.m_OptionalNum = 0;
        this.m_NumStyle = EItemViewModelNumStyle(0);
        this.m_ItemDataModel = Other.m_ItemDataModel;
        this.m_ItemConfig = Other.m_ItemConfig;
        this.m_Num = int(Other.m_Num);
        this.m_OptionalNum = int(Other.m_OptionalNum);
        this.m_CurEquipItemInfoDetail = Other.m_CurEquipItemInfoDetail;
        this.m_NumStyle = Other.m_NumStyle;
        return;
    }
    FVM_Item(const TEUIModelRef<FM_ItemData> &inout InItemDataModel)
    {
        this.m_Num = 0;
        this.m_OptionalNum = 0;
        this.m_NumStyle = EItemViewModelNumStyle(0);
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetItemDataModel(InItemDataModel);
        return;
    }
    FVM_Item opAssign(const FVM_Item &inout Other)
    {
        FVM_Item __r;
        this.m_ItemDataModel = Other.m_ItemDataModel;
        this.m_ItemConfig = Other.m_ItemConfig;
        this.m_Num = int(Other.m_Num);
        this.m_OptionalNum = int(Other.m_OptionalNum);
        this.m_CurEquipItemInfoDetail = Other.m_CurEquipItemInfoDetail;
        this.m_NumStyle = Other.m_NumStyle;
        return __r;
    }
    void PostConstruct()
    {
        FM_ItemData& local_6;
        this.SetNum(0);
        TEUIModelRef<FM_ItemData> local_4 = this.GetItemDataModel();
        if (local_6)
        {
            this.SetItemConfig(local_6.GetConfig());
            this.SetNum(local_6.GetNum());
            int64 local_10 = 0;
            if (::FMS_ItemDataCache::Get(this.GetContext().Manager).TryGetItemUid(this.GetItemDataModel(), local_10) && (local_10 > 0))
            {
                TEUIModelRef<FM_Equipment> local_20 = ::FMS_EquipmentDataCache::Get(this.GetContext().Manager).GetEquipment(local_10);
                if (local_20.IsValid() && GetEquipmentConfig().IsSet())
                {
                    this.SetCurEquipItemInfoDetail(TEUIModelRef<FVM_AvatarEquipmentItemInfoDetail>(::FVM_AvatarEquipmentItemInfoDetail::Create(this.GetContext().Manager, (TEUIModelRef<FVM_EquipmentInfo>(::FVM_EquipmentInfo::Create(this.GetContext().Manager, local_20))))));
                }
            }
        }
        return;
    }
    TEUIModelRef<FM_Equipment> GetValidEquipmentModel() const
    {
        int64 local_2 = 0;
        if (::FMS_ItemDataCache::Get(this.GetContext().Manager).TryGetItemUid(this.GetItemDataModel(), local_2) && (local_2 > 0))
        {
            TEUIModelRef<FM_Equipment> local_12 = ::FMS_EquipmentDataCache::Get(this.GetContext().Manager).GetEquipment(local_2);
            if (local_12.IsValid() && GetEquipmentConfig().IsSet())
            {
                return local_12;
            }
        }
        return TEUIModelRef<FM_Equipment>();
    }
    bool GetIsEquiped() const
    {
        TEUIModelRef<FM_Equipment> local_2 = this.GetValidEquipmentModel();
        return local_2.IsValid() && GetEquiptingAvatar().IsSet();
    }
    FText GetEquiptingAvatarText() const
    {
        FText local_10;
        if (this.GetValidEquipmentModel().IsValid() && GetEquiptingAvatar().IsSet())
        {
            local_10 = NSLOCTEXT("EquiptingAvatarText", "{0} <Beige20F>иЈ…е¤‡дё­</>");
            return FText();
        }
        return local_10;
    }
    FText GetEquiptingAvatarTextWithoutColor() const
    {
        FText local_10;
        if (this.GetValidEquipmentModel().IsValid() && GetEquiptingAvatar().IsSet())
        {
            local_10 = NSLOCTEXT("EquiptingAvatarEquippingText", "{0}иЈ…е¤‡дё­");
            return FText();
        }
        return local_10;
    }
    bool GetCanShowEquipInfoDetail() const
    {
        return this.GetValidEquipmentModel().IsValid();
    }
    FText GetEquipmentLevelText() const
    {
        int local_2 = 0;
        int local_1 = 0;
        CastTo local_30;
        if (local_30.opCall())
        {
            local_1 = local_2;
        }
        else
        {
            TEUIModelRef<FM_Equipment> local_58 = this.GetValidEquipmentModel();
            if (local_58.IsValid())
            {
                local_1 = local_2;
            }
        }
        FText local_72;
        if (local_1 > 0)
        {
            FText local_64;
            local_64 = FText::AsCultureInvariant("Lv.{0}");
            local_72 = FText::Format(local_64, local_1);
        }
        else
        {
            FText local_64;
            local_72 = local_64;
        }
        return local_72;
    }
    int GetItemOwnInfoTipsIndex() const
    {
        return this.GetCanShowEquipInfoDetail() ? 2 : 0;
    }
    bool CanShowItemInfoTips() const
    {
        return !(this.GetCanShowEquipInfoDetail());
    }
    void UpdateNum()
    {
        int local_5;
        if (this.GetItemDataModel())
        {
            TEUIModelRef<FM_ItemData> local_2 = this.GetItemDataModel();
            local_5 = GetNum();
        }
        else
        {
            local_5 = 0;
        }
        this.SetNum(local_5);
        return;
    }
    void OnCustomSelected()
    {
        if (this.GetCustomSelectedCallback().IsBound())
        {
            this.GetCustomSelectedCallback().Execute(FEUIModelRef(this));
        }
        return;
    }
    FText GetItemCategory() const
    {
        const UInventorySettings local_10;
        FGameplayTag local_2 = this.GetItemConfig().opArrow().ItemCategory.AsGameplayTag();
        if (!(local_2.IsValid()))
        {
            return FText();
        }
        GetGameplaySettings<UInventorySettings> local_12;
        local_10 = local_12;
        local_2;
        return local_10.GetCategoryDisplayName(local_2);
    }
    FSlateBrush GetItemIcon() const
    {
        if (this.GetItemConfig())
        {
            return this.GetItemConfig().opArrow().ItemIcon.LoadBrush();
        }
        return ::UGlobalItemSettings::Get().EmptyItemIcon.LoadBrush();
    }
    FText GetItemOwnLimit() const
    {
        FText local_8;
        if (this.GetItemConfig())
        {
            if (::ItemConfigUtils::LimitOwnMax(this.GetItemConfig()))
            {
                int local_2 = ::ItemConfigUtils::GetOwnMax(this.GetItemConfig());
                int local_3 = ::FMS_PlayerInventory::Get(this.GetContext().Manager).GetTotalItemNum(this.GetItemConfig());
                local_8 = NSLOCTEXT("ItemPackLimit", "жњЂе¤§жђєеё¦ж•°{0}/{1}");
                return FText::Format(local_8, local_3, local_2);
            }
        }
        return local_8;
    }
    bool GetShouldShowNum() const
    {
        return (int(this.GetNumStyle()) != 1);
    }
    bool GetShouldShowOptionalNum() const
    {
        return (int(this.GetNumStyle())) == 2 || (int(this.GetNumStyle()) == 3);
    }
    bool GetShouldShowOfMark() const
    {
        return (int(this.GetNumStyle()) == 3);
    }
    bool GetShouldShowRangeMark() const
    {
        return (int(this.GetNumStyle()) == 2);
    }
    FSlateColor GetNumTextColor() const
    {
        if (int(this.GetNumStyle()) == 3 && (this.GetOptionalNum() > this.GetNum()))
        {
            return FSlateColor(FLinearColor::Red);
        }
        return FSlateColor(FLinearColor::White);
    }
    FText GetItemNumRichText() const
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
        FText __r; return __r;
    }
    FText GetItemNumTimesText() const
    {
        FText local_6;
        FText::AsNumber(this.GetNum(), local_6);
        return FText::Format(INVTEXT("Г—{0}"), local_6);
    }
    FLinearColor GetRarityColor() const
    {
        TDataObjectPtr<FItemRarityConfig> local_28 = ::UGlobalItemSettings::Get().GetRarityConfig(EItemRarity(this.GetItemConfig().opArrow().Rarity));
        if (local_28)
        {
            return local_28.opArrow().DefaultColor;
        }
        return FLinearColor::Transparent;
    }
    FSlateBrush GetTipRarityImage() const
    {
        if (!(this.GetItemConfig()))
        {
            return FSlateBrush();
        }
        TDataObjectPtr<FItemRarityConfig> local_76 = ::UGlobalItemSettings::Get().GetRarityConfig(EItemRarity(this.GetItemConfig().opArrow().Rarity));
        if (local_76)
        {
            return local_76.opArrow().TipRarityImage.LoadBrush();
        }
        return FSlateBrush();
    }
    bool HasOwnLimit() const
    {
        return ::ItemConfigUtils::LimitOwnMax(this.GetItemConfig());
    }
    int GetItemOwnNum() const
    {
        return ::FMS_PlayerInventory::Get(this.GetContext().Manager).GetTotalItemNum(this.GetItemConfig());
    }
    bool ShouldShowItemOwnNum() const
    {
        return !(::ItemConfigUtils::IsPermissionItem(this.GetItemConfig()));
    }
    FText GetItemOwnNumText() const
    {
        if (!(this.ShouldShowItemOwnNum()))
        {
            return FText();
        }
        return FText::Format(NSLOCTEXT("ItemOwnNumText", "ж‹Ґжњ‰ {0}"), this.GetItemOwnNum());
    }
    bool HasBankLimit() const
    {
        return ::ItemConfigUtils::LimitBankMax(this.GetItemConfig());
    }
    int GetItemBankOwnNum() const
    {
        FECSEntity local_4 = this.GetContext().GetLocalPlayer();
        Get local_8;
        const FC_GameplayItemBank& local_10 = local_8.opCall();
        if (local_10)
        {
            int local_12 = 0;
            if (local_10.GetItems().Find(this.GetItemConfig(), local_12))
            {
                return local_12;
            }
        }
        return 0;
    }
    TEUIModelRef<FVM_ItemRarity> GetItemRarity() const
    {
        return TEUIModelRef<FVM_ItemRarity>(::FVM_ItemRarity::Create(this.GetContext().Manager, EItemRarity(this.GetItemConfig().opArrow().Rarity)));
    }
    bool HasAtLeastOne() const
    {
        return (this.GetNum() > 0);
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
    int GetNum() const property
    {
        this.TrackPropertyRead(2);
        return this.m_Num;
    }
    void SetNum(const int __Value) property
    {
        if (this.m_Num == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_Num = __Value;
        return;
    }
    int GetOptionalNum() const property
    {
        this.TrackPropertyRead(3);
        return this.m_OptionalNum;
    }
    void SetOptionalNum(const int __Value) property
    {
        if (this.m_OptionalNum == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_OptionalNum = __Value;
        return;
    }
    TEUIModelRef<FVM_AvatarEquipmentItemInfoDetail> GetCurEquipItemInfoDetail() const property
    {
        this.TrackPropertyRead(4);
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
        this.MarkPropertyDirty(4);
        this.m_CurEquipItemInfoDetail = __Value;
        return;
    }
    EItemViewModelNumStyle GetNumStyle() const property
    {
        this.TrackPropertyRead(5);
        return this.m_NumStyle;
    }
    void SetNumStyle(const EItemViewModelNumStyle __Value) property
    {
        if (int(this.m_NumStyle) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_NumStyle = __Value;
        return;
    }
    const FItemSelected GetCustomSelectedCallback() const property
    {
        const FItemSelected __r;
        this.TrackPropertyRead(6);
        return __r;
    }
    FItemSelected GetModify_CustomSelectedCallback() property
    {
        FItemSelected __r;
        this.MarkPropertyDirty(6);
        return __r;
    }
    void SetCustomSelectedCallback(const FItemSelected &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(6);
        return;
    }
}

struct FVM_ItemIconAdapter : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    FSlateBrush m_Icon;
    UPROPERTY()
    FSlateBrush m_Grade;
    UPROPERTY()
    FText m_NumText;
    UPROPERTY()
    FText m_RichNumText;
    UPROPERTY()
    int m_IconSwitcherIndex;
    UPROPERTY()
    int m_NumSwitcherIndex;
    UPROPERTY()
    ESlateVisibility m_NumVisibility;

    FVM_ItemIconAdapter()
    {
        this.m_IconSwitcherIndex = 0;
        this.m_NumSwitcherIndex = 0;
        this.m_NumVisibility = ESlateVisibility(1);
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVM_ItemIconAdapter(const FVM_ItemIconAdapter &inout Other)
    {
        this.m_IconSwitcherIndex = 0;
        this.m_NumSwitcherIndex = 0;
        this.m_NumVisibility = ESlateVisibility(1);
        this.m_Icon = Other.m_Icon;
        this.m_Grade = Other.m_Grade;
        this.m_NumText = Other.m_NumText;
        this.m_RichNumText = Other.m_RichNumText;
        this.m_IconSwitcherIndex = int(Other.m_IconSwitcherIndex);
        this.m_NumSwitcherIndex = int(Other.m_NumSwitcherIndex);
        this.m_NumVisibility = Other.m_NumVisibility;
        return;
    }
    FVM_ItemIconAdapter opAssign(const FVM_ItemIconAdapter &inout Other)
    {
        FVM_ItemIconAdapter __r;
        this.m_Icon = Other.m_Icon;
        this.m_Grade = Other.m_Grade;
        this.m_NumText = Other.m_NumText;
        this.m_RichNumText = Other.m_RichNumText;
        this.m_IconSwitcherIndex = int(Other.m_IconSwitcherIndex);
        this.m_NumSwitcherIndex = int(Other.m_NumSwitcherIndex);
        this.m_NumVisibility = Other.m_NumVisibility;
        return __r;
    }
    void Clear()
    {
        this.SetIcon(FSlateBrush());
        this.SetGrade(FSlateBrush());
        this.SetNumText(FText());
        this.SetRichNumText(FText());
        this.SetIconSwitcherIndex(0);
        this.SetNumSwitcherIndex(0);
        this.SetNumVisibility(ESlateVisibility(1));
        return;
    }
    void SetupFromItem(const TEUIModelRef<FVM_Item> &inout InItem)
    {
        int local_75 = 0;
        int local_195;
        if (!(InItem.IsValid()) || !(GetItemConfig().IsSet()))
        {
            return;
        }
        FSlateBrush local_48;
        local_48.GetItemIcon();
        this.SetIcon(local_48);
        FSlateBrush local_188 = ::UGlobalItemSettings::Get().GetRarityConfig(EItemRarity(local_75)).IsSet() ? local_48 : FSlateBrush();
        this.SetGrade(local_188);
        FText local_192;
        local_192.GetItemNumTimesText();
        this.SetNumText(local_192);
        local_192.GetItemNumRichText();
        this.SetRichNumText(local_192);
        this.SetIconSwitcherIndex(1);
        int local_193 = HasAtLeastOne() ? 1 : 0;
        this.SetNumSwitcherIndex(local_193);
        if (GetShouldShowNum())
        {
            int local_196;
            local_196 = 4;
            local_195 = local_196;
        }
        else
        {
            int local_196;
            local_196 = 1;
            local_195 = local_196;
        }
        this.SetNumVisibility(ESlateVisibility(local_195));
        return;
    }
    void SetupFromCommonItem(const TEUIModelRef<FVM_CommonItem> &inout InCommonItem)
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
    }
    void SetupFromDisplayItem(const TEUIModelRef<FVM_DisplayItem> &inout InDisplayItem)
    {
        if (!(InDisplayItem.IsValid()))
        {
            return;
        }
        TEUIModelRef<FVM_CommonItem> local_6;
        local_6.GetCommonItemVM();
        TEUIModelRef<FVM_CommonItem> local_4;
        if (!(local_4.IsValid()))
        {
            return;
        }
        return;
    }
    void ApplyCommonItemProjection(const FVM_CommonItem &inout InCommonItem, const FSoftBrush &inout InGradeBrush)
    {
        FSoftBrush local_88 = this.ResolveDisplayBrush(InCommonItem);
        this.SetIcon(local_88.LoadBrush());
        this.SetGrade(InGradeBrush.LoadBrush());
        this.SetNumText(FText());
        this.SetRichNumText(FText());
        int local_138 = local_88.IsSet() ? 1 : 0;
        this.SetIconSwitcherIndex(local_138);
        this.SetNumSwitcherIndex(0);
        this.SetNumVisibility(ESlateVisibility(1));
        return;
    }
    FSoftBrush ResolveDisplayBrush(const FVM_CommonItem &inout InCommonItem) const
    {
        if (InCommonItem.GetCurDisplayState() == 3)
        {
            return InCommonItem.GetItemImageTemp();
        }
        if (InCommonItem.GetCurDisplayState() == 2 || (InCommonItem.GetCurDisplayState() == 1))
        {
            return FSoftBrush();
        }
        return InCommonItem.GetItemImage();
    }
    FSlateBrush GetIcon() const property
    {
        FSlateBrush __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    FSlateBrush GetModify_Icon() property
    {
        FSlateBrush __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetIcon(const FSlateBrush &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_Icon = __Value;
        return;
    }
    const FSlateBrush GetGrade() const property
    {
        const FSlateBrush __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    FSlateBrush GetModify_Grade() property
    {
        FSlateBrush __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetGrade(const FSlateBrush &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_Grade = __Value;
        return;
    }
    const FText GetNumText() const property
    {
        const FText __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    FText GetModify_NumText() property
    {
        FText __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetNumText(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_NumText = __Value;
        return;
    }
    const FText GetRichNumText() const property
    {
        const FText __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    FText GetModify_RichNumText() property
    {
        FText __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetRichNumText(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_RichNumText = __Value;
        return;
    }
    int GetIconSwitcherIndex() const property
    {
        this.TrackPropertyRead(4);
        return this.m_IconSwitcherIndex;
    }
    void SetIconSwitcherIndex(const int __Value) property
    {
        if (this.m_IconSwitcherIndex == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_IconSwitcherIndex = __Value;
        return;
    }
    int GetNumSwitcherIndex() const property
    {
        this.TrackPropertyRead(5);
        return this.m_NumSwitcherIndex;
    }
    void SetNumSwitcherIndex(const int __Value) property
    {
        if (this.m_NumSwitcherIndex == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_NumSwitcherIndex = __Value;
        return;
    }
    ESlateVisibility GetNumVisibility() const property
    {
        this.TrackPropertyRead(6);
        return this.m_NumVisibility;
    }
    void SetNumVisibility(const ESlateVisibility __Value) property
    {
        if (int(this.m_NumVisibility) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_NumVisibility = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_Item
{
    UPROPERTY()
    bool IsEquiped;
    UPROPERTY()
    FText EquiptingAvatarText;
    UPROPERTY()
    FText EquiptingAvatarTextWithoutColor;
    UPROPERTY()
    bool CanShowEquipInfoDetail;
    UPROPERTY()
    FText EquipmentLevelText;
    UPROPERTY()
    int ItemOwnInfoTipsIndex;
    UPROPERTY()
    bool CanShowItemInfoTips;
    UPROPERTY()
    FText ItemCategory;
    UPROPERTY()
    FSlateBrush ItemIcon;
    UPROPERTY()
    FText ItemOwnLimit;
    UPROPERTY()
    bool ShouldShowNum;
    UPROPERTY()
    bool ShouldShowOptionalNum;
    UPROPERTY()
    bool ShouldShowOfMark;
    UPROPERTY()
    bool ShouldShowRangeMark;
    UPROPERTY()
    FSlateColor NumTextColor;
    UPROPERTY()
    FText ItemNumRichText;
    UPROPERTY()
    FText ItemNumTimesText;
    UPROPERTY()
    FLinearColor RarityColor;
    UPROPERTY()
    FSlateBrush TipRarityImage;
    UPROPERTY()
    bool HasOwnLimit;
    UPROPERTY()
    int ItemOwnNum;
    UPROPERTY()
    bool ShouldShowItemOwnNum;
    UPROPERTY()
    FText ItemOwnNumText;
    UPROPERTY()
    bool HasBankLimit;
    UPROPERTY()
    int ItemBankOwnNum;
    UPROPERTY()
    TEUIModelRef<FVM_ItemRarity> ItemRarity;
    UPROPERTY()
    bool HasAtLeastOne;
    UPROPERTY()
    TEUIModelRef<FVM_Item> Self;


}

struct __GeneratedProperties_FVM_ItemIconAdapter
{
    UPROPERTY()
    TEUIModelRef<FVM_ItemIconAdapter> Self;

    __GeneratedProperties_FVM_ItemIconAdapter()
    {
        return;
    }
}

namespace FVM_Item
{
FVM_Item CreateFromConfig(const UObject ContextObject, const TDataObjectPtr<FItemConfig> &inout Config, const int Num = 1)
{
    FVM_Item __r;
    FM_ItemData& local_2 = FM_ItemData::Create(ContextObject);
    local_2.SetConfig(Config);
    local_2.SetNum(Num);
    TEUIModelRef<FM_ItemData> local_4 = TEUIModelRef<FM_ItemData>(local_2);
    return __r;
}
FVM_Item CreateInventoryTotal(const UObject ContextObject, const TDataObjectPtr<FItemConfig> &inout Config)
{
    FVM_Item __r;
    FMS_PlayerInventory& local_2 = FMS_PlayerInventory::Get(ContextObject);
    local_2.GetSumItem(Config);
    return __r;
}
FVM_Item& Create(const UObject ContextObject, const TEUIModelRef<FM_ItemData> &inout ItemDataModel)
{
    return FVM_Item::CreateByManager(EUIInternal::GetContextManager(ContextObject), ItemDataModel);
}
FVM_Item CreateByManager(const UEUIManagerSubsystem Manager, const TEUIModelRef<FM_ItemData> &inout ItemDataModel)
{
    FVM_Item __r;
    TEUIModelRef<FVM_Item> local_6 = TEUIModelRef<FVM_Item>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_Item::ModelId, 0, ItemDataModel));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    // body not fully recovered вЂ” stub [opcode-uncovered]
}
UScriptStruct GetModelStruct()
{
    return FVM_Item;
}
void __UpdateNum(FVM_Item &inout Model)
{
    Model.UpdateNum();
    return;
}
TDataObjectPtr<FItemConfig> __UIGetter_ItemConfig(const FVM_Item &inout Model)
{
    return Model.GetItemConfig();
}
int __UIGetter_Num(const FVM_Item &inout Model)
{
    return Model.GetNum();
}
int __UIGetter_OptionalNum(const FVM_Item &inout Model)
{
    return Model.GetOptionalNum();
}
TEUIModelRef<FVM_AvatarEquipmentItemInfoDetail> __UIGetter_CurEquipItemInfoDetail(const FVM_Item &inout Model)
{
    return Model.GetCurEquipItemInfoDetail();
}
bool __UIGetter_IsEquiped(const FVM_Item &inout Model)
{
    return Model.GetIsEquiped();
}
FText __UIGetter_EquiptingAvatarText(const FVM_Item &inout Model)
{
    return Model.GetEquiptingAvatarText();
}
FText __UIGetter_EquiptingAvatarTextWithoutColor(const FVM_Item &inout Model)
{
    return Model.GetEquiptingAvatarTextWithoutColor();
}
bool __UIGetter_CanShowEquipInfoDetail(const FVM_Item &inout Model)
{
    return Model.GetCanShowEquipInfoDetail();
}
FText __UIGetter_EquipmentLevelText(const FVM_Item &inout Model)
{
    return Model.GetEquipmentLevelText();
}
int __UIGetter_ItemOwnInfoTipsIndex(const FVM_Item &inout Model)
{
    return Model.GetItemOwnInfoTipsIndex();
}
bool __UIGetter_CanShowItemInfoTips(const FVM_Item &inout Model)
{
    return Model.CanShowItemInfoTips();
}
FText __UIGetter_ItemCategory(const FVM_Item &inout Model)
{
    return Model.GetItemCategory();
}
FSlateBrush __UIGetter_ItemIcon(const FVM_Item &inout Model)
{
    return Model.GetItemIcon();
}
FText __UIGetter_ItemOwnLimit(const FVM_Item &inout Model)
{
    return Model.GetItemOwnLimit();
}
bool __UIGetter_ShouldShowNum(const FVM_Item &inout Model)
{
    return Model.GetShouldShowNum();
}
bool __UIGetter_ShouldShowOptionalNum(const FVM_Item &inout Model)
{
    return Model.GetShouldShowOptionalNum();
}
bool __UIGetter_ShouldShowOfMark(const FVM_Item &inout Model)
{
    return Model.GetShouldShowOfMark();
}
bool __UIGetter_ShouldShowRangeMark(const FVM_Item &inout Model)
{
    return Model.GetShouldShowRangeMark();
}
FSlateColor __UIGetter_NumTextColor(const FVM_Item &inout Model)
{
    return Model.GetNumTextColor();
}
FText __UIGetter_ItemNumRichText(const FVM_Item &inout Model)
{
    return Model.GetItemNumRichText();
}
FText __UIGetter_ItemNumTimesText(const FVM_Item &inout Model)
{
    return Model.GetItemNumTimesText();
}
FLinearColor __UIGetter_RarityColor(const FVM_Item &inout Model)
{
    return Model.GetRarityColor();
}
FSlateBrush __UIGetter_TipRarityImage(const FVM_Item &inout Model)
{
    return Model.GetTipRarityImage();
}
bool __UIGetter_HasOwnLimit(const FVM_Item &inout Model)
{
    return Model.HasOwnLimit();
}
int __UIGetter_ItemOwnNum(const FVM_Item &inout Model)
{
    return Model.GetItemOwnNum();
}
bool __UIGetter_ShouldShowItemOwnNum(const FVM_Item &inout Model)
{
    return Model.ShouldShowItemOwnNum();
}
FText __UIGetter_ItemOwnNumText(const FVM_Item &inout Model)
{
    return Model.GetItemOwnNumText();
}
bool __UIGetter_HasBankLimit(const FVM_Item &inout Model)
{
    return Model.HasBankLimit();
}
int __UIGetter_ItemBankOwnNum(const FVM_Item &inout Model)
{
    return Model.GetItemBankOwnNum();
}
TEUIModelRef<FVM_ItemRarity> __UIGetter_ItemRarity(const FVM_Item &inout Model)
{
    return Model.GetItemRarity();
}
bool __UIGetter_HasAtLeastOne(const FVM_Item &inout Model)
{
    return Model.HasAtLeastOne();
}
TEUIModelRef<FVM_Item> __UIGetter_Self(const FVM_Item &inout Model)
{
    return TEUIModelRef<FVM_Item>(Model);
}
int __IndexOf_ItemDataModel()
{
    return 0;
}
int __IndexOf_ItemConfig()
{
    return 1;
}
int __IndexOf_Num()
{
    return 2;
}
int __IndexOf_OptionalNum()
{
    return 3;
}
int __IndexOf_CurEquipItemInfoDetail()
{
    return 4;
}
int __IndexOf_NumStyle()
{
    return 5;
}
int __IndexOf_CustomSelectedCallback()
{
    return 6;
}
}
namespace __GeneratedProperties_FVM_Item
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
namespace FVM_ItemIconAdapter
{
FVM_ItemIconAdapter& Create(const UObject ContextObject)
{
    return FVM_ItemIconAdapter::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_ItemIconAdapter CreateByManager(const UEUIManagerSubsystem Manager)
{
    FVM_ItemIconAdapter __r;
    TEUIModelRef<FVM_ItemIconAdapter> local_6 = TEUIModelRef<FVM_ItemIconAdapter>(EUIInternal::MakeModelWithManager(Manager, FVM_ItemIconAdapter::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "Icon";
    local_14.TypeName = "FSlateBrush";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Grade";
    local_14.TypeName = "FSlateBrush";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "NumText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "RichNumText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IconSwitcherIndex";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "NumSwitcherIndex";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "NumVisibility";
    local_14.TypeName = "ESlateVisibility";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_ItemIconAdapter>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_ItemIconAdapter;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_ItemIconAdapter;
}
FSlateBrush __UIGetter_Icon(const FVM_ItemIconAdapter &inout Model)
{
    return Model.GetIcon();
}
FSlateBrush __UIGetter_Grade(const FVM_ItemIconAdapter &inout Model)
{
    return Model.GetGrade();
}
FText __UIGetter_NumText(const FVM_ItemIconAdapter &inout Model)
{
    return Model.GetNumText();
}
FText __UIGetter_RichNumText(const FVM_ItemIconAdapter &inout Model)
{
    return Model.GetRichNumText();
}
int __UIGetter_IconSwitcherIndex(const FVM_ItemIconAdapter &inout Model)
{
    return Model.GetIconSwitcherIndex();
}
int __UIGetter_NumSwitcherIndex(const FVM_ItemIconAdapter &inout Model)
{
    return Model.GetNumSwitcherIndex();
}
ESlateVisibility __UIGetter_NumVisibility(const FVM_ItemIconAdapter &inout Model)
{
    return Model.GetNumVisibility();
}
TEUIModelRef<FVM_ItemIconAdapter> __UIGetter_Self(const FVM_ItemIconAdapter &inout Model)
{
    return TEUIModelRef<FVM_ItemIconAdapter>(Model);
}
int __IndexOf_Icon()
{
    return 0;
}
int __IndexOf_Grade()
{
    return 1;
}
int __IndexOf_NumText()
{
    return 2;
}
int __IndexOf_RichNumText()
{
    return 3;
}
int __IndexOf_IconSwitcherIndex()
{
    return 4;
}
int __IndexOf_NumSwitcherIndex()
{
    return 5;
}
int __IndexOf_NumVisibility()
{
    return 6;
}
}
namespace __GeneratedProperties_FVM_ItemIconAdapter
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
