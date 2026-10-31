namespace __FCookEnergyThresholdConfigFunctions
{
UFUNCTION()
int __FCookEnergyThresholdConfig_GetMinAbundance(const TDataObjectPtr<FCookEnergyThresholdConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'MinAbundance' from a null 'FCookEnergyThresholdConfig' DataObject!");
        }
        FCookEnergyThresholdConfig defaultValue;
        return defaultValue.MinAbundance;
    }
    return DataObject.Get().MinAbundance;
}
UFUNCTION()
int __FCookEnergyThresholdConfig_GetMaxAbundance(const TDataObjectPtr<FCookEnergyThresholdConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'MaxAbundance' from a null 'FCookEnergyThresholdConfig' DataObject!");
        }
        FCookEnergyThresholdConfig defaultValue;
        return defaultValue.MaxAbundance;
    }
    return DataObject.Get().MaxAbundance;
}
UFUNCTION()
int __FCookEnergyThresholdConfig_GetAbundanceTierLevel(const TDataObjectPtr<FCookEnergyThresholdConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'AbundanceTierLevel' from a null 'FCookEnergyThresholdConfig' DataObject!");
        }
        FCookEnergyThresholdConfig defaultValue;
        return defaultValue.AbundanceTierLevel;
    }
    return DataObject.Get().AbundanceTierLevel;
}
UFUNCTION()
FText __FCookEnergyThresholdConfig_GetDescription(const TDataObjectPtr<FCookEnergyThresholdConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Description' from a null 'FCookEnergyThresholdConfig' DataObject!");
        }
        FCookEnergyThresholdConfig local_22;
        return local_22.Description;
    }
    return DataObject.Get().Description;
}
UFUNCTION()
FCookEnergyThresholdConfig CastToFCookEnergyThresholdConfig(const TDataObjectPtr<FCookEnergyThresholdConfig> &inout DataObject)
{
    FCookEnergyThresholdConfig __r;
    return __r;
}
}
namespace __FCookStatModifierLadderConfigFunctions
{
UFUNCTION()
ECookStatType __FCookStatModifierLadderConfig_GetStatType(const TDataObjectPtr<FCookStatModifierLadderConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'StatType' from a null 'FCookStatModifierLadderConfig' DataObject!");
        }
        FCookStatModifierLadderConfig local_42;
        return local_42.StatType;
    }
    return DataObject.Get().StatType;
}
UFUNCTION()
int __FCookStatModifierLadderConfig_GetLookupValue(const TDataObjectPtr<FCookStatModifierLadderConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'LookupValue' from a null 'FCookStatModifierLadderConfig' DataObject!");
        }
        FCookStatModifierLadderConfig defaultValue;
        return defaultValue.LookupValue;
    }
    return DataObject.Get().LookupValue;
}
UFUNCTION()
TDataObjectPtr<FGameplayModifierConfig> __FCookStatModifierLadderConfig_GetModifier(const TDataObjectPtr<FCookStatModifierLadderConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Modifier' from a null 'FCookStatModifierLadderConfig' DataObject!");
        }
        FCookStatModifierLadderConfig local_42;
        return local_42.GetModifier();
    }
    return DataObject.Get().GetModifier();
}
UFUNCTION()
FCookStatModifierLadderConfig CastToFCookStatModifierLadderConfig(const TDataObjectPtr<FCookStatModifierLadderConfig> &inout DataObject)
{
    FCookStatModifierLadderConfig __r;
    return __r;
}
}
namespace __FFoodProductConfigFunctions
{
UFUNCTION()
FSoftBrush __FFoodProductConfig_GetProductIcon(const TDataObjectPtr<FFoodProductConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ProductIcon' from a null 'FFoodProductConfig' DataObject!");
        }
        FFoodProductConfig local_100;
        return local_100.ProductIcon;
    }
    return DataObject.Get().ProductIcon;
}
UFUNCTION()
FText __FFoodProductConfig_GetProductName(const TDataObjectPtr<FFoodProductConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ProductName' from a null 'FFoodProductConfig' DataObject!");
        }
        FFoodProductConfig local_100;
        return local_100.ProductName;
    }
    return DataObject.Get().ProductName;
}
UFUNCTION()
EItemRarity __FFoodProductConfig_GetProductRarity(const TDataObjectPtr<FFoodProductConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ProductRarity' from a null 'FFoodProductConfig' DataObject!");
        }
        FFoodProductConfig local_100;
        return local_100.ProductRarity;
    }
    return DataObject.Get().ProductRarity;
}
UFUNCTION()
int __FFoodProductConfig_GetOrderID(const TDataObjectPtr<FFoodProductConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'OrderID' from a null 'FFoodProductConfig' DataObject!");
        }
        FFoodProductConfig defaultValue;
        return defaultValue.OrderID;
    }
    return DataObject.Get().OrderID;
}
UFUNCTION()
FText __FFoodProductConfig_GetProductDescription(const TDataObjectPtr<FFoodProductConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ProductDescription' from a null 'FFoodProductConfig' DataObject!");
        }
        FFoodProductConfig local_100;
        return local_100.ProductDescription;
    }
    return DataObject.Get().ProductDescription;
}
UFUNCTION()
TDataObjectPtr<FMetaBuffConfig> __FFoodProductConfig_GetMetaBuffConfig(const TDataObjectPtr<FFoodProductConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'MetaBuffConfig' from a null 'FFoodProductConfig' DataObject!");
        }
        FFoodProductConfig local_100;
        return local_100.GetMetaBuffConfig();
    }
    return DataObject.Get().GetMetaBuffConfig();
}
UFUNCTION()
FFoodProductConfig CastToFFoodProductConfig(const TDataObjectPtr<FFoodProductConfig> &inout DataObject)
{
    FFoodProductConfig __r;
    return __r;
}
}
namespace __FFoodCraftConfigFunctions
{
UFUNCTION()
int __FFoodCraftConfig_GetPriority(const TDataObjectPtr<FFoodCraftConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Priority' from a null 'FFoodCraftConfig' DataObject!");
        }
        FFoodCraftConfig defaultValue;
        return defaultValue.Priority;
    }
    return DataObject.Get().Priority;
}
UFUNCTION()
TMap<FGameplayTag, int> __FFoodCraftConfig_GetRequiredCookTagSums(const TDataObjectPtr<FFoodCraftConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'RequiredCookTagSums' from a null 'FFoodCraftConfig' DataObject!");
        }
        FFoodCraftConfig local_60;
        return local_60.RequiredCookTagSums;
    }
    return DataObject.Get().RequiredCookTagSums;
}
UFUNCTION()
TDataObjectPtr<FFoodProductConfig> __FFoodCraftConfig_GetProductFood(const TDataObjectPtr<FFoodCraftConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ProductFood' from a null 'FFoodCraftConfig' DataObject!");
        }
        FFoodCraftConfig local_60;
        return local_60.GetProductFood();
    }
    return DataObject.Get().GetProductFood();
}
UFUNCTION()
FFoodCraftConfig CastToFFoodCraftConfig(const TDataObjectPtr<FFoodCraftConfig> &inout DataObject)
{
    FFoodCraftConfig __r;
    return __r;
}
}
