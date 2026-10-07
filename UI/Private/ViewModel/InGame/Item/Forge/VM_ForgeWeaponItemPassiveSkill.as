
namespace FVM_ForgeWeaponItemPassiveSkill
{
    const int ModelId = 0;

}
struct FVM_ForgeWeaponItemPassiveSkill : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TEUIModelRef<FM_Trait> m_Trait;
    UPROPERTY()
    TEUIModelRef<FVM_ForgeWeaponItemAttribute> m_Attribute;
    UPROPERTY()
    FSoftBrush m_Image;
    UPROPERTY()
    FEUIModelContainer m_TraitDetailListVM;

    FVM_ForgeWeaponItemPassiveSkill()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_ForgeWeaponItemPassiveSkill' by default constructor.");
        return;
    }
    FVM_ForgeWeaponItemPassiveSkill(const FVM_ForgeWeaponItemPassiveSkill &inout Other)
    {
        this.m_Trait = Other.m_Trait;
        this.m_Attribute = Other.m_Attribute;
        this.m_Image = Other.m_Image;
        this.m_TraitDetailListVM = Other.m_TraitDetailListVM;
        return;
    }
    FVM_ForgeWeaponItemPassiveSkill(const TEUIModelRef<FM_Trait> &inout InTrait, const TEUIModelRef<FVM_ForgeWeaponItemAttribute> &inout InAttribute, const FSoftBrush &inout InImage)
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetTrait(InTrait);
        this.SetAttribute(InAttribute);
        this.SetImage(InImage);
        return;
    }
    FVM_ForgeWeaponItemPassiveSkill& opAssign(const FVM_ForgeWeaponItemPassiveSkill &inout Other)
    {
        this.m_Trait = Other.m_Trait;
        this.m_Attribute = Other.m_Attribute;
        this.m_Image = Other.m_Image;
        return Other.m_TraitDetailListVM;
    }
    void PostConstruct()
    {
        TEUIModelRef<FM_Trait> local_2 = this.GetTrait();
        this.SetTraitDetailListVM(FEUIModelContainer());
        return;
    }
    FEUIModelContainer GetTraitDetailListModel() const
    {
        return this.GetTraitDetailListVM();
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
    TEUIModelRef<FVM_ForgeWeaponItemAttribute> GetAttribute() const property
    {
        this.TrackPropertyRead(1);
        return this.m_Attribute;
    }
    void SetAttribute(const TEUIModelRef<FVM_ForgeWeaponItemAttribute> &inout __Value) property
    {
        TEUIModelRef<FVM_ForgeWeaponItemAttribute> local_2;
        local_2 = this.m_Attribute;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_Attribute = __Value;
        return;
    }
    const FSoftBrush GetImage() const property
    {
        const FSoftBrush __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    FSoftBrush GetModify_Image() property
    {
        FSoftBrush __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetImage(const FSoftBrush &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_Image = __Value;
        return;
    }
    const FEUIModelContainer GetTraitDetailListVM() const property
    {
        const FEUIModelContainer __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    FEUIModelContainer GetModify_TraitDetailListVM() property
    {
        FEUIModelContainer __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetTraitDetailListVM(const FEUIModelContainer &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_TraitDetailListVM = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_ForgeWeaponItemPassiveSkill
{
    UPROPERTY()
    FEUIModelContainer TraitDetailListModel;
    UPROPERTY()
    TEUIModelRef<FVM_ForgeWeaponItemPassiveSkill> Self;

    __GeneratedProperties_FVM_ForgeWeaponItemPassiveSkill()
    {
        return;
    }
}

namespace FVM_ForgeWeaponItemPassiveSkill
{
FVM_ForgeWeaponItemPassiveSkill& Create(const UObject ContextObject, const TEUIModelRef<FM_Trait> &inout Trait, const TEUIModelRef<FVM_ForgeWeaponItemAttribute> &inout Attribute, const FSoftBrush &inout Image)
{
    return FVM_ForgeWeaponItemPassiveSkill::CreateByManager(EUIInternal::GetContextManager(ContextObject), Trait, Attribute, Image);
}
FVM_ForgeWeaponItemPassiveSkill CreateByManager(const UEUIManagerSubsystem Manager, const TEUIModelRef<FM_Trait> &inout Trait, const TEUIModelRef<FVM_ForgeWeaponItemAttribute> &inout Attribute, const FSoftBrush &inout Image)
{
    FVM_ForgeWeaponItemPassiveSkill __r;
    TEUIModelRef<FVM_ForgeWeaponItemPassiveSkill> local_6 = TEUIModelRef<FVM_ForgeWeaponItemPassiveSkill>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_ForgeWeaponItemPassiveSkill::ModelId, 0, Trait, Attribute, Image));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "Attribute";
    local_14.TypeName = "TEUIModelRef<FVM_ForgeWeaponItemAttribute>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Image";
    local_14.TypeName = "FSoftBrush";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "TraitDetailListModel";
    local_14.TypeName = "FEUIModelContainer";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_ForgeWeaponItemPassiveSkill>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_ForgeWeaponItemPassiveSkill;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_ForgeWeaponItemPassiveSkill;
}
TEUIModelRef<FVM_ForgeWeaponItemAttribute> __UIGetter_Attribute(const FVM_ForgeWeaponItemPassiveSkill &inout Model)
{
    return Model.GetAttribute();
}
FSoftBrush __UIGetter_Image(const FVM_ForgeWeaponItemPassiveSkill &inout Model)
{
    return Model.GetImage();
}
FEUIModelContainer __UIGetter_TraitDetailListModel(const FVM_ForgeWeaponItemPassiveSkill &inout Model)
{
    return Model.GetTraitDetailListModel();
}
TEUIModelRef<FVM_ForgeWeaponItemPassiveSkill> __UIGetter_Self(const FVM_ForgeWeaponItemPassiveSkill &inout Model)
{
    return TEUIModelRef<FVM_ForgeWeaponItemPassiveSkill>(Model);
}
int __IndexOf_Trait()
{
    return 0;
}
int __IndexOf_Attribute()
{
    return 1;
}
int __IndexOf_Image()
{
    return 2;
}
int __IndexOf_TraitDetailListVM()
{
    return 3;
}
}
namespace __GeneratedProperties_FVM_ForgeWeaponItemPassiveSkill
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
