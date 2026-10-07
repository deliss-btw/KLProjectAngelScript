

// NOTE: class defaults are not authored in this module: UESMAction_ActivateInteractTraitTrait (default scalar field UESMAction.ActionFilterType has no declared value type; load the matching Binds.Cache to author this module's defaults, or rerun with --force to use unverified Binds.Cache types (the result may be wrong)).
// They are carried over byte-exact when this module is recompiled.

namespace DynamicPropActions
{
class UESMAction_ActivateInteractTraitTrait : UESMAction_DynamicPropTraitScriptBase
{
    UPROPERTY()
    FName TraitTypeName = FName("T_InteractTrait");

    UESMAction_ActivateInteractTraitTrait()
    {
        return;
    }
}

class UESMAction_ActivateHittableTrait : UESMAction_DynamicPropTraitScriptBase
{
    UPROPERTY()
    FName TraitTypeName = FName("T_Hittable");

    UESMAction_ActivateHittableTrait()
    {
        return;
    }
}

class UESMAction_ActivateLockableTrait : UESMAction_DynamicPropTraitScriptBase
{
    UPROPERTY()
    FName TraitTypeName = FName("T_Lockable");

    UESMAction_ActivateLockableTrait()
    {
        return;
    }
}

class UESMAction_ActivateAnimationTrait : UESMAction_DynamicPropTraitScriptBase
{
    UPROPERTY()
    FName TraitTypeName = FName("T_Animation");

    UESMAction_ActivateAnimationTrait()
    {
        return;
    }
}

class UESMAction_ActivateTurretTrait : UESMAction_DynamicPropTraitScriptBase
{
    UPROPERTY()
    FName TraitTypeName = FName("T_Turret");

    UESMAction_ActivateTurretTrait()
    {
        return;
    }
}

class UESMAction_ActivateBeHitPresentationTrait : UESMAction_DynamicPropTraitScriptBase
{
    UPROPERTY()
    FName TraitTypeName = FName("T_BeHitPresentation");

    UESMAction_ActivateBeHitPresentationTrait()
    {
        return;
    }
}

}
