

struct FEcologyLevelDataObject : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    TSoftObjectPtr<UEnvQuery> SpawnEntityEnvQueryTemplate;

    FEcologyLevelDataObject()
    {
        return;
    }
}

