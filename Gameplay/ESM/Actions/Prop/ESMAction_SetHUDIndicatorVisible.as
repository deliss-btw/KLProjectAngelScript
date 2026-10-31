class UESMAction_SetHUDIndicatorVisibile : UESMBPBaseInstantAction
{
    UPROPERTY()
    bool bIsVisible = true;

    UFUNCTION()
    FLinearColor GetBackgroundColor_Implementation() const
    {
        return ESMActionColor::Combat;
    }
    UFUNCTION()
    void Do_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        XWarning(ELog(22), "UESMAction_SetHUDIndicatorVisibile 已废弃且不再生效：HUDIndicatorSystem 已被基于 Spot 的 Indicator / HeadsUpDisplay 体系取代。");
        return;
    }
}

