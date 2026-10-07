

class UESMAction_SetBreathAudioState : UESMBPBaseSpanAction
{
    UPROPERTY()
    EBreathAudioState BreathState = EBreathAudioState(0);


    UFUNCTION()
    EESMAssetWorkflow GetWorkflow_Implementation() const
    {
        return EESMAssetWorkflow(2);
    }
    UFUNCTION()
    EESMActionType GetActionType_Implementation() const
    {
        return EESMActionType(2);
    }
    UFUNCTION()
    FLinearColor GetBackgroundColor_Implementation() const
    {
        return ESMActionColor::Effect;
    }
    UFUNCTION()
    void ViewEnter_Implementation(const FESMViewContext &inout Context, const FESMActionTime &inout Time) const
    {
        FC_BreathAudio local_6;
        local_6.PrevBreathState = local_6.BreathState;
        local_6.BreathState = this.BreathState;
        local_6.bBreathStateSet = true;
        return;
    }
    UFUNCTION()
    void ViewExit_Implementation(const FESMViewContext &inout Context, const FESMActionTime &inout Time) const
    {
        FC_BreathAudio local_6;
        local_6.PrevBreathState = local_6.BreathState;
        local_6.bBreathStateSet = false;
        return;
    }
}

