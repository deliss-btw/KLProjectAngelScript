

class US_ChatSystem : UECSScriptSystem
{
    float32 ServerSendChatNearbyRadiusCm = 8000.0f;
    float32 ServerSendNpcChatRadiusCm = 5000.0f;


    UFUNCTION()
    void ServerJob_HandleChatSendToDS(const FCE_ChatSendToDS &inout Event) const
    {
        int local_17;
        if (int(this.GetWorld().GetNetMode()) == 3)
        {
            return;
        }
        if (!(Event.Validate()))
        {
            return;
        }
        FECSEntity local_10 = FECSEntity(Event.Sender);
        Has local_14;
        if (!(local_10.IsValid()) || !(local_14.opCall()))
        {
            XWarning(ELog(74), "ServerJob_HandleChatSendToDS: invalid Sender (no FC_PlayerController)");
            return;
        }
        Get local_22;
        local_17 = local_22.opCall().GetPlayerId();
        int local_23 = int(Event.ChannelType);
        if (local_23 != 3 && (local_23 != 1))
        {
            XLog(ELog(74), FString().Append("ServerJob_HandleChatSendToDS invalid ChannelType=").Append(local_23).Append(" (expect BattleTeam/Nearby only)"));
            return;
        }
        FFPTime local_36 = FFPTime(-1);
        FCE_DSDispatchChat local_30;
        local_30.DispatchKind = EChatDSDispatchKind(0);
        ::ChatSystemUtil::ApplyFromDSPlayerEntity(local_30.SenderBrief, local_10, local_17);
        local_30.SendChat = ::ChatSystemUtil::MakeTextSnapshot(local_23, Event.TextContent);
        XLog(ELog(74), FString().Append("ServerJob_HandleChatSendToDS dispatch FCE_DSDispatchChat PlayerUid=").Append(local_17).Append(" ChannelType=").Append(local_23));
        return;
    }
    UFUNCTION()
    void ServerJob_DispatchServerSendChatFromGS(const FCE_DSDispatchChat &inout Event) const
    {
        int local_14;
        int local_16;
        bool local_21;
        bool local_87;
        Get local_104;
        if (int(this.GetWorld().GetNetMode()) == 3)
        {
            return;
        }
        UGameDSConnectionSubsystem local_8 = ::UGameDSConnectionSubsystem::Get();
        if (local_8 == nullptr)
        {
            return;
        }
        if (int(Event.DispatchKind) == 1)
        {
            local_14 = 1;
        }
        else
        {
            local_14 = Event.SendChat.GetChannelType();
        }
        local_16 = Event.SenderBrief.GetUid();
        FECSEntity local_20 = FECSEntity(ENTITY_NULL);
        if (int(Event.DispatchKind) == 0 && (local_16 != 0))
        {
            local_20 = FECSEntity(local_8.GetPlayerEntityIdByUid(local_16));
            if (local_20.IsValid())
            {
                FCE_DSChatMsgCommission local_28;
                FFPTime local_34 = FFPTime(-1);
                local_28.BindPlayerUid = local_16;
                local_28.Channel = local_14;
            }
        }
        TArray<uint> local_38;
        if (int(Event.DispatchKind) == 1)
        {
            int local_193;
            Get local_178;
            Include local_82;
            float32 local_93;
            FECSRuntimeView local_78 = this.GetECSWorld().GetRuntimeView(EECSRuntimeViewType(2));
            local_82.opCall();
            if (!(FECSEntity(Event.Sender).IsValid()))
            {
                local_21 = false;
            }
            else
            {
                Has local_92;
                local_21 = local_92.opCall();
            }
            local_93 = this.ServerSendNpcChatRadiusCm;
            FVector local_100(FVector::ZeroVector);
            if (local_21)
            {
                local_100 = local_104.opCall().GetPosition();
            }
            FECSRuntimeViewIterator local_138 = local_78.Iterator();
            for (; local_138.CanProceed;)
            {
                local_138.Proceed();
                if (local_21)
                {
                    if (!(FECSEntity(local_178.opCall().GetPlayerPawnEntity()).IsValid()))
                    {
                        continue;
                    }
                    if (float32(FVector(local_104.opCall().GetPosition()).Distance(local_100)) > local_93)
                    {
                        continue;
                    }
                }
                local_193 = local_178.opCall().GetPlayerId();
                if (!(local_38.Contains(local_193)))
                {
                    local_38.Add(local_193);
                }
            }
        }
        else
        {
            int local_193;
            Get local_178;
            Include local_82;
            if (local_14 == 3)
            {
                if (!(local_20.IsValid()))
                {
                    local_87 = false;
                }
                else
                {
                    Has local_198;
                    local_87 = local_198.opCall();
                }
                if (local_87)
                {
                    Get local_202;
                    if (!(FECSEntity(local_202.opCall().GetTeamEntity()).IsValid()))
                    {
                        local_87 = false;
                    }
                    else
                    {
                        Has local_206;
                        local_87 = local_206.opCall();
                    }
                    if (local_87)
                    {
                        int local_212;
                        for (auto& local_226 : local_212.GetMembers())
                        {
                            if (!(local_226.GetEntity().IsValid()))
                            {
                                local_87 = false;
                            }
                            else
                            {
                                Has local_230;
                                local_87 = local_230.opCall();
                            }
                            if (local_87)
                            {
                                local_193 = local_178.opCall().GetPlayerId();
                                if (!(local_38.Contains(local_193)))
                                {
                                    local_38.Add(local_193);
                                }
                            }
                        }
                    }
                }
            }
            else
            {
                FECSRuntimeView local_56 = this.GetECSWorld().GetRuntimeView(EECSRuntimeViewType(2));
                local_82.opCall();
                FECSRuntimeViewIterator local_172 = local_56.Iterator();
                for (; local_172.CanProceed;)
                {
                    local_172.Proceed();
                    local_193 = local_178.opCall().GetPlayerId();
                    if (!(local_38.Contains(local_193)))
                    {
                        local_38.Add(local_193);
                    }
                }
            }
        }
        if (local_16 != 0 && (local_14 != 7) && local_38.Contains(local_16))
        {
        }
        int local_231 = 0;
        for (; local_231 < local_38.Num(); ++local_231)
        {
            FECSEntity local_26 = FECSEntity(local_8.GetPlayerEntityIdByUid(local_38[local_231]));
            FFPTime local_34_2 = FFPTime(-1);
            SendEvent local_236;
            FCE_ServerSendChatMsgNotify& local_238 = local_236.opCall(local_34_2);
            if (local_238)
            {
                local_238.SenderBrief = Event.SenderBrief;
                if ((int(Event.DispatchKind)) == 1)
                {
                    local_238.SendChat = ::ChatSystemUtil::MakeSnapshotFromNpcDialogue(Event.Sender, Event.DialogueLineConfig, Event.bUseSpotName);
                    continue;
                }
                local_238.SendChat = Event.SendChat;
            }
        }
        return;
    }
    UFUNCTION()
    void ClientJob_ForwardServerSendChatToModel(const FCE_ServerSendChatMsgNotify &inout Event) const
    {
        FECSWorldPtr local_2 = ECS::GetECSWorld();
        if (::UGameDSConnectionSubsystem::Get() != nullptr && ::UGameDSConnectionSubsystem::Get().IsConnectedToGameServer() && (Event.SendChat.GetChannelType() != 7))
        {
            Get local_20;
            if (Event.SenderBrief.GetUid() == local_20.opCall().GetPlayerId())
            {
                return;
            }
        }
        FFPTime local_28 = FFPTime(-1);
        SendEvent local_26;
        FCE_OnReceiveServerSendChat& local_30 = local_26.opCall(local_28);
        if (local_30)
        {
            local_30.SenderBrief = Event.SenderBrief;
            local_30.SendChat = Event.SendChat;
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_HandleChatSendToDS() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_ChatSendToDS> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_ChatSendToDS& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            if (local_60.Validate() == false)
            {
                FString local_70 = "Validate Failed: FCE_ChatSendToDS, sender";
                FString local_66 = local_60.Sender.ToString();
                continue;
            }
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_HandleChatSendToDS(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_DispatchServerSendChatFromGS() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_DSDispatchChat> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_DSDispatchChat& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_DispatchServerSendChatFromGS(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_ForwardServerSendChatToModel() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_ServerSendChatMsgNotify> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(2)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_ServerSendChatMsgNotify& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ClientJob_ForwardServerSendChatToModel(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
}

