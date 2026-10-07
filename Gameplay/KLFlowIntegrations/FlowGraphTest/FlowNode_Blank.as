

class UFlowNode_Blank : UFlowNode
{
    UPROPERTY()
    bool bSuccess = true;


    UFUNCTION()
    void ExecuteInput_Implementation(const FName &inout PinName)
    {
        if (this.bSuccess)
        {
            this.TriggerOutput(n"Success", false, EFlowPinActivationType(0));
            return;
        }
        this.TriggerOutput(n"Failure", false, EFlowPinActivationType(0));
        return;
    }
    UFUNCTION()
    void Cleanup_Implementation()
    {
        return;
    }
}

