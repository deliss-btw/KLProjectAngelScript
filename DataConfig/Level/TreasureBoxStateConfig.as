
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
    FName StateMachineName;
    UPROPERTY()
    FName StateName;
    UPROPERTY()
    TDataObjectPtr<FPresentationConfig> PresentationConfig;
    UPROPERTY()
    TDataObjectPtr<FPresentationRuleConfig> PresentationRuleConfig;
    UPROPERTY()
    bool bFallBack;
    UPROPERTY()
    ETreasureBoxState FallBack;

    FTreasureBoxStateData()
    {
        this.bFallBack = false;
        this.FallBack = ETreasureBoxState(0);
        FName local_4 = FName("Main");
        this.StateName = FName("CoolDown");
        return;
    }
}

