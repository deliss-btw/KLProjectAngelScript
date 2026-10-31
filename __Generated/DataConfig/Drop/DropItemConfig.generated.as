namespace __FDropItemConfigBaseFunctions
{
UFUNCTION()
FString __FDropItemConfigBase_GetComments(const TDataObjectPtr<FDropItemConfigBase> &inout DataObject)
{
    FString __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Comments' from a null 'FDropItemConfigBase' DataObject!");
        }
        FDropItemConfigBase local_18;
        return local_18.Comments;
    }
    return __r;
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
    TSoftClassPtr<ACollectionPrefab> __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'GroundBagPrefab' from a null 'FDropItemGroundBagConfig' DataObject!");
        }
        FDropItemGroundBagConfig local_30;
        return local_30.GroundBagPrefab;
    }
    return __r;
}
UFUNCTION()
FText __FDropItemGroundBagConfig_GetGroundBagInteractText(const TDataObjectPtr<FDropItemGroundBagConfig> &inout DataObject)
{
    FText __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'GroundBagInteractText' from a null 'FDropItemGroundBagConfig' DataObject!");
        }
        FDropItemGroundBagConfig local_30;
        return local_30.GroundBagInteractText;
    }
    return __r;
}
UFUNCTION()
bool __FDropItemGroundBagConfig_GetbShowRewardPopup(const TDataObjectPtr<FDropItemGroundBagConfig> &inout DataObject)
{
    bool local_1 = false;
    if ((DataObject == nullptr))
    {
        local_1 = !(EUIGlobals::GIsDuringPropertyConversion);
        if (local_1)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bShowRewardPopup' from a null 'FDropItemGroundBagConfig' DataObject!");
        }
        FDropItemGroundBagConfig local_30;
        return local_30.bShowRewardPopup;
    }
    return local_1;
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
    TArray<FDropItemData> __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Drops' from a null 'FDropItemConfig' DataObject!");
        }
        FDropItemConfig local_50;
        return local_50.Drops;
    }
    return __r;
}
UFUNCTION()
EDropItemAllocation __FDropItemConfig_GetDropAllocation(const TDataObjectPtr<FDropItemConfig> &inout DataObject)
{
    int local_51 = 0;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DropAllocation' from a null 'FDropItemConfig' DataObject!");
        }
        FDropItemConfig local_50;
        local_51 = int(local_50.DropAllocation);
        return EDropItemAllocation(local_51);
    }
    return EDropItemAllocation(local_51);
}
UFUNCTION()
EDSDropType __FDropItemConfig_GetDropType(const TDataObjectPtr<FDropItemConfig> &inout DataObject)
{
    int local_51 = 0;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DropType' from a null 'FDropItemConfig' DataObject!");
        }
        FDropItemConfig local_50;
        local_51 = int(local_50.DropType);
        return EDSDropType(local_51);
    }
    return EDSDropType(local_51);
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
    return GetGroundBagConfig();
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
    TArray<FDropGroupItemData> __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Drops' from a null 'FDropItemGroupConfig' DataObject!");
        }
        FDropItemGroupConfig local_50;
        return local_50.Drops;
    }
    return __r;
}
UFUNCTION()
EDropItemAllocation __FDropItemGroupConfig_GetDropAllocation(const TDataObjectPtr<FDropItemGroupConfig> &inout DataObject)
{
    int local_51 = 0;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DropAllocation' from a null 'FDropItemGroupConfig' DataObject!");
        }
        FDropItemGroupConfig local_50;
        local_51 = int(local_50.DropAllocation);
        return EDropItemAllocation(local_51);
    }
    return EDropItemAllocation(local_51);
}
UFUNCTION()
EDropTriggerType __FDropItemGroupConfig_GetTriggerType(const TDataObjectPtr<FDropItemGroupConfig> &inout DataObject)
{
    int local_51 = 0;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'TriggerType' from a null 'FDropItemGroupConfig' DataObject!");
        }
        FDropItemGroupConfig local_50;
        local_51 = int(local_50.TriggerType);
        return EDropTriggerType(local_51);
    }
    return EDropTriggerType(local_51);
}
UFUNCTION()
EDSDropType __FDropItemGroupConfig_GetDropType(const TDataObjectPtr<FDropItemGroupConfig> &inout DataObject)
{
    int local_51 = 0;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DropType' from a null 'FDropItemGroupConfig' DataObject!");
        }
        FDropItemGroupConfig local_50;
        local_51 = int(local_50.DropType);
        return EDSDropType(local_51);
    }
    return EDSDropType(local_51);
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
    return GetGroundBagConfig();
}
UFUNCTION()
FDropItemGroupConfig CastToFDropItemGroupConfig(const TDataObjectPtr<FDropItemGroupConfig> &inout DataObject)
{
    FDropItemGroupConfig __r;
    return __r;
}
}
