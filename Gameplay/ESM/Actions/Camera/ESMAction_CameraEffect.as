

class UESMAction_DisableCharacterOutliner : UESMBPBaseSpanAction
{
    UESMAction_DisableCharacterOutliner()
    {
        return;
    }
    UFUNCTION()
    EESMActionType GetActionType_Implementation() const
    {
        return EESMActionType(2);
    }
    UFUNCTION()
    void ViewEnter_Implementation(const FESMViewContext &inout Context, const FESMActionTime &inout Time) const
    {
        FC_CameraOutlinerDisableCounter local_6;
        ++local_6.Counter;
        ::CharacterOutline::UpdatePawnOutline(Context.GetEntity());
        return;
    }
    UFUNCTION()
    void ViewExit_Implementation(const FESMViewContext &inout Context, const FESMActionTime &inout Time) const
    {
        Modify local_4;
        FC_CameraOutlinerDisableCounter& local_6 = local_4.opCall();
        if (local_6)
        {
            --local_6.Counter;
            if (int(local_6.Counter) <= 0)
            {
                Remove local_14;
                local_14.opCall();
            }
            ::CharacterOutline::UpdatePawnOutline(Context.GetEntity());
        }
        return;
    }
}

class UESMAction_DisableEntityOcclusionFade : UESMBPBaseSpanAction
{
    UESMAction_DisableEntityOcclusionFade()
    {
        return;
    }
    UFUNCTION()
    EESMActionType GetActionType_Implementation() const
    {
        return EESMActionType(2);
    }
    UFUNCTION()
    void ViewEnter_Implementation(const FESMViewContext &inout Context, const FESMActionTime &inout Time) const
    {
        FC_CameraOcclusionFadeDisableCounter local_6;
        ++local_6.Counter;
        return;
    }
    UFUNCTION()
    void ViewExit_Implementation(const FESMViewContext &inout Context, const FESMActionTime &inout Time) const
    {
        Modify local_4;
        FC_CameraOcclusionFadeDisableCounter& local_6 = local_4.opCall();
        if (local_6)
        {
            --local_6.Counter;
            if (int(local_6.Counter) <= 0)
            {
                Remove local_14;
                local_14.opCall();
            }
        }
        return;
    }
}

