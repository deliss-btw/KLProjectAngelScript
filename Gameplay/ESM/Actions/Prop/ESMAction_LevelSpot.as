class UESMAction_OverrideLevelSpotPresentation : UESMBPBaseInstantAction
{
    UPROPERTY()
    TDataObjectPtr<FPresentationConfig> OverridePresentationConfig;
    UPROPERTY()
    TDataObjectPtr<FPresentationRuleConfig> OverridePresentationRuleConfig;

    UESMAction_OverrideLevelSpotPresentation()
    {
        return;
    }
    UFUNCTION()
    FLinearColor GetBackgroundColor_Implementation() const
    {
        return ESMActionColor::Combat;
    }
    UFUNCTION()
    void Do_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        ::EntityLevelSpotUtils::AddSpotData(Context.GetEntity(), ELevelSpotDataSource(4), FLevelSpotData(this.OverridePresentationConfig, this.OverridePresentationRuleConfig));
        return;
    }
}

