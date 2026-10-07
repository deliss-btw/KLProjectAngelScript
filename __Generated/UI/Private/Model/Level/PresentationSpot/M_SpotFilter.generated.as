

struct FM_SpotFilterConfigDefault : FConfigEUIModelDefaultBase
{
    UPROPERTY()
    int StaggerBatchSize = 8;
    UPROPERTY()
    float32 NearDistanceThreshold = 4000.0f;
    UPROPERTY()
    float32 FarDemotionMultiplier = 1.25f;
    UPROPERTY()
    float32 TeleportThreshold = 5000.0f;


}

