

class UESMAction_ClearKeepSprint : UESMBPBaseSpanAction
{
    UESMAction_ClearKeepSprint()
    {
        return;
    }
    UFUNCTION()
    EESMActionExclusiveType GetExclusiveType_Implementation() const
    {
        return EESMActionExclusiveType(0);
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
            local_6.SetSprintOnTime(Time.WorldTime);
        }
        return;
    }
}

