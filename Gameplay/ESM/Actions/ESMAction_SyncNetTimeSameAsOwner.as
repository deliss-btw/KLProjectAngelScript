

class UESMAction_SyncNetTimeSameAsOwner : UESMBPBaseSpanAction
{
    UESMAction_SyncNetTimeSameAsOwner()
    {
        return;
    }
    UFUNCTION()
    void GetRestriction_Implementation(FESMNotifyRestriction &inout OutParam) const
    {
        OutParam.bExclusive = true;
        OutParam.IdentifyName = UESMAction_SyncNetTimeSameAsOwner.opArrow().GetFName();
        return;
    }
    UFUNCTION()
    void Enter_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        Assign local_4;
        local_4.opCall(FC_InterpoBlendSameAsOwnerTag());
        return;
    }
    UFUNCTION()
    void Exit_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        Remove local_4;
        local_4.opCall();
        return;
    }
}

