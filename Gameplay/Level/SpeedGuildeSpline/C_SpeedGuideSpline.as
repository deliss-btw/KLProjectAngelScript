
namespace __INTENRAL_FC_SpeedGuideSpline_NS
{
    const TECSComponentDerivedPtr<FC_SpeedGuideSpline> DerivedPtr = TECSComponentDerivedPtr<FC_SpeedGuideSpline>();
    const FC_SpeedGuideSpline DefaultValue = FC_SpeedGuideSpline();
}
namespace __INTENRAL_FC_CharacterSpeedGuideSpline_NS
{
    const TECSComponentDerivedPtr<FC_CharacterSpeedGuideSpline> DerivedPtr = TECSComponentDerivedPtr<FC_CharacterSpeedGuideSpline>();
    const FC_CharacterSpeedGuideSpline DefaultValue = FC_CharacterSpeedGuideSpline();
}
namespace __INTENRAL_FC_SpeedSplineFXParamConfig_NS
{
    const TECSComponentDerivedPtr<FC_SpeedSplineFXParamConfig> DerivedPtr = TECSComponentDerivedPtr<FC_SpeedSplineFXParamConfig>();
    const FC_SpeedSplineFXParamConfig DefaultValue = FC_SpeedSplineFXParamConfig();
}
namespace __INTENRAL_FC_SpeedSplineFXParamValue_NS
{
    const TECSComponentDerivedPtr<FC_SpeedSplineFXParamValue> DerivedPtr = TECSComponentDerivedPtr<FC_SpeedSplineFXParamValue>();
    const FC_SpeedSplineFXParamValue DefaultValue = FC_SpeedSplineFXParamValue();

}
struct FC_SpeedGuideSpline : FECSComponent
{
    UPROPERTY()
    TSoftObjectPtr<AECSPrefab> PrefabPath;
    UPROPERTY()
    TWeakObjectPtr<ASpeedGuideSplinePrefab> PrefabActor;

    FC_SpeedGuideSpline()
    {
        return;
    }
    ASpeedGuideSplinePrefab GetSplinePrefabActor()
    {
        ASpeedGuideSplinePrefab local_6;
        if (!(this.PrefabActor.IsValid()))
        {
            AECSPrefab local_4;
            local_6 = Cast<ASpeedGuideSplinePrefab>(local_4);
            this.PrefabActor = local_6;
        }
        return local_6;
    }
}

struct FC_CharacterSpeedGuideSpline : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    FECSEntity m_SpeedGuideSplineEntity;
    UPROPERTY()
    float32 m_ExtraSpeedPctByGuideSpline;
    UPROPERTY()
    float32 m_CosineValueToSplineDirection;

    FC_CharacterSpeedGuideSpline()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_CharacterSpeedGuideSpline(const FC_CharacterSpeedGuideSpline &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_CharacterSpeedGuideSpline opAssign(const FC_CharacterSpeedGuideSpline &inout Other)
    {
        FC_CharacterSpeedGuideSpline __r;
        this.SetSpeedGuideSplineEntity(Other.GetSpeedGuideSplineEntity());
        this.SetExtraSpeedPctByGuideSpline(Other.GetExtraSpeedPctByGuideSpline());
        this.SetCosineValueToSplineDirection(Other.GetCosineValueToSplineDirection());
        return __r;
    }
    const FECSEntity GetSpeedGuideSplineEntity() const property
    {
        const FECSEntity __r;
        return __r;
    }
    FECSEntity GetModify_SpeedGuideSplineEntity() property
    {
        FECSEntity __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetSpeedGuideSplineEntity(const FECSEntity &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_SpeedGuideSplineEntity = __Value;
        return;
    }
    float32 GetExtraSpeedPctByGuideSpline() const property
    {
        return this.m_ExtraSpeedPctByGuideSpline;
    }
    void SetExtraSpeedPctByGuideSpline(const float32 __Value) property
    {
        if (this.m_ExtraSpeedPctByGuideSpline == __Value)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_ExtraSpeedPctByGuideSpline = __Value;
        return;
    }
    float32 GetCosineValueToSplineDirection() const property
    {
        return this.m_CosineValueToSplineDirection;
    }
    void SetCosineValueToSplineDirection(const float32 __Value) property
    {
        if (this.m_CosineValueToSplineDirection == __Value)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_CosineValueToSplineDirection = __Value;
        return;
    }
}

struct FSpeedSplineFXParamConfig
{
    UPROPERTY()
    FName FXParamName;
    UPROPERTY()
    float32 ParamTargetValue = 0.0f;
    UPROPERTY()
    float32 ParamDefaultValue = 0.0f;
    UPROPERTY()
    float32 BlendInTime = 0.0f;
    UPROPERTY()
    UCurveFloat BlendInWeightCurve = nullptr;
    UPROPERTY()
    float32 BlendOutTime = 0.0f;
    UPROPERTY()
    UCurveFloat BlendOutWeightCurve = nullptr;


}

struct FC_SpeedSplineFXParamConfig : FECSComponent
{
    UPROPERTY()
    TArray<FSpeedSplineFXParamConfig> FXParamConfigs;
    UPROPERTY()
    TArray<FSpeedSplineFXParamConfig> MaterialParamConfigs;

    FC_SpeedSplineFXParamConfig()
    {
        return;
    }
}

struct FSpeedSplineFXParamValue
{
    UPROPERTY()
    float32 ParamValue = 0.0f;
    UPROPERTY()
    float32 BlendStartValue = 0.0f;


}

struct FC_SpeedSplineFXParamValue : FECSComponent
{
    UPROPERTY()
    bool bIsBlendIn;
    UPROPERTY()
    FFPTime BlendStartTime;
    UPROPERTY()
    TArray<FSpeedSplineFXParamValue> FXParamValues;
    UPROPERTY()
    TArray<FSpeedSplineFXParamValue> MaterialParamValues;


}

namespace ECSFunc_FC_SpeedGuideSpline
{
UFUNCTION()
bool HasSpeedGuideSpline(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_SpeedGuideSpline);
}
FC_SpeedGuideSpline& AssignSpeedGuideSpline(const FECSEntity &inout Entity, const FC_SpeedGuideSpline &inout DefaultValue = FC_SpeedGuideSpline())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_SpeedGuideSpline, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignSpeedGuideSpline_BP(const FECSEntity &inout Entity, const FC_SpeedGuideSpline &inout DefaultValue = FC_SpeedGuideSpline())
{
    ECSFunc_FC_SpeedGuideSpline::AssignSpeedGuideSpline(Entity, DefaultValue);
    return;
}
FC_SpeedGuideSpline& ModifySpeedGuideSpline(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_SpeedGuideSpline));
    return local_12.GetComp();
}
FC_SpeedGuideSpline& ModifyOrAddSpeedGuideSpline(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_SpeedGuideSpline));
    return local_12.GetComp();
}
const FC_SpeedGuideSpline& GetSpeedGuideSpline(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_SpeedGuideSpline));
    return local_12.GetComp();
}
UFUNCTION()
FC_SpeedGuideSpline GetSpeedGuideSpline_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_SpeedGuideSpline __r;
    bValid = false;
    bValid = ECSFunc_FC_SpeedGuideSpline::GetSpeedGuideSpline(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_SpeedGuideSpline GetDefaultedSpeedGuideSpline(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_SpeedGuideSpline __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_SpeedGuideSpline);
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
FC_SpeedGuideSpline GetDefaultedSpeedGuideSpline_BP(const FECSEntity &inout Entity)
{
    FC_SpeedGuideSpline __r;
    return __r;
}
UFUNCTION()
bool RemoveSpeedGuideSpline(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_SpeedGuideSpline);
}
}
FECSMonitorRuntimeView __GetMonitorSpeedGuideSplineOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_SpeedGuideSpline, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSpeedGuideSplineOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_SpeedGuideSpline, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSpeedGuideSplineOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_SpeedGuideSpline, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSpeedGuideSplineOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_SpeedGuideSpline, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSpeedGuideSplineOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_SpeedGuideSpline, bFixedFrame, bMustHandleAll);
}
void __MonitorSpeedGuideSplineLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_SpeedGuideSpline, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorSpeedGuideSplineActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_SpeedGuideSpline, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorSpeedGuideSplineModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_SpeedGuideSpline, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_CharacterSpeedGuideSpline
{
UFUNCTION()
bool HasCharacterSpeedGuideSpline(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_CharacterSpeedGuideSpline);
}
FC_CharacterSpeedGuideSpline& AssignCharacterSpeedGuideSpline(const FECSEntity &inout Entity, const FC_CharacterSpeedGuideSpline &inout DefaultValue = FC_CharacterSpeedGuideSpline())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_CharacterSpeedGuideSpline, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignCharacterSpeedGuideSpline_BP(const FECSEntity &inout Entity, const FC_CharacterSpeedGuideSpline &inout DefaultValue = FC_CharacterSpeedGuideSpline())
{
    ECSFunc_FC_CharacterSpeedGuideSpline::AssignCharacterSpeedGuideSpline(Entity, DefaultValue);
    return;
}
FC_CharacterSpeedGuideSpline& ModifyCharacterSpeedGuideSpline(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_CharacterSpeedGuideSpline));
    return local_12.GetComp();
}
FC_CharacterSpeedGuideSpline& ModifyOrAddCharacterSpeedGuideSpline(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_CharacterSpeedGuideSpline));
    return local_12.GetComp();
}
const FC_CharacterSpeedGuideSpline& GetCharacterSpeedGuideSpline(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_CharacterSpeedGuideSpline));
    return local_12.GetComp();
}
UFUNCTION()
FC_CharacterSpeedGuideSpline GetCharacterSpeedGuideSpline_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_CharacterSpeedGuideSpline& local_4 = ECSFunc_FC_CharacterSpeedGuideSpline::GetCharacterSpeedGuideSpline(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_CharacterSpeedGuideSpline();
}
const FC_CharacterSpeedGuideSpline GetDefaultedCharacterSpeedGuideSpline(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_CharacterSpeedGuideSpline __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_CharacterSpeedGuideSpline);
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
FC_CharacterSpeedGuideSpline GetDefaultedCharacterSpeedGuideSpline_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_CharacterSpeedGuideSpline::GetDefaultedCharacterSpeedGuideSpline(Entity);
}
UFUNCTION()
bool RemoveCharacterSpeedGuideSpline(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_CharacterSpeedGuideSpline);
}
}
FECSMonitorRuntimeView __GetMonitorCharacterSpeedGuideSplineOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_CharacterSpeedGuideSpline, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCharacterSpeedGuideSplineOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_CharacterSpeedGuideSpline, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCharacterSpeedGuideSplineOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_CharacterSpeedGuideSpline, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCharacterSpeedGuideSplineOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_CharacterSpeedGuideSpline, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCharacterSpeedGuideSplineOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_CharacterSpeedGuideSpline, bFixedFrame, bMustHandleAll);
}
void __MonitorCharacterSpeedGuideSplineLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_CharacterSpeedGuideSpline, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCharacterSpeedGuideSplineActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_CharacterSpeedGuideSpline, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCharacterSpeedGuideSplineModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_CharacterSpeedGuideSpline, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_SpeedSplineFXParamConfig
{
UFUNCTION()
bool HasSpeedSplineFXParamConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_SpeedSplineFXParamConfig);
}
FC_SpeedSplineFXParamConfig& AssignSpeedSplineFXParamConfig(const FECSEntity &inout Entity, const FC_SpeedSplineFXParamConfig &inout DefaultValue = FC_SpeedSplineFXParamConfig())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_SpeedSplineFXParamConfig, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignSpeedSplineFXParamConfig_BP(const FECSEntity &inout Entity, const FC_SpeedSplineFXParamConfig &inout DefaultValue = FC_SpeedSplineFXParamConfig())
{
    ECSFunc_FC_SpeedSplineFXParamConfig::AssignSpeedSplineFXParamConfig(Entity, DefaultValue);
    return;
}
FC_SpeedSplineFXParamConfig& ModifySpeedSplineFXParamConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_SpeedSplineFXParamConfig));
    return local_12.GetComp();
}
FC_SpeedSplineFXParamConfig& ModifyOrAddSpeedSplineFXParamConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_SpeedSplineFXParamConfig));
    return local_12.GetComp();
}
const FC_SpeedSplineFXParamConfig& GetSpeedSplineFXParamConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_SpeedSplineFXParamConfig));
    return local_12.GetComp();
}
UFUNCTION()
FC_SpeedSplineFXParamConfig GetSpeedSplineFXParamConfig_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_SpeedSplineFXParamConfig __r;
    bValid = false;
    bValid = ECSFunc_FC_SpeedSplineFXParamConfig::GetSpeedSplineFXParamConfig(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_SpeedSplineFXParamConfig GetDefaultedSpeedSplineFXParamConfig(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_SpeedSplineFXParamConfig __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_SpeedSplineFXParamConfig);
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
FC_SpeedSplineFXParamConfig GetDefaultedSpeedSplineFXParamConfig_BP(const FECSEntity &inout Entity)
{
    FC_SpeedSplineFXParamConfig __r;
    return __r;
}
UFUNCTION()
bool RemoveSpeedSplineFXParamConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_SpeedSplineFXParamConfig);
}
}
FECSMonitorRuntimeView __GetMonitorSpeedSplineFXParamConfigOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_SpeedSplineFXParamConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSpeedSplineFXParamConfigOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_SpeedSplineFXParamConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSpeedSplineFXParamConfigOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_SpeedSplineFXParamConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSpeedSplineFXParamConfigOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_SpeedSplineFXParamConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSpeedSplineFXParamConfigOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_SpeedSplineFXParamConfig, bFixedFrame, bMustHandleAll);
}
void __MonitorSpeedSplineFXParamConfigLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_SpeedSplineFXParamConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorSpeedSplineFXParamConfigActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_SpeedSplineFXParamConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorSpeedSplineFXParamConfigModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_SpeedSplineFXParamConfig, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_SpeedSplineFXParamValue
{
UFUNCTION()
bool HasSpeedSplineFXParamValue(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_SpeedSplineFXParamValue);
}
FC_SpeedSplineFXParamValue& AssignSpeedSplineFXParamValue(const FECSEntity &inout Entity, const FC_SpeedSplineFXParamValue &inout DefaultValue = FC_SpeedSplineFXParamValue())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_SpeedSplineFXParamValue, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignSpeedSplineFXParamValue_BP(const FECSEntity &inout Entity, const FC_SpeedSplineFXParamValue &inout DefaultValue = FC_SpeedSplineFXParamValue())
{
    ECSFunc_FC_SpeedSplineFXParamValue::AssignSpeedSplineFXParamValue(Entity, DefaultValue);
    return;
}
FC_SpeedSplineFXParamValue& ModifySpeedSplineFXParamValue(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_SpeedSplineFXParamValue));
    return local_12.GetComp();
}
FC_SpeedSplineFXParamValue& ModifyOrAddSpeedSplineFXParamValue(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_SpeedSplineFXParamValue));
    return local_12.GetComp();
}
const FC_SpeedSplineFXParamValue& GetSpeedSplineFXParamValue(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_SpeedSplineFXParamValue));
    return local_12.GetComp();
}
UFUNCTION()
FC_SpeedSplineFXParamValue GetSpeedSplineFXParamValue_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_SpeedSplineFXParamValue __r;
    bValid = false;
    bValid = ECSFunc_FC_SpeedSplineFXParamValue::GetSpeedSplineFXParamValue(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_SpeedSplineFXParamValue GetDefaultedSpeedSplineFXParamValue(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_SpeedSplineFXParamValue __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_SpeedSplineFXParamValue);
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
FC_SpeedSplineFXParamValue GetDefaultedSpeedSplineFXParamValue_BP(const FECSEntity &inout Entity)
{
    FC_SpeedSplineFXParamValue __r;
    return __r;
}
UFUNCTION()
bool RemoveSpeedSplineFXParamValue(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_SpeedSplineFXParamValue);
}
}
FECSMonitorRuntimeView __GetMonitorSpeedSplineFXParamValueOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_SpeedSplineFXParamValue, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSpeedSplineFXParamValueOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_SpeedSplineFXParamValue, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSpeedSplineFXParamValueOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_SpeedSplineFXParamValue, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSpeedSplineFXParamValueOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_SpeedSplineFXParamValue, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSpeedSplineFXParamValueOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_SpeedSplineFXParamValue, bFixedFrame, bMustHandleAll);
}
void __MonitorSpeedSplineFXParamValueLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_SpeedSplineFXParamValue, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorSpeedSplineFXParamValueActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_SpeedSplineFXParamValue, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorSpeedSplineFXParamValueModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_SpeedSplineFXParamValue, bFixedFrame, Details);
    return;
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_CharacterSpeedGuideSpline &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_CharacterSpeedGuideSpline &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_CharacterSpeedGuideSpline &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_CharacterSpeedGuideSpline
{
int __IndexOf_SpeedGuideSplineEntity()
{
    return 0;
}
int __IndexOf_ExtraSpeedPctByGuideSpline()
{
    return 1;
}
int __IndexOf_CosineValueToSplineDirection()
{
    return 2;
}
}
