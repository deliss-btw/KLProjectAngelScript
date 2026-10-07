

class UFlowNode_Delay : UFlowNode
{
    UPROPERTY()
    float32 TimeSeconds = 10.0f;
    FTimerHandle TimerHandle;


    UFUNCTION()
    void ExecuteInput_Implementation(const FName &inout PinName)
    {
        if (this.TimeSeconds > 0.0f)
        {
            System::ClearAndInvalidateTimerHandle(__GetWorldContext(), this.TimerHandle);
            this.TimerHandle = System::SetTimer(this, n"OnTimeOut", this.TimeSeconds, false, false, 0.0f, 0.0f);
            return;
        }
        this.TriggerFirstOutput(true);
        return;
    }
    UFUNCTION()
    void Cleanup_Implementation()
    {
        System::ClearAndInvalidateTimerHandle(__GetWorldContext(), this.TimerHandle);
        return;
    }
    UFUNCTION()
    void OnTimeOut()
    {
        this.TriggerFirstOutput(true);
        return;
    }
}

