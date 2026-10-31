namespace __FGameplayItemConfigFunctions
{
UFUNCTION()
FGameplayItemConfig CastToFGameplayItemConfig(const TDataObjectPtr<FGameplayItemConfig> &inout DataObject)
{
    FGameplayItemConfig __r;
    return __r;
}
}
namespace __FCombatItemConfigFunctions
{
UFUNCTION()
const USkillConfig __FCombatItemConfig_GetItemSkillConfig(const TDataObjectPtr<FCombatItemConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ItemSkillConfig' from a null 'FCombatItemConfig' DataObject!");
        }
        FCombatItemConfig local_216;
        return local_216.ItemSkillConfig;
    }
    USkillConfig local_218;
    return local_218;
}
UFUNCTION()
FBuffConfigRef __FCombatItemConfig_GetItemBuffConfig(const TDataObjectPtr<FCombatItemConfig> &inout DataObject)
{
    FBuffConfigRef __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ItemBuffConfig' from a null 'FCombatItemConfig' DataObject!");
        }
        FCombatItemConfig local_216;
        return local_216.ItemBuffConfig;
    }
    return __r;
}
UFUNCTION()
FCombatItemConfig CastToFCombatItemConfig(const TDataObjectPtr<FCombatItemConfig> &inout DataObject)
{
    FCombatItemConfig __r;
    return __r;
}
}
