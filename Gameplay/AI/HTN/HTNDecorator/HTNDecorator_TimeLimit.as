

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

    default SetNodeName("й™ђж—¶з»“жќџ");

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
        float32 local_3 = 0.0f;
        FHTNDecorator_ExecutionTimeLimitInstanceData local_2;
        local_2.ExecutionTimeCount = 0.0f;
        FAISmartValueContext local_6 = Context.opImplConv();
        FAISmartValueContext local_6_2 = Context.opImplConv();
        if (local_3 == 0.0f)
        {
            local_10 = 0.0f;
        }
        else
        {
            float32 local_7 = -local_3;
            local_10 = FMath::RandRange(local_7, local_3);
        }
        local_2.TimeLimitValue = (0.0f + local_10);
        return;
    }
    UFUNCTION()
    void Tick_Implementation(const FHTNContext &inout Context, const float32 DeltaTime)
    {
        FHTNDecorator_ExecutionTimeLimitInstanceData local_2;
        local_2.ExecutionTimeCount += DeltaTime;
        return;
    }
    UFUNCTION()
    void ExecutionFinish_Implementation(const FHTNContext &inout Context, const EHTNNodeResult NodeResult)
    {
        FHTNDecorator_ExecutionTimeLimitInstanceData local_2;
        local_2.TimeLimitValue = -1.0f;
        return;
    }
    UFUNCTION()
    bool PerformConditionCheck_Implementation(const FHTNContext &inout Context, const EHTNDecoratorConditionCheckType CheckType) const
    {
        if (int(CheckType) == 3)
        {
            FHTNDecorator_ExecutionTimeLimitInstanceData& local_6;
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

