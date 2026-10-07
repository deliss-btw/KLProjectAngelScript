

class UESMAction_GuardZone : UESMBPBaseSpanTickAction
{
    UESMAction_GuardZone()
    {
        return;
    }
    UFUNCTION()
    FLinearColor GetBackgroundColor_Implementation() const
    {
        return ESMActionColor::Mark;
    }
    UFUNCTION()
    void Enter_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        Context.GetEntity().AddGameplayTag(GameplayTags::ESM_CombatFlag_GuardInvincible, NAME_None);
        return;
    }
    UFUNCTION()
    void Exit_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        Context.GetEntity().RemoveGameplayTag(GameplayTags::ESM_CombatFlag_GuardInvincible, NAME_None);
        return;
    }
}

