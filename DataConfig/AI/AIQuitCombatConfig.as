
enum EAIQuitCombatRule
{
    BaseOnCombatArea,
    BaseOnFlock,
    NeverQuitCombat,
    BaseOnSelf,
}

enum EAIBackHomeWay
{
    Walk,
    Teleport,
}


struct FAIQuitCombatConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    float32 QuitCombatDelay = 20.0f;
    UPROPERTY()
    float32 QuitCombatDistance = 3000.0f;
    UPROPERTY()
    float32 ResumeCombatDelay = 8.0f;
    UPROPERTY()
    float32 ReturnToHomeAcceptRadius = 800.0f;
    UPROPERTY()
    float32 CombatRadius = 5000.0f;
    UPROPERTY()
    EAIQuitCombatRule QuitCombatRule = EAIQuitCombatRule(0);
    UPROPERTY()
    EAIBackHomeWay BackHomeWay = EAIBackHomeWay(0);


}

