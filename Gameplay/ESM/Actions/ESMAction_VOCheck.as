
const FConsoleVariable CVar_VOCheck_DebugLog = FConsoleVariable();

struct FEsmAudioVoCheckInstanceData
{
    UPROPERTY()
    int VoRuntimeId = 0;
    UPROPERTY()
    FFPTime LastCheckTime = 0.0;
    UPROPERTY()
    bool bFirstTriggered = false;


}

class UESMAction_VOCheck : UESMBPBaseSpanTickAction
{
    UPROPERTY()
    FDataObjectPtr VoRowName;
    UPROPERTY()
    bool bSelfOnly = false;
    UPROPERTY()
    bool bClearOnExit = true;
    UPROPERTY()
    float32 FirstTriggerTime = 5.0f;
    UPROPERTY()
    float32 LoopTriggerTime = 10.0f;


    UFUNCTION()
    FESMInstanceDataInfo GetViewInstanceDataInfo_Implementation() const
    {
        return ESMInstanceData::MakeRuntimeInstanceDataInfo(FEsmAudioVoCheckInstanceData);
    }
    UFUNCTION()
    EESMAssetWorkflow GetWorkflow_Implementation() const
    {
        return EESMAssetWorkflow(2);
    }
    UFUNCTION()
    EESMActionType GetActionType_Implementation() const
    {
        return EESMActionType(2);
    }
    UFUNCTION()
    FLinearColor GetBackgroundColor_Implementation() const
    {
        return ESMActionColor::Effect;
    }
    UFUNCTION()
    void ViewEnter_Implementation(const FESMViewContext &inout Context, const FESMActionTime &inout Time) const
    {
        this.ModifyViewInstanceData(Context).LastCheckTime = Time.WorldTime;
        return;
    }
    UFUNCTION()
    void ViewTick_Implementation(const FESMViewContext &inout Context, const FESMActionTime &inout Time) const
    {
        FEsmAudioVoCheckInstanceData& local_2 = this.ModifyViewInstanceData(Context);
        bool local_3 = !(local_2.bFirstTriggered);
        if (local_3 == !(true))
        {
            if ((FFPTime(Time.WorldTime) - local_2.LastCheckTime).opCmp(this.LoopTriggerTime) < 0)
            {
                return;
            }
        }
        else
        {
            FFPTime local_8_2 = (FFPTime(Time.WorldTime) - local_2.LastCheckTime);
            if (local_8_2.opCmp(this.FirstTriggerTime) < 0)
            {
                return;
            }
            local_2.bFirstTriggered = true;
        }
        FECSEntity local_18 = ::FASCommonUtils::GetLocalPlayerPawnEntity();
        bool local_3_2 = ::FTeamUtils::IsAvatarInTeam(Context.GetEntity());
        if (local_3_2)
        {
            Has local_28;
            if (this.bSelfOnly)
            {
                bool local_23 = local_28.opCall();
                if (local_23)
                {
                    FString local_42 = this.DebugGetPath();
                    FString local_38 = Context.GetAsset().GetName();
                    FString local_32 = FString();
                    bool local_4 = CVar_VOCheck_DebugLog.GetBool();
                    XLogIf(local_4, ELog(1), local_32.Append(local_38).Append(" ").Append(local_42).Append(", ViewEnter bSelfOnly = true, LocalEntity In Team ").Append(Context.GetEntity()).Append(" play vo ").Append(this.VoRowName.GetDataName()).Append("---."));
                    ::FAudioVoUtils::SendAudioVoEventOnlyPresentation(this.VoRowName.GetDataName(), Context.GetEntity(), FFPTime(-1));
                }
            }
            else
            {
                bool local_23_2 = local_28.opCall();
                if (local_23_2)
                {
                    FString local_32_2 = this.DebugGetPath();
                    FString local_38_2 = Context.GetAsset().GetName();
                    FString local_42_2 = FString();
                    XLogIf(CVar_VOCheck_DebugLog.GetBool(), ELog(1), local_42_2.Append(local_38_2).Append(" ").Append(local_32_2).Append(", ViewEnter bSelfOnly = false, LocalEntity In Team ").Append(Context.GetEntity()).Append(" play vo  ").Append(this.VoRowName.GetDataName()).Append("---."));
                    ::FAudioVoUtils::SendAudioVoEventOnlyPresentation(this.VoRowName.GetDataName(), Context.GetEntity(), FFPTime(-1));
                }
                else
                {
                    if (::FTeamUtils::IsInSameTeam(local_18, Context.GetEntity()))
                    {
                        FString local_42_3 = this.DebugGetPath();
                        FString local_38_3 = Context.GetAsset().GetName();
                        FString local_32_3 = FString();
                        XLogIf(CVar_VOCheck_DebugLog.GetBool(), ELog(1), local_32_3.Append(local_38_3).Append(" ").Append(local_42_3).Append(", ViewEnter bSelfOnly = false, OtherEntity In Team ").Append(Context.GetEntity()).Append(" play vo ").Append(this.VoRowName.GetDataName()).Append("---."));
                        ::FAudioVoUtils::SendAudioVoEventOnlyPresentation(this.VoRowName.GetDataName(), Context.GetEntity(), FFPTime(-1));
                    }
                }
            }
        }
        else
        {
            Has local_28;
            if (this.bSelfOnly)
            {
                bool local_23_3 = local_28.opCall();
                if (local_23_3)
                {
                    FString local_32_4 = this.DebugGetPath();
                    FString local_38_4 = Context.GetAsset().GetName();
                    FString local_42_4 = FString();
                    XLogIf(CVar_VOCheck_DebugLog.GetBool(), ELog(1), local_42_4.Append(local_38_4).Append(" ").Append(local_32_4).Append(", ViewEnter bSelfOnly = true, LocalEntity Not Has Team ").Append(Context.GetEntity()).Append(" play vo ").Append(this.VoRowName.GetDataName()).Append("---."));
                    ::FAudioVoUtils::SendAudioVoEventOnlyPresentation(this.VoRowName.GetDataName(), Context.GetEntity(), FFPTime(-1));
                }
            }
            else
            {
                FString local_42_5 = this.DebugGetPath();
                FString local_38_5 = Context.GetAsset().GetName();
                FString local_32_5 = FString();
                XLogIf(CVar_VOCheck_DebugLog.GetBool(), ELog(1), local_32_5.Append(local_38_5).Append(" ").Append(local_42_5).Append(", ViewEnter bSelfOnly = false, Entity Not Has Team ").Append(Context.GetEntity()).Append(" play vo ").Append(this.VoRowName.GetDataName()).Append("---."));
                ::FAudioVoUtils::SendAudioVoEventOnlyPresentation(this.VoRowName.GetDataName(), Context.GetEntity(), FFPTime(-1));
            }
        }
        local_2.LastCheckTime = Time.WorldTime;
        return;
    }
    UFUNCTION()
    void ViewExit_Implementation(const FESMViewContext &inout Context, const FESMActionTime &inout Time) const
    {
        FEsmAudioVoCheckInstanceData& local_2 = this.ModifyViewInstanceData(Context);
        local_2.LastCheckTime = 0;
        local_2.bFirstTriggered = false;
        if (this.bClearOnExit)
        {
            FGameAudioUtils::StopAudioVO(int(local_2.VoRuntimeId));
        }
        return;
    }
    UFUNCTION()
    bool CanPreview_Implementation() const
    {
        return true;
    }
    UFUNCTION()
    void PreviewBegin_Implementation(const FESMPreviewContext &inout Context, const FESMActionTime &inout Time, const bool bNewlyBegin)
    {
        if (Context.GetbPlaying() == false)
        {
            return;
        }
        XLogIf(CVar_VOCheck_DebugLog.GetBool(), ELog(1), FString().Append("Action: ").Append(this.DebugGetPath()).Append(", PreviewBegin Begin-----------------."));
        if (!(Context.GetbPlaying()) == !(false))
        {
            XLogIf(CVar_VOCheck_DebugLog.GetBool(), ELog(1), FString().Append("Action: ").Append(this.DebugGetPath()).Append(", Context.bPlaying is false."));
            return;
        }
        XLogIf(CVar_VOCheck_DebugLog.GetBool(), ELog(1), FString().Append("Action: ").Append(this.DebugGetPath()).Append(", ").Append(this.VoRowName).Append(" is Posting."));
        XLogIf(CVar_VOCheck_DebugLog.GetBool(), ELog(1), FString().Append("Action: ").Append(this.DebugGetPath()).Append(", PreviewBegin End-----------------."));
        return;
    }
    UFUNCTION()
    void OnDataValidate_Implementation(const FESMDataHierarchyInfo &inout Info)
    {
        UDataTable local_4;
        if (local_4 == nullptr)
        {
            XWarning(ELog(0), "UESMAction_InstantVOCheck: can not find datatable: AudioVo Table.");
            return;
        }
        FAudioVoData local_86;
        if (!(local_4.FindRow(this.VoRowName.GetDataName(), local_86)))
        {
            XWarning(ELog(0), FString().Append("UESMAction_InstantVOCheck: . ").Append(local_86.Name));
            Info.AddDataInvalidComment(EESMDataValidType(2), FString().Append("can not found row key:").Append(this.VoRowName.GetDataName()).Append(" in AudioVo Table."));
        }
        return;
    }
    const FEsmAudioVoCheckInstanceData GetViewInstanceData(const FESMViewContext &inout Context) const
    {
        const FEsmAudioVoCheckInstanceData __r;
        return __r;
    }
    FEsmAudioVoCheckInstanceData ModifyViewInstanceData(const FESMViewContext &inout Context) const
    {
        FEsmAudioVoCheckInstanceData __r;
        return __r;
    }
}

