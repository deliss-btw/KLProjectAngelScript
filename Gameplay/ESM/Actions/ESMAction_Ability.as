

class UESMAction_AbilityLifespanByAbilityConfig : UESMBPBaseSpanAction
{
    UPROPERTY()
    TSubclassOf<UEASAbility> AbilityClass;
    UPROPERTY()
    bool bActivateOnBeginOnly = true;
    UPROPERTY()
    TArray<FName> ExcludeStateForActivate;
    UPROPERTY()
    bool ActivateAbilityWhenEnter = true;
    UPROPERTY()
    bool DeactivateAbilityWhenExit = true;


    UFUNCTION()
    EESMActionExclusiveType GetExclusiveType_Implementation() const
    {
        return EESMActionExclusiveType(0);
    }
    UFUNCTION()
    FString GetDisplayInfo_Implementation() const
    {
        if ((!((this.AbilityClass == nullptr))))
        {
            UClass local_10;
            return FString().Append("Ability LifeSpan : ").Append(local_10.GetName());
        }
        return "Ability LifeSpan";
    }
    UFUNCTION()
    void Enter_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        int local_14 = 0;
        if (!(this.ActivateAbilityWhenEnter))
        {
            return;
        }
        if (!(!(this.bActivateOnBeginOnly)) && (!(Time.IsBegin()) == !(false)))
        {
            return;
        }
        bool local_3 = this.ExcludeStateForActivate.Contains(Context.State.GetDataName());
        if (local_3)
        {
            return;
        }
        const FECSEntity& local_8 = Context.GetEntity();
        UClass local_16;
        int local_19 = FAbilityUtils::GetAbilityIndexByClass(local_8, TSubclassOf<UEASAbility>(local_16));
        if (local_19 == -1)
        {
            return;
        }
        FC_EASAbilityInstance& local_24 = FAbilityUtils::GetAbilityInstance(local_8, local_19, false);
        if (local_24)
        {
            if (!(local_14.IsActive(uint8(local_24.GetIndex()))) == !(false))
            {
                FAbilityUtils::ActivateAbility(local_24, local_14, local_8, Time.WorldTime);
                return;
            }
            XError(ELog(0), FString().Append("Ability ").Append(local_16.GetFullName(nullptr)).Append(", already activated -- ").Append(this.DebugGetPath()));
        }
        return;
    }
    UFUNCTION()
    void Exit_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        int local_10 = 0;
        int local_22;
        int local_23;
        if (!(this.DeactivateAbilityWhenExit))
        {
            return;
        }
        const FECSEntity& local_4 = Context.GetEntity();
        UClass local_12;
        int local_15 = FAbilityUtils::GetAbilityIndexByClass(local_4, TSubclassOf<UEASAbility>(local_12));
        if (local_15 == -1)
        {
            return;
        }
        bool local_17 = false;
        FC_EASAbilityInstance& local_20 = FAbilityUtils::GetAbilityInstance(local_4, local_15, local_17);
        if (local_20)
        {
            if (local_10.IsActive(uint8(local_20.GetIndex())))
            {
                if (Time.IsEnd())
                {
                    local_23 = 0;
                    local_22 = local_23;
                }
                else
                {
                    local_23 = 1;
                    local_22 = local_23;
                }
                FAbilityUtils::DeactivateAbility(local_20, local_10, local_4, Time.WorldTime, EEASAbilityEndType(local_22));
            }
        }
        return;
    }
    UFUNCTION()
    void OnDataValidate_Implementation(const FESMDataHierarchyInfo &inout Info)
    {
        if ((this.AbilityClass == nullptr))
        {
            Info.AddDataInvalidComment(EESMDataValidType(1), "Not Valid Skill");
        }
        return;
    }
}

class UESMAction_AbilitySignal : UESMBPBaseInstantAction
{
    UPROPERTY()
    bool bAutoFillSkill = true;
    UPROPERTY()
    USkillConfig SkillConfig;
    UPROPERTY()
    FName Signal;


    UFUNCTION()
    EESMActionExclusiveType GetExclusiveType_Implementation() const
    {
        return EESMActionExclusiveType(0);
    }
    UFUNCTION()
    void Do_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        int local_8 = 0;
        int local_14 = 0;
        const FECSEntity& local_2 = Context.GetEntity();
        if ((!(local_8) || !(local_14)))
        {
            return;
        }
        int local_18 = local_14.IndexOfSkill(this.SkillConfig);
        if (local_18 < 0)
        {
            return;
        }
        FC_EASAbilityInstance& local_20 = FSkillUtils::TryGetSkillAbilityInstance(local_2, local_18);
        if (local_20)
        {
            FAbilityUtils::InvokeSignal(local_20, local_2, this.Signal, Time.WorldTime, true);
            return;
        }
        FSkillUtils::ConsumeSkillCD(local_2, local_18, Time.WorldTime);
        return;
    }
    UFUNCTION()
    void OnDataValidate_Implementation(const FESMDataHierarchyInfo &inout Info)
    {
        if (this.bAutoFillSkill)
        {
            this.SkillConfig = ::ESMAbilityAction::FindSkillConfigFromLifespanAndValidate(this, Info, this.SkillConfig);
        }
        return;
    }
}

class UESMAction_AbilitySignalToAbilityInstance : UESMBPBaseInstantAction
{
    UPROPERTY()
    bool bAutoFillAbility = false;
    UPROPERTY()
    TSubclassOf<UEASAbility> AbilityClass;
    UPROPERTY()
    FName Signal;


    UFUNCTION()
    EESMActionExclusiveType GetExclusiveType_Implementation() const
    {
        return EESMActionExclusiveType(0);
    }
    UFUNCTION()
    FString GetDisplayInfo_Implementation() const
    {
        if ((!((this.AbilityClass == nullptr))))
        {
            return (FString(FString().Append("Ability Signal : ")) + this.Signal);
        }
        return "Ability Signal";
    }
    UFUNCTION()
    void Do_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        int local_8 = 0;
        const FECSEntity& local_2 = Context.GetEntity();
        if (!(local_8))
        {
            return;
        }
        UClass local_12;
        int local_15 = FAbilityUtils::GetAbilityIndexByClass(local_2, TSubclassOf<UEASAbility>(local_12));
        if (local_15 == -1)
        {
            return;
        }
        bool local_9 = false;
        FC_EASAbilityInstance& local_20 = FAbilityUtils::GetAbilityInstance(local_2, local_15, local_9);
        if (local_20)
        {
            FAbilityUtils::InvokeSignal(local_20, local_2, this.Signal, Time.WorldTime, true);
        }
        return;
    }
    UFUNCTION()
    void OnDataValidate_Implementation(const FESMDataHierarchyInfo &inout Info)
    {
        if (this.bAutoFillAbility)
        {
            this.AbilityClass = ::ESMAbilityAction::FindAbilityFromLifespanAndValidate(this, Info, this.AbilityClass);
        }
        return;
    }
}

class UESMAction_AbilitySignalsToAbilityInstanceSpan : UESMBPBaseSpanAction
{
    UPROPERTY()
    bool bAutoFillAbility = false;
    UPROPERTY()
    TSubclassOf<UEASAbility> EnterAbilityClass;
    UPROPERTY()
    FName EnterSignal;
    UPROPERTY()
    TSubclassOf<UEASAbility> ExitAbilityClass;
    UPROPERTY()
    FName ExitSignal;


    UFUNCTION()
    FString GetDisplayInfo_Implementation() const
    {
        FString local_22;
        FString local_14;
        if (this.ExitAbilityClass.IsValid())
        {
            local_14 = this.ExitSignal.ToString();
            local_22 = local_14;
        }
        else
        {
            FString local_10;
            local_22 = local_10;
        }
        FString local_18 = this.EnterAbilityClass.IsValid() ? this.EnterSignal.ToString() : local_14;
        return local_22.Append("Ability Signals : ").Append(local_18).Append().Append();
    }
    UFUNCTION()
    void Enter_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        int local_8 = 0;
        const FECSEntity& local_2 = Context.GetEntity();
        if (!(local_8))
        {
            return;
        }
        UClass local_12;
        int local_15 = FAbilityUtils::GetAbilityIndexByClass(local_2, TSubclassOf<UEASAbility>(local_12));
        if (local_15 == -1)
        {
            return;
        }
        bool local_9 = false;
        FC_EASAbilityInstance& local_20 = FAbilityUtils::GetAbilityInstance(local_2, local_15, local_9);
        if (local_20)
        {
            FAbilityUtils::InvokeSignal(local_20, local_2, this.EnterSignal, Time.WorldTime, true);
        }
        return;
    }
    UFUNCTION()
    void Exit_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        int local_8 = 0;
        const FECSEntity& local_2 = Context.GetEntity();
        if (!(local_8))
        {
            return;
        }
        UClass local_12;
        int local_15 = FAbilityUtils::GetAbilityIndexByClass(local_2, TSubclassOf<UEASAbility>(local_12));
        if (local_15 == -1)
        {
            return;
        }
        bool local_9 = false;
        FC_EASAbilityInstance& local_20 = FAbilityUtils::GetAbilityInstance(local_2, local_15, local_9);
        if (local_20)
        {
            FAbilityUtils::InvokeSignal(local_20, local_2, this.ExitSignal, Time.WorldTime, true);
        }
        return;
    }
    UFUNCTION()
    void OnDataValidate_Implementation(const FESMDataHierarchyInfo &inout Info)
    {
        if (this.bAutoFillAbility)
        {
            this.EnterAbilityClass = ::ESMAbilityAction::FindAbilityFromLifespanAndValidate(this, Info, this.EnterAbilityClass);
            this.ExitAbilityClass = ::ESMAbilityAction::FindAbilityFromLifespanAndValidate(this, Info, this.ExitAbilityClass);
        }
        return;
    }
}

namespace ESMAbilityAction
{
USkillConfig FindSkillConfigFromLifespanAndValidate(const UESMAction Action, const FESMDataHierarchyInfo &inout Info, const USkillConfig LastSkillConfig)
{
    USkillConfig local_10;
    UESMAction_SkillLifespan local_34;
    UESMAsset local_2 = Info.Asset;
    if ((local_2 == nullptr || (int(Info.Asset.AssetType) == 1)))
    {
        if (LastSkillConfig == nullptr)
        {
            Info.AddDataInvalidComment(EESMDataValidType(1), "Need Valid SkillConfig");
        }
        return LastSkillConfig;
    }
    if (Info.GetParentState() != nullptr)
    {
        for (auto local_30 : Info.GetSiblingActionList())
        {
            local_34 = Cast<UESMAction_SkillLifespan>(local_30);
            if (local_34 != nullptr)
            {
                local_10 = local_34.SkillConfig;
                break;
            }
        }
    }
    if (local_10 != LastSkillConfig)
    {
        Action.MarkPackageDirty();
    }
    if (local_10 == nullptr)
    {
        Info.AddDataInvalidComment(EESMDataValidType(1), "Need Valid SkillConfig");
    }
    return local_10;
}
TSubclassOf<UEASAbility> FindAbilityFromLifespanAndValidate(const UESMAction Action, const FESMDataHierarchyInfo &inout Info, const TSubclassOf<UEASAbility> &inout LastAbilityConfig)
{
    UESMAction_AbilityLifespanByAbilityConfig local_34;
    UESMAsset local_2 = Info.Asset;
    if ((local_2 == nullptr || (int(Info.Asset.AssetType) == 1)))
    {
        if ((LastAbilityConfig == nullptr))
        {
            Info.AddDataInvalidComment(EESMDataValidType(1), "Need Valid AbilityConfig");
        }
        return LastAbilityConfig;
    }
    TSubclassOf<UEASAbility> local_10 = nullptr;
    if (Info.GetParentState() != nullptr)
    {
        for (auto local_30 : Info.GetSiblingActionList())
        {
            local_34 = Cast<UESMAction_AbilityLifespanByAbilityConfig>(local_30);
            if (local_34 != nullptr)
            {
                local_10 = local_34.AbilityClass;
                break;
            }
        }
    }
    if (!((local_10 == LastAbilityConfig)))
    {
        Action.MarkPackageDirty();
    }
    if ((local_10 == nullptr))
    {
        Info.AddDataInvalidComment(EESMDataValidType(1), "Need Valid AbilityConfig");
    }
    return local_10;
}
}
