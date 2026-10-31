UCLASS(Abstract)
class ARegionPathNodePrefab : AKLLevelPrefabBase
{
    ARegionPathNodePrefab()
    {
        return;
    }
    UFUNCTION()
    void PostPrefabLoad_Implementation(const FECSEntity &inout Entity) const
    {
        FC_RegionPathNodeTag local_6;
        Assign local_4;
        local_4.opCall(local_6);
        return;
    }
}

