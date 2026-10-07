

struct FCreatureActivityDefintion
{
    UPROPERTY()
    FCreatureType CreatureType;
    UPROPERTY()
    FString BehaviorName;

    FCreatureActivityDefintion()
    {
        return;
    }
}

struct FCreatureActivityDefintionTableObject : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    TArray<FCreatureActivityDefintion> Activities;

    FCreatureActivityDefintionTableObject()
    {
        return;
    }
}

