

struct FPVX_PlayerData
{
    FSubDirtyFlags32 __DirtyFlags;
    UPROPERTY()
    int m_Level;
    UPROPERTY()
    int m_LastEvolveLevel_Boss;
    UPROPERTY()
    int m_Exp;
    UPROPERTY()
    int m_Score;
    UPROPERTY()
    bool m_bInLevelProtect;
    UPROPERTY()
    int m_TeamId;
    UPROPERTY()
    int m_PlayerInTeamIndex;
    UPROPERTY()
    FString m_PlayerName;
    UPROPERTY()
    uint m_PlayerUID;
    UPROPERTY()
    uint m_PlayerAvatarID;
    UPROPERTY()
    uint m_PlayerDivineSkillID;
    UPROPERTY()
    int m_Kills;
    UPROPERTY()
    int m_Deaths;
    UPROPERTY()
    int m_Assists;
    UPROPERTY()
    int m_CurrencyAmount;
    UPROPERTY()
    FDataObjectPtr m_LastOverrideAttributeData;
    UPROPERTY()
    TArray<FName> m_PendingSettlementEvents;
    UPROPERTY()
    EPVXPlayerFinalState m_FinalState;

    FPVX_PlayerData()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FPVX_PlayerData(const FPVX_PlayerData &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FPVX_PlayerData opAssign(const FPVX_PlayerData &inout Other)
    {
        FPVX_PlayerData __r;
        this.SetLevel(Other.GetLevel());
        this.SetLastEvolveLevel_Boss(Other.GetLastEvolveLevel_Boss());
        this.SetExp(Other.GetExp());
        this.SetScore(Other.GetScore());
        this.SetbInLevelProtect(Other.GetbInLevelProtect());
        this.SetTeamId(Other.GetTeamId());
        this.SetPlayerInTeamIndex(Other.GetPlayerInTeamIndex());
        this.SetPlayerName(Other.GetPlayerName());
        this.SetPlayerUID(Other.GetPlayerUID());
        this.SetPlayerAvatarID(Other.GetPlayerAvatarID());
        this.SetPlayerDivineSkillID(Other.GetPlayerDivineSkillID());
        this.SetKills(Other.GetKills());
        this.SetDeaths(Other.GetDeaths());
        this.SetAssists(Other.GetAssists());
        this.SetCurrencyAmount(Other.GetCurrencyAmount());
        this.SetLastOverrideAttributeData(Other.GetLastOverrideAttributeData());
        this.SetPendingSettlementEvents(Other.GetPendingSettlementEvents());
        this.SetFinalState(Other.GetFinalState());
        return __r;
    }
    int GetLevel() const property
    {
        return this.m_Level;
    }
    void SetLevel(const int __Value) property
    {
        if (this.m_Level == __Value)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_Level = __Value;
        return;
    }
    int GetLastEvolveLevel_Boss() const property
    {
        return this.m_LastEvolveLevel_Boss;
    }
    void SetLastEvolveLevel_Boss(const int __Value) property
    {
        if (this.m_LastEvolveLevel_Boss == __Value)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_LastEvolveLevel_Boss = __Value;
        return;
    }
    int GetExp() const property
    {
        return this.m_Exp;
    }
    void SetExp(const int __Value) property
    {
        if (this.m_Exp == __Value)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_Exp = __Value;
        return;
    }
    int GetScore() const property
    {
        return this.m_Score;
    }
    void SetScore(const int __Value) property
    {
        if (this.m_Score == __Value)
        {
            return;
        }
        this.__MarkDirty(3);
        this.m_Score = __Value;
        return;
    }
    bool GetbInLevelProtect() const property
    {
        return this.m_bInLevelProtect;
    }
    void SetbInLevelProtect(const bool __Value) property
    {
        if (!(this.m_bInLevelProtect) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(4);
        this.m_bInLevelProtect = __Value;
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
        this.__MarkDirty(5);
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
        this.__MarkDirty(6);
        this.m_PlayerInTeamIndex = __Value;
        return;
    }
    FString GetPlayerName() const property
    {
        return this.m_PlayerName;
    }
    void SetPlayerName(const FString &inout __Value) property
    {
        if ((this.m_PlayerName == __Value))
        {
            return;
        }
        this.__MarkDirty(7);
        this.m_PlayerName = __Value;
        return;
    }
    uint GetPlayerUID() const property
    {
        return this.m_PlayerUID;
    }
    void SetPlayerUID(const uint __Value) property
    {
        if (this.m_PlayerUID == __Value)
        {
            return;
        }
        this.__MarkDirty(8);
        this.m_PlayerUID = __Value;
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
        this.__MarkDirty(9);
        this.m_PlayerAvatarID = __Value;
        return;
    }
    uint GetPlayerDivineSkillID() const property
    {
        return this.m_PlayerDivineSkillID;
    }
    void SetPlayerDivineSkillID(const uint __Value) property
    {
        if (this.m_PlayerDivineSkillID == __Value)
        {
            return;
        }
        this.__MarkDirty(10);
        this.m_PlayerDivineSkillID = __Value;
        return;
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
        this.__MarkDirty(11);
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
        this.__MarkDirty(12);
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
        this.__MarkDirty(13);
        this.m_Assists = __Value;
        return;
    }
    int GetCurrencyAmount() const property
    {
        return this.m_CurrencyAmount;
    }
    void SetCurrencyAmount(const int __Value) property
    {
        if (this.m_CurrencyAmount == __Value)
        {
            return;
        }
        this.__MarkDirty(14);
        this.m_CurrencyAmount = __Value;
        return;
    }
    const FDataObjectPtr GetLastOverrideAttributeData() const property
    {
        const FDataObjectPtr __r;
        return __r;
    }
    FDataObjectPtr GetModify_LastOverrideAttributeData() property
    {
        FDataObjectPtr __r;
        this.__MarkDirty(15);
        return __r;
    }
    void SetLastOverrideAttributeData(const FDataObjectPtr &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(15);
        this.m_LastOverrideAttributeData = __Value;
        return;
    }
    const TArray<FName> GetPendingSettlementEvents() const property
    {
        const TArray<FName> __r;
        return __r;
    }
    TArray<FName> GetModify_PendingSettlementEvents() property
    {
        TArray<FName> __r;
        this.__MarkDirty(16);
        return __r;
    }
    void SetPendingSettlementEvents(const TArray<FName> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(16);
        this.m_PendingSettlementEvents = __Value;
        return;
    }
    EPVXPlayerFinalState GetFinalState() const property
    {
        return this.m_FinalState;
    }
    void SetFinalState(const EPVXPlayerFinalState __Value) property
    {
        if (int(this.m_FinalState) == int(__Value))
        {
            return;
        }
        this.__MarkDirty(17);
        this.m_FinalState = __Value;
        return;
    }
}

struct FPVX_LevelExpConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    int Level;
    UPROPERTY()
    int Exp;


}

struct FPVX_MonsterKillExpConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    FDataObjectPtr m_MonsterConfig;
    UPROPERTY()
    int Exp;
    UPROPERTY()
    int Coin = 20;
    UPROPERTY()
    bool UseExpMul = true;


    TDataObjectPtr<FBasePrefabConfig> GetMonsterConfig() const property
    {
        TDataObjectPtr<FBasePrefabConfig> __r;
        return __r;
    }
    void SetMonsterConfig(const TDataObjectPtr<FBasePrefabConfig> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FBasePrefabConfig>> local_2;
        this.m_MonsterConfig = local_2;
        return;
    }
}

namespace AutoDelta
{
FSubDirtyFlags32 GetDirtyFlags(FPVX_PlayerData &inout Data)
{
    FSubDirtyFlags32 __r;
    return __r;
}
void ClearDirtyFlags(FPVX_PlayerData &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FPVX_PlayerData
{
int __IndexOf_Level()
{
    return 0;
}
int __IndexOf_LastEvolveLevel_Boss()
{
    return 1;
}
int __IndexOf_Exp()
{
    return 2;
}
int __IndexOf_Score()
{
    return 3;
}
int __IndexOf_bInLevelProtect()
{
    return 4;
}
int __IndexOf_TeamId()
{
    return 5;
}
int __IndexOf_PlayerInTeamIndex()
{
    return 6;
}
int __IndexOf_PlayerName()
{
    return 7;
}
int __IndexOf_PlayerUID()
{
    return 8;
}
int __IndexOf_PlayerAvatarID()
{
    return 9;
}
int __IndexOf_PlayerDivineSkillID()
{
    return 10;
}
int __IndexOf_Kills()
{
    return 11;
}
int __IndexOf_Deaths()
{
    return 12;
}
int __IndexOf_Assists()
{
    return 13;
}
int __IndexOf_CurrencyAmount()
{
    return 14;
}
int __IndexOf_LastOverrideAttributeData()
{
    return 15;
}
int __IndexOf_PendingSettlementEvents()
{
    return 16;
}
int __IndexOf_FinalState()
{
    return 17;
}
}
