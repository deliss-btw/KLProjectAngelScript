
namespace __INTENRAL_FCS_PVP_SessionData_NS
{
    const TECSComponentDerivedPtr<FCS_PVP_SessionData> DerivedPtr = TECSComponentDerivedPtr<FCS_PVP_SessionData>();
    const FCS_PVP_SessionData DefaultValue = FCS_PVP_SessionData();

}
struct FPVP_PlayerSessionExtra
{
    UPROPERTY()
    bool m_bIsBot = false;
    UPROPERTY()
    bool m_bWantsBackToRoom = false;


    bool GetbIsBot() const property
    {
        return this.m_bIsBot;
    }
    void SetbIsBot(const bool __Value) property
    {
        this.m_bIsBot = __Value;
        return;
    }
    bool GetbWantsBackToRoom() const property
    {
        return this.m_bWantsBackToRoom;
    }
    void SetbWantsBackToRoom(const bool __Value) property
    {
        this.m_bWantsBackToRoom = __Value;
        return;
    }
}

struct FCS_PVP_SessionData : FECSSingleton
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    TMap<uint, FPVP_PlayerSessionExtra> m_PlayerExtras;
    UPROPERTY()
    uint m_HostPlayerUID;
    UPROPERTY()
    uint m_MatchRoomID;
    UPROPERTY()
    bool m_bHostSayGO;
    UPROPERTY()
    EPVPGameRuleType m_SelectedGameRuleType;
    UPROPERTY()
    uint m_NextBotUID;
    UPROPERTY()
    TMap<uint, FECSEntity> m_BotPlayerEntities;

    FCS_PVP_SessionData()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FCS_PVP_SessionData(const FCS_PVP_SessionData &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FCS_PVP_SessionData opAssign(const FCS_PVP_SessionData &inout Other)
    {
        FCS_PVP_SessionData __r;
        this.SetPlayerExtras(Other.GetPlayerExtras());
        this.SetHostPlayerUID(Other.GetHostPlayerUID());
        this.SetMatchRoomID(Other.GetMatchRoomID());
        this.SetbHostSayGO(Other.GetbHostSayGO());
        this.SetSelectedGameRuleType(Other.GetSelectedGameRuleType());
        this.SetNextBotUID(Other.GetNextBotUID());
        this.SetBotPlayerEntities(Other.GetBotPlayerEntities());
        return __r;
    }
    void AddNewPlayer(const uint PlayerUID, FCS_GameMode_MatchData &inout MatchData)
    {
        if (MatchData.GetPlayerMatchDatas().Contains(PlayerUID))
        {
            return;
        }
        if (MatchData.GetTeamPlayerCounts().Num() == 0)
        {
            this.SetHostPlayerUID(PlayerUID);
        }
        else
        {
            bool local_4;
            local_4 = true;
            for (auto local_17 : MatchData.GetTeamPlayerCounts())
            {
                if (local_17 > 0)
                {
                    local_4 = false;
                    break;
                }
            }
            if (local_4)
            {
                this.SetHostPlayerUID(PlayerUID);
            }
        }
        int local_19 = MatchData.FindBestTeamForAssign();
        if (!(MatchData.GetTeamPlayerCounts().IsValidIndex(local_19)))
        {
            XWarning(ELog(22), FString().Append("AddNewPlayer: TeamID=").Append(local_19).Append(" out of range, TeamPlayerCounts.Num=").Append(MatchData.GetTeamPlayerCounts().Num()));
            return;
        }
        FGameModePlayerMatchDataBase local_34;
        local_34.SetUID(PlayerUID);
        local_34.SetTeamID(uint8(local_19));
        local_34.SetPlayerInTeamIndex(MatchData.GetTeamPlayerCount(uint8(local_19)));
        MatchData.GetModify_PlayerMatchDatas().Add(PlayerUID, local_34);
        FPVP_PlayerSessionExtra local_36;
        this.GetModify_PlayerExtras().Add(PlayerUID, local_36);
        int local_3 = MatchData.GetModify_TeamPlayerCounts()[local_19] + 1;
        return;
    }
    uint AddBotToTeam(const uint8 TeamID, FCS_GameMode_MatchData &inout MatchData, const int MaxPlayersPerTeam)
    {
        int local_4;
        if (!(MatchData.GetTeamPlayerCounts().IsValidIndex(TeamID)))
        {
            return 0;
        }
        if (MatchData.GetTeamPlayerCount(uint8(TeamID)) >= MaxPlayersPerTeam)
        {
            return 0;
        }
        local_4 = this.GetNextBotUID();
        this.SetNextBotUID((this.GetNextBotUID() + 1));
        FGameModePlayerMatchDataBase local_14;
        local_14.SetUID(local_4);
        local_14.SetTeamID(uint8(TeamID));
        local_14.SetPlayerInTeamIndex(MatchData.GetTeamPlayerCount(uint8(TeamID)));
        MatchData.GetModify_PlayerMatchDatas().Add(local_4, local_14);
        FPVP_PlayerSessionExtra local_16;
        local_16.SetbIsBot(true);
        this.GetModify_PlayerExtras().Add(local_4, local_16);
        int local_1 = MatchData.GetModify_TeamPlayerCounts()[TeamID] + 1;
        return local_4;
    }
    void RemoveBotFromTeam(const uint8 TeamID, FCS_GameMode_MatchData &inout MatchData)
    {
        int local_1 = 0;
        for (auto& local_22 : this.GetPlayerExtras())
        {
            if (GetbIsBot() && MatchData.GetPlayerMatchDatas().Contains(local_22.GetKey()) && (MatchData.GetPlayerMatchDatas()[local_22.GetKey()].GetTeamID() == TeamID))
            {
                if (local_1 == 0 || (local_22.GetKey() > local_1))
                {
                    local_1 = local_22.GetKey();
                }
            }
        }
        if (local_1 > 0)
        {
            MatchData.RefreshTeamCounts();
        }
        return;
    }
    bool IsBotUID(const uint UID) const
    {
        return this.GetPlayerExtras().Contains(UID) && this.GetPlayerExtras()[UID].GetbIsBot();
    }
    int GetBotCountInTeam(const uint8 TeamID, const FCS_GameMode_MatchData &inout MatchData) const
    {
        int local_1 = 0;
        for (auto& local_22 : this.GetPlayerExtras())
        {
            if (GetbIsBot() && MatchData.GetPlayerMatchDatas().Contains(local_22.GetKey()) && (MatchData.GetPlayerMatchDatas()[local_22.GetKey()].GetTeamID() == TeamID))
            {
                local_1 = local_1 + 1;
            }
        }
        return local_1;
    }
    void RemovePlayer(const uint PlayerUID, FCS_GameMode_MatchData &inout MatchData)
    {
        if (!(MatchData.GetPlayerMatchDatas().Contains(PlayerUID)))
        {
            return;
        }
        MatchData.RefreshTeamCounts();
        if (this.GetHostPlayerUID() == PlayerUID)
        {
            this.SetHostPlayerUID(0);
            this.SetbHostSayGO(false);
            for (auto& local_20 : MatchData.GetPlayerMatchDatas())
            {
                if (this.GetPlayerExtras().Contains(local_20.GetKey()) && !(this.GetPlayerExtras()[local_20.GetKey()].GetbIsBot()))
                {
                    this.SetHostPlayerUID(local_20.GetKey());
                    break;
                }
            }
        }
        return;
    }
    const TMap<uint, FPVP_PlayerSessionExtra> GetPlayerExtras() const property
    {
        const TMap<uint, FPVP_PlayerSessionExtra> __r;
        return __r;
    }
    TMap<uint, FPVP_PlayerSessionExtra> GetModify_PlayerExtras() property
    {
        TMap<uint, FPVP_PlayerSessionExtra> __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetPlayerExtras(const TMap<uint, FPVP_PlayerSessionExtra> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_PlayerExtras = __Value;
        return;
    }
    uint GetHostPlayerUID() const property
    {
        return this.m_HostPlayerUID;
    }
    void SetHostPlayerUID(const uint __Value) property
    {
        if (this.m_HostPlayerUID == __Value)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_HostPlayerUID = __Value;
        return;
    }
    uint GetMatchRoomID() const property
    {
        return this.m_MatchRoomID;
    }
    void SetMatchRoomID(const uint __Value) property
    {
        if (this.m_MatchRoomID == __Value)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_MatchRoomID = __Value;
        return;
    }
    bool GetbHostSayGO() const property
    {
        return this.m_bHostSayGO;
    }
    void SetbHostSayGO(const bool __Value) property
    {
        if (!(this.m_bHostSayGO) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(3);
        this.m_bHostSayGO = __Value;
        return;
    }
    EPVPGameRuleType GetSelectedGameRuleType() const property
    {
        return this.m_SelectedGameRuleType;
    }
    void SetSelectedGameRuleType(const EPVPGameRuleType __Value) property
    {
        if (int(this.m_SelectedGameRuleType) == int(__Value))
        {
            return;
        }
        this.__MarkDirty(4);
        this.m_SelectedGameRuleType = __Value;
        return;
    }
    uint GetNextBotUID() const property
    {
        return this.m_NextBotUID;
    }
    void SetNextBotUID(const uint __Value) property
    {
        if (this.m_NextBotUID == __Value)
        {
            return;
        }
        this.__MarkDirty(5);
        this.m_NextBotUID = __Value;
        return;
    }
    const TMap<uint, FECSEntity> GetBotPlayerEntities() const property
    {
        const TMap<uint, FECSEntity> __r;
        return __r;
    }
    TMap<uint, FECSEntity> GetModify_BotPlayerEntities() property
    {
        TMap<uint, FECSEntity> __r;
        this.__MarkDirty(6);
        return __r;
    }
    void SetBotPlayerEntities(const TMap<uint, FECSEntity> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(6);
        this.m_BotPlayerEntities = __Value;
        return;
    }
}

namespace ECSFunc_FCS_PVP_SessionData
{
UFUNCTION()
bool HasPVP_SessionData(const FECSWorldPtr &inout World)
{
    return ECSInternal::Has(World, ENTITY_ID_NULL, FCS_PVP_SessionData);
}
FCS_PVP_SessionData& AssignPVP_SessionData(const FECSWorldPtr &inout World, const FCS_PVP_SessionData &inout DefaultValue = FCS_PVP_SessionData())
{
    UScriptStruct local_6 = FCS_PVP_SessionData;
    FECSComponentPtr local_8;
    int local_10 = local_8 = ECSInternal::Assign(World, ENTITY_ID_NULL, local_6, FECSComponentPtr(DefaultValue));
    local_10.InternalSet(local_8);
    return local_10.GetComp();
}
UFUNCTION()
void AssignPVP_SessionData_BP(const FECSWorldPtr &inout World, const FCS_PVP_SessionData &inout DefaultValue = FCS_PVP_SessionData())
{
    ECSFunc_FCS_PVP_SessionData::AssignPVP_SessionData(World, DefaultValue);
    return;
}
FCS_PVP_SessionData& ModifyPVP_SessionData(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_PVP_SessionData;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Modify(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
FCS_PVP_SessionData& ModifyOrAddPVP_SessionData(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_PVP_SessionData;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::ModifyOrAdd(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
const FCS_PVP_SessionData& GetPVP_SessionData(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_PVP_SessionData;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Get(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
UFUNCTION()
FCS_PVP_SessionData GetPVP_SessionData_BP(const FECSWorldPtr &inout World, bool &out bValid)
{
    bValid = false;
    const FCS_PVP_SessionData& local_4 = ECSFunc_FCS_PVP_SessionData::GetPVP_SessionData(World);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FCS_PVP_SessionData();
}
const FCS_PVP_SessionData GetDefaultedPVP_SessionData(const FECSWorldPtr &inout World)
{
    int local_10 = 0;
    const FCS_PVP_SessionData __r;
    FECSComponentPtr local_6 = ECSInternal::GetDefaulted(World, ENTITY_ID_NULL, FCS_PVP_SessionData);
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
FCS_PVP_SessionData GetDefaultedPVP_SessionData_BP(const FECSWorldPtr &inout World)
{
    return ECSFunc_FCS_PVP_SessionData::GetDefaultedPVP_SessionData(World);
}
UFUNCTION()
bool RemovePVP_SessionData(const FECSWorldPtr &inout World)
{
    return ECSInternal::Remove(World, ENTITY_ID_NULL, FCS_PVP_SessionData);
}
}
void __MonitorPVP_SessionDataLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FCS_PVP_SessionData, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPVP_SessionDataActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FCS_PVP_SessionData, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPVP_SessionDataModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FCS_PVP_SessionData, bFixedFrame, Details);
    return;
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FCS_PVP_SessionData &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FCS_PVP_SessionData &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FCS_PVP_SessionData &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FCS_PVP_SessionData
{
int __IndexOf_PlayerExtras()
{
    return 0;
}
int __IndexOf_HostPlayerUID()
{
    return 1;
}
int __IndexOf_MatchRoomID()
{
    return 2;
}
int __IndexOf_bHostSayGO()
{
    return 3;
}
int __IndexOf_SelectedGameRuleType()
{
    return 4;
}
int __IndexOf_NextBotUID()
{
    return 5;
}
int __IndexOf_BotPlayerEntities()
{
    return 6;
}
}
