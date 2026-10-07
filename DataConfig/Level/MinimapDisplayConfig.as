

struct FMinimapDisplayConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    TSoftObjectPtr<UMinimapConfig> MinimapConfig;
    UPROPERTY()
    TSoftClassPtr<UMinimapIconRegistryAsset> DefaultIconRegistry;
    UPROPERTY()
    float32 BaseMapScale = 20.0f;
    UPROPERTY()
    float32 DefaultMapScale = 20.0f;
    UPROPERTY()
    float32 MinMapScale = 35.0f;
    UPROPERTY()
    float32 MaxMapScale = 250.0f;
    UPROPERTY()
    float32 WorldMapDefaultMapScale = 20.0f;
    UPROPERTY()
    float32 WorldMapMinMapScale = 35.0f;
    UPROPERTY()
    float32 WorldMapMaxMapScale = 250.0f;
    UPROPERTY()
    bool bShowDSBoundary;
    UPROPERTY()
    bool bDSBoundaryMaskStandsForUnreachable;
    UPROPERTY()
    TSoftObjectPtr<UTexture2D> DSBoundaryMaskTexture;
    UPROPERTY()
    FBox2D DSBoundaryMaskWorldPosition;


}

