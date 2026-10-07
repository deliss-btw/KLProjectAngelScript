

class UESMAction_ActionFactMark : UESMBPBaseSpanAction
{
    UPROPERTY()
    FString ActionName;

    UESMAction_ActionFactMark()
    {
        return;
    }
    UFUNCTION()
    void Enter_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        ::FFactUtils::SetCurrentActionName(Context.GetEntity(), this.ActionName);
        return;
    }
    UFUNCTION()
    void Exit_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        ::FFactUtils::SetCurrentActionName(Context.GetEntity(), "");
        return;
    }
}

