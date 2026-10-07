
enum EProjectileMovementCalculationMethod
{
    InitSpeed,
    MoveTime,
    InitDirection,
}

enum EProjectileMovementCalculationConfigTargetType
{
    LockTarget,
    SkillTargetPosition,
    AimAtEntityBB,
    WorldPosition,
}

enum EProjectileMovementCalculationRuntimeTargetType
{
    None,
    Position,
    Entity,
}

enum EAdditionalMovementMode
{
    Position,
    Acceleration,
}

enum EAdditionalMovementRotationMode
{
    TransformRotation,
    MovementDirection,
}

enum ECurveMovementValueType
{
    Position,
    DeltaPostion,
}

enum ECurveRotationValueType
{
    Rotation,
    DeltaRotation,
}

enum ETrackRuntimeType
{
    Entity,
    Pos,
    EntityHistoryPos,
    LockTarget,
}

enum EOrbitTargetType
{
    Pos,
    Entity,
}

enum EGroundMovementOrientationMode
{
    None,
    AlignZAxisToGroundNormal,
}

enum EGroundMovementBlockMode
{
    None,
    Fall,
}

namespace __INTENRAL_FC_MovementInfo_NS
{
    const TECSComponentDerivedPtr<FC_MovementInfo> DerivedPtr = TECSComponentDerivedPtr<FC_MovementInfo>();
    const FC_MovementInfo DefaultValue = FC_MovementInfo();
}
namespace __INTENRAL_FC_MovementEndAbilitySignal_NS
{
    const TECSComponentDerivedPtr<FC_MovementEndAbilitySignal> DerivedPtr = TECSComponentDerivedPtr<FC_MovementEndAbilitySignal>();
    const FC_MovementEndAbilitySignal DefaultValue = FC_MovementEndAbilitySignal();
}
namespace __INTENRAL_FC_MovementEndEventToESMTriggerFilterSignal_NS
{
    const TECSComponentDerivedPtr<FC_MovementEndEventToESMTriggerFilterSignal> DerivedPtr = TECSComponentDerivedPtr<FC_MovementEndEventToESMTriggerFilterSignal>();
    const FC_MovementEndEventToESMTriggerFilterSignal DefaultValue = FC_MovementEndEventToESMTriggerFilterSignal();
}
namespace __INTENRAL_FC_UpdateMovementParamOnActionStateChangedDeferTag_NS
{
    const TECSComponentDerivedPtr<FC_UpdateMovementParamOnActionStateChangedDeferTag> DerivedPtr = TECSComponentDerivedPtr<FC_UpdateMovementParamOnActionStateChangedDeferTag>();
    const FC_UpdateMovementParamOnActionStateChangedDeferTag DefaultValue = FC_UpdateMovementParamOnActionStateChangedDeferTag();
}
namespace __INTENRAL_FC_LinearMovementConfig_NS
{
    const TECSComponentDerivedPtr<FC_LinearMovementConfig> DerivedPtr = TECSComponentDerivedPtr<FC_LinearMovementConfig>();
    const FC_LinearMovementConfig DefaultValue = FC_LinearMovementConfig();
}
namespace __INTENRAL_FC_LinearMovementOverride_NS
{
    const TECSComponentDerivedPtr<FC_LinearMovementOverride> DerivedPtr = TECSComponentDerivedPtr<FC_LinearMovementOverride>();
    const FC_LinearMovementOverride DefaultValue = FC_LinearMovementOverride();
}
namespace __INTENRAL_FC_SimpleProjectileMovementConfig_NS
{
    const TECSComponentDerivedPtr<FC_SimpleProjectileMovementConfig> DerivedPtr = TECSComponentDerivedPtr<FC_SimpleProjectileMovementConfig>();
    const FC_SimpleProjectileMovementConfig DefaultValue = FC_SimpleProjectileMovementConfig();
}
namespace __INTENRAL_FC_SimpleProjectileMovementOverride_NS
{
    const TECSComponentDerivedPtr<FC_SimpleProjectileMovementOverride> DerivedPtr = TECSComponentDerivedPtr<FC_SimpleProjectileMovementOverride>();
    const FC_SimpleProjectileMovementOverride DefaultValue = FC_SimpleProjectileMovementOverride();
}
namespace __INTENRAL_FC_ThrowMovementConfig_NS
{
    const TECSComponentDerivedPtr<FC_ThrowMovementConfig> DerivedPtr = TECSComponentDerivedPtr<FC_ThrowMovementConfig>();
    const FC_ThrowMovementConfig DefaultValue = FC_ThrowMovementConfig();
}
namespace __INTENRAL_FC_ThrowMovementOverride_NS
{
    const TECSComponentDerivedPtr<FC_ThrowMovementOverride> DerivedPtr = TECSComponentDerivedPtr<FC_ThrowMovementOverride>();
    const FC_ThrowMovementOverride DefaultValue = FC_ThrowMovementOverride();
}
namespace __INTENRAL_FC_AutoCalcProjectileMovement_NS
{
    const TECSComponentDerivedPtr<FC_AutoCalcProjectileMovement> DerivedPtr = TECSComponentDerivedPtr<FC_AutoCalcProjectileMovement>();
    const FC_AutoCalcProjectileMovement DefaultValue = FC_AutoCalcProjectileMovement();
}
namespace __INTENRAL_FC_MovementByBVar_NS
{
    const TECSComponentDerivedPtr<FC_MovementByBVar> DerivedPtr = TECSComponentDerivedPtr<FC_MovementByBVar>();
    const FC_MovementByBVar DefaultValue = FC_MovementByBVar();
}
namespace __INTENRAL_FC_RelativeMovement_NS
{
    const TECSComponentDerivedPtr<FC_RelativeMovement> DerivedPtr = TECSComponentDerivedPtr<FC_RelativeMovement>();
    const FC_RelativeMovement DefaultValue = FC_RelativeMovement();
}
namespace __INTENRAL_FC_RelativeMovementEnableByTime_NS
{
    const TECSComponentDerivedPtr<FC_RelativeMovementEnableByTime> DerivedPtr = TECSComponentDerivedPtr<FC_RelativeMovementEnableByTime>();
    const FC_RelativeMovementEnableByTime DefaultValue = FC_RelativeMovementEnableByTime();
}
namespace __INTENRAL_FC_AdditionalMovementConfig_NS
{
    const TECSComponentDerivedPtr<FC_AdditionalMovementConfig> DerivedPtr = TECSComponentDerivedPtr<FC_AdditionalMovementConfig>();
    const FC_AdditionalMovementConfig DefaultValue = FC_AdditionalMovementConfig();
}
namespace __INTENRAL_FC_CurveMovementConfig_NS
{
    const TECSComponentDerivedPtr<FC_CurveMovementConfig> DerivedPtr = TECSComponentDerivedPtr<FC_CurveMovementConfig>();
    const FC_CurveMovementConfig DefaultValue = FC_CurveMovementConfig();
}
namespace __INTENRAL_FC_CurveMovementOverride_NS
{
    const TECSComponentDerivedPtr<FC_CurveMovementOverride> DerivedPtr = TECSComponentDerivedPtr<FC_CurveMovementOverride>();
    const FC_CurveMovementOverride DefaultValue = FC_CurveMovementOverride();
}
namespace __INTENRAL_FC_CurveRotationConfig_NS
{
    const TECSComponentDerivedPtr<FC_CurveRotationConfig> DerivedPtr = TECSComponentDerivedPtr<FC_CurveRotationConfig>();
    const FC_CurveRotationConfig DefaultValue = FC_CurveRotationConfig();
}
namespace __INTENRAL_FC_CurveRotationOverride_NS
{
    const TECSComponentDerivedPtr<FC_CurveRotationOverride> DerivedPtr = TECSComponentDerivedPtr<FC_CurveRotationOverride>();
    const FC_CurveRotationOverride DefaultValue = FC_CurveRotationOverride();
}
namespace __INTENRAL_FC_TrackMovementConfig_NS
{
    const TECSComponentDerivedPtr<FC_TrackMovementConfig> DerivedPtr = TECSComponentDerivedPtr<FC_TrackMovementConfig>();
    const FC_TrackMovementConfig DefaultValue = FC_TrackMovementConfig();
}
namespace __INTENRAL_FC_TrackMovementOverride_NS
{
    const TECSComponentDerivedPtr<FC_TrackMovementOverride> DerivedPtr = TECSComponentDerivedPtr<FC_TrackMovementOverride>();
    const FC_TrackMovementOverride DefaultValue = FC_TrackMovementOverride();
}
namespace __INTENRAL_FC_TrackRuntime_NS
{
    const TECSComponentDerivedPtr<FC_TrackRuntime> DerivedPtr = TECSComponentDerivedPtr<FC_TrackRuntime>();
    const FC_TrackRuntime DefaultValue = FC_TrackRuntime();
}
namespace __INTENRAL_FC_OrbitMovementRuntime_NS
{
    const TECSComponentDerivedPtr<FC_OrbitMovementRuntime> DerivedPtr = TECSComponentDerivedPtr<FC_OrbitMovementRuntime>();
    const FC_OrbitMovementRuntime DefaultValue = FC_OrbitMovementRuntime();
}
namespace __INTENRAL_FC_FixedDurationMovementConfig_NS
{
    const TECSComponentDerivedPtr<FC_FixedDurationMovementConfig> DerivedPtr = TECSComponentDerivedPtr<FC_FixedDurationMovementConfig>();
    const FC_FixedDurationMovementConfig DefaultValue = FC_FixedDurationMovementConfig();
}
namespace __INTENRAL_FC_FixedDurationMovementOverride_NS
{
    const TECSComponentDerivedPtr<FC_FixedDurationMovementOverride> DerivedPtr = TECSComponentDerivedPtr<FC_FixedDurationMovementOverride>();
    const FC_FixedDurationMovementOverride DefaultValue = FC_FixedDurationMovementOverride();
}
namespace __INTENRAL_FC_FixedDurationMovementRuntime_NS
{
    const TECSComponentDerivedPtr<FC_FixedDurationMovementRuntime> DerivedPtr = TECSComponentDerivedPtr<FC_FixedDurationMovementRuntime>();
    const FC_FixedDurationMovementRuntime DefaultValue = FC_FixedDurationMovementRuntime();
}
namespace __INTENRAL_FC_GravityFallingMovementRuntime_NS
{
    const TECSComponentDerivedPtr<FC_GravityFallingMovementRuntime> DerivedPtr = TECSComponentDerivedPtr<FC_GravityFallingMovementRuntime>();
    const FC_GravityFallingMovementRuntime DefaultValue = FC_GravityFallingMovementRuntime();
}
namespace __INTENRAL_FC_GroundMovementConfig_NS
{
    const TECSComponentDerivedPtr<FC_GroundMovementConfig> DerivedPtr = TECSComponentDerivedPtr<FC_GroundMovementConfig>();
    const FC_GroundMovementConfig DefaultValue = FC_GroundMovementConfig();
}
namespace __INTENRAL_FC_GroundMovementOverride_NS
{
    const TECSComponentDerivedPtr<FC_GroundMovementOverride> DerivedPtr = TECSComponentDerivedPtr<FC_GroundMovementOverride>();
    const FC_GroundMovementOverride DefaultValue = FC_GroundMovementOverride();

}
struct FC_MovementInfo : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    FFPTime m_MoveBeginTime;
    UPROPERTY()
    FFPTime m_MoveTotalTime;
    UPROPERTY()
    FFPTime m_MoveTime;
    UPROPERTY()
    FFPTime m_LastMoveTime;
    UPROPERTY()
    FVector m_Velocity;
    UPROPERTY()
    FQuat m_InitRotation;
    UPROPERTY()
    bool m_bModifyVelocityInTick;

    FC_MovementInfo()
    {
        this.m_MoveBeginTime = 0;
        this.m_MoveTotalTime = -1;
        this.m_MoveTime = 0;
        this.m_LastMoveTime = 0;
        this.m_Velocity = FVector::ZeroVector;
        this.m_InitRotation = FQuat::Identity;
        this.m_bModifyVelocityInTick = true;
        this.__InitDirtyFlags();
        return;
    }
    FC_MovementInfo(const FC_MovementInfo &inout Other)
    {
        this.m_MoveBeginTime = 0;
        this.m_MoveTotalTime = -1;
        this.m_MoveTime = 0;
        this.m_LastMoveTime = 0;
        this.m_Velocity = FVector::ZeroVector;
        this.m_InitRotation = FQuat::Identity;
        this.m_bModifyVelocityInTick = true;
        this.__InitDirtyFlags();
        this.m_MoveBeginTime = Other.m_MoveBeginTime;
        this.m_MoveTotalTime = Other.m_MoveTotalTime;
        this.m_MoveTime = Other.m_MoveTime;
        this.m_LastMoveTime = Other.m_LastMoveTime;
        this.m_Velocity = Other.m_Velocity;
        this.m_InitRotation = Other.m_InitRotation;
        this.m_bModifyVelocityInTick = Other.m_bModifyVelocityInTick;
        return;
    }
    FC_MovementInfo opAssign(const FC_MovementInfo &inout Other)
    {
        FC_MovementInfo __r;
        this.SetMoveBeginTime(Other.GetMoveBeginTime());
        this.SetMoveTotalTime(Other.GetMoveTotalTime());
        this.SetMoveTime(Other.GetMoveTime());
        this.SetLastMoveTime(Other.GetLastMoveTime());
        this.SetVelocity(Other.GetVelocity());
        this.SetInitRotation(Other.GetInitRotation());
        this.SetbModifyVelocityInTick(Other.GetbModifyVelocityInTick());
        return __r;
    }
    const FFPTime GetMoveBeginTime() const property
    {
        const FFPTime __r;
        return __r;
    }
    FFPTime GetModify_MoveBeginTime() property
    {
        FFPTime __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetMoveBeginTime(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_MoveBeginTime = __Value;
        return;
    }
    const FFPTime GetMoveTotalTime() const property
    {
        const FFPTime __r;
        return __r;
    }
    FFPTime GetModify_MoveTotalTime() property
    {
        FFPTime __r;
        this.__MarkDirty(1);
        return __r;
    }
    void SetMoveTotalTime(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_MoveTotalTime = __Value;
        return;
    }
    const FFPTime GetMoveTime() const property
    {
        const FFPTime __r;
        return __r;
    }
    FFPTime GetModify_MoveTime() property
    {
        FFPTime __r;
        this.__MarkDirty(2);
        return __r;
    }
    void SetMoveTime(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_MoveTime = __Value;
        return;
    }
    const FFPTime GetLastMoveTime() const property
    {
        const FFPTime __r;
        return __r;
    }
    FFPTime GetModify_LastMoveTime() property
    {
        FFPTime __r;
        this.__MarkDirty(3);
        return __r;
    }
    void SetLastMoveTime(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(3);
        this.m_LastMoveTime = __Value;
        return;
    }
    FVector GetVelocity() const property
    {
        FVector __r;
        return __r;
    }
    FVector GetModify_Velocity() property
    {
        FVector __r;
        this.__MarkDirty(4);
        return __r;
    }
    void SetVelocity(const FVector &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(4);
        this.m_Velocity = __Value;
        return;
    }
    const FQuat GetInitRotation() const property
    {
        const FQuat __r;
        return __r;
    }
    FQuat GetModify_InitRotation() property
    {
        FQuat __r;
        this.__MarkDirty(5);
        return __r;
    }
    void SetInitRotation(const FQuat &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(5);
        this.m_InitRotation = __Value;
        return;
    }
    bool GetbModifyVelocityInTick() const property
    {
        return this.m_bModifyVelocityInTick;
    }
    void SetbModifyVelocityInTick(const bool __Value) property
    {
        if (!(this.m_bModifyVelocityInTick) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(6);
        this.m_bModifyVelocityInTick = __Value;
        return;
    }
}

struct FTimeEnablePair
{
    UPROPERTY()
    float32 m_Time;
    UPROPERTY()
    bool m_bEnable;


    float32 GetTime() const property
    {
        return this.m_Time;
    }
    void SetTime(const float32 __Value) property
    {
        this.m_Time = __Value;
        return;
    }
    bool GetbEnable() const property
    {
        return this.m_bEnable;
    }
    void SetbEnable(const bool __Value) property
    {
        this.m_bEnable = __Value;
        return;
    }
}

struct FC_MovementEndAbilitySignal : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    FECSEntity m_NotifyEntity;
    UPROPERTY()
    TSoftClassPtr<UEASAbility> m_AbilityClass;
    UPROPERTY()
    FName m_SignalName;

    FC_MovementEndAbilitySignal()
    {
        this.__InitDirtyFlags();
        return;
    }
    FC_MovementEndAbilitySignal(const FC_MovementEndAbilitySignal &inout Other)
    {
        this.__InitDirtyFlags();
        this.m_NotifyEntity = Other.m_NotifyEntity;
        this.m_AbilityClass = Other.m_AbilityClass;
        this.m_SignalName = Other.m_SignalName;
        return;
    }
    FC_MovementEndAbilitySignal opAssign(const FC_MovementEndAbilitySignal &inout Other)
    {
        FC_MovementEndAbilitySignal __r;
        this.SetNotifyEntity(Other.GetNotifyEntity());
        this.SetAbilityClass(Other.GetAbilityClass());
        this.SetSignalName(Other.GetSignalName());
        return __r;
    }
    const FECSEntity GetNotifyEntity() const property
    {
        const FECSEntity __r;
        return __r;
    }
    FECSEntity GetModify_NotifyEntity() property
    {
        FECSEntity __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetNotifyEntity(const FECSEntity &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_NotifyEntity = __Value;
        return;
    }
    const TSoftClassPtr<UEASAbility> GetAbilityClass() const property
    {
        const TSoftClassPtr<UEASAbility> __r;
        return __r;
    }
    TSoftClassPtr<UEASAbility> GetModify_AbilityClass() property
    {
        TSoftClassPtr<UEASAbility> __r;
        this.__MarkDirty(1);
        return __r;
    }
    void SetAbilityClass(const TSoftClassPtr<UEASAbility> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_AbilityClass = __Value;
        return;
    }
    FName GetSignalName() const property
    {
        return this.m_SignalName;
    }
    void SetSignalName(const FName &inout __Value) property
    {
        if ((this.m_SignalName == __Value))
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_SignalName = __Value;
        return;
    }
}

struct FC_MovementEndEventToESMTriggerFilterSignal : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    FECSEntity m_NotifyEntity;
    UPROPERTY()
    FName m_EventName;

    FC_MovementEndEventToESMTriggerFilterSignal()
    {
        this.__InitDirtyFlags();
        return;
    }
    FC_MovementEndEventToESMTriggerFilterSignal(const FC_MovementEndEventToESMTriggerFilterSignal &inout Other)
    {
        this.__InitDirtyFlags();
        this.m_NotifyEntity = Other.m_NotifyEntity;
        this.m_EventName = Other.m_EventName;
        return;
    }
    FC_MovementEndEventToESMTriggerFilterSignal opAssign(const FC_MovementEndEventToESMTriggerFilterSignal &inout Other)
    {
        FC_MovementEndEventToESMTriggerFilterSignal __r;
        this.SetNotifyEntity(Other.GetNotifyEntity());
        this.SetEventName(Other.GetEventName());
        return __r;
    }
    const FECSEntity GetNotifyEntity() const property
    {
        const FECSEntity __r;
        return __r;
    }
    FECSEntity GetModify_NotifyEntity() property
    {
        FECSEntity __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetNotifyEntity(const FECSEntity &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_NotifyEntity = __Value;
        return;
    }
    FName GetEventName() const property
    {
        return this.m_EventName;
    }
    void SetEventName(const FName &inout __Value) property
    {
        if ((this.m_EventName == __Value))
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_EventName = __Value;
        return;
    }
}

struct FC_UpdateMovementParamOnActionStateChangedDeferTag : FECSComponent
{
    FC_UpdateMovementParamOnActionStateChangedDeferTag()
    {
        return;
    }
}

struct FC_LinearMovementConfig : FECSComponent
{
    UPROPERTY()
    float32 Speed = 0.0f;
    UPROPERTY()
    bool bRotateToMoveDir = false;


}

struct FC_LinearMovementOverride : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    FVector m_Velocity;
    UPROPERTY()
    bool m_bRotateToMoveDir;

    FC_LinearMovementOverride()
    {
        this.m_Velocity = FVector::ZeroVector;
        this.m_bRotateToMoveDir = false;
        this.__InitDirtyFlags();
        return;
    }
    FC_LinearMovementOverride(const FC_LinearMovementOverride &inout Other)
    {
        this.m_Velocity = FVector::ZeroVector;
        this.m_bRotateToMoveDir = false;
        this.__InitDirtyFlags();
        this.m_Velocity = Other.m_Velocity;
        this.m_bRotateToMoveDir = Other.m_bRotateToMoveDir;
        return;
    }
    FC_LinearMovementOverride opAssign(const FC_LinearMovementOverride &inout Other)
    {
        FC_LinearMovementOverride __r;
        this.SetVelocity(Other.GetVelocity());
        this.SetbRotateToMoveDir(Other.GetbRotateToMoveDir());
        return __r;
    }
    FVector GetVelocity() const property
    {
        FVector __r;
        return __r;
    }
    FVector GetModify_Velocity() property
    {
        FVector __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetVelocity(const FVector &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_Velocity = __Value;
        return;
    }
    bool GetbRotateToMoveDir() const property
    {
        return this.m_bRotateToMoveDir;
    }
    void SetbRotateToMoveDir(const bool __Value) property
    {
        if (!(this.m_bRotateToMoveDir) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_bRotateToMoveDir = __Value;
        return;
    }
}

struct FSimpleProjectileMovementConfigData
{
    FSubDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    bool m_bPitchToMoveDir;
    UPROPERTY()
    float32 m_InitSpeed;
    UPROPERTY()
    float32 m_GravityScale;

    FSimpleProjectileMovementConfigData()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FSimpleProjectileMovementConfigData(const FSimpleProjectileMovementConfigData &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FSimpleProjectileMovementConfigData opAssign(const FSimpleProjectileMovementConfigData &inout Other)
    {
        FSimpleProjectileMovementConfigData __r;
        this.SetbPitchToMoveDir(Other.GetbPitchToMoveDir());
        this.SetInitSpeed(Other.GetInitSpeed());
        this.SetGravityScale(Other.GetGravityScale());
        return __r;
    }
    bool GetbPitchToMoveDir() const property
    {
        return this.m_bPitchToMoveDir;
    }
    void SetbPitchToMoveDir(const bool __Value) property
    {
        if (!(this.m_bPitchToMoveDir) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_bPitchToMoveDir = __Value;
        return;
    }
    float32 GetInitSpeed() const property
    {
        return this.m_InitSpeed;
    }
    void SetInitSpeed(const float32 __Value) property
    {
        if (this.m_InitSpeed == __Value)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_InitSpeed = __Value;
        return;
    }
    float32 GetGravityScale() const property
    {
        return this.m_GravityScale;
    }
    void SetGravityScale(const float32 __Value) property
    {
        if (this.m_GravityScale == __Value)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_GravityScale = __Value;
        return;
    }
}

struct FC_SimpleProjectileMovementConfig : FECSComponent
{
    UPROPERTY()
    FSimpleProjectileMovementConfigData Data;

    FC_SimpleProjectileMovementConfig()
    {
        return;
    }
}

struct FC_SimpleProjectileMovementOverride : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    FSimpleProjectileMovementConfigData m_Data;

    FC_SimpleProjectileMovementOverride()
    {
        this.__InitDirtyFlags();
        return;
    }
    FC_SimpleProjectileMovementOverride(const FC_SimpleProjectileMovementOverride &inout Other)
    {
        this.__InitDirtyFlags();
        this.m_Data = Other.m_Data;
        return;
    }
    FC_SimpleProjectileMovementOverride opAssign(const FC_SimpleProjectileMovementOverride &inout Other)
    {
        FC_SimpleProjectileMovementOverride __r;
        this.SetData(Other.GetData());
        return __r;
    }
    const FSimpleProjectileMovementConfigData GetData() const property
    {
        const FSimpleProjectileMovementConfigData __r;
        return __r;
    }
    FSimpleProjectileMovementConfigData GetData() property
    {
        FSimpleProjectileMovementConfigData __r;
        return __r;
    }
    void SetData(const FSimpleProjectileMovementConfigData &inout __Value) property
    {
        this.m_Data = __Value;
        return;
    }
}

struct FThrowMovementConfigData
{
    FSubDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    bool m_bPitchToMoveDir;
    UPROPERTY()
    float32 m_InitSpeed;
    UPROPERTY()
    float32 m_GravityScale;

    FThrowMovementConfigData()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FThrowMovementConfigData(const FThrowMovementConfigData &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FThrowMovementConfigData opAssign(const FThrowMovementConfigData &inout Other)
    {
        FThrowMovementConfigData __r;
        this.SetbPitchToMoveDir(Other.GetbPitchToMoveDir());
        this.SetInitSpeed(Other.GetInitSpeed());
        this.SetGravityScale(Other.GetGravityScale());
        return __r;
    }
    bool GetbPitchToMoveDir() const property
    {
        return this.m_bPitchToMoveDir;
    }
    void SetbPitchToMoveDir(const bool __Value) property
    {
        if (!(this.m_bPitchToMoveDir) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_bPitchToMoveDir = __Value;
        return;
    }
    float32 GetInitSpeed() const property
    {
        return this.m_InitSpeed;
    }
    void SetInitSpeed(const float32 __Value) property
    {
        if (this.m_InitSpeed == __Value)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_InitSpeed = __Value;
        return;
    }
    float32 GetGravityScale() const property
    {
        return this.m_GravityScale;
    }
    void SetGravityScale(const float32 __Value) property
    {
        if (this.m_GravityScale == __Value)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_GravityScale = __Value;
        return;
    }
}

struct FC_ThrowMovementConfig : FECSComponent
{
    UPROPERTY()
    FThrowMovementConfigData Data;
    UPROPERTY()
    bool bOverrideSplineFXActor = false;
    UPROPERTY()
    FSoftClassPath SplineFXActorClass;
    UPROPERTY()
    bool bOverrideEndPointFXTransform = false;
    UPROPERTY()
    FVector EndPointFXOverrideScale = FVector::OneVector;
    UPROPERTY()
    float32 EndPointFXOverrideHeightOffset = 0.0f;


}

struct FC_ThrowMovementOverride : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    FThrowMovementConfigData m_Data;

    FC_ThrowMovementOverride()
    {
        this.__InitDirtyFlags();
        return;
    }
    FC_ThrowMovementOverride(const FC_ThrowMovementOverride &inout Other)
    {
        this.__InitDirtyFlags();
        this.m_Data = Other.m_Data;
        return;
    }
    FC_ThrowMovementOverride opAssign(const FC_ThrowMovementOverride &inout Other)
    {
        FC_ThrowMovementOverride __r;
        this.SetData(Other.GetData());
        return __r;
    }
    const FThrowMovementConfigData GetData() const property
    {
        const FThrowMovementConfigData __r;
        return __r;
    }
    FThrowMovementConfigData GetData() property
    {
        FThrowMovementConfigData __r;
        return __r;
    }
    void SetData(const FThrowMovementConfigData &inout __Value) property
    {
        this.m_Data = __Value;
        return;
    }
}

struct FProjectileMovementCalculationData
{
    FSubDirtyFlags16 __DirtyFlags;
    UPROPERTY()
    EProjectileMovementCalculationConfigTargetType m_Target;
    UPROPERTY()
    FNameHandle_EntityBBVarEntity m_AimAtEntityBBHandle;
    UPROPERTY()
    FVector m_AimAtEntityBBOffset;
    UPROPERTY()
    FVector m_WorldPosition;
    UPROPERTY()
    EProjectileMovementCalculationMethod m_Method;
    UPROPERTY()
    bool m_bAddRotationOnResult;
    UPROPERTY()
    float32 m_OverrideMoveTime;
    UPROPERTY()
    float32 m_MinDistance;
    UPROPERTY()
    float32 m_MaxDistance;
    UPROPERTY()
    float32 m_AddtionalPitchWithoutTarget;

    FProjectileMovementCalculationData()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FProjectileMovementCalculationData(const FProjectileMovementCalculationData &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FProjectileMovementCalculationData opAssign(const FProjectileMovementCalculationData &inout Other)
    {
        FProjectileMovementCalculationData __r;
        this.SetTarget(Other.GetTarget());
        this.SetAimAtEntityBBHandle(Other.GetAimAtEntityBBHandle());
        this.SetAimAtEntityBBOffset(Other.GetAimAtEntityBBOffset());
        this.SetWorldPosition(Other.GetWorldPosition());
        this.SetMethod(Other.GetMethod());
        this.SetbAddRotationOnResult(Other.GetbAddRotationOnResult());
        this.SetOverrideMoveTime(Other.GetOverrideMoveTime());
        this.SetMinDistance(Other.GetMinDistance());
        this.SetMaxDistance(Other.GetMaxDistance());
        this.SetAddtionalPitchWithoutTarget(Other.GetAddtionalPitchWithoutTarget());
        return __r;
    }
    EProjectileMovementCalculationConfigTargetType GetTarget() const property
    {
        return this.m_Target;
    }
    void SetTarget(const EProjectileMovementCalculationConfigTargetType __Value) property
    {
        if (int(this.m_Target) == int(__Value))
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_Target = __Value;
        return;
    }
    const FNameHandle_EntityBBVarEntity GetAimAtEntityBBHandle() const property
    {
        const FNameHandle_EntityBBVarEntity __r;
        return __r;
    }
    FNameHandle_EntityBBVarEntity GetModify_AimAtEntityBBHandle() property
    {
        FNameHandle_EntityBBVarEntity __r;
        this.__MarkDirty(1);
        return __r;
    }
    void SetAimAtEntityBBHandle(const FNameHandle_EntityBBVarEntity &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_AimAtEntityBBHandle = __Value;
        return;
    }
    const FVector GetAimAtEntityBBOffset() const property
    {
        const FVector __r;
        return __r;
    }
    FVector GetModify_AimAtEntityBBOffset() property
    {
        FVector __r;
        this.__MarkDirty(2);
        return __r;
    }
    void SetAimAtEntityBBOffset(const FVector &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_AimAtEntityBBOffset = __Value;
        return;
    }
    const FVector GetWorldPosition() const property
    {
        const FVector __r;
        return __r;
    }
    FVector GetModify_WorldPosition() property
    {
        FVector __r;
        this.__MarkDirty(3);
        return __r;
    }
    void SetWorldPosition(const FVector &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(3);
        this.m_WorldPosition = __Value;
        return;
    }
    EProjectileMovementCalculationMethod GetMethod() const property
    {
        return this.m_Method;
    }
    void SetMethod(const EProjectileMovementCalculationMethod __Value) property
    {
        if (int(this.m_Method) == int(__Value))
        {
            return;
        }
        this.__MarkDirty(4);
        this.m_Method = __Value;
        return;
    }
    bool GetbAddRotationOnResult() const property
    {
        return this.m_bAddRotationOnResult;
    }
    void SetbAddRotationOnResult(const bool __Value) property
    {
        if (!(this.m_bAddRotationOnResult) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(5);
        this.m_bAddRotationOnResult = __Value;
        return;
    }
    float32 GetOverrideMoveTime() const property
    {
        return this.m_OverrideMoveTime;
    }
    void SetOverrideMoveTime(const float32 __Value) property
    {
        if (this.m_OverrideMoveTime == __Value)
        {
            return;
        }
        this.__MarkDirty(6);
        this.m_OverrideMoveTime = __Value;
        return;
    }
    float32 GetMinDistance() const property
    {
        return this.m_MinDistance;
    }
    void SetMinDistance(const float32 __Value) property
    {
        if (this.m_MinDistance == __Value)
        {
            return;
        }
        this.__MarkDirty(7);
        this.m_MinDistance = __Value;
        return;
    }
    float32 GetMaxDistance() const property
    {
        return this.m_MaxDistance;
    }
    void SetMaxDistance(const float32 __Value) property
    {
        if (this.m_MaxDistance == __Value)
        {
            return;
        }
        this.__MarkDirty(8);
        this.m_MaxDistance = __Value;
        return;
    }
    float32 GetAddtionalPitchWithoutTarget() const property
    {
        return this.m_AddtionalPitchWithoutTarget;
    }
    void SetAddtionalPitchWithoutTarget(const float32 __Value) property
    {
        if (this.m_AddtionalPitchWithoutTarget == __Value)
        {
            return;
        }
        this.__MarkDirty(9);
        this.m_AddtionalPitchWithoutTarget = __Value;
        return;
    }
}

struct FProjectileMovementCalculationRuntimeData
{
    FSubDirtyFlags16 __DirtyFlags;
    UPROPERTY()
    FProjectileMovementCalculationData m_Config;
    UPROPERTY()
    EProjectileMovementCalculationRuntimeTargetType m_TargetType;
    UPROPERTY()
    FRotator3f m_AdditionalRotation;
    UPROPERTY()
    FVector m_TargetPosition;
    UPROPERTY()
    FECSEntity m_TargetEntity;

    FProjectileMovementCalculationRuntimeData()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FProjectileMovementCalculationRuntimeData(const FProjectileMovementCalculationRuntimeData &inout Other)
    {
        this.m_TargetType = EProjectileMovementCalculationRuntimeTargetType(0);
        this.m_Config = Other.m_Config;
        this.m_TargetType = Other.m_TargetType;
        this.m_AdditionalRotation = Other.m_AdditionalRotation;
        this.m_TargetPosition = Other.m_TargetPosition;
        this.m_TargetEntity = Other.m_TargetEntity;
        return;
    }
    FProjectileMovementCalculationRuntimeData opAssign(const FProjectileMovementCalculationRuntimeData &inout Other)
    {
        FProjectileMovementCalculationRuntimeData __r;
        this.SetConfig(Other.GetConfig());
        this.SetTargetType(Other.GetTargetType());
        this.SetAdditionalRotation(Other.GetAdditionalRotation());
        this.SetTargetPosition(Other.GetTargetPosition());
        this.SetTargetEntity(Other.GetTargetEntity());
        return __r;
    }
    FProjectileMovementCalculationData GetConfig() const property
    {
        FProjectileMovementCalculationData __r;
        return __r;
    }
    FProjectileMovementCalculationData GetConfig() property
    {
        FProjectileMovementCalculationData __r;
        return __r;
    }
    void SetConfig(const FProjectileMovementCalculationData &inout __Value) property
    {
        this.m_Config = __Value;
        return;
    }
    EProjectileMovementCalculationRuntimeTargetType GetTargetType() const property
    {
        return this.m_TargetType;
    }
    void SetTargetType(const EProjectileMovementCalculationRuntimeTargetType __Value) property
    {
        if (int(this.m_TargetType) == int(__Value))
        {
            return;
        }
        this.__MarkDirty(10);
        this.m_TargetType = __Value;
        return;
    }
    const FRotator3f GetAdditionalRotation() const property
    {
        const FRotator3f __r;
        return __r;
    }
    FRotator3f GetModify_AdditionalRotation() property
    {
        FRotator3f __r;
        this.__MarkDirty(11);
        return __r;
    }
    void SetAdditionalRotation(const FRotator3f &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(11);
        this.m_AdditionalRotation = __Value;
        return;
    }
    FVector GetTargetPosition() const property
    {
        FVector __r;
        return __r;
    }
    FVector GetModify_TargetPosition() property
    {
        FVector __r;
        this.__MarkDirty(12);
        return __r;
    }
    void SetTargetPosition(const FVector &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(12);
        this.m_TargetPosition = __Value;
        return;
    }
    const FECSEntity GetTargetEntity() const property
    {
        const FECSEntity __r;
        return __r;
    }
    FECSEntity GetModify_TargetEntity() property
    {
        FECSEntity __r;
        this.__MarkDirty(13);
        return __r;
    }
    void SetTargetEntity(const FECSEntity &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(13);
        this.m_TargetEntity = __Value;
        return;
    }
}

struct FC_AutoCalcProjectileMovement : FECSComponent
{
    FRootDirtyFlags16 __DirtyFlags;
    UPROPERTY()
    FProjectileMovementCalculationRuntimeData m_Data;

    FC_AutoCalcProjectileMovement()
    {
        this.__InitDirtyFlags();
        return;
    }
    FC_AutoCalcProjectileMovement(const FC_AutoCalcProjectileMovement &inout Other)
    {
        this.__InitDirtyFlags();
        this.m_Data = Other.m_Data;
        return;
    }
    FC_AutoCalcProjectileMovement opAssign(const FC_AutoCalcProjectileMovement &inout Other)
    {
        FC_AutoCalcProjectileMovement __r;
        this.SetData(Other.GetData());
        return __r;
    }
    const FProjectileMovementCalculationRuntimeData GetData() const property
    {
        const FProjectileMovementCalculationRuntimeData __r;
        return __r;
    }
    FProjectileMovementCalculationRuntimeData GetData() property
    {
        FProjectileMovementCalculationRuntimeData __r;
        return __r;
    }
    void SetData(const FProjectileMovementCalculationRuntimeData &inout __Value) property
    {
        this.m_Data = __Value;
        return;
    }
}

struct FC_MovementByBVar : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    FECSEntity m_BBOwner;
    UPROPERTY()
    FNameHandle_EntityBBVarVector m_PositionBBVar;
    UPROPERTY()
    FNameHandle_EntityBBVarRotator m_RotationBBVar;

    FC_MovementByBVar()
    {
        this.__InitDirtyFlags();
        return;
    }
    FC_MovementByBVar(const FC_MovementByBVar &inout Other)
    {
        this.__InitDirtyFlags();
        this.m_BBOwner = Other.m_BBOwner;
        this.m_PositionBBVar = Other.m_PositionBBVar;
        this.m_RotationBBVar = Other.m_RotationBBVar;
        return;
    }
    FC_MovementByBVar opAssign(const FC_MovementByBVar &inout Other)
    {
        FC_MovementByBVar __r;
        this.SetBBOwner(Other.GetBBOwner());
        this.SetPositionBBVar(Other.GetPositionBBVar());
        this.SetRotationBBVar(Other.GetRotationBBVar());
        return __r;
    }
    const FECSEntity GetBBOwner() const property
    {
        const FECSEntity __r;
        return __r;
    }
    FECSEntity GetModify_BBOwner() property
    {
        FECSEntity __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetBBOwner(const FECSEntity &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_BBOwner = __Value;
        return;
    }
    const FNameHandle_EntityBBVarVector GetPositionBBVar() const property
    {
        const FNameHandle_EntityBBVarVector __r;
        return __r;
    }
    FNameHandle_EntityBBVarVector GetModify_PositionBBVar() property
    {
        FNameHandle_EntityBBVarVector __r;
        this.__MarkDirty(1);
        return __r;
    }
    void SetPositionBBVar(const FNameHandle_EntityBBVarVector &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_PositionBBVar = __Value;
        return;
    }
    const FNameHandle_EntityBBVarRotator GetRotationBBVar() const property
    {
        const FNameHandle_EntityBBVarRotator __r;
        return __r;
    }
    FNameHandle_EntityBBVarRotator GetModify_RotationBBVar() property
    {
        FNameHandle_EntityBBVarRotator __r;
        this.__MarkDirty(2);
        return __r;
    }
    void SetRotationBBVar(const FNameHandle_EntityBBVarRotator &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_RotationBBVar = __Value;
        return;
    }
}

struct FC_RelativeMovement : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    FECSEntity m_ReletiveParentEntity;
    UPROPERTY()
    FVector m_LastParentPos;
    UPROPERTY()
    FQuat m_LastParentRot;
    UPROPERTY()
    bool m_bMoveFollowParentRotation;
    UPROPERTY()
    bool m_bDirectionFollowParentRotation;

    FC_RelativeMovement()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_RelativeMovement(const FC_RelativeMovement &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_RelativeMovement opAssign(const FC_RelativeMovement &inout Other)
    {
        FC_RelativeMovement __r;
        this.SetReletiveParentEntity(Other.GetReletiveParentEntity());
        this.SetLastParentPos(Other.GetLastParentPos());
        this.SetLastParentRot(Other.GetLastParentRot());
        this.SetbMoveFollowParentRotation(Other.GetbMoveFollowParentRotation());
        this.SetbDirectionFollowParentRotation(Other.GetbDirectionFollowParentRotation());
        return __r;
    }
    const FECSEntity GetReletiveParentEntity() const property
    {
        const FECSEntity __r;
        return __r;
    }
    FECSEntity GetModify_ReletiveParentEntity() property
    {
        FECSEntity __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetReletiveParentEntity(const FECSEntity &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_ReletiveParentEntity = __Value;
        return;
    }
    const FVector GetLastParentPos() const property
    {
        const FVector __r;
        return __r;
    }
    FVector GetModify_LastParentPos() property
    {
        FVector __r;
        this.__MarkDirty(1);
        return __r;
    }
    void SetLastParentPos(const FVector &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_LastParentPos = __Value;
        return;
    }
    const FQuat GetLastParentRot() const property
    {
        const FQuat __r;
        return __r;
    }
    FQuat GetModify_LastParentRot() property
    {
        FQuat __r;
        this.__MarkDirty(2);
        return __r;
    }
    void SetLastParentRot(const FQuat &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_LastParentRot = __Value;
        return;
    }
    bool GetbMoveFollowParentRotation() const property
    {
        return this.m_bMoveFollowParentRotation;
    }
    void SetbMoveFollowParentRotation(const bool __Value) property
    {
        if (!(this.m_bMoveFollowParentRotation) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(3);
        this.m_bMoveFollowParentRotation = __Value;
        return;
    }
    bool GetbDirectionFollowParentRotation() const property
    {
        return this.m_bDirectionFollowParentRotation;
    }
    void SetbDirectionFollowParentRotation(const bool __Value) property
    {
        if (!(this.m_bDirectionFollowParentRotation) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(4);
        this.m_bDirectionFollowParentRotation = __Value;
        return;
    }
}

struct FC_RelativeMovementEnableByTime : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    TArray<FTimeEnablePair> m_TimeEnablePairs;
    UPROPERTY()
    FECSEntity m_ReletiveParentEntity;
    UPROPERTY()
    bool m_bMoveFollowParentRotation;
    UPROPERTY()
    bool m_bDirectionFollowParentRotation;

    FC_RelativeMovementEnableByTime()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_RelativeMovementEnableByTime(const FC_RelativeMovementEnableByTime &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_RelativeMovementEnableByTime opAssign(const FC_RelativeMovementEnableByTime &inout Other)
    {
        FC_RelativeMovementEnableByTime __r;
        this.SetTimeEnablePairs(Other.GetTimeEnablePairs());
        this.SetReletiveParentEntity(Other.GetReletiveParentEntity());
        this.SetbMoveFollowParentRotation(Other.GetbMoveFollowParentRotation());
        this.SetbDirectionFollowParentRotation(Other.GetbDirectionFollowParentRotation());
        return __r;
    }
    const TArray<FTimeEnablePair> GetTimeEnablePairs() const property
    {
        const TArray<FTimeEnablePair> __r;
        return __r;
    }
    TArray<FTimeEnablePair> GetModify_TimeEnablePairs() property
    {
        TArray<FTimeEnablePair> __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetTimeEnablePairs(const TArray<FTimeEnablePair> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_TimeEnablePairs = __Value;
        return;
    }
    const FECSEntity GetReletiveParentEntity() const property
    {
        const FECSEntity __r;
        return __r;
    }
    FECSEntity GetModify_ReletiveParentEntity() property
    {
        FECSEntity __r;
        this.__MarkDirty(1);
        return __r;
    }
    void SetReletiveParentEntity(const FECSEntity &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_ReletiveParentEntity = __Value;
        return;
    }
    bool GetbMoveFollowParentRotation() const property
    {
        return this.m_bMoveFollowParentRotation;
    }
    void SetbMoveFollowParentRotation(const bool __Value) property
    {
        if (!(this.m_bMoveFollowParentRotation) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_bMoveFollowParentRotation = __Value;
        return;
    }
    bool GetbDirectionFollowParentRotation() const property
    {
        return this.m_bDirectionFollowParentRotation;
    }
    void SetbDirectionFollowParentRotation(const bool __Value) property
    {
        if (!(this.m_bDirectionFollowParentRotation) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(3);
        this.m_bDirectionFollowParentRotation = __Value;
        return;
    }
}

struct FAdditionalMovementData
{
    UPROPERTY()
    EAdditionalMovementMode AdditionalMode = EAdditionalMovementMode(0);
    UPROPERTY()
    EAdditionalMovementRotationMode RotationMode = EAdditionalMovementRotationMode(0);
    UPROPERTY()
    float32 CurveValueScale = 1.0f;
    UPROPERTY()
    float32 CurveKeyScale = 1.0f;
    UPROPERTY()
    FRuntimeVectorCurve Curve;


}

struct FC_AdditionalMovementConfig : FECSComponent
{
    UPROPERTY()
    bool bRotateToMoveDir = true;
    UPROPERTY()
    TArray<FAdditionalMovementData> Data;


}

struct FCurveMovementConfigData
{
    FSubDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    ECurveMovementValueType m_CurveValueType;
    UPROPERTY()
    TSoftObjectPtr<UCurveVector> m_MovementCurve;
    UPROPERTY()
    bool m_bRotateCurveByForwardDirection;
    UPROPERTY()
    bool m_bRotateEntityToMoveDirection;
    UPROPERTY()
    bool m_bScaleHeight;
    UPROPERTY()
    float32 m_CurveScaleRatio;
    UPROPERTY()
    float32 m_CurveTotalTime;

    FCurveMovementConfigData()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FCurveMovementConfigData(const FCurveMovementConfigData &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FCurveMovementConfigData opAssign(const FCurveMovementConfigData &inout Other)
    {
        FCurveMovementConfigData __r;
        this.SetCurveValueType(Other.GetCurveValueType());
        this.SetMovementCurve(Other.GetMovementCurve());
        this.SetbRotateCurveByForwardDirection(Other.GetbRotateCurveByForwardDirection());
        this.SetbRotateEntityToMoveDirection(Other.GetbRotateEntityToMoveDirection());
        this.SetbScaleHeight(Other.GetbScaleHeight());
        this.SetCurveScaleRatio(Other.GetCurveScaleRatio());
        this.SetCurveTotalTime(Other.GetCurveTotalTime());
        return __r;
    }
    ECurveMovementValueType GetCurveValueType() const property
    {
        return this.m_CurveValueType;
    }
    void SetCurveValueType(const ECurveMovementValueType __Value) property
    {
        if (int(this.m_CurveValueType) == int(__Value))
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_CurveValueType = __Value;
        return;
    }
    const TSoftObjectPtr<UCurveVector> GetMovementCurve() const property
    {
        const TSoftObjectPtr<UCurveVector> __r;
        return __r;
    }
    TSoftObjectPtr<UCurveVector> GetModify_MovementCurve() property
    {
        TSoftObjectPtr<UCurveVector> __r;
        this.__MarkDirty(1);
        return __r;
    }
    void SetMovementCurve(const TSoftObjectPtr<UCurveVector> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_MovementCurve = __Value;
        return;
    }
    bool GetbRotateCurveByForwardDirection() const property
    {
        return this.m_bRotateCurveByForwardDirection;
    }
    void SetbRotateCurveByForwardDirection(const bool __Value) property
    {
        if (!(this.m_bRotateCurveByForwardDirection) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_bRotateCurveByForwardDirection = __Value;
        return;
    }
    bool GetbRotateEntityToMoveDirection() const property
    {
        return this.m_bRotateEntityToMoveDirection;
    }
    void SetbRotateEntityToMoveDirection(const bool __Value) property
    {
        if (!(this.m_bRotateEntityToMoveDirection) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(3);
        this.m_bRotateEntityToMoveDirection = __Value;
        return;
    }
    bool GetbScaleHeight() const property
    {
        return this.m_bScaleHeight;
    }
    void SetbScaleHeight(const bool __Value) property
    {
        if (!(this.m_bScaleHeight) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(4);
        this.m_bScaleHeight = __Value;
        return;
    }
    float32 GetCurveScaleRatio() const property
    {
        return this.m_CurveScaleRatio;
    }
    void SetCurveScaleRatio(const float32 __Value) property
    {
        if (this.m_CurveScaleRatio == __Value)
        {
            return;
        }
        this.__MarkDirty(5);
        this.m_CurveScaleRatio = __Value;
        return;
    }
    float32 GetCurveTotalTime() const property
    {
        return this.m_CurveTotalTime;
    }
    void SetCurveTotalTime(const float32 __Value) property
    {
        if (this.m_CurveTotalTime == __Value)
        {
            return;
        }
        this.__MarkDirty(6);
        this.m_CurveTotalTime = __Value;
        return;
    }
}

struct FC_CurveMovementConfig : FECSComponent
{
    UPROPERTY()
    FCurveMovementConfigData Data;

    FC_CurveMovementConfig()
    {
        return;
    }
}

struct FC_CurveMovementOverride : FECSComponent
{
    FRootDirtyFlags16 __DirtyFlags;
    UPROPERTY()
    FCurveMovementConfigData m_Data;
    UPROPERTY()
    bool m_bUseCustomSampleTime;
    UPROPERTY()
    float32 m_SampleTime;
    UPROPERTY()
    float32 m_SampleLastTime;
    UPROPERTY()
    float32 m_DelaySampleTime;
    UPROPERTY()
    float32 m_FirstSampleTime;
    UPROPERTY()
    bool m_KeepMoveAfterExit;
    UPROPERTY()
    FECSEntity m_CurveRotationFollowEntity;

    FC_CurveMovementOverride()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_CurveMovementOverride(const FC_CurveMovementOverride &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_CurveMovementOverride opAssign(const FC_CurveMovementOverride &inout Other)
    {
        FC_CurveMovementOverride __r;
        this.SetData(Other.GetData());
        this.SetbUseCustomSampleTime(Other.GetbUseCustomSampleTime());
        this.SetSampleTime(Other.GetSampleTime());
        this.SetSampleLastTime(Other.GetSampleLastTime());
        this.SetDelaySampleTime(Other.GetDelaySampleTime());
        this.SetFirstSampleTime(Other.GetFirstSampleTime());
        this.SetKeepMoveAfterExit(Other.GetKeepMoveAfterExit());
        this.SetCurveRotationFollowEntity(Other.GetCurveRotationFollowEntity());
        return __r;
    }
    const FCurveMovementConfigData GetData() const property
    {
        const FCurveMovementConfigData __r;
        return __r;
    }
    FCurveMovementConfigData GetData() property
    {
        FCurveMovementConfigData __r;
        return __r;
    }
    void SetData(const FCurveMovementConfigData &inout __Value) property
    {
        this.m_Data = __Value;
        return;
    }
    bool GetbUseCustomSampleTime() const property
    {
        return this.m_bUseCustomSampleTime;
    }
    void SetbUseCustomSampleTime(const bool __Value) property
    {
        if (!(this.m_bUseCustomSampleTime) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(7);
        this.m_bUseCustomSampleTime = __Value;
        return;
    }
    float32 GetSampleTime() const property
    {
        return this.m_SampleTime;
    }
    void SetSampleTime(const float32 __Value) property
    {
        if (this.m_SampleTime == __Value)
        {
            return;
        }
        this.__MarkDirty(8);
        this.m_SampleTime = __Value;
        return;
    }
    float32 GetSampleLastTime() const property
    {
        return this.m_SampleLastTime;
    }
    void SetSampleLastTime(const float32 __Value) property
    {
        if (this.m_SampleLastTime == __Value)
        {
            return;
        }
        this.__MarkDirty(9);
        this.m_SampleLastTime = __Value;
        return;
    }
    float32 GetDelaySampleTime() const property
    {
        return this.m_DelaySampleTime;
    }
    void SetDelaySampleTime(const float32 __Value) property
    {
        if (this.m_DelaySampleTime == __Value)
        {
            return;
        }
        this.__MarkDirty(10);
        this.m_DelaySampleTime = __Value;
        return;
    }
    float32 GetFirstSampleTime() const property
    {
        return this.m_FirstSampleTime;
    }
    void SetFirstSampleTime(const float32 __Value) property
    {
        if (this.m_FirstSampleTime == __Value)
        {
            return;
        }
        this.__MarkDirty(11);
        this.m_FirstSampleTime = __Value;
        return;
    }
    bool GetKeepMoveAfterExit() const property
    {
        return this.m_KeepMoveAfterExit;
    }
    void SetKeepMoveAfterExit(const bool __Value) property
    {
        if (!(this.m_KeepMoveAfterExit) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(12);
        this.m_KeepMoveAfterExit = __Value;
        return;
    }
    const FECSEntity GetCurveRotationFollowEntity() const property
    {
        const FECSEntity __r;
        return __r;
    }
    FECSEntity GetModify_CurveRotationFollowEntity() property
    {
        FECSEntity __r;
        this.__MarkDirty(13);
        return __r;
    }
    void SetCurveRotationFollowEntity(const FECSEntity &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(13);
        this.m_CurveRotationFollowEntity = __Value;
        return;
    }
}

struct FCurveRotationConfigData
{
    FSubDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    ECurveRotationValueType m_CurveValueType;
    UPROPERTY()
    TSoftObjectPtr<UCurveVector> m_Curve;
    UPROPERTY()
    float32 m_CurveScaleRatio;
    UPROPERTY()
    float32 m_CurveTotalTime;

    FCurveRotationConfigData()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FCurveRotationConfigData(const FCurveRotationConfigData &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FCurveRotationConfigData opAssign(const FCurveRotationConfigData &inout Other)
    {
        FCurveRotationConfigData __r;
        this.SetCurveValueType(Other.GetCurveValueType());
        this.SetCurve(Other.GetCurve());
        this.SetCurveScaleRatio(Other.GetCurveScaleRatio());
        this.SetCurveTotalTime(Other.GetCurveTotalTime());
        return __r;
    }
    ECurveRotationValueType GetCurveValueType() const property
    {
        return this.m_CurveValueType;
    }
    void SetCurveValueType(const ECurveRotationValueType __Value) property
    {
        if (int(this.m_CurveValueType) == int(__Value))
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_CurveValueType = __Value;
        return;
    }
    const TSoftObjectPtr<UCurveVector> GetCurve() const property
    {
        const TSoftObjectPtr<UCurveVector> __r;
        return __r;
    }
    TSoftObjectPtr<UCurveVector> GetModify_Curve() property
    {
        TSoftObjectPtr<UCurveVector> __r;
        this.__MarkDirty(1);
        return __r;
    }
    void SetCurve(const TSoftObjectPtr<UCurveVector> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_Curve = __Value;
        return;
    }
    float32 GetCurveScaleRatio() const property
    {
        return this.m_CurveScaleRatio;
    }
    void SetCurveScaleRatio(const float32 __Value) property
    {
        if (this.m_CurveScaleRatio == __Value)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_CurveScaleRatio = __Value;
        return;
    }
    float32 GetCurveTotalTime() const property
    {
        return this.m_CurveTotalTime;
    }
    void SetCurveTotalTime(const float32 __Value) property
    {
        if (this.m_CurveTotalTime == __Value)
        {
            return;
        }
        this.__MarkDirty(3);
        this.m_CurveTotalTime = __Value;
        return;
    }
}

struct FC_CurveRotationConfig : FECSComponent
{
    UPROPERTY()
    FCurveRotationConfigData Data;

    FC_CurveRotationConfig()
    {
        return;
    }
}

struct FC_CurveRotationOverride : FECSComponent
{
    FRootDirtyFlags16 __DirtyFlags;
    UPROPERTY()
    FCurveRotationConfigData m_Data;
    UPROPERTY()
    bool m_bUseCustomSampleTime;
    UPROPERTY()
    float32 m_SampleTime;
    UPROPERTY()
    float32 m_SampleLastTime;
    UPROPERTY()
    float32 m_DelaySampleTime;
    UPROPERTY()
    float32 m_FirstSampleTime;
    UPROPERTY()
    bool m_KeepMoveAfterExit;

    FC_CurveRotationOverride()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_CurveRotationOverride(const FC_CurveRotationOverride &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_CurveRotationOverride opAssign(const FC_CurveRotationOverride &inout Other)
    {
        FC_CurveRotationOverride __r;
        this.SetData(Other.GetData());
        this.SetbUseCustomSampleTime(Other.GetbUseCustomSampleTime());
        this.SetSampleTime(Other.GetSampleTime());
        this.SetSampleLastTime(Other.GetSampleLastTime());
        this.SetDelaySampleTime(Other.GetDelaySampleTime());
        this.SetFirstSampleTime(Other.GetFirstSampleTime());
        this.SetKeepMoveAfterExit(Other.GetKeepMoveAfterExit());
        return __r;
    }
    const FCurveRotationConfigData GetData() const property
    {
        const FCurveRotationConfigData __r;
        return __r;
    }
    FCurveRotationConfigData GetData() property
    {
        FCurveRotationConfigData __r;
        return __r;
    }
    void SetData(const FCurveRotationConfigData &inout __Value) property
    {
        this.m_Data = __Value;
        return;
    }
    bool GetbUseCustomSampleTime() const property
    {
        return this.m_bUseCustomSampleTime;
    }
    void SetbUseCustomSampleTime(const bool __Value) property
    {
        if (!(this.m_bUseCustomSampleTime) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(4);
        this.m_bUseCustomSampleTime = __Value;
        return;
    }
    float32 GetSampleTime() const property
    {
        return this.m_SampleTime;
    }
    void SetSampleTime(const float32 __Value) property
    {
        if (this.m_SampleTime == __Value)
        {
            return;
        }
        this.__MarkDirty(5);
        this.m_SampleTime = __Value;
        return;
    }
    float32 GetSampleLastTime() const property
    {
        return this.m_SampleLastTime;
    }
    void SetSampleLastTime(const float32 __Value) property
    {
        if (this.m_SampleLastTime == __Value)
        {
            return;
        }
        this.__MarkDirty(6);
        this.m_SampleLastTime = __Value;
        return;
    }
    float32 GetDelaySampleTime() const property
    {
        return this.m_DelaySampleTime;
    }
    void SetDelaySampleTime(const float32 __Value) property
    {
        if (this.m_DelaySampleTime == __Value)
        {
            return;
        }
        this.__MarkDirty(7);
        this.m_DelaySampleTime = __Value;
        return;
    }
    float32 GetFirstSampleTime() const property
    {
        return this.m_FirstSampleTime;
    }
    void SetFirstSampleTime(const float32 __Value) property
    {
        if (this.m_FirstSampleTime == __Value)
        {
            return;
        }
        this.__MarkDirty(8);
        this.m_FirstSampleTime = __Value;
        return;
    }
    bool GetKeepMoveAfterExit() const property
    {
        return this.m_KeepMoveAfterExit;
    }
    void SetKeepMoveAfterExit(const bool __Value) property
    {
        if (!(this.m_KeepMoveAfterExit) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(9);
        this.m_KeepMoveAfterExit = __Value;
        return;
    }
}

struct FC_TrackMovementConfig : FECSComponent
{
    UPROPERTY()
    FTrackMovementConfigData Data;

    FC_TrackMovementConfig()
    {
        return;
    }
}

struct FC_TrackMovementOverride : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    TDataObjectPtr<FTrackMovementConfigData> m_DataPtr;

    FC_TrackMovementOverride()
    {
        this.__InitDirtyFlags();
        return;
    }
    FC_TrackMovementOverride(const FC_TrackMovementOverride &inout Other)
    {
        this.__InitDirtyFlags();
        this.m_DataPtr = Other.m_DataPtr;
        return;
    }
    FC_TrackMovementOverride opAssign(const FC_TrackMovementOverride &inout Other)
    {
        FC_TrackMovementOverride __r;
        this.SetDataPtr(Other.GetDataPtr());
        return __r;
    }
    TDataObjectPtr<FTrackMovementConfigData> GetDataPtr() const property
    {
        TDataObjectPtr<FTrackMovementConfigData> __r;
        return __r;
    }
    TDataObjectPtr<FTrackMovementConfigData> GetModify_DataPtr() property
    {
        TDataObjectPtr<FTrackMovementConfigData> __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetDataPtr(const TDataObjectPtr<FTrackMovementConfigData> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_DataPtr = __Value;
        return;
    }
}

struct FTrackTargetPosConfig
{
    UPROPERTY()
    FVector ForwardOffset;

    FTrackTargetPosConfig()
    {
        return;
    }
}

struct FTrackTargetHistoryPosData
{
    UPROPERTY()
    float32 m_Seconds = 1.0f;
    UPROPERTY()
    FVector m_ForwardOffset = FVector::ZeroVector;


    float32 GetSeconds() const property
    {
        return this.m_Seconds;
    }
    void SetSeconds(const float32 __Value) property
    {
        this.m_Seconds = __Value;
        return;
    }
    const FVector GetForwardOffset() const property
    {
        const FVector __r;
        return __r;
    }
    FVector GetForwardOffset() property
    {
        FVector __r;
        return __r;
    }
    void SetForwardOffset(const FVector &inout __Value) property
    {
        this.m_ForwardOffset = __Value;
        return;
    }
}

struct FTrackTargetParams
{
    UPROPERTY()
    EProjectileTrackType TrackType = EProjectileTrackType(0);
    UPROPERTY()
    bool bUseDefaultPosWhenNoTargetEntity = false;
    UPROPERTY()
    FVector DefaultPosOffset = FVector(500.0, 0.0, 0.0);
    UPROPERTY()
    FTrackTargetPosConfig TrackTargetPosConfig;
    UPROPERTY()
    FTrackTargetHistoryPosData TrackTargetHistoryPosConfig;
    UPROPERTY()
    EProjectileTrackTarget TrackTargetEntity = EProjectileTrackTarget(0);
    UPROPERTY()
    FNameHandle_EntityBBVarEntity TrackTargetEntityBBVar;
    UPROPERTY()
    ULockTargetConfig TrackSoftLockConfig = nullptr;
    UPROPERTY()
    float32 TrackAimTraceLength = 1000.0f;
    UPROPERTY()
    FName TrackEntitySocket = NAME_None;
    UPROPERTY()
    bool bAutoTrackNearestEnemyWhenNoTarget = false;
    UPROPERTY()
    float32 NearestEnemySearchRadius = 1500.0f;


}

struct FC_TrackRuntime : FECSComponent
{
    FRootDirtyFlags16 __DirtyFlags;
    UPROPERTY()
    ETrackRuntimeType m_TrackType;
    UPROPERTY()
    bool m_bTrackEnd;
    UPROPERTY()
    bool m_bTrackSuccess;
    UPROPERTY()
    float32 m_TrackTime;
    UPROPERTY()
    FVector m_TrackPos;
    UPROPERTY()
    FTargetEntity m_TrackTarget;
    UPROPERTY()
    FVector m_TrackTargetOffset;
    UPROPERTY()
    FVector m_LastTargetPosition;
    UPROPERTY()
    FTrackTargetHistoryPosData m_TrackTargetHistoryPosConfig;
    UPROPERTY()
    FName m_TrackEntitySocket;
    UPROPERTY()
    bool m_bHasTriggerTrackReachEvent;

    FC_TrackRuntime()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_TrackRuntime(const FC_TrackRuntime &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_TrackRuntime opAssign(const FC_TrackRuntime &inout Other)
    {
        FC_TrackRuntime __r;
        this.SetTrackType(Other.GetTrackType());
        this.SetbTrackEnd(Other.GetbTrackEnd());
        this.SetbTrackSuccess(Other.GetbTrackSuccess());
        this.SetTrackTime(Other.GetTrackTime());
        this.SetTrackPos(Other.GetTrackPos());
        this.SetTrackTarget(Other.GetTrackTarget());
        this.SetTrackTargetOffset(Other.GetTrackTargetOffset());
        this.SetLastTargetPosition(Other.GetLastTargetPosition());
        this.SetTrackTargetHistoryPosConfig(Other.GetTrackTargetHistoryPosConfig());
        this.SetTrackEntitySocket(Other.GetTrackEntitySocket());
        this.SetbHasTriggerTrackReachEvent(Other.GetbHasTriggerTrackReachEvent());
        return __r;
    }
    ETrackRuntimeType GetTrackType() const property
    {
        return this.m_TrackType;
    }
    void SetTrackType(const ETrackRuntimeType __Value) property
    {
        if (int(this.m_TrackType) == int(__Value))
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_TrackType = __Value;
        return;
    }
    bool GetbTrackEnd() const property
    {
        return this.m_bTrackEnd;
    }
    void SetbTrackEnd(const bool __Value) property
    {
        if (!(this.m_bTrackEnd) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_bTrackEnd = __Value;
        return;
    }
    bool GetbTrackSuccess() const property
    {
        return this.m_bTrackSuccess;
    }
    void SetbTrackSuccess(const bool __Value) property
    {
        if (!(this.m_bTrackSuccess) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_bTrackSuccess = __Value;
        return;
    }
    float32 GetTrackTime() const property
    {
        return this.m_TrackTime;
    }
    void SetTrackTime(const float32 __Value) property
    {
        if (this.m_TrackTime == __Value)
        {
            return;
        }
        this.__MarkDirty(3);
        this.m_TrackTime = __Value;
        return;
    }
    const FVector GetTrackPos() const property
    {
        const FVector __r;
        return __r;
    }
    FVector GetModify_TrackPos() property
    {
        FVector __r;
        this.__MarkDirty(4);
        return __r;
    }
    void SetTrackPos(const FVector &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(4);
        this.m_TrackPos = __Value;
        return;
    }
    const FTargetEntity GetTrackTarget() const property
    {
        const FTargetEntity __r;
        return __r;
    }
    FTargetEntity GetModify_TrackTarget() property
    {
        FTargetEntity __r;
        this.__MarkDirty(5);
        return __r;
    }
    void SetTrackTarget(const FTargetEntity &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(5);
        this.m_TrackTarget = __Value;
        return;
    }
    const FVector GetTrackTargetOffset() const property
    {
        const FVector __r;
        return __r;
    }
    FVector GetModify_TrackTargetOffset() property
    {
        FVector __r;
        this.__MarkDirty(6);
        return __r;
    }
    void SetTrackTargetOffset(const FVector &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(6);
        this.m_TrackTargetOffset = __Value;
        return;
    }
    const FVector GetLastTargetPosition() const property
    {
        const FVector __r;
        return __r;
    }
    FVector GetModify_LastTargetPosition() property
    {
        FVector __r;
        this.__MarkDirty(7);
        return __r;
    }
    void SetLastTargetPosition(const FVector &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(7);
        this.m_LastTargetPosition = __Value;
        return;
    }
    const FTrackTargetHistoryPosData GetTrackTargetHistoryPosConfig() const property
    {
        const FTrackTargetHistoryPosData __r;
        return __r;
    }
    FTrackTargetHistoryPosData GetModify_TrackTargetHistoryPosConfig() property
    {
        FTrackTargetHistoryPosData __r;
        this.__MarkDirty(8);
        return __r;
    }
    void SetTrackTargetHistoryPosConfig(const FTrackTargetHistoryPosData &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(8);
        this.m_TrackTargetHistoryPosConfig = __Value;
        return;
    }
    FName GetTrackEntitySocket() const property
    {
        return this.m_TrackEntitySocket;
    }
    void SetTrackEntitySocket(const FName &inout __Value) property
    {
        if ((this.m_TrackEntitySocket == __Value))
        {
            return;
        }
        this.__MarkDirty(9);
        this.m_TrackEntitySocket = __Value;
        return;
    }
    bool GetbHasTriggerTrackReachEvent() const property
    {
        return this.m_bHasTriggerTrackReachEvent;
    }
    void SetbHasTriggerTrackReachEvent(const bool __Value) property
    {
        if (!(this.m_bHasTriggerTrackReachEvent) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(10);
        this.m_bHasTriggerTrackReachEvent = __Value;
        return;
    }
}

struct FC_OrbitMovementRuntime : FECSComponent
{
    FRootDirtyFlags64 __DirtyFlags;
    UPROPERTY()
    bool m_bStopWhenReachCenter;
    UPROPERTY()
    bool m_bKeepRelativePosAfterTargetEntityMove;
    UPROPERTY()
    bool m_bRotateToCircleTangentDir;
    UPROPERTY()
    bool m_bAxisMoveToTargetPlane;
    UPROPERTY()
    bool m_bAutoCalcAxisVelocity;
    UPROPERTY()
    EOrbitTargetType m_TargetType;
    UPROPERTY()
    float32 m_CurDistanceToCenter;
    UPROPERTY()
    float32 m_CurAngle;
    UPROPERTY()
    FSyncFloatValueVariant m_CentripetalVelocity;
    UPROPERTY()
    FSyncFloatValueVariant m_AxisVelocity;
    UPROPERTY()
    FSyncFloatValueVariant m_AngleVelocity;
    UPROPERTY()
    FVector m_Axis;
    UPROPERTY()
    FVector m_TargetPos;
    UPROPERTY()
    FECSEntity m_TargetEntity;

    FC_OrbitMovementRuntime()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_OrbitMovementRuntime(const FC_OrbitMovementRuntime &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_OrbitMovementRuntime opAssign(const FC_OrbitMovementRuntime &inout Other)
    {
        FC_OrbitMovementRuntime __r;
        this.SetbStopWhenReachCenter(Other.GetbStopWhenReachCenter());
        this.SetbKeepRelativePosAfterTargetEntityMove(Other.GetbKeepRelativePosAfterTargetEntityMove());
        this.SetbRotateToCircleTangentDir(Other.GetbRotateToCircleTangentDir());
        this.SetbAxisMoveToTargetPlane(Other.GetbAxisMoveToTargetPlane());
        this.SetbAutoCalcAxisVelocity(Other.GetbAutoCalcAxisVelocity());
        this.SetTargetType(Other.GetTargetType());
        this.SetCurDistanceToCenter(Other.GetCurDistanceToCenter());
        this.SetCurAngle(Other.GetCurAngle());
        this.SetCentripetalVelocity(Other.GetCentripetalVelocity());
        this.SetAxisVelocity(Other.GetAxisVelocity());
        this.SetAngleVelocity(Other.GetAngleVelocity());
        this.SetAxis(Other.GetAxis());
        this.SetTargetPos(Other.GetTargetPos());
        this.SetTargetEntity(Other.GetTargetEntity());
        return __r;
    }
    bool GetbStopWhenReachCenter() const property
    {
        return this.m_bStopWhenReachCenter;
    }
    void SetbStopWhenReachCenter(const bool __Value) property
    {
        if (!(this.m_bStopWhenReachCenter) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_bStopWhenReachCenter = __Value;
        return;
    }
    bool GetbKeepRelativePosAfterTargetEntityMove() const property
    {
        return this.m_bKeepRelativePosAfterTargetEntityMove;
    }
    void SetbKeepRelativePosAfterTargetEntityMove(const bool __Value) property
    {
        if (!(this.m_bKeepRelativePosAfterTargetEntityMove) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_bKeepRelativePosAfterTargetEntityMove = __Value;
        return;
    }
    bool GetbRotateToCircleTangentDir() const property
    {
        return this.m_bRotateToCircleTangentDir;
    }
    void SetbRotateToCircleTangentDir(const bool __Value) property
    {
        if (!(this.m_bRotateToCircleTangentDir) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_bRotateToCircleTangentDir = __Value;
        return;
    }
    bool GetbAxisMoveToTargetPlane() const property
    {
        return this.m_bAxisMoveToTargetPlane;
    }
    void SetbAxisMoveToTargetPlane(const bool __Value) property
    {
        if (!(this.m_bAxisMoveToTargetPlane) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(3);
        this.m_bAxisMoveToTargetPlane = __Value;
        return;
    }
    bool GetbAutoCalcAxisVelocity() const property
    {
        return this.m_bAutoCalcAxisVelocity;
    }
    void SetbAutoCalcAxisVelocity(const bool __Value) property
    {
        if (!(this.m_bAutoCalcAxisVelocity) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(4);
        this.m_bAutoCalcAxisVelocity = __Value;
        return;
    }
    EOrbitTargetType GetTargetType() const property
    {
        return this.m_TargetType;
    }
    void SetTargetType(const EOrbitTargetType __Value) property
    {
        if (int(this.m_TargetType) == int(__Value))
        {
            return;
        }
        this.__MarkDirty(5);
        this.m_TargetType = __Value;
        return;
    }
    float32 GetCurDistanceToCenter() const property
    {
        return this.m_CurDistanceToCenter;
    }
    void SetCurDistanceToCenter(const float32 __Value) property
    {
        if (this.m_CurDistanceToCenter == __Value)
        {
            return;
        }
        this.__MarkDirty(6);
        this.m_CurDistanceToCenter = __Value;
        return;
    }
    float32 GetCurAngle() const property
    {
        return this.m_CurAngle;
    }
    void SetCurAngle(const float32 __Value) property
    {
        if (this.m_CurAngle == __Value)
        {
            return;
        }
        this.__MarkDirty(7);
        this.m_CurAngle = __Value;
        return;
    }
    const FSyncFloatValueVariant GetCentripetalVelocity() const property
    {
        const FSyncFloatValueVariant __r;
        return __r;
    }
    FSyncFloatValueVariant GetCentripetalVelocity() property
    {
        FSyncFloatValueVariant __r;
        return __r;
    }
    void SetCentripetalVelocity(const FSyncFloatValueVariant &inout __Value) property
    {
        this.m_CentripetalVelocity = __Value;
        return;
    }
    const FSyncFloatValueVariant GetAxisVelocity() const property
    {
        const FSyncFloatValueVariant __r;
        return __r;
    }
    FSyncFloatValueVariant GetAxisVelocity() property
    {
        FSyncFloatValueVariant __r;
        return __r;
    }
    void SetAxisVelocity(const FSyncFloatValueVariant &inout __Value) property
    {
        this.m_AxisVelocity = __Value;
        return;
    }
    FSyncFloatValueVariant GetAngleVelocity() const property
    {
        FSyncFloatValueVariant __r;
        return __r;
    }
    FSyncFloatValueVariant GetAngleVelocity() property
    {
        FSyncFloatValueVariant __r;
        return __r;
    }
    void SetAngleVelocity(const FSyncFloatValueVariant &inout __Value) property
    {
        this.m_AngleVelocity = __Value;
        return;
    }
    const FVector GetAxis() const property
    {
        const FVector __r;
        return __r;
    }
    FVector GetModify_Axis() property
    {
        FVector __r;
        this.__MarkDirty(29);
        return __r;
    }
    void SetAxis(const FVector &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(29);
        this.m_Axis = __Value;
        return;
    }
    const FVector GetTargetPos() const property
    {
        const FVector __r;
        return __r;
    }
    FVector GetModify_TargetPos() property
    {
        FVector __r;
        this.__MarkDirty(30);
        return __r;
    }
    void SetTargetPos(const FVector &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(30);
        this.m_TargetPos = __Value;
        return;
    }
    const FECSEntity GetTargetEntity() const property
    {
        const FECSEntity __r;
        return __r;
    }
    FECSEntity GetModify_TargetEntity() property
    {
        FECSEntity __r;
        this.__MarkDirty(31);
        return __r;
    }
    void SetTargetEntity(const FECSEntity &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(31);
        this.m_TargetEntity = __Value;
        return;
    }
}

struct FFixedDurationMovementConfigData
{
    UPROPERTY()
    FRuntimeFloatCurve m_InitialVelocityRatioCurve;
    UPROPERTY()
    FRuntimeFloatCurve m_MoveDistanceRatioCurve;

    FFixedDurationMovementConfigData()
    {
        FRuntimeCurveUtils::CreateLinear(0.0f, 1.0f, 1.0f, 0.0f);
        return;
    }
    const FRuntimeFloatCurve GetInitialVelocityRatioCurve() const property
    {
        const FRuntimeFloatCurve __r;
        return __r;
    }
    FRuntimeFloatCurve GetInitialVelocityRatioCurve() property
    {
        FRuntimeFloatCurve __r;
        return __r;
    }
    void SetInitialVelocityRatioCurve(const FRuntimeFloatCurve &inout __Value) property
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    const FRuntimeFloatCurve GetMoveDistanceRatioCurve() const property
    {
        const FRuntimeFloatCurve __r;
        return __r;
    }
    FRuntimeFloatCurve GetMoveDistanceRatioCurve() property
    {
        FRuntimeFloatCurve __r;
        return __r;
    }
    void SetMoveDistanceRatioCurve(const FRuntimeFloatCurve &inout __Value) property
    {
        this.m_MoveDistanceRatioCurve = __Value;
        return;
    }
}

struct FC_FixedDurationMovementConfig : FECSComponent
{
    UPROPERTY()
    FFixedDurationMovementConfigData Data;

    FC_FixedDurationMovementConfig()
    {
        return;
    }
}

struct FC_FixedDurationMovementOverride : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    FFixedDurationMovementConfigData m_Data;

    FC_FixedDurationMovementOverride()
    {
        this.__InitDirtyFlags();
        return;
    }
    FC_FixedDurationMovementOverride(const FC_FixedDurationMovementOverride &inout Other)
    {
        this.__InitDirtyFlags();
        return;
    }
    FC_FixedDurationMovementOverride opAssign(const FC_FixedDurationMovementOverride &inout Other)
    {
        FC_FixedDurationMovementOverride __r;
        this.SetData(Other.GetData());
        return __r;
    }
    const FFixedDurationMovementConfigData GetData() const property
    {
        const FFixedDurationMovementConfigData __r;
        return __r;
    }
    FFixedDurationMovementConfigData GetModify_Data() property
    {
        FFixedDurationMovementConfigData __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetData(const FFixedDurationMovementConfigData &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        return;
    }
}

struct FC_FixedDurationMovementRuntime : FECSComponent
{
    UPROPERTY()
    FECSEntity Target;
    UPROPERTY()
    FVector InitialVelocity;

    FC_FixedDurationMovementRuntime()
    {
        return;
    }
}

struct FC_GravityFallingMovementRuntime : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    float32 m_GravityScale;

    FC_GravityFallingMovementRuntime()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_GravityFallingMovementRuntime(const FC_GravityFallingMovementRuntime &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_GravityFallingMovementRuntime opAssign(const FC_GravityFallingMovementRuntime &inout Other)
    {
        FC_GravityFallingMovementRuntime __r;
        this.SetGravityScale(Other.GetGravityScale());
        return __r;
    }
    float32 GetGravityScale() const property
    {
        return this.m_GravityScale;
    }
    void SetGravityScale(const float32 __Value) property
    {
        if (this.m_GravityScale == __Value)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_GravityScale = __Value;
        return;
    }
}

struct FGroundMovementConfigData
{
    FSubDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    float32 m_MaxInclinationUpAngle;
    UPROPERTY()
    float32 m_MaxInclinationDownAngle;
    UPROPERTY()
    float32 m_HeightFromGround;
    UPROPERTY()
    EGroundMovementOrientationMode m_GroundMovementOrientationMode;
    UPROPERTY()
    EGroundMovementBlockMode m_GroundMoveBlockMode;
    UPROPERTY()
    bool m_bDestroyWhenMoveBlocked;
    UPROPERTY()
    bool m_bTriggerEventWhenMoveBlocked;

    FGroundMovementConfigData()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FGroundMovementConfigData(const FGroundMovementConfigData &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FGroundMovementConfigData opAssign(const FGroundMovementConfigData &inout Other)
    {
        FGroundMovementConfigData __r;
        this.SetMaxInclinationUpAngle(Other.GetMaxInclinationUpAngle());
        this.SetMaxInclinationDownAngle(Other.GetMaxInclinationDownAngle());
        this.SetHeightFromGround(Other.GetHeightFromGround());
        this.SetGroundMovementOrientationMode(Other.GetGroundMovementOrientationMode());
        this.SetGroundMoveBlockMode(Other.GetGroundMoveBlockMode());
        this.SetbDestroyWhenMoveBlocked(Other.GetbDestroyWhenMoveBlocked());
        this.SetbTriggerEventWhenMoveBlocked(Other.GetbTriggerEventWhenMoveBlocked());
        return __r;
    }
    float32 GetMaxInclinationUpAngle() const property
    {
        return this.m_MaxInclinationUpAngle;
    }
    void SetMaxInclinationUpAngle(const float32 __Value) property
    {
        if (this.m_MaxInclinationUpAngle == __Value)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_MaxInclinationUpAngle = __Value;
        return;
    }
    float32 GetMaxInclinationDownAngle() const property
    {
        return this.m_MaxInclinationDownAngle;
    }
    void SetMaxInclinationDownAngle(const float32 __Value) property
    {
        if (this.m_MaxInclinationDownAngle == __Value)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_MaxInclinationDownAngle = __Value;
        return;
    }
    float32 GetHeightFromGround() const property
    {
        return this.m_HeightFromGround;
    }
    void SetHeightFromGround(const float32 __Value) property
    {
        if (this.m_HeightFromGround == __Value)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_HeightFromGround = __Value;
        return;
    }
    EGroundMovementOrientationMode GetGroundMovementOrientationMode() const property
    {
        return this.m_GroundMovementOrientationMode;
    }
    void SetGroundMovementOrientationMode(const EGroundMovementOrientationMode __Value) property
    {
        if (int(this.m_GroundMovementOrientationMode) == int(__Value))
        {
            return;
        }
        this.__MarkDirty(3);
        this.m_GroundMovementOrientationMode = __Value;
        return;
    }
    EGroundMovementBlockMode GetGroundMoveBlockMode() const property
    {
        return this.m_GroundMoveBlockMode;
    }
    void SetGroundMoveBlockMode(const EGroundMovementBlockMode __Value) property
    {
        if (int(this.m_GroundMoveBlockMode) == int(__Value))
        {
            return;
        }
        this.__MarkDirty(4);
        this.m_GroundMoveBlockMode = __Value;
        return;
    }
    bool GetbDestroyWhenMoveBlocked() const property
    {
        return this.m_bDestroyWhenMoveBlocked;
    }
    void SetbDestroyWhenMoveBlocked(const bool __Value) property
    {
        if (!(this.m_bDestroyWhenMoveBlocked) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(5);
        this.m_bDestroyWhenMoveBlocked = __Value;
        return;
    }
    bool GetbTriggerEventWhenMoveBlocked() const property
    {
        return this.m_bTriggerEventWhenMoveBlocked;
    }
    void SetbTriggerEventWhenMoveBlocked(const bool __Value) property
    {
        if (!(this.m_bTriggerEventWhenMoveBlocked) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(6);
        this.m_bTriggerEventWhenMoveBlocked = __Value;
        return;
    }
}

struct FC_GroundMovementConfig : FECSComponent
{
    UPROPERTY()
    FGroundMovementConfigData Data;

    FC_GroundMovementConfig()
    {
        return;
    }
}

struct FC_GroundMovementOverride : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    FGroundMovementConfigData m_Data;

    FC_GroundMovementOverride()
    {
        this.__InitDirtyFlags();
        return;
    }
    FC_GroundMovementOverride(const FC_GroundMovementOverride &inout Other)
    {
        this.__InitDirtyFlags();
        this.m_Data = Other.m_Data;
        return;
    }
    FC_GroundMovementOverride opAssign(const FC_GroundMovementOverride &inout Other)
    {
        FC_GroundMovementOverride __r;
        this.SetData(Other.GetData());
        return __r;
    }
    const FGroundMovementConfigData GetData() const property
    {
        const FGroundMovementConfigData __r;
        return __r;
    }
    FGroundMovementConfigData GetData() property
    {
        FGroundMovementConfigData __r;
        return __r;
    }
    void SetData(const FGroundMovementConfigData &inout __Value) property
    {
        this.m_Data = __Value;
        return;
    }
}

namespace ECSFunc_FC_MovementInfo
{
UFUNCTION()
bool HasMovementInfo(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_MovementInfo);
}
FC_MovementInfo& AssignMovementInfo(const FECSEntity &inout Entity, const FC_MovementInfo &inout DefaultValue = FC_MovementInfo())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_MovementInfo, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignMovementInfo_BP(const FECSEntity &inout Entity, const FC_MovementInfo &inout DefaultValue = FC_MovementInfo())
{
    ECSFunc_FC_MovementInfo::AssignMovementInfo(Entity, DefaultValue);
    return;
}
FC_MovementInfo& ModifyMovementInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_MovementInfo));
    return local_12.GetComp();
}
FC_MovementInfo& ModifyOrAddMovementInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_MovementInfo));
    return local_12.GetComp();
}
const FC_MovementInfo& GetMovementInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_MovementInfo));
    return local_12.GetComp();
}
UFUNCTION()
FC_MovementInfo GetMovementInfo_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_MovementInfo& local_4 = ECSFunc_FC_MovementInfo::GetMovementInfo(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_MovementInfo();
}
const FC_MovementInfo GetDefaultedMovementInfo(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_MovementInfo __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_MovementInfo);
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
FC_MovementInfo GetDefaultedMovementInfo_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_MovementInfo::GetDefaultedMovementInfo(Entity);
}
UFUNCTION()
bool RemoveMovementInfo(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_MovementInfo);
}
}
FECSMonitorRuntimeView __GetMonitorMovementInfoOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_MovementInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorMovementInfoOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_MovementInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorMovementInfoOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_MovementInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorMovementInfoOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_MovementInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorMovementInfoOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_MovementInfo, bFixedFrame, bMustHandleAll);
}
void __MonitorMovementInfoLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_MovementInfo, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorMovementInfoActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_MovementInfo, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorMovementInfoModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_MovementInfo, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_MovementEndAbilitySignal
{
UFUNCTION()
bool HasMovementEndAbilitySignal(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_MovementEndAbilitySignal);
}
FC_MovementEndAbilitySignal& AssignMovementEndAbilitySignal(const FECSEntity &inout Entity, const FC_MovementEndAbilitySignal &inout DefaultValue = FC_MovementEndAbilitySignal())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_MovementEndAbilitySignal, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignMovementEndAbilitySignal_BP(const FECSEntity &inout Entity, const FC_MovementEndAbilitySignal &inout DefaultValue = FC_MovementEndAbilitySignal())
{
    ECSFunc_FC_MovementEndAbilitySignal::AssignMovementEndAbilitySignal(Entity, DefaultValue);
    return;
}
FC_MovementEndAbilitySignal& ModifyMovementEndAbilitySignal(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_MovementEndAbilitySignal));
    return local_12.GetComp();
}
FC_MovementEndAbilitySignal& ModifyOrAddMovementEndAbilitySignal(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_MovementEndAbilitySignal));
    return local_12.GetComp();
}
const FC_MovementEndAbilitySignal& GetMovementEndAbilitySignal(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_MovementEndAbilitySignal));
    return local_12.GetComp();
}
UFUNCTION()
FC_MovementEndAbilitySignal GetMovementEndAbilitySignal_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_MovementEndAbilitySignal& local_4 = ECSFunc_FC_MovementEndAbilitySignal::GetMovementEndAbilitySignal(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_MovementEndAbilitySignal();
}
const FC_MovementEndAbilitySignal GetDefaultedMovementEndAbilitySignal(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_MovementEndAbilitySignal __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_MovementEndAbilitySignal);
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
FC_MovementEndAbilitySignal GetDefaultedMovementEndAbilitySignal_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_MovementEndAbilitySignal::GetDefaultedMovementEndAbilitySignal(Entity);
}
UFUNCTION()
bool RemoveMovementEndAbilitySignal(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_MovementEndAbilitySignal);
}
}
FECSMonitorRuntimeView __GetMonitorMovementEndAbilitySignalOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_MovementEndAbilitySignal, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorMovementEndAbilitySignalOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_MovementEndAbilitySignal, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorMovementEndAbilitySignalOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_MovementEndAbilitySignal, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorMovementEndAbilitySignalOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_MovementEndAbilitySignal, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorMovementEndAbilitySignalOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_MovementEndAbilitySignal, bFixedFrame, bMustHandleAll);
}
void __MonitorMovementEndAbilitySignalLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_MovementEndAbilitySignal, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorMovementEndAbilitySignalActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_MovementEndAbilitySignal, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorMovementEndAbilitySignalModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_MovementEndAbilitySignal, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_MovementEndEventToESMTriggerFilterSignal
{
UFUNCTION()
bool HasMovementEndEventToESMTriggerFilterSignal(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_MovementEndEventToESMTriggerFilterSignal);
}
FC_MovementEndEventToESMTriggerFilterSignal& AssignMovementEndEventToESMTriggerFilterSignal(const FECSEntity &inout Entity, const FC_MovementEndEventToESMTriggerFilterSignal &inout DefaultValue = FC_MovementEndEventToESMTriggerFilterSignal())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_MovementEndEventToESMTriggerFilterSignal, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignMovementEndEventToESMTriggerFilterSignal_BP(const FECSEntity &inout Entity, const FC_MovementEndEventToESMTriggerFilterSignal &inout DefaultValue = FC_MovementEndEventToESMTriggerFilterSignal())
{
    ECSFunc_FC_MovementEndEventToESMTriggerFilterSignal::AssignMovementEndEventToESMTriggerFilterSignal(Entity, DefaultValue);
    return;
}
FC_MovementEndEventToESMTriggerFilterSignal& ModifyMovementEndEventToESMTriggerFilterSignal(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_MovementEndEventToESMTriggerFilterSignal));
    return local_12.GetComp();
}
FC_MovementEndEventToESMTriggerFilterSignal& ModifyOrAddMovementEndEventToESMTriggerFilterSignal(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_MovementEndEventToESMTriggerFilterSignal));
    return local_12.GetComp();
}
const FC_MovementEndEventToESMTriggerFilterSignal& GetMovementEndEventToESMTriggerFilterSignal(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_MovementEndEventToESMTriggerFilterSignal));
    return local_12.GetComp();
}
UFUNCTION()
FC_MovementEndEventToESMTriggerFilterSignal GetMovementEndEventToESMTriggerFilterSignal_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_MovementEndEventToESMTriggerFilterSignal& local_4 = ECSFunc_FC_MovementEndEventToESMTriggerFilterSignal::GetMovementEndEventToESMTriggerFilterSignal(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_MovementEndEventToESMTriggerFilterSignal();
}
const FC_MovementEndEventToESMTriggerFilterSignal GetDefaultedMovementEndEventToESMTriggerFilterSignal(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_MovementEndEventToESMTriggerFilterSignal __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_MovementEndEventToESMTriggerFilterSignal);
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
FC_MovementEndEventToESMTriggerFilterSignal GetDefaultedMovementEndEventToESMTriggerFilterSignal_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_MovementEndEventToESMTriggerFilterSignal::GetDefaultedMovementEndEventToESMTriggerFilterSignal(Entity);
}
UFUNCTION()
bool RemoveMovementEndEventToESMTriggerFilterSignal(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_MovementEndEventToESMTriggerFilterSignal);
}
}
FECSMonitorRuntimeView __GetMonitorMovementEndEventToESMTriggerFilterSignalOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_MovementEndEventToESMTriggerFilterSignal, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorMovementEndEventToESMTriggerFilterSignalOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_MovementEndEventToESMTriggerFilterSignal, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorMovementEndEventToESMTriggerFilterSignalOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_MovementEndEventToESMTriggerFilterSignal, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorMovementEndEventToESMTriggerFilterSignalOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_MovementEndEventToESMTriggerFilterSignal, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorMovementEndEventToESMTriggerFilterSignalOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_MovementEndEventToESMTriggerFilterSignal, bFixedFrame, bMustHandleAll);
}
void __MonitorMovementEndEventToESMTriggerFilterSignalLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_MovementEndEventToESMTriggerFilterSignal, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorMovementEndEventToESMTriggerFilterSignalActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_MovementEndEventToESMTriggerFilterSignal, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorMovementEndEventToESMTriggerFilterSignalModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_MovementEndEventToESMTriggerFilterSignal, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_UpdateMovementParamOnActionStateChangedDeferTag
{
UFUNCTION()
bool HasUpdateMovementParamOnActionStateChangedDeferTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_UpdateMovementParamOnActionStateChangedDeferTag);
}
FC_UpdateMovementParamOnActionStateChangedDeferTag& AssignUpdateMovementParamOnActionStateChangedDeferTag(const FECSEntity &inout Entity, const FC_UpdateMovementParamOnActionStateChangedDeferTag &inout DefaultValue = FC_UpdateMovementParamOnActionStateChangedDeferTag())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_UpdateMovementParamOnActionStateChangedDeferTag, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignUpdateMovementParamOnActionStateChangedDeferTag_BP(const FECSEntity &inout Entity, const FC_UpdateMovementParamOnActionStateChangedDeferTag &inout DefaultValue = FC_UpdateMovementParamOnActionStateChangedDeferTag())
{
    ECSFunc_FC_UpdateMovementParamOnActionStateChangedDeferTag::AssignUpdateMovementParamOnActionStateChangedDeferTag(Entity, DefaultValue);
    return;
}
FC_UpdateMovementParamOnActionStateChangedDeferTag& ModifyUpdateMovementParamOnActionStateChangedDeferTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_UpdateMovementParamOnActionStateChangedDeferTag));
    return local_12.GetComp();
}
FC_UpdateMovementParamOnActionStateChangedDeferTag& ModifyOrAddUpdateMovementParamOnActionStateChangedDeferTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_UpdateMovementParamOnActionStateChangedDeferTag));
    return local_12.GetComp();
}
const FC_UpdateMovementParamOnActionStateChangedDeferTag& GetUpdateMovementParamOnActionStateChangedDeferTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_UpdateMovementParamOnActionStateChangedDeferTag));
    return local_12.GetComp();
}
UFUNCTION()
FC_UpdateMovementParamOnActionStateChangedDeferTag GetUpdateMovementParamOnActionStateChangedDeferTag_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_UpdateMovementParamOnActionStateChangedDeferTag& local_4 = ECSFunc_FC_UpdateMovementParamOnActionStateChangedDeferTag::GetUpdateMovementParamOnActionStateChangedDeferTag(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_UpdateMovementParamOnActionStateChangedDeferTag();
}
const FC_UpdateMovementParamOnActionStateChangedDeferTag GetDefaultedUpdateMovementParamOnActionStateChangedDeferTag(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_UpdateMovementParamOnActionStateChangedDeferTag __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_UpdateMovementParamOnActionStateChangedDeferTag);
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
FC_UpdateMovementParamOnActionStateChangedDeferTag GetDefaultedUpdateMovementParamOnActionStateChangedDeferTag_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_UpdateMovementParamOnActionStateChangedDeferTag::GetDefaultedUpdateMovementParamOnActionStateChangedDeferTag(Entity);
}
UFUNCTION()
bool RemoveUpdateMovementParamOnActionStateChangedDeferTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_UpdateMovementParamOnActionStateChangedDeferTag);
}
}
FECSMonitorRuntimeView __GetMonitorUpdateMovementParamOnActionStateChangedDeferTagOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_UpdateMovementParamOnActionStateChangedDeferTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorUpdateMovementParamOnActionStateChangedDeferTagOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_UpdateMovementParamOnActionStateChangedDeferTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorUpdateMovementParamOnActionStateChangedDeferTagOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_UpdateMovementParamOnActionStateChangedDeferTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorUpdateMovementParamOnActionStateChangedDeferTagOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_UpdateMovementParamOnActionStateChangedDeferTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorUpdateMovementParamOnActionStateChangedDeferTagOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_UpdateMovementParamOnActionStateChangedDeferTag, bFixedFrame, bMustHandleAll);
}
void __MonitorUpdateMovementParamOnActionStateChangedDeferTagLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_UpdateMovementParamOnActionStateChangedDeferTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorUpdateMovementParamOnActionStateChangedDeferTagActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_UpdateMovementParamOnActionStateChangedDeferTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorUpdateMovementParamOnActionStateChangedDeferTagModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_UpdateMovementParamOnActionStateChangedDeferTag, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_LinearMovementConfig
{
UFUNCTION()
bool HasLinearMovementConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_LinearMovementConfig);
}
FC_LinearMovementConfig& AssignLinearMovementConfig(const FECSEntity &inout Entity, const FC_LinearMovementConfig &inout DefaultValue = FC_LinearMovementConfig())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_LinearMovementConfig, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignLinearMovementConfig_BP(const FECSEntity &inout Entity, const FC_LinearMovementConfig &inout DefaultValue = FC_LinearMovementConfig())
{
    ECSFunc_FC_LinearMovementConfig::AssignLinearMovementConfig(Entity, DefaultValue);
    return;
}
FC_LinearMovementConfig& ModifyLinearMovementConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_LinearMovementConfig));
    return local_12.GetComp();
}
FC_LinearMovementConfig& ModifyOrAddLinearMovementConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_LinearMovementConfig));
    return local_12.GetComp();
}
const FC_LinearMovementConfig& GetLinearMovementConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_LinearMovementConfig));
    return local_12.GetComp();
}
UFUNCTION()
FC_LinearMovementConfig GetLinearMovementConfig_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_LinearMovementConfig& local_4 = ECSFunc_FC_LinearMovementConfig::GetLinearMovementConfig(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_LinearMovementConfig();
}
const FC_LinearMovementConfig GetDefaultedLinearMovementConfig(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_LinearMovementConfig __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_LinearMovementConfig);
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
FC_LinearMovementConfig GetDefaultedLinearMovementConfig_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_LinearMovementConfig::GetDefaultedLinearMovementConfig(Entity);
}
UFUNCTION()
bool RemoveLinearMovementConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_LinearMovementConfig);
}
}
FECSMonitorRuntimeView __GetMonitorLinearMovementConfigOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_LinearMovementConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLinearMovementConfigOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_LinearMovementConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLinearMovementConfigOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_LinearMovementConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLinearMovementConfigOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_LinearMovementConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLinearMovementConfigOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_LinearMovementConfig, bFixedFrame, bMustHandleAll);
}
void __MonitorLinearMovementConfigLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_LinearMovementConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorLinearMovementConfigActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_LinearMovementConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorLinearMovementConfigModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_LinearMovementConfig, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_LinearMovementOverride
{
UFUNCTION()
bool HasLinearMovementOverride(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_LinearMovementOverride);
}
FC_LinearMovementOverride& AssignLinearMovementOverride(const FECSEntity &inout Entity, const FC_LinearMovementOverride &inout DefaultValue = FC_LinearMovementOverride())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_LinearMovementOverride, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignLinearMovementOverride_BP(const FECSEntity &inout Entity, const FC_LinearMovementOverride &inout DefaultValue = FC_LinearMovementOverride())
{
    ECSFunc_FC_LinearMovementOverride::AssignLinearMovementOverride(Entity, DefaultValue);
    return;
}
FC_LinearMovementOverride& ModifyLinearMovementOverride(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_LinearMovementOverride));
    return local_12.GetComp();
}
FC_LinearMovementOverride& ModifyOrAddLinearMovementOverride(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_LinearMovementOverride));
    return local_12.GetComp();
}
const FC_LinearMovementOverride& GetLinearMovementOverride(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_LinearMovementOverride));
    return local_12.GetComp();
}
UFUNCTION()
FC_LinearMovementOverride GetLinearMovementOverride_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_LinearMovementOverride& local_4 = ECSFunc_FC_LinearMovementOverride::GetLinearMovementOverride(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_LinearMovementOverride();
}
const FC_LinearMovementOverride GetDefaultedLinearMovementOverride(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_LinearMovementOverride __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_LinearMovementOverride);
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
FC_LinearMovementOverride GetDefaultedLinearMovementOverride_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_LinearMovementOverride::GetDefaultedLinearMovementOverride(Entity);
}
UFUNCTION()
bool RemoveLinearMovementOverride(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_LinearMovementOverride);
}
}
FECSMonitorRuntimeView __GetMonitorLinearMovementOverrideOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_LinearMovementOverride, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLinearMovementOverrideOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_LinearMovementOverride, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLinearMovementOverrideOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_LinearMovementOverride, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLinearMovementOverrideOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_LinearMovementOverride, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLinearMovementOverrideOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_LinearMovementOverride, bFixedFrame, bMustHandleAll);
}
void __MonitorLinearMovementOverrideLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_LinearMovementOverride, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorLinearMovementOverrideActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_LinearMovementOverride, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorLinearMovementOverrideModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_LinearMovementOverride, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_SimpleProjectileMovementConfig
{
UFUNCTION()
bool HasSimpleProjectileMovementConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_SimpleProjectileMovementConfig);
}
FC_SimpleProjectileMovementConfig& AssignSimpleProjectileMovementConfig(const FECSEntity &inout Entity, const FC_SimpleProjectileMovementConfig &inout DefaultValue = FC_SimpleProjectileMovementConfig())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_SimpleProjectileMovementConfig, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignSimpleProjectileMovementConfig_BP(const FECSEntity &inout Entity, const FC_SimpleProjectileMovementConfig &inout DefaultValue = FC_SimpleProjectileMovementConfig())
{
    ECSFunc_FC_SimpleProjectileMovementConfig::AssignSimpleProjectileMovementConfig(Entity, DefaultValue);
    return;
}
FC_SimpleProjectileMovementConfig& ModifySimpleProjectileMovementConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_SimpleProjectileMovementConfig));
    return local_12.GetComp();
}
FC_SimpleProjectileMovementConfig& ModifyOrAddSimpleProjectileMovementConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_SimpleProjectileMovementConfig));
    return local_12.GetComp();
}
const FC_SimpleProjectileMovementConfig& GetSimpleProjectileMovementConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_SimpleProjectileMovementConfig));
    return local_12.GetComp();
}
UFUNCTION()
FC_SimpleProjectileMovementConfig GetSimpleProjectileMovementConfig_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_SimpleProjectileMovementConfig __r;
    bValid = false;
    bValid = ECSFunc_FC_SimpleProjectileMovementConfig::GetSimpleProjectileMovementConfig(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_SimpleProjectileMovementConfig GetDefaultedSimpleProjectileMovementConfig(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_SimpleProjectileMovementConfig __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_SimpleProjectileMovementConfig);
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
FC_SimpleProjectileMovementConfig GetDefaultedSimpleProjectileMovementConfig_BP(const FECSEntity &inout Entity)
{
    FC_SimpleProjectileMovementConfig __r;
    return __r;
}
UFUNCTION()
bool RemoveSimpleProjectileMovementConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_SimpleProjectileMovementConfig);
}
}
FECSMonitorRuntimeView __GetMonitorSimpleProjectileMovementConfigOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_SimpleProjectileMovementConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSimpleProjectileMovementConfigOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_SimpleProjectileMovementConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSimpleProjectileMovementConfigOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_SimpleProjectileMovementConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSimpleProjectileMovementConfigOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_SimpleProjectileMovementConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSimpleProjectileMovementConfigOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_SimpleProjectileMovementConfig, bFixedFrame, bMustHandleAll);
}
void __MonitorSimpleProjectileMovementConfigLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_SimpleProjectileMovementConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorSimpleProjectileMovementConfigActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_SimpleProjectileMovementConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorSimpleProjectileMovementConfigModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_SimpleProjectileMovementConfig, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_SimpleProjectileMovementOverride
{
UFUNCTION()
bool HasSimpleProjectileMovementOverride(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_SimpleProjectileMovementOverride);
}
FC_SimpleProjectileMovementOverride& AssignSimpleProjectileMovementOverride(const FECSEntity &inout Entity, const FC_SimpleProjectileMovementOverride &inout DefaultValue = FC_SimpleProjectileMovementOverride())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_SimpleProjectileMovementOverride, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignSimpleProjectileMovementOverride_BP(const FECSEntity &inout Entity, const FC_SimpleProjectileMovementOverride &inout DefaultValue = FC_SimpleProjectileMovementOverride())
{
    ECSFunc_FC_SimpleProjectileMovementOverride::AssignSimpleProjectileMovementOverride(Entity, DefaultValue);
    return;
}
FC_SimpleProjectileMovementOverride& ModifySimpleProjectileMovementOverride(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_SimpleProjectileMovementOverride));
    return local_12.GetComp();
}
FC_SimpleProjectileMovementOverride& ModifyOrAddSimpleProjectileMovementOverride(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_SimpleProjectileMovementOverride));
    return local_12.GetComp();
}
const FC_SimpleProjectileMovementOverride& GetSimpleProjectileMovementOverride(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_SimpleProjectileMovementOverride));
    return local_12.GetComp();
}
UFUNCTION()
FC_SimpleProjectileMovementOverride GetSimpleProjectileMovementOverride_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_SimpleProjectileMovementOverride& local_4 = ECSFunc_FC_SimpleProjectileMovementOverride::GetSimpleProjectileMovementOverride(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_SimpleProjectileMovementOverride();
}
const FC_SimpleProjectileMovementOverride GetDefaultedSimpleProjectileMovementOverride(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_SimpleProjectileMovementOverride __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_SimpleProjectileMovementOverride);
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
FC_SimpleProjectileMovementOverride GetDefaultedSimpleProjectileMovementOverride_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_SimpleProjectileMovementOverride::GetDefaultedSimpleProjectileMovementOverride(Entity);
}
UFUNCTION()
bool RemoveSimpleProjectileMovementOverride(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_SimpleProjectileMovementOverride);
}
}
FECSMonitorRuntimeView __GetMonitorSimpleProjectileMovementOverrideOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_SimpleProjectileMovementOverride, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSimpleProjectileMovementOverrideOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_SimpleProjectileMovementOverride, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSimpleProjectileMovementOverrideOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_SimpleProjectileMovementOverride, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSimpleProjectileMovementOverrideOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_SimpleProjectileMovementOverride, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSimpleProjectileMovementOverrideOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_SimpleProjectileMovementOverride, bFixedFrame, bMustHandleAll);
}
void __MonitorSimpleProjectileMovementOverrideLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_SimpleProjectileMovementOverride, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorSimpleProjectileMovementOverrideActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_SimpleProjectileMovementOverride, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorSimpleProjectileMovementOverrideModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_SimpleProjectileMovementOverride, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_ThrowMovementConfig
{
UFUNCTION()
bool HasThrowMovementConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_ThrowMovementConfig);
}
FC_ThrowMovementConfig& AssignThrowMovementConfig(const FECSEntity &inout Entity, const FC_ThrowMovementConfig &inout DefaultValue = FC_ThrowMovementConfig())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_ThrowMovementConfig, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignThrowMovementConfig_BP(const FECSEntity &inout Entity, const FC_ThrowMovementConfig &inout DefaultValue = FC_ThrowMovementConfig())
{
    ECSFunc_FC_ThrowMovementConfig::AssignThrowMovementConfig(Entity, DefaultValue);
    return;
}
FC_ThrowMovementConfig& ModifyThrowMovementConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_ThrowMovementConfig));
    return local_12.GetComp();
}
FC_ThrowMovementConfig& ModifyOrAddThrowMovementConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_ThrowMovementConfig));
    return local_12.GetComp();
}
const FC_ThrowMovementConfig& GetThrowMovementConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_ThrowMovementConfig));
    return local_12.GetComp();
}
UFUNCTION()
FC_ThrowMovementConfig GetThrowMovementConfig_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_ThrowMovementConfig __r;
    bValid = false;
    bValid = ECSFunc_FC_ThrowMovementConfig::GetThrowMovementConfig(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_ThrowMovementConfig GetDefaultedThrowMovementConfig(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_ThrowMovementConfig __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_ThrowMovementConfig);
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
FC_ThrowMovementConfig GetDefaultedThrowMovementConfig_BP(const FECSEntity &inout Entity)
{
    FC_ThrowMovementConfig __r;
    return __r;
}
UFUNCTION()
bool RemoveThrowMovementConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_ThrowMovementConfig);
}
}
FECSMonitorRuntimeView __GetMonitorThrowMovementConfigOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_ThrowMovementConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorThrowMovementConfigOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_ThrowMovementConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorThrowMovementConfigOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_ThrowMovementConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorThrowMovementConfigOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_ThrowMovementConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorThrowMovementConfigOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_ThrowMovementConfig, bFixedFrame, bMustHandleAll);
}
void __MonitorThrowMovementConfigLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_ThrowMovementConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorThrowMovementConfigActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_ThrowMovementConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorThrowMovementConfigModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_ThrowMovementConfig, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_ThrowMovementOverride
{
UFUNCTION()
bool HasThrowMovementOverride(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_ThrowMovementOverride);
}
FC_ThrowMovementOverride& AssignThrowMovementOverride(const FECSEntity &inout Entity, const FC_ThrowMovementOverride &inout DefaultValue = FC_ThrowMovementOverride())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_ThrowMovementOverride, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignThrowMovementOverride_BP(const FECSEntity &inout Entity, const FC_ThrowMovementOverride &inout DefaultValue = FC_ThrowMovementOverride())
{
    ECSFunc_FC_ThrowMovementOverride::AssignThrowMovementOverride(Entity, DefaultValue);
    return;
}
FC_ThrowMovementOverride& ModifyThrowMovementOverride(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_ThrowMovementOverride));
    return local_12.GetComp();
}
FC_ThrowMovementOverride& ModifyOrAddThrowMovementOverride(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_ThrowMovementOverride));
    return local_12.GetComp();
}
const FC_ThrowMovementOverride& GetThrowMovementOverride(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_ThrowMovementOverride));
    return local_12.GetComp();
}
UFUNCTION()
FC_ThrowMovementOverride GetThrowMovementOverride_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_ThrowMovementOverride& local_4 = ECSFunc_FC_ThrowMovementOverride::GetThrowMovementOverride(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_ThrowMovementOverride();
}
const FC_ThrowMovementOverride GetDefaultedThrowMovementOverride(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_ThrowMovementOverride __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_ThrowMovementOverride);
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
FC_ThrowMovementOverride GetDefaultedThrowMovementOverride_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_ThrowMovementOverride::GetDefaultedThrowMovementOverride(Entity);
}
UFUNCTION()
bool RemoveThrowMovementOverride(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_ThrowMovementOverride);
}
}
FECSMonitorRuntimeView __GetMonitorThrowMovementOverrideOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_ThrowMovementOverride, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorThrowMovementOverrideOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_ThrowMovementOverride, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorThrowMovementOverrideOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_ThrowMovementOverride, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorThrowMovementOverrideOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_ThrowMovementOverride, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorThrowMovementOverrideOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_ThrowMovementOverride, bFixedFrame, bMustHandleAll);
}
void __MonitorThrowMovementOverrideLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_ThrowMovementOverride, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorThrowMovementOverrideActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_ThrowMovementOverride, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorThrowMovementOverrideModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_ThrowMovementOverride, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_AutoCalcProjectileMovement
{
UFUNCTION()
bool HasAutoCalcProjectileMovement(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_AutoCalcProjectileMovement);
}
FC_AutoCalcProjectileMovement& AssignAutoCalcProjectileMovement(const FECSEntity &inout Entity, const FC_AutoCalcProjectileMovement &inout DefaultValue = FC_AutoCalcProjectileMovement())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_AutoCalcProjectileMovement, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignAutoCalcProjectileMovement_BP(const FECSEntity &inout Entity, const FC_AutoCalcProjectileMovement &inout DefaultValue = FC_AutoCalcProjectileMovement())
{
    ECSFunc_FC_AutoCalcProjectileMovement::AssignAutoCalcProjectileMovement(Entity, DefaultValue);
    return;
}
FC_AutoCalcProjectileMovement& ModifyAutoCalcProjectileMovement(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_AutoCalcProjectileMovement));
    return local_12.GetComp();
}
FC_AutoCalcProjectileMovement& ModifyOrAddAutoCalcProjectileMovement(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_AutoCalcProjectileMovement));
    return local_12.GetComp();
}
const FC_AutoCalcProjectileMovement& GetAutoCalcProjectileMovement(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_AutoCalcProjectileMovement));
    return local_12.GetComp();
}
UFUNCTION()
FC_AutoCalcProjectileMovement GetAutoCalcProjectileMovement_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_AutoCalcProjectileMovement& local_4 = ECSFunc_FC_AutoCalcProjectileMovement::GetAutoCalcProjectileMovement(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_AutoCalcProjectileMovement();
}
const FC_AutoCalcProjectileMovement GetDefaultedAutoCalcProjectileMovement(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_AutoCalcProjectileMovement __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_AutoCalcProjectileMovement);
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
FC_AutoCalcProjectileMovement GetDefaultedAutoCalcProjectileMovement_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_AutoCalcProjectileMovement::GetDefaultedAutoCalcProjectileMovement(Entity);
}
UFUNCTION()
bool RemoveAutoCalcProjectileMovement(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_AutoCalcProjectileMovement);
}
}
FECSMonitorRuntimeView __GetMonitorAutoCalcProjectileMovementOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_AutoCalcProjectileMovement, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAutoCalcProjectileMovementOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_AutoCalcProjectileMovement, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAutoCalcProjectileMovementOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_AutoCalcProjectileMovement, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAutoCalcProjectileMovementOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_AutoCalcProjectileMovement, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAutoCalcProjectileMovementOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_AutoCalcProjectileMovement, bFixedFrame, bMustHandleAll);
}
void __MonitorAutoCalcProjectileMovementLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_AutoCalcProjectileMovement, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAutoCalcProjectileMovementActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_AutoCalcProjectileMovement, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAutoCalcProjectileMovementModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_AutoCalcProjectileMovement, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_MovementByBVar
{
UFUNCTION()
bool HasMovementByBVar(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_MovementByBVar);
}
FC_MovementByBVar& AssignMovementByBVar(const FECSEntity &inout Entity, const FC_MovementByBVar &inout DefaultValue = FC_MovementByBVar())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_MovementByBVar, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignMovementByBVar_BP(const FECSEntity &inout Entity, const FC_MovementByBVar &inout DefaultValue = FC_MovementByBVar())
{
    ECSFunc_FC_MovementByBVar::AssignMovementByBVar(Entity, DefaultValue);
    return;
}
FC_MovementByBVar& ModifyMovementByBVar(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_MovementByBVar));
    return local_12.GetComp();
}
FC_MovementByBVar& ModifyOrAddMovementByBVar(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_MovementByBVar));
    return local_12.GetComp();
}
const FC_MovementByBVar& GetMovementByBVar(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_MovementByBVar));
    return local_12.GetComp();
}
UFUNCTION()
FC_MovementByBVar GetMovementByBVar_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_MovementByBVar& local_4 = ECSFunc_FC_MovementByBVar::GetMovementByBVar(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_MovementByBVar();
}
const FC_MovementByBVar GetDefaultedMovementByBVar(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_MovementByBVar __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_MovementByBVar);
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
FC_MovementByBVar GetDefaultedMovementByBVar_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_MovementByBVar::GetDefaultedMovementByBVar(Entity);
}
UFUNCTION()
bool RemoveMovementByBVar(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_MovementByBVar);
}
}
FECSMonitorRuntimeView __GetMonitorMovementByBVarOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_MovementByBVar, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorMovementByBVarOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_MovementByBVar, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorMovementByBVarOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_MovementByBVar, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorMovementByBVarOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_MovementByBVar, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorMovementByBVarOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_MovementByBVar, bFixedFrame, bMustHandleAll);
}
void __MonitorMovementByBVarLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_MovementByBVar, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorMovementByBVarActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_MovementByBVar, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorMovementByBVarModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_MovementByBVar, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_RelativeMovement
{
UFUNCTION()
bool HasRelativeMovement(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_RelativeMovement);
}
FC_RelativeMovement& AssignRelativeMovement(const FECSEntity &inout Entity, const FC_RelativeMovement &inout DefaultValue = FC_RelativeMovement())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_RelativeMovement, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignRelativeMovement_BP(const FECSEntity &inout Entity, const FC_RelativeMovement &inout DefaultValue = FC_RelativeMovement())
{
    ECSFunc_FC_RelativeMovement::AssignRelativeMovement(Entity, DefaultValue);
    return;
}
FC_RelativeMovement& ModifyRelativeMovement(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_RelativeMovement));
    return local_12.GetComp();
}
FC_RelativeMovement& ModifyOrAddRelativeMovement(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_RelativeMovement));
    return local_12.GetComp();
}
const FC_RelativeMovement& GetRelativeMovement(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_RelativeMovement));
    return local_12.GetComp();
}
UFUNCTION()
FC_RelativeMovement GetRelativeMovement_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_RelativeMovement& local_4 = ECSFunc_FC_RelativeMovement::GetRelativeMovement(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_RelativeMovement();
}
const FC_RelativeMovement GetDefaultedRelativeMovement(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_RelativeMovement __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_RelativeMovement);
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
FC_RelativeMovement GetDefaultedRelativeMovement_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_RelativeMovement::GetDefaultedRelativeMovement(Entity);
}
UFUNCTION()
bool RemoveRelativeMovement(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_RelativeMovement);
}
}
FECSMonitorRuntimeView __GetMonitorRelativeMovementOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_RelativeMovement, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorRelativeMovementOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_RelativeMovement, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorRelativeMovementOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_RelativeMovement, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorRelativeMovementOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_RelativeMovement, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorRelativeMovementOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_RelativeMovement, bFixedFrame, bMustHandleAll);
}
void __MonitorRelativeMovementLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_RelativeMovement, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorRelativeMovementActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_RelativeMovement, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorRelativeMovementModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_RelativeMovement, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_RelativeMovementEnableByTime
{
UFUNCTION()
bool HasRelativeMovementEnableByTime(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_RelativeMovementEnableByTime);
}
FC_RelativeMovementEnableByTime& AssignRelativeMovementEnableByTime(const FECSEntity &inout Entity, const FC_RelativeMovementEnableByTime &inout DefaultValue = FC_RelativeMovementEnableByTime())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_RelativeMovementEnableByTime, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignRelativeMovementEnableByTime_BP(const FECSEntity &inout Entity, const FC_RelativeMovementEnableByTime &inout DefaultValue = FC_RelativeMovementEnableByTime())
{
    ECSFunc_FC_RelativeMovementEnableByTime::AssignRelativeMovementEnableByTime(Entity, DefaultValue);
    return;
}
FC_RelativeMovementEnableByTime& ModifyRelativeMovementEnableByTime(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_RelativeMovementEnableByTime));
    return local_12.GetComp();
}
FC_RelativeMovementEnableByTime& ModifyOrAddRelativeMovementEnableByTime(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_RelativeMovementEnableByTime));
    return local_12.GetComp();
}
const FC_RelativeMovementEnableByTime& GetRelativeMovementEnableByTime(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_RelativeMovementEnableByTime));
    return local_12.GetComp();
}
UFUNCTION()
FC_RelativeMovementEnableByTime GetRelativeMovementEnableByTime_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_RelativeMovementEnableByTime& local_4 = ECSFunc_FC_RelativeMovementEnableByTime::GetRelativeMovementEnableByTime(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_RelativeMovementEnableByTime();
}
const FC_RelativeMovementEnableByTime GetDefaultedRelativeMovementEnableByTime(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_RelativeMovementEnableByTime __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_RelativeMovementEnableByTime);
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
FC_RelativeMovementEnableByTime GetDefaultedRelativeMovementEnableByTime_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_RelativeMovementEnableByTime::GetDefaultedRelativeMovementEnableByTime(Entity);
}
UFUNCTION()
bool RemoveRelativeMovementEnableByTime(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_RelativeMovementEnableByTime);
}
}
FECSMonitorRuntimeView __GetMonitorRelativeMovementEnableByTimeOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_RelativeMovementEnableByTime, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorRelativeMovementEnableByTimeOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_RelativeMovementEnableByTime, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorRelativeMovementEnableByTimeOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_RelativeMovementEnableByTime, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorRelativeMovementEnableByTimeOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_RelativeMovementEnableByTime, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorRelativeMovementEnableByTimeOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_RelativeMovementEnableByTime, bFixedFrame, bMustHandleAll);
}
void __MonitorRelativeMovementEnableByTimeLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_RelativeMovementEnableByTime, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorRelativeMovementEnableByTimeActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_RelativeMovementEnableByTime, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorRelativeMovementEnableByTimeModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_RelativeMovementEnableByTime, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_AdditionalMovementConfig
{
UFUNCTION()
bool HasAdditionalMovementConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_AdditionalMovementConfig);
}
FC_AdditionalMovementConfig& AssignAdditionalMovementConfig(const FECSEntity &inout Entity, const FC_AdditionalMovementConfig &inout DefaultValue = FC_AdditionalMovementConfig())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_AdditionalMovementConfig, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignAdditionalMovementConfig_BP(const FECSEntity &inout Entity, const FC_AdditionalMovementConfig &inout DefaultValue = FC_AdditionalMovementConfig())
{
    ECSFunc_FC_AdditionalMovementConfig::AssignAdditionalMovementConfig(Entity, DefaultValue);
    return;
}
FC_AdditionalMovementConfig& ModifyAdditionalMovementConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_AdditionalMovementConfig));
    return local_12.GetComp();
}
FC_AdditionalMovementConfig& ModifyOrAddAdditionalMovementConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_AdditionalMovementConfig));
    return local_12.GetComp();
}
const FC_AdditionalMovementConfig& GetAdditionalMovementConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_AdditionalMovementConfig));
    return local_12.GetComp();
}
UFUNCTION()
FC_AdditionalMovementConfig GetAdditionalMovementConfig_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_AdditionalMovementConfig __r;
    bValid = false;
    bValid = ECSFunc_FC_AdditionalMovementConfig::GetAdditionalMovementConfig(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_AdditionalMovementConfig GetDefaultedAdditionalMovementConfig(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_AdditionalMovementConfig __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_AdditionalMovementConfig);
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
FC_AdditionalMovementConfig GetDefaultedAdditionalMovementConfig_BP(const FECSEntity &inout Entity)
{
    FC_AdditionalMovementConfig __r;
    return __r;
}
UFUNCTION()
bool RemoveAdditionalMovementConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_AdditionalMovementConfig);
}
}
FECSMonitorRuntimeView __GetMonitorAdditionalMovementConfigOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_AdditionalMovementConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAdditionalMovementConfigOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_AdditionalMovementConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAdditionalMovementConfigOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_AdditionalMovementConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAdditionalMovementConfigOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_AdditionalMovementConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAdditionalMovementConfigOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_AdditionalMovementConfig, bFixedFrame, bMustHandleAll);
}
void __MonitorAdditionalMovementConfigLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_AdditionalMovementConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAdditionalMovementConfigActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_AdditionalMovementConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAdditionalMovementConfigModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_AdditionalMovementConfig, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_CurveMovementConfig
{
UFUNCTION()
bool HasCurveMovementConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_CurveMovementConfig);
}
FC_CurveMovementConfig& AssignCurveMovementConfig(const FECSEntity &inout Entity, const FC_CurveMovementConfig &inout DefaultValue = FC_CurveMovementConfig())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_CurveMovementConfig, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignCurveMovementConfig_BP(const FECSEntity &inout Entity, const FC_CurveMovementConfig &inout DefaultValue = FC_CurveMovementConfig())
{
    ECSFunc_FC_CurveMovementConfig::AssignCurveMovementConfig(Entity, DefaultValue);
    return;
}
FC_CurveMovementConfig& ModifyCurveMovementConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_CurveMovementConfig));
    return local_12.GetComp();
}
FC_CurveMovementConfig& ModifyOrAddCurveMovementConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_CurveMovementConfig));
    return local_12.GetComp();
}
const FC_CurveMovementConfig& GetCurveMovementConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_CurveMovementConfig));
    return local_12.GetComp();
}
UFUNCTION()
FC_CurveMovementConfig GetCurveMovementConfig_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_CurveMovementConfig __r;
    bValid = false;
    bValid = ECSFunc_FC_CurveMovementConfig::GetCurveMovementConfig(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_CurveMovementConfig GetDefaultedCurveMovementConfig(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_CurveMovementConfig __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_CurveMovementConfig);
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
FC_CurveMovementConfig GetDefaultedCurveMovementConfig_BP(const FECSEntity &inout Entity)
{
    FC_CurveMovementConfig __r;
    return __r;
}
UFUNCTION()
bool RemoveCurveMovementConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_CurveMovementConfig);
}
}
FECSMonitorRuntimeView __GetMonitorCurveMovementConfigOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_CurveMovementConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCurveMovementConfigOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_CurveMovementConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCurveMovementConfigOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_CurveMovementConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCurveMovementConfigOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_CurveMovementConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCurveMovementConfigOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_CurveMovementConfig, bFixedFrame, bMustHandleAll);
}
void __MonitorCurveMovementConfigLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_CurveMovementConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCurveMovementConfigActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_CurveMovementConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCurveMovementConfigModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_CurveMovementConfig, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_CurveMovementOverride
{
UFUNCTION()
bool HasCurveMovementOverride(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_CurveMovementOverride);
}
FC_CurveMovementOverride& AssignCurveMovementOverride(const FECSEntity &inout Entity, const FC_CurveMovementOverride &inout DefaultValue = FC_CurveMovementOverride())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_CurveMovementOverride, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignCurveMovementOverride_BP(const FECSEntity &inout Entity, const FC_CurveMovementOverride &inout DefaultValue = FC_CurveMovementOverride())
{
    ECSFunc_FC_CurveMovementOverride::AssignCurveMovementOverride(Entity, DefaultValue);
    return;
}
FC_CurveMovementOverride& ModifyCurveMovementOverride(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_CurveMovementOverride));
    return local_12.GetComp();
}
FC_CurveMovementOverride& ModifyOrAddCurveMovementOverride(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_CurveMovementOverride));
    return local_12.GetComp();
}
const FC_CurveMovementOverride& GetCurveMovementOverride(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_CurveMovementOverride));
    return local_12.GetComp();
}
UFUNCTION()
FC_CurveMovementOverride GetCurveMovementOverride_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_CurveMovementOverride& local_4 = ECSFunc_FC_CurveMovementOverride::GetCurveMovementOverride(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_CurveMovementOverride();
}
const FC_CurveMovementOverride GetDefaultedCurveMovementOverride(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_CurveMovementOverride __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_CurveMovementOverride);
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
FC_CurveMovementOverride GetDefaultedCurveMovementOverride_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_CurveMovementOverride::GetDefaultedCurveMovementOverride(Entity);
}
UFUNCTION()
bool RemoveCurveMovementOverride(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_CurveMovementOverride);
}
}
FECSMonitorRuntimeView __GetMonitorCurveMovementOverrideOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_CurveMovementOverride, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCurveMovementOverrideOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_CurveMovementOverride, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCurveMovementOverrideOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_CurveMovementOverride, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCurveMovementOverrideOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_CurveMovementOverride, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCurveMovementOverrideOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_CurveMovementOverride, bFixedFrame, bMustHandleAll);
}
void __MonitorCurveMovementOverrideLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_CurveMovementOverride, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCurveMovementOverrideActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_CurveMovementOverride, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCurveMovementOverrideModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_CurveMovementOverride, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_CurveRotationConfig
{
UFUNCTION()
bool HasCurveRotationConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_CurveRotationConfig);
}
FC_CurveRotationConfig& AssignCurveRotationConfig(const FECSEntity &inout Entity, const FC_CurveRotationConfig &inout DefaultValue = FC_CurveRotationConfig())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_CurveRotationConfig, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignCurveRotationConfig_BP(const FECSEntity &inout Entity, const FC_CurveRotationConfig &inout DefaultValue = FC_CurveRotationConfig())
{
    ECSFunc_FC_CurveRotationConfig::AssignCurveRotationConfig(Entity, DefaultValue);
    return;
}
FC_CurveRotationConfig& ModifyCurveRotationConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_CurveRotationConfig));
    return local_12.GetComp();
}
FC_CurveRotationConfig& ModifyOrAddCurveRotationConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_CurveRotationConfig));
    return local_12.GetComp();
}
const FC_CurveRotationConfig& GetCurveRotationConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_CurveRotationConfig));
    return local_12.GetComp();
}
UFUNCTION()
FC_CurveRotationConfig GetCurveRotationConfig_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_CurveRotationConfig __r;
    bValid = false;
    bValid = ECSFunc_FC_CurveRotationConfig::GetCurveRotationConfig(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_CurveRotationConfig GetDefaultedCurveRotationConfig(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_CurveRotationConfig __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_CurveRotationConfig);
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
FC_CurveRotationConfig GetDefaultedCurveRotationConfig_BP(const FECSEntity &inout Entity)
{
    FC_CurveRotationConfig __r;
    return __r;
}
UFUNCTION()
bool RemoveCurveRotationConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_CurveRotationConfig);
}
}
FECSMonitorRuntimeView __GetMonitorCurveRotationConfigOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_CurveRotationConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCurveRotationConfigOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_CurveRotationConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCurveRotationConfigOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_CurveRotationConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCurveRotationConfigOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_CurveRotationConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCurveRotationConfigOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_CurveRotationConfig, bFixedFrame, bMustHandleAll);
}
void __MonitorCurveRotationConfigLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_CurveRotationConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCurveRotationConfigActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_CurveRotationConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCurveRotationConfigModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_CurveRotationConfig, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_CurveRotationOverride
{
UFUNCTION()
bool HasCurveRotationOverride(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_CurveRotationOverride);
}
FC_CurveRotationOverride& AssignCurveRotationOverride(const FECSEntity &inout Entity, const FC_CurveRotationOverride &inout DefaultValue = FC_CurveRotationOverride())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_CurveRotationOverride, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignCurveRotationOverride_BP(const FECSEntity &inout Entity, const FC_CurveRotationOverride &inout DefaultValue = FC_CurveRotationOverride())
{
    ECSFunc_FC_CurveRotationOverride::AssignCurveRotationOverride(Entity, DefaultValue);
    return;
}
FC_CurveRotationOverride& ModifyCurveRotationOverride(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_CurveRotationOverride));
    return local_12.GetComp();
}
FC_CurveRotationOverride& ModifyOrAddCurveRotationOverride(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_CurveRotationOverride));
    return local_12.GetComp();
}
const FC_CurveRotationOverride& GetCurveRotationOverride(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_CurveRotationOverride));
    return local_12.GetComp();
}
UFUNCTION()
FC_CurveRotationOverride GetCurveRotationOverride_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_CurveRotationOverride& local_4 = ECSFunc_FC_CurveRotationOverride::GetCurveRotationOverride(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_CurveRotationOverride();
}
const FC_CurveRotationOverride GetDefaultedCurveRotationOverride(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_CurveRotationOverride __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_CurveRotationOverride);
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
FC_CurveRotationOverride GetDefaultedCurveRotationOverride_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_CurveRotationOverride::GetDefaultedCurveRotationOverride(Entity);
}
UFUNCTION()
bool RemoveCurveRotationOverride(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_CurveRotationOverride);
}
}
FECSMonitorRuntimeView __GetMonitorCurveRotationOverrideOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_CurveRotationOverride, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCurveRotationOverrideOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_CurveRotationOverride, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCurveRotationOverrideOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_CurveRotationOverride, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCurveRotationOverrideOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_CurveRotationOverride, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCurveRotationOverrideOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_CurveRotationOverride, bFixedFrame, bMustHandleAll);
}
void __MonitorCurveRotationOverrideLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_CurveRotationOverride, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCurveRotationOverrideActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_CurveRotationOverride, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCurveRotationOverrideModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_CurveRotationOverride, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_TrackMovementConfig
{
UFUNCTION()
bool HasTrackMovementConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_TrackMovementConfig);
}
FC_TrackMovementConfig& AssignTrackMovementConfig(const FECSEntity &inout Entity, const FC_TrackMovementConfig &inout DefaultValue = FC_TrackMovementConfig())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_TrackMovementConfig, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignTrackMovementConfig_BP(const FECSEntity &inout Entity, const FC_TrackMovementConfig &inout DefaultValue = FC_TrackMovementConfig())
{
    ECSFunc_FC_TrackMovementConfig::AssignTrackMovementConfig(Entity, DefaultValue);
    return;
}
FC_TrackMovementConfig& ModifyTrackMovementConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_TrackMovementConfig));
    return local_12.GetComp();
}
FC_TrackMovementConfig& ModifyOrAddTrackMovementConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_TrackMovementConfig));
    return local_12.GetComp();
}
const FC_TrackMovementConfig& GetTrackMovementConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_TrackMovementConfig));
    return local_12.GetComp();
}
UFUNCTION()
FC_TrackMovementConfig GetTrackMovementConfig_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_TrackMovementConfig __r;
    bValid = false;
    bValid = ECSFunc_FC_TrackMovementConfig::GetTrackMovementConfig(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_TrackMovementConfig GetDefaultedTrackMovementConfig(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_TrackMovementConfig __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_TrackMovementConfig);
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
FC_TrackMovementConfig GetDefaultedTrackMovementConfig_BP(const FECSEntity &inout Entity)
{
    FC_TrackMovementConfig __r;
    return __r;
}
UFUNCTION()
bool RemoveTrackMovementConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_TrackMovementConfig);
}
}
FECSMonitorRuntimeView __GetMonitorTrackMovementConfigOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_TrackMovementConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorTrackMovementConfigOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_TrackMovementConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorTrackMovementConfigOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_TrackMovementConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorTrackMovementConfigOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_TrackMovementConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorTrackMovementConfigOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_TrackMovementConfig, bFixedFrame, bMustHandleAll);
}
void __MonitorTrackMovementConfigLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_TrackMovementConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorTrackMovementConfigActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_TrackMovementConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorTrackMovementConfigModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_TrackMovementConfig, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_TrackMovementOverride
{
UFUNCTION()
bool HasTrackMovementOverride(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_TrackMovementOverride);
}
FC_TrackMovementOverride& AssignTrackMovementOverride(const FECSEntity &inout Entity, const FC_TrackMovementOverride &inout DefaultValue = FC_TrackMovementOverride())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_TrackMovementOverride, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignTrackMovementOverride_BP(const FECSEntity &inout Entity, const FC_TrackMovementOverride &inout DefaultValue = FC_TrackMovementOverride())
{
    ECSFunc_FC_TrackMovementOverride::AssignTrackMovementOverride(Entity, DefaultValue);
    return;
}
FC_TrackMovementOverride& ModifyTrackMovementOverride(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_TrackMovementOverride));
    return local_12.GetComp();
}
FC_TrackMovementOverride& ModifyOrAddTrackMovementOverride(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_TrackMovementOverride));
    return local_12.GetComp();
}
const FC_TrackMovementOverride& GetTrackMovementOverride(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_TrackMovementOverride));
    return local_12.GetComp();
}
UFUNCTION()
FC_TrackMovementOverride GetTrackMovementOverride_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_TrackMovementOverride& local_4 = ECSFunc_FC_TrackMovementOverride::GetTrackMovementOverride(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_TrackMovementOverride();
}
const FC_TrackMovementOverride GetDefaultedTrackMovementOverride(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_TrackMovementOverride __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_TrackMovementOverride);
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
FC_TrackMovementOverride GetDefaultedTrackMovementOverride_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_TrackMovementOverride::GetDefaultedTrackMovementOverride(Entity);
}
UFUNCTION()
bool RemoveTrackMovementOverride(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_TrackMovementOverride);
}
}
FECSMonitorRuntimeView __GetMonitorTrackMovementOverrideOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_TrackMovementOverride, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorTrackMovementOverrideOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_TrackMovementOverride, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorTrackMovementOverrideOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_TrackMovementOverride, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorTrackMovementOverrideOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_TrackMovementOverride, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorTrackMovementOverrideOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_TrackMovementOverride, bFixedFrame, bMustHandleAll);
}
void __MonitorTrackMovementOverrideLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_TrackMovementOverride, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorTrackMovementOverrideActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_TrackMovementOverride, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorTrackMovementOverrideModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_TrackMovementOverride, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_TrackRuntime
{
UFUNCTION()
bool HasTrackRuntime(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_TrackRuntime);
}
FC_TrackRuntime& AssignTrackRuntime(const FECSEntity &inout Entity, const FC_TrackRuntime &inout DefaultValue = FC_TrackRuntime())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_TrackRuntime, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignTrackRuntime_BP(const FECSEntity &inout Entity, const FC_TrackRuntime &inout DefaultValue = FC_TrackRuntime())
{
    ECSFunc_FC_TrackRuntime::AssignTrackRuntime(Entity, DefaultValue);
    return;
}
FC_TrackRuntime& ModifyTrackRuntime(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_TrackRuntime));
    return local_12.GetComp();
}
FC_TrackRuntime& ModifyOrAddTrackRuntime(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_TrackRuntime));
    return local_12.GetComp();
}
const FC_TrackRuntime& GetTrackRuntime(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_TrackRuntime));
    return local_12.GetComp();
}
UFUNCTION()
FC_TrackRuntime GetTrackRuntime_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_TrackRuntime& local_4 = ECSFunc_FC_TrackRuntime::GetTrackRuntime(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_TrackRuntime();
}
const FC_TrackRuntime GetDefaultedTrackRuntime(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_TrackRuntime __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_TrackRuntime);
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
FC_TrackRuntime GetDefaultedTrackRuntime_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_TrackRuntime::GetDefaultedTrackRuntime(Entity);
}
UFUNCTION()
bool RemoveTrackRuntime(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_TrackRuntime);
}
}
FECSMonitorRuntimeView __GetMonitorTrackRuntimeOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_TrackRuntime, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorTrackRuntimeOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_TrackRuntime, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorTrackRuntimeOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_TrackRuntime, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorTrackRuntimeOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_TrackRuntime, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorTrackRuntimeOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_TrackRuntime, bFixedFrame, bMustHandleAll);
}
void __MonitorTrackRuntimeLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_TrackRuntime, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorTrackRuntimeActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_TrackRuntime, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorTrackRuntimeModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_TrackRuntime, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_OrbitMovementRuntime
{
UFUNCTION()
bool HasOrbitMovementRuntime(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_OrbitMovementRuntime);
}
FC_OrbitMovementRuntime& AssignOrbitMovementRuntime(const FECSEntity &inout Entity, const FC_OrbitMovementRuntime &inout DefaultValue = FC_OrbitMovementRuntime())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_OrbitMovementRuntime, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignOrbitMovementRuntime_BP(const FECSEntity &inout Entity, const FC_OrbitMovementRuntime &inout DefaultValue = FC_OrbitMovementRuntime())
{
    ECSFunc_FC_OrbitMovementRuntime::AssignOrbitMovementRuntime(Entity, DefaultValue);
    return;
}
FC_OrbitMovementRuntime& ModifyOrbitMovementRuntime(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_OrbitMovementRuntime));
    return local_12.GetComp();
}
FC_OrbitMovementRuntime& ModifyOrAddOrbitMovementRuntime(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_OrbitMovementRuntime));
    return local_12.GetComp();
}
const FC_OrbitMovementRuntime& GetOrbitMovementRuntime(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_OrbitMovementRuntime));
    return local_12.GetComp();
}
UFUNCTION()
FC_OrbitMovementRuntime GetOrbitMovementRuntime_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_OrbitMovementRuntime& local_4 = ECSFunc_FC_OrbitMovementRuntime::GetOrbitMovementRuntime(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_OrbitMovementRuntime();
}
const FC_OrbitMovementRuntime GetDefaultedOrbitMovementRuntime(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_OrbitMovementRuntime __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_OrbitMovementRuntime);
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
FC_OrbitMovementRuntime GetDefaultedOrbitMovementRuntime_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_OrbitMovementRuntime::GetDefaultedOrbitMovementRuntime(Entity);
}
UFUNCTION()
bool RemoveOrbitMovementRuntime(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_OrbitMovementRuntime);
}
}
FECSMonitorRuntimeView __GetMonitorOrbitMovementRuntimeOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_OrbitMovementRuntime, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorOrbitMovementRuntimeOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_OrbitMovementRuntime, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorOrbitMovementRuntimeOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_OrbitMovementRuntime, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorOrbitMovementRuntimeOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_OrbitMovementRuntime, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorOrbitMovementRuntimeOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_OrbitMovementRuntime, bFixedFrame, bMustHandleAll);
}
void __MonitorOrbitMovementRuntimeLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_OrbitMovementRuntime, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorOrbitMovementRuntimeActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_OrbitMovementRuntime, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorOrbitMovementRuntimeModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_OrbitMovementRuntime, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_FixedDurationMovementConfig
{
UFUNCTION()
bool HasFixedDurationMovementConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_FixedDurationMovementConfig);
}
FC_FixedDurationMovementConfig& AssignFixedDurationMovementConfig(const FECSEntity &inout Entity, const FC_FixedDurationMovementConfig &inout DefaultValue = FC_FixedDurationMovementConfig())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_FixedDurationMovementConfig, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignFixedDurationMovementConfig_BP(const FECSEntity &inout Entity, const FC_FixedDurationMovementConfig &inout DefaultValue = FC_FixedDurationMovementConfig())
{
    ECSFunc_FC_FixedDurationMovementConfig::AssignFixedDurationMovementConfig(Entity, DefaultValue);
    return;
}
FC_FixedDurationMovementConfig& ModifyFixedDurationMovementConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_FixedDurationMovementConfig));
    return local_12.GetComp();
}
FC_FixedDurationMovementConfig& ModifyOrAddFixedDurationMovementConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_FixedDurationMovementConfig));
    return local_12.GetComp();
}
const FC_FixedDurationMovementConfig& GetFixedDurationMovementConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_FixedDurationMovementConfig));
    return local_12.GetComp();
}
UFUNCTION()
FC_FixedDurationMovementConfig GetFixedDurationMovementConfig_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_FixedDurationMovementConfig __r;
    bValid = false;
    bValid = ECSFunc_FC_FixedDurationMovementConfig::GetFixedDurationMovementConfig(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_FixedDurationMovementConfig GetDefaultedFixedDurationMovementConfig(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_FixedDurationMovementConfig __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_FixedDurationMovementConfig);
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
FC_FixedDurationMovementConfig GetDefaultedFixedDurationMovementConfig_BP(const FECSEntity &inout Entity)
{
    FC_FixedDurationMovementConfig __r;
    return __r;
}
UFUNCTION()
bool RemoveFixedDurationMovementConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_FixedDurationMovementConfig);
}
}
FECSMonitorRuntimeView __GetMonitorFixedDurationMovementConfigOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_FixedDurationMovementConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorFixedDurationMovementConfigOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_FixedDurationMovementConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorFixedDurationMovementConfigOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_FixedDurationMovementConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorFixedDurationMovementConfigOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_FixedDurationMovementConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorFixedDurationMovementConfigOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_FixedDurationMovementConfig, bFixedFrame, bMustHandleAll);
}
void __MonitorFixedDurationMovementConfigLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_FixedDurationMovementConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorFixedDurationMovementConfigActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_FixedDurationMovementConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorFixedDurationMovementConfigModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_FixedDurationMovementConfig, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_FixedDurationMovementOverride
{
UFUNCTION()
bool HasFixedDurationMovementOverride(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_FixedDurationMovementOverride);
}
FC_FixedDurationMovementOverride& AssignFixedDurationMovementOverride(const FECSEntity &inout Entity, const FC_FixedDurationMovementOverride &inout DefaultValue = FC_FixedDurationMovementOverride())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_FixedDurationMovementOverride, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignFixedDurationMovementOverride_BP(const FECSEntity &inout Entity, const FC_FixedDurationMovementOverride &inout DefaultValue = FC_FixedDurationMovementOverride())
{
    ECSFunc_FC_FixedDurationMovementOverride::AssignFixedDurationMovementOverride(Entity, DefaultValue);
    return;
}
FC_FixedDurationMovementOverride& ModifyFixedDurationMovementOverride(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_FixedDurationMovementOverride));
    return local_12.GetComp();
}
FC_FixedDurationMovementOverride& ModifyOrAddFixedDurationMovementOverride(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_FixedDurationMovementOverride));
    return local_12.GetComp();
}
const FC_FixedDurationMovementOverride& GetFixedDurationMovementOverride(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_FixedDurationMovementOverride));
    return local_12.GetComp();
}
UFUNCTION()
FC_FixedDurationMovementOverride GetFixedDurationMovementOverride_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_FixedDurationMovementOverride& local_4 = ECSFunc_FC_FixedDurationMovementOverride::GetFixedDurationMovementOverride(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_FixedDurationMovementOverride();
}
const FC_FixedDurationMovementOverride GetDefaultedFixedDurationMovementOverride(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_FixedDurationMovementOverride __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_FixedDurationMovementOverride);
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
FC_FixedDurationMovementOverride GetDefaultedFixedDurationMovementOverride_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_FixedDurationMovementOverride::GetDefaultedFixedDurationMovementOverride(Entity);
}
UFUNCTION()
bool RemoveFixedDurationMovementOverride(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_FixedDurationMovementOverride);
}
}
FECSMonitorRuntimeView __GetMonitorFixedDurationMovementOverrideOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_FixedDurationMovementOverride, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorFixedDurationMovementOverrideOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_FixedDurationMovementOverride, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorFixedDurationMovementOverrideOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_FixedDurationMovementOverride, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorFixedDurationMovementOverrideOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_FixedDurationMovementOverride, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorFixedDurationMovementOverrideOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_FixedDurationMovementOverride, bFixedFrame, bMustHandleAll);
}
void __MonitorFixedDurationMovementOverrideLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_FixedDurationMovementOverride, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorFixedDurationMovementOverrideActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_FixedDurationMovementOverride, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorFixedDurationMovementOverrideModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_FixedDurationMovementOverride, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_FixedDurationMovementRuntime
{
UFUNCTION()
bool HasFixedDurationMovementRuntime(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_FixedDurationMovementRuntime);
}
FC_FixedDurationMovementRuntime& AssignFixedDurationMovementRuntime(const FECSEntity &inout Entity, const FC_FixedDurationMovementRuntime &inout DefaultValue = FC_FixedDurationMovementRuntime())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_FixedDurationMovementRuntime, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignFixedDurationMovementRuntime_BP(const FECSEntity &inout Entity, const FC_FixedDurationMovementRuntime &inout DefaultValue = FC_FixedDurationMovementRuntime())
{
    ECSFunc_FC_FixedDurationMovementRuntime::AssignFixedDurationMovementRuntime(Entity, DefaultValue);
    return;
}
FC_FixedDurationMovementRuntime& ModifyFixedDurationMovementRuntime(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_FixedDurationMovementRuntime));
    return local_12.GetComp();
}
FC_FixedDurationMovementRuntime& ModifyOrAddFixedDurationMovementRuntime(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_FixedDurationMovementRuntime));
    return local_12.GetComp();
}
const FC_FixedDurationMovementRuntime& GetFixedDurationMovementRuntime(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_FixedDurationMovementRuntime));
    return local_12.GetComp();
}
UFUNCTION()
FC_FixedDurationMovementRuntime GetFixedDurationMovementRuntime_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_FixedDurationMovementRuntime __r;
    bValid = false;
    bValid = ECSFunc_FC_FixedDurationMovementRuntime::GetFixedDurationMovementRuntime(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_FixedDurationMovementRuntime GetDefaultedFixedDurationMovementRuntime(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_FixedDurationMovementRuntime __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_FixedDurationMovementRuntime);
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
FC_FixedDurationMovementRuntime GetDefaultedFixedDurationMovementRuntime_BP(const FECSEntity &inout Entity)
{
    FC_FixedDurationMovementRuntime __r;
    return __r;
}
UFUNCTION()
bool RemoveFixedDurationMovementRuntime(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_FixedDurationMovementRuntime);
}
}
FECSMonitorRuntimeView __GetMonitorFixedDurationMovementRuntimeOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_FixedDurationMovementRuntime, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorFixedDurationMovementRuntimeOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_FixedDurationMovementRuntime, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorFixedDurationMovementRuntimeOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_FixedDurationMovementRuntime, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorFixedDurationMovementRuntimeOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_FixedDurationMovementRuntime, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorFixedDurationMovementRuntimeOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_FixedDurationMovementRuntime, bFixedFrame, bMustHandleAll);
}
void __MonitorFixedDurationMovementRuntimeLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_FixedDurationMovementRuntime, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorFixedDurationMovementRuntimeActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_FixedDurationMovementRuntime, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorFixedDurationMovementRuntimeModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_FixedDurationMovementRuntime, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_GravityFallingMovementRuntime
{
UFUNCTION()
bool HasGravityFallingMovementRuntime(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_GravityFallingMovementRuntime);
}
FC_GravityFallingMovementRuntime& AssignGravityFallingMovementRuntime(const FECSEntity &inout Entity, const FC_GravityFallingMovementRuntime &inout DefaultValue = FC_GravityFallingMovementRuntime())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_GravityFallingMovementRuntime, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignGravityFallingMovementRuntime_BP(const FECSEntity &inout Entity, const FC_GravityFallingMovementRuntime &inout DefaultValue = FC_GravityFallingMovementRuntime())
{
    ECSFunc_FC_GravityFallingMovementRuntime::AssignGravityFallingMovementRuntime(Entity, DefaultValue);
    return;
}
FC_GravityFallingMovementRuntime& ModifyGravityFallingMovementRuntime(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_GravityFallingMovementRuntime));
    return local_12.GetComp();
}
FC_GravityFallingMovementRuntime& ModifyOrAddGravityFallingMovementRuntime(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_GravityFallingMovementRuntime));
    return local_12.GetComp();
}
const FC_GravityFallingMovementRuntime& GetGravityFallingMovementRuntime(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_GravityFallingMovementRuntime));
    return local_12.GetComp();
}
UFUNCTION()
FC_GravityFallingMovementRuntime GetGravityFallingMovementRuntime_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_GravityFallingMovementRuntime& local_4 = ECSFunc_FC_GravityFallingMovementRuntime::GetGravityFallingMovementRuntime(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_GravityFallingMovementRuntime();
}
const FC_GravityFallingMovementRuntime GetDefaultedGravityFallingMovementRuntime(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_GravityFallingMovementRuntime __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_GravityFallingMovementRuntime);
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
FC_GravityFallingMovementRuntime GetDefaultedGravityFallingMovementRuntime_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_GravityFallingMovementRuntime::GetDefaultedGravityFallingMovementRuntime(Entity);
}
UFUNCTION()
bool RemoveGravityFallingMovementRuntime(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_GravityFallingMovementRuntime);
}
}
FECSMonitorRuntimeView __GetMonitorGravityFallingMovementRuntimeOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_GravityFallingMovementRuntime, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorGravityFallingMovementRuntimeOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_GravityFallingMovementRuntime, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorGravityFallingMovementRuntimeOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_GravityFallingMovementRuntime, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorGravityFallingMovementRuntimeOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_GravityFallingMovementRuntime, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorGravityFallingMovementRuntimeOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_GravityFallingMovementRuntime, bFixedFrame, bMustHandleAll);
}
void __MonitorGravityFallingMovementRuntimeLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_GravityFallingMovementRuntime, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorGravityFallingMovementRuntimeActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_GravityFallingMovementRuntime, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorGravityFallingMovementRuntimeModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_GravityFallingMovementRuntime, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_GroundMovementConfig
{
UFUNCTION()
bool HasGroundMovementConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_GroundMovementConfig);
}
FC_GroundMovementConfig& AssignGroundMovementConfig(const FECSEntity &inout Entity, const FC_GroundMovementConfig &inout DefaultValue = FC_GroundMovementConfig())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_GroundMovementConfig, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignGroundMovementConfig_BP(const FECSEntity &inout Entity, const FC_GroundMovementConfig &inout DefaultValue = FC_GroundMovementConfig())
{
    ECSFunc_FC_GroundMovementConfig::AssignGroundMovementConfig(Entity, DefaultValue);
    return;
}
FC_GroundMovementConfig& ModifyGroundMovementConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_GroundMovementConfig));
    return local_12.GetComp();
}
FC_GroundMovementConfig& ModifyOrAddGroundMovementConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_GroundMovementConfig));
    return local_12.GetComp();
}
const FC_GroundMovementConfig& GetGroundMovementConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_GroundMovementConfig));
    return local_12.GetComp();
}
UFUNCTION()
FC_GroundMovementConfig GetGroundMovementConfig_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_GroundMovementConfig __r;
    bValid = false;
    bValid = ECSFunc_FC_GroundMovementConfig::GetGroundMovementConfig(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_GroundMovementConfig GetDefaultedGroundMovementConfig(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_GroundMovementConfig __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_GroundMovementConfig);
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
FC_GroundMovementConfig GetDefaultedGroundMovementConfig_BP(const FECSEntity &inout Entity)
{
    FC_GroundMovementConfig __r;
    return __r;
}
UFUNCTION()
bool RemoveGroundMovementConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_GroundMovementConfig);
}
}
FECSMonitorRuntimeView __GetMonitorGroundMovementConfigOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_GroundMovementConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorGroundMovementConfigOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_GroundMovementConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorGroundMovementConfigOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_GroundMovementConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorGroundMovementConfigOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_GroundMovementConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorGroundMovementConfigOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_GroundMovementConfig, bFixedFrame, bMustHandleAll);
}
void __MonitorGroundMovementConfigLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_GroundMovementConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorGroundMovementConfigActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_GroundMovementConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorGroundMovementConfigModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_GroundMovementConfig, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_GroundMovementOverride
{
UFUNCTION()
bool HasGroundMovementOverride(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_GroundMovementOverride);
}
FC_GroundMovementOverride& AssignGroundMovementOverride(const FECSEntity &inout Entity, const FC_GroundMovementOverride &inout DefaultValue = FC_GroundMovementOverride())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_GroundMovementOverride, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignGroundMovementOverride_BP(const FECSEntity &inout Entity, const FC_GroundMovementOverride &inout DefaultValue = FC_GroundMovementOverride())
{
    ECSFunc_FC_GroundMovementOverride::AssignGroundMovementOverride(Entity, DefaultValue);
    return;
}
FC_GroundMovementOverride& ModifyGroundMovementOverride(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_GroundMovementOverride));
    return local_12.GetComp();
}
FC_GroundMovementOverride& ModifyOrAddGroundMovementOverride(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_GroundMovementOverride));
    return local_12.GetComp();
}
const FC_GroundMovementOverride& GetGroundMovementOverride(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_GroundMovementOverride));
    return local_12.GetComp();
}
UFUNCTION()
FC_GroundMovementOverride GetGroundMovementOverride_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_GroundMovementOverride& local_4 = ECSFunc_FC_GroundMovementOverride::GetGroundMovementOverride(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_GroundMovementOverride();
}
const FC_GroundMovementOverride GetDefaultedGroundMovementOverride(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_GroundMovementOverride __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_GroundMovementOverride);
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
FC_GroundMovementOverride GetDefaultedGroundMovementOverride_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_GroundMovementOverride::GetDefaultedGroundMovementOverride(Entity);
}
UFUNCTION()
bool RemoveGroundMovementOverride(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_GroundMovementOverride);
}
}
FECSMonitorRuntimeView __GetMonitorGroundMovementOverrideOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_GroundMovementOverride, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorGroundMovementOverrideOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_GroundMovementOverride, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorGroundMovementOverrideOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_GroundMovementOverride, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorGroundMovementOverrideOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_GroundMovementOverride, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorGroundMovementOverrideOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_GroundMovementOverride, bFixedFrame, bMustHandleAll);
}
void __MonitorGroundMovementOverrideLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_GroundMovementOverride, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorGroundMovementOverrideActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_GroundMovementOverride, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorGroundMovementOverrideModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_GroundMovementOverride, bFixedFrame, Details);
    return;
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_MovementInfo &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_MovementInfo &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_MovementInfo &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_MovementInfo
{
int __IndexOf_MoveBeginTime()
{
    return 0;
}
int __IndexOf_MoveTotalTime()
{
    return 1;
}
int __IndexOf_MoveTime()
{
    return 2;
}
int __IndexOf_LastMoveTime()
{
    return 3;
}
int __IndexOf_Velocity()
{
    return 4;
}
int __IndexOf_InitRotation()
{
    return 5;
}
int __IndexOf_bModifyVelocityInTick()
{
    return 6;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_MovementEndAbilitySignal &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_MovementEndAbilitySignal &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_MovementEndAbilitySignal &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_MovementEndAbilitySignal
{
int __IndexOf_NotifyEntity()
{
    return 0;
}
int __IndexOf_AbilityClass()
{
    return 1;
}
int __IndexOf_SignalName()
{
    return 2;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_MovementEndEventToESMTriggerFilterSignal &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_MovementEndEventToESMTriggerFilterSignal &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_MovementEndEventToESMTriggerFilterSignal &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_MovementEndEventToESMTriggerFilterSignal
{
int __IndexOf_NotifyEntity()
{
    return 0;
}
int __IndexOf_EventName()
{
    return 1;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_LinearMovementOverride &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_LinearMovementOverride &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_LinearMovementOverride &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_LinearMovementOverride
{
int __IndexOf_Velocity()
{
    return 0;
}
int __IndexOf_bRotateToMoveDir()
{
    return 1;
}
}
namespace AutoDelta
{
FSubDirtyFlags8 GetDirtyFlags(FSimpleProjectileMovementConfigData &inout Data)
{
    FSubDirtyFlags8 __r;
    return __r;
}
void ClearDirtyFlags(FSimpleProjectileMovementConfigData &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FSimpleProjectileMovementConfigData
{
int __IndexOf_bPitchToMoveDir()
{
    return 0;
}
int __IndexOf_InitSpeed()
{
    return 1;
}
int __IndexOf_GravityScale()
{
    return 2;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_SimpleProjectileMovementOverride &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_SimpleProjectileMovementOverride &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_SimpleProjectileMovementOverride &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_SimpleProjectileMovementOverride
{
int __IndexOf_Data()
{
    return 0;
}
}
namespace AutoDelta
{
FSubDirtyFlags8 GetDirtyFlags(FThrowMovementConfigData &inout Data)
{
    FSubDirtyFlags8 __r;
    return __r;
}
void ClearDirtyFlags(FThrowMovementConfigData &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FThrowMovementConfigData
{
int __IndexOf_bPitchToMoveDir()
{
    return 0;
}
int __IndexOf_InitSpeed()
{
    return 1;
}
int __IndexOf_GravityScale()
{
    return 2;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_ThrowMovementOverride &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_ThrowMovementOverride &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_ThrowMovementOverride &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_ThrowMovementOverride
{
int __IndexOf_Data()
{
    return 0;
}
}
namespace AutoDelta
{
FSubDirtyFlags16 GetDirtyFlags(FProjectileMovementCalculationData &inout Data)
{
    FSubDirtyFlags16 __r;
    return __r;
}
void ClearDirtyFlags(FProjectileMovementCalculationData &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FProjectileMovementCalculationData
{
int __IndexOf_Target()
{
    return 0;
}
int __IndexOf_AimAtEntityBBHandle()
{
    return 1;
}
int __IndexOf_AimAtEntityBBOffset()
{
    return 2;
}
int __IndexOf_WorldPosition()
{
    return 3;
}
int __IndexOf_Method()
{
    return 4;
}
int __IndexOf_bAddRotationOnResult()
{
    return 5;
}
int __IndexOf_OverrideMoveTime()
{
    return 6;
}
int __IndexOf_MinDistance()
{
    return 7;
}
int __IndexOf_MaxDistance()
{
    return 8;
}
int __IndexOf_AddtionalPitchWithoutTarget()
{
    return 9;
}
}
namespace AutoDelta
{
FSubDirtyFlags16 GetDirtyFlags(FProjectileMovementCalculationRuntimeData &inout Data)
{
    FSubDirtyFlags16 __r;
    return __r;
}
void ClearDirtyFlags(FProjectileMovementCalculationRuntimeData &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FProjectileMovementCalculationRuntimeData
{
int __IndexOf_Config()
{
    return 0;
}
int __IndexOf_TargetType()
{
    return 10;
}
int __IndexOf_AdditionalRotation()
{
    return 11;
}
int __IndexOf_TargetPosition()
{
    return 12;
}
int __IndexOf_TargetEntity()
{
    return 13;
}
}
namespace AutoDelta
{
FRootDirtyFlags16 GetDirtyFlags(FC_AutoCalcProjectileMovement &inout Data)
{
    FRootDirtyFlags16 __r;
    return __r;
}
void InitDirtyFlags(FC_AutoCalcProjectileMovement &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_AutoCalcProjectileMovement &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_AutoCalcProjectileMovement
{
int __IndexOf_Data()
{
    return 0;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_MovementByBVar &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_MovementByBVar &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_MovementByBVar &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_MovementByBVar
{
int __IndexOf_BBOwner()
{
    return 0;
}
int __IndexOf_PositionBBVar()
{
    return 1;
}
int __IndexOf_RotationBBVar()
{
    return 2;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_RelativeMovement &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_RelativeMovement &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_RelativeMovement &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_RelativeMovement
{
int __IndexOf_ReletiveParentEntity()
{
    return 0;
}
int __IndexOf_LastParentPos()
{
    return 1;
}
int __IndexOf_LastParentRot()
{
    return 2;
}
int __IndexOf_bMoveFollowParentRotation()
{
    return 3;
}
int __IndexOf_bDirectionFollowParentRotation()
{
    return 4;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_RelativeMovementEnableByTime &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_RelativeMovementEnableByTime &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_RelativeMovementEnableByTime &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_RelativeMovementEnableByTime
{
int __IndexOf_TimeEnablePairs()
{
    return 0;
}
int __IndexOf_ReletiveParentEntity()
{
    return 1;
}
int __IndexOf_bMoveFollowParentRotation()
{
    return 2;
}
int __IndexOf_bDirectionFollowParentRotation()
{
    return 3;
}
}
namespace AutoDelta
{
FSubDirtyFlags8 GetDirtyFlags(FCurveMovementConfigData &inout Data)
{
    FSubDirtyFlags8 __r;
    return __r;
}
void ClearDirtyFlags(FCurveMovementConfigData &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FCurveMovementConfigData
{
int __IndexOf_CurveValueType()
{
    return 0;
}
int __IndexOf_MovementCurve()
{
    return 1;
}
int __IndexOf_bRotateCurveByForwardDirection()
{
    return 2;
}
int __IndexOf_bRotateEntityToMoveDirection()
{
    return 3;
}
int __IndexOf_bScaleHeight()
{
    return 4;
}
int __IndexOf_CurveScaleRatio()
{
    return 5;
}
int __IndexOf_CurveTotalTime()
{
    return 6;
}
}
namespace AutoDelta
{
FRootDirtyFlags16 GetDirtyFlags(FC_CurveMovementOverride &inout Data)
{
    FRootDirtyFlags16 __r;
    return __r;
}
void InitDirtyFlags(FC_CurveMovementOverride &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_CurveMovementOverride &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_CurveMovementOverride
{
int __IndexOf_Data()
{
    return 0;
}
int __IndexOf_bUseCustomSampleTime()
{
    return 7;
}
int __IndexOf_SampleTime()
{
    return 8;
}
int __IndexOf_SampleLastTime()
{
    return 9;
}
int __IndexOf_DelaySampleTime()
{
    return 10;
}
int __IndexOf_FirstSampleTime()
{
    return 11;
}
int __IndexOf_KeepMoveAfterExit()
{
    return 12;
}
int __IndexOf_CurveRotationFollowEntity()
{
    return 13;
}
}
namespace AutoDelta
{
FSubDirtyFlags8 GetDirtyFlags(FCurveRotationConfigData &inout Data)
{
    FSubDirtyFlags8 __r;
    return __r;
}
void ClearDirtyFlags(FCurveRotationConfigData &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FCurveRotationConfigData
{
int __IndexOf_CurveValueType()
{
    return 0;
}
int __IndexOf_Curve()
{
    return 1;
}
int __IndexOf_CurveScaleRatio()
{
    return 2;
}
int __IndexOf_CurveTotalTime()
{
    return 3;
}
}
namespace AutoDelta
{
FRootDirtyFlags16 GetDirtyFlags(FC_CurveRotationOverride &inout Data)
{
    FRootDirtyFlags16 __r;
    return __r;
}
void InitDirtyFlags(FC_CurveRotationOverride &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_CurveRotationOverride &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_CurveRotationOverride
{
int __IndexOf_Data()
{
    return 0;
}
int __IndexOf_bUseCustomSampleTime()
{
    return 4;
}
int __IndexOf_SampleTime()
{
    return 5;
}
int __IndexOf_SampleLastTime()
{
    return 6;
}
int __IndexOf_DelaySampleTime()
{
    return 7;
}
int __IndexOf_FirstSampleTime()
{
    return 8;
}
int __IndexOf_KeepMoveAfterExit()
{
    return 9;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_TrackMovementOverride &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_TrackMovementOverride &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_TrackMovementOverride &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_TrackMovementOverride
{
int __IndexOf_DataPtr()
{
    return 0;
}
}
namespace AutoDelta
{
FRootDirtyFlags16 GetDirtyFlags(FC_TrackRuntime &inout Data)
{
    FRootDirtyFlags16 __r;
    return __r;
}
void InitDirtyFlags(FC_TrackRuntime &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_TrackRuntime &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_TrackRuntime
{
int __IndexOf_TrackType()
{
    return 0;
}
int __IndexOf_bTrackEnd()
{
    return 1;
}
int __IndexOf_bTrackSuccess()
{
    return 2;
}
int __IndexOf_TrackTime()
{
    return 3;
}
int __IndexOf_TrackPos()
{
    return 4;
}
int __IndexOf_TrackTarget()
{
    return 5;
}
int __IndexOf_TrackTargetOffset()
{
    return 6;
}
int __IndexOf_LastTargetPosition()
{
    return 7;
}
int __IndexOf_TrackTargetHistoryPosConfig()
{
    return 8;
}
int __IndexOf_TrackEntitySocket()
{
    return 9;
}
int __IndexOf_bHasTriggerTrackReachEvent()
{
    return 10;
}
}
namespace AutoDelta
{
FRootDirtyFlags64 GetDirtyFlags(FC_OrbitMovementRuntime &inout Data)
{
    FRootDirtyFlags64 __r;
    return __r;
}
void InitDirtyFlags(FC_OrbitMovementRuntime &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_OrbitMovementRuntime &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_OrbitMovementRuntime
{
int __IndexOf_bStopWhenReachCenter()
{
    return 0;
}
int __IndexOf_bKeepRelativePosAfterTargetEntityMove()
{
    return 1;
}
int __IndexOf_bRotateToCircleTangentDir()
{
    return 2;
}
int __IndexOf_bAxisMoveToTargetPlane()
{
    return 3;
}
int __IndexOf_bAutoCalcAxisVelocity()
{
    return 4;
}
int __IndexOf_TargetType()
{
    return 5;
}
int __IndexOf_CurDistanceToCenter()
{
    return 6;
}
int __IndexOf_CurAngle()
{
    return 7;
}
int __IndexOf_CentripetalVelocity()
{
    return 8;
}
int __IndexOf_AxisVelocity()
{
    return 15;
}
int __IndexOf_AngleVelocity()
{
    return 22;
}
int __IndexOf_Axis()
{
    return 29;
}
int __IndexOf_TargetPos()
{
    return 30;
}
int __IndexOf_TargetEntity()
{
    return 31;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_FixedDurationMovementOverride &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_FixedDurationMovementOverride &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_FixedDurationMovementOverride &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_FixedDurationMovementOverride
{
int __IndexOf_Data()
{
    return 0;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_GravityFallingMovementRuntime &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_GravityFallingMovementRuntime &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_GravityFallingMovementRuntime &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_GravityFallingMovementRuntime
{
int __IndexOf_GravityScale()
{
    return 0;
}
}
namespace AutoDelta
{
FSubDirtyFlags8 GetDirtyFlags(FGroundMovementConfigData &inout Data)
{
    FSubDirtyFlags8 __r;
    return __r;
}
void ClearDirtyFlags(FGroundMovementConfigData &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FGroundMovementConfigData
{
int __IndexOf_MaxInclinationUpAngle()
{
    return 0;
}
int __IndexOf_MaxInclinationDownAngle()
{
    return 1;
}
int __IndexOf_HeightFromGround()
{
    return 2;
}
int __IndexOf_GroundMovementOrientationMode()
{
    return 3;
}
int __IndexOf_GroundMoveBlockMode()
{
    return 4;
}
int __IndexOf_bDestroyWhenMoveBlocked()
{
    return 5;
}
int __IndexOf_bTriggerEventWhenMoveBlocked()
{
    return 6;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_GroundMovementOverride &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_GroundMovementOverride &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_GroundMovementOverride &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_GroundMovementOverride
{
int __IndexOf_Data()
{
    return 0;
}
}
