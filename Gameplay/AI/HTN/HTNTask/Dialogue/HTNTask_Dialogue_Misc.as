

class UHTNTask_Dialogue_InteractSpeak : UHTNTask_ECSScriptBase
{
    UPROPERTY()
    FString SpeakContent;

    default SetNodeName("Dialogue_InteractSpeak");

    UHTNTask_Dialogue_InteractSpeak()
    {
        return;
    }
    UFUNCTION()
    void Execute_Implementation(const FHTNContext &inout Context)
    {
        int local_10 = 0;
        FECSEntity local_4 = FECSEntity(Context.PawnEntity);
        local_10.SpeakList.Add(this.SpeakContent);
        return;
    }
    UFUNCTION()
    void OnFinished_Implementation(const FHTNContext &inout Context, const EHTNNodeResult Result)
    {
        FECSEntity local_4 = FECSEntity(Context.PawnEntity);
        return;
    }
}

class UHTNTask_Dialogue_InteractOption : UHTNTask_ECSScriptBase
{
    UPROPERTY()
    FString OptionContent;

    default SetNodeName("Dialogue_InteractOption");

    UHTNTask_Dialogue_InteractOption()
    {
        return;
    }
    UFUNCTION()
    void Execute_Implementation(const FHTNContext &inout Context)
    {
        int local_10 = 0;
        FECSEntity local_4 = FECSEntity(Context.PawnEntity);
        local_10.OptionList.Add(this.OptionContent);
        return;
    }
    UFUNCTION()
    void Tick_Implementation(const FHTNContext &inout Context, const float32 DeltaSeconds)
    {
        return;
    }
    UFUNCTION()
    void OnFinished_Implementation(const FHTNContext &inout Context, const EHTNNodeResult Result)
    {
        FECSEntity local_4 = FECSEntity(Context.PawnEntity);
        return;
    }
}

class UHTNTask_Dialogue_InteractSimpleSpeakToAndOption : UHTNTask_ECSScriptBase
{
    UPROPERTY()
    FInteractSimpleSpeakToAndOption SpeakToAndOption;

    default SetNodeName("Dialogue_InteractSimpleSpeakToAndOption");

    UHTNTask_Dialogue_InteractSimpleSpeakToAndOption()
    {
        return;
    }
    UFUNCTION()
    void Execute_Implementation(const FHTNContext &inout Context)
    {
        int local_10 = 0;
        FECSEntity local_4 = FECSEntity(Context.PawnEntity);
        local_10.SpeakToAndOptionList.Add(TDataObjectPtr<FInteractSimpleSpeakToAndOption>());
        return;
    }
    UFUNCTION()
    void OnFinished_Implementation(const FHTNContext &inout Context, const EHTNNodeResult Result)
    {
        FECSEntity local_4 = FECSEntity(Context.PawnEntity);
        return;
    }
}

