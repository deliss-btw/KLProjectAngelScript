
namespace FVM_TraitInfoIcon
{
    const int ModelId = 0;

}
struct FVM_TraitInfoIcon : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TEUIModelRef<FM_Trait> m_Trait;

    FVM_TraitInfoIcon()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_TraitInfoIcon' by default constructor.");
        return;
    }
    FVM_TraitInfoIcon(const FVM_TraitInfoIcon &inout Other)
    {
        this.m_Trait = Other.m_Trait;
        return;
    }
    FVM_TraitInfoIcon(const TEUIModelRef<FM_Trait> &inout InTrait)
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetTrait(InTrait);
        return;
    }
    FVM_TraitInfoIcon& opAssign(const FVM_TraitInfoIcon &inout Other)
    {
        return Other.m_Trait;
    }
    void PostConstruct()
    {
        return;
    }
    TDataObjectPtr<FTraitConfig> GetTraitConfig() const
    {
        TEUIModelRef<FM_Trait> local_2 = this.GetTrait();
        return GetTraitConfig();
    }
    FSoftBrush GetTraitIcon() const
    {
        // body not fully recovered вЂ” stub [no-return]
        FSoftBrush __r; return __r;
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
}

struct __GeneratedProperties_FVM_TraitInfoIcon
{
    UPROPERTY()
    FSoftBrush TraitIcon;
    UPROPERTY()
    TEUIModelRef<FVM_TraitInfoIcon> Self;

    __GeneratedProperties_FVM_TraitInfoIcon()
    {
        return;
    }
}

namespace FVM_TraitInfoIcon
{
FVM_TraitInfoIcon& Create(const UObject ContextObject, const TEUIModelRef<FM_Trait> &inout Trait)
{
    return FVM_TraitInfoIcon::CreateByManager(EUIInternal::GetContextManager(ContextObject), Trait);
}
FVM_TraitInfoIcon CreateByManager(const UEUIManagerSubsystem Manager, const TEUIModelRef<FM_Trait> &inout Trait)
{
    FVM_TraitInfoIcon __r;
    TEUIModelRef<FVM_TraitInfoIcon> local_6 = TEUIModelRef<FVM_TraitInfoIcon>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_TraitInfoIcon::ModelId, 0, Trait));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "TraitIcon";
    local_14.TypeName = "FSoftBrush";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_TraitInfoIcon>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_TraitInfoIcon;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_TraitInfoIcon;
}
FSoftBrush __UIGetter_TraitIcon(const FVM_TraitInfoIcon &inout Model)
{
    return Model.GetTraitIcon();
}
TEUIModelRef<FVM_TraitInfoIcon> __UIGetter_Self(const FVM_TraitInfoIcon &inout Model)
{
    return TEUIModelRef<FVM_TraitInfoIcon>(Model);
}
int __IndexOf_Trait()
{
    return 0;
}
}
namespace __GeneratedProperties_FVM_TraitInfoIcon
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
