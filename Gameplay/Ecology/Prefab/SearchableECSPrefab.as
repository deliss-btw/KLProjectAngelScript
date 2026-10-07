

// NOTE: class defaults are not authored in this module: AEcologyUnitECSPrefab (default scalar field AECSPrefab.bHasActor has no declared value type; load the matching Binds.Cache to author this module's defaults, or rerun with --force to use unverified Binds.Cache types (the result may be wrong)).
// They are carried over byte-exact when this module is recompiled.

class AEcologyUnitECSPrefab : AIdentifiableECSPrefab
{
    UPROPERTY()
    USceneComponent Root;

    AEcologyUnitECSPrefab()
    {
        return;
    }
    UFUNCTION()
    void PostPrefabLoad_Implementation(const FECSEntity &inout Entity) const
    {
        0.UID = this.GetConfigGUID();
        return;
    }
}

