namespace __FNPCDailyRouteConfigFunctions
{
UFUNCTION()
FName __FNPCDailyRouteConfig_GetRouteSourceId(const TDataObjectPtr<FNPCDailyRouteConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'RouteSourceId' from a null 'FNPCDailyRouteConfig' DataObject!");
        }
        FNPCDailyRouteConfig local_24;
        return local_24.RouteSourceId;
    }
    return DataObject.Get().RouteSourceId;
}
UFUNCTION()
FName __FNPCDailyRouteConfig_GetPlanName(const TDataObjectPtr<FNPCDailyRouteConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'PlanName' from a null 'FNPCDailyRouteConfig' DataObject!");
        }
        FNPCDailyRouteConfig local_24;
        return local_24.PlanName;
    }
    return DataObject.Get().PlanName;
}
UFUNCTION()
TArray<FNPCDailyRouteNodeConfig> __FNPCDailyRouteConfig_GetNodes(const TDataObjectPtr<FNPCDailyRouteConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Nodes' from a null 'FNPCDailyRouteConfig' DataObject!");
        }
        FNPCDailyRouteConfig local_24;
        return local_24.Nodes;
    }
    return DataObject.Get().Nodes;
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
