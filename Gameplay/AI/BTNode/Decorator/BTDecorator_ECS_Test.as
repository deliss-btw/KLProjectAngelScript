

struct FTestBTDecoratorInstanceData
{
    UPROPERTY()
    int TestValue;


}

class UBTDecorator_ECS_Test : UBTDecorator_ECSScriptBase
{
    default SetNodeName("ECS Test Decorator");

    UBTDecorator_ECS_Test()
    {
        return;
    }
    UFUNCTION()
    UScriptStruct GetNodeMemoryType_Implementation() const
    {
        return FTestBTDecoratorInstanceData;
    }
    UFUNCTION()
    void OnNodeActivation_Implementation(const FAIBehaviorTreeSearchContext &inout SearchContext) const
    {
        FAIBehaviorTreeSearchContext::CastNodeMemory(SearchContext);
        FTestBTDecoratorInstanceData local_2;
        local_2.TestValue = 0;
        Print((FString("ReceiveExecutionStartAI") + local_2.TestValue), 5.0f, FLinearColor::LucBlue);
        return;
    }
    UFUNCTION()
    bool CalculateRawConditionValue_Implementation(const FAIBehaviorTreeContext &inout Context, const FBTNodeMemory &inout NodeMemory) const
    {
        FTestBTDecoratorInstanceData local_2;
        local_2.TestValue = Context.GetControllerEntity().GetIdValue();
        Print((FString("PerformConditionCheckAI") + local_2.TestValue), 5.0f, FLinearColor::LucBlue);
        int local_22 = int(local_2.TestValue) % 2;
        return (local_22 == 0);
    }
}

