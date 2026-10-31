namespace __FSystemControlConfigFunctions
{
UFUNCTION()
ESystemModule __FSystemControlConfig_GetSystemModule(const TDataObjectPtr<FSystemControlConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'SystemModule' from a null 'FSystemControlConfig' DataObject!");
        }
        FSystemControlConfig local_220;
        return local_220.SystemModule;
    }
    return DataObject.Get().SystemModule;
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
    return DataObject.Get().GetCondition();
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
    return DataObject.Get().GetLockWidgetConfigList();
}
UFUNCTION()
bool __FSystemControlConfig_GetbShowUnlockMessageHint(const TDataObjectPtr<FSystemControlConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bShowUnlockMessageHint' from a null 'FSystemControlConfig' DataObject!");
        }
        FSystemControlConfig local_220;
        return local_220.bShowUnlockMessageHint;
    }
    return DataObject.Get().bShowUnlockMessageHint;
}
UFUNCTION()
FText __FSystemControlConfig_GetForbiddenTips(const TDataObjectPtr<FSystemControlConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ForbiddenTips' from a null 'FSystemControlConfig' DataObject!");
        }
        FSystemControlConfig local_220;
        return local_220.ForbiddenTips;
    }
    return DataObject.Get().ForbiddenTips;
}
UFUNCTION()
FText __FSystemControlConfig_GetTitle(const TDataObjectPtr<FSystemControlConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Title' from a null 'FSystemControlConfig' DataObject!");
        }
        FSystemControlConfig local_220;
        return local_220.Title;
    }
    return DataObject.Get().Title;
}
UFUNCTION()
FSoftBrush __FSystemControlConfig_GetIcon(const TDataObjectPtr<FSystemControlConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Icon' from a null 'FSystemControlConfig' DataObject!");
        }
        FSystemControlConfig local_220;
        return local_220.Icon;
    }
    return DataObject.Get().Icon;
}
UFUNCTION()
FSoftBrush __FSystemControlConfig_GetUnlockIcon(const TDataObjectPtr<FSystemControlConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'UnlockIcon' from a null 'FSystemControlConfig' DataObject!");
        }
        FSystemControlConfig local_220;
        return local_220.UnlockIcon;
    }
    return DataObject.Get().UnlockIcon;
}
UFUNCTION()
FText __FSystemControlConfig_GetContent(const TDataObjectPtr<FSystemControlConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Content' from a null 'FSystemControlConfig' DataObject!");
        }
        FSystemControlConfig local_220;
        return local_220.Content;
    }
    return DataObject.Get().Content;
}
UFUNCTION()
FEUIWidgetTag __FSystemControlConfig_GetEntranceWidget(const TDataObjectPtr<FSystemControlConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'EntranceWidget' from a null 'FSystemControlConfig' DataObject!");
        }
        FSystemControlConfig local_220;
        return local_220.EntranceWidget;
    }
    return DataObject.Get().EntranceWidget;
}
UFUNCTION()
FEUIInputAction __FSystemControlConfig_GetEntranceInput(const TDataObjectPtr<FSystemControlConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'EntranceInput' from a null 'FSystemControlConfig' DataObject!");
        }
        FSystemControlConfig local_220;
        return local_220.EntranceInput;
    }
    return DataObject.Get().EntranceInput;
}
UFUNCTION()
bool __FSystemControlConfig_GetbHasHUDEntrance(const TDataObjectPtr<FSystemControlConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bHasHUDEntrance' from a null 'FSystemControlConfig' DataObject!");
        }
        FSystemControlConfig local_220;
        return local_220.bHasHUDEntrance;
    }
    return DataObject.Get().bHasHUDEntrance;
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
    return DataObject.Get().GetRedPointCfg();
}
UFUNCTION()
TArray<int64> __FSystemControlConfig_GetExtraArgs(const TDataObjectPtr<FSystemControlConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ExtraArgs' from a null 'FSystemControlConfig' DataObject!");
        }
        FSystemControlConfig local_220;
        return local_220.ExtraArgs;
    }
    return DataObject.Get().ExtraArgs;
}
UFUNCTION()
TArray<ELevelType> __FSystemControlConfig_GetAllowedScenes(const TDataObjectPtr<FSystemControlConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'AllowedScenes' from a null 'FSystemControlConfig' DataObject!");
        }
        FSystemControlConfig local_220;
        return local_220.AllowedScenes;
    }
    return DataObject.Get().AllowedScenes;
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
    return DataObject.Get().GetRefreshRuleConfig();
}
UFUNCTION()
FSystemControlConfig CastToFSystemControlConfig(const TDataObjectPtr<FSystemControlConfig> &inout DataObject)
{
    FSystemControlConfig __r;
    return __r;
}
}
