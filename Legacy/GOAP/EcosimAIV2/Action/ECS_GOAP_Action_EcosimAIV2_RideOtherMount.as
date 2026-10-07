

class UGOAPAction_EcosimAIV2_RideOtherMount : UGOAP_ActionScriptableBase
{
    UPROPERTY()
    FString ActivatedString = "Activated";
    UPROPERTY()
    FString FinishedString = "Finished";
    UPROPERTY()
    FString AbortedString = "Aborted";

    UGOAPAction_EcosimAIV2_RideOtherMount()
    {
        return;
    }
    UFUNCTION()
    void WhenActionActivated_Implementation()
    {
        return;
    }
    UFUNCTION()
    void WhenActionTick_Implementation(const float32 DeltaSeconds)
    {
        this.FinishAction(true);
        return;
    }
    UFUNCTION()
    void WhenActionAborted_Implementation()
    {
        this.FinishAbort();
        return;
    }
    UFUNCTION()
    void WhenActionDeactivated_Implementation()
    {
        return;
    }
}

