
namespace FVM_TalentUpgradeInfo
{
    const int ModelId = 0;

}
struct FVM_TalentUpgradeInfo : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TEUIModelWeakRef<FM_ForgeNode> m_Node;
    UPROPERTY()
    TEUIModelRef<FVM_ForgeWeaponItemMaterial> m_ItemMaterial;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_ForgeWeaponItemUnlockCondItem>> m_CurrentWeaponItemUnlockCondList;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_ForgeWeaponItemAttribute>> m_CurrentAttributeList;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_ForgeWeaponItemPassiveSkill>> m_CurrentTraitList;

    FVM_TalentUpgradeInfo()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_TalentUpgradeInfo' by default constructor.");
        return;
    }
    FVM_TalentUpgradeInfo(const FVM_TalentUpgradeInfo &inout Other)
    {
        this.m_Node = Other.m_Node;
        this.m_ItemMaterial = Other.m_ItemMaterial;
        this.m_CurrentWeaponItemUnlockCondList = Other.m_CurrentWeaponItemUnlockCondList;
        this.m_CurrentAttributeList = Other.m_CurrentAttributeList;
        this.m_CurrentTraitList = Other.m_CurrentTraitList;
        return;
    }
    FVM_TalentUpgradeInfo(const TEUIModelWeakRef<FM_ForgeNode> &inout InNode)
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetNode(InNode);
        return;
    }
    FVM_TalentUpgradeInfo& opAssign(const FVM_TalentUpgradeInfo &inout Other)
    {
        this.m_Node = Other.m_Node;
        this.m_ItemMaterial = Other.m_ItemMaterial;
        this.m_CurrentWeaponItemUnlockCondList = Other.m_CurrentWeaponItemUnlockCondList;
        this.m_CurrentAttributeList = Other.m_CurrentAttributeList;
        return Other.m_CurrentTraitList;
    }
    void PostConstruct()
    {
        FDataObjectPtr local_130;
        FText local_236;
        int local_238 = 0;
        int local_328 = 0;
        if (!(this.GetNode().IsValid()))
        {
            return;
        }
        TArray<TEUIModelRef<FVM_ForgeWeaponItemMaterialItem>> local_34;
        TArray<FItemParamConfig> local_38;
        TEUIModelWeakRef<FM_ForgeNode> local_2 = this.GetNode();
        if (int(GetStateType()) == 1)
        {
            TEUIModelWeakRef<FM_ForgeNode> local_2_2 = this.GetNode();
            local_38 = GetConfig().Cost;
        }
        else
        {
            TEUIModelWeakRef<FM_ForgeNode> local_2_3 = this.GetNode();
            if (int(GetStateType()) == 0)
            {
                TEUIModelWeakRef<FM_ForgeNode> local_2_4 = this.GetNode();
                if (GetConfig().GetCraft())
                {
                    TEUIModelWeakRef<FM_ForgeNode> local_2_5 = this.GetNode();
                }
            }
        }
        for (auto& local_56 : local_38)
        {
            TDataObjectPtr<FItemConfig> local_82;
            local_82 = local_56.Item;
            UGlobalItemSettings local_58 = ::UGlobalItemSettings::Get();
            local_130;
            if ((local_82 == local_130))
            {
                continue;
            }
            if (local_56.Item)
            {
                ::FMS_PlayerInventory::Get(this.GetContext().Manager).GetSumItem(local_56.Item);
                int local_135 = int(local_56.Count);
                FVM_ForgeWeaponItemMaterialItem local_138;
                local_34.Add(TEUIModelRef<FVM_ForgeWeaponItemMaterialItem>(local_138));
            }
        }
        bool local_3 = this.GetIsUnlock();
        this.SetItemMaterial(TEUIModelRef<FVM_ForgeWeaponItemMaterial>());
        TArray<TDataObjectPtr<FConditionConfig>> local_148;
        TEUIModelWeakRef<FM_ForgeNode> local_2_6 = this.GetNode();
        if (int(GetStateType()) == 2)
        {
            TEUIModelWeakRef<FM_ForgeNode> local_2_7 = this.GetNode();
            local_148 = GetConfig().GetUnlockCondition();
        }
        else
        {
            TEUIModelWeakRef<FM_ForgeNode> local_2_8 = this.GetNode();
            if (int(GetStateType()) == 3)
            {
                TEUIModelWeakRef<FM_ForgeNode> local_2_9 = this.GetNode();
                if (::FMS_Forge::Get(this.GetContext().Manager).GetTree(GetTreeId()).IsValid())
                {
                    local_148 = GetConfig().GetUnlockCondition();
                }
            }
        }
        int local_153 = 0;
        for (; local_153 < local_148.Num(); ++local_153)
        {
            TDataObjectPtr<FConditionConfig> local_178 = local_148[local_153];
            if (local_178)
            {
                FVM_ForgeWeaponItemUnlockCondItem local_204;
                this.GetModify_CurrentWeaponItemUnlockCondList().Add(TEUIModelRef<FVM_ForgeWeaponItemUnlockCondItem>(local_204));
            }
        }
        TEUIModelWeakRef<FM_ForgeNode> local_2_10 = this.GetNode();
        TEUIModelRef<FVM_EquipmentInfo> local_208;
        local_208.GetEquipmentInfo();
        if (local_208)
        {
            for (auto& local_224 : GetEquipmentAttributes())
            {
                TEUIModelRef<FVM_AttributeDisplay> local_226 = TEUIModelRef<FVM_AttributeDisplay>(local_224);
                FText local_232;
                local_232.GetAttributeValue();
                local_236.GetAttributeName();
                this.GetModify_CurrentAttributeList().Add(TEUIModelRef<FVM_ForgeWeaponItemAttribute>(local_238));
            }
            for (auto& local_254 : GetEquipmentTraits())
            {
                local_254;
                local_236.GetTraitLevelText();
                TDataObjectPtr<FTraitConfig> local_278;
                local_278.GetTraitConfig();
                FSoftBrush local_324;
                local_324.GetTraitIcon();
                TEUIModelRef<FVM_ForgeWeaponItemAttribute> local_240 = TEUIModelRef<FVM_ForgeWeaponItemAttribute>(local_238);
                TEUIModelRef<FM_Trait> local_326;
                local_326.GetTrait();
                this.GetModify_CurrentTraitList().Add(TEUIModelRef<FVM_ForgeWeaponItemPassiveSkill>(local_328));
            }
        }
        return;
    }
    TDataObjectPtr<FEquipmentConfig> GetEquipmentConfig() const
    {
        if (this.GetNode().IsValid())
        {
            TEUIModelRef<FVM_EquipmentInfo> local_6;
            TEUIModelWeakRef<FM_ForgeNode> local_2 = this.GetNode();
            local_6.GetEquipmentInfo();
            if (local_6)
            {
                TDataObjectPtr<FEquipmentConfig> local_32;
                local_32.GetEquipmentConfig();
                return local_32;
            }
        }
        return TDataObjectPtr<FEquipmentConfig>(nullptr);
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
    FText GetRandomTraitText() const
    {
        int local_50 = 0;
        FText local_54;
        if (this.GetEquipmentConfig())
        {
            local_54 = NSLOCTEXT("RandomTraitText", "йљЏжњє{0}дёЄиў«еЉЁжЉЂиѓЅ");
            return FText::Format(local_54, local_50);
        }
        return local_54;
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
    FSoftBrush GetWeaponPreivewImage() const
    {
        FSoftBrush __return;
        if (this.GetEquipmentConfig())
        {
        }
        else
        {
            __return = FSoftBrush();
        }
        return __return;
    }
    bool GetIsUnlock() const
    {
        bool local_3 = !(this.GetNode().IsValid());
        if (local_3)
        {
            local_3 = true;
        }
        else
        {
            TEUIModelWeakRef<FM_ForgeNode> local_2 = this.GetNode();
            local_3 = (int(GetStateType()) == 1);
        }
        return local_3;
    }
    FText GetLockDisplayText() const
    {
        if (this.GetNode().IsValid())
        {
            TEUIModelWeakRef<FM_ForgeNode> local_2 = this.GetNode();
            if ((int(GetStateType())) == 3)
            {
                return NSLOCTEXT("HideForgeDisplayText", "жљ‚жњЄи§Јй”ЃиЇҐзі»е€—ж­¦е™Ё");
            }
            TEUIModelWeakRef<FM_ForgeNode> local_2_2 = this.GetNode();
            if ((int(GetStateType())) == 2)
            {
                return NSLOCTEXT("LockForgeDisplayText", "жљ‚жњЄи§Јй”Ѓй…Ќж–№");
            }
        }
        return FText();
    }
    TEUIModelWeakRef<FM_ForgeNode> GetNode() const property
    {
        this.TrackPropertyRead(0);
        return this.m_Node;
    }
    void SetNode(const TEUIModelWeakRef<FM_ForgeNode> &inout __Value) property
    {
        TEUIModelWeakRef<FM_ForgeNode> local_2;
        local_2 = this.m_Node;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_Node = __Value;
        return;
    }
    TEUIModelRef<FVM_ForgeWeaponItemMaterial> GetItemMaterial() const property
    {
        this.TrackPropertyRead(1);
        return this.m_ItemMaterial;
    }
    void SetItemMaterial(const TEUIModelRef<FVM_ForgeWeaponItemMaterial> &inout __Value) property
    {
        TEUIModelRef<FVM_ForgeWeaponItemMaterial> local_2;
        local_2 = this.m_ItemMaterial;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_ItemMaterial = __Value;
        return;
    }
    const TArray<TEUIModelRef<FVM_ForgeWeaponItemUnlockCondItem>> GetCurrentWeaponItemUnlockCondList() const property
    {
        const TArray<TEUIModelRef<FVM_ForgeWeaponItemUnlockCondItem>> __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    TArray<TEUIModelRef<FVM_ForgeWeaponItemUnlockCondItem>> GetModify_CurrentWeaponItemUnlockCondList() property
    {
        TArray<TEUIModelRef<FVM_ForgeWeaponItemUnlockCondItem>> __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetCurrentWeaponItemUnlockCondList(const TArray<TEUIModelRef<FVM_ForgeWeaponItemUnlockCondItem>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_CurrentWeaponItemUnlockCondList = __Value;
        return;
    }
    const TArray<TEUIModelRef<FVM_ForgeWeaponItemAttribute>> GetCurrentAttributeList() const property
    {
        const TArray<TEUIModelRef<FVM_ForgeWeaponItemAttribute>> __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    TArray<TEUIModelRef<FVM_ForgeWeaponItemAttribute>> GetModify_CurrentAttributeList() property
    {
        TArray<TEUIModelRef<FVM_ForgeWeaponItemAttribute>> __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetCurrentAttributeList(const TArray<TEUIModelRef<FVM_ForgeWeaponItemAttribute>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_CurrentAttributeList = __Value;
        return;
    }
    const TArray<TEUIModelRef<FVM_ForgeWeaponItemPassiveSkill>> GetCurrentTraitList() const property
    {
        const TArray<TEUIModelRef<FVM_ForgeWeaponItemPassiveSkill>> __r;
        this.TrackPropertyRead(4);
        return __r;
    }
    TArray<TEUIModelRef<FVM_ForgeWeaponItemPassiveSkill>> GetModify_CurrentTraitList() property
    {
        TArray<TEUIModelRef<FVM_ForgeWeaponItemPassiveSkill>> __r;
        this.MarkPropertyDirty(4);
        return __r;
    }
    void SetCurrentTraitList(const TArray<TEUIModelRef<FVM_ForgeWeaponItemPassiveSkill>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_CurrentTraitList = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_TalentUpgradeInfo
{
    UPROPERTY()
    FText EquipmentName;
    UPROPERTY()
    FText EquipmentLevelText;
    UPROPERTY()
    FText RandomTraitText;
    UPROPERTY()
    FText EquipmentDescription;
    UPROPERTY()
    FSoftBrush WeaponPreivewImage;
    UPROPERTY()
    bool IsUnlock;
    UPROPERTY()
    FText LockDisplayText;
    UPROPERTY()
    TEUIModelRef<FVM_TalentUpgradeInfo> Self;


}

namespace FVM_TalentUpgradeInfo
{
FVM_TalentUpgradeInfo& Create(const UObject ContextObject, const TEUIModelWeakRef<FM_ForgeNode> &inout Node)
{
    return FVM_TalentUpgradeInfo::CreateByManager(EUIInternal::GetContextManager(ContextObject), Node);
}
FVM_TalentUpgradeInfo CreateByManager(const UEUIManagerSubsystem Manager, const TEUIModelWeakRef<FM_ForgeNode> &inout Node)
{
    FVM_TalentUpgradeInfo __r;
    TEUIModelRef<FVM_TalentUpgradeInfo> local_6 = TEUIModelRef<FVM_TalentUpgradeInfo>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_TalentUpgradeInfo::ModelId, 0, Node));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "ItemMaterial";
    local_14.TypeName = "TEUIModelRef<FVM_ForgeWeaponItemMaterial>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CurrentWeaponItemUnlockCondList";
    local_14.TypeName = "TArray<TEUIModelRef<FVM_ForgeWeaponItemUnlockCondItem>>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CurrentAttributeList";
    local_14.TypeName = "TArray<TEUIModelRef<FVM_ForgeWeaponItemAttribute>>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CurrentTraitList";
    local_14.TypeName = "TArray<TEUIModelRef<FVM_ForgeWeaponItemPassiveSkill>>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "EquipmentName";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "EquipmentLevelText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "RandomTraitText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "EquipmentDescription";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "WeaponPreivewImage";
    local_14.TypeName = "FSoftBrush";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IsUnlock";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "LockDisplayText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_TalentUpgradeInfo>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_TalentUpgradeInfo;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_TalentUpgradeInfo;
}
TEUIModelRef<FVM_ForgeWeaponItemMaterial> __UIGetter_ItemMaterial(const FVM_TalentUpgradeInfo &inout Model)
{
    return Model.GetItemMaterial();
}
TArray<TEUIModelRef<FVM_ForgeWeaponItemUnlockCondItem>> __UIGetter_CurrentWeaponItemUnlockCondList(const FVM_TalentUpgradeInfo &inout Model)
{
    return Model.GetCurrentWeaponItemUnlockCondList();
}
TArray<TEUIModelRef<FVM_ForgeWeaponItemAttribute>> __UIGetter_CurrentAttributeList(const FVM_TalentUpgradeInfo &inout Model)
{
    return Model.GetCurrentAttributeList();
}
TArray<TEUIModelRef<FVM_ForgeWeaponItemPassiveSkill>> __UIGetter_CurrentTraitList(const FVM_TalentUpgradeInfo &inout Model)
{
    return Model.GetCurrentTraitList();
}
FText __UIGetter_EquipmentName(const FVM_TalentUpgradeInfo &inout Model)
{
    return Model.GetEquipmentName();
}
FText __UIGetter_EquipmentLevelText(const FVM_TalentUpgradeInfo &inout Model)
{
    return Model.GetEquipmentLevelText();
}
FText __UIGetter_RandomTraitText(const FVM_TalentUpgradeInfo &inout Model)
{
    return Model.GetRandomTraitText();
}
FText __UIGetter_EquipmentDescription(const FVM_TalentUpgradeInfo &inout Model)
{
    return Model.GetEquipmentDescription();
}
FSoftBrush __UIGetter_WeaponPreivewImage(const FVM_TalentUpgradeInfo &inout Model)
{
    return Model.GetWeaponPreivewImage();
}
bool __UIGetter_IsUnlock(const FVM_TalentUpgradeInfo &inout Model)
{
    return Model.GetIsUnlock();
}
FText __UIGetter_LockDisplayText(const FVM_TalentUpgradeInfo &inout Model)
{
    return Model.GetLockDisplayText();
}
TEUIModelRef<FVM_TalentUpgradeInfo> __UIGetter_Self(const FVM_TalentUpgradeInfo &inout Model)
{
    return TEUIModelRef<FVM_TalentUpgradeInfo>(Model);
}
int __IndexOf_Node()
{
    return 0;
}
int __IndexOf_ItemMaterial()
{
    return 1;
}
int __IndexOf_CurrentWeaponItemUnlockCondList()
{
    return 2;
}
int __IndexOf_CurrentAttributeList()
{
    return 3;
}
int __IndexOf_CurrentTraitList()
{
    return 4;
}
}
namespace __GeneratedProperties_FVM_TalentUpgradeInfo
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
