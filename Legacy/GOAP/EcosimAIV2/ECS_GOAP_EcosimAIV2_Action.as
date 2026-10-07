

UCLASS(Abstract)
class UECSGOAPEcosimAIV2InstanceBase : UGOAP_InstanceBase
{
    UPROPERTY()
    FECSEntity Entity;

    UECSGOAPEcosimAIV2InstanceBase()
    {
        return;
    }
    UFUNCTION()
    bool HasMount() const
    {
        return false;
    }
    UFUNCTION()
    bool HasCoach() const
    {
        return false;
    }
    UFUNCTION()
    bool HasTeam() const
    {
        Has local_4;
        return local_4.opCall();
    }
    UFUNCTION()
    bool RidingSelfMount() const
    {
        return false;
    }
    UFUNCTION()
    bool SelfMountChainingCoach() const
    {
        return false;
    }
    UFUNCTION()
    bool ReadyToMove() const
    {
        return false;
    }
    UFUNCTION()
    bool ReachTeamTarget() const
    {
        return false;
    }
}

class UGOAPAction_EcosimAIV2_Test : UGOAP_ActionScriptableBase
{
    UPROPERTY()
    FString ActivatedString = "Activated";
    UPROPERTY()
    FString FinishedString = "Finished";
    UPROPERTY()
    FString AbortedString = "Aborted";
    UPROPERTY()
    float32 Duration = 2.0f;
    float32 TimeCounter = 0.0f;


    UFUNCTION()
    void WhenActionActivated_Implementation()
    {
        System::PrintString(__GetWorldContext(), FString().Append(this.ActivatedString).Append(" ").Append(this.GetName()), true, true, FLinearColor(0.0f, 0.66f, 1.0f, 1.0f), 2.0f, NAME_None);
        return;
    }
    UFUNCTION()
    void WhenActionTick_Implementation(const float32 DeltaSeconds)
    {
        this.TimeCounter += DeltaSeconds;
        if (this.TimeCounter > this.Duration)
        {
            System::PrintString(__GetWorldContext(), FString().Append(this.FinishedString).Append(" ").Append(this.GetName()), true, true, FLinearColor(0.0f, 0.66f, 1.0f, 1.0f), 2.0f, NAME_None);
            this.FinishAction(true);
        }
        return;
    }
    UFUNCTION()
    void WhenActionAborted_Implementation()
    {
        System::PrintString(__GetWorldContext(), FString().Append(this.AbortedString).Append(" ").Append(this.GetName()), true, true, FLinearColor(0.0f, 0.66f, 1.0f, 1.0f), 2.0f, NAME_None);
        this.FinishAbort();
        return;
    }
    UFUNCTION()
    void WhenActionDeactivated_Implementation()
    {
        this.TimeCounter = 0.0f;
        return;
    }
}

