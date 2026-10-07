
enum EPVPGameRuleType
{
    None,
    Brawl,
    TDM,
}

enum EPVPTDMRoundStage
{
    RoundPrep,
    RoundCombat,
    RoundIntermission,
}

namespace __INTENRAL_FCS_PVP_TDM_ScoreData_NS
{
    const TECSComponentDerivedPtr<FCS_PVP_TDM_ScoreData> DerivedPtr = TECSComponentDerivedPtr<FCS_PVP_TDM_ScoreData>();
    const FCS_PVP_TDM_ScoreData DefaultValue = FCS_PVP_TDM_ScoreData();
}
namespace __INTENRAL_FCS_PVP_TDM_RoundData_NS
{
    const TECSComponentDerivedPtr<FCS_PVP_TDM_RoundData> DerivedPtr = TECSComponentDerivedPtr<FCS_PVP_TDM_RoundData>();
    const FCS_PVP_TDM_RoundData DefaultValue = FCS_PVP_TDM_RoundData();
}
namespace __INTENRAL_FC_PVPPendingRespawn_NS
{
    const TECSComponentDerivedPtr<FC_PVPPendingRespawn> DerivedPtr = TECSComponentDerivedPtr<FC_PVPPendingRespawn>();
    const FC_PVPPendingRespawn DefaultValue = FC_PVPPendingRespawn();

}
struct FPVP_TDM_PlayerStat
{
    FSubDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    int m_Kills;
    UPROPERTY()
    int m_Deaths;
    UPROPERTY()
    int m_Assists;
    UPROPERTY()
    int m_TeamId;
    UPROPERTY()
    float32 m_DamageDealt;
    UPROPERTY()
    float32 m_DamageTaken;

    FPVP_TDM_PlayerStat()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FPVP_TDM_PlayerStat(const FPVP_TDM_PlayerStat &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FPVP_TDM_PlayerStat opAssign(const FPVP_TDM_PlayerStat &inout Other)
    {
        FPVP_TDM_PlayerStat __r;
        this.SetKills(Other.GetKills());
        this.SetDeaths(Other.GetDeaths());
        this.SetAssists(Other.GetAssists());
        this.SetTeamId(Other.GetTeamId());
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
        this.__MarkDirty(3);
        this.m_TeamId = __Value;
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
        this.__MarkDirty(4);
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
        this.__MarkDirty(5);
        this.m_DamageTaken = __Value;
        return;
    }
}

struct FCS_PVP_TDM_ScoreData : FECSSingleton
{
    FRootDirtyFlags16 __DirtyFlags;
    UPROPERTY()
    int m_Team1Kills;
    UPROPERTY()
    int m_Team2Kills;
    UPROPERTY()
    int m_WinnerTeamId;
    UPROPERTY()
    int m_KillScoreLimit;
    UPROPERTY()
    bool m_bInPrepStage;
    UPROPERTY()
    FFPTime m_PrepEndTime;
    UPROPERTY()
    FFPTime m_MatchStartTime;
    UPROPERTY()
    FFPTime m_MatchEndTime;
    UPROPERTY()
    FFPTime m_FinishStartTime;
    UPROPERTY()
    TMap<FECSEntity, FPVP_TDM_PlayerStat> m_PlayerStatMap;

    FCS_PVP_TDM_ScoreData()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FCS_PVP_TDM_ScoreData(const FCS_PVP_TDM_ScoreData &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FCS_PVP_TDM_ScoreData opAssign(const FCS_PVP_TDM_ScoreData &inout Other)
    {
        FCS_PVP_TDM_ScoreData __r;
        this.SetTeam1Kills(Other.GetTeam1Kills());
        this.SetTeam2Kills(Other.GetTeam2Kills());
        this.SetWinnerTeamId(Other.GetWinnerTeamId());
        this.SetKillScoreLimit(Other.GetKillScoreLimit());
        this.SetbInPrepStage(Other.GetbInPrepStage());
        this.SetPrepEndTime(Other.GetPrepEndTime());
        this.SetMatchStartTime(Other.GetMatchStartTime());
        this.SetMatchEndTime(Other.GetMatchEndTime());
        this.SetFinishStartTime(Other.GetFinishStartTime());
        this.SetPlayerStatMap(Other.GetPlayerStatMap());
        return __r;
    }
    int GetTeam1Kills() const property
    {
        return this.m_Team1Kills;
    }
    void SetTeam1Kills(const int __Value) property
    {
        if (this.m_Team1Kills == __Value)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_Team1Kills = __Value;
        return;
    }
    int GetTeam2Kills() const property
    {
        return this.m_Team2Kills;
    }
    void SetTeam2Kills(const int __Value) property
    {
        if (this.m_Team2Kills == __Value)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_Team2Kills = __Value;
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
        this.__MarkDirty(2);
        this.m_WinnerTeamId = __Value;
        return;
    }
    int GetKillScoreLimit() const property
    {
        return this.m_KillScoreLimit;
    }
    void SetKillScoreLimit(const int __Value) property
    {
        if (this.m_KillScoreLimit == __Value)
        {
            return;
        }
        this.__MarkDirty(3);
        this.m_KillScoreLimit = __Value;
        return;
    }
    bool GetbInPrepStage() const property
    {
        return this.m_bInPrepStage;
    }
    void SetbInPrepStage(const bool __Value) property
    {
        if (!(this.m_bInPrepStage) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(4);
        this.m_bInPrepStage = __Value;
        return;
    }
    const FFPTime GetPrepEndTime() const property
    {
        const FFPTime __r;
        return __r;
    }
    FFPTime GetModify_PrepEndTime() property
    {
        FFPTime __r;
        this.__MarkDirty(5);
        return __r;
    }
    void SetPrepEndTime(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(5);
        this.m_PrepEndTime = __Value;
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
        this.__MarkDirty(6);
        return __r;
    }
    void SetMatchStartTime(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(6);
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
        this.__MarkDirty(7);
        return __r;
    }
    void SetMatchEndTime(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(7);
        this.m_MatchEndTime = __Value;
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
        this.__MarkDirty(8);
        return __r;
    }
    void SetFinishStartTime(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(8);
        this.m_FinishStartTime = __Value;
        return;
    }
    const TMap<FECSEntity, FPVP_TDM_PlayerStat> GetPlayerStatMap() const property
    {
        const TMap<FECSEntity, FPVP_TDM_PlayerStat> __r;
        return __r;
    }
    TMap<FECSEntity, FPVP_TDM_PlayerStat> GetModify_PlayerStatMap() property
    {
        TMap<FECSEntity, FPVP_TDM_PlayerStat> __r;
        this.__MarkDirty(9);
        return __r;
    }
    void SetPlayerStatMap(const TMap<FECSEntity, FPVP_TDM_PlayerStat> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(9);
        this.m_PlayerStatMap = __Value;
        return;
    }
}

struct FCS_PVP_TDM_RoundData : FECSSingleton
{
    FRootDirtyFlags16 __DirtyFlags;
    UPROPERTY()
    int m_CurrentRound;
    UPROPERTY()
    int m_Team1RoundWins;
    UPROPERTY()
    int m_Team2RoundWins;
    UPROPERTY()
    int m_RoundsToWin;
    UPROPERTY()
    EPVPTDMRoundStage m_RoundStage;
    UPROPERTY()
    FFPTime m_RoundPrepEndTime;
    UPROPERTY()
    FFPTime m_RoundCombatEndTime;
    UPROPERTY()
    FFPTime m_RoundIntermissionEndTime;
    UPROPERTY()
    int m_RoundWinnerTeamId;
    UPROPERTY()
    int m_MatchWinnerTeamId;
    UPROPERTY()
    FFPTime m_FinishStartTime;
    UPROPERTY()
    TMap<FECSEntity, FPVP_TDM_PlayerStat> m_PlayerStatMap;

    FCS_PVP_TDM_RoundData()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FCS_PVP_TDM_RoundData(const FCS_PVP_TDM_RoundData &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FCS_PVP_TDM_RoundData opAssign(const FCS_PVP_TDM_RoundData &inout Other)
    {
        FCS_PVP_TDM_RoundData __r;
        this.SetCurrentRound(Other.GetCurrentRound());
        this.SetTeam1RoundWins(Other.GetTeam1RoundWins());
        this.SetTeam2RoundWins(Other.GetTeam2RoundWins());
        this.SetRoundsToWin(Other.GetRoundsToWin());
        this.SetRoundStage(Other.GetRoundStage());
        this.SetRoundPrepEndTime(Other.GetRoundPrepEndTime());
        this.SetRoundCombatEndTime(Other.GetRoundCombatEndTime());
        this.SetRoundIntermissionEndTime(Other.GetRoundIntermissionEndTime());
        this.SetRoundWinnerTeamId(Other.GetRoundWinnerTeamId());
        this.SetMatchWinnerTeamId(Other.GetMatchWinnerTeamId());
        this.SetFinishStartTime(Other.GetFinishStartTime());
        this.SetPlayerStatMap(Other.GetPlayerStatMap());
        return __r;
    }
    int GetCurrentRound() const property
    {
        return this.m_CurrentRound;
    }
    void SetCurrentRound(const int __Value) property
    {
        if (this.m_CurrentRound == __Value)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_CurrentRound = __Value;
        return;
    }
    int GetTeam1RoundWins() const property
    {
        return this.m_Team1RoundWins;
    }
    void SetTeam1RoundWins(const int __Value) property
    {
        if (this.m_Team1RoundWins == __Value)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_Team1RoundWins = __Value;
        return;
    }
    int GetTeam2RoundWins() const property
    {
        return this.m_Team2RoundWins;
    }
    void SetTeam2RoundWins(const int __Value) property
    {
        if (this.m_Team2RoundWins == __Value)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_Team2RoundWins = __Value;
        return;
    }
    int GetRoundsToWin() const property
    {
        return this.m_RoundsToWin;
    }
    void SetRoundsToWin(const int __Value) property
    {
        if (this.m_RoundsToWin == __Value)
        {
            return;
        }
        this.__MarkDirty(3);
        this.m_RoundsToWin = __Value;
        return;
    }
    EPVPTDMRoundStage GetRoundStage() const property
    {
        return this.m_RoundStage;
    }
    void SetRoundStage(const EPVPTDMRoundStage __Value) property
    {
        if (int(this.m_RoundStage) == int(__Value))
        {
            return;
        }
        this.__MarkDirty(4);
        this.m_RoundStage = __Value;
        return;
    }
    const FFPTime GetRoundPrepEndTime() const property
    {
        const FFPTime __r;
        return __r;
    }
    FFPTime GetModify_RoundPrepEndTime() property
    {
        FFPTime __r;
        this.__MarkDirty(5);
        return __r;
    }
    void SetRoundPrepEndTime(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(5);
        this.m_RoundPrepEndTime = __Value;
        return;
    }
    const FFPTime GetRoundCombatEndTime() const property
    {
        const FFPTime __r;
        return __r;
    }
    FFPTime GetModify_RoundCombatEndTime() property
    {
        FFPTime __r;
        this.__MarkDirty(6);
        return __r;
    }
    void SetRoundCombatEndTime(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(6);
        this.m_RoundCombatEndTime = __Value;
        return;
    }
    const FFPTime GetRoundIntermissionEndTime() const property
    {
        const FFPTime __r;
        return __r;
    }
    FFPTime GetModify_RoundIntermissionEndTime() property
    {
        FFPTime __r;
        this.__MarkDirty(7);
        return __r;
    }
    void SetRoundIntermissionEndTime(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(7);
        this.m_RoundIntermissionEndTime = __Value;
        return;
    }
    int GetRoundWinnerTeamId() const property
    {
        return this.m_RoundWinnerTeamId;
    }
    void SetRoundWinnerTeamId(const int __Value) property
    {
        if (this.m_RoundWinnerTeamId == __Value)
        {
            return;
        }
        this.__MarkDirty(8);
        this.m_RoundWinnerTeamId = __Value;
        return;
    }
    int GetMatchWinnerTeamId() const property
    {
        return this.m_MatchWinnerTeamId;
    }
    void SetMatchWinnerTeamId(const int __Value) property
    {
        if (this.m_MatchWinnerTeamId == __Value)
        {
            return;
        }
        this.__MarkDirty(9);
        this.m_MatchWinnerTeamId = __Value;
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
        this.__MarkDirty(10);
        return __r;
    }
    void SetFinishStartTime(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(10);
        this.m_FinishStartTime = __Value;
        return;
    }
    const TMap<FECSEntity, FPVP_TDM_PlayerStat> GetPlayerStatMap() const property
    {
        const TMap<FECSEntity, FPVP_TDM_PlayerStat> __r;
        return __r;
    }
    TMap<FECSEntity, FPVP_TDM_PlayerStat> GetModify_PlayerStatMap() property
    {
        TMap<FECSEntity, FPVP_TDM_PlayerStat> __r;
        this.__MarkDirty(11);
        return __r;
    }
    void SetPlayerStatMap(const TMap<FECSEntity, FPVP_TDM_PlayerStat> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(11);
        this.m_PlayerStatMap = __Value;
        return;
    }
}

struct FC_PVPPendingRespawn : FECSComponent
{
    UPROPERTY()
    FFPTime RespawnTime;

    FC_PVPPendingRespawn()
    {
        return;
    }
}

namespace ECSFunc_FCS_PVP_TDM_ScoreData
{
UFUNCTION()
bool HasPVP_TDM_ScoreData(const FECSWorldPtr &inout World)
{
    return ECSInternal::Has(World, ENTITY_ID_NULL, FCS_PVP_TDM_ScoreData);
}
FCS_PVP_TDM_ScoreData& AssignPVP_TDM_ScoreData(const FECSWorldPtr &inout World, const FCS_PVP_TDM_ScoreData &inout DefaultValue = FCS_PVP_TDM_ScoreData())
{
    UScriptStruct local_6 = FCS_PVP_TDM_ScoreData;
    FECSComponentPtr local_8;
    int local_10 = local_8 = ECSInternal::Assign(World, ENTITY_ID_NULL, local_6, FECSComponentPtr(DefaultValue));
    local_10.InternalSet(local_8);
    return local_10.GetComp();
}
UFUNCTION()
void AssignPVP_TDM_ScoreData_BP(const FECSWorldPtr &inout World, const FCS_PVP_TDM_ScoreData &inout DefaultValue = FCS_PVP_TDM_ScoreData())
{
    ECSFunc_FCS_PVP_TDM_ScoreData::AssignPVP_TDM_ScoreData(World, DefaultValue);
    return;
}
FCS_PVP_TDM_ScoreData& ModifyPVP_TDM_ScoreData(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_PVP_TDM_ScoreData;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Modify(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
FCS_PVP_TDM_ScoreData& ModifyOrAddPVP_TDM_ScoreData(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_PVP_TDM_ScoreData;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::ModifyOrAdd(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
const FCS_PVP_TDM_ScoreData& GetPVP_TDM_ScoreData(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_PVP_TDM_ScoreData;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Get(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
UFUNCTION()
FCS_PVP_TDM_ScoreData GetPVP_TDM_ScoreData_BP(const FECSWorldPtr &inout World, bool &out bValid)
{
    bValid = false;
    const FCS_PVP_TDM_ScoreData& local_4 = ECSFunc_FCS_PVP_TDM_ScoreData::GetPVP_TDM_ScoreData(World);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FCS_PVP_TDM_ScoreData();
}
const FCS_PVP_TDM_ScoreData GetDefaultedPVP_TDM_ScoreData(const FECSWorldPtr &inout World)
{
    int local_10 = 0;
    const FCS_PVP_TDM_ScoreData __r;
    FECSComponentPtr local_6 = ECSInternal::GetDefaulted(World, ENTITY_ID_NULL, FCS_PVP_TDM_ScoreData);
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
FCS_PVP_TDM_ScoreData GetDefaultedPVP_TDM_ScoreData_BP(const FECSWorldPtr &inout World)
{
    return ECSFunc_FCS_PVP_TDM_ScoreData::GetDefaultedPVP_TDM_ScoreData(World);
}
UFUNCTION()
bool RemovePVP_TDM_ScoreData(const FECSWorldPtr &inout World)
{
    return ECSInternal::Remove(World, ENTITY_ID_NULL, FCS_PVP_TDM_ScoreData);
}
}
void __MonitorPVP_TDM_ScoreDataLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FCS_PVP_TDM_ScoreData, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPVP_TDM_ScoreDataActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FCS_PVP_TDM_ScoreData, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPVP_TDM_ScoreDataModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FCS_PVP_TDM_ScoreData, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FCS_PVP_TDM_RoundData
{
UFUNCTION()
bool HasPVP_TDM_RoundData(const FECSWorldPtr &inout World)
{
    return ECSInternal::Has(World, ENTITY_ID_NULL, FCS_PVP_TDM_RoundData);
}
FCS_PVP_TDM_RoundData& AssignPVP_TDM_RoundData(const FECSWorldPtr &inout World, const FCS_PVP_TDM_RoundData &inout DefaultValue = FCS_PVP_TDM_RoundData())
{
    UScriptStruct local_6 = FCS_PVP_TDM_RoundData;
    FECSComponentPtr local_8;
    int local_10 = local_8 = ECSInternal::Assign(World, ENTITY_ID_NULL, local_6, FECSComponentPtr(DefaultValue));
    local_10.InternalSet(local_8);
    return local_10.GetComp();
}
UFUNCTION()
void AssignPVP_TDM_RoundData_BP(const FECSWorldPtr &inout World, const FCS_PVP_TDM_RoundData &inout DefaultValue = FCS_PVP_TDM_RoundData())
{
    ECSFunc_FCS_PVP_TDM_RoundData::AssignPVP_TDM_RoundData(World, DefaultValue);
    return;
}
FCS_PVP_TDM_RoundData& ModifyPVP_TDM_RoundData(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_PVP_TDM_RoundData;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Modify(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
FCS_PVP_TDM_RoundData& ModifyOrAddPVP_TDM_RoundData(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_PVP_TDM_RoundData;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::ModifyOrAdd(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
const FCS_PVP_TDM_RoundData& GetPVP_TDM_RoundData(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_PVP_TDM_RoundData;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Get(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
UFUNCTION()
FCS_PVP_TDM_RoundData GetPVP_TDM_RoundData_BP(const FECSWorldPtr &inout World, bool &out bValid)
{
    bValid = false;
    const FCS_PVP_TDM_RoundData& local_4 = ECSFunc_FCS_PVP_TDM_RoundData::GetPVP_TDM_RoundData(World);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FCS_PVP_TDM_RoundData();
}
const FCS_PVP_TDM_RoundData GetDefaultedPVP_TDM_RoundData(const FECSWorldPtr &inout World)
{
    int local_10 = 0;
    const FCS_PVP_TDM_RoundData __r;
    FECSComponentPtr local_6 = ECSInternal::GetDefaulted(World, ENTITY_ID_NULL, FCS_PVP_TDM_RoundData);
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
FCS_PVP_TDM_RoundData GetDefaultedPVP_TDM_RoundData_BP(const FECSWorldPtr &inout World)
{
    return ECSFunc_FCS_PVP_TDM_RoundData::GetDefaultedPVP_TDM_RoundData(World);
}
UFUNCTION()
bool RemovePVP_TDM_RoundData(const FECSWorldPtr &inout World)
{
    return ECSInternal::Remove(World, ENTITY_ID_NULL, FCS_PVP_TDM_RoundData);
}
}
void __MonitorPVP_TDM_RoundDataLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FCS_PVP_TDM_RoundData, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPVP_TDM_RoundDataActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FCS_PVP_TDM_RoundData, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPVP_TDM_RoundDataModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FCS_PVP_TDM_RoundData, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_PVPPendingRespawn
{
UFUNCTION()
bool HasPVPPendingRespawn(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_PVPPendingRespawn);
}
FC_PVPPendingRespawn& AssignPVPPendingRespawn(const FECSEntity &inout Entity, const FC_PVPPendingRespawn &inout DefaultValue = FC_PVPPendingRespawn())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_PVPPendingRespawn, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignPVPPendingRespawn_BP(const FECSEntity &inout Entity, const FC_PVPPendingRespawn &inout DefaultValue = FC_PVPPendingRespawn())
{
    ECSFunc_FC_PVPPendingRespawn::AssignPVPPendingRespawn(Entity, DefaultValue);
    return;
}
FC_PVPPendingRespawn& ModifyPVPPendingRespawn(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_PVPPendingRespawn));
    return local_12.GetComp();
}
FC_PVPPendingRespawn& ModifyOrAddPVPPendingRespawn(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_PVPPendingRespawn));
    return local_12.GetComp();
}
const FC_PVPPendingRespawn& GetPVPPendingRespawn(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_PVPPendingRespawn));
    return local_12.GetComp();
}
UFUNCTION()
FC_PVPPendingRespawn GetPVPPendingRespawn_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_PVPPendingRespawn __r;
    bValid = false;
    bValid = ECSFunc_FC_PVPPendingRespawn::GetPVPPendingRespawn(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_PVPPendingRespawn GetDefaultedPVPPendingRespawn(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_PVPPendingRespawn __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_PVPPendingRespawn);
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
FC_PVPPendingRespawn GetDefaultedPVPPendingRespawn_BP(const FECSEntity &inout Entity)
{
    FC_PVPPendingRespawn __r;
    return __r;
}
UFUNCTION()
bool RemovePVPPendingRespawn(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_PVPPendingRespawn);
}
}
FECSMonitorRuntimeView __GetMonitorPVPPendingRespawnOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_PVPPendingRespawn, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPVPPendingRespawnOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_PVPPendingRespawn, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPVPPendingRespawnOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_PVPPendingRespawn, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPVPPendingRespawnOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_PVPPendingRespawn, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPVPPendingRespawnOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_PVPPendingRespawn, bFixedFrame, bMustHandleAll);
}
void __MonitorPVPPendingRespawnLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_PVPPendingRespawn, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPVPPendingRespawnActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_PVPPendingRespawn, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPVPPendingRespawnModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_PVPPendingRespawn, bFixedFrame, Details);
    return;
}
namespace AutoDelta
{
FSubDirtyFlags8 GetDirtyFlags(FPVP_TDM_PlayerStat &inout Data)
{
    FSubDirtyFlags8 __r;
    return __r;
}
void ClearDirtyFlags(FPVP_TDM_PlayerStat &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FPVP_TDM_PlayerStat
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
int __IndexOf_TeamId()
{
    return 3;
}
int __IndexOf_DamageDealt()
{
    return 4;
}
int __IndexOf_DamageTaken()
{
    return 5;
}
}
namespace AutoDelta
{
FRootDirtyFlags16 GetDirtyFlags(FCS_PVP_TDM_ScoreData &inout Data)
{
    FRootDirtyFlags16 __r;
    return __r;
}
void InitDirtyFlags(FCS_PVP_TDM_ScoreData &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FCS_PVP_TDM_ScoreData &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FCS_PVP_TDM_ScoreData
{
int __IndexOf_Team1Kills()
{
    return 0;
}
int __IndexOf_Team2Kills()
{
    return 1;
}
int __IndexOf_WinnerTeamId()
{
    return 2;
}
int __IndexOf_KillScoreLimit()
{
    return 3;
}
int __IndexOf_bInPrepStage()
{
    return 4;
}
int __IndexOf_PrepEndTime()
{
    return 5;
}
int __IndexOf_MatchStartTime()
{
    return 6;
}
int __IndexOf_MatchEndTime()
{
    return 7;
}
int __IndexOf_FinishStartTime()
{
    return 8;
}
int __IndexOf_PlayerStatMap()
{
    return 9;
}
}
namespace AutoDelta
{
FRootDirtyFlags16 GetDirtyFlags(FCS_PVP_TDM_RoundData &inout Data)
{
    FRootDirtyFlags16 __r;
    return __r;
}
void InitDirtyFlags(FCS_PVP_TDM_RoundData &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FCS_PVP_TDM_RoundData &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FCS_PVP_TDM_RoundData
{
int __IndexOf_CurrentRound()
{
    return 0;
}
int __IndexOf_Team1RoundWins()
{
    return 1;
}
int __IndexOf_Team2RoundWins()
{
    return 2;
}
int __IndexOf_RoundsToWin()
{
    return 3;
}
int __IndexOf_RoundStage()
{
    return 4;
}
int __IndexOf_RoundPrepEndTime()
{
    return 5;
}
int __IndexOf_RoundCombatEndTime()
{
    return 6;
}
int __IndexOf_RoundIntermissionEndTime()
{
    return 7;
}
int __IndexOf_RoundWinnerTeamId()
{
    return 8;
}
int __IndexOf_MatchWinnerTeamId()
{
    return 9;
}
int __IndexOf_FinishStartTime()
{
    return 10;
}
int __IndexOf_PlayerStatMap()
{
    return 11;
}
}
