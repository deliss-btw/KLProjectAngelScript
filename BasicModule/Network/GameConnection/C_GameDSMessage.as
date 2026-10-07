
namespace __INTENRAL_FC_PlayerPendingLogin_NS
{
    const TECSComponentDerivedPtr<FC_PlayerPendingLogin> DerivedPtr = TECSComponentDerivedPtr<FC_PlayerPendingLogin>();
    const FC_PlayerPendingLogin DefaultValue = FC_PlayerPendingLogin();
}
namespace __INTENRAL_FC_PlayerPendingLogoutTag_NS
{
    const TECSComponentDerivedPtr<FC_PlayerPendingLogoutTag> DerivedPtr = TECSComponentDerivedPtr<FC_PlayerPendingLogoutTag>();
    const FC_PlayerPendingLogoutTag DefaultValue = FC_PlayerPendingLogoutTag();
}
namespace __INTENRAL_FC_PlayerPendingChangeLevel_NS
{
    const TECSComponentDerivedPtr<FC_PlayerPendingChangeLevel> DerivedPtr = TECSComponentDerivedPtr<FC_PlayerPendingChangeLevel>();
    const FC_PlayerPendingChangeLevel DefaultValue = FC_PlayerPendingChangeLevel();
}
namespace __INTENRAL_FC_DestroyDisconnectedPlayerTimer_NS
{
    const TECSComponentDerivedPtr<FC_DestroyDisconnectedPlayerTimer> DerivedPtr = TECSComponentDerivedPtr<FC_DestroyDisconnectedPlayerTimer>();
    const FC_DestroyDisconnectedPlayerTimer DefaultValue = FC_DestroyDisconnectedPlayerTimer();
}
namespace __INTENRAL_FC_PlayerExitDSReason_NS
{
    const TECSComponentDerivedPtr<FC_PlayerExitDSReason> DerivedPtr = TECSComponentDerivedPtr<FC_PlayerExitDSReason>();
    const FC_PlayerExitDSReason DefaultValue = FC_PlayerExitDSReason();
}
namespace __INTENRAL_FC_PlayerAddItemRequestPendingFlushTag_NS
{
    const TECSComponentDerivedPtr<FC_PlayerAddItemRequestPendingFlushTag> DerivedPtr = TECSComponentDerivedPtr<FC_PlayerAddItemRequestPendingFlushTag>();
    const FC_PlayerAddItemRequestPendingFlushTag DefaultValue = FC_PlayerAddItemRequestPendingFlushTag();
}
namespace __INTENRAL_FCE_CheckEmptyDS_NS
{
    const TECSEventDerivedPtr<FCE_CheckEmptyDS> DerivedPtr = TECSEventDerivedPtr<FCE_CheckEmptyDS>();
}
namespace __INTENRAL_FCE_ExitDS_NS
{
    const TECSEventDerivedPtr<FCE_ExitDS> DerivedPtr = TECSEventDerivedPtr<FCE_ExitDS>();
}
namespace __INTENRAL_FCE_DSErrorCode_NS
{
    const TECSEventDerivedPtr<FCE_DSErrorCode> DerivedPtr = TECSEventDerivedPtr<FCE_DSErrorCode>();
}
namespace __INTENRAL_FCE_PlayerLoginEvent_NS
{
    const TECSEventDerivedPtr<FCE_PlayerLoginEvent> DerivedPtr = TECSEventDerivedPtr<FCE_PlayerLoginEvent>();
}
namespace __INTENRAL_FCE_PlayerRequestEnterLevel_NS
{
    const TECSEventDerivedPtr<FCE_PlayerRequestEnterLevel> DerivedPtr = TECSEventDerivedPtr<FCE_PlayerRequestEnterLevel>();
}
namespace __INTENRAL_FCE_PlayerRequestLeaveCurrentLevel_NS
{
    const TECSEventDerivedPtr<FCE_PlayerRequestLeaveCurrentLevel> DerivedPtr = TECSEventDerivedPtr<FCE_PlayerRequestLeaveCurrentLevel>();
}
namespace __INTENRAL_FCE_PlayerRequestBackToCityLevel_NS
{
    const TECSEventDerivedPtr<FCE_PlayerRequestBackToCityLevel> DerivedPtr = TECSEventDerivedPtr<FCE_PlayerRequestBackToCityLevel>();
}
namespace __INTENRAL_FCE_PlayerRequestQuitGame_NS
{
    const TECSEventDerivedPtr<FCE_PlayerRequestQuitGame> DerivedPtr = TECSEventDerivedPtr<FCE_PlayerRequestQuitGame>();
}
namespace __INTENRAL_FCE_PlayerRequestMoveToTeleporter_NS
{
    const TECSEventDerivedPtr<FCE_PlayerRequestMoveToTeleporter> DerivedPtr = TECSEventDerivedPtr<FCE_PlayerRequestMoveToTeleporter>();
}
namespace __INTENRAL_FCE_AssembleTravelToTeammate_NS
{
    const TECSEventDerivedPtr<FCE_AssembleTravelToTeammate> DerivedPtr = TECSEventDerivedPtr<FCE_AssembleTravelToTeammate>();
}
namespace __INTENRAL_FCE_PlayerResponseQuitGame_NS
{
    const TECSEventDerivedPtr<FCE_PlayerResponseQuitGame> DerivedPtr = TECSEventDerivedPtr<FCE_PlayerResponseQuitGame>();
}
namespace __INTENRAL_FCE_ServerPlayerRequestEnterLevel_NS
{
    const TECSEventDerivedPtr<FCE_ServerPlayerRequestEnterLevel> DerivedPtr = TECSEventDerivedPtr<FCE_ServerPlayerRequestEnterLevel>();
}
namespace __INTENRAL_FCE_PlayerEnterDSFailed_NS
{
    const TECSEventDerivedPtr<FCE_PlayerEnterDSFailed> DerivedPtr = TECSEventDerivedPtr<FCE_PlayerEnterDSFailed>();
}
namespace __INTENRAL_FCE_SendErrorCodeToPlayer_NS
{
    const TECSEventDerivedPtr<FCE_SendErrorCodeToPlayer> DerivedPtr = TECSEventDerivedPtr<FCE_SendErrorCodeToPlayer>();
}
namespace __INTENRAL_FCE_FinishTrainingResult_NS
{
    const TECSEventDerivedPtr<FCE_FinishTrainingResult> DerivedPtr = TECSEventDerivedPtr<FCE_FinishTrainingResult>();
}
namespace __INTENRAL_FCE_NotifyDSPlayerErrorCode_NS
{
    const TECSEventDerivedPtr<FCE_NotifyDSPlayerErrorCode> DerivedPtr = TECSEventDerivedPtr<FCE_NotifyDSPlayerErrorCode>();
}
namespace __INTENRAL_FCE_DelayDisconnectPlayer_NS
{
    const TECSEventDerivedPtr<FCE_DelayDisconnectPlayer> DerivedPtr = TECSEventDerivedPtr<FCE_DelayDisconnectPlayer>();

}
struct FC_PlayerPendingLogin : FECSComponent
{
    UPROPERTY()
    bool bIsReconnect = false;


}

struct FC_PlayerPendingLogoutTag : FECSComponent
{
    FC_PlayerPendingLogoutTag()
    {
        return;
    }
}

struct FC_PlayerPendingChangeLevel : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    uint m_LevelKey;

    FC_PlayerPendingChangeLevel()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_PlayerPendingChangeLevel(const FC_PlayerPendingChangeLevel &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_PlayerPendingChangeLevel opAssign(const FC_PlayerPendingChangeLevel &inout Other)
    {
        FC_PlayerPendingChangeLevel __r;
        this.SetLevelKey(Other.GetLevelKey());
        return __r;
    }
    uint GetLevelKey() const property
    {
        return this.m_LevelKey;
    }
    void SetLevelKey(const uint __Value) property
    {
        if (this.m_LevelKey == __Value)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_LevelKey = __Value;
        return;
    }
}

struct FCE_CheckEmptyDS : FECSEvent
{
    FECSEvent _base_FECSEvent;

    FCE_CheckEmptyDS()
    {
        return;
    }
}

struct FCE_ExitDS : FECSEvent
{
    FECSEvent _base_FECSEvent;

    FCE_ExitDS()
    {
        return;
    }
}

struct FCE_DSErrorCode : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    int ErrorCode = 0;


}

struct FCE_PlayerLoginEvent : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    bool bIsReconnect = false;


}

struct FC_DestroyDisconnectedPlayerTimer : FECSComponent
{
    UPROPERTY()
    FFPTime TriggerTime;

    FC_DestroyDisconnectedPlayerTimer()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
}

struct FCE_PlayerRequestEnterLevel : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    uint LevelKey = 0;


}

struct FCE_PlayerRequestLeaveCurrentLevel : FECSEvent
{
    FECSEvent _base_FECSEvent;

    FCE_PlayerRequestLeaveCurrentLevel()
    {
        return;
    }
    bool Validate() const
    {
        return true;
    }
}

struct FCE_PlayerRequestBackToCityLevel : FECSEvent
{
    FECSEvent _base_FECSEvent;

    FCE_PlayerRequestBackToCityLevel()
    {
        return;
    }
}

struct FCE_PlayerRequestQuitGame : FECSEvent
{
    FECSEvent _base_FECSEvent;

    FCE_PlayerRequestQuitGame()
    {
        return;
    }
}

struct FCE_PlayerRequestMoveToTeleporter : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    TDataObjectPtr<FTeleporterConfig> TeleporterConfig;
    UPROPERTY()
    ELoadingScreenAction Action = ELoadingScreenAction(0);


}

struct FCE_AssembleTravelToTeammate : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FECSEntity AssemblerPlayerEntity;

    FCE_AssembleTravelToTeammate()
    {
        return;
    }
}

struct FCE_PlayerResponseQuitGame : FECSEvent
{
    FECSEvent _base_FECSEvent;

    FCE_PlayerResponseQuitGame()
    {
        return;
    }
}

struct FC_PlayerExitDSReason : FECSComponent
{
    UPROPERTY()
    EDisconnectReason Reason;


}

struct FC_PlayerAddItemRequestPendingFlushTag : FECSComponent
{
    FC_PlayerAddItemRequestPendingFlushTag()
    {
        return;
    }
}

struct FCE_ServerPlayerRequestEnterLevel : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    uint LevelKey = 0;


}

struct FCE_PlayerEnterDSFailed : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    int ErrorCode = 0;


}

struct FCE_SendErrorCodeToPlayer : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    int ErrorCode;


}

struct FCE_FinishTrainingResult : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    bool bSuccess = false;
    UPROPERTY()
    TDataObjectPtr<FTrainingInfoConfig> TrainingInfo;


}

struct FCE_NotifyDSPlayerErrorCode : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    int ErrorCode;


}

struct FCE_DelayDisconnectPlayer : FECSEvent
{
    FECSEvent _base_FECSEvent;

    FCE_DelayDisconnectPlayer()
    {
        return;
    }
}

namespace ECSFunc_FC_PlayerPendingLogin
{
UFUNCTION()
bool HasPlayerPendingLogin(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_PlayerPendingLogin);
}
FC_PlayerPendingLogin& AssignPlayerPendingLogin(const FECSEntity &inout Entity, const FC_PlayerPendingLogin &inout DefaultValue = FC_PlayerPendingLogin())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_PlayerPendingLogin, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignPlayerPendingLogin_BP(const FECSEntity &inout Entity, const FC_PlayerPendingLogin &inout DefaultValue = FC_PlayerPendingLogin())
{
    ECSFunc_FC_PlayerPendingLogin::AssignPlayerPendingLogin(Entity, DefaultValue);
    return;
}
FC_PlayerPendingLogin& ModifyPlayerPendingLogin(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_PlayerPendingLogin));
    return local_12.GetComp();
}
FC_PlayerPendingLogin& ModifyOrAddPlayerPendingLogin(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_PlayerPendingLogin));
    return local_12.GetComp();
}
const FC_PlayerPendingLogin& GetPlayerPendingLogin(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_PlayerPendingLogin));
    return local_12.GetComp();
}
UFUNCTION()
FC_PlayerPendingLogin GetPlayerPendingLogin_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_PlayerPendingLogin& local_4 = ECSFunc_FC_PlayerPendingLogin::GetPlayerPendingLogin(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_PlayerPendingLogin();
}
const FC_PlayerPendingLogin GetDefaultedPlayerPendingLogin(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_PlayerPendingLogin __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_PlayerPendingLogin);
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
FC_PlayerPendingLogin GetDefaultedPlayerPendingLogin_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_PlayerPendingLogin::GetDefaultedPlayerPendingLogin(Entity);
}
UFUNCTION()
bool RemovePlayerPendingLogin(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_PlayerPendingLogin);
}
}
FECSMonitorRuntimeView __GetMonitorPlayerPendingLoginOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_PlayerPendingLogin, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPlayerPendingLoginOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_PlayerPendingLogin, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPlayerPendingLoginOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_PlayerPendingLogin, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPlayerPendingLoginOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_PlayerPendingLogin, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPlayerPendingLoginOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_PlayerPendingLogin, bFixedFrame, bMustHandleAll);
}
void __MonitorPlayerPendingLoginLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_PlayerPendingLogin, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPlayerPendingLoginActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_PlayerPendingLogin, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPlayerPendingLoginModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_PlayerPendingLogin, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_PlayerPendingLogoutTag
{
UFUNCTION()
bool HasPlayerPendingLogoutTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_PlayerPendingLogoutTag);
}
FC_PlayerPendingLogoutTag& AssignPlayerPendingLogoutTag(const FECSEntity &inout Entity, const FC_PlayerPendingLogoutTag &inout DefaultValue = FC_PlayerPendingLogoutTag())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_PlayerPendingLogoutTag, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignPlayerPendingLogoutTag_BP(const FECSEntity &inout Entity, const FC_PlayerPendingLogoutTag &inout DefaultValue = FC_PlayerPendingLogoutTag())
{
    ECSFunc_FC_PlayerPendingLogoutTag::AssignPlayerPendingLogoutTag(Entity, DefaultValue);
    return;
}
FC_PlayerPendingLogoutTag& ModifyPlayerPendingLogoutTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_PlayerPendingLogoutTag));
    return local_12.GetComp();
}
FC_PlayerPendingLogoutTag& ModifyOrAddPlayerPendingLogoutTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_PlayerPendingLogoutTag));
    return local_12.GetComp();
}
const FC_PlayerPendingLogoutTag& GetPlayerPendingLogoutTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_PlayerPendingLogoutTag));
    return local_12.GetComp();
}
UFUNCTION()
FC_PlayerPendingLogoutTag GetPlayerPendingLogoutTag_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_PlayerPendingLogoutTag& local_4 = ECSFunc_FC_PlayerPendingLogoutTag::GetPlayerPendingLogoutTag(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_PlayerPendingLogoutTag();
}
const FC_PlayerPendingLogoutTag GetDefaultedPlayerPendingLogoutTag(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_PlayerPendingLogoutTag __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_PlayerPendingLogoutTag);
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
FC_PlayerPendingLogoutTag GetDefaultedPlayerPendingLogoutTag_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_PlayerPendingLogoutTag::GetDefaultedPlayerPendingLogoutTag(Entity);
}
UFUNCTION()
bool RemovePlayerPendingLogoutTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_PlayerPendingLogoutTag);
}
}
FECSMonitorRuntimeView __GetMonitorPlayerPendingLogoutTagOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_PlayerPendingLogoutTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPlayerPendingLogoutTagOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_PlayerPendingLogoutTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPlayerPendingLogoutTagOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_PlayerPendingLogoutTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPlayerPendingLogoutTagOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_PlayerPendingLogoutTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPlayerPendingLogoutTagOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_PlayerPendingLogoutTag, bFixedFrame, bMustHandleAll);
}
void __MonitorPlayerPendingLogoutTagLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_PlayerPendingLogoutTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPlayerPendingLogoutTagActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_PlayerPendingLogoutTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPlayerPendingLogoutTagModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_PlayerPendingLogoutTag, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_PlayerPendingChangeLevel
{
UFUNCTION()
bool HasPlayerPendingChangeLevel(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_PlayerPendingChangeLevel);
}
FC_PlayerPendingChangeLevel& AssignPlayerPendingChangeLevel(const FECSEntity &inout Entity, const FC_PlayerPendingChangeLevel &inout DefaultValue = FC_PlayerPendingChangeLevel())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_PlayerPendingChangeLevel, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignPlayerPendingChangeLevel_BP(const FECSEntity &inout Entity, const FC_PlayerPendingChangeLevel &inout DefaultValue = FC_PlayerPendingChangeLevel())
{
    ECSFunc_FC_PlayerPendingChangeLevel::AssignPlayerPendingChangeLevel(Entity, DefaultValue);
    return;
}
FC_PlayerPendingChangeLevel& ModifyPlayerPendingChangeLevel(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_PlayerPendingChangeLevel));
    return local_12.GetComp();
}
FC_PlayerPendingChangeLevel& ModifyOrAddPlayerPendingChangeLevel(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_PlayerPendingChangeLevel));
    return local_12.GetComp();
}
const FC_PlayerPendingChangeLevel& GetPlayerPendingChangeLevel(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_PlayerPendingChangeLevel));
    return local_12.GetComp();
}
UFUNCTION()
FC_PlayerPendingChangeLevel GetPlayerPendingChangeLevel_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_PlayerPendingChangeLevel& local_4 = ECSFunc_FC_PlayerPendingChangeLevel::GetPlayerPendingChangeLevel(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_PlayerPendingChangeLevel();
}
const FC_PlayerPendingChangeLevel GetDefaultedPlayerPendingChangeLevel(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_PlayerPendingChangeLevel __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_PlayerPendingChangeLevel);
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
FC_PlayerPendingChangeLevel GetDefaultedPlayerPendingChangeLevel_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_PlayerPendingChangeLevel::GetDefaultedPlayerPendingChangeLevel(Entity);
}
UFUNCTION()
bool RemovePlayerPendingChangeLevel(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_PlayerPendingChangeLevel);
}
}
FECSMonitorRuntimeView __GetMonitorPlayerPendingChangeLevelOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_PlayerPendingChangeLevel, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPlayerPendingChangeLevelOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_PlayerPendingChangeLevel, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPlayerPendingChangeLevelOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_PlayerPendingChangeLevel, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPlayerPendingChangeLevelOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_PlayerPendingChangeLevel, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPlayerPendingChangeLevelOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_PlayerPendingChangeLevel, bFixedFrame, bMustHandleAll);
}
void __MonitorPlayerPendingChangeLevelLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_PlayerPendingChangeLevel, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPlayerPendingChangeLevelActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_PlayerPendingChangeLevel, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPlayerPendingChangeLevelModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_PlayerPendingChangeLevel, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_DestroyDisconnectedPlayerTimer
{
UFUNCTION()
bool HasDestroyDisconnectedPlayerTimer(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_DestroyDisconnectedPlayerTimer);
}
FC_DestroyDisconnectedPlayerTimer& AssignDestroyDisconnectedPlayerTimer(const FECSEntity &inout Entity, const FC_DestroyDisconnectedPlayerTimer &inout DefaultValue = FC_DestroyDisconnectedPlayerTimer())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_DestroyDisconnectedPlayerTimer, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignDestroyDisconnectedPlayerTimer_BP(const FECSEntity &inout Entity, const FC_DestroyDisconnectedPlayerTimer &inout DefaultValue = FC_DestroyDisconnectedPlayerTimer())
{
    ECSFunc_FC_DestroyDisconnectedPlayerTimer::AssignDestroyDisconnectedPlayerTimer(Entity, DefaultValue);
    return;
}
FC_DestroyDisconnectedPlayerTimer& ModifyDestroyDisconnectedPlayerTimer(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_DestroyDisconnectedPlayerTimer));
    return local_12.GetComp();
}
FC_DestroyDisconnectedPlayerTimer& ModifyOrAddDestroyDisconnectedPlayerTimer(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_DestroyDisconnectedPlayerTimer));
    return local_12.GetComp();
}
const FC_DestroyDisconnectedPlayerTimer& GetDestroyDisconnectedPlayerTimer(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_DestroyDisconnectedPlayerTimer));
    return local_12.GetComp();
}
UFUNCTION()
FC_DestroyDisconnectedPlayerTimer GetDestroyDisconnectedPlayerTimer_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_DestroyDisconnectedPlayerTimer __r;
    bValid = false;
    bValid = ECSFunc_FC_DestroyDisconnectedPlayerTimer::GetDestroyDisconnectedPlayerTimer(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_DestroyDisconnectedPlayerTimer GetDefaultedDestroyDisconnectedPlayerTimer(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_DestroyDisconnectedPlayerTimer __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_DestroyDisconnectedPlayerTimer);
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
FC_DestroyDisconnectedPlayerTimer GetDefaultedDestroyDisconnectedPlayerTimer_BP(const FECSEntity &inout Entity)
{
    FC_DestroyDisconnectedPlayerTimer __r;
    return __r;
}
UFUNCTION()
bool RemoveDestroyDisconnectedPlayerTimer(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_DestroyDisconnectedPlayerTimer);
}
}
FECSMonitorRuntimeView __GetMonitorDestroyDisconnectedPlayerTimerOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_DestroyDisconnectedPlayerTimer, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDestroyDisconnectedPlayerTimerOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_DestroyDisconnectedPlayerTimer, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDestroyDisconnectedPlayerTimerOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_DestroyDisconnectedPlayerTimer, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDestroyDisconnectedPlayerTimerOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_DestroyDisconnectedPlayerTimer, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDestroyDisconnectedPlayerTimerOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_DestroyDisconnectedPlayerTimer, bFixedFrame, bMustHandleAll);
}
void __MonitorDestroyDisconnectedPlayerTimerLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_DestroyDisconnectedPlayerTimer, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorDestroyDisconnectedPlayerTimerActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_DestroyDisconnectedPlayerTimer, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorDestroyDisconnectedPlayerTimerModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_DestroyDisconnectedPlayerTimer, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_PlayerExitDSReason
{
UFUNCTION()
bool HasPlayerExitDSReason(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_PlayerExitDSReason);
}
FC_PlayerExitDSReason& AssignPlayerExitDSReason(const FECSEntity &inout Entity, const FC_PlayerExitDSReason &inout DefaultValue = FC_PlayerExitDSReason())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_PlayerExitDSReason, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignPlayerExitDSReason_BP(const FECSEntity &inout Entity, const FC_PlayerExitDSReason &inout DefaultValue = FC_PlayerExitDSReason())
{
    ECSFunc_FC_PlayerExitDSReason::AssignPlayerExitDSReason(Entity, DefaultValue);
    return;
}
FC_PlayerExitDSReason& ModifyPlayerExitDSReason(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_PlayerExitDSReason));
    return local_12.GetComp();
}
FC_PlayerExitDSReason& ModifyOrAddPlayerExitDSReason(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_PlayerExitDSReason));
    return local_12.GetComp();
}
const FC_PlayerExitDSReason& GetPlayerExitDSReason(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_PlayerExitDSReason));
    return local_12.GetComp();
}
UFUNCTION()
FC_PlayerExitDSReason GetPlayerExitDSReason_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_PlayerExitDSReason& local_4 = ECSFunc_FC_PlayerExitDSReason::GetPlayerExitDSReason(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_PlayerExitDSReason();
}
const FC_PlayerExitDSReason GetDefaultedPlayerExitDSReason(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_PlayerExitDSReason __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_PlayerExitDSReason);
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
FC_PlayerExitDSReason GetDefaultedPlayerExitDSReason_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_PlayerExitDSReason::GetDefaultedPlayerExitDSReason(Entity);
}
UFUNCTION()
bool RemovePlayerExitDSReason(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_PlayerExitDSReason);
}
}
FECSMonitorRuntimeView __GetMonitorPlayerExitDSReasonOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_PlayerExitDSReason, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPlayerExitDSReasonOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_PlayerExitDSReason, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPlayerExitDSReasonOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_PlayerExitDSReason, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPlayerExitDSReasonOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_PlayerExitDSReason, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPlayerExitDSReasonOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_PlayerExitDSReason, bFixedFrame, bMustHandleAll);
}
void __MonitorPlayerExitDSReasonLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_PlayerExitDSReason, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPlayerExitDSReasonActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_PlayerExitDSReason, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPlayerExitDSReasonModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_PlayerExitDSReason, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_PlayerAddItemRequestPendingFlushTag
{
UFUNCTION()
bool HasPlayerAddItemRequestPendingFlushTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_PlayerAddItemRequestPendingFlushTag);
}
FC_PlayerAddItemRequestPendingFlushTag& AssignPlayerAddItemRequestPendingFlushTag(const FECSEntity &inout Entity, const FC_PlayerAddItemRequestPendingFlushTag &inout DefaultValue = FC_PlayerAddItemRequestPendingFlushTag())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_PlayerAddItemRequestPendingFlushTag, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignPlayerAddItemRequestPendingFlushTag_BP(const FECSEntity &inout Entity, const FC_PlayerAddItemRequestPendingFlushTag &inout DefaultValue = FC_PlayerAddItemRequestPendingFlushTag())
{
    ECSFunc_FC_PlayerAddItemRequestPendingFlushTag::AssignPlayerAddItemRequestPendingFlushTag(Entity, DefaultValue);
    return;
}
FC_PlayerAddItemRequestPendingFlushTag& ModifyPlayerAddItemRequestPendingFlushTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_PlayerAddItemRequestPendingFlushTag));
    return local_12.GetComp();
}
FC_PlayerAddItemRequestPendingFlushTag& ModifyOrAddPlayerAddItemRequestPendingFlushTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_PlayerAddItemRequestPendingFlushTag));
    return local_12.GetComp();
}
const FC_PlayerAddItemRequestPendingFlushTag& GetPlayerAddItemRequestPendingFlushTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_PlayerAddItemRequestPendingFlushTag));
    return local_12.GetComp();
}
UFUNCTION()
FC_PlayerAddItemRequestPendingFlushTag GetPlayerAddItemRequestPendingFlushTag_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_PlayerAddItemRequestPendingFlushTag& local_4 = ECSFunc_FC_PlayerAddItemRequestPendingFlushTag::GetPlayerAddItemRequestPendingFlushTag(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_PlayerAddItemRequestPendingFlushTag();
}
const FC_PlayerAddItemRequestPendingFlushTag GetDefaultedPlayerAddItemRequestPendingFlushTag(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_PlayerAddItemRequestPendingFlushTag __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_PlayerAddItemRequestPendingFlushTag);
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
FC_PlayerAddItemRequestPendingFlushTag GetDefaultedPlayerAddItemRequestPendingFlushTag_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_PlayerAddItemRequestPendingFlushTag::GetDefaultedPlayerAddItemRequestPendingFlushTag(Entity);
}
UFUNCTION()
bool RemovePlayerAddItemRequestPendingFlushTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_PlayerAddItemRequestPendingFlushTag);
}
}
FECSMonitorRuntimeView __GetMonitorPlayerAddItemRequestPendingFlushTagOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_PlayerAddItemRequestPendingFlushTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPlayerAddItemRequestPendingFlushTagOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_PlayerAddItemRequestPendingFlushTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPlayerAddItemRequestPendingFlushTagOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_PlayerAddItemRequestPendingFlushTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPlayerAddItemRequestPendingFlushTagOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_PlayerAddItemRequestPendingFlushTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPlayerAddItemRequestPendingFlushTagOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_PlayerAddItemRequestPendingFlushTag, bFixedFrame, bMustHandleAll);
}
void __MonitorPlayerAddItemRequestPendingFlushTagLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_PlayerAddItemRequestPendingFlushTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPlayerAddItemRequestPendingFlushTagActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_PlayerAddItemRequestPendingFlushTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPlayerAddItemRequestPendingFlushTagModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_PlayerAddItemRequestPendingFlushTag, bFixedFrame, Details);
    return;
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_PlayerPendingChangeLevel &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_PlayerPendingChangeLevel &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_PlayerPendingChangeLevel &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_PlayerPendingChangeLevel
{
int __IndexOf_LevelKey()
{
    return 0;
}
}
