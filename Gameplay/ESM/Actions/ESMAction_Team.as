

class UESMAction_AddTeamLinkEnergy : UESMBPBaseInstantAction
{
    UPROPERTY()
    float32 AddLinkEnergy;

    UESMAction_AddTeamLinkEnergy()
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
        return;
    }
}

