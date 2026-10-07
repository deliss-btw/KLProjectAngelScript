
namespace PropUtils
{
UFUNCTION()
FECSEntity SpawnPropByPrefab(const FECSEntity &inout OwnerEntity, const TSubclassOf<APropPrefab> &inout Prefab, const FFPTime &inout SpawnTime, const FVector &inout Location, const FRotator &inout Rotation)
{
    int local_22 = 0;
    FECSEntity local_6;
    if (!(ECS::GetRuntimeInfo().IsServer))
    {
        return local_6;
    }
    local_6 = ECS::RequestEntityByPrefabDeferred(Prefab, Location, Rotation, EPrefabCollisionAlignment(2), EECSRegType(0), false);
    APropPrefab local_16 = Prefab.GetDefaultObject();
    if (local_16.Prop.bHas_FC_LifeTimeInitConfig)
    {
        local_22.SetSpawnTime(SpawnTime);
    }
    if (OwnerEntity)
    {
        ModifyOrAdd local_26;
        local_26.opCall().SetOwnerEntity(OwnerEntity);
    }
    bool local_1 = local_16.Prop.bEnableTrackOwner;
    if (!(local_1))
    {
        local_1 = false;
    }
    else
    {
        local_1 = OwnerEntity;
    }
    if (local_1)
    {
        ModifyOrAdd local_34;
        local_34.opCall().SetTrackTarget(FTargetEntity(OwnerEntity));
    }
    return local_6;
}
UFUNCTION()
FECSEntity SpawnPropByPrefabNew(const FECSEntity &inout OwnerEntity, const TSubclassOf<APropPrefabBase> &inout Prefab, const FFPTime &inout SpawnTime, const FVector &inout Location, const FRotator &inout Rotation, const FName &inout SpawnInitEntryName = NAME_None)
{
    FECSEntity local_6;
    if (!(ECS::GetRuntimeInfo().IsServer))
    {
        return local_6;
    }
    local_6 = ECS::RequestEntityByPrefabDeferred(Prefab, Location, Rotation, EPrefabCollisionAlignment(2), EECSRegType(0), false);
    if (OwnerEntity)
    {
        ModifyOrAdd local_16;
        local_16.opCall().SetOwnerEntity(OwnerEntity);
    }
    if ((!((SpawnInitEntryName == NAME_None))))
    {
        ModifyOrAdd local_20;
        local_20.opCall().SetInitEntryName(SpawnInitEntryName);
    }
    return local_6;
}
}
