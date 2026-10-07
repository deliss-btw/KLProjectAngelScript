
namespace FVM_TalentSkillTypeBG
{
    const int ModelId = 0;

}
struct FVM_TalentSkillTypeBG : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    ESkillType m_SkillType;

    FVM_TalentSkillTypeBG()
    {
        this.m_SkillType = ESkillType(0);
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_TalentSkillTypeBG' by default constructor.");
        return;
    }
    FVM_TalentSkillTypeBG(const FVM_TalentSkillTypeBG &inout Other)
    {
        this.m_SkillType = ESkillType(0);
        this.m_SkillType = Other.m_SkillType;
        return;
    }
    FVM_TalentSkillTypeBG(const ESkillType InSkillType)
    {
        this.m_SkillType = ESkillType(0);
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetSkillType(ESkillType(InSkillType));
        return;
    }
    FVM_TalentSkillTypeBG opAssign(const FVM_TalentSkillTypeBG &inout Other)
    {
        FVM_TalentSkillTypeBG __r;
        this.m_SkillType = Other.m_SkillType;
        return __r;
    }
    int GetSkillTypeIndex() const
    {
        switch (int(this.GetSkillType()))
        {
        case 1:
        {
            return 0;
        }
        case 3:
        {
            return 1;
        }
        case 4:
        {
            return 2;
        }
        case 5:
        {
            return 3;
        }
        case 6:
        {
            return 4;
        }
        case 2:
        default:
        {
        }
        }
        return -1;
    }
    bool GetIsTalentFoundation() const
    {
        return (int(this.GetSkillType()) == 2);
    }
    void PostConstruct()
    {
        return;
    }
    ESkillType GetSkillType() const property
    {
        this.TrackPropertyRead(0);
        return this.m_SkillType;
    }
    void SetSkillType(const ESkillType __Value) property
    {
        if (int(this.m_SkillType) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_SkillType = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_TalentSkillTypeBG
{
    UPROPERTY()
    int SkillTypeIndex;
    UPROPERTY()
    bool IsTalentFoundation;
    UPROPERTY()
    TEUIModelRef<FVM_TalentSkillTypeBG> Self;


}

namespace FVM_TalentSkillTypeBG
{
FVM_TalentSkillTypeBG& Create(const UObject ContextObject, const ESkillType SkillType)
{
    return FVM_TalentSkillTypeBG::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_TalentSkillTypeBG CreateByManager(const UEUIManagerSubsystem Manager, const ESkillType SkillType)
{
    FVM_TalentSkillTypeBG __r;
    TEUIModelRef<FVM_TalentSkillTypeBG> local_6 = TEUIModelRef<FVM_TalentSkillTypeBG>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_TalentSkillTypeBG::ModelId, 0, SkillType));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "SkillType";
    local_14.TypeName = "ESkillType";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "SkillTypeIndex";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IsTalentFoundation";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_TalentSkillTypeBG>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_TalentSkillTypeBG;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_TalentSkillTypeBG;
}
ESkillType __UIGetter_SkillType(const FVM_TalentSkillTypeBG &inout Model)
{
    return Model.GetSkillType();
}
int __UIGetter_SkillTypeIndex(const FVM_TalentSkillTypeBG &inout Model)
{
    return Model.GetSkillTypeIndex();
}
bool __UIGetter_IsTalentFoundation(const FVM_TalentSkillTypeBG &inout Model)
{
    return Model.GetIsTalentFoundation();
}
TEUIModelRef<FVM_TalentSkillTypeBG> __UIGetter_Self(const FVM_TalentSkillTypeBG &inout Model)
{
    return TEUIModelRef<FVM_TalentSkillTypeBG>(Model);
}
int __IndexOf_SkillType()
{
    return 0;
}
}
namespace __GeneratedProperties_FVM_TalentSkillTypeBG
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
