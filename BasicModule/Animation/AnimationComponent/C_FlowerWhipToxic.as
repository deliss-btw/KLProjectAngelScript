
namespace __INTENRAL_FC_FlowerWhipToxicLook_NS
{
    const TECSComponentDerivedPtr<FC_FlowerWhipToxicLook> DerivedPtr = TECSComponentDerivedPtr<FC_FlowerWhipToxicLook>();
    const FC_FlowerWhipToxicLook DefaultValue = FC_FlowerWhipToxicLook();
}
namespace __InterpoComponentRegister
{
    const FECSInterpoManager::FAngelscriptInterpoComponentRegister FC_FlowerWhipToxicLookRegister = FECSInterpoManager::FAngelscriptInterpoComponentRegister();

}
struct FC_FlowerWhipToxicLook : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    bool m_bRecorded;
    UPROPERTY()
    FVector m_RecordedForward;

    FC_FlowerWhipToxicLook()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_FlowerWhipToxicLook(const FC_FlowerWhipToxicLook &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_FlowerWhipToxicLook opAssign(const FC_FlowerWhipToxicLook &inout Other)
    {
        FC_FlowerWhipToxicLook __r;
        this.SetbRecorded(Other.GetbRecorded());
        this.SetRecordedForward(Other.GetRecordedForward());
        return __r;
    }
    bool GetbRecorded() const property
    {
        return this.m_bRecorded;
    }
    void SetbRecorded(const bool __Value) property
    {
        if (!(this.m_bRecorded) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_bRecorded = __Value;
        return;
    }
    const FVector GetRecordedForward() const property
    {
        const FVector __r;
        return __r;
    }
    FVector GetModify_RecordedForward() property
    {
        FVector __r;
        this.__MarkDirty(1);
        return __r;
    }
    void SetRecordedForward(const FVector &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_RecordedForward = __Value;
        return;
    }
}

class UESMAction_FlowerWhipToxicLook : UESMBPBaseSpanAction
{
    UESMAction_FlowerWhipToxicLook()
    {
        return;
    }
    UFUNCTION()
    void Enter_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        int local_8 = 0;
        int local_20 = 0;
        Assign local_4;
        local_4.opCall(FC_TransformSyncDisabled());
        if (!(local_8.GetbRecorded()))
        {
            local_8.SetRecordedForward(local_20.GetRotation().GetForwardVector());
            local_8.SetbRecorded(true);
        }
        return;
    }
}

namespace FC_FlowerWhipToxicLook
{
FC_FlowerWhipToxicLook Interpolate(const FC_FlowerWhipToxicLook &inout A, const FC_FlowerWhipToxicLook &inout B, const float32 T, const float32 DeltaTime)
{
    FC_FlowerWhipToxicLook local_8;
    local_8.SetbRecorded(B.GetbRecorded());
    local_8.SetRecordedForward(B.GetRecordedForward());
    return local_8;
}
}
namespace ECSFunc_FC_FlowerWhipToxicLook
{
UFUNCTION()
bool HasFlowerWhipToxicLook(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_FlowerWhipToxicLook);
}
FC_FlowerWhipToxicLook& AssignFlowerWhipToxicLook(const FECSEntity &inout Entity, const FC_FlowerWhipToxicLook &inout DefaultValue = FC_FlowerWhipToxicLook())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_FlowerWhipToxicLook, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignFlowerWhipToxicLook_BP(const FECSEntity &inout Entity, const FC_FlowerWhipToxicLook &inout DefaultValue = FC_FlowerWhipToxicLook())
{
    ECSFunc_FC_FlowerWhipToxicLook::AssignFlowerWhipToxicLook(Entity, DefaultValue);
    return;
}
FC_FlowerWhipToxicLook& ModifyFlowerWhipToxicLook(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_FlowerWhipToxicLook));
    return local_12.GetComp();
}
FC_FlowerWhipToxicLook& ModifyOrAddFlowerWhipToxicLook(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_FlowerWhipToxicLook));
    return local_12.GetComp();
}
const FC_FlowerWhipToxicLook& GetFlowerWhipToxicLook(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_FlowerWhipToxicLook));
    return local_12.GetComp();
}
UFUNCTION()
FC_FlowerWhipToxicLook GetFlowerWhipToxicLook_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_FlowerWhipToxicLook& local_4 = ECSFunc_FC_FlowerWhipToxicLook::GetFlowerWhipToxicLook(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_FlowerWhipToxicLook();
}
const FC_FlowerWhipToxicLook GetDefaultedFlowerWhipToxicLook(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_FlowerWhipToxicLook __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_FlowerWhipToxicLook);
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
FC_FlowerWhipToxicLook GetDefaultedFlowerWhipToxicLook_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_FlowerWhipToxicLook::GetDefaultedFlowerWhipToxicLook(Entity);
}
UFUNCTION()
bool RemoveFlowerWhipToxicLook(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_FlowerWhipToxicLook);
}
}
FECSMonitorRuntimeView __GetMonitorFlowerWhipToxicLookOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_FlowerWhipToxicLook, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorFlowerWhipToxicLookOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_FlowerWhipToxicLook, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorFlowerWhipToxicLookOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_FlowerWhipToxicLook, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorFlowerWhipToxicLookOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_FlowerWhipToxicLook, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorFlowerWhipToxicLookOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_FlowerWhipToxicLook, bFixedFrame, bMustHandleAll);
}
void __MonitorFlowerWhipToxicLookLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_FlowerWhipToxicLook, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorFlowerWhipToxicLookActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_FlowerWhipToxicLook, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorFlowerWhipToxicLookModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_FlowerWhipToxicLook, bFixedFrame, Details);
    return;
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_FlowerWhipToxicLook &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_FlowerWhipToxicLook &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_FlowerWhipToxicLook &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_FlowerWhipToxicLook
{
int __IndexOf_bRecorded()
{
    return 0;
}
int __IndexOf_RecordedForward()
{
    return 1;
}
}
