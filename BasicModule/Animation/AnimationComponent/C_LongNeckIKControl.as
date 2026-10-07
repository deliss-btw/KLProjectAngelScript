
namespace __INTENRAL_FC_LongNeckIKControl_NS
{
    const TECSComponentDerivedPtr<FC_LongNeckIKControl> DerivedPtr = TECSComponentDerivedPtr<FC_LongNeckIKControl>();
    const FC_LongNeckIKControl DefaultValue = FC_LongNeckIKControl();
}
namespace __InterpoComponentRegister
{
    const FECSInterpoManager::FAngelscriptInterpoComponentRegister FC_LongNeckIKControlRegister = FECSInterpoManager::FAngelscriptInterpoComponentRegister();

}
struct FC_LongNeckIKControl : FECSComponent
{
    FRootDirtyFlags16 __DirtyFlags;
    UPROPERTY()
    float32 m_Yaw;
    UPROPERTY()
    float32 m_Pitch;
    UPROPERTY()
    float32 m_Weight;
    UPROPERTY()
    float32 m_NeckRootTangentIntensity;
    UPROPERTY()
    float32 m_NeckTailTangentIntensity;
    UPROPERTY()
    FVector m_LookAtTarget;
    UPROPERTY()
    float32 m_HeadTwistDecoWeight;
    UPROPERTY()
    float32 m_TargetWeight;
    UPROPERTY()
    float32 m_TargetHeadTwistDecoWeight;
    UPROPERTY()
    float32 m_TargetNeckRootTangentIntensity;
    UPROPERTY()
    float32 m_TargetNeckTailTangentIntensity;
    UPROPERTY()
    float32 m_TangentIntensityLerpSpeed;
    UPROPERTY()
    float32 m_LookAtTargetLerpSpeed;

    FC_LongNeckIKControl()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_LongNeckIKControl(const FC_LongNeckIKControl &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_LongNeckIKControl opAssign(const FC_LongNeckIKControl &inout Other)
    {
        FC_LongNeckIKControl __r;
        this.SetYaw(Other.GetYaw());
        this.SetPitch(Other.GetPitch());
        this.SetWeight(Other.GetWeight());
        this.SetNeckRootTangentIntensity(Other.GetNeckRootTangentIntensity());
        this.SetNeckTailTangentIntensity(Other.GetNeckTailTangentIntensity());
        this.SetLookAtTarget(Other.GetLookAtTarget());
        this.SetHeadTwistDecoWeight(Other.GetHeadTwistDecoWeight());
        this.SetTargetWeight(Other.GetTargetWeight());
        this.SetTargetHeadTwistDecoWeight(Other.GetTargetHeadTwistDecoWeight());
        this.SetTargetNeckRootTangentIntensity(Other.GetTargetNeckRootTangentIntensity());
        this.SetTargetNeckTailTangentIntensity(Other.GetTargetNeckTailTangentIntensity());
        this.SetTangentIntensityLerpSpeed(Other.GetTangentIntensityLerpSpeed());
        this.SetLookAtTargetLerpSpeed(Other.GetLookAtTargetLerpSpeed());
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
        this.__MarkDirty(2);
        this.m_Weight = __Value;
        return;
    }
    float32 GetNeckRootTangentIntensity() const property
    {
        return this.m_NeckRootTangentIntensity;
    }
    void SetNeckRootTangentIntensity(const float32 __Value) property
    {
        if (this.m_NeckRootTangentIntensity == __Value)
        {
            return;
        }
        this.__MarkDirty(3);
        this.m_NeckRootTangentIntensity = __Value;
        return;
    }
    float32 GetNeckTailTangentIntensity() const property
    {
        return this.m_NeckTailTangentIntensity;
    }
    void SetNeckTailTangentIntensity(const float32 __Value) property
    {
        if (this.m_NeckTailTangentIntensity == __Value)
        {
            return;
        }
        this.__MarkDirty(4);
        this.m_NeckTailTangentIntensity = __Value;
        return;
    }
    const FVector GetLookAtTarget() const property
    {
        const FVector __r;
        return __r;
    }
    FVector GetModify_LookAtTarget() property
    {
        FVector __r;
        this.__MarkDirty(5);
        return __r;
    }
    void SetLookAtTarget(const FVector &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(5);
        this.m_LookAtTarget = __Value;
        return;
    }
    float32 GetHeadTwistDecoWeight() const property
    {
        return this.m_HeadTwistDecoWeight;
    }
    void SetHeadTwistDecoWeight(const float32 __Value) property
    {
        if (this.m_HeadTwistDecoWeight == __Value)
        {
            return;
        }
        this.__MarkDirty(6);
        this.m_HeadTwistDecoWeight = __Value;
        return;
    }
    float32 GetTargetWeight() const property
    {
        return this.m_TargetWeight;
    }
    void SetTargetWeight(const float32 __Value) property
    {
        if (this.m_TargetWeight == __Value)
        {
            return;
        }
        this.__MarkDirty(7);
        this.m_TargetWeight = __Value;
        return;
    }
    float32 GetTargetHeadTwistDecoWeight() const property
    {
        return this.m_TargetHeadTwistDecoWeight;
    }
    void SetTargetHeadTwistDecoWeight(const float32 __Value) property
    {
        if (this.m_TargetHeadTwistDecoWeight == __Value)
        {
            return;
        }
        this.__MarkDirty(8);
        this.m_TargetHeadTwistDecoWeight = __Value;
        return;
    }
    float32 GetTargetNeckRootTangentIntensity() const property
    {
        return this.m_TargetNeckRootTangentIntensity;
    }
    void SetTargetNeckRootTangentIntensity(const float32 __Value) property
    {
        if (this.m_TargetNeckRootTangentIntensity == __Value)
        {
            return;
        }
        this.__MarkDirty(9);
        this.m_TargetNeckRootTangentIntensity = __Value;
        return;
    }
    float32 GetTargetNeckTailTangentIntensity() const property
    {
        return this.m_TargetNeckTailTangentIntensity;
    }
    void SetTargetNeckTailTangentIntensity(const float32 __Value) property
    {
        if (this.m_TargetNeckTailTangentIntensity == __Value)
        {
            return;
        }
        this.__MarkDirty(10);
        this.m_TargetNeckTailTangentIntensity = __Value;
        return;
    }
    float32 GetTangentIntensityLerpSpeed() const property
    {
        return this.m_TangentIntensityLerpSpeed;
    }
    void SetTangentIntensityLerpSpeed(const float32 __Value) property
    {
        if (this.m_TangentIntensityLerpSpeed == __Value)
        {
            return;
        }
        this.__MarkDirty(11);
        this.m_TangentIntensityLerpSpeed = __Value;
        return;
    }
    float32 GetLookAtTargetLerpSpeed() const property
    {
        return this.m_LookAtTargetLerpSpeed;
    }
    void SetLookAtTargetLerpSpeed(const float32 __Value) property
    {
        if (this.m_LookAtTargetLerpSpeed == __Value)
        {
            return;
        }
        this.__MarkDirty(12);
        this.m_LookAtTargetLerpSpeed = __Value;
        return;
    }
}

namespace FC_LongNeckIKControl
{
FC_LongNeckIKControl Interpolate(const FC_LongNeckIKControl &inout A, const FC_LongNeckIKControl &inout B, const float32 T, const float32 DeltaTime)
{
    FC_LongNeckIKControl local_20;
    local_20.SetWeight(FMath::Lerp(A.GetWeight(), B.GetWeight(), T));
    local_20.SetNeckRootTangentIntensity(FMath::Lerp(A.GetNeckRootTangentIntensity(), B.GetNeckRootTangentIntensity(), T));
    local_20.SetNeckTailTangentIntensity(FMath::Lerp(A.GetNeckTailTangentIntensity(), B.GetNeckTailTangentIntensity(), T));
    local_20.SetPitch(FMath::Lerp(A.GetPitch(), B.GetPitch(), T));
    local_20.SetYaw(FMath::Lerp(A.GetYaw(), B.GetYaw(), T));
    local_20.SetLookAtTarget(FMath::Lerp(A.GetLookAtTarget(), B.GetLookAtTarget(), T));
    local_20.SetHeadTwistDecoWeight(FMath::Lerp(A.GetHeadTwistDecoWeight(), B.GetHeadTwistDecoWeight(), T));
    local_20.SetTargetWeight(FMath::Lerp(A.GetTargetWeight(), B.GetTargetWeight(), T));
    local_20.SetTargetNeckRootTangentIntensity(FMath::Lerp(A.GetTargetNeckRootTangentIntensity(), B.GetTargetNeckRootTangentIntensity(), T));
    local_20.SetTargetNeckTailTangentIntensity(FMath::Lerp(A.GetTargetNeckTailTangentIntensity(), B.GetTargetNeckTailTangentIntensity(), T));
    return local_20;
}
}
namespace ECSFunc_FC_LongNeckIKControl
{
UFUNCTION()
bool HasLongNeckIKControl(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_LongNeckIKControl);
}
FC_LongNeckIKControl& AssignLongNeckIKControl(const FECSEntity &inout Entity, const FC_LongNeckIKControl &inout DefaultValue = FC_LongNeckIKControl())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_LongNeckIKControl, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignLongNeckIKControl_BP(const FECSEntity &inout Entity, const FC_LongNeckIKControl &inout DefaultValue = FC_LongNeckIKControl())
{
    ECSFunc_FC_LongNeckIKControl::AssignLongNeckIKControl(Entity, DefaultValue);
    return;
}
FC_LongNeckIKControl& ModifyLongNeckIKControl(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_LongNeckIKControl));
    return local_12.GetComp();
}
FC_LongNeckIKControl& ModifyOrAddLongNeckIKControl(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_LongNeckIKControl));
    return local_12.GetComp();
}
const FC_LongNeckIKControl& GetLongNeckIKControl(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_LongNeckIKControl));
    return local_12.GetComp();
}
UFUNCTION()
FC_LongNeckIKControl GetLongNeckIKControl_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_LongNeckIKControl& local_4 = ECSFunc_FC_LongNeckIKControl::GetLongNeckIKControl(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_LongNeckIKControl();
}
const FC_LongNeckIKControl GetDefaultedLongNeckIKControl(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_LongNeckIKControl __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_LongNeckIKControl);
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
FC_LongNeckIKControl GetDefaultedLongNeckIKControl_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_LongNeckIKControl::GetDefaultedLongNeckIKControl(Entity);
}
UFUNCTION()
bool RemoveLongNeckIKControl(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_LongNeckIKControl);
}
}
FECSMonitorRuntimeView __GetMonitorLongNeckIKControlOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_LongNeckIKControl, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLongNeckIKControlOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_LongNeckIKControl, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLongNeckIKControlOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_LongNeckIKControl, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLongNeckIKControlOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_LongNeckIKControl, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLongNeckIKControlOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_LongNeckIKControl, bFixedFrame, bMustHandleAll);
}
void __MonitorLongNeckIKControlLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_LongNeckIKControl, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorLongNeckIKControlActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_LongNeckIKControl, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorLongNeckIKControlModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_LongNeckIKControl, bFixedFrame, Details);
    return;
}
namespace AutoDelta
{
FRootDirtyFlags16 GetDirtyFlags(FC_LongNeckIKControl &inout Data)
{
    FRootDirtyFlags16 __r;
    return __r;
}
void InitDirtyFlags(FC_LongNeckIKControl &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_LongNeckIKControl &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_LongNeckIKControl
{
int __IndexOf_Yaw()
{
    return 0;
}
int __IndexOf_Pitch()
{
    return 1;
}
int __IndexOf_Weight()
{
    return 2;
}
int __IndexOf_NeckRootTangentIntensity()
{
    return 3;
}
int __IndexOf_NeckTailTangentIntensity()
{
    return 4;
}
int __IndexOf_LookAtTarget()
{
    return 5;
}
int __IndexOf_HeadTwistDecoWeight()
{
    return 6;
}
int __IndexOf_TargetWeight()
{
    return 7;
}
int __IndexOf_TargetHeadTwistDecoWeight()
{
    return 8;
}
int __IndexOf_TargetNeckRootTangentIntensity()
{
    return 9;
}
int __IndexOf_TargetNeckTailTangentIntensity()
{
    return 10;
}
int __IndexOf_TangentIntensityLerpSpeed()
{
    return 11;
}
int __IndexOf_LookAtTargetLerpSpeed()
{
    return 12;
}
}
