
namespace FVM_LinkSkillEnergy
{
    const int ModelId = 0;

}
struct FVM_LinkSkillEnergy : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    float32 m_EnergyRatio;
    UPROPERTY()
    float32 m_HeatRatio;
    UPROPERTY()
    bool m_bManipulatedPropIsOverHeat;
    UPROPERTY()
    EProjectileFireResourceType m_ProjectileFireResourceType;

    FVM_LinkSkillEnergy()
    {
        this.m_EnergyRatio = 0.0f;
        this.m_HeatRatio = 0.0f;
        this.m_ProjectileFireResourceType = EProjectileFireResourceType(0);
        this.m_bManipulatedPropIsOverHeat = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVM_LinkSkillEnergy(const FVM_LinkSkillEnergy &inout Other)
    {
        this.m_EnergyRatio = 0.0f;
        this.m_HeatRatio = 0.0f;
        this.m_ProjectileFireResourceType = EProjectileFireResourceType(0);
        this.m_bManipulatedPropIsOverHeat = false;
        this.m_EnergyRatio = Other.m_EnergyRatio;
        this.m_HeatRatio = Other.m_HeatRatio;
        this.m_bManipulatedPropIsOverHeat = Other.m_bManipulatedPropIsOverHeat;
        this.m_ProjectileFireResourceType = Other.m_ProjectileFireResourceType;
        return;
    }
    FVM_LinkSkillEnergy opAssign(const FVM_LinkSkillEnergy &inout Other)
    {
        FVM_LinkSkillEnergy __r;
        this.m_EnergyRatio = Other.m_EnergyRatio;
        this.m_HeatRatio = Other.m_HeatRatio;
        this.m_bManipulatedPropIsOverHeat = Other.m_bManipulatedPropIsOverHeat;
        this.m_ProjectileFireResourceType = Other.m_ProjectileFireResourceType;
        return __r;
    }
    void Tick()
    {
        ::FASCommonUtils::GetUniqueAvatarPawnEntity(this.GetContext().GetLocalPlayerPawn());
        Get local_16;
        const FC_ManipulateProp& local_18 = local_16.opCall();
        if (local_18)
        {
            this.SetProjectileFireResourceType(EProjectileFireResourceType(local_18.GetFireResourceType()));
            if ((int(this.GetProjectileFireResourceType())) == 0)
            {
                this.SetEnergyRatio((local_18.GetEnergy() / local_18.GetEnergyMax()));
            }
            else
            {
                if ((int(this.GetProjectileFireResourceType())) == 1)
                {
                    FECSEntity local_28 = FECSEntity(local_18.GetManipulatedPropEntity());
                    Get local_32;
                    const FC_ManipulateProp& local_34 = local_32.opCall();
                    if (local_34)
                    {
                        this.SetHeatRatio((local_34.GetHeatValue() / local_34.GetHeatValueMax()));
                        this.SetbManipulatedPropIsOverHeat(local_34.GetbIsOverHeat());
                    }
                }
            }
        }
        else
        {
            this.SetbManipulatedPropIsOverHeat(false);
        }
        return;
    }
    float32 GetEnergyRatio() const property
    {
        float32 __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    float32 GetModify_EnergyRatio() property
    {
        float32 __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetEnergyRatio(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_EnergyRatio = __Value;
        return;
    }
    const float32 GetHeatRatio() const property
    {
        const float32 __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    float32 GetModify_HeatRatio() property
    {
        float32 __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetHeatRatio(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_HeatRatio = __Value;
        return;
    }
    bool GetbManipulatedPropIsOverHeat() const property
    {
        this.TrackPropertyRead(2);
        return this.m_bManipulatedPropIsOverHeat;
    }
    void SetbManipulatedPropIsOverHeat(const bool __Value) property
    {
        if (!(this.m_bManipulatedPropIsOverHeat) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_bManipulatedPropIsOverHeat = __Value;
        return;
    }
    EProjectileFireResourceType GetProjectileFireResourceType() const property
    {
        this.TrackPropertyRead(3);
        return this.m_ProjectileFireResourceType;
    }
    void SetProjectileFireResourceType(const EProjectileFireResourceType __Value) property
    {
        if (int(this.m_ProjectileFireResourceType) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_ProjectileFireResourceType = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_LinkSkillEnergy
{
    UPROPERTY()
    TEUIModelRef<FVM_LinkSkillEnergy> Self;

    __GeneratedProperties_FVM_LinkSkillEnergy()
    {
        return;
    }
}

namespace FVM_LinkSkillEnergy
{
FVM_LinkSkillEnergy& Create(const UObject ContextObject)
{
    return FVM_LinkSkillEnergy::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_LinkSkillEnergy CreateByManager(const UEUIManagerSubsystem Manager)
{
    FVM_LinkSkillEnergy __r;
    TEUIModelRef<FVM_LinkSkillEnergy> local_6 = TEUIModelRef<FVM_LinkSkillEnergy>(EUIInternal::MakeModelWithManager(Manager, FVM_LinkSkillEnergy::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "EnergyRatio";
    local_14.TypeName = "float32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "HeatRatio";
    local_14.TypeName = "float32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bManipulatedPropIsOverHeat";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ProjectileFireResourceType";
    local_14.TypeName = "EProjectileFireResourceType";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_LinkSkillEnergy>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_LinkSkillEnergy;
    Result.TickFunction.FunctionName = "__Tick";
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_LinkSkillEnergy;
}
void __Tick(FVM_LinkSkillEnergy &inout Model)
{
    Model.Tick();
    return;
}
float32 __UIGetter_EnergyRatio(const FVM_LinkSkillEnergy &inout Model)
{
    return Model.GetEnergyRatio();
}
float32 __UIGetter_HeatRatio(const FVM_LinkSkillEnergy &inout Model)
{
    return Model.GetHeatRatio();
}
bool __UIGetter_bManipulatedPropIsOverHeat(const FVM_LinkSkillEnergy &inout Model)
{
    return Model.GetbManipulatedPropIsOverHeat();
}
EProjectileFireResourceType __UIGetter_ProjectileFireResourceType(const FVM_LinkSkillEnergy &inout Model)
{
    return Model.GetProjectileFireResourceType();
}
TEUIModelRef<FVM_LinkSkillEnergy> __UIGetter_Self(const FVM_LinkSkillEnergy &inout Model)
{
    return TEUIModelRef<FVM_LinkSkillEnergy>(Model);
}
int __IndexOf_EnergyRatio()
{
    return 0;
}
int __IndexOf_HeatRatio()
{
    return 1;
}
int __IndexOf_bManipulatedPropIsOverHeat()
{
    return 2;
}
int __IndexOf_ProjectileFireResourceType()
{
    return 3;
}
}
namespace __GeneratedProperties_FVM_LinkSkillEnergy
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
