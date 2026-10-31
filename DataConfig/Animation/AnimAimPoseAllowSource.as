struct FAnimAimPoseAllowSource : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    TSet<EAnimLookSource> AllowSources = {EAnimLookSource(0)};

    FAnimAimPoseAllowSource()
    {
        return;
    }
}

