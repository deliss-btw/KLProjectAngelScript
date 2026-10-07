

class UESMAction_AnimUseAimTargetControl : UESMBPBaseSpanAction
{
    UESMAction_AnimUseAimTargetControl()
    {
        return;
    }
    UFUNCTION()
    bool IsNotifyTypeAllowed_Implementation(const EESMNotifyType InType) const
    {
        return (int(InType) == 1 || (int(InType) == 2));
    }
    UFUNCTION()
    void Enter_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        ::FC_AnimAimTargetControl::SetUseAnimAimTargetControl(Context.GetEntity(), true);
        return;
    }
    UFUNCTION()
    void Exit_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        ::FC_AnimAimTargetControl::SetUseAnimAimTargetControl(Context.GetEntity(), false);
        return;
    }
}

