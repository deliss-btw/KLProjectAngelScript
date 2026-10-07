
namespace FPlayerSpawnerTeamIndex
{
    const uint8 PVEPlayerDefaultTeam = 1;
}
namespace __INTENRAL_FC_PlayerSpawner_NS
{
    const TECSComponentDerivedPtr<FC_PlayerSpawner> DerivedPtr = TECSComponentDerivedPtr<FC_PlayerSpawner>();
    const FC_PlayerSpawner DefaultValue = FC_PlayerSpawner();
}
namespace __INTENRAL_FCS_PlayerSpawners_NS
{
    const TECSComponentDerivedPtr<FCS_PlayerSpawners> DerivedPtr = TECSComponentDerivedPtr<FCS_PlayerSpawners>();
    const FCS_PlayerSpawners DefaultValue = FCS_PlayerSpawners();
}
namespace __INTENRAL_FCS_PlayerSpawnerIndex_NS
{
    const TECSComponentDerivedPtr<FCS_PlayerSpawnerIndex> DerivedPtr = TECSComponentDerivedPtr<FCS_PlayerSpawnerIndex>();
    const FCS_PlayerSpawnerIndex DefaultValue = FCS_PlayerSpawnerIndex();
}
namespace __INTENRAL_FCS_TeamLastSpawnPoint_NS
{
    const TECSComponentDerivedPtr<FCS_TeamLastSpawnPoint> DerivedPtr = TECSComponentDerivedPtr<FCS_TeamLastSpawnPoint>();
    const FCS_TeamLastSpawnPoint DefaultValue = FCS_TeamLastSpawnPoint();
}
namespace __INTENRAL_FCS_TeamSpawnPointBalance_NS
{
    const TECSComponentDerivedPtr<FCS_TeamSpawnPointBalance> DerivedPtr = TECSComponentDerivedPtr<FCS_TeamSpawnPointBalance>();
    const FCS_TeamSpawnPointBalance DefaultValue = FCS_TeamSpawnPointBalance();

}
struct FC_PlayerSpawner : FECSComponent
{
    UPROPERTY()
    TArray<int> Team;
    UPROPERTY()
    int SpawnerGroupID;
    UPROPERTY()
    FString Name;
    UPROPERTY()
    TSet<TSoftClassPtr<UKLGameModeSettings>> SupportGameModes;


}

struct FTeamSpawners
{
    UPROPERTY()
    TArray<FECSEntityId> m_Spawners;

    FTeamSpawners()
    {
        return;
    }
    const TArray<FECSEntityId> GetSpawners() const property
    {
        const TArray<FECSEntityId> __r;
        return __r;
    }
    TArray<FECSEntityId> GetSpawners() property
    {
        TArray<FECSEntityId> __r;
        return __r;
    }
    void SetSpawners(const TArray<FECSEntityId> &inout __Value) property
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
}

struct FCS_PlayerSpawners : FECSSingleton
{
    UPROPERTY()
    TArray<FECSEntity> Spawners;

    FCS_PlayerSpawners()
    {
        return;
    }
}

struct FCS_PlayerSpawnerIndex : FECSSingleton
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    TMap<int, FTeamSpawners> m_TeamSpawners;
    UPROPERTY()
    TMap<int, int> m_TeamGroupMap;

    FCS_PlayerSpawnerIndex()
    {
        this.__InitDirtyFlags();
        return;
    }
    FCS_PlayerSpawnerIndex(const FCS_PlayerSpawnerIndex &inout Other)
    {
        this.__InitDirtyFlags();
        this.m_TeamSpawners = Other.m_TeamSpawners;
        this.m_TeamGroupMap = Other.m_TeamGroupMap;
        return;
    }
    FCS_PlayerSpawnerIndex opAssign(const FCS_PlayerSpawnerIndex &inout Other)
    {
        FCS_PlayerSpawnerIndex __r;
        this.SetTeamSpawners(Other.GetTeamSpawners());
        this.SetTeamGroupMap(Other.GetTeamGroupMap());
        return __r;
    }
    TArray<FECSEntityId> GetTeamSpawners(const int Team) const
    {
        if (!(this.GetTeamSpawners().Contains(Team)))
        {
            return TArray<FECSEntityId>();
        }
        TArray<FECSEntityId> local_10;
        const TMap<int, FTeamSpawners>& local_12 = this.GetTeamSpawners();
        const TArray<FECSEntityId>& local_14 = local_12[Team].GetSpawners();
        for (auto& local_28 : local_14)
        {
            if (!(FECSEntity(local_28).IsActive()))
            {
                continue;
            }
            local_10.Add(local_28);
        }
        return local_10;
    }
    TArray<FECSEntityId> GetAllSpawners() const
    {
        TArray<FECSEntityId> local_4;
        for (auto& local_24 : this.GetTeamSpawners())
        {
            local_24;
            for (auto& local_38 : GetSpawners())
            {
                local_4.AddUnique(local_38);
            }
        }
        return local_4;
    }
    TArray<FECSEntityId> GetRandomTeamSpawnersByRandomGroup(const int Team)
    {
        Has local_26;
        int local_28;
        Get local_32;
        TArray<FECSEntityId> local_8 = this.GetTeamSpawners(Team);
        if (local_8.Num() == 0)
        {
            return local_8;
        }
        TArray<int> local_16;
        int local_17 = 0;
        for (; local_17 < local_8.Num(); ++local_17)
        {
            if (!(FECSEntity(local_8[local_17]).IsActive()) || !(local_26.opCall()))
            {
                continue;
            }
            local_28 = local_32.opCall().SpawnerGroupID;
            if (!(local_16.Contains(local_28)))
            {
                local_16.Add(local_28);
            }
        }
        if (local_16.Num() == 0)
        {
            return local_8;
        }
        int local_17_2 = 0;
        if (!(this.GetTeamGroupMap().Contains(Team)))
        {
            this.GetModify_TeamGroupMap().Add(Team, local_16[FMath::RandRange(0, (local_16.Num() - 1))]);
        }
        else
        {
            local_17_2 = this.GetTeamGroupMap()[Team];
        }
        TArray<FECSEntityId> local_38;
        local_28 = 0;
        for (; local_28 < local_8.Num(); ++local_28)
        {
            if (!(FECSEntity(local_8[local_28]).IsActive()) || !(local_26.opCall()))
            {
                continue;
            }
            if (local_32.opCall().SpawnerGroupID == local_17_2)
            {
                local_38.Add(local_8[local_28]);
            }
        }
        return local_38;
    }
    TMap<int, FTeamSpawners> GetTeamSpawners() const property
    {
        TMap<int, FTeamSpawners> __r;
        return __r;
    }
    TMap<int, FTeamSpawners> GetModify_TeamSpawners() property
    {
        TMap<int, FTeamSpawners> __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetTeamSpawners(const TMap<int, FTeamSpawners> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_TeamSpawners = __Value;
        return;
    }
    const TMap<int, int> GetTeamGroupMap() const property
    {
        const TMap<int, int> __r;
        return __r;
    }
    TMap<int, int> GetModify_TeamGroupMap() property
    {
        TMap<int, int> __r;
        this.__MarkDirty(1);
        return __r;
    }
    void SetTeamGroupMap(const TMap<int, int> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_TeamGroupMap = __Value;
        return;
    }
}

struct FCS_TeamLastSpawnPoint : FECSSingleton
{
    UPROPERTY()
    TMap<int, FECSEntityId> LastSpawnPoint;

    FCS_TeamLastSpawnPoint()
    {
        return;
    }
}

struct FCS_TeamSpawnPointBalance : FECSSingleton
{
    UPROPERTY()
    TMap<uint64, int> TeamSpawnerPickCount;

    FCS_TeamSpawnPointBalance()
    {
        return;
    }
}

struct FT_PlayerSpawner : FECSTrait
{
    FECSTrait _base_FECSTrait;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_PlayerSpawner_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_PlayerSpawner, NAME_None);
    UPROPERTY()
    FC_PlayerSpawner Config_FC_PlayerSpawner;

    FT_PlayerSpawner()
    {
        return;
    }
}

struct FT_PlayerSpawnerSelectable : FECSTrait
{
    FECSTrait _base_FECSTrait;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_PlayerSpawner_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_PlayerSpawner, NAME_None);
    UPROPERTY()
    FC_PlayerSpawner Config_FC_PlayerSpawner;

    FT_PlayerSpawnerSelectable()
    {
        return;
    }
}

namespace ECSFunc_FC_PlayerSpawner
{
UFUNCTION()
bool HasPlayerSpawner(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_PlayerSpawner);
}
FC_PlayerSpawner& AssignPlayerSpawner(const FECSEntity &inout Entity, const FC_PlayerSpawner &inout DefaultValue = FC_PlayerSpawner())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_PlayerSpawner, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignPlayerSpawner_BP(const FECSEntity &inout Entity, const FC_PlayerSpawner &inout DefaultValue = FC_PlayerSpawner())
{
    ECSFunc_FC_PlayerSpawner::AssignPlayerSpawner(Entity, DefaultValue);
    return;
}
FC_PlayerSpawner& ModifyPlayerSpawner(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_PlayerSpawner));
    return local_12.GetComp();
}
FC_PlayerSpawner& ModifyOrAddPlayerSpawner(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_PlayerSpawner));
    return local_12.GetComp();
}
const FC_PlayerSpawner& GetPlayerSpawner(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_PlayerSpawner));
    return local_12.GetComp();
}
UFUNCTION()
FC_PlayerSpawner GetPlayerSpawner_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_PlayerSpawner __r;
    bValid = false;
    bValid = ECSFunc_FC_PlayerSpawner::GetPlayerSpawner(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_PlayerSpawner GetDefaultedPlayerSpawner(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_PlayerSpawner __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_PlayerSpawner);
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
FC_PlayerSpawner GetDefaultedPlayerSpawner_BP(const FECSEntity &inout Entity)
{
    FC_PlayerSpawner __r;
    return __r;
}
UFUNCTION()
bool RemovePlayerSpawner(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_PlayerSpawner);
}
}
FECSMonitorRuntimeView __GetMonitorPlayerSpawnerOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_PlayerSpawner, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPlayerSpawnerOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_PlayerSpawner, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPlayerSpawnerOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_PlayerSpawner, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPlayerSpawnerOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_PlayerSpawner, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPlayerSpawnerOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_PlayerSpawner, bFixedFrame, bMustHandleAll);
}
void __MonitorPlayerSpawnerLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_PlayerSpawner, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPlayerSpawnerActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_PlayerSpawner, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPlayerSpawnerModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_PlayerSpawner, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FCS_PlayerSpawners
{
UFUNCTION()
bool HasPlayerSpawners(const FECSWorldPtr &inout World)
{
    return ECSInternal::Has(World, ENTITY_ID_NULL, FCS_PlayerSpawners);
}
FCS_PlayerSpawners& AssignPlayerSpawners(const FECSWorldPtr &inout World, const FCS_PlayerSpawners &inout DefaultValue = FCS_PlayerSpawners())
{
    UScriptStruct local_6 = FCS_PlayerSpawners;
    FECSComponentPtr local_8;
    int local_10 = local_8 = ECSInternal::Assign(World, ENTITY_ID_NULL, local_6, FECSComponentPtr(DefaultValue));
    local_10.InternalSet(local_8);
    return local_10.GetComp();
}
UFUNCTION()
void AssignPlayerSpawners_BP(const FECSWorldPtr &inout World, const FCS_PlayerSpawners &inout DefaultValue = FCS_PlayerSpawners())
{
    ECSFunc_FCS_PlayerSpawners::AssignPlayerSpawners(World, DefaultValue);
    return;
}
FCS_PlayerSpawners& ModifyPlayerSpawners(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_PlayerSpawners;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Modify(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
FCS_PlayerSpawners& ModifyOrAddPlayerSpawners(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_PlayerSpawners;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::ModifyOrAdd(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
const FCS_PlayerSpawners& GetPlayerSpawners(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_PlayerSpawners;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Get(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
UFUNCTION()
FCS_PlayerSpawners GetPlayerSpawners_BP(const FECSWorldPtr &inout World, bool &out bValid)
{
    FCS_PlayerSpawners __r;
    bValid = false;
    bValid = ECSFunc_FCS_PlayerSpawners::GetPlayerSpawners(World);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FCS_PlayerSpawners GetDefaultedPlayerSpawners(const FECSWorldPtr &inout World)
{
    int local_10 = 0;
    const FCS_PlayerSpawners __r;
    FECSComponentPtr local_6 = ECSInternal::GetDefaulted(World, ENTITY_ID_NULL, FCS_PlayerSpawners);
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
FCS_PlayerSpawners GetDefaultedPlayerSpawners_BP(const FECSWorldPtr &inout World)
{
    FCS_PlayerSpawners __r;
    return __r;
}
UFUNCTION()
bool RemovePlayerSpawners(const FECSWorldPtr &inout World)
{
    return ECSInternal::Remove(World, ENTITY_ID_NULL, FCS_PlayerSpawners);
}
}
void __MonitorPlayerSpawnersLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FCS_PlayerSpawners, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPlayerSpawnersActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FCS_PlayerSpawners, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPlayerSpawnersModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FCS_PlayerSpawners, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FCS_PlayerSpawnerIndex
{
UFUNCTION()
bool HasPlayerSpawnerIndex(const FECSWorldPtr &inout World)
{
    return ECSInternal::Has(World, ENTITY_ID_NULL, FCS_PlayerSpawnerIndex);
}
FCS_PlayerSpawnerIndex& AssignPlayerSpawnerIndex(const FECSWorldPtr &inout World, const FCS_PlayerSpawnerIndex &inout DefaultValue = FCS_PlayerSpawnerIndex())
{
    UScriptStruct local_6 = FCS_PlayerSpawnerIndex;
    FECSComponentPtr local_8;
    int local_10 = local_8 = ECSInternal::Assign(World, ENTITY_ID_NULL, local_6, FECSComponentPtr(DefaultValue));
    local_10.InternalSet(local_8);
    return local_10.GetComp();
}
UFUNCTION()
void AssignPlayerSpawnerIndex_BP(const FECSWorldPtr &inout World, const FCS_PlayerSpawnerIndex &inout DefaultValue = FCS_PlayerSpawnerIndex())
{
    ECSFunc_FCS_PlayerSpawnerIndex::AssignPlayerSpawnerIndex(World, DefaultValue);
    return;
}
FCS_PlayerSpawnerIndex& ModifyPlayerSpawnerIndex(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_PlayerSpawnerIndex;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Modify(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
FCS_PlayerSpawnerIndex& ModifyOrAddPlayerSpawnerIndex(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_PlayerSpawnerIndex;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::ModifyOrAdd(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
const FCS_PlayerSpawnerIndex& GetPlayerSpawnerIndex(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_PlayerSpawnerIndex;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Get(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
UFUNCTION()
FCS_PlayerSpawnerIndex GetPlayerSpawnerIndex_BP(const FECSWorldPtr &inout World, bool &out bValid)
{
    bValid = false;
    const FCS_PlayerSpawnerIndex& local_4 = ECSFunc_FCS_PlayerSpawnerIndex::GetPlayerSpawnerIndex(World);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FCS_PlayerSpawnerIndex();
}
const FCS_PlayerSpawnerIndex GetDefaultedPlayerSpawnerIndex(const FECSWorldPtr &inout World)
{
    int local_10 = 0;
    const FCS_PlayerSpawnerIndex __r;
    FECSComponentPtr local_6 = ECSInternal::GetDefaulted(World, ENTITY_ID_NULL, FCS_PlayerSpawnerIndex);
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
FCS_PlayerSpawnerIndex GetDefaultedPlayerSpawnerIndex_BP(const FECSWorldPtr &inout World)
{
    return ECSFunc_FCS_PlayerSpawnerIndex::GetDefaultedPlayerSpawnerIndex(World);
}
UFUNCTION()
bool RemovePlayerSpawnerIndex(const FECSWorldPtr &inout World)
{
    return ECSInternal::Remove(World, ENTITY_ID_NULL, FCS_PlayerSpawnerIndex);
}
}
void __MonitorPlayerSpawnerIndexLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FCS_PlayerSpawnerIndex, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPlayerSpawnerIndexActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FCS_PlayerSpawnerIndex, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPlayerSpawnerIndexModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FCS_PlayerSpawnerIndex, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FCS_TeamLastSpawnPoint
{
UFUNCTION()
bool HasTeamLastSpawnPoint(const FECSWorldPtr &inout World)
{
    return ECSInternal::Has(World, ENTITY_ID_NULL, FCS_TeamLastSpawnPoint);
}
FCS_TeamLastSpawnPoint& AssignTeamLastSpawnPoint(const FECSWorldPtr &inout World, const FCS_TeamLastSpawnPoint &inout DefaultValue = FCS_TeamLastSpawnPoint())
{
    UScriptStruct local_6 = FCS_TeamLastSpawnPoint;
    FECSComponentPtr local_8;
    int local_10 = local_8 = ECSInternal::Assign(World, ENTITY_ID_NULL, local_6, FECSComponentPtr(DefaultValue));
    local_10.InternalSet(local_8);
    return local_10.GetComp();
}
UFUNCTION()
void AssignTeamLastSpawnPoint_BP(const FECSWorldPtr &inout World, const FCS_TeamLastSpawnPoint &inout DefaultValue = FCS_TeamLastSpawnPoint())
{
    ECSFunc_FCS_TeamLastSpawnPoint::AssignTeamLastSpawnPoint(World, DefaultValue);
    return;
}
FCS_TeamLastSpawnPoint& ModifyTeamLastSpawnPoint(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_TeamLastSpawnPoint;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Modify(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
FCS_TeamLastSpawnPoint& ModifyOrAddTeamLastSpawnPoint(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_TeamLastSpawnPoint;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::ModifyOrAdd(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
const FCS_TeamLastSpawnPoint& GetTeamLastSpawnPoint(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_TeamLastSpawnPoint;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Get(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
UFUNCTION()
FCS_TeamLastSpawnPoint GetTeamLastSpawnPoint_BP(const FECSWorldPtr &inout World, bool &out bValid)
{
    FCS_TeamLastSpawnPoint __r;
    bValid = false;
    bValid = ECSFunc_FCS_TeamLastSpawnPoint::GetTeamLastSpawnPoint(World);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FCS_TeamLastSpawnPoint GetDefaultedTeamLastSpawnPoint(const FECSWorldPtr &inout World)
{
    int local_10 = 0;
    const FCS_TeamLastSpawnPoint __r;
    FECSComponentPtr local_6 = ECSInternal::GetDefaulted(World, ENTITY_ID_NULL, FCS_TeamLastSpawnPoint);
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
FCS_TeamLastSpawnPoint GetDefaultedTeamLastSpawnPoint_BP(const FECSWorldPtr &inout World)
{
    FCS_TeamLastSpawnPoint __r;
    return __r;
}
UFUNCTION()
bool RemoveTeamLastSpawnPoint(const FECSWorldPtr &inout World)
{
    return ECSInternal::Remove(World, ENTITY_ID_NULL, FCS_TeamLastSpawnPoint);
}
}
void __MonitorTeamLastSpawnPointLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FCS_TeamLastSpawnPoint, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorTeamLastSpawnPointActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FCS_TeamLastSpawnPoint, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorTeamLastSpawnPointModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FCS_TeamLastSpawnPoint, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FCS_TeamSpawnPointBalance
{
UFUNCTION()
bool HasTeamSpawnPointBalance(const FECSWorldPtr &inout World)
{
    return ECSInternal::Has(World, ENTITY_ID_NULL, FCS_TeamSpawnPointBalance);
}
FCS_TeamSpawnPointBalance& AssignTeamSpawnPointBalance(const FECSWorldPtr &inout World, const FCS_TeamSpawnPointBalance &inout DefaultValue = FCS_TeamSpawnPointBalance())
{
    UScriptStruct local_6 = FCS_TeamSpawnPointBalance;
    FECSComponentPtr local_8;
    int local_10 = local_8 = ECSInternal::Assign(World, ENTITY_ID_NULL, local_6, FECSComponentPtr(DefaultValue));
    local_10.InternalSet(local_8);
    return local_10.GetComp();
}
UFUNCTION()
void AssignTeamSpawnPointBalance_BP(const FECSWorldPtr &inout World, const FCS_TeamSpawnPointBalance &inout DefaultValue = FCS_TeamSpawnPointBalance())
{
    ECSFunc_FCS_TeamSpawnPointBalance::AssignTeamSpawnPointBalance(World, DefaultValue);
    return;
}
FCS_TeamSpawnPointBalance& ModifyTeamSpawnPointBalance(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_TeamSpawnPointBalance;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Modify(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
FCS_TeamSpawnPointBalance& ModifyOrAddTeamSpawnPointBalance(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_TeamSpawnPointBalance;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::ModifyOrAdd(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
const FCS_TeamSpawnPointBalance& GetTeamSpawnPointBalance(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_TeamSpawnPointBalance;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Get(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
UFUNCTION()
FCS_TeamSpawnPointBalance GetTeamSpawnPointBalance_BP(const FECSWorldPtr &inout World, bool &out bValid)
{
    FCS_TeamSpawnPointBalance __r;
    bValid = false;
    bValid = ECSFunc_FCS_TeamSpawnPointBalance::GetTeamSpawnPointBalance(World);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FCS_TeamSpawnPointBalance GetDefaultedTeamSpawnPointBalance(const FECSWorldPtr &inout World)
{
    int local_10 = 0;
    const FCS_TeamSpawnPointBalance __r;
    FECSComponentPtr local_6 = ECSInternal::GetDefaulted(World, ENTITY_ID_NULL, FCS_TeamSpawnPointBalance);
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
FCS_TeamSpawnPointBalance GetDefaultedTeamSpawnPointBalance_BP(const FECSWorldPtr &inout World)
{
    FCS_TeamSpawnPointBalance __r;
    return __r;
}
UFUNCTION()
bool RemoveTeamSpawnPointBalance(const FECSWorldPtr &inout World)
{
    return ECSInternal::Remove(World, ENTITY_ID_NULL, FCS_TeamSpawnPointBalance);
}
}
void __MonitorTeamSpawnPointBalanceLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FCS_TeamSpawnPointBalance, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorTeamSpawnPointBalanceActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FCS_TeamSpawnPointBalance, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorTeamSpawnPointBalanceModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FCS_TeamSpawnPointBalance, bFixedFrame, Details);
    return;
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FCS_PlayerSpawnerIndex &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FCS_PlayerSpawnerIndex &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FCS_PlayerSpawnerIndex &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FCS_PlayerSpawnerIndex
{
int __IndexOf_TeamSpawners()
{
    return 0;
}
int __IndexOf_TeamGroupMap()
{
    return 1;
}
}
