

class UFlowNode_PrintText : UFlowNode
{
    UPROPERTY()
    FString Text = "Hello";
    UPROPERTY()
    FLinearColor Color = FLinearColor::Red;
    UPROPERTY()
    float32 Duration = 5.0f;
    UPROPERTY()
    bool bPrintToScreen = true;
    UPROPERTY()
    bool bPrintToLog = true;


    UFUNCTION()
    void ExecuteInput_Implementation(const FName &inout PinName)
    {
        if (this.Text.Len() > 0)
        {
            System::PrintString(__GetWorldContext(), this.Text, this.bPrintToScreen, this.bPrintToLog, this.Color, this.Duration, NAME_None);
        }
        this.TriggerFirstOutput(true);
        return;
    }
}

