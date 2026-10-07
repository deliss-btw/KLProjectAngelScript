

struct FESMAction_SkillStageInstanceData
{
    UPROPERTY()
    int PrevStage = 0;


}

class UESMAction_SkillStage : UESMBPBaseSpanAction
{
    UPROPERTY()
    USkillConfig SkillConfig;
    UPROPERTY()
    int TargetStage = 0;
    UPROPERTY()
    bool bTurnBacktoPrevStageOnExit = false;


    UFUNCTION()
    FESMInstanceDataInfo GetInstanceDataInfo_Implementation() const
    {
        return ESMInstanceData::MakeRuntimeInstanceDataInfo(FESMAction_SkillStageInstanceData);
    }
    UFUNCTION()
    bool IsUseAsInstant_Implementation() const
    {
        return !(this.bTurnBacktoPrevStageOnExit);
    }
    UFUNCTION()
    bool GetDisableInstanceData_Implementation() const
    {
        return !(this.bTurnBacktoPrevStageOnExit);
    }
    UFUNCTION()
    FString GetDisplayInfo_Implementation() const
    {
        if (this.SkillConfig != nullptr)
        {
            return FString().Append("Skill Stage: ").Append(this.SkillConfig.GetSkillName());
        }
        return "Skill Stage";
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
        if (this.bTurnBacktoPrevStageOnExit)
        {
            FESMAction_SkillStageInstanceData& local_16 = this.ModifyInstanceData(Context);
            local_16.PrevStage = local_12.GetSkillRuntimeInfos()[local_14].GetStage();
        }
        FSkillUtils::SkillTurnToStage(local_6, local_14, this.TargetStage, Time.WorldTime);
        return;
    }
    UFUNCTION()
    void Exit_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        int local_12 = 0;
        int local_13 = 0;
        if (!(this.bTurnBacktoPrevStageOnExit))
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
        FSkillUtils::SkillTurnToStage(local_6, local_14, local_13, Time.WorldTime);
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
    FESMAction_SkillStageInstanceData GetInstanceData(const FESMContext &inout Context) const
    {
        FESMAction_SkillStageInstanceData __r;
        return __r;
    }
    FESMAction_SkillStageInstanceData ModifyInstanceData(const FESMContext &inout Context) const
    {
        FESMAction_SkillStageInstanceData __r;
        return __r;
    }
}

