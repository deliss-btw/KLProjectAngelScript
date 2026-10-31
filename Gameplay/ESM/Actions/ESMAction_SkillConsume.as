class UESMAction_SkillConsumeResourse : UESMBPBaseInstantAction
{
    UPROPERTY()
    bool bAutoFillSkill = true;
    UPROPERTY()
    USkillConfig SkillConfig;

    UFUNCTION()
    void Do_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        if (this.SkillConfig == nullptr)
        {
            return;
        }
        FSkillUtils::ConsumeSkillAttribute(Context.GetEntity(), this.SkillConfig, Time.WorldTime);
        return;
    }
    UFUNCTION()
    void OnDataValidate_Implementation(const FESMDataHierarchyInfo &inout Info)
    {
        if (this.bAutoFillSkill)
        {
            this.SkillConfig = ::ESMAbilityAction::FindSkillConfigFromLifespanAndValidate(this, Info, this.SkillConfig);
        }
        if (this.SkillConfig == nullptr)
        {
            Info.AddDataInvalidComment(EESMDataValidType(1), "Not Valid Skill");
        }
        return;
    }
}

class UESMAction_AbilityConsumeItem : UESMBPBaseInstantAction
{
    UPROPERTY()
    bool bAutoFillSkill = true;
    UPROPERTY()
    USkillConfig SkillConfig;
    UPROPERTY()
    bool bOverrideConsumeNumber = false;
    UPROPERTY()
    int ConsumeNumberOverride = 1;

    UFUNCTION()
    void Do_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        int local_10 = 0;
        if (!(Context.GetECSRuntime().IsServer))
        {
            return;
        }
        if (this.SkillConfig == nullptr)
        {
            return;
        }
        if (!(local_10))
        {
            return;
        }
        int local_12 = local_10.IndexOfSkill(this.SkillConfig);
        int local_11 = INDEX_NONE;
        if (local_12 == local_11)
        {
            return;
        }
        const FC_SkillInstance& local_14 = local_10.GetSkillInstance(local_12);
        if (!(local_14.GetConsumeConfig().ConsumeItemRow.IsValid()))
        {
            return;
        }
        if (this.bOverrideConsumeNumber)
        {
        }
        else
        {
        }
        int local_15 = local_11;
        ::InventoryUtils::ConsumeInventoryItem(Context.GetEntity(), TDataObjectPtr<FItemConfig>(local_14.GetConsumeConfig().ConsumeItemRow), local_15);
        return;
    }
    UFUNCTION()
    void OnDataValidate_Implementation(const FESMDataHierarchyInfo &inout Info)
    {
        if (this.bAutoFillSkill)
        {
            this.SkillConfig = ::ESMAbilityAction::FindSkillConfigFromLifespanAndValidate(this, Info, this.SkillConfig);
        }
        if (this.SkillConfig == nullptr)
        {
            Info.AddDataInvalidComment(EESMDataValidType(1), "Not Valid Skill");
        }
        return;
    }
}

class UESMAction_AbilityConsumeCD : UESMBPBaseSpanAction
{
    UPROPERTY()
    bool bAutoFillSkill = true;
    UPROPERTY()
    USkillConfig SkillConfig;
    UPROPERTY()
    bool bConsumeOnEnter = true;
    UPROPERTY()
    bool bConsumeOnExit;

    UFUNCTION()
    void Enter_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        if (this.bConsumeOnEnter)
        {
            int local_3 = FSkillUtils::GetSkillIndex(Context.GetEntity(), this.SkillConfig);
            if (local_3 >= 0)
            {
                FSkillUtils::ConsumeSkillCD(Context.GetEntity(), local_3, Time.WorldLastTime);
            }
        }
        return;
    }
    UFUNCTION()
    void Exit_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        if (this.bConsumeOnExit)
        {
            int local_3 = FSkillUtils::GetSkillIndex(Context.GetEntity(), this.SkillConfig);
            if (local_3 >= 0)
            {
                FSkillUtils::ConsumeSkillCD(Context.GetEntity(), local_3, Time.WorldLastTime);
            }
        }
        return;
    }
    UFUNCTION()
    void OnDataValidate_Implementation(const FESMDataHierarchyInfo &inout Info)
    {
        if (this.bAutoFillSkill)
        {
            this.SkillConfig = ::ESMAbilityAction::FindSkillConfigFromLifespanAndValidate(this, Info, this.SkillConfig);
        }
        if (this.SkillConfig == nullptr)
        {
            Info.AddDataInvalidComment(EESMDataValidType(1), "Not Valid Skill");
        }
        return;
    }
    UFUNCTION()
    bool IsUseAsInstant_Implementation() const
    {
        bool local_1 = (!(this.bConsumeOnExit) == !(false));
        return local_1;
    }
}

class UESMAction_ConsumeTemporarySkillTime : UESMBPBaseSpanAction
{
    UPROPERTY()
    bool bConsumeOnEnter = true;
    UPROPERTY()
    bool bConsumeOnExit = false;

    UFUNCTION()
    FLinearColor GetBackgroundColor_Implementation() const
    {
        return ESMActionColor::Combat;
    }
    UFUNCTION()
    void Enter_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        if (this.bConsumeOnEnter)
        {
            Modify local_6;
            FC_TemporarySkillOwner& local_8 = local_6.opCall();
            if (local_8)
            {
                local_8.SetUsableTime((local_8.GetUsableTime() - 1));
                if (local_8.GetUsableTime() <= 0)
                {
                    FSkillUtils::RemoveSkill(local_8.GetSkillEntity(), Context.GetEntity(), true);
                    Remove local_14;
                    local_14.opCall();
                }
            }
        }
        return;
    }
    UFUNCTION()
    void Exit_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        if (this.bConsumeOnExit)
        {
            Modify local_6;
            FC_TemporarySkillOwner& local_8 = local_6.opCall();
            if (local_8)
            {
                local_8.SetUsableTime((local_8.GetUsableTime() - 1));
                if (local_8.GetUsableTime() <= 0)
                {
                    FSkillUtils::RemoveSkill(local_8.GetSkillEntity(), Context.GetEntity(), true);
                    Remove local_14;
                    local_14.opCall();
                }
            }
        }
        return;
    }
    UFUNCTION()
    bool IsUseAsInstant_Implementation() const
    {
        bool local_1 = (!(this.bConsumeOnExit) == !(false));
        return local_1;
    }
}

class UESMAction_ConsumeRemnantSkillUsableCount : UESMBPBaseSpanAction
{
    UPROPERTY()
    bool bConsumeOnEnter = true;
    UPROPERTY()
    bool bConsumeOnExit = false;

    UFUNCTION()
    FLinearColor GetBackgroundColor_Implementation() const
    {
        return ESMActionColor::Combat;
    }
    UFUNCTION()
    void Enter_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        if (this.bConsumeOnEnter)
        {
            this.ConsumeRemnantSkillUsableCount(Context.GetEntity());
        }
        return;
    }
    UFUNCTION()
    void Exit_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        if (this.bConsumeOnExit)
        {
            this.ConsumeRemnantSkillUsableCount(Context.GetEntity());
        }
        return;
    }
    UFUNCTION()
    bool IsUseAsInstant_Implementation() const
    {
        bool local_1 = (!(this.bConsumeOnExit) == !(false));
        return local_1;
    }
    void ConsumeRemnantSkillUsableCount(const FECSEntity &inout PawnEntity) const
    {
        if (::FASCommonUtils::GetUniquePlayerEntity(PawnEntity).IsValid())
        {
            Modify local_14;
            FC_RemnantInfo& local_16 = local_14.opCall();
            if (local_16)
            {
                local_16.SetRemainUsableCount(FMath::Max((local_16.GetRemainUsableCount() - 1), 0));
                if (local_16.GetRemainUsableCount() <= 0)
                {
                    FC_RemnantPendingRemoveTag local_26;
                    Assign local_24;
                    local_24.opCall(local_26);
                }
            }
        }
        return;
    }
}

