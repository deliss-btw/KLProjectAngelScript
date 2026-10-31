namespace __FBoonRandomTraitPoolConfigFunctions
{
UFUNCTION()
TArray<FBoonRandomSingleTrait> __FBoonRandomTraitPoolConfig_GetTraitParams(const TDataObjectPtr<FBoonRandomTraitPoolConfig> &inout DataObject)
{
    TArray<FBoonRandomSingleTrait> __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'TraitParams' from a null 'FBoonRandomTraitPoolConfig' DataObject!");
        }
        FBoonRandomTraitPoolConfig local_18;
        return local_18.TraitParams;
    }
    return __r;
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
    TArray<FBoonRandomSingleSlot> __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Slots' from a null 'FBoonRandomSlotsConfig' DataObject!");
        }
        FBoonRandomSlotsConfig local_18;
        return local_18.Slots;
    }
    return __r;
}
UFUNCTION()
FBoonRandomSlotsConfig CastToFBoonRandomSlotsConfig(const TDataObjectPtr<FBoonRandomSlotsConfig> &inout DataObject)
{
    FBoonRandomSlotsConfig __r;
    return __r;
}
}
