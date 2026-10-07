
enum ELoadingScreenAction
{
    None,
    NATIVE_MAX = 0,
    CloseUI,
}


struct FTeleporterConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    uint DataId;
    UPROPERTY()
    FText DisplayName;
    UPROPERTY()
    FText Description;
    UPROPERTY()
    FDataObjectPtr m_PresentationConfig;
    UPROPERTY()
    FDataObjectPtr m_InactivePresentationConfig;
    UPROPERTY()
    FSoftBrush PreviewHeaderImage;
    UPROPERTY()
    ETeleporterState DefaultState = ETeleporterState(1);
    UPROPERTY()
    bool bShowOnWorldMap = true;
    UPROPERTY()
    bool bShowOnRegionMap = true;
    UPROPERTY()
    bool bDynamicTeleporter = false;
    UPROPERTY()
    int DisplayPriority = 0;
    UPROPERTY()
    FDataObjectPtr m_ActivationReward;
    UPROPERTY()
    FDataObjectPtr m_LevelInfoConfig;
    UPROPERTY()
    FVector2D WorldLocation;
    UPROPERTY()
    FDataObjectPtr m_TargetDungeonInfoConfig;


    TDataObjectPtr<FPresentationConfig> GetPresentationConfig() const property
    {
        TDataObjectPtr<FPresentationConfig> __r;
        return __r;
    }
    void SetPresentationConfig(const TDataObjectPtr<FPresentationConfig> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FPresentationConfig>> local_2;
        this.m_PresentationConfig = local_2;
        return;
    }
    const TDataObjectPtr<FPresentationConfig> GetInactivePresentationConfig() const property
    {
        const TDataObjectPtr<FPresentationConfig> __r;
        return __r;
    }
    void SetInactivePresentationConfig(const TDataObjectPtr<FPresentationConfig> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FPresentationConfig>> local_2;
        this.m_InactivePresentationConfig = local_2;
        return;
    }
    const TDataObjectPtr<FDropItemConfigBase> GetActivationReward() const property
    {
        const TDataObjectPtr<FDropItemConfigBase> __r;
        return __r;
    }
    void SetActivationReward(const TDataObjectPtr<FDropItemConfigBase> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FDropItemConfigBase>> local_2;
        this.m_ActivationReward = local_2;
        return;
    }
    const TDataObjectPtr<FLevelInfoConfig> GetLevelInfoConfig() const property
    {
        const TDataObjectPtr<FLevelInfoConfig> __r;
        return __r;
    }
    void SetLevelInfoConfig(const TDataObjectPtr<FLevelInfoConfig> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FLevelInfoConfig>> local_2;
        this.m_LevelInfoConfig = local_2;
        return;
    }
    const TDataObjectPtr<FDungeonConfig> GetTargetDungeonInfoConfig() const property
    {
        const TDataObjectPtr<FDungeonConfig> __r;
        return __r;
    }
    void SetTargetDungeonInfoConfig(const TDataObjectPtr<FDungeonConfig> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FDungeonConfig>> local_2;
        this.m_TargetDungeonInfoConfig = local_2;
        return;
    }
}

