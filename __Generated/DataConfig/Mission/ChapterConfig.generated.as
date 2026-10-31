namespace __FChapterConfigFunctions
{
UFUNCTION()
FText __FChapterConfig_GetChapterNumber(const TDataObjectPtr<FChapterConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ChapterNumber' from a null 'FChapterConfig' DataObject!");
        }
        FChapterConfig local_24;
        return local_24.ChapterNumber;
    }
    return DataObject.Get().ChapterNumber;
}
UFUNCTION()
FText __FChapterConfig_GetChapterTitle(const TDataObjectPtr<FChapterConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ChapterTitle' from a null 'FChapterConfig' DataObject!");
        }
        FChapterConfig local_24;
        return local_24.ChapterTitle;
    }
    return DataObject.Get().ChapterTitle;
}
UFUNCTION()
int __FChapterConfig_GetSortPriority(const TDataObjectPtr<FChapterConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'SortPriority' from a null 'FChapterConfig' DataObject!");
        }
        FChapterConfig defaultValue;
        return defaultValue.SortPriority;
    }
    return DataObject.Get().SortPriority;
}
UFUNCTION()
FChapterConfig CastToFChapterConfig(const TDataObjectPtr<FChapterConfig> &inout DataObject)
{
    FChapterConfig __r;
    return __r;
}
}
