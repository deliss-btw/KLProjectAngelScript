
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
    // body not fully recovered вЂ” stub [opcode-uncovered]
    return nullptr;
}
UFUNCTION()
FBuffConfigRef __FCombatItemConfig_GetItemBuffConfig(const TDataObjectPtr<FCombatItemConfig> &inout DataObject)
{
    // body not fully recovered вЂ” stub [opcode-uncovered]
    FBuffConfigRef __r; return __r;
}
UFUNCTION()
FCombatItemConfig CastToFCombatItemConfig(const TDataObjectPtr<FCombatItemConfig> &inout DataObject)
{
    FCombatItemConfig __r;
    return __r;
}
}
