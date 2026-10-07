

class UESMAction_AirMovementFloating : UESMBPBaseSpanTickAction
{
    UPROPERTY()
    FESMBBVar_Float FloatingHeightMin = -1.0f;
    UPROPERTY()
    FESMBBVar_Float FloatingHeight = 300.0f;
    UPROPERTY()
    FESMBBVar_Float FloatingAdjustSpeed = 600.0f;

    UESMAction_AirMovementFloating()
    {
        return;
    }
    UFUNCTION()
    FLinearColor GetBackgroundColor_Implementation() const
    {
        return ESMActionColor::Movement;
    }
    UFUNCTION()
    void Enter_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        int local_8 = 0;
        float32 local_10 = 0.0f;
        float32 local_11 = 0.0f;
        float32 local_14 = 0.0f;
        const FECSEntity& local_2 = Context.GetEntity();
        if (local_8)
        {
            local_8.SetbFlyFloating(true);
            float32 local_12 = FMath::Min(local_10, local_11);
            float32 local_13 = FMath::Max(local_10, local_11);
            if (local_12 < 0.0f)
            {
            }
            else
            {
            }
            local_8.SetFloatingHeight(local_13);
            local_8.SetFloatingHeightMin(local_12);
            local_8.SetFloatingAdjustSpeed(local_14);
        }
        return;
    }
    UFUNCTION()
    void Exit_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        int local_8 = 0;
        const FECSEntity& local_2 = Context.GetEntity();
        if (local_8)
        {
            local_8.SetbFlyFloating(false);
        }
        return;
    }
    UFUNCTION()
    void GetRestriction_Implementation(FESMNotifyRestriction &inout OutParam) const
    {
        OutParam.bExclusive = true;
        OutParam.IdentifyName = UESMAction_AirMovementFloating.opArrow().GetFName();
        return;
    }
    UFUNCTION()
    FString GetDisplayInfo_Implementation() const
    {
        bool local_2 = this.IsFloatingHeightParamValid(this.FloatingHeightMin);
        bool local_1 = this.IsFloatingHeightParamValid(this.FloatingHeight);
        if ((local_2 && local_1))
        {
            return FString().Append("з©єдё­ж‚¬жµ®жЁЎејЏ: й«еє¦иЊѓе›ґ [").Append(this.GetFloatingHeightParamStr(this.FloatingHeightMin)).Append("пјЊ").Append(this.GetFloatingHeightParamStr(this.FloatingHeight)).Append("], и°ѓж•ґйЂџеє¦ ").Append(this.GetFloatingHeightParamStr(this.FloatingAdjustSpeed)).Append(" ");
        }
        else
        {
            if (local_2)
            {
                return FString().Append("з©єдё­ж‚¬жµ®жЁЎејЏ: е›єе®љй«еє¦ ").Append(this.GetFloatingHeightParamStr(this.FloatingHeightMin)).Append(", и°ѓж•ґйЂџеє¦ ").Append(this.GetFloatingHeightParamStr(this.FloatingAdjustSpeed)).Append(" ");
            }
            else
            {
                if (local_1)
                {
                    return FString().Append("з©єдё­ж‚¬жµ®жЁЎејЏ: е›єе®љй«еє¦ ").Append(this.GetFloatingHeightParamStr(this.FloatingHeight)).Append(", и°ѓж•ґйЂџеє¦ ").Append(this.GetFloatingHeightParamStr(this.FloatingAdjustSpeed)).Append(" ");
                }
                else
                {
                    return FString().Append("з©єдё­ж‚¬жµ®жЁЎејЏ: й«еє¦йќћжі•, и°ѓж•ґйЂџеє¦ ").Append(this.GetFloatingHeightParamStr(this.FloatingAdjustSpeed));
                }
            }
        }
    }
    UFUNCTION()
    void OnDataValidate_Implementation(const FESMDataHierarchyInfo &inout Info)
    {
        if (!(this.FloatingHeightMin.bReadVar) && !(this.FloatingHeight.bReadVar))
        {
            if (this.FloatingHeightMin.Value < 0.0f && (this.FloatingHeight.Value < 0.0f))
            {
                Info.AddDataInvalidComment(EESMDataValidType(2), "ж‚¬жµ®й«еє¦дё‹з•Ње’Њж‚¬жµ®й«еє¦дёЉз•ЊдёЌиѓЅеђЊж—¶е°ЏдєЋ0");
                return;
            }
            if (this.FloatingHeight.Value > 0.0f && (this.FloatingHeightMin.Value > this.FloatingHeight.Value))
            {
                Info.AddDataInvalidComment(EESMDataValidType(2), "ж‚¬жµ®й«еє¦дё‹з•ЊдёЌиѓЅе¤§дєЋж‚¬жµ®й«еє¦дёЉз•Њ");
            }
        }
        return;
    }
    bool IsFloatingHeightParamValid(const FESMBBVar_Float &inout FloatParam) const
    {
        return (FloatParam.bReadVar || (FloatParam.Value >= 0.0f));
    }
    FString GetFloatingHeightParamStr(const FESMBBVar_Float &inout FloatParam) const
    {
        FString local_16;
        if (FloatParam.bReadVar)
        {
            local_16 = FloatParam.ToString();
        }
        else
        {
            local_16 = FString().Append(uint(int(FloatParam.Value)));
        }
        return local_16;
    }
}

class UESMAction_SwoopMove : UESMBPBaseSpanTickAction
{
    UPROPERTY()
    float32 SwoopAngle = 45.0f;
    UPROPERTY()
    FRuntimeFloatCurve VelocityRatioCurve = FRuntimeCurveUtils::CreateLinear(0.0f, 1.0f, 1.0f, 1.0f);
    UPROPERTY()
    float32 ExitGroundHeight = 300.0f;
    UPROPERTY()
    FNameHandle_ESMBBTrigger ExitTrigger;


    UFUNCTION()
    void Tick_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
    }
    UFUNCTION()
    void Exit_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        int local_8 = 0;
        const FECSEntity& local_2 = Context.GetEntity();
        if (local_8)
        {
            local_8.SetbFlyFloating(false);
        }
        return;
    }
}

