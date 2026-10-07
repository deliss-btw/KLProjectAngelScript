

UCLASS(Abstract)
class UECSGOAPInstanceBase : UGOAP_InstanceBase
{
    UPROPERTY()
    FECSEntity Entity;

    UECSGOAPInstanceBase()
    {
        return;
    }
    UFUNCTION()
    bool ExampleState() const
    {
        return true;
    }
    UFUNCTION()
    FGOAP_FloatRange ExampleFloatRange() const
    {
        return FGOAP_FloatRange();
    }
}

class UGOAPExampleAction : UGOAP_ActionScriptableBase
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

class UGOAPSubsystem : UWorldSubsystem
{
    UPROPERTY()
    TArray<UECSGOAPInstanceBase> Instances;

    UGOAPSubsystem()
    {
        return;
    }
}

namespace GOAPUtils
{
UFUNCTION()
void RunGOAP(const FECSEntity &inout Entity, const TSubclassOf<UECSGOAPInstanceBase> &inout InstanceClass, const FName &inout GoalName)
{
    int local_6 = 0;
    UECSGOAPInstanceBase local_10 = local_6.Instance;
    if (local_10 != nullptr && local_6.Instance.IsExecutingAction())
    {
        return;
    }
    UECSGOAPInstanceBase local_14 = local_6.Instance;
    if (local_14 == nullptr)
    {
        local_6.Instance = (Cast<UECSGOAPInstanceBase>(NewObject(ECS::GetUEWorld(), InstanceClass, NAME_None, false)));
        UGOAPSubsystem::Get().Instances.Add(local_6.Instance);
    }
    local_6.Instance.Entity = Entity;
    FGOAP_PlanContext local_28;
    bool local_7 = false;
    FGOAP_PlanContext local_29 = local_7;
    local_6.Instance.TryPlanToGoal(GoalName, local_28, local_29, false);
    if (local_29 != 0)
    {
        local_6.Instance.ExecutePlannedActions(local_28, FOnActionFinished__GOAP_InstanceBase());
    }
    return;
}
}
