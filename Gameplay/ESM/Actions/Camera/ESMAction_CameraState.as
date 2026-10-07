

struct FESMCameraStateInstanceData
{
    UPROPERTY()
    bool bConditionActive = false;


}

class UESMAction_CameraState : UESMBPBaseSpanTickAction
{
    UPROPERTY()
    FDataObjectPtr StateKey;
    UPROPERTY()
    bool bAlignActionTime = false;
    UPROPERTY()
    FESMBlackboardConditionAndArray ActiveCondition;


    UFUNCTION()
    FESMInstanceDataInfo GetInstanceDataInfo_Implementation() const
    {
        return ESMInstanceData::MakeRuntimeInstanceDataInfo(FESMCameraStateInstanceData);
    }
    UFUNCTION()
    bool GetDisableInstanceData_Implementation() const
    {
        return this.ActiveCondition.IsEmpty();
    }
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
        return this.bAlignActionTime || !(this.ActiveCondition.IsEmpty());
    }
    UFUNCTION()
    void OnInitData_Implementation(const FESMDataHierarchyInfo &inout Info)
    {
        this.ActiveCondition.InitConditionRuntime(false);
        return;
    }
    UFUNCTION()
    void Enter_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        bool local_2 = this.ActiveCondition.IsEmpty();
        if (local_2)
        {
            local_2 = true;
        }
        else
        {
            local_2 = this.ActiveCondition.Evaluate(Context.GetBlackboard());
        }
        if (!(this.ActiveCondition.IsEmpty()))
        {
            this.ModifyInstanceData(Context).bConditionActive = local_2;
        }
        if (local_2)
        {
            FCameraUtils::UpdateState(Context.GetEntity(), Time.WorldTime, this.StateKey);
        }
        return;
    }
    UFUNCTION()
    void Exit_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        bool local_3 = false;
        if ((this.ActiveCondition.IsEmpty() || local_3))
        {
            this.UpdateToDefault(Context, Time.WorldTime);
        }
        return;
    }
    UFUNCTION()
    void Tick_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        int local_12 = 0;
        bool local_1 = true;
        if (!(this.ActiveCondition.IsEmpty()))
        {
            bool local_5;
            local_1 = this.ActiveCondition.Evaluate(Context.GetBlackboard());
            FESMCameraStateInstanceData& local_4 = this.ModifyInstanceData(Context);
            local_5 = local_4.bConditionActive;
            local_4.bConditionActive = local_1;
            if ((local_1 && !(local_5)))
            {
                FCameraUtils::UpdateState(Context.GetEntity(), Time.WorldTime, this.StateKey);
            }
            else
            {
                bool local_2 = !(local_1);
                if ((local_2 && local_5))
                {
                    local_2 = false;
                    if ((local_12.GetStateRef().GetDataName() == this.StateKey.GetDataName()))
                    {
                        this.UpdateToDefault(Context, Time.WorldTime);
                    }
                }
            }
        }
        if ((local_1 && this.bAlignActionTime))
        {
            FFPTime local_18 = FFPTime(Time.ActionLastTime);
            if ((local_18 == 0.0))
            {
                FCameraUtils::UpdateState(Context.GetEntity(), Time.WorldLastTime, this.StateKey);
            }
            FCameraUtils::AlignStateTime(Context.GetEntity(), Time.WorldTime, (FFPTime(Time.WorldTime) - Time.ActionTime), this.StateKey);
        }
        return;
    }
    UFUNCTION()
    FString GetDisplayInfo_Implementation() const
    {
        return FString().Append("дї®ж”№з›ёжњєзЉ¶жЂЃ: ").Append(this.StateKey.GetDataName());
    }
    FESMCameraStateInstanceData GetInstanceData(const FESMContext &inout Context) const
    {
        FESMCameraStateInstanceData __r;
        return __r;
    }
    FESMCameraStateInstanceData ModifyInstanceData(const FESMContext &inout Context) const
    {
        FESMCameraStateInstanceData __r;
        return __r;
    }
    void UpdateToDefault(const FESMContext &inout Context, const FFPTime &inout WorldTime) const
    {
        FDataObjectPtr local_24;
        GetDefaulted local_28;
        const FC_TPCameraConfig& local_30 = local_28.opCall();
        if (local_30)
        {
            local_24 = local_30.DefaultCameraState;
        }
        FCameraUtils::UpdateState(Context.GetEntity(), WorldTime, local_24);
        return;
    }
}

