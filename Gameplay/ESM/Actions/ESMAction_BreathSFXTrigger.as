enum EBreathSFXTriggerType
{
    Enable,
    Disable,
}

class UESMAction_BreathSFXTrigger : UESMBPBaseInstantAction
{
    UPROPERTY()
    EBreathSFXTriggerType BreathSFXTriggerType = EBreathSFXTriggerType(0);
    UPROPERTY()
    FName AudioComponentName = n"None";
    UPROPERTY()
    bool bAllowStacking = false;

    UFUNCTION()
    EESMAssetWorkflow GetWorkflow_Implementation() const
    {
        return EESMAssetWorkflow(2);
    }
    UFUNCTION()
    EESMActionType GetActionType_Implementation() const
    {
        return EESMActionType(1);
    }
    UFUNCTION()
    void Do_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        if (this.AudioComponentName.IsNone())
        {
            XWarning(ELog(1), FString().Append("ESMAction_BreathSFXTrigger: AudioComponentName is empty! Please select an audio component from the dropdown menu."));
            return;
        }
        this.ExecuteBreathSFXTrigger(Context.GetEntity(), this.BreathSFXTriggerType, this.AudioComponentName, (this.bAllowStacking));
        return;
    }
    UFUNCTION()
    void OnDataValidate_Implementation(const FESMDataHierarchyInfo &inout Node)
    {
        if (this.AudioComponentName.IsNone())
        {
            Node.AddDataInvalidComment(EESMDataValidType(2), "音频组件名称不能为空，请从下拉菜单中选择音频组件");
        }
        return;
    }
    UFUNCTION()
    FString GetDisplayInfo_Implementation() const
    {
        FString local_10 = this.GetTriggerTypeString(this.BreathSFXTriggerType);
        FString local_4 = this.AudioComponentName.ToString();
        FString local_14;
        if (this.bAllowStacking)
        {
            local_14 = " [叠加]";
        }
        else
        {
            local_14 = " [单次]";
        }
        return FString().Append(local_10).Append("呼吸音效: ").Append(local_4).Append(local_14);
    }
    void ExecuteBreathSFXTrigger(const FECSEntity &inout Entity, const EBreathSFXTriggerType InTriggerType, const FName &inout InAudioComponentName, const bool InAllowStacking) const
    {
        ::BreathSFXUtils::ProcessEntityBreathSFX(Entity, EBreathSFXTriggerType(InTriggerType), InAudioComponentName, InAllowStacking);
        return;
    }
    FString GetTriggerTypeString(const EBreathSFXTriggerType InTriggerType) const
    {
        switch (int(InTriggerType))
        {
        case 0:
        {
            return "启用";
        }
        case 1:
        {
            return "禁用";
        }
        }
        return "未知";
    }
}

