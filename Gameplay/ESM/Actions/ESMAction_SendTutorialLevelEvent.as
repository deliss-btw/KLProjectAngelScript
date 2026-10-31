class UESMAction_SendTutorialLevelEvent : UESMBPBaseInstantAction
{
    UPROPERTY()
    FName EventName;

    UESMAction_SendTutorialLevelEvent()
    {
        return;
    }
    UFUNCTION()
    void Do_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        FCE_CustomLevelEvent local_10;
        FFPTime local_6 = FFPTime(-1);
        if (local_10)
        {
            local_10.CustomName = this.EventName;
            local_10.bIsTutorialEvent = true;
        }
        return;
    }
}

