

class UBTDecorator_HasValidTarget : UBTDecorator_ECSScriptBase
{
    UPROPERTY()
    FAISmart_EntityId EntityToCheck = FAISmart_EntityId(n"SelfEntity", EAISmartValue(0));

    default SetNodeName("жЇеђ¦ж‹Ґжњ‰еђ€жі•з›®ж ‡");

    UBTDecorator_HasValidTarget()
    {
        return;
    }
    UFUNCTION()
    bool CalculateRawConditionValue_Implementation(const FAIBehaviorTreeContext &inout Context, const FBTNodeMemory &inout NodeMemory) const
    {
        FECSEntity local_8 = FECSEntity(this.EntityToCheck.GetValue(Context.opImplConv()));
        if (local_8.IsValid())
        {
            return ::FAIKnowledgeUtils::IsTargetValid(::FAITargetingUtils::GetCurrentAttackTarget(local_8));
        }
        return false;
    }
    UFUNCTION()
    void TickNode_Implementation(const FAIBehaviorTreeContext &inout Context, const FBTNodeMemory &inout NodeMemory, const float32 DeltaSeconds) const
    {
        FECSEntity local_8 = FECSEntity(this.EntityToCheck.GetValue(Context.opImplConv()));
        if (local_8.IsValid())
        {
            if (!(::FAIKnowledgeUtils::IsTargetValid(::FAITargetingUtils::GetCurrentAttackTarget(local_8))))
            {
                Context.RequestExecution(this);
            }
        }
        else
        {
            Context.RequestExecution(this);
        }
        return;
    }
}

