
enum EFCS_GameStageType
{
    None,
    Preparing,
    Start,
    Playing,
    Finish,
}

enum EGameModeType
{
    None,
    PVX,
    PVP,
}

enum EFairModeFlags
{
    UseModeAttribute = 1,
    UseModeWeapon,
    DisableTalent = 4,
    DisableLevelGrowth = 8,
    DisableDivineSkillPassive = 16,
    DisableStigmata = 32,
    All = 63,
}

enum ECombatRestrictionFlags
{
    DisableMount = 1,
    LimitPotion,
    DisableTacticalItem = 4,
    FilterDivineSkill = 8,
}

namespace __INTENRAL_FCS_GameStates_NS
{
    const TECSComponentDerivedPtr<FCS_GameStates> DerivedPtr = TECSComponentDerivedPtr<FCS_GameStates>();
    const FCS_GameStates DefaultValue = FCS_GameStates();
}
namespace __INTENRAL_FCS_GameMode_NS
{
    const TECSComponentDerivedPtr<FCS_GameMode> DerivedPtr = TECSComponentDerivedPtr<FCS_GameMode>();
    const FCS_GameMode DefaultValue = FCS_GameMode();
}
namespace __INTENRAL_FCS_StartPlayerUids_NS
{
    const TECSComponentDerivedPtr<FCS_StartPlayerUids> DerivedPtr = TECSComponentDerivedPtr<FCS_StartPlayerUids>();
    const FCS_StartPlayerUids DefaultValue = FCS_StartPlayerUids();
}
namespace __INTENRAL_FCS_GameModePreparingTag_NS
{
    const TECSComponentDerivedPtr<FCS_GameModePreparingTag> DerivedPtr = TECSComponentDerivedPtr<FCS_GameModePreparingTag>();
    const FCS_GameModePreparingTag DefaultValue = FCS_GameModePreparingTag();
}
namespace __INTENRAL_FCE_FinishPrepareGameEvent_NS
{
    const TECSEventDerivedPtr<FCE_FinishPrepareGameEvent> DerivedPtr = TECSEventDerivedPtr<FCE_FinishPrepareGameEvent>();
}
namespace __INTENRAL_FCE_PVXStartGameEvent_NS
{
    const TECSEventDerivedPtr<FCE_PVXStartGameEvent> DerivedPtr = TECSEventDerivedPtr<FCE_PVXStartGameEvent>();
}
namespace __INTENRAL_FCE_GameModeStateChangedEvent_NS
{
    const TECSEventDerivedPtr<FCE_GameModeStateChangedEvent> DerivedPtr = TECSEventDerivedPtr<FCE_GameModeStateChangedEvent>();
}
namespace __INTENRAL_FCE_GameModeFinish_NS
{
    const TECSEventDerivedPtr<FCE_GameModeFinish> DerivedPtr = TECSEventDerivedPtr<FCE_GameModeFinish>();

}
struct FCS_GameStates : FECSSingleton
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    EFCS_GameStageType m_StageType;
    UPROPERTY()
    FFPTime m_ConfirmReadyTime;
    UPROPERTY()
    bool m_bForceGo;

    FCS_GameStates()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FCS_GameStates(const FCS_GameStates &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FCS_GameStates opAssign(const FCS_GameStates &inout Other)
    {
        FCS_GameStates __r;
        this.SetStageType(Other.GetStageType());
        this.SetConfirmReadyTime(Other.GetConfirmReadyTime());
        this.SetbForceGo(Other.GetbForceGo());
        return __r;
    }
    EFCS_GameStageType GetStageType() const property
    {
        return this.m_StageType;
    }
    void SetStageType(const EFCS_GameStageType __Value) property
    {
        if (int(this.m_StageType) == int(__Value))
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_StageType = __Value;
        return;
    }
    const FFPTime GetConfirmReadyTime() const property
    {
        const FFPTime __r;
        return __r;
    }
    FFPTime GetModify_ConfirmReadyTime() property
    {
        FFPTime __r;
        this.__MarkDirty(1);
        return __r;
    }
    void SetConfirmReadyTime(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_ConfirmReadyTime = __Value;
        return;
    }
    bool GetbForceGo() const property
    {
        return this.m_bForceGo;
    }
    void SetbForceGo(const bool __Value) property
    {
        if (!(this.m_bForceGo) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_bForceGo = __Value;
        return;
    }
}

struct FCS_GameMode : FECSSingleton
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    bool m_bPVPGame;
    UPROPERTY()
    bool m_bPVXGame;
    UPROPERTY()
    bool m_bHiddenExitLevel;
    UPROPERTY()
    EGameModeType m_GameModeType;
    UPROPERTY()
    int m_FairModeFlags;
    UPROPERTY()
    int m_CombatRestrictionFlags;

    FCS_GameMode()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FCS_GameMode(const FCS_GameMode &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FCS_GameMode opAssign(const FCS_GameMode &inout Other)
    {
        FCS_GameMode __r;
        this.SetbPVPGame(Other.GetbPVPGame());
        this.SetbPVXGame(Other.GetbPVXGame());
        this.SetbHiddenExitLevel(Other.GetbHiddenExitLevel());
        this.SetGameModeType(Other.GetGameModeType());
        this.SetFairModeFlags(Other.GetFairModeFlags());
        this.SetCombatRestrictionFlags(Other.GetCombatRestrictionFlags());
        return __r;
    }
    bool HasFairModeFlag(const EFairModeFlags Flag) const
    {
        int local_2 = this.GetFairModeFlags() & int(Flag);
        return (local_2 != 0);
    }
    bool HasAnyFairModeFlag() const
    {
        return (this.GetFairModeFlags() != 0);
    }
    bool HasCombatRestriction(const ECombatRestrictionFlags Flag) const
    {
        int local_2 = this.GetCombatRestrictionFlags() & int(Flag);
        return (local_2 != 0);
    }
    bool GetbPVPGame() const property
    {
        return this.m_bPVPGame;
    }
    void SetbPVPGame(const bool __Value) property
    {
        if (!(this.m_bPVPGame) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_bPVPGame = __Value;
        return;
    }
    bool GetbPVXGame() const property
    {
        return this.m_bPVXGame;
    }
    void SetbPVXGame(const bool __Value) property
    {
        if (!(this.m_bPVXGame) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_bPVXGame = __Value;
        return;
    }
    bool GetbHiddenExitLevel() const property
    {
        return this.m_bHiddenExitLevel;
    }
    void SetbHiddenExitLevel(const bool __Value) property
    {
        if (!(this.m_bHiddenExitLevel) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_bHiddenExitLevel = __Value;
        return;
    }
    EGameModeType GetGameModeType() const property
    {
        return this.m_GameModeType;
    }
    void SetGameModeType(const EGameModeType __Value) property
    {
        if (int(this.m_GameModeType) == int(__Value))
        {
            return;
        }
        this.__MarkDirty(3);
        this.m_GameModeType = __Value;
        return;
    }
    int GetFairModeFlags() const property
    {
        return this.m_FairModeFlags;
    }
    void SetFairModeFlags(const int __Value) property
    {
        if (this.m_FairModeFlags == __Value)
        {
            return;
        }
        this.__MarkDirty(4);
        this.m_FairModeFlags = __Value;
        return;
    }
    int GetCombatRestrictionFlags() const property
    {
        return this.m_CombatRestrictionFlags;
    }
    void SetCombatRestrictionFlags(const int __Value) property
    {
        if (this.m_CombatRestrictionFlags == __Value)
        {
            return;
        }
        this.__MarkDirty(5);
        this.m_CombatRestrictionFlags = __Value;
        return;
    }
}

struct FCS_StartPlayerUids : FECSSingleton
{
    UPROPERTY()
    TArray<uint> PlayerUids;
    UPROPERTY()
    FFPTime WaitStartTime = -1;

    FCS_StartPlayerUids()
    {
        return;
    }
}

struct FCS_GameModePreparingTag : FECSSingleton
{
    FCS_GameModePreparingTag()
    {
        return;
    }
}

struct FCE_FinishPrepareGameEvent : FECSEvent
{
    FECSEvent _base_FECSEvent;

    FCE_FinishPrepareGameEvent()
    {
        return;
    }
}

struct FCE_PVXStartGameEvent : FECSEvent
{
    FECSEvent _base_FECSEvent;

    FCE_PVXStartGameEvent()
    {
        return;
    }
}

struct FCE_GameModeStateChangedEvent : FECSEvent
{
    FECSEvent _base_FECSEvent;

    FCE_GameModeStateChangedEvent()
    {
        return;
    }
}

struct FCE_GameModeFinish : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    TArray<int> WinnerTeamIds;
    UPROPERTY()
    TArray<int> LoserTeamIds;

    FCE_GameModeFinish()
    {
        return;
    }
}

namespace ECSFunc_FCS_GameStates
{
UFUNCTION()
bool HasGameStates(const FECSWorldPtr &inout World)
{
    return ECSInternal::Has(World, ENTITY_ID_NULL, FCS_GameStates);
}
FCS_GameStates& AssignGameStates(const FECSWorldPtr &inout World, const FCS_GameStates &inout DefaultValue = FCS_GameStates())
{
    UScriptStruct local_6 = FCS_GameStates;
    FECSComponentPtr local_8;
    int local_10 = local_8 = ECSInternal::Assign(World, ENTITY_ID_NULL, local_6, FECSComponentPtr(DefaultValue));
    local_10.InternalSet(local_8);
    return local_10.GetComp();
}
UFUNCTION()
void AssignGameStates_BP(const FECSWorldPtr &inout World, const FCS_GameStates &inout DefaultValue = FCS_GameStates())
{
    ECSFunc_FCS_GameStates::AssignGameStates(World, DefaultValue);
    return;
}
FCS_GameStates& ModifyGameStates(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_GameStates;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Modify(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
FCS_GameStates& ModifyOrAddGameStates(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_GameStates;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::ModifyOrAdd(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
const FCS_GameStates& GetGameStates(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_GameStates;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Get(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
UFUNCTION()
FCS_GameStates GetGameStates_BP(const FECSWorldPtr &inout World, bool &out bValid)
{
    bValid = false;
    const FCS_GameStates& local_4 = ECSFunc_FCS_GameStates::GetGameStates(World);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FCS_GameStates();
}
const FCS_GameStates GetDefaultedGameStates(const FECSWorldPtr &inout World)
{
    int local_10 = 0;
    const FCS_GameStates __r;
    FECSComponentPtr local_6 = ECSInternal::GetDefaulted(World, ENTITY_ID_NULL, FCS_GameStates);
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
FCS_GameStates GetDefaultedGameStates_BP(const FECSWorldPtr &inout World)
{
    return ECSFunc_FCS_GameStates::GetDefaultedGameStates(World);
}
UFUNCTION()
bool RemoveGameStates(const FECSWorldPtr &inout World)
{
    return ECSInternal::Remove(World, ENTITY_ID_NULL, FCS_GameStates);
}
}
void __MonitorGameStatesLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FCS_GameStates, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorGameStatesActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FCS_GameStates, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorGameStatesModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FCS_GameStates, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FCS_GameMode
{
UFUNCTION()
bool HasGameMode(const FECSWorldPtr &inout World)
{
    return ECSInternal::Has(World, ENTITY_ID_NULL, FCS_GameMode);
}
FCS_GameMode& AssignGameMode(const FECSWorldPtr &inout World, const FCS_GameMode &inout DefaultValue = FCS_GameMode())
{
    UScriptStruct local_6 = FCS_GameMode;
    FECSComponentPtr local_8;
    int local_10 = local_8 = ECSInternal::Assign(World, ENTITY_ID_NULL, local_6, FECSComponentPtr(DefaultValue));
    local_10.InternalSet(local_8);
    return local_10.GetComp();
}
UFUNCTION()
void AssignGameMode_BP(const FECSWorldPtr &inout World, const FCS_GameMode &inout DefaultValue = FCS_GameMode())
{
    ECSFunc_FCS_GameMode::AssignGameMode(World, DefaultValue);
    return;
}
FCS_GameMode& ModifyGameMode(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_GameMode;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Modify(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
FCS_GameMode& ModifyOrAddGameMode(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_GameMode;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::ModifyOrAdd(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
const FCS_GameMode& GetGameMode(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_GameMode;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Get(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
UFUNCTION()
FCS_GameMode GetGameMode_BP(const FECSWorldPtr &inout World, bool &out bValid)
{
    bValid = false;
    const FCS_GameMode& local_4 = ECSFunc_FCS_GameMode::GetGameMode(World);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FCS_GameMode();
}
const FCS_GameMode GetDefaultedGameMode(const FECSWorldPtr &inout World)
{
    int local_10 = 0;
    const FCS_GameMode __r;
    FECSComponentPtr local_6 = ECSInternal::GetDefaulted(World, ENTITY_ID_NULL, FCS_GameMode);
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
FCS_GameMode GetDefaultedGameMode_BP(const FECSWorldPtr &inout World)
{
    return ECSFunc_FCS_GameMode::GetDefaultedGameMode(World);
}
UFUNCTION()
bool RemoveGameMode(const FECSWorldPtr &inout World)
{
    return ECSInternal::Remove(World, ENTITY_ID_NULL, FCS_GameMode);
}
}
void __MonitorGameModeLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FCS_GameMode, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorGameModeActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FCS_GameMode, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorGameModeModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FCS_GameMode, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FCS_StartPlayerUids
{
UFUNCTION()
bool HasStartPlayerUids(const FECSWorldPtr &inout World)
{
    return ECSInternal::Has(World, ENTITY_ID_NULL, FCS_StartPlayerUids);
}
FCS_StartPlayerUids& AssignStartPlayerUids(const FECSWorldPtr &inout World, const FCS_StartPlayerUids &inout DefaultValue = FCS_StartPlayerUids())
{
    UScriptStruct local_6 = FCS_StartPlayerUids;
    FECSComponentPtr local_8;
    int local_10 = local_8 = ECSInternal::Assign(World, ENTITY_ID_NULL, local_6, FECSComponentPtr(DefaultValue));
    local_10.InternalSet(local_8);
    return local_10.GetComp();
}
UFUNCTION()
void AssignStartPlayerUids_BP(const FECSWorldPtr &inout World, const FCS_StartPlayerUids &inout DefaultValue = FCS_StartPlayerUids())
{
    ECSFunc_FCS_StartPlayerUids::AssignStartPlayerUids(World, DefaultValue);
    return;
}
FCS_StartPlayerUids& ModifyStartPlayerUids(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_StartPlayerUids;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Modify(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
FCS_StartPlayerUids& ModifyOrAddStartPlayerUids(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_StartPlayerUids;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::ModifyOrAdd(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
const FCS_StartPlayerUids& GetStartPlayerUids(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_StartPlayerUids;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Get(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
UFUNCTION()
FCS_StartPlayerUids GetStartPlayerUids_BP(const FECSWorldPtr &inout World, bool &out bValid)
{
    FCS_StartPlayerUids __r;
    bValid = false;
    bValid = ECSFunc_FCS_StartPlayerUids::GetStartPlayerUids(World);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FCS_StartPlayerUids GetDefaultedStartPlayerUids(const FECSWorldPtr &inout World)
{
    int local_10 = 0;
    const FCS_StartPlayerUids __r;
    FECSComponentPtr local_6 = ECSInternal::GetDefaulted(World, ENTITY_ID_NULL, FCS_StartPlayerUids);
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
FCS_StartPlayerUids GetDefaultedStartPlayerUids_BP(const FECSWorldPtr &inout World)
{
    FCS_StartPlayerUids __r;
    return __r;
}
UFUNCTION()
bool RemoveStartPlayerUids(const FECSWorldPtr &inout World)
{
    return ECSInternal::Remove(World, ENTITY_ID_NULL, FCS_StartPlayerUids);
}
}
void __MonitorStartPlayerUidsLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FCS_StartPlayerUids, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorStartPlayerUidsActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FCS_StartPlayerUids, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorStartPlayerUidsModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FCS_StartPlayerUids, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FCS_GameModePreparingTag
{
UFUNCTION()
bool HasGameModePreparingTag(const FECSWorldPtr &inout World)
{
    return ECSInternal::Has(World, ENTITY_ID_NULL, FCS_GameModePreparingTag);
}
FCS_GameModePreparingTag& AssignGameModePreparingTag(const FECSWorldPtr &inout World, const FCS_GameModePreparingTag &inout DefaultValue = FCS_GameModePreparingTag())
{
    UScriptStruct local_6 = FCS_GameModePreparingTag;
    FECSComponentPtr local_8;
    int local_10 = local_8 = ECSInternal::Assign(World, ENTITY_ID_NULL, local_6, FECSComponentPtr(DefaultValue));
    local_10.InternalSet(local_8);
    return local_10.GetComp();
}
UFUNCTION()
void AssignGameModePreparingTag_BP(const FECSWorldPtr &inout World, const FCS_GameModePreparingTag &inout DefaultValue = FCS_GameModePreparingTag())
{
    ECSFunc_FCS_GameModePreparingTag::AssignGameModePreparingTag(World, DefaultValue);
    return;
}
FCS_GameModePreparingTag& ModifyGameModePreparingTag(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_GameModePreparingTag;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Modify(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
FCS_GameModePreparingTag& ModifyOrAddGameModePreparingTag(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_GameModePreparingTag;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::ModifyOrAdd(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
const FCS_GameModePreparingTag& GetGameModePreparingTag(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_GameModePreparingTag;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Get(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
UFUNCTION()
FCS_GameModePreparingTag GetGameModePreparingTag_BP(const FECSWorldPtr &inout World, bool &out bValid)
{
    bValid = false;
    const FCS_GameModePreparingTag& local_4 = ECSFunc_FCS_GameModePreparingTag::GetGameModePreparingTag(World);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FCS_GameModePreparingTag();
}
const FCS_GameModePreparingTag GetDefaultedGameModePreparingTag(const FECSWorldPtr &inout World)
{
    int local_10 = 0;
    const FCS_GameModePreparingTag __r;
    FECSComponentPtr local_6 = ECSInternal::GetDefaulted(World, ENTITY_ID_NULL, FCS_GameModePreparingTag);
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
FCS_GameModePreparingTag GetDefaultedGameModePreparingTag_BP(const FECSWorldPtr &inout World)
{
    return ECSFunc_FCS_GameModePreparingTag::GetDefaultedGameModePreparingTag(World);
}
UFUNCTION()
bool RemoveGameModePreparingTag(const FECSWorldPtr &inout World)
{
    return ECSInternal::Remove(World, ENTITY_ID_NULL, FCS_GameModePreparingTag);
}
}
void __MonitorGameModePreparingTagLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FCS_GameModePreparingTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorGameModePreparingTagActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FCS_GameModePreparingTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorGameModePreparingTagModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FCS_GameModePreparingTag, bFixedFrame, Details);
    return;
}
namespace EntityBB
{
void GetEntityBBVar_GameMode_bPVPGame(const FECSEntity &inout Entity, bool &inout OutRetValue)
{
    FECSWorldPtr local_2 = Entity.GetWorld();
    GetDefaulted local_6;
    OutRetValue = local_6.opCall().GetbPVPGame();
    return;
}
void GetEntityBBVar_GameMode_GameModeType(const FECSEntity &inout Entity, uint8 &inout OutRetValue)
{
    FECSWorldPtr local_2 = Entity.GetWorld();
    GetDefaulted local_6;
    OutRetValue = (int(local_6.opCall().GetGameModeType()) != 0);
    return;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FCS_GameStates &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FCS_GameStates &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FCS_GameStates &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FCS_GameStates
{
int __IndexOf_StageType()
{
    return 0;
}
int __IndexOf_ConfirmReadyTime()
{
    return 1;
}
int __IndexOf_bForceGo()
{
    return 2;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FCS_GameMode &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FCS_GameMode &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FCS_GameMode &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FCS_GameMode
{
int __IndexOf_bPVPGame()
{
    return 0;
}
int __IndexOf_bPVXGame()
{
    return 1;
}
int __IndexOf_bHiddenExitLevel()
{
    return 2;
}
int __IndexOf_GameModeType()
{
    return 3;
}
int __IndexOf_FairModeFlags()
{
    return 4;
}
int __IndexOf_CombatRestrictionFlags()
{
    return 5;
}
}
