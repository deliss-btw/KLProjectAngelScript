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

