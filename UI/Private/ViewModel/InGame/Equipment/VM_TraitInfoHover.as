
namespace FVM_TraitInfoHover
{
    const int ModelId = 0;

}
struct FVM_TraitInfoHover : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TEUIModelRef<FM_Trait> m_Trait;
    UPROPERTY()
    bool m_bForbidHover;
    UPROPERTY()
    TEUIModelRef<FVM_TraitInfoIcon> m_TraitInfoIcon;
    UPROPERTY()
    TEUIModelRef<FVM_AvatarEquipmentTraitHoverTips> m_TraitHoverTips;

    FVM_TraitInfoHover()
    {
        this.m_bForbidHover = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_TraitInfoHover' by default constructor.");
        return;
    }
    FVM_TraitInfoHover(const FVM_TraitInfoHover &inout Other)
    {
        this.m_bForbidHover = false;
        this.m_Trait = Other.m_Trait;
        this.m_bForbidHover = Other.m_bForbidHover;
        this.m_TraitInfoIcon = Other.m_TraitInfoIcon;
        this.m_TraitHoverTips = Other.m_TraitHoverTips;
        return;
    }
    FVM_TraitInfoHover(const TEUIModelRef<FM_Trait> &inout InTrait, const bool InbForbidHover)
    {
        this.m_bForbidHover = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetTrait(InTrait);
        this.SetbForbidHover(InbForbidHover);
        return;
    }
    FVM_TraitInfoHover& opAssign(const FVM_TraitInfoHover &inout Other)
    {
        this.m_Trait = Other.m_Trait;
        this.m_bForbidHover = Other.m_bForbidHover;
        this.m_TraitInfoIcon = Other.m_TraitInfoIcon;
        return Other.m_TraitHoverTips;
    }
    void PostConstruct()
    {
        this.SetTraitInfoIcon(TEUIModelRef<FVM_TraitInfoIcon>(::FVM_TraitInfoIcon::Create(this.GetContext().Manager, this.GetTrait())));
        if (!(this.GetbForbidHover()))
        {
            this.SetTraitHoverTips(TEUIModelRef<FVM_AvatarEquipmentTraitHoverTips>(::FVM_AvatarEquipmentTraitHoverTips::Create(this.GetContext().Manager, this.GetTrait())));
        }
        return;
    }
    TDataObjectPtr<FTraitConfig> GetTraitConfig() const
    {
        TEUIModelRef<FM_Trait> local_2 = this.GetTrait();
        return GetTraitConfig();
    }
    int GetTraitLevel() const
    {
        TEUIModelRef<FM_Trait> local_2 = this.GetTrait();
        return GetTraitLevel();
    }
    int GetTraitMaxLevel() const
    {
        return ::NumericUtils::AsInt32(this.GetTraitConfig().opArrow().LevelLimit);
    }
    bool IsTraitMaxLevel() const
    {
        return (this.GetTraitLevel() >= this.GetTraitMaxLevel());
    }
    FText GetTraitMaxLevelText() const
    {
        if (this.GetTraitLevel() > this.GetTraitMaxLevel())
        {
            return NSLOCTEXT("TraitLevelOutOfLimit", "жєўе‡є");
        }
        if (this.GetTraitLevel() == this.GetTraitMaxLevel())
        {
            return NSLOCTEXT("TraitLevelEqualLimit", "MAX");
        }
        return FText();
    }
    FText GetTraitLevelText() const
    {
        return FText::Format(FText::AsCultureInvariant("Lv.{0}"), this.GetTraitLevel());
    }
    FText GetTraitName() const
    {
        // body not fully recovered вЂ” stub [no-return]
        FText __r; return __r;
    }
    FEUIModelContainer GetTraitDetailListModel() const
    {
        if (this.GetbForbidHover())
        {
            return FEUIModelContainer();
        }
        TEUIModelRef<FVM_AvatarEquipmentTraitHoverTips> local_18 = this.GetTraitHoverTips();
        return FEUIModelContainer();
    }
    TEUIModelRef<FM_Trait> GetTrait() const property
    {
        this.TrackPropertyRead(0);
        return this.m_Trait;
    }
    void SetTrait(const TEUIModelRef<FM_Trait> &inout __Value) property
    {
        TEUIModelRef<FM_Trait> local_2;
        local_2 = this.m_Trait;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_Trait = __Value;
        return;
    }
    bool GetbForbidHover() const property
    {
        this.TrackPropertyRead(1);
        return this.m_bForbidHover;
    }
    void SetbForbidHover(const bool __Value) property
    {
        if (!(this.m_bForbidHover) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_bForbidHover = __Value;
        return;
    }
    TEUIModelRef<FVM_TraitInfoIcon> GetTraitInfoIcon() const property
    {
        this.TrackPropertyRead(2);
        return this.m_TraitInfoIcon;
    }
    void SetTraitInfoIcon(const TEUIModelRef<FVM_TraitInfoIcon> &inout __Value) property
    {
        TEUIModelRef<FVM_TraitInfoIcon> local_2;
        local_2 = this.m_TraitInfoIcon;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_TraitInfoIcon = __Value;
        return;
    }
    TEUIModelRef<FVM_AvatarEquipmentTraitHoverTips> GetTraitHoverTips() const property
    {
        this.TrackPropertyRead(3);
        return this.m_TraitHoverTips;
    }
    void SetTraitHoverTips(const TEUIModelRef<FVM_AvatarEquipmentTraitHoverTips> &inout __Value) property
    {
        TEUIModelRef<FVM_AvatarEquipmentTraitHoverTips> local_2;
        local_2 = this.m_TraitHoverTips;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_TraitHoverTips = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_TraitInfoHover
{
    UPROPERTY()
    bool IsTraitMaxLevel;
    UPROPERTY()
    FText TraitMaxLevelText;
    UPROPERTY()
    FText TraitLevelText;
    UPROPERTY()
    FText TraitName;
    UPROPERTY()
    FEUIModelContainer TraitDetailListModel;
    UPROPERTY()
    TEUIModelRef<FVM_TraitInfoHover> Self;


}

namespace FVM_TraitInfoHover
{
FVM_TraitInfoHover& Create(const UObject ContextObject, const TEUIModelRef<FM_Trait> &inout Trait, const bool bForbidHover)
{
    return FVM_TraitInfoHover::CreateByManager(EUIInternal::GetContextManager(ContextObject), Trait, bForbidHover);
}
FVM_TraitInfoHover CreateByManager(const UEUIManagerSubsystem Manager, const TEUIModelRef<FM_Trait> &inout Trait, const bool bForbidHover)
{
    FVM_TraitInfoHover __r;
    TEUIModelRef<FVM_TraitInfoHover> local_6 = TEUIModelRef<FVM_TraitInfoHover>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_TraitInfoHover::ModelId, 0, Trait, bForbidHover));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "TraitInfoIcon";
    local_14.TypeName = "TEUIModelRef<FVM_TraitInfoIcon>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IsTraitMaxLevel";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "TraitMaxLevelText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "TraitLevelText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "TraitName";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "TraitDetailListModel";
    local_14.TypeName = "FEUIModelContainer";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_TraitInfoHover>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_TraitInfoHover;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_TraitInfoHover;
}
TEUIModelRef<FVM_TraitInfoIcon> __UIGetter_TraitInfoIcon(const FVM_TraitInfoHover &inout Model)
{
    return Model.GetTraitInfoIcon();
}
bool __UIGetter_IsTraitMaxLevel(const FVM_TraitInfoHover &inout Model)
{
    return Model.IsTraitMaxLevel();
}
FText __UIGetter_TraitMaxLevelText(const FVM_TraitInfoHover &inout Model)
{
    return Model.GetTraitMaxLevelText();
}
FText __UIGetter_TraitLevelText(const FVM_TraitInfoHover &inout Model)
{
    return Model.GetTraitLevelText();
}
FText __UIGetter_TraitName(const FVM_TraitInfoHover &inout Model)
{
    return Model.GetTraitName();
}
FEUIModelContainer __UIGetter_TraitDetailListModel(const FVM_TraitInfoHover &inout Model)
{
    return Model.GetTraitDetailListModel();
}
TEUIModelRef<FVM_TraitInfoHover> __UIGetter_Self(const FVM_TraitInfoHover &inout Model)
{
    return TEUIModelRef<FVM_TraitInfoHover>(Model);
}
int __IndexOf_Trait()
{
    return 0;
}
int __IndexOf_bForbidHover()
{
    return 1;
}
int __IndexOf_TraitInfoIcon()
{
    return 2;
}
int __IndexOf_TraitHoverTips()
{
    return 3;
}
}
namespace __GeneratedProperties_FVM_TraitInfoHover
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
