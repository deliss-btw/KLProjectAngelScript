namespace __FMaterialItemConfigFunctions
{
UFUNCTION()
FMaterialItemConfig CastToFMaterialItemConfig(const TDataObjectPtr<FMaterialItemConfig> &inout DataObject)
{
    FMaterialItemConfig __r;
    return __r;
}
}
namespace __FCraftItemMaterialConfigFunctions
{
UFUNCTION()
FCraftItemMaterialConfig CastToFCraftItemMaterialConfig(const TDataObjectPtr<FCraftItemMaterialConfig> &inout DataObject)
{
    FCraftItemMaterialConfig __r;
    return __r;
}
}
namespace __FEquipmentMaterialConfigFunctions
{
UFUNCTION()
FEquipmentMaterialConfig CastToFEquipmentMaterialConfig(const TDataObjectPtr<FEquipmentMaterialConfig> &inout DataObject)
{
    FEquipmentMaterialConfig __r;
    return __r;
}
}
namespace __FCookMaterialConfigFunctions
{
UFUNCTION()
int __FCookMaterialConfig_GetEnergyAbundance(const TDataObjectPtr<FCookMaterialConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'EnergyAbundance' from a null 'FCookMaterialConfig' DataObject!");
        }
        FCookMaterialConfig defaultValue;
        return defaultValue.EnergyAbundance;
    }
    return DataObject.Get().EnergyAbundance;
}
UFUNCTION()
TMap<FGameplayTag, int> __FCookMaterialConfig_GetCookTags(const TDataObjectPtr<FCookMaterialConfig> &inout DataObject)
{
    TMap<FGameplayTag, int> __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'CookTags' from a null 'FCookMaterialConfig' DataObject!");
        }
        FCookMaterialConfig local_228;
        return local_228.CookTags;
    }
    return __r;
}
UFUNCTION()
TArray<FCookIngredientAttribute> __FCookMaterialConfig_GetAbundanceTier1Attributes(const TDataObjectPtr<FCookMaterialConfig> &inout DataObject)
{
    TArray<FCookIngredientAttribute> __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'AbundanceTier1Attributes' from a null 'FCookMaterialConfig' DataObject!");
        }
        FCookMaterialConfig local_228;
        return local_228.AbundanceTier1Attributes;
    }
    return __r;
}
UFUNCTION()
TArray<FCookIngredientAttribute> __FCookMaterialConfig_GetAbundanceTier2Attributes(const TDataObjectPtr<FCookMaterialConfig> &inout DataObject)
{
    TArray<FCookIngredientAttribute> __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'AbundanceTier2Attributes' from a null 'FCookMaterialConfig' DataObject!");
        }
        FCookMaterialConfig local_228;
        return local_228.AbundanceTier2Attributes;
    }
    return __r;
}
UFUNCTION()
TArray<FCookIngredientAttribute> __FCookMaterialConfig_GetAbundanceTier3Attributes(const TDataObjectPtr<FCookMaterialConfig> &inout DataObject)
{
    TArray<FCookIngredientAttribute> __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'AbundanceTier3Attributes' from a null 'FCookMaterialConfig' DataObject!");
        }
        FCookMaterialConfig local_228;
        return local_228.AbundanceTier3Attributes;
    }
    return __r;
}
UFUNCTION()
TArray<FCookIngredientAttribute> __FCookMaterialConfig_GetAbundanceTier4Attributes(const TDataObjectPtr<FCookMaterialConfig> &inout DataObject)
{
    TArray<FCookIngredientAttribute> __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'AbundanceTier4Attributes' from a null 'FCookMaterialConfig' DataObject!");
        }
        FCookMaterialConfig local_228;
        return local_228.AbundanceTier4Attributes;
    }
    return __r;
}
UFUNCTION()
FCookMaterialConfig CastToFCookMaterialConfig(const TDataObjectPtr<FCookMaterialConfig> &inout DataObject)
{
    FCookMaterialConfig __r;
    return __r;
}
}
namespace __FTestThreeChooseOneItemConfigFunctions
{
UFUNCTION()
TDataObjectPtr<FBoonRandomSlotsConfig> __FTestThreeChooseOneItemConfig_GetBoonRandomSlots(const TDataObjectPtr<FTestThreeChooseOneItemConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'BoonRandomSlots' from a null 'FTestThreeChooseOneItemConfig' DataObject!");
        }
        FTestThreeChooseOneItemConfig local_212;
        return local_212.GetBoonRandomSlots();
    }
    return GetBoonRandomSlots();
}
UFUNCTION()
FTestThreeChooseOneItemConfig CastToFTestThreeChooseOneItemConfig(const TDataObjectPtr<FTestThreeChooseOneItemConfig> &inout DataObject)
{
    FTestThreeChooseOneItemConfig __r;
    return __r;
}
}
