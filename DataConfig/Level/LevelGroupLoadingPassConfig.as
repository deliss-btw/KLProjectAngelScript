

struct FLevelGroupLoadingPassConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    ELevelType LevelType;
    UPROPERTY()
    TArray<FName> LoadingPassOrder = FLevelGroupLoadingPassNames::DefaultLoadingPassOrder;

    FLevelGroupLoadingPassConfig()
    {
        return;
    }
}

