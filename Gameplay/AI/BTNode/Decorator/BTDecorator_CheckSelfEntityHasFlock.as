

class UBTDecorator_CheckSelfEntityHasFlock : UBTDecorator_ECSScriptBase
{
    UBTDecorator_CheckSelfEntityHasFlock()
    {
        return;
    }
    UFUNCTION()
    bool CalculateRawConditionValue_Implementation(const FAIBehaviorTreeContext &inout Context, const FBTNodeMemory &inout NodeMemory) const
    {
        int local_6 = 0;
        if (!(local_6))
        {
            return false;
        }
        if (!(FECSEntity(FECSEntityId(local_6.FlockProxyEntity)).IsValid()))
        {
            return false;
        }
        return true;
    }
}

