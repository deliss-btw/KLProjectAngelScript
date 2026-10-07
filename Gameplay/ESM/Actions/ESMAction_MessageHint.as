

class UESMAction_MessageHint : UESMBPBaseInstantAction
{
    UPROPERTY()
    TDataObjectPtr<FMessageHintConfig> MessageHint;

    UESMAction_MessageHint()
    {
        return;
    }
    UFUNCTION()
    void Do_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        ::MessageHintUtils::ShowMessageHint(Context.GetEntity(), this.MessageHint, TArray<FTextArgument>());
        return;
    }
}

struct FESMActionSkillCastHintInstanceData
{
    UPROPERTY()
    bool m_bEffect = false;


    bool GetbEffect() const property
    {
        return this.m_bEffect;
    }
    void SetbEffect(const bool __Value) property
    {
        this.m_bEffect = __Value;
        return;
    }
}

class UESMAction_SkillCastHint : UESMBPBaseSpanTickAction
{
    UPROPERTY()
    TArray<FSkillCastHintData> SkillCastHintDatas;

    UESMAction_SkillCastHint()
    {
        return;
    }
    UFUNCTION()
    FESMInstanceDataInfo GetViewInstanceDataInfo_Implementation() const
    {
        return ESMInstanceData::MakeRuntimeInstanceDataInfo(FESMActionSkillCastHintInstanceData);
    }
    UFUNCTION()
    EESMActionType GetActionType_Implementation() const
    {
        return EESMActionType(2);
    }
    UFUNCTION()
    void ViewEnter_Implementation(const FESMViewContext &inout Context, const FESMActionTime &inout Time) const
    {
        if (!(UICommonUtil::CVar_UI_DebugEnableNewSkillCastHint.GetBool()))
        {
            return;
        }
        if (!((::FASCommonUtils::GetLocalPlayerPawnEntity() == Context.GetEntity())))
        {
            return;
        }
        FESMActionSkillCastHintInstanceData& local_8 = this.ModifyViewInstanceData(Context);
        int local_9 = 0;
        for (; local_9 < this.SkillCastHintDatas.Num(); )
        {
            local_8.SetbEffect(true);
            const FSkillCastHintData& local_14 = this.SkillCastHintDatas[local_9];
            ::FVMS_CommonBottomActionList::Get(Context.GetWorld()).AddAction(FInputActionListConstructParamItem(::FSkillUIUtils::GetSkillInputAction(Context.GetEntity(), local_14), ::FSkillUIUtils::GetSkillCastHintText(local_14)));
            ++local_9;
        }
        return;
    }
    UFUNCTION()
    void ViewExit_Implementation(const FESMViewContext &inout Context, const FESMActionTime &inout Time) const
    {
        if (!(UICommonUtil::CVar_UI_DebugEnableNewSkillCastHint.GetBool()))
        {
            return;
        }
        if (!(this.GetViewInstanceData(Context).GetbEffect()))
        {
            return;
        }
        int local_5 = 0;
        for (; local_5 < this.SkillCastHintDatas.Num(); )
        {
            FSkillCastHintData local_38;
            ::FVMS_CommonBottomActionList::Get(Context.GetWorld()).RemoveAction(::FSkillUIUtils::GetSkillInputAction(Context.GetEntity(), local_38));
            ++local_5;
        }
        return;
    }
    const FESMActionSkillCastHintInstanceData GetViewInstanceData(const FESMViewContext &inout Context) const
    {
        const FESMActionSkillCastHintInstanceData __r;
        return __r;
    }
    FESMActionSkillCastHintInstanceData ModifyViewInstanceData(const FESMViewContext &inout Context) const
    {
        FESMActionSkillCastHintInstanceData __r;
        return __r;
    }
}

class UESMAction_TeamInfoSkillHint : UESMBPBaseSpanTickAction
{
    UESMAction_TeamInfoSkillHint()
    {
        return;
    }
    UFUNCTION()
    EESMActionType GetActionType_Implementation() const
    {
        return EESMActionType(2);
    }
    UFUNCTION()
    void ViewEnter_Implementation(const FESMViewContext &inout Context, const FESMActionTime &inout Time) const
    {
        if (!((::FASCommonUtils::GetLocalPlayerPawnEntity() == Context.GetEntity())))
        {
            return;
        }
        FC_TeamMemberInfoSkillHintTag local_12;
        Assign local_10;
        local_10.opCall(local_12);
        return;
    }
    UFUNCTION()
    void ViewExit_Implementation(const FESMViewContext &inout Context, const FESMActionTime &inout Time) const
    {
        if (!((::FASCommonUtils::GetLocalPlayerPawnEntity() == Context.GetEntity())))
        {
            return;
        }
        Remove local_10;
        local_10.opCall();
        return;
    }
}

