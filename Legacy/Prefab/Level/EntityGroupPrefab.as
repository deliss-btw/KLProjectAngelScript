

// NOTE: class defaults are not authored in this module: AEntityGroupPrefab (default scalar field AECSPrefab.bHasActor has no declared value type; load the matching Binds.Cache to author this module's defaults, or rerun with --force to use unverified Binds.Cache types (the result may be wrong)).
// They are carried over byte-exact when this module is recompiled.

UCLASS(Abstract)
class AEntityGroupPrefab : AKLLevelPrefabBase
{
    UPROPERTY()
    FEntityDeadEvent OnEntityDead;
    UPROPERTY()
    FEntityAllDeadEvent OnEntityAllDead;

    AEntityGroupPrefab()
    {
        return;
    }
    UFUNCTION()
    void PostPrefabLoad_Implementation(const FECSEntity &inout Entity) const
    {
        FC_EntityGroupPendingInitTag local_6;
        Assign local_4;
        local_4.opCall(local_6);
        return;
    }
}

event void FEntityDeadEvent(const FCE_DeathEvent &inout DeathEvent, const int RemainCount);

event void FEntityAllDeadEvent();

