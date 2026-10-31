namespace __FCommissionPropAttributeConfigFunctions
{
UFUNCTION()
FCommissionAttributeScale __FCommissionPropAttributeConfig_GetAttributeModifierToPlayer(const TDataObjectPtr<FCommissionPropAttributeConfig> &inout DataObject)
{
    FCommissionAttributeScale __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'AttributeModifierToPlayer' from a null 'FCommissionPropAttributeConfig' DataObject!");
        }
    }
    else
    {
    }
    return __r;
}
UFUNCTION()
TMap<EMonsterRank, FCommissionAttributeScale> __FCommissionPropAttributeConfig_GetAttributeModifiersToMonster(const TDataObjectPtr<FCommissionPropAttributeConfig> &inout DataObject)
{
    TMap<EMonsterRank, FCommissionAttributeScale> __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'AttributeModifiersToMonster' from a null 'FCommissionPropAttributeConfig' DataObject!");
        }
        FCommissionPropAttributeConfig local_74;
        return local_74.AttributeModifiersToMonster;
    }
    return __r;
}
UFUNCTION()
FCommissionAttributeScale __FCommissionPropAttributeConfig_GetAttributeModifiersOfSelf(const TDataObjectPtr<FCommissionPropAttributeConfig> &inout DataObject)
{
    FCommissionAttributeScale __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'AttributeModifiersOfSelf' from a null 'FCommissionPropAttributeConfig' DataObject!");
        }
    }
    else
    {
    }
    return __r;
}
UFUNCTION()
FCommissionPropAttributeConfig CastToFCommissionPropAttributeConfig(const TDataObjectPtr<FCommissionPropAttributeConfig> &inout DataObject)
{
    FCommissionPropAttributeConfig __r;
    return __r;
}
}
