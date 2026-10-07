
enum EPropType
{
    Default,
    Collect,
    CombatProp,
}

enum ECombatPropType
{
    Default,
    LinkSkill,
}

const FPropPrefabConfig DefaultPropConfig = FPropPrefabConfig();

struct FPropDisplayConfig : FDataObject
{
    FDataObject _base_FDataObject;

    FPropDisplayConfig()
    {
        return;
    }
}

struct FPropPrefabConfig : FBasePrefabConfig
{
    FBasePrefabConfig _base_FBasePrefabConfig;
    UPROPERTY()
    EPropType PropType = EPropType(0);
    UPROPERTY()
    ECombatPropType CombatPropType = ECombatPropType(0);


}

UFUNCTION()
TDataObjectPtr<FPropPrefabConfig> GetPropConfig(const FECSEntity &inout Entity)
{
    return TDataObjectPtr<FPropPrefabConfig>(GetPrefabConfigPtr(Entity).CastTo(FPropPrefabConfig));
}
const FPropPrefabConfig GetDefaultedPropConfig(const FECSEntity &inout Entity)
{
    const FPropPrefabConfig __r;
    if (GetPropConfig(Entity))
    {
    }
    else
    {
    }
    return __r;
}
