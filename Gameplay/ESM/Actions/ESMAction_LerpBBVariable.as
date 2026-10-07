

class UESMAction_LerpBBVar : UESMBPBaseSpanAction
{
    UPROPERTY()
    FNameHandle_EntityBBVarFloat VarName;
    UPROPERTY()
    float32 Value;
    UPROPERTY()
    FFPTime LerpInDuration;
    UPROPERTY()
    FFPTime LerpOutDuration;

    UESMAction_LerpBBVar()
    {
        return;
    }
    UFUNCTION()
    FString GetDisplayInfo_Implementation() const
    {
        return FString().Append("Lerp [").Append(this.VarName.Name).Append("] = ").Append(this.Value);
    }
    UFUNCTION()
    void GetRestriction_Implementation(FESMNotifyRestriction &inout OutParam) const
    {
        OutParam.ModifyBBVars.Add(this.VarName.Name);
        return;
    }
    UFUNCTION()
    void OnDataValidate_Implementation(const FESMDataHierarchyInfo &inout Info)
    {
        if (this.VarName.Name.IsNone())
        {
            Info.AddDataInvalidComment(EESMDataValidType(2), "Not Valid Variable");
        }
        return;
    }
    UFUNCTION()
    void Enter_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        int local_14 = 0;
        const FECSEntity& local_2 = Context.GetEntity();
        if (this.LerpInDuration.opCmp(0.0) > 0)
        {
            FESMBBVarLerpKey local_24;
            local_24.SetVarName(this.VarName.Name);
            local_24.SetTimeStart(Time.WorldTime);
            FFPTime local_30 = FFPTime(Time.WorldTime);
            local_24.SetTimeEnd((local_30 + (this.LerpInDuration * Time.PlaySpeed)));
            local_24.SetFromValue(local_2.GetBB_Float(this.VarName, local_24.GetTimeStart()));
            local_24.SetTargetValue(this.Value);
            local_2.SetBB_Float(this.VarName, local_24.GetTimeStart(), local_24.GetFromValue());
            local_2.SetBB_Float(this.VarName, local_24.GetTimeEnd(), local_24.GetTargetValue());
            local_14.GetModify_LerpKeys().Add(local_24);
            return;
        }
        local_2.SetBB_Float(this.VarName, Time.WorldTime, this.Value);
        return;
    }
    UFUNCTION()
    void Exit_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        int local_14 = 0;
        FNameHandle_EntityBBVar local_34;
        const FECSEntity& local_2 = Context.GetEntity();
        if (this.LerpOutDuration.opCmp(0.0) > 0)
        {
            FNameHandle_EntityBBVarFloat local_38;
            FESMBBVarLerpKey local_24;
            local_24.SetVarName(this.VarName.Name);
            local_24.SetTimeStart(Time.WorldTime);
            FFPTime local_30 = FFPTime(Time.WorldTime);
            local_24.SetTimeEnd((local_30 + (this.LerpOutDuration * Time.PlaySpeed)));
            local_24.SetFromValue(this.Value);
            local_2.SetBB_Float(this.VarName, local_24.GetTimeStart(), local_24.GetFromValue());
            local_34;
            local_2.ResetBB_Value(local_34, this.VarName.Name);
            local_38;
            local_24.SetTargetValue(local_2.GetBB_Float(local_38, this.VarName.Name));
            local_14.GetModify_LerpKeys().Add(local_24);
            return;
        }
        local_34;
        local_2.ResetBB_Value(local_34, this.VarName.Name);
        return;
    }
}

