
enum ELevelAreaEventLeaveResult
{
    Success,
    Failed,
    Leave,
}

namespace __INTENRAL_FC_LevelAreaEventProcess_NS
{
    const TECSComponentDerivedPtr<FC_LevelAreaEventProcess> DerivedPtr = TECSComponentDerivedPtr<FC_LevelAreaEventProcess>();
    const FC_LevelAreaEventProcess DefaultValue = FC_LevelAreaEventProcess();
}
namespace __INTENRAL_FC_LevelAreaEventFinish_NS
{
    const TECSComponentDerivedPtr<FC_LevelAreaEventFinish> DerivedPtr = TECSComponentDerivedPtr<FC_LevelAreaEventFinish>();
    const FC_LevelAreaEventFinish DefaultValue = FC_LevelAreaEventFinish();
}
namespace __INTENRAL_FC_LevelAreaEventInfo_NS
{
    const TECSComponentDerivedPtr<FC_LevelAreaEventInfo> DerivedPtr = TECSComponentDerivedPtr<FC_LevelAreaEventInfo>();
    const FC_LevelAreaEventInfo DefaultValue = FC_LevelAreaEventInfo();
}
namespace __INTENRAL_FC_LevelAreaEventPlayers_NS
{
    const TECSComponentDerivedPtr<FC_LevelAreaEventPlayers> DerivedPtr = TECSComponentDerivedPtr<FC_LevelAreaEventPlayers>();
    const FC_LevelAreaEventPlayers DefaultValue = FC_LevelAreaEventPlayers();
}
namespace __INTENRAL_FC_LevelAreaEventTriggeredPlayers_NS
{
    const TECSComponentDerivedPtr<FC_LevelAreaEventTriggeredPlayers> DerivedPtr = TECSComponentDerivedPtr<FC_LevelAreaEventTriggeredPlayers>();
    const FC_LevelAreaEventTriggeredPlayers DefaultValue = FC_LevelAreaEventTriggeredPlayers();
}
namespace __INTENRAL_FC_PlayerLevelAreaEventInfo_NS
{
    const TECSComponentDerivedPtr<FC_PlayerLevelAreaEventInfo> DerivedPtr = TECSComponentDerivedPtr<FC_PlayerLevelAreaEventInfo>();
    const FC_PlayerLevelAreaEventInfo DefaultValue = FC_PlayerLevelAreaEventInfo();
}
namespace __INTENRAL_FC_PlayerUnActiveLevelAreaEventInfo_NS
{
    const TECSComponentDerivedPtr<FC_PlayerUnActiveLevelAreaEventInfo> DerivedPtr = TECSComponentDerivedPtr<FC_PlayerUnActiveLevelAreaEventInfo>();
    const FC_PlayerUnActiveLevelAreaEventInfo DefaultValue = FC_PlayerUnActiveLevelAreaEventInfo();
}
namespace __INTENRAL_FC_PlayerEverEnterEventAreas_NS
{
    const TECSComponentDerivedPtr<FC_PlayerEverEnterEventAreas> DerivedPtr = TECSComponentDerivedPtr<FC_PlayerEverEnterEventAreas>();
    const FC_PlayerEverEnterEventAreas DefaultValue = FC_PlayerEverEnterEventAreas();
}
namespace __INTENRAL_FCE_LevelAreaEventActivated_NS
{
    const TECSEventDerivedPtr<FCE_LevelAreaEventActivated> DerivedPtr = TECSEventDerivedPtr<FCE_LevelAreaEventActivated>();
}
namespace __INTENRAL_FCE_LevelAreaEventPlayerEnter_NS
{
    const TECSEventDerivedPtr<FCE_LevelAreaEventPlayerEnter> DerivedPtr = TECSEventDerivedPtr<FCE_LevelAreaEventPlayerEnter>();
}
namespace __INTENRAL_FCE_LevelAreaEventPlayerLeave_NS
{
    const TECSEventDerivedPtr<FCE_LevelAreaEventPlayerLeave> DerivedPtr = TECSEventDerivedPtr<FCE_LevelAreaEventPlayerLeave>();

}
struct FC_LevelAreaEventProcess : FECSComponent
{
    UPROPERTY()
    int EventProgress;


}

struct FC_LevelAreaEventFinish : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    bool m_bIsSuccess;

    FC_LevelAreaEventFinish()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_LevelAreaEventFinish(const FC_LevelAreaEventFinish &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_LevelAreaEventFinish opAssign(const FC_LevelAreaEventFinish &inout Other)
    {
        FC_LevelAreaEventFinish __r;
        this.SetbIsSuccess(Other.GetbIsSuccess());
        return __r;
    }
    bool GetbIsSuccess() const property
    {
        return this.m_bIsSuccess;
    }
    void SetbIsSuccess(const bool __Value) property
    {
        if (!(this.m_bIsSuccess) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_bIsSuccess = __Value;
        return;
    }
}

struct FC_LevelAreaEventInfo : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    TDataObjectPtr<FLevelEventInfoConfigBase> m_EventInfo;

    FC_LevelAreaEventInfo()
    {
        this.__InitDirtyFlags();
        return;
    }
    FC_LevelAreaEventInfo(const FC_LevelAreaEventInfo &inout Other)
    {
        this.__InitDirtyFlags();
        this.m_EventInfo = Other.m_EventInfo;
        return;
    }
    FC_LevelAreaEventInfo opAssign(const FC_LevelAreaEventInfo &inout Other)
    {
        FC_LevelAreaEventInfo __r;
        this.SetEventInfo(Other.GetEventInfo());
        return __r;
    }
    const TDataObjectPtr<FLevelEventInfoConfigBase> GetEventInfo() const property
    {
        const TDataObjectPtr<FLevelEventInfoConfigBase> __r;
        return __r;
    }
    TDataObjectPtr<FLevelEventInfoConfigBase> GetModify_EventInfo() property
    {
        TDataObjectPtr<FLevelEventInfoConfigBase> __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetEventInfo(const TDataObjectPtr<FLevelEventInfoConfigBase> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_EventInfo = __Value;
        return;
    }
}

struct FPlayerInAreaInfo
{
    UPROPERTY()
    FECSEntity PlayerEntity;
    UPROPERTY()
    bool bIsLeavingArea;
    UPROPERTY()
    FFPTime LastCheckTime;
    UPROPERTY()
    FFPTime EnterTime;


}

struct FC_LevelAreaEventPlayers : FECSComponent
{
    UPROPERTY()
    TArray<FPlayerInAreaInfo> PlayerInAreaList;

    FC_LevelAreaEventPlayers()
    {
        return;
    }
    int GetPlayerInAreaIndex(const FECSEntity &inout PlayerEntity)
    {
        int local_1 = 0;
        for (; local_1 < this.Num(); ++local_1)
        {
            if ((FECSEntity(this[local_1].PlayerEntity) == PlayerEntity))
            {
                return local_1;
            }
        }
        return -1;
    }
}

struct FC_LevelAreaEventTriggeredPlayers : FECSComponent
{
    UPROPERTY()
    TSet<FECSEntity> TriggeredPlayers;

    FC_LevelAreaEventTriggeredPlayers()
    {
        return;
    }
}

struct FC_PlayerLevelAreaEventInfo : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    FECSEntity m_LevelScriptEntity;
    UPROPERTY()
    TDataObjectPtr<FLevelEventInfoConfigBase> m_EventInfo;
    UPROPERTY()
    TDataObjectPtr<FMessageHintConfig> m_PlayerFirstEnterMessageHint;
    UPROPERTY()
    TDataObjectPtr<FMessageHintConfig> m_AreaFirstEnterMessageHint;

    FC_PlayerLevelAreaEventInfo()
    {
        this.__InitDirtyFlags();
        return;
    }
    FC_PlayerLevelAreaEventInfo(const FC_PlayerLevelAreaEventInfo &inout Other)
    {
        this.__InitDirtyFlags();
        this.m_LevelScriptEntity = Other.m_LevelScriptEntity;
        this.m_EventInfo = Other.m_EventInfo;
        this.m_PlayerFirstEnterMessageHint = Other.m_PlayerFirstEnterMessageHint;
        this.m_AreaFirstEnterMessageHint = Other.m_AreaFirstEnterMessageHint;
        return;
    }
    FC_PlayerLevelAreaEventInfo opAssign(const FC_PlayerLevelAreaEventInfo &inout Other)
    {
        FC_PlayerLevelAreaEventInfo __r;
        this.SetLevelScriptEntity(Other.GetLevelScriptEntity());
        this.SetEventInfo(Other.GetEventInfo());
        this.SetPlayerFirstEnterMessageHint(Other.GetPlayerFirstEnterMessageHint());
        this.SetAreaFirstEnterMessageHint(Other.GetAreaFirstEnterMessageHint());
        return __r;
    }
    const FECSEntity GetLevelScriptEntity() const property
    {
        const FECSEntity __r;
        return __r;
    }
    FECSEntity GetModify_LevelScriptEntity() property
    {
        FECSEntity __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetLevelScriptEntity(const FECSEntity &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_LevelScriptEntity = __Value;
        return;
    }
    const TDataObjectPtr<FLevelEventInfoConfigBase> GetEventInfo() const property
    {
        const TDataObjectPtr<FLevelEventInfoConfigBase> __r;
        return __r;
    }
    TDataObjectPtr<FLevelEventInfoConfigBase> GetModify_EventInfo() property
    {
        TDataObjectPtr<FLevelEventInfoConfigBase> __r;
        this.__MarkDirty(1);
        return __r;
    }
    void SetEventInfo(const TDataObjectPtr<FLevelEventInfoConfigBase> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_EventInfo = __Value;
        return;
    }
    const TDataObjectPtr<FMessageHintConfig> GetPlayerFirstEnterMessageHint() const property
    {
        const TDataObjectPtr<FMessageHintConfig> __r;
        return __r;
    }
    TDataObjectPtr<FMessageHintConfig> GetModify_PlayerFirstEnterMessageHint() property
    {
        TDataObjectPtr<FMessageHintConfig> __r;
        this.__MarkDirty(2);
        return __r;
    }
    void SetPlayerFirstEnterMessageHint(const TDataObjectPtr<FMessageHintConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_PlayerFirstEnterMessageHint = __Value;
        return;
    }
    const TDataObjectPtr<FMessageHintConfig> GetAreaFirstEnterMessageHint() const property
    {
        const TDataObjectPtr<FMessageHintConfig> __r;
        return __r;
    }
    TDataObjectPtr<FMessageHintConfig> GetModify_AreaFirstEnterMessageHint() property
    {
        TDataObjectPtr<FMessageHintConfig> __r;
        this.__MarkDirty(3);
        return __r;
    }
    void SetAreaFirstEnterMessageHint(const TDataObjectPtr<FMessageHintConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(3);
        this.m_AreaFirstEnterMessageHint = __Value;
        return;
    }
}

struct FC_PlayerUnActiveLevelAreaEventInfo : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    FECSEntity m_LevelScriptEntity;

    FC_PlayerUnActiveLevelAreaEventInfo()
    {
        this.__InitDirtyFlags();
        return;
    }
    FC_PlayerUnActiveLevelAreaEventInfo(const FC_PlayerUnActiveLevelAreaEventInfo &inout Other)
    {
        this.__InitDirtyFlags();
        this.m_LevelScriptEntity = Other.m_LevelScriptEntity;
        return;
    }
    FC_PlayerUnActiveLevelAreaEventInfo opAssign(const FC_PlayerUnActiveLevelAreaEventInfo &inout Other)
    {
        FC_PlayerUnActiveLevelAreaEventInfo __r;
        this.SetLevelScriptEntity(Other.GetLevelScriptEntity());
        return __r;
    }
    const FECSEntity GetLevelScriptEntity() const property
    {
        const FECSEntity __r;
        return __r;
    }
    FECSEntity GetModify_LevelScriptEntity() property
    {
        FECSEntity __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetLevelScriptEntity(const FECSEntity &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_LevelScriptEntity = __Value;
        return;
    }
}

struct FC_PlayerEverEnterEventAreas : FECSComponent
{
    UPROPERTY()
    TSet<FECSEntity> EverEnterEventAreas;

    FC_PlayerEverEnterEventAreas()
    {
        return;
    }
}

struct FCE_LevelAreaEventActivated : FECSEvent
{
    FECSEvent _base_FECSEvent;

    FCE_LevelAreaEventActivated()
    {
        return;
    }
}

struct FCE_LevelAreaEventPlayerEnter : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FECSEntity LevelScriptEntity;

    FCE_LevelAreaEventPlayerEnter()
    {
        return;
    }
}

struct FCE_LevelAreaEventPlayerLeave : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FECSEntity LevelScriptEntity;
    UPROPERTY()
    ELevelAreaEventLeaveResult Result;
    UPROPERTY()
    float32 Duration;


}

namespace ECSFunc_FC_LevelAreaEventProcess
{
UFUNCTION()
bool HasLevelAreaEventProcess(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_LevelAreaEventProcess);
}
FC_LevelAreaEventProcess& AssignLevelAreaEventProcess(const FECSEntity &inout Entity, const FC_LevelAreaEventProcess &inout DefaultValue = FC_LevelAreaEventProcess())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_LevelAreaEventProcess, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignLevelAreaEventProcess_BP(const FECSEntity &inout Entity, const FC_LevelAreaEventProcess &inout DefaultValue = FC_LevelAreaEventProcess())
{
    ECSFunc_FC_LevelAreaEventProcess::AssignLevelAreaEventProcess(Entity, DefaultValue);
    return;
}
FC_LevelAreaEventProcess& ModifyLevelAreaEventProcess(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_LevelAreaEventProcess));
    return local_12.GetComp();
}
FC_LevelAreaEventProcess& ModifyOrAddLevelAreaEventProcess(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_LevelAreaEventProcess));
    return local_12.GetComp();
}
const FC_LevelAreaEventProcess& GetLevelAreaEventProcess(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_LevelAreaEventProcess));
    return local_12.GetComp();
}
UFUNCTION()
FC_LevelAreaEventProcess GetLevelAreaEventProcess_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_LevelAreaEventProcess& local_4 = ECSFunc_FC_LevelAreaEventProcess::GetLevelAreaEventProcess(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_LevelAreaEventProcess();
}
const FC_LevelAreaEventProcess GetDefaultedLevelAreaEventProcess(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_LevelAreaEventProcess __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_LevelAreaEventProcess);
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
FC_LevelAreaEventProcess GetDefaultedLevelAreaEventProcess_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_LevelAreaEventProcess::GetDefaultedLevelAreaEventProcess(Entity);
}
UFUNCTION()
bool RemoveLevelAreaEventProcess(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_LevelAreaEventProcess);
}
}
FECSMonitorRuntimeView __GetMonitorLevelAreaEventProcessOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_LevelAreaEventProcess, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLevelAreaEventProcessOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_LevelAreaEventProcess, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLevelAreaEventProcessOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_LevelAreaEventProcess, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLevelAreaEventProcessOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_LevelAreaEventProcess, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLevelAreaEventProcessOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_LevelAreaEventProcess, bFixedFrame, bMustHandleAll);
}
void __MonitorLevelAreaEventProcessLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_LevelAreaEventProcess, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorLevelAreaEventProcessActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_LevelAreaEventProcess, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorLevelAreaEventProcessModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_LevelAreaEventProcess, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_LevelAreaEventFinish
{
UFUNCTION()
bool HasLevelAreaEventFinish(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_LevelAreaEventFinish);
}
FC_LevelAreaEventFinish& AssignLevelAreaEventFinish(const FECSEntity &inout Entity, const FC_LevelAreaEventFinish &inout DefaultValue = FC_LevelAreaEventFinish())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_LevelAreaEventFinish, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignLevelAreaEventFinish_BP(const FECSEntity &inout Entity, const FC_LevelAreaEventFinish &inout DefaultValue = FC_LevelAreaEventFinish())
{
    ECSFunc_FC_LevelAreaEventFinish::AssignLevelAreaEventFinish(Entity, DefaultValue);
    return;
}
FC_LevelAreaEventFinish& ModifyLevelAreaEventFinish(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_LevelAreaEventFinish));
    return local_12.GetComp();
}
FC_LevelAreaEventFinish& ModifyOrAddLevelAreaEventFinish(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_LevelAreaEventFinish));
    return local_12.GetComp();
}
const FC_LevelAreaEventFinish& GetLevelAreaEventFinish(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_LevelAreaEventFinish));
    return local_12.GetComp();
}
UFUNCTION()
FC_LevelAreaEventFinish GetLevelAreaEventFinish_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_LevelAreaEventFinish& local_4 = ECSFunc_FC_LevelAreaEventFinish::GetLevelAreaEventFinish(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_LevelAreaEventFinish();
}
const FC_LevelAreaEventFinish GetDefaultedLevelAreaEventFinish(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_LevelAreaEventFinish __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_LevelAreaEventFinish);
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
FC_LevelAreaEventFinish GetDefaultedLevelAreaEventFinish_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_LevelAreaEventFinish::GetDefaultedLevelAreaEventFinish(Entity);
}
UFUNCTION()
bool RemoveLevelAreaEventFinish(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_LevelAreaEventFinish);
}
}
FECSMonitorRuntimeView __GetMonitorLevelAreaEventFinishOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_LevelAreaEventFinish, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLevelAreaEventFinishOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_LevelAreaEventFinish, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLevelAreaEventFinishOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_LevelAreaEventFinish, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLevelAreaEventFinishOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_LevelAreaEventFinish, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLevelAreaEventFinishOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_LevelAreaEventFinish, bFixedFrame, bMustHandleAll);
}
void __MonitorLevelAreaEventFinishLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_LevelAreaEventFinish, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorLevelAreaEventFinishActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_LevelAreaEventFinish, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorLevelAreaEventFinishModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_LevelAreaEventFinish, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_LevelAreaEventInfo
{
UFUNCTION()
bool HasLevelAreaEventInfo(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_LevelAreaEventInfo);
}
FC_LevelAreaEventInfo& AssignLevelAreaEventInfo(const FECSEntity &inout Entity, const FC_LevelAreaEventInfo &inout DefaultValue = FC_LevelAreaEventInfo())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_LevelAreaEventInfo, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignLevelAreaEventInfo_BP(const FECSEntity &inout Entity, const FC_LevelAreaEventInfo &inout DefaultValue = FC_LevelAreaEventInfo())
{
    ECSFunc_FC_LevelAreaEventInfo::AssignLevelAreaEventInfo(Entity, DefaultValue);
    return;
}
FC_LevelAreaEventInfo& ModifyLevelAreaEventInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_LevelAreaEventInfo));
    return local_12.GetComp();
}
FC_LevelAreaEventInfo& ModifyOrAddLevelAreaEventInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_LevelAreaEventInfo));
    return local_12.GetComp();
}
const FC_LevelAreaEventInfo& GetLevelAreaEventInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_LevelAreaEventInfo));
    return local_12.GetComp();
}
UFUNCTION()
FC_LevelAreaEventInfo GetLevelAreaEventInfo_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_LevelAreaEventInfo& local_4 = ECSFunc_FC_LevelAreaEventInfo::GetLevelAreaEventInfo(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_LevelAreaEventInfo();
}
const FC_LevelAreaEventInfo GetDefaultedLevelAreaEventInfo(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_LevelAreaEventInfo __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_LevelAreaEventInfo);
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
FC_LevelAreaEventInfo GetDefaultedLevelAreaEventInfo_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_LevelAreaEventInfo::GetDefaultedLevelAreaEventInfo(Entity);
}
UFUNCTION()
bool RemoveLevelAreaEventInfo(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_LevelAreaEventInfo);
}
}
FECSMonitorRuntimeView __GetMonitorLevelAreaEventInfoOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_LevelAreaEventInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLevelAreaEventInfoOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_LevelAreaEventInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLevelAreaEventInfoOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_LevelAreaEventInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLevelAreaEventInfoOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_LevelAreaEventInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLevelAreaEventInfoOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_LevelAreaEventInfo, bFixedFrame, bMustHandleAll);
}
void __MonitorLevelAreaEventInfoLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_LevelAreaEventInfo, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorLevelAreaEventInfoActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_LevelAreaEventInfo, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorLevelAreaEventInfoModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_LevelAreaEventInfo, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_LevelAreaEventPlayers
{
UFUNCTION()
bool HasLevelAreaEventPlayers(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_LevelAreaEventPlayers);
}
FC_LevelAreaEventPlayers& AssignLevelAreaEventPlayers(const FECSEntity &inout Entity, const FC_LevelAreaEventPlayers &inout DefaultValue = FC_LevelAreaEventPlayers())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_LevelAreaEventPlayers, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignLevelAreaEventPlayers_BP(const FECSEntity &inout Entity, const FC_LevelAreaEventPlayers &inout DefaultValue = FC_LevelAreaEventPlayers())
{
    ECSFunc_FC_LevelAreaEventPlayers::AssignLevelAreaEventPlayers(Entity, DefaultValue);
    return;
}
FC_LevelAreaEventPlayers& ModifyLevelAreaEventPlayers(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_LevelAreaEventPlayers));
    return local_12.GetComp();
}
FC_LevelAreaEventPlayers& ModifyOrAddLevelAreaEventPlayers(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_LevelAreaEventPlayers));
    return local_12.GetComp();
}
const FC_LevelAreaEventPlayers& GetLevelAreaEventPlayers(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_LevelAreaEventPlayers));
    return local_12.GetComp();
}
UFUNCTION()
FC_LevelAreaEventPlayers GetLevelAreaEventPlayers_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_LevelAreaEventPlayers __r;
    bValid = false;
    bValid = ECSFunc_FC_LevelAreaEventPlayers::GetLevelAreaEventPlayers(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_LevelAreaEventPlayers GetDefaultedLevelAreaEventPlayers(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_LevelAreaEventPlayers __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_LevelAreaEventPlayers);
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
FC_LevelAreaEventPlayers GetDefaultedLevelAreaEventPlayers_BP(const FECSEntity &inout Entity)
{
    FC_LevelAreaEventPlayers __r;
    return __r;
}
UFUNCTION()
bool RemoveLevelAreaEventPlayers(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_LevelAreaEventPlayers);
}
}
FECSMonitorRuntimeView __GetMonitorLevelAreaEventPlayersOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_LevelAreaEventPlayers, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLevelAreaEventPlayersOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_LevelAreaEventPlayers, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLevelAreaEventPlayersOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_LevelAreaEventPlayers, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLevelAreaEventPlayersOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_LevelAreaEventPlayers, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLevelAreaEventPlayersOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_LevelAreaEventPlayers, bFixedFrame, bMustHandleAll);
}
void __MonitorLevelAreaEventPlayersLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_LevelAreaEventPlayers, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorLevelAreaEventPlayersActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_LevelAreaEventPlayers, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorLevelAreaEventPlayersModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_LevelAreaEventPlayers, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_LevelAreaEventTriggeredPlayers
{
UFUNCTION()
bool HasLevelAreaEventTriggeredPlayers(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_LevelAreaEventTriggeredPlayers);
}
FC_LevelAreaEventTriggeredPlayers& AssignLevelAreaEventTriggeredPlayers(const FECSEntity &inout Entity, const FC_LevelAreaEventTriggeredPlayers &inout DefaultValue = FC_LevelAreaEventTriggeredPlayers())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_LevelAreaEventTriggeredPlayers, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignLevelAreaEventTriggeredPlayers_BP(const FECSEntity &inout Entity, const FC_LevelAreaEventTriggeredPlayers &inout DefaultValue = FC_LevelAreaEventTriggeredPlayers())
{
    ECSFunc_FC_LevelAreaEventTriggeredPlayers::AssignLevelAreaEventTriggeredPlayers(Entity, DefaultValue);
    return;
}
FC_LevelAreaEventTriggeredPlayers& ModifyLevelAreaEventTriggeredPlayers(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_LevelAreaEventTriggeredPlayers));
    return local_12.GetComp();
}
FC_LevelAreaEventTriggeredPlayers& ModifyOrAddLevelAreaEventTriggeredPlayers(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_LevelAreaEventTriggeredPlayers));
    return local_12.GetComp();
}
const FC_LevelAreaEventTriggeredPlayers& GetLevelAreaEventTriggeredPlayers(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_LevelAreaEventTriggeredPlayers));
    return local_12.GetComp();
}
UFUNCTION()
FC_LevelAreaEventTriggeredPlayers GetLevelAreaEventTriggeredPlayers_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_LevelAreaEventTriggeredPlayers __r;
    bValid = false;
    bValid = ECSFunc_FC_LevelAreaEventTriggeredPlayers::GetLevelAreaEventTriggeredPlayers(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_LevelAreaEventTriggeredPlayers GetDefaultedLevelAreaEventTriggeredPlayers(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_LevelAreaEventTriggeredPlayers __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_LevelAreaEventTriggeredPlayers);
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
FC_LevelAreaEventTriggeredPlayers GetDefaultedLevelAreaEventTriggeredPlayers_BP(const FECSEntity &inout Entity)
{
    FC_LevelAreaEventTriggeredPlayers __r;
    return __r;
}
UFUNCTION()
bool RemoveLevelAreaEventTriggeredPlayers(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_LevelAreaEventTriggeredPlayers);
}
}
FECSMonitorRuntimeView __GetMonitorLevelAreaEventTriggeredPlayersOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_LevelAreaEventTriggeredPlayers, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLevelAreaEventTriggeredPlayersOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_LevelAreaEventTriggeredPlayers, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLevelAreaEventTriggeredPlayersOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_LevelAreaEventTriggeredPlayers, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLevelAreaEventTriggeredPlayersOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_LevelAreaEventTriggeredPlayers, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLevelAreaEventTriggeredPlayersOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_LevelAreaEventTriggeredPlayers, bFixedFrame, bMustHandleAll);
}
void __MonitorLevelAreaEventTriggeredPlayersLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_LevelAreaEventTriggeredPlayers, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorLevelAreaEventTriggeredPlayersActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_LevelAreaEventTriggeredPlayers, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorLevelAreaEventTriggeredPlayersModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_LevelAreaEventTriggeredPlayers, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_PlayerLevelAreaEventInfo
{
UFUNCTION()
bool HasPlayerLevelAreaEventInfo(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_PlayerLevelAreaEventInfo);
}
FC_PlayerLevelAreaEventInfo& AssignPlayerLevelAreaEventInfo(const FECSEntity &inout Entity, const FC_PlayerLevelAreaEventInfo &inout DefaultValue = FC_PlayerLevelAreaEventInfo())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_PlayerLevelAreaEventInfo, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignPlayerLevelAreaEventInfo_BP(const FECSEntity &inout Entity, const FC_PlayerLevelAreaEventInfo &inout DefaultValue = FC_PlayerLevelAreaEventInfo())
{
    ECSFunc_FC_PlayerLevelAreaEventInfo::AssignPlayerLevelAreaEventInfo(Entity, DefaultValue);
    return;
}
FC_PlayerLevelAreaEventInfo& ModifyPlayerLevelAreaEventInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_PlayerLevelAreaEventInfo));
    return local_12.GetComp();
}
FC_PlayerLevelAreaEventInfo& ModifyOrAddPlayerLevelAreaEventInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_PlayerLevelAreaEventInfo));
    return local_12.GetComp();
}
const FC_PlayerLevelAreaEventInfo& GetPlayerLevelAreaEventInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_PlayerLevelAreaEventInfo));
    return local_12.GetComp();
}
UFUNCTION()
FC_PlayerLevelAreaEventInfo GetPlayerLevelAreaEventInfo_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_PlayerLevelAreaEventInfo& local_4 = ECSFunc_FC_PlayerLevelAreaEventInfo::GetPlayerLevelAreaEventInfo(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_PlayerLevelAreaEventInfo();
}
const FC_PlayerLevelAreaEventInfo GetDefaultedPlayerLevelAreaEventInfo(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_PlayerLevelAreaEventInfo __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_PlayerLevelAreaEventInfo);
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
FC_PlayerLevelAreaEventInfo GetDefaultedPlayerLevelAreaEventInfo_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_PlayerLevelAreaEventInfo::GetDefaultedPlayerLevelAreaEventInfo(Entity);
}
UFUNCTION()
bool RemovePlayerLevelAreaEventInfo(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_PlayerLevelAreaEventInfo);
}
}
FECSMonitorRuntimeView __GetMonitorPlayerLevelAreaEventInfoOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_PlayerLevelAreaEventInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPlayerLevelAreaEventInfoOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_PlayerLevelAreaEventInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPlayerLevelAreaEventInfoOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_PlayerLevelAreaEventInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPlayerLevelAreaEventInfoOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_PlayerLevelAreaEventInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPlayerLevelAreaEventInfoOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_PlayerLevelAreaEventInfo, bFixedFrame, bMustHandleAll);
}
void __MonitorPlayerLevelAreaEventInfoLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_PlayerLevelAreaEventInfo, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPlayerLevelAreaEventInfoActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_PlayerLevelAreaEventInfo, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPlayerLevelAreaEventInfoModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_PlayerLevelAreaEventInfo, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_PlayerUnActiveLevelAreaEventInfo
{
UFUNCTION()
bool HasPlayerUnActiveLevelAreaEventInfo(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_PlayerUnActiveLevelAreaEventInfo);
}
FC_PlayerUnActiveLevelAreaEventInfo& AssignPlayerUnActiveLevelAreaEventInfo(const FECSEntity &inout Entity, const FC_PlayerUnActiveLevelAreaEventInfo &inout DefaultValue = FC_PlayerUnActiveLevelAreaEventInfo())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_PlayerUnActiveLevelAreaEventInfo, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignPlayerUnActiveLevelAreaEventInfo_BP(const FECSEntity &inout Entity, const FC_PlayerUnActiveLevelAreaEventInfo &inout DefaultValue = FC_PlayerUnActiveLevelAreaEventInfo())
{
    ECSFunc_FC_PlayerUnActiveLevelAreaEventInfo::AssignPlayerUnActiveLevelAreaEventInfo(Entity, DefaultValue);
    return;
}
FC_PlayerUnActiveLevelAreaEventInfo& ModifyPlayerUnActiveLevelAreaEventInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_PlayerUnActiveLevelAreaEventInfo));
    return local_12.GetComp();
}
FC_PlayerUnActiveLevelAreaEventInfo& ModifyOrAddPlayerUnActiveLevelAreaEventInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_PlayerUnActiveLevelAreaEventInfo));
    return local_12.GetComp();
}
const FC_PlayerUnActiveLevelAreaEventInfo& GetPlayerUnActiveLevelAreaEventInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_PlayerUnActiveLevelAreaEventInfo));
    return local_12.GetComp();
}
UFUNCTION()
FC_PlayerUnActiveLevelAreaEventInfo GetPlayerUnActiveLevelAreaEventInfo_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_PlayerUnActiveLevelAreaEventInfo& local_4 = ECSFunc_FC_PlayerUnActiveLevelAreaEventInfo::GetPlayerUnActiveLevelAreaEventInfo(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_PlayerUnActiveLevelAreaEventInfo();
}
const FC_PlayerUnActiveLevelAreaEventInfo GetDefaultedPlayerUnActiveLevelAreaEventInfo(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_PlayerUnActiveLevelAreaEventInfo __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_PlayerUnActiveLevelAreaEventInfo);
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
FC_PlayerUnActiveLevelAreaEventInfo GetDefaultedPlayerUnActiveLevelAreaEventInfo_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_PlayerUnActiveLevelAreaEventInfo::GetDefaultedPlayerUnActiveLevelAreaEventInfo(Entity);
}
UFUNCTION()
bool RemovePlayerUnActiveLevelAreaEventInfo(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_PlayerUnActiveLevelAreaEventInfo);
}
}
FECSMonitorRuntimeView __GetMonitorPlayerUnActiveLevelAreaEventInfoOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_PlayerUnActiveLevelAreaEventInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPlayerUnActiveLevelAreaEventInfoOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_PlayerUnActiveLevelAreaEventInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPlayerUnActiveLevelAreaEventInfoOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_PlayerUnActiveLevelAreaEventInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPlayerUnActiveLevelAreaEventInfoOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_PlayerUnActiveLevelAreaEventInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPlayerUnActiveLevelAreaEventInfoOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_PlayerUnActiveLevelAreaEventInfo, bFixedFrame, bMustHandleAll);
}
void __MonitorPlayerUnActiveLevelAreaEventInfoLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_PlayerUnActiveLevelAreaEventInfo, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPlayerUnActiveLevelAreaEventInfoActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_PlayerUnActiveLevelAreaEventInfo, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPlayerUnActiveLevelAreaEventInfoModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_PlayerUnActiveLevelAreaEventInfo, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_PlayerEverEnterEventAreas
{
UFUNCTION()
bool HasPlayerEverEnterEventAreas(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_PlayerEverEnterEventAreas);
}
FC_PlayerEverEnterEventAreas& AssignPlayerEverEnterEventAreas(const FECSEntity &inout Entity, const FC_PlayerEverEnterEventAreas &inout DefaultValue = FC_PlayerEverEnterEventAreas())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_PlayerEverEnterEventAreas, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignPlayerEverEnterEventAreas_BP(const FECSEntity &inout Entity, const FC_PlayerEverEnterEventAreas &inout DefaultValue = FC_PlayerEverEnterEventAreas())
{
    ECSFunc_FC_PlayerEverEnterEventAreas::AssignPlayerEverEnterEventAreas(Entity, DefaultValue);
    return;
}
FC_PlayerEverEnterEventAreas& ModifyPlayerEverEnterEventAreas(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_PlayerEverEnterEventAreas));
    return local_12.GetComp();
}
FC_PlayerEverEnterEventAreas& ModifyOrAddPlayerEverEnterEventAreas(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_PlayerEverEnterEventAreas));
    return local_12.GetComp();
}
const FC_PlayerEverEnterEventAreas& GetPlayerEverEnterEventAreas(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_PlayerEverEnterEventAreas));
    return local_12.GetComp();
}
UFUNCTION()
FC_PlayerEverEnterEventAreas GetPlayerEverEnterEventAreas_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_PlayerEverEnterEventAreas __r;
    bValid = false;
    bValid = ECSFunc_FC_PlayerEverEnterEventAreas::GetPlayerEverEnterEventAreas(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_PlayerEverEnterEventAreas GetDefaultedPlayerEverEnterEventAreas(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_PlayerEverEnterEventAreas __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_PlayerEverEnterEventAreas);
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
FC_PlayerEverEnterEventAreas GetDefaultedPlayerEverEnterEventAreas_BP(const FECSEntity &inout Entity)
{
    FC_PlayerEverEnterEventAreas __r;
    return __r;
}
UFUNCTION()
bool RemovePlayerEverEnterEventAreas(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_PlayerEverEnterEventAreas);
}
}
FECSMonitorRuntimeView __GetMonitorPlayerEverEnterEventAreasOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_PlayerEverEnterEventAreas, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPlayerEverEnterEventAreasOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_PlayerEverEnterEventAreas, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPlayerEverEnterEventAreasOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_PlayerEverEnterEventAreas, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPlayerEverEnterEventAreasOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_PlayerEverEnterEventAreas, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPlayerEverEnterEventAreasOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_PlayerEverEnterEventAreas, bFixedFrame, bMustHandleAll);
}
void __MonitorPlayerEverEnterEventAreasLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_PlayerEverEnterEventAreas, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPlayerEverEnterEventAreasActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_PlayerEverEnterEventAreas, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPlayerEverEnterEventAreasModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_PlayerEverEnterEventAreas, bFixedFrame, Details);
    return;
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_LevelAreaEventFinish &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_LevelAreaEventFinish &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_LevelAreaEventFinish &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_LevelAreaEventFinish
{
int __IndexOf_bIsSuccess()
{
    return 0;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_LevelAreaEventInfo &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_LevelAreaEventInfo &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_LevelAreaEventInfo &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_LevelAreaEventInfo
{
int __IndexOf_EventInfo()
{
    return 0;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_PlayerLevelAreaEventInfo &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_PlayerLevelAreaEventInfo &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_PlayerLevelAreaEventInfo &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_PlayerLevelAreaEventInfo
{
int __IndexOf_LevelScriptEntity()
{
    return 0;
}
int __IndexOf_EventInfo()
{
    return 1;
}
int __IndexOf_PlayerFirstEnterMessageHint()
{
    return 2;
}
int __IndexOf_AreaFirstEnterMessageHint()
{
    return 3;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_PlayerUnActiveLevelAreaEventInfo &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_PlayerUnActiveLevelAreaEventInfo &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_PlayerUnActiveLevelAreaEventInfo &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_PlayerUnActiveLevelAreaEventInfo
{
int __IndexOf_LevelScriptEntity()
{
    return 0;
}
}
