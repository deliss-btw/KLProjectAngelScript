

struct FGameModeProfileConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    FInstancedStruct GameModeFlowSettings;
    UPROPERTY()
    TArray<FInstancedStruct> GameModeBehaviorSettings;

    FGameModeProfileConfig()
    {
        return;
    }
}

