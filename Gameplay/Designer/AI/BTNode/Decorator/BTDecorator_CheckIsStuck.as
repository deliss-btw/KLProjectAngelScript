

struct FBTDecorator_CheckIsStuckMemory
{
    UPROPERTY()
    FVector LastSampledPosition;
    UPROPERTY()
    bool bHasFirstSample;
    UPROPERTY()
    float32 TimeUntilNextCheck;
    UPROPERTY()
    bool bLastResult;
    UPROPERTY()
    bool bHasLastResult;


}

class UBTDecorator_CheckIsStuck : UBTDecorator_ECSScriptBase
{
    UPROPERTY()
    float32 CheckInterval = 0.2f;
    UPROPERTY()
    float32 StuckThreshold = 30.0f;
    UPROPERTY()
    bool bUse2DCheck = true;

    default SetbAllowAbortLowerPri(true);
    default SetbAllowAbortChildNodes(true);
    default SetNodeName("жЈЂжџҐи‡Єиє«жЇеђ¦еЌЎдЅЏ");


    UFUNCTION()
    UScriptStruct GetNodeMemoryType_Implementation() const
    {
        return FBTDecorator_CheckIsStuckMemory;
    }
    UFUNCTION()
    FString GetStaticDescription_Implementation() const
    {
        FString local_10;
        if (this.bUse2DCheck)
        {
            local_10 = "2D";
        }
        else
        {
            local_10 = "3D";
        }
        return FString::Format("Interval:{0}s  Threshold:{1}cm  [{2}]", this.CheckInterval, this.StuckThreshold, local_10);
    }
    UFUNCTION()
    void OnCeaseRelevant_Implementation(const FAIBehaviorTreeContext &inout Context, const FBTNodeMemory &inout NodeMemory) const
    {
        FBTDecorator_CheckIsStuckMemory local_2;
        local_2.bLastResult = true;
        local_2.bHasLastResult = false;
        local_2.bHasFirstSample = false;
        return;
    }
    UFUNCTION()
    void OnBecomeRelevant_Implementation(const FAIBehaviorTreeContext &inout Context, const FBTNodeMemory &inout NodeMemory) const
    {
        FBTDecorator_CheckIsStuckMemory local_2;
        if (FECSEntity(Context.PawnEntity).IsValid())
        {
            GetDefaulted local_16;
            local_2.LastSampledPosition = local_16.opCall().GetPosition();
            local_2.bHasFirstSample = true;
        }
        else
        {
            local_2.bHasFirstSample = false;
        }
        local_2.TimeUntilNextCheck = this.CheckInterval;
        local_2.bLastResult = true;
        local_2.bHasLastResult = false;
        return;
    }
    UFUNCTION()
    void TickNode_Implementation(const FAIBehaviorTreeContext &inout Context, const FBTNodeMemory &inout NodeMemory, const float32 DeltaSeconds) const
    {
        FBTDecorator_CheckIsStuckMemory local_2;
        local_2.TimeUntilNextCheck -= DeltaSeconds;
        if (local_2.TimeUntilNextCheck > 0.0f)
        {
            return;
        }
        local_2.TimeUntilNextCheck = this.CheckInterval;
        bool local_9 = this.SampleAndEvaluate(Context, local_2);
        if (!(local_2.bHasLastResult) || (!(local_9) != !(local_2.bLastResult)))
        {
            local_2.bLastResult = local_9;
            local_2.bHasLastResult = true;
            Context.RequestExecution(this);
        }
        return;
    }
    UFUNCTION()
    bool CalculateRawConditionValue_Implementation(const FAIBehaviorTreeContext &inout Context, const FBTNodeMemory &inout NodeMemory) const
    {
        FBTDecorator_CheckIsStuckMemory local_2;
        if (!(local_2.bHasLastResult))
        {
            return true;
        }
        return local_2.bLastResult;
    }
    bool SampleAndEvaluate(const FAIBehaviorTreeContext &inout Context, FBTDecorator_CheckIsStuckMemory &inout Mem) const
    {
        float32 local_17;
        if (!(FECSEntity(Context.PawnEntity).IsValid()))
        {
            return true;
        }
        GetDefaulted local_16;
        FVector local_12 = local_16.opCall().GetPosition();
        if (!(Mem.bHasFirstSample))
        {
            Mem.LastSampledPosition = local_12;
            Mem.bHasFirstSample = true;
            return true;
        }
        if (this.bUse2DCheck)
        {
            local_17 = float32(local_12.Dist2D(Mem.LastSampledPosition));
        }
        else
        {
            local_17 = float32(local_12.Distance(Mem.LastSampledPosition));
        }
        Mem.LastSampledPosition = local_12;
        return (local_17 > this.StuckThreshold);
    }
}

