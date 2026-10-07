
namespace __INTENRAL_FC_AnimRiderHandIK_NS
{
    const TECSComponentDerivedPtr<FC_AnimRiderHandIK> DerivedPtr = TECSComponentDerivedPtr<FC_AnimRiderHandIK>();
    const FC_AnimRiderHandIK DefaultValue = FC_AnimRiderHandIK();
}
namespace __InterpoComponentRegister
{
    const FECSInterpoManager::FAngelscriptInterpoComponentRegister FC_AnimRiderHandIKRegister = FECSInterpoManager::FAngelscriptInterpoComponentRegister();

}
struct FC_AnimRiderHandIK : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    float32 m_Weight;
    UPROPERTY()
    float32 m_LeftHandWeight;
    UPROPERTY()
    float32 m_RightHandWeight;

    FC_AnimRiderHandIK()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_AnimRiderHandIK(const FC_AnimRiderHandIK &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_AnimRiderHandIK opAssign(const FC_AnimRiderHandIK &inout Other)
    {
        FC_AnimRiderHandIK __r;
        this.SetWeight(Other.GetWeight());
        this.SetLeftHandWeight(Other.GetLeftHandWeight());
        this.SetRightHandWeight(Other.GetRightHandWeight());
        return __r;
    }
    float32 GetWeight() const property
    {
        return this.m_Weight;
    }
    void SetWeight(const float32 __Value) property
    {
        if (this.m_Weight == __Value)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_Weight = __Value;
        return;
    }
    float32 GetLeftHandWeight() const property
    {
        return this.m_LeftHandWeight;
    }
    void SetLeftHandWeight(const float32 __Value) property
    {
        if (this.m_LeftHandWeight == __Value)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_LeftHandWeight = __Value;
        return;
    }
    float32 GetRightHandWeight() const property
    {
        return this.m_RightHandWeight;
    }
    void SetRightHandWeight(const float32 __Value) property
    {
        if (this.m_RightHandWeight == __Value)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_RightHandWeight = __Value;
        return;
    }
}

class UESMAction_AnimRiderHandIK : UESMBPBaseSpanTickAction
{
    UPROPERTY()
    FRuntimeFloatCurve WeightCurve = FRuntimeCurveUtils::CreateLinear(0.0f, 1.0f, 1.0f, 1.0f);
    UPROPERTY()
    float32 LeftHandWeight = 1.0f;
    UPROPERTY()
    float32 RightHandWeight = 1.0f;


    UFUNCTION()
    EESMActionType GetActionType_Implementation() const
    {
        return EESMActionType(1);
    }
    UFUNCTION()
    void Enter_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        int local_8 = 0;
        if (!(Context.GetEntity().IsValid()))
        {
            return;
        }
        local_8.SetWeight(this.WeightCurve.GetFloatValue(0.0f, 0.0f));
        local_8.SetLeftHandWeight(this.LeftHandWeight);
        local_8.SetRightHandWeight(this.RightHandWeight);
        return;
    }
    UFUNCTION()
    void Tick_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        int local_8 = 0;
        float32 local_17;
        if (!(Context.GetEntity().IsValid()))
        {
            return;
        }
        if (!(local_8))
        {
            return;
        }
        float local_12 = Time.ActionDuration.ToSeconds();
        float32 local_13 = float32(local_12);
        if (local_13 > 0.0f)
        {
            local_17 = float32((Time.ActionLastTime.ToSeconds() / local_13));
        }
        else
        {
            local_17 = 0.0f;
        }
        local_8.SetWeight(this.WeightCurve.GetFloatValue(local_17, 0.0f));
        local_8.SetLeftHandWeight(this.LeftHandWeight);
        local_8.SetRightHandWeight(this.RightHandWeight);
        return;
    }
    UFUNCTION()
    void Exit_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        if (!(Context.GetEntity().IsValid()))
        {
            return;
        }
        Modify local_6;
        FC_AnimRiderHandIK& local_8 = local_6.opCall();
        if (local_8)
        {
            local_8.SetWeight(0.0f);
        }
        return;
    }
}

namespace FC_AnimRiderHandIK
{
FC_AnimRiderHandIK Interpolate(const FC_AnimRiderHandIK &inout A, const FC_AnimRiderHandIK &inout B, const float32 T, const float32 DeltaTime)
{
    FC_AnimRiderHandIK local_4;
    local_4.SetWeight(FMath::Lerp(A.GetWeight(), B.GetWeight(), T));
    local_4.SetLeftHandWeight(FMath::Lerp(A.GetLeftHandWeight(), B.GetLeftHandWeight(), T));
    local_4.SetRightHandWeight(FMath::Lerp(A.GetRightHandWeight(), B.GetRightHandWeight(), T));
    return local_4;
}
}
namespace ECSFunc_FC_AnimRiderHandIK
{
UFUNCTION()
bool HasAnimRiderHandIK(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_AnimRiderHandIK);
}
FC_AnimRiderHandIK& AssignAnimRiderHandIK(const FECSEntity &inout Entity, const FC_AnimRiderHandIK &inout DefaultValue = FC_AnimRiderHandIK())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_AnimRiderHandIK, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignAnimRiderHandIK_BP(const FECSEntity &inout Entity, const FC_AnimRiderHandIK &inout DefaultValue = FC_AnimRiderHandIK())
{
    ECSFunc_FC_AnimRiderHandIK::AssignAnimRiderHandIK(Entity, DefaultValue);
    return;
}
FC_AnimRiderHandIK& ModifyAnimRiderHandIK(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_AnimRiderHandIK));
    return local_12.GetComp();
}
FC_AnimRiderHandIK& ModifyOrAddAnimRiderHandIK(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_AnimRiderHandIK));
    return local_12.GetComp();
}
const FC_AnimRiderHandIK& GetAnimRiderHandIK(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_AnimRiderHandIK));
    return local_12.GetComp();
}
UFUNCTION()
FC_AnimRiderHandIK GetAnimRiderHandIK_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_AnimRiderHandIK& local_4 = ECSFunc_FC_AnimRiderHandIK::GetAnimRiderHandIK(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_AnimRiderHandIK();
}
const FC_AnimRiderHandIK GetDefaultedAnimRiderHandIK(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_AnimRiderHandIK __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_AnimRiderHandIK);
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
FC_AnimRiderHandIK GetDefaultedAnimRiderHandIK_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_AnimRiderHandIK::GetDefaultedAnimRiderHandIK(Entity);
}
UFUNCTION()
bool RemoveAnimRiderHandIK(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_AnimRiderHandIK);
}
}
FECSMonitorRuntimeView __GetMonitorAnimRiderHandIKOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_AnimRiderHandIK, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAnimRiderHandIKOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_AnimRiderHandIK, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAnimRiderHandIKOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_AnimRiderHandIK, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAnimRiderHandIKOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_AnimRiderHandIK, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAnimRiderHandIKOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_AnimRiderHandIK, bFixedFrame, bMustHandleAll);
}
void __MonitorAnimRiderHandIKLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_AnimRiderHandIK, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAnimRiderHandIKActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_AnimRiderHandIK, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAnimRiderHandIKModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_AnimRiderHandIK, bFixedFrame, Details);
    return;
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_AnimRiderHandIK &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_AnimRiderHandIK &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_AnimRiderHandIK &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_AnimRiderHandIK
{
int __IndexOf_Weight()
{
    return 0;
}
int __IndexOf_LeftHandWeight()
{
    return 1;
}
int __IndexOf_RightHandWeight()
{
    return 2;
}
}
