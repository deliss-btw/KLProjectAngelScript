namespace __FCraftConfigFunctions
{
UFUNCTION()
ECraftType __FCraftConfig_GetCraftType(const TDataObjectPtr<FCraftConfig> &inout DataObject)
{
    int local_77 = 0;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'CraftType' from a null 'FCraftConfig' DataObject!");
        }
        FCraftConfig local_76;
        local_77 = int(local_76.CraftType);
        return ECraftType(local_77);
    }
    return ECraftType(local_77);
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
    TArray<FItemParamConfig> __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Cost' from a null 'FCraftConfig' DataObject!");
        }
        FCraftConfig local_76;
        return local_76.Cost;
    }
    return __r;
}
UFUNCTION()
bool __FCraftConfig_GetbCanBatch(const TDataObjectPtr<FCraftConfig> &inout DataObject)
{
    bool local_1 = false;
    if ((DataObject == nullptr))
    {
        local_1 = !(EUIGlobals::GIsDuringPropertyConversion);
        if (local_1)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bCanBatch' from a null 'FCraftConfig' DataObject!");
        }
        FCraftConfig local_76;
        return local_76.bCanBatch;
    }
    return local_1;
}
UFUNCTION()
bool __FCraftConfig_GetbDefaultUnlock(const TDataObjectPtr<FCraftConfig> &inout DataObject)
{
    bool local_1 = false;
    if ((DataObject == nullptr))
    {
        local_1 = !(EUIGlobals::GIsDuringPropertyConversion);
        if (local_1)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bDefaultUnlock' from a null 'FCraftConfig' DataObject!");
        }
        FCraftConfig local_76;
        return local_76.bDefaultUnlock;
    }
    return local_1;
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
    return GetUnlockCond();
}
UFUNCTION()
FText __FCraftConfig_GetNote(const TDataObjectPtr<FCraftConfig> &inout DataObject)
{
    FText __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Note' from a null 'FCraftConfig' DataObject!");
        }
        FCraftConfig local_76;
        return local_76.Note;
    }
    return __r;
}
UFUNCTION()
FCraftConfig CastToFCraftConfig(const TDataObjectPtr<FCraftConfig> &inout DataObject)
{
    FCraftConfig __r;
    return __r;
}
}
