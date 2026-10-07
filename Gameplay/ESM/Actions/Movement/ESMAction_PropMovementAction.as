
enum EPropFacingType_EntityBBVar
{
    PropForward,
    CameraForward,
    PlayerForward,
    CustomLocal,
}

enum EPropFacingType_Self
{
    PropForward,
    CustomLocal,
}

enum EPropMovementHitSceneEventProcessMode
{
    HandleByAbility,
    HandleByEventToESMTriggerFilter,
}

enum EPropMovementTargetEntity
{
    Self,
    EntityBBVar,
}

enum EPropMovementCollisionCheckMode
{
    ObjectTypeMask,
    CollisionChannel,
}


// NOTE: class defaults are not authored in this module: UESMAction_PropMovementAction (default scalar field UESMAction.NetTriggerMode has no declared value type; load the matching Binds.Cache to author this module's defaults, or rerun with --force to use unverified Binds.Cache types (the result may be wrong)).
// They are carried over byte-exact when this module is recompiled.

struct FESMPropMovementInstanceData
{
    UPROPERTY()
    FECSEntity PropEntity;
    UPROPERTY()
    FVector LastPosition;
    UPROPERTY()
    FQuat LastRotation;
    UPROPERTY()
    bool bTriggerHitSceneSKill = false;


}

struct FPropMovementExtraConfig
{
    FSubDirtyFlags32 __DirtyFlags;
    UPROPERTY()
    bool m_bHitSceneEvent;
    UPROPERTY()
    EPropMovementHitSceneEventProcessMode m_HitSceneEventProcessMode;
    UPROPERTY()
    TSoftClassPtr<UEASAbility> m_HitSceneAbilityClass;
    UPROPERTY()
    FName m_HitSceneEventName;
    UPROPERTY()
    bool m_bEndMovementWhenHitScene;
    UPROPERTY()
    EPropMovementCollisionCheckMode m_PropMovementCollisionCheckMode;
    UPROPERTY()
    bool m_bCollisionCheckIncludeDynamic;
    UPROPERTY()
    TArray<FNameHandle_EntityBBVarEntity> m_AdditionalIgnoreEntityEBBs;
    UPROPERTY()
    FObjectTypeMask m_ObjectTypeMask;
    UPROPERTY()
    ECollisionChannel m_CollisionChannel;
    UPROPERTY()
    bool m_bIncludeOverlapCollisionResponse;
    UPROPERTY()
    bool m_bAdjustToNonPenetratePositionWhenHit;
    UPROPERTY()
    float32 m_NonPenetrateSkinOffset;
    UPROPERTY()
    bool m_bMovementEndEvent;
    UPROPERTY()
    EPropMovementHitSceneEventProcessMode m_MovementEndProcessMode;
    UPROPERTY()
    TSoftClassPtr<UEASAbility> m_MovementEndAbilityClass;
    UPROPERTY()
    FName m_MovementEndSignalName;
    UPROPERTY()
    FName m_MovementEndEventName;

    FPropMovementExtraConfig()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FPropMovementExtraConfig(const FPropMovementExtraConfig &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FPropMovementExtraConfig opAssign(const FPropMovementExtraConfig &inout Other)
    {
        FPropMovementExtraConfig __r;
        this.SetbHitSceneEvent(Other.GetbHitSceneEvent());
        this.SetHitSceneEventProcessMode(Other.GetHitSceneEventProcessMode());
        this.SetHitSceneAbilityClass(Other.GetHitSceneAbilityClass());
        this.SetHitSceneEventName(Other.GetHitSceneEventName());
        this.SetbEndMovementWhenHitScene(Other.GetbEndMovementWhenHitScene());
        this.SetPropMovementCollisionCheckMode(Other.GetPropMovementCollisionCheckMode());
        this.SetbCollisionCheckIncludeDynamic(Other.GetbCollisionCheckIncludeDynamic());
        this.SetAdditionalIgnoreEntityEBBs(Other.GetAdditionalIgnoreEntityEBBs());
        this.SetObjectTypeMask(Other.GetObjectTypeMask());
        this.SetCollisionChannel(Other.GetCollisionChannel());
        this.SetbIncludeOverlapCollisionResponse(Other.GetbIncludeOverlapCollisionResponse());
        this.SetbAdjustToNonPenetratePositionWhenHit(Other.GetbAdjustToNonPenetratePositionWhenHit());
        this.SetNonPenetrateSkinOffset(Other.GetNonPenetrateSkinOffset());
        this.SetbMovementEndEvent(Other.GetbMovementEndEvent());
        this.SetMovementEndProcessMode(Other.GetMovementEndProcessMode());
        this.SetMovementEndAbilityClass(Other.GetMovementEndAbilityClass());
        this.SetMovementEndSignalName(Other.GetMovementEndSignalName());
        this.SetMovementEndEventName(Other.GetMovementEndEventName());
        return __r;
    }
    bool GetbHitSceneEvent() const property
    {
        return this.m_bHitSceneEvent;
    }
    void SetbHitSceneEvent(const bool __Value) property
    {
        if (!(this.m_bHitSceneEvent) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_bHitSceneEvent = __Value;
        return;
    }
    EPropMovementHitSceneEventProcessMode GetHitSceneEventProcessMode() const property
    {
        return this.m_HitSceneEventProcessMode;
    }
    void SetHitSceneEventProcessMode(const EPropMovementHitSceneEventProcessMode __Value) property
    {
        if (int(this.m_HitSceneEventProcessMode) == int(__Value))
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_HitSceneEventProcessMode = __Value;
        return;
    }
    const TSoftClassPtr<UEASAbility> GetHitSceneAbilityClass() const property
    {
        const TSoftClassPtr<UEASAbility> __r;
        return __r;
    }
    TSoftClassPtr<UEASAbility> GetModify_HitSceneAbilityClass() property
    {
        TSoftClassPtr<UEASAbility> __r;
        this.__MarkDirty(2);
        return __r;
    }
    void SetHitSceneAbilityClass(const TSoftClassPtr<UEASAbility> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_HitSceneAbilityClass = __Value;
        return;
    }
    FName GetHitSceneEventName() const property
    {
        return this.m_HitSceneEventName;
    }
    void SetHitSceneEventName(const FName &inout __Value) property
    {
        if ((this.m_HitSceneEventName == __Value))
        {
            return;
        }
        this.__MarkDirty(3);
        this.m_HitSceneEventName = __Value;
        return;
    }
    bool GetbEndMovementWhenHitScene() const property
    {
        return this.m_bEndMovementWhenHitScene;
    }
    void SetbEndMovementWhenHitScene(const bool __Value) property
    {
        if (!(this.m_bEndMovementWhenHitScene) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(4);
        this.m_bEndMovementWhenHitScene = __Value;
        return;
    }
    EPropMovementCollisionCheckMode GetPropMovementCollisionCheckMode() const property
    {
        return this.m_PropMovementCollisionCheckMode;
    }
    void SetPropMovementCollisionCheckMode(const EPropMovementCollisionCheckMode __Value) property
    {
        if (int(this.m_PropMovementCollisionCheckMode) == int(__Value))
        {
            return;
        }
        this.__MarkDirty(5);
        this.m_PropMovementCollisionCheckMode = __Value;
        return;
    }
    bool GetbCollisionCheckIncludeDynamic() const property
    {
        return this.m_bCollisionCheckIncludeDynamic;
    }
    void SetbCollisionCheckIncludeDynamic(const bool __Value) property
    {
        if (!(this.m_bCollisionCheckIncludeDynamic) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(6);
        this.m_bCollisionCheckIncludeDynamic = __Value;
        return;
    }
    const TArray<FNameHandle_EntityBBVarEntity> GetAdditionalIgnoreEntityEBBs() const property
    {
        const TArray<FNameHandle_EntityBBVarEntity> __r;
        return __r;
    }
    TArray<FNameHandle_EntityBBVarEntity> GetModify_AdditionalIgnoreEntityEBBs() property
    {
        TArray<FNameHandle_EntityBBVarEntity> __r;
        this.__MarkDirty(7);
        return __r;
    }
    void SetAdditionalIgnoreEntityEBBs(const TArray<FNameHandle_EntityBBVarEntity> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(7);
        this.m_AdditionalIgnoreEntityEBBs = __Value;
        return;
    }
    const FObjectTypeMask GetObjectTypeMask() const property
    {
        const FObjectTypeMask __r;
        return __r;
    }
    FObjectTypeMask GetModify_ObjectTypeMask() property
    {
        FObjectTypeMask __r;
        this.__MarkDirty(8);
        return __r;
    }
    void SetObjectTypeMask(const FObjectTypeMask &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(8);
        this.m_ObjectTypeMask = __Value;
        return;
    }
    ECollisionChannel GetCollisionChannel() const property
    {
        return this.m_CollisionChannel;
    }
    void SetCollisionChannel(const ECollisionChannel __Value) property
    {
        if (int(this.m_CollisionChannel) == int(__Value))
        {
            return;
        }
        this.__MarkDirty(9);
        this.m_CollisionChannel = __Value;
        return;
    }
    bool GetbIncludeOverlapCollisionResponse() const property
    {
        return this.m_bIncludeOverlapCollisionResponse;
    }
    void SetbIncludeOverlapCollisionResponse(const bool __Value) property
    {
        if (!(this.m_bIncludeOverlapCollisionResponse) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(10);
        this.m_bIncludeOverlapCollisionResponse = __Value;
        return;
    }
    bool GetbAdjustToNonPenetratePositionWhenHit() const property
    {
        return this.m_bAdjustToNonPenetratePositionWhenHit;
    }
    void SetbAdjustToNonPenetratePositionWhenHit(const bool __Value) property
    {
        if (!(this.m_bAdjustToNonPenetratePositionWhenHit) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(11);
        this.m_bAdjustToNonPenetratePositionWhenHit = __Value;
        return;
    }
    float32 GetNonPenetrateSkinOffset() const property
    {
        return this.m_NonPenetrateSkinOffset;
    }
    void SetNonPenetrateSkinOffset(const float32 __Value) property
    {
        if (this.m_NonPenetrateSkinOffset == __Value)
        {
            return;
        }
        this.__MarkDirty(12);
        this.m_NonPenetrateSkinOffset = __Value;
        return;
    }
    bool GetbMovementEndEvent() const property
    {
        return this.m_bMovementEndEvent;
    }
    void SetbMovementEndEvent(const bool __Value) property
    {
        if (!(this.m_bMovementEndEvent) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(13);
        this.m_bMovementEndEvent = __Value;
        return;
    }
    EPropMovementHitSceneEventProcessMode GetMovementEndProcessMode() const property
    {
        return this.m_MovementEndProcessMode;
    }
    void SetMovementEndProcessMode(const EPropMovementHitSceneEventProcessMode __Value) property
    {
        if (int(this.m_MovementEndProcessMode) == int(__Value))
        {
            return;
        }
        this.__MarkDirty(14);
        this.m_MovementEndProcessMode = __Value;
        return;
    }
    const TSoftClassPtr<UEASAbility> GetMovementEndAbilityClass() const property
    {
        const TSoftClassPtr<UEASAbility> __r;
        return __r;
    }
    TSoftClassPtr<UEASAbility> GetModify_MovementEndAbilityClass() property
    {
        TSoftClassPtr<UEASAbility> __r;
        this.__MarkDirty(15);
        return __r;
    }
    void SetMovementEndAbilityClass(const TSoftClassPtr<UEASAbility> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(15);
        this.m_MovementEndAbilityClass = __Value;
        return;
    }
    FName GetMovementEndSignalName() const property
    {
        return this.m_MovementEndSignalName;
    }
    void SetMovementEndSignalName(const FName &inout __Value) property
    {
        if ((this.m_MovementEndSignalName == __Value))
        {
            return;
        }
        this.__MarkDirty(16);
        this.m_MovementEndSignalName = __Value;
        return;
    }
    FName GetMovementEndEventName() const property
    {
        return this.m_MovementEndEventName;
    }
    void SetMovementEndEventName(const FName &inout __Value) property
    {
        if ((this.m_MovementEndEventName == __Value))
        {
            return;
        }
        this.__MarkDirty(17);
        this.m_MovementEndEventName = __Value;
        return;
    }
}

class UESMAction_PropMovementAction : UESMBPBaseSpanAction
{
    UPROPERTY()
    EPropMovementTargetEntity TargetEntity = EPropMovementTargetEntity(1);
    UPROPERTY()
    FNameHandle_EntityBBVarEntity PropEntityBBVar;
    UPROPERTY()
    EPropFacingType_EntityBBVar FacingType_EntityBBVar = EPropFacingType_EntityBBVar(0);
    UPROPERTY()
    EPropFacingType_Self FacingType_Self = EPropFacingType_Self(0);
    UPROPERTY()
    FVector LocalFacingOffset;
    UPROPERTY()
    FVector LocalCustomFacingForward = FVector::ForwardVector;
    UPROPERTY()
    FPropMovementExtraConfig ExtraCheckConfig;
    UPROPERTY()
    bool bOverrideMovementConfigWithSimpleMovement = true;
    UPROPERTY()
    float32 InitSpeed = 500.0f;
    UPROPERTY()
    float32 GravityScale = 0.0f;
    UPROPERTY()
    bool bInstantAction = true;


    UFUNCTION()
    FESMInstanceDataInfo GetInstanceDataInfo_Implementation() const
    {
        return ESMInstanceData::MakeRuntimeInstanceDataInfo(FESMPropMovementInstanceData);
    }
    UFUNCTION()
    bool IsUseAsInstant_Implementation() const
    {
        return this.bInstantAction;
    }
    UFUNCTION()
    void Enter_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        if (ECS::GetRuntimeInfo().IsClient)
        {
            return;
        }
        FESMPropMovementInstanceData& local_4 = this.ModifyInstanceData(Context);
        local_4.PropEntity = ENTITY_NULL;
        int local_6 = int(this.TargetEntity);
        if (local_6 <= 1)
        {
            if (local_6 != 0)
            {
                if (local_6 != 1)
                {
                }
                else
                {
                    FNameHandle_EntityBBVarEntity local_12;
                    local_12;
                    local_4.PropEntity = Context.GetEntity().GetBB_Entity(local_12);
                }
            }
            else
            {
                local_4.PropEntity = Context.GetEntity();
            }
        }
        return;
    }
    UFUNCTION()
    void Exit_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        const FESMPropMovementInstanceData& local_4;
        int local_20 = 0;
        if (this.bInstantAction)
        {
            return;
        }
        if (!(local_4.PropEntity.IsValid()))
        {
            return;
        }
        if (this.bOverrideMovementConfigWithSimpleMovement)
        {
            Remove local_8;
            local_8.opCall();
        }
        if (this.ExtraCheckConfig.GetbHitSceneEvent() || this.ExtraCheckConfig.GetbEndMovementWhenHitScene())
        {
            Remove local_14;
            local_14.opCall();
        }
        if (local_20)
        {
            local_20.SetMoveTotalTime(FFPTime(0));
        }
        return;
    }
    FESMPropMovementInstanceData GetInstanceData(const FESMContext &inout Context) const
    {
        FESMPropMovementInstanceData __r;
        return __r;
    }
    FESMPropMovementInstanceData ModifyInstanceData(const FESMContext &inout Context) const
    {
        FESMPropMovementInstanceData __r;
        return __r;
    }
}

namespace AutoDelta
{
FSubDirtyFlags32 GetDirtyFlags(FPropMovementExtraConfig &inout Data)
{
    FSubDirtyFlags32 __r;
    return __r;
}
void ClearDirtyFlags(FPropMovementExtraConfig &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FPropMovementExtraConfig
{
int __IndexOf_bHitSceneEvent()
{
    return 0;
}
int __IndexOf_HitSceneEventProcessMode()
{
    return 1;
}
int __IndexOf_HitSceneAbilityClass()
{
    return 2;
}
int __IndexOf_HitSceneEventName()
{
    return 3;
}
int __IndexOf_bEndMovementWhenHitScene()
{
    return 4;
}
int __IndexOf_PropMovementCollisionCheckMode()
{
    return 5;
}
int __IndexOf_bCollisionCheckIncludeDynamic()
{
    return 6;
}
int __IndexOf_AdditionalIgnoreEntityEBBs()
{
    return 7;
}
int __IndexOf_ObjectTypeMask()
{
    return 8;
}
int __IndexOf_CollisionChannel()
{
    return 9;
}
int __IndexOf_bIncludeOverlapCollisionResponse()
{
    return 10;
}
int __IndexOf_bAdjustToNonPenetratePositionWhenHit()
{
    return 11;
}
int __IndexOf_NonPenetrateSkinOffset()
{
    return 12;
}
int __IndexOf_bMovementEndEvent()
{
    return 13;
}
int __IndexOf_MovementEndProcessMode()
{
    return 14;
}
int __IndexOf_MovementEndAbilityClass()
{
    return 15;
}
int __IndexOf_MovementEndSignalName()
{
    return 16;
}
int __IndexOf_MovementEndEventName()
{
    return 17;
}
}
