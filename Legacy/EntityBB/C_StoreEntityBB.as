
namespace __INTENRAL_FC_StoreEntityBB_NS
{
    const TECSComponentDerivedPtr<FC_StoreEntityBB> DerivedPtr = TECSComponentDerivedPtr<FC_StoreEntityBB>();
    const FC_StoreEntityBB DefaultValue = FC_StoreEntityBB();

}
struct FC_StoreEntityBB : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    TMap<FName, float32> m_FloatStore;

    FC_StoreEntityBB()
    {
        this.__InitDirtyFlags();
        return;
    }
    FC_StoreEntityBB(const FC_StoreEntityBB &inout Other)
    {
        this.__InitDirtyFlags();
        this.m_FloatStore = Other.m_FloatStore;
        return;
    }
    FC_StoreEntityBB opAssign(const FC_StoreEntityBB &inout Other)
    {
        FC_StoreEntityBB __r;
        this.SetFloatStore(Other.GetFloatStore());
        return __r;
    }
    const TMap<FName, float32> GetFloatStore() const property
    {
        const TMap<FName, float32> __r;
        return __r;
    }
    TMap<FName, float32> GetModify_FloatStore() property
    {
        TMap<FName, float32> __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetFloatStore(const TMap<FName, float32> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_FloatStore = __Value;
        return;
    }
}

namespace ECSFunc_FC_StoreEntityBB
{
UFUNCTION()
bool HasStoreEntityBB(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_StoreEntityBB);
}
FC_StoreEntityBB& AssignStoreEntityBB(const FECSEntity &inout Entity, const FC_StoreEntityBB &inout DefaultValue = FC_StoreEntityBB())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_StoreEntityBB, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignStoreEntityBB_BP(const FECSEntity &inout Entity, const FC_StoreEntityBB &inout DefaultValue = FC_StoreEntityBB())
{
    ECSFunc_FC_StoreEntityBB::AssignStoreEntityBB(Entity, DefaultValue);
    return;
}
FC_StoreEntityBB& ModifyStoreEntityBB(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_StoreEntityBB));
    return local_12.GetComp();
}
FC_StoreEntityBB& ModifyOrAddStoreEntityBB(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_StoreEntityBB));
    return local_12.GetComp();
}
const FC_StoreEntityBB& GetStoreEntityBB(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_StoreEntityBB));
    return local_12.GetComp();
}
UFUNCTION()
FC_StoreEntityBB GetStoreEntityBB_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_StoreEntityBB& local_4 = ECSFunc_FC_StoreEntityBB::GetStoreEntityBB(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_StoreEntityBB();
}
const FC_StoreEntityBB GetDefaultedStoreEntityBB(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_StoreEntityBB __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_StoreEntityBB);
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
FC_StoreEntityBB GetDefaultedStoreEntityBB_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_StoreEntityBB::GetDefaultedStoreEntityBB(Entity);
}
UFUNCTION()
bool RemoveStoreEntityBB(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_StoreEntityBB);
}
}
FECSMonitorRuntimeView __GetMonitorStoreEntityBBOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_StoreEntityBB, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorStoreEntityBBOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_StoreEntityBB, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorStoreEntityBBOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_StoreEntityBB, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorStoreEntityBBOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_StoreEntityBB, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorStoreEntityBBOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_StoreEntityBB, bFixedFrame, bMustHandleAll);
}
void __MonitorStoreEntityBBLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_StoreEntityBB, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorStoreEntityBBActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_StoreEntityBB, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorStoreEntityBBModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_StoreEntityBB, bFixedFrame, Details);
    return;
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_StoreEntityBB &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_StoreEntityBB &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_StoreEntityBB &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_StoreEntityBB
{
int __IndexOf_FloatStore()
{
    return 0;
}
}
