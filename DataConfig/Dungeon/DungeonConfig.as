
enum EDungeonType
{
    None,
    Social,
    Challenge,
}


struct FDungeonConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    uint DataId;
    UPROPERTY()
    EDungeonType DungeonType;
    UPROPERTY()
    FDataObjectPtr m_LevelConfig;
    UPROPERTY()
    FSoftBrush DungeonIcon;
    UPROPERTY()
    FText DungeonName;
    UPROPERTY()
    FText DungeonDesc;
    UPROPERTY()
    FDataObjectPtr m_TempRewardView;


    TDataObjectPtr<FLevelInfoConfig> GetLevelConfig() const property
    {
        TDataObjectPtr<FLevelInfoConfig> __r;
        return __r;
    }
    void SetLevelConfig(const TDataObjectPtr<FLevelInfoConfig> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FLevelInfoConfig>> local_2;
        this.m_LevelConfig = local_2;
        return;
    }
    const TDataObjectPtr<FDropItemConfigBase> GetTempRewardView() const property
    {
        const TDataObjectPtr<FDropItemConfigBase> __r;
        return __r;
    }
    void SetTempRewardView(const TDataObjectPtr<FDropItemConfigBase> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FDropItemConfigBase>> local_2;
        this.m_TempRewardView = local_2;
        return;
    }
}

