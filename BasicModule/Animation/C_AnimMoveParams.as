
namespace __INTENRAL_FC_AnimMoveParams_NS
{
    const TECSComponentDerivedPtr<FC_AnimMoveParams> DerivedPtr = TECSComponentDerivedPtr<FC_AnimMoveParams>();
    const FC_AnimMoveParams DefaultValue = FC_AnimMoveParams();
}
namespace __INTENRAL_FC_AnimMoveParamsTemp_NS
{
    const TECSComponentDerivedPtr<FC_AnimMoveParamsTemp> DerivedPtr = TECSComponentDerivedPtr<FC_AnimMoveParamsTemp>();
    const FC_AnimMoveParamsTemp DefaultValue = FC_AnimMoveParamsTemp();
}
namespace __InterpoComponentRegister
{
    const FECSInterpoManager::FAngelscriptInterpoComponentRegister FC_AnimMoveParamsRegister = FECSInterpoManager::FAngelscriptInterpoComponentRegister();
    const FECSInterpoManager::FAngelscriptInterpoComponentRegister FC_AnimMoveParamsTempRegister = FECSInterpoManager::FAngelscriptInterpoComponentRegister();

}
struct FC_AnimMoveParams : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    float32 m_DesiredMoveAngleRelativeToBody;
    UPROPERTY()
    float32 m_SwingTimeElapsed;

    FC_AnimMoveParams()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_AnimMoveParams(const FC_AnimMoveParams &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_AnimMoveParams opAssign(const FC_AnimMoveParams &inout Other)
    {
        FC_AnimMoveParams __r;
        this.SetDesiredMoveAngleRelativeToBody(Other.GetDesiredMoveAngleRelativeToBody());
        this.SetSwingTimeElapsed(Other.GetSwingTimeElapsed());
        return __r;
    }
    float32 GetDesiredMoveAngleRelativeToBody() const property
    {
        return this.m_DesiredMoveAngleRelativeToBody;
    }
    void SetDesiredMoveAngleRelativeToBody(const float32 __Value) property
    {
        if (this.m_DesiredMoveAngleRelativeToBody == __Value)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_DesiredMoveAngleRelativeToBody = __Value;
        return;
    }
    float32 GetSwingTimeElapsed() const property
    {
        return this.m_SwingTimeElapsed;
    }
    void SetSwingTimeElapsed(const float32 __Value) property
    {
        if (this.m_SwingTimeElapsed == __Value)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_SwingTimeElapsed = __Value;
        return;
    }
}

struct FC_AnimMoveParamsTemp : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    float32 m_DesiredMoveAngleRelativeToBodySmoothed;

    FC_AnimMoveParamsTemp()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_AnimMoveParamsTemp(const FC_AnimMoveParamsTemp &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_AnimMoveParamsTemp opAssign(const FC_AnimMoveParamsTemp &inout Other)
    {
        FC_AnimMoveParamsTemp __r;
        this.SetDesiredMoveAngleRelativeToBodySmoothed(Other.GetDesiredMoveAngleRelativeToBodySmoothed());
        return __r;
    }
    float32 GetDesiredMoveAngleRelativeToBodySmoothed() const property
    {
        return this.m_DesiredMoveAngleRelativeToBodySmoothed;
    }
    void SetDesiredMoveAngleRelativeToBodySmoothed(const float32 __Value) property
    {
        if (this.m_DesiredMoveAngleRelativeToBodySmoothed == __Value)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_DesiredMoveAngleRelativeToBodySmoothed = __Value;
        return;
    }
}

namespace FC_AnimMoveParams
{
FC_AnimMoveParams Interpolate(const FC_AnimMoveParams &inout A, const FC_AnimMoveParams &inout B, const float32 T, const float32 DeltaTime)
{
    FC_AnimMoveParams local_4;
    local_4.SetDesiredMoveAngleRelativeToBody(FMath::Lerp(A.GetDesiredMoveAngleRelativeToBody(), B.GetDesiredMoveAngleRelativeToBody(), T));
    local_4.SetSwingTimeElapsed(FMath::Lerp(A.GetSwingTimeElapsed(), B.GetSwingTimeElapsed(), T));
    return local_4;
}
}
namespace FC_AnimMoveParamsTemp
{
FC_AnimMoveParamsTemp Interpolate(const FC_AnimMoveParamsTemp &inout A, const FC_AnimMoveParamsTemp &inout B, const float32 T, const float32 DeltaTime)
{
    FC_AnimMoveParamsTemp local_2;
    local_2.SetDesiredMoveAngleRelativeToBodySmoothed(FMath::Lerp(A.GetDesiredMoveAngleRelativeToBodySmoothed(), B.GetDesiredMoveAngleRelativeToBodySmoothed(), T));
    return local_2;
}
}
namespace ECSFunc_FC_AnimMoveParams
{
UFUNCTION()
bool HasAnimMoveParams(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_AnimMoveParams);
}
FC_AnimMoveParams& AssignAnimMoveParams(const FECSEntity &inout Entity, const FC_AnimMoveParams &inout DefaultValue = FC_AnimMoveParams())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_AnimMoveParams, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignAnimMoveParams_BP(const FECSEntity &inout Entity, const FC_AnimMoveParams &inout DefaultValue = FC_AnimMoveParams())
{
    ECSFunc_FC_AnimMoveParams::AssignAnimMoveParams(Entity, DefaultValue);
    return;
}
FC_AnimMoveParams& ModifyAnimMoveParams(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_AnimMoveParams));
    return local_12.GetComp();
}
FC_AnimMoveParams& ModifyOrAddAnimMoveParams(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_AnimMoveParams));
    return local_12.GetComp();
}
const FC_AnimMoveParams& GetAnimMoveParams(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_AnimMoveParams));
    return local_12.GetComp();
}
UFUNCTION()
FC_AnimMoveParams GetAnimMoveParams_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_AnimMoveParams& local_4 = ECSFunc_FC_AnimMoveParams::GetAnimMoveParams(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_AnimMoveParams();
}
const FC_AnimMoveParams GetDefaultedAnimMoveParams(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_AnimMoveParams __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_AnimMoveParams);
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
FC_AnimMoveParams GetDefaultedAnimMoveParams_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_AnimMoveParams::GetDefaultedAnimMoveParams(Entity);
}
UFUNCTION()
bool RemoveAnimMoveParams(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_AnimMoveParams);
}
}
FECSMonitorRuntimeView __GetMonitorAnimMoveParamsOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_AnimMoveParams, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAnimMoveParamsOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_AnimMoveParams, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAnimMoveParamsOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_AnimMoveParams, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAnimMoveParamsOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_AnimMoveParams, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAnimMoveParamsOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_AnimMoveParams, bFixedFrame, bMustHandleAll);
}
void __MonitorAnimMoveParamsLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_AnimMoveParams, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAnimMoveParamsActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_AnimMoveParams, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAnimMoveParamsModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_AnimMoveParams, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_AnimMoveParamsTemp
{
UFUNCTION()
bool HasAnimMoveParamsTemp(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_AnimMoveParamsTemp);
}
FC_AnimMoveParamsTemp& AssignAnimMoveParamsTemp(const FECSEntity &inout Entity, const FC_AnimMoveParamsTemp &inout DefaultValue = FC_AnimMoveParamsTemp())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_AnimMoveParamsTemp, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignAnimMoveParamsTemp_BP(const FECSEntity &inout Entity, const FC_AnimMoveParamsTemp &inout DefaultValue = FC_AnimMoveParamsTemp())
{
    ECSFunc_FC_AnimMoveParamsTemp::AssignAnimMoveParamsTemp(Entity, DefaultValue);
    return;
}
FC_AnimMoveParamsTemp& ModifyAnimMoveParamsTemp(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_AnimMoveParamsTemp));
    return local_12.GetComp();
}
FC_AnimMoveParamsTemp& ModifyOrAddAnimMoveParamsTemp(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_AnimMoveParamsTemp));
    return local_12.GetComp();
}
const FC_AnimMoveParamsTemp& GetAnimMoveParamsTemp(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_AnimMoveParamsTemp));
    return local_12.GetComp();
}
UFUNCTION()
FC_AnimMoveParamsTemp GetAnimMoveParamsTemp_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_AnimMoveParamsTemp& local_4 = ECSFunc_FC_AnimMoveParamsTemp::GetAnimMoveParamsTemp(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_AnimMoveParamsTemp();
}
const FC_AnimMoveParamsTemp GetDefaultedAnimMoveParamsTemp(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_AnimMoveParamsTemp __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_AnimMoveParamsTemp);
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
FC_AnimMoveParamsTemp GetDefaultedAnimMoveParamsTemp_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_AnimMoveParamsTemp::GetDefaultedAnimMoveParamsTemp(Entity);
}
UFUNCTION()
bool RemoveAnimMoveParamsTemp(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_AnimMoveParamsTemp);
}
}
FECSMonitorRuntimeView __GetMonitorAnimMoveParamsTempOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_AnimMoveParamsTemp, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAnimMoveParamsTempOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_AnimMoveParamsTemp, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAnimMoveParamsTempOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_AnimMoveParamsTemp, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAnimMoveParamsTempOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_AnimMoveParamsTemp, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAnimMoveParamsTempOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_AnimMoveParamsTemp, bFixedFrame, bMustHandleAll);
}
void __MonitorAnimMoveParamsTempLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_AnimMoveParamsTemp, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAnimMoveParamsTempActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_AnimMoveParamsTemp, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAnimMoveParamsTempModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_AnimMoveParamsTemp, bFixedFrame, Details);
    return;
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_AnimMoveParams &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_AnimMoveParams &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_AnimMoveParams &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_AnimMoveParams
{
int __IndexOf_DesiredMoveAngleRelativeToBody()
{
    return 0;
}
int __IndexOf_SwingTimeElapsed()
{
    return 1;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_AnimMoveParamsTemp &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_AnimMoveParamsTemp &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_AnimMoveParamsTemp &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_AnimMoveParamsTemp
{
int __IndexOf_DesiredMoveAngleRelativeToBodySmoothed()
{
    return 0;
}
}
