class UESMAction_CameraModifier : UESMBPBaseSpanTickAction
{
    UPROPERTY()
    FDataObjectPtr Modifier;
    UPROPERTY()
    bool bAlignActionTime = false;

    UFUNCTION()
    EESMActionExclusiveType GetExclusiveType_Implementation() const
    {
        return EESMActionExclusiveType(0);
    }
    UFUNCTION()
    FLinearColor GetBackgroundColor_Implementation() const
    {
        return ESMActionColor::Camera;
    }
    UFUNCTION()
    EESMAssetWorkflow GetWorkflow_Implementation() const
    {
        return EESMAssetWorkflow(3);
    }
    UFUNCTION()
    EESMActionType GetActionType_Implementation() const
    {
        return EESMActionType(1);
    }
    UFUNCTION()
    bool NeedTick_Implementation() const
    {
        return this.bAlignActionTime;
    }
    UFUNCTION()
    void Enter_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        FCameraUtils::StartModifier(Context.GetEntity(), Time.WorldLastTime, this.GetDataPathName(), TDataObjectPtr<FTPCameraModifierConfig>(this.Modifier), -1.0f);
        return;
    }
    UFUNCTION()
    void Exit_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        FCameraUtils::StopModifier(Context.GetEntity(), Time.WorldLastTime, this.GetDataPathName(), TDataObjectPtr<FTPCameraModifierConfig>(this.Modifier), -1.0f, true);
        return;
    }
    UFUNCTION()
    void Tick_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        FCameraUtils::AlignModifierTime(Context.GetEntity(), (FFPTime(Time.WorldTime) - Time.ActionTime), this.GetDataPathName(), this.Modifier);
        return;
    }
    UFUNCTION()
    void OnDataValidate_Implementation(const FESMDataHierarchyInfo &inout Node)
    {
        if (!(this.Modifier.IsValid()))
        {
            Node.AddDataInvalidComment(EESMDataValidType(2), "Camera Modifier 配置无效");
        }
        return;
    }
}

