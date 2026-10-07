

struct FESMAction_SkillStateInstanceData
{
    UPROPERTY()
    int PrevState = 0;


}

class UESMAction_SkillState : UESMBPBaseSpanAction
{
    UPROPERTY()
    USkillConfig SkillConfig;
    UPROPERTY()
    int TargetState = 0;
    UPROPERTY()
    bool bTurnBacktoPrevStateOnExit = false;


    UFUNCTION()
    FESMInstanceDataInfo GetInstanceDataInfo_Implementation() const
    {
        return ESMInstanceData::MakeRuntimeInstanceDataInfo(FESMAction_SkillStateInstanceData);
    }
    UFUNCTION()
    bool IsUseAsInstant_Implementation() const
    {
        return !(this.bTurnBacktoPrevStateOnExit);
    }
    UFUNCTION()
    bool GetDisableInstanceData_Implementation() const
    {
        return !(this.bTurnBacktoPrevStateOnExit);
    }
    UFUNCTION()
    FString GetDisplayInfo_Implementation() const
    {
        if (this.SkillConfig != nullptr)
        {
            return FString().Append("Skill State: ").Append(this.SkillConfig.GetSkillName());
        }
        return "Skill State";
    }
    UFUNCTION()
    FLinearColor GetBackgroundColor_Implementation() const
    {
        return ESMActionColor::Combat;
    }
    UFUNCTION()
    void Enter_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
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
        if (this.bTurnBacktoPrevStateOnExit)
        {
            FESMAction_SkillStateInstanceData& local_16 = this.ModifyInstanceData(Context);
            local_16.PrevState = local_12.GetSkillRuntimeInfos()[local_14].GetSkillState();
        }
        FSkillUtils::ChangeSkillState(local_6, local_14, this.TargetState, Time.WorldTime);
        return;
    }
    UFUNCTION()
    void Exit_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        int local_12 = 0;
        int local_13 = 0;
        if (!(this.bTurnBacktoPrevStateOnExit))
        {
            return;
        }
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
        FSkillUtils::ChangeSkillState(local_6, local_14, local_13, Time.WorldTime);
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
    FESMAction_SkillStateInstanceData GetInstanceData(const FESMContext &inout Context) const
    {
        FESMAction_SkillStateInstanceData __r;
        return __r;
    }
    FESMAction_SkillStateInstanceData ModifyInstanceData(const FESMContext &inout Context) const
    {
        FESMAction_SkillStateInstanceData __r;
        return __r;
    }
}

