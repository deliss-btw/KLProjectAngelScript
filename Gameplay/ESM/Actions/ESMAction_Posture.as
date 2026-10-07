

struct FESMAction_WindupPostureInstanceData
{
    UPROPERTY()
    float32 PreviousPostureValue = 0.0f;


}

class UESMAction_WindupPosture : UESMBPBaseSpanAction
{
    UPROPERTY()
    float32 AddPostureValue = 0.0f;


    UFUNCTION()
    FESMInstanceDataInfo GetInstanceDataInfo_Implementation() const
    {
        return ESMInstanceData::MakeRuntimeInstanceDataInfo(FESMAction_WindupPostureInstanceData);
    }
    UFUNCTION()
    void Enter_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        int local_6 = 0;
        if (!(local_6))
        {
            return;
        }
        this.ModifyInstanceData(Context).PreviousPostureValue = local_6.GetAttributeValue(Attribute::Posture, Time.WorldTime);
        FGameAttributeUtils::Recover(Context.GetEntity(), Attribute::Posture, Time.WorldTime, this.AddPostureValue, -1.0f);
        return;
    }
    UFUNCTION()
    void Exit_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        int local_6 = 0;
        const FESMAction_WindupPostureInstanceData& local_10;
        if (!(local_6))
        {
            return;
        }
        if (local_6.GetAttributeValue(Attribute::Posture, Time.WorldTime) > local_10.PreviousPostureValue)
        {
            FGameAttributeUtils::Consume(Context.GetEntity(), Attribute::Posture, Time.WorldTime, this.AddPostureValue);
        }
        return;
    }
    FESMAction_WindupPostureInstanceData GetInstanceData(const FESMContext &inout Context) const
    {
        FESMAction_WindupPostureInstanceData __r;
        return __r;
    }
    FESMAction_WindupPostureInstanceData ModifyInstanceData(const FESMContext &inout Context) const
    {
        FESMAction_WindupPostureInstanceData __r;
        return __r;
    }
}

class UESMAction_HitBreakResistance : UESMBPBaseSpanAction
{
    UPROPERTY()
    EHitBreakResistanceLevel Level = EHitBreakResistanceLevel(2);


    UFUNCTION()
    EESMActionExclusiveType GetExclusiveType_Implementation() const
    {
        return EESMActionExclusiveType(0);
    }
    UFUNCTION()
    void Enter_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        int local_10 = 0;
        if (int(this.Level) == 1)
        {
            return;
        }
        else
        {
            switch (int(this.Level))
            {
            case 2:
            {
                local_10.GetHitBreakResistance().SetLeve2Count((local_10.GetHitBreakResistance().GetLeve2Count() + 1));
                return;
            }
            case 3:
            {
                local_10.GetHitBreakResistance().SetLeve3Count((local_10.GetHitBreakResistance().GetLeve3Count() + 1));
                return;
            }
            case 4:
            {
                local_10.GetHitBreakResistance().SetLeve4Count((local_10.GetHitBreakResistance().GetLeve4Count() + 1));
                return;
            }
            }
        }
    }
    UFUNCTION()
    void Exit_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        int local_10 = 0;
        if (int(this.Level) == 1)
        {
            return;
        }
        else
        {
            if (!(local_10))
            {
                return;
            }
            else
            {
                switch (int(this.Level))
                {
                case 2:
                {
                    local_10.GetHitBreakResistance().SetLeve2Count((local_10.GetHitBreakResistance().GetLeve2Count() - 1));
                    return;
                }
                case 3:
                {
                    local_10.GetHitBreakResistance().SetLeve3Count((local_10.GetHitBreakResistance().GetLeve3Count() - 1));
                    return;
                }
                case 4:
                {
                    local_10.GetHitBreakResistance().SetLeve4Count((local_10.GetHitBreakResistance().GetLeve4Count() - 1));
                    return;
                }
                }
            }
        }
    }
    UFUNCTION()
    void OnDataValidate_Implementation(const FESMDataHierarchyInfo &inout Info)
    {
        if (int(this.Level) == 1)
        {
            Info.AddDataInvalidComment(EESMDataValidType(1), "HitBreak Resistance Level 1 is no effect.");
        }
        return;
    }
}

