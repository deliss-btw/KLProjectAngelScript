namespace __FSystemControlConfigFunctions
{
UFUNCTION()
ESystemModule __FSystemControlConfig_GetSystemModule(const TDataObjectPtr<FSystemControlConfig> &inout DataObject)
{
    int local_221 = 0;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'SystemModule' from a null 'FSystemControlConfig' DataObject!");
        }
        FSystemControlConfig local_220;
        local_221 = int(local_220.SystemModule);
        return ESystemModule(local_221);
    }
    return ESystemModule(local_221);
}
UFUNCTION()
TDataObjectPtr<FServerConditionConfigBase> __FSystemControlConfig_GetCondition(const TDataObjectPtr<FSystemControlConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Condition' from a null 'FSystemControlConfig' DataObject!");
        }
        FSystemControlConfig local_220;
        return local_220.GetCondition();
    }
    return GetCondition();
}
UFUNCTION()
TArray<TDataObjectPtr<FEUIWidgetConfig>> __FSystemControlConfig_GetLockWidgetConfigList(const TDataObjectPtr<FSystemControlConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'LockWidgetConfigList' from a null 'FSystemControlConfig' DataObject!");
        }
        FSystemControlConfig local_220;
        return local_220.GetLockWidgetConfigList();
    }
    return GetLockWidgetConfigList();
}
UFUNCTION()
bool __FSystemControlConfig_GetbShowUnlockMessageHint(const TDataObjectPtr<FSystemControlConfig> &inout DataObject)
{
    bool local_1 = false;
    if ((DataObject == nullptr))
    {
        local_1 = !(EUIGlobals::GIsDuringPropertyConversion);
        if (local_1)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bShowUnlockMessageHint' from a null 'FSystemControlConfig' DataObject!");
        }
        FSystemControlConfig local_220;
        return local_220.bShowUnlockMessageHint;
    }
    return local_1;
}
UFUNCTION()
FText __FSystemControlConfig_GetForbiddenTips(const TDataObjectPtr<FSystemControlConfig> &inout DataObject)
{
    FText __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ForbiddenTips' from a null 'FSystemControlConfig' DataObject!");
        }
        FSystemControlConfig local_220;
        return local_220.ForbiddenTips;
    }
    return __r;
}
UFUNCTION()
FText __FSystemControlConfig_GetTitle(const TDataObjectPtr<FSystemControlConfig> &inout DataObject)
{
    FText __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Title' from a null 'FSystemControlConfig' DataObject!");
        }
        FSystemControlConfig local_220;
        return local_220.Title;
    }
    return __r;
}
UFUNCTION()
FSoftBrush __FSystemControlConfig_GetIcon(const TDataObjectPtr<FSystemControlConfig> &inout DataObject)
{
    FSoftBrush __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Icon' from a null 'FSystemControlConfig' DataObject!");
        }
        FSystemControlConfig local_220;
        return local_220.Icon;
    }
    return __r;
}
UFUNCTION()
FSoftBrush __FSystemControlConfig_GetUnlockIcon(const TDataObjectPtr<FSystemControlConfig> &inout DataObject)
{
    FSoftBrush __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'UnlockIcon' from a null 'FSystemControlConfig' DataObject!");
        }
        FSystemControlConfig local_220;
        return local_220.UnlockIcon;
    }
    return __r;
}
UFUNCTION()
FText __FSystemControlConfig_GetContent(const TDataObjectPtr<FSystemControlConfig> &inout DataObject)
{
    FText __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Content' from a null 'FSystemControlConfig' DataObject!");
        }
        FSystemControlConfig local_220;
        return local_220.Content;
    }
    return __r;
}
UFUNCTION()
FEUIWidgetTag __FSystemControlConfig_GetEntranceWidget(const TDataObjectPtr<FSystemControlConfig> &inout DataObject)
{
    FEUIWidgetTag __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'EntranceWidget' from a null 'FSystemControlConfig' DataObject!");
        }
        FSystemControlConfig local_220;
        return local_220.EntranceWidget;
    }
    return __r;
}
UFUNCTION()
FEUIInputAction __FSystemControlConfig_GetEntranceInput(const TDataObjectPtr<FSystemControlConfig> &inout DataObject)
{
    FEUIInputAction __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'EntranceInput' from a null 'FSystemControlConfig' DataObject!");
        }
        FSystemControlConfig local_220;
        return local_220.EntranceInput;
    }
    return __r;
}
UFUNCTION()
bool __FSystemControlConfig_GetbHasHUDEntrance(const TDataObjectPtr<FSystemControlConfig> &inout DataObject)
{
    bool local_1 = false;
    if ((DataObject == nullptr))
    {
        local_1 = !(EUIGlobals::GIsDuringPropertyConversion);
        if (local_1)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bHasHUDEntrance' from a null 'FSystemControlConfig' DataObject!");
        }
        FSystemControlConfig local_220;
        return local_220.bHasHUDEntrance;
    }
    return local_1;
}
UFUNCTION()
TDataObjectPtr<FRedPointConfig> __FSystemControlConfig_GetRedPointCfg(const TDataObjectPtr<FSystemControlConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'RedPointCfg' from a null 'FSystemControlConfig' DataObject!");
        }
        FSystemControlConfig local_220;
        return local_220.GetRedPointCfg();
    }
    return GetRedPointCfg();
}
UFUNCTION()
TArray<int64> __FSystemControlConfig_GetExtraArgs(const TDataObjectPtr<FSystemControlConfig> &inout DataObject)
{
    TArray<int64> __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ExtraArgs' from a null 'FSystemControlConfig' DataObject!");
        }
        FSystemControlConfig local_220;
        return local_220.ExtraArgs;
    }
    return __r;
}
UFUNCTION()
TArray<ELevelType> __FSystemControlConfig_GetAllowedScenes(const TDataObjectPtr<FSystemControlConfig> &inout DataObject)
{
    TArray<ELevelType> __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'AllowedScenes' from a null 'FSystemControlConfig' DataObject!");
        }
        FSystemControlConfig local_220;
        return local_220.AllowedScenes;
    }
    return __r;
}
UFUNCTION()
TDataObjectPtr<FRefreshRuleConfig> __FSystemControlConfig_GetRefreshRuleConfig(const TDataObjectPtr<FSystemControlConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'RefreshRuleConfig' from a null 'FSystemControlConfig' DataObject!");
        }
        FSystemControlConfig local_220;
        return local_220.GetRefreshRuleConfig();
    }
    return GetRefreshRuleConfig();
}
UFUNCTION()
FSystemControlConfig CastToFSystemControlConfig(const TDataObjectPtr<FSystemControlConfig> &inout DataObject)
{
    FSystemControlConfig __r;
    return __r;
}
}
