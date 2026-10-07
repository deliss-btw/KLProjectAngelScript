
namespace __INTENRAL_FC_EstimatedSpeed_NS
{
    const TECSComponentDerivedPtr<FC_EstimatedSpeed> DerivedPtr = TECSComponentDerivedPtr<FC_EstimatedSpeed>();
    const FC_EstimatedSpeed DefaultValue = FC_EstimatedSpeed();
}
namespace __InterpoComponentRegister
{
    const FECSInterpoManager::FAngelscriptInterpoComponentRegister FC_EstimatedSpeedRegister = FECSInterpoManager::FAngelscriptInterpoComponentRegister();

}
struct FC_EstimatedSpeed : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    FFPTime m_SampleTimeOffset;
    UPROPERTY()
    bool m_bUseInternalSpeed;
    UPROPERTY()
    float32 m_EstimatedSpeed;

    FC_EstimatedSpeed()
    {
        this.m_SampleTimeOffset = 0.1;
        this.m_bUseInternalSpeed = false;
        this.m_EstimatedSpeed = 0.0f;
        this.__InitDirtyFlags();
        return;
    }
    FC_EstimatedSpeed(const FC_EstimatedSpeed &inout Other)
    {
        this.m_SampleTimeOffset = 0.1;
        this.m_bUseInternalSpeed = false;
        this.m_EstimatedSpeed = 0.0f;
        this.__InitDirtyFlags();
        this.m_SampleTimeOffset = Other.m_SampleTimeOffset;
        this.m_bUseInternalSpeed = Other.m_bUseInternalSpeed;
        this.m_EstimatedSpeed = Other.m_EstimatedSpeed;
        return;
    }
    FC_EstimatedSpeed opAssign(const FC_EstimatedSpeed &inout Other)
    {
        FC_EstimatedSpeed __r;
        this.SetSampleTimeOffset(Other.GetSampleTimeOffset());
        this.SetbUseInternalSpeed(Other.GetbUseInternalSpeed());
        this.SetEstimatedSpeed(Other.GetEstimatedSpeed());
        return __r;
    }
    float32 EstimatedSpeedValue() const
    {
        return this.GetEstimatedSpeed();
    }
    const FFPTime GetSampleTimeOffset() const property
    {
        const FFPTime __r;
        return __r;
    }
    FFPTime GetModify_SampleTimeOffset() property
    {
        FFPTime __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetSampleTimeOffset(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_SampleTimeOffset = __Value;
        return;
    }
    bool GetbUseInternalSpeed() const property
    {
        return this.m_bUseInternalSpeed;
    }
    void SetbUseInternalSpeed(const bool __Value) property
    {
        if (!(this.m_bUseInternalSpeed) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_bUseInternalSpeed = __Value;
        return;
    }
    float32 GetEstimatedSpeed() const property
    {
        return this.m_EstimatedSpeed;
    }
    void SetEstimatedSpeed(const float32 __Value) property
    {
        if (this.m_EstimatedSpeed == __Value)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_EstimatedSpeed = __Value;
        return;
    }
}

namespace FC_EstimatedSpeed
{
FC_EstimatedSpeed Interpolate(const FC_EstimatedSpeed &inout A, const FC_EstimatedSpeed &inout B, const float32 T, const float32 DeltaTime)
{
    FC_EstimatedSpeed local_6;
    local_6.SetSampleTimeOffset(FFPTime::Lerp(A.GetSampleTimeOffset(), B.GetSampleTimeOffset(), T));
    local_6.SetbUseInternalSpeed(B.GetbUseInternalSpeed());
    local_6.SetEstimatedSpeed(FMath::Lerp(A.GetEstimatedSpeed(), B.GetEstimatedSpeed(), T));
    return local_6;
}
}
namespace ECSFunc_FC_EstimatedSpeed
{
UFUNCTION()
bool HasEstimatedSpeed(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_EstimatedSpeed);
}
FC_EstimatedSpeed& AssignEstimatedSpeed(const FECSEntity &inout Entity, const FC_EstimatedSpeed &inout DefaultValue = FC_EstimatedSpeed())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_EstimatedSpeed, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignEstimatedSpeed_BP(const FECSEntity &inout Entity, const FC_EstimatedSpeed &inout DefaultValue = FC_EstimatedSpeed())
{
    ECSFunc_FC_EstimatedSpeed::AssignEstimatedSpeed(Entity, DefaultValue);
    return;
}
FC_EstimatedSpeed& ModifyEstimatedSpeed(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_EstimatedSpeed));
    return local_12.GetComp();
}
FC_EstimatedSpeed& ModifyOrAddEstimatedSpeed(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_EstimatedSpeed));
    return local_12.GetComp();
}
const FC_EstimatedSpeed& GetEstimatedSpeed(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_EstimatedSpeed));
    return local_12.GetComp();
}
UFUNCTION()
FC_EstimatedSpeed GetEstimatedSpeed_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_EstimatedSpeed& local_4 = ECSFunc_FC_EstimatedSpeed::GetEstimatedSpeed(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_EstimatedSpeed();
}
const FC_EstimatedSpeed GetDefaultedEstimatedSpeed(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_EstimatedSpeed __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_EstimatedSpeed);
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
FC_EstimatedSpeed GetDefaultedEstimatedSpeed_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_EstimatedSpeed::GetDefaultedEstimatedSpeed(Entity);
}
UFUNCTION()
bool RemoveEstimatedSpeed(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_EstimatedSpeed);
}
}
FECSMonitorRuntimeView __GetMonitorEstimatedSpeedOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_EstimatedSpeed, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEstimatedSpeedOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_EstimatedSpeed, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEstimatedSpeedOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_EstimatedSpeed, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEstimatedSpeedOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_EstimatedSpeed, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEstimatedSpeedOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_EstimatedSpeed, bFixedFrame, bMustHandleAll);
}
void __MonitorEstimatedSpeedLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_EstimatedSpeed, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEstimatedSpeedActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_EstimatedSpeed, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEstimatedSpeedModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_EstimatedSpeed, bFixedFrame, Details);
    return;
}
namespace EntityBB
{
void GetEntityBBVar_EstimatedSpeed_EstimatedSpeedValue(const FECSEntity &inout Entity, float32 &inout OutRetValue)
{
    GetDefaulted local_4;
    OutRetValue = local_4.opCall().EstimatedSpeedValue();
    return;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_EstimatedSpeed &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_EstimatedSpeed &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_EstimatedSpeed &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_EstimatedSpeed
{
int __IndexOf_SampleTimeOffset()
{
    return 0;
}
int __IndexOf_bUseInternalSpeed()
{
    return 1;
}
int __IndexOf_EstimatedSpeed()
{
    return 2;
}
}
