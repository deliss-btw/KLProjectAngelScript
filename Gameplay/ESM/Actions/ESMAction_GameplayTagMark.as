
enum ECharacterInvincibleType
{
    DodgeInvincible,
    JumpInvincible,
    GuardInvincible,
}


class UESMAction_CharacterInvincible : UESMBPBaseSpanTickAction
{
    UPROPERTY()
    int CharacterInvincibleType = 1;


    UFUNCTION()
    EESMActionExclusiveType GetExclusiveType_Implementation() const
    {
        return EESMActionExclusiveType(0);
    }
    UFUNCTION()
    FLinearColor GetBackgroundColor_Implementation() const
    {
        return ESMActionColor::Mark;
    }
    UFUNCTION()
    void Enter_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        const FECSEntity& local_2 = Context.GetEntity();
        int local_3 = this.CharacterInvincibleType & 1;
        if (local_3 != 0)
        {
            local_2.AddGameplayTag(GameplayTags::ESM_CombatFlag_DodgeInvincible, NAME_None);
        }
        int local_5 = this.CharacterInvincibleType & 2;
        if (local_5 != 0)
        {
            local_2.AddGameplayTag(GameplayTags::ESM_CombatFlag_JumpInvincible, NAME_None);
        }
        int local_5_2 = this.CharacterInvincibleType & 4;
        if (local_5_2 != 0)
        {
            local_2.AddGameplayTag(GameplayTags::ESM_CombatFlag_GuardInvincible, NAME_None);
        }
        return;
    }
    UFUNCTION()
    void Exit_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        const FECSEntity& local_2 = Context.GetEntity();
        int local_3 = this.CharacterInvincibleType & 1;
        if (local_3 != 0)
        {
            local_2.RemoveGameplayTag(GameplayTags::ESM_CombatFlag_DodgeInvincible, NAME_None);
        }
        int local_5 = this.CharacterInvincibleType & 2;
        if (local_5 != 0)
        {
            local_2.RemoveGameplayTag(GameplayTags::ESM_CombatFlag_JumpInvincible, NAME_None);
        }
        int local_5_2 = this.CharacterInvincibleType & 4;
        if (local_5_2 != 0)
        {
            local_2.RemoveGameplayTag(GameplayTags::ESM_CombatFlag_GuardInvincible, NAME_None);
        }
        return;
    }
}

class UESMAction_ModifyGameplayTagsInstantly : UESMBPBaseInstantAction
{
    UPROPERTY()
    bool bAdd = true;
    UPROPERTY()
    FGameplayTagContainer GameplayTags;


    UFUNCTION()
    EESMActionExclusiveType GetExclusiveType_Implementation() const
    {
        return EESMActionExclusiveType(0);
    }
    UFUNCTION()
    FLinearColor GetBackgroundColor_Implementation() const
    {
        return ESMActionColor::Mark;
    }
    UFUNCTION()
    FString GetDisplayInfo_Implementation() const
    {
        FString local_10;
        if (this.bAdd)
        {
            local_10 = "ж·»еЉ ";
        }
        else
        {
            local_10 = "з§»й™¤";
        }
        return FString().Append("GameplayTag з«‹еЌі").Append(local_10).Append(": ").Append(this.GameplayTags.Num()).Append("дёЄ");
    }
    UFUNCTION()
    void Do_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
    }
}

class UESMAction_ModifyGameplayTags : UESMBPBaseSpanAction
{
    UPROPERTY()
    FGameplayTagContainer GameplayTags;

    UESMAction_ModifyGameplayTags()
    {
        return;
    }
    UFUNCTION()
    EESMActionExclusiveType GetExclusiveType_Implementation() const
    {
        return EESMActionExclusiveType(0);
    }
    UFUNCTION()
    FLinearColor GetBackgroundColor_Implementation() const
    {
        return ESMActionColor::Mark;
    }
    UFUNCTION()
    FString GetDisplayInfo_Implementation() const
    {
        return FString().Append("GameplayTag ").Append(FString("ж·»еЉ ")).Append(": ").Append(this.GameplayTags.Num()).Append("дёЄ");
    }
    UFUNCTION()
    void Enter_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
    }
    UFUNCTION()
    void Exit_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
    }
}

