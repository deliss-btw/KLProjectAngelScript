
enum ECommissionPlayerStatsType
{
    DamageToHP,
    HealToHP,
    MutualClashCount,
    BodyPartDestroy,
    NearDeathCount,
    DeathCount,
    NearDeathAndDeathCount,
    BeHitDamageCount,
    HealLowHPTeammateCount,
    ParryCount,
    BlockCount,
    CatchRescueCount,
    BreakMonsterInvisiableCount,
    BreakMonsterDefenceCount,
    BreakMonsterInAirCount,
    UsePropItemCount,
    SendChatCount,
    RescueTeammateCount,
}

enum EBreakSpecialState
{
    BreakInvisiable,
    BreakInAir,
    BreakDefence,
}

namespace __INTENRAL_FC_CommissionPlayerStats_NS
{
    const TECSComponentDerivedPtr<FC_CommissionPlayerStats> DerivedPtr = TECSComponentDerivedPtr<FC_CommissionPlayerStats>();
    const FC_CommissionPlayerStats DefaultValue = FC_CommissionPlayerStats();
}
namespace __INTENRAL_FCE_CommissionPlayerStatsUpdatedEvent_NS
{
    const TECSEventDerivedPtr<FCE_CommissionPlayerStatsUpdatedEvent> DerivedPtr = TECSEventDerivedPtr<FCE_CommissionPlayerStatsUpdatedEvent>();
}
namespace __INTENRAL_FCE_CommissionBreakSpecialStateEvent_NS
{
    const TECSEventDerivedPtr<FCE_CommissionBreakSpecialStateEvent> DerivedPtr = TECSEventDerivedPtr<FCE_CommissionBreakSpecialStateEvent>();
}
namespace __INTENRAL_FCE_CommissionAbnormalBuffAddedEvent_NS
{
    const TECSEventDerivedPtr<FCE_CommissionAbnormalBuffAddedEvent> DerivedPtr = TECSEventDerivedPtr<FCE_CommissionAbnormalBuffAddedEvent>();
}
namespace __INTENRAL_FCE_CommissionCustomNameEvent_NS
{
    const TECSEventDerivedPtr<FCE_CommissionCustomNameEvent> DerivedPtr = TECSEventDerivedPtr<FCE_CommissionCustomNameEvent>();

}
struct FCE_CommissionPlayerStatsUpdatedEvent : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    ECommissionPlayerStatsType PlayerStatsType;


}

struct FC_CommissionPlayerStats : FECSComponent
{
    UPROPERTY()
    float32 DamageToHP;
    UPROPERTY()
    float32 HealToHP;
    UPROPERTY()
    int MutualClashCount;
    UPROPERTY()
    int BodyPartDestroy;
    UPROPERTY()
    int NearDeathCount;
    UPROPERTY()
    int DeathCount;
    UPROPERTY()
    int NearDeathAndDeathCount;
    UPROPERTY()
    int BeHitDamageCount;
    UPROPERTY()
    int HealLowHPTeammateCount;
    UPROPERTY()
    int ParryCount;
    UPROPERTY()
    int BlockCount;
    UPROPERTY()
    int CatchRescueCount;
    UPROPERTY()
    int BreakMonsterInvisiableCount;
    UPROPERTY()
    int BreakMonsterDefenceCount;
    UPROPERTY()
    int BreakMonsterInAirCount;
    UPROPERTY()
    int UsePropItemCount;
    UPROPERTY()
    int SendChatCount;
    UPROPERTY()
    int RescueTeammateCount;


    int GetPlayerStatsValue(const ECommissionPlayerStatsType PlayerStatsType) const
    {
        int local_1 = int(PlayerStatsType);
        switch (local_1)
        {
        case 0:
        {
            return uint(int(this.DamageToHP));
        }
        case 1:
        {
            return uint(int(this.HealToHP));
        }
        case 2:
        {
            return this.MutualClashCount;
        }
        case 3:
        {
            return this.BodyPartDestroy;
        }
        case 4:
        {
            return this.NearDeathCount;
        }
        case 5:
        {
            return this.DeathCount;
        }
        case 6:
        {
            return this.NearDeathAndDeathCount;
        }
        case 7:
        {
            return this.BeHitDamageCount;
        }
        case 8:
        {
            return this.HealLowHPTeammateCount;
        }
        case 9:
        {
            return this.ParryCount;
        }
        case 10:
        {
            return this.BlockCount;
        }
        case 11:
        {
            return this.CatchRescueCount;
        }
        case 12:
        {
            return this.BreakMonsterInvisiableCount;
        }
        case 13:
        {
            return this.BreakMonsterDefenceCount;
        }
        case 14:
        {
            return this.BreakMonsterInAirCount;
        }
        case 15:
        {
            return this.UsePropItemCount;
        }
        case 16:
        {
            return this.SendChatCount;
        }
        case 17:
        {
            return this.RescueTeammateCount;
        }
        default:
        {
            local_1 = 0;
        }
        }
        return local_1;
    }
}

struct FCE_CommissionBreakSpecialStateEvent : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    EBreakSpecialState SpecialState;
    UPROPERTY()
    FECSEntity TargetEntity;


}

struct FCE_CommissionAbnormalBuffAddedEvent : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FBuffConfigRef Buff;
    UPROPERTY()
    FECSEntity TargetEntity;

    FCE_CommissionAbnormalBuffAddedEvent()
    {
        return;
    }
}

struct FCE_CommissionCustomNameEvent : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FName CustomName;
    UPROPERTY()
    FECSEntity TargetEntity;
    UPROPERTY()
    int Count;


}

namespace ECSFunc_FC_CommissionPlayerStats
{
UFUNCTION()
bool HasCommissionPlayerStats(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_CommissionPlayerStats);
}
FC_CommissionPlayerStats& AssignCommissionPlayerStats(const FECSEntity &inout Entity, const FC_CommissionPlayerStats &inout DefaultValue = FC_CommissionPlayerStats())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_CommissionPlayerStats, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignCommissionPlayerStats_BP(const FECSEntity &inout Entity, const FC_CommissionPlayerStats &inout DefaultValue = FC_CommissionPlayerStats())
{
    ECSFunc_FC_CommissionPlayerStats::AssignCommissionPlayerStats(Entity, DefaultValue);
    return;
}
FC_CommissionPlayerStats& ModifyCommissionPlayerStats(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_CommissionPlayerStats));
    return local_12.GetComp();
}
FC_CommissionPlayerStats& ModifyOrAddCommissionPlayerStats(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_CommissionPlayerStats));
    return local_12.GetComp();
}
const FC_CommissionPlayerStats& GetCommissionPlayerStats(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_CommissionPlayerStats));
    return local_12.GetComp();
}
UFUNCTION()
FC_CommissionPlayerStats GetCommissionPlayerStats_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_CommissionPlayerStats& local_4 = ECSFunc_FC_CommissionPlayerStats::GetCommissionPlayerStats(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_CommissionPlayerStats();
}
const FC_CommissionPlayerStats GetDefaultedCommissionPlayerStats(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_CommissionPlayerStats __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_CommissionPlayerStats);
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
FC_CommissionPlayerStats GetDefaultedCommissionPlayerStats_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_CommissionPlayerStats::GetDefaultedCommissionPlayerStats(Entity);
}
UFUNCTION()
bool RemoveCommissionPlayerStats(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_CommissionPlayerStats);
}
}
FECSMonitorRuntimeView __GetMonitorCommissionPlayerStatsOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_CommissionPlayerStats, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCommissionPlayerStatsOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_CommissionPlayerStats, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCommissionPlayerStatsOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_CommissionPlayerStats, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCommissionPlayerStatsOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_CommissionPlayerStats, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCommissionPlayerStatsOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_CommissionPlayerStats, bFixedFrame, bMustHandleAll);
}
void __MonitorCommissionPlayerStatsLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_CommissionPlayerStats, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCommissionPlayerStatsActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_CommissionPlayerStats, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCommissionPlayerStatsModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_CommissionPlayerStats, bFixedFrame, Details);
    return;
}
