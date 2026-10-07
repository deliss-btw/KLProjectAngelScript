
enum EBTTaskLoopStepType
{
    PingPong,
    Wrap,
}


class UBTTask_LoopStepInt : UBTTask_ECSScriptBase
{
    UPROPERTY()
    FBlackboardKeySelector LoopValue;
    UPROPERTY()
    FBlackboardKeySelector LoopValueMax;
    UPROPERTY()
    FBlackboardKeySelector LoopForward;
    UPROPERTY()
    EBTTaskLoopStepType LoopStepType;

    default SetNodeName("Loop Step Int");

    UBTTask_LoopStepInt()
    {
        this.LoopValue.AddIntFilter(this, n"LoopValue");
        this.LoopValue.AddIntFilter(this, n"LoopValueMax");
        this.LoopValue.AddBoolFilter(this, n"LoopForward");
        return;
    }
    UFUNCTION()
    EBTNodeResult ExecuteTask_Implementation(const FAIBehaviorTreeContext &inout Context, const FBTNodeMemory &inout NodeMemory) const
    {
        UBlackboardComponent local_2 = Context.GetOwnerComponent().GetBlackboardComponent();
        bool local_8 = local_2.GetValueAsBool(this.LoopForward.SelectedKeyName);
        int local_10 = local_2.GetValueAsInt(this.LoopValue.SelectedKeyName);
        int local_13 = FMath::Max(0, (local_2.GetValueAsInt(this.LoopValueMax.SelectedKeyName) - 1));
        int local_9_2 = local_8 ? 1 : -1;
        int local_11 = local_10 + local_9_2;
        if ((local_11 > local_13 || (local_11 < 0)))
        {
            int local_12 = int(this.LoopStepType);
            if (local_12 <= 1)
            {
                if (local_12 != 0)
                {
                    if (local_12 != 1)
                    {
                    }
                }
                else
                {
                    local_11 = local_10 - local_9_2;
                    local_2.SetValueAsBool(this.LoopForward.SelectedKeyName, !(local_8));
                    if (local_11 > local_13)
                    {
                        local_11 = 0;
                    }
                    else
                    {
                        if (local_11 < 0)
                        {
                            local_11 = local_13;
                        }
                    }
                }
            }
        }
        local_11 = FMath::Clamp(local_11, 0, local_13);
        local_2.SetValueAsInt(this.LoopValue.SelectedKeyName, local_11);
        return EBTNodeResult(0);
    }
}

