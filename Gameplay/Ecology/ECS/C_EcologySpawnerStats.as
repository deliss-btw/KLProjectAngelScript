
namespace __INTENRAL_FC_EcologySpawnerStats_NS
{
    const TECSComponentDerivedPtr<FC_EcologySpawnerStats> DerivedPtr = TECSComponentDerivedPtr<FC_EcologySpawnerStats>();
    const FC_EcologySpawnerStats DefaultValue = FC_EcologySpawnerStats();

}
struct FCreatureStatsEntry
{
    UPROPERTY()
    FName CreatureRowName;
    UPROPERTY()
    FECSEntityId FlockEntity;
    UPROPERTY()
    FFPTime SpawnTime;
    UPROPERTY()
    FFPTime DeathTime;
    UPROPERTY()
    FFPTime DestroyTime;
    UPROPERTY()
    bool bDeathByKill = false;
    UPROPERTY()
    bool bAlive = true;


}

struct FCreatureTypeAggregate
{
    UPROPERTY()
    int Spawned = 0;
    UPROPERTY()
    int Death = 0;
    UPROPERTY()
    int Destroyed = 0;
    UPROPERTY()
    int Alive = 0;


}

struct FC_EcologySpawnerStats : FECSComponent
{
    UPROPERTY()
    TMap<FECSEntityId, FCreatureStatsEntry> CreatureStats;
    UPROPERTY()
    int TotalSpawned = 0;
    UPROPERTY()
    int TotalDeath = 0;
    UPROPERTY()
    int TotalDestroyed = 0;
    UPROPERTY()
    int CurrentAlive = 0;
    UPROPERTY()
    int RefreshCount = 0;
    UPROPERTY()
    FFPTime FirstSpawnTime;
    UPROPERTY()
    FFPTime LastSpawnTime;
    UPROPERTY()
    FFPTime LastDeathTime;


    int GetCurrentAlive() const
    {
        return this.CurrentAlive;
    }
    void RecordSpawn(const FECSEntityId &inout CreatureId, const FName &inout RowName, const FECSEntityId &inout FlockId, const FFPTime &inout Time)
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
    }
    void RecordDeath(const FECSEntityId &inout CreatureId, const FFPTime &inout Time)
    {
        if (!(this.Contains(CreatureId)))
        {
            return;
        }
        FCreatureStatsEntry& local_4 = this[CreatureId];
        if (!(local_4.bAlive))
        {
            return;
        }
        local_4.DeathTime = Time;
        local_4.bDeathByKill = true;
        local_4.bAlive = false;
        ++this.TotalDeath;
        --this.CurrentAlive;
        this.LastDeathTime = Time;
        return;
    }
    void RecordDestroy(const FECSEntityId &inout CreatureId, const FFPTime &inout Time, const bool bAlreadyDead)
    {
        if (!(this.Contains(CreatureId)))
        {
            return;
        }
        FCreatureStatsEntry& local_4 = this[CreatureId];
        local_4.DestroyTime = Time;
        bool local_1 = !(bAlreadyDead);
        if (!(local_1))
        {
            local_1 = false;
        }
        else
        {
            local_1 = local_4.bAlive;
        }
        if (local_1)
        {
            local_4.bAlive = false;
            --this.CurrentAlive;
            ++this.TotalDestroyed;
        }
        return;
    }
    TMap<FName, FCreatureTypeAggregate> GetAggregateByType() const
    {
        TMap<FName, FCreatureTypeAggregate> local_20;
        FName local_42;
        for (auto& local_40 : this)
        {
            local_40;
            bool local_37 = !(local_20.Contains(local_42));
            if (local_37)
            {
                FCreatureTypeAggregate local_46;
                local_20.Add(local_42, local_46);
            }
            ++local_20[local_42].Spawned;
            if (local_37)
            {
                ++local_20[local_42].Death;
            }
            else
            {
                local_37 = !local_37;
                if (local_37)
                {
                    ++local_20[local_42].Destroyed;
                }
            }
            if (local_37)
            {
                ++local_20[local_42].Alive;
            }
        }
        return local_20;
    }
    TMap<FECSEntityId, FCreatureTypeAggregate> GetAggregateByFlock() const
    {
        TMap<FECSEntityId, FCreatureTypeAggregate> local_20;
        FECSEntityId local_41;
        for (auto& local_40 : this)
        {
            local_40;
            bool local_37 = !(local_20.Contains(local_41));
            if (local_37)
            {
                FCreatureTypeAggregate local_46;
                local_20.Add(local_41, local_46);
            }
            ++local_20[local_41].Spawned;
            if (local_37)
            {
                ++local_20[local_41].Death;
            }
            else
            {
                local_37 = !local_37;
                if (local_37)
                {
                    ++local_20[local_41].Destroyed;
                }
            }
            if (local_37)
            {
                ++local_20[local_41].Alive;
            }
        }
        return local_20;
    }
}

namespace ECSFunc_FC_EcologySpawnerStats
{
UFUNCTION()
bool HasEcologySpawnerStats(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_EcologySpawnerStats);
}
FC_EcologySpawnerStats& AssignEcologySpawnerStats(const FECSEntity &inout Entity, const FC_EcologySpawnerStats &inout DefaultValue = FC_EcologySpawnerStats())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_EcologySpawnerStats, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignEcologySpawnerStats_BP(const FECSEntity &inout Entity, const FC_EcologySpawnerStats &inout DefaultValue = FC_EcologySpawnerStats())
{
    ECSFunc_FC_EcologySpawnerStats::AssignEcologySpawnerStats(Entity, DefaultValue);
    return;
}
FC_EcologySpawnerStats& ModifyEcologySpawnerStats(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_EcologySpawnerStats));
    return local_12.GetComp();
}
FC_EcologySpawnerStats& ModifyOrAddEcologySpawnerStats(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_EcologySpawnerStats));
    return local_12.GetComp();
}
const FC_EcologySpawnerStats& GetEcologySpawnerStats(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_EcologySpawnerStats));
    return local_12.GetComp();
}
UFUNCTION()
FC_EcologySpawnerStats GetEcologySpawnerStats_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_EcologySpawnerStats __r;
    bValid = false;
    bValid = ECSFunc_FC_EcologySpawnerStats::GetEcologySpawnerStats(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_EcologySpawnerStats GetDefaultedEcologySpawnerStats(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_EcologySpawnerStats __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_EcologySpawnerStats);
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
FC_EcologySpawnerStats GetDefaultedEcologySpawnerStats_BP(const FECSEntity &inout Entity)
{
    FC_EcologySpawnerStats __r;
    return __r;
}
UFUNCTION()
bool RemoveEcologySpawnerStats(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_EcologySpawnerStats);
}
}
FECSMonitorRuntimeView __GetMonitorEcologySpawnerStatsOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_EcologySpawnerStats, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcologySpawnerStatsOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_EcologySpawnerStats, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcologySpawnerStatsOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_EcologySpawnerStats, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcologySpawnerStatsOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_EcologySpawnerStats, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcologySpawnerStatsOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_EcologySpawnerStats, bFixedFrame, bMustHandleAll);
}
void __MonitorEcologySpawnerStatsLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_EcologySpawnerStats, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcologySpawnerStatsActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_EcologySpawnerStats, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcologySpawnerStatsModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_EcologySpawnerStats, bFixedFrame, Details);
    return;
}
