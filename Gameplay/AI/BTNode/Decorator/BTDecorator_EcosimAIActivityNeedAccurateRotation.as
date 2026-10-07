

class UBTDecorator_EcosimAIActivityNeedAccurateRotation : UBTDecorator_ECSScriptBase
{
    UPROPERTY()
    FBlackboardKeySelector EcosimAIActivityName;

    default SetNodeName("EcosimAIActivityNeedAccurateRotation");

    UBTDecorator_EcosimAIActivityNeedAccurateRotation()
    {
        this.EcosimAIActivityName.AddNameFilter(this, n"EcosimAIActivityName");
        return;
    }
    UFUNCTION()
    bool CalculateRawConditionValue_Implementation(const FAIBehaviorTreeContext &inout Context, const FBTNodeMemory &inout NodeMemory) const
    {
        return false;
    }
}

