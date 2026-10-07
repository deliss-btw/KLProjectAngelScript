
const FMountPrefabConfig DefaultMountConfig = FMountPrefabConfig();

struct FMountPrefabConfig : FBasePrefabConfig
{
    FBasePrefabConfig _base_FBasePrefabConfig;

    FMountPrefabConfig()
    {
        super();
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
    if (GetMountConfig(Entity))
    {
    }
    else
    {
    }
    return __r;
}
