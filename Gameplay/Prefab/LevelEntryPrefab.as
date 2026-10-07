

UCLASS(Abstract)
class ALevelEntryPrefab : ACombatPropPrefab
{
    UPROPERTY()
    FT_LevelEntry LevelEntry;

    default SetEntityType(EEntityType(6));

    ALevelEntryPrefab()
    {
        super();
        return;
    }
}

