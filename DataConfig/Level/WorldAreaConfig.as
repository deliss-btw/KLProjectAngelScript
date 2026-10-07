

struct FWorldAreaConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    uint DataId;
    UPROPERTY()
    FText AreaName;
    UPROPERTY()
    FText Description;
    UPROPERTY()
    TSet<TSoftClassPtr<AKLLevelScriptActor>> CommissionExtraLoadDatalayers;
    UPROPERTY()
    TSet<EKLDataLayerFilterTags> CommissionExtraLoadFilterTags;
    UPROPERTY()
    UDataTable DifficultyLevelConfig = nullptr;
    UPROPERTY()
    int MonsterDifficultyLevel;


}

