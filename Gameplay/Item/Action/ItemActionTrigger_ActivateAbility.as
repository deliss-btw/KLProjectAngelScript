

class UItemActionTrigger_ActivateAbility : UItemActionTriggerBase
{
    UPROPERTY()
    TSoftClassPtr<UEASAbility> AbilityClass;

    UItemActionTrigger_ActivateAbility()
    {
        super();
        return;
    }
    void Execute(const FItemActionSource &inout ActionSource) const
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    FName GetAbilityName() const
    {
        return ::ItemActionUtils::GetItemActionGeneratedAbilityName(this.AbilityClass);
    }
}

class UItemActionTrigger_AbilitySignal : UItemActionTriggerBase
{
    UPROPERTY()
    TSoftClassPtr<UEASAbility> AbilityClass;
    UPROPERTY()
    FName Signal;

    UItemActionTrigger_AbilitySignal()
    {
        super();
        return;
    }
    void Execute(const FItemActionSource &inout ActionSource) const
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    FName GetAbilityName() const
    {
        return ::ItemActionUtils::GetItemActionGeneratedAbilityName(this.AbilityClass);
    }
}

class UItemActionTrigger_AddBuff : UItemActionTriggerBase
{
    UPROPERTY()
    FBuffConfigRef BuffConfig;
    UPROPERTY()
    float32 OverrideDuration = -1.0f;
    UPROPERTY()
    int StackNum = -1;


    void Execute(const FItemActionSource &inout ActionSource) const
    {
        FBuffUtils::AddBuff(ActionSource.GetItemOwner(), this.BuffConfig, ECS::GetECSWorld().GetFixedTime().Time, ActionSource.GetItemOwner(), false, this.OverrideDuration, this.StackNum, false);
        return;
    }
}

class UItemActionTrigger_RemoveBuff : UItemActionTriggerBase
{
    UPROPERTY()
    FBuffConfigRef BuffConfig;
    UPROPERTY()
    EBuffEndType BuffEndType;

    UItemActionTrigger_RemoveBuff()
    {
        super();
        return;
    }
    void Execute(const FItemActionSource &inout ActionSource) const
    {
        FBuffUtils::RemoveBuff(ActionSource.GetItemOwner(), this.BuffConfig, ECS::GetECSWorld().GetFixedTime().Time, this.BuffEndType);
        return;
    }
}

class UItemActionTrigger_AddMetaBuff : UItemActionTriggerBase
{
    UPROPERTY()
    TDataObjectPtr<FMetaBuffConfig> MetaBuffConfig;
    UPROPERTY()
    TArray<TDataObjectPtr<FGameplayModifierConfig>> GameplayModifierConfigs;

    UItemActionTrigger_AddMetaBuff()
    {
        super();
        return;
    }
    void Execute(const FItemActionSource &inout ActionSource) const
    {
        ::FMetaBuffUtils::AddMetaBuff(ActionSource.GetItemOwner(), this.MetaBuffConfig, this.GameplayModifierConfigs, TArray<TDataObjectPtr<FMetaBuffCapabilityConfig>>());
        return;
    }
}

class UItemActionTrigger_RemoveMetaBuff : UItemActionTriggerBase
{
    UPROPERTY()
    TDataObjectPtr<FMetaBuffConfig> MetaBuffConfig;

    UItemActionTrigger_RemoveMetaBuff()
    {
        super();
        return;
    }
    void Execute(const FItemActionSource &inout ActionSource) const
    {
        ::FMetaBuffUtils::RemoveMetaBuff(ActionSource.GetItemOwner(), this.MetaBuffConfig);
        return;
    }
}

