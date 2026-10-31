namespace __FPendingConfirmHintConfigFunctions
{
UFUNCTION()
int __FPendingConfirmHintConfig_GetID(const TDataObjectPtr<FPendingConfirmHintConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ID' from a null 'FPendingConfirmHintConfig' DataObject!");
        }
        FPendingConfirmHintConfig defaultValue;
        return defaultValue.ID;
    }
    return DataObject.Get().ID;
}
UFUNCTION()
int __FPendingConfirmHintConfig_GetPriority(const TDataObjectPtr<FPendingConfirmHintConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Priority' from a null 'FPendingConfirmHintConfig' DataObject!");
        }
        FPendingConfirmHintConfig defaultValue;
        return defaultValue.Priority;
    }
    return DataObject.Get().Priority;
}
UFUNCTION()
float32 __FPendingConfirmHintConfig_GetDuration(const TDataObjectPtr<FPendingConfirmHintConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Duration' from a null 'FPendingConfirmHintConfig' DataObject!");
        }
        FPendingConfirmHintConfig defaultValue;
        return defaultValue.Duration;
    }
    return DataObject.Get().Duration;
}
UFUNCTION()
TArray<EPendingConfirmAction> __FPendingConfirmHintConfig_GetActionBar(const TDataObjectPtr<FPendingConfirmHintConfig> &inout DataObject)
{
    TArray<EPendingConfirmAction> __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ActionBar' from a null 'FPendingConfirmHintConfig' DataObject!");
        }
        FPendingConfirmHintConfig local_80;
        return local_80.ActionBar;
    }
    return __r;
}
UFUNCTION()
EPendingConfirmTimeOutAction __FPendingConfirmHintConfig_GetDurationTimeOutAutoAction(const TDataObjectPtr<FPendingConfirmHintConfig> &inout DataObject)
{
    int local_81 = 0;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DurationTimeOutAutoAction' from a null 'FPendingConfirmHintConfig' DataObject!");
        }
        FPendingConfirmHintConfig local_80;
        local_81 = int(local_80.DurationTimeOutAutoAction);
        return EPendingConfirmTimeOutAction(local_81);
    }
    return EPendingConfirmTimeOutAction(local_81);
}
UFUNCTION()
EPendingConfirmScenePersistence __FPendingConfirmHintConfig_GetScenePersistence(const TDataObjectPtr<FPendingConfirmHintConfig> &inout DataObject)
{
    int local_81 = 0;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ScenePersistence' from a null 'FPendingConfirmHintConfig' DataObject!");
        }
        FPendingConfirmHintConfig local_80;
        local_81 = int(local_80.ScenePersistence);
        return EPendingConfirmScenePersistence(local_81);
    }
    return EPendingConfirmScenePersistence(local_81);
}
UFUNCTION()
FText __FPendingConfirmHintConfig_GetTitle(const TDataObjectPtr<FPendingConfirmHintConfig> &inout DataObject)
{
    FText __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Title' from a null 'FPendingConfirmHintConfig' DataObject!");
        }
        FPendingConfirmHintConfig local_80;
        return local_80.Title;
    }
    return __r;
}
UFUNCTION()
FSoftBrush __FPendingConfirmHintConfig_GetTitleImage(const TDataObjectPtr<FPendingConfirmHintConfig> &inout DataObject)
{
    FSoftBrush __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'TitleImage' from a null 'FPendingConfirmHintConfig' DataObject!");
        }
        FPendingConfirmHintConfig local_80;
        return local_80.TitleImage;
    }
    return __r;
}
UFUNCTION()
FText __FPendingConfirmHintConfig_GetContent(const TDataObjectPtr<FPendingConfirmHintConfig> &inout DataObject)
{
    FText __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Content' from a null 'FPendingConfirmHintConfig' DataObject!");
        }
        FPendingConfirmHintConfig local_80;
        return local_80.Content;
    }
    return __r;
}
UFUNCTION()
FPendingConfirmHintConfig CastToFPendingConfirmHintConfig(const TDataObjectPtr<FPendingConfirmHintConfig> &inout DataObject)
{
    FPendingConfirmHintConfig __r;
    return __r;
}
}
