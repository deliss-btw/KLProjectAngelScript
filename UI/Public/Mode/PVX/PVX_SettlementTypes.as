
enum EPVX_SettlementPhaseType
{
    Result,
    Performance,
}


struct FPVX_SettlementPhaseConfig
{
    UPROPERTY()
    EPVX_SettlementPhaseType PhaseType;
    UPROPERTY()
    float32 Duration = 15.0f;
    UPROPERTY()
    TSoftClassPtr<UEUIUserWidget> PhaseWidgetClass;


}

struct FPVX_SettlementFactionPhases
{
    UPROPERTY()
    EFaction Faction;
    UPROPERTY()
    TArray<EPVX_SettlementPhaseType> Phases;


}

