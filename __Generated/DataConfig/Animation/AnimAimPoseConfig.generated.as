namespace __FAnimAimPoseConfigFunctions
{
UFUNCTION()
TArray<FAimPoseSegmentConfig> __FAnimAimPoseConfig_GetSegments(const TDataObjectPtr<FAnimAimPoseConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Segments' from a null 'FAnimAimPoseConfig' DataObject!");
        }
        FAnimAimPoseConfig local_22;
        return local_22.Segments;
    }
    return DataObject.Get().Segments;
}
UFUNCTION()
TArray<FAimPoseCompensatorConfig> __FAnimAimPoseConfig_GetCompensators(const TDataObjectPtr<FAnimAimPoseConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Compensators' from a null 'FAnimAimPoseConfig' DataObject!");
        }
        FAnimAimPoseConfig local_22;
        return local_22.Compensators;
    }
    return DataObject.Get().Compensators;
}
UFUNCTION()
FAnimAimPoseConfig CastToFAnimAimPoseConfig(const TDataObjectPtr<FAnimAimPoseConfig> &inout DataObject)
{
    FAnimAimPoseConfig __r;
    return __r;
}
}
