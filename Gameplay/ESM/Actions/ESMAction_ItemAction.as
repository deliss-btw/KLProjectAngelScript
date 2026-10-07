

class UESMAction_ItemAction : UESMBPBaseSpanTickAction
{
    UPROPERTY()
    float PayCostTime;

    UESMAction_ItemAction()
    {
        return;
    }
    UFUNCTION()
    void Enter_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        0.NotifyEnterESMAction();
        return;
    }
    UFUNCTION()
    void Exit_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        0.NotifyExitESMAction();
        return;
    }
    UFUNCTION()
    void Tick_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        Get local_10;
        if (FFPTime(Time.ActionTime).opCmp(this.PayCostTime) >= 0 && !(local_10.opCall().GetbHasPayCost()))
        {
            Modify local_16;
            local_16.opCall().NotifyESMActionPayCost();
        }
        return;
    }
    UFUNCTION()
    void GetExtraTimeStamp_Implementation(TArray<FESMExtraTimeStamp> &inout OutTimeStamps) const
    {
        FESMExtraTimeStamp local_4;
        local_4.ActionTime = this.PayCostTime;
        local_4.SetbDisplayIndexOnTimeline(false);
        local_4.SetbDisplayOnTimeline(true);
        OutTimeStamps.Add(local_4);
        return;
    }
    UFUNCTION()
    void OnExtraTimeStampChanged_Implementation(const int Index, const FESMExtraTimeStamp &inout ChangedExtraTimeStamp)
    {
        this.PayCostTime = ChangedExtraTimeStamp.ActionTime.ToSeconds();
        return;
    }
}

class UESMAction_ItemActionTrigger : UESMBPBaseInstantAction
{
    UPROPERTY()
    FGameplayTag CostomTrigger;

    UESMAction_ItemActionTrigger()
    {
        return;
    }
    UFUNCTION()
    void Do_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        Modify local_4;
        local_4.opCall().NotifyESMActionCustomTrigger(this.CostomTrigger);
        return;
    }
}

