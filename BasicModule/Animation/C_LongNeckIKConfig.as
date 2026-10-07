
namespace __INTENRAL_FC_LongNeckIKConfig_NS
{
    const TECSComponentDerivedPtr<FC_LongNeckIKConfig> DerivedPtr = TECSComponentDerivedPtr<FC_LongNeckIKConfig>();
    const FC_LongNeckIKConfig DefaultValue = FC_LongNeckIKConfig();

}
struct FC_LongNeckIKConfig : FECSComponent
{
    UPROPERTY()
    float32 OffsetDistance = 250.0f;
    UPROPERTY()
    float32 LimitRadius = 500.0f;
    UPROPERTY()
    float32 DefaultHeight = 400.0f;
    UPROPERTY()
    float32 YawClampMax = 90.0f;
    UPROPERTY()
    float32 YawFailureMax = 140.0f;
    UPROPERTY()
    float32 PitchClampUp = 45.0f;
    UPROPERTY()
    float32 PitchFailureUp = 60.0f;
    UPROPERTY()
    float32 PitchClampDown = -90.0f;
    UPROPERTY()
    float32 PitchFailureDown = -90.0f;
    UPROPERTY()
    float32 DefaultPitch = -25.0f;
    UPROPERTY()
    float32 WeightLerpSpeed = 0.05f;


}

struct FT_LongNeckIKConfig : FECSTrait
{
    FECSTrait _base_FECSTrait;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_LongNeckIKConfig_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_LongNeckIKConfig, NAME_None);
    UPROPERTY()
    FC_LongNeckIKConfig Config_FC_LongNeckIKConfig;

    FT_LongNeckIKConfig()
    {
        return;
    }
}

namespace ECSFunc_FC_LongNeckIKConfig
{
UFUNCTION()
bool HasLongNeckIKConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_LongNeckIKConfig);
}
FC_LongNeckIKConfig& AssignLongNeckIKConfig(const FECSEntity &inout Entity, const FC_LongNeckIKConfig &inout DefaultValue = FC_LongNeckIKConfig())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_LongNeckIKConfig, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignLongNeckIKConfig_BP(const FECSEntity &inout Entity, const FC_LongNeckIKConfig &inout DefaultValue = FC_LongNeckIKConfig())
{
    ECSFunc_FC_LongNeckIKConfig::AssignLongNeckIKConfig(Entity, DefaultValue);
    return;
}
FC_LongNeckIKConfig& ModifyLongNeckIKConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_LongNeckIKConfig));
    return local_12.GetComp();
}
FC_LongNeckIKConfig& ModifyOrAddLongNeckIKConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_LongNeckIKConfig));
    return local_12.GetComp();
}
const FC_LongNeckIKConfig& GetLongNeckIKConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_LongNeckIKConfig));
    return local_12.GetComp();
}
UFUNCTION()
FC_LongNeckIKConfig GetLongNeckIKConfig_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_LongNeckIKConfig& local_4 = ECSFunc_FC_LongNeckIKConfig::GetLongNeckIKConfig(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_LongNeckIKConfig();
}
const FC_LongNeckIKConfig GetDefaultedLongNeckIKConfig(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_LongNeckIKConfig __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_LongNeckIKConfig);
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
FC_LongNeckIKConfig GetDefaultedLongNeckIKConfig_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_LongNeckIKConfig::GetDefaultedLongNeckIKConfig(Entity);
}
UFUNCTION()
bool RemoveLongNeckIKConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_LongNeckIKConfig);
}
}
FECSMonitorRuntimeView __GetMonitorLongNeckIKConfigOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_LongNeckIKConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLongNeckIKConfigOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_LongNeckIKConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLongNeckIKConfigOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_LongNeckIKConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLongNeckIKConfigOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_LongNeckIKConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLongNeckIKConfigOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_LongNeckIKConfig, bFixedFrame, bMustHandleAll);
}
void __MonitorLongNeckIKConfigLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_LongNeckIKConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorLongNeckIKConfigActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_LongNeckIKConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorLongNeckIKConfigModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_LongNeckIKConfig, bFixedFrame, Details);
    return;
}
