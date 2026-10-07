

class UBTService_AttackConsumeHostility : UBTService_ECSScriptBase
{
    UPROPERTY()
    float32 ConsumeAmount;

    default SetNodeName("ж¶€иЂ—д»‡жЃЁеЂј");

    UBTService_AttackConsumeHostility()
    {
        return;
    }
    UFUNCTION()
    void OnBecomeRelevant_Implementation(const FAIBehaviorTreeContext &inout Context, const FBTNodeMemory &inout NodeMemory) const
    {
        FECSEntity local_8 = ::FAITargetingUtils::GetCurrentAttackTarget(Context.PawnEntity);
        if (::FAIKnowledgeUtils::IsTargetValid(local_8))
        {
            float32 local_10 = -this.ConsumeAmount;
            ::FAITargetingUtils::AddHostility(Context.PawnEntity, FTargetEntity(local_8), local_10);
        }
        return;
    }
}

