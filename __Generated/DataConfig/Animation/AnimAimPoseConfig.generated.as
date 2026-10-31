namespace __FAnimAimPoseConfigFunctions
{
UFUNCTION()
TArray<FAimPoseSegmentConfig> __FAnimAimPoseConfig_GetSegments(const TDataObjectPtr<FAnimAimPoseConfig> &inout DataObject)
{
    TArray<FAimPoseSegmentConfig> __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Segments' from a null 'FAnimAimPoseConfig' DataObject!");
        }
        FAnimAimPoseConfig local_22;
        return local_22.Segments;
    }
    return __r;
}
UFUNCTION()
TArray<FAimPoseCompensatorConfig> __FAnimAimPoseConfig_GetCompensators(const TDataObjectPtr<FAnimAimPoseConfig> &inout DataObject)
{
    TArray<FAimPoseCompensatorConfig> __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Compensators' from a null 'FAnimAimPoseConfig' DataObject!");
        }
        FAnimAimPoseConfig local_22;
        return local_22.Compensators;
    }
    return __r;
}
UFUNCTION()
FAnimAimPoseConfig CastToFAnimAimPoseConfig(const TDataObjectPtr<FAnimAimPoseConfig> &inout DataObject)
{
    FAnimAimPoseConfig __r;
    return __r;
}
}
