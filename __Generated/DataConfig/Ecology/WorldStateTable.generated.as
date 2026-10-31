namespace __FTODTagDefinitionRowFunctions
{
UFUNCTION()
EHour __FTODTagDefinitionRow_GetStartHour(const TDataObjectPtr<FTODTagDefinitionRow> &inout DataObject)
{
    int local_29 = 0;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'StartHour' from a null 'FTODTagDefinitionRow' DataObject!");
        }
        FTODTagDefinitionRow local_28;
        local_29 = int(local_28.StartHour);
        return EHour(local_29);
    }
    return EHour(local_29);
}
UFUNCTION()
EMinute __FTODTagDefinitionRow_GetStartMinute(const TDataObjectPtr<FTODTagDefinitionRow> &inout DataObject)
{
    int local_29 = 0;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'StartMinute' from a null 'FTODTagDefinitionRow' DataObject!");
        }
        FTODTagDefinitionRow local_28;
        local_29 = int(local_28.StartMinute);
        return EMinute(local_29);
    }
    return EMinute(local_29);
}
UFUNCTION()
EHour __FTODTagDefinitionRow_GetEndHour(const TDataObjectPtr<FTODTagDefinitionRow> &inout DataObject)
{
    int local_29 = 0;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'EndHour' from a null 'FTODTagDefinitionRow' DataObject!");
        }
        FTODTagDefinitionRow local_28;
        local_29 = int(local_28.EndHour);
        return EHour(local_29);
    }
    return EHour(local_29);
}
UFUNCTION()
EMinute __FTODTagDefinitionRow_GetEndMinute(const TDataObjectPtr<FTODTagDefinitionRow> &inout DataObject)
{
    int local_29 = 0;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'EndMinute' from a null 'FTODTagDefinitionRow' DataObject!");
        }
        FTODTagDefinitionRow local_28;
        local_29 = int(local_28.EndMinute);
        return EMinute(local_29);
    }
    return EMinute(local_29);
}
UFUNCTION()
FGameplayTagContainer __FTODTagDefinitionRow_GetTags(const TDataObjectPtr<FTODTagDefinitionRow> &inout DataObject)
{
    FGameplayTagContainer __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Tags' from a null 'FTODTagDefinitionRow' DataObject!");
        }
        FTODTagDefinitionRow local_28;
        return local_28.Tags;
    }
    return __r;
}
UFUNCTION()
FTODTagDefinitionRow CastToFTODTagDefinitionRow(const TDataObjectPtr<FTODTagDefinitionRow> &inout DataObject)
{
    FTODTagDefinitionRow __r;
    return __r;
}
}
namespace __FSpawnerCountRatioDefinitionRowFunctions
{
UFUNCTION()
TDataObjectPtr<FCreatureDefinitionRow> __FSpawnerCountRatioDefinitionRow_GetCreature(const TDataObjectPtr<FSpawnerCountRatioDefinitionRow> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Creature' from a null 'FSpawnerCountRatioDefinitionRow' DataObject!");
        }
        FSpawnerCountRatioDefinitionRow local_90;
        return local_90.GetCreature();
    }
    return GetCreature();
}
UFUNCTION()
TDataObjectPtr<FEcologyResourceDefinitionRow> __FSpawnerCountRatioDefinitionRow_GetResource(const TDataObjectPtr<FSpawnerCountRatioDefinitionRow> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Resource' from a null 'FSpawnerCountRatioDefinitionRow' DataObject!");
        }
        FSpawnerCountRatioDefinitionRow local_90;
        return local_90.GetResource();
    }
    return GetResource();
}
UFUNCTION()
FGameplayTagContainer __FSpawnerCountRatioDefinitionRow_GetWeatherElementTag(const TDataObjectPtr<FSpawnerCountRatioDefinitionRow> &inout DataObject)
{
    FGameplayTagContainer __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'WeatherElementTag' from a null 'FSpawnerCountRatioDefinitionRow' DataObject!");
        }
        FSpawnerCountRatioDefinitionRow local_90;
        return local_90.WeatherElementTag;
    }
    return __r;
}
UFUNCTION()
FGameplayTagContainer __FSpawnerCountRatioDefinitionRow_GetDaySegmentsTag(const TDataObjectPtr<FSpawnerCountRatioDefinitionRow> &inout DataObject)
{
    FGameplayTagContainer __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DaySegmentsTag' from a null 'FSpawnerCountRatioDefinitionRow' DataObject!");
        }
        FSpawnerCountRatioDefinitionRow local_90;
        return local_90.DaySegmentsTag;
    }
    return __r;
}
UFUNCTION()
int __FSpawnerCountRatioDefinitionRow_GetPriority(const TDataObjectPtr<FSpawnerCountRatioDefinitionRow> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Priority' from a null 'FSpawnerCountRatioDefinitionRow' DataObject!");
        }
        FSpawnerCountRatioDefinitionRow defaultValue;
        return defaultValue.Priority;
    }
    return DataObject.Get().Priority;
}
UFUNCTION()
float32 __FSpawnerCountRatioDefinitionRow_GetBatchCountSpawnRatio(const TDataObjectPtr<FSpawnerCountRatioDefinitionRow> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'BatchCountSpawnRatio' from a null 'FSpawnerCountRatioDefinitionRow' DataObject!");
        }
        FSpawnerCountRatioDefinitionRow defaultValue;
        return defaultValue.BatchCountSpawnRatio;
    }
    return DataObject.Get().BatchCountSpawnRatio;
}
UFUNCTION()
float32 __FSpawnerCountRatioDefinitionRow_GetCreatureCountSpawnRatio(const TDataObjectPtr<FSpawnerCountRatioDefinitionRow> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'CreatureCountSpawnRatio' from a null 'FSpawnerCountRatioDefinitionRow' DataObject!");
        }
        FSpawnerCountRatioDefinitionRow defaultValue;
        return defaultValue.CreatureCountSpawnRatio;
    }
    return DataObject.Get().CreatureCountSpawnRatio;
}
UFUNCTION()
FSpawnerCountRatioDefinitionRow CastToFSpawnerCountRatioDefinitionRow(const TDataObjectPtr<FSpawnerCountRatioDefinitionRow> &inout DataObject)
{
    FSpawnerCountRatioDefinitionRow __r;
    return __r;
}
}
