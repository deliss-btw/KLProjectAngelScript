
namespace __INTENRAL_FC_BreathAudioConfig_NS
{
    const TECSComponentDerivedPtr<FC_BreathAudioConfig> DerivedPtr = TECSComponentDerivedPtr<FC_BreathAudioConfig>();
    const FC_BreathAudioConfig DefaultValue = FC_BreathAudioConfig();
}
namespace __INTENRAL_FC_BreathAudio_NS
{
    const TECSComponentDerivedPtr<FC_BreathAudio> DerivedPtr = TECSComponentDerivedPtr<FC_BreathAudio>();
    const FC_BreathAudio DefaultValue = FC_BreathAudio();

}
struct FC_BreathAudioConfig : FECSComponent
{
    UPROPERTY()
    UBreathAudioSettings Settings;

    FC_BreathAudioConfig()
    {
        return;
    }
}

struct FC_BreathAudio : FECSComponent
{
    UPROPERTY()
    TSoftObjectPtr<UAkAudioEvent> CurrentAudioEvent;
    UPROPERTY()
    TSoftObjectPtr<UAkAudioEvent> CurrentStopAudioEvent;
    UPROPERTY()
    int CurrentSoundId;
    UPROPERTY()
    TSoftObjectPtr<UAkAudioEvent> NextBreathAudioEvent;
    UPROPERTY()
    TSoftObjectPtr<UAkAudioEvent> NextBreathStopAudioEvent;
    UPROPERTY()
    TSoftObjectPtr<UAkAudioEvent> NextReactionAudioEvent;
    UPROPERTY()
    TSoftObjectPtr<UAkAudioEvent> NextReactionStopAudioEvent;
    UPROPERTY()
    float32 BreathWeight;
    UPROPERTY()
    bool bBreathStateSet;
    UPROPERTY()
    EBreathAudioState BreathState;
    UPROPERTY()
    EBreathAudioState PrevBreathState;
    UPROPERTY()
    bool bIsInCombat;
    UPROPERTY()
    TSoftObjectPtr<UBreathAudioSettings> Settings;

    FC_BreathAudio()
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
}

namespace ECSFunc_FC_BreathAudioConfig
{
UFUNCTION()
bool HasBreathAudioConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_BreathAudioConfig);
}
FC_BreathAudioConfig& AssignBreathAudioConfig(const FECSEntity &inout Entity, const FC_BreathAudioConfig &inout DefaultValue = FC_BreathAudioConfig())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_BreathAudioConfig, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignBreathAudioConfig_BP(const FECSEntity &inout Entity, const FC_BreathAudioConfig &inout DefaultValue = FC_BreathAudioConfig())
{
    ECSFunc_FC_BreathAudioConfig::AssignBreathAudioConfig(Entity, DefaultValue);
    return;
}
FC_BreathAudioConfig& ModifyBreathAudioConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_BreathAudioConfig));
    return local_12.GetComp();
}
FC_BreathAudioConfig& ModifyOrAddBreathAudioConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_BreathAudioConfig));
    return local_12.GetComp();
}
const FC_BreathAudioConfig& GetBreathAudioConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_BreathAudioConfig));
    return local_12.GetComp();
}
UFUNCTION()
FC_BreathAudioConfig GetBreathAudioConfig_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_BreathAudioConfig& local_4 = ECSFunc_FC_BreathAudioConfig::GetBreathAudioConfig(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_BreathAudioConfig();
}
const FC_BreathAudioConfig GetDefaultedBreathAudioConfig(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_BreathAudioConfig __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_BreathAudioConfig);
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
FC_BreathAudioConfig GetDefaultedBreathAudioConfig_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_BreathAudioConfig::GetDefaultedBreathAudioConfig(Entity);
}
UFUNCTION()
bool RemoveBreathAudioConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_BreathAudioConfig);
}
}
FECSMonitorRuntimeView __GetMonitorBreathAudioConfigOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_BreathAudioConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorBreathAudioConfigOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_BreathAudioConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorBreathAudioConfigOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_BreathAudioConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorBreathAudioConfigOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_BreathAudioConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorBreathAudioConfigOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_BreathAudioConfig, bFixedFrame, bMustHandleAll);
}
void __MonitorBreathAudioConfigLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_BreathAudioConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorBreathAudioConfigActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_BreathAudioConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorBreathAudioConfigModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_BreathAudioConfig, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_BreathAudio
{
UFUNCTION()
bool HasBreathAudio(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_BreathAudio);
}
FC_BreathAudio& AssignBreathAudio(const FECSEntity &inout Entity, const FC_BreathAudio &inout DefaultValue = FC_BreathAudio())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_BreathAudio, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignBreathAudio_BP(const FECSEntity &inout Entity, const FC_BreathAudio &inout DefaultValue = FC_BreathAudio())
{
    ECSFunc_FC_BreathAudio::AssignBreathAudio(Entity, DefaultValue);
    return;
}
FC_BreathAudio& ModifyBreathAudio(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_BreathAudio));
    return local_12.GetComp();
}
FC_BreathAudio& ModifyOrAddBreathAudio(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_BreathAudio));
    return local_12.GetComp();
}
const FC_BreathAudio& GetBreathAudio(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_BreathAudio));
    return local_12.GetComp();
}
UFUNCTION()
FC_BreathAudio GetBreathAudio_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_BreathAudio __r;
    bValid = false;
    bValid = ECSFunc_FC_BreathAudio::GetBreathAudio(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_BreathAudio GetDefaultedBreathAudio(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_BreathAudio __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_BreathAudio);
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
FC_BreathAudio GetDefaultedBreathAudio_BP(const FECSEntity &inout Entity)
{
    FC_BreathAudio __r;
    return __r;
}
UFUNCTION()
bool RemoveBreathAudio(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_BreathAudio);
}
}
FECSMonitorRuntimeView __GetMonitorBreathAudioOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_BreathAudio, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorBreathAudioOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_BreathAudio, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorBreathAudioOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_BreathAudio, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorBreathAudioOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_BreathAudio, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorBreathAudioOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_BreathAudio, bFixedFrame, bMustHandleAll);
}
void __MonitorBreathAudioLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_BreathAudio, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorBreathAudioActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_BreathAudio, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorBreathAudioModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_BreathAudio, bFixedFrame, Details);
    return;
}
