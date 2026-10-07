

class APresentationOnlyPrefab : AKLLevelPrefabBase
{
    UPROPERTY()
    FT_PresentationOnly PresentationOnly;

    default SetEntityType(EEntityType(7));

    APresentationOnlyPrefab()
    {
        return;
    }
}

