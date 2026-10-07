
enum ELevelObjectStatType
{
    TreasureBox,
    Oculus,
    Portal,
    Teleporter,
    CollectionPrefab,
}


struct FLevelObjectStatConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    uint DataId;
    UPROPERTY()
    FDataObjectPtr m_MapConfig;
    UPROPERTY()
    ELevelObjectStatType ObjectType;
    UPROPERTY()
    int CooldownDuration = 0;


    const TDataObjectPtr<FMapConfig> GetMapConfig() const property
    {
        const TDataObjectPtr<FMapConfig> __r;
        return __r;
    }
    void SetMapConfig(const TDataObjectPtr<FMapConfig> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FMapConfig>> local_2;
        this.m_MapConfig = local_2;
        return;
    }
}

