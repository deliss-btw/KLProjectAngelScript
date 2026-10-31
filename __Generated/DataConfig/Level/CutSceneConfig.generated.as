namespace __FCutSceneDataFunctions
{
UFUNCTION()
TSoftObjectPtr<ULevelSequence> __FCutSceneData_GetLevelSequence(const TDataObjectPtr<FCutSceneData> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'LevelSequence' from a null 'FCutSceneData' DataObject!");
        }
        FCutSceneData local_46;
        return local_46.LevelSequence;
    }
    return DataObject.Get().LevelSequence;
}
UFUNCTION()
TMap<FName, FCutSceneEntityInfo> __FCutSceneData_GetEntityInfos(const TDataObjectPtr<FCutSceneData> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'EntityInfos' from a null 'FCutSceneData' DataObject!");
        }
        FCutSceneData local_46;
        return local_46.EntityInfos;
    }
    return DataObject.Get().EntityInfos;
}
UFUNCTION()
FCutSceneData CastToFCutSceneData(const TDataObjectPtr<FCutSceneData> &inout DataObject)
{
    FCutSceneData __r;
    return __r;
}
}
