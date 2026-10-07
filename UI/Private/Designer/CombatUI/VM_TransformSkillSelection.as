
namespace FVMS_TransformSkillSelection
{
    const int ModelId = 0;

}
struct FVMS_TransformSkillSelection : FEUIViewModelSingleton
{
    FEUIViewModelSingleton _base_FEUIViewModelSingleton;
    UPROPERTY()
    float32 m_TeamLinkEnergy;

    FVMS_TransformSkillSelection()
    {
        this.m_TeamLinkEnergy = 0.0f;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVMS_TransformSkillSelection(const FVMS_TransformSkillSelection &inout Other)
    {
        this.m_TeamLinkEnergy = 0.0f;
        this.m_TeamLinkEnergy = Other.m_TeamLinkEnergy;
        return;
    }
    FVMS_TransformSkillSelection opAssign(const FVMS_TransformSkillSelection &inout Other)
    {
        FVMS_TransformSkillSelection __r;
        this.m_TeamLinkEnergy = Other.m_TeamLinkEnergy;
        return __r;
    }
    void Tick()
    {
        FECSEntity local_4 = FECSEntity(this.GetContext().GetLocalPlayerPawn());
        if (!(ECS::GetECSWorld().IsValid()))
        {
            return;
        }
        if ((local_4 == ENTITY_NULL))
        {
            return;
        }
        return;
    }
    float32 GetTeamLinkEnergy() const property
    {
        float32 __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    float32 GetModify_TeamLinkEnergy() property
    {
        float32 __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetTeamLinkEnergy(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_TeamLinkEnergy = __Value;
        return;
    }
}

struct __GeneratedProperties_FVMS_TransformSkillSelection
{
    UPROPERTY()
    TEUIModelRef<FVMS_TransformSkillSelection> Self;

    __GeneratedProperties_FVMS_TransformSkillSelection()
    {
        return;
    }
}

namespace FVMS_TransformSkillSelection
{
FVMS_TransformSkillSelection& Get(const UObject ContextObject)
{
    return FVMS_TransformSkillSelection::GetByManager(EUIInternal::GetContextManager(ContextObject));
}
FVMS_TransformSkillSelection GetByManager(const UEUIManagerSubsystem Manager)
{
    FVMS_TransformSkillSelection __r;
    TEUIModelRef<FVMS_TransformSkillSelection> local_6 = TEUIModelRef<FVMS_TransformSkillSelection>(EUIInternal::MakeModelWithManager(Manager, FVMS_TransformSkillSelection::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "TeamLinkEnergy";
    local_14.TypeName = "float32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVMS_TransformSkillSelection>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVMS_TransformSkillSelection;
    Result.TickFunction.FunctionName = "__Tick";
    return;
}
UScriptStruct GetModelStruct()
{
    return FVMS_TransformSkillSelection;
}
void __Tick(FVMS_TransformSkillSelection &inout Model)
{
    Model.Tick();
    return;
}
float32 __UIGetter_TeamLinkEnergy(const FVMS_TransformSkillSelection &inout Model)
{
    return Model.GetTeamLinkEnergy();
}
TEUIModelRef<FVMS_TransformSkillSelection> __UIGetter_Self(const FVMS_TransformSkillSelection &inout Model)
{
    return TEUIModelRef<FVMS_TransformSkillSelection>(Model);
}
int __IndexOf_TeamLinkEnergy()
{
    return 0;
}
}
namespace __GeneratedProperties_FVMS_TransformSkillSelection
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
