class UHTNDecorator_HasValidAttackTarget : UHTNDecorator_ECSScriptBase
{
    default SetNodeName("是否拥有合法目标");

    UHTNDecorator_HasValidAttackTarget()
    {
        return;
    }
    UFUNCTION()
    bool PerformConditionCheck_Implementation(const FHTNContext &inout Context, const EHTNDecoratorConditionCheckType CheckType) const
    {
        return ::FAIKnowledgeUtils::CanEntityBeTarget(::FAITargetingUtils::GetCurrentAttackTarget(FECSEntity(Context.PawnEntity)));
    }
}

