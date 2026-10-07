
namespace FVMS_LinkSkill
{
    const int ModelId = 0;

}
struct FVMS_LinkSkill : FEUIViewModelSingleton
{
    FEUIViewModelSingleton _base_FEUIViewModelSingleton;
    UPROPERTY()
    FEUIModelRef m_VM_LinkSkillEnergyCrossbow;
    UPROPERTY()
    bool m_bVisibility;

    FVMS_LinkSkill()
    {
        this.m_bVisibility = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVMS_LinkSkill(const FVMS_LinkSkill &inout Other)
    {
        this.m_bVisibility = false;
        this.m_VM_LinkSkillEnergyCrossbow = Other.m_VM_LinkSkillEnergyCrossbow;
        this.m_bVisibility = Other.m_bVisibility;
        return;
    }
    FVMS_LinkSkill opAssign(const FVMS_LinkSkill &inout Other)
    {
        FVMS_LinkSkill __r;
        this.m_VM_LinkSkillEnergyCrossbow = Other.m_VM_LinkSkillEnergyCrossbow;
        this.m_bVisibility = Other.m_bVisibility;
        return __r;
    }
    void PostConstruct()
    {
        return;
    }
    void Tick()
    {
        ::FASCommonUtils::GetUniqueAvatarPawnEntity(this.GetContext().GetLocalPlayerPawn());
        Get local_16;
        const FC_PropManipulator& local_18 = local_16.opCall();
        if (local_18)
        {
            const FECSEntity& local_22 = local_18.GetManipulatedPropEntity();
            Has local_26;
            bool local_19 = local_26.opCall();
            if (local_19)
            {
                if (::FASCommonUtils::GetPropConfigDataPtr(local_22))
                {
                    const FPropPrefabConfig& local_76;
                    if ((int(local_76.PropType) == 2 && (int(local_76.CombatPropType) == 1)))
                    {
                        this.SetbVisibility(true);
                        return;
                    }
                }
            }
        }
        this.SetbVisibility(false);
        return;
    }
    const FEUIModelRef GetVM_LinkSkillEnergyCrossbow() const property
    {
        const FEUIModelRef __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    FEUIModelRef GetModify_VM_LinkSkillEnergyCrossbow() property
    {
        FEUIModelRef __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetVM_LinkSkillEnergyCrossbow(const FEUIModelRef &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_VM_LinkSkillEnergyCrossbow = __Value;
        return;
    }
    bool GetbVisibility() const property
    {
        this.TrackPropertyRead(1);
        return this.m_bVisibility;
    }
    void SetbVisibility(const bool __Value) property
    {
        if (!(this.m_bVisibility) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_bVisibility = __Value;
        return;
    }
}

struct __GeneratedProperties_FVMS_LinkSkill
{
    UPROPERTY()
    TEUIModelRef<FVMS_LinkSkill> Self;

    __GeneratedProperties_FVMS_LinkSkill()
    {
        return;
    }
}

namespace FVMS_LinkSkill
{
FVMS_LinkSkill& Get(const UObject ContextObject)
{
    return FVMS_LinkSkill::GetByManager(EUIInternal::GetContextManager(ContextObject));
}
FVMS_LinkSkill GetByManager(const UEUIManagerSubsystem Manager)
{
    FVMS_LinkSkill __r;
    TEUIModelRef<FVMS_LinkSkill> local_6 = TEUIModelRef<FVMS_LinkSkill>(EUIInternal::MakeModelWithManager(Manager, FVMS_LinkSkill::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "VM_LinkSkillEnergyCrossbow";
    local_14.TypeName = "FEUIModelRef";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVMS_LinkSkill>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVMS_LinkSkill;
    Result.TickFunction.FunctionName = "__Tick";
    return;
}
UScriptStruct GetModelStruct()
{
    return FVMS_LinkSkill;
}
void __Tick(FVMS_LinkSkill &inout Model)
{
    Model.Tick();
    return;
}
FEUIModelRef __UIGetter_VM_LinkSkillEnergyCrossbow(const FVMS_LinkSkill &inout Model)
{
    return Model.GetVM_LinkSkillEnergyCrossbow();
}
TEUIModelRef<FVMS_LinkSkill> __UIGetter_Self(const FVMS_LinkSkill &inout Model)
{
    return TEUIModelRef<FVMS_LinkSkill>(Model);
}
int __IndexOf_VM_LinkSkillEnergyCrossbow()
{
    return 0;
}
int __IndexOf_bVisibility()
{
    return 1;
}
}
namespace __GeneratedProperties_FVMS_LinkSkill
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
