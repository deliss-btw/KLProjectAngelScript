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
        int local_28 = 0;
        FECSEntity local_4 = FECSEntity(ActionSource.GetItemOwner());
        if (!(FECSEntity::Has<FC_EASAbility>(local_4).opCall()))
        {
            XWarning(ELog(47), FString().Append("Failed to active ability ").Append(this.GetAbilityName()).Append(" on ").Append(local_4).Append(", unable to find ability component."));
            return;
        }
        int local_19 = ::ItemActionUtils::GetItemActionGeneratedAbilityIndexFromAsset(ActionSource, this.AbilityClass);
        if (local_19 != INDEX_NONE)
        {
            bool local_20;
            local_20 = false;
            FC_EASAbilityInstance& local_22 = FAbilityUtils::GetAbilityInstance(local_4, local_19, local_20);
            if (!(local_20))
            {
                XWarning(ELog(47), FString().Append("Failed to active ability ").Append(this.GetAbilityName()).Append(" on ").Append(local_4).Append(", ability instance not found."));
                return;
            }
            FAbilityUtils::ActivateAbility(local_22, local_28, local_4, FFPTime(ECS::GetECSWorld().GetFixedTime().Time));
        }
        else
        {
            if (!(FAbilityUtils::AddAbility(local_4, local_4, this.AbilityClass.Get(), false, this.GetAbilityName(), true, false, true, false, FFPTime(0))))
            {
                XWarning(ELog(47), FString().Append("Failed to active ability ").Append(this.GetAbilityName()).Append(" on ").Append(local_4).Append(", unable to add ability."));
                return;
            }
        }
        return;
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
        FECSEntity local_4 = FECSEntity(ActionSource.GetItemOwner());
        if (!(FECSEntity::Has<FC_EASAbility>(local_4).opCall()))
        {
            XWarning(ELog(47), FString().Append("Failed to invoke ability ").Append(this.GetAbilityName()).Append(" signal [").Append(this.Signal).Append("] on ").Append(local_4).Append(", unable to find ability component."));
            return;
        }
        int local_19 = ::ItemActionUtils::GetItemActionGeneratedAbilityIndexFromAsset(ActionSource, this.AbilityClass);
        if (local_19 == INDEX_NONE)
        {
            return;
        }
        bool local_20 = false;
        FC_EASAbilityInstance& local_22 = FAbilityUtils::GetAbilityInstance(local_4, local_19, local_20);
        if (!(local_20))
        {
            XWarning(ELog(47), FString().Append("Failed to invoke ability ").Append(this.GetAbilityName()).Append(" signal [").Append(this.Signal).Append("] on ").Append(local_4).Append(", ability instance not found."));
            return;
        }
        FFPTime local_26 = FFPTime(ECS::GetECSWorld().GetFixedTime().Time);
        FAbilityUtils::InvokeSignal(local_22, local_4, this.Signal, local_26, true);
        return;
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

