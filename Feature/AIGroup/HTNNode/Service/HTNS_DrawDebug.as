

class UHTNS_DrawDebug : UHTNService_ECSScriptBase
{
    UPROPERTY()
    FAISmart_Vector DebugLocation;
    UPROPERTY()
    bool bDrawByTick;
    UPROPERTY()
    float32 DebugDuration;
    UPROPERTY()
    FLinearColor DebugColor;
    UPROPERTY()
    float32 Radius = 50.0f;


    UFUNCTION()
    void OnPlanExecutionStarted_Implementation(const FHTNContext &inout Context)
    {
        return;
    }
    UFUNCTION()
    void Tick_Implementation(const FHTNContext &inout Context, const float32 DeltaTime)
    {
        return;
    }
}

