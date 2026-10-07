

class UESMAction_SkillLifespan : UESMBPBaseSpanAction
{
    UPROPERTY()
    USkillConfig SkillConfig;
    UPROPERTY()
    bool bActivateOnBeginOnly = true;
    UPROPERTY()
    TArray<FName> ExcludeStateForActivate;


    UFUNCTION()
    FLinearColor GetBackgroundColor_Implementation() const
    {
        return ESMActionColor::Combat;
    }
    UFUNCTION()
    void Enter_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        int local_16 = 0;
        if (this.SkillConfig == nullptr)
        {
            return;
        }
        if (!(!(this.bActivateOnBeginOnly)) && (!(Time.IsBegin()) == !(false)))
        {
            return;
        }
        bool local_5 = this.ExcludeStateForActivate.Contains(Context.State.GetDataName());
        if (local_5)
        {
            return;
        }
        const FECSEntity& local_10 = Context.GetEntity();
        if (!(local_16))
        {
            return;
        }
        int local_18 = local_16.IndexOfSkill(this.SkillConfig);
        if (local_18 < 0)
        {
            return;
        }
        if (!(FSkillUtils::ActivateSkill(local_10, local_18, Time.WorldTime)))
        {
            XError(ELog(8), FString().Append("Skill ").Append(this.SkillConfig).Append(", already activated -- ").Append(this.DebugGetPath()));
        }
        return;
    }
    UFUNCTION()
    void Exit_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        int local_12 = 0;
        if (this.SkillConfig == nullptr)
        {
            return;
        }
        const FECSEntity& local_6 = Context.GetEntity();
        if (!(local_12))
        {
            return;
        }
        int local_14 = local_12.IndexOfSkill(this.SkillConfig);
        if (local_14 < 0)
        {
            return;
        }
        FSkillUtils::DeactivateSkill(local_6, local_14, Time.WorldTime);
        return;
    }
    UFUNCTION()
    void OnDataValidate_Implementation(const FESMDataHierarchyInfo &inout Info)
    {
        if (this.SkillConfig == nullptr)
        {
            Info.AddDataInvalidComment(EESMDataValidType(1), "Not Valid Skill");
        }
        return;
    }
}

class UESMAction_SkillLifespanBySlot : UESMBPBaseSpanAction
{
    UPROPERTY()
    ESkillSlot Slot;
    UPROPERTY()
    bool bActivateOnBeginOnly = true;
    UPROPERTY()
    TArray<FName> ExcludeStateForActivate;


    UFUNCTION()
    FString GetDisplayInfo_Implementation() const
    {
        return FString().Append("Skill Lifespan: ").Append(this.Slot);
    }
    UFUNCTION()
    FLinearColor GetBackgroundColor_Implementation() const
    {
        return ESMActionColor::Combat;
    }
    UFUNCTION()
    void Enter_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        int local_16 = 0;
        if (int(this.Slot) == 0)
        {
            return;
        }
        if (!(!(this.bActivateOnBeginOnly)) && (!(Time.IsBegin()) == !(false)))
        {
            return;
        }
        bool local_6 = this.ExcludeStateForActivate.Contains(Context.State.GetDataName());
        if (local_6)
        {
            return;
        }
        const FECSEntity& local_10 = Context.GetEntity();
        if (!(local_16))
        {
            return;
        }
        int local_2 = local_16.IndexOfSkill(this.Slot);
        if (local_2 < 0)
        {
            return;
        }
        if (!(FSkillUtils::ActivateSkill(local_10, local_2, Time.WorldTime)))
        {
            XError(ELog(8), FString().Append("Entity '").Append(local_10.GetEntityName()).Append("' Skill in slot ").Append(this.Slot).Append(", already activated -- ").Append(this.DebugGetPath()));
        }
        return;
    }
    UFUNCTION()
    void Exit_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        int local_12 = 0;
        if (int(this.Slot) == 0)
        {
            return;
        }
        const FECSEntity& local_6 = Context.GetEntity();
        if (!(local_12))
        {
            return;
        }
        int local_2 = local_12.IndexOfSkill(this.Slot);
        if (local_2 < 0)
        {
            return;
        }
        FSkillUtils::DeactivateSkill(local_6, local_2, Time.WorldTime);
        return;
    }
    UFUNCTION()
    void OnDataValidate_Implementation(const FESMDataHierarchyInfo &inout Info)
    {
        if (int(this.Slot) == 0)
        {
            Info.AddDataInvalidComment(EESMDataValidType(1), "Not Valid SkillSlot");
        }
        return;
    }
}

class UESMAction_AddSkill : UESMBPBaseSpanAction
{
    UPROPERTY()
    USkillConfig SkillConfig;
    UPROPERTY()
    bool bActivateOnEnter = false;
    UPROPERTY()
    ESkillSlot Slot = ESkillSlot(0);


    UFUNCTION()
    FLinearColor GetBackgroundColor_Implementation() const
    {
        return ESMActionColor::Combat;
    }
    UFUNCTION()
    void Enter_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        if (this.SkillConfig == nullptr)
        {
            return;
        }
        if (!(Context.GetECSRuntime().IsServer))
        {
            return;
        }
        FECSEntity local_18 = FSkillUtils::CreateSkillEntityAndAddSkill(Context.GetECSWorld(), Context.GetEntity(), this.SkillConfig, this.Slot, false, false, 1);
        if (!(local_18.IsValid()))
        {
            return;
        }
        int local_9 = FSkillUtils::GetSkillIndex(local_18, this.SkillConfig);
        if (this.bActivateOnEnter && Time.IsBegin() && (local_9 >= 0))
        {
            FSkillUtils::ActivateSkill(Context.GetEntity(), local_9, Time.WorldTime);
        }
        return;
    }
    UFUNCTION()
    void Exit_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        if (this.SkillConfig == nullptr)
        {
            return;
        }
        if (!(Context.GetECSRuntime().IsServer))
        {
            return;
        }
        FECSEntity local_12 = FSkillUtils::GetSkillEntityByConfig(Context.GetEntity(), this.SkillConfig);
        if (local_12.IsValid())
        {
            FSkillUtils::RemoveSkill(local_12, Context.GetEntity(), true);
        }
        return;
    }
    UFUNCTION()
    void OnDataValidate_Implementation(const FESMDataHierarchyInfo &inout Info)
    {
        if (this.SkillConfig == nullptr)
        {
            Info.AddDataInvalidComment(EESMDataValidType(1), "Not Valid Skill");
        }
        return;
    }
}

class UESMAction_ChangeSkillPanel : UESMBPBaseSpanAction
{
    UPROPERTY()
    TDataObjectPtr<FSkillBtnConfig> SkillBtnConfig;

    UESMAction_ChangeSkillPanel()
    {
        return;
    }
    UFUNCTION()
    void Enter_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        int local_12 = 0;
        if (!(Context.GetECSRuntime().IsServer))
        {
            return;
        }
        if (!(::FASCommonUtils::GetUniquePlayerEntity(Context.GetEntity()).IsValid()))
        {
            return;
        }
        local_12.SetSkillBtnConfig(this.SkillBtnConfig);
        local_12.SetRefCount((local_12.GetRefCount() + 1));
        return;
    }
    UFUNCTION()
    void Exit_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        int local_12 = 0;
        if (!(Context.GetECSRuntime().IsServer))
        {
            return;
        }
        if (!(::FASCommonUtils::GetUniquePlayerEntity(Context.GetEntity()).IsValid()))
        {
            return;
        }
        local_12.SetRefCount((local_12.GetRefCount() - 1));
        if (local_12.GetRefCount() < 0)
        {
            XError(ELog(8), "[ChangeSkillPanel]: ChangeSkillPanel.RefCount < 0 !!!");
        }
        if (local_12.GetRefCount() <= 0)
        {
            Remove local_24;
            local_24.opCall();
        }
        return;
    }
}

class UESMAction_ESMInputSlotBlock : UESMBPBaseSpanAction
{
    UPROPERTY()
    TArray<EESMTriggerInputSlot> InputSlotsBlock;

    UESMAction_ESMInputSlotBlock()
    {
        return;
    }
    UFUNCTION()
    FLinearColor GetBackgroundColor_Implementation() const
    {
        return ESMActionColor::Combat;
    }
    UFUNCTION()
    void Enter_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        int local_16 = 0;
        if (!(Context.GetECSRuntime().IsServer))
        {
            return;
        }
        if (!(::FASCommonUtils::GetUniquePlayerEntity(Context.GetEntity()).IsValid()))
        {
            return;
        }
        for (auto local_29 : this.InputSlotsBlock)
        {
            local_16.AddBlockedSlot(EESMTriggerInputSlot(local_29));
        }
        return;
    }
    UFUNCTION()
    void Exit_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        int local_16 = 0;
        if (!(Context.GetECSRuntime().IsServer))
        {
            return;
        }
        if (!(::FASCommonUtils::GetUniquePlayerEntity(Context.GetEntity()).IsValid()))
        {
            return;
        }
        for (auto local_29 : this.InputSlotsBlock)
        {
            local_16.RemoveBlockedSlot(EESMTriggerInputSlot(local_29));
        }
        return;
    }
}

