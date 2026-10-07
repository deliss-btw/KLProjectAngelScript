
const int COMPARE_STATE_EQUAL = 0;
const int COMPARE_STATE_BETTER = 1;
const int COMPARE_STATE_WORSE = 2;
namespace FVM_AvatarEquipmentCompareItem
{
    const int ModelId = 0;

}
struct FVM_AvatarEquipmentCompareItem : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TEUIModelRef<FM_Trait> m_BaseTrait;
    UPROPERTY()
    TEUIModelRef<FVM_TraitInfoIcon> m_BaseTraitInfoIcon;
    UPROPERTY()
    FText m_BaseTraitName;
    UPROPERTY()
    FText m_BaseTraitLevelText;
    UPROPERTY()
    FText m_CompareTraitLevelText;
    UPROPERTY()
    int m_CompareResultStateIndex;

    FVM_AvatarEquipmentCompareItem()
    {
        this.m_CompareResultStateIndex = 0;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_AvatarEquipmentCompareItem' by default constructor.");
        return;
    }
    FVM_AvatarEquipmentCompareItem(const FVM_AvatarEquipmentCompareItem &inout Other)
    {
        this.m_CompareResultStateIndex = 0;
        this.m_BaseTrait = Other.m_BaseTrait;
        this.m_BaseTraitInfoIcon = Other.m_BaseTraitInfoIcon;
        this.m_BaseTraitName = Other.m_BaseTraitName;
        this.m_BaseTraitLevelText = Other.m_BaseTraitLevelText;
        this.m_CompareTraitLevelText = Other.m_CompareTraitLevelText;
        this.m_CompareResultStateIndex = int(Other.m_CompareResultStateIndex);
        return;
    }
    FVM_AvatarEquipmentCompareItem(const TEUIModelRef<FM_Trait> &inout InBaseTrait)
    {
        this.m_CompareResultStateIndex = 0;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetBaseTrait(InBaseTrait);
        return;
    }
    FVM_AvatarEquipmentCompareItem opAssign(const FVM_AvatarEquipmentCompareItem &inout Other)
    {
        FVM_AvatarEquipmentCompareItem __r;
        this.m_BaseTrait = Other.m_BaseTrait;
        this.m_BaseTraitInfoIcon = Other.m_BaseTraitInfoIcon;
        this.m_BaseTraitName = Other.m_BaseTraitName;
        this.m_BaseTraitLevelText = Other.m_BaseTraitLevelText;
        this.m_CompareTraitLevelText = Other.m_CompareTraitLevelText;
        this.m_CompareResultStateIndex = int(Other.m_CompareResultStateIndex);
        return __r;
    }
    void PostConstruct()
    {
        int local_6 = 0;
        this.SetBaseTraitInfoIcon(TEUIModelRef<FVM_TraitInfoIcon>(::FVM_TraitInfoIcon::Create(this.GetContext().Manager, this.GetBaseTrait())));
        TEUIModelRef<FM_Trait> local_2 = this.GetBaseTrait();
        TEUIModelRef<FM_Trait> local_2_2 = this.GetBaseTrait();
        TEUIModelRef<FM_Trait> local_8 = this.GetBaseTrait();
        this.SetBaseTraitLevelText(FText::Format(FText::AsCultureInvariant("Lv.{0}"), FMath::Min(GetTraitLevel(), local_6)));
        return;
    }
    void SetCompareTrait(const int InCompareLevel)
    {
        int local_5 = 0;
        TEUIModelRef<FM_Trait> local_4 = this.GetBaseTrait();
        int local_6 = FMath::Min(FMath::Max(InCompareLevel, 0), local_5);
        this.SetCompareTraitLevelText(FText::Format(FText::AsCultureInvariant("Lv.{0}"), local_6));
        TEUIModelRef<FM_Trait> local_4_2 = this.GetBaseTrait();
        TEUIModelRef<FM_Trait> local_20 = this.GetBaseTrait();
        int local_1 = FMath::Min(GetTraitLevel(), local_5);
        if (local_6 > local_1)
        {
            this.SetCompareResultStateIndex(1);
            return;
        }
        if (local_6 < local_1)
        {
            this.SetCompareResultStateIndex(2);
            return;
        }
        this.SetCompareResultStateIndex(0);
        return;
    }
    TEUIModelRef<FM_Trait> GetBaseTrait() const property
    {
        this.TrackPropertyRead(0);
        return this.m_BaseTrait;
    }
    void SetBaseTrait(const TEUIModelRef<FM_Trait> &inout __Value) property
    {
        TEUIModelRef<FM_Trait> local_2;
        local_2 = this.m_BaseTrait;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_BaseTrait = __Value;
        return;
    }
    TEUIModelRef<FVM_TraitInfoIcon> GetBaseTraitInfoIcon() const property
    {
        this.TrackPropertyRead(1);
        return this.m_BaseTraitInfoIcon;
    }
    void SetBaseTraitInfoIcon(const TEUIModelRef<FVM_TraitInfoIcon> &inout __Value) property
    {
        TEUIModelRef<FVM_TraitInfoIcon> local_2;
        local_2 = this.m_BaseTraitInfoIcon;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_BaseTraitInfoIcon = __Value;
        return;
    }
    const FText GetBaseTraitName() const property
    {
        const FText __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    FText GetModify_BaseTraitName() property
    {
        FText __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetBaseTraitName(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_BaseTraitName = __Value;
        return;
    }
    const FText GetBaseTraitLevelText() const property
    {
        const FText __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    FText GetModify_BaseTraitLevelText() property
    {
        FText __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetBaseTraitLevelText(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_BaseTraitLevelText = __Value;
        return;
    }
    const FText GetCompareTraitLevelText() const property
    {
        const FText __r;
        this.TrackPropertyRead(4);
        return __r;
    }
    FText GetModify_CompareTraitLevelText() property
    {
        FText __r;
        this.MarkPropertyDirty(4);
        return __r;
    }
    void SetCompareTraitLevelText(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_CompareTraitLevelText = __Value;
        return;
    }
    int GetCompareResultStateIndex() const property
    {
        this.TrackPropertyRead(5);
        return this.m_CompareResultStateIndex;
    }
    void SetCompareResultStateIndex(const int __Value) property
    {
        if (this.m_CompareResultStateIndex == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_CompareResultStateIndex = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_AvatarEquipmentCompareItem
{
    UPROPERTY()
    TEUIModelRef<FVM_AvatarEquipmentCompareItem> Self;

    __GeneratedProperties_FVM_AvatarEquipmentCompareItem()
    {
        return;
    }
}

namespace FVM_AvatarEquipmentCompareItem
{
FVM_AvatarEquipmentCompareItem& Create(const UObject ContextObject, const TEUIModelRef<FM_Trait> &inout BaseTrait)
{
    return FVM_AvatarEquipmentCompareItem::CreateByManager(EUIInternal::GetContextManager(ContextObject), BaseTrait);
}
FVM_AvatarEquipmentCompareItem CreateByManager(const UEUIManagerSubsystem Manager, const TEUIModelRef<FM_Trait> &inout BaseTrait)
{
    FVM_AvatarEquipmentCompareItem __r;
    TEUIModelRef<FVM_AvatarEquipmentCompareItem> local_6 = TEUIModelRef<FVM_AvatarEquipmentCompareItem>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_AvatarEquipmentCompareItem::ModelId, 0, BaseTrait));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "BaseTraitInfoIcon";
    local_14.TypeName = "TEUIModelRef<FVM_TraitInfoIcon>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "BaseTraitName";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "BaseTraitLevelText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CompareTraitLevelText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CompareResultStateIndex";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_AvatarEquipmentCompareItem>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_AvatarEquipmentCompareItem;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_AvatarEquipmentCompareItem;
}
TEUIModelRef<FVM_TraitInfoIcon> __UIGetter_BaseTraitInfoIcon(const FVM_AvatarEquipmentCompareItem &inout Model)
{
    return Model.GetBaseTraitInfoIcon();
}
FText __UIGetter_BaseTraitName(const FVM_AvatarEquipmentCompareItem &inout Model)
{
    return Model.GetBaseTraitName();
}
FText __UIGetter_BaseTraitLevelText(const FVM_AvatarEquipmentCompareItem &inout Model)
{
    return Model.GetBaseTraitLevelText();
}
FText __UIGetter_CompareTraitLevelText(const FVM_AvatarEquipmentCompareItem &inout Model)
{
    return Model.GetCompareTraitLevelText();
}
int __UIGetter_CompareResultStateIndex(const FVM_AvatarEquipmentCompareItem &inout Model)
{
    return Model.GetCompareResultStateIndex();
}
TEUIModelRef<FVM_AvatarEquipmentCompareItem> __UIGetter_Self(const FVM_AvatarEquipmentCompareItem &inout Model)
{
    return TEUIModelRef<FVM_AvatarEquipmentCompareItem>(Model);
}
int __IndexOf_BaseTrait()
{
    return 0;
}
int __IndexOf_BaseTraitInfoIcon()
{
    return 1;
}
int __IndexOf_BaseTraitName()
{
    return 2;
}
int __IndexOf_BaseTraitLevelText()
{
    return 3;
}
int __IndexOf_CompareTraitLevelText()
{
    return 4;
}
int __IndexOf_CompareResultStateIndex()
{
    return 5;
}
}
namespace __GeneratedProperties_FVM_AvatarEquipmentCompareItem
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
