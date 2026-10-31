namespace __FObjectiveConfigFunctions
{
UFUNCTION()
EObjectiveType __FObjectiveConfig_GetObjectiveType(const TDataObjectPtr<FObjectiveConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ObjectiveType' from a null 'FObjectiveConfig' DataObject!");
        }
        FObjectiveConfig local_16;
        return local_16.ObjectiveType;
    }
    return DataObject.Get().ObjectiveType;
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
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bHidden' from a null 'FObjectiveSingleConfig' DataObject!");
        }
        FObjectiveSingleConfig local_104;
        return local_104.bHidden;
    }
    return DataObject.Get().bHidden;
}
UFUNCTION()
FText __FObjectiveSingleConfig_GetObjectiveTitle(const TDataObjectPtr<FObjectiveSingleConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ObjectiveTitle' from a null 'FObjectiveSingleConfig' DataObject!");
        }
        FObjectiveSingleConfig local_104;
        return local_104.ObjectiveTitle;
    }
    return DataObject.Get().ObjectiveTitle;
}
UFUNCTION()
FText __FObjectiveSingleConfig_GetObjectiveProgressFormat(const TDataObjectPtr<FObjectiveSingleConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ObjectiveProgressFormat' from a null 'FObjectiveSingleConfig' DataObject!");
        }
        FObjectiveSingleConfig local_104;
        return local_104.ObjectiveProgressFormat;
    }
    return DataObject.Get().ObjectiveProgressFormat;
}
UFUNCTION()
EObjectiveProgressTextType __FObjectiveSingleConfig_GetProgressTextType(const TDataObjectPtr<FObjectiveSingleConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ProgressTextType' from a null 'FObjectiveSingleConfig' DataObject!");
        }
        FObjectiveSingleConfig local_104;
        return local_104.ProgressTextType;
    }
    return DataObject.Get().ProgressTextType;
}
UFUNCTION()
EObjectiveProgressUIType __FObjectiveSingleConfig_GetProgressUIType(const TDataObjectPtr<FObjectiveSingleConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ProgressUIType' from a null 'FObjectiveSingleConfig' DataObject!");
        }
        FObjectiveSingleConfig local_104;
        return local_104.ProgressUIType;
    }
    return DataObject.Get().ProgressUIType;
}
UFUNCTION()
EObjectiveProgressTextOrderType __FObjectiveSingleConfig_GetProgressTextOrderType(const TDataObjectPtr<FObjectiveSingleConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ProgressTextOrderType' from a null 'FObjectiveSingleConfig' DataObject!");
        }
        FObjectiveSingleConfig local_104;
        return local_104.ProgressTextOrderType;
    }
    return DataObject.Get().ProgressTextOrderType;
}
UFUNCTION()
bool __FObjectiveSingleConfig_GetbIgnoreStatusInGroup(const TDataObjectPtr<FObjectiveSingleConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bIgnoreStatusInGroup' from a null 'FObjectiveSingleConfig' DataObject!");
        }
        FObjectiveSingleConfig local_104;
        return local_104.bIgnoreStatusInGroup;
    }
    return DataObject.Get().bIgnoreStatusInGroup;
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
    return DataObject.Get().GetFinishCondition();
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
    return DataObject.Get().GetFailCondition();
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
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'FinishType' from a null 'FObjectiveGroupConfig' DataObject!");
        }
        FObjectiveGroupConfig local_22;
        return local_22.FinishType;
    }
    return DataObject.Get().FinishType;
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
    return DataObject.Get().GetChildObjectives();
}
UFUNCTION()
FObjectiveGroupConfig CastToFObjectiveGroupConfig(const TDataObjectPtr<FObjectiveGroupConfig> &inout DataObject)
{
    FObjectiveGroupConfig __r;
    return __r;
}
}
