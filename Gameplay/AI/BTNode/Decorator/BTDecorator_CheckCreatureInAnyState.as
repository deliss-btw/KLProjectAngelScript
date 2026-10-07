

class UBTDecorator_CheckCreatureInAnyState : UBTDecorator_ECSScriptBase
{
    UPROPERTY()
    TSet<FString> States;

    default SetNodeName("CheckCreatureInAnyState");

    UBTDecorator_CheckCreatureInAnyState()
    {
        return;
    }
    UFUNCTION()
    bool CalculateRawConditionValue_Implementation(const FAIBehaviorTreeContext &inout Context, const FBTNodeMemory &inout NodeMemory) const
    {
        return false;
    }
}

