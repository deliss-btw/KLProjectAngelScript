
namespace __INTENRAL_FC_CharacterFootLockInfo_NS
{
    const TECSComponentDerivedPtr<FC_CharacterFootLockInfo> DerivedPtr = TECSComponentDerivedPtr<FC_CharacterFootLockInfo>();
    const FC_CharacterFootLockInfo DefaultValue = FC_CharacterFootLockInfo();
}
namespace __InterpoComponentRegister
{
    const FECSInterpoManager::FAngelscriptInterpoComponentRegister FC_CharacterFootLockInfoRegister = FECSInterpoManager::FAngelscriptInterpoComponentRegister();

}
struct FC_CharacterFootLockInfo : FECSComponent
{
    FRootDirtyFlags64 __DirtyFlags;
    UPROPERTY()
    float32 m_FootLockDecreaseSpeed;
    UPROPERTY()
    float32 m_FootLockRecoverSpeed;
    UPROPERTY()
    float32 m_FootLockInputChangeAngle;
    UPROPERTY()
    float32 m_FootLockInputChangeDuration;
    UPROPERTY()
    float32 m_FootLockQuickChangeThreshold;
    UPROPERTY()
    float32 m_FootLockCirclingUnlockCycles;
    UPROPERTY()
    float32 m_FootLockCirclingUnlockDuration;
    UPROPERTY()
    float32 m_StopStartTransitionDecreaseSpeed;
    UPROPERTY()
    float32 m_StopStartTransitionRecoverSpeed;
    UPROPERTY()
    float32 m_StopStartTransitionDuration;
    UPROPERTY()
    float32 m_LocalMovementInputAngleChangeWindow;
    UPROPERTY()
    bool m_bOverrideFootLockAlpha;
    UPROPERTY()
    float32 m_OverrideFootLockAlpha;
    UPROPERTY()
    float32 m_FootLockAlpha;
    UPROPERTY()
    FVector m_PrevAccelerationDir;
    UPROPERTY()
    float32 m_FootLockDirStableTime;
    UPROPERTY()
    float32 m_FootLockInputChangeCooldown;
    UPROPERTY()
    float32 m_FootLockCirclingAccumYaw;
    UPROPERTY()
    float32 m_FootLockCirclingPrevInputYaw;
    UPROPERTY()
    float32 m_FootLockCirclingCooldown;
    UPROPERTY()
    float32 m_StopStartTransitionAlpha;
    UPROPERTY()
    float32 m_StopStartTransitionCooldown;
    UPROPERTY()
    EMoveDirection m_LastMovingMoveDirection;
    UPROPERTY()
    float32 m_StopStartCheckTimer;
    UPROPERTY()
    float32 m_FootLockAlphaTemp;
    UPROPERTY()
    float32 m_LocalMovementInputAngleDelta;
    UPROPERTY()
    float32 m_LocalMovementInputAngleFrameDelta;
    UPROPERTY()
    float32 m_FramePrevLocalMovementInputAngle;
    UPROPERTY()
    float32 m_PrevLocalMovementInputAngle;
    UPROPERTY()
    float32 m_LastLocalMovementInputAngle;
    UPROPERTY()
    bool m_bLocalMovementInputAngleInitialized;
    UPROPERTY()
    float32 m_PendingLocalMovementInputAngle;
    UPROPERTY()
    float32 m_PendingLocalMovementInputAngleDuration;

    FC_CharacterFootLockInfo()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_CharacterFootLockInfo(const FC_CharacterFootLockInfo &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_CharacterFootLockInfo opAssign(const FC_CharacterFootLockInfo &inout Other)
    {
        FC_CharacterFootLockInfo __r;
        this.SetFootLockDecreaseSpeed(Other.GetFootLockDecreaseSpeed());
        this.SetFootLockRecoverSpeed(Other.GetFootLockRecoverSpeed());
        this.SetFootLockInputChangeAngle(Other.GetFootLockInputChangeAngle());
        this.SetFootLockInputChangeDuration(Other.GetFootLockInputChangeDuration());
        this.SetFootLockQuickChangeThreshold(Other.GetFootLockQuickChangeThreshold());
        this.SetFootLockCirclingUnlockCycles(Other.GetFootLockCirclingUnlockCycles());
        this.SetFootLockCirclingUnlockDuration(Other.GetFootLockCirclingUnlockDuration());
        this.SetStopStartTransitionDecreaseSpeed(Other.GetStopStartTransitionDecreaseSpeed());
        this.SetStopStartTransitionRecoverSpeed(Other.GetStopStartTransitionRecoverSpeed());
        this.SetStopStartTransitionDuration(Other.GetStopStartTransitionDuration());
        this.SetLocalMovementInputAngleChangeWindow(Other.GetLocalMovementInputAngleChangeWindow());
        this.SetbOverrideFootLockAlpha(Other.GetbOverrideFootLockAlpha());
        this.SetOverrideFootLockAlpha(Other.GetOverrideFootLockAlpha());
        this.SetFootLockAlpha(Other.GetFootLockAlpha());
        this.SetPrevAccelerationDir(Other.GetPrevAccelerationDir());
        this.SetFootLockDirStableTime(Other.GetFootLockDirStableTime());
        this.SetFootLockInputChangeCooldown(Other.GetFootLockInputChangeCooldown());
        this.SetFootLockCirclingAccumYaw(Other.GetFootLockCirclingAccumYaw());
        this.SetFootLockCirclingPrevInputYaw(Other.GetFootLockCirclingPrevInputYaw());
        this.SetFootLockCirclingCooldown(Other.GetFootLockCirclingCooldown());
        this.SetStopStartTransitionAlpha(Other.GetStopStartTransitionAlpha());
        this.SetStopStartTransitionCooldown(Other.GetStopStartTransitionCooldown());
        this.SetLastMovingMoveDirection(Other.GetLastMovingMoveDirection());
        this.SetStopStartCheckTimer(Other.GetStopStartCheckTimer());
        this.SetFootLockAlphaTemp(Other.GetFootLockAlphaTemp());
        this.SetLocalMovementInputAngleDelta(Other.GetLocalMovementInputAngleDelta());
        this.SetLocalMovementInputAngleFrameDelta(Other.GetLocalMovementInputAngleFrameDelta());
        this.SetFramePrevLocalMovementInputAngle(Other.GetFramePrevLocalMovementInputAngle());
        this.SetPrevLocalMovementInputAngle(Other.GetPrevLocalMovementInputAngle());
        this.SetLastLocalMovementInputAngle(Other.GetLastLocalMovementInputAngle());
        this.SetbLocalMovementInputAngleInitialized(Other.GetbLocalMovementInputAngleInitialized());
        this.SetPendingLocalMovementInputAngle(Other.GetPendingLocalMovementInputAngle());
        this.SetPendingLocalMovementInputAngleDuration(Other.GetPendingLocalMovementInputAngleDuration());
        return __r;
    }
    float32 QueryLocalMovementInputAngleDelta() const
    {
        return this.GetLocalMovementInputAngleDelta();
    }
    float32 QueryLocalMovementInputAngleFrameDelta() const
    {
        return this.GetLocalMovementInputAngleFrameDelta();
    }
    float32 GetFootLockDecreaseSpeed() const property
    {
        return this.m_FootLockDecreaseSpeed;
    }
    void SetFootLockDecreaseSpeed(const float32 __Value) property
    {
        if (this.m_FootLockDecreaseSpeed == __Value)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_FootLockDecreaseSpeed = __Value;
        return;
    }
    float32 GetFootLockRecoverSpeed() const property
    {
        return this.m_FootLockRecoverSpeed;
    }
    void SetFootLockRecoverSpeed(const float32 __Value) property
    {
        if (this.m_FootLockRecoverSpeed == __Value)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_FootLockRecoverSpeed = __Value;
        return;
    }
    float32 GetFootLockInputChangeAngle() const property
    {
        return this.m_FootLockInputChangeAngle;
    }
    void SetFootLockInputChangeAngle(const float32 __Value) property
    {
        if (this.m_FootLockInputChangeAngle == __Value)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_FootLockInputChangeAngle = __Value;
        return;
    }
    float32 GetFootLockInputChangeDuration() const property
    {
        return this.m_FootLockInputChangeDuration;
    }
    void SetFootLockInputChangeDuration(const float32 __Value) property
    {
        if (this.m_FootLockInputChangeDuration == __Value)
        {
            return;
        }
        this.__MarkDirty(3);
        this.m_FootLockInputChangeDuration = __Value;
        return;
    }
    float32 GetFootLockQuickChangeThreshold() const property
    {
        return this.m_FootLockQuickChangeThreshold;
    }
    void SetFootLockQuickChangeThreshold(const float32 __Value) property
    {
        if (this.m_FootLockQuickChangeThreshold == __Value)
        {
            return;
        }
        this.__MarkDirty(4);
        this.m_FootLockQuickChangeThreshold = __Value;
        return;
    }
    float32 GetFootLockCirclingUnlockCycles() const property
    {
        return this.m_FootLockCirclingUnlockCycles;
    }
    void SetFootLockCirclingUnlockCycles(const float32 __Value) property
    {
        if (this.m_FootLockCirclingUnlockCycles == __Value)
        {
            return;
        }
        this.__MarkDirty(5);
        this.m_FootLockCirclingUnlockCycles = __Value;
        return;
    }
    float32 GetFootLockCirclingUnlockDuration() const property
    {
        return this.m_FootLockCirclingUnlockDuration;
    }
    void SetFootLockCirclingUnlockDuration(const float32 __Value) property
    {
        if (this.m_FootLockCirclingUnlockDuration == __Value)
        {
            return;
        }
        this.__MarkDirty(6);
        this.m_FootLockCirclingUnlockDuration = __Value;
        return;
    }
    float32 GetStopStartTransitionDecreaseSpeed() const property
    {
        return this.m_StopStartTransitionDecreaseSpeed;
    }
    void SetStopStartTransitionDecreaseSpeed(const float32 __Value) property
    {
        if (this.m_StopStartTransitionDecreaseSpeed == __Value)
        {
            return;
        }
        this.__MarkDirty(7);
        this.m_StopStartTransitionDecreaseSpeed = __Value;
        return;
    }
    float32 GetStopStartTransitionRecoverSpeed() const property
    {
        return this.m_StopStartTransitionRecoverSpeed;
    }
    void SetStopStartTransitionRecoverSpeed(const float32 __Value) property
    {
        if (this.m_StopStartTransitionRecoverSpeed == __Value)
        {
            return;
        }
        this.__MarkDirty(8);
        this.m_StopStartTransitionRecoverSpeed = __Value;
        return;
    }
    float32 GetStopStartTransitionDuration() const property
    {
        return this.m_StopStartTransitionDuration;
    }
    void SetStopStartTransitionDuration(const float32 __Value) property
    {
        if (this.m_StopStartTransitionDuration == __Value)
        {
            return;
        }
        this.__MarkDirty(9);
        this.m_StopStartTransitionDuration = __Value;
        return;
    }
    float32 GetLocalMovementInputAngleChangeWindow() const property
    {
        return this.m_LocalMovementInputAngleChangeWindow;
    }
    void SetLocalMovementInputAngleChangeWindow(const float32 __Value) property
    {
        if (this.m_LocalMovementInputAngleChangeWindow == __Value)
        {
            return;
        }
        this.__MarkDirty(10);
        this.m_LocalMovementInputAngleChangeWindow = __Value;
        return;
    }
    bool GetbOverrideFootLockAlpha() const property
    {
        return this.m_bOverrideFootLockAlpha;
    }
    void SetbOverrideFootLockAlpha(const bool __Value) property
    {
        if (!(this.m_bOverrideFootLockAlpha) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(11);
        this.m_bOverrideFootLockAlpha = __Value;
        return;
    }
    float32 GetOverrideFootLockAlpha() const property
    {
        return this.m_OverrideFootLockAlpha;
    }
    void SetOverrideFootLockAlpha(const float32 __Value) property
    {
        if (this.m_OverrideFootLockAlpha == __Value)
        {
            return;
        }
        this.__MarkDirty(12);
        this.m_OverrideFootLockAlpha = __Value;
        return;
    }
    float32 GetFootLockAlpha() const property
    {
        return this.m_FootLockAlpha;
    }
    void SetFootLockAlpha(const float32 __Value) property
    {
        if (this.m_FootLockAlpha == __Value)
        {
            return;
        }
        this.__MarkDirty(13);
        this.m_FootLockAlpha = __Value;
        return;
    }
    const FVector GetPrevAccelerationDir() const property
    {
        const FVector __r;
        return __r;
    }
    FVector GetModify_PrevAccelerationDir() property
    {
        FVector __r;
        this.__MarkDirty(14);
        return __r;
    }
    void SetPrevAccelerationDir(const FVector &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(14);
        this.m_PrevAccelerationDir = __Value;
        return;
    }
    float32 GetFootLockDirStableTime() const property
    {
        return this.m_FootLockDirStableTime;
    }
    void SetFootLockDirStableTime(const float32 __Value) property
    {
        if (this.m_FootLockDirStableTime == __Value)
        {
            return;
        }
        this.__MarkDirty(15);
        this.m_FootLockDirStableTime = __Value;
        return;
    }
    float32 GetFootLockInputChangeCooldown() const property
    {
        return this.m_FootLockInputChangeCooldown;
    }
    void SetFootLockInputChangeCooldown(const float32 __Value) property
    {
        if (this.m_FootLockInputChangeCooldown == __Value)
        {
            return;
        }
        this.__MarkDirty(16);
        this.m_FootLockInputChangeCooldown = __Value;
        return;
    }
    float32 GetFootLockCirclingAccumYaw() const property
    {
        return this.m_FootLockCirclingAccumYaw;
    }
    void SetFootLockCirclingAccumYaw(const float32 __Value) property
    {
        if (this.m_FootLockCirclingAccumYaw == __Value)
        {
            return;
        }
        this.__MarkDirty(17);
        this.m_FootLockCirclingAccumYaw = __Value;
        return;
    }
    float32 GetFootLockCirclingPrevInputYaw() const property
    {
        return this.m_FootLockCirclingPrevInputYaw;
    }
    void SetFootLockCirclingPrevInputYaw(const float32 __Value) property
    {
        if (this.m_FootLockCirclingPrevInputYaw == __Value)
        {
            return;
        }
        this.__MarkDirty(18);
        this.m_FootLockCirclingPrevInputYaw = __Value;
        return;
    }
    float32 GetFootLockCirclingCooldown() const property
    {
        return this.m_FootLockCirclingCooldown;
    }
    void SetFootLockCirclingCooldown(const float32 __Value) property
    {
        if (this.m_FootLockCirclingCooldown == __Value)
        {
            return;
        }
        this.__MarkDirty(19);
        this.m_FootLockCirclingCooldown = __Value;
        return;
    }
    float32 GetStopStartTransitionAlpha() const property
    {
        return this.m_StopStartTransitionAlpha;
    }
    void SetStopStartTransitionAlpha(const float32 __Value) property
    {
        if (this.m_StopStartTransitionAlpha == __Value)
        {
            return;
        }
        this.__MarkDirty(20);
        this.m_StopStartTransitionAlpha = __Value;
        return;
    }
    float32 GetStopStartTransitionCooldown() const property
    {
        return this.m_StopStartTransitionCooldown;
    }
    void SetStopStartTransitionCooldown(const float32 __Value) property
    {
        if (this.m_StopStartTransitionCooldown == __Value)
        {
            return;
        }
        this.__MarkDirty(21);
        this.m_StopStartTransitionCooldown = __Value;
        return;
    }
    EMoveDirection GetLastMovingMoveDirection() const property
    {
        return this.m_LastMovingMoveDirection;
    }
    void SetLastMovingMoveDirection(const EMoveDirection __Value) property
    {
        if (int(this.m_LastMovingMoveDirection) == int(__Value))
        {
            return;
        }
        this.__MarkDirty(22);
        this.m_LastMovingMoveDirection = __Value;
        return;
    }
    float32 GetStopStartCheckTimer() const property
    {
        return this.m_StopStartCheckTimer;
    }
    void SetStopStartCheckTimer(const float32 __Value) property
    {
        if (this.m_StopStartCheckTimer == __Value)
        {
            return;
        }
        this.__MarkDirty(23);
        this.m_StopStartCheckTimer = __Value;
        return;
    }
    float32 GetFootLockAlphaTemp() const property
    {
        return this.m_FootLockAlphaTemp;
    }
    void SetFootLockAlphaTemp(const float32 __Value) property
    {
        if (this.m_FootLockAlphaTemp == __Value)
        {
            return;
        }
        this.__MarkDirty(24);
        this.m_FootLockAlphaTemp = __Value;
        return;
    }
    float32 GetLocalMovementInputAngleDelta() const property
    {
        return this.m_LocalMovementInputAngleDelta;
    }
    void SetLocalMovementInputAngleDelta(const float32 __Value) property
    {
        if (this.m_LocalMovementInputAngleDelta == __Value)
        {
            return;
        }
        this.__MarkDirty(25);
        this.m_LocalMovementInputAngleDelta = __Value;
        return;
    }
    float32 GetLocalMovementInputAngleFrameDelta() const property
    {
        return this.m_LocalMovementInputAngleFrameDelta;
    }
    void SetLocalMovementInputAngleFrameDelta(const float32 __Value) property
    {
        if (this.m_LocalMovementInputAngleFrameDelta == __Value)
        {
            return;
        }
        this.__MarkDirty(26);
        this.m_LocalMovementInputAngleFrameDelta = __Value;
        return;
    }
    float32 GetFramePrevLocalMovementInputAngle() const property
    {
        return this.m_FramePrevLocalMovementInputAngle;
    }
    void SetFramePrevLocalMovementInputAngle(const float32 __Value) property
    {
        if (this.m_FramePrevLocalMovementInputAngle == __Value)
        {
            return;
        }
        this.__MarkDirty(27);
        this.m_FramePrevLocalMovementInputAngle = __Value;
        return;
    }
    float32 GetPrevLocalMovementInputAngle() const property
    {
        return this.m_PrevLocalMovementInputAngle;
    }
    void SetPrevLocalMovementInputAngle(const float32 __Value) property
    {
        if (this.m_PrevLocalMovementInputAngle == __Value)
        {
            return;
        }
        this.__MarkDirty(28);
        this.m_PrevLocalMovementInputAngle = __Value;
        return;
    }
    float32 GetLastLocalMovementInputAngle() const property
    {
        return this.m_LastLocalMovementInputAngle;
    }
    void SetLastLocalMovementInputAngle(const float32 __Value) property
    {
        if (this.m_LastLocalMovementInputAngle == __Value)
        {
            return;
        }
        this.__MarkDirty(29);
        this.m_LastLocalMovementInputAngle = __Value;
        return;
    }
    bool GetbLocalMovementInputAngleInitialized() const property
    {
        return this.m_bLocalMovementInputAngleInitialized;
    }
    void SetbLocalMovementInputAngleInitialized(const bool __Value) property
    {
        if (!(this.m_bLocalMovementInputAngleInitialized) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(30);
        this.m_bLocalMovementInputAngleInitialized = __Value;
        return;
    }
    float32 GetPendingLocalMovementInputAngle() const property
    {
        return this.m_PendingLocalMovementInputAngle;
    }
    void SetPendingLocalMovementInputAngle(const float32 __Value) property
    {
        if (this.m_PendingLocalMovementInputAngle == __Value)
        {
            return;
        }
        this.__MarkDirty(31);
        this.m_PendingLocalMovementInputAngle = __Value;
        return;
    }
    float32 GetPendingLocalMovementInputAngleDuration() const property
    {
        return this.m_PendingLocalMovementInputAngleDuration;
    }
    void SetPendingLocalMovementInputAngleDuration(const float32 __Value) property
    {
        if (this.m_PendingLocalMovementInputAngleDuration == __Value)
        {
            return;
        }
        this.__MarkDirty(32);
        this.m_PendingLocalMovementInputAngleDuration = __Value;
        return;
    }
}

namespace FC_CharacterFootLockInfo
{
FC_CharacterFootLockInfo Interpolate(const FC_CharacterFootLockInfo &inout A, const FC_CharacterFootLockInfo &inout B, const float32 T, const float32 DeltaTime)
{
    FC_CharacterFootLockInfo local_40;
    local_40.SetFootLockAlpha(FMath::Lerp(A.GetFootLockAlpha(), B.GetFootLockAlpha(), T));
    local_40.SetStopStartTransitionAlpha(FMath::Lerp(A.GetStopStartTransitionAlpha(), B.GetStopStartTransitionAlpha(), T));
    local_40.SetFootLockAlphaTemp(FMath::Lerp(A.GetFootLockAlphaTemp(), B.GetFootLockAlphaTemp(), T));
    local_40.SetLocalMovementInputAngleDelta(B.GetLocalMovementInputAngleDelta());
    local_40.SetLocalMovementInputAngleFrameDelta(B.GetLocalMovementInputAngleFrameDelta());
    return local_40;
}
}
namespace ECSFunc_FC_CharacterFootLockInfo
{
UFUNCTION()
bool HasCharacterFootLockInfo(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_CharacterFootLockInfo);
}
FC_CharacterFootLockInfo& AssignCharacterFootLockInfo(const FECSEntity &inout Entity, const FC_CharacterFootLockInfo &inout DefaultValue = FC_CharacterFootLockInfo())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_CharacterFootLockInfo, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignCharacterFootLockInfo_BP(const FECSEntity &inout Entity, const FC_CharacterFootLockInfo &inout DefaultValue = FC_CharacterFootLockInfo())
{
    ECSFunc_FC_CharacterFootLockInfo::AssignCharacterFootLockInfo(Entity, DefaultValue);
    return;
}
FC_CharacterFootLockInfo& ModifyCharacterFootLockInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_CharacterFootLockInfo));
    return local_12.GetComp();
}
FC_CharacterFootLockInfo& ModifyOrAddCharacterFootLockInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_CharacterFootLockInfo));
    return local_12.GetComp();
}
const FC_CharacterFootLockInfo& GetCharacterFootLockInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_CharacterFootLockInfo));
    return local_12.GetComp();
}
UFUNCTION()
FC_CharacterFootLockInfo GetCharacterFootLockInfo_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_CharacterFootLockInfo& local_4 = ECSFunc_FC_CharacterFootLockInfo::GetCharacterFootLockInfo(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_CharacterFootLockInfo();
}
const FC_CharacterFootLockInfo GetDefaultedCharacterFootLockInfo(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_CharacterFootLockInfo __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_CharacterFootLockInfo);
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
FC_CharacterFootLockInfo GetDefaultedCharacterFootLockInfo_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_CharacterFootLockInfo::GetDefaultedCharacterFootLockInfo(Entity);
}
UFUNCTION()
bool RemoveCharacterFootLockInfo(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_CharacterFootLockInfo);
}
}
FECSMonitorRuntimeView __GetMonitorCharacterFootLockInfoOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_CharacterFootLockInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCharacterFootLockInfoOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_CharacterFootLockInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCharacterFootLockInfoOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_CharacterFootLockInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCharacterFootLockInfoOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_CharacterFootLockInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCharacterFootLockInfoOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_CharacterFootLockInfo, bFixedFrame, bMustHandleAll);
}
void __MonitorCharacterFootLockInfoLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_CharacterFootLockInfo, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCharacterFootLockInfoActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_CharacterFootLockInfo, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCharacterFootLockInfoModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_CharacterFootLockInfo, bFixedFrame, Details);
    return;
}
namespace EntityBB
{
void GetEntityBBVar_CharacterFootLockInfo_QueryLocalMovementInputAngleDelta(const FECSEntity &inout Entity, float32 &inout OutRetValue)
{
    GetDefaulted local_4;
    OutRetValue = local_4.opCall().QueryLocalMovementInputAngleDelta();
    return;
}
void GetEntityBBVar_CharacterFootLockInfo_QueryLocalMovementInputAngleFrameDelta(const FECSEntity &inout Entity, float32 &inout OutRetValue)
{
    GetDefaulted local_4;
    OutRetValue = local_4.opCall().QueryLocalMovementInputAngleFrameDelta();
    return;
}
}
namespace AutoDelta
{
FRootDirtyFlags64 GetDirtyFlags(FC_CharacterFootLockInfo &inout Data)
{
    FRootDirtyFlags64 __r;
    return __r;
}
void InitDirtyFlags(FC_CharacterFootLockInfo &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_CharacterFootLockInfo &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_CharacterFootLockInfo
{
int __IndexOf_FootLockDecreaseSpeed()
{
    return 0;
}
int __IndexOf_FootLockRecoverSpeed()
{
    return 1;
}
int __IndexOf_FootLockInputChangeAngle()
{
    return 2;
}
int __IndexOf_FootLockInputChangeDuration()
{
    return 3;
}
int __IndexOf_FootLockQuickChangeThreshold()
{
    return 4;
}
int __IndexOf_FootLockCirclingUnlockCycles()
{
    return 5;
}
int __IndexOf_FootLockCirclingUnlockDuration()
{
    return 6;
}
int __IndexOf_StopStartTransitionDecreaseSpeed()
{
    return 7;
}
int __IndexOf_StopStartTransitionRecoverSpeed()
{
    return 8;
}
int __IndexOf_StopStartTransitionDuration()
{
    return 9;
}
int __IndexOf_LocalMovementInputAngleChangeWindow()
{
    return 10;
}
int __IndexOf_bOverrideFootLockAlpha()
{
    return 11;
}
int __IndexOf_OverrideFootLockAlpha()
{
    return 12;
}
int __IndexOf_FootLockAlpha()
{
    return 13;
}
int __IndexOf_PrevAccelerationDir()
{
    return 14;
}
int __IndexOf_FootLockDirStableTime()
{
    return 15;
}
int __IndexOf_FootLockInputChangeCooldown()
{
    return 16;
}
int __IndexOf_FootLockCirclingAccumYaw()
{
    return 17;
}
int __IndexOf_FootLockCirclingPrevInputYaw()
{
    return 18;
}
int __IndexOf_FootLockCirclingCooldown()
{
    return 19;
}
int __IndexOf_StopStartTransitionAlpha()
{
    return 20;
}
int __IndexOf_StopStartTransitionCooldown()
{
    return 21;
}
int __IndexOf_LastMovingMoveDirection()
{
    return 22;
}
int __IndexOf_StopStartCheckTimer()
{
    return 23;
}
int __IndexOf_FootLockAlphaTemp()
{
    return 24;
}
int __IndexOf_LocalMovementInputAngleDelta()
{
    return 25;
}
int __IndexOf_LocalMovementInputAngleFrameDelta()
{
    return 26;
}
int __IndexOf_FramePrevLocalMovementInputAngle()
{
    return 27;
}
int __IndexOf_PrevLocalMovementInputAngle()
{
    return 28;
}
int __IndexOf_LastLocalMovementInputAngle()
{
    return 29;
}
int __IndexOf_bLocalMovementInputAngleInitialized()
{
    return 30;
}
int __IndexOf_PendingLocalMovementInputAngle()
{
    return 31;
}
int __IndexOf_PendingLocalMovementInputAngleDuration()
{
    return 32;
}
}
