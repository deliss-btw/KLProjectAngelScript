
namespace __INTENRAL_FC_BlockInteractionConfig_NS
{
    const TECSComponentDerivedPtr<FC_BlockInteractionConfig> DerivedPtr = TECSComponentDerivedPtr<FC_BlockInteractionConfig>();
    const FC_BlockInteractionConfig DefaultValue = FC_BlockInteractionConfig();
}
namespace __INTENRAL_FC_BlockInteractionRuntime_NS
{
    const TECSComponentDerivedPtr<FC_BlockInteractionRuntime> DerivedPtr = TECSComponentDerivedPtr<FC_BlockInteractionRuntime>();
    const FC_BlockInteractionRuntime DefaultValue = FC_BlockInteractionRuntime();

}
struct FC_BlockInteractionConfig : FECSComponent
{
    UPROPERTY()
    bool bInitialBlocked;
    UPROPERTY()
    FNameHandle_ESMBBTrigger ESMBBTriggerWhenBlocked;
    UPROPERTY()
    float32 TriggerValidTimeWhenBlocked;
    UPROPERTY()
    FNameHandle_ESMBBTrigger ESMBBTriggerWhenUnblocked;
    UPROPERTY()
    float32 TriggerValidTimeWhenUnblocked;

    FC_BlockInteractionConfig()
    {
        this.bInitialBlocked = false;
        this.TriggerValidTimeWhenBlocked = 0.1f;
        this.TriggerValidTimeWhenUnblocked = 0.1f;
        this.ESMBBTriggerWhenBlocked.Name = FName("BlockInteraction.Blocked");
        this.ESMBBTriggerWhenUnblocked.Name = FName("BlockInteraction.Unblocked");
        return;
    }
    void PostPrefabLoad(const FECSEntity &inout Entity)
    {
        FC_BlockInteractionRuntime local_6;
        Assign local_4;
        FC_BlockInteractionRuntime& local_8 = local_4.opCall(local_6);
        if (local_8)
        {
            local_8.SetbBlocked(this.bInitialBlocked);
        }
        return;
    }
}

struct FC_BlockInteractionRuntime : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    bool m_bBlocked;

    FC_BlockInteractionRuntime()
    {
        this.m_bBlocked = false;
        this.__InitDirtyFlags();
        return;
    }
    FC_BlockInteractionRuntime(const FC_BlockInteractionRuntime &inout Other)
    {
        this.m_bBlocked = false;
        this.__InitDirtyFlags();
        this.m_bBlocked = Other.m_bBlocked;
        return;
    }
    FC_BlockInteractionRuntime opAssign(const FC_BlockInteractionRuntime &inout Other)
    {
        FC_BlockInteractionRuntime __r;
        this.SetbBlocked(Other.GetbBlocked());
        return __r;
    }
    bool GetbBlocked() const property
    {
        return this.m_bBlocked;
    }
    void SetbBlocked(const bool __Value) property
    {
        if (!(this.m_bBlocked) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_bBlocked = __Value;
        return;
    }
}

namespace ECSFunc_FC_BlockInteractionConfig
{
UFUNCTION()
bool HasBlockInteractionConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_BlockInteractionConfig);
}
FC_BlockInteractionConfig& AssignBlockInteractionConfig(const FECSEntity &inout Entity, const FC_BlockInteractionConfig &inout DefaultValue = FC_BlockInteractionConfig())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_BlockInteractionConfig, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignBlockInteractionConfig_BP(const FECSEntity &inout Entity, const FC_BlockInteractionConfig &inout DefaultValue = FC_BlockInteractionConfig())
{
    ECSFunc_FC_BlockInteractionConfig::AssignBlockInteractionConfig(Entity, DefaultValue);
    return;
}
FC_BlockInteractionConfig& ModifyBlockInteractionConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_BlockInteractionConfig));
    return local_12.GetComp();
}
FC_BlockInteractionConfig& ModifyOrAddBlockInteractionConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_BlockInteractionConfig));
    return local_12.GetComp();
}
const FC_BlockInteractionConfig& GetBlockInteractionConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_BlockInteractionConfig));
    return local_12.GetComp();
}
UFUNCTION()
FC_BlockInteractionConfig GetBlockInteractionConfig_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_BlockInteractionConfig __r;
    bValid = false;
    bValid = ECSFunc_FC_BlockInteractionConfig::GetBlockInteractionConfig(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_BlockInteractionConfig GetDefaultedBlockInteractionConfig(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_BlockInteractionConfig __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_BlockInteractionConfig);
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
FC_BlockInteractionConfig GetDefaultedBlockInteractionConfig_BP(const FECSEntity &inout Entity)
{
    FC_BlockInteractionConfig __r;
    return __r;
}
UFUNCTION()
bool RemoveBlockInteractionConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_BlockInteractionConfig);
}
}
FECSMonitorRuntimeView __GetMonitorBlockInteractionConfigOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_BlockInteractionConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorBlockInteractionConfigOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_BlockInteractionConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorBlockInteractionConfigOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_BlockInteractionConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorBlockInteractionConfigOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_BlockInteractionConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorBlockInteractionConfigOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_BlockInteractionConfig, bFixedFrame, bMustHandleAll);
}
void __MonitorBlockInteractionConfigLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_BlockInteractionConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorBlockInteractionConfigActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_BlockInteractionConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorBlockInteractionConfigModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_BlockInteractionConfig, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_BlockInteractionRuntime
{
UFUNCTION()
bool HasBlockInteractionRuntime(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_BlockInteractionRuntime);
}
FC_BlockInteractionRuntime& AssignBlockInteractionRuntime(const FECSEntity &inout Entity, const FC_BlockInteractionRuntime &inout DefaultValue = FC_BlockInteractionRuntime())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_BlockInteractionRuntime, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignBlockInteractionRuntime_BP(const FECSEntity &inout Entity, const FC_BlockInteractionRuntime &inout DefaultValue = FC_BlockInteractionRuntime())
{
    ECSFunc_FC_BlockInteractionRuntime::AssignBlockInteractionRuntime(Entity, DefaultValue);
    return;
}
FC_BlockInteractionRuntime& ModifyBlockInteractionRuntime(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_BlockInteractionRuntime));
    return local_12.GetComp();
}
FC_BlockInteractionRuntime& ModifyOrAddBlockInteractionRuntime(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_BlockInteractionRuntime));
    return local_12.GetComp();
}
const FC_BlockInteractionRuntime& GetBlockInteractionRuntime(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_BlockInteractionRuntime));
    return local_12.GetComp();
}
UFUNCTION()
FC_BlockInteractionRuntime GetBlockInteractionRuntime_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_BlockInteractionRuntime& local_4 = ECSFunc_FC_BlockInteractionRuntime::GetBlockInteractionRuntime(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_BlockInteractionRuntime();
}
const FC_BlockInteractionRuntime GetDefaultedBlockInteractionRuntime(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_BlockInteractionRuntime __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_BlockInteractionRuntime);
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
FC_BlockInteractionRuntime GetDefaultedBlockInteractionRuntime_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_BlockInteractionRuntime::GetDefaultedBlockInteractionRuntime(Entity);
}
UFUNCTION()
bool RemoveBlockInteractionRuntime(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_BlockInteractionRuntime);
}
}
FECSMonitorRuntimeView __GetMonitorBlockInteractionRuntimeOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_BlockInteractionRuntime, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorBlockInteractionRuntimeOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_BlockInteractionRuntime, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorBlockInteractionRuntimeOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_BlockInteractionRuntime, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorBlockInteractionRuntimeOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_BlockInteractionRuntime, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorBlockInteractionRuntimeOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_BlockInteractionRuntime, bFixedFrame, bMustHandleAll);
}
void __MonitorBlockInteractionRuntimeLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_BlockInteractionRuntime, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorBlockInteractionRuntimeActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_BlockInteractionRuntime, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorBlockInteractionRuntimeModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_BlockInteractionRuntime, bFixedFrame, Details);
    return;
}
namespace EntityBB
{
void GetEntityBBVar_BlockInteractionRuntime_bBlocked(const FECSEntity &inout Entity, bool &inout OutRetValue)
{
    GetDefaulted local_4;
    OutRetValue = local_4.opCall().GetbBlocked();
    return;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_BlockInteractionRuntime &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_BlockInteractionRuntime &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_BlockInteractionRuntime &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_BlockInteractionRuntime
{
int __IndexOf_bBlocked()
{
    return 0;
}
}
