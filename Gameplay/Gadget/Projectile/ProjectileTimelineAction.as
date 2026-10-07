
namespace ProjectileTimelineActionColor
{
    const FLinearColor Default = FLinearColor();
    const FLinearColor Presentation = FLinearColor();
    const FLinearColor Movement = FLinearColor();
    const FLinearColor Hit = FLinearColor();
    const FLinearColor Effect = FLinearColor();
    const FLinearColor Misc = FLinearColor();

// NOTE: class defaults are not authored in this module: UProjectileTimelineAction_ProjectileHealth (default scalar field UProjectileTimelineAction.bGlobalAction has no declared value type; load the matching Binds.Cache to author this module's defaults, or rerun with --force to use unverified Binds.Cache types (the result may be wrong)).
// They are carried over byte-exact when this module is recompiled.

}
class UProjectileTimelineAction_TrunToState : UProjectileTimelineInstantAction
{
    UPROPERTY()
    FProjectileTimelineActionData_TrunToState Data;

    UProjectileTimelineAction_TrunToState()
    {
        return;
    }
}

class UProjectileTimelineAction_PlayFX : UProjectileTimelineAction
{
    UPROPERTY()
    FProjectileTimelineActionData_PlayFX Data;

    UProjectileTimelineAction_PlayFX()
    {
        return;
    }
    UFUNCTION()
    bool HasDeactivated_Implementation() const
    {
        return (int(this.NotifyType) != 0);
    }
}

class UProjectileTimelineAction_HitTest : UProjectileTimelineInstantAction
{
    UPROPERTY()
    FProjectileTimelineActionData_HitTest Data;

    UProjectileTimelineAction_HitTest()
    {
        return;
    }
}

class UProjectileTimelineAction_CreateArealEffectEntity : UProjectileTimelineAction
{
    UPROPERTY()
    FProjectileTimelineActionData_CreateArealEffectEntity Data;

    UProjectileTimelineAction_CreateArealEffectEntity()
    {
        return;
    }
    UFUNCTION()
    bool HasDeactivated_Implementation() const
    {
        return (int(this.NotifyType) != 0);
    }
}

class UProjectileTimelineAction_AbilitySignal : UProjectileTimelineInstantAction
{
    UPROPERTY()
    FProjectileTimelineActionData_AbilitySignal Data;

    UProjectileTimelineAction_AbilitySignal()
    {
        return;
    }
}

class UProjectileTimelineAction_AbilityEffectEvent : UProjectileTimelineDurationalAction
{
    UPROPERTY()
    FProjectileTimelineActionData_AbilityEffectEvent Data;

    UProjectileTimelineAction_AbilityEffectEvent()
    {
        return;
    }
}

class UProjectileTimelineAction_ChangeMaterialParam : UProjectileTimelineInstantAction
{
    UPROPERTY()
    FProjectileTimelineActionData_ChangeMaterialParam Data;

    UProjectileTimelineAction_ChangeMaterialParam()
    {
        return;
    }
}

class UProjectileTimelineAction_ChangeMaterialParamSpan : UProjectileTimelineDurationalAction
{
    UPROPERTY()
    FProjectileTimelineActionData_ChangeMaterialParamSpan Data;

    UProjectileTimelineAction_ChangeMaterialParamSpan()
    {
        return;
    }
}

class UProjectileTimelineAction_HitTestShape : UProjectileTimelineReplaceComponentAction
{
    UPROPERTY()
    FC_HitTestShape Data;

    UProjectileTimelineAction_HitTestShape()
    {
        return;
    }
}

class UProjectileTimelineAction_ProjectileHit : UProjectileTimelineReplaceComponentAction
{
    UPROPERTY()
    FC_ProjectileHitConfig Data;

    UProjectileTimelineAction_ProjectileHit()
    {
        return;
    }
}

class UProjectileTimelineAction_ProjectilePenetration : UProjectileTimelineReplaceComponentAction
{
    UPROPERTY()
    FC_ProjectilePenetrationConfig Data;

    UProjectileTimelineAction_ProjectilePenetration()
    {
        return;
    }
}

class UProjectileTimelineAction_ProjectileDistanceAttenuation : UProjectileTimelineReplaceComponentAction
{
    UPROPERTY()
    FC_ProjectileDistanceAttenuationConfig Data;

    UProjectileTimelineAction_ProjectileDistanceAttenuation()
    {
        return;
    }
}

class UProjectileTimelineAction_ProjectileSticky : UProjectileTimelineReplaceComponentAction
{
    UPROPERTY()
    FC_ProjectileStickyConfig Data;

    UProjectileTimelineAction_ProjectileSticky()
    {
        return;
    }
}

class UProjectileTimelineAction_SimpleProjectileMovement : UProjectileTimelineReplaceComponentAction
{
    UPROPERTY()
    FC_SimpleProjectileMovementConfig Data;

    UProjectileTimelineAction_SimpleProjectileMovement()
    {
        return;
    }
}

class UProjectileTimelineAction_ThrowMovement : UProjectileTimelineReplaceComponentAction
{
    UPROPERTY()
    FC_ThrowMovementConfig Data;

    UProjectileTimelineAction_ThrowMovement()
    {
        return;
    }
}

class UProjectileTimelineAction_GroundMovement : UProjectileTimelineReplaceComponentAction
{
    UPROPERTY()
    FC_GroundMovementConfig Data;

    UProjectileTimelineAction_GroundMovement()
    {
        return;
    }
}

class UProjectileTimelineAction_TrackMovement : UProjectileTimelineReplaceComponentAction
{
    UPROPERTY()
    FC_TrackMovementConfig Data;

    UProjectileTimelineAction_TrackMovement()
    {
        return;
    }
}

class UProjectileTimelineAction_CurveMovement : UProjectileTimelineReplaceComponentAction
{
    UPROPERTY()
    FC_CurveMovementConfig Data;

    UProjectileTimelineAction_CurveMovement()
    {
        return;
    }
}

class UProjectileTimelineAction_CurveRotation : UProjectileTimelineReplaceComponentAction
{
    UPROPERTY()
    FC_CurveRotationConfig Data;

    UProjectileTimelineAction_CurveRotation()
    {
        return;
    }
}

class UProjectileTimelineAction_MovementRadialForce : UProjectileTimelineReplaceComponentAction
{
    UPROPERTY()
    FC_MovementRadialForce Data;

    UProjectileTimelineAction_MovementRadialForce()
    {
        return;
    }
}

class UProjectileTimelineAction_MovementBoxForce : UProjectileTimelineReplaceComponentAction
{
    UPROPERTY()
    FC_MovementBoxForce Data;

    UProjectileTimelineAction_MovementBoxForce()
    {
        return;
    }
}

class UProjectileTimelineAction_RotationByTime : UProjectileTimelineReplaceComponentAction
{
    UPROPERTY()
    FC_RotationByTime Data;

    UProjectileTimelineAction_RotationByTime()
    {
        return;
    }
}

class UProjectileTimelineAction_AdditionalMovement : UProjectileTimelineReplaceComponentAction
{
    UPROPERTY()
    FC_AdditionalMovementConfig Data;

    UProjectileTimelineAction_AdditionalMovement()
    {
        return;
    }
}

class UProjectileTimelineAction_ProjectileEvent : UProjectileTimelineReplaceComponentAction
{
    UPROPERTY()
    FC_ProjectileTimelineEventTriggerConfig Data;

    UProjectileTimelineAction_ProjectileEvent()
    {
        return;
    }
}

class UProjectileTimelineAction_HitTestByMoveTrail : UProjectileTimelineReplaceComponentAction
{
    UPROPERTY()
    FC_HitTestByMoveTrail Data;

    UProjectileTimelineAction_HitTestByMoveTrail()
    {
        return;
    }
}

class UProjectileTimelineAction_ArealEffectBuff : UProjectileTimelineReplaceComponentAction
{
    UPROPERTY()
    FC_CombatArealEffectBuffConfig Data;

    UProjectileTimelineAction_ArealEffectBuff()
    {
        return;
    }
}

class UProjectileTimelineAction_ArealEffectAbilityEffectTrigger : UProjectileTimelineReplaceComponentAction
{
    UPROPERTY()
    FC_CombatArealEffectAbilityEffectTriggerConfig Data;

    UProjectileTimelineAction_ArealEffectAbilityEffectTrigger()
    {
        return;
    }
}

class UProjectileTimelineAction_FXByMoveTrail : UProjectileTimelineReplaceComponentAction
{
    UPROPERTY()
    FC_FXByMoveTrail Data;

    UProjectileTimelineAction_FXByMoveTrail()
    {
        return;
    }
}

class UProjectileTimelineAction_ActorVisualConfig : UProjectileTimelineReplaceComponentAction
{
    UPROPERTY()
    FC_ProjectileActorVisualConfig Data;

    UProjectileTimelineAction_ActorVisualConfig()
    {
        return;
    }
}

class UProjectileTimelineAction_ScaleByTime : UProjectileTimelineReplaceComponentAction
{
    UPROPERTY()
    FC_ScaleByTimeConfig Data;

    UProjectileTimelineAction_ScaleByTime()
    {
        return;
    }
}

class UProjectileTimelineAction_ProjectileHealth : UProjectileTimelineReplaceComponentAction
{
    UPROPERTY()
    FC_ProjectileHealthConfig Data;

    UProjectileTimelineAction_ProjectileHealth()
    {
        return;
    }
}

class UProjectileTimelineAction_HittableConfig : UProjectileTimelineReplaceComponentAction
{
    UPROPERTY()
    FC_HittableConfig Data;

    UProjectileTimelineAction_HittableConfig()
    {
        return;
    }
}

class UProjectileTimelineAction_GameplayTagsConfig : UProjectileTimelineReplaceComponentAction
{
    UPROPERTY()
    FC_GameplayTagsConfig Data;

    UProjectileTimelineAction_GameplayTagsConfig()
    {
        return;
    }
}

class UProjectileTimelineAction_InstantSFX : UProjectileTimelineInstantAction
{
    UPROPERTY()
    FProjectileTimelineActionData_InstantSFX Data;

    UProjectileTimelineAction_InstantSFX()
    {
        return;
    }
    UFUNCTION()
    TArray<FSoftObjectPath> CollectReferencedAsset_Implementation(const int CurrentVariantType) const
    {
        TArray<FSoftObjectPath> local_4;
        local_4.Add(this.Data.Event.ToSoftObjectPath());
        return local_4;
    }
}

class UProjectileTimelineAction_DurationalSFX : UProjectileTimelineDurationalAction
{
    UPROPERTY()
    FProjectileTimelineActionData_DurationalSFX Data;

    UProjectileTimelineAction_DurationalSFX()
    {
        return;
    }
    UFUNCTION()
    bool HasDeactivated_Implementation() const
    {
        return true;
    }
    UFUNCTION()
    TArray<FSoftObjectPath> CollectReferencedAsset_Implementation(const int CurrentVariantType) const
    {
        TArray<FSoftObjectPath> local_4;
        local_4.Add(this.Data.EnterEvent.ToSoftObjectPath());
        local_4.Add(this.Data.ExitEvent.ToSoftObjectPath());
        return local_4;
    }
}

class UProjectileTimelineAction_KeepSwitchValue : UProjectileTimelineDurationalAction
{
    UPROPERTY()
    FProjectileTimelineActionData_KeepSwitchValue Data;

    UProjectileTimelineAction_KeepSwitchValue()
    {
        return;
    }
    UFUNCTION()
    bool HasDeactivated_Implementation() const
    {
        return true;
    }
    UFUNCTION()
    TArray<FSoftObjectPath> CollectReferencedAsset_Implementation(const int CurrentVariantType) const
    {
        TArray<FSoftObjectPath> local_4;
        local_4.Add(this.Data.KeepSwitchValue.ToSoftObjectPath());
        local_4.Add(this.Data.ResetSwitchValue.ToSoftObjectPath());
        return local_4;
    }
}

class UProjectileTimelineAction_KeepRtpcValue : UProjectileTimelineDurationalAction
{
    UPROPERTY()
    FProjectileTimelineActionData_KeepRtpcValue Data;

    UProjectileTimelineAction_KeepRtpcValue()
    {
        return;
    }
    UFUNCTION()
    bool HasDeactivated_Implementation() const
    {
        return true;
    }
    UFUNCTION()
    TArray<FSoftObjectPath> CollectReferencedAsset_Implementation(const int CurrentVariantType) const
    {
        TArray<FSoftObjectPath> local_4;
        local_4.Add(this.Data.Rtpc.ToSoftObjectPath());
        return local_4;
    }
}

