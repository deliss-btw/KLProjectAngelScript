

class UESMBlackboard_ClearTrigger : UESMBPBaseSpanAction
{
    UPROPERTY()
    USkillConfig SkillConfig;
    UPROPERTY()
    UESMInputTriggerAsset InputRule;
    UPROPERTY()
    FNameHandle_ESMBBTrigger Trigger;
    UPROPERTY()
    bool bClearOnEnter = true;
    UPROPERTY()
    bool bClearOnExit;
    UPROPERTY()
    bool bManuallTrigger = true;


    UFUNCTION()
    EESMActionExclusiveType GetExclusiveType_Implementation() const
    {
        return EESMActionExclusiveType(0);
    }
    UFUNCTION()
    void Enter_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        if (this.bClearOnEnter && !((FName(this.Trigger.Name) == NAME_None)))
        {
            FESMTriggerUtils::ClearTrigger(Context.GetEntity(), Context.GetBlackboard().GetTriggerStorage(), this.Trigger.Name);
        }
        return;
    }
    UFUNCTION()
    void Exit_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        if (this.bClearOnExit && !((FName(this.Trigger.Name) == NAME_None)))
        {
            FESMTriggerUtils::ClearTrigger(Context.GetEntity(), Context.GetBlackboard().GetTriggerStorage(), this.Trigger.Name);
        }
        return;
    }
    UFUNCTION()
    void OnDataValidate_Implementation(const FESMDataHierarchyInfo &inout Info)
    {
        FName local_2;
        if (this.SkillConfig != nullptr)
        {
            local_2 = this.SkillConfig.ESMTriggerUsedForTransit;
            this.bManuallTrigger = false;
        }
        else
        {
            if (this.InputRule != nullptr)
            {
                local_2 = this.InputRule.OutputTrigger;
                this.bManuallTrigger = false;
            }
            else
            {
                local_2 = this.Trigger.Name;
                this.bManuallTrigger = true;
            }
        }
        if ((!((FName(this.Trigger.Name) == local_2))))
        {
            this.Trigger.Name = local_2;
        }
        return;
    }
    UFUNCTION()
    bool IsUseAsInstant_Implementation() const
    {
        bool local_1 = (!(this.bClearOnExit) == !(false));
        return local_1;
    }
}

class UESMBlackboard_ClearTriggerByGroup : UESMBPBaseSpanAction
{
    UPROPERTY()
    FNameHandle_ESMTriggerGroup TriggerGroup;
    UPROPERTY()
    bool bClearOnEnter = true;
    UPROPERTY()
    bool bClearOnExit;


    UFUNCTION()
    EESMActionExclusiveType GetExclusiveType_Implementation() const
    {
        return EESMActionExclusiveType(0);
    }
    UFUNCTION()
    void Enter_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        if (this.bClearOnEnter && !((FName(this.TriggerGroup.Name) == NAME_None)))
        {
            FESMTriggerUtils::ClearTriggerByGroup(Context.GetEntity(), Context.GetBlackboard().GetTriggerStorage(), this.TriggerGroup.Name);
        }
        return;
    }
    UFUNCTION()
    void Exit_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        if (this.bClearOnExit && !((FName(this.TriggerGroup.Name) == NAME_None)))
        {
            FESMTriggerUtils::ClearTriggerByGroup(Context.GetEntity(), Context.GetBlackboard().GetTriggerStorage(), this.TriggerGroup.Name);
        }
        return;
    }
    UFUNCTION()
    bool IsUseAsInstant_Implementation() const
    {
        bool local_1 = (!(this.bClearOnExit) == !(false));
        return local_1;
    }
}

