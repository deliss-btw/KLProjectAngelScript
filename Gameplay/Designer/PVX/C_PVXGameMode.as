
enum EPVXExpChangeReason
{
    None,
    Kill,
    Death,
    Assist,
}

enum EPVXPlayerFinalState
{
    None,
    Success,
    Failure,
    ManualQuit,
}

enum EPVXPlayerFinishReason
{
    None,
    KillAll,
    Death,
    GetDoomHeart,
    TimeOut,
    ManualQuit,
}

namespace __INTENRAL_FC_PVXPlayerRuntime_NS
{
    const TECSComponentDerivedPtr<FC_PVXPlayerRuntime> DerivedPtr = TECSComponentDerivedPtr<FC_PVXPlayerRuntime>();
    const FC_PVXPlayerRuntime DefaultValue = FC_PVXPlayerRuntime();
}
namespace __INTENRAL_FC_PVXPlayerFullyInitializedTag_NS
{
    const TECSComponentDerivedPtr<FC_PVXPlayerFullyInitializedTag> DerivedPtr = TECSComponentDerivedPtr<FC_PVXPlayerFullyInitializedTag>();
    const FC_PVXPlayerFullyInitializedTag DefaultValue = FC_PVXPlayerFullyInitializedTag();
}
namespace __INTENRAL_FCS_PVX_ProgressData_NS
{
    const TECSComponentDerivedPtr<FCS_PVX_ProgressData> DerivedPtr = TECSComponentDerivedPtr<FCS_PVX_ProgressData>();
    const FCS_PVX_ProgressData DefaultValue = FCS_PVX_ProgressData();
}
namespace __INTENRAL_FCS_PVX_PendingSettlement_NS
{
    const TECSComponentDerivedPtr<FCS_PVX_PendingSettlement> DerivedPtr = TECSComponentDerivedPtr<FCS_PVX_PendingSettlement>();
    const FCS_PVX_PendingSettlement DefaultValue = FCS_PVX_PendingSettlement();
}
namespace __INTENRAL_FC_PVX_SettlementReward_NS
{
    const TECSComponentDerivedPtr<FC_PVX_SettlementReward> DerivedPtr = TECSComponentDerivedPtr<FC_PVX_SettlementReward>();
    const FC_PVX_SettlementReward DefaultValue = FC_PVX_SettlementReward();

}
struct FC_PVXPlayerRuntime : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    uint m_PlayerAvatarID;
    UPROPERTY()
    FECSEntity m_SpawnPoint;

    FC_PVXPlayerRuntime()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_PVXPlayerRuntime(const FC_PVXPlayerRuntime &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_PVXPlayerRuntime opAssign(const FC_PVXPlayerRuntime &inout Other)
    {
        FC_PVXPlayerRuntime __r;
        this.SetPlayerAvatarID(Other.GetPlayerAvatarID());
        this.SetSpawnPoint(Other.GetSpawnPoint());
        return __r;
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
        this.__MarkDirty(0);
        this.m_PlayerAvatarID = __Value;
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
}

struct FC_PVXPlayerFullyInitializedTag : FECSComponent
{
    FC_PVXPlayerFullyInitializedTag()
    {
        return;
    }
}

struct FPVX_PlayerProgressData
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
    int m_CurrencyAmount;
    UPROPERTY()
    FDataObjectPtr m_LastOverrideAttributeData;
    UPROPERTY()
    TArray<FName> m_PendingSettlementEvents;
    UPROPERTY()
    EPVXPlayerFinalState m_FinalState;
    UPROPERTY()
    EPVXPlayerFinishReason m_FinishReason;

    FPVX_PlayerProgressData()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FPVX_PlayerProgressData(const FPVX_PlayerProgressData &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FPVX_PlayerProgressData opAssign(const FPVX_PlayerProgressData &inout Other)
    {
        FPVX_PlayerProgressData __r;
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
        this.SetCurrencyAmount(Other.GetCurrencyAmount());
        this.SetLastOverrideAttributeData(Other.GetLastOverrideAttributeData());
        this.SetPendingSettlementEvents(Other.GetPendingSettlementEvents());
        this.SetFinalState(Other.GetFinalState());
        this.SetFinishReason(Other.GetFinishReason());
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
        this.__MarkDirty(11);
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
        this.__MarkDirty(12);
        return __r;
    }
    void SetLastOverrideAttributeData(const FDataObjectPtr &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(12);
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
        this.__MarkDirty(13);
        return __r;
    }
    void SetPendingSettlementEvents(const TArray<FName> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(13);
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
        this.__MarkDirty(14);
        this.m_FinalState = __Value;
        return;
    }
    EPVXPlayerFinishReason GetFinishReason() const property
    {
        return this.m_FinishReason;
    }
    void SetFinishReason(const EPVXPlayerFinishReason __Value) property
    {
        if (int(this.m_FinishReason) == int(__Value))
        {
            return;
        }
        this.__MarkDirty(15);
        this.m_FinishReason = __Value;
        return;
    }
}

struct FCS_PVX_ProgressData : FECSSingleton
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    TMap<FECSEntity, FPVX_PlayerProgressData> m_PlayerProgressMap;
    UPROPERTY()
    TArray<int> m_HasTriggeredLevelProgressArray;
    UPROPERTY()
    float32 m_ExpMultiplier;
    UPROPERTY()
    FBuffConfigRef m_MonsterPowerBuffConfig;
    UPROPERTY()
    EPVXPlayerFinishReason m_WinnerFinishReason;

    FCS_PVX_ProgressData()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FCS_PVX_ProgressData(const FCS_PVX_ProgressData &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FCS_PVX_ProgressData opAssign(const FCS_PVX_ProgressData &inout Other)
    {
        FCS_PVX_ProgressData __r;
        this.SetPlayerProgressMap(Other.GetPlayerProgressMap());
        this.SetHasTriggeredLevelProgressArray(Other.GetHasTriggeredLevelProgressArray());
        this.SetExpMultiplier(Other.GetExpMultiplier());
        this.SetMonsterPowerBuffConfig(Other.GetMonsterPowerBuffConfig());
        this.SetWinnerFinishReason(Other.GetWinnerFinishReason());
        return __r;
    }
    const TMap<FECSEntity, FPVX_PlayerProgressData> GetPlayerProgressMap() const property
    {
        const TMap<FECSEntity, FPVX_PlayerProgressData> __r;
        return __r;
    }
    TMap<FECSEntity, FPVX_PlayerProgressData> GetModify_PlayerProgressMap() property
    {
        TMap<FECSEntity, FPVX_PlayerProgressData> __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetPlayerProgressMap(const TMap<FECSEntity, FPVX_PlayerProgressData> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_PlayerProgressMap = __Value;
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
        this.__MarkDirty(1);
        return __r;
    }
    void SetHasTriggeredLevelProgressArray(const TArray<int> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(1);
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
        this.__MarkDirty(2);
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
        this.__MarkDirty(3);
        return __r;
    }
    void SetMonsterPowerBuffConfig(const FBuffConfigRef &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(3);
        this.m_MonsterPowerBuffConfig = __Value;
        return;
    }
    EPVXPlayerFinishReason GetWinnerFinishReason() const property
    {
        return this.m_WinnerFinishReason;
    }
    void SetWinnerFinishReason(const EPVXPlayerFinishReason __Value) property
    {
        if (int(this.m_WinnerFinishReason) == int(__Value))
        {
            return;
        }
        this.__MarkDirty(4);
        this.m_WinnerFinishReason = __Value;
        return;
    }
}

struct FCS_PVX_PendingSettlement : FECSSingleton
{
    UPROPERTY()
    TArray<FECSEntity> PendingPlayers;

    FCS_PVX_PendingSettlement()
    {
        return;
    }
}

struct FPVX_SettlementRewardEntry
{
    UPROPERTY()
    int RewardId = 0;
    UPROPERTY()
    int Num = 0;


}

struct FC_PVX_SettlementReward : FECSComponent
{
    UPROPERTY()
    TArray<FPVX_SettlementRewardEntry> RewardEntries;
    UPROPERTY()
    int RewardCurrencyAmount = 0;


}

namespace ECSFunc_FC_PVXPlayerRuntime
{
UFUNCTION()
bool HasPVXPlayerRuntime(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_PVXPlayerRuntime);
}
FC_PVXPlayerRuntime& AssignPVXPlayerRuntime(const FECSEntity &inout Entity, const FC_PVXPlayerRuntime &inout DefaultValue = FC_PVXPlayerRuntime())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_PVXPlayerRuntime, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignPVXPlayerRuntime_BP(const FECSEntity &inout Entity, const FC_PVXPlayerRuntime &inout DefaultValue = FC_PVXPlayerRuntime())
{
    ECSFunc_FC_PVXPlayerRuntime::AssignPVXPlayerRuntime(Entity, DefaultValue);
    return;
}
FC_PVXPlayerRuntime& ModifyPVXPlayerRuntime(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_PVXPlayerRuntime));
    return local_12.GetComp();
}
FC_PVXPlayerRuntime& ModifyOrAddPVXPlayerRuntime(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_PVXPlayerRuntime));
    return local_12.GetComp();
}
const FC_PVXPlayerRuntime& GetPVXPlayerRuntime(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_PVXPlayerRuntime));
    return local_12.GetComp();
}
UFUNCTION()
FC_PVXPlayerRuntime GetPVXPlayerRuntime_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_PVXPlayerRuntime& local_4 = ECSFunc_FC_PVXPlayerRuntime::GetPVXPlayerRuntime(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_PVXPlayerRuntime();
}
const FC_PVXPlayerRuntime GetDefaultedPVXPlayerRuntime(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_PVXPlayerRuntime __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_PVXPlayerRuntime);
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
FC_PVXPlayerRuntime GetDefaultedPVXPlayerRuntime_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_PVXPlayerRuntime::GetDefaultedPVXPlayerRuntime(Entity);
}
UFUNCTION()
bool RemovePVXPlayerRuntime(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_PVXPlayerRuntime);
}
}
FECSMonitorRuntimeView __GetMonitorPVXPlayerRuntimeOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_PVXPlayerRuntime, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPVXPlayerRuntimeOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_PVXPlayerRuntime, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPVXPlayerRuntimeOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_PVXPlayerRuntime, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPVXPlayerRuntimeOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_PVXPlayerRuntime, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPVXPlayerRuntimeOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_PVXPlayerRuntime, bFixedFrame, bMustHandleAll);
}
void __MonitorPVXPlayerRuntimeLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_PVXPlayerRuntime, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPVXPlayerRuntimeActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_PVXPlayerRuntime, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPVXPlayerRuntimeModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_PVXPlayerRuntime, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_PVXPlayerFullyInitializedTag
{
UFUNCTION()
bool HasPVXPlayerFullyInitializedTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_PVXPlayerFullyInitializedTag);
}
FC_PVXPlayerFullyInitializedTag& AssignPVXPlayerFullyInitializedTag(const FECSEntity &inout Entity, const FC_PVXPlayerFullyInitializedTag &inout DefaultValue = FC_PVXPlayerFullyInitializedTag())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_PVXPlayerFullyInitializedTag, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignPVXPlayerFullyInitializedTag_BP(const FECSEntity &inout Entity, const FC_PVXPlayerFullyInitializedTag &inout DefaultValue = FC_PVXPlayerFullyInitializedTag())
{
    ECSFunc_FC_PVXPlayerFullyInitializedTag::AssignPVXPlayerFullyInitializedTag(Entity, DefaultValue);
    return;
}
FC_PVXPlayerFullyInitializedTag& ModifyPVXPlayerFullyInitializedTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_PVXPlayerFullyInitializedTag));
    return local_12.GetComp();
}
FC_PVXPlayerFullyInitializedTag& ModifyOrAddPVXPlayerFullyInitializedTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_PVXPlayerFullyInitializedTag));
    return local_12.GetComp();
}
const FC_PVXPlayerFullyInitializedTag& GetPVXPlayerFullyInitializedTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_PVXPlayerFullyInitializedTag));
    return local_12.GetComp();
}
UFUNCTION()
FC_PVXPlayerFullyInitializedTag GetPVXPlayerFullyInitializedTag_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_PVXPlayerFullyInitializedTag& local_4 = ECSFunc_FC_PVXPlayerFullyInitializedTag::GetPVXPlayerFullyInitializedTag(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_PVXPlayerFullyInitializedTag();
}
const FC_PVXPlayerFullyInitializedTag GetDefaultedPVXPlayerFullyInitializedTag(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_PVXPlayerFullyInitializedTag __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_PVXPlayerFullyInitializedTag);
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
FC_PVXPlayerFullyInitializedTag GetDefaultedPVXPlayerFullyInitializedTag_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_PVXPlayerFullyInitializedTag::GetDefaultedPVXPlayerFullyInitializedTag(Entity);
}
UFUNCTION()
bool RemovePVXPlayerFullyInitializedTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_PVXPlayerFullyInitializedTag);
}
}
FECSMonitorRuntimeView __GetMonitorPVXPlayerFullyInitializedTagOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_PVXPlayerFullyInitializedTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPVXPlayerFullyInitializedTagOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_PVXPlayerFullyInitializedTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPVXPlayerFullyInitializedTagOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_PVXPlayerFullyInitializedTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPVXPlayerFullyInitializedTagOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_PVXPlayerFullyInitializedTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPVXPlayerFullyInitializedTagOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_PVXPlayerFullyInitializedTag, bFixedFrame, bMustHandleAll);
}
void __MonitorPVXPlayerFullyInitializedTagLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_PVXPlayerFullyInitializedTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPVXPlayerFullyInitializedTagActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_PVXPlayerFullyInitializedTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPVXPlayerFullyInitializedTagModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_PVXPlayerFullyInitializedTag, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FCS_PVX_ProgressData
{
UFUNCTION()
bool HasPVX_ProgressData(const FECSWorldPtr &inout World)
{
    return ECSInternal::Has(World, ENTITY_ID_NULL, FCS_PVX_ProgressData);
}
FCS_PVX_ProgressData& AssignPVX_ProgressData(const FECSWorldPtr &inout World, const FCS_PVX_ProgressData &inout DefaultValue = FCS_PVX_ProgressData())
{
    UScriptStruct local_6 = FCS_PVX_ProgressData;
    FECSComponentPtr local_8;
    int local_10 = local_8 = ECSInternal::Assign(World, ENTITY_ID_NULL, local_6, FECSComponentPtr(DefaultValue));
    local_10.InternalSet(local_8);
    return local_10.GetComp();
}
UFUNCTION()
void AssignPVX_ProgressData_BP(const FECSWorldPtr &inout World, const FCS_PVX_ProgressData &inout DefaultValue = FCS_PVX_ProgressData())
{
    ECSFunc_FCS_PVX_ProgressData::AssignPVX_ProgressData(World, DefaultValue);
    return;
}
FCS_PVX_ProgressData& ModifyPVX_ProgressData(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_PVX_ProgressData;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Modify(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
FCS_PVX_ProgressData& ModifyOrAddPVX_ProgressData(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_PVX_ProgressData;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::ModifyOrAdd(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
const FCS_PVX_ProgressData& GetPVX_ProgressData(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_PVX_ProgressData;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Get(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
UFUNCTION()
FCS_PVX_ProgressData GetPVX_ProgressData_BP(const FECSWorldPtr &inout World, bool &out bValid)
{
    bValid = false;
    const FCS_PVX_ProgressData& local_4 = ECSFunc_FCS_PVX_ProgressData::GetPVX_ProgressData(World);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FCS_PVX_ProgressData();
}
const FCS_PVX_ProgressData GetDefaultedPVX_ProgressData(const FECSWorldPtr &inout World)
{
    int local_10 = 0;
    const FCS_PVX_ProgressData __r;
    FECSComponentPtr local_6 = ECSInternal::GetDefaulted(World, ENTITY_ID_NULL, FCS_PVX_ProgressData);
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
FCS_PVX_ProgressData GetDefaultedPVX_ProgressData_BP(const FECSWorldPtr &inout World)
{
    return ECSFunc_FCS_PVX_ProgressData::GetDefaultedPVX_ProgressData(World);
}
UFUNCTION()
bool RemovePVX_ProgressData(const FECSWorldPtr &inout World)
{
    return ECSInternal::Remove(World, ENTITY_ID_NULL, FCS_PVX_ProgressData);
}
}
void __MonitorPVX_ProgressDataLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FCS_PVX_ProgressData, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPVX_ProgressDataActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FCS_PVX_ProgressData, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPVX_ProgressDataModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FCS_PVX_ProgressData, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FCS_PVX_PendingSettlement
{
UFUNCTION()
bool HasPVX_PendingSettlement(const FECSWorldPtr &inout World)
{
    return ECSInternal::Has(World, ENTITY_ID_NULL, FCS_PVX_PendingSettlement);
}
FCS_PVX_PendingSettlement& AssignPVX_PendingSettlement(const FECSWorldPtr &inout World, const FCS_PVX_PendingSettlement &inout DefaultValue = FCS_PVX_PendingSettlement())
{
    UScriptStruct local_6 = FCS_PVX_PendingSettlement;
    FECSComponentPtr local_8;
    int local_10 = local_8 = ECSInternal::Assign(World, ENTITY_ID_NULL, local_6, FECSComponentPtr(DefaultValue));
    local_10.InternalSet(local_8);
    return local_10.GetComp();
}
UFUNCTION()
void AssignPVX_PendingSettlement_BP(const FECSWorldPtr &inout World, const FCS_PVX_PendingSettlement &inout DefaultValue = FCS_PVX_PendingSettlement())
{
    ECSFunc_FCS_PVX_PendingSettlement::AssignPVX_PendingSettlement(World, DefaultValue);
    return;
}
FCS_PVX_PendingSettlement& ModifyPVX_PendingSettlement(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_PVX_PendingSettlement;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Modify(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
FCS_PVX_PendingSettlement& ModifyOrAddPVX_PendingSettlement(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_PVX_PendingSettlement;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::ModifyOrAdd(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
const FCS_PVX_PendingSettlement& GetPVX_PendingSettlement(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_PVX_PendingSettlement;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Get(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
UFUNCTION()
FCS_PVX_PendingSettlement GetPVX_PendingSettlement_BP(const FECSWorldPtr &inout World, bool &out bValid)
{
    FCS_PVX_PendingSettlement __r;
    bValid = false;
    bValid = ECSFunc_FCS_PVX_PendingSettlement::GetPVX_PendingSettlement(World);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FCS_PVX_PendingSettlement GetDefaultedPVX_PendingSettlement(const FECSWorldPtr &inout World)
{
    int local_10 = 0;
    const FCS_PVX_PendingSettlement __r;
    FECSComponentPtr local_6 = ECSInternal::GetDefaulted(World, ENTITY_ID_NULL, FCS_PVX_PendingSettlement);
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
FCS_PVX_PendingSettlement GetDefaultedPVX_PendingSettlement_BP(const FECSWorldPtr &inout World)
{
    FCS_PVX_PendingSettlement __r;
    return __r;
}
UFUNCTION()
bool RemovePVX_PendingSettlement(const FECSWorldPtr &inout World)
{
    return ECSInternal::Remove(World, ENTITY_ID_NULL, FCS_PVX_PendingSettlement);
}
}
void __MonitorPVX_PendingSettlementLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FCS_PVX_PendingSettlement, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPVX_PendingSettlementActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FCS_PVX_PendingSettlement, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPVX_PendingSettlementModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FCS_PVX_PendingSettlement, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_PVX_SettlementReward
{
UFUNCTION()
bool HasPVX_SettlementReward(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_PVX_SettlementReward);
}
FC_PVX_SettlementReward& AssignPVX_SettlementReward(const FECSEntity &inout Entity, const FC_PVX_SettlementReward &inout DefaultValue = FC_PVX_SettlementReward())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_PVX_SettlementReward, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignPVX_SettlementReward_BP(const FECSEntity &inout Entity, const FC_PVX_SettlementReward &inout DefaultValue = FC_PVX_SettlementReward())
{
    ECSFunc_FC_PVX_SettlementReward::AssignPVX_SettlementReward(Entity, DefaultValue);
    return;
}
FC_PVX_SettlementReward& ModifyPVX_SettlementReward(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_PVX_SettlementReward));
    return local_12.GetComp();
}
FC_PVX_SettlementReward& ModifyOrAddPVX_SettlementReward(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_PVX_SettlementReward));
    return local_12.GetComp();
}
const FC_PVX_SettlementReward& GetPVX_SettlementReward(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_PVX_SettlementReward));
    return local_12.GetComp();
}
UFUNCTION()
FC_PVX_SettlementReward GetPVX_SettlementReward_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_PVX_SettlementReward __r;
    bValid = false;
    bValid = ECSFunc_FC_PVX_SettlementReward::GetPVX_SettlementReward(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_PVX_SettlementReward GetDefaultedPVX_SettlementReward(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_PVX_SettlementReward __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_PVX_SettlementReward);
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
FC_PVX_SettlementReward GetDefaultedPVX_SettlementReward_BP(const FECSEntity &inout Entity)
{
    FC_PVX_SettlementReward __r;
    return __r;
}
UFUNCTION()
bool RemovePVX_SettlementReward(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_PVX_SettlementReward);
}
}
FECSMonitorRuntimeView __GetMonitorPVX_SettlementRewardOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_PVX_SettlementReward, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPVX_SettlementRewardOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_PVX_SettlementReward, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPVX_SettlementRewardOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_PVX_SettlementReward, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPVX_SettlementRewardOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_PVX_SettlementReward, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPVX_SettlementRewardOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_PVX_SettlementReward, bFixedFrame, bMustHandleAll);
}
void __MonitorPVX_SettlementRewardLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_PVX_SettlementReward, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPVX_SettlementRewardActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_PVX_SettlementReward, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPVX_SettlementRewardModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_PVX_SettlementReward, bFixedFrame, Details);
    return;
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_PVXPlayerRuntime &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_PVXPlayerRuntime &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_PVXPlayerRuntime &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_PVXPlayerRuntime
{
int __IndexOf_PlayerAvatarID()
{
    return 0;
}
int __IndexOf_SpawnPoint()
{
    return 1;
}
}
namespace AutoDelta
{
FSubDirtyFlags32 GetDirtyFlags(FPVX_PlayerProgressData &inout Data)
{
    FSubDirtyFlags32 __r;
    return __r;
}
void ClearDirtyFlags(FPVX_PlayerProgressData &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FPVX_PlayerProgressData
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
int __IndexOf_CurrencyAmount()
{
    return 11;
}
int __IndexOf_LastOverrideAttributeData()
{
    return 12;
}
int __IndexOf_PendingSettlementEvents()
{
    return 13;
}
int __IndexOf_FinalState()
{
    return 14;
}
int __IndexOf_FinishReason()
{
    return 15;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FCS_PVX_ProgressData &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FCS_PVX_ProgressData &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FCS_PVX_ProgressData &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FCS_PVX_ProgressData
{
int __IndexOf_PlayerProgressMap()
{
    return 0;
}
int __IndexOf_HasTriggeredLevelProgressArray()
{
    return 1;
}
int __IndexOf_ExpMultiplier()
{
    return 2;
}
int __IndexOf_MonsterPowerBuffConfig()
{
    return 3;
}
int __IndexOf_WinnerFinishReason()
{
    return 4;
}
}
