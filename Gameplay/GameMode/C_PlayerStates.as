
namespace __INTENRAL_FC_PlayerStates_NS
{
    const TECSComponentDerivedPtr<FC_PlayerStates> DerivedPtr = TECSComponentDerivedPtr<FC_PlayerStates>();
    const FC_PlayerStates DefaultValue = FC_PlayerStates();
}
namespace __INTENRAL_FC_PlayerBornTransform_NS
{
    const TECSComponentDerivedPtr<FC_PlayerBornTransform> DerivedPtr = TECSComponentDerivedPtr<FC_PlayerBornTransform>();
    const FC_PlayerBornTransform DefaultValue = FC_PlayerBornTransform();
}
namespace __INTENRAL_FCE_PlayerSetReady_NS
{
    const TECSEventDerivedPtr<FCE_PlayerSetReady> DerivedPtr = TECSEventDerivedPtr<FCE_PlayerSetReady>();

}
struct FC_PlayerStates : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    bool m_bReady;
    UPROPERTY()
    FECSEntity m_InitSpawnPoint;

    FC_PlayerStates()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_PlayerStates(const FC_PlayerStates &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_PlayerStates opAssign(const FC_PlayerStates &inout Other)
    {
        FC_PlayerStates __r;
        this.SetbReady(Other.GetbReady());
        this.SetInitSpawnPoint(Other.GetInitSpawnPoint());
        return __r;
    }
    bool GetbReady() const property
    {
        return this.m_bReady;
    }
    void SetbReady(const bool __Value) property
    {
        if (!(this.m_bReady) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_bReady = __Value;
        return;
    }
    const FECSEntity GetInitSpawnPoint() const property
    {
        const FECSEntity __r;
        return __r;
    }
    FECSEntity GetModify_InitSpawnPoint() property
    {
        FECSEntity __r;
        this.__MarkDirty(1);
        return __r;
    }
    void SetInitSpawnPoint(const FECSEntity &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_InitSpawnPoint = __Value;
        return;
    }
}

struct FC_PlayerBornTransform : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    FVector m_Location;
    UPROPERTY()
    FRotator m_Rotation;

    FC_PlayerBornTransform()
    {
        this.__InitDirtyFlags();
        return;
    }
    FC_PlayerBornTransform(const FC_PlayerBornTransform &inout Other)
    {
        this.__InitDirtyFlags();
        this.m_Location = Other.m_Location;
        this.m_Rotation = Other.m_Rotation;
        return;
    }
    FC_PlayerBornTransform opAssign(const FC_PlayerBornTransform &inout Other)
    {
        FC_PlayerBornTransform __r;
        this.SetLocation(Other.GetLocation());
        this.SetRotation(Other.GetRotation());
        return __r;
    }
    FVector GetLocation() const property
    {
        FVector __r;
        return __r;
    }
    FVector GetModify_Location() property
    {
        FVector __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetLocation(const FVector &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_Location = __Value;
        return;
    }
    FRotator GetRotation() const property
    {
        FRotator __r;
        return __r;
    }
    FRotator GetModify_Rotation() property
    {
        FRotator __r;
        this.__MarkDirty(1);
        return __r;
    }
    void SetRotation(const FRotator &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_Rotation = __Value;
        return;
    }
}

struct FCE_PlayerSetReady : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    bool bReady = false;


    bool Validate() const
    {
        Has local_4;
        return local_4.opCall();
    }
}

namespace ECSFunc_FC_PlayerStates
{
UFUNCTION()
bool HasPlayerStates(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_PlayerStates);
}
FC_PlayerStates& AssignPlayerStates(const FECSEntity &inout Entity, const FC_PlayerStates &inout DefaultValue = FC_PlayerStates())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_PlayerStates, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignPlayerStates_BP(const FECSEntity &inout Entity, const FC_PlayerStates &inout DefaultValue = FC_PlayerStates())
{
    ECSFunc_FC_PlayerStates::AssignPlayerStates(Entity, DefaultValue);
    return;
}
FC_PlayerStates& ModifyPlayerStates(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_PlayerStates));
    return local_12.GetComp();
}
FC_PlayerStates& ModifyOrAddPlayerStates(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_PlayerStates));
    return local_12.GetComp();
}
const FC_PlayerStates& GetPlayerStates(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_PlayerStates));
    return local_12.GetComp();
}
UFUNCTION()
FC_PlayerStates GetPlayerStates_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_PlayerStates& local_4 = ECSFunc_FC_PlayerStates::GetPlayerStates(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_PlayerStates();
}
const FC_PlayerStates GetDefaultedPlayerStates(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_PlayerStates __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_PlayerStates);
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
FC_PlayerStates GetDefaultedPlayerStates_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_PlayerStates::GetDefaultedPlayerStates(Entity);
}
UFUNCTION()
bool RemovePlayerStates(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_PlayerStates);
}
}
FECSMonitorRuntimeView __GetMonitorPlayerStatesOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_PlayerStates, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPlayerStatesOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_PlayerStates, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPlayerStatesOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_PlayerStates, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPlayerStatesOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_PlayerStates, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPlayerStatesOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_PlayerStates, bFixedFrame, bMustHandleAll);
}
void __MonitorPlayerStatesLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_PlayerStates, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPlayerStatesActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_PlayerStates, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPlayerStatesModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_PlayerStates, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_PlayerBornTransform
{
UFUNCTION()
bool HasPlayerBornTransform(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_PlayerBornTransform);
}
FC_PlayerBornTransform& AssignPlayerBornTransform(const FECSEntity &inout Entity, const FC_PlayerBornTransform &inout DefaultValue = FC_PlayerBornTransform())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_PlayerBornTransform, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignPlayerBornTransform_BP(const FECSEntity &inout Entity, const FC_PlayerBornTransform &inout DefaultValue = FC_PlayerBornTransform())
{
    ECSFunc_FC_PlayerBornTransform::AssignPlayerBornTransform(Entity, DefaultValue);
    return;
}
FC_PlayerBornTransform& ModifyPlayerBornTransform(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_PlayerBornTransform));
    return local_12.GetComp();
}
FC_PlayerBornTransform& ModifyOrAddPlayerBornTransform(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_PlayerBornTransform));
    return local_12.GetComp();
}
const FC_PlayerBornTransform& GetPlayerBornTransform(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_PlayerBornTransform));
    return local_12.GetComp();
}
UFUNCTION()
FC_PlayerBornTransform GetPlayerBornTransform_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_PlayerBornTransform& local_4 = ECSFunc_FC_PlayerBornTransform::GetPlayerBornTransform(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_PlayerBornTransform();
}
const FC_PlayerBornTransform GetDefaultedPlayerBornTransform(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_PlayerBornTransform __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_PlayerBornTransform);
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
FC_PlayerBornTransform GetDefaultedPlayerBornTransform_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_PlayerBornTransform::GetDefaultedPlayerBornTransform(Entity);
}
UFUNCTION()
bool RemovePlayerBornTransform(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_PlayerBornTransform);
}
}
FECSMonitorRuntimeView __GetMonitorPlayerBornTransformOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_PlayerBornTransform, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPlayerBornTransformOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_PlayerBornTransform, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPlayerBornTransformOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_PlayerBornTransform, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPlayerBornTransformOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_PlayerBornTransform, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPlayerBornTransformOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_PlayerBornTransform, bFixedFrame, bMustHandleAll);
}
void __MonitorPlayerBornTransformLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_PlayerBornTransform, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPlayerBornTransformActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_PlayerBornTransform, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPlayerBornTransformModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_PlayerBornTransform, bFixedFrame, Details);
    return;
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_PlayerStates &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_PlayerStates &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_PlayerStates &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_PlayerStates
{
int __IndexOf_bReady()
{
    return 0;
}
int __IndexOf_InitSpawnPoint()
{
    return 1;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_PlayerBornTransform &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_PlayerBornTransform &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_PlayerBornTransform &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_PlayerBornTransform
{
int __IndexOf_Location()
{
    return 0;
}
int __IndexOf_Rotation()
{
    return 1;
}
}
