namespace __FDropItemConfigBaseFunctions
{
UFUNCTION()
FString __FDropItemConfigBase_GetComments(const TDataObjectPtr<FDropItemConfigBase> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Comments' from a null 'FDropItemConfigBase' DataObject!");
        }
        FDropItemConfigBase local_18;
        return local_18.Comments;
    }
    return DataObject.Get().Comments;
}
UFUNCTION()
FDropItemConfigBase CastToFDropItemConfigBase(const TDataObjectPtr<FDropItemConfigBase> &inout DataObject)
{
    FDropItemConfigBase __r;
    return __r;
}
}
namespace __FDropItemGroundBagConfigFunctions
{
UFUNCTION()
TSoftClassPtr<ACollectionPrefab> __FDropItemGroundBagConfig_GetGroundBagPrefab(const TDataObjectPtr<FDropItemGroundBagConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'GroundBagPrefab' from a null 'FDropItemGroundBagConfig' DataObject!");
        }
        FDropItemGroundBagConfig local_30;
        return local_30.GroundBagPrefab;
    }
    return DataObject.Get().GroundBagPrefab;
}
UFUNCTION()
FText __FDropItemGroundBagConfig_GetGroundBagInteractText(const TDataObjectPtr<FDropItemGroundBagConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'GroundBagInteractText' from a null 'FDropItemGroundBagConfig' DataObject!");
        }
        FDropItemGroundBagConfig local_30;
        return local_30.GroundBagInteractText;
    }
    return DataObject.Get().GroundBagInteractText;
}
UFUNCTION()
bool __FDropItemGroundBagConfig_GetbShowRewardPopup(const TDataObjectPtr<FDropItemGroundBagConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bShowRewardPopup' from a null 'FDropItemGroundBagConfig' DataObject!");
        }
        FDropItemGroundBagConfig local_30;
        return local_30.bShowRewardPopup;
    }
    return DataObject.Get().bShowRewardPopup;
}
UFUNCTION()
FDropItemGroundBagConfig CastToFDropItemGroundBagConfig(const TDataObjectPtr<FDropItemGroundBagConfig> &inout DataObject)
{
    FDropItemGroundBagConfig __r;
    return __r;
}
}
namespace __FDropItemConfigFunctions
{
UFUNCTION()
TArray<FDropItemData> __FDropItemConfig_GetDrops(const TDataObjectPtr<FDropItemConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Drops' from a null 'FDropItemConfig' DataObject!");
        }
        FDropItemConfig local_50;
        return local_50.Drops;
    }
    return DataObject.Get().Drops;
}
UFUNCTION()
EDropItemAllocation __FDropItemConfig_GetDropAllocation(const TDataObjectPtr<FDropItemConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DropAllocation' from a null 'FDropItemConfig' DataObject!");
        }
        FDropItemConfig local_50;
        return local_50.DropAllocation;
    }
    return DataObject.Get().DropAllocation;
}
UFUNCTION()
EDSDropType __FDropItemConfig_GetDropType(const TDataObjectPtr<FDropItemConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DropType' from a null 'FDropItemConfig' DataObject!");
        }
        FDropItemConfig local_50;
        return local_50.DropType;
    }
    return DataObject.Get().DropType;
}
UFUNCTION()
TDataObjectPtr<FDropItemGroundBagConfig> __FDropItemConfig_GetGroundBagConfig(const TDataObjectPtr<FDropItemConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'GroundBagConfig' from a null 'FDropItemConfig' DataObject!");
        }
        FDropItemConfig local_50;
        return local_50.GetGroundBagConfig();
    }
    return DataObject.Get().GetGroundBagConfig();
}
UFUNCTION()
FDropItemConfig CastToFDropItemConfig(const TDataObjectPtr<FDropItemConfig> &inout DataObject)
{
    FDropItemConfig __r;
    return __r;
}
}
namespace __FDropItemGroupConfigFunctions
{
UFUNCTION()
TArray<FDropGroupItemData> __FDropItemGroupConfig_GetDrops(const TDataObjectPtr<FDropItemGroupConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Drops' from a null 'FDropItemGroupConfig' DataObject!");
        }
        FDropItemGroupConfig local_50;
        return local_50.Drops;
    }
    return DataObject.Get().Drops;
}
UFUNCTION()
EDropItemAllocation __FDropItemGroupConfig_GetDropAllocation(const TDataObjectPtr<FDropItemGroupConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DropAllocation' from a null 'FDropItemGroupConfig' DataObject!");
        }
        FDropItemGroupConfig local_50;
        return local_50.DropAllocation;
    }
    return DataObject.Get().DropAllocation;
}
UFUNCTION()
EDropTriggerType __FDropItemGroupConfig_GetTriggerType(const TDataObjectPtr<FDropItemGroupConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'TriggerType' from a null 'FDropItemGroupConfig' DataObject!");
        }
        FDropItemGroupConfig local_50;
        return local_50.TriggerType;
    }
    return DataObject.Get().TriggerType;
}
UFUNCTION()
EDSDropType __FDropItemGroupConfig_GetDropType(const TDataObjectPtr<FDropItemGroupConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DropType' from a null 'FDropItemGroupConfig' DataObject!");
        }
        FDropItemGroupConfig local_50;
        return local_50.DropType;
    }
    return DataObject.Get().DropType;
}
UFUNCTION()
TDataObjectPtr<FDropItemGroundBagConfig> __FDropItemGroupConfig_GetGroundBagConfig(const TDataObjectPtr<FDropItemGroupConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'GroundBagConfig' from a null 'FDropItemGroupConfig' DataObject!");
        }
        FDropItemGroupConfig local_50;
        return local_50.GetGroundBagConfig();
    }
    return DataObject.Get().GetGroundBagConfig();
}
UFUNCTION()
FDropItemGroupConfig CastToFDropItemGroupConfig(const TDataObjectPtr<FDropItemGroupConfig> &inout DataObject)
{
    FDropItemGroupConfig __r;
    return __r;
}
}
