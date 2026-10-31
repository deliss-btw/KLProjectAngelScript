namespace __FAIHitTestConfigFunctions
{
UFUNCTION()
FVector3f __FAIHitTestConfig_GetBoxSize(const TDataObjectPtr<FAIHitTestConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'BoxSize' from a null 'FAIHitTestConfig' DataObject!");
        }
        FAIHitTestConfig local_18;
        return local_18.BoxSize;
    }
    return DataObject.Get().BoxSize;
}
UFUNCTION()
FAIHitTestConfig CastToFAIHitTestConfig(const TDataObjectPtr<FAIHitTestConfig> &inout DataObject)
{
    FAIHitTestConfig __r;
    return __r;
}
}
