
enum EAttachmentSocket
{
    Hand,
    Back,
    OtherHand,
}

namespace __INTENRAL_FC_WeaponAttachData_NS
{
    const TECSComponentDerivedPtr<FC_WeaponAttachData> DerivedPtr = TECSComponentDerivedPtr<FC_WeaponAttachData>();
    const FC_WeaponAttachData DefaultValue = FC_WeaponAttachData();
}
namespace __INTENRAL_FC_WeaponAttachState_NS
{
    const TECSComponentDerivedPtr<FC_WeaponAttachState> DerivedPtr = TECSComponentDerivedPtr<FC_WeaponAttachState>();
    const FC_WeaponAttachState DefaultValue = FC_WeaponAttachState();

}
struct FAttachmentConfig
{
    UPROPERTY()
    FName AttachSocket;
    UPROPERTY()
    FVector3f LocationOffset;
    UPROPERTY()
    FRotator3f RotationOffset;

    FAttachmentConfig()
    {
        return;
    }
}

struct FC_WeaponAttachData : FECSComponent
{
    UPROPERTY()
    TArray<FAttachmentConfig> AttachData;

    FC_WeaponAttachData()
    {
        return;
    }
}

struct FC_WeaponAttachState : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    uint8 m_IsAttachBackCounter;

    FC_WeaponAttachState()
    {
        this.m_IsAttachBackCounter = false;
        this.__InitDirtyFlags();
        return;
    }
    FC_WeaponAttachState(const FC_WeaponAttachState &inout Other)
    {
        this.m_IsAttachBackCounter = false;
        this.__InitDirtyFlags();
        this.m_IsAttachBackCounter = (int(Other.m_IsAttachBackCounter) != 0);
        return;
    }
    FC_WeaponAttachState opAssign(const FC_WeaponAttachState &inout Other)
    {
        FC_WeaponAttachState __r;
        this.SetIsAttachBackCounter(uint8(Other.GetIsAttachBackCounter()));
        return __r;
    }
    bool IsAttachBack() const
    {
        int local_2 = this.GetIsAttachBackCounter();
        return (local_2 > 0);
    }
    uint8 GetIsAttachBackCounter() const property
    {
        return this.m_IsAttachBackCounter;
    }
    void SetIsAttachBackCounter(const uint8 __Value) property
    {
        if (this.m_IsAttachBackCounter == __Value)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_IsAttachBackCounter = (__Value != 0);
        return;
    }
}

struct FT_WeaponAttach : FECSTrait
{
    FECSTrait _base_FECSTrait;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_WeaponAttachData_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_WeaponAttachData, NAME_None);
    UPROPERTY()
    FC_WeaponAttachData Config_FC_WeaponAttachData;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_WeaponAttachState_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_WeaponAttachState, NAME_None);

    FT_WeaponAttach()
    {
        return;
    }
}

namespace ECSFunc_FC_WeaponAttachData
{
UFUNCTION()
bool HasWeaponAttachData(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_WeaponAttachData);
}
FC_WeaponAttachData& AssignWeaponAttachData(const FECSEntity &inout Entity, const FC_WeaponAttachData &inout DefaultValue = FC_WeaponAttachData())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_WeaponAttachData, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignWeaponAttachData_BP(const FECSEntity &inout Entity, const FC_WeaponAttachData &inout DefaultValue = FC_WeaponAttachData())
{
    ECSFunc_FC_WeaponAttachData::AssignWeaponAttachData(Entity, DefaultValue);
    return;
}
FC_WeaponAttachData& ModifyWeaponAttachData(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_WeaponAttachData));
    return local_12.GetComp();
}
FC_WeaponAttachData& ModifyOrAddWeaponAttachData(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_WeaponAttachData));
    return local_12.GetComp();
}
const FC_WeaponAttachData& GetWeaponAttachData(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_WeaponAttachData));
    return local_12.GetComp();
}
UFUNCTION()
FC_WeaponAttachData GetWeaponAttachData_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_WeaponAttachData __r;
    bValid = false;
    bValid = ECSFunc_FC_WeaponAttachData::GetWeaponAttachData(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_WeaponAttachData GetDefaultedWeaponAttachData(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_WeaponAttachData __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_WeaponAttachData);
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
FC_WeaponAttachData GetDefaultedWeaponAttachData_BP(const FECSEntity &inout Entity)
{
    FC_WeaponAttachData __r;
    return __r;
}
UFUNCTION()
bool RemoveWeaponAttachData(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_WeaponAttachData);
}
}
FECSMonitorRuntimeView __GetMonitorWeaponAttachDataOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_WeaponAttachData, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorWeaponAttachDataOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_WeaponAttachData, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorWeaponAttachDataOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_WeaponAttachData, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorWeaponAttachDataOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_WeaponAttachData, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorWeaponAttachDataOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_WeaponAttachData, bFixedFrame, bMustHandleAll);
}
void __MonitorWeaponAttachDataLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_WeaponAttachData, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorWeaponAttachDataActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_WeaponAttachData, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorWeaponAttachDataModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_WeaponAttachData, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_WeaponAttachState
{
UFUNCTION()
bool HasWeaponAttachState(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_WeaponAttachState);
}
FC_WeaponAttachState& AssignWeaponAttachState(const FECSEntity &inout Entity, const FC_WeaponAttachState &inout DefaultValue = FC_WeaponAttachState())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_WeaponAttachState, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignWeaponAttachState_BP(const FECSEntity &inout Entity, const FC_WeaponAttachState &inout DefaultValue = FC_WeaponAttachState())
{
    ECSFunc_FC_WeaponAttachState::AssignWeaponAttachState(Entity, DefaultValue);
    return;
}
FC_WeaponAttachState& ModifyWeaponAttachState(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_WeaponAttachState));
    return local_12.GetComp();
}
FC_WeaponAttachState& ModifyOrAddWeaponAttachState(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_WeaponAttachState));
    return local_12.GetComp();
}
const FC_WeaponAttachState& GetWeaponAttachState(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_WeaponAttachState));
    return local_12.GetComp();
}
UFUNCTION()
FC_WeaponAttachState GetWeaponAttachState_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_WeaponAttachState& local_4 = ECSFunc_FC_WeaponAttachState::GetWeaponAttachState(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_WeaponAttachState();
}
const FC_WeaponAttachState GetDefaultedWeaponAttachState(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_WeaponAttachState __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_WeaponAttachState);
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
FC_WeaponAttachState GetDefaultedWeaponAttachState_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_WeaponAttachState::GetDefaultedWeaponAttachState(Entity);
}
UFUNCTION()
bool RemoveWeaponAttachState(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_WeaponAttachState);
}
}
FECSMonitorRuntimeView __GetMonitorWeaponAttachStateOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_WeaponAttachState, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorWeaponAttachStateOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_WeaponAttachState, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorWeaponAttachStateOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_WeaponAttachState, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorWeaponAttachStateOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_WeaponAttachState, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorWeaponAttachStateOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_WeaponAttachState, bFixedFrame, bMustHandleAll);
}
void __MonitorWeaponAttachStateLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_WeaponAttachState, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorWeaponAttachStateActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_WeaponAttachState, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorWeaponAttachStateModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_WeaponAttachState, bFixedFrame, Details);
    return;
}
namespace EntityBB
{
void GetEntityBBVar_WeaponAttachState_IsAttachBack(const FECSEntity &inout Entity, bool &inout OutRetValue)
{
    GetDefaulted local_4;
    OutRetValue = local_4.opCall().IsAttachBack();
    return;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_WeaponAttachState &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_WeaponAttachState &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_WeaponAttachState &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_WeaponAttachState
{
int __IndexOf_IsAttachBackCounter()
{
    return 0;
}
}
