namespace __FCraftConfigFunctions
{
UFUNCTION()
ECraftType __FCraftConfig_GetCraftType(const TDataObjectPtr<FCraftConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'CraftType' from a null 'FCraftConfig' DataObject!");
        }
        FCraftConfig local_76;
        return local_76.CraftType;
    }
    return DataObject.Get().CraftType;
}
UFUNCTION()
FItemParamConfig __FCraftConfig_GetProduct(const TDataObjectPtr<FCraftConfig> &inout DataObject)
{
    FItemParamConfig __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Product' from a null 'FCraftConfig' DataObject!");
        }
    }
    else
    {
    }
    return __r;
}
UFUNCTION()
TArray<FItemParamConfig> __FCraftConfig_GetCost(const TDataObjectPtr<FCraftConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Cost' from a null 'FCraftConfig' DataObject!");
        }
        FCraftConfig local_76;
        return local_76.Cost;
    }
    return DataObject.Get().Cost;
}
UFUNCTION()
bool __FCraftConfig_GetbCanBatch(const TDataObjectPtr<FCraftConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bCanBatch' from a null 'FCraftConfig' DataObject!");
        }
        FCraftConfig local_76;
        return local_76.bCanBatch;
    }
    return DataObject.Get().bCanBatch;
}
UFUNCTION()
bool __FCraftConfig_GetbDefaultUnlock(const TDataObjectPtr<FCraftConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bDefaultUnlock' from a null 'FCraftConfig' DataObject!");
        }
        FCraftConfig local_76;
        return local_76.bDefaultUnlock;
    }
    return DataObject.Get().bDefaultUnlock;
}
UFUNCTION()
TDataObjectPtr<FConditionConfig> __FCraftConfig_GetUnlockCond(const TDataObjectPtr<FCraftConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'UnlockCond' from a null 'FCraftConfig' DataObject!");
        }
        FCraftConfig local_76;
        return local_76.GetUnlockCond();
    }
    return DataObject.Get().GetUnlockCond();
}
UFUNCTION()
FText __FCraftConfig_GetNote(const TDataObjectPtr<FCraftConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Note' from a null 'FCraftConfig' DataObject!");
        }
        FCraftConfig local_76;
        return local_76.Note;
    }
    return DataObject.Get().Note;
}
UFUNCTION()
FCraftConfig CastToFCraftConfig(const TDataObjectPtr<FCraftConfig> &inout DataObject)
{
    FCraftConfig __r;
    return __r;
}
}
