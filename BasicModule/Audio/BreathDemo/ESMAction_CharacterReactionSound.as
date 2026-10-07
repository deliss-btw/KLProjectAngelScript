

class UESMAction_CharacterReactionSound : UESMBPBaseInstantAction
{
    UPROPERTY()
    ECharacterReactionSoundType ReactionSoundType = ECharacterReactionSoundType(0);
    UPROPERTY()
    TSoftObjectPtr<UAkAudioEvent> Event = nullptr;
    UPROPERTY()
    TSoftObjectPtr<UAkAudioEvent> StopEvent = nullptr;


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
    void ViewDo_Implementation(const FESMViewContext &inout Context, const FESMActionTime &inout Time) const
    {
        ::BreathAudioUtils::PlayCharacterReactionSound(Context.GetEntity(), this.Event, this.StopEvent, this.ReactionSoundType);
        return;
    }
}

