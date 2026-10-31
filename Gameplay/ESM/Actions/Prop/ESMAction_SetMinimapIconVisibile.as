class UESMAction_SetMinimapIconVisibile : UESMBPBaseInstantAction
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
        XError(ELog(0), "SetMinimapIconVisible is not deprecated, use level spot instead");
        return;
    }
}

