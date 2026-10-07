
enum EShakeSolveSpace
{
    WorldSpace,
    LocalSpace,
}

enum EShakeResponseMode
{
    ChainLevel,
    ConstraintLevel,
}

namespace __INTENRAL_FC_PhysicsShakingConfig_NS
{
    const TECSComponentDerivedPtr<FC_PhysicsShakingConfig> DerivedPtr = TECSComponentDerivedPtr<FC_PhysicsShakingConfig>();
    const FC_PhysicsShakingConfig DefaultValue = FC_PhysicsShakingConfig();
}
namespace __INTENRAL_FC_SampleTrajectoryConfig_NS
{
    const TECSComponentDerivedPtr<FC_SampleTrajectoryConfig> DerivedPtr = TECSComponentDerivedPtr<FC_SampleTrajectoryConfig>();
    const FC_SampleTrajectoryConfig DefaultValue = FC_SampleTrajectoryConfig();

}
struct FBoneShakeScale
{
    UPROPERTY()
    FName BoneName;
    UPROPERTY()
    float32 StrengthScale = 1.0f;


}

struct FCompanionChainStrengthScale
{
    UPROPERTY()
    FName CompanionChainName;
    UPROPERTY()
    float32 StrengthScale = 1.0f;


}

struct FBoneChainBaseConfig
{
    UPROPERTY()
    FName BoneChainName;
    UPROPERTY()
    TArray<FName> BoneNames;
    UPROPERTY()
    EShakeSolveSpace SolveSpace = EShakeSolveSpace(1);
    UPROPERTY()
    EShakeResponseMode ResponseMode = EShakeResponseMode(1);
    UPROPERTY()
    TArray<FName> CompanionChainNames;


}

struct FBoneChainShakeCurveConfig
{
    UPROPERTY()
    FName BoneChainName;
    UPROPERTY()
    FRuntimeFloatCurve ShakeCurve;
    UPROPERTY()
    float32 ShakeStrengthScale = 1.0f;
    UPROPERTY()
    float32 ShakeTimeScale = 1.0f;
    UPROPERTY()
    FVector ShakeAxisResponseScale = FVector(1.0, 1.0, 1.0);
    UPROPERTY()
    TArray<FBoneShakeScale> PerBoneScales;
    UPROPERTY()
    TArray<FCompanionChainStrengthScale> CompanionChainScales;


}

struct FShakeDynamicParam
{
    UPROPERTY()
    float32 DynamicShakeStrengthScale = 1.0f;
    UPROPERTY()
    float32 DynamicShakeTimeScale = 1.0f;
    UPROPERTY()
    float32 PauseStartPercent = 0.0f;
    UPROPERTY()
    float32 PauseDuration = 0.0f;
    UPROPERTY()
    FTransform AttackerTransform = FTransform::Identity;
    UPROPERTY()
    FVector AttackerForwardVector = FVector(1.0, 0.0, 0.0);
    UPROPERTY()
    FVector AttackDirectionVector = FVector(0.0, 1.0, 0.0);


}

struct FC_PhysicsShakingConfig : FECSComponent
{
    UPROPERTY()
    TDataObjectPtr<FAnimPhysicsShakingConfig> ConfigPtr;

    FC_PhysicsShakingConfig()
    {
        return;
    }
}

struct FC_SampleTrajectoryConfig : FECSComponent
{
    UPROPERTY()
    float32 MinFrontTrajectoryRadius = 100.0f;
    UPROPERTY()
    float32 MinRearTrajectoryRadius = 100.0f;
    UPROPERTY()
    float32 BaseArcLengthForLookAt = 200.0f;
    UPROPERTY()
    float32 ExtraInputLengthForLookAt = 500.0f;
    UPROPERTY()
    float32 HeightForLookAt = 150.0f;


}

struct FT_AnimationConfig : FECSTrait
{
    FECSTrait _base_FECSTrait;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_PhysicsShakingConfig_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_PhysicsShakingConfig, NAME_None);
    UPROPERTY()
    FC_PhysicsShakingConfig Config_FC_PhysicsShakingConfig;

    FT_AnimationConfig()
    {
        return;
    }
}

struct FT_SampleTrajectoryConfig : FECSTrait
{
    FECSTrait _base_FECSTrait;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_SampleTrajectoryConfig_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_SampleTrajectoryConfig, NAME_None);
    UPROPERTY()
    FC_SampleTrajectoryConfig Config_FC_SampleTrajectoryConfig;

    FT_SampleTrajectoryConfig()
    {
        return;
    }
}

namespace ECSFunc_FC_PhysicsShakingConfig
{
UFUNCTION()
bool HasPhysicsShakingConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_PhysicsShakingConfig);
}
FC_PhysicsShakingConfig& AssignPhysicsShakingConfig(const FECSEntity &inout Entity, const FC_PhysicsShakingConfig &inout DefaultValue = FC_PhysicsShakingConfig())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_PhysicsShakingConfig, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignPhysicsShakingConfig_BP(const FECSEntity &inout Entity, const FC_PhysicsShakingConfig &inout DefaultValue = FC_PhysicsShakingConfig())
{
    ECSFunc_FC_PhysicsShakingConfig::AssignPhysicsShakingConfig(Entity, DefaultValue);
    return;
}
FC_PhysicsShakingConfig& ModifyPhysicsShakingConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_PhysicsShakingConfig));
    return local_12.GetComp();
}
FC_PhysicsShakingConfig& ModifyOrAddPhysicsShakingConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_PhysicsShakingConfig));
    return local_12.GetComp();
}
const FC_PhysicsShakingConfig& GetPhysicsShakingConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_PhysicsShakingConfig));
    return local_12.GetComp();
}
UFUNCTION()
FC_PhysicsShakingConfig GetPhysicsShakingConfig_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_PhysicsShakingConfig __r;
    bValid = false;
    bValid = ECSFunc_FC_PhysicsShakingConfig::GetPhysicsShakingConfig(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_PhysicsShakingConfig GetDefaultedPhysicsShakingConfig(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_PhysicsShakingConfig __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_PhysicsShakingConfig);
    if ((local_10 == nullptr))
    {
    }
    else
    {
        local_14.InternalSet(local_10);
        return local_14.GetComp();
    }
    return __r;
}
UFUNCTION()
FC_PhysicsShakingConfig GetDefaultedPhysicsShakingConfig_BP(const FECSEntity &inout Entity)
{
    FC_PhysicsShakingConfig __r;
    return __r;
}
UFUNCTION()
bool RemovePhysicsShakingConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_PhysicsShakingConfig);
}
}
FECSMonitorRuntimeView __GetMonitorPhysicsShakingConfigOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_PhysicsShakingConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPhysicsShakingConfigOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_PhysicsShakingConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPhysicsShakingConfigOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_PhysicsShakingConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPhysicsShakingConfigOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_PhysicsShakingConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPhysicsShakingConfigOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_PhysicsShakingConfig, bFixedFrame, bMustHandleAll);
}
void __MonitorPhysicsShakingConfigLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_PhysicsShakingConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPhysicsShakingConfigActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_PhysicsShakingConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPhysicsShakingConfigModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_PhysicsShakingConfig, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_SampleTrajectoryConfig
{
UFUNCTION()
bool HasSampleTrajectoryConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_SampleTrajectoryConfig);
}
FC_SampleTrajectoryConfig& AssignSampleTrajectoryConfig(const FECSEntity &inout Entity, const FC_SampleTrajectoryConfig &inout DefaultValue = FC_SampleTrajectoryConfig())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_SampleTrajectoryConfig, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignSampleTrajectoryConfig_BP(const FECSEntity &inout Entity, const FC_SampleTrajectoryConfig &inout DefaultValue = FC_SampleTrajectoryConfig())
{
    ECSFunc_FC_SampleTrajectoryConfig::AssignSampleTrajectoryConfig(Entity, DefaultValue);
    return;
}
FC_SampleTrajectoryConfig& ModifySampleTrajectoryConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_SampleTrajectoryConfig));
    return local_12.GetComp();
}
FC_SampleTrajectoryConfig& ModifyOrAddSampleTrajectoryConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_SampleTrajectoryConfig));
    return local_12.GetComp();
}
const FC_SampleTrajectoryConfig& GetSampleTrajectoryConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_SampleTrajectoryConfig));
    return local_12.GetComp();
}
UFUNCTION()
FC_SampleTrajectoryConfig GetSampleTrajectoryConfig_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_SampleTrajectoryConfig& local_4 = ECSFunc_FC_SampleTrajectoryConfig::GetSampleTrajectoryConfig(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_SampleTrajectoryConfig();
}
const FC_SampleTrajectoryConfig GetDefaultedSampleTrajectoryConfig(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_SampleTrajectoryConfig __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_SampleTrajectoryConfig);
    if ((local_10 == nullptr))
    {
    }
    else
    {
        local_14.InternalSet(local_10);
        return local_14.GetComp();
    }
    return __r;
}
UFUNCTION()
FC_SampleTrajectoryConfig GetDefaultedSampleTrajectoryConfig_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_SampleTrajectoryConfig::GetDefaultedSampleTrajectoryConfig(Entity);
}
UFUNCTION()
bool RemoveSampleTrajectoryConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_SampleTrajectoryConfig);
}
}
FECSMonitorRuntimeView __GetMonitorSampleTrajectoryConfigOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_SampleTrajectoryConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSampleTrajectoryConfigOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_SampleTrajectoryConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSampleTrajectoryConfigOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_SampleTrajectoryConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSampleTrajectoryConfigOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_SampleTrajectoryConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSampleTrajectoryConfigOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_SampleTrajectoryConfig, bFixedFrame, bMustHandleAll);
}
void __MonitorSampleTrajectoryConfigLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_SampleTrajectoryConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorSampleTrajectoryConfigActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_SampleTrajectoryConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorSampleTrajectoryConfigModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_SampleTrajectoryConfig, bFixedFrame, Details);
    return;
}
