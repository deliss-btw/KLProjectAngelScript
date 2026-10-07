
namespace FVM_EquipmentInfo
{
    const int ModelId = 0;

}
struct FVM_EquipmentInfo : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TEUIModelRef<FM_Equipment> m_Equipment;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_TraitInfo>> m_EquipmentTraits;
    UPROPERTY()
    TArray<FEUIModelRef> m_EquipmentAttributes;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_TraitInfoHover>> m_EquipmentTraitInfoHoverList;
    UPROPERTY()
    int m_PreviewMaxRandomTraitNum;
    UPROPERTY()
    bool m_bShowDescription;

    FVM_EquipmentInfo()
    {
        this.m_PreviewMaxRandomTraitNum = 0;
        this.m_bShowDescription = true;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_EquipmentInfo' by default constructor.");
        return;
    }
    FVM_EquipmentInfo(const FVM_EquipmentInfo &inout Other)
    {
        this.m_PreviewMaxRandomTraitNum = 0;
        this.m_bShowDescription = true;
        this.m_Equipment = Other.m_Equipment;
        this.m_EquipmentTraits = Other.m_EquipmentTraits;
        this.m_EquipmentAttributes = Other.m_EquipmentAttributes;
        this.m_EquipmentTraitInfoHoverList = Other.m_EquipmentTraitInfoHoverList;
        this.m_PreviewMaxRandomTraitNum = int(Other.m_PreviewMaxRandomTraitNum);
        this.m_bShowDescription = Other.m_bShowDescription;
        return;
    }
    FVM_EquipmentInfo(const TEUIModelRef<FM_Equipment> &inout InEquipment)
    {
        this.m_PreviewMaxRandomTraitNum = 0;
        this.m_bShowDescription = true;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetEquipment(InEquipment);
        return;
    }
    FVM_EquipmentInfo opAssign(const FVM_EquipmentInfo &inout Other)
    {
        FVM_EquipmentInfo __r;
        this.m_Equipment = Other.m_Equipment;
        this.m_EquipmentTraits = Other.m_EquipmentTraits;
        this.m_EquipmentAttributes = Other.m_EquipmentAttributes;
        this.m_EquipmentTraitInfoHoverList = Other.m_EquipmentTraitInfoHoverList;
        this.m_PreviewMaxRandomTraitNum = int(Other.m_PreviewMaxRandomTraitNum);
        this.m_bShowDescription = Other.m_bShowDescription;
        return __r;
    }
    void PostConstruct()
    {
        TEUIModelRef<FM_Equipment> local_2 = this.GetEquipment();
        for (auto& local_18 : GetEquipmentTraits())
        {
            this.GetModify_EquipmentTraits().Add(TEUIModelRef<FVM_TraitInfo>(::FVM_TraitInfo::Create(this.GetContext().Manager, local_18)));
            this.GetModify_EquipmentTraitInfoHoverList().Add(TEUIModelRef<FVM_TraitInfoHover>(::FVM_TraitInfoHover::Create(this.GetContext().Manager, local_18, false)));
        }
        this.SetEquipmentAttributes(this.MakeAttributeViewModels());
        return;
    }
    TDataObjectPtr<FEquipmentConfig> GetEquipmentConfig() const
    {
        TEUIModelRef<FM_Equipment> local_2 = this.GetEquipment();
        return GetEquipmentConfig();
    }
    FText GetEquipmentName() const
    {
        TDataObjectPtr<FEquipmentConfig> local_24 = this.GetEquipmentConfig();
        if (local_24)
        {
            return local_24.opArrow().ItemName;
        }
        return FText();
    }
    FText GetEquipmentDescription() const
    {
        TDataObjectPtr<FEquipmentConfig> local_24 = this.GetEquipmentConfig();
        if (local_24)
        {
            return local_24.opArrow().ItemBackgroundDescription;
        }
        return FText();
    }
    FSoftBrush GetEquipmentIcon() const
    {
        TDataObjectPtr<FEquipmentConfig> local_24 = this.GetEquipmentConfig();
        if (local_24)
        {
            return local_24.opArrow().ItemIcon;
        }
        return FSoftBrush();
    }
    FSoftBrush GetEquipmentDisplayImage() const
    {
        TDataObjectPtr<FEquipmentConfig> local_24 = this.GetEquipmentConfig();
        if (local_24)
        {
            return local_24.opArrow().EquipmentDisplayImage;
        }
        return FSoftBrush();
    }
    FSoftBrush GetEquipedByAvatarIcon() const
    {
        TEUIModelRef<FM_Equipment> local_2 = this.GetEquipment();
        TDataObjectPtr<FAvatarPrefabConfig> local_26 = GetEquiptingAvatar();
        if (local_26)
        {
            return local_26.opArrow().AvatarIcon;
        }
        return FSoftBrush();
    }
    FSoftBrush GetEquipmentTypeIcon() const
    {
        if (this.GetEquipmentConfig())
        {
            CastTo local_54;
            TDataObjectPtr<FWeaponConfig> local_78 = local_54.opCall();
            if (local_78)
            {
                EWeaponType local_103;
                local_103 = local_78.opArrow().WeaponType;
                for (auto& local_124 : ::GameModeSettings::GetGameModeSettings(this.GetContext().Manager.GetWorld()).ChangeRoleDataObjects)
                {
                    EWeaponType local_104 = local_124.opArrow().WeaponType;
                    if ((int(local_104)) == (int(local_103)))
                    {
                        return local_124.opArrow().PlayerClassIcon;
                    }
                }
            }
        }
        return FSoftBrush();
    }
    int GetEquipmentLevel() const
    {
        TDataObjectPtr<FEquipmentConfig> local_24 = this.GetEquipmentConfig();
        if (local_24)
        {
            return local_24.opArrow().Level;
        }
        return 0;
    }
    FText GetEquipmentLevelText() const
    {
        TDataObjectPtr<FEquipmentConfig> local_24 = this.GetEquipmentConfig();
        FText local_54;
        if (local_24)
        {
            local_54 = FText::AsCultureInvariant("Lv.{0}");
            return FText::Format(local_54, local_24.opArrow().Level);
        }
        return local_54;
    }
    FLinearColor GetEquipmentRarityColor() const
    {
        TDataObjectPtr<FEquipmentConfig> local_24 = this.GetEquipmentConfig();
        if (local_24)
        {
            TDataObjectPtr<FItemRarityConfig> local_78 = ::UGlobalItemSettings::Get().GetRarityConfig(EItemRarity(local_24.opArrow().Rarity));
            if (local_78)
            {
                return local_78.opArrow().DefaultColor;
            }
        }
        return FLinearColor::White;
    }
    FSoftBrush GetEquipmentRarityImage() const
    {
        TDataObjectPtr<FEquipmentConfig> local_24 = this.GetEquipmentConfig();
        if (local_24)
        {
            TDataObjectPtr<FItemRarityConfig> local_78 = ::UGlobalItemSettings::Get().GetRarityConfig(EItemRarity(local_24.opArrow().Rarity));
            if (local_78)
            {
                return local_78.opArrow().RectangleRarityImage;
            }
        }
        return FSoftBrush();
    }
    FSoftBrush GetEquipmentPopupBGRarityImage() const
    {
        TDataObjectPtr<FEquipmentConfig> local_24 = this.GetEquipmentConfig();
        if (local_24)
        {
            TDataObjectPtr<FItemRarityConfig> local_78 = ::UGlobalItemSettings::Get().GetRarityConfig(EItemRarity(local_24.opArrow().Rarity));
            if (local_78)
            {
                return local_78.opArrow().PopupBGRarityImage;
            }
        }
        return FSoftBrush();
    }
    FLinearColor GetEquipmentLevelColor() const
    {
        if (this.GetEquipmentLevel() < 5)
        {
            return FLinearColor::Green;
        }
        else
        {
            return FLinearColor::Blue;
        }
    }
    bool ShowPreview() const
    {
        return (this.GetPreviewMaxRandomTraitNum() > 0);
    }
    FText TraitPreviewText() const
    {
        return FText::Format(NSLOCTEXT("Equipment", "Equipment_RandomTraitDesc", "йљЏжњє{0}дёЄиў«еЉЁжЉЂиѓЅ"), this.GetPreviewMaxRandomTraitNum());
    }
    FText GetWeaponCategoryFullName() const
    {
        const UInventorySettings local_54;
        TDataObjectPtr<FEquipmentConfig> local_24 = this.GetEquipmentConfig();
        FText local_62;
        if (local_24)
        {
            if (int(local_24.opArrow().ItemTrunk) == 7)
            {
                FText local_68;
                GetGameplaySettings<UInventorySettings> local_56;
                local_54 = local_56;
                FGameplayTag local_64;
                local_64;
                local_54.GetCategoryDisplayName(local_68);
                local_62 = NSLOCTEXT("Equipment", "Equipment_WeaponCategoryFullName", "ж­¦е™Ёз±»ећ‹:{0}");
                return FText::Format(local_62, local_68);
            }
        }
        return local_62;
    }
    FSoftBrush GetItemSpecialBgImage() const
    {
        if (this.GetEquipmentConfig())
        {
            CastTo local_54;
            return ::ItemFeature_SpecialBg_Util::GetSpecialBgImage(local_54.opCall());
        }
        return FSoftBrush();
    }
    TArray<FEUIModelRef> MakeAttributeViewModels() const
    {
        TArrayConstIterator<FEquipmentAttributeData> local_62;
        TArray<FEUIModelRef> local_4;
        int local_144 = 0;
        TEUIModelRef<FM_Equipment> local_6 = this.GetEquipment();
        TDataObjectPtr<FEquipmentConfig> local_30 = GetEquipmentConfig();
        if (!(local_30))
        {
            return local_4;
        }
        for (; local_62.CanProceed;)
        {
            const FEquipmentAttributeData& local_70 = local_62.Proceed();
            TDataObjectPtr<FAttributeConfig> local_94 = TDataObjectPtr<FAttributeConfig>(nullptr);
            if (!(local_70.AttributeConfig.IsSet()))
            {
                local_94 = ::FAttributeConfig::GetAttributeConfigByAttribute(local_70.AttributeClass);
            }
            else
            {
                local_94 = local_70.AttributeConfig;
            }
            if ((!((local_94 == nullptr))))
            {
                FM_Attribute& local_146 = ::FM_Attribute::Create(this.GetContext().Manager, local_70.AttributeClass, EAttributeDisplayType(local_144), local_70.Value);
                local_146.SetAttributeConfig(local_94);
                TEUIModelRef<FM_Attribute> local_148 = TEUIModelRef<FM_Attribute>(local_146);
                local_4.Add(FEUIModelRef());
            }
        }
        return local_4;
    }
    TEUIModelRef<FM_Equipment> GetEquipment() const property
    {
        this.TrackPropertyRead(0);
        return this.m_Equipment;
    }
    void SetEquipment(const TEUIModelRef<FM_Equipment> &inout __Value) property
    {
        TEUIModelRef<FM_Equipment> local_2;
        local_2 = this.m_Equipment;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_Equipment = __Value;
        return;
    }
    const TArray<TEUIModelRef<FVM_TraitInfo>> GetEquipmentTraits() const property
    {
        const TArray<TEUIModelRef<FVM_TraitInfo>> __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    TArray<TEUIModelRef<FVM_TraitInfo>> GetModify_EquipmentTraits() property
    {
        TArray<TEUIModelRef<FVM_TraitInfo>> __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetEquipmentTraits(const TArray<TEUIModelRef<FVM_TraitInfo>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_EquipmentTraits = __Value;
        return;
    }
    const TArray<FEUIModelRef> GetEquipmentAttributes() const property
    {
        const TArray<FEUIModelRef> __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    TArray<FEUIModelRef> GetModify_EquipmentAttributes() property
    {
        TArray<FEUIModelRef> __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetEquipmentAttributes(const TArray<FEUIModelRef> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_EquipmentAttributes = __Value;
        return;
    }
    const TArray<TEUIModelRef<FVM_TraitInfoHover>> GetEquipmentTraitInfoHoverList() const property
    {
        const TArray<TEUIModelRef<FVM_TraitInfoHover>> __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    TArray<TEUIModelRef<FVM_TraitInfoHover>> GetModify_EquipmentTraitInfoHoverList() property
    {
        TArray<TEUIModelRef<FVM_TraitInfoHover>> __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetEquipmentTraitInfoHoverList(const TArray<TEUIModelRef<FVM_TraitInfoHover>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_EquipmentTraitInfoHoverList = __Value;
        return;
    }
    int GetPreviewMaxRandomTraitNum() const property
    {
        this.TrackPropertyRead(4);
        return this.m_PreviewMaxRandomTraitNum;
    }
    void SetPreviewMaxRandomTraitNum(const int __Value) property
    {
        if (this.m_PreviewMaxRandomTraitNum == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_PreviewMaxRandomTraitNum = __Value;
        return;
    }
    bool GetbShowDescription() const property
    {
        this.TrackPropertyRead(5);
        return this.m_bShowDescription;
    }
    void SetbShowDescription(const bool __Value) property
    {
        if (!(this.m_bShowDescription) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_bShowDescription = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_EquipmentInfo
{
    UPROPERTY()
    TDataObjectPtr<FEquipmentConfig> EquipmentConfig;
    UPROPERTY()
    FText EquipmentName;
    UPROPERTY()
    FText EquipmentDescription;
    UPROPERTY()
    FSoftBrush EquipmentIcon;
    UPROPERTY()
    FSoftBrush EquipmentDisplayImage;
    UPROPERTY()
    FSoftBrush EquipedByAvatarIcon;
    UPROPERTY()
    FSoftBrush EquipmentTypeIcon;
    UPROPERTY()
    int EquipmentLevel;
    UPROPERTY()
    FText EquipmentLevelText;
    UPROPERTY()
    FLinearColor EquipmentRarityColor;
    UPROPERTY()
    FSoftBrush EquipmentRarityImage;
    UPROPERTY()
    FSoftBrush EquipmentPopupBGRarityImage;
    UPROPERTY()
    FLinearColor EquipmentLevelColor;
    UPROPERTY()
    bool ShowPreview;
    UPROPERTY()
    FText TraitPreviewText;
    UPROPERTY()
    FText WeaponCategoryFullName;
    UPROPERTY()
    FSoftBrush ItemSpecialBgImage;
    UPROPERTY()
    TEUIModelRef<FVM_EquipmentInfo> Self;


}

namespace FVM_EquipmentInfo
{
FVM_EquipmentInfo& Create(const UObject ContextObject, const TEUIModelRef<FM_Equipment> &inout Equipment)
{
    return FVM_EquipmentInfo::CreateByManager(EUIInternal::GetContextManager(ContextObject), Equipment);
}
FVM_EquipmentInfo CreateByManager(const UEUIManagerSubsystem Manager, const TEUIModelRef<FM_Equipment> &inout Equipment)
{
    FVM_EquipmentInfo __r;
    TEUIModelRef<FVM_EquipmentInfo> local_6 = TEUIModelRef<FVM_EquipmentInfo>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_EquipmentInfo::ModelId, 0, Equipment));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "EquipmentTraits";
    local_14.TypeName = "TArray<TEUIModelRef<FVM_TraitInfo>>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "EquipmentAttributes";
    local_14.TypeName = "TArray<FEUIModelRef>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "EquipmentTraitInfoHoverList";
    local_14.TypeName = "TArray<TEUIModelRef<FVM_TraitInfoHover>>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bShowDescription";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "EquipmentConfig";
    local_14.TypeName = "TDataObjectPtr<FEquipmentConfig>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "EquipmentName";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "EquipmentDescription";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "EquipmentIcon";
    local_14.TypeName = "FSoftBrush";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "EquipmentDisplayImage";
    local_14.TypeName = "FSoftBrush";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "EquipedByAvatarIcon";
    local_14.TypeName = "FSoftBrush";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "EquipmentTypeIcon";
    local_14.TypeName = "FSoftBrush";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "EquipmentLevel";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "EquipmentLevelText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "EquipmentRarityColor";
    local_14.TypeName = "FLinearColor";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "EquipmentRarityImage";
    local_14.TypeName = "FSoftBrush";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "EquipmentPopupBGRarityImage";
    local_14.TypeName = "FSoftBrush";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "EquipmentLevelColor";
    local_14.TypeName = "FLinearColor";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ShowPreview";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "TraitPreviewText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "WeaponCategoryFullName";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ItemSpecialBgImage";
    local_14.TypeName = "FSoftBrush";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_EquipmentInfo>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_EquipmentInfo;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_EquipmentInfo;
}
TArray<TEUIModelRef<FVM_TraitInfo>> __UIGetter_EquipmentTraits(const FVM_EquipmentInfo &inout Model)
{
    return Model.GetEquipmentTraits();
}
TArray<FEUIModelRef> __UIGetter_EquipmentAttributes(const FVM_EquipmentInfo &inout Model)
{
    return Model.GetEquipmentAttributes();
}
TArray<TEUIModelRef<FVM_TraitInfoHover>> __UIGetter_EquipmentTraitInfoHoverList(const FVM_EquipmentInfo &inout Model)
{
    return Model.GetEquipmentTraitInfoHoverList();
}
bool __UIGetter_bShowDescription(const FVM_EquipmentInfo &inout Model)
{
    return Model.GetbShowDescription();
}
TDataObjectPtr<FEquipmentConfig> __UIGetter_EquipmentConfig(const FVM_EquipmentInfo &inout Model)
{
    return Model.GetEquipmentConfig();
}
FText __UIGetter_EquipmentName(const FVM_EquipmentInfo &inout Model)
{
    return Model.GetEquipmentName();
}
FText __UIGetter_EquipmentDescription(const FVM_EquipmentInfo &inout Model)
{
    return Model.GetEquipmentDescription();
}
FSoftBrush __UIGetter_EquipmentIcon(const FVM_EquipmentInfo &inout Model)
{
    return Model.GetEquipmentIcon();
}
FSoftBrush __UIGetter_EquipmentDisplayImage(const FVM_EquipmentInfo &inout Model)
{
    return Model.GetEquipmentDisplayImage();
}
FSoftBrush __UIGetter_EquipedByAvatarIcon(const FVM_EquipmentInfo &inout Model)
{
    return Model.GetEquipedByAvatarIcon();
}
FSoftBrush __UIGetter_EquipmentTypeIcon(const FVM_EquipmentInfo &inout Model)
{
    return Model.GetEquipmentTypeIcon();
}
int __UIGetter_EquipmentLevel(const FVM_EquipmentInfo &inout Model)
{
    return Model.GetEquipmentLevel();
}
FText __UIGetter_EquipmentLevelText(const FVM_EquipmentInfo &inout Model)
{
    return Model.GetEquipmentLevelText();
}
FLinearColor __UIGetter_EquipmentRarityColor(const FVM_EquipmentInfo &inout Model)
{
    return Model.GetEquipmentRarityColor();
}
FSoftBrush __UIGetter_EquipmentRarityImage(const FVM_EquipmentInfo &inout Model)
{
    return Model.GetEquipmentRarityImage();
}
FSoftBrush __UIGetter_EquipmentPopupBGRarityImage(const FVM_EquipmentInfo &inout Model)
{
    return Model.GetEquipmentPopupBGRarityImage();
}
FLinearColor __UIGetter_EquipmentLevelColor(const FVM_EquipmentInfo &inout Model)
{
    return Model.GetEquipmentLevelColor();
}
bool __UIGetter_ShowPreview(const FVM_EquipmentInfo &inout Model)
{
    return Model.ShowPreview();
}
FText __UIGetter_TraitPreviewText(const FVM_EquipmentInfo &inout Model)
{
    return Model.TraitPreviewText();
}
FText __UIGetter_WeaponCategoryFullName(const FVM_EquipmentInfo &inout Model)
{
    return Model.GetWeaponCategoryFullName();
}
FSoftBrush __UIGetter_ItemSpecialBgImage(const FVM_EquipmentInfo &inout Model)
{
    return Model.GetItemSpecialBgImage();
}
TEUIModelRef<FVM_EquipmentInfo> __UIGetter_Self(const FVM_EquipmentInfo &inout Model)
{
    return TEUIModelRef<FVM_EquipmentInfo>(Model);
}
int __IndexOf_Equipment()
{
    return 0;
}
int __IndexOf_EquipmentTraits()
{
    return 1;
}
int __IndexOf_EquipmentAttributes()
{
    return 2;
}
int __IndexOf_EquipmentTraitInfoHoverList()
{
    return 3;
}
int __IndexOf_PreviewMaxRandomTraitNum()
{
    return 4;
}
int __IndexOf_bShowDescription()
{
    return 5;
}
}
namespace __GeneratedProperties_FVM_EquipmentInfo
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
