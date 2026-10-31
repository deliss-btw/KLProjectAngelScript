namespace __FEcologyResourceDefinitionRowFunctions
{
UFUNCTION()
FName __FEcologyResourceDefinitionRow_GetResourceName(const TDataObjectPtr<FEcologyResourceDefinitionRow> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ResourceName' from a null 'FEcologyResourceDefinitionRow' DataObject!");
        }
        FEcologyResourceDefinitionRow local_56;
        return local_56.ResourceName;
    }
    return DataObject.Get().ResourceName;
}
UFUNCTION()
TDataObjectPtr<FEcologyResourceDefinitionRow> __FEcologyResourceDefinitionRow_GetBaseResource(const TDataObjectPtr<FEcologyResourceDefinitionRow> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'BaseResource' from a null 'FEcologyResourceDefinitionRow' DataObject!");
        }
        FEcologyResourceDefinitionRow local_56;
        return local_56.GetBaseResource();
    }
    return DataObject.Get().GetBaseResource();
}
UFUNCTION()
bool __FEcologyResourceDefinitionRow_GetLimitSlot(const TDataObjectPtr<FEcologyResourceDefinitionRow> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'LimitSlot' from a null 'FEcologyResourceDefinitionRow' DataObject!");
        }
        FEcologyResourceDefinitionRow local_56;
        return local_56.LimitSlot;
    }
    return DataObject.Get().LimitSlot;
}
UFUNCTION()
FGameplayTagContainer __FEcologyResourceDefinitionRow_GetGameplayTags(const TDataObjectPtr<FEcologyResourceDefinitionRow> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'GameplayTags' from a null 'FEcologyResourceDefinitionRow' DataObject!");
        }
        FEcologyResourceDefinitionRow local_56;
        return local_56.GameplayTags;
    }
    return DataObject.Get().GameplayTags;
}
UFUNCTION()
TSubclassOf<AActor> __FEcologyResourceDefinitionRow_GetPreview(const TDataObjectPtr<FEcologyResourceDefinitionRow> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Preview' from a null 'FEcologyResourceDefinitionRow' DataObject!");
        }
        FEcologyResourceDefinitionRow local_56;
        return local_56.Preview;
    }
    return DataObject.Get().Preview;
}
UFUNCTION()
FEcologyResourceDefinitionRow CastToFEcologyResourceDefinitionRow(const TDataObjectPtr<FEcologyResourceDefinitionRow> &inout DataObject)
{
    FEcologyResourceDefinitionRow __r;
    return __r;
}
}
