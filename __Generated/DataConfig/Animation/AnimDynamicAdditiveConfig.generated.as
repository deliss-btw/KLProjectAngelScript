namespace __FAnimDynamicAdditiveConfigFunctions
{
UFUNCTION()
TSoftObjectPtr<UAnimSequence> __FAnimDynamicAdditiveConfig_GetSourceSequence(const TDataObjectPtr<FAnimDynamicAdditiveConfig> &inout DataObject)
{
    TSoftObjectPtr<UAnimSequence> __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'SourceSequence' from a null 'FAnimDynamicAdditiveConfig' DataObject!");
        }
        FAnimDynamicAdditiveConfig local_34;
        return local_34.SourceSequence;
    }
    return __r;
}
UFUNCTION()
TSoftObjectPtr<UAnimSequence> __FAnimDynamicAdditiveConfig_GetTargetSequence(const TDataObjectPtr<FAnimDynamicAdditiveConfig> &inout DataObject)
{
    TSoftObjectPtr<UAnimSequence> __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'TargetSequence' from a null 'FAnimDynamicAdditiveConfig' DataObject!");
        }
        FAnimDynamicAdditiveConfig local_34;
        return local_34.TargetSequence;
    }
    return __r;
}
UFUNCTION()
FAnimDynamicAdditiveConfig CastToFAnimDynamicAdditiveConfig(const TDataObjectPtr<FAnimDynamicAdditiveConfig> &inout DataObject)
{
    FAnimDynamicAdditiveConfig __r;
    return __r;
}
}
