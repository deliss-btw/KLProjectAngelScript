

class UESMAction_ToggleComponentsForDuration : UESMBPBaseSpanAction
{
    UPROPERTY()
    bool bHidden = true;
    UPROPERTY()
    FNameToComponentLogicNames LogicNames;


    UFUNCTION()
    EESMActionExclusiveType GetExclusiveType_Implementation() const
    {
        return EESMActionExclusiveType(0);
    }
    UFUNCTION()
    EESMActionType GetActionType_Implementation() const
    {
        return EESMActionType(1);
    }
    UFUNCTION()
    void Enter_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
    }
    UFUNCTION()
    void Exit_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
    }
}

struct FESMToggleComponentsWithConditionData
{
    UPROPERTY()
    bool bActive = false;


}

class UESMAction_ToggleComponentsWithCondition : UESMBPBaseSpanTickAction
{
    UPROPERTY()
    bool bHidden = true;
    UPROPERTY()
    FNameToComponentLogicNames LogicNames;
    UPROPERTY()
    FESMBlackboardConditionAndArray ActiveCondition;
    UPROPERTY()
    float32 CheckInterval = -1.0f;


    UFUNCTION()
    FESMInstanceDataInfo GetInstanceDataInfo_Implementation() const
    {
        return ESMInstanceData::MakeRuntimeInstanceDataInfo(FESMToggleComponentsWithConditionData);
    }
    UFUNCTION()
    EESMActionExclusiveType GetExclusiveType_Implementation() const
    {
        return EESMActionExclusiveType(0);
    }
    UFUNCTION()
    EESMActionType GetActionType_Implementation() const
    {
        return EESMActionType(1);
    }
    UFUNCTION()
    bool NeedTick_Implementation() const
    {
        return this.CheckInterval >= 0.0f && !(this.ActiveCondition.IsEmpty());
    }
    UFUNCTION()
    bool GetDisableInstanceData_Implementation() const
    {
        return this.ActiveCondition.IsEmpty();
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
        if ((int(Context.GetEntity().GetRegistryType())) == 2 || (int(Context.GetEntity().GetRegistryType()) == 1))
        {
            XError(ELog(5), FString().Append("ESMAction_ToggleVisualComponent will only have effect on Synced entities."));
            return;
        }
        this.UpdateActivation(Context, Time, false);
        return;
    }
    UFUNCTION()
    void Exit_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        if ((int(Context.GetEntity().GetRegistryType())) == 2 || (int(Context.GetEntity().GetRegistryType()) == 1))
        {
            XError(ELog(5), FString().Append("ESMAction_ToggleVisualComponent will only have effect on Synced entities."));
            return;
        }
        this.UpdateActivation(Context, Time, true);
        return;
    }
    UFUNCTION()
    void Tick_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        if (this.CheckInterval == 0.0f || Time.IsActionRealTimeOnInterval(FFPTime(this.CheckInterval)))
        {
            this.UpdateActivation(Context, Time, false);
        }
        return;
    }
    FESMToggleComponentsWithConditionData GetInstanceData(const FESMContext &inout Context) const
    {
        FESMToggleComponentsWithConditionData __r;
        return __r;
    }
    FESMToggleComponentsWithConditionData ModifyInstanceData(const FESMContext &inout Context) const
    {
        FESMToggleComponentsWithConditionData __r;
        return __r;
    }
    void UpdateActivation(const FESMContext &inout Context, const FESMActionTime &inout Time, const bool bExiting = false) const
    {
        bool local_1;
        bool local_3;
        if (this.ActiveCondition.IsEmpty())
        {
            if (!(bExiting))
            {
                local_3 = this.bHidden;
            }
            else
            {
                local_3 = !(this.bHidden);
            }
            this.UpdateHidden(Context, Time, local_3);
            return;
        }
        bool local_2 = !(bExiting);
        if (!(local_2))
        {
            local_3 = false;
        }
        else
        {
            local_3 = this.ActiveCondition.Evaluate(Context.GetBlackboard());
        }
        bool local_5 = local_2;
        bool local_4 = !(local_3);
        bool local_2_2 = !(local_5);
        if (local_4 == local_2_2)
        {
            return;
        }
        if (local_3)
        {
            local_1 = this.bHidden;
        }
        else
        {
            local_1 = !(this.bHidden);
        }
        if (this.UpdateHidden(Context, Time, local_1))
        {
            this.ModifyInstanceData(Context).bActive = local_3;
        }
        return;
    }
    bool UpdateHidden(const FESMContext &inout Context, const FESMActionTime &inout Time, const bool bFlag) const
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
        bool __r; return __r;
    }
}

class UESMAction_ToggleComponentsInstantly : UESMBPBaseInstantAction
{
    UPROPERTY()
    bool bHidden = true;
    UPROPERTY()
    FNameToComponentLogicNames LogicNames;


    UFUNCTION()
    EESMActionType GetActionType_Implementation() const
    {
        return EESMActionType(1);
    }
    UFUNCTION()
    EESMActionExclusiveType GetExclusiveType_Implementation() const
    {
        return EESMActionExclusiveType(0);
    }
    UFUNCTION()
    void Do_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
    }
}

