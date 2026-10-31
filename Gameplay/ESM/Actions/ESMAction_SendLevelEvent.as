class UESMAction_SendLevelEvent : UESMBPBaseInstantAction
{
    UPROPERTY()
    FName EventName;

    UESMAction_SendLevelEvent()
    {
        return;
    }
    UFUNCTION()
    void Do_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        int local_20 = 0;
        FECSWorldPtr local_2 = Context.GetECSWorld();
        Get local_6;
        if (local_6.opCall())
        {
            FFPTime local_16 = FFPTime(-1);
            if (local_20)
            {
                local_20.CustomName = this.EventName;
            }
        }
        return;
    }
}

