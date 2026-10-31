namespace __FAnimAimPoseAllowSourceFunctions
{
UFUNCTION()
TSet<EAnimLookSource> __FAnimAimPoseAllowSource_GetAllowSources(const TDataObjectPtr<FAnimAimPoseAllowSource> &inout DataObject)
{
    TSet<EAnimLookSource> __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'AllowSources' from a null 'FAnimAimPoseAllowSource' DataObject!");
        }
        FAnimAimPoseAllowSource local_34;
        return local_34.AllowSources;
    }
    return __r;
}
UFUNCTION()
FAnimAimPoseAllowSource CastToFAnimAimPoseAllowSource(const TDataObjectPtr<FAnimAimPoseAllowSource> &inout DataObject)
{
    FAnimAimPoseAllowSource __r;
    return __r;
}
}
