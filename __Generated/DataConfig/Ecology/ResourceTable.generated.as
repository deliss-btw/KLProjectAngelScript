namespace __FEcologyResourceDefinitionRowFunctions
{
UFUNCTION()
FName __FEcologyResourceDefinitionRow_GetResourceName(const TDataObjectPtr<FEcologyResourceDefinitionRow> &inout DataObject)
{
    FName __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ResourceName' from a null 'FEcologyResourceDefinitionRow' DataObject!");
        }
        FEcologyResourceDefinitionRow local_56;
        return local_56.ResourceName;
    }
    return __r;
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
    return GetBaseResource();
}
UFUNCTION()
bool __FEcologyResourceDefinitionRow_GetLimitSlot(const TDataObjectPtr<FEcologyResourceDefinitionRow> &inout DataObject)
{
    bool local_1 = false;
    if ((DataObject == nullptr))
    {
        local_1 = !(EUIGlobals::GIsDuringPropertyConversion);
        if (local_1)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'LimitSlot' from a null 'FEcologyResourceDefinitionRow' DataObject!");
        }
        FEcologyResourceDefinitionRow local_56;
        return local_56.LimitSlot;
    }
    return local_1;
}
UFUNCTION()
FGameplayTagContainer __FEcologyResourceDefinitionRow_GetGameplayTags(const TDataObjectPtr<FEcologyResourceDefinitionRow> &inout DataObject)
{
    FGameplayTagContainer __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'GameplayTags' from a null 'FEcologyResourceDefinitionRow' DataObject!");
        }
        FEcologyResourceDefinitionRow local_56;
        return local_56.GameplayTags;
    }
    return __r;
}
UFUNCTION()
TSubclassOf<AActor> __FEcologyResourceDefinitionRow_GetPreview(const TDataObjectPtr<FEcologyResourceDefinitionRow> &inout DataObject)
{
    TSubclassOf<AActor> __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Preview' from a null 'FEcologyResourceDefinitionRow' DataObject!");
        }
        FEcologyResourceDefinitionRow local_56;
        return local_56.Preview;
    }
    return __r;
}
UFUNCTION()
FEcologyResourceDefinitionRow CastToFEcologyResourceDefinitionRow(const TDataObjectPtr<FEcologyResourceDefinitionRow> &inout DataObject)
{
    FEcologyResourceDefinitionRow __r;
    return __r;
}
}
