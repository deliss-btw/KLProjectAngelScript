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

