
namespace __INTENRAL_FCS_GameModeProfile_NS
{
    const TECSComponentDerivedPtr<FCS_GameModeProfile> DerivedPtr = TECSComponentDerivedPtr<FCS_GameModeProfile>();
    const FCS_GameModeProfile DefaultValue = FCS_GameModeProfile();
}
namespace __INTENRAL_FCS_GameMode_MatchData_NS
{
    const TECSComponentDerivedPtr<FCS_GameMode_MatchData> DerivedPtr = TECSComponentDerivedPtr<FCS_GameMode_MatchData>();
    const FCS_GameMode_MatchData DefaultValue = FCS_GameMode_MatchData();
}
namespace __INTENRAL_FCS_GameMode_ScoreData_NS
{
    const TECSComponentDerivedPtr<FCS_GameMode_ScoreData> DerivedPtr = TECSComponentDerivedPtr<FCS_GameMode_ScoreData>();
    const FCS_GameMode_ScoreData DefaultValue = FCS_GameMode_ScoreData();
}
namespace __INTENRAL_FCS_GameModeFirstTickTag_NS
{
    const TECSComponentDerivedPtr<FCS_GameModeFirstTickTag> DerivedPtr = TECSComponentDerivedPtr<FCS_GameModeFirstTickTag>();
    const FCS_GameModeFirstTickTag DefaultValue = FCS_GameModeFirstTickTag();

}
struct FCS_GameModeProfile : FECSSingleton
{
    UPROPERTY()
    FInstancedStruct GameModeFlowSettings;
    UPROPERTY()
    TArray<FInstancedStruct> GameModeBehaviorSettings;

    FCS_GameModeProfile()
    {
        return;
    }
    UGameModeFlow GetGameModeFlow() const
    {
        if (!(this.IsValid()))
        {
            return nullptr;
        }
        Get local_8;
        TSubclassOf<UGameModeFlow> local_10 = TSubclassOf<UGameModeFlow>(local_8.opCall().FlowClass);
        if ((local_10 == nullptr))
        {
            return nullptr;
        }
        return local_10.GetDefaultObject();
    }
}

struct FGameModePlayerMatchDataBase
{
    FSubDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    uint m_UID;
    UPROPERTY()
    uint8 m_TeamID;
    UPROPERTY()
    int m_PlayerInTeamIndex;
    UPROPERTY()
    EFaction m_Faction;
    UPROPERTY()
    int m_BossPrefabIdx;
    UPROPERTY()
    int m_PlayerPrefabIdx;

    FGameModePlayerMatchDataBase()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FGameModePlayerMatchDataBase(const FGameModePlayerMatchDataBase &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FGameModePlayerMatchDataBase opAssign(const FGameModePlayerMatchDataBase &inout Other)
    {
        FGameModePlayerMatchDataBase __r;
        this.SetUID(Other.GetUID());
        this.SetTeamID(uint8(Other.GetTeamID()));
        this.SetPlayerInTeamIndex(Other.GetPlayerInTeamIndex());
        this.SetFaction(Other.GetFaction());
        this.SetBossPrefabIdx(Other.GetBossPrefabIdx());
        this.SetPlayerPrefabIdx(Other.GetPlayerPrefabIdx());
        return __r;
    }
    uint GetUID() const property
    {
        return this.m_UID;
    }
    void SetUID(const uint __Value) property
    {
        if (this.m_UID == __Value)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_UID = __Value;
        return;
    }
    uint8 GetTeamID() const property
    {
        return this.m_TeamID;
    }
    void SetTeamID(const uint8 __Value) property
    {
        if (this.m_TeamID == __Value)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_TeamID = (__Value != 0);
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

struct FCS_GameMode_MatchData : FECSSingleton
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    TMap<uint, FGameModePlayerMatchDataBase> m_PlayerMatchDatas;
    UPROPERTY()
    TArray<int> m_TeamPlayerCounts;
    UPROPERTY()
    FFPTime m_SelectRoleEndTime;
    UPROPERTY()
    FFPTime m_SelectRoleTotalTime;

    FCS_GameMode_MatchData()
    {
        this.__InitDirtyFlags();
        return;
    }
    FCS_GameMode_MatchData(const FCS_GameMode_MatchData &inout Other)
    {
        this.__InitDirtyFlags();
        this.m_PlayerMatchDatas = Other.m_PlayerMatchDatas;
        this.m_TeamPlayerCounts = Other.m_TeamPlayerCounts;
        this.m_SelectRoleEndTime = Other.m_SelectRoleEndTime;
        this.m_SelectRoleTotalTime = Other.m_SelectRoleTotalTime;
        return;
    }
    FCS_GameMode_MatchData opAssign(const FCS_GameMode_MatchData &inout Other)
    {
        FCS_GameMode_MatchData __r;
        this.SetPlayerMatchDatas(Other.GetPlayerMatchDatas());
        this.SetTeamPlayerCounts(Other.GetTeamPlayerCounts());
        this.SetSelectRoleEndTime(Other.GetSelectRoleEndTime());
        this.SetSelectRoleTotalTime(Other.GetSelectRoleTotalTime());
        return __r;
    }
    int GetTeamPlayerCount(const uint8 TeamID) const
    {
        int local_3;
        if (this.GetTeamPlayerCounts().IsValidIndex(TeamID))
        {
            int local_1_2 = this.GetTeamPlayerCounts()[TeamID];
            local_3 = local_1_2;
        }
        else
        {
            local_3 = 0;
        }
        return local_3;
    }
    void InitTeamCounts(const int MaxTeamCount)
    {
        this.GetModify_TeamPlayerCounts().SetNum(MaxTeamCount);
        int local_1 = 0;
        for (; local_1 < MaxTeamCount; )
        {
            this.GetModify_TeamPlayerCounts()[local_1] = 0;
            ++local_1;
        }
        return;
    }
    uint8 FindBestTeamForAssign() const
    {
        int local_1 = 2147483647;
        int local_3 = 0;
        int local_5 = 0;
        for (; local_5 < this.GetTeamPlayerCounts().Num(); ++local_5)
        {
            if (this.GetTeamPlayerCounts()[local_5] < local_1)
            {
                local_1 = this.GetTeamPlayerCounts()[local_5];
                local_3 = local_5;
            }
        }
        return local_3;
    }
    void RefreshTeamCounts()
    {
        TMap<uint, FGameModePlayerMatchDataBase>& local_2 = this.GetModify_PlayerMatchDatas();
        TArray<int>& local_4 = this.GetModify_TeamPlayerCounts();
        int local_5 = 0;
        for (; local_5 < local_4.Num(); ++local_5)
        {
            TArray<uint> local_12;
            for (auto& local_30 : this.GetPlayerMatchDatas())
            {
                if (GetTeamID() == local_5)
                {
                    local_12.Add(local_30.GetKey());
                }
            }
            this.SortUIDsByInTeamIndex(local_12);
            local_4[local_5] = local_12.Num();
            int local_32 = 0;
            for (; local_32 < local_12.Num(); )
            {
                local_2[local_12[local_32]].SetPlayerInTeamIndex(local_32);
                ++local_32;
            }
        }
        return;
    }
    void SortUIDsByInTeamIndex(TArray<uint> &inout UIDs) const
    {
        int local_1 = 1;
        for (; local_1 < UIDs.Num(); ++local_1)
        {
            int local_5 = local_1;
            for (; local_5 > 0; --local_5)
            {
                if (this.GetPlayerMatchDatas()[UIDs[local_5]].GetPlayerInTeamIndex() < this.GetPlayerMatchDatas()[UIDs[(local_5 - 1)]].GetPlayerInTeamIndex())
                {
                    int local_8;
                    local_8 = UIDs[local_5];
                    UIDs[local_5] = UIDs[local_5 - 1];
                    UIDs[(local_5 - 1)] = local_8;
                    continue;
                }
                break;
            }
        }
        return;
    }
    const TMap<uint, FGameModePlayerMatchDataBase> GetPlayerMatchDatas() const property
    {
        const TMap<uint, FGameModePlayerMatchDataBase> __r;
        return __r;
    }
    TMap<uint, FGameModePlayerMatchDataBase> GetModify_PlayerMatchDatas() property
    {
        TMap<uint, FGameModePlayerMatchDataBase> __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetPlayerMatchDatas(const TMap<uint, FGameModePlayerMatchDataBase> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_PlayerMatchDatas = __Value;
        return;
    }
    const TArray<int> GetTeamPlayerCounts() const property
    {
        const TArray<int> __r;
        return __r;
    }
    TArray<int> GetModify_TeamPlayerCounts() property
    {
        TArray<int> __r;
        this.__MarkDirty(1);
        return __r;
    }
    void SetTeamPlayerCounts(const TArray<int> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_TeamPlayerCounts = __Value;
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
        this.__MarkDirty(2);
        return __r;
    }
    void SetSelectRoleEndTime(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(2);
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
        this.__MarkDirty(3);
        return __r;
    }
    void SetSelectRoleTotalTime(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(3);
        this.m_SelectRoleTotalTime = __Value;
        return;
    }
}

struct FGameModePlayerScoreDataBase
{
    FSubDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    int m_Kills;
    UPROPERTY()
    int m_Deaths;
    UPROPERTY()
    int m_Assists;
    UPROPERTY()
    float32 m_DamageDealt;
    UPROPERTY()
    float32 m_DamageTaken;

    FGameModePlayerScoreDataBase()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FGameModePlayerScoreDataBase(const FGameModePlayerScoreDataBase &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FGameModePlayerScoreDataBase opAssign(const FGameModePlayerScoreDataBase &inout Other)
    {
        FGameModePlayerScoreDataBase __r;
        this.SetKills(Other.GetKills());
        this.SetDeaths(Other.GetDeaths());
        this.SetAssists(Other.GetAssists());
        this.SetDamageDealt(Other.GetDamageDealt());
        this.SetDamageTaken(Other.GetDamageTaken());
        return __r;
    }
    int GetKills() const property
    {
        return this.m_Kills;
    }
    void SetKills(const int __Value) property
    {
        if (this.m_Kills == __Value)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_Kills = __Value;
        return;
    }
    int GetDeaths() const property
    {
        return this.m_Deaths;
    }
    void SetDeaths(const int __Value) property
    {
        if (this.m_Deaths == __Value)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_Deaths = __Value;
        return;
    }
    int GetAssists() const property
    {
        return this.m_Assists;
    }
    void SetAssists(const int __Value) property
    {
        if (this.m_Assists == __Value)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_Assists = __Value;
        return;
    }
    float32 GetDamageDealt() const property
    {
        return this.m_DamageDealt;
    }
    void SetDamageDealt(const float32 __Value) property
    {
        if (this.m_DamageDealt == __Value)
        {
            return;
        }
        this.__MarkDirty(3);
        this.m_DamageDealt = __Value;
        return;
    }
    float32 GetDamageTaken() const property
    {
        return this.m_DamageTaken;
    }
    void SetDamageTaken(const float32 __Value) property
    {
        if (this.m_DamageTaken == __Value)
        {
            return;
        }
        this.__MarkDirty(4);
        this.m_DamageTaken = __Value;
        return;
    }
}

struct FCS_GameMode_ScoreData : FECSSingleton
{
    FRootDirtyFlags16 __DirtyFlags;
    UPROPERTY()
    TMap<FECSEntity, FGameModePlayerScoreDataBase> m_PlayerScores;
    UPROPERTY()
    TArray<int> m_WinnerTeamIds;
    UPROPERTY()
    TArray<int> m_LoserTeamIds;
    UPROPERTY()
    FFPTime m_FinishStartTime;
    UPROPERTY()
    FFPTime m_MatchStartTime;
    UPROPERTY()
    FFPTime m_MatchEndTime;
    UPROPERTY()
    bool m_bPlayersKicked;
    UPROPERTY()
    bool m_bDSExitRequested;

    FCS_GameMode_ScoreData()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FCS_GameMode_ScoreData(const FCS_GameMode_ScoreData &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FCS_GameMode_ScoreData opAssign(const FCS_GameMode_ScoreData &inout Other)
    {
        FCS_GameMode_ScoreData __r;
        this.SetPlayerScores(Other.GetPlayerScores());
        this.SetWinnerTeamIds(Other.GetWinnerTeamIds());
        this.SetLoserTeamIds(Other.GetLoserTeamIds());
        this.SetFinishStartTime(Other.GetFinishStartTime());
        this.SetMatchStartTime(Other.GetMatchStartTime());
        this.SetMatchEndTime(Other.GetMatchEndTime());
        this.SetbPlayersKicked(Other.GetbPlayersKicked());
        this.SetbDSExitRequested(Other.GetbDSExitRequested());
        return __r;
    }
    const TMap<FECSEntity, FGameModePlayerScoreDataBase> GetPlayerScores() const property
    {
        const TMap<FECSEntity, FGameModePlayerScoreDataBase> __r;
        return __r;
    }
    TMap<FECSEntity, FGameModePlayerScoreDataBase> GetModify_PlayerScores() property
    {
        TMap<FECSEntity, FGameModePlayerScoreDataBase> __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetPlayerScores(const TMap<FECSEntity, FGameModePlayerScoreDataBase> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_PlayerScores = __Value;
        return;
    }
    const TArray<int> GetWinnerTeamIds() const property
    {
        const TArray<int> __r;
        return __r;
    }
    TArray<int> GetModify_WinnerTeamIds() property
    {
        TArray<int> __r;
        this.__MarkDirty(1);
        return __r;
    }
    void SetWinnerTeamIds(const TArray<int> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_WinnerTeamIds = __Value;
        return;
    }
    const TArray<int> GetLoserTeamIds() const property
    {
        const TArray<int> __r;
        return __r;
    }
    TArray<int> GetModify_LoserTeamIds() property
    {
        TArray<int> __r;
        this.__MarkDirty(2);
        return __r;
    }
    void SetLoserTeamIds(const TArray<int> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_LoserTeamIds = __Value;
        return;
    }
    const FFPTime GetFinishStartTime() const property
    {
        const FFPTime __r;
        return __r;
    }
    FFPTime GetModify_FinishStartTime() property
    {
        FFPTime __r;
        this.__MarkDirty(3);
        return __r;
    }
    void SetFinishStartTime(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(3);
        this.m_FinishStartTime = __Value;
        return;
    }
    const FFPTime GetMatchStartTime() const property
    {
        const FFPTime __r;
        return __r;
    }
    FFPTime GetModify_MatchStartTime() property
    {
        FFPTime __r;
        this.__MarkDirty(4);
        return __r;
    }
    void SetMatchStartTime(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(4);
        this.m_MatchStartTime = __Value;
        return;
    }
    const FFPTime GetMatchEndTime() const property
    {
        const FFPTime __r;
        return __r;
    }
    FFPTime GetModify_MatchEndTime() property
    {
        FFPTime __r;
        this.__MarkDirty(5);
        return __r;
    }
    void SetMatchEndTime(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(5);
        this.m_MatchEndTime = __Value;
        return;
    }
    bool GetbPlayersKicked() const property
    {
        return this.m_bPlayersKicked;
    }
    void SetbPlayersKicked(const bool __Value) property
    {
        if (!(this.m_bPlayersKicked) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(6);
        this.m_bPlayersKicked = __Value;
        return;
    }
    bool GetbDSExitRequested() const property
    {
        return this.m_bDSExitRequested;
    }
    void SetbDSExitRequested(const bool __Value) property
    {
        if (!(this.m_bDSExitRequested) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(7);
        this.m_bDSExitRequested = __Value;
        return;
    }
}

struct FCS_GameModeFirstTickTag : FECSSingleton
{
    FCS_GameModeFirstTickTag()
    {
        return;
    }
}

namespace ECSFunc_FCS_GameModeProfile
{
UFUNCTION()
bool HasGameModeProfile(const FECSWorldPtr &inout World)
{
    return ECSInternal::Has(World, ENTITY_ID_NULL, FCS_GameModeProfile);
}
FCS_GameModeProfile& AssignGameModeProfile(const FECSWorldPtr &inout World, const FCS_GameModeProfile &inout DefaultValue = FCS_GameModeProfile())
{
    UScriptStruct local_6 = FCS_GameModeProfile;
    FECSComponentPtr local_8;
    int local_10 = local_8 = ECSInternal::Assign(World, ENTITY_ID_NULL, local_6, FECSComponentPtr(DefaultValue));
    local_10.InternalSet(local_8);
    return local_10.GetComp();
}
UFUNCTION()
void AssignGameModeProfile_BP(const FECSWorldPtr &inout World, const FCS_GameModeProfile &inout DefaultValue = FCS_GameModeProfile())
{
    ECSFunc_FCS_GameModeProfile::AssignGameModeProfile(World, DefaultValue);
    return;
}
FCS_GameModeProfile& ModifyGameModeProfile(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_GameModeProfile;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Modify(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
FCS_GameModeProfile& ModifyOrAddGameModeProfile(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_GameModeProfile;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::ModifyOrAdd(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
const FCS_GameModeProfile& GetGameModeProfile(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_GameModeProfile;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Get(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
UFUNCTION()
FCS_GameModeProfile GetGameModeProfile_BP(const FECSWorldPtr &inout World, bool &out bValid)
{
    FCS_GameModeProfile __r;
    bValid = false;
    bValid = ECSFunc_FCS_GameModeProfile::GetGameModeProfile(World);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FCS_GameModeProfile GetDefaultedGameModeProfile(const FECSWorldPtr &inout World)
{
    int local_10 = 0;
    const FCS_GameModeProfile __r;
    FECSComponentPtr local_6 = ECSInternal::GetDefaulted(World, ENTITY_ID_NULL, FCS_GameModeProfile);
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
FCS_GameModeProfile GetDefaultedGameModeProfile_BP(const FECSWorldPtr &inout World)
{
    FCS_GameModeProfile __r;
    return __r;
}
UFUNCTION()
bool RemoveGameModeProfile(const FECSWorldPtr &inout World)
{
    return ECSInternal::Remove(World, ENTITY_ID_NULL, FCS_GameModeProfile);
}
}
void __MonitorGameModeProfileLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FCS_GameModeProfile, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorGameModeProfileActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FCS_GameModeProfile, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorGameModeProfileModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FCS_GameModeProfile, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FCS_GameMode_MatchData
{
UFUNCTION()
bool HasGameMode_MatchData(const FECSWorldPtr &inout World)
{
    return ECSInternal::Has(World, ENTITY_ID_NULL, FCS_GameMode_MatchData);
}
FCS_GameMode_MatchData& AssignGameMode_MatchData(const FECSWorldPtr &inout World, const FCS_GameMode_MatchData &inout DefaultValue = FCS_GameMode_MatchData())
{
    UScriptStruct local_6 = FCS_GameMode_MatchData;
    FECSComponentPtr local_8;
    int local_10 = local_8 = ECSInternal::Assign(World, ENTITY_ID_NULL, local_6, FECSComponentPtr(DefaultValue));
    local_10.InternalSet(local_8);
    return local_10.GetComp();
}
UFUNCTION()
void AssignGameMode_MatchData_BP(const FECSWorldPtr &inout World, const FCS_GameMode_MatchData &inout DefaultValue = FCS_GameMode_MatchData())
{
    ECSFunc_FCS_GameMode_MatchData::AssignGameMode_MatchData(World, DefaultValue);
    return;
}
FCS_GameMode_MatchData& ModifyGameMode_MatchData(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_GameMode_MatchData;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Modify(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
FCS_GameMode_MatchData& ModifyOrAddGameMode_MatchData(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_GameMode_MatchData;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::ModifyOrAdd(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
const FCS_GameMode_MatchData& GetGameMode_MatchData(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_GameMode_MatchData;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Get(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
UFUNCTION()
FCS_GameMode_MatchData GetGameMode_MatchData_BP(const FECSWorldPtr &inout World, bool &out bValid)
{
    bValid = false;
    const FCS_GameMode_MatchData& local_4 = ECSFunc_FCS_GameMode_MatchData::GetGameMode_MatchData(World);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FCS_GameMode_MatchData();
}
const FCS_GameMode_MatchData GetDefaultedGameMode_MatchData(const FECSWorldPtr &inout World)
{
    int local_10 = 0;
    const FCS_GameMode_MatchData __r;
    FECSComponentPtr local_6 = ECSInternal::GetDefaulted(World, ENTITY_ID_NULL, FCS_GameMode_MatchData);
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
FCS_GameMode_MatchData GetDefaultedGameMode_MatchData_BP(const FECSWorldPtr &inout World)
{
    return ECSFunc_FCS_GameMode_MatchData::GetDefaultedGameMode_MatchData(World);
}
UFUNCTION()
bool RemoveGameMode_MatchData(const FECSWorldPtr &inout World)
{
    return ECSInternal::Remove(World, ENTITY_ID_NULL, FCS_GameMode_MatchData);
}
}
void __MonitorGameMode_MatchDataLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FCS_GameMode_MatchData, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorGameMode_MatchDataActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FCS_GameMode_MatchData, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorGameMode_MatchDataModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FCS_GameMode_MatchData, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FCS_GameMode_ScoreData
{
UFUNCTION()
bool HasGameMode_ScoreData(const FECSWorldPtr &inout World)
{
    return ECSInternal::Has(World, ENTITY_ID_NULL, FCS_GameMode_ScoreData);
}
FCS_GameMode_ScoreData& AssignGameMode_ScoreData(const FECSWorldPtr &inout World, const FCS_GameMode_ScoreData &inout DefaultValue = FCS_GameMode_ScoreData())
{
    UScriptStruct local_6 = FCS_GameMode_ScoreData;
    FECSComponentPtr local_8;
    int local_10 = local_8 = ECSInternal::Assign(World, ENTITY_ID_NULL, local_6, FECSComponentPtr(DefaultValue));
    local_10.InternalSet(local_8);
    return local_10.GetComp();
}
UFUNCTION()
void AssignGameMode_ScoreData_BP(const FECSWorldPtr &inout World, const FCS_GameMode_ScoreData &inout DefaultValue = FCS_GameMode_ScoreData())
{
    ECSFunc_FCS_GameMode_ScoreData::AssignGameMode_ScoreData(World, DefaultValue);
    return;
}
FCS_GameMode_ScoreData& ModifyGameMode_ScoreData(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_GameMode_ScoreData;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Modify(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
FCS_GameMode_ScoreData& ModifyOrAddGameMode_ScoreData(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_GameMode_ScoreData;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::ModifyOrAdd(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
const FCS_GameMode_ScoreData& GetGameMode_ScoreData(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_GameMode_ScoreData;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Get(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
UFUNCTION()
FCS_GameMode_ScoreData GetGameMode_ScoreData_BP(const FECSWorldPtr &inout World, bool &out bValid)
{
    bValid = false;
    const FCS_GameMode_ScoreData& local_4 = ECSFunc_FCS_GameMode_ScoreData::GetGameMode_ScoreData(World);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FCS_GameMode_ScoreData();
}
const FCS_GameMode_ScoreData GetDefaultedGameMode_ScoreData(const FECSWorldPtr &inout World)
{
    int local_10 = 0;
    const FCS_GameMode_ScoreData __r;
    FECSComponentPtr local_6 = ECSInternal::GetDefaulted(World, ENTITY_ID_NULL, FCS_GameMode_ScoreData);
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
FCS_GameMode_ScoreData GetDefaultedGameMode_ScoreData_BP(const FECSWorldPtr &inout World)
{
    return ECSFunc_FCS_GameMode_ScoreData::GetDefaultedGameMode_ScoreData(World);
}
UFUNCTION()
bool RemoveGameMode_ScoreData(const FECSWorldPtr &inout World)
{
    return ECSInternal::Remove(World, ENTITY_ID_NULL, FCS_GameMode_ScoreData);
}
}
void __MonitorGameMode_ScoreDataLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FCS_GameMode_ScoreData, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorGameMode_ScoreDataActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FCS_GameMode_ScoreData, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorGameMode_ScoreDataModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FCS_GameMode_ScoreData, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FCS_GameModeFirstTickTag
{
UFUNCTION()
bool HasGameModeFirstTickTag(const FECSWorldPtr &inout World)
{
    return ECSInternal::Has(World, ENTITY_ID_NULL, FCS_GameModeFirstTickTag);
}
FCS_GameModeFirstTickTag& AssignGameModeFirstTickTag(const FECSWorldPtr &inout World, const FCS_GameModeFirstTickTag &inout DefaultValue = FCS_GameModeFirstTickTag())
{
    UScriptStruct local_6 = FCS_GameModeFirstTickTag;
    FECSComponentPtr local_8;
    int local_10 = local_8 = ECSInternal::Assign(World, ENTITY_ID_NULL, local_6, FECSComponentPtr(DefaultValue));
    local_10.InternalSet(local_8);
    return local_10.GetComp();
}
UFUNCTION()
void AssignGameModeFirstTickTag_BP(const FECSWorldPtr &inout World, const FCS_GameModeFirstTickTag &inout DefaultValue = FCS_GameModeFirstTickTag())
{
    ECSFunc_FCS_GameModeFirstTickTag::AssignGameModeFirstTickTag(World, DefaultValue);
    return;
}
FCS_GameModeFirstTickTag& ModifyGameModeFirstTickTag(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_GameModeFirstTickTag;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Modify(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
FCS_GameModeFirstTickTag& ModifyOrAddGameModeFirstTickTag(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_GameModeFirstTickTag;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::ModifyOrAdd(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
const FCS_GameModeFirstTickTag& GetGameModeFirstTickTag(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_GameModeFirstTickTag;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Get(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
UFUNCTION()
FCS_GameModeFirstTickTag GetGameModeFirstTickTag_BP(const FECSWorldPtr &inout World, bool &out bValid)
{
    bValid = false;
    const FCS_GameModeFirstTickTag& local_4 = ECSFunc_FCS_GameModeFirstTickTag::GetGameModeFirstTickTag(World);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FCS_GameModeFirstTickTag();
}
const FCS_GameModeFirstTickTag GetDefaultedGameModeFirstTickTag(const FECSWorldPtr &inout World)
{
    int local_10 = 0;
    const FCS_GameModeFirstTickTag __r;
    FECSComponentPtr local_6 = ECSInternal::GetDefaulted(World, ENTITY_ID_NULL, FCS_GameModeFirstTickTag);
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
FCS_GameModeFirstTickTag GetDefaultedGameModeFirstTickTag_BP(const FECSWorldPtr &inout World)
{
    return ECSFunc_FCS_GameModeFirstTickTag::GetDefaultedGameModeFirstTickTag(World);
}
UFUNCTION()
bool RemoveGameModeFirstTickTag(const FECSWorldPtr &inout World)
{
    return ECSInternal::Remove(World, ENTITY_ID_NULL, FCS_GameModeFirstTickTag);
}
}
void __MonitorGameModeFirstTickTagLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FCS_GameModeFirstTickTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorGameModeFirstTickTagActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FCS_GameModeFirstTickTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorGameModeFirstTickTagModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FCS_GameModeFirstTickTag, bFixedFrame, Details);
    return;
}
namespace AutoDelta
{
FSubDirtyFlags8 GetDirtyFlags(FGameModePlayerMatchDataBase &inout Data)
{
    FSubDirtyFlags8 __r;
    return __r;
}
void ClearDirtyFlags(FGameModePlayerMatchDataBase &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FGameModePlayerMatchDataBase
{
int __IndexOf_UID()
{
    return 0;
}
int __IndexOf_TeamID()
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
FRootDirtyFlags8 GetDirtyFlags(FCS_GameMode_MatchData &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FCS_GameMode_MatchData &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FCS_GameMode_MatchData &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FCS_GameMode_MatchData
{
int __IndexOf_PlayerMatchDatas()
{
    return 0;
}
int __IndexOf_TeamPlayerCounts()
{
    return 1;
}
int __IndexOf_SelectRoleEndTime()
{
    return 2;
}
int __IndexOf_SelectRoleTotalTime()
{
    return 3;
}
}
namespace AutoDelta
{
FSubDirtyFlags8 GetDirtyFlags(FGameModePlayerScoreDataBase &inout Data)
{
    FSubDirtyFlags8 __r;
    return __r;
}
void ClearDirtyFlags(FGameModePlayerScoreDataBase &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FGameModePlayerScoreDataBase
{
int __IndexOf_Kills()
{
    return 0;
}
int __IndexOf_Deaths()
{
    return 1;
}
int __IndexOf_Assists()
{
    return 2;
}
int __IndexOf_DamageDealt()
{
    return 3;
}
int __IndexOf_DamageTaken()
{
    return 4;
}
}
namespace AutoDelta
{
FRootDirtyFlags16 GetDirtyFlags(FCS_GameMode_ScoreData &inout Data)
{
    FRootDirtyFlags16 __r;
    return __r;
}
void InitDirtyFlags(FCS_GameMode_ScoreData &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FCS_GameMode_ScoreData &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FCS_GameMode_ScoreData
{
int __IndexOf_PlayerScores()
{
    return 0;
}
int __IndexOf_WinnerTeamIds()
{
    return 1;
}
int __IndexOf_LoserTeamIds()
{
    return 2;
}
int __IndexOf_FinishStartTime()
{
    return 3;
}
int __IndexOf_MatchStartTime()
{
    return 4;
}
int __IndexOf_MatchEndTime()
{
    return 5;
}
int __IndexOf_bPlayersKicked()
{
    return 6;
}
int __IndexOf_bDSExitRequested()
{
    return 7;
}
}
