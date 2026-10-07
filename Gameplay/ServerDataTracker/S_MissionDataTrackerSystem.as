

class US_MissionDataTrackerSystem : UECSScriptSystem
{
    US_MissionDataTrackerSystem()
    {
        return;
    }
    UFUNCTION()
    void ServerJob_TrackMissionAccept(const FCE_OnMissionAccepted &inout Event) const
    {
        int local_17 = 0;
        int local_18 = 0;
        FECSEntity local_4 = FECSEntity(Event.Sender);
        if (!(local_4.IsValid()) || !(Event.MissionConfig.IsSet()))
        {
            return;
        }
        FPbPlayerLogDsMissionAccept local_16;
        local_16.SetMissionId(local_17);
        int local_19 = local_18;
        local_16.SetMissionType(local_19);
        XLog(ELog(63), FString().Append("[MissionDataTracker] MISSION_ACCEPT report: mission_id=").Append(local_16.GetMissionId()).Append(" mission_type=").Append(local_16.GetMissionType()));
        ::MissionDataTrackerHelper::LogMissionEvent(local_4, 101001, local_16.ToWrapper());
        return;
    }
    UFUNCTION()
    void ServerJob_TrackChapterStart(const FCE_ChapterStarted &inout Event) const
    {
        if (!(Event.ChapterConfig.IsSet()))
        {
            return;
        }
        FPbPlayerLogDsChapterStart local_12;
        local_12.SetChapterKey(Event.ChapterConfig.GetDataName().ToString());
        XLog(ELog(63), FString().Append("[MissionDataTracker] CHAPTER_START report: chapter_key=").Append(local_12.GetChapterKey()));
        ::MissionDataTrackerHelper::LogMissionEvent(Event.Sender, 101002, local_12.ToWrapper());
        return;
    }
    UFUNCTION()
    void ServerJob_TrackChapterFinish(const FCE_ChapterFinished &inout Event) const
    {
        if (!(Event.ChapterConfig.IsSet()))
        {
            return;
        }
        FPbPlayerLogDsChapterFinish local_12;
        local_12.SetChapterKey(Event.ChapterConfig.GetDataName().ToString());
        XLog(ELog(63), FString().Append("[MissionDataTracker] CHAPTER_FINISH report: chapter_key=").Append(local_12.GetChapterKey()));
        ::MissionDataTrackerHelper::LogMissionEvent(Event.Sender, 101003, local_12.ToWrapper());
        return;
    }
    UFUNCTION()
    void Monitor_TrackSimpleDialogueTrigger(const FECSEntity &inout PlayerEntity, const FC_DialogueSimplePlaying &inout CurrentDialogue) const
    {
        FName local_2(CurrentDialogue.GetDialogueContext().GetDialogueName());
        FString local_8;
        if (!(::MissionDataTrackerHelper::TryGetMissionDialogueChapterKey(PlayerEntity, local_2, local_8)))
        {
            XLog(ELog(64), FString().Append("[MissionDataTracker] DIALOGUE_TRIGGER(simple) skip non-mission dialogue: dialogue_key=").Append(local_2));
            return;
        }
        FPbPlayerLogDsDialogueTrigger local_26;
        local_26.SetDialogueKey(local_2.ToString());
        local_26.SetTriggerType(0);
        local_26.SetChapterKey(local_8);
        local_26.SetNpcKey(::MissionDataTrackerHelper::GetDialogueNpcKey(CurrentDialogue.GetDialogueContext().GetDialogueConfig()));
        XLog(ELog(64), FString().Append("[MissionDataTracker] DIALOGUE_TRIGGER(simple) report: dialogue_key=").Append(local_26.GetDialogueKey()).Append(" trigger_type=").Append(local_26.GetTriggerType()).Append(" chapter_key=").Append(local_26.GetChapterKey()).Append(" npc_key=").Append(local_26.GetNpcKey()));
        ::MissionDataTrackerHelper::LogMissionEvent(PlayerEntity, 101101, local_26.ToWrapper());
        return;
    }
    UFUNCTION()
    void ServerJob_TrackDialogueFinish(const FCE_DialogueRequestEnd &inout Event) const
    {
        FString local_4;
        if (!(::MissionDataTrackerHelper::TryGetMissionDialogueChapterKey(Event.PlayerEntity, Event.DialogueName, local_4)))
        {
            XLog(ELog(64), FString().Append("[MissionDataTracker] DIALOGUE_FINISH(simple) skip non-mission dialogue: dialogue_key=").Append(Event.DialogueName));
            return;
        }
        FPbPlayerLogDsDialogueFinish local_22;
        local_22.SetDialogueKey(Event.DialogueName.ToString());
        int local_23 = Event.bInterrupted ? 1 : 0;
        local_22.SetFinishType(local_23);
        local_22.SetChapterKey(local_4);
        XLog(ELog(64), FString().Append("[MissionDataTracker] DIALOGUE_FINISH(simple) report: dialogue_key=").Append(local_22.GetDialogueKey()).Append(" finish_type=").Append(local_22.GetFinishType()).Append(" chapter_key=").Append(local_22.GetChapterKey()));
        ::MissionDataTrackerHelper::LogMissionEvent(Event.PlayerEntity, 101102, local_22.ToWrapper());
        return;
    }
    UFUNCTION()
    void Run_ServerJob_TrackMissionAccept() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_OnMissionAccepted> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_OnMissionAccepted& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_TrackMissionAccept(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_TrackChapterStart() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_ChapterStarted> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_ChapterStarted& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_TrackChapterStart(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_TrackChapterFinish() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_ChapterFinished> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_ChapterFinished& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_TrackChapterFinish(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_TrackSimpleDialogueTrigger() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorDialogueSimplePlayingOnAssignView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_TrackSimpleDialogueTrigger(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_TrackDialogueFinish() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_DialogueRequestEnd> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_DialogueRequestEnd& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            if (local_60.Validate() == false)
            {
                FString local_70 = "Validate Failed: FCE_DialogueRequestEnd, sender";
                FString local_66 = local_60.Sender.ToString();
                continue;
            }
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_TrackDialogueFinish(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
}

namespace MissionDataTrackerHelper
{
void LogMissionEvent(const FECSEntity &inout PlayerEntity, const uint ActionType, const FProtoWrapper &inout Body)
{
    if (!(0))
    {
        XError(ELog(63), FString().Append("[MissionDataTracker] LogMissionEvent: entity ").Append(PlayerEntity).Append(" has no FC_PlayerController, skip report action_type=").Append(ActionType));
        return;
    }
    ServerDataTrackerHelper::LogProtoMessage3WithPlayer(PlayerEntity, ActionType, Body);
    return;
}
bool TryGetMissionDialogueChapterKey(const FECSEntity &inout PlayerEntity, const FName &inout DialogueName, FString &out ChapterKey)
{
    const FMissionDetail& local_32;
    FString local_4;
    ChapterKey = local_4;
    ChapterKey = "";
    if (!(PlayerEntity.IsValid()))
    {
        return false;
    }
    Get local_10;
    const FC_PlayerMissionInfo& local_12 = local_10.opCall();
    if (local_12)
    {
        for (auto& local_30 : local_12.GetActiveMissionStatus())
        {
            local_30;
            if (local_32.GetActiveDialogueMap().Contains(DialogueName))
            {
                if (local_32.GetMissionConfig().IsSet() && GetBelongChapter().IsSet())
                {
                    ChapterKey = GetBelongChapter().GetDataName().ToString();
                }
                return true;
            }
        }
    }
    return false;
}
FString GetDialogueNpcKey(const TDataObjectPtr<FDialogueConfig> &inout DialogueConfig)
{
    if (DialogueConfig.IsSet() && GetInteractTargetNPC().IsSet())
    {
        return GetInteractTargetNPC().GetDataName().ToString();
    }
    return "";
}
}
