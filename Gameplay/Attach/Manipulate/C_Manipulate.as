
enum EManipulateCurvePhase
{
    WaitCurve,
    Steady,
}

enum EViewSocketAlignMode
{
    AlignTargetToSelf,
    AlignSelfToTarget,
}

namespace __INTENRAL_FC_ManipulatedInfo_NS
{
    const TECSComponentDerivedPtr<FC_ManipulatedInfo> DerivedPtr = TECSComponentDerivedPtr<FC_ManipulatedInfo>();
    const FC_ManipulatedInfo DefaultValue = FC_ManipulatedInfo();
}
namespace __INTENRAL_FC_CurrentManipulateStatus_NS
{
    const TECSComponentDerivedPtr<FC_CurrentManipulateStatus> DerivedPtr = TECSComponentDerivedPtr<FC_CurrentManipulateStatus>();
    const FC_CurrentManipulateStatus DefaultValue = FC_CurrentManipulateStatus();
}
namespace __INTENRAL_FC_ManipulateActionLifecycle_NS
{
    const TECSComponentDerivedPtr<FC_ManipulateActionLifecycle> DerivedPtr = TECSComponentDerivedPtr<FC_ManipulateActionLifecycle>();
    const FC_ManipulateActionLifecycle DefaultValue = FC_ManipulateActionLifecycle();
}
namespace __INTENRAL_FC_ManipulatedByCurve_NS
{
    const TECSComponentDerivedPtr<FC_ManipulatedByCurve> DerivedPtr = TECSComponentDerivedPtr<FC_ManipulatedByCurve>();
    const FC_ManipulatedByCurve DefaultValue = FC_ManipulatedByCurve();
}
namespace __INTENRAL_FC_ManipulateOffsetTrack_NS
{
    const TECSComponentDerivedPtr<FC_ManipulateOffsetTrack> DerivedPtr = TECSComponentDerivedPtr<FC_ManipulateOffsetTrack>();
    const FC_ManipulateOffsetTrack DefaultValue = FC_ManipulateOffsetTrack();
}
namespace __INTENRAL_FC_ManipulateInterpoClockLatch_NS
{
    const TECSComponentDerivedPtr<FC_ManipulateInterpoClockLatch> DerivedPtr = TECSComponentDerivedPtr<FC_ManipulateInterpoClockLatch>();
    const FC_ManipulateInterpoClockLatch DefaultValue = FC_ManipulateInterpoClockLatch();
}
namespace __INTENRAL_FC_ManipulateAttachedInterpoClock_NS
{
    const TECSComponentDerivedPtr<FC_ManipulateAttachedInterpoClock> DerivedPtr = TECSComponentDerivedPtr<FC_ManipulateAttachedInterpoClock>();
    const FC_ManipulateAttachedInterpoClock DefaultValue = FC_ManipulateAttachedInterpoClock();
}
namespace __INTENRAL_FC_ManipulateCurveViewBlend_NS
{
    const TECSComponentDerivedPtr<FC_ManipulateCurveViewBlend> DerivedPtr = TECSComponentDerivedPtr<FC_ManipulateCurveViewBlend>();
    const FC_ManipulateCurveViewBlend DefaultValue = FC_ManipulateCurveViewBlend();
}
namespace __INTENRAL_FC_ViewSocketAlign_NS
{
    const TECSComponentDerivedPtr<FC_ViewSocketAlign> DerivedPtr = TECSComponentDerivedPtr<FC_ViewSocketAlign>();
    const FC_ViewSocketAlign DefaultValue = FC_ViewSocketAlign();

}
struct FC_ManipulatedInfo : FECSComponent
{
    FRootDirtyFlags32 __DirtyFlags;
    UPROPERTY()
    FECSEntity m_MasterEntity;
    UPROPERTY()
    FName m_SocketName;
    UPROPERTY()
    FVector m_LocationOffset;
    UPROPERTY()
    FRotator m_RotationOffset;
    UPROPERTY()
    float32 m_AttachBlendKeepDuration;
    UPROPERTY()
    float32 m_AttachBlendInDuration;
    UPROPERTY()
    int m_AttachSocketUpdatePeriod;
    UPROPERTY()
    FName m_BeginTransitStateName;
    UPROPERTY()
    float32 m_BeginTransitStateSyncNormalizedTime;
    UPROPERTY()
    bool m_bSyncWithMasterStateNormalizedTime;
    UPROPERTY()
    float32 m_MasterStateNormalizedTimeScale;
    UPROPERTY()
    FName m_EndTransitStateName;
    UPROPERTY()
    FFPTime m_ExitTime;
    UPROPERTY()
    int m_UpdateCounter;
    UPROPERTY()
    bool m_bAttachMasterToSlave;
    UPROPERTY()
    bool m_bOnlyStateTransition;
    UPROPERTY()
    bool m_bTargetIgnoreOtherAttack;

    FC_ManipulatedInfo()
    {
        this.m_AttachBlendKeepDuration = 0.0f;
        this.m_AttachBlendInDuration = 0.0f;
        this.m_bTargetIgnoreOtherAttack = false;
        this.m_SocketName = NAME_None;
        this.m_AttachSocketUpdatePeriod = -1;
        this.m_BeginTransitStateSyncNormalizedTime = -1.0f;
        this.m_bSyncWithMasterStateNormalizedTime = false;
        this.m_MasterStateNormalizedTimeScale = 1.0f;
        this.m_ExitTime = -1;
        this.m_UpdateCounter = 0;
        this.m_bAttachMasterToSlave = false;
        this.m_bOnlyStateTransition = false;
        this.__InitDirtyFlags();
        return;
    }
    FC_ManipulatedInfo(const FC_ManipulatedInfo &inout Other)
    {
        this.m_AttachBlendKeepDuration = 0.0f;
        this.m_AttachBlendInDuration = 0.0f;
        this.m_bTargetIgnoreOtherAttack = false;
        this.m_SocketName = NAME_None;
        this.m_AttachSocketUpdatePeriod = -1;
        this.m_BeginTransitStateSyncNormalizedTime = -1.0f;
        this.m_bSyncWithMasterStateNormalizedTime = false;
        this.m_MasterStateNormalizedTimeScale = 1.0f;
        this.m_ExitTime = -1;
        this.m_UpdateCounter = 0;
        this.m_bAttachMasterToSlave = false;
        this.m_bOnlyStateTransition = false;
        this.__InitDirtyFlags();
        this.m_MasterEntity = Other.m_MasterEntity;
        this.m_SocketName = Other.m_SocketName;
        this.m_LocationOffset = Other.m_LocationOffset;
        this.m_RotationOffset = Other.m_RotationOffset;
        this.m_AttachBlendKeepDuration = Other.m_AttachBlendKeepDuration;
        this.m_AttachBlendInDuration = Other.m_AttachBlendInDuration;
        this.m_AttachSocketUpdatePeriod = int(Other.m_AttachSocketUpdatePeriod);
        this.m_BeginTransitStateName = Other.m_BeginTransitStateName;
        this.m_BeginTransitStateSyncNormalizedTime = Other.m_BeginTransitStateSyncNormalizedTime;
        this.m_bSyncWithMasterStateNormalizedTime = Other.m_bSyncWithMasterStateNormalizedTime;
        this.m_MasterStateNormalizedTimeScale = Other.m_MasterStateNormalizedTimeScale;
        this.m_EndTransitStateName = Other.m_EndTransitStateName;
        this.m_ExitTime = Other.m_ExitTime;
        this.m_UpdateCounter = int(Other.m_UpdateCounter);
        this.m_bAttachMasterToSlave = Other.m_bAttachMasterToSlave;
        this.m_bOnlyStateTransition = Other.m_bOnlyStateTransition;
        this.m_bTargetIgnoreOtherAttack = Other.m_bTargetIgnoreOtherAttack;
        return;
    }
    FC_ManipulatedInfo opAssign(const FC_ManipulatedInfo &inout Other)
    {
        FC_ManipulatedInfo __r;
        this.SetMasterEntity(Other.GetMasterEntity());
        this.SetSocketName(Other.GetSocketName());
        this.SetLocationOffset(Other.GetLocationOffset());
        this.SetRotationOffset(Other.GetRotationOffset());
        this.SetAttachBlendKeepDuration(Other.GetAttachBlendKeepDuration());
        this.SetAttachBlendInDuration(Other.GetAttachBlendInDuration());
        this.SetAttachSocketUpdatePeriod(Other.GetAttachSocketUpdatePeriod());
        this.SetBeginTransitStateName(Other.GetBeginTransitStateName());
        this.SetBeginTransitStateSyncNormalizedTime(Other.GetBeginTransitStateSyncNormalizedTime());
        this.SetbSyncWithMasterStateNormalizedTime(Other.GetbSyncWithMasterStateNormalizedTime());
        this.SetMasterStateNormalizedTimeScale(Other.GetMasterStateNormalizedTimeScale());
        this.SetEndTransitStateName(Other.GetEndTransitStateName());
        this.SetExitTime(Other.GetExitTime());
        this.SetUpdateCounter(Other.GetUpdateCounter());
        this.SetbAttachMasterToSlave(Other.GetbAttachMasterToSlave());
        this.SetbOnlyStateTransition(Other.GetbOnlyStateTransition());
        this.SetbTargetIgnoreOtherAttack(Other.GetbTargetIgnoreOtherAttack());
        return __r;
    }
    const FECSEntity GetMasterEntity() const property
    {
        const FECSEntity __r;
        return __r;
    }
    FECSEntity GetModify_MasterEntity() property
    {
        FECSEntity __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetMasterEntity(const FECSEntity &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_MasterEntity = __Value;
        return;
    }
    FName GetSocketName() const property
    {
        return this.m_SocketName;
    }
    void SetSocketName(const FName &inout __Value) property
    {
        if ((this.m_SocketName == __Value))
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_SocketName = __Value;
        return;
    }
    const FVector GetLocationOffset() const property
    {
        const FVector __r;
        return __r;
    }
    FVector GetModify_LocationOffset() property
    {
        FVector __r;
        this.__MarkDirty(2);
        return __r;
    }
    void SetLocationOffset(const FVector &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_LocationOffset = __Value;
        return;
    }
    const FRotator GetRotationOffset() const property
    {
        const FRotator __r;
        return __r;
    }
    FRotator GetModify_RotationOffset() property
    {
        FRotator __r;
        this.__MarkDirty(3);
        return __r;
    }
    void SetRotationOffset(const FRotator &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(3);
        this.m_RotationOffset = __Value;
        return;
    }
    float32 GetAttachBlendKeepDuration() const property
    {
        return this.m_AttachBlendKeepDuration;
    }
    void SetAttachBlendKeepDuration(const float32 __Value) property
    {
        if (this.m_AttachBlendKeepDuration == __Value)
        {
            return;
        }
        this.__MarkDirty(4);
        this.m_AttachBlendKeepDuration = __Value;
        return;
    }
    float32 GetAttachBlendInDuration() const property
    {
        return this.m_AttachBlendInDuration;
    }
    void SetAttachBlendInDuration(const float32 __Value) property
    {
        if (this.m_AttachBlendInDuration == __Value)
        {
            return;
        }
        this.__MarkDirty(5);
        this.m_AttachBlendInDuration = __Value;
        return;
    }
    int GetAttachSocketUpdatePeriod() const property
    {
        return this.m_AttachSocketUpdatePeriod;
    }
    void SetAttachSocketUpdatePeriod(const int __Value) property
    {
        if (this.m_AttachSocketUpdatePeriod == __Value)
        {
            return;
        }
        this.__MarkDirty(6);
        this.m_AttachSocketUpdatePeriod = __Value;
        return;
    }
    FName GetBeginTransitStateName() const property
    {
        return this.m_BeginTransitStateName;
    }
    void SetBeginTransitStateName(const FName &inout __Value) property
    {
        if ((this.m_BeginTransitStateName == __Value))
        {
            return;
        }
        this.__MarkDirty(7);
        this.m_BeginTransitStateName = __Value;
        return;
    }
    float32 GetBeginTransitStateSyncNormalizedTime() const property
    {
        return this.m_BeginTransitStateSyncNormalizedTime;
    }
    void SetBeginTransitStateSyncNormalizedTime(const float32 __Value) property
    {
        if (this.m_BeginTransitStateSyncNormalizedTime == __Value)
        {
            return;
        }
        this.__MarkDirty(8);
        this.m_BeginTransitStateSyncNormalizedTime = __Value;
        return;
    }
    bool GetbSyncWithMasterStateNormalizedTime() const property
    {
        return this.m_bSyncWithMasterStateNormalizedTime;
    }
    void SetbSyncWithMasterStateNormalizedTime(const bool __Value) property
    {
        if (!(this.m_bSyncWithMasterStateNormalizedTime) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(9);
        this.m_bSyncWithMasterStateNormalizedTime = __Value;
        return;
    }
    float32 GetMasterStateNormalizedTimeScale() const property
    {
        return this.m_MasterStateNormalizedTimeScale;
    }
    void SetMasterStateNormalizedTimeScale(const float32 __Value) property
    {
        if (this.m_MasterStateNormalizedTimeScale == __Value)
        {
            return;
        }
        this.__MarkDirty(10);
        this.m_MasterStateNormalizedTimeScale = __Value;
        return;
    }
    FName GetEndTransitStateName() const property
    {
        return this.m_EndTransitStateName;
    }
    void SetEndTransitStateName(const FName &inout __Value) property
    {
        if ((this.m_EndTransitStateName == __Value))
        {
            return;
        }
        this.__MarkDirty(11);
        this.m_EndTransitStateName = __Value;
        return;
    }
    FFPTime GetExitTime() const property
    {
        FFPTime __r;
        return __r;
    }
    FFPTime GetModify_ExitTime() property
    {
        FFPTime __r;
        this.__MarkDirty(12);
        return __r;
    }
    void SetExitTime(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(12);
        this.m_ExitTime = __Value;
        return;
    }
    int GetUpdateCounter() const property
    {
        return this.m_UpdateCounter;
    }
    void SetUpdateCounter(const int __Value) property
    {
        if (this.m_UpdateCounter == __Value)
        {
            return;
        }
        this.__MarkDirty(13);
        this.m_UpdateCounter = __Value;
        return;
    }
    bool GetbAttachMasterToSlave() const property
    {
        return this.m_bAttachMasterToSlave;
    }
    void SetbAttachMasterToSlave(const bool __Value) property
    {
        if (!(this.m_bAttachMasterToSlave) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(14);
        this.m_bAttachMasterToSlave = __Value;
        return;
    }
    bool GetbOnlyStateTransition() const property
    {
        return this.m_bOnlyStateTransition;
    }
    void SetbOnlyStateTransition(const bool __Value) property
    {
        if (!(this.m_bOnlyStateTransition) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(15);
        this.m_bOnlyStateTransition = __Value;
        return;
    }
    bool GetbTargetIgnoreOtherAttack() const property
    {
        return this.m_bTargetIgnoreOtherAttack;
    }
    void SetbTargetIgnoreOtherAttack(const bool __Value) property
    {
        if (!(this.m_bTargetIgnoreOtherAttack) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(16);
        this.m_bTargetIgnoreOtherAttack = __Value;
        return;
    }
}

struct FC_CurrentManipulateStatus : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    int m_LasUpdateCounter;

    FC_CurrentManipulateStatus()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_CurrentManipulateStatus(const FC_CurrentManipulateStatus &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_CurrentManipulateStatus opAssign(const FC_CurrentManipulateStatus &inout Other)
    {
        FC_CurrentManipulateStatus __r;
        this.SetLasUpdateCounter(Other.GetLasUpdateCounter());
        return __r;
    }
    int GetLasUpdateCounter() const property
    {
        return this.m_LasUpdateCounter;
    }
    void SetLasUpdateCounter(const int __Value) property
    {
        if (this.m_LasUpdateCounter == __Value)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_LasUpdateCounter = __Value;
        return;
    }
}

struct FC_ManipulateActionLifecycle : FECSComponent
{
    UPROPERTY()
    FECSEntity MasterEntity;
    UPROPERTY()
    int UpdateCounter = 0;
    UPROPERTY()
    FFPTime LastTickTime = -1;
    UPROPERTY()
    int MissedTickCount = 0;


}

struct FC_ManipulatedByCurve : FECSComponent
{
    FRootDirtyFlags16 __DirtyFlags;
    UPROPERTY()
    FECSEntity m_MasterEntity;
    UPROPERTY()
    FVector m_RelativeLocationOffset;
    UPROPERTY()
    FRotator m_RelativeRotationOffset;
    UPROPERTY()
    FFPTime m_StartTime;
    UPROPERTY()
    EManipulateCurvePhase m_Phase;
    UPROPERTY()
    float32 m_SmoothSpeed;
    UPROPERTY()
    FName m_RelativeLocationCurveBBVar;
    UPROPERTY()
    FName m_RelativeRotationCurveBBVar;

    FC_ManipulatedByCurve()
    {
        this.m_StartTime = -1;
        this.m_Phase = EManipulateCurvePhase(0);
        this.m_SmoothSpeed = 0.0f;
        this.m_RelativeLocationCurveBBVar = NAME_None;
        this.m_RelativeRotationCurveBBVar = NAME_None;
        this.__InitDirtyFlags();
        return;
    }
    FC_ManipulatedByCurve(const FC_ManipulatedByCurve &inout Other)
    {
        this.m_StartTime = -1;
        this.m_Phase = EManipulateCurvePhase(0);
        this.m_SmoothSpeed = 0.0f;
        this.m_RelativeLocationCurveBBVar = NAME_None;
        this.m_RelativeRotationCurveBBVar = NAME_None;
        this.__InitDirtyFlags();
        this.m_MasterEntity = Other.m_MasterEntity;
        this.m_RelativeLocationOffset = Other.m_RelativeLocationOffset;
        this.m_RelativeRotationOffset = Other.m_RelativeRotationOffset;
        this.m_StartTime = Other.m_StartTime;
        this.m_Phase = Other.m_Phase;
        this.m_SmoothSpeed = Other.m_SmoothSpeed;
        this.m_RelativeLocationCurveBBVar = Other.m_RelativeLocationCurveBBVar;
        this.m_RelativeRotationCurveBBVar = Other.m_RelativeRotationCurveBBVar;
        return;
    }
    FC_ManipulatedByCurve opAssign(const FC_ManipulatedByCurve &inout Other)
    {
        FC_ManipulatedByCurve __r;
        this.SetMasterEntity(Other.GetMasterEntity());
        this.SetRelativeLocationOffset(Other.GetRelativeLocationOffset());
        this.SetRelativeRotationOffset(Other.GetRelativeRotationOffset());
        this.SetStartTime(Other.GetStartTime());
        this.SetPhase(Other.GetPhase());
        this.SetSmoothSpeed(Other.GetSmoothSpeed());
        this.SetRelativeLocationCurveBBVar(Other.GetRelativeLocationCurveBBVar());
        this.SetRelativeRotationCurveBBVar(Other.GetRelativeRotationCurveBBVar());
        return __r;
    }
    const FECSEntity GetMasterEntity() const property
    {
        const FECSEntity __r;
        return __r;
    }
    FECSEntity GetModify_MasterEntity() property
    {
        FECSEntity __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetMasterEntity(const FECSEntity &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_MasterEntity = __Value;
        return;
    }
    const FVector GetRelativeLocationOffset() const property
    {
        const FVector __r;
        return __r;
    }
    FVector GetModify_RelativeLocationOffset() property
    {
        FVector __r;
        this.__MarkDirty(1);
        return __r;
    }
    void SetRelativeLocationOffset(const FVector &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_RelativeLocationOffset = __Value;
        return;
    }
    const FRotator GetRelativeRotationOffset() const property
    {
        const FRotator __r;
        return __r;
    }
    FRotator GetModify_RelativeRotationOffset() property
    {
        FRotator __r;
        this.__MarkDirty(2);
        return __r;
    }
    void SetRelativeRotationOffset(const FRotator &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_RelativeRotationOffset = __Value;
        return;
    }
    FFPTime GetStartTime() const property
    {
        FFPTime __r;
        return __r;
    }
    FFPTime GetModify_StartTime() property
    {
        FFPTime __r;
        this.__MarkDirty(3);
        return __r;
    }
    void SetStartTime(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(3);
        this.m_StartTime = __Value;
        return;
    }
    EManipulateCurvePhase GetPhase() const property
    {
        return this.m_Phase;
    }
    void SetPhase(const EManipulateCurvePhase __Value) property
    {
        if (int(this.m_Phase) == int(__Value))
        {
            return;
        }
        this.__MarkDirty(4);
        this.m_Phase = __Value;
        return;
    }
    float32 GetSmoothSpeed() const property
    {
        return this.m_SmoothSpeed;
    }
    void SetSmoothSpeed(const float32 __Value) property
    {
        if (this.m_SmoothSpeed == __Value)
        {
            return;
        }
        this.__MarkDirty(5);
        this.m_SmoothSpeed = __Value;
        return;
    }
    FName GetRelativeLocationCurveBBVar() const property
    {
        return this.m_RelativeLocationCurveBBVar;
    }
    void SetRelativeLocationCurveBBVar(const FName &inout __Value) property
    {
        if ((this.m_RelativeLocationCurveBBVar == __Value))
        {
            return;
        }
        this.__MarkDirty(6);
        this.m_RelativeLocationCurveBBVar = __Value;
        return;
    }
    FName GetRelativeRotationCurveBBVar() const property
    {
        return this.m_RelativeRotationCurveBBVar;
    }
    void SetRelativeRotationCurveBBVar(const FName &inout __Value) property
    {
        if ((this.m_RelativeRotationCurveBBVar == __Value))
        {
            return;
        }
        this.__MarkDirty(7);
        this.m_RelativeRotationCurveBBVar = __Value;
        return;
    }
}

struct FManipulateOffsetSample
{
    UPROPERTY()
    FFPTime Time;
    UPROPERTY()
    FVector Loc = FVector::ZeroVector;
    UPROPERTY()
    FRotator Rot = FRotator::ZeroRotator;
    UPROPERTY()
    FVector WorldLoc = FVector::ZeroVector;

    FManipulateOffsetSample()
    {
        return;
    }
}

struct FC_ManipulateOffsetTrack : FECSComponent
{
    UPROPERTY()
    TArray<FManipulateOffsetSample> Samples;
    UPROPERTY()
    FECSEntity SampleMasterEntity;

    FC_ManipulateOffsetTrack()
    {
        return;
    }
}

struct FC_ManipulateInterpoClockLatch : FECSComponent
{
    UPROPERTY()
    FECSEntity MasterEntity;

    FC_ManipulateInterpoClockLatch()
    {
        return;
    }
}

struct FC_ManipulateAttachedInterpoClock : FECSComponent
{
    UPROPERTY()
    FECSEntity MasterEntity;

    FC_ManipulateAttachedInterpoClock()
    {
        return;
    }
}

struct FC_ManipulateCurveViewBlend : FECSComponent
{
    UPROPERTY()
    FVector OffsetLocation;
    UPROPERTY()
    FQuat OffsetRotation = FQuat::Identity;
    UPROPERTY()
    bool bEnterDone = false;
    UPROPERTY()
    bool bBlendingOut = false;
    UPROPERTY()
    bool bBlendOutInit = false;
    UPROPERTY()
    float32 SmoothSpeed = 0.0f;
    UPROPERTY()
    bool bDebugViewValid = false;
    UPROPERTY()
    FVector DebugLastViewPos = FVector::ZeroVector;
    UPROPERTY()
    bool bDebugRefValid = false;
    UPROPERTY()
    FVector DebugLastRefPos = FVector::ZeroVector;


}

struct FC_ViewSocketAlign : FECSComponent
{
    UPROPERTY()
    FECSEntity SelfEntity;
    UPROPERTY()
    FECSEntity TargetEntity;
    UPROPERTY()
    FName TargetSocketName = NAME_None;
    UPROPERTY()
    FName SourceSocketName = NAME_None;
    UPROPERTY()
    EViewSocketAlignMode AlignMode = EViewSocketAlignMode(0);
    UPROPERTY()
    FTransform CurveOffset;
    UPROPERTY()
    float32 BlendInDuration = 0.0f;
    UPROPERTY()
    FVector StartLocationOffset = FVector::ZeroVector;
    UPROPERTY()
    FQuat StartRotationOffset = FQuat::Identity;
    UPROPERTY()
    FFPTime StartWorldTime;
    UPROPERTY()
    bool bBlendInitialized = false;
    UPROPERTY()
    FVector SmoothedLocation = FVector::ZeroVector;
    UPROPERTY()
    FQuat SmoothedRotation = FQuat::Identity;
    UPROPERTY()
    bool bSmoothInitialized = false;
    UPROPERTY()
    float32 SmoothSpeed = 20.0f;


}

namespace ECSFunc_FC_ManipulatedInfo
{
UFUNCTION()
bool HasManipulatedInfo(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_ManipulatedInfo);
}
FC_ManipulatedInfo& AssignManipulatedInfo(const FECSEntity &inout Entity, const FC_ManipulatedInfo &inout DefaultValue = FC_ManipulatedInfo())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_ManipulatedInfo, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignManipulatedInfo_BP(const FECSEntity &inout Entity, const FC_ManipulatedInfo &inout DefaultValue = FC_ManipulatedInfo())
{
    ECSFunc_FC_ManipulatedInfo::AssignManipulatedInfo(Entity, DefaultValue);
    return;
}
FC_ManipulatedInfo& ModifyManipulatedInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_ManipulatedInfo));
    return local_12.GetComp();
}
FC_ManipulatedInfo& ModifyOrAddManipulatedInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_ManipulatedInfo));
    return local_12.GetComp();
}
const FC_ManipulatedInfo& GetManipulatedInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_ManipulatedInfo));
    return local_12.GetComp();
}
UFUNCTION()
FC_ManipulatedInfo GetManipulatedInfo_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_ManipulatedInfo& local_4 = ECSFunc_FC_ManipulatedInfo::GetManipulatedInfo(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_ManipulatedInfo();
}
const FC_ManipulatedInfo GetDefaultedManipulatedInfo(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_ManipulatedInfo __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_ManipulatedInfo);
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
FC_ManipulatedInfo GetDefaultedManipulatedInfo_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_ManipulatedInfo::GetDefaultedManipulatedInfo(Entity);
}
UFUNCTION()
bool RemoveManipulatedInfo(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_ManipulatedInfo);
}
}
FECSMonitorRuntimeView __GetMonitorManipulatedInfoOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_ManipulatedInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorManipulatedInfoOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_ManipulatedInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorManipulatedInfoOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_ManipulatedInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorManipulatedInfoOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_ManipulatedInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorManipulatedInfoOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_ManipulatedInfo, bFixedFrame, bMustHandleAll);
}
void __MonitorManipulatedInfoLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_ManipulatedInfo, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorManipulatedInfoActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_ManipulatedInfo, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorManipulatedInfoModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_ManipulatedInfo, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_CurrentManipulateStatus
{
UFUNCTION()
bool HasCurrentManipulateStatus(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_CurrentManipulateStatus);
}
FC_CurrentManipulateStatus& AssignCurrentManipulateStatus(const FECSEntity &inout Entity, const FC_CurrentManipulateStatus &inout DefaultValue = FC_CurrentManipulateStatus())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_CurrentManipulateStatus, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignCurrentManipulateStatus_BP(const FECSEntity &inout Entity, const FC_CurrentManipulateStatus &inout DefaultValue = FC_CurrentManipulateStatus())
{
    ECSFunc_FC_CurrentManipulateStatus::AssignCurrentManipulateStatus(Entity, DefaultValue);
    return;
}
FC_CurrentManipulateStatus& ModifyCurrentManipulateStatus(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_CurrentManipulateStatus));
    return local_12.GetComp();
}
FC_CurrentManipulateStatus& ModifyOrAddCurrentManipulateStatus(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_CurrentManipulateStatus));
    return local_12.GetComp();
}
const FC_CurrentManipulateStatus& GetCurrentManipulateStatus(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_CurrentManipulateStatus));
    return local_12.GetComp();
}
UFUNCTION()
FC_CurrentManipulateStatus GetCurrentManipulateStatus_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_CurrentManipulateStatus& local_4 = ECSFunc_FC_CurrentManipulateStatus::GetCurrentManipulateStatus(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_CurrentManipulateStatus();
}
const FC_CurrentManipulateStatus GetDefaultedCurrentManipulateStatus(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_CurrentManipulateStatus __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_CurrentManipulateStatus);
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
FC_CurrentManipulateStatus GetDefaultedCurrentManipulateStatus_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_CurrentManipulateStatus::GetDefaultedCurrentManipulateStatus(Entity);
}
UFUNCTION()
bool RemoveCurrentManipulateStatus(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_CurrentManipulateStatus);
}
}
FECSMonitorRuntimeView __GetMonitorCurrentManipulateStatusOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_CurrentManipulateStatus, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCurrentManipulateStatusOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_CurrentManipulateStatus, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCurrentManipulateStatusOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_CurrentManipulateStatus, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCurrentManipulateStatusOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_CurrentManipulateStatus, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCurrentManipulateStatusOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_CurrentManipulateStatus, bFixedFrame, bMustHandleAll);
}
void __MonitorCurrentManipulateStatusLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_CurrentManipulateStatus, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCurrentManipulateStatusActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_CurrentManipulateStatus, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCurrentManipulateStatusModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_CurrentManipulateStatus, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_ManipulateActionLifecycle
{
UFUNCTION()
bool HasManipulateActionLifecycle(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_ManipulateActionLifecycle);
}
FC_ManipulateActionLifecycle& AssignManipulateActionLifecycle(const FECSEntity &inout Entity, const FC_ManipulateActionLifecycle &inout DefaultValue = FC_ManipulateActionLifecycle())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_ManipulateActionLifecycle, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignManipulateActionLifecycle_BP(const FECSEntity &inout Entity, const FC_ManipulateActionLifecycle &inout DefaultValue = FC_ManipulateActionLifecycle())
{
    ECSFunc_FC_ManipulateActionLifecycle::AssignManipulateActionLifecycle(Entity, DefaultValue);
    return;
}
FC_ManipulateActionLifecycle& ModifyManipulateActionLifecycle(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_ManipulateActionLifecycle));
    return local_12.GetComp();
}
FC_ManipulateActionLifecycle& ModifyOrAddManipulateActionLifecycle(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_ManipulateActionLifecycle));
    return local_12.GetComp();
}
const FC_ManipulateActionLifecycle& GetManipulateActionLifecycle(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_ManipulateActionLifecycle));
    return local_12.GetComp();
}
UFUNCTION()
FC_ManipulateActionLifecycle GetManipulateActionLifecycle_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_ManipulateActionLifecycle __r;
    bValid = false;
    bValid = ECSFunc_FC_ManipulateActionLifecycle::GetManipulateActionLifecycle(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_ManipulateActionLifecycle GetDefaultedManipulateActionLifecycle(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_ManipulateActionLifecycle __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_ManipulateActionLifecycle);
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
FC_ManipulateActionLifecycle GetDefaultedManipulateActionLifecycle_BP(const FECSEntity &inout Entity)
{
    FC_ManipulateActionLifecycle __r;
    return __r;
}
UFUNCTION()
bool RemoveManipulateActionLifecycle(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_ManipulateActionLifecycle);
}
}
FECSMonitorRuntimeView __GetMonitorManipulateActionLifecycleOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_ManipulateActionLifecycle, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorManipulateActionLifecycleOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_ManipulateActionLifecycle, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorManipulateActionLifecycleOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_ManipulateActionLifecycle, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorManipulateActionLifecycleOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_ManipulateActionLifecycle, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorManipulateActionLifecycleOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_ManipulateActionLifecycle, bFixedFrame, bMustHandleAll);
}
void __MonitorManipulateActionLifecycleLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_ManipulateActionLifecycle, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorManipulateActionLifecycleActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_ManipulateActionLifecycle, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorManipulateActionLifecycleModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_ManipulateActionLifecycle, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_ManipulatedByCurve
{
UFUNCTION()
bool HasManipulatedByCurve(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_ManipulatedByCurve);
}
FC_ManipulatedByCurve& AssignManipulatedByCurve(const FECSEntity &inout Entity, const FC_ManipulatedByCurve &inout DefaultValue = FC_ManipulatedByCurve())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_ManipulatedByCurve, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignManipulatedByCurve_BP(const FECSEntity &inout Entity, const FC_ManipulatedByCurve &inout DefaultValue = FC_ManipulatedByCurve())
{
    ECSFunc_FC_ManipulatedByCurve::AssignManipulatedByCurve(Entity, DefaultValue);
    return;
}
FC_ManipulatedByCurve& ModifyManipulatedByCurve(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_ManipulatedByCurve));
    return local_12.GetComp();
}
FC_ManipulatedByCurve& ModifyOrAddManipulatedByCurve(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_ManipulatedByCurve));
    return local_12.GetComp();
}
const FC_ManipulatedByCurve& GetManipulatedByCurve(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_ManipulatedByCurve));
    return local_12.GetComp();
}
UFUNCTION()
FC_ManipulatedByCurve GetManipulatedByCurve_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_ManipulatedByCurve& local_4 = ECSFunc_FC_ManipulatedByCurve::GetManipulatedByCurve(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_ManipulatedByCurve();
}
const FC_ManipulatedByCurve GetDefaultedManipulatedByCurve(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_ManipulatedByCurve __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_ManipulatedByCurve);
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
FC_ManipulatedByCurve GetDefaultedManipulatedByCurve_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_ManipulatedByCurve::GetDefaultedManipulatedByCurve(Entity);
}
UFUNCTION()
bool RemoveManipulatedByCurve(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_ManipulatedByCurve);
}
}
FECSMonitorRuntimeView __GetMonitorManipulatedByCurveOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_ManipulatedByCurve, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorManipulatedByCurveOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_ManipulatedByCurve, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorManipulatedByCurveOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_ManipulatedByCurve, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorManipulatedByCurveOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_ManipulatedByCurve, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorManipulatedByCurveOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_ManipulatedByCurve, bFixedFrame, bMustHandleAll);
}
void __MonitorManipulatedByCurveLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_ManipulatedByCurve, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorManipulatedByCurveActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_ManipulatedByCurve, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorManipulatedByCurveModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_ManipulatedByCurve, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_ManipulateOffsetTrack
{
UFUNCTION()
bool HasManipulateOffsetTrack(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_ManipulateOffsetTrack);
}
FC_ManipulateOffsetTrack& AssignManipulateOffsetTrack(const FECSEntity &inout Entity, const FC_ManipulateOffsetTrack &inout DefaultValue = FC_ManipulateOffsetTrack())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_ManipulateOffsetTrack, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignManipulateOffsetTrack_BP(const FECSEntity &inout Entity, const FC_ManipulateOffsetTrack &inout DefaultValue = FC_ManipulateOffsetTrack())
{
    ECSFunc_FC_ManipulateOffsetTrack::AssignManipulateOffsetTrack(Entity, DefaultValue);
    return;
}
FC_ManipulateOffsetTrack& ModifyManipulateOffsetTrack(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_ManipulateOffsetTrack));
    return local_12.GetComp();
}
FC_ManipulateOffsetTrack& ModifyOrAddManipulateOffsetTrack(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_ManipulateOffsetTrack));
    return local_12.GetComp();
}
const FC_ManipulateOffsetTrack& GetManipulateOffsetTrack(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_ManipulateOffsetTrack));
    return local_12.GetComp();
}
UFUNCTION()
FC_ManipulateOffsetTrack GetManipulateOffsetTrack_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_ManipulateOffsetTrack __r;
    bValid = false;
    bValid = ECSFunc_FC_ManipulateOffsetTrack::GetManipulateOffsetTrack(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_ManipulateOffsetTrack GetDefaultedManipulateOffsetTrack(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_ManipulateOffsetTrack __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_ManipulateOffsetTrack);
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
FC_ManipulateOffsetTrack GetDefaultedManipulateOffsetTrack_BP(const FECSEntity &inout Entity)
{
    FC_ManipulateOffsetTrack __r;
    return __r;
}
UFUNCTION()
bool RemoveManipulateOffsetTrack(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_ManipulateOffsetTrack);
}
}
FECSMonitorRuntimeView __GetMonitorManipulateOffsetTrackOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_ManipulateOffsetTrack, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorManipulateOffsetTrackOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_ManipulateOffsetTrack, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorManipulateOffsetTrackOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_ManipulateOffsetTrack, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorManipulateOffsetTrackOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_ManipulateOffsetTrack, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorManipulateOffsetTrackOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_ManipulateOffsetTrack, bFixedFrame, bMustHandleAll);
}
void __MonitorManipulateOffsetTrackLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_ManipulateOffsetTrack, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorManipulateOffsetTrackActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_ManipulateOffsetTrack, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorManipulateOffsetTrackModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_ManipulateOffsetTrack, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_ManipulateInterpoClockLatch
{
UFUNCTION()
bool HasManipulateInterpoClockLatch(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_ManipulateInterpoClockLatch);
}
FC_ManipulateInterpoClockLatch& AssignManipulateInterpoClockLatch(const FECSEntity &inout Entity, const FC_ManipulateInterpoClockLatch &inout DefaultValue = FC_ManipulateInterpoClockLatch())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_ManipulateInterpoClockLatch, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignManipulateInterpoClockLatch_BP(const FECSEntity &inout Entity, const FC_ManipulateInterpoClockLatch &inout DefaultValue = FC_ManipulateInterpoClockLatch())
{
    ECSFunc_FC_ManipulateInterpoClockLatch::AssignManipulateInterpoClockLatch(Entity, DefaultValue);
    return;
}
FC_ManipulateInterpoClockLatch& ModifyManipulateInterpoClockLatch(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_ManipulateInterpoClockLatch));
    return local_12.GetComp();
}
FC_ManipulateInterpoClockLatch& ModifyOrAddManipulateInterpoClockLatch(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_ManipulateInterpoClockLatch));
    return local_12.GetComp();
}
const FC_ManipulateInterpoClockLatch& GetManipulateInterpoClockLatch(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_ManipulateInterpoClockLatch));
    return local_12.GetComp();
}
UFUNCTION()
FC_ManipulateInterpoClockLatch GetManipulateInterpoClockLatch_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_ManipulateInterpoClockLatch __r;
    bValid = false;
    bValid = ECSFunc_FC_ManipulateInterpoClockLatch::GetManipulateInterpoClockLatch(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_ManipulateInterpoClockLatch GetDefaultedManipulateInterpoClockLatch(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_ManipulateInterpoClockLatch __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_ManipulateInterpoClockLatch);
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
FC_ManipulateInterpoClockLatch GetDefaultedManipulateInterpoClockLatch_BP(const FECSEntity &inout Entity)
{
    FC_ManipulateInterpoClockLatch __r;
    return __r;
}
UFUNCTION()
bool RemoveManipulateInterpoClockLatch(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_ManipulateInterpoClockLatch);
}
}
FECSMonitorRuntimeView __GetMonitorManipulateInterpoClockLatchOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_ManipulateInterpoClockLatch, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorManipulateInterpoClockLatchOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_ManipulateInterpoClockLatch, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorManipulateInterpoClockLatchOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_ManipulateInterpoClockLatch, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorManipulateInterpoClockLatchOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_ManipulateInterpoClockLatch, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorManipulateInterpoClockLatchOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_ManipulateInterpoClockLatch, bFixedFrame, bMustHandleAll);
}
void __MonitorManipulateInterpoClockLatchLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_ManipulateInterpoClockLatch, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorManipulateInterpoClockLatchActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_ManipulateInterpoClockLatch, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorManipulateInterpoClockLatchModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_ManipulateInterpoClockLatch, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_ManipulateAttachedInterpoClock
{
UFUNCTION()
bool HasManipulateAttachedInterpoClock(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_ManipulateAttachedInterpoClock);
}
FC_ManipulateAttachedInterpoClock& AssignManipulateAttachedInterpoClock(const FECSEntity &inout Entity, const FC_ManipulateAttachedInterpoClock &inout DefaultValue = FC_ManipulateAttachedInterpoClock())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_ManipulateAttachedInterpoClock, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignManipulateAttachedInterpoClock_BP(const FECSEntity &inout Entity, const FC_ManipulateAttachedInterpoClock &inout DefaultValue = FC_ManipulateAttachedInterpoClock())
{
    ECSFunc_FC_ManipulateAttachedInterpoClock::AssignManipulateAttachedInterpoClock(Entity, DefaultValue);
    return;
}
FC_ManipulateAttachedInterpoClock& ModifyManipulateAttachedInterpoClock(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_ManipulateAttachedInterpoClock));
    return local_12.GetComp();
}
FC_ManipulateAttachedInterpoClock& ModifyOrAddManipulateAttachedInterpoClock(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_ManipulateAttachedInterpoClock));
    return local_12.GetComp();
}
const FC_ManipulateAttachedInterpoClock& GetManipulateAttachedInterpoClock(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_ManipulateAttachedInterpoClock));
    return local_12.GetComp();
}
UFUNCTION()
FC_ManipulateAttachedInterpoClock GetManipulateAttachedInterpoClock_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_ManipulateAttachedInterpoClock __r;
    bValid = false;
    bValid = ECSFunc_FC_ManipulateAttachedInterpoClock::GetManipulateAttachedInterpoClock(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_ManipulateAttachedInterpoClock GetDefaultedManipulateAttachedInterpoClock(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_ManipulateAttachedInterpoClock __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_ManipulateAttachedInterpoClock);
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
FC_ManipulateAttachedInterpoClock GetDefaultedManipulateAttachedInterpoClock_BP(const FECSEntity &inout Entity)
{
    FC_ManipulateAttachedInterpoClock __r;
    return __r;
}
UFUNCTION()
bool RemoveManipulateAttachedInterpoClock(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_ManipulateAttachedInterpoClock);
}
}
FECSMonitorRuntimeView __GetMonitorManipulateAttachedInterpoClockOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_ManipulateAttachedInterpoClock, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorManipulateAttachedInterpoClockOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_ManipulateAttachedInterpoClock, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorManipulateAttachedInterpoClockOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_ManipulateAttachedInterpoClock, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorManipulateAttachedInterpoClockOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_ManipulateAttachedInterpoClock, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorManipulateAttachedInterpoClockOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_ManipulateAttachedInterpoClock, bFixedFrame, bMustHandleAll);
}
void __MonitorManipulateAttachedInterpoClockLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_ManipulateAttachedInterpoClock, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorManipulateAttachedInterpoClockActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_ManipulateAttachedInterpoClock, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorManipulateAttachedInterpoClockModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_ManipulateAttachedInterpoClock, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_ManipulateCurveViewBlend
{
UFUNCTION()
bool HasManipulateCurveViewBlend(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_ManipulateCurveViewBlend);
}
FC_ManipulateCurveViewBlend& AssignManipulateCurveViewBlend(const FECSEntity &inout Entity, const FC_ManipulateCurveViewBlend &inout DefaultValue = FC_ManipulateCurveViewBlend())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_ManipulateCurveViewBlend, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignManipulateCurveViewBlend_BP(const FECSEntity &inout Entity, const FC_ManipulateCurveViewBlend &inout DefaultValue = FC_ManipulateCurveViewBlend())
{
    ECSFunc_FC_ManipulateCurveViewBlend::AssignManipulateCurveViewBlend(Entity, DefaultValue);
    return;
}
FC_ManipulateCurveViewBlend& ModifyManipulateCurveViewBlend(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_ManipulateCurveViewBlend));
    return local_12.GetComp();
}
FC_ManipulateCurveViewBlend& ModifyOrAddManipulateCurveViewBlend(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_ManipulateCurveViewBlend));
    return local_12.GetComp();
}
const FC_ManipulateCurveViewBlend& GetManipulateCurveViewBlend(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_ManipulateCurveViewBlend));
    return local_12.GetComp();
}
UFUNCTION()
FC_ManipulateCurveViewBlend GetManipulateCurveViewBlend_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_ManipulateCurveViewBlend& local_4 = ECSFunc_FC_ManipulateCurveViewBlend::GetManipulateCurveViewBlend(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_ManipulateCurveViewBlend();
}
const FC_ManipulateCurveViewBlend GetDefaultedManipulateCurveViewBlend(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_ManipulateCurveViewBlend __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_ManipulateCurveViewBlend);
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
FC_ManipulateCurveViewBlend GetDefaultedManipulateCurveViewBlend_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_ManipulateCurveViewBlend::GetDefaultedManipulateCurveViewBlend(Entity);
}
UFUNCTION()
bool RemoveManipulateCurveViewBlend(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_ManipulateCurveViewBlend);
}
}
FECSMonitorRuntimeView __GetMonitorManipulateCurveViewBlendOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_ManipulateCurveViewBlend, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorManipulateCurveViewBlendOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_ManipulateCurveViewBlend, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorManipulateCurveViewBlendOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_ManipulateCurveViewBlend, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorManipulateCurveViewBlendOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_ManipulateCurveViewBlend, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorManipulateCurveViewBlendOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_ManipulateCurveViewBlend, bFixedFrame, bMustHandleAll);
}
void __MonitorManipulateCurveViewBlendLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_ManipulateCurveViewBlend, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorManipulateCurveViewBlendActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_ManipulateCurveViewBlend, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorManipulateCurveViewBlendModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_ManipulateCurveViewBlend, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_ViewSocketAlign
{
UFUNCTION()
bool HasViewSocketAlign(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_ViewSocketAlign);
}
FC_ViewSocketAlign& AssignViewSocketAlign(const FECSEntity &inout Entity, const FC_ViewSocketAlign &inout DefaultValue = FC_ViewSocketAlign())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_ViewSocketAlign, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignViewSocketAlign_BP(const FECSEntity &inout Entity, const FC_ViewSocketAlign &inout DefaultValue = FC_ViewSocketAlign())
{
    ECSFunc_FC_ViewSocketAlign::AssignViewSocketAlign(Entity, DefaultValue);
    return;
}
FC_ViewSocketAlign& ModifyViewSocketAlign(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_ViewSocketAlign));
    return local_12.GetComp();
}
FC_ViewSocketAlign& ModifyOrAddViewSocketAlign(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_ViewSocketAlign));
    return local_12.GetComp();
}
const FC_ViewSocketAlign& GetViewSocketAlign(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_ViewSocketAlign));
    return local_12.GetComp();
}
UFUNCTION()
FC_ViewSocketAlign GetViewSocketAlign_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_ViewSocketAlign __r;
    bValid = false;
    bValid = ECSFunc_FC_ViewSocketAlign::GetViewSocketAlign(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_ViewSocketAlign GetDefaultedViewSocketAlign(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_ViewSocketAlign __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_ViewSocketAlign);
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
FC_ViewSocketAlign GetDefaultedViewSocketAlign_BP(const FECSEntity &inout Entity)
{
    FC_ViewSocketAlign __r;
    return __r;
}
UFUNCTION()
bool RemoveViewSocketAlign(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_ViewSocketAlign);
}
}
FECSMonitorRuntimeView __GetMonitorViewSocketAlignOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_ViewSocketAlign, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorViewSocketAlignOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_ViewSocketAlign, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorViewSocketAlignOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_ViewSocketAlign, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorViewSocketAlignOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_ViewSocketAlign, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorViewSocketAlignOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_ViewSocketAlign, bFixedFrame, bMustHandleAll);
}
void __MonitorViewSocketAlignLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_ViewSocketAlign, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorViewSocketAlignActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_ViewSocketAlign, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorViewSocketAlignModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_ViewSocketAlign, bFixedFrame, Details);
    return;
}
namespace AutoDelta
{
FRootDirtyFlags32 GetDirtyFlags(FC_ManipulatedInfo &inout Data)
{
    FRootDirtyFlags32 __r;
    return __r;
}
void InitDirtyFlags(FC_ManipulatedInfo &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_ManipulatedInfo &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_ManipulatedInfo
{
int __IndexOf_MasterEntity()
{
    return 0;
}
int __IndexOf_SocketName()
{
    return 1;
}
int __IndexOf_LocationOffset()
{
    return 2;
}
int __IndexOf_RotationOffset()
{
    return 3;
}
int __IndexOf_AttachBlendKeepDuration()
{
    return 4;
}
int __IndexOf_AttachBlendInDuration()
{
    return 5;
}
int __IndexOf_AttachSocketUpdatePeriod()
{
    return 6;
}
int __IndexOf_BeginTransitStateName()
{
    return 7;
}
int __IndexOf_BeginTransitStateSyncNormalizedTime()
{
    return 8;
}
int __IndexOf_bSyncWithMasterStateNormalizedTime()
{
    return 9;
}
int __IndexOf_MasterStateNormalizedTimeScale()
{
    return 10;
}
int __IndexOf_EndTransitStateName()
{
    return 11;
}
int __IndexOf_ExitTime()
{
    return 12;
}
int __IndexOf_UpdateCounter()
{
    return 13;
}
int __IndexOf_bAttachMasterToSlave()
{
    return 14;
}
int __IndexOf_bOnlyStateTransition()
{
    return 15;
}
int __IndexOf_bTargetIgnoreOtherAttack()
{
    return 16;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_CurrentManipulateStatus &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_CurrentManipulateStatus &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_CurrentManipulateStatus &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_CurrentManipulateStatus
{
int __IndexOf_LasUpdateCounter()
{
    return 0;
}
}
namespace AutoDelta
{
FRootDirtyFlags16 GetDirtyFlags(FC_ManipulatedByCurve &inout Data)
{
    FRootDirtyFlags16 __r;
    return __r;
}
void InitDirtyFlags(FC_ManipulatedByCurve &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_ManipulatedByCurve &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_ManipulatedByCurve
{
int __IndexOf_MasterEntity()
{
    return 0;
}
int __IndexOf_RelativeLocationOffset()
{
    return 1;
}
int __IndexOf_RelativeRotationOffset()
{
    return 2;
}
int __IndexOf_StartTime()
{
    return 3;
}
int __IndexOf_Phase()
{
    return 4;
}
int __IndexOf_SmoothSpeed()
{
    return 5;
}
int __IndexOf_RelativeLocationCurveBBVar()
{
    return 6;
}
int __IndexOf_RelativeRotationCurveBBVar()
{
    return 7;
}
}
