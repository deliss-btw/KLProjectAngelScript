namespace __FObjectiveConfigFunctions
{
UFUNCTION()
EObjectiveType __FObjectiveConfig_GetObjectiveType(const TDataObjectPtr<FObjectiveConfig> &inout DataObject)
{
    int local_17 = 0;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ObjectiveType' from a null 'FObjectiveConfig' DataObject!");
        }
        FObjectiveConfig local_16;
        local_17 = int(local_16.ObjectiveType);
        return EObjectiveType(local_17);
    }
    return EObjectiveType(local_17);
}
UFUNCTION()
FObjectiveConfig CastToFObjectiveConfig(const TDataObjectPtr<FObjectiveConfig> &inout DataObject)
{
    FObjectiveConfig __r;
    return __r;
}
}
namespace __FObjectiveSingleConfigFunctions
{
UFUNCTION()
bool __FObjectiveSingleConfig_GetbHidden(const TDataObjectPtr<FObjectiveSingleConfig> &inout DataObject)
{
    bool local_1 = false;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bHidden' from a null 'FObjectiveSingleConfig' DataObject!");
        }
        FObjectiveSingleConfig local_104;
        return local_104.bHidden;
    }
    return local_1;
}
UFUNCTION()
FText __FObjectiveSingleConfig_GetObjectiveTitle(const TDataObjectPtr<FObjectiveSingleConfig> &inout DataObject)
{
    FText __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ObjectiveTitle' from a null 'FObjectiveSingleConfig' DataObject!");
        }
        FObjectiveSingleConfig local_104;
        return local_104.ObjectiveTitle;
    }
    return __r;
}
UFUNCTION()
FText __FObjectiveSingleConfig_GetObjectiveProgressFormat(const TDataObjectPtr<FObjectiveSingleConfig> &inout DataObject)
{
    FText __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ObjectiveProgressFormat' from a null 'FObjectiveSingleConfig' DataObject!");
        }
        FObjectiveSingleConfig local_104;
        return local_104.ObjectiveProgressFormat;
    }
    return __r;
}
UFUNCTION()
EObjectiveProgressTextType __FObjectiveSingleConfig_GetProgressTextType(const TDataObjectPtr<FObjectiveSingleConfig> &inout DataObject)
{
    int local_105 = 0;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ProgressTextType' from a null 'FObjectiveSingleConfig' DataObject!");
        }
        FObjectiveSingleConfig local_104;
        local_105 = int(local_104.ProgressTextType);
        return EObjectiveProgressTextType(local_105);
    }
    return EObjectiveProgressTextType(local_105);
}
UFUNCTION()
EObjectiveProgressUIType __FObjectiveSingleConfig_GetProgressUIType(const TDataObjectPtr<FObjectiveSingleConfig> &inout DataObject)
{
    int local_105 = 0;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ProgressUIType' from a null 'FObjectiveSingleConfig' DataObject!");
        }
        FObjectiveSingleConfig local_104;
        local_105 = int(local_104.ProgressUIType);
        return EObjectiveProgressUIType(local_105);
    }
    return EObjectiveProgressUIType(local_105);
}
UFUNCTION()
EObjectiveProgressTextOrderType __FObjectiveSingleConfig_GetProgressTextOrderType(const TDataObjectPtr<FObjectiveSingleConfig> &inout DataObject)
{
    int local_105 = 0;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ProgressTextOrderType' from a null 'FObjectiveSingleConfig' DataObject!");
        }
        FObjectiveSingleConfig local_104;
        local_105 = int(local_104.ProgressTextOrderType);
        return EObjectiveProgressTextOrderType(local_105);
    }
    return EObjectiveProgressTextOrderType(local_105);
}
UFUNCTION()
bool __FObjectiveSingleConfig_GetbIgnoreStatusInGroup(const TDataObjectPtr<FObjectiveSingleConfig> &inout DataObject)
{
    bool local_1 = false;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bIgnoreStatusInGroup' from a null 'FObjectiveSingleConfig' DataObject!");
        }
        FObjectiveSingleConfig local_104;
        return local_104.bIgnoreStatusInGroup;
    }
    return local_1;
}
UFUNCTION()
TDataObjectPtr<FConditionConfigBase> __FObjectiveSingleConfig_GetFinishCondition(const TDataObjectPtr<FObjectiveSingleConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'FinishCondition' from a null 'FObjectiveSingleConfig' DataObject!");
        }
        FObjectiveSingleConfig local_104;
        return local_104.GetFinishCondition();
    }
    return GetFinishCondition();
}
UFUNCTION()
TDataObjectPtr<FConditionConfigBase> __FObjectiveSingleConfig_GetFailCondition(const TDataObjectPtr<FObjectiveSingleConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'FailCondition' from a null 'FObjectiveSingleConfig' DataObject!");
        }
        FObjectiveSingleConfig local_104;
        return local_104.GetFailCondition();
    }
    return GetFailCondition();
}
UFUNCTION()
FGuideConfig __FObjectiveSingleConfig_GetGuideConfig(const TDataObjectPtr<FObjectiveSingleConfig> &inout DataObject)
{
    FGuideConfig __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'GuideConfig' from a null 'FObjectiveSingleConfig' DataObject!");
        }
    }
    else
    {
    }
    return __r;
}
UFUNCTION()
FObjectiveSingleConfig CastToFObjectiveSingleConfig(const TDataObjectPtr<FObjectiveSingleConfig> &inout DataObject)
{
    FObjectiveSingleConfig __r;
    return __r;
}
}
namespace __FObjectiveGroupConfigFunctions
{
UFUNCTION()
EObjectiveFinishType __FObjectiveGroupConfig_GetFinishType(const TDataObjectPtr<FObjectiveGroupConfig> &inout DataObject)
{
    int local_23 = 0;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'FinishType' from a null 'FObjectiveGroupConfig' DataObject!");
        }
        FObjectiveGroupConfig local_22;
        local_23 = int(local_22.FinishType);
        return EObjectiveFinishType(local_23);
    }
    return EObjectiveFinishType(local_23);
}
UFUNCTION()
TArray<TDataObjectPtr<FObjectiveSingleConfig>> __FObjectiveGroupConfig_GetChildObjectives(const TDataObjectPtr<FObjectiveGroupConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ChildObjectives' from a null 'FObjectiveGroupConfig' DataObject!");
        }
        FObjectiveGroupConfig local_22;
        return local_22.GetChildObjectives();
    }
    return GetChildObjectives();
}
UFUNCTION()
FObjectiveGroupConfig CastToFObjectiveGroupConfig(const TDataObjectPtr<FObjectiveGroupConfig> &inout DataObject)
{
    FObjectiveGroupConfig __r;
    return __r;
}
}
