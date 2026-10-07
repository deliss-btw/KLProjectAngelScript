
namespace __INTENRAL_FC_RegionEntry_NS
{
    const TECSComponentDerivedPtr<FC_RegionEntry> DerivedPtr = TECSComponentDerivedPtr<FC_RegionEntry>();
    const FC_RegionEntry DefaultValue = FC_RegionEntry();
}
namespace __INTENRAL_FC_RegionExit_NS
{
    const TECSComponentDerivedPtr<FC_RegionExit> DerivedPtr = TECSComponentDerivedPtr<FC_RegionExit>();
    const FC_RegionExit DefaultValue = FC_RegionExit();
}
namespace __INTENRAL_FC_CharacterAudioRegionEntity_NS
{
    const TECSComponentDerivedPtr<FC_CharacterAudioRegionEntity> DerivedPtr = TECSComponentDerivedPtr<FC_CharacterAudioRegionEntity>();
    const FC_CharacterAudioRegionEntity DefaultValue = FC_CharacterAudioRegionEntity();
}
namespace __INTENRAL_FC_PlayerBGMInfo_NS
{
    const TECSComponentDerivedPtr<FC_PlayerBGMInfo> DerivedPtr = TECSComponentDerivedPtr<FC_PlayerBGMInfo>();
    const FC_PlayerBGMInfo DefaultValue = FC_PlayerBGMInfo();
}
namespace __INTENRAL_FC_PlayerBgmToPending_NS
{
    const TECSComponentDerivedPtr<FC_PlayerBgmToPending> DerivedPtr = TECSComponentDerivedPtr<FC_PlayerBgmToPending>();
    const FC_PlayerBgmToPending DefaultValue = FC_PlayerBgmToPending();
}
namespace __INTENRAL_FCS_MapAudioBGM_NS
{
    const TECSComponentDerivedPtr<FCS_MapAudioBGM> DerivedPtr = TECSComponentDerivedPtr<FCS_MapAudioBGM>();
    const FCS_MapAudioBGM DefaultValue = FCS_MapAudioBGM();
}
namespace __INTENRAL_FC_MonsterBGMConfig_NS
{
    const TECSComponentDerivedPtr<FC_MonsterBGMConfig> DerivedPtr = TECSComponentDerivedPtr<FC_MonsterBGMConfig>();
    const FC_MonsterBGMConfig DefaultValue = FC_MonsterBGMConfig();
}
namespace __INTENRAL_FC_CurrentPlayingSoundIdList_NS
{
    const TECSComponentDerivedPtr<FC_CurrentPlayingSoundIdList> DerivedPtr = TECSComponentDerivedPtr<FC_CurrentPlayingSoundIdList>();
    const FC_CurrentPlayingSoundIdList DefaultValue = FC_CurrentPlayingSoundIdList();
}
namespace __INTENRAL_FC_CharacterAudioConfig_NS
{
    const TECSComponentDerivedPtr<FC_CharacterAudioConfig> DerivedPtr = TECSComponentDerivedPtr<FC_CharacterAudioConfig>();
    const FC_CharacterAudioConfig DefaultValue = FC_CharacterAudioConfig();
}
namespace __INTENRAL_FCE_ClientToServerAudioInput_NS
{
    const TECSEventDerivedPtr<FCE_ClientToServerAudioInput> DerivedPtr = TECSEventDerivedPtr<FCE_ClientToServerAudioInput>();
}
namespace __INTENRAL_FCE_ServerToClientAudioPlayEvent_NS
{
    const TECSEventDerivedPtr<FCE_ServerToClientAudioPlayEvent> DerivedPtr = TECSEventDerivedPtr<FCE_ServerToClientAudioPlayEvent>();
}
namespace __INTENRAL_FCE_LevelClientAudioPlayRequest_NS
{
    const TECSEventDerivedPtr<FCE_LevelClientAudioPlayRequest> DerivedPtr = TECSEventDerivedPtr<FCE_LevelClientAudioPlayRequest>();
}
namespace __INTENRAL_FCE_LevelServerToClientAudioPlayRequest_NS
{
    const TECSEventDerivedPtr<FCE_LevelServerToClientAudioPlayRequest> DerivedPtr = TECSEventDerivedPtr<FCE_LevelServerToClientAudioPlayRequest>();
}
namespace __INTENRAL_FCE_TimeOfDayChangeEvent_NS
{
    const TECSEventDerivedPtr<FCE_TimeOfDayChangeEvent> DerivedPtr = TECSEventDerivedPtr<FCE_TimeOfDayChangeEvent>();

}
struct FC_RegionEntry : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    FECSEntity m_RegionEntity;
    UPROPERTY()
    FName m_RegionName;
    UPROPERTY()
    FName m_RegionVolumeName;

    FC_RegionEntry()
    {
        this.__InitDirtyFlags();
        return;
    }
    FC_RegionEntry(const FC_RegionEntry &inout Other)
    {
        this.__InitDirtyFlags();
        this.m_RegionEntity = Other.m_RegionEntity;
        this.m_RegionName = Other.m_RegionName;
        this.m_RegionVolumeName = Other.m_RegionVolumeName;
        return;
    }
    FC_RegionEntry opAssign(const FC_RegionEntry &inout Other)
    {
        FC_RegionEntry __r;
        this.SetRegionEntity(Other.GetRegionEntity());
        this.SetRegionName(Other.GetRegionName());
        this.SetRegionVolumeName(Other.GetRegionVolumeName());
        return __r;
    }
    const FECSEntity GetRegionEntity() const property
    {
        const FECSEntity __r;
        return __r;
    }
    FECSEntity GetModify_RegionEntity() property
    {
        FECSEntity __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetRegionEntity(const FECSEntity &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_RegionEntity = __Value;
        return;
    }
    FName GetRegionName() const property
    {
        return this.m_RegionName;
    }
    void SetRegionName(const FName &inout __Value) property
    {
        if ((this.m_RegionName == __Value))
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_RegionName = __Value;
        return;
    }
    FName GetRegionVolumeName() const property
    {
        return this.m_RegionVolumeName;
    }
    void SetRegionVolumeName(const FName &inout __Value) property
    {
        if ((this.m_RegionVolumeName == __Value))
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_RegionVolumeName = __Value;
        return;
    }
}

struct FC_RegionExit : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    FECSEntity m_RegionEntity;
    UPROPERTY()
    FName m_RegionName;
    UPROPERTY()
    FName m_RegionVolumeName;

    FC_RegionExit()
    {
        this.__InitDirtyFlags();
        return;
    }
    FC_RegionExit(const FC_RegionExit &inout Other)
    {
        this.__InitDirtyFlags();
        this.m_RegionEntity = Other.m_RegionEntity;
        this.m_RegionName = Other.m_RegionName;
        this.m_RegionVolumeName = Other.m_RegionVolumeName;
        return;
    }
    FC_RegionExit opAssign(const FC_RegionExit &inout Other)
    {
        FC_RegionExit __r;
        this.SetRegionEntity(Other.GetRegionEntity());
        this.SetRegionName(Other.GetRegionName());
        this.SetRegionVolumeName(Other.GetRegionVolumeName());
        return __r;
    }
    const FECSEntity GetRegionEntity() const property
    {
        const FECSEntity __r;
        return __r;
    }
    FECSEntity GetModify_RegionEntity() property
    {
        FECSEntity __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetRegionEntity(const FECSEntity &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_RegionEntity = __Value;
        return;
    }
    FName GetRegionName() const property
    {
        return this.m_RegionName;
    }
    void SetRegionName(const FName &inout __Value) property
    {
        if ((this.m_RegionName == __Value))
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_RegionName = __Value;
        return;
    }
    FName GetRegionVolumeName() const property
    {
        return this.m_RegionVolumeName;
    }
    void SetRegionVolumeName(const FName &inout __Value) property
    {
        if ((this.m_RegionVolumeName == __Value))
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_RegionVolumeName = __Value;
        return;
    }
}

struct FC_CharacterAudioRegionEntity : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    FECSEntity m_RegionEntity;
    UPROPERTY()
    FName m_RegionName;
    UPROPERTY()
    FName m_RegionVolumeName;

    FC_CharacterAudioRegionEntity()
    {
        this.m_RegionName = n"Region_Default";
        this.__InitDirtyFlags();
        return;
    }
    FC_CharacterAudioRegionEntity(const FC_CharacterAudioRegionEntity &inout Other)
    {
        this.m_RegionName = n"Region_Default";
        this.__InitDirtyFlags();
        this.m_RegionEntity = Other.m_RegionEntity;
        this.m_RegionName = Other.m_RegionName;
        this.m_RegionVolumeName = Other.m_RegionVolumeName;
        return;
    }
    FC_CharacterAudioRegionEntity opAssign(const FC_CharacterAudioRegionEntity &inout Other)
    {
        FC_CharacterAudioRegionEntity __r;
        this.SetRegionEntity(Other.GetRegionEntity());
        this.SetRegionName(Other.GetRegionName());
        this.SetRegionVolumeName(Other.GetRegionVolumeName());
        return __r;
    }
    const FECSEntity GetRegionEntity() const property
    {
        const FECSEntity __r;
        return __r;
    }
    FECSEntity GetModify_RegionEntity() property
    {
        FECSEntity __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetRegionEntity(const FECSEntity &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_RegionEntity = __Value;
        return;
    }
    FName GetRegionName() const property
    {
        return this.m_RegionName;
    }
    void SetRegionName(const FName &inout __Value) property
    {
        if ((this.m_RegionName == __Value))
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_RegionName = __Value;
        return;
    }
    FName GetRegionVolumeName() const property
    {
        return this.m_RegionVolumeName;
    }
    void SetRegionVolumeName(const FName &inout __Value) property
    {
        if ((this.m_RegionVolumeName == __Value))
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_RegionVolumeName = __Value;
        return;
    }
}

struct FC_PlayerBGMInfo : FECSComponent
{
    UPROPERTY()
    TSoftObjectPtr<UAkStateValue> CurrentBGMStateRef;
    UPROPERTY()
    TSoftObjectPtr<UAkAudioEvent> CurrentBGMEventRef;
    UPROPERTY()
    FECSEntity CombatBGMEntity;
    UPROPERTY()
    FFPTime TraceBGMStartTime = -1;

    FC_PlayerBGMInfo()
    {
        return;
    }
}

struct FC_PlayerBgmToPending : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    TSoftObjectPtr<UAkStateValue> m_State;
    UPROPERTY()
    TSoftObjectPtr<UAkAudioEvent> m_Event;

    FC_PlayerBgmToPending()
    {
        this.__InitDirtyFlags();
        return;
    }
    FC_PlayerBgmToPending(const FC_PlayerBgmToPending &inout Other)
    {
        this.__InitDirtyFlags();
        this.m_State = Other.m_State;
        this.m_Event = Other.m_Event;
        return;
    }
    FC_PlayerBgmToPending opAssign(const FC_PlayerBgmToPending &inout Other)
    {
        FC_PlayerBgmToPending __r;
        this.SetState(Other.GetState());
        this.SetEvent();
        return __r;
    }
    TSoftObjectPtr<UAkStateValue> GetState() const property
    {
        TSoftObjectPtr<UAkStateValue> __r;
        return __r;
    }
    TSoftObjectPtr<UAkStateValue> GetModify_State() property
    {
        TSoftObjectPtr<UAkStateValue> __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetState(const TSoftObjectPtr<UAkStateValue> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_State = __Value;
        return;
    }
    const TSoftObjectPtr<UAkAudioEvent> GetEvent() const property
    {
        const TSoftObjectPtr<UAkAudioEvent> __r;
        return __r;
    }
    TSoftObjectPtr<UAkAudioEvent> GetModify_Event() property
    {
        TSoftObjectPtr<UAkAudioEvent> __r;
        this.__MarkDirty(1);
        return __r;
    }
    void SetEvent(const TSoftObjectPtr<UAkAudioEvent> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_Event = __Value;
        return;
    }
}

struct FCS_MapAudioBGM : FECSSingleton
{
    UPROPERTY()
    TArray<FAudioActionData> AudioActionDataList;
    UPROPERTY()
    bool bPreloadRequested = false;


}

struct FAudioSyncInputData
{
    UPROPERTY()
    FName AudioEventName;
    UPROPERTY()
    FName SwitchName;
    UPROPERTY()
    bool bIsStop = false;


}

struct FC_MonsterBGMConfig : FECSComponent
{
    UPROPERTY()
    TSoftObjectPtr<UAkStateValue> CombatBGMStateRef;
    UPROPERTY()
    TSoftObjectPtr<UAkAudioEvent> CombatBGMEventRef;
    UPROPERTY()
    bool bOverrideTraceBGMDuration = false;
    UPROPERTY()
    float32 TraceBGMDuration = 60.0f;
    UPROPERTY()
    TSoftObjectPtr<UAkStateValue> TraceBGMStateRef;
    UPROPERTY()
    TSoftObjectPtr<UAkAudioEvent> TraceBGMEventRef;
    UPROPERTY()
    int TraceBGMInterruptStrength = 1;


}

struct FCE_ClientToServerAudioInput : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FName AudioEventName;
    UPROPERTY()
    FName SwitchName;
    UPROPERTY()
    bool bIsStop = false;


}

struct FCE_ServerToClientAudioPlayEvent : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FName AudioEventName;
    UPROPERTY()
    FName SwitchName;
    UPROPERTY()
    bool bIsStop = false;


}

struct FCE_LevelClientAudioPlayRequest : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FName AudioEventName;
    UPROPERTY()
    ESfxSourceType SourceType = ESfxSourceType(0);
    UPROPERTY()
    bool bFollow = false;
    UPROPERTY()
    EGameAudioEmitterPartType PartType = EGameAudioEmitterPartType(0);
    UPROPERTY()
    FName Socket;
    UPROPERTY()
    FVector LocationOffset = FVector::ZeroVector;
    UPROPERTY()
    FRotator RotationOffset = FRotator::ZeroRotator;
    UPROPERTY()
    bool bLocalSpace = true;
    UPROPERTY()
    bool bIsLoop = false;
    UPROPERTY()
    bool bLoopEnd = false;


}

struct FCE_LevelServerToClientAudioPlayRequest : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FName AudioEventName;
    UPROPERTY()
    ESfxSourceType SourceType = ESfxSourceType(0);
    UPROPERTY()
    bool bFollow = false;
    UPROPERTY()
    EGameAudioEmitterPartType PartType = EGameAudioEmitterPartType(0);
    UPROPERTY()
    FName Socket;
    UPROPERTY()
    FVector LocationOffset = FVector::ZeroVector;
    UPROPERTY()
    FRotator RotationOffset = FRotator::ZeroRotator;
    UPROPERTY()
    bool bLocalSpace = true;
    UPROPERTY()
    bool bIsLoop = false;
    UPROPERTY()
    bool bLoopEnd = false;


}

struct FCE_TimeOfDayChangeEvent : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    float32 IntegerTime;


}

struct FC_CurrentPlayingSoundIdList : FECSComponent
{
    UPROPERTY()
    TArray<int> SoundIdList;

    FC_CurrentPlayingSoundIdList()
    {
        return;
    }
}

struct FC_CharacterAudioConfig : FECSComponent
{
    UPROPERTY()
    TSoftObjectPtr<UAkSwitchValue> DefaultSwitchValue;

    FC_CharacterAudioConfig()
    {
        return;
    }
}

namespace ECSFunc_FC_RegionEntry
{
UFUNCTION()
bool HasRegionEntry(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_RegionEntry);
}
FC_RegionEntry& AssignRegionEntry(const FECSEntity &inout Entity, const FC_RegionEntry &inout DefaultValue = FC_RegionEntry())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_RegionEntry, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignRegionEntry_BP(const FECSEntity &inout Entity, const FC_RegionEntry &inout DefaultValue = FC_RegionEntry())
{
    ECSFunc_FC_RegionEntry::AssignRegionEntry(Entity, DefaultValue);
    return;
}
FC_RegionEntry& ModifyRegionEntry(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_RegionEntry));
    return local_12.GetComp();
}
FC_RegionEntry& ModifyOrAddRegionEntry(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_RegionEntry));
    return local_12.GetComp();
}
const FC_RegionEntry& GetRegionEntry(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_RegionEntry));
    return local_12.GetComp();
}
UFUNCTION()
FC_RegionEntry GetRegionEntry_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_RegionEntry& local_4 = ECSFunc_FC_RegionEntry::GetRegionEntry(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_RegionEntry();
}
const FC_RegionEntry GetDefaultedRegionEntry(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_RegionEntry __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_RegionEntry);
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
FC_RegionEntry GetDefaultedRegionEntry_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_RegionEntry::GetDefaultedRegionEntry(Entity);
}
UFUNCTION()
bool RemoveRegionEntry(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_RegionEntry);
}
}
FECSMonitorRuntimeView __GetMonitorRegionEntryOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_RegionEntry, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorRegionEntryOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_RegionEntry, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorRegionEntryOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_RegionEntry, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorRegionEntryOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_RegionEntry, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorRegionEntryOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_RegionEntry, bFixedFrame, bMustHandleAll);
}
void __MonitorRegionEntryLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_RegionEntry, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorRegionEntryActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_RegionEntry, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorRegionEntryModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_RegionEntry, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_RegionExit
{
UFUNCTION()
bool HasRegionExit(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_RegionExit);
}
FC_RegionExit& AssignRegionExit(const FECSEntity &inout Entity, const FC_RegionExit &inout DefaultValue = FC_RegionExit())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_RegionExit, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignRegionExit_BP(const FECSEntity &inout Entity, const FC_RegionExit &inout DefaultValue = FC_RegionExit())
{
    ECSFunc_FC_RegionExit::AssignRegionExit(Entity, DefaultValue);
    return;
}
FC_RegionExit& ModifyRegionExit(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_RegionExit));
    return local_12.GetComp();
}
FC_RegionExit& ModifyOrAddRegionExit(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_RegionExit));
    return local_12.GetComp();
}
const FC_RegionExit& GetRegionExit(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_RegionExit));
    return local_12.GetComp();
}
UFUNCTION()
FC_RegionExit GetRegionExit_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_RegionExit& local_4 = ECSFunc_FC_RegionExit::GetRegionExit(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_RegionExit();
}
const FC_RegionExit GetDefaultedRegionExit(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_RegionExit __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_RegionExit);
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
FC_RegionExit GetDefaultedRegionExit_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_RegionExit::GetDefaultedRegionExit(Entity);
}
UFUNCTION()
bool RemoveRegionExit(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_RegionExit);
}
}
FECSMonitorRuntimeView __GetMonitorRegionExitOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_RegionExit, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorRegionExitOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_RegionExit, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorRegionExitOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_RegionExit, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorRegionExitOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_RegionExit, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorRegionExitOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_RegionExit, bFixedFrame, bMustHandleAll);
}
void __MonitorRegionExitLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_RegionExit, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorRegionExitActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_RegionExit, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorRegionExitModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_RegionExit, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_CharacterAudioRegionEntity
{
UFUNCTION()
bool HasCharacterAudioRegionEntity(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_CharacterAudioRegionEntity);
}
FC_CharacterAudioRegionEntity& AssignCharacterAudioRegionEntity(const FECSEntity &inout Entity, const FC_CharacterAudioRegionEntity &inout DefaultValue = FC_CharacterAudioRegionEntity())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_CharacterAudioRegionEntity, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignCharacterAudioRegionEntity_BP(const FECSEntity &inout Entity, const FC_CharacterAudioRegionEntity &inout DefaultValue = FC_CharacterAudioRegionEntity())
{
    ECSFunc_FC_CharacterAudioRegionEntity::AssignCharacterAudioRegionEntity(Entity, DefaultValue);
    return;
}
FC_CharacterAudioRegionEntity& ModifyCharacterAudioRegionEntity(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_CharacterAudioRegionEntity));
    return local_12.GetComp();
}
FC_CharacterAudioRegionEntity& ModifyOrAddCharacterAudioRegionEntity(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_CharacterAudioRegionEntity));
    return local_12.GetComp();
}
const FC_CharacterAudioRegionEntity& GetCharacterAudioRegionEntity(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_CharacterAudioRegionEntity));
    return local_12.GetComp();
}
UFUNCTION()
FC_CharacterAudioRegionEntity GetCharacterAudioRegionEntity_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_CharacterAudioRegionEntity& local_4 = ECSFunc_FC_CharacterAudioRegionEntity::GetCharacterAudioRegionEntity(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_CharacterAudioRegionEntity();
}
const FC_CharacterAudioRegionEntity GetDefaultedCharacterAudioRegionEntity(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_CharacterAudioRegionEntity __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_CharacterAudioRegionEntity);
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
FC_CharacterAudioRegionEntity GetDefaultedCharacterAudioRegionEntity_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_CharacterAudioRegionEntity::GetDefaultedCharacterAudioRegionEntity(Entity);
}
UFUNCTION()
bool RemoveCharacterAudioRegionEntity(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_CharacterAudioRegionEntity);
}
}
FECSMonitorRuntimeView __GetMonitorCharacterAudioRegionEntityOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_CharacterAudioRegionEntity, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCharacterAudioRegionEntityOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_CharacterAudioRegionEntity, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCharacterAudioRegionEntityOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_CharacterAudioRegionEntity, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCharacterAudioRegionEntityOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_CharacterAudioRegionEntity, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCharacterAudioRegionEntityOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_CharacterAudioRegionEntity, bFixedFrame, bMustHandleAll);
}
void __MonitorCharacterAudioRegionEntityLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_CharacterAudioRegionEntity, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCharacterAudioRegionEntityActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_CharacterAudioRegionEntity, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCharacterAudioRegionEntityModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_CharacterAudioRegionEntity, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_PlayerBGMInfo
{
UFUNCTION()
bool HasPlayerBGMInfo(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_PlayerBGMInfo);
}
FC_PlayerBGMInfo& AssignPlayerBGMInfo(const FECSEntity &inout Entity, const FC_PlayerBGMInfo &inout DefaultValue = FC_PlayerBGMInfo())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_PlayerBGMInfo, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignPlayerBGMInfo_BP(const FECSEntity &inout Entity, const FC_PlayerBGMInfo &inout DefaultValue = FC_PlayerBGMInfo())
{
    ECSFunc_FC_PlayerBGMInfo::AssignPlayerBGMInfo(Entity, DefaultValue);
    return;
}
FC_PlayerBGMInfo& ModifyPlayerBGMInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_PlayerBGMInfo));
    return local_12.GetComp();
}
FC_PlayerBGMInfo& ModifyOrAddPlayerBGMInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_PlayerBGMInfo));
    return local_12.GetComp();
}
const FC_PlayerBGMInfo& GetPlayerBGMInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_PlayerBGMInfo));
    return local_12.GetComp();
}
UFUNCTION()
FC_PlayerBGMInfo GetPlayerBGMInfo_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_PlayerBGMInfo __r;
    bValid = false;
    bValid = ECSFunc_FC_PlayerBGMInfo::GetPlayerBGMInfo(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_PlayerBGMInfo GetDefaultedPlayerBGMInfo(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_PlayerBGMInfo __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_PlayerBGMInfo);
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
FC_PlayerBGMInfo GetDefaultedPlayerBGMInfo_BP(const FECSEntity &inout Entity)
{
    FC_PlayerBGMInfo __r;
    return __r;
}
UFUNCTION()
bool RemovePlayerBGMInfo(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_PlayerBGMInfo);
}
}
FECSMonitorRuntimeView __GetMonitorPlayerBGMInfoOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_PlayerBGMInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPlayerBGMInfoOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_PlayerBGMInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPlayerBGMInfoOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_PlayerBGMInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPlayerBGMInfoOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_PlayerBGMInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPlayerBGMInfoOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_PlayerBGMInfo, bFixedFrame, bMustHandleAll);
}
void __MonitorPlayerBGMInfoLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_PlayerBGMInfo, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPlayerBGMInfoActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_PlayerBGMInfo, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPlayerBGMInfoModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_PlayerBGMInfo, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_PlayerBgmToPending
{
UFUNCTION()
bool HasPlayerBgmToPending(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_PlayerBgmToPending);
}
FC_PlayerBgmToPending& AssignPlayerBgmToPending(const FECSEntity &inout Entity, const FC_PlayerBgmToPending &inout DefaultValue = FC_PlayerBgmToPending())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_PlayerBgmToPending, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignPlayerBgmToPending_BP(const FECSEntity &inout Entity, const FC_PlayerBgmToPending &inout DefaultValue = FC_PlayerBgmToPending())
{
    ECSFunc_FC_PlayerBgmToPending::AssignPlayerBgmToPending(Entity, DefaultValue);
    return;
}
FC_PlayerBgmToPending& ModifyPlayerBgmToPending(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_PlayerBgmToPending));
    return local_12.GetComp();
}
FC_PlayerBgmToPending& ModifyOrAddPlayerBgmToPending(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_PlayerBgmToPending));
    return local_12.GetComp();
}
const FC_PlayerBgmToPending& GetPlayerBgmToPending(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_PlayerBgmToPending));
    return local_12.GetComp();
}
UFUNCTION()
FC_PlayerBgmToPending GetPlayerBgmToPending_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_PlayerBgmToPending& local_4 = ECSFunc_FC_PlayerBgmToPending::GetPlayerBgmToPending(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_PlayerBgmToPending();
}
const FC_PlayerBgmToPending GetDefaultedPlayerBgmToPending(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_PlayerBgmToPending __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_PlayerBgmToPending);
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
FC_PlayerBgmToPending GetDefaultedPlayerBgmToPending_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_PlayerBgmToPending::GetDefaultedPlayerBgmToPending(Entity);
}
UFUNCTION()
bool RemovePlayerBgmToPending(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_PlayerBgmToPending);
}
}
FECSMonitorRuntimeView __GetMonitorPlayerBgmToPendingOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_PlayerBgmToPending, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPlayerBgmToPendingOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_PlayerBgmToPending, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPlayerBgmToPendingOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_PlayerBgmToPending, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPlayerBgmToPendingOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_PlayerBgmToPending, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPlayerBgmToPendingOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_PlayerBgmToPending, bFixedFrame, bMustHandleAll);
}
void __MonitorPlayerBgmToPendingLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_PlayerBgmToPending, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPlayerBgmToPendingActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_PlayerBgmToPending, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPlayerBgmToPendingModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_PlayerBgmToPending, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FCS_MapAudioBGM
{
UFUNCTION()
bool HasMapAudioBGM(const FECSWorldPtr &inout World)
{
    return ECSInternal::Has(World, ENTITY_ID_NULL, FCS_MapAudioBGM);
}
FCS_MapAudioBGM& AssignMapAudioBGM(const FECSWorldPtr &inout World, const FCS_MapAudioBGM &inout DefaultValue = FCS_MapAudioBGM())
{
    UScriptStruct local_6 = FCS_MapAudioBGM;
    FECSComponentPtr local_8;
    int local_10 = local_8 = ECSInternal::Assign(World, ENTITY_ID_NULL, local_6, FECSComponentPtr(DefaultValue));
    local_10.InternalSet(local_8);
    return local_10.GetComp();
}
UFUNCTION()
void AssignMapAudioBGM_BP(const FECSWorldPtr &inout World, const FCS_MapAudioBGM &inout DefaultValue = FCS_MapAudioBGM())
{
    ECSFunc_FCS_MapAudioBGM::AssignMapAudioBGM(World, DefaultValue);
    return;
}
FCS_MapAudioBGM& ModifyMapAudioBGM(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_MapAudioBGM;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Modify(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
FCS_MapAudioBGM& ModifyOrAddMapAudioBGM(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_MapAudioBGM;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::ModifyOrAdd(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
const FCS_MapAudioBGM& GetMapAudioBGM(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_MapAudioBGM;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Get(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
UFUNCTION()
FCS_MapAudioBGM GetMapAudioBGM_BP(const FECSWorldPtr &inout World, bool &out bValid)
{
    FCS_MapAudioBGM __r;
    bValid = false;
    bValid = ECSFunc_FCS_MapAudioBGM::GetMapAudioBGM(World);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FCS_MapAudioBGM GetDefaultedMapAudioBGM(const FECSWorldPtr &inout World)
{
    int local_10 = 0;
    const FCS_MapAudioBGM __r;
    FECSComponentPtr local_6 = ECSInternal::GetDefaulted(World, ENTITY_ID_NULL, FCS_MapAudioBGM);
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
FCS_MapAudioBGM GetDefaultedMapAudioBGM_BP(const FECSWorldPtr &inout World)
{
    FCS_MapAudioBGM __r;
    return __r;
}
UFUNCTION()
bool RemoveMapAudioBGM(const FECSWorldPtr &inout World)
{
    return ECSInternal::Remove(World, ENTITY_ID_NULL, FCS_MapAudioBGM);
}
}
void __MonitorMapAudioBGMLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FCS_MapAudioBGM, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorMapAudioBGMActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FCS_MapAudioBGM, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorMapAudioBGMModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FCS_MapAudioBGM, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_MonsterBGMConfig
{
UFUNCTION()
bool HasMonsterBGMConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_MonsterBGMConfig);
}
FC_MonsterBGMConfig& AssignMonsterBGMConfig(const FECSEntity &inout Entity, const FC_MonsterBGMConfig &inout DefaultValue = FC_MonsterBGMConfig())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_MonsterBGMConfig, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignMonsterBGMConfig_BP(const FECSEntity &inout Entity, const FC_MonsterBGMConfig &inout DefaultValue = FC_MonsterBGMConfig())
{
    ECSFunc_FC_MonsterBGMConfig::AssignMonsterBGMConfig(Entity, DefaultValue);
    return;
}
FC_MonsterBGMConfig& ModifyMonsterBGMConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_MonsterBGMConfig));
    return local_12.GetComp();
}
FC_MonsterBGMConfig& ModifyOrAddMonsterBGMConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_MonsterBGMConfig));
    return local_12.GetComp();
}
const FC_MonsterBGMConfig& GetMonsterBGMConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_MonsterBGMConfig));
    return local_12.GetComp();
}
UFUNCTION()
FC_MonsterBGMConfig GetMonsterBGMConfig_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_MonsterBGMConfig __r;
    bValid = false;
    bValid = ECSFunc_FC_MonsterBGMConfig::GetMonsterBGMConfig(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_MonsterBGMConfig GetDefaultedMonsterBGMConfig(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_MonsterBGMConfig __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_MonsterBGMConfig);
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
FC_MonsterBGMConfig GetDefaultedMonsterBGMConfig_BP(const FECSEntity &inout Entity)
{
    FC_MonsterBGMConfig __r;
    return __r;
}
UFUNCTION()
bool RemoveMonsterBGMConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_MonsterBGMConfig);
}
}
FECSMonitorRuntimeView __GetMonitorMonsterBGMConfigOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_MonsterBGMConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorMonsterBGMConfigOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_MonsterBGMConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorMonsterBGMConfigOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_MonsterBGMConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorMonsterBGMConfigOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_MonsterBGMConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorMonsterBGMConfigOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_MonsterBGMConfig, bFixedFrame, bMustHandleAll);
}
void __MonitorMonsterBGMConfigLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_MonsterBGMConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorMonsterBGMConfigActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_MonsterBGMConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorMonsterBGMConfigModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_MonsterBGMConfig, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_CurrentPlayingSoundIdList
{
UFUNCTION()
bool HasCurrentPlayingSoundIdList(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_CurrentPlayingSoundIdList);
}
FC_CurrentPlayingSoundIdList& AssignCurrentPlayingSoundIdList(const FECSEntity &inout Entity, const FC_CurrentPlayingSoundIdList &inout DefaultValue = FC_CurrentPlayingSoundIdList())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_CurrentPlayingSoundIdList, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignCurrentPlayingSoundIdList_BP(const FECSEntity &inout Entity, const FC_CurrentPlayingSoundIdList &inout DefaultValue = FC_CurrentPlayingSoundIdList())
{
    ECSFunc_FC_CurrentPlayingSoundIdList::AssignCurrentPlayingSoundIdList(Entity, DefaultValue);
    return;
}
FC_CurrentPlayingSoundIdList& ModifyCurrentPlayingSoundIdList(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_CurrentPlayingSoundIdList));
    return local_12.GetComp();
}
FC_CurrentPlayingSoundIdList& ModifyOrAddCurrentPlayingSoundIdList(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_CurrentPlayingSoundIdList));
    return local_12.GetComp();
}
const FC_CurrentPlayingSoundIdList& GetCurrentPlayingSoundIdList(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_CurrentPlayingSoundIdList));
    return local_12.GetComp();
}
UFUNCTION()
FC_CurrentPlayingSoundIdList GetCurrentPlayingSoundIdList_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_CurrentPlayingSoundIdList __r;
    bValid = false;
    bValid = ECSFunc_FC_CurrentPlayingSoundIdList::GetCurrentPlayingSoundIdList(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_CurrentPlayingSoundIdList GetDefaultedCurrentPlayingSoundIdList(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_CurrentPlayingSoundIdList __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_CurrentPlayingSoundIdList);
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
FC_CurrentPlayingSoundIdList GetDefaultedCurrentPlayingSoundIdList_BP(const FECSEntity &inout Entity)
{
    FC_CurrentPlayingSoundIdList __r;
    return __r;
}
UFUNCTION()
bool RemoveCurrentPlayingSoundIdList(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_CurrentPlayingSoundIdList);
}
}
FECSMonitorRuntimeView __GetMonitorCurrentPlayingSoundIdListOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_CurrentPlayingSoundIdList, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCurrentPlayingSoundIdListOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_CurrentPlayingSoundIdList, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCurrentPlayingSoundIdListOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_CurrentPlayingSoundIdList, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCurrentPlayingSoundIdListOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_CurrentPlayingSoundIdList, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCurrentPlayingSoundIdListOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_CurrentPlayingSoundIdList, bFixedFrame, bMustHandleAll);
}
void __MonitorCurrentPlayingSoundIdListLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_CurrentPlayingSoundIdList, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCurrentPlayingSoundIdListActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_CurrentPlayingSoundIdList, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCurrentPlayingSoundIdListModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_CurrentPlayingSoundIdList, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_CharacterAudioConfig
{
UFUNCTION()
bool HasCharacterAudioConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_CharacterAudioConfig);
}
FC_CharacterAudioConfig& AssignCharacterAudioConfig(const FECSEntity &inout Entity, const FC_CharacterAudioConfig &inout DefaultValue = FC_CharacterAudioConfig())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_CharacterAudioConfig, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignCharacterAudioConfig_BP(const FECSEntity &inout Entity, const FC_CharacterAudioConfig &inout DefaultValue = FC_CharacterAudioConfig())
{
    ECSFunc_FC_CharacterAudioConfig::AssignCharacterAudioConfig(Entity, DefaultValue);
    return;
}
FC_CharacterAudioConfig& ModifyCharacterAudioConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_CharacterAudioConfig));
    return local_12.GetComp();
}
FC_CharacterAudioConfig& ModifyOrAddCharacterAudioConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_CharacterAudioConfig));
    return local_12.GetComp();
}
const FC_CharacterAudioConfig& GetCharacterAudioConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_CharacterAudioConfig));
    return local_12.GetComp();
}
UFUNCTION()
FC_CharacterAudioConfig GetCharacterAudioConfig_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_CharacterAudioConfig __r;
    bValid = false;
    bValid = ECSFunc_FC_CharacterAudioConfig::GetCharacterAudioConfig(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_CharacterAudioConfig GetDefaultedCharacterAudioConfig(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_CharacterAudioConfig __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_CharacterAudioConfig);
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
FC_CharacterAudioConfig GetDefaultedCharacterAudioConfig_BP(const FECSEntity &inout Entity)
{
    FC_CharacterAudioConfig __r;
    return __r;
}
UFUNCTION()
bool RemoveCharacterAudioConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_CharacterAudioConfig);
}
}
FECSMonitorRuntimeView __GetMonitorCharacterAudioConfigOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_CharacterAudioConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCharacterAudioConfigOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_CharacterAudioConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCharacterAudioConfigOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_CharacterAudioConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCharacterAudioConfigOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_CharacterAudioConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCharacterAudioConfigOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_CharacterAudioConfig, bFixedFrame, bMustHandleAll);
}
void __MonitorCharacterAudioConfigLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_CharacterAudioConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCharacterAudioConfigActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_CharacterAudioConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCharacterAudioConfigModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_CharacterAudioConfig, bFixedFrame, Details);
    return;
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_RegionEntry &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_RegionEntry &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_RegionEntry &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_RegionEntry
{
int __IndexOf_RegionEntity()
{
    return 0;
}
int __IndexOf_RegionName()
{
    return 1;
}
int __IndexOf_RegionVolumeName()
{
    return 2;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_RegionExit &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_RegionExit &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_RegionExit &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_RegionExit
{
int __IndexOf_RegionEntity()
{
    return 0;
}
int __IndexOf_RegionName()
{
    return 1;
}
int __IndexOf_RegionVolumeName()
{
    return 2;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_CharacterAudioRegionEntity &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_CharacterAudioRegionEntity &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_CharacterAudioRegionEntity &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_CharacterAudioRegionEntity
{
int __IndexOf_RegionEntity()
{
    return 0;
}
int __IndexOf_RegionName()
{
    return 1;
}
int __IndexOf_RegionVolumeName()
{
    return 2;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_PlayerBgmToPending &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_PlayerBgmToPending &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_PlayerBgmToPending &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_PlayerBgmToPending
{
int __IndexOf_State()
{
    return 0;
}
int __IndexOf_Event()
{
    return 1;
}
}
