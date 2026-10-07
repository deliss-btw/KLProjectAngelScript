
namespace EntityBB
{
    const FEntityNativeBBName _TeamInfo_bIsTeamHasFakeCharacter = FEntityNativeBBName();
}
namespace __INTENRAL_FC_SpawnFakeCharacterResultComponent_NS
{
    const TECSComponentDerivedPtr<FC_SpawnFakeCharacterResultComponent> DerivedPtr = TECSComponentDerivedPtr<FC_SpawnFakeCharacterResultComponent>();
    const FC_SpawnFakeCharacterResultComponent DefaultValue = FC_SpawnFakeCharacterResultComponent();
}
namespace __INTENRAL_FC_FakeCharacterInit_NS
{
    const TECSComponentDerivedPtr<FC_FakeCharacterInit> DerivedPtr = TECSComponentDerivedPtr<FC_FakeCharacterInit>();
    const FC_FakeCharacterInit DefaultValue = FC_FakeCharacterInit();
}
namespace __INTENRAL_FC_InFakeCharacterControl_NS
{
    const TECSComponentDerivedPtr<FC_InFakeCharacterControl> DerivedPtr = TECSComponentDerivedPtr<FC_InFakeCharacterControl>();
    const FC_InFakeCharacterControl DefaultValue = FC_InFakeCharacterControl();
}
namespace __INTENRAL_FCE_SummonEvent_NS
{
    const TECSEventDerivedPtr<FCE_SummonEvent> DerivedPtr = TECSEventDerivedPtr<FCE_SummonEvent>();
}
namespace __INTENRAL_FCE_InitFakeCharacterEvent_NS
{
    const TECSEventDerivedPtr<FCE_InitFakeCharacterEvent> DerivedPtr = TECSEventDerivedPtr<FCE_InitFakeCharacterEvent>();
}
namespace __INTENRAL_FCE_FakeCharacterSyncHPEvent_NS
{
    const TECSEventDerivedPtr<FCE_FakeCharacterSyncHPEvent> DerivedPtr = TECSEventDerivedPtr<FCE_FakeCharacterSyncHPEvent>();

}
struct FC_SpawnFakeCharacterResultComponent : FECSComponent
{
    UPROPERTY()
    FECSEntity SwitchOutAvatar;
    UPROPERTY()
    FECSEntity FakeEntity;
    UPROPERTY()
    bool bSharedHP;


}

struct FC_FakeCharacterInit : FECSComponent
{
    UPROPERTY()
    FSpawnFakeCharacterExtractData ExtractData;
    UPROPERTY()
    FECSEntity SwitchOutEntity;
    UPROPERTY()
    FFPTime Time;

    FC_FakeCharacterInit()
    {
        return;
    }
}

struct FC_InFakeCharacterControl : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    FECSEntity m_SwitchOutEntity;
    UPROPERTY()
    int m_RefCount;

    FC_InFakeCharacterControl()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_InFakeCharacterControl(const FC_InFakeCharacterControl &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_InFakeCharacterControl opAssign(const FC_InFakeCharacterControl &inout Other)
    {
        FC_InFakeCharacterControl __r;
        this.SetSwitchOutEntity(Other.GetSwitchOutEntity());
        this.SetRefCount(Other.GetRefCount());
        return __r;
    }
    const FECSEntity GetSwitchOutEntity() const property
    {
        const FECSEntity __r;
        return __r;
    }
    FECSEntity GetModify_SwitchOutEntity() property
    {
        FECSEntity __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetSwitchOutEntity(const FECSEntity &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_SwitchOutEntity = __Value;
        return;
    }
    int GetRefCount() const property
    {
        return this.m_RefCount;
    }
    void SetRefCount(const int __Value) property
    {
        if (this.m_RefCount == __Value)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_RefCount = __Value;
        return;
    }
}

struct FCE_SummonEvent : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FECSEntity BeSummonedEntity;

    FCE_SummonEvent()
    {
        return;
    }
}

struct FCE_InitFakeCharacterEvent : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FECSEntity SwitchOutEntity;

    FCE_InitFakeCharacterEvent()
    {
        return;
    }
}

struct FCE_FakeCharacterSyncHPEvent : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FECSEntity SwitchOutEntity;
    UPROPERTY()
    float32 HPValuie;


}

namespace EntityBB
{
void GetEntityBBVar_TeamInfo_HasFakeCharacter(const FECSEntity &inout Entity, bool &inout OutRetValue)
{
    OutRetValue = FTeamUtils::IsTeamHasFakeCharacter(Entity);
    return;
}
}
namespace ECSFunc_FC_SpawnFakeCharacterResultComponent
{
UFUNCTION()
bool HasSpawnFakeCharacterResultComponent(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_SpawnFakeCharacterResultComponent);
}
FC_SpawnFakeCharacterResultComponent& AssignSpawnFakeCharacterResultComponent(const FECSEntity &inout Entity, const FC_SpawnFakeCharacterResultComponent &inout DefaultValue = FC_SpawnFakeCharacterResultComponent())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_SpawnFakeCharacterResultComponent, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignSpawnFakeCharacterResultComponent_BP(const FECSEntity &inout Entity, const FC_SpawnFakeCharacterResultComponent &inout DefaultValue = FC_SpawnFakeCharacterResultComponent())
{
    ECSFunc_FC_SpawnFakeCharacterResultComponent::AssignSpawnFakeCharacterResultComponent(Entity, DefaultValue);
    return;
}
FC_SpawnFakeCharacterResultComponent& ModifySpawnFakeCharacterResultComponent(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_SpawnFakeCharacterResultComponent));
    return local_12.GetComp();
}
FC_SpawnFakeCharacterResultComponent& ModifyOrAddSpawnFakeCharacterResultComponent(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_SpawnFakeCharacterResultComponent));
    return local_12.GetComp();
}
const FC_SpawnFakeCharacterResultComponent& GetSpawnFakeCharacterResultComponent(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_SpawnFakeCharacterResultComponent));
    return local_12.GetComp();
}
UFUNCTION()
FC_SpawnFakeCharacterResultComponent GetSpawnFakeCharacterResultComponent_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_SpawnFakeCharacterResultComponent __r;
    bValid = false;
    bValid = ECSFunc_FC_SpawnFakeCharacterResultComponent::GetSpawnFakeCharacterResultComponent(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_SpawnFakeCharacterResultComponent GetDefaultedSpawnFakeCharacterResultComponent(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_SpawnFakeCharacterResultComponent __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_SpawnFakeCharacterResultComponent);
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
FC_SpawnFakeCharacterResultComponent GetDefaultedSpawnFakeCharacterResultComponent_BP(const FECSEntity &inout Entity)
{
    FC_SpawnFakeCharacterResultComponent __r;
    return __r;
}
UFUNCTION()
bool RemoveSpawnFakeCharacterResultComponent(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_SpawnFakeCharacterResultComponent);
}
}
FECSMonitorRuntimeView __GetMonitorSpawnFakeCharacterResultComponentOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_SpawnFakeCharacterResultComponent, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSpawnFakeCharacterResultComponentOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_SpawnFakeCharacterResultComponent, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSpawnFakeCharacterResultComponentOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_SpawnFakeCharacterResultComponent, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSpawnFakeCharacterResultComponentOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_SpawnFakeCharacterResultComponent, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSpawnFakeCharacterResultComponentOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_SpawnFakeCharacterResultComponent, bFixedFrame, bMustHandleAll);
}
void __MonitorSpawnFakeCharacterResultComponentLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_SpawnFakeCharacterResultComponent, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorSpawnFakeCharacterResultComponentActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_SpawnFakeCharacterResultComponent, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorSpawnFakeCharacterResultComponentModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_SpawnFakeCharacterResultComponent, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_FakeCharacterInit
{
UFUNCTION()
bool HasFakeCharacterInit(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_FakeCharacterInit);
}
FC_FakeCharacterInit& AssignFakeCharacterInit(const FECSEntity &inout Entity, const FC_FakeCharacterInit &inout DefaultValue = FC_FakeCharacterInit())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_FakeCharacterInit, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignFakeCharacterInit_BP(const FECSEntity &inout Entity, const FC_FakeCharacterInit &inout DefaultValue = FC_FakeCharacterInit())
{
    ECSFunc_FC_FakeCharacterInit::AssignFakeCharacterInit(Entity, DefaultValue);
    return;
}
FC_FakeCharacterInit& ModifyFakeCharacterInit(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_FakeCharacterInit));
    return local_12.GetComp();
}
FC_FakeCharacterInit& ModifyOrAddFakeCharacterInit(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_FakeCharacterInit));
    return local_12.GetComp();
}
const FC_FakeCharacterInit& GetFakeCharacterInit(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_FakeCharacterInit));
    return local_12.GetComp();
}
UFUNCTION()
FC_FakeCharacterInit GetFakeCharacterInit_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_FakeCharacterInit __r;
    bValid = false;
    bValid = ECSFunc_FC_FakeCharacterInit::GetFakeCharacterInit(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_FakeCharacterInit GetDefaultedFakeCharacterInit(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_FakeCharacterInit __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_FakeCharacterInit);
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
FC_FakeCharacterInit GetDefaultedFakeCharacterInit_BP(const FECSEntity &inout Entity)
{
    FC_FakeCharacterInit __r;
    return __r;
}
UFUNCTION()
bool RemoveFakeCharacterInit(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_FakeCharacterInit);
}
}
FECSMonitorRuntimeView __GetMonitorFakeCharacterInitOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_FakeCharacterInit, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorFakeCharacterInitOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_FakeCharacterInit, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorFakeCharacterInitOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_FakeCharacterInit, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorFakeCharacterInitOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_FakeCharacterInit, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorFakeCharacterInitOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_FakeCharacterInit, bFixedFrame, bMustHandleAll);
}
void __MonitorFakeCharacterInitLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_FakeCharacterInit, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorFakeCharacterInitActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_FakeCharacterInit, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorFakeCharacterInitModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_FakeCharacterInit, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_InFakeCharacterControl
{
UFUNCTION()
bool HasInFakeCharacterControl(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_InFakeCharacterControl);
}
FC_InFakeCharacterControl& AssignInFakeCharacterControl(const FECSEntity &inout Entity, const FC_InFakeCharacterControl &inout DefaultValue = FC_InFakeCharacterControl())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_InFakeCharacterControl, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignInFakeCharacterControl_BP(const FECSEntity &inout Entity, const FC_InFakeCharacterControl &inout DefaultValue = FC_InFakeCharacterControl())
{
    ECSFunc_FC_InFakeCharacterControl::AssignInFakeCharacterControl(Entity, DefaultValue);
    return;
}
FC_InFakeCharacterControl& ModifyInFakeCharacterControl(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_InFakeCharacterControl));
    return local_12.GetComp();
}
FC_InFakeCharacterControl& ModifyOrAddInFakeCharacterControl(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_InFakeCharacterControl));
    return local_12.GetComp();
}
const FC_InFakeCharacterControl& GetInFakeCharacterControl(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_InFakeCharacterControl));
    return local_12.GetComp();
}
UFUNCTION()
FC_InFakeCharacterControl GetInFakeCharacterControl_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_InFakeCharacterControl& local_4 = ECSFunc_FC_InFakeCharacterControl::GetInFakeCharacterControl(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_InFakeCharacterControl();
}
const FC_InFakeCharacterControl GetDefaultedInFakeCharacterControl(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_InFakeCharacterControl __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_InFakeCharacterControl);
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
FC_InFakeCharacterControl GetDefaultedInFakeCharacterControl_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_InFakeCharacterControl::GetDefaultedInFakeCharacterControl(Entity);
}
UFUNCTION()
bool RemoveInFakeCharacterControl(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_InFakeCharacterControl);
}
}
FECSMonitorRuntimeView __GetMonitorInFakeCharacterControlOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_InFakeCharacterControl, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorInFakeCharacterControlOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_InFakeCharacterControl, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorInFakeCharacterControlOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_InFakeCharacterControl, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorInFakeCharacterControlOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_InFakeCharacterControl, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorInFakeCharacterControlOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_InFakeCharacterControl, bFixedFrame, bMustHandleAll);
}
void __MonitorInFakeCharacterControlLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_InFakeCharacterControl, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorInFakeCharacterControlActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_InFakeCharacterControl, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorInFakeCharacterControlModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_InFakeCharacterControl, bFixedFrame, Details);
    return;
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_InFakeCharacterControl &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_InFakeCharacterControl &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_InFakeCharacterControl &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_InFakeCharacterControl
{
int __IndexOf_SwitchOutEntity()
{
    return 0;
}
int __IndexOf_RefCount()
{
    return 1;
}
}
