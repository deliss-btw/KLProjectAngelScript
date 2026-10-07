
namespace __INTENRAL_FC_DebugSkillUsage_NS
{
    const TECSComponentDerivedPtr<FC_DebugSkillUsage> DerivedPtr = TECSComponentDerivedPtr<FC_DebugSkillUsage>();
    const FC_DebugSkillUsage DefaultValue = FC_DebugSkillUsage();

}
struct FC_DebugSkillUsage : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    TMap<int, int> m_SkillUsageMap;

    FC_DebugSkillUsage()
    {
        this.__InitDirtyFlags();
        return;
    }
    FC_DebugSkillUsage(const FC_DebugSkillUsage &inout Other)
    {
        this.__InitDirtyFlags();
        this.m_SkillUsageMap = Other.m_SkillUsageMap;
        return;
    }
    FC_DebugSkillUsage opAssign(const FC_DebugSkillUsage &inout Other)
    {
        FC_DebugSkillUsage __r;
        this.SetSkillUsageMap(Other.GetSkillUsageMap());
        return __r;
    }
    const TMap<int, int> GetSkillUsageMap() const property
    {
        const TMap<int, int> __r;
        return __r;
    }
    TMap<int, int> GetModify_SkillUsageMap() property
    {
        TMap<int, int> __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetSkillUsageMap(const TMap<int, int> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_SkillUsageMap = __Value;
        return;
    }
}

namespace ECSFunc_FC_DebugSkillUsage
{
UFUNCTION()
bool HasDebugSkillUsage(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_DebugSkillUsage);
}
FC_DebugSkillUsage& AssignDebugSkillUsage(const FECSEntity &inout Entity, const FC_DebugSkillUsage &inout DefaultValue = FC_DebugSkillUsage())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_DebugSkillUsage, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignDebugSkillUsage_BP(const FECSEntity &inout Entity, const FC_DebugSkillUsage &inout DefaultValue = FC_DebugSkillUsage())
{
    ECSFunc_FC_DebugSkillUsage::AssignDebugSkillUsage(Entity, DefaultValue);
    return;
}
FC_DebugSkillUsage& ModifyDebugSkillUsage(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_DebugSkillUsage));
    return local_12.GetComp();
}
FC_DebugSkillUsage& ModifyOrAddDebugSkillUsage(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_DebugSkillUsage));
    return local_12.GetComp();
}
const FC_DebugSkillUsage& GetDebugSkillUsage(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_DebugSkillUsage));
    return local_12.GetComp();
}
UFUNCTION()
FC_DebugSkillUsage GetDebugSkillUsage_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_DebugSkillUsage& local_4 = ECSFunc_FC_DebugSkillUsage::GetDebugSkillUsage(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_DebugSkillUsage();
}
const FC_DebugSkillUsage GetDefaultedDebugSkillUsage(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_DebugSkillUsage __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_DebugSkillUsage);
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
FC_DebugSkillUsage GetDefaultedDebugSkillUsage_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_DebugSkillUsage::GetDefaultedDebugSkillUsage(Entity);
}
UFUNCTION()
bool RemoveDebugSkillUsage(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_DebugSkillUsage);
}
}
FECSMonitorRuntimeView __GetMonitorDebugSkillUsageOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_DebugSkillUsage, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDebugSkillUsageOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_DebugSkillUsage, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDebugSkillUsageOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_DebugSkillUsage, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDebugSkillUsageOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_DebugSkillUsage, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDebugSkillUsageOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_DebugSkillUsage, bFixedFrame, bMustHandleAll);
}
void __MonitorDebugSkillUsageLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_DebugSkillUsage, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorDebugSkillUsageActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_DebugSkillUsage, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorDebugSkillUsageModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_DebugSkillUsage, bFixedFrame, Details);
    return;
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_DebugSkillUsage &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_DebugSkillUsage &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_DebugSkillUsage &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_DebugSkillUsage
{
int __IndexOf_SkillUsageMap()
{
    return 0;
}
}
