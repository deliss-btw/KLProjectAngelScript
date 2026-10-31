namespace __FAnimDynamicAdditiveConfigFunctions
{
UFUNCTION()
TSoftObjectPtr<UAnimSequence> __FAnimDynamicAdditiveConfig_GetSourceSequence(const TDataObjectPtr<FAnimDynamicAdditiveConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'SourceSequence' from a null 'FAnimDynamicAdditiveConfig' DataObject!");
        }
        FAnimDynamicAdditiveConfig local_34;
        return local_34.SourceSequence;
    }
    return DataObject.Get().SourceSequence;
}
UFUNCTION()
TSoftObjectPtr<UAnimSequence> __FAnimDynamicAdditiveConfig_GetTargetSequence(const TDataObjectPtr<FAnimDynamicAdditiveConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'TargetSequence' from a null 'FAnimDynamicAdditiveConfig' DataObject!");
        }
        FAnimDynamicAdditiveConfig local_34;
        return local_34.TargetSequence;
    }
    return DataObject.Get().TargetSequence;
}
UFUNCTION()
FAnimDynamicAdditiveConfig CastToFAnimDynamicAdditiveConfig(const TDataObjectPtr<FAnimDynamicAdditiveConfig> &inout DataObject)
{
    FAnimDynamicAdditiveConfig __r;
    return __r;
}
}
