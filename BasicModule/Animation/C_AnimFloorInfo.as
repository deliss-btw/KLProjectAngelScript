
namespace __INTENRAL_FC_AnimFloorInfo_NS
{
    const TECSComponentDerivedPtr<FC_AnimFloorInfo> DerivedPtr = TECSComponentDerivedPtr<FC_AnimFloorInfo>();
    const FC_AnimFloorInfo DefaultValue = FC_AnimFloorInfo();
}
namespace __InterpoComponentRegister
{
    const FECSInterpoManager::FAngelscriptInterpoComponentRegister FC_AnimFloorInfoRegister = FECSInterpoManager::FAngelscriptInterpoComponentRegister();

}
struct FC_AnimFloorInfo : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    FVector m_FloorNormal;
    UPROPERTY()
    float32 m_MoveDirSlope;
    UPROPERTY()
    float32 m_ForwardSlope;

    FC_AnimFloorInfo()
    {
        this.m_FloorNormal = FVector::UpVector;
        this.m_MoveDirSlope = 0.0f;
        this.m_ForwardSlope = 0.0f;
        this.__InitDirtyFlags();
        return;
    }
    FC_AnimFloorInfo(const FC_AnimFloorInfo &inout Other)
    {
        this.m_FloorNormal = FVector::UpVector;
        this.m_MoveDirSlope = 0.0f;
        this.m_ForwardSlope = 0.0f;
        this.__InitDirtyFlags();
        this.m_FloorNormal = Other.m_FloorNormal;
        this.m_MoveDirSlope = Other.m_MoveDirSlope;
        this.m_ForwardSlope = Other.m_ForwardSlope;
        return;
    }
    FC_AnimFloorInfo opAssign(const FC_AnimFloorInfo &inout Other)
    {
        FC_AnimFloorInfo __r;
        this.SetFloorNormal(Other.GetFloorNormal());
        this.SetMoveDirSlope(Other.GetMoveDirSlope());
        this.SetForwardSlope(Other.GetForwardSlope());
        return __r;
    }
    const FVector GetFloorNormal() const property
    {
        const FVector __r;
        return __r;
    }
    FVector GetModify_FloorNormal() property
    {
        FVector __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetFloorNormal(const FVector &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_FloorNormal = __Value;
        return;
    }
    float32 GetMoveDirSlope() const property
    {
        return this.m_MoveDirSlope;
    }
    void SetMoveDirSlope(const float32 __Value) property
    {
        if (this.m_MoveDirSlope == __Value)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_MoveDirSlope = __Value;
        return;
    }
    float32 GetForwardSlope() const property
    {
        return this.m_ForwardSlope;
    }
    void SetForwardSlope(const float32 __Value) property
    {
        if (this.m_ForwardSlope == __Value)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_ForwardSlope = __Value;
        return;
    }
}

namespace FC_AnimFloorInfo
{
FC_AnimFloorInfo Interpolate(const FC_AnimFloorInfo &inout A, const FC_AnimFloorInfo &inout B, const float32 T, const float32 DeltaTime)
{
    FC_AnimFloorInfo local_10;
    local_10.SetFloorNormal(FMath::Lerp(A.GetFloorNormal(), B.GetFloorNormal(), T));
    local_10.SetMoveDirSlope(FMath::Lerp(A.GetMoveDirSlope(), B.GetMoveDirSlope(), T));
    local_10.SetForwardSlope(FMath::Lerp(A.GetForwardSlope(), B.GetForwardSlope(), T));
    return local_10;
}
}
namespace ECSFunc_FC_AnimFloorInfo
{
UFUNCTION()
bool HasAnimFloorInfo(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_AnimFloorInfo);
}
FC_AnimFloorInfo& AssignAnimFloorInfo(const FECSEntity &inout Entity, const FC_AnimFloorInfo &inout DefaultValue = FC_AnimFloorInfo())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_AnimFloorInfo, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignAnimFloorInfo_BP(const FECSEntity &inout Entity, const FC_AnimFloorInfo &inout DefaultValue = FC_AnimFloorInfo())
{
    ECSFunc_FC_AnimFloorInfo::AssignAnimFloorInfo(Entity, DefaultValue);
    return;
}
FC_AnimFloorInfo& ModifyAnimFloorInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_AnimFloorInfo));
    return local_12.GetComp();
}
FC_AnimFloorInfo& ModifyOrAddAnimFloorInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_AnimFloorInfo));
    return local_12.GetComp();
}
const FC_AnimFloorInfo& GetAnimFloorInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_AnimFloorInfo));
    return local_12.GetComp();
}
UFUNCTION()
FC_AnimFloorInfo GetAnimFloorInfo_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_AnimFloorInfo& local_4 = ECSFunc_FC_AnimFloorInfo::GetAnimFloorInfo(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_AnimFloorInfo();
}
const FC_AnimFloorInfo GetDefaultedAnimFloorInfo(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_AnimFloorInfo __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_AnimFloorInfo);
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
FC_AnimFloorInfo GetDefaultedAnimFloorInfo_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_AnimFloorInfo::GetDefaultedAnimFloorInfo(Entity);
}
UFUNCTION()
bool RemoveAnimFloorInfo(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_AnimFloorInfo);
}
}
FECSMonitorRuntimeView __GetMonitorAnimFloorInfoOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_AnimFloorInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAnimFloorInfoOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_AnimFloorInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAnimFloorInfoOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_AnimFloorInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAnimFloorInfoOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_AnimFloorInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAnimFloorInfoOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_AnimFloorInfo, bFixedFrame, bMustHandleAll);
}
void __MonitorAnimFloorInfoLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_AnimFloorInfo, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAnimFloorInfoActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_AnimFloorInfo, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAnimFloorInfoModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_AnimFloorInfo, bFixedFrame, Details);
    return;
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_AnimFloorInfo &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_AnimFloorInfo &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_AnimFloorInfo &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_AnimFloorInfo
{
int __IndexOf_FloorNormal()
{
    return 0;
}
int __IndexOf_MoveDirSlope()
{
    return 1;
}
int __IndexOf_ForwardSlope()
{
    return 2;
}
}
