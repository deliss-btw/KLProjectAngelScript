
namespace PVPConstants
{
    const int MaxTeamCount = 2;
    const int MaxPlayersPerTeam = 5;
    const uint BotUIDBase = 100001;
}
namespace __INTENRAL_FCS_PVP_MatchData_NS
{
    const TECSComponentDerivedPtr<FCS_PVP_MatchData> DerivedPtr = TECSComponentDerivedPtr<FCS_PVP_MatchData>();
    const FCS_PVP_MatchData DefaultValue = FCS_PVP_MatchData();
}
namespace __INTENRAL_FCE_PVPPlayerSetGO_NS
{
    const TECSEventDerivedPtr<FCE_PVPPlayerSetGO> DerivedPtr = TECSEventDerivedPtr<FCE_PVPPlayerSetGO>();
}
namespace __INTENRAL_FCE_PVPPlayerSwitchTeam_NS
{
    const TECSEventDerivedPtr<FCE_PVPPlayerSwitchTeam> DerivedPtr = TECSEventDerivedPtr<FCE_PVPPlayerSwitchTeam>();
}
namespace __INTENRAL_FCE_PVPPlayerSwitchGameRule_NS
{
    const TECSEventDerivedPtr<FCE_PVPPlayerSwitchGameRule> DerivedPtr = TECSEventDerivedPtr<FCE_PVPPlayerSwitchGameRule>();
}
namespace __INTENRAL_FCE_PVPPlayerRequestBackToRoom_NS
{
    const TECSEventDerivedPtr<FCE_PVPPlayerRequestBackToRoom> DerivedPtr = TECSEventDerivedPtr<FCE_PVPPlayerRequestBackToRoom>();
}
namespace __INTENRAL_FCE_PVPAddBot_NS
{
    const TECSEventDerivedPtr<FCE_PVPAddBot> DerivedPtr = TECSEventDerivedPtr<FCE_PVPAddBot>();
}
namespace __INTENRAL_FCE_PVPRemoveBot_NS
{
    const TECSEventDerivedPtr<FCE_PVPRemoveBot> DerivedPtr = TECSEventDerivedPtr<FCE_PVPRemoveBot>();

}
struct FPVP_PlayerMatchData
{
    FSubDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    uint8 m_TeamID;
    UPROPERTY()
    int m_PlayerInTeamIndex;
    UPROPERTY()
    bool m_bWantsBackToRoom;
    UPROPERTY()
    bool m_bIsBot;

    FPVP_PlayerMatchData()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FPVP_PlayerMatchData(const FPVP_PlayerMatchData &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FPVP_PlayerMatchData opAssign(const FPVP_PlayerMatchData &inout Other)
    {
        FPVP_PlayerMatchData __r;
        this.SetTeamID(uint8(Other.GetTeamID()));
        this.SetPlayerInTeamIndex(Other.GetPlayerInTeamIndex());
        this.SetbWantsBackToRoom(Other.GetbWantsBackToRoom());
        this.SetbIsBot(Other.GetbIsBot());
        return __r;
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
        this.__MarkDirty(0);
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
        this.__MarkDirty(1);
        this.m_PlayerInTeamIndex = __Value;
        return;
    }
    bool GetbWantsBackToRoom() const property
    {
        return this.m_bWantsBackToRoom;
    }
    void SetbWantsBackToRoom(const bool __Value) property
    {
        if (!(this.m_bWantsBackToRoom) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_bWantsBackToRoom = __Value;
        return;
    }
    bool GetbIsBot() const property
    {
        return this.m_bIsBot;
    }
    void SetbIsBot(const bool __Value) property
    {
        if (!(this.m_bIsBot) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(3);
        this.m_bIsBot = __Value;
        return;
    }
}

struct FCS_PVP_MatchData : FECSSingleton
{
    FRootDirtyFlags16 __DirtyFlags;
    UPROPERTY()
    TMap<uint, FPVP_PlayerMatchData> m_PlayerMatchDatas;
    UPROPERTY()
    uint m_HostPlayerUID;
    UPROPERTY()
    uint m_MatchRoomID;
    UPROPERTY()
    int m_TeamPlayerCount0;
    UPROPERTY()
    int m_TeamPlayerCount1;
    UPROPERTY()
    bool m_bHostSayGO;
    UPROPERTY()
    EPVPGameRuleType m_SelectedGameRuleType;
    UPROPERTY()
    uint m_NextBotUID;
    UPROPERTY()
    TMap<uint, FECSEntity> m_BotPlayerEntities;

    FCS_PVP_MatchData()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FCS_PVP_MatchData(const FCS_PVP_MatchData &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FCS_PVP_MatchData opAssign(const FCS_PVP_MatchData &inout Other)
    {
        FCS_PVP_MatchData __r;
        this.SetPlayerMatchDatas(Other.GetPlayerMatchDatas());
        this.SetHostPlayerUID(Other.GetHostPlayerUID());
        this.SetMatchRoomID(Other.GetMatchRoomID());
        this.SetTeamPlayerCount0(Other.GetTeamPlayerCount0());
        this.SetTeamPlayerCount1(Other.GetTeamPlayerCount1());
        this.SetbHostSayGO(Other.GetbHostSayGO());
        this.SetSelectedGameRuleType(Other.GetSelectedGameRuleType());
        this.SetNextBotUID(Other.GetNextBotUID());
        this.SetBotPlayerEntities(Other.GetBotPlayerEntities());
        return __r;
    }
    int GetTeamPlayerCount(const uint8 TeamID) const
    {
        int local_1 = TeamID;
        return local_1 == 0 ? this.GetTeamPlayerCount0() : this.GetTeamPlayerCount1();
    }
    void AddNewPlayer(const uint PlayerUID)
    {
        if (this.GetPlayerMatchDatas().Contains(PlayerUID))
        {
            return;
        }
        if (this.GetTeamPlayerCount0() == 0 && (this.GetTeamPlayerCount1() == 0))
        {
            this.SetHostPlayerUID(PlayerUID);
        }
        int local_7 = this.GetTeamPlayerCount0() <= this.GetTeamPlayerCount1() ? 0 : 1;
        FPVP_PlayerMatchData local_12;
        local_12.SetTeamID(uint8(local_7));
        local_12.SetPlayerInTeamIndex(this.GetTeamPlayerCount(uint8(local_7)));
        this.GetModify_PlayerMatchDatas().Add(PlayerUID, local_12);
        if (local_7 == 0)
        {
            this.SetTeamPlayerCount0(this.GetTeamPlayerCount0() + 1);
            return;
        }
        this.SetTeamPlayerCount1(this.GetTeamPlayerCount1() + 1);
        return;
    }
    uint AddBotToTeam(const uint8 TeamID)
    {
        int local_5;
        if (this.GetTeamPlayerCount(uint8(TeamID)) >= 5)
        {
            return 0;
        }
        local_5 = this.GetNextBotUID();
        this.SetNextBotUID((this.GetNextBotUID() + 1));
        FPVP_PlayerMatchData local_10;
        local_10.SetTeamID(uint8(TeamID));
        local_10.SetPlayerInTeamIndex(this.GetTeamPlayerCount(uint8(TeamID)));
        local_10.SetbIsBot(true);
        this.GetModify_PlayerMatchDatas().Add(local_5, local_10);
        if (TeamID == 0)
        {
            this.SetTeamPlayerCount0((this.GetTeamPlayerCount0() + 1));
        }
        else
        {
            this.SetTeamPlayerCount1((this.GetTeamPlayerCount1() + 1));
        }
        return local_5;
    }
    void RemoveBotFromTeam(const uint8 TeamID)
    {
        int local_1 = 0;
        for (auto& local_22 : this.GetPlayerMatchDatas())
        {
            if (GetbIsBot() && (GetTeamID() == TeamID))
            {
                if (local_1 == 0 || (local_22.GetKey() > local_1))
                {
                    local_1 = local_22.GetKey();
                }
            }
        }
        if (local_1 > 0)
        {
            this.RefreshInTeamIndices();
        }
        return;
    }
    bool IsBotUID(const uint UID) const
    {
        return this.GetPlayerMatchDatas().Contains(UID) && this.GetPlayerMatchDatas()[UID].GetbIsBot();
    }
    int GetBotCountInTeam(const uint8 TeamID) const
    {
        int local_1 = 0;
        for (auto& local_22 : this.GetPlayerMatchDatas())
        {
            local_22;
            if (GetbIsBot() && (GetTeamID() == TeamID))
            {
                local_1 = local_1 + 1;
            }
        }
        return local_1;
    }
    void RemovePlayer(const uint PlayerUID)
    {
        if (!(this.GetPlayerMatchDatas().Contains(PlayerUID)))
        {
            return;
        }
        this.RefreshInTeamIndices();
        if (this.GetHostPlayerUID() == PlayerUID)
        {
            this.SetHostPlayerUID(0);
            this.SetbHostSayGO(false);
            for (auto& local_20 : this.GetPlayerMatchDatas())
            {
                this.SetHostPlayerUID(local_20.GetKey());
                break;
            }
        }
        return;
    }
    void RefreshInTeamIndices()
    {
        TArray<uint> local_4;
        TArray<uint> local_8;
        for (auto& local_28 : this.GetPlayerMatchDatas())
        {
            int local_29 = GetTeamID();
            if (local_29 == 0)
            {
                local_4.Add(local_28.GetKey());
                continue;
            }
            local_8.Add(local_28.GetKey());
        }
        this.SortUIDsByInTeamIndex(local_4);
        this.SortUIDsByInTeamIndex(local_8);
        this.SetTeamPlayerCount0(local_4.Num());
        this.SetTeamPlayerCount1(local_8.Num());
        int local_32 = 0;
        for (; local_32 < local_4.Num(); )
        {
            this.GetModify_PlayerMatchDatas()[local_4[local_32]].SetPlayerInTeamIndex(local_32);
            ++local_32;
        }
        int local_32_2 = 0;
        for (; local_32_2 < local_8.Num(); )
        {
            this.GetModify_PlayerMatchDatas()[local_8[local_32_2]].SetPlayerInTeamIndex(local_32_2);
            ++local_32_2;
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
    const TMap<uint, FPVP_PlayerMatchData> GetPlayerMatchDatas() const property
    {
        const TMap<uint, FPVP_PlayerMatchData> __r;
        return __r;
    }
    TMap<uint, FPVP_PlayerMatchData> GetModify_PlayerMatchDatas() property
    {
        TMap<uint, FPVP_PlayerMatchData> __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetPlayerMatchDatas(const TMap<uint, FPVP_PlayerMatchData> &inout __Value) property
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
    int GetTeamPlayerCount0() const property
    {
        return this.m_TeamPlayerCount0;
    }
    void SetTeamPlayerCount0(const int __Value) property
    {
        if (this.m_TeamPlayerCount0 == __Value)
        {
            return;
        }
        this.__MarkDirty(3);
        this.m_TeamPlayerCount0 = __Value;
        return;
    }
    int GetTeamPlayerCount1() const property
    {
        return this.m_TeamPlayerCount1;
    }
    void SetTeamPlayerCount1(const int __Value) property
    {
        if (this.m_TeamPlayerCount1 == __Value)
        {
            return;
        }
        this.__MarkDirty(4);
        this.m_TeamPlayerCount1 = __Value;
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
        this.__MarkDirty(5);
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
        this.__MarkDirty(6);
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
        this.__MarkDirty(7);
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
        this.__MarkDirty(8);
        return __r;
    }
    void SetBotPlayerEntities(const TMap<uint, FECSEntity> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(8);
        this.m_BotPlayerEntities = __Value;
        return;
    }
}

struct FCE_PVPPlayerSetGO : FECSEvent
{
    FECSEvent _base_FECSEvent;

    FCE_PVPPlayerSetGO()
    {
        return;
    }
    bool Validate() const
    {
        Has local_4;
        return local_4.opCall();
    }
}

struct FCE_PVPPlayerSwitchTeam : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    uint8 NewTeamID;


    bool Validate() const
    {
        Has local_4;
        return local_4.opCall();
    }
}

struct FCE_PVPPlayerSwitchGameRule : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    EPVPGameRuleType NewGameRuleType;


    bool Validate() const
    {
        Has local_4;
        return local_4.opCall();
    }
}

struct FCE_PVPPlayerRequestBackToRoom : FECSEvent
{
    FECSEvent _base_FECSEvent;

    FCE_PVPPlayerRequestBackToRoom()
    {
        return;
    }
    bool Validate() const
    {
        Has local_4;
        return local_4.opCall();
    }
}

struct FCE_PVPAddBot : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    uint8 TeamID;


    bool Validate() const
    {
        Has local_4;
        return local_4.opCall();
    }
}

struct FCE_PVPRemoveBot : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    uint8 TeamID;


    bool Validate() const
    {
        Has local_4;
        return local_4.opCall();
    }
}

namespace ECSFunc_FCS_PVP_MatchData
{
UFUNCTION()
bool HasPVP_MatchData(const FECSWorldPtr &inout World)
{
    return ECSInternal::Has(World, ENTITY_ID_NULL, FCS_PVP_MatchData);
}
FCS_PVP_MatchData& AssignPVP_MatchData(const FECSWorldPtr &inout World, const FCS_PVP_MatchData &inout DefaultValue = FCS_PVP_MatchData())
{
    UScriptStruct local_6 = FCS_PVP_MatchData;
    FECSComponentPtr local_8;
    int local_10 = local_8 = ECSInternal::Assign(World, ENTITY_ID_NULL, local_6, FECSComponentPtr(DefaultValue));
    local_10.InternalSet(local_8);
    return local_10.GetComp();
}
UFUNCTION()
void AssignPVP_MatchData_BP(const FECSWorldPtr &inout World, const FCS_PVP_MatchData &inout DefaultValue = FCS_PVP_MatchData())
{
    ECSFunc_FCS_PVP_MatchData::AssignPVP_MatchData(World, DefaultValue);
    return;
}
FCS_PVP_MatchData& ModifyPVP_MatchData(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_PVP_MatchData;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Modify(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
FCS_PVP_MatchData& ModifyOrAddPVP_MatchData(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_PVP_MatchData;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::ModifyOrAdd(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
const FCS_PVP_MatchData& GetPVP_MatchData(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_PVP_MatchData;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Get(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
UFUNCTION()
FCS_PVP_MatchData GetPVP_MatchData_BP(const FECSWorldPtr &inout World, bool &out bValid)
{
    bValid = false;
    const FCS_PVP_MatchData& local_4 = ECSFunc_FCS_PVP_MatchData::GetPVP_MatchData(World);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FCS_PVP_MatchData();
}
const FCS_PVP_MatchData GetDefaultedPVP_MatchData(const FECSWorldPtr &inout World)
{
    int local_10 = 0;
    const FCS_PVP_MatchData __r;
    FECSComponentPtr local_6 = ECSInternal::GetDefaulted(World, ENTITY_ID_NULL, FCS_PVP_MatchData);
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
FCS_PVP_MatchData GetDefaultedPVP_MatchData_BP(const FECSWorldPtr &inout World)
{
    return ECSFunc_FCS_PVP_MatchData::GetDefaultedPVP_MatchData(World);
}
UFUNCTION()
bool RemovePVP_MatchData(const FECSWorldPtr &inout World)
{
    return ECSInternal::Remove(World, ENTITY_ID_NULL, FCS_PVP_MatchData);
}
}
void __MonitorPVP_MatchDataLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FCS_PVP_MatchData, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPVP_MatchDataActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FCS_PVP_MatchData, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPVP_MatchDataModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FCS_PVP_MatchData, bFixedFrame, Details);
    return;
}
namespace AutoDelta
{
FSubDirtyFlags8 GetDirtyFlags(FPVP_PlayerMatchData &inout Data)
{
    FSubDirtyFlags8 __r;
    return __r;
}
void ClearDirtyFlags(FPVP_PlayerMatchData &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FPVP_PlayerMatchData
{
int __IndexOf_TeamID()
{
    return 0;
}
int __IndexOf_PlayerInTeamIndex()
{
    return 1;
}
int __IndexOf_bWantsBackToRoom()
{
    return 2;
}
int __IndexOf_bIsBot()
{
    return 3;
}
}
namespace AutoDelta
{
FRootDirtyFlags16 GetDirtyFlags(FCS_PVP_MatchData &inout Data)
{
    FRootDirtyFlags16 __r;
    return __r;
}
void InitDirtyFlags(FCS_PVP_MatchData &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FCS_PVP_MatchData &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FCS_PVP_MatchData
{
int __IndexOf_PlayerMatchDatas()
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
int __IndexOf_TeamPlayerCount0()
{
    return 3;
}
int __IndexOf_TeamPlayerCount1()
{
    return 4;
}
int __IndexOf_bHostSayGO()
{
    return 5;
}
int __IndexOf_SelectedGameRuleType()
{
    return 6;
}
int __IndexOf_NextBotUID()
{
    return 7;
}
int __IndexOf_BotPlayerEntities()
{
    return 8;
}
}
