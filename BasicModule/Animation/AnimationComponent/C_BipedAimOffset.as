
namespace __INTENRAL_FC_BipedAimOffset_NS
{
    const TECSComponentDerivedPtr<FC_BipedAimOffset> DerivedPtr = TECSComponentDerivedPtr<FC_BipedAimOffset>();
    const FC_BipedAimOffset DefaultValue = FC_BipedAimOffset();
}
namespace __InterpoComponentRegister
{
    const FECSInterpoManager::FAngelscriptInterpoComponentRegister FC_BipedAimOffsetRegister = FECSInterpoManager::FAngelscriptInterpoComponentRegister();

}
struct FC_BipedAimOffset : FECSComponent
{
    FRootDirtyFlags16 __DirtyFlags;
    UPROPERTY()
    float32 m_Weight;
    UPROPERTY()
    FVector m_InitializeTargetLocation;
    UPROPERTY()
    float32 m_InputPitch;
    UPROPERTY()
    float32 m_MinPitch;
    UPROPERTY()
    float32 m_MaxPitch;
    UPROPERTY()
    float32 m_InputYaw;
    UPROPERTY()
    float32 m_MinYaw;
    UPROPERTY()
    float32 m_MaxYaw;
    UPROPERTY()
    bool m_EnableAdjustPelvis;
    UPROPERTY()
    bool m_EnableAdjustSpine;
    UPROPERTY()
    bool m_EnableAdjustHead;
    UPROPERTY()
    bool m_EnableAdjustLeftArm;
    UPROPERTY()
    bool m_EnableAdjustRightArm;

    FC_BipedAimOffset()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_BipedAimOffset(const FC_BipedAimOffset &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_BipedAimOffset opAssign(const FC_BipedAimOffset &inout Other)
    {
        FC_BipedAimOffset __r;
        this.SetWeight(Other.GetWeight());
        this.SetInitializeTargetLocation(Other.GetInitializeTargetLocation());
        this.SetInputPitch(Other.GetInputPitch());
        this.SetMinPitch(Other.GetMinPitch());
        this.SetMaxPitch(Other.GetMaxPitch());
        this.SetInputYaw(Other.GetInputYaw());
        this.SetMinYaw(Other.GetMinYaw());
        this.SetMaxYaw(Other.GetMaxYaw());
        this.SetEnableAdjustPelvis(Other.GetEnableAdjustPelvis());
        this.SetEnableAdjustSpine(Other.GetEnableAdjustSpine());
        this.SetEnableAdjustHead(Other.GetEnableAdjustHead());
        this.SetEnableAdjustLeftArm(Other.GetEnableAdjustLeftArm());
        this.SetEnableAdjustRightArm(Other.GetEnableAdjustRightArm());
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
    const FVector GetInitializeTargetLocation() const property
    {
        const FVector __r;
        return __r;
    }
    FVector GetModify_InitializeTargetLocation() property
    {
        FVector __r;
        this.__MarkDirty(1);
        return __r;
    }
    void SetInitializeTargetLocation(const FVector &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_InitializeTargetLocation = __Value;
        return;
    }
    float32 GetInputPitch() const property
    {
        return this.m_InputPitch;
    }
    void SetInputPitch(const float32 __Value) property
    {
        if (this.m_InputPitch == __Value)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_InputPitch = __Value;
        return;
    }
    float32 GetMinPitch() const property
    {
        return this.m_MinPitch;
    }
    void SetMinPitch(const float32 __Value) property
    {
        if (this.m_MinPitch == __Value)
        {
            return;
        }
        this.__MarkDirty(3);
        this.m_MinPitch = __Value;
        return;
    }
    float32 GetMaxPitch() const property
    {
        return this.m_MaxPitch;
    }
    void SetMaxPitch(const float32 __Value) property
    {
        if (this.m_MaxPitch == __Value)
        {
            return;
        }
        this.__MarkDirty(4);
        this.m_MaxPitch = __Value;
        return;
    }
    float32 GetInputYaw() const property
    {
        return this.m_InputYaw;
    }
    void SetInputYaw(const float32 __Value) property
    {
        if (this.m_InputYaw == __Value)
        {
            return;
        }
        this.__MarkDirty(5);
        this.m_InputYaw = __Value;
        return;
    }
    float32 GetMinYaw() const property
    {
        return this.m_MinYaw;
    }
    void SetMinYaw(const float32 __Value) property
    {
        if (this.m_MinYaw == __Value)
        {
            return;
        }
        this.__MarkDirty(6);
        this.m_MinYaw = __Value;
        return;
    }
    float32 GetMaxYaw() const property
    {
        return this.m_MaxYaw;
    }
    void SetMaxYaw(const float32 __Value) property
    {
        if (this.m_MaxYaw == __Value)
        {
            return;
        }
        this.__MarkDirty(7);
        this.m_MaxYaw = __Value;
        return;
    }
    bool GetEnableAdjustPelvis() const property
    {
        return this.m_EnableAdjustPelvis;
    }
    void SetEnableAdjustPelvis(const bool __Value) property
    {
        if (!(this.m_EnableAdjustPelvis) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(8);
        this.m_EnableAdjustPelvis = __Value;
        return;
    }
    bool GetEnableAdjustSpine() const property
    {
        return this.m_EnableAdjustSpine;
    }
    void SetEnableAdjustSpine(const bool __Value) property
    {
        if (!(this.m_EnableAdjustSpine) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(9);
        this.m_EnableAdjustSpine = __Value;
        return;
    }
    bool GetEnableAdjustHead() const property
    {
        return this.m_EnableAdjustHead;
    }
    void SetEnableAdjustHead(const bool __Value) property
    {
        if (!(this.m_EnableAdjustHead) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(10);
        this.m_EnableAdjustHead = __Value;
        return;
    }
    bool GetEnableAdjustLeftArm() const property
    {
        return this.m_EnableAdjustLeftArm;
    }
    void SetEnableAdjustLeftArm(const bool __Value) property
    {
        if (!(this.m_EnableAdjustLeftArm) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(11);
        this.m_EnableAdjustLeftArm = __Value;
        return;
    }
    bool GetEnableAdjustRightArm() const property
    {
        return this.m_EnableAdjustRightArm;
    }
    void SetEnableAdjustRightArm(const bool __Value) property
    {
        if (!(this.m_EnableAdjustRightArm) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(12);
        this.m_EnableAdjustRightArm = __Value;
        return;
    }
}

class UESMAction_BipedAimOffset : UESMBPBaseSpanTickAction
{
    UPROPERTY()
    bool AdjustByTarget = false;
    UPROPERTY()
    bool AdjustByGround = true;
    UPROPERTY()
    FVector InitializeTargetLocation = FVector(70.0, 0.0, 100.0);
    UPROPERTY()
    float32 KeepStartTime = 0.25f;
    UPROPERTY()
    float32 KeepEndTime = 0.75f;
    UPROPERTY()
    float32 MinPitch = -30.0f;
    UPROPERTY()
    float32 MaxPitch = 30.0f;
    UPROPERTY()
    float32 MinYaw = -0.0f;
    UPROPERTY()
    float32 MaxYaw = 0.0f;
    UPROPERTY()
    bool EnableAdjustPelvis = true;
    UPROPERTY()
    bool EnableAdjustSpine = true;
    UPROPERTY()
    bool EnableAdjustHead = true;
    UPROPERTY()
    bool EnableAdjustRightArm = true;
    UPROPERTY()
    bool EnableAdjustLeftArm = true;


    UFUNCTION()
    EESMAssetWorkflow GetWorkflow_Implementation() const
    {
        return EESMAssetWorkflow(6);
    }
    UFUNCTION()
    void OnExtraTimeStampChanged_Implementation(const int Index, const FESMExtraTimeStamp &inout ChangedExtraTimeStamp)
    {
        if (Index == 0)
        {
            this.KeepStartTime = float32(ChangedExtraTimeStamp.ActionTime.ToSeconds());
            return;
        }
        if (Index == 1)
        {
            this.KeepEndTime = float32(ChangedExtraTimeStamp.ActionTime.ToSeconds());
        }
        return;
    }
    UFUNCTION()
    void GetExtraTimeStamp_Implementation(TArray<FESMExtraTimeStamp> &inout OutTimeStamps) const
    {
        FESMExtraTimeStamp local_4;
        local_4.ActionTime = this.KeepStartTime;
        OutTimeStamps.Add(local_4);
        local_4.ActionTime = this.KeepEndTime;
        OutTimeStamps.Add(local_4);
        return;
    }
    UFUNCTION()
    void Enter_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        ModifyOrAdd local_4;
        FC_BipedAimOffset& local_6 = local_4.opCall();
        if (local_6)
        {
            local_6.SetInitializeTargetLocation(this.InitializeTargetLocation);
            local_6.SetMinPitch(this.MinPitch);
            local_6.SetMaxPitch(this.MaxPitch);
            local_6.SetMinYaw(this.MinYaw);
            local_6.SetMaxYaw(this.MaxYaw);
            local_6.SetEnableAdjustPelvis(this.EnableAdjustPelvis);
            local_6.SetEnableAdjustSpine(this.EnableAdjustSpine);
            local_6.SetEnableAdjustHead(this.EnableAdjustHead);
            local_6.SetEnableAdjustRightArm(this.EnableAdjustRightArm);
            local_6.SetEnableAdjustLeftArm(this.EnableAdjustLeftArm);
        }
        return;
    }
    UFUNCTION()
    void Tick_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        int local_26 = 0;
        int local_32 = 0;
        int local_38 = 0;
        ModifyOrAdd local_4;
        FC_BipedAimOffset& local_6 = local_4.opCall();
        if (local_6)
        {
            float local_10 = Time.ActionLastTime.ToSeconds();
            float32 local_11 = float32(local_10);
            float local_10_2 = Time.ActionDuration.ToSeconds();
            float32 local_8 = float32(local_10_2);
            if ((local_11 < this.KeepStartTime && (this.KeepStartTime > 0.0f)))
            {
                local_6.SetWeight(local_11 / this.KeepStartTime);
            }
            else
            {
                if ((local_11 > this.KeepEndTime && (this.KeepEndTime < local_8)))
                {
                    local_6.SetWeight(((local_8 - local_11) / (local_8 - this.KeepEndTime)));
                }
                else
                {
                    local_6.SetWeight(1.0f);
                }
            }
            FVector local_20;
            if (this.AdjustByGround)
            {
                Get local_42;
                const FC_CharacterMovement& local_44 = local_42.opCall();
                if (local_44)
                {
                    FVector local_50 = local_38.ToFTransform().InverseTransformVector(FVector(local_44.GetFloorInfo().FloorNormal));
                    FVector local_82 = local_50.GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector);
                    float local_10_3 = FMath::RadiansToDegrees(FMath::Atan2(local_50.Z, local_50.X));
                    local_6.SetInputPitch((float32(local_10_3) - 90.0f));
                    local_6.SetInputYaw(0.0f);
                }
            }
            if (this.AdjustByTarget)
            {
                FRotator local_98 = FCharacterInputUtils::GetViewInputDir(Context.GetEntity(), Time.WorldTime);
                FVector local_82_2 = FCharacterInputUtils::GetViewOffset(Context.GetEntity(), Time.WorldTime);
                FVector local_50_2 = FVector(0.0, 0.0, 30.0);
                if (local_26 && local_26.GetbCachedValidLockTargetPosition() && !(local_32.GetbIsAiming()))
                {
                    local_20 = local_26.GetLogicLockTargetPosition();
                    local_20 = (local_38.ToFTransform().InverseTransformPosition(local_20) - local_50_2);
                    FVector local_110 = local_20.GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector);
                    float local_10_4 = FMath::RadiansToDegrees(FMath::Atan2(local_20.Y, local_20.X));
                    local_6.SetInputYaw(float32(local_10_4));
                    float local_84 = local_20.X * local_20.X;
                    float local_86 = local_20.Y * local_20.Y;
                    float local_10_5 = FMath::Atan2(local_20.Z, FMath::Sqrt((local_84 + local_86)));
                    local_86 = FMath::RadiansToDegrees(local_10_5);
                    local_6.SetInputPitch(float32(local_86));
                    return;
                }
                if (local_32.GetbIsAiming())
                {
                    FVector local_110_2 = (FVector(local_38.GetPosition()) + local_82_2);
                    local_20 = (local_110_2 + (local_98.GetForwardVector() * 1000.0));
                    local_20 = (local_38.ToFTransform().InverseTransformPosition(local_20) - local_50_2);
                    FVector local_116_2 = local_20.GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector);
                    float local_10_6 = FMath::RadiansToDegrees(FMath::Atan2(local_20.Y, local_20.X));
                    local_6.SetInputYaw(float32(local_10_6));
                    float local_84_2 = local_20.X * local_20.X;
                    float local_86_2 = local_20.Y * local_20.Y;
                    float local_10_7 = FMath::Atan2(local_20.Z, FMath::Sqrt((local_84_2 + local_86_2)));
                    local_86_2 = FMath::RadiansToDegrees(local_10_7);
                    local_6.SetInputPitch(float32(local_86_2));
                }
            }
        }
        return;
    }
    UFUNCTION()
    void Exit_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        ModifyOrAdd local_4;
        FC_BipedAimOffset& local_6 = local_4.opCall();
        if (local_6)
        {
            local_6.SetWeight(0.0f);
            local_6.SetInputPitch(0.0f);
            local_6.SetInputYaw(0.0f);
        }
        return;
    }
    UFUNCTION()
    bool CanPreview_Implementation() const
    {
        return true;
    }
    UFUNCTION()
    void Gizmos_Implementation(const FESMPreviewContext &inout Context, const FESMActionTime &inout Time)
    {
        GetDefaulted local_6;
        float32 local_7 = local_6.opCall().GetScaledHalfHeight();
        GetDefaulted local_18;
        FVector local_56 = (local_18.opCall().ToFTransform().GetLocation() + this.InitializeTargetLocation);
        local_56.Z -= local_7;
        DebugDraw::DrawDebugSphere(Context.GetWorld(), local_56, 5.0f, 32, FColor::Red, true, -1.0f, uint8(0), 0.0f);
        return;
    }
}

namespace FC_BipedAimOffset
{
FC_BipedAimOffset Interpolate(const FC_BipedAimOffset &inout A, const FC_BipedAimOffset &inout B, const float32 T, const float32 DeltaTime)
{
    FC_BipedAimOffset local_16;
    local_16.SetWeight(FMath::Lerp(A.GetWeight(), B.GetWeight(), T));
    local_16.SetInitializeTargetLocation(FMath::Lerp(A.GetInitializeTargetLocation(), B.GetInitializeTargetLocation(), T));
    local_16.SetInputPitch(FMath::Lerp(A.GetInputPitch(), B.GetInputPitch(), T));
    local_16.SetMinPitch(FMath::Lerp(A.GetMinPitch(), B.GetMinPitch(), T));
    local_16.SetMaxPitch(FMath::Lerp(A.GetMaxPitch(), B.GetMaxPitch(), T));
    local_16.SetInputYaw(FMath::Lerp(A.GetInputYaw(), B.GetInputYaw(), T));
    local_16.SetMinYaw(FMath::Lerp(A.GetMinYaw(), B.GetMinYaw(), T));
    local_16.SetMaxYaw(FMath::Lerp(A.GetMaxYaw(), B.GetMaxYaw(), T));
    local_16.SetEnableAdjustPelvis(A.GetEnableAdjustPelvis());
    local_16.SetEnableAdjustSpine(A.GetEnableAdjustSpine());
    local_16.SetEnableAdjustHead(A.GetEnableAdjustHead());
    local_16.SetEnableAdjustRightArm(A.GetEnableAdjustRightArm());
    local_16.SetEnableAdjustLeftArm(A.GetEnableAdjustLeftArm());
    return local_16;
}
}
namespace ECSFunc_FC_BipedAimOffset
{
UFUNCTION()
bool HasBipedAimOffset(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_BipedAimOffset);
}
FC_BipedAimOffset& AssignBipedAimOffset(const FECSEntity &inout Entity, const FC_BipedAimOffset &inout DefaultValue = FC_BipedAimOffset())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_BipedAimOffset, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignBipedAimOffset_BP(const FECSEntity &inout Entity, const FC_BipedAimOffset &inout DefaultValue = FC_BipedAimOffset())
{
    ECSFunc_FC_BipedAimOffset::AssignBipedAimOffset(Entity, DefaultValue);
    return;
}
FC_BipedAimOffset& ModifyBipedAimOffset(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_BipedAimOffset));
    return local_12.GetComp();
}
FC_BipedAimOffset& ModifyOrAddBipedAimOffset(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_BipedAimOffset));
    return local_12.GetComp();
}
const FC_BipedAimOffset& GetBipedAimOffset(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_BipedAimOffset));
    return local_12.GetComp();
}
UFUNCTION()
FC_BipedAimOffset GetBipedAimOffset_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_BipedAimOffset& local_4 = ECSFunc_FC_BipedAimOffset::GetBipedAimOffset(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_BipedAimOffset();
}
const FC_BipedAimOffset GetDefaultedBipedAimOffset(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_BipedAimOffset __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_BipedAimOffset);
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
FC_BipedAimOffset GetDefaultedBipedAimOffset_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_BipedAimOffset::GetDefaultedBipedAimOffset(Entity);
}
UFUNCTION()
bool RemoveBipedAimOffset(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_BipedAimOffset);
}
}
FECSMonitorRuntimeView __GetMonitorBipedAimOffsetOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_BipedAimOffset, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorBipedAimOffsetOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_BipedAimOffset, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorBipedAimOffsetOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_BipedAimOffset, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorBipedAimOffsetOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_BipedAimOffset, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorBipedAimOffsetOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_BipedAimOffset, bFixedFrame, bMustHandleAll);
}
void __MonitorBipedAimOffsetLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_BipedAimOffset, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorBipedAimOffsetActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_BipedAimOffset, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorBipedAimOffsetModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_BipedAimOffset, bFixedFrame, Details);
    return;
}
namespace AutoDelta
{
FRootDirtyFlags16 GetDirtyFlags(FC_BipedAimOffset &inout Data)
{
    FRootDirtyFlags16 __r;
    return __r;
}
void InitDirtyFlags(FC_BipedAimOffset &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_BipedAimOffset &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_BipedAimOffset
{
int __IndexOf_Weight()
{
    return 0;
}
int __IndexOf_InitializeTargetLocation()
{
    return 1;
}
int __IndexOf_InputPitch()
{
    return 2;
}
int __IndexOf_MinPitch()
{
    return 3;
}
int __IndexOf_MaxPitch()
{
    return 4;
}
int __IndexOf_InputYaw()
{
    return 5;
}
int __IndexOf_MinYaw()
{
    return 6;
}
int __IndexOf_MaxYaw()
{
    return 7;
}
int __IndexOf_EnableAdjustPelvis()
{
    return 8;
}
int __IndexOf_EnableAdjustSpine()
{
    return 9;
}
int __IndexOf_EnableAdjustHead()
{
    return 10;
}
int __IndexOf_EnableAdjustLeftArm()
{
    return 11;
}
int __IndexOf_EnableAdjustRightArm()
{
    return 12;
}
}
