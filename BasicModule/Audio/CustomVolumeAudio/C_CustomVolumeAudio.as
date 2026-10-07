
enum ECustomVolumeAudioState
{
    Outside,
    Inside,
}

namespace __INTENRAL_FC_CustomVolumeAudio_NS
{
    const TECSComponentDerivedPtr<FC_CustomVolumeAudio> DerivedPtr = TECSComponentDerivedPtr<FC_CustomVolumeAudio>();
    const FC_CustomVolumeAudio DefaultValue = FC_CustomVolumeAudio();

}
struct FC_CustomVolumeAudio : FECSComponent
{
    UPROPERTY()
    ECustomVolumeAudioState AudioState = ECustomVolumeAudioState(0);
    UPROPERTY()
    FVector AudioPosition = FVector::ZeroVector;
    UPROPERTY()
    float32 DistanceToVolume = 0.0f;
    UPROPERTY()
    bool bIsAudioPlaying = false;
    UPROPERTY()
    int CurrentAudioID = -1;
    UPROPERTY()
    FVector NearestVolumePoint = FVector::ZeroVector;
    UPROPERTY()
    TWeakObjectPtr<ACustomConvexVolume> TargetVolume = nullptr;
    UPROPERTY()
    FVector LastAudioPosition = FVector::ZeroVector;
    UPROPERTY()
    float32 AttenuationRadius = 0.0f;
    UPROPERTY()
    ECustomAreaType VolumeAreaType = ECustomAreaType(0);


}

namespace ECSFunc_FC_CustomVolumeAudio
{
UFUNCTION()
bool HasCustomVolumeAudio(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_CustomVolumeAudio);
}
FC_CustomVolumeAudio& AssignCustomVolumeAudio(const FECSEntity &inout Entity, const FC_CustomVolumeAudio &inout DefaultValue = FC_CustomVolumeAudio())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_CustomVolumeAudio, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignCustomVolumeAudio_BP(const FECSEntity &inout Entity, const FC_CustomVolumeAudio &inout DefaultValue = FC_CustomVolumeAudio())
{
    ECSFunc_FC_CustomVolumeAudio::AssignCustomVolumeAudio(Entity, DefaultValue);
    return;
}
FC_CustomVolumeAudio& ModifyCustomVolumeAudio(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_CustomVolumeAudio));
    return local_12.GetComp();
}
FC_CustomVolumeAudio& ModifyOrAddCustomVolumeAudio(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_CustomVolumeAudio));
    return local_12.GetComp();
}
const FC_CustomVolumeAudio& GetCustomVolumeAudio(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_CustomVolumeAudio));
    return local_12.GetComp();
}
UFUNCTION()
FC_CustomVolumeAudio GetCustomVolumeAudio_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_CustomVolumeAudio __r;
    bValid = false;
    bValid = ECSFunc_FC_CustomVolumeAudio::GetCustomVolumeAudio(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_CustomVolumeAudio GetDefaultedCustomVolumeAudio(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_CustomVolumeAudio __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_CustomVolumeAudio);
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
FC_CustomVolumeAudio GetDefaultedCustomVolumeAudio_BP(const FECSEntity &inout Entity)
{
    FC_CustomVolumeAudio __r;
    return __r;
}
UFUNCTION()
bool RemoveCustomVolumeAudio(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_CustomVolumeAudio);
}
}
FECSMonitorRuntimeView __GetMonitorCustomVolumeAudioOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_CustomVolumeAudio, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCustomVolumeAudioOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_CustomVolumeAudio, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCustomVolumeAudioOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_CustomVolumeAudio, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCustomVolumeAudioOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_CustomVolumeAudio, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCustomVolumeAudioOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_CustomVolumeAudio, bFixedFrame, bMustHandleAll);
}
void __MonitorCustomVolumeAudioLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_CustomVolumeAudio, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCustomVolumeAudioActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_CustomVolumeAudio, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCustomVolumeAudioModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_CustomVolumeAudio, bFixedFrame, Details);
    return;
}
