

class UESMAction_ConsumeAttributeInstantly : UESMBPBaseSpanAction
{
    UPROPERTY()
    bool bOnEnter = true;
    UPROPERTY()
    bool bOnExit = false;
    UPROPERTY()
    FGameAttributeRef Attribute;
    UPROPERTY()
    FESMBBVar_Numeric ConsumeValue = 0.0f;


    UFUNCTION()
    EESMActionExclusiveType GetExclusiveType_Implementation() const
    {
        return EESMActionExclusiveType(0);
    }
    UFUNCTION()
    FLinearColor GetBackgroundColor_Implementation() const
    {
        return ESMActionColor::Combat;
    }
    UFUNCTION()
    void Enter_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        float32 local_25 = 0.0f;
        if (!(this.bOnEnter))
        {
            return;
        }
        if (!(this.Attribute.IsValid()))
        {
            XError(ELog(5), FString().Append("Invalid Attribute in ESMAction: '").Append(this.GetPathName(nullptr)).Append("', Entity: '").Append(Context.GetEntity().ToString()).Append("'"));
            return;
        }
        FECSWorldPtr local_20 = Context.GetECSWorld();
        Get local_24;
        FGameAttributeUtils::QueueConsume(Context.GetEntity(), this.Attribute, FFPTime(local_24.opCall().LastTime), local_25);
        return;
    }
    UFUNCTION()
    void Exit_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        float32 local_25 = 0.0f;
        if (!(this.bOnExit))
        {
            return;
        }
        if (!(this.Attribute.IsValid()))
        {
            XError(ELog(5), FString().Append("Invalid Attribute in ESMAction: '").Append(this.GetPathName(nullptr)).Append("', Entity: '").Append(Context.GetEntity().ToString()).Append("'"));
            return;
        }
        FECSWorldPtr local_20 = Context.GetECSWorld();
        Get local_24;
        FGameAttributeUtils::QueueConsume(Context.GetEntity(), this.Attribute, FFPTime(local_24.opCall().LastTime), local_25);
        return;
    }
    UFUNCTION()
    bool IsUseAsInstant_Implementation() const
    {
        bool local_1 = (!(this.bOnExit) == !(false));
        return local_1;
    }
}

class UESMAction_RecoverAttributeInstantly : UESMBPBaseSpanAction
{
    UPROPERTY()
    bool bOnEnter = true;
    UPROPERTY()
    bool bOnExit = false;
    UPROPERTY()
    FGameAttributeRef Attribute;
    UPROPERTY()
    FESMBBVar_Numeric RecoverValue = 0.0f;


    UFUNCTION()
    EESMActionExclusiveType GetExclusiveType_Implementation() const
    {
        return EESMActionExclusiveType(0);
    }
    UFUNCTION()
    FLinearColor GetBackgroundColor_Implementation() const
    {
        return ESMActionColor::Combat;
    }
    UFUNCTION()
    void Enter_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        float32 local_25 = 0.0f;
        if (!(this.bOnEnter))
        {
            return;
        }
        if (!(this.Attribute.IsValid()))
        {
            XError(ELog(5), FString().Append("Invalid Attribute in ESMAction: '").Append(this.GetPathName(nullptr)).Append("', Entity: '").Append(Context.GetEntity().ToString()).Append("'"));
            return;
        }
        FECSWorldPtr local_20 = Context.GetECSWorld();
        Get local_24;
        FGameAttributeUtils::QueueRecover(Context.GetEntity(), this.Attribute, FFPTime(local_24.opCall().LastTime), local_25);
        return;
    }
    UFUNCTION()
    void Exit_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        float32 local_25 = 0.0f;
        if (!(this.bOnExit))
        {
            return;
        }
        if (!(this.Attribute.IsValid()))
        {
            XError(ELog(5), FString().Append("Invalid Attribute in ESMAction: '").Append(this.GetPathName(nullptr)).Append("', Entity: '").Append(Context.GetEntity().ToString()).Append("'"));
            return;
        }
        FECSWorldPtr local_20 = Context.GetECSWorld();
        Get local_24;
        FGameAttributeUtils::QueueRecover(Context.GetEntity(), this.Attribute, FFPTime(local_24.opCall().LastTime), local_25);
        return;
    }
    UFUNCTION()
    bool IsUseAsInstant_Implementation() const
    {
        bool local_1 = (!(this.bOnExit) == !(false));
        return local_1;
    }
}

struct FConsumeAttributeContinouslyMoveInstanceData
{
    UPROPERTY()
    FESMCost CompareValue;
    UPROPERTY()
    float32 CachedConsumeCoefficient = 1.0f;


}

class UESMAction_ConsumeAttributeContinously : UESMBPBaseSpanTickAction
{
    UPROPERTY()
    FGameAttributeRef Attribute;
    UPROPERTY()
    FESMBBVar_Numeric ConsumeValue = 0.0f;
    UPROPERTY()
    FFPTime Interval = 0.1;
    UPROPERTY()
    bool bSmooth = false;
    UPROPERTY()
    FESMBlackboardConditionAndArray TickConsumeCondition;


    UFUNCTION()
    FESMInstanceDataInfo GetInstanceDataInfo_Implementation() const
    {
        return ESMInstanceData::MakeRuntimeInstanceDataInfo(FConsumeAttributeContinouslyMoveInstanceData);
    }
    UFUNCTION()
    FLinearColor GetBackgroundColor_Implementation() const
    {
        return ESMActionColor::Combat;
    }
    UFUNCTION()
    void OnInitData_Implementation(const FESMDataHierarchyInfo &inout Info)
    {
        this.TickConsumeCondition.InitConditionRuntime(false);
        return;
    }
    UFUNCTION()
    void Enter_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        if (!(this.bSmooth))
        {
            return;
        }
        if (!(this.Attribute.IsValid()))
        {
            XError(ELog(5), FString().Append("Invalid Attribute in ESMAction: '").Append(this.GetPathName(nullptr)).Append("', Entity: '").Append(Context.GetEntity().ToString()).Append("'"));
            return;
        }
        this.EnableSmoothConsume(Context, Time);
        return;
    }
    UFUNCTION()
    void Exit_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        if (!(this.bSmooth))
        {
            return;
        }
        if (!(this.Attribute.IsValid()))
        {
            XError(ELog(5), FString().Append("Invalid Attribute in ESMAction: '").Append(this.GetPathName(nullptr)).Append("', Entity: '").Append(Context.GetEntity().ToString()).Append("'"));
            return;
        }
        FECSWorldPtr local_20 = Context.GetECSWorld();
        Get local_24;
        FFPTime local_18 = FFPTime(local_24.opCall().Time);
        Get local_30;
        float32 local_31 = local_30.opCall().GetAttributeValue(this.Attribute, local_18);
        FGameAttributeUtils::ChangeConsumeValue(Context.GetEntity(), this.Attribute, local_18, local_31, 0.0f);
        return;
    }
    UFUNCTION()
    void Tick_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        float32 local_27 = 0.0f;
        int local_34 = 0;
        if (!(this.Attribute.IsValid()))
        {
            XError(ELog(5), FString().Append("Invalid Attribute in ESMAction: '").Append(this.GetPathName(nullptr)).Append("', Entity: '").Append(Context.GetEntity().ToString()).Append("'"));
            return;
        }
        if (!(this.TickConsumeCondition.Evaluate(Context.GetBlackboard())))
        {
            return;
        }
        FECSWorldPtr local_20 = Context.GetECSWorld();
        Get local_24;
        FFPTime local_18 = FFPTime(local_24.opCall().Time);
        if (!(this.bSmooth))
        {
            int local_26 = Time.GetActionRealTimeIntervalNum(this.Interval);
            if (local_26 > 0)
            {
                local_27 = local_27 * local_26;
                FGameAttributeUtils::QueueConsume(Context.GetEntity(), this.Attribute, local_18, local_27);
            }
        }
        else
        {
            const FConsumeAttributeContinouslyMoveInstanceData& local_36;
            float32 local_28_2 = local_36.CompareValue.Evaluate(local_18);
            if ((local_34.GetAttributeValue(this.Attribute, local_18) != local_28_2 || (local_34.GetAttributeValue(local_34.GetAttributeMeta(this.Attribute).ConsumeCoefficient, local_18) != local_36.CachedConsumeCoefficient)))
            {
                this.EnableSmoothConsume(Context, Time);
            }
        }
        return;
    }
    FConsumeAttributeContinouslyMoveInstanceData GetInstanceData(const FESMContext &inout Context) const
    {
        FConsumeAttributeContinouslyMoveInstanceData __r;
        return __r;
    }
    FConsumeAttributeContinouslyMoveInstanceData ModifyInstanceData(const FESMContext &inout Context) const
    {
        FConsumeAttributeContinouslyMoveInstanceData __r;
        return __r;
    }
    void EnableSmoothConsume(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        int local_14 = 0;
        float32 local_27 = 0.0f;
        FFPTime local_2 = FFPTime(FECSWorldPtr::Get<FCS_FixedTime>(Context.GetECSWorld()).opCall().Time);
        FGameAttributeConstPtr local_18 = local_14.GetAttribute(this.Attribute);
        float32 local_24 = local_14.GetAttributeValue(this.Attribute, local_2);
        float32 local_23 = local_14.GetAttributeValue(local_14.GetAttributeMeta(this.Attribute).ConsumeCoefficient, local_2);
        local_27 = local_27 * local_23;
        local_27 = local_27 / float32(this.Interval.ToSeconds());
        if (local_27 == 0.0f)
        {
            return;
        }
        int local_33 = 0;
        FESMCost local_40 = FESMCost(local_18.GetData().Value);
        local_40.SetRecover(local_2, local_24, 0.0f, local_24 / local_27, 0.0f);
        FConsumeAttributeContinouslyMoveInstanceData& local_42 = this.ModifyInstanceData(Context);
        local_42.CompareValue = local_40;
        local_42.CachedConsumeCoefficient = local_23;
        FGameAttributeUtils::SetConsumeCost(Context.GetEntity(), this.Attribute, local_40);
        return;
    }
}

class UESMAction_RecoverAttributeContinously : UESMBPBaseSpanTickAction
{
    UPROPERTY()
    FGameAttributeRef Attribute;
    UPROPERTY()
    FESMBBVar_Numeric RecoverValue = 0.0f;
    UPROPERTY()
    FFPTime Interval = 0.1;

    UESMAction_RecoverAttributeContinously()
    {
        return;
    }
    UFUNCTION()
    FLinearColor GetBackgroundColor_Implementation() const
    {
        return ESMActionColor::Combat;
    }
    UFUNCTION()
    void Tick_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        float32 local_27 = 0.0f;
        if (!(this.Attribute.IsValid()))
        {
            XError(ELog(5), FString().Append("Invalid Attribute in ESMAction: '").Append(this.GetPathName(nullptr)).Append("', Entity: '").Append(Context.GetEntity().ToString()).Append("'"));
            return;
        }
        int local_17 = Time.GetActionRealTimeIntervalNum(this.Interval);
        if (local_17 > 0)
        {
            FECSWorldPtr local_22 = Context.GetECSWorld();
            Get local_26;
            FFPTime local_20 = FFPTime(local_26.opCall().LastTime);
            local_27 = local_27 * local_17;
            FGameAttributeUtils::QueueRecover(Context.GetEntity(), this.Attribute, local_20, local_27);
        }
        return;
    }
}

class UESMAction_StopAttributeRecover : UESMBPBaseSpanTickAction
{
    UPROPERTY()
    FGameAttributeRef Attribute;

    UESMAction_StopAttributeRecover()
    {
        return;
    }
    UFUNCTION()
    EESMActionExclusiveType GetExclusiveType_Implementation() const
    {
        return EESMActionExclusiveType(0);
    }
    UFUNCTION()
    FLinearColor GetBackgroundColor_Implementation() const
    {
        return ESMActionColor::Combat;
    }
    UFUNCTION()
    void Enter_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        if (!(this.Attribute.IsValid()))
        {
            XError(ELog(5), FString().Append("Invalid Attribute in ESMAction: '").Append(this.GetPathName(nullptr)).Append("', Entity: '").Append(Context.GetEntity().ToString()).Append("'"));
            return;
        }
        FECSWorldPtr local_20 = Context.GetECSWorld();
        Get local_24;
        FGameAttributeUtils::PushStopRecover(Context.GetEntity(), this.Attribute, FFPTime(local_24.opCall().LastTime));
        return;
    }
    UFUNCTION()
    void Exit_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        if (!(this.Attribute.IsValid()))
        {
            XError(ELog(5), FString().Append("Invalid Attribute in ESMAction: '").Append(this.GetPathName(nullptr)).Append("', Entity: '").Append(Context.GetEntity().ToString()).Append("'"));
            return;
        }
        FECSWorldPtr local_20 = Context.GetECSWorld();
        Get local_24;
        FGameAttributeUtils::PopStopRecover(Context.GetEntity(), this.Attribute, FFPTime(local_24.opCall().LastTime));
        return;
    }
}

class UESMAction_ModifyAttributeSpan : UESMBPBaseSpanAction
{
    UPROPERTY()
    FGameAttributeRef Attribute;
    UPROPERTY()
    EGameAttributeModifyType ModifyType = EGameAttributeModifyType(1);
    UPROPERTY()
    FESMBBVar_Numeric ModifyValue = 0.0f;


    UFUNCTION()
    EESMActionExclusiveType GetExclusiveType_Implementation() const
    {
        return EESMActionExclusiveType(0);
    }
    UFUNCTION()
    FLinearColor GetBackgroundColor_Implementation() const
    {
        return ESMActionColor::Combat;
    }
    UFUNCTION()
    void Enter_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        float32 local_25 = 0.0f;
        if (!(this.Attribute.IsValid()))
        {
            XError(ELog(5), FString().Append("Invalid Attribute in ESMAction: '").Append(this.GetPathName(nullptr)).Append("', Entity: '").Append(Context.GetEntity().ToString()).Append("'"));
            return;
        }
        FECSWorldPtr local_20 = Context.GetECSWorld();
        Get local_24;
        FFPTime local_18 = FFPTime(local_24.opCall().LastTime);
        FGameAttributeUtils::AddModify(Context.GetEntity(), this.Attribute, this.ModifyType, local_25, local_18, false, false);
        return;
    }
    UFUNCTION()
    void Exit_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        float32 local_25 = 0.0f;
        if (!(this.Attribute.IsValid()))
        {
            XError(ELog(5), FString().Append("Invalid Attribute in ESMAction: '").Append(this.GetPathName(nullptr)).Append("', Entity: '").Append(Context.GetEntity().ToString()).Append("'"));
            return;
        }
        FECSWorldPtr local_20 = Context.GetECSWorld();
        Get local_24;
        FFPTime local_18 = FFPTime(local_24.opCall().LastTime);
        FGameAttributeUtils::RemoveModify(Context.GetEntity(), this.Attribute, this.ModifyType, local_25, local_18, false, false);
        return;
    }
}

