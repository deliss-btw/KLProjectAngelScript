namespace __FRedPointNodeConfigFunctions
{
UFUNCTION()
ERedDotType __FRedPointNodeConfig_GetNodeDisplayType(const TDataObjectPtr<FRedPointNodeConfig> &inout DataObject)
{
    int local_23 = 0;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'NodeDisplayType' from a null 'FRedPointNodeConfig' DataObject!");
        }
        FRedPointNodeConfig local_22;
        local_23 = int(local_22.NodeDisplayType);
        return ERedDotType(local_23);
    }
    return ERedDotType(local_23);
}
UFUNCTION()
FGameplayTag __FRedPointNodeConfig_GetNodeTag(const TDataObjectPtr<FRedPointNodeConfig> &inout DataObject)
{
    FGameplayTag __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'NodeTag' from a null 'FRedPointNodeConfig' DataObject!");
        }
        FRedPointNodeConfig local_22;
        return local_22.NodeTag;
    }
    return __r;
}
UFUNCTION()
TArray<TDataObjectPtr<FRedPointNodeConfig>> __FRedPointNodeConfig_GetParentNodeList(const TDataObjectPtr<FRedPointNodeConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ParentNodeList' from a null 'FRedPointNodeConfig' DataObject!");
        }
        FRedPointNodeConfig local_22;
        return local_22.GetParentNodeList();
    }
    return GetParentNodeList();
}
UFUNCTION()
FRedPointNodeConfig CastToFRedPointNodeConfig(const TDataObjectPtr<FRedPointNodeConfig> &inout DataObject)
{
    FRedPointNodeConfig __r;
    return __r;
}
}
namespace __FRedPointConfigFunctions
{
UFUNCTION()
ESystemModule __FRedPointConfig_GetModuleType(const TDataObjectPtr<FRedPointConfig> &inout DataObject)
{
    int local_41 = 0;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ModuleType' from a null 'FRedPointConfig' DataObject!");
        }
        FRedPointConfig local_40;
        local_41 = int(local_40.ModuleType);
        return ESystemModule(local_41);
    }
    return ESystemModule(local_41);
}
UFUNCTION()
ERedPointEvent __FRedPointConfig_GetEventType(const TDataObjectPtr<FRedPointConfig> &inout DataObject)
{
    int local_41 = 0;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'EventType' from a null 'FRedPointConfig' DataObject!");
        }
        FRedPointConfig local_40;
        local_41 = int(local_40.EventType);
        return ERedPointEvent(local_41);
    }
    return ERedPointEvent(local_41);
}
UFUNCTION()
TDataObjectPtr<FRedPointNodeConfig> __FRedPointConfig_GetNodeConfig(const TDataObjectPtr<FRedPointConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'NodeConfig' from a null 'FRedPointConfig' DataObject!");
        }
        FRedPointConfig local_40;
        return local_40.GetNodeConfig();
    }
    return GetNodeConfig();
}
UFUNCTION()
FRedPointConfig CastToFRedPointConfig(const TDataObjectPtr<FRedPointConfig> &inout DataObject)
{
    FRedPointConfig __r;
    return __r;
}
}
