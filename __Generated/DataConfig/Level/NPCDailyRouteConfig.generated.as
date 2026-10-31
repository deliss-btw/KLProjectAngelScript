namespace __FNPCDailyRouteConfigFunctions
{
UFUNCTION()
FName __FNPCDailyRouteConfig_GetRouteSourceId(const TDataObjectPtr<FNPCDailyRouteConfig> &inout DataObject)
{
    FName __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'RouteSourceId' from a null 'FNPCDailyRouteConfig' DataObject!");
        }
        FNPCDailyRouteConfig local_24;
        return local_24.RouteSourceId;
    }
    return __r;
}
UFUNCTION()
FName __FNPCDailyRouteConfig_GetPlanName(const TDataObjectPtr<FNPCDailyRouteConfig> &inout DataObject)
{
    FName __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'PlanName' from a null 'FNPCDailyRouteConfig' DataObject!");
        }
        FNPCDailyRouteConfig local_24;
        return local_24.PlanName;
    }
    return __r;
}
UFUNCTION()
TArray<FNPCDailyRouteNodeConfig> __FNPCDailyRouteConfig_GetNodes(const TDataObjectPtr<FNPCDailyRouteConfig> &inout DataObject)
{
    TArray<FNPCDailyRouteNodeConfig> __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Nodes' from a null 'FNPCDailyRouteConfig' DataObject!");
        }
        FNPCDailyRouteConfig local_24;
        return local_24.Nodes;
    }
    return __r;
}
UFUNCTION()
int __FNPCDailyRouteConfig_GetLoopStartIndex(const TDataObjectPtr<FNPCDailyRouteConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'LoopStartIndex' from a null 'FNPCDailyRouteConfig' DataObject!");
        }
        FNPCDailyRouteConfig defaultValue;
        return defaultValue.LoopStartIndex;
    }
    return DataObject.Get().LoopStartIndex;
}
UFUNCTION()
FNPCDailyRouteConfig CastToFNPCDailyRouteConfig(const TDataObjectPtr<FNPCDailyRouteConfig> &inout DataObject)
{
    FNPCDailyRouteConfig __r;
    return __r;
}
}
