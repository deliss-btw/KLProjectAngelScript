
enum EVoSoundSourceType
{
    Root,
    Part,
    Socket,
}

const FConsoleVariable CVar_VO_DebugLog = FConsoleVariable();

struct FVoSoundSourceConfig
{
    UPROPERTY()
    EVoSoundSourceType SourceType = EVoSoundSourceType(0);
    UPROPERTY()
    bool bFollow = true;
    UPROPERTY()
    EGameAudioEmitterPartType PartType = EGameAudioEmitterPartType(0);
    UPROPERTY()
    FName Socket;


}

struct FEsmAudioVoInstanceData
{
    UPROPERTY()
    int VoRuntimeId = 0;


}

class UESMAction_InstantVO : UESMSFXBaseSpanAction
{
    UPROPERTY()
    FDataObjectPtr VoRowName;
    UPROPERTY()
    bool bSelfOnly = false;
    UPROPERTY()
    bool bOnSpanEntry = false;
    UPROPERTY()
    bool bClearOnExit = false;


    UFUNCTION()
    FESMInstanceDataInfo GetViewInstanceDataInfo_Implementation() const
    {
        return ESMInstanceData::MakeRuntimeInstanceDataInfo(FEsmAudioVoInstanceData);
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
    bool IsUseAsInstant_Implementation() const
    {
        return (!(this.bClearOnExit) && !(this.bOnSpanEntry));
    }
    UFUNCTION()
    FLinearColor GetBackgroundColor_Implementation() const
    {
        return ESMActionColor::Effect;
    }
    UFUNCTION()
    void ViewEnter_Implementation(const FESMViewContext &inout Context, const FESMActionTime &inout Time) const
    {
        FEsmAudioVoInstanceData& local_2 = this.ModifyViewInstanceData(Context);
        FECSEntity local_6 = ::FASCommonUtils::GetLocalPlayerPawnEntity();
        bool local_12 = ::FTeamUtils::IsAvatarInTeam(Context.GetEntity());
        if (local_12)
        {
            Has local_16;
            if (this.bSelfOnly)
            {
                bool local_11 = local_16.opCall();
                if (local_11)
                {
                    FString local_30 = this.DebugGetPath();
                    FString local_26 = Context.GetAsset().GetName();
                    XLogIf(CVar_VO_DebugLog.GetBool(), ELog(1), FString().Append(local_26).Append(" ").Append(local_30).Append(", ViewEnter bSelfOnly = true, LocalEntity In Team ").Append(Context.GetEntity()).Append(" play vo ").Append(this.VoRowName.GetDataName()).Append("---."));
                    ::FAudioVoUtils::SendAudioVoEventOnlyPresentation(this.VoRowName.GetDataName(), Context.GetEntity(), FFPTime(-1));
                }
            }
            else
            {
                bool local_11_2 = local_16.opCall();
                if (local_11_2)
                {
                    FString local_30_2 = this.DebugGetPath();
                    FString local_20_2 = Context.GetAsset().GetName();
                    FString local_26_2 = FString();
                    XLogIf(CVar_VO_DebugLog.GetBool(), ELog(1), local_26_2.Append(local_20_2).Append(" ").Append(local_30_2).Append(", ViewEnter bSelfOnly = false, LocalEntity In Team ").Append(Context.GetEntity()).Append(" play vo  ").Append(this.VoRowName.GetDataName()).Append("---."));
                    ::FAudioVoUtils::SendAudioVoEventOnlyPresentation(this.VoRowName.GetDataName(), Context.GetEntity(), FFPTime(-1));
                }
                else
                {
                    if (::FTeamUtils::IsInSameTeam(local_6, Context.GetEntity()))
                    {
                        FString local_26_3 = this.DebugGetPath();
                        FString local_20_3 = Context.GetAsset().GetName();
                        FString local_30_3 = FString();
                        XLogIf(CVar_VO_DebugLog.GetBool(), ELog(1), local_30_3.Append(local_20_3).Append(" ").Append(local_26_3).Append(", ViewEnter bSelfOnly = false, OtherEntity In Team ").Append(Context.GetEntity()).Append(" play vo ").Append(this.VoRowName.GetDataName()).Append("---."));
                        ::FAudioVoUtils::SendAudioVoEventOnlyPresentation(this.VoRowName.GetDataName(), Context.GetEntity(), FFPTime(-1));
                    }
                }
            }
        }
        else
        {
            Has local_16;
            if (this.bSelfOnly)
            {
                bool local_11_3 = local_16.opCall();
                if (local_11_3)
                {
                    FString local_30_4 = this.DebugGetPath();
                    FString local_20_4 = Context.GetAsset().GetName();
                    FString local_26_4 = FString();
                    XLogIf(CVar_VO_DebugLog.GetBool(), ELog(1), local_26_4.Append(local_20_4).Append(" ").Append(local_30_4).Append(", ViewEnter bSelfOnly = true, LocalEntity Not Has Team ").Append(Context.GetEntity()).Append(" play vo ").Append(this.VoRowName.GetDataName()).Append("---."));
                    ::FAudioVoUtils::SendAudioVoEventOnlyPresentation(this.VoRowName.GetDataName(), Context.GetEntity(), FFPTime(-1));
                }
            }
            else
            {
                FString local_26_5 = this.DebugGetPath();
                FString local_20_5 = Context.GetAsset().GetName();
                FString local_30_5 = FString();
                XLogIf(CVar_VO_DebugLog.GetBool(), ELog(1), local_30_5.Append(local_20_5).Append(" ").Append(local_26_5).Append(", ViewEnter bSelfOnly = false, Entity Not Has Team ").Append(Context.GetEntity()).Append(" play vo ").Append(this.VoRowName.GetDataName()).Append("---."));
                ::FAudioVoUtils::SendAudioVoEventOnlyPresentation(this.VoRowName.GetDataName(), Context.GetEntity(), FFPTime(-1));
            }
        }
        return;
    }
    UFUNCTION()
    void ViewExit_Implementation(const FESMViewContext &inout Context, const FESMActionTime &inout Time) const
    {
        if (this.bClearOnExit)
        {
            FGameAudioUtils::StopAudioVO(int(this.ModifyViewInstanceData(Context).VoRuntimeId));
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
        return;
    }
    UFUNCTION()
    void OnDataValidate_Implementation(const FESMDataHierarchyInfo &inout Info)
    {
        UDataTable local_4;
        if (local_4 == nullptr)
        {
            XWarning(ELog(0), "UESMAction_InstantVO: can not find datatable: AudioVo Table.");
            return;
        }
        FAudioVoData local_86;
        if (!(local_4.FindRow(this.VoRowName.GetDataName(), local_86)))
        {
            XWarning(ELog(0), FString().Append("UESMAction_InstantVO: . ").Append(local_86.Name));
            Info.AddDataInvalidComment(EESMDataValidType(2), FString().Append("can not found row key:").Append(this.VoRowName.GetDataName()).Append(" in AudioVo Table."));
        }
        return;
    }
    const FEsmAudioVoInstanceData GetViewInstanceData(const FESMViewContext &inout Context) const
    {
        const FEsmAudioVoInstanceData __r;
        return __r;
    }
    FEsmAudioVoInstanceData ModifyViewInstanceData(const FESMViewContext &inout Context) const
    {
        FEsmAudioVoInstanceData __r;
        return __r;
    }
}

class UESMAction_InstantVoEvent : UESMSFXBaseSpanAction
{
    UPROPERTY()
    TSoftObjectPtr<UAkAudioEvent> Event = nullptr;
    UPROPERTY()
    FVoSoundSourceConfig SourceConfig;
    UPROPERTY()
    bool bSelfOnly = false;
    UPROPERTY()
    bool bOnSpanEntry = false;


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
    bool IsUseAsInstant_Implementation() const
    {
        bool local_1 = (!(this.bOnSpanEntry) == !(false));
        return local_1;
    }
    UFUNCTION()
    FString GetDisplayInfo_Implementation() const
    {
        return FString().Append("ж’­ж”ѕVo: ").Append(this.Event.GetAssetName());
    }
    UFUNCTION()
    FLinearColor GetBackgroundColor_Implementation() const
    {
        return ESMActionColor::Effect;
    }
    UFUNCTION()
    void ViewEnter_Implementation(const FESMViewContext &inout Context, const FESMActionTime &inout Time) const
    {
        bool local_7;
        if (!(this.CheckEventValied(this.Event)))
        {
            return;
        }
        if (!(this.bSelfOnly))
        {
            local_7 = false;
        }
        else
        {
            Has local_6;
            bool local_1 = (!(local_6.opCall()) == !(false));
            local_7 = local_1;
        }
        if (local_7)
        {
            XWarning(ELog(0), FString().Append("UESMAction_InstantVoEvent: ").Append(this.DebugGetPath()).Append(", bSelfOnly && Context.Entity.Has<FC_LocalTag>() == false."));
            return;
        }
        XLogIf(CVar_VO_DebugLog.GetBool(), ELog(1), FString().Append("UESMAction_InstantVoEvent: ").Append(this.DebugGetPath()).Append(", Play VO Event: ").Append(this.Event.GetAssetName()));
        ::FVoSoundSourceConfig::PostEvent(Context.GetEntity(), this.Event, this.SourceConfig, false, false, Context.GetWorld());
        return;
    }
    UFUNCTION()
    void Exit_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        XLogIf(CVar_VO_DebugLog.GetBool(), ELog(1), FString().Append("UESMAction_InstantVoEvent: ").Append(this.DebugGetPath()).Append(", Exit Begin Time: ").Append(Time.ActionTime).Append("-----------------."));
        return;
    }
    UFUNCTION()
    void OnInitData_Implementation(const FESMDataHierarchyInfo &inout Info)
    {
        XLogIf(CVar_VO_DebugLog.GetBool(), ELog(1), FString().Append("UESMAction_InstantVoEvent: ").Append(this.DebugGetPath()));
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
        return;
    }
    UFUNCTION()
    void OnDataValidate_Implementation(const FESMDataHierarchyInfo &inout Info)
    {
        UESMAsset::ModifyAutoCustomConfig local_4;
        UESMPreloadCustomData local_8 = local_4.opCall(this);
        if (local_8 != nullptr)
        {
            local_8.PreloadEvents.AddUnique(this.Event);
        }
        return;
    }
    bool CheckEventValied(const TSoftObjectPtr<UAkAudioEvent> &inout InEvent) const
    {
        if (InEvent.IsNull())
        {
            XWarning(ELog(0), FString().Append("UESMAction_InstantVoEvent: ").Append(this.DebugGetPath()).Append(" , The event is not configured yet."));
            return false;
        }
        if (InEvent.IsPending())
        {
            XWarning(ELog(0), FString().Append("UESMAction_InstantVoEvent: ").Append(this.DebugGetPath()).Append(" , The event is not loaded yet. try to loading ").Append(InEvent.GetAssetName()));
        }
        return true;
    }
}

class UESMAction_DurationalVoEvent : UESMSFXBaseSpanAction
{
    UPROPERTY()
    TSoftObjectPtr<UAkAudioEvent> EnterEvent = nullptr;
    UPROPERTY()
    TSoftObjectPtr<UAkAudioEvent> ExitEvent = nullptr;
    UPROPERTY()
    FVoSoundSourceConfig SourceConfig;
    UPROPERTY()
    bool bSelfOnly = false;


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
    FString GetDisplayInfo_Implementation() const
    {
        return FString().Append("ж’­ж”ѕVo:Enter: ").Append(this.EnterEvent.GetAssetName()).Append(", Exit: ").Append(this.ExitEvent.GetAssetName());
    }
    UFUNCTION()
    FLinearColor GetBackgroundColor_Implementation() const
    {
        return ESMActionColor::Effect;
    }
    UFUNCTION()
    bool CanPreview_Implementation() const
    {
        return true;
    }
    UFUNCTION()
    void ViewEnter_Implementation(const FESMViewContext &inout Context, const FESMActionTime &inout Time) const
    {
        bool local_7;
        if (!(this.CheckEventValied(this.EnterEvent)))
        {
            return;
        }
        if (!(this.bSelfOnly))
        {
            local_7 = false;
        }
        else
        {
            Has local_6;
            bool local_1 = (!(local_6.opCall()) == !(false));
            local_7 = local_1;
        }
        if (local_7)
        {
            return;
        }
        ::FVoSoundSourceConfig::PostEvent(Context.GetEntity(), this.EnterEvent, this.SourceConfig, false, false, Context.GetWorld());
        return;
    }
    UFUNCTION()
    void ViewExit_Implementation(const FESMViewContext &inout Context, const FESMActionTime &inout Time) const
    {
        bool local_7;
        if (!(this.CheckEventValied(this.ExitEvent)))
        {
            return;
        }
        if (!(this.bSelfOnly))
        {
            local_7 = false;
        }
        else
        {
            Has local_6;
            bool local_1 = (!(local_6.opCall()) == !(false));
            local_7 = local_1;
        }
        if (local_7)
        {
            return;
        }
        ::FVoSoundSourceConfig::PostEvent(Context.GetEntity(), this.ExitEvent, this.SourceConfig, false, true, Context.GetWorld());
        return;
    }
    UFUNCTION()
    void PreviewBegin_Implementation(const FESMPreviewContext &inout Context, const FESMActionTime &inout Time, const bool bNewlyBegin)
    {
        return;
    }
    UFUNCTION()
    void OnDataValidate_Implementation(const FESMDataHierarchyInfo &inout Info)
    {
        if ((!((this.EnterEvent == nullptr)) && ((this.ExitEvent == nullptr))))
        {
            Info.AddDataInvalidComment(EESMDataValidType(2), "Enter Event and Exit Event not in pair");
        }
        UESMAsset::ModifyAutoCustomConfig local_18;
        UESMPreloadCustomData local_22 = local_18.opCall(this);
        if (local_22 != nullptr)
        {
            local_22.PreloadEvents.AddUnique(this.EnterEvent);
            local_22.PreloadEvents.AddUnique(this.ExitEvent);
        }
        return;
    }
    bool CheckEventValied(const TSoftObjectPtr<UAkAudioEvent> &inout Event) const
    {
        if (Event.IsNull())
        {
            XWarning(ELog(0), FString().Append("UESMAction_DurationalVoEvent: ").Append(this.DebugGetPath()).Append(" , The event is not configured yet."));
            return false;
        }
        if (Event.IsPending())
        {
            XWarning(ELog(0), FString().Append("UESMAction_DurationalVoEvent: ").Append(this.DebugGetPath()).Append(" , The event is not loaded yet. try to loading ").Append(Event.GetAssetName()));
        }
        return true;
    }
}

namespace FVoSoundSourceConfig
{
void PostEvent(const FECSEntity &inout Entity, const TSoftObjectPtr<UAkAudioEvent> &inout Event, const FVoSoundSourceConfig &inout Source, const bool bIsLoop, const bool bLoopEnd, const UWorld WorldContext)
{
    FGameAudioEventFollowOption local_1;
    bool local_2 = Source.bFollow || bIsLoop;
    local_1.SetbFollow(local_2);
    local_1.SetbStartLoopEvent(bIsLoop && !(bLoopEnd));
    local_2 = bIsLoop && bLoopEnd;
    local_1.SetbStopLoopEvent(local_2);
    if (int(Source.SourceType) == 1)
    {
        if (FAsGameAudioUtils::CVar_UseNewAsynLoad.GetBool())
        {
            FGameAudioUtils::PlayEventOnEmitter(Event, Entity, FLoadEventCallback(), Source.PartType, Source.bFollow, bIsLoop, bLoopEnd, WorldContext, true);
        }
    }
    else
    {
        if (int(Source.SourceType) == 2)
        {
            if (FAsGameAudioUtils::CVar_UseNewAsynLoad.GetBool())
            {
                FGameAudioUtils::PlayEventAtSocket(Event, Entity, FLoadEventCallback(), Source.Socket, Source.bFollow, bIsLoop, bLoopEnd, WorldContext, true);
            }
        }
        else
        {
            if (FAsGameAudioUtils::CVar_UseNewAsynLoad.GetBool())
            {
                FGameAudioUtils::PlayEventOnEmitter(Event, Entity, FLoadEventCallback(), EGameAudioEmitterPartType(0), Source.bFollow, bIsLoop, bLoopEnd, WorldContext, true);
            }
        }
    }
    return;
}
}
