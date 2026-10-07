

class UESMAction_ForceKeepSprint : UESMBPBaseSpanAction
{
    UESMAction_ForceKeepSprint()
    {
        return;
    }
    UFUNCTION()
    FLinearColor GetBackgroundColor_Implementation() const
    {
        return ESMActionColor::Movement;
    }
    UFUNCTION()
    void Enter_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        Modify local_4;
        FC_CharacterKeepSprint& local_6 = local_4.opCall();
        if (local_6)
        {
            if (FFPTime(local_6.GetSprintOnTime()).opCmp(0.0) >= 0)
            {
                local_6.SetSprintOnTime(FFPTime(0));
            }
        }
        return;
    }
}

