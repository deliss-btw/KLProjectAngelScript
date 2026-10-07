

class UESMAction_TuneESMBBFloat : UESMBPBaseSpanAction
{
    UPROPERTY()
    FNameHandle_EntityBBVarFloat TargetFloat;
    UPROPERTY()
    FTuneFloatConfig TuneConfig;

    UESMAction_TuneESMBBFloat()
    {
        return;
    }
    UFUNCTION()
    EESMActionExclusiveType GetExclusiveType_Implementation() const
    {
        return EESMActionExclusiveType(0);
    }
    UFUNCTION()
    FString GetDisplayInfo_Implementation() const
    {
        FString local_8 = FString().Append("ESMBBеЏ‚ж•°и°ѓиЉ‚[").Append(::TuneESMBBFloatNames::GetSourceVariableName(this.TargetFloat.Name)).Append("] е№іж»‘ж—¶й—ґ=").Append(this.TuneConfig.GetSmoothTime()).Append("s");
        if (this.TuneConfig.GetbUseBlendInDuration())
        {
            local_8 += FString().Append(" BlendIn=").Append(this.TuneConfig.GetBlendInDuration()).Append("s");
        }
        if (this.TuneConfig.GetbUseBlendOutDuration())
        {
            local_8 += FString().Append(" BlendOut=").Append(this.TuneConfig.GetBlendOutDuration()).Append("s");
        }
        return local_8;
    }
    UFUNCTION()
    void OnDataValidate_Implementation(const FESMDataHierarchyInfo &inout Info)
    {
        if (this.TargetFloat.Name.IsNone())
        {
            Info.AddDataInvalidComment(EESMDataValidType(2), "еЏй‡ЏеђЌжњЄи®ѕзЅ®");
        }
        if (this.TuneConfig.GetSmoothTime() < 0.0f)
        {
            Info.AddDataInvalidComment(EESMDataValidType(1), "е№іж»‘ж—¶й—ґдёЌиѓЅе°ЏдєЋ0");
        }
        if (this.TuneConfig.GetbUseBlendInDuration() && (this.TuneConfig.GetBlendInDuration() <= 0.0f))
        {
            Info.AddDataInvalidComment(EESMDataValidType(1), "BlendInж—¶й•їеї…йЎ»е¤§дєЋ0");
        }
        if (this.TuneConfig.GetbUseBlendOutDuration() && (this.TuneConfig.GetBlendOutDuration() <= 0.0f))
        {
            Info.AddDataInvalidComment(EESMDataValidType(1), "BlendOutж—¶й•їеї…йЎ»е¤§дєЋ0");
        }
        if (!(this.TargetFloat.Name.ToString().StartsWith("TuneESMBBFloat.fTuned", ESearchCase(1))))
        {
            Info.AddDataInvalidComment(EESMDataValidType(2), FString().Append("дёЌж”ЇжЊЃ").Append(this.TargetFloat.Name).Append("пјЊйЎ»дЅїз”ЁTuneESMBBFloatдё‹TunedејЂе¤ґзљ„еЏй‡ЏпјЊж›ґе¤љеЏй‡ЏиЇ·иЃ”зі»зЁ‹еєЏж·»еЉ "));
        }
        return;
    }
    UFUNCTION()
    void Enter_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        FName local_4 = ::TuneESMBBFloatNames::GetSourceVariableName(this.TargetFloat.Name);
        if (local_4.IsNone())
        {
            return;
        }
        const FECSEntity& local_8 = Context.GetEntity();
        ModifyOrAdd local_12;
        FC_TuneESMBBFloat& local_14 = local_12.opCall();
        if (local_14)
        {
            FTuneFloatData& local_22 = local_14.Push(local_4, this.TuneConfig, float32(Time.ActionDuration.ToSeconds()));
            if (this.TuneConfig.HasOption(ETuneFloatOptions(1)))
            {
                float32 local_29 = this.TuneConfig.GetClampedValue(local_8.GetBB_Float(local_4.opImplConv()));
                if (this.CanSnap(local_8, local_4, this.TuneConfig, local_22.GetTunedValue(), local_29))
                {
                    this.DoSnap(local_8, local_4, local_22, local_29);
                }
            }
        }
        return;
    }
    UFUNCTION()
    void Exit_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        int local_22 = 0;
        int local_40 = 0;
        FName local_4 = ::TuneESMBBFloatNames::GetSourceVariableName(this.TargetFloat.Name);
        if (local_4.IsNone())
        {
            return;
        }
        const FECSEntity& local_8 = Context.GetEntity();
        Modify local_12;
        FC_TuneESMBBFloat& local_14 = local_12.opCall();
        if (local_14)
        {
            if (local_14.Pop(local_4))
            {
                bool local_5 = this.TuneConfig.HasOption(ETuneFloatOptions(2));
                bool local_15 = local_14.HasOption(local_4, ETuneFloatOptions(3));
                if ((local_5 || local_15))
                {
                    const FTuneFloatData& local_20 = local_14.GetDataMap()[local_4];
                    if (local_15)
                    {
                    }
                    else
                    {
                    }
                    float32 local_30 = local_22.GetClampedValue(local_8.GetBB_Float(local_4.opImplConv()));
                    if (this.CanSnap(local_8, local_4, local_22, local_20.GetTunedValue(), local_30))
                    {
                        this.DoSnap(local_8, local_4, local_14.GetModify_DataMap()[local_4], local_30);
                    }
                }
                return;
            }
            Remove local_34;
            local_34.opCall();
            local_40.SetTunedValueBySourceName(local_4, 0.0f);
        }
        return;
    }
    bool CanSnap(const FECSEntity &inout Entity, const FName &inout SourceName, const FTuneFloatConfig &inout CheckConfig, const float32 CurrentValue, const float32 TargetValue) const
    {
        if (CheckConfig.GetbUseSnapDeltaThreshold())
        {
            float32 local_4 = FMath::Abs(TargetValue - CurrentValue);
            if (::TuneESMBBFloatNames::IsDegreeSourceParam(SourceName))
            {
                local_4 = FRotator3f::NormalizeAxis(local_4);
            }
            if (local_4 < CheckConfig.GetSnapDeltaThreshold())
            {
                return false;
            }
        }
        return true;
    }
    void DoSnap(const FECSEntity &inout Entity, const FName &inout SourceName, FTuneFloatData &inout Data, const float32 TargetValue) const
    {
        int local_10 = 0;
        Data.SetTunedValue(TargetValue);
        Data.SetSmoothVelocity(0.0f);
        if (Data.GetBlendAlpha() >= 1.0f)
        {
            local_10.SetTunedValueBySourceName(SourceName, TargetValue);
        }
        return;
    }
}

