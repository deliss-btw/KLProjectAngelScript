
enum EVOXChannelType
{
    Social,
    Battle,
}

enum EVOXVoiceMode
{
    Social,
    Battle,
    AllOff,
}

enum EVOXContextSlot
{
    City,
    NonCityNoSocial,
    NonCitySocial,
}

namespace __INTENRAL_FC_PlayerVOXState_NS
{
    const TECSComponentDerivedPtr<FC_PlayerVOXState> DerivedPtr = TECSComponentDerivedPtr<FC_PlayerVOXState>();
    const FC_PlayerVOXState DefaultValue = FC_PlayerVOXState();
}
namespace __INTENRAL_FCS_ClientVOXState_NS
{
    const TECSComponentDerivedPtr<FCS_ClientVOXState> DerivedPtr = TECSComponentDerivedPtr<FCS_ClientVOXState>();
    const FCS_ClientVOXState DefaultValue = FCS_ClientVOXState();
}
namespace __INTENRAL_FCE_VOXModeRestored_NS
{
    const TECSEventDerivedPtr<FCE_VOXModeRestored> DerivedPtr = TECSEventDerivedPtr<FCE_VOXModeRestored>();

}
struct FC_PlayerVOXState : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    FString m_SocialRoomId;
    UPROPERTY()
    bool m_bInSocialRoom;
    UPROPERTY()
    FString m_BattleRoomId;
    UPROPERTY()
    bool m_bInBattleRoom;
    UPROPERTY()
    uint64 m_LastSocialTeamId;

    FC_PlayerVOXState()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_PlayerVOXState(const FC_PlayerVOXState &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_PlayerVOXState opAssign(const FC_PlayerVOXState &inout Other)
    {
        FC_PlayerVOXState __r;
        this.SetSocialRoomId(Other.GetSocialRoomId());
        this.SetbInSocialRoom(Other.GetbInSocialRoom());
        this.SetBattleRoomId(Other.GetBattleRoomId());
        this.SetbInBattleRoom(Other.GetbInBattleRoom());
        this.SetLastSocialTeamId(Other.GetLastSocialTeamId());
        return __r;
    }
    FString GetSocialRoomId() const property
    {
        return this.m_SocialRoomId;
    }
    void SetSocialRoomId(const FString &inout __Value) property
    {
        if ((this.m_SocialRoomId == __Value))
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_SocialRoomId = __Value;
        return;
    }
    bool GetbInSocialRoom() const property
    {
        return this.m_bInSocialRoom;
    }
    void SetbInSocialRoom(const bool __Value) property
    {
        if (!(this.m_bInSocialRoom) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_bInSocialRoom = __Value;
        return;
    }
    FString GetBattleRoomId() const property
    {
        return this.m_BattleRoomId;
    }
    void SetBattleRoomId(const FString &inout __Value) property
    {
        if ((this.m_BattleRoomId == __Value))
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_BattleRoomId = __Value;
        return;
    }
    bool GetbInBattleRoom() const property
    {
        return this.m_bInBattleRoom;
    }
    void SetbInBattleRoom(const bool __Value) property
    {
        if (!(this.m_bInBattleRoom) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(3);
        this.m_bInBattleRoom = __Value;
        return;
    }
    uint64 GetLastSocialTeamId() const property
    {
        return this.m_LastSocialTeamId;
    }
    void SetLastSocialTeamId(const uint64 __Value) property
    {
        this.m_LastSocialTeamId = __Value;
        return;
    }
}

struct FCS_ClientVOXState : FECSSingleton
{
    UPROPERTY()
    FString LocalSocialRoomId;
    UPROPERTY()
    FString LocalBattleRoomId;
    UPROPERTY()
    EVOXVoiceMode MicMode = EVOXVoiceMode(2);
    UPROPERTY()
    EVOXVoiceMode SpeakerMode = EVOXVoiceMode(2);
    UPROPERTY()
    bool bVOXInitialized = false;
    UPROPERTY()
    TArray<uint> MutedPlayerUids;


}

struct FCE_VOXModeRestored : FECSEvent
{
    FECSEvent _base_FECSEvent;

    FCE_VOXModeRestored()
    {
        return;
    }
}

namespace ECSFunc_FC_PlayerVOXState
{
UFUNCTION()
bool HasPlayerVOXState(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_PlayerVOXState);
}
FC_PlayerVOXState& AssignPlayerVOXState(const FECSEntity &inout Entity, const FC_PlayerVOXState &inout DefaultValue = FC_PlayerVOXState())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_PlayerVOXState, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignPlayerVOXState_BP(const FECSEntity &inout Entity, const FC_PlayerVOXState &inout DefaultValue = FC_PlayerVOXState())
{
    ECSFunc_FC_PlayerVOXState::AssignPlayerVOXState(Entity, DefaultValue);
    return;
}
FC_PlayerVOXState& ModifyPlayerVOXState(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_PlayerVOXState));
    return local_12.GetComp();
}
FC_PlayerVOXState& ModifyOrAddPlayerVOXState(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_PlayerVOXState));
    return local_12.GetComp();
}
const FC_PlayerVOXState& GetPlayerVOXState(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_PlayerVOXState));
    return local_12.GetComp();
}
UFUNCTION()
FC_PlayerVOXState GetPlayerVOXState_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_PlayerVOXState& local_4 = ECSFunc_FC_PlayerVOXState::GetPlayerVOXState(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_PlayerVOXState();
}
const FC_PlayerVOXState GetDefaultedPlayerVOXState(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_PlayerVOXState __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_PlayerVOXState);
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
FC_PlayerVOXState GetDefaultedPlayerVOXState_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_PlayerVOXState::GetDefaultedPlayerVOXState(Entity);
}
UFUNCTION()
bool RemovePlayerVOXState(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_PlayerVOXState);
}
}
FECSMonitorRuntimeView __GetMonitorPlayerVOXStateOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_PlayerVOXState, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPlayerVOXStateOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_PlayerVOXState, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPlayerVOXStateOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_PlayerVOXState, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPlayerVOXStateOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_PlayerVOXState, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPlayerVOXStateOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_PlayerVOXState, bFixedFrame, bMustHandleAll);
}
void __MonitorPlayerVOXStateLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_PlayerVOXState, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPlayerVOXStateActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_PlayerVOXState, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPlayerVOXStateModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_PlayerVOXState, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FCS_ClientVOXState
{
UFUNCTION()
bool HasClientVOXState(const FECSWorldPtr &inout World)
{
    return ECSInternal::Has(World, ENTITY_ID_NULL, FCS_ClientVOXState);
}
FCS_ClientVOXState& AssignClientVOXState(const FECSWorldPtr &inout World, const FCS_ClientVOXState &inout DefaultValue = FCS_ClientVOXState())
{
    UScriptStruct local_6 = FCS_ClientVOXState;
    FECSComponentPtr local_8;
    int local_10 = local_8 = ECSInternal::Assign(World, ENTITY_ID_NULL, local_6, FECSComponentPtr(DefaultValue));
    local_10.InternalSet(local_8);
    return local_10.GetComp();
}
UFUNCTION()
void AssignClientVOXState_BP(const FECSWorldPtr &inout World, const FCS_ClientVOXState &inout DefaultValue = FCS_ClientVOXState())
{
    ECSFunc_FCS_ClientVOXState::AssignClientVOXState(World, DefaultValue);
    return;
}
FCS_ClientVOXState& ModifyClientVOXState(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_ClientVOXState;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Modify(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
FCS_ClientVOXState& ModifyOrAddClientVOXState(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_ClientVOXState;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::ModifyOrAdd(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
const FCS_ClientVOXState& GetClientVOXState(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_ClientVOXState;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Get(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
UFUNCTION()
FCS_ClientVOXState GetClientVOXState_BP(const FECSWorldPtr &inout World, bool &out bValid)
{
    FCS_ClientVOXState __r;
    bValid = false;
    bValid = ECSFunc_FCS_ClientVOXState::GetClientVOXState(World);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FCS_ClientVOXState GetDefaultedClientVOXState(const FECSWorldPtr &inout World)
{
    int local_10 = 0;
    const FCS_ClientVOXState __r;
    FECSComponentPtr local_6 = ECSInternal::GetDefaulted(World, ENTITY_ID_NULL, FCS_ClientVOXState);
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
FCS_ClientVOXState GetDefaultedClientVOXState_BP(const FECSWorldPtr &inout World)
{
    FCS_ClientVOXState __r;
    return __r;
}
UFUNCTION()
bool RemoveClientVOXState(const FECSWorldPtr &inout World)
{
    return ECSInternal::Remove(World, ENTITY_ID_NULL, FCS_ClientVOXState);
}
}
void __MonitorClientVOXStateLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FCS_ClientVOXState, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorClientVOXStateActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FCS_ClientVOXState, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorClientVOXStateModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FCS_ClientVOXState, bFixedFrame, Details);
    return;
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_PlayerVOXState &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_PlayerVOXState &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_PlayerVOXState &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_PlayerVOXState
{
int __IndexOf_SocialRoomId()
{
    return 0;
}
int __IndexOf_bInSocialRoom()
{
    return 1;
}
int __IndexOf_BattleRoomId()
{
    return 2;
}
int __IndexOf_bInBattleRoom()
{
    return 3;
}
}
