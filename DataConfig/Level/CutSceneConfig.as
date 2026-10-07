

struct FCutSceneEntityInfo
{
    UPROPERTY()
    FName StartLocationTag;
    UPROPERTY()
    FName EndLocationTag;
    UPROPERTY()
    FName ESMStateName;
    UPROPERTY()
    float32 ESMStateTime;
    UPROPERTY()
    FRotator EndCameraRotation;


}

struct FCutSceneData : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    uint DataId;
    UPROPERTY()
    TSoftObjectPtr<ULevelSequence> LevelSequence;
    UPROPERTY()
    TMap<FName, FCutSceneEntityInfo> EntityInfos;

    FCutSceneData()
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
}

