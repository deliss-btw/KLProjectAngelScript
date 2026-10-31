namespace __FCutSceneDataFunctions
{
UFUNCTION()
TSoftObjectPtr<ULevelSequence> __FCutSceneData_GetLevelSequence(const TDataObjectPtr<FCutSceneData> &inout DataObject)
{
    TSoftObjectPtr<ULevelSequence> __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'LevelSequence' from a null 'FCutSceneData' DataObject!");
        }
        FCutSceneData local_46;
        return local_46.LevelSequence;
    }
    return __r;
}
UFUNCTION()
TMap<FName, FCutSceneEntityInfo> __FCutSceneData_GetEntityInfos(const TDataObjectPtr<FCutSceneData> &inout DataObject)
{
    TMap<FName, FCutSceneEntityInfo> __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'EntityInfos' from a null 'FCutSceneData' DataObject!");
        }
        FCutSceneData local_46;
        return local_46.EntityInfos;
    }
    return __r;
}
UFUNCTION()
FCutSceneData CastToFCutSceneData(const TDataObjectPtr<FCutSceneData> &inout DataObject)
{
    FCutSceneData __r;
    return __r;
}
}
