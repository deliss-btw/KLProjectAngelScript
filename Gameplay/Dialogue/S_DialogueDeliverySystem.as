

class US_DialogueDeliverySystem : UECSScriptSystem
{
    US_DialogueDeliverySystem()
    {
        return;
    }
    UFUNCTION()
    void ClientJob_HandleDialogueOptionSelect(const FCE_DialogueOptionSelectClient &inout Event) const
    {
        FECSEntity local_4 = FECSEntity(Event.Sender);
        Get local_8;
        const FC_DialogueSection& local_10 = local_8.opCall();
        if (local_10)
        {
            FDialogueDeliveryContext local_58;
            if (::DialogueUtils::TryFindDialogueContext(local_10.GetSection().GetDialogueContextEntity(), local_58))
            {
                if (Event.AttachedDialogueConfig.IsSet())
                {
                    XLog(ELog(64), FString().Append("Attached option selected, ending current dialogue: ").Append(Event.Sender.GetEntityName()));
                    this.SendDialogueEndedEvent(local_4, local_10.GetSection(), true);
                }
                else
                {
                    local_58.ExecuteDeferredActions(local_4, int(Event.OptionNodeId), EMissionActionType(1));
                }
            }
        }
        else
        {
            XError(ELog(64), FString().Append("Handle dialogue option select, but Dialogue section not found!"));
        }
        ::UDialogueSubtitleSubsystem::Get().ClearOptions();
        FFPTime local_76 = FFPTime(-1);
        FCE_DialogueOptionSelect local_78;
        local_78.OptionNodeId = int(Event.OptionNodeId);
        local_78.AttachedDialogueConfig = Event.AttachedDialogueConfig;
        return;
    }
    UFUNCTION()
    void ServerJob_HandleDialogueOptionSelect(const FCE_DialogueOptionSelect &inout Event) const
    {
        int local_10 = 0;
        int local_108 = 0;
        int local_222 = 0;
        FECSEntity local_4 = FECSEntity(Event.Sender);
        FDialogueDeliveryContext local_56;
        FECSEntity local_60 = FECSEntity(local_10.GetSection().GetDialogueContextEntity());
        if (!(::DialogueUtils::TryFindDialogueContext(local_60, local_56)))
        {
            return;
        }
        if (Event.AttachedDialogueConfig.IsSet())
        {
            FName local_70;
            local_70.GetDataName();
            XLog(ELog(64), FString().Append("Add quick start component for player: ").Append(local_4.GetEntityName()).Append(", dialogue config: ").Append(local_70));
            local_108.SetInteractTarget(local_56.GetInteractTarget());
            local_108.SetDialogueConfig(Event.AttachedDialogueConfig);
        }
        else
        {
            FName local_70;
            bool local_109;
            local_109 = false;
            for (auto& local_124 : local_10.GetSection().GetOptions())
            {
                if (local_124.GetOptionNodeId() != int(Event.OptionNodeId))
                {
                    continue;
                }
                local_109 = true;
                if (local_124.GetRelatedActionNodeIds().Num() > 0 || local_56.HasDeferredActions(local_124.GetOptionNodeId(), EMissionActionType(2)))
                {
                    FC_DialogueExecuteActions local_184;
                    local_184.OptionNodeId = int(Event.OptionNodeId);
                    local_184.ActionNodeIds = local_124.GetRelatedActionNodeIds();
                    local_184.Section = local_10.GetSection();
                }
                else
                {
                    ::DialogueUtils::SetDialogueLastNodeId(local_60, int(Event.OptionNodeId));
                    FC_DialogueNextSectionTag local_190;
                    Assign local_188;
                    local_188.opCall(local_190);
                }
                if (FInstancedStruct::GetPtr(local_56.LoadDialogueGraph().GetNode(int(Event.OptionNodeId))).opCall())
                {
                    FName local_68 = local_56.GetDialogueName();
                    local_70.GetOptionName();
                    local_222.GetOptionHistory().Add(local_70);
                    local_70 = local_56.GetDialogueName();
                    local_68.GetOptionName();
                    XLog(ELog(64), FString().Append("OptionHistory added: ").Append(local_68).Append(", Dialogue: ").Append(local_70));
                }
            }
            if (!(local_109))
            {
                XError(ELog(64), FString().Append("Option not found: ").Append(Event.OptionNodeId).Append(", maybe the event has been handled already"));
            }
        }
        return;
    }
    UFUNCTION()
    void ServerJob_HandleExecuteDialogueAction(const FECSEntity &inout DialogueEntity, FC_DialogueSimplePlaying &inout CurrentDialogue, FC_DialogueExecuteActions &inout DialogueActions) const
    {
        if (DialogueActions.bActionFailed)
        {
            Remove local_6;
            local_6.opCall();
            FC_DialogueEndedTag local_12;
            Assign local_10;
            local_10.opCall(local_12);
            return;
        }
        bool local_13 = false;
        TArray<uint> local_18 = DialogueActions.ActionNodeIds;
        FDialogueDeliveryContext local_64 = FDialogueDeliveryContext(CurrentDialogue.GetDialogueContext());
        if (!(DialogueActions.bDeferredActionsExecuted) && local_64.HasDeferredActions(int(DialogueActions.OptionNodeId), EMissionActionType(2)))
        {
            int local_68 = local_64.ExecuteDeferredActions(DialogueEntity, int(DialogueActions.OptionNodeId), EMissionActionType(2));
            DialogueActions.bDeferredActionsExecuted = true;
            if (local_68 >= 0)
            {
                FC_DialogueExecuteActionWaitNotify local_76;
                local_76.EntryID = local_68;
                local_76.bExecutionEntryCompleted = false;
                local_76.TimeoutTime = (ECS::GetContextTime() + FFPTime(3.0));
                local_13 = true;
            }
        }
        for (auto local_98 : local_18)
        {
            if (FInstancedStruct::GetPtr(local_64.LoadDialogueGraph().GetNode(int(local_98))).opCall())
            {
                CurrentDialogue.GetModify_ExecutedActionNodeIds().Add(local_98);
                ::DialogueUtils::SetDialogueLastNodeId(DialogueEntity, int(local_98));
            }
        }
        if (!(local_13))
        {
            Remove local_6;
            local_6.opCall();
            FC_DialogueNextSectionTag local_126;
            Assign local_124;
            local_124.opCall(local_126);
        }
        return;
    }
    UFUNCTION()
    void ServerJob_HandleDialogueExecutionEntryFinished(const FCE_MissionExecutionCompleted &inout Event) const
    {
        FECSEntity local_4 = FECSEntity(Event.Sender);
        Get local_8;
        const FC_DialogueExecuteActionWaitNotify& local_10 = local_8.opCall();
        if (local_10)
        {
            if (int(local_10.EntryID) != int(Event.ExecutionEntryId))
            {
                return;
            }
            if (local_10.bActionNodeFinished)
            {
                Remove local_18;
                local_18.opCall();
            }
            else
            {
                FC_DialogueExecuteActionWaitNotify local_24;
                local_24.bExecutionEntryCompleted = true;
            }
        }
        return;
    }
    UFUNCTION()
    void ServerJob_HandleDialogueActionWaitNotifyResult(const FCE_DialogueActionNotifyResult &inout Event) const
    {
        FECSEntity local_4 = FECSEntity(Event.Sender);
        if (!(Event.bSuccess))
        {
            Modify local_10;
            FC_DialogueExecuteActions& local_12 = local_10.opCall();
            if (local_12)
            {
                local_12.bActionFailed = true;
            }
            else
            {
                XError(ELog(64), FString().Append("ConsumeItem opCall Failed to modify DialogueExecuteActions, DialogueEntity=").Append(local_4.GetEntityName()));
            }
        }
        Modify local_24;
        FC_DialogueExecuteActionWaitNotify& local_26 = local_24.opCall();
        if (local_26)
        {
            local_26.bActionNodeFinished = true;
            if (local_26.bExecutionEntryCompleted)
            {
                Remove local_30;
                local_30.opCall();
            }
        }
        return;
    }
    UFUNCTION()
    void ServerJob_HandleDialogueActionWaitNotifyTimeout(const FECSEntity &inout DialogueEntity, FC_DialogueExecuteActionWaitNotify &inout ExecuteActionWaitNotify) const
    {
        if (ECS::GetContextTime().opCmp(ExecuteActionWaitNotify.TimeoutTime) >= 0)
        {
            XWarning(ELog(64), FString().Append("Dialogue action wait notify timeout: ").Append(DialogueEntity.GetEntityName()).Append(", action node id: ").Append(ExecuteActionWaitNotify.ActionNodeId));
            Modify local_16;
            FC_DialogueExecuteActions& local_18 = local_16.opCall();
            if (local_18)
            {
                local_18.bActionFailed = true;
            }
            Remove local_22;
            local_22.opCall();
        }
        return;
    }
    UFUNCTION()
    void ServerJob_HandleSimpleDialogueNextSection(const FECSEntity &inout DialogueEntity, FC_DialogueSimplePlaying &inout CurrentDialogue) const
    {
        int local_70 = 0;
        Remove local_4;
        local_4.opCall();
        Has local_10;
        if (!(local_10.opCall()))
        {
            XError(ELog(64), FString().Append("Dialogue entity ").Append(DialogueEntity.GetEntityName()).Append(" is not a player controller"));
            return;
        }
        FDialogueDeliveryContext local_64 = FDialogueDeliveryContext(CurrentDialogue.GetDialogueContext());
        CurrentDialogue.GetDialogueContext().SetLastNodeId(local_64.ProcessSection(local_64.GetLastNodeId(), local_70.GetSection()));
        return;
    }
    UFUNCTION()
    void ServerJob_HandleAmbientDialogueNextSection(const FECSEntity &inout DialogueEntity, FC_DialogueAmbientPlaying &inout CurrentDialogue, const FCS_FixedTime &inout FixedTime) const
    {
        Remove local_4;
        local_4.opCall();
        CurrentDialogue.GetDialogueContext().SetLastNodeId(CurrentDialogue.GetDialogueContext().ProcessSection(CurrentDialogue.GetDialogueContext().GetLastNodeId(), CurrentDialogue.GetSection()));
        return;
    }
    UFUNCTION()
    void Monitor_OnDialogueSectionChanged(const FECSEntity &inout PlayerEntity, const FC_DialogueSection &inout DialogueSection) const
    {
        int local_18 = 0;
        if (DialogueSection.GetSection().GetSubtitles().IsEmpty() && DialogueSection.GetSection().GetOptions().IsEmpty())
        {
            FC_DialoguePlayFinishedTag local_8;
            Assign local_6;
            local_6.opCall(local_8);
            return;
        }
        ::UDialogueSubtitleSubsystem::Get().ClearOptions();
        if (::UDialogueSubtitleSubsystem::Get().IsPlayingNarration())
        {
            ::UDialogueSubtitleSubsystem::Get().StopNarration();
        }
        FECSWorldPtr local_12 = ECS::GetECSWorld();
        EDialogueType local_19 = DialogueSection.GetSection().GetDialogueType();
        bool local_1 = ::UDialogueSubtitleSubsystem::Get().ShowDialogueWidget(local_18.UEPlayerController.GetLocalPlayer());
        if (local_1)
        {
            if ((int(DialogueSection.GetSection().GetDialogueType())) == 0)
            {
                FDialogueDeliveryContext local_72;
                if (::DialogueUtils::TryFindDialogueContext(DialogueSection.GetSection().GetDialogueContextEntity(), local_72))
                {
                    if (local_72.GetInteractTarget().IsValid())
                    {
                        XLog(ELog(64), FString().Append("[Dialogue] SetWatchPlayerLookDialogueActive true, NPC: ").Append(local_72.GetInteractTarget().GetEntityName()));
                        ::FNPCWatchPlayerLookUtils::SetWatchPlayerLookDialogueActive(local_72.GetInteractTarget(), true);
                    }
                }
                FC_DialogueNextSubtitleTag local_86;
                Assign local_84;
                local_84.opCall(local_86);
                Remove local_90;
                local_90.opCall();
            }
            return;
        }
        XError(ELog(64), FString().Append("Failed to show dialogue widget"));
        return;
    }
    UFUNCTION()
    void ServerJob_TickAmbientDialogue(const FECSEntity &inout DialogueEntity, FC_DialogueAmbientPlaying &inout CurrentDialogue, const FCS_FixedTime &inout FixedTime) const
    {
        int local_30 = 0;
        Has local_36;
        TArray<FECSEntity> local_4 = this.UpdatePlayersInRange(DialogueEntity, CurrentDialogue);
        for (auto local_24 : local_4)
        {
            local_30.SetbOutofDialogueRange(true);
            local_30.SetSubtitleIndex(-1);
        }
        if (CurrentDialogue.GetPlayerEntitiesInRange().Num() == 0)
        {
            if (!(local_36.opCall()))
            {
                XLog(ELog(64), FString().Append("No players in range, dialogue paused: ").Append(DialogueEntity.GetEntityName()).Append(" : ").Append(CurrentDialogue.GetDialogueContext().GetDialogueName()));
                FC_DialoguePausedTag local_52;
                Assign local_50;
                local_50.opCall(local_52);
            }
            return;
        }
        bool local_21 = local_36.opCall();
        if (local_21)
        {
            XLog(ELog(64), FString().Append("Player in range, dialogue resumed: ").Append(DialogueEntity.GetEntityName()).Append(" : ").Append(CurrentDialogue.GetDialogueContext().GetDialogueName()));
            Remove local_56;
            local_56.opCall();
            if (CurrentDialogue.GetSubtitleIndex() >= 0)
            {
                CurrentDialogue.SetSubtitleIndex((CurrentDialogue.GetSubtitleIndex() - 1));
            }
            CurrentDialogue.SetNextSubtitleTime(FFPTime());
        }
        if (CurrentDialogue.GetSection().GetSubtitles().Num() > 0 && (FFPTime(FixedTime.Time).opCmp(CurrentDialogue.GetNextSubtitleTime()) > 0))
        {
            int local_32 = CurrentDialogue.GetSubtitleIndex() + 1;
            if (local_32 < CurrentDialogue.GetSection().GetSubtitles().Num())
            {
                for (auto local_24 : CurrentDialogue.GetPlayerEntitiesInRange())
                {
                    local_30.SetbOutofDialogueRange(false);
                    local_30.SetSubtitleIndex(local_32);
                    XLog(ELog(64), FString().Append("Set subtitle index: ").Append(local_32).Append(" to player: ").Append(local_24.GetEntityName()));
                }
                CurrentDialogue.SetSubtitleIndex(local_32);
                const FDialogueSubtitle& local_78 = CurrentDialogue.GetSection().GetSubtitles()[local_32];
                FFPTime local_86 = (FFPTime(FixedTime.Time) + FFPTime(local_78.GetDuration()));
                CurrentDialogue.SetNextSubtitleTime((local_86 + FFPTime(CurrentDialogue.GetDialogueContext().GetSubtitleInterval())));
                XLog(ELog(64), FString().Append("Set subtitle index: ").Append(local_32).Append(", subtitle: ").Append(local_78.GetDialogueLineName()));
            }
            else
            {
                FC_DialogueEndedTag local_92;
                Assign local_90;
                local_90.opCall(local_92);
            }
        }
        return;
    }
    UFUNCTION()
    void Monitor_OnDialogueSectionIndexChanged(const FECSEntity &inout PlayerEntity, const FC_DialogueSectionIndex &inout DialogueSectionIndex) const
    {
        Get local_4;
        const FC_DialogueSection& local_6 = local_4.opCall();
        if (local_6)
        {
            FDialogueSubtitle local_30;
            if (DialogueSectionIndex.GetbOutofDialogueRange())
            {
                local_30 = local_6.GetSection().GetSubtitleOnPaused();
            }
            else
            {
                if (DialogueSectionIndex.GetSubtitleIndex() < 0 || (DialogueSectionIndex.GetSubtitleIndex() >= local_6.GetSection().GetSubtitles().Num()))
                {
                    XError(ELog(64), FString().Append("Invalid subtitle index: ").Append(DialogueSectionIndex.GetSubtitleIndex()));
                    return;
                }
                local_30 = local_6.GetSection().GetSubtitles()[DialogueSectionIndex.GetSubtitleIndex()];
            }
            if (!(::DialogueUtils::TryFillDialogueSubtitle(local_6.GetSection().GetDialogueContextEntity(), local_30)))
            {
                XWarning(ELog(64), FString().Append("Failed to fill subtitle: ").Append(local_30.GetDialogueLineName()));
            }
            bool local_33 = DialogueSectionIndex.GetbOutofDialogueRange();
            ::UDialogueSubtitleSubsystem::Get().DisplaySubtitle(FDialogueSubtitleDisplayConfig(local_30, ::DialogueUtils::GetDialogueVoiceType(local_6.GetSection().GetDialogueType()), DialogueSectionIndex.GetbOutofDialogueRange(), local_33));
            return;
        }
        XError(ELog(64), FString().Append("Dialogue section not found"));
        return;
    }
    UFUNCTION()
    void ClientJob_HandleDialogueNextSubtitle(const FECSEntity &inout PlayerEntity, const FC_DialogueSection &inout DialogueSection) const
    {
        int local_76;
        Remove local_4;
        local_4.opCall();
        FDialogueDeliveryContext local_52;
        const FDialogueSection& local_54 = DialogueSection.GetSection();
        if (!(::DialogueUtils::TryFindDialogueContext(local_54.GetDialogueContextEntity(), local_52)))
        {
            XError(ELog(64), FString().Append("Failed to find dialogue context"));
            return;
        }
        FC_DialogueSectionIndexByClient local_66;
        int local_67 = int(local_66.SubtitleIndex) + 1;
        bool local_5 = (local_67 >= 0) && (local_67 < local_54.GetSubtitles().Num());
        bool local_70 = (local_67 == (local_54.GetSubtitles().Num() - 1));
        if (int(local_66.SubtitleIndex) >= 0 && (int(local_66.SubtitleIndex) < local_54.GetSubtitles().Num()))
        {
            int local_73;
            local_73 = local_54.GetSubtitles()[int(local_66.SubtitleIndex)].GetDialogueNodeId();
            if (local_5)
            {
                local_76 = local_54.GetSubtitles()[local_67].GetDialogueNodeId();
            }
            else
            {
                local_76 = 0;
            }
            if (local_76 != local_73)
            {
                local_52.ExecuteDeferredActions(PlayerEntity, local_73, EMissionActionType(1));
            }
        }
        if (local_5)
        {
            UDialogueSubtitleSubsystem local_82 = ::UDialogueSubtitleSubsystem::Get();
            FDialogueSubtitle local_104 = FDialogueSubtitle(local_54.GetSubtitles()[local_67]);
            local_66.SubtitleIndex = local_67;
            if (local_52.FillSubtitle(local_104))
            {
                bool local_71 = false;
                local_82.DisplaySubtitle(FDialogueSubtitleDisplayConfig(local_104, ::DialogueUtils::GetDialogueVoiceType(local_54.GetDialogueType()), false, local_71));
            }
            else
            {
                XError(ELog(64), FString().Append("Failed to fill subtitle: ").Append(local_104.GetDialogueLineName()));
            }
            if (local_70 && (local_54.GetOptions().Num() > 0))
            {
                TArray<FDialogueOptionInfo> local_136 = local_52.GetFilledOptions(local_54);
                if (local_136.Num() > 0)
                {
                    local_82.DisplayOptions(local_136);
                }
            }
        }
        else
        {
            FC_DialoguePlayFinishedTag local_146;
            Assign local_144;
            local_144.opCall(local_146);
        }
        return;
    }
    UFUNCTION()
    void ClientJob_HandleRequestDialogueInterrupt(const FCE_DialogueRequestInterrupt &inout Event) const
    {
        Get local_4;
        const FC_DialogueSection& local_6 = local_4.opCall();
        if (local_6)
        {
            this.SendDialogueEndedEvent(Event.PlayerEntity, local_6.GetSection(), true);
        }
        return;
    }
    UFUNCTION()
    void MonitorJob_HandleDialogueSectionRemoved(const FECSEntity &inout PlayerEntity, const FC_DialogueSection &inout DialogueSection) const
    {
        Has local_4;
        if (!(local_4.opCall()))
        {
            ::UDialogueSubtitleSubsystem::Get().RequestHideDialogueWidget();
        }
        Remove local_12;
        local_12.opCall();
        Remove local_16;
        local_16.opCall();
        return;
    }
    UFUNCTION()
    void ClientJob_HandleDialoguePlayFinished(const FECSEntity &inout PlayerEntity, const FC_DialogueSection &inout DialogueSection) const
    {
        Remove local_4;
        local_4.opCall();
        this.SendDialogueEndedEvent(PlayerEntity, DialogueSection.GetSection(), false);
        return;
    }
    UFUNCTION()
    void ServerJob_HandleOnDialogueEnded(const FCE_DialogueRequestEnd &inout Event) const
    {
        XLog(ELog(64), FString().Append("[Dialogue] Handle On Dialogue Request End: ").Append(Event.PlayerEntity.GetEntityName()).Append(", dialogue name: ").Append(Event.DialogueName).Append(", interrupted: ").Append(Event.bInterrupted));
        Get local_12;
        const FC_DialogueSection& local_14 = local_12.opCall();
        if (local_14)
        {
            if ((!((FECSEntity(local_14.GetSection().GetDialogueContextEntity()) == Event.DialogueContextEntity))))
            {
                XError(ELog(64), FString().Append("[Dialogue] Dialogue context entity mismatch, ").Append(local_14.GetSection().GetDialogueContextEntity()).Append(" != ").Append(Event.DialogueContextEntity));
                return;
            }
            FC_DialogueEndedTag local_26;
            Assign local_24;
            local_24.opCall(local_26);
        }
        return;
    }
    UFUNCTION()
    void ServerJob_HandleSimpleDialogueEnded(const FECSEntity &inout DialogueEntity, const FC_DialogueSimplePlaying &inout CurrentDialogue) const
    {
        Remove local_4;
        local_4.opCall();
        XLog(ELog(64), FString().Append("[Dialogue] Simple dialogue ended: ").Append(DialogueEntity.GetEntityName()));
        FECSEntity local_18 = DialogueEntity;
        Has local_22;
        local_22.opCall();
        Remove local_26;
        local_26.opCall();
        Remove local_30;
        local_30.opCall();
        Remove local_34;
        local_34.opCall();
        Remove local_38;
        local_38.opCall();
        return;
    }
    UFUNCTION()
    void ServerJob_HandleAmbientDialogueEnded(const FECSEntity &inout DialogueEntity, const FC_DialogueAmbientPlaying &inout CurrentDialogue) const
    {
        Remove local_4;
        local_4.opCall();
        XLog(ELog(64), FString().Append("[Dialogue] Ambient dialogue ended: ").Append(DialogueEntity.GetEntityName()));
        TArray<FECSEntity> local_18;
        for (auto local_36 : CurrentDialogue.GetPlayerEntitiesInRange())
        {
            local_18.Add(local_36);
        }
        for (auto local_36 : CurrentDialogue.GetPlayerEntitiesOutRange())
        {
            local_18.Add(local_36);
        }
        for (auto local_36 : local_18)
        {
            local_36;
            Get local_54;
            const FC_DialogueSection& local_56 = local_54.opCall();
            if (local_56)
            {
                if ((int(local_56.GetSection().GetDialogueType())) != 1 || !((FECSEntity(local_56.GetSection().GetDialogueContextEntity()) == DialogueEntity)))
                {
                    continue;
                }
                Remove local_68;
                local_68.opCall();
            }
        }
        Remove local_72;
        local_72.opCall();
        return;
    }
    void SendDialogueEndedEvent(const FECSEntity &inout PlayerEntity, const FDialogueSection &inout Section, const bool bInterrupted) const
    {
        Has local_4;
        if (!(local_4.opCall()))
        {
            FDialogueDeliveryContext local_52;
            if (::DialogueUtils::TryFindDialogueContext(Section.GetDialogueContextEntity(), local_52))
            {
                if (local_52.GetInteractTarget().IsValid())
                {
                    XLog(ELog(64), FString().Append("[Dialogue] SetWatchPlayerLookDialogueActive false, NPC: ").Append(local_52.GetInteractTarget().GetEntityName()));
                    ::FNPCWatchPlayerLookUtils::SetWatchPlayerLookDialogueActive(local_52.GetInteractTarget(), false);
                }
            }
        }
        FFPTime local_66 = FFPTime(-1);
        FCE_DialogueRequestEnd local_70;
        local_70.PlayerEntity = PlayerEntity;
        local_70.DialogueName = Section.GetDialogueName();
        local_70.DialogueContextEntity = Section.GetDialogueContextEntity();
        local_70.bInterrupted = bInterrupted;
        return;
    }
    TArray<FECSEntity> UpdatePlayersInRange(const FECSEntity &inout DialogueEntity, FC_DialogueAmbientPlaying &inout CurrentDialogue) const
    {
        TArray<FECSEntity> local_4;
        FVector local_10 = ::FASCommonUtils::GetEntityLocation(DialogueEntity);
        FECSRuntimeView local_56 = ECS::GetECSWorld().GetRuntimeView(EECSRuntimeViewType(2));
        Include local_60;
        local_60.opCall();
        FECSRuntimeViewIterator local_94 = local_56.Iterator();
        for (; local_94.CanProceed;)
        {
            const FECSEntity& local_132 = local_94.Proceed();
            Get local_140;
            FVector local_16 = ::FASCommonUtils::GetEntityLocation(FECSEntity(local_140.opCall().GetPlayerPawnEntity()));
            float local_150 = local_16.DistSquared(local_10);
            bool local_129 = (local_150 <= CurrentDialogue.GetDialogueContext().GetInterruptDistanceSquared());
            if ((local_150 <= CurrentDialogue.GetDialogueContext().GetResumeDistanceSquared()) && !(CurrentDialogue.GetPlayerEntitiesInRange().Contains(local_132)))
            {
                if ((FECSEntity(CurrentDialogue.GetTriggerPlayer()) == ENTITY_NULL))
                {
                    XLog(ELog(64), FString().Append("Set trigger player: ").Append(local_132.GetEntityName()).Append(", for dialogue: ").Append(CurrentDialogue.GetDialogueContext().GetDialogueName()));
                    CurrentDialogue.SetTriggerPlayer(local_132);
                }
                else
                {
                    bool local_168;
                    local_168 = false;
                    switch (int(CurrentDialogue.GetBroadcastScope()))
                    {
                    case 0:
                    {
                        local_168 = (local_132 == CurrentDialogue.GetTriggerPlayer());
                        break;
                    }
                    case 1:
                    {
                        local_168 = ::FTeamUtils::IsInSameTeam(local_132, CurrentDialogue.GetTriggerPlayer());
                        break;
                    }
                    case 2:
                    {
                        local_168 = true;
                        break;
                    }
                    }
                    if (!(local_168))
                    {
                        XLog(ELog(64), FString().Append("Skip Player ").Append(local_132.GetEntityName()).Append(", not a valid target for dialogue: ").Append(CurrentDialogue.GetDialogueContext().GetDialogueName()));
                        continue;
                    }
                }
                XLog(ELog(64), FString().Append("Player ").Append(local_132.GetEntityName()).Append(" entered range for dialogue: ").Append(CurrentDialogue.GetDialogueContext().GetDialogueName()));
                ModifyOrAdd local_176;
                local_176.opCall().SetSection(CurrentDialogue.GetSection());
                CurrentDialogue.GetModify_PlayerEntitiesInRange().Add(local_132);
                if (CurrentDialogue.GetPlayerEntitiesOutRange().Contains(local_132))
                {
                }
            }
            else
            {
                if (!(local_129) && CurrentDialogue.GetPlayerEntitiesInRange().Contains(local_132))
                {
                    XLog(ELog(64), FString().Append("Player ").Append(local_132.GetEntityName()).Append(" left range for dialogue: ").Append(CurrentDialogue.GetDialogueContext().GetDialogueName()));
                    CurrentDialogue.GetModify_PlayerEntitiesOutRange().Add(local_132);
                    local_4.Add(local_132);
                }
            }
        }
        return local_4;
    }
    UFUNCTION()
    void ClientJob_HandleNarrationStart(const FCE_NarrationDialogueStart &inout Event) const
    {
        const FNarrationDialogueConfig& local_4;
        const UDialogueSettings local_78;
        if (!(Event.DialogueConfig.IsSet()))
        {
            return;
        }
        if (local_4.NarrationEntries.IsEmpty())
        {
            XError(ELog(64), FString().Append("[Dialogue] Narration entries is empty: ").Append(local_4.GetDataName()));
            return;
        }
        TArray<FDialogueSubtitle> local_16;
        int local_17 = 0;
        while (local_17 < 0)
        {
            const FNarrationSubtitleEntry& local_22 = local_4.NarrationEntries[local_17];
            if (!(local_22.DialogueLine.IsSet()))
            {
            }
            else
            {
                const FDialogueLineConfig& local_24;
                FDialogueSubtitle local_46 = FDialogueSubtitle(FECSEntity(), local_17, local_24.GetDataName());
                local_46.SetDuration(local_22.SubtitleDuration);
                local_46.SetContent(local_24.LineText);
                local_46.SetSpeakerName(local_24.GetSpeakerName());
                if (local_24.GetVoiceConfig().IsSet())
                {
                    const FDialogueVoiceConfig& local_58;
                    for (auto& local_72 : local_58.VOSources)
                    {
                        if ((int(local_72.PlayerGender) == 0 || (int(local_72.PlayerGender) == 2)))
                        {
                            if (local_72.Duration > 0.0f)
                            {
                                local_46.SetDuration(local_72.Duration);
                            }
                            local_46.SetVOFile(local_72.VOFile);
                            break;
                        }
                    }
                }
                local_16.Add(local_46);
            }
            ++local_17;
        }
        if (local_16.IsEmpty())
        {
            return;
        }
        GetGameplaySettings<UDialogueSettings> local_80;
        local_78 = local_80;
        ::UDialogueSubtitleSubsystem::Get().StartNarration(local_4.GetDataName(), local_16, local_78.DialogueSubtitleInterval);
        return;
    }
    UFUNCTION()
    void Run_ClientJob_HandleDialogueOptionSelect() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_DialogueOptionSelectClient> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(2)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_DialogueOptionSelectClient& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ClientJob_HandleDialogueOptionSelect(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_HandleDialogueOptionSelect() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_DialogueOptionSelect> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_DialogueOptionSelect& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            if (local_60.Validate() == false)
            {
                FString local_70 = "Validate Failed: FCE_DialogueOptionSelect, sender";
                FString local_66 = local_60.Sender.ToString();
                continue;
            }
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_HandleDialogueOptionSelect(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_HandleExecuteDialogueAction() const
    {
        const FECSEntity& local_36;
        int local_38 = 0;
        int local_44 = 0;
        MarkModifiedIfDirty local_52;
        MarkModifiedIfDirty local_56;
        int local_184 = 0;
        const FECSJob& local_2 = ECS::GetContextJob();
        int local_4 = 0;
        int local_3 = local_4;
        if (local_2.IsViewCacheUsable())
        {
            FECSWorldPtr local_8 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_12 = local_2.GetViewCacheEntities();
            int local_13 = 0;
            for (auto& local_28 : local_12)
            {
                local_28;
                FECSEntity local_32;
                if (!(local_32.IsValid()))
                {
                    continue;
                }
                ++local_13;
                FECSEntityScopeCycleCounter local_33 = FECSEntityScopeCycleCounter(local_32);
                this.ServerJob_HandleExecuteDialogueAction(local_36, local_38, local_44);
                local_52.opCall(local_38);
                local_56.opCall(local_44);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_94 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_98;
        local_98.opCall();
        Include local_102;
        local_102.opCall();
        Exclude(local_94).opCall();
        Exclude(local_94).opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_112 = 0;
        FECSRuntimeViewIterator local_146 = local_94.Iterator();
        for (; local_146.CanProceed;)
        {
            local_36 = local_146.Proceed();
            ++local_112;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.ServerJob_HandleExecuteDialogueAction(local_184, local_38, local_44);
            local_52.opCall(local_38);
            local_56.opCall(local_44);
        }
        local_2.UpdateCachedEntityCount(local_112);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_HandleDialogueExecutionEntryFinished() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_MissionExecutionCompleted> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_MissionExecutionCompleted& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_HandleDialogueExecutionEntryFinished(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_HandleDialogueActionWaitNotifyResult() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_DialogueActionNotifyResult> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_DialogueActionNotifyResult& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_HandleDialogueActionWaitNotifyResult(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    void Monitor___JobTimer_Pre___ServerJob_HandleDialogueActionWaitNotifyTimeout(const FC_DialogueExecuteActionWaitNotify &inout TimerComp, const FECSEntity &inout Entity) const
    {
        if (!(TimerComp))
        {
            return;
        }
        FFPTime local_6 = TimerComp.TimeoutTime;
        FName local_8 = FName("S_DialogueDeliverySystem::ServerJob_HandleDialogueActionWaitNotifyTimeout");
        if (local_6.opCmp(0.0) >= 0 && (local_6.opCmp(FPTIME_MAX) < 0))
        {
            ECS::ScheduleJobTimer(local_8, local_6, Entity.GetId(), true);
        }
        return;
    }
    void Monitor___JobTimer_Post___ServerJob_HandleDialogueActionWaitNotifyTimeout(const FC_DialogueExecuteActionWaitNotify &inout TimerComp, const FECSEntity &inout Entity) const
    {
        if (!(TimerComp))
        {
            return;
        }
        FFPTime local_6 = TimerComp.TimeoutTime;
        FName local_8 = FName("S_DialogueDeliverySystem::ServerJob_HandleDialogueActionWaitNotifyTimeout");
        if (local_6.opCmp(0.0) >= 0 && (local_6.opCmp(FPTIME_MAX) < 0))
        {
            ECS::ScheduleJobTimer(local_8, local_6, Entity.GetId(), false);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor___JobTimer_Pre___ServerJob_HandleDialogueActionWaitNotifyTimeout() const
    {
        int local_52 = 0;
        int local_54 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_14 = ::__GetMonitorDialogueExecuteActionWaitNotifyOnModifyView(this.GetECSWorld(), EECSRegType(0), true, false);
        FECSMonitorRuntimeViewIterator local_30 = local_14.Iterator();
        for (; local_30.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44 = local_30.Proceed();
            FECSEntityScopeCycleCounter local_45 = FECSEntityScopeCycleCounter(local_44.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_44);
            this.Monitor___JobTimer_Pre___ServerJob_HandleDialogueActionWaitNotifyTimeout(local_52, local_54);
        }
        FECSMonitorRuntimeView local_18 = ::__GetMonitorDialogueExecuteActionWaitNotifyOnActiveView(this.GetECSWorld(), EECSRegType(0), true, false);
        FECSMonitorRuntimeViewIterator local_42 = local_18.Iterator();
        for (; local_42.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44_2 = local_42.Proceed();
            FECSEntityScopeCycleCounter local_45_2 = FECSEntityScopeCycleCounter(local_44_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_44_2);
            this.Monitor___JobTimer_Pre___ServerJob_HandleDialogueActionWaitNotifyTimeout(local_52, local_54);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor___JobTimer_Post___ServerJob_HandleDialogueActionWaitNotifyTimeout() const
    {
        int local_52 = 0;
        int local_54 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_14 = ::__GetMonitorDialogueExecuteActionWaitNotifyOnModifyView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_30 = local_14.Iterator();
        for (; local_30.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44 = local_30.Proceed();
            FECSEntityScopeCycleCounter local_45 = FECSEntityScopeCycleCounter(local_44.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_44);
            this.Monitor___JobTimer_Post___ServerJob_HandleDialogueActionWaitNotifyTimeout(local_52, local_54);
        }
        FECSMonitorRuntimeView local_18 = ::__GetMonitorDialogueExecuteActionWaitNotifyOnActiveView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_42 = local_18.Iterator();
        for (; local_42.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44_2 = local_42.Proceed();
            FECSEntityScopeCycleCounter local_45_2 = FECSEntityScopeCycleCounter(local_44_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_44_2);
            this.Monitor___JobTimer_Post___ServerJob_HandleDialogueActionWaitNotifyTimeout(local_52, local_54);
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_HandleDialogueActionWaitNotifyTimeout() const
    {
        int local_38 = 0;
        int local_46 = 0;
        int local_48 = 0;
        const FECSJob& local_2 = ECS::GetContextJob();
        FECSWorldPtr local_4 = ECS::GetECSWorld();
        local_2.MarkIteratingExternalEntityList(true);
        const TArray<FECSEntityId>& local_10 = local_2.GetExternalEntityList();
        FECSEntity local_28;
        for (auto& local_24 : local_10)
        {
            local_24;
            FECSEntityScopeCycleCounter local_29 = FECSEntityScopeCycleCounter(local_28);
            bool local_7 = false;
            bool local_31 = !(false);
            if (!(local_28.IsActive()) == local_31)
            {
                continue;
            }
            if (!(local_38))
            {
                continue;
            }
            FFPTime local_40 = local_38.TimeoutTime;
            if (local_40.opCmp(0.0) < 0 || (local_38.TimeoutTime == FPTIME_MAX))
            {
                continue;
            }
            if (local_7)
            {
                continue;
            }
            this.ServerJob_HandleDialogueActionWaitNotifyTimeout(local_46, local_48);
            MarkModifiedIfDirty local_56;
            local_56.opCall(local_48);
        }
        local_2.MarkIteratingExternalEntityList(false);
        ECS::ClearCurJobExternalEntityList();
        return;
    }
    UFUNCTION()
    void Run_ServerJob_HandleSimpleDialogueNextSection() const
    {
        const FECSEntity& local_36;
        int local_38 = 0;
        MarkModifiedIfDirty local_46;
        int local_170 = 0;
        const FECSJob& local_2 = ECS::GetContextJob();
        int local_4 = 0;
        int local_3 = local_4;
        if (local_2.IsViewCacheUsable())
        {
            FECSWorldPtr local_8 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_12 = local_2.GetViewCacheEntities();
            int local_13 = 0;
            for (auto& local_28 : local_12)
            {
                local_28;
                FECSEntity local_32;
                if (!(local_32.IsValid()))
                {
                    continue;
                }
                ++local_13;
                FECSEntityScopeCycleCounter local_33 = FECSEntityScopeCycleCounter(local_32);
                this.ServerJob_HandleSimpleDialogueNextSection(local_36, local_38);
                local_46.opCall(local_38);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_84 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_88;
        local_88.opCall();
        Include local_92;
        local_92.opCall();
        Exclude(local_84).opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_98 = 0;
        FECSRuntimeViewIterator local_132 = local_84.Iterator();
        for (; local_132.CanProceed;)
        {
            local_36 = local_132.Proceed();
            ++local_98;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.ServerJob_HandleSimpleDialogueNextSection(local_170, local_38);
            local_46.opCall(local_38);
        }
        local_2.UpdateCachedEntityCount(local_98);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_HandleAmbientDialogueNextSection() const
    {
        int local_6 = 0;
        const FECSEntity& local_40;
        int local_42 = 0;
        MarkModifiedIfDirty local_50;
        int local_174 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        int local_8 = 0;
        int local_7 = local_8;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_12 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_16 = local_4.GetViewCacheEntities();
            int local_17 = 0;
            for (auto& local_32 : local_16)
            {
                local_32;
                FECSEntity local_36;
                if (!(local_36.IsValid()))
                {
                    continue;
                }
                ++local_17;
                FECSEntityScopeCycleCounter local_37 = FECSEntityScopeCycleCounter(local_36);
                this.ServerJob_HandleAmbientDialogueNextSection(local_40, local_42, local_6);
                local_50.opCall(local_42);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_88 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_92;
        local_92.opCall();
        Include local_96;
        local_96.opCall();
        Exclude(local_88).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_102 = 0;
        FECSRuntimeViewIterator local_136 = local_88.Iterator();
        for (; local_136.CanProceed;)
        {
            local_40 = local_136.Proceed();
            ++local_102;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.ServerJob_HandleAmbientDialogueNextSection(local_174, local_42, local_6);
            local_50.opCall(local_42);
        }
        local_4.UpdateCachedEntityCount(local_102);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_OnDialogueSectionChanged() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorDialogueSectionOnAssignView(this.GetECSWorld(), EECSRegType(0), false, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_OnDialogueSectionChanged(local_46, local_52);
        }
        FECSMonitorRuntimeView local_16 = ::__GetMonitorDialogueSectionOnModifyView(this.GetECSWorld(), EECSRegType(0), false, true);
        FECSMonitorRuntimeViewIterator local_40 = local_16.Iterator();
        for (; local_40.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42_2 = local_40.Proceed();
            FECSEntityScopeCycleCounter local_43_2 = FECSEntityScopeCycleCounter(local_42_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_42_2);
            this.Monitor_OnDialogueSectionChanged(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_TickAmbientDialogue() const
    {
        int local_12 = 0;
        const FECSEntity& local_44;
        int local_46 = 0;
        MarkModifiedIfDirty local_54;
        int local_174 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        if (!(local_2.IsOnInterval(FFPTime(0.1))))
        {
            return;
        }
        int local_14 = 0;
        int local_13 = local_14;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_16 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_20 = local_4.GetViewCacheEntities();
            int local_21 = 0;
            for (auto& local_36 : local_20)
            {
                local_36;
                FECSEntity local_40;
                if (!(local_40.IsValid()))
                {
                    continue;
                }
                ++local_21;
                FECSEntityScopeCycleCounter local_41 = FECSEntityScopeCycleCounter(local_40);
                this.ServerJob_TickAmbientDialogue(local_44, local_46, local_12);
                local_54.opCall(local_46);
            }
            local_4.UpdateCachedEntityCount(local_21);
            return;
        }
        FECSRuntimeView local_92 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_96;
        local_96.opCall();
        Exclude(local_92).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_22 = local_4.GetViewCacheEpoch();
        int local_102 = 0;
        FECSRuntimeViewIterator local_136 = local_92.Iterator();
        for (; local_136.CanProceed;)
        {
            local_44 = local_136.Proceed();
            ++local_102;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_44.GetId());
            }
            FECSEntityScopeCycleCounter local_41_2 = FECSEntityScopeCycleCounter(local_44);
            this.ServerJob_TickAmbientDialogue(local_174, local_46, local_12);
            local_54.opCall(local_46);
        }
        local_4.UpdateCachedEntityCount(local_102);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_22);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_OnDialogueSectionIndexChanged() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorDialogueSectionIndexOnAssignView(this.GetECSWorld(), EECSRegType(0), false, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_OnDialogueSectionIndexChanged(local_46, local_52);
        }
        FECSMonitorRuntimeView local_16 = ::__GetMonitorDialogueSectionIndexOnModifyView(this.GetECSWorld(), EECSRegType(0), false, true);
        FECSMonitorRuntimeViewIterator local_40 = local_16.Iterator();
        for (; local_40.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42_2 = local_40.Proceed();
            FECSEntityScopeCycleCounter local_43_2 = FECSEntityScopeCycleCounter(local_42_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_42_2);
            this.Monitor_OnDialogueSectionIndexChanged(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_HandleDialogueNextSubtitle() const
    {
        const FECSEntity& local_36;
        int local_38 = 0;
        int local_166 = 0;
        const FECSJob& local_2 = ECS::GetContextJob();
        int local_4 = 0;
        int local_3 = local_4;
        if (local_2.IsViewCacheUsable())
        {
            FECSWorldPtr local_8 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_12 = local_2.GetViewCacheEntities();
            int local_13 = 0;
            for (auto& local_28 : local_12)
            {
                local_28;
                FECSEntity local_32;
                if (!(local_32.IsValid()))
                {
                    continue;
                }
                ++local_13;
                FECSEntityScopeCycleCounter local_33 = FECSEntityScopeCycleCounter(local_32);
                this.ClientJob_HandleDialogueNextSubtitle(local_36, local_38);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_80 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_84;
        local_84.opCall();
        Include local_88;
        local_88.opCall();
        Exclude(local_80).opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_94 = 0;
        FECSRuntimeViewIterator local_128 = local_80.Iterator();
        for (; local_128.CanProceed;)
        {
            local_36 = local_128.Proceed();
            ++local_94;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.ClientJob_HandleDialogueNextSubtitle(local_166, local_38);
        }
        local_2.UpdateCachedEntityCount(local_94);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_HandleRequestDialogueInterrupt() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_DialogueRequestInterrupt> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(2)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_DialogueRequestInterrupt& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ClientJob_HandleRequestDialogueInterrupt(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_MonitorJob_HandleDialogueSectionRemoved() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorDialogueSectionOnRemoveView(this.GetECSWorld(), EECSRegType(0), false, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.MonitorJob_HandleDialogueSectionRemoved(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_HandleDialoguePlayFinished() const
    {
        const FECSEntity& local_36;
        int local_38 = 0;
        int local_166 = 0;
        const FECSJob& local_2 = ECS::GetContextJob();
        int local_4 = 0;
        int local_3 = local_4;
        if (local_2.IsViewCacheUsable())
        {
            FECSWorldPtr local_8 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_12 = local_2.GetViewCacheEntities();
            int local_13 = 0;
            for (auto& local_28 : local_12)
            {
                local_28;
                FECSEntity local_32;
                if (!(local_32.IsValid()))
                {
                    continue;
                }
                ++local_13;
                FECSEntityScopeCycleCounter local_33 = FECSEntityScopeCycleCounter(local_32);
                this.ClientJob_HandleDialoguePlayFinished(local_36, local_38);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_80 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_84;
        local_84.opCall();
        Include local_88;
        local_88.opCall();
        Exclude(local_80).opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_94 = 0;
        FECSRuntimeViewIterator local_128 = local_80.Iterator();
        for (; local_128.CanProceed;)
        {
            local_36 = local_128.Proceed();
            ++local_94;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.ClientJob_HandleDialoguePlayFinished(local_166, local_38);
        }
        local_2.UpdateCachedEntityCount(local_94);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_HandleOnDialogueEnded() const
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
            this.ServerJob_HandleOnDialogueEnded(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_HandleSimpleDialogueEnded() const
    {
        const FECSEntity& local_36;
        int local_38 = 0;
        int local_166 = 0;
        const FECSJob& local_2 = ECS::GetContextJob();
        int local_4 = 0;
        int local_3 = local_4;
        if (local_2.IsViewCacheUsable())
        {
            FECSWorldPtr local_8 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_12 = local_2.GetViewCacheEntities();
            int local_13 = 0;
            for (auto& local_28 : local_12)
            {
                local_28;
                FECSEntity local_32;
                if (!(local_32.IsValid()))
                {
                    continue;
                }
                ++local_13;
                FECSEntityScopeCycleCounter local_33 = FECSEntityScopeCycleCounter(local_32);
                this.ServerJob_HandleSimpleDialogueEnded(local_36, local_38);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_80 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_84;
        local_84.opCall();
        Include local_88;
        local_88.opCall();
        Exclude(local_80).opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_94 = 0;
        FECSRuntimeViewIterator local_128 = local_80.Iterator();
        for (; local_128.CanProceed;)
        {
            local_36 = local_128.Proceed();
            ++local_94;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.ServerJob_HandleSimpleDialogueEnded(local_166, local_38);
        }
        local_2.UpdateCachedEntityCount(local_94);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_HandleAmbientDialogueEnded() const
    {
        const FECSEntity& local_36;
        int local_38 = 0;
        int local_166 = 0;
        const FECSJob& local_2 = ECS::GetContextJob();
        int local_4 = 0;
        int local_3 = local_4;
        if (local_2.IsViewCacheUsable())
        {
            FECSWorldPtr local_8 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_12 = local_2.GetViewCacheEntities();
            int local_13 = 0;
            for (auto& local_28 : local_12)
            {
                local_28;
                FECSEntity local_32;
                if (!(local_32.IsValid()))
                {
                    continue;
                }
                ++local_13;
                FECSEntityScopeCycleCounter local_33 = FECSEntityScopeCycleCounter(local_32);
                this.ServerJob_HandleAmbientDialogueEnded(local_36, local_38);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_80 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_84;
        local_84.opCall();
        Include local_88;
        local_88.opCall();
        Exclude(local_80).opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_94 = 0;
        FECSRuntimeViewIterator local_128 = local_80.Iterator();
        for (; local_128.CanProceed;)
        {
            local_36 = local_128.Proceed();
            ++local_94;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.ServerJob_HandleAmbientDialogueEnded(local_166, local_38);
        }
        local_2.UpdateCachedEntityCount(local_94);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_HandleNarrationStart() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_NarrationDialogueStart> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(2)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_NarrationDialogueStart& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ClientJob_HandleNarrationStart(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
}

