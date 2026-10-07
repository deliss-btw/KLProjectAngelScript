

class UBTDecorator_SkillCooldown : UBTDecorator_ECSScriptBase
{
    UPROPERTY()
    USkillConfig SkillConfig;

    UBTDecorator_SkillCooldown()
    {
        return;
    }
    UFUNCTION()
    bool CalculateRawConditionValue_Implementation(const FAIBehaviorTreeContext &inout Context, const FBTNodeMemory &inout NodeMemory) const
    {
        if (float32(FSkillUtils::GetSkillCDRemainTime(Context.PawnEntity, FSkillUtils::GetSkillIndex(Context.PawnEntity, this.SkillConfig)).ToSeconds()) <= 0.0f)
        {
            return true;
        }
        return false;
    }
}

