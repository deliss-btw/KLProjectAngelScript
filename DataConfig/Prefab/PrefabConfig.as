
enum EPrefabType
{
    Invalid,
    Avatar,
    Monster,
    Prop,
    Mount,
    LevelEvent,
}

enum EPrefabSize
{
    Default,
    Small,
    Medium,
    Large,
    ExtraLarge,
}

const FBasePrefabConfig DefaultBasePrefabConfig = FBasePrefabConfig();

struct FBasePrefabConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    FText DisplayName = NSLOCTEXT("PrefabConfig", "DefaultDisplayName", "Default Display Name");
    UPROPERTY()
    FSoftBrush DisplayIcon;
    UPROPERTY()
    EPrefabSize Size = EPrefabSize(0);
    UPROPERTY()
    TSoftClassPtr<UEUIUserWidget> UI_CustomSkillInfo;


}

UFUNCTION()
TDataObjectPtr<FBasePrefabConfig> GetBasePrefabConfig(const FECSEntity &inout Entity)
{
    TDataObjectPtr<FBasePrefabConfig> local_24 = TDataObjectPtr<FBasePrefabConfig>(GetPrefabConfigPtr(Entity).CastTo(FBasePrefabConfig));
    return local_24;
}
const FBasePrefabConfig GetDefaultedBasePrefabConfig(const FECSEntity &inout Entity)
{
    const FBasePrefabConfig __r;
    if (GetBasePrefabConfig(Entity))
    {
    }
    else
    {
    }
    return __r;
}
