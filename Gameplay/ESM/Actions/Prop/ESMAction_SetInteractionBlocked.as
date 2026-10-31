class UESMAction_SetInteractionBlocked : UESMBPBaseInstantAction
{
    UPROPERTY()
    bool bBlocked = true;

    UFUNCTION()
    FLinearColor GetBackgroundColor_Implementation() const
    {
        return ESMActionColor::Combat;
    }
    UFUNCTION()
    void Do_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        ::FInteractUtils::SetInteractionBlocked(Context.GetEntity(), (this.bBlocked));
        return;
    }
}

