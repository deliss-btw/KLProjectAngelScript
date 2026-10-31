namespace __FDialogueVoiceConfigFunctions
{
UFUNCTION()
TArray<FDialogueVOSource> __FDialogueVoiceConfig_GetVOSources(const TDataObjectPtr<FDialogueVoiceConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'VOSources' from a null 'FDialogueVoiceConfig' DataObject!");
        }
        FDialogueVoiceConfig local_18;
        return local_18.VOSources;
    }
    return DataObject.Get().VOSources;
}
UFUNCTION()
FDialogueVoiceConfig CastToFDialogueVoiceConfig(const TDataObjectPtr<FDialogueVoiceConfig> &inout DataObject)
{
    FDialogueVoiceConfig __r;
    return __r;
}
}
