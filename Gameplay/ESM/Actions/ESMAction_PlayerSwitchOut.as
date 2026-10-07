

class UESMAction_PlayerSwtichOut : UESMBPBaseInstantAction
{
    UESMAction_PlayerSwtichOut()
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
        FECSEntity local_4 = Context.GetEntity();
        Has local_8;
        bool local_9 = local_8.opCall();
        if (local_9)
        {
            return;
        }
        ::FSwitchPlayerUtils::SwitchOutPlayer(local_4);
        return;
    }
}

