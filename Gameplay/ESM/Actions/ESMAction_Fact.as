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
        const FECSEntity& local_2 = Context.GetEntity();
        ::FFactUtils::SetCurrentActionName(local_2, this.ActionName);
        return;
    }
    UFUNCTION()
    void Exit_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        ::FFactUtils::SetCurrentActionName(Context.GetEntity(), "");
        return;
    }
}

