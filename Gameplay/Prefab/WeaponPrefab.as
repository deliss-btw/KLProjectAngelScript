

// NOTE: class defaults are not authored in this module: AWeaponPrefab (default scalar field AECSPrefab.NetRelevancePolicyType has no declared value type; load the matching Binds.Cache to author this module's defaults, or rerun with --force to use unverified Binds.Cache types (the result may be wrong)).
// They are carried over byte-exact when this module is recompiled.

class AWeaponPrefab : AKLECSPrefab
{
    UPROPERTY()
    FT_Weapon Weapon;

    AWeaponPrefab()
    {
        return;
    }
}

