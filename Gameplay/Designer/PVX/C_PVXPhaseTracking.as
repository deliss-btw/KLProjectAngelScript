
namespace __INTENRAL_FCS_PVXPhaseState_NS
{
    const TECSComponentDerivedPtr<FCS_PVXPhaseState> DerivedPtr = TECSComponentDerivedPtr<FCS_PVXPhaseState>();
    const FCS_PVXPhaseState DefaultValue = FCS_PVXPhaseState();
}
namespace __INTENRAL_FCS_PVXMonsterHPDisplay_NS
{
    const TECSComponentDerivedPtr<FCS_PVXMonsterHPDisplay> DerivedPtr = TECSComponentDerivedPtr<FCS_PVXMonsterHPDisplay>();
    const FCS_PVXMonsterHPDisplay DefaultValue = FCS_PVXMonsterHPDisplay();

}
struct FCS_PVXPhaseState : FECSSingleton
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    uint m_ActiveObjectiveInstanceId;
    UPROPERTY()
    TDataObjectPtr<FObjectiveConfig> m_ActiveObjective;
    UPROPERTY()
    TDataObjectPtr<FObjectiveConfig> m_PendingObjective;
    UPROPERTY()
    bool m_bInitialized;
    UPROPERTY()
    TDataObjectPtr<FMonsterMainConfig> m_MonitoredMonsterConfig;
    UPROPERTY()
    bool m_bMonitoringHP;
    UPROPERTY()
    FECSEntity m_MonitoredMonsterEntity;
    UPROPERTY()
    TDataObjectPtr<FObjectiveConfig> m_PlayerObjective;
    UPROPERTY()
    TDataObjectPtr<FObjectiveConfig> m_BossObjective;
    UPROPERTY()
    FCommissionTargetProgress m_PlayerProgress;
    UPROPERTY()
    FCommissionTargetProgress m_BossProgress;
    UPROPERTY()
    TMap<uint, FCommissionTargetProgress> m_PlayerChildProgress;
    UPROPERTY()
    TMap<uint, FCommissionTargetProgress> m_BossChildProgress;
    UPROPERTY()
    uint m_PlayerObjectiveInstanceId;
    UPROPERTY()
    uint m_BossObjectiveInstanceId;

    FCS_PVXPhaseState()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FCS_PVXPhaseState(const FCS_PVXPhaseState &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FCS_PVXPhaseState opAssign(const FCS_PVXPhaseState &inout Other)
    {
        FCS_PVXPhaseState __r;
        this.SetActiveObjectiveInstanceId(Other.GetActiveObjectiveInstanceId());
        this.SetActiveObjective(Other.GetActiveObjective());
        this.SetPendingObjective(Other.GetPendingObjective());
        this.SetbInitialized(Other.GetbInitialized());
        this.SetMonitoredMonsterConfig(Other.GetMonitoredMonsterConfig());
        this.SetbMonitoringHP(Other.GetbMonitoringHP());
        this.SetMonitoredMonsterEntity(Other.GetMonitoredMonsterEntity());
        this.SetPlayerObjective(Other.GetPlayerObjective());
        this.SetBossObjective(Other.GetBossObjective());
        this.SetPlayerProgress(Other.GetPlayerProgress());
        this.SetBossProgress(Other.GetBossProgress());
        this.SetPlayerChildProgress(Other.GetPlayerChildProgress());
        this.SetBossChildProgress(Other.GetBossChildProgress());
        this.SetPlayerObjectiveInstanceId(Other.GetPlayerObjectiveInstanceId());
        this.SetBossObjectiveInstanceId(Other.GetBossObjectiveInstanceId());
        return __r;
    }
    uint GetActiveObjectiveInstanceId() const property
    {
        return this.m_ActiveObjectiveInstanceId;
    }
    void SetActiveObjectiveInstanceId(const uint __Value) property
    {
        this.m_ActiveObjectiveInstanceId = __Value;
        return;
    }
    const TDataObjectPtr<FObjectiveConfig> GetActiveObjective() const property
    {
        const TDataObjectPtr<FObjectiveConfig> __r;
        return __r;
    }
    TDataObjectPtr<FObjectiveConfig> GetModify_ActiveObjective() property
    {
        TDataObjectPtr<FObjectiveConfig> __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetActiveObjective(const TDataObjectPtr<FObjectiveConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_ActiveObjective = __Value;
        return;
    }
    const TDataObjectPtr<FObjectiveConfig> GetPendingObjective() const property
    {
        const TDataObjectPtr<FObjectiveConfig> __r;
        return __r;
    }
    TDataObjectPtr<FObjectiveConfig> GetPendingObjective() property
    {
        TDataObjectPtr<FObjectiveConfig> __r;
        return __r;
    }
    void SetPendingObjective(const TDataObjectPtr<FObjectiveConfig> &inout __Value) property
    {
        this.m_PendingObjective = __Value;
        return;
    }
    bool GetbInitialized() const property
    {
        return this.m_bInitialized;
    }
    void SetbInitialized(const bool __Value) property
    {
        this.m_bInitialized = __Value;
        return;
    }
    const TDataObjectPtr<FMonsterMainConfig> GetMonitoredMonsterConfig() const property
    {
        const TDataObjectPtr<FMonsterMainConfig> __r;
        return __r;
    }
    TDataObjectPtr<FMonsterMainConfig> GetMonitoredMonsterConfig() property
    {
        TDataObjectPtr<FMonsterMainConfig> __r;
        return __r;
    }
    void SetMonitoredMonsterConfig(const TDataObjectPtr<FMonsterMainConfig> &inout __Value) property
    {
        this.m_MonitoredMonsterConfig = __Value;
        return;
    }
    bool GetbMonitoringHP() const property
    {
        return this.m_bMonitoringHP;
    }
    void SetbMonitoringHP(const bool __Value) property
    {
        this.m_bMonitoringHP = __Value;
        return;
    }
    const FECSEntity GetMonitoredMonsterEntity() const property
    {
        const FECSEntity __r;
        return __r;
    }
    FECSEntity GetMonitoredMonsterEntity() property
    {
        FECSEntity __r;
        return __r;
    }
    void SetMonitoredMonsterEntity(const FECSEntity &inout __Value) property
    {
        this.m_MonitoredMonsterEntity = __Value;
        return;
    }
    const TDataObjectPtr<FObjectiveConfig> GetPlayerObjective() const property
    {
        const TDataObjectPtr<FObjectiveConfig> __r;
        return __r;
    }
    TDataObjectPtr<FObjectiveConfig> GetModify_PlayerObjective() property
    {
        TDataObjectPtr<FObjectiveConfig> __r;
        this.__MarkDirty(1);
        return __r;
    }
    void SetPlayerObjective(const TDataObjectPtr<FObjectiveConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_PlayerObjective = __Value;
        return;
    }
    const TDataObjectPtr<FObjectiveConfig> GetBossObjective() const property
    {
        const TDataObjectPtr<FObjectiveConfig> __r;
        return __r;
    }
    TDataObjectPtr<FObjectiveConfig> GetModify_BossObjective() property
    {
        TDataObjectPtr<FObjectiveConfig> __r;
        this.__MarkDirty(2);
        return __r;
    }
    void SetBossObjective(const TDataObjectPtr<FObjectiveConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_BossObjective = __Value;
        return;
    }
    const FCommissionTargetProgress GetPlayerProgress() const property
    {
        const FCommissionTargetProgress __r;
        return __r;
    }
    FCommissionTargetProgress GetModify_PlayerProgress() property
    {
        FCommissionTargetProgress __r;
        this.__MarkDirty(3);
        return __r;
    }
    void SetPlayerProgress(const FCommissionTargetProgress &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(3);
        this.m_PlayerProgress = __Value;
        return;
    }
    const FCommissionTargetProgress GetBossProgress() const property
    {
        const FCommissionTargetProgress __r;
        return __r;
    }
    FCommissionTargetProgress GetModify_BossProgress() property
    {
        FCommissionTargetProgress __r;
        this.__MarkDirty(4);
        return __r;
    }
    void SetBossProgress(const FCommissionTargetProgress &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(4);
        this.m_BossProgress = __Value;
        return;
    }
    const TMap<uint, FCommissionTargetProgress> GetPlayerChildProgress() const property
    {
        const TMap<uint, FCommissionTargetProgress> __r;
        return __r;
    }
    TMap<uint, FCommissionTargetProgress> GetModify_PlayerChildProgress() property
    {
        TMap<uint, FCommissionTargetProgress> __r;
        this.__MarkDirty(5);
        return __r;
    }
    void SetPlayerChildProgress(const TMap<uint, FCommissionTargetProgress> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(5);
        this.m_PlayerChildProgress = __Value;
        return;
    }
    const TMap<uint, FCommissionTargetProgress> GetBossChildProgress() const property
    {
        const TMap<uint, FCommissionTargetProgress> __r;
        return __r;
    }
    TMap<uint, FCommissionTargetProgress> GetModify_BossChildProgress() property
    {
        TMap<uint, FCommissionTargetProgress> __r;
        this.__MarkDirty(6);
        return __r;
    }
    void SetBossChildProgress(const TMap<uint, FCommissionTargetProgress> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(6);
        this.m_BossChildProgress = __Value;
        return;
    }
    uint GetPlayerObjectiveInstanceId() const property
    {
        return this.m_PlayerObjectiveInstanceId;
    }
    void SetPlayerObjectiveInstanceId(const uint __Value) property
    {
        this.m_PlayerObjectiveInstanceId = __Value;
        return;
    }
    uint GetBossObjectiveInstanceId() const property
    {
        return this.m_BossObjectiveInstanceId;
    }
    void SetBossObjectiveInstanceId(const uint __Value) property
    {
        this.m_BossObjectiveInstanceId = __Value;
        return;
    }
}

struct FCS_PVXMonsterHPDisplay : FECSSingleton
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    int m_HPPercent;

    FCS_PVXMonsterHPDisplay()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FCS_PVXMonsterHPDisplay(const FCS_PVXMonsterHPDisplay &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FCS_PVXMonsterHPDisplay opAssign(const FCS_PVXMonsterHPDisplay &inout Other)
    {
        FCS_PVXMonsterHPDisplay __r;
        this.SetHPPercent(Other.GetHPPercent());
        return __r;
    }
    int GetHPPercent() const property
    {
        return this.m_HPPercent;
    }
    void SetHPPercent(const int __Value) property
    {
        if (this.m_HPPercent == __Value)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_HPPercent = __Value;
        return;
    }
}

namespace ECSFunc_FCS_PVXPhaseState
{
UFUNCTION()
bool HasPVXPhaseState(const FECSWorldPtr &inout World)
{
    return ECSInternal::Has(World, ENTITY_ID_NULL, FCS_PVXPhaseState);
}
FCS_PVXPhaseState& AssignPVXPhaseState(const FECSWorldPtr &inout World, const FCS_PVXPhaseState &inout DefaultValue = FCS_PVXPhaseState())
{
    UScriptStruct local_6 = FCS_PVXPhaseState;
    FECSComponentPtr local_8;
    int local_10 = local_8 = ECSInternal::Assign(World, ENTITY_ID_NULL, local_6, FECSComponentPtr(DefaultValue));
    local_10.InternalSet(local_8);
    return local_10.GetComp();
}
UFUNCTION()
void AssignPVXPhaseState_BP(const FECSWorldPtr &inout World, const FCS_PVXPhaseState &inout DefaultValue = FCS_PVXPhaseState())
{
    ECSFunc_FCS_PVXPhaseState::AssignPVXPhaseState(World, DefaultValue);
    return;
}
FCS_PVXPhaseState& ModifyPVXPhaseState(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_PVXPhaseState;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Modify(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
FCS_PVXPhaseState& ModifyOrAddPVXPhaseState(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_PVXPhaseState;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::ModifyOrAdd(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
const FCS_PVXPhaseState& GetPVXPhaseState(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_PVXPhaseState;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Get(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
UFUNCTION()
FCS_PVXPhaseState GetPVXPhaseState_BP(const FECSWorldPtr &inout World, bool &out bValid)
{
    bValid = false;
    const FCS_PVXPhaseState& local_4 = ECSFunc_FCS_PVXPhaseState::GetPVXPhaseState(World);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FCS_PVXPhaseState();
}
const FCS_PVXPhaseState GetDefaultedPVXPhaseState(const FECSWorldPtr &inout World)
{
    int local_10 = 0;
    const FCS_PVXPhaseState __r;
    FECSComponentPtr local_6 = ECSInternal::GetDefaulted(World, ENTITY_ID_NULL, FCS_PVXPhaseState);
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
FCS_PVXPhaseState GetDefaultedPVXPhaseState_BP(const FECSWorldPtr &inout World)
{
    return ECSFunc_FCS_PVXPhaseState::GetDefaultedPVXPhaseState(World);
}
UFUNCTION()
bool RemovePVXPhaseState(const FECSWorldPtr &inout World)
{
    return ECSInternal::Remove(World, ENTITY_ID_NULL, FCS_PVXPhaseState);
}
}
void __MonitorPVXPhaseStateLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FCS_PVXPhaseState, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPVXPhaseStateActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FCS_PVXPhaseState, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPVXPhaseStateModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FCS_PVXPhaseState, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FCS_PVXMonsterHPDisplay
{
UFUNCTION()
bool HasPVXMonsterHPDisplay(const FECSWorldPtr &inout World)
{
    return ECSInternal::Has(World, ENTITY_ID_NULL, FCS_PVXMonsterHPDisplay);
}
FCS_PVXMonsterHPDisplay& AssignPVXMonsterHPDisplay(const FECSWorldPtr &inout World, const FCS_PVXMonsterHPDisplay &inout DefaultValue = FCS_PVXMonsterHPDisplay())
{
    UScriptStruct local_6 = FCS_PVXMonsterHPDisplay;
    FECSComponentPtr local_8;
    int local_10 = local_8 = ECSInternal::Assign(World, ENTITY_ID_NULL, local_6, FECSComponentPtr(DefaultValue));
    local_10.InternalSet(local_8);
    return local_10.GetComp();
}
UFUNCTION()
void AssignPVXMonsterHPDisplay_BP(const FECSWorldPtr &inout World, const FCS_PVXMonsterHPDisplay &inout DefaultValue = FCS_PVXMonsterHPDisplay())
{
    ECSFunc_FCS_PVXMonsterHPDisplay::AssignPVXMonsterHPDisplay(World, DefaultValue);
    return;
}
FCS_PVXMonsterHPDisplay& ModifyPVXMonsterHPDisplay(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_PVXMonsterHPDisplay;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Modify(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
FCS_PVXMonsterHPDisplay& ModifyOrAddPVXMonsterHPDisplay(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_PVXMonsterHPDisplay;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::ModifyOrAdd(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
const FCS_PVXMonsterHPDisplay& GetPVXMonsterHPDisplay(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_PVXMonsterHPDisplay;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Get(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
UFUNCTION()
FCS_PVXMonsterHPDisplay GetPVXMonsterHPDisplay_BP(const FECSWorldPtr &inout World, bool &out bValid)
{
    bValid = false;
    const FCS_PVXMonsterHPDisplay& local_4 = ECSFunc_FCS_PVXMonsterHPDisplay::GetPVXMonsterHPDisplay(World);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FCS_PVXMonsterHPDisplay();
}
const FCS_PVXMonsterHPDisplay GetDefaultedPVXMonsterHPDisplay(const FECSWorldPtr &inout World)
{
    int local_10 = 0;
    const FCS_PVXMonsterHPDisplay __r;
    FECSComponentPtr local_6 = ECSInternal::GetDefaulted(World, ENTITY_ID_NULL, FCS_PVXMonsterHPDisplay);
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
FCS_PVXMonsterHPDisplay GetDefaultedPVXMonsterHPDisplay_BP(const FECSWorldPtr &inout World)
{
    return ECSFunc_FCS_PVXMonsterHPDisplay::GetDefaultedPVXMonsterHPDisplay(World);
}
UFUNCTION()
bool RemovePVXMonsterHPDisplay(const FECSWorldPtr &inout World)
{
    return ECSInternal::Remove(World, ENTITY_ID_NULL, FCS_PVXMonsterHPDisplay);
}
}
void __MonitorPVXMonsterHPDisplayLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FCS_PVXMonsterHPDisplay, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPVXMonsterHPDisplayActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FCS_PVXMonsterHPDisplay, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPVXMonsterHPDisplayModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FCS_PVXMonsterHPDisplay, bFixedFrame, Details);
    return;
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FCS_PVXPhaseState &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FCS_PVXPhaseState &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FCS_PVXPhaseState &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FCS_PVXPhaseState
{
int __IndexOf_ActiveObjective()
{
    return 0;
}
int __IndexOf_PlayerObjective()
{
    return 1;
}
int __IndexOf_BossObjective()
{
    return 2;
}
int __IndexOf_PlayerProgress()
{
    return 3;
}
int __IndexOf_BossProgress()
{
    return 4;
}
int __IndexOf_PlayerChildProgress()
{
    return 5;
}
int __IndexOf_BossChildProgress()
{
    return 6;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FCS_PVXMonsterHPDisplay &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FCS_PVXMonsterHPDisplay &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FCS_PVXMonsterHPDisplay &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FCS_PVXMonsterHPDisplay
{
int __IndexOf_HPPercent()
{
    return 0;
}
}
