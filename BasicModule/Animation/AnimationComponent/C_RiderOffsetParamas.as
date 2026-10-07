
namespace __INTENRAL_FC_RiderOffsetParamas_NS
{
    const TECSComponentDerivedPtr<FC_RiderOffsetParamas> DerivedPtr = TECSComponentDerivedPtr<FC_RiderOffsetParamas>();
    const FC_RiderOffsetParamas DefaultValue = FC_RiderOffsetParamas();
}
namespace __InterpoComponentRegister
{
    const FECSInterpoManager::FAngelscriptInterpoComponentRegister FC_RiderOffsetParamasRegister = FECSInterpoManager::FAngelscriptInterpoComponentRegister();

}
struct FC_RiderOffsetParamas : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    float32 m_Yaw;
    UPROPERTY()
    float32 m_Pitch;

    FC_RiderOffsetParamas()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_RiderOffsetParamas(const FC_RiderOffsetParamas &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_RiderOffsetParamas opAssign(const FC_RiderOffsetParamas &inout Other)
    {
        FC_RiderOffsetParamas __r;
        this.SetYaw(Other.GetYaw());
        this.SetPitch(Other.GetPitch());
        return __r;
    }
    float32 GetYaw() const property
    {
        return this.m_Yaw;
    }
    void SetYaw(const float32 __Value) property
    {
        if (this.m_Yaw == __Value)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_Yaw = __Value;
        return;
    }
    float32 GetPitch() const property
    {
        return this.m_Pitch;
    }
    void SetPitch(const float32 __Value) property
    {
        if (this.m_Pitch == __Value)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_Pitch = __Value;
        return;
    }
}

class UESMAction_RiderOffsetParamas : UESMBPBaseSpanTickAction
{
    UPROPERTY()
    float32 BaseRiderOffsetYaw = 0.0f;
    UPROPERTY()
    float32 BaseRiderOffsetPitch = 0.0f;
    UPROPERTY()
    float32 MinYaw = -180.0f;
    UPROPERTY()
    float32 MaxYaw = 180.0f;
    UPROPERTY()
    float32 MinPitch = -90.0f;
    UPROPERTY()
    float32 MaxPitch = 90.0f;


    UFUNCTION()
    void Tick_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        int local_6 = 0;
        FNameHandle_EntityBBVarEntity local_16;
        local_16;
        FECSEntity local_20 = Context.GetEntity().GetBB_Entity(local_16);
        FNameHandle_EntityBBVarFloat local_26;
        local_26;
        float32 local_27 = local_20.GetBB_Float(local_26);
        local_26;
        float32 local_21 = local_20.GetBB_Float(local_26);
        float32 local_30 = FMath::Clamp(this.BaseRiderOffsetPitch + local_21, this.MinPitch, this.MaxPitch);
        local_6.SetYaw((FMath::Clamp((this.BaseRiderOffsetYaw + local_27), this.MinYaw, this.MaxYaw)));
        local_6.SetPitch(local_30);
        return;
    }
}

namespace FC_RiderOffsetParamas
{
FC_RiderOffsetParamas Interpolate(const FC_RiderOffsetParamas &inout A, const FC_RiderOffsetParamas &inout B, const float32 T, const float32 DeltaTime)
{
    FC_RiderOffsetParamas local_4;
    local_4.SetYaw(FMath::Lerp(A.GetYaw(), B.GetYaw(), T));
    local_4.SetPitch(FMath::Lerp(A.GetPitch(), B.GetPitch(), T));
    return local_4;
}
}
namespace ECSFunc_FC_RiderOffsetParamas
{
UFUNCTION()
bool HasRiderOffsetParamas(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_RiderOffsetParamas);
}
FC_RiderOffsetParamas& AssignRiderOffsetParamas(const FECSEntity &inout Entity, const FC_RiderOffsetParamas &inout DefaultValue = FC_RiderOffsetParamas())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_RiderOffsetParamas, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignRiderOffsetParamas_BP(const FECSEntity &inout Entity, const FC_RiderOffsetParamas &inout DefaultValue = FC_RiderOffsetParamas())
{
    ECSFunc_FC_RiderOffsetParamas::AssignRiderOffsetParamas(Entity, DefaultValue);
    return;
}
FC_RiderOffsetParamas& ModifyRiderOffsetParamas(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_RiderOffsetParamas));
    return local_12.GetComp();
}
FC_RiderOffsetParamas& ModifyOrAddRiderOffsetParamas(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_RiderOffsetParamas));
    return local_12.GetComp();
}
const FC_RiderOffsetParamas& GetRiderOffsetParamas(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_RiderOffsetParamas));
    return local_12.GetComp();
}
UFUNCTION()
FC_RiderOffsetParamas GetRiderOffsetParamas_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_RiderOffsetParamas& local_4 = ECSFunc_FC_RiderOffsetParamas::GetRiderOffsetParamas(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_RiderOffsetParamas();
}
const FC_RiderOffsetParamas GetDefaultedRiderOffsetParamas(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_RiderOffsetParamas __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_RiderOffsetParamas);
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
FC_RiderOffsetParamas GetDefaultedRiderOffsetParamas_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_RiderOffsetParamas::GetDefaultedRiderOffsetParamas(Entity);
}
UFUNCTION()
bool RemoveRiderOffsetParamas(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_RiderOffsetParamas);
}
}
FECSMonitorRuntimeView __GetMonitorRiderOffsetParamasOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_RiderOffsetParamas, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorRiderOffsetParamasOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_RiderOffsetParamas, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorRiderOffsetParamasOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_RiderOffsetParamas, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorRiderOffsetParamasOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_RiderOffsetParamas, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorRiderOffsetParamasOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_RiderOffsetParamas, bFixedFrame, bMustHandleAll);
}
void __MonitorRiderOffsetParamasLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_RiderOffsetParamas, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorRiderOffsetParamasActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_RiderOffsetParamas, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorRiderOffsetParamasModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_RiderOffsetParamas, bFixedFrame, Details);
    return;
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_RiderOffsetParamas &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_RiderOffsetParamas &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_RiderOffsetParamas &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_RiderOffsetParamas
{
int __IndexOf_Yaw()
{
    return 0;
}
int __IndexOf_Pitch()
{
    return 1;
}
}
