
namespace FVMS_LinkSkillEnergyCrossbow
{
    const int ModelId = 0;

}
struct FVMS_LinkSkillEnergyCrossbow : FEUIViewModelSingleton
{
    FEUIViewModelSingleton _base_FEUIViewModelSingleton;
    UPROPERTY()
    float32 m_EnergyRatio;
    UPROPERTY()
    float32 m_SmoothedEnergyRatio;
    UPROPERTY()
    FECSEntity m_TurretPropEntity;
    UPROPERTY()
    FMW_InterpFloat m_SmoothedEnergy;

    FVMS_LinkSkillEnergyCrossbow()
    {
        this.m_EnergyRatio = 0.0f;
        this.m_SmoothedEnergyRatio = 0.0f;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVMS_LinkSkillEnergyCrossbow(const FVMS_LinkSkillEnergyCrossbow &inout Other)
    {
        this.m_EnergyRatio = 0.0f;
        this.m_SmoothedEnergyRatio = 0.0f;
        this.m_EnergyRatio = Other.m_EnergyRatio;
        this.m_SmoothedEnergyRatio = Other.m_SmoothedEnergyRatio;
        this.m_TurretPropEntity = Other.m_TurretPropEntity;
        this.m_SmoothedEnergy = Other.m_SmoothedEnergy;
        return;
    }
    FVMS_LinkSkillEnergyCrossbow& opAssign(const FVMS_LinkSkillEnergyCrossbow &inout Other)
    {
        this.m_EnergyRatio = Other.m_EnergyRatio;
        this.m_SmoothedEnergyRatio = Other.m_SmoothedEnergyRatio;
        this.m_TurretPropEntity = Other.m_TurretPropEntity;
        return Other.m_SmoothedEnergy;
    }
    void PostConstruct()
    {
        this.GetModify_SmoothedEnergy().SnapTo(0.0f);
        return;
    }
    void OnManipulatorChanged(const FC_PropManipulator &inout PropManipulator)
    {
        return;
    }
    void OnTurretResourceChanged(const FC_ScalerResourceRuntime &inout ScalerResourceRuntime)
    {
        return;
    }
    void ResolveTurretEnergy()
    {
        FECSEntity local_4;
        int local_40 = 0;
        int local_46 = 0;
        float32 local_5 = 0.0f;
        ::FASCommonUtils::GetUniqueAvatarPawnEntity(this.GetContext().GetLocalPlayerPawn());
        Get local_22;
        const FC_PropManipulator& local_24 = local_22.opCall();
        if (local_24)
        {
            FECSEntity local_30 = local_24.GetManipulatedPropEntity();
            Has local_34;
            bool local_25 = local_34.opCall();
            if (local_25)
            {
                local_4 = local_30;
                if (!(local_40))
                {
                    local_25 = false;
                }
                else
                {
                    local_25 = local_46;
                }
                if (local_25)
                {
                    local_5 = ::FScalerResourceUtils::GetScalerResourceValuePercentageIndexByName(local_40, local_46, FName("Energy"));
                }
            }
        }
        this.SetTurretPropEntity(local_4);
        this.SetEnergyRatio(local_5);
        if (!(local_4.IsValid()))
        {
            this.GetModify_SmoothedEnergy().SnapTo(0.0f);
        }
        return;
    }
    void DriveSmoothedEnergy()
    {
        if (!(this.GetTurretPropEntity().IsValid()))
        {
            return;
        }
        this.GetModify_SmoothedEnergy().SetLerpAlpha(this.GetEnergyRatio(), 0.3f, 0.005f);
        return;
    }
    void SyncSmoothedRatio()
    {
        float32 local_1 = 0.0f;
        this.SetSmoothedEnergyRatio(local_1);
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
    const float32 GetSmoothedEnergyRatio() const property
    {
        const float32 __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    float32 GetModify_SmoothedEnergyRatio() property
    {
        float32 __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetSmoothedEnergyRatio(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_SmoothedEnergyRatio = __Value;
        return;
    }
    const FECSEntity GetTurretPropEntity() const property
    {
        const FECSEntity __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    FECSEntity GetModify_TurretPropEntity() property
    {
        FECSEntity __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetTurretPropEntity(const FECSEntity &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_TurretPropEntity = __Value;
        return;
    }
    const FMW_InterpFloat GetSmoothedEnergy() const property
    {
        const FMW_InterpFloat __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    FMW_InterpFloat GetModify_SmoothedEnergy() property
    {
        FMW_InterpFloat __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetSmoothedEnergy(const FMW_InterpFloat &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_SmoothedEnergy = __Value;
        return;
    }
}

struct __GeneratedProperties_FVMS_LinkSkillEnergyCrossbow
{
    UPROPERTY()
    TEUIModelRef<FVMS_LinkSkillEnergyCrossbow> Self;

    __GeneratedProperties_FVMS_LinkSkillEnergyCrossbow()
    {
        return;
    }
}

namespace FVMS_LinkSkillEnergyCrossbow
{
FVMS_LinkSkillEnergyCrossbow& Get(const UObject ContextObject)
{
    return FVMS_LinkSkillEnergyCrossbow::GetByManager(EUIInternal::GetContextManager(ContextObject));
}
FVMS_LinkSkillEnergyCrossbow GetByManager(const UEUIManagerSubsystem Manager)
{
    FVMS_LinkSkillEnergyCrossbow __r;
    TEUIModelRef<FVMS_LinkSkillEnergyCrossbow> local_6 = TEUIModelRef<FVMS_LinkSkillEnergyCrossbow>(EUIInternal::MakeModelWithManager(Manager, FVMS_LinkSkillEnergyCrossbow::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "EnergyRatio";
    local_14.TypeName = "float32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "SmoothedEnergyRatio";
    local_14.TypeName = "float32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVMS_LinkSkillEnergyCrossbow>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVMS_LinkSkillEnergyCrossbow;
    FEUIModelWatcherProperty local_19;
    local_19.PropertyName = FName("SmoothedEnergy");
    int local_2_2 = FVMS_LinkSkillEnergyCrossbow::__IndexOf_SmoothedEnergy();
    Result.WatcherProperties.Add(local_19);
    FEUIModelMonitorDefine local_32;
    local_32.FunctionName = "__OnManipulatorChanged";
    local_32.ComponentType = FC_PropManipulator;
    Result.MonitorFunctions.Add(local_32);
    local_32.FunctionName = "__OnTurretResourceChanged";
    local_32.ComponentType = FC_ScalerResourceRuntime;
    local_32.MonitorPropertyName = FName("TurretPropEntity");
    int local_2_3 = FVMS_LinkSkillEnergyCrossbow::__IndexOf_TurretPropEntity();
    Result.MonitorFunctions.Add(local_32);
    FEUIModelEffectDefine local_38;
    local_38.FunctionName = "ResolveTurretEnergy";
    Result.EffectFunctions.Add(local_38);
    local_38.FunctionName = "DriveSmoothedEnergy";
    Result.EffectFunctions.Add(local_38);
    local_38.FunctionName = "SyncSmoothedRatio";
    Result.EffectFunctions.Add(local_38);
    return;
}
UScriptStruct GetModelStruct()
{
    return FVMS_LinkSkillEnergyCrossbow;
}
void __OnManipulatorChanged(FVMS_LinkSkillEnergyCrossbow &inout Model, const FECSEntity &inout Entity, const FC_PropManipulator &inout Component)
{
    Model.OnManipulatorChanged(Component);
    return;
}
void __OnTurretResourceChanged(FVMS_LinkSkillEnergyCrossbow &inout Model, const FECSEntity &inout Entity, const FC_ScalerResourceRuntime &inout Component)
{
    Model.OnTurretResourceChanged(Component);
    return;
}
void __Register_Monitor__(const FECSWorldPtr &inout ECSWorld)
{
    // body not fully recovered вЂ” stub [argmismatch:argtype]
}
float32 __UIGetter_EnergyRatio(const FVMS_LinkSkillEnergyCrossbow &inout Model)
{
    return Model.GetEnergyRatio();
}
float32 __UIGetter_SmoothedEnergyRatio(const FVMS_LinkSkillEnergyCrossbow &inout Model)
{
    return Model.GetSmoothedEnergyRatio();
}
TEUIModelRef<FVMS_LinkSkillEnergyCrossbow> __UIGetter_Self(const FVMS_LinkSkillEnergyCrossbow &inout Model)
{
    return TEUIModelRef<FVMS_LinkSkillEnergyCrossbow>(Model);
}
int __IndexOf_EnergyRatio()
{
    return 0;
}
int __IndexOf_SmoothedEnergyRatio()
{
    return 1;
}
int __IndexOf_TurretPropEntity()
{
    return 2;
}
int __IndexOf_SmoothedEnergy()
{
    return 3;
}
}
namespace __GeneratedProperties_FVMS_LinkSkillEnergyCrossbow
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
