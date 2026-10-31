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
