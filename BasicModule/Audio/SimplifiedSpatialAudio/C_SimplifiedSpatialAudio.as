
enum ESpatialAudioLODLevel
{
    Disabled,
    Basic3D,
    SimpleReflection,
    FullReflection,
}

namespace __INTENRAL_FC_SimplifiedSpatialAudio_NS
{
    const TECSComponentDerivedPtr<FC_SimplifiedSpatialAudio> DerivedPtr = TECSComponentDerivedPtr<FC_SimplifiedSpatialAudio>();
    const FC_SimplifiedSpatialAudio DefaultValue = FC_SimplifiedSpatialAudio();

}
struct FSimplifiedSpatialAudioLODSettings
{
    UPROPERTY()
    float32 DisabledDistance = 500.0f;
    UPROPERTY()
    float32 Basic3DDistance = 200.0f;
    UPROPERTY()
    float32 SimpleReflectionDistance = 100.0f;
    UPROPERTY()
    float32 FullReflectionDistance = 50.0f;
    UPROPERTY()
    int MaxReflectionRays = 8;
    UPROPERTY()
    float32 ReflectionUpdateInterval = 0.1f;
    UPROPERTY()
    bool bEnableAsyncCalculation = true;
    UPROPERTY()
    float32 MaxUpdateTime = 1.0f;


}

struct FC_SimplifiedSpatialAudio : FECSComponent
{
    UPROPERTY()
    FVector VolumeCenter;
    UPROPERTY()
    FVector VolumeExtent = FVector(100.0, 100.0, 100.0);
    UPROPERTY()
    float32 ReverbTime = 1.0f;
    UPROPERTY()
    float32 ReverbGain = 0.5f;
    UPROPERTY()
    float32 MaxReflectionDistance = 100.0f;
    UPROPERTY()
    bool bEnableReflections = true;
    UPROPERTY()
    bool bEnableReverb = true;
    UPROPERTY()
    int MaxReflectionRays = 8;
    UPROPERTY()
    TArray<FVector> ReflectionPoints;
    UPROPERTY()
    TArray<FPlane> ReflectionPlanes;
    UPROPERTY()
    bool bReflectionDataPrecomputed = false;
    UPROPERTY()
    ESpatialAudioLODLevel CurrentLODLevel = ESpatialAudioLODLevel(1);
    UPROPERTY()
    float32 LastUpdateTime = 0.0f;
    UPROPERTY()
    TArray<FVector> CurrentReflectionPoints;
    UPROPERTY()
    float32 CurrentReverbValue = 0.0f;
    UPROPERTY()
    bool bIsActive = false;
    UPROPERTY()
    float32 AverageUpdateTime = 0.0f;
    UPROPERTY()
    int UpdateCount = 0;


}

namespace ECSFunc_FC_SimplifiedSpatialAudio
{
UFUNCTION()
bool HasSimplifiedSpatialAudio(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_SimplifiedSpatialAudio);
}
FC_SimplifiedSpatialAudio& AssignSimplifiedSpatialAudio(const FECSEntity &inout Entity, const FC_SimplifiedSpatialAudio &inout DefaultValue = FC_SimplifiedSpatialAudio())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_SimplifiedSpatialAudio, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignSimplifiedSpatialAudio_BP(const FECSEntity &inout Entity, const FC_SimplifiedSpatialAudio &inout DefaultValue = FC_SimplifiedSpatialAudio())
{
    ECSFunc_FC_SimplifiedSpatialAudio::AssignSimplifiedSpatialAudio(Entity, DefaultValue);
    return;
}
FC_SimplifiedSpatialAudio& ModifySimplifiedSpatialAudio(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_SimplifiedSpatialAudio));
    return local_12.GetComp();
}
FC_SimplifiedSpatialAudio& ModifyOrAddSimplifiedSpatialAudio(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_SimplifiedSpatialAudio));
    return local_12.GetComp();
}
const FC_SimplifiedSpatialAudio& GetSimplifiedSpatialAudio(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_SimplifiedSpatialAudio));
    return local_12.GetComp();
}
UFUNCTION()
FC_SimplifiedSpatialAudio GetSimplifiedSpatialAudio_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_SimplifiedSpatialAudio __r;
    bValid = false;
    bValid = ECSFunc_FC_SimplifiedSpatialAudio::GetSimplifiedSpatialAudio(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_SimplifiedSpatialAudio GetDefaultedSimplifiedSpatialAudio(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_SimplifiedSpatialAudio __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_SimplifiedSpatialAudio);
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
FC_SimplifiedSpatialAudio GetDefaultedSimplifiedSpatialAudio_BP(const FECSEntity &inout Entity)
{
    FC_SimplifiedSpatialAudio __r;
    return __r;
}
UFUNCTION()
bool RemoveSimplifiedSpatialAudio(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_SimplifiedSpatialAudio);
}
}
FECSMonitorRuntimeView __GetMonitorSimplifiedSpatialAudioOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_SimplifiedSpatialAudio, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSimplifiedSpatialAudioOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_SimplifiedSpatialAudio, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSimplifiedSpatialAudioOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_SimplifiedSpatialAudio, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSimplifiedSpatialAudioOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_SimplifiedSpatialAudio, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSimplifiedSpatialAudioOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_SimplifiedSpatialAudio, bFixedFrame, bMustHandleAll);
}
void __MonitorSimplifiedSpatialAudioLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_SimplifiedSpatialAudio, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorSimplifiedSpatialAudioActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_SimplifiedSpatialAudio, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorSimplifiedSpatialAudioModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_SimplifiedSpatialAudio, bFixedFrame, Details);
    return;
}
