class UESMAction_SendLevelValueEvent : UESMBPBaseInstantAction
{
    UPROPERTY()
    FName EventName;
    UPROPERTY()
    int Count;

    UESMAction_SendLevelValueEvent()
    {
        return;
    }
    UFUNCTION()
    void Do_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        ::FLevelUtils::SendCustomLevelValueEvent(this.EventName, this.Count);
        return;
    }
}

