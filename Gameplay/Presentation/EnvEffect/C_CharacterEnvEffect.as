
enum EGlobalEnvEffectWeatherType
{
    Rainy,
    Sandstorm,
}

namespace __INTENRAL_FC_CharacterEnvEffect_NS
{
    const TECSComponentDerivedPtr<FC_CharacterEnvEffect> DerivedPtr = TECSComponentDerivedPtr<FC_CharacterEnvEffect>();
    const FC_CharacterEnvEffect DefaultValue = FC_CharacterEnvEffect();
}
namespace __INTENRAL_FCS_GlobalEnvEffect_NS
{
    const TECSComponentDerivedPtr<FCS_GlobalEnvEffect> DerivedPtr = TECSComponentDerivedPtr<FCS_GlobalEnvEffect>();
    const FCS_GlobalEnvEffect DefaultValue = FCS_GlobalEnvEffect();

}
struct FCharacterEnvEffectGroundSettings
{
    UPROPERTY()
    float32 MoveStepAddValue = 0.1f;
    UPROPERTY()
    FName MoveMaterialParameterName;
    UPROPERTY()
    FRuntimeFloatCurve MoveFadeOutCurve = FRuntimeCurveUtils::CreateLinear(2.0f, 0.0f, 4.0f, 1.0f);
    UPROPERTY()
    FName FallMaterialParameterName;
    UPROPERTY()
    FRuntimeFloatCurve FallFadeOutCurve = FRuntimeCurveUtils::CreateLinear(2.0f, 0.0f, 4.0f, 1.0f);


}

class UCharacterEnvEffectSettings : UDataAsset
{
    UPROPERTY()
    FRuntimeFloatCurve WetnessFadeOutCurve = FRuntimeCurveUtils::CreateLinear(2.0f, 0.0f, 4.0f, 1.0f);
    UPROPERTY()
    FRuntimeFloatCurve WetnessDryFadeInCurve = FRuntimeCurveUtils::CreateLinear(3.0f, 0.0f, 4.0f, 1.0f);
    UPROPERTY()
    FRuntimeFloatCurve WetnessDeepDryFadeInCurve = FRuntimeCurveUtils::CreateLinear(2.0f, 0.0f, 4.0f, 1.0f);
    UPROPERTY()
    FRuntimeFloatCurve WetnessDryFadeOutCurve = FRuntimeCurveUtils::CreateLinear(0.0f, 0.0f, 1.0f, 1.0f);
    UPROPERTY()
    FRuntimeFloatCurve WetnessDeepDryFadeOutCurve = FRuntimeCurveUtils::CreateLinear(0.0f, 0.0f, 1.0f, 1.0f);
    UPROPERTY()
    TMap<EPhysicalSurface, FCharacterEnvEffectGroundSettings> GroundSettings;

    UCharacterEnvEffectSettings()
    {
        return;
    }
}

struct FGlobalEnvEffectWeatherSettings
{
    UPROPERTY()
    FName MaterialParameterName;
    UPROPERTY()
    FRuntimeFloatCurve FadeInCurce = FRuntimeCurveUtils::CreateLinear(0.0f, 0.0f, 1.0f, 1.0f);
    UPROPERTY()
    FRuntimeFloatCurve FadeOutCurce = FRuntimeCurveUtils::CreateLinear(2.0f, 0.0f, 4.0f, 1.0f);

    FGlobalEnvEffectWeatherSettings()
    {
        return;
    }
}

class UGlobalEnvEffectSettings : UDataAsset
{
    UPROPERTY()
    UMaterialParameterCollection WeatherMPC;
    UPROPERTY()
    TMap<EGlobalEnvEffectWeatherType, FGlobalEnvEffectWeatherSettings> EnvEffectWeather;

    UGlobalEnvEffectSettings()
    {
        return;
    }
}

struct FCharacterEnvEffectGroundData
{
    UPROPERTY()
    float32 MoveDurationSeconds = 0.0f;
    UPROPERTY()
    float32 MoveWeight = 0.0f;
    UPROPERTY()
    float32 FallDurationSeconds;
    UPROPERTY()
    float32 FallWeight = 0.0f;


}

struct FC_CharacterEnvEffect : FECSComponent
{
    UPROPERTY()
    FECSMeshComponentProxy Mesh;
    UPROPERTY()
    float32 WetnessDeep;
    UPROPERTY()
    float32 WetnessShallowHeight;
    UPROPERTY()
    float32 WetnessDeepDry = 1.0f;
    UPROPERTY()
    float32 WetnessDry = 1.0f;
    UPROPERTY()
    float32 EnterWaterSeconds;
    UPROPERTY()
    float32 ExitWaterSeconds;
    UPROPERTY()
    UCharacterEnvEffectSettings Settings = nullptr;
    UPROPERTY()
    TMap<EPhysicalSurface, FCharacterEnvEffectGroundData> GroundData;


}

struct FGlobalEnvEffectWeatherData
{
    UPROPERTY()
    float32 Weight;
    UPROPERTY()
    float32 EnterDurationSeconds;
    UPROPERTY()
    float32 ExitDurationSeconds;


}

struct FCS_GlobalEnvEffect : FECSSingleton
{
    UPROPERTY()
    TMap<EGlobalEnvEffectWeatherType, FGlobalEnvEffectWeatherData> WeatherEffectData;

    FCS_GlobalEnvEffect()
    {
        return;
    }
}

namespace ECSFunc_FC_CharacterEnvEffect
{
UFUNCTION()
bool HasCharacterEnvEffect(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_CharacterEnvEffect);
}
FC_CharacterEnvEffect& AssignCharacterEnvEffect(const FECSEntity &inout Entity, const FC_CharacterEnvEffect &inout DefaultValue = FC_CharacterEnvEffect())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_CharacterEnvEffect, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignCharacterEnvEffect_BP(const FECSEntity &inout Entity, const FC_CharacterEnvEffect &inout DefaultValue = FC_CharacterEnvEffect())
{
    ECSFunc_FC_CharacterEnvEffect::AssignCharacterEnvEffect(Entity, DefaultValue);
    return;
}
FC_CharacterEnvEffect& ModifyCharacterEnvEffect(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_CharacterEnvEffect));
    return local_12.GetComp();
}
FC_CharacterEnvEffect& ModifyOrAddCharacterEnvEffect(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_CharacterEnvEffect));
    return local_12.GetComp();
}
const FC_CharacterEnvEffect& GetCharacterEnvEffect(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_CharacterEnvEffect));
    return local_12.GetComp();
}
UFUNCTION()
FC_CharacterEnvEffect GetCharacterEnvEffect_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_CharacterEnvEffect __r;
    bValid = false;
    bValid = ECSFunc_FC_CharacterEnvEffect::GetCharacterEnvEffect(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_CharacterEnvEffect GetDefaultedCharacterEnvEffect(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_CharacterEnvEffect __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_CharacterEnvEffect);
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
FC_CharacterEnvEffect GetDefaultedCharacterEnvEffect_BP(const FECSEntity &inout Entity)
{
    FC_CharacterEnvEffect __r;
    return __r;
}
UFUNCTION()
bool RemoveCharacterEnvEffect(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_CharacterEnvEffect);
}
}
FECSMonitorRuntimeView __GetMonitorCharacterEnvEffectOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_CharacterEnvEffect, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCharacterEnvEffectOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_CharacterEnvEffect, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCharacterEnvEffectOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_CharacterEnvEffect, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCharacterEnvEffectOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_CharacterEnvEffect, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCharacterEnvEffectOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_CharacterEnvEffect, bFixedFrame, bMustHandleAll);
}
void __MonitorCharacterEnvEffectLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_CharacterEnvEffect, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCharacterEnvEffectActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_CharacterEnvEffect, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCharacterEnvEffectModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_CharacterEnvEffect, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FCS_GlobalEnvEffect
{
UFUNCTION()
bool HasGlobalEnvEffect(const FECSWorldPtr &inout World)
{
    return ECSInternal::Has(World, ENTITY_ID_NULL, FCS_GlobalEnvEffect);
}
FCS_GlobalEnvEffect& AssignGlobalEnvEffect(const FECSWorldPtr &inout World, const FCS_GlobalEnvEffect &inout DefaultValue = FCS_GlobalEnvEffect())
{
    UScriptStruct local_6 = FCS_GlobalEnvEffect;
    FECSComponentPtr local_8;
    int local_10 = local_8 = ECSInternal::Assign(World, ENTITY_ID_NULL, local_6, FECSComponentPtr(DefaultValue));
    local_10.InternalSet(local_8);
    return local_10.GetComp();
}
UFUNCTION()
void AssignGlobalEnvEffect_BP(const FECSWorldPtr &inout World, const FCS_GlobalEnvEffect &inout DefaultValue = FCS_GlobalEnvEffect())
{
    ECSFunc_FCS_GlobalEnvEffect::AssignGlobalEnvEffect(World, DefaultValue);
    return;
}
FCS_GlobalEnvEffect& ModifyGlobalEnvEffect(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_GlobalEnvEffect;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Modify(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
FCS_GlobalEnvEffect& ModifyOrAddGlobalEnvEffect(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_GlobalEnvEffect;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::ModifyOrAdd(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
const FCS_GlobalEnvEffect& GetGlobalEnvEffect(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_GlobalEnvEffect;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Get(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
UFUNCTION()
FCS_GlobalEnvEffect GetGlobalEnvEffect_BP(const FECSWorldPtr &inout World, bool &out bValid)
{
    FCS_GlobalEnvEffect __r;
    bValid = false;
    bValid = ECSFunc_FCS_GlobalEnvEffect::GetGlobalEnvEffect(World);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FCS_GlobalEnvEffect GetDefaultedGlobalEnvEffect(const FECSWorldPtr &inout World)
{
    int local_10 = 0;
    const FCS_GlobalEnvEffect __r;
    FECSComponentPtr local_6 = ECSInternal::GetDefaulted(World, ENTITY_ID_NULL, FCS_GlobalEnvEffect);
    if ((local_6 == nullptr))
    {
    }
    else
    {
        local_10.InternalSet(local_6);
        return local_10.GetComp();
    }
    return __r;
}
UFUNCTION()
FCS_GlobalEnvEffect GetDefaultedGlobalEnvEffect_BP(const FECSWorldPtr &inout World)
{
    FCS_GlobalEnvEffect __r;
    return __r;
}
UFUNCTION()
bool RemoveGlobalEnvEffect(const FECSWorldPtr &inout World)
{
    return ECSInternal::Remove(World, ENTITY_ID_NULL, FCS_GlobalEnvEffect);
}
}
void __MonitorGlobalEnvEffectLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FCS_GlobalEnvEffect, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorGlobalEnvEffectActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FCS_GlobalEnvEffect, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorGlobalEnvEffectModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FCS_GlobalEnvEffect, bFixedFrame, Details);
    return;
}
