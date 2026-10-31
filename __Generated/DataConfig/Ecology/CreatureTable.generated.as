namespace __FCreatureDefinitionRowFunctions
{
UFUNCTION()
FName __FCreatureDefinitionRow_GetCreatureName(const TDataObjectPtr<FCreatureDefinitionRow> &inout DataObject)
{
    FName __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'CreatureName' from a null 'FCreatureDefinitionRow' DataObject!");
        }
        FCreatureDefinitionRow local_40;
        return local_40.CreatureName;
    }
    return __r;
}
UFUNCTION()
TDataObjectPtr<FCreatureDefinitionRow> __FCreatureDefinitionRow_GetBaseCreature(const TDataObjectPtr<FCreatureDefinitionRow> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'BaseCreature' from a null 'FCreatureDefinitionRow' DataObject!");
        }
        FCreatureDefinitionRow local_40;
        return local_40.GetBaseCreature();
    }
    return GetBaseCreature();
}
UFUNCTION()
FCreatureDefinitionRow CastToFCreatureDefinitionRow(const TDataObjectPtr<FCreatureDefinitionRow> &inout DataObject)
{
    FCreatureDefinitionRow __r;
    return __r;
}
}
