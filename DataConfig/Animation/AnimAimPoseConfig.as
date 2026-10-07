

struct FAnimAimPoseConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    TArray<FAimPoseSegmentConfig> Segments;
    UPROPERTY()
    TArray<FAimPoseCompensatorConfig> Compensators;

    FAnimAimPoseConfig()
    {
        return;
    }
}

