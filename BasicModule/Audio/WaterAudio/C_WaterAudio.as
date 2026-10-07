
enum EWaterAudioState
{
    Outside,
    Inside,
}

namespace __INTENRAL_FC_WaterAudio_NS
{
    const TECSComponentDerivedPtr<FC_WaterAudio> DerivedPtr = TECSComponentDerivedPtr<FC_WaterAudio>();
    const FC_WaterAudio DefaultValue = FC_WaterAudio();

}
struct FC_WaterAudio : FECSComponent
{
    UPROPERTY()
    EWaterAudioState AudioState = EWaterAudioState(0);
    UPROPERTY()
    FVector AudioPosition = FVector::ZeroVector;
    UPROPERTY()
    float32 DistanceToWater = 0.0f;
    UPROPERTY()
    bool bIsAudioPlaying = false;
    UPROPERTY()
    int CurrentAudioID = -1;
    UPROPERTY()
    FVector NearestWaterPoint = FVector::ZeroVector;
    UPROPERTY()
    TObjectPtr<AWaterBodyLake> TargetWaterBody = nullptr;
    UPROPERTY()
    FVector LastAudioPosition = FVector::ZeroVector;
    UPROPERTY()
    float32 AttenuationRadius = 0.0f;


}

namespace ECSFunc_FC_WaterAudio
{
UFUNCTION()
bool HasWaterAudio(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_WaterAudio);
}
FC_WaterAudio& AssignWaterAudio(const FECSEntity &inout Entity, const FC_WaterAudio &inout DefaultValue = FC_WaterAudio())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_WaterAudio, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignWaterAudio_BP(const FECSEntity &inout Entity, const FC_WaterAudio &inout DefaultValue = FC_WaterAudio())
{
    ECSFunc_FC_WaterAudio::AssignWaterAudio(Entity, DefaultValue);
    return;
}
FC_WaterAudio& ModifyWaterAudio(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_WaterAudio));
    return local_12.GetComp();
}
FC_WaterAudio& ModifyOrAddWaterAudio(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_WaterAudio));
    return local_12.GetComp();
}
const FC_WaterAudio& GetWaterAudio(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_WaterAudio));
    return local_12.GetComp();
}
UFUNCTION()
FC_WaterAudio GetWaterAudio_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_WaterAudio __r;
    bValid = false;
    bValid = ECSFunc_FC_WaterAudio::GetWaterAudio(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_WaterAudio GetDefaultedWaterAudio(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_WaterAudio __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_WaterAudio);
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
FC_WaterAudio GetDefaultedWaterAudio_BP(const FECSEntity &inout Entity)
{
    FC_WaterAudio __r;
    return __r;
}
UFUNCTION()
bool RemoveWaterAudio(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_WaterAudio);
}
}
FECSMonitorRuntimeView __GetMonitorWaterAudioOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_WaterAudio, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorWaterAudioOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_WaterAudio, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorWaterAudioOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_WaterAudio, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorWaterAudioOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_WaterAudio, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorWaterAudioOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_WaterAudio, bFixedFrame, bMustHandleAll);
}
void __MonitorWaterAudioLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_WaterAudio, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorWaterAudioActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_WaterAudio, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorWaterAudioModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_WaterAudio, bFixedFrame, Details);
    return;
}
