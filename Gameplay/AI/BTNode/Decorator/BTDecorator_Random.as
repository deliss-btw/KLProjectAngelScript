

class UBTDecorator_Random : UBTDecorator_ECSScriptBase
{
    UPROPERTY()
    FAISmart_Float Probability = 1.0f;

    default SetNodeName("йљЏжњєж¦‚зЋ‡");

    UBTDecorator_Random()
    {
        return;
    }
    UFUNCTION()
    bool CalculateRawConditionValue_Implementation(const FAIBehaviorTreeContext &inout Context, const FBTNodeMemory &inout NodeMemory) const
    {
        FECSEntity local_6 = Context.GetControllerEntity();
        Get local_10;
        const FC_RandomSeed& local_2 = local_10.opCall();
        if (local_2)
        {
            FAISmartValueContext local_20 = Context.opImplConv();
            return ((local_2.RandRange(0.0f, 1.0f, nullptr, ECS::GetECSWorld().GetFixedTime().Time, 0)) < 0.0f);
        }
        return false;
    }
}

