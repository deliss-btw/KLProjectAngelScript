enum ETreasureBoxState
{
    Default,
    CoolDown,
    Ready,
    FirstEncounter,
    Opening,
}

struct FTreasureBoxStateData
{
    UPROPERTY()
    FName StateMachineName = FName("Main");
    UPROPERTY()
    FName StateName = FName("CoolDown");
    UPROPERTY()
    TDataObjectPtr<FPresentationConfig> PresentationConfig;
    UPROPERTY()
    TDataObjectPtr<FPresentationRuleConfig> PresentationRuleConfig;
    UPROPERTY()
    bool bFallBack;
    UPROPERTY()
    ETreasureBoxState FallBack;

}

