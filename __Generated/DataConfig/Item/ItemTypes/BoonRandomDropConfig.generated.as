namespace __FBoonRandomTraitPoolConfigFunctions
{
UFUNCTION()
TArray<FBoonRandomSingleTrait> __FBoonRandomTraitPoolConfig_GetTraitParams(const TDataObjectPtr<FBoonRandomTraitPoolConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'TraitParams' from a null 'FBoonRandomTraitPoolConfig' DataObject!");
        }
        FBoonRandomTraitPoolConfig local_18;
        return local_18.TraitParams;
    }
    return DataObject.Get().TraitParams;
}
UFUNCTION()
FBoonRandomTraitPoolConfig CastToFBoonRandomTraitPoolConfig(const TDataObjectPtr<FBoonRandomTraitPoolConfig> &inout DataObject)
{
    FBoonRandomTraitPoolConfig __r;
    return __r;
}
}
namespace __FBoonRandomSlotsConfigFunctions
{
UFUNCTION()
TArray<FBoonRandomSingleSlot> __FBoonRandomSlotsConfig_GetSlots(const TDataObjectPtr<FBoonRandomSlotsConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Slots' from a null 'FBoonRandomSlotsConfig' DataObject!");
        }
        FBoonRandomSlotsConfig local_18;
        return local_18.Slots;
    }
    return DataObject.Get().Slots;
}
UFUNCTION()
FBoonRandomSlotsConfig CastToFBoonRandomSlotsConfig(const TDataObjectPtr<FBoonRandomSlotsConfig> &inout DataObject)
{
    FBoonRandomSlotsConfig __r;
    return __r;
}
}
