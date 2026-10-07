

class UBTDecorator_IsTargetProp : UBTDecorator_ECSScriptBase
{
    default SetNodeName("з›®ж ‡жЇеђ¦дёєProp");

    UBTDecorator_IsTargetProp()
    {
        return;
    }
    UFUNCTION()
    bool CalculateRawConditionValue_Implementation(const FAIBehaviorTreeContext &inout Context, const FBTNodeMemory &inout NodeMemory) const
    {
        bool local_9;
        FECSEntity local_8 = ::FAITargetingUtils::GetCurrentAttackTarget(Context.PawnEntity);
        if (::FAIKnowledgeUtils::IsTargetValid(local_8))
        {
            if (!(local_8.IsValid()))
            {
                local_9 = false;
            }
            else
            {
                Has local_14;
                local_9 = local_14.opCall();
            }
            if (local_9)
            {
                return true;
            }
        }
        return false;
    }
}

