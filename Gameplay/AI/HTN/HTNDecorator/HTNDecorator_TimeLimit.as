struct FHTNDecorator_ExecutionTimeLimitInstanceData
{
    UPROPERTY()
    float32 ExecutionTimeCount = 0.0f;
    UPROPERTY()
    float32 TimeLimitValue = -1.0f;

}

class UHTNDecorator_ExecutionTimeLimit : UHTNDecorator_ECSScriptBase
{
    UPROPERTY()
    FAISmart_Float TimeLimit = 5.0f;
    UPROPERTY()
    FAISmart_Float TimeLimiteRandomDeviation = 0.0f;

    default SetNodeName("限时结束");

    UHTNDecorator_ExecutionTimeLimit()
    {
        return;
    }
    UFUNCTION()
    UScriptStruct GetInstanceDataType_Implementation() const
    {
        return FHTNDecorator_ExecutionTimeLimitInstanceData;
    }
    UFUNCTION()
    void ExecutionStart_Implementation(const FHTNContext &inout Context)
    {
        float32 local_10;
        FHTNDecorator_ExecutionTimeLimitInstanceData& local_2 = this.GetInstanceData(Context);
        local_2.ExecutionTimeCount = 0.0f;
        float32 local_3_2 = this.TimeLimiteRandomDeviation.GetValue(Context.opImplConv());
        float32 local_4 = this.TimeLimit.GetValue(Context.opImplConv());
        if (local_3_2 == 0.0f)
        {
            local_10 = 0.0f;
        }
        else
        {
            float32 local_7 = -local_3_2;
            local_10 = FMath::RandRange(local_7, local_3_2);
        }
        local_2.TimeLimitValue = (local_4 + local_10);
        return;
    }
    UFUNCTION()
    void Tick_Implementation(const FHTNContext &inout Context, const float32 DeltaTime)
    {
        this.GetInstanceData(Context).ExecutionTimeCount += DeltaTime;
        return;
    }
    UFUNCTION()
    void ExecutionFinish_Implementation(const FHTNContext &inout Context, const EHTNNodeResult NodeResult)
    {
        this.GetInstanceData(Context).TimeLimitValue = -1.0f;
        return;
    }
    UFUNCTION()
    bool PerformConditionCheck_Implementation(const FHTNContext &inout Context, const EHTNDecoratorConditionCheckType CheckType) const
    {
        if (int(CheckType) == 3)
        {
            FHTNDecorator_ExecutionTimeLimitInstanceData& local_6 = this.GetInstanceData(Context);
            if (local_6.TimeLimitValue > 0.0f)
            {
                if (local_6.ExecutionTimeCount >= local_6.TimeLimitValue)
                {
                    return false;
                }
            }
        }
        return true;
    }
    FHTNDecorator_ExecutionTimeLimitInstanceData GetInstanceData(const FHTNContext &inout Context) const
    {
        FHTNDecorator_ExecutionTimeLimitInstanceData __r;
        return __r;
    }
}

