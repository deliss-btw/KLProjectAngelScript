

// NOTE: class defaults are not authored in this module: AFacturePrefab (default scalar field AECSPrefab.NetRelevancePolicyType has no declared value type; load the matching Binds.Cache to author this module's defaults, or rerun with --force to use unverified Binds.Cache types (the result may be wrong)).
// They are carried over byte-exact when this module is recompiled.

class AFacturePrefab : AKLLevelPrefabBase
{
    UPROPERTY()
    FT_InteractTrait Interact;

    AFacturePrefab()
    {
        this.bStatic = true;
        this.bHasActor = true;
        this.bHasTransform = true;
        return;
    }
}

