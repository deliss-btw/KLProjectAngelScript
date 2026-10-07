
enum EPVXTeamIndex
{
    PlayerTeam0,
    PlayerTeam1,
    PlayerTeam2,
    PlayerTeam3,
    BossTeam,
}

namespace __INTENRAL_FC_InitInfoPVX_NS
{
    const TECSComponentDerivedPtr<FC_InitInfoPVX> DerivedPtr = TECSComponentDerivedPtr<FC_InitInfoPVX>();
    const FC_InitInfoPVX DefaultValue = FC_InitInfoPVX();
}
namespace __INTENRAL_FC_PlayerInfoPVX_NS
{
    const TECSComponentDerivedPtr<FC_PlayerInfoPVX> DerivedPtr = TECSComponentDerivedPtr<FC_PlayerInfoPVX>();
    const FC_PlayerInfoPVX DefaultValue = FC_PlayerInfoPVX();
}
namespace __INTENRAL_FCS_SelectedTeamIndexNeedInitPVXTag_NS
{
    const TECSComponentDerivedPtr<FCS_SelectedTeamIndexNeedInitPVXTag> DerivedPtr = TECSComponentDerivedPtr<FCS_SelectedTeamIndexNeedInitPVXTag>();
    const FCS_SelectedTeamIndexNeedInitPVXTag DefaultValue = FCS_SelectedTeamIndexNeedInitPVXTag();
}
namespace __INTENRAL_FCS_PVX_MatchData_NS
{
    const TECSComponentDerivedPtr<FCS_PVX_MatchData> DerivedPtr = TECSComponentDerivedPtr<FCS_PVX_MatchData>();
    const FCS_PVX_MatchData DefaultValue = FCS_PVX_MatchData();
}
namespace __INTENRAL_FCS_PVX_ScoreData_NS
{
    const TECSComponentDerivedPtr<FCS_PVX_ScoreData> DerivedPtr = TECSComponentDerivedPtr<FCS_PVX_ScoreData>();
    const FCS_PVX_ScoreData DefaultValue = FCS_PVX_ScoreData();
}
namespace __INTENRAL_FCE_PlayerEnterPVX_NS
{
    const TECSEventDerivedPtr<FCE_PlayerEnterPVX> DerivedPtr = TECSEventDerivedPtr<FCE_PlayerEnterPVX>();
}
namespace __INTENRAL_FCE_PlayerSelectInfoPVX_NS
{
    const TECSEventDerivedPtr<FCE_PlayerSelectInfoPVX> DerivedPtr = TECSEventDerivedPtr<FCE_PlayerSelectInfoPVX>();
}
namespace __INTENRAL_FCE_PlayerSelectChangePVX_NS
{
    const TECSEventDerivedPtr<FCE_PlayerSelectChangePVX> DerivedPtr = TECSEventDerivedPtr<FCE_PlayerSelectChangePVX>();
}
namespace __INTENRAL_FCE_PVXSettlementTrigger_NS
{
    const TECSEventDerivedPtr<FCE_PVXSettlementTrigger> DerivedPtr = TECSEventDerivedPtr<FCE_PVXSettlementTrigger>();
}
namespace __INTENRAL_FCE_ChangeSelectedTeamPVX_NS
{
    const TECSEventDerivedPtr<FCE_ChangeSelectedTeamPVX> DerivedPtr = TECSEventDerivedPtr<FCE_ChangeSelectedTeamPVX>();

}
struct FC_InitInfoPVX : FECSComponent
{
    UPROPERTY()
    EFaction Faction = EFaction(1);
    UPROPERTY()
    int BossPrefabIdx = -1;
    UPROPERTY()
    FECSEntity SpawnPoint;
    UPROPERTY()
    FString UserNameOverride;
    UPROPERTY()
    int PlayerPrefabIdx = -1;


}

struct FC_PlayerInfoPVX : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    EFaction m_Faction;
    UPROPERTY()
    FECSEntity m_SpawnPoint;
    UPROPERTY()
    int m_BossPrefabIdx;
    UPROPERTY()
    int m_PlayerPrefabIdx;
    UPROPERTY()
    uint m_PlayerAvatarID;
    UPROPERTY()
    int m_PlayerTeamID;
    UPROPERTY()
    int m_PlayerInTeamIndex;

    FC_PlayerInfoPVX()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_PlayerInfoPVX(const FC_PlayerInfoPVX &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_PlayerInfoPVX opAssign(const FC_PlayerInfoPVX &inout Other)
    {
        FC_PlayerInfoPVX __r;
        this.SetFaction(Other.GetFaction());
        this.SetSpawnPoint(Other.GetSpawnPoint());
        this.SetBossPrefabIdx(Other.GetBossPrefabIdx());
        this.SetPlayerPrefabIdx(Other.GetPlayerPrefabIdx());
        this.SetPlayerAvatarID(Other.GetPlayerAvatarID());
        this.SetPlayerTeamID(Other.GetPlayerTeamID());
        this.SetPlayerInTeamIndex(Other.GetPlayerInTeamIndex());
        return __r;
    }
    EFaction GetFaction() const property
    {
        return this.m_Faction;
    }
    void SetFaction(const EFaction __Value) property
    {
        if (int(this.m_Faction) == int(__Value))
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_Faction = __Value;
        return;
    }
    const FECSEntity GetSpawnPoint() const property
    {
        const FECSEntity __r;
        return __r;
    }
    FECSEntity GetModify_SpawnPoint() property
    {
        FECSEntity __r;
        this.__MarkDirty(1);
        return __r;
    }
    void SetSpawnPoint(const FECSEntity &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_SpawnPoint = __Value;
        return;
    }
    int GetBossPrefabIdx() const property
    {
        return this.m_BossPrefabIdx;
    }
    void SetBossPrefabIdx(const int __Value) property
    {
        if (this.m_BossPrefabIdx == __Value)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_BossPrefabIdx = __Value;
        return;
    }
    int GetPlayerPrefabIdx() const property
    {
        return this.m_PlayerPrefabIdx;
    }
    void SetPlayerPrefabIdx(const int __Value) property
    {
        if (this.m_PlayerPrefabIdx == __Value)
        {
            return;
        }
        this.__MarkDirty(3);
        this.m_PlayerPrefabIdx = __Value;
        return;
    }
    uint GetPlayerAvatarID() const property
    {
        return this.m_PlayerAvatarID;
    }
    void SetPlayerAvatarID(const uint __Value) property
    {
        if (this.m_PlayerAvatarID == __Value)
        {
            return;
        }
        this.__MarkDirty(4);
        this.m_PlayerAvatarID = __Value;
        return;
    }
    int GetPlayerTeamID() const property
    {
        return this.m_PlayerTeamID;
    }
    void SetPlayerTeamID(const int __Value) property
    {
        if (this.m_PlayerTeamID == __Value)
        {
            return;
        }
        this.__MarkDirty(5);
        this.m_PlayerTeamID = __Value;
        return;
    }
    int GetPlayerInTeamIndex() const property
    {
        return this.m_PlayerInTeamIndex;
    }
    void SetPlayerInTeamIndex(const int __Value) property
    {
        if (this.m_PlayerInTeamIndex == __Value)
        {
            return;
        }
        this.__MarkDirty(6);
        this.m_PlayerInTeamIndex = __Value;
        return;
    }
}

struct FCE_PlayerEnterPVX : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    bool bIsInvader = false;
    UPROPERTY()
    int BossPrefabIdx = -1;
    UPROPERTY()
    FECSEntity SpawnPoint;
    UPROPERTY()
    FString UserNameOverride;
    UPROPERTY()
    int PlayerPrefabIdx = -1;


}

struct FCE_PlayerSelectInfoPVX : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    uint PlayerAvatarID;
    UPROPERTY()
    int PlayerMonsterIdx;
    UPROPERTY()
    bool bIsReady = false;


    bool Validate() const
    {
        return true;
    }
}

struct FCE_PlayerSelectChangePVX : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    uint PlayerAvatarID;
    UPROPERTY()
    int PlayerMonsterIdx;
    UPROPERTY()
    bool bIsReady = false;


}

struct FCS_SelectedTeamIndexNeedInitPVXTag : FECSSingleton
{
    FCS_SelectedTeamIndexNeedInitPVXTag()
    {
        return;
    }
}

struct FCE_PVXSettlementTrigger : FECSEvent
{
    FECSEvent _base_FECSEvent;

    FCE_PVXSettlementTrigger()
    {
        return;
    }
}

struct FCE_ChangeSelectedTeamPVX : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    int NewTeamID;


}

struct FPVX_MatchPlayerEntry
{
    FSubDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    uint m_Uid;
    UPROPERTY()
    int m_TeamId;
    UPROPERTY()
    int m_PlayerInTeamIndex;
    UPROPERTY()
    EFaction m_Faction;
    UPROPERTY()
    int m_BossPrefabIdx;
    UPROPERTY()
    int m_PlayerPrefabIdx;

    FPVX_MatchPlayerEntry()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FPVX_MatchPlayerEntry(const FPVX_MatchPlayerEntry &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FPVX_MatchPlayerEntry opAssign(const FPVX_MatchPlayerEntry &inout Other)
    {
        FPVX_MatchPlayerEntry __r;
        this.SetUid(Other.GetUid());
        this.SetTeamId(Other.GetTeamId());
        this.SetPlayerInTeamIndex(Other.GetPlayerInTeamIndex());
        this.SetFaction(Other.GetFaction());
        this.SetBossPrefabIdx(Other.GetBossPrefabIdx());
        this.SetPlayerPrefabIdx(Other.GetPlayerPrefabIdx());
        return __r;
    }
    uint GetUid() const property
    {
        return this.m_Uid;
    }
    void SetUid(const uint __Value) property
    {
        if (this.m_Uid == __Value)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_Uid = __Value;
        return;
    }
    int GetTeamId() const property
    {
        return this.m_TeamId;
    }
    void SetTeamId(const int __Value) property
    {
        if (this.m_TeamId == __Value)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_TeamId = __Value;
        return;
    }
    int GetPlayerInTeamIndex() const property
    {
        return this.m_PlayerInTeamIndex;
    }
    void SetPlayerInTeamIndex(const int __Value) property
    {
        if (this.m_PlayerInTeamIndex == __Value)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_PlayerInTeamIndex = __Value;
        return;
    }
    EFaction GetFaction() const property
    {
        return this.m_Faction;
    }
    void SetFaction(const EFaction __Value) property
    {
        if (int(this.m_Faction) == int(__Value))
        {
            return;
        }
        this.__MarkDirty(3);
        this.m_Faction = __Value;
        return;
    }
    int GetBossPrefabIdx() const property
    {
        return this.m_BossPrefabIdx;
    }
    void SetBossPrefabIdx(const int __Value) property
    {
        if (this.m_BossPrefabIdx == __Value)
        {
            return;
        }
        this.__MarkDirty(4);
        this.m_BossPrefabIdx = __Value;
        return;
    }
    int GetPlayerPrefabIdx() const property
    {
        return this.m_PlayerPrefabIdx;
    }
    void SetPlayerPrefabIdx(const int __Value) property
    {
        if (this.m_PlayerPrefabIdx == __Value)
        {
            return;
        }
        this.__MarkDirty(5);
        this.m_PlayerPrefabIdx = __Value;
        return;
    }
}

struct FCS_PVX_MatchData : FECSSingleton
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    TMap<uint, FPVX_MatchPlayerEntry> m_PlayerEntries;
    UPROPERTY()
    FFPTime m_SelectRoleEndTime;
    UPROPERTY()
    FFPTime m_SelectRoleTotalTime;

    FCS_PVX_MatchData()
    {
        this.__InitDirtyFlags();
        return;
    }
    FCS_PVX_MatchData(const FCS_PVX_MatchData &inout Other)
    {
        this.__InitDirtyFlags();
        this.m_PlayerEntries = Other.m_PlayerEntries;
        this.m_SelectRoleEndTime = Other.m_SelectRoleEndTime;
        this.m_SelectRoleTotalTime = Other.m_SelectRoleTotalTime;
        return;
    }
    FCS_PVX_MatchData opAssign(const FCS_PVX_MatchData &inout Other)
    {
        FCS_PVX_MatchData __r;
        this.SetPlayerEntries(Other.GetPlayerEntries());
        this.SetSelectRoleEndTime(Other.GetSelectRoleEndTime());
        this.SetSelectRoleTotalTime(Other.GetSelectRoleTotalTime());
        return __r;
    }
    const TMap<uint, FPVX_MatchPlayerEntry> GetPlayerEntries() const property
    {
        const TMap<uint, FPVX_MatchPlayerEntry> __r;
        return __r;
    }
    TMap<uint, FPVX_MatchPlayerEntry> GetModify_PlayerEntries() property
    {
        TMap<uint, FPVX_MatchPlayerEntry> __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetPlayerEntries(const TMap<uint, FPVX_MatchPlayerEntry> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_PlayerEntries = __Value;
        return;
    }
    const FFPTime GetSelectRoleEndTime() const property
    {
        const FFPTime __r;
        return __r;
    }
    FFPTime GetModify_SelectRoleEndTime() property
    {
        FFPTime __r;
        this.__MarkDirty(1);
        return __r;
    }
    void SetSelectRoleEndTime(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_SelectRoleEndTime = __Value;
        return;
    }
    const FFPTime GetSelectRoleTotalTime() const property
    {
        const FFPTime __r;
        return __r;
    }
    FFPTime GetModify_SelectRoleTotalTime() property
    {
        FFPTime __r;
        this.__MarkDirty(2);
        return __r;
    }
    void SetSelectRoleTotalTime(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_SelectRoleTotalTime = __Value;
        return;
    }
}

struct FCS_PVX_ScoreData : FECSSingleton
{
    FRootDirtyFlags16 __DirtyFlags;
    UPROPERTY()
    TMap<FECSEntity, FPVX_PlayerData> m_PlayerInfoMap;
    UPROPERTY()
    FFPTime m_MissionEndTime;
    UPROPERTY()
    FFPTime m_MissionStartTime;
    UPROPERTY()
    bool m_bHasStarted;
    UPROPERTY()
    int m_WinnerTeamId;
    UPROPERTY()
    int m_LoserTeamId;
    UPROPERTY()
    TArray<int> m_HasTriggeredLevelProgressArray;
    UPROPERTY()
    float32 m_ExpMultiplier;
    UPROPERTY()
    FBuffConfigRef m_MonsterPowerBuffConfig;

    FCS_PVX_ScoreData()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FCS_PVX_ScoreData(const FCS_PVX_ScoreData &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FCS_PVX_ScoreData opAssign(const FCS_PVX_ScoreData &inout Other)
    {
        FCS_PVX_ScoreData __r;
        this.SetPlayerInfoMap(Other.GetPlayerInfoMap());
        this.SetMissionEndTime(Other.GetMissionEndTime());
        this.SetMissionStartTime(Other.GetMissionStartTime());
        this.SetbHasStarted(Other.GetbHasStarted());
        this.SetWinnerTeamId(Other.GetWinnerTeamId());
        this.SetLoserTeamId(Other.GetLoserTeamId());
        this.SetHasTriggeredLevelProgressArray(Other.GetHasTriggeredLevelProgressArray());
        this.SetExpMultiplier(Other.GetExpMultiplier());
        this.SetMonsterPowerBuffConfig(Other.GetMonsterPowerBuffConfig());
        return __r;
    }
    const TMap<FECSEntity, FPVX_PlayerData> GetPlayerInfoMap() const property
    {
        const TMap<FECSEntity, FPVX_PlayerData> __r;
        return __r;
    }
    TMap<FECSEntity, FPVX_PlayerData> GetModify_PlayerInfoMap() property
    {
        TMap<FECSEntity, FPVX_PlayerData> __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetPlayerInfoMap(const TMap<FECSEntity, FPVX_PlayerData> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_PlayerInfoMap = __Value;
        return;
    }
    const FFPTime GetMissionEndTime() const property
    {
        const FFPTime __r;
        return __r;
    }
    FFPTime GetModify_MissionEndTime() property
    {
        FFPTime __r;
        this.__MarkDirty(1);
        return __r;
    }
    void SetMissionEndTime(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_MissionEndTime = __Value;
        return;
    }
    const FFPTime GetMissionStartTime() const property
    {
        const FFPTime __r;
        return __r;
    }
    FFPTime GetModify_MissionStartTime() property
    {
        FFPTime __r;
        this.__MarkDirty(2);
        return __r;
    }
    void SetMissionStartTime(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_MissionStartTime = __Value;
        return;
    }
    bool GetbHasStarted() const property
    {
        return this.m_bHasStarted;
    }
    void SetbHasStarted(const bool __Value) property
    {
        if (!(this.m_bHasStarted) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(3);
        this.m_bHasStarted = __Value;
        return;
    }
    int GetWinnerTeamId() const property
    {
        return this.m_WinnerTeamId;
    }
    void SetWinnerTeamId(const int __Value) property
    {
        if (this.m_WinnerTeamId == __Value)
        {
            return;
        }
        this.__MarkDirty(4);
        this.m_WinnerTeamId = __Value;
        return;
    }
    int GetLoserTeamId() const property
    {
        return this.m_LoserTeamId;
    }
    void SetLoserTeamId(const int __Value) property
    {
        if (this.m_LoserTeamId == __Value)
        {
            return;
        }
        this.__MarkDirty(5);
        this.m_LoserTeamId = __Value;
        return;
    }
    const TArray<int> GetHasTriggeredLevelProgressArray() const property
    {
        const TArray<int> __r;
        return __r;
    }
    TArray<int> GetModify_HasTriggeredLevelProgressArray() property
    {
        TArray<int> __r;
        this.__MarkDirty(6);
        return __r;
    }
    void SetHasTriggeredLevelProgressArray(const TArray<int> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(6);
        this.m_HasTriggeredLevelProgressArray = __Value;
        return;
    }
    float32 GetExpMultiplier() const property
    {
        return this.m_ExpMultiplier;
    }
    void SetExpMultiplier(const float32 __Value) property
    {
        if (this.m_ExpMultiplier == __Value)
        {
            return;
        }
        this.__MarkDirty(7);
        this.m_ExpMultiplier = __Value;
        return;
    }
    const FBuffConfigRef GetMonsterPowerBuffConfig() const property
    {
        const FBuffConfigRef __r;
        return __r;
    }
    FBuffConfigRef GetModify_MonsterPowerBuffConfig() property
    {
        FBuffConfigRef __r;
        this.__MarkDirty(8);
        return __r;
    }
    void SetMonsterPowerBuffConfig(const FBuffConfigRef &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(8);
        this.m_MonsterPowerBuffConfig = __Value;
        return;
    }
}

namespace ECSFunc_FC_InitInfoPVX
{
UFUNCTION()
bool HasInitInfoPVX(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_InitInfoPVX);
}
FC_InitInfoPVX& AssignInitInfoPVX(const FECSEntity &inout Entity, const FC_InitInfoPVX &inout DefaultValue = FC_InitInfoPVX())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_InitInfoPVX, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignInitInfoPVX_BP(const FECSEntity &inout Entity, const FC_InitInfoPVX &inout DefaultValue = FC_InitInfoPVX())
{
    ECSFunc_FC_InitInfoPVX::AssignInitInfoPVX(Entity, DefaultValue);
    return;
}
FC_InitInfoPVX& ModifyInitInfoPVX(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_InitInfoPVX));
    return local_12.GetComp();
}
FC_InitInfoPVX& ModifyOrAddInitInfoPVX(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_InitInfoPVX));
    return local_12.GetComp();
}
const FC_InitInfoPVX& GetInitInfoPVX(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_InitInfoPVX));
    return local_12.GetComp();
}
UFUNCTION()
FC_InitInfoPVX GetInitInfoPVX_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_InitInfoPVX __r;
    bValid = false;
    bValid = ECSFunc_FC_InitInfoPVX::GetInitInfoPVX(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_InitInfoPVX GetDefaultedInitInfoPVX(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_InitInfoPVX __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_InitInfoPVX);
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
FC_InitInfoPVX GetDefaultedInitInfoPVX_BP(const FECSEntity &inout Entity)
{
    FC_InitInfoPVX __r;
    return __r;
}
UFUNCTION()
bool RemoveInitInfoPVX(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_InitInfoPVX);
}
}
FECSMonitorRuntimeView __GetMonitorInitInfoPVXOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_InitInfoPVX, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorInitInfoPVXOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_InitInfoPVX, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorInitInfoPVXOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_InitInfoPVX, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorInitInfoPVXOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_InitInfoPVX, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorInitInfoPVXOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_InitInfoPVX, bFixedFrame, bMustHandleAll);
}
void __MonitorInitInfoPVXLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_InitInfoPVX, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorInitInfoPVXActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_InitInfoPVX, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorInitInfoPVXModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_InitInfoPVX, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_PlayerInfoPVX
{
UFUNCTION()
bool HasPlayerInfoPVX(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_PlayerInfoPVX);
}
FC_PlayerInfoPVX& AssignPlayerInfoPVX(const FECSEntity &inout Entity, const FC_PlayerInfoPVX &inout DefaultValue = FC_PlayerInfoPVX())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_PlayerInfoPVX, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignPlayerInfoPVX_BP(const FECSEntity &inout Entity, const FC_PlayerInfoPVX &inout DefaultValue = FC_PlayerInfoPVX())
{
    ECSFunc_FC_PlayerInfoPVX::AssignPlayerInfoPVX(Entity, DefaultValue);
    return;
}
FC_PlayerInfoPVX& ModifyPlayerInfoPVX(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_PlayerInfoPVX));
    return local_12.GetComp();
}
FC_PlayerInfoPVX& ModifyOrAddPlayerInfoPVX(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_PlayerInfoPVX));
    return local_12.GetComp();
}
const FC_PlayerInfoPVX& GetPlayerInfoPVX(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_PlayerInfoPVX));
    return local_12.GetComp();
}
UFUNCTION()
FC_PlayerInfoPVX GetPlayerInfoPVX_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_PlayerInfoPVX& local_4 = ECSFunc_FC_PlayerInfoPVX::GetPlayerInfoPVX(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_PlayerInfoPVX();
}
const FC_PlayerInfoPVX GetDefaultedPlayerInfoPVX(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_PlayerInfoPVX __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_PlayerInfoPVX);
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
FC_PlayerInfoPVX GetDefaultedPlayerInfoPVX_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_PlayerInfoPVX::GetDefaultedPlayerInfoPVX(Entity);
}
UFUNCTION()
bool RemovePlayerInfoPVX(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_PlayerInfoPVX);
}
}
FECSMonitorRuntimeView __GetMonitorPlayerInfoPVXOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_PlayerInfoPVX, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPlayerInfoPVXOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_PlayerInfoPVX, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPlayerInfoPVXOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_PlayerInfoPVX, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPlayerInfoPVXOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_PlayerInfoPVX, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPlayerInfoPVXOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_PlayerInfoPVX, bFixedFrame, bMustHandleAll);
}
void __MonitorPlayerInfoPVXLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_PlayerInfoPVX, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPlayerInfoPVXActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_PlayerInfoPVX, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPlayerInfoPVXModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_PlayerInfoPVX, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FCS_SelectedTeamIndexNeedInitPVXTag
{
UFUNCTION()
bool HasSelectedTeamIndexNeedInitPVXTag(const FECSWorldPtr &inout World)
{
    return ECSInternal::Has(World, ENTITY_ID_NULL, FCS_SelectedTeamIndexNeedInitPVXTag);
}
FCS_SelectedTeamIndexNeedInitPVXTag& AssignSelectedTeamIndexNeedInitPVXTag(const FECSWorldPtr &inout World, const FCS_SelectedTeamIndexNeedInitPVXTag &inout DefaultValue = FCS_SelectedTeamIndexNeedInitPVXTag())
{
    UScriptStruct local_6 = FCS_SelectedTeamIndexNeedInitPVXTag;
    FECSComponentPtr local_8;
    int local_10 = local_8 = ECSInternal::Assign(World, ENTITY_ID_NULL, local_6, FECSComponentPtr(DefaultValue));
    local_10.InternalSet(local_8);
    return local_10.GetComp();
}
UFUNCTION()
void AssignSelectedTeamIndexNeedInitPVXTag_BP(const FECSWorldPtr &inout World, const FCS_SelectedTeamIndexNeedInitPVXTag &inout DefaultValue = FCS_SelectedTeamIndexNeedInitPVXTag())
{
    ECSFunc_FCS_SelectedTeamIndexNeedInitPVXTag::AssignSelectedTeamIndexNeedInitPVXTag(World, DefaultValue);
    return;
}
FCS_SelectedTeamIndexNeedInitPVXTag& ModifySelectedTeamIndexNeedInitPVXTag(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_SelectedTeamIndexNeedInitPVXTag;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Modify(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
FCS_SelectedTeamIndexNeedInitPVXTag& ModifyOrAddSelectedTeamIndexNeedInitPVXTag(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_SelectedTeamIndexNeedInitPVXTag;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::ModifyOrAdd(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
const FCS_SelectedTeamIndexNeedInitPVXTag& GetSelectedTeamIndexNeedInitPVXTag(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_SelectedTeamIndexNeedInitPVXTag;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Get(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
UFUNCTION()
FCS_SelectedTeamIndexNeedInitPVXTag GetSelectedTeamIndexNeedInitPVXTag_BP(const FECSWorldPtr &inout World, bool &out bValid)
{
    bValid = false;
    const FCS_SelectedTeamIndexNeedInitPVXTag& local_4 = ECSFunc_FCS_SelectedTeamIndexNeedInitPVXTag::GetSelectedTeamIndexNeedInitPVXTag(World);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FCS_SelectedTeamIndexNeedInitPVXTag();
}
const FCS_SelectedTeamIndexNeedInitPVXTag GetDefaultedSelectedTeamIndexNeedInitPVXTag(const FECSWorldPtr &inout World)
{
    int local_10 = 0;
    const FCS_SelectedTeamIndexNeedInitPVXTag __r;
    FECSComponentPtr local_6 = ECSInternal::GetDefaulted(World, ENTITY_ID_NULL, FCS_SelectedTeamIndexNeedInitPVXTag);
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
FCS_SelectedTeamIndexNeedInitPVXTag GetDefaultedSelectedTeamIndexNeedInitPVXTag_BP(const FECSWorldPtr &inout World)
{
    return ECSFunc_FCS_SelectedTeamIndexNeedInitPVXTag::GetDefaultedSelectedTeamIndexNeedInitPVXTag(World);
}
UFUNCTION()
bool RemoveSelectedTeamIndexNeedInitPVXTag(const FECSWorldPtr &inout World)
{
    return ECSInternal::Remove(World, ENTITY_ID_NULL, FCS_SelectedTeamIndexNeedInitPVXTag);
}
}
void __MonitorSelectedTeamIndexNeedInitPVXTagLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FCS_SelectedTeamIndexNeedInitPVXTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorSelectedTeamIndexNeedInitPVXTagActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FCS_SelectedTeamIndexNeedInitPVXTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorSelectedTeamIndexNeedInitPVXTagModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FCS_SelectedTeamIndexNeedInitPVXTag, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FCS_PVX_MatchData
{
UFUNCTION()
bool HasPVX_MatchData(const FECSWorldPtr &inout World)
{
    return ECSInternal::Has(World, ENTITY_ID_NULL, FCS_PVX_MatchData);
}
FCS_PVX_MatchData& AssignPVX_MatchData(const FECSWorldPtr &inout World, const FCS_PVX_MatchData &inout DefaultValue = FCS_PVX_MatchData())
{
    UScriptStruct local_6 = FCS_PVX_MatchData;
    FECSComponentPtr local_8;
    int local_10 = local_8 = ECSInternal::Assign(World, ENTITY_ID_NULL, local_6, FECSComponentPtr(DefaultValue));
    local_10.InternalSet(local_8);
    return local_10.GetComp();
}
UFUNCTION()
void AssignPVX_MatchData_BP(const FECSWorldPtr &inout World, const FCS_PVX_MatchData &inout DefaultValue = FCS_PVX_MatchData())
{
    ECSFunc_FCS_PVX_MatchData::AssignPVX_MatchData(World, DefaultValue);
    return;
}
FCS_PVX_MatchData& ModifyPVX_MatchData(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_PVX_MatchData;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Modify(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
FCS_PVX_MatchData& ModifyOrAddPVX_MatchData(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_PVX_MatchData;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::ModifyOrAdd(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
const FCS_PVX_MatchData& GetPVX_MatchData(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_PVX_MatchData;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Get(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
UFUNCTION()
FCS_PVX_MatchData GetPVX_MatchData_BP(const FECSWorldPtr &inout World, bool &out bValid)
{
    bValid = false;
    const FCS_PVX_MatchData& local_4 = ECSFunc_FCS_PVX_MatchData::GetPVX_MatchData(World);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FCS_PVX_MatchData();
}
const FCS_PVX_MatchData GetDefaultedPVX_MatchData(const FECSWorldPtr &inout World)
{
    int local_10 = 0;
    const FCS_PVX_MatchData __r;
    FECSComponentPtr local_6 = ECSInternal::GetDefaulted(World, ENTITY_ID_NULL, FCS_PVX_MatchData);
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
FCS_PVX_MatchData GetDefaultedPVX_MatchData_BP(const FECSWorldPtr &inout World)
{
    return ECSFunc_FCS_PVX_MatchData::GetDefaultedPVX_MatchData(World);
}
UFUNCTION()
bool RemovePVX_MatchData(const FECSWorldPtr &inout World)
{
    return ECSInternal::Remove(World, ENTITY_ID_NULL, FCS_PVX_MatchData);
}
}
void __MonitorPVX_MatchDataLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FCS_PVX_MatchData, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPVX_MatchDataActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FCS_PVX_MatchData, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPVX_MatchDataModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FCS_PVX_MatchData, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FCS_PVX_ScoreData
{
UFUNCTION()
bool HasPVX_ScoreData(const FECSWorldPtr &inout World)
{
    return ECSInternal::Has(World, ENTITY_ID_NULL, FCS_PVX_ScoreData);
}
FCS_PVX_ScoreData& AssignPVX_ScoreData(const FECSWorldPtr &inout World, const FCS_PVX_ScoreData &inout DefaultValue = FCS_PVX_ScoreData())
{
    UScriptStruct local_6 = FCS_PVX_ScoreData;
    FECSComponentPtr local_8;
    int local_10 = local_8 = ECSInternal::Assign(World, ENTITY_ID_NULL, local_6, FECSComponentPtr(DefaultValue));
    local_10.InternalSet(local_8);
    return local_10.GetComp();
}
UFUNCTION()
void AssignPVX_ScoreData_BP(const FECSWorldPtr &inout World, const FCS_PVX_ScoreData &inout DefaultValue = FCS_PVX_ScoreData())
{
    ECSFunc_FCS_PVX_ScoreData::AssignPVX_ScoreData(World, DefaultValue);
    return;
}
FCS_PVX_ScoreData& ModifyPVX_ScoreData(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_PVX_ScoreData;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Modify(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
FCS_PVX_ScoreData& ModifyOrAddPVX_ScoreData(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_PVX_ScoreData;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::ModifyOrAdd(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
const FCS_PVX_ScoreData& GetPVX_ScoreData(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_PVX_ScoreData;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Get(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
UFUNCTION()
FCS_PVX_ScoreData GetPVX_ScoreData_BP(const FECSWorldPtr &inout World, bool &out bValid)
{
    bValid = false;
    const FCS_PVX_ScoreData& local_4 = ECSFunc_FCS_PVX_ScoreData::GetPVX_ScoreData(World);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FCS_PVX_ScoreData();
}
const FCS_PVX_ScoreData GetDefaultedPVX_ScoreData(const FECSWorldPtr &inout World)
{
    int local_10 = 0;
    const FCS_PVX_ScoreData __r;
    FECSComponentPtr local_6 = ECSInternal::GetDefaulted(World, ENTITY_ID_NULL, FCS_PVX_ScoreData);
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
FCS_PVX_ScoreData GetDefaultedPVX_ScoreData_BP(const FECSWorldPtr &inout World)
{
    return ECSFunc_FCS_PVX_ScoreData::GetDefaultedPVX_ScoreData(World);
}
UFUNCTION()
bool RemovePVX_ScoreData(const FECSWorldPtr &inout World)
{
    return ECSInternal::Remove(World, ENTITY_ID_NULL, FCS_PVX_ScoreData);
}
}
void __MonitorPVX_ScoreDataLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FCS_PVX_ScoreData, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPVX_ScoreDataActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FCS_PVX_ScoreData, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPVX_ScoreDataModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FCS_PVX_ScoreData, bFixedFrame, Details);
    return;
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_PlayerInfoPVX &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_PlayerInfoPVX &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_PlayerInfoPVX &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_PlayerInfoPVX
{
int __IndexOf_Faction()
{
    return 0;
}
int __IndexOf_SpawnPoint()
{
    return 1;
}
int __IndexOf_BossPrefabIdx()
{
    return 2;
}
int __IndexOf_PlayerPrefabIdx()
{
    return 3;
}
int __IndexOf_PlayerAvatarID()
{
    return 4;
}
int __IndexOf_PlayerTeamID()
{
    return 5;
}
int __IndexOf_PlayerInTeamIndex()
{
    return 6;
}
}
namespace AutoDelta
{
FSubDirtyFlags8 GetDirtyFlags(FPVX_MatchPlayerEntry &inout Data)
{
    FSubDirtyFlags8 __r;
    return __r;
}
void ClearDirtyFlags(FPVX_MatchPlayerEntry &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FPVX_MatchPlayerEntry
{
int __IndexOf_Uid()
{
    return 0;
}
int __IndexOf_TeamId()
{
    return 1;
}
int __IndexOf_PlayerInTeamIndex()
{
    return 2;
}
int __IndexOf_Faction()
{
    return 3;
}
int __IndexOf_BossPrefabIdx()
{
    return 4;
}
int __IndexOf_PlayerPrefabIdx()
{
    return 5;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FCS_PVX_MatchData &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FCS_PVX_MatchData &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FCS_PVX_MatchData &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FCS_PVX_MatchData
{
int __IndexOf_PlayerEntries()
{
    return 0;
}
int __IndexOf_SelectRoleEndTime()
{
    return 1;
}
int __IndexOf_SelectRoleTotalTime()
{
    return 2;
}
}
namespace AutoDelta
{
FRootDirtyFlags16 GetDirtyFlags(FCS_PVX_ScoreData &inout Data)
{
    FRootDirtyFlags16 __r;
    return __r;
}
void InitDirtyFlags(FCS_PVX_ScoreData &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FCS_PVX_ScoreData &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FCS_PVX_ScoreData
{
int __IndexOf_PlayerInfoMap()
{
    return 0;
}
int __IndexOf_MissionEndTime()
{
    return 1;
}
int __IndexOf_MissionStartTime()
{
    return 2;
}
int __IndexOf_bHasStarted()
{
    return 3;
}
int __IndexOf_WinnerTeamId()
{
    return 4;
}
int __IndexOf_LoserTeamId()
{
    return 5;
}
int __IndexOf_HasTriggeredLevelProgressArray()
{
    return 6;
}
int __IndexOf_ExpMultiplier()
{
    return 7;
}
int __IndexOf_MonsterPowerBuffConfig()
{
    return 8;
}
}
