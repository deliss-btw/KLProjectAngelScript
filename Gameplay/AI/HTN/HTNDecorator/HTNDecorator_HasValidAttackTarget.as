

class UHTNDecorator_HasValidAttackTarget : UHTNDecorator_ECSScriptBase
{
    default SetNodeName("жЇеђ¦ж‹Ґжњ‰еђ€жі•з›®ж ‡");

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

