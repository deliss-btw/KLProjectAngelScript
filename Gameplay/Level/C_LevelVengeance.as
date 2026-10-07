
namespace __INTENRAL_FC_VengeanceAvenger_NS
{
    const TECSComponentDerivedPtr<FC_VengeanceAvenger> DerivedPtr = TECSComponentDerivedPtr<FC_VengeanceAvenger>();
    const FC_VengeanceAvenger DefaultValue = FC_VengeanceAvenger();
}
namespace __INTENRAL_FC_VengeanceKiller_NS
{
    const TECSComponentDerivedPtr<FC_VengeanceKiller> DerivedPtr = TECSComponentDerivedPtr<FC_VengeanceKiller>();
    const FC_VengeanceKiller DefaultValue = FC_VengeanceKiller();
}
namespace __INTENRAL_FCE_VengeanceStart_NS
{
    const TECSEventDerivedPtr<FCE_VengeanceStart> DerivedPtr = TECSEventDerivedPtr<FCE_VengeanceStart>();
}
namespace __INTENRAL_FCE_VengeanceSuccess_NS
{
    const TECSEventDerivedPtr<FCE_VengeanceSuccess> DerivedPtr = TECSEventDerivedPtr<FCE_VengeanceSuccess>();

}
struct FCE_VengeanceStart : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FECSEntity Killer;

    FCE_VengeanceStart()
    {
        return;
    }
}

struct FCE_VengeanceSuccess : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FECSEntity Killer;
    UPROPERTY()
    FECSEntity KilledByEntity;
    UPROPERTY()
    bool bIsSenderKill = false;


}

struct FC_VengeanceAvenger : FECSComponent
{
    UPROPERTY()
    FECSEntity Killer;

    FC_VengeanceAvenger()
    {
        return;
    }
}

struct FVengeanceKillData
{
    UPROPERTY()
    FECSEntity VictimPlayer;
    UPROPERTY()
    FECSEntity Killer;
    UPROPERTY()
    int KillTimes = 0;


    void Init(const FECSEntity &inout NewVictim, const FECSEntity &inout NewKiller)
    {
        this.Killer = NewKiller;
        return;
    }
}

struct FC_VengeanceKiller : FECSComponent
{
    UPROPERTY()
    TMap<FECSEntityId, FVengeanceKillData> KillDataMap;

    FC_VengeanceKiller()
    {
        return;
    }
    void AddVictim(const FECSEntity &inout VictimPawnEntity, const FECSEntity &inout Killer)
    {
        FVengeanceKillData local_12;
        FECSEntity local_4 = ::FASCommonUtils::GetUniquePlayerEntity(VictimPawnEntity);
        FECSEntityId local_9 = local_4.GetId();
        if ((local_12.Killer == ENTITY_NULL))
        {
            local_12.Init(local_4, Killer);
        }
        ++local_12.KillTimes;
        return;
    }
    int GetTotalKillCount() const
    {
        int local_1 = 0;
        for (auto& local_22 : this)
        {
            local_22;
            local_1 = local_1 + 0;
        }
        return local_1;
    }
}

namespace ECSFunc_FC_VengeanceAvenger
{
UFUNCTION()
bool HasVengeanceAvenger(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_VengeanceAvenger);
}
FC_VengeanceAvenger& AssignVengeanceAvenger(const FECSEntity &inout Entity, const FC_VengeanceAvenger &inout DefaultValue = FC_VengeanceAvenger())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_VengeanceAvenger, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignVengeanceAvenger_BP(const FECSEntity &inout Entity, const FC_VengeanceAvenger &inout DefaultValue = FC_VengeanceAvenger())
{
    ECSFunc_FC_VengeanceAvenger::AssignVengeanceAvenger(Entity, DefaultValue);
    return;
}
FC_VengeanceAvenger& ModifyVengeanceAvenger(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_VengeanceAvenger));
    return local_12.GetComp();
}
FC_VengeanceAvenger& ModifyOrAddVengeanceAvenger(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_VengeanceAvenger));
    return local_12.GetComp();
}
const FC_VengeanceAvenger& GetVengeanceAvenger(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_VengeanceAvenger));
    return local_12.GetComp();
}
UFUNCTION()
FC_VengeanceAvenger GetVengeanceAvenger_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_VengeanceAvenger __r;
    bValid = false;
    bValid = ECSFunc_FC_VengeanceAvenger::GetVengeanceAvenger(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_VengeanceAvenger GetDefaultedVengeanceAvenger(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_VengeanceAvenger __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_VengeanceAvenger);
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
FC_VengeanceAvenger GetDefaultedVengeanceAvenger_BP(const FECSEntity &inout Entity)
{
    FC_VengeanceAvenger __r;
    return __r;
}
UFUNCTION()
bool RemoveVengeanceAvenger(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_VengeanceAvenger);
}
}
FECSMonitorRuntimeView __GetMonitorVengeanceAvengerOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_VengeanceAvenger, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorVengeanceAvengerOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_VengeanceAvenger, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorVengeanceAvengerOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_VengeanceAvenger, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorVengeanceAvengerOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_VengeanceAvenger, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorVengeanceAvengerOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_VengeanceAvenger, bFixedFrame, bMustHandleAll);
}
void __MonitorVengeanceAvengerLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_VengeanceAvenger, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorVengeanceAvengerActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_VengeanceAvenger, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorVengeanceAvengerModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_VengeanceAvenger, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_VengeanceKiller
{
UFUNCTION()
bool HasVengeanceKiller(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_VengeanceKiller);
}
FC_VengeanceKiller& AssignVengeanceKiller(const FECSEntity &inout Entity, const FC_VengeanceKiller &inout DefaultValue = FC_VengeanceKiller())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_VengeanceKiller, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignVengeanceKiller_BP(const FECSEntity &inout Entity, const FC_VengeanceKiller &inout DefaultValue = FC_VengeanceKiller())
{
    ECSFunc_FC_VengeanceKiller::AssignVengeanceKiller(Entity, DefaultValue);
    return;
}
FC_VengeanceKiller& ModifyVengeanceKiller(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_VengeanceKiller));
    return local_12.GetComp();
}
FC_VengeanceKiller& ModifyOrAddVengeanceKiller(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_VengeanceKiller));
    return local_12.GetComp();
}
const FC_VengeanceKiller& GetVengeanceKiller(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_VengeanceKiller));
    return local_12.GetComp();
}
UFUNCTION()
FC_VengeanceKiller GetVengeanceKiller_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_VengeanceKiller __r;
    bValid = false;
    bValid = ECSFunc_FC_VengeanceKiller::GetVengeanceKiller(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_VengeanceKiller GetDefaultedVengeanceKiller(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_VengeanceKiller __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_VengeanceKiller);
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
FC_VengeanceKiller GetDefaultedVengeanceKiller_BP(const FECSEntity &inout Entity)
{
    FC_VengeanceKiller __r;
    return __r;
}
UFUNCTION()
bool RemoveVengeanceKiller(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_VengeanceKiller);
}
}
FECSMonitorRuntimeView __GetMonitorVengeanceKillerOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_VengeanceKiller, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorVengeanceKillerOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_VengeanceKiller, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorVengeanceKillerOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_VengeanceKiller, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorVengeanceKillerOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_VengeanceKiller, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorVengeanceKillerOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_VengeanceKiller, bFixedFrame, bMustHandleAll);
}
void __MonitorVengeanceKillerLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_VengeanceKiller, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorVengeanceKillerActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_VengeanceKiller, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorVengeanceKillerModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_VengeanceKiller, bFixedFrame, Details);
    return;
}
