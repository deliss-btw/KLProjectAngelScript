const FMountPrefabConfig DefaultMountConfig = FMountPrefabConfig();

struct FMountPrefabConfig : FBasePrefabConfig
{
    FBasePrefabConfig _base_FBasePrefabConfig;

    FMountPrefabConfig()
    {
        return;
    }
}

UFUNCTION()
TDataObjectPtr<FMountPrefabConfig> GetMountConfig(const FECSEntity &inout Entity)
{
    return TDataObjectPtr<FMountPrefabConfig>(GetPrefabConfigPtr(Entity).CastTo(FMountPrefabConfig));
}
const FMountPrefabConfig GetDefaultedMountConfig(const FECSEntity &inout Entity)
{
    const FMountPrefabConfig __r;
    TDataObjectPtr<FMountPrefabConfig> local_24 = GetMountConfig(Entity);
    if (local_24)
    {
        return local_24.Get();
    }
    return __r;
}
