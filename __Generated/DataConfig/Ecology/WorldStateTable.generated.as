namespace __FTODTagDefinitionRowFunctions
{
UFUNCTION()
EHour __FTODTagDefinitionRow_GetStartHour(const TDataObjectPtr<FTODTagDefinitionRow> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'StartHour' from a null 'FTODTagDefinitionRow' DataObject!");
        }
        FTODTagDefinitionRow local_28;
        return local_28.StartHour;
    }
    return DataObject.Get().StartHour;
}
UFUNCTION()
EMinute __FTODTagDefinitionRow_GetStartMinute(const TDataObjectPtr<FTODTagDefinitionRow> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'StartMinute' from a null 'FTODTagDefinitionRow' DataObject!");
        }
        FTODTagDefinitionRow local_28;
        return local_28.StartMinute;
    }
    return DataObject.Get().StartMinute;
}
UFUNCTION()
EHour __FTODTagDefinitionRow_GetEndHour(const TDataObjectPtr<FTODTagDefinitionRow> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'EndHour' from a null 'FTODTagDefinitionRow' DataObject!");
        }
        FTODTagDefinitionRow local_28;
        return local_28.EndHour;
    }
    return DataObject.Get().EndHour;
}
UFUNCTION()
EMinute __FTODTagDefinitionRow_GetEndMinute(const TDataObjectPtr<FTODTagDefinitionRow> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'EndMinute' from a null 'FTODTagDefinitionRow' DataObject!");
        }
        FTODTagDefinitionRow local_28;
        return local_28.EndMinute;
    }
    return DataObject.Get().EndMinute;
}
UFUNCTION()
FGameplayTagContainer __FTODTagDefinitionRow_GetTags(const TDataObjectPtr<FTODTagDefinitionRow> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Tags' from a null 'FTODTagDefinitionRow' DataObject!");
        }
        FTODTagDefinitionRow local_28;
        return local_28.Tags;
    }
    return DataObject.Get().Tags;
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
    return DataObject.Get().GetCreature();
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
    return DataObject.Get().GetResource();
}
UFUNCTION()
FGameplayTagContainer __FSpawnerCountRatioDefinitionRow_GetWeatherElementTag(const TDataObjectPtr<FSpawnerCountRatioDefinitionRow> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'WeatherElementTag' from a null 'FSpawnerCountRatioDefinitionRow' DataObject!");
        }
        FSpawnerCountRatioDefinitionRow local_90;
        return local_90.WeatherElementTag;
    }
    return DataObject.Get().WeatherElementTag;
}
UFUNCTION()
FGameplayTagContainer __FSpawnerCountRatioDefinitionRow_GetDaySegmentsTag(const TDataObjectPtr<FSpawnerCountRatioDefinitionRow> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DaySegmentsTag' from a null 'FSpawnerCountRatioDefinitionRow' DataObject!");
        }
        FSpawnerCountRatioDefinitionRow local_90;
        return local_90.DaySegmentsTag;
    }
    return DataObject.Get().DaySegmentsTag;
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
