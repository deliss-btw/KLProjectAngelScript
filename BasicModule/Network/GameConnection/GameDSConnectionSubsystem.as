

class UGameDSConnectionSubsystem : UGameDSConnectionSubsystemBase
{
    uint DSRegisterLevelKey = 0;
    uint DSRegisterLevelType = 0;
    uint DSHeartbeatSeq = 0;
    uint DSHeartbeatRspSeq = 0;
    int CheckEmptyDSEventId = 0;
    int ExitDSEventId = 0;
    FTimerHandle ExitDSTimerHandle;
    TMap<uint, uint> DSAddItemMsgIndexMap;
    TMap<uint, int> AddItemSendRetryCount;
    int AddItemMaxRetryCount = 30;
    FProtoRspDelegate DSHeartBeatRspDelegate;
    FProtoRspDelegate PlayerEnterDSRspDelegate;
    FProtoRspWithUidDelegate KickPlayerDSReqDelegate;
    FProtoRspDelegate PlayerEnterCommissionNotifyDelegate;
    FProtoRspWithUidDelegate PlayerFinishCommissionRspDelegate;
    FProtoRspWithUidDelegate FinishTrainingRspDelegate;
    FProtoRspWithUidDelegate SocialTeamInfoNotifyDelegate;
    FProtoRspWithUidDelegate PlayerTravelDSReqDelegate;
    FProtoRspWithUidDelegate GSServerAddItemRspDelegate;
    FProtoRspWithUidDelegate DSServerAddItemReqDelegate;
    FOnPlayerExitDSDelegate OnPlayerExitDS;
    FOnPlayerExitDSDelegate OnPlayerEnterDS;
    FProtoRspWithUidDelegate PlayerLevelDataNotifyDelegate;
    FProtoRspWithUidDelegate WearWeaponReqDelegate;
    FProtoRspWithUidDelegate ManageTalismanReqDelegate;
    FProtoRspWithUidDelegate ChangeDivineSkillDelegate;
    FProtoRspWithUidDelegate MissionPhaseCompleteRspDelegate;
    FProtoRspWithUidDelegate GSMissionStatusChangeNotifyDelegate;
    FProtoRspWithUidDelegate GSConditionProgressNotifyDelegate;
    FProtoRspWithUidDelegate AddDsBuffReqDelegate;
    FProtoRspWithUidDelegate TeamInvitePlayerRspDelegate;
    FProtoRspWithUidDelegate DsLeaveTeamRspDelegate;
    FProtoRspWithUidDelegate ManageTalentRspDelegate;
    FProtoRspWithUidDelegate TalentStatusToDSNotifyDelegate;
    FProtoRspDelegate ServerBroadcastChatMsgNotifyDelegate;
    FProtoRspWithUidDelegate UnlockAvatarNotifyDelegate;
    FProtoRspWithUidDelegate ChangeMainAvatarSpecialtyRspDelegate;
    FProtoRspWithUidDelegate SwitchMainAvatarGenderNotifyDelegate;
    FProtoRspWithUidDelegate AllAvatarFashionNotifyDelegate;
    FProtoRspDelegate GSDeadNotifyDelegate;
    FProtoRspWithUidDelegate AssembleTravelInDsNotifyDelegate;


    UFUNCTION()
    void OnInitialize_Implementation()
    {
        FOnReceiveErrorCodeDelegate local_4 = FOnReceiveErrorCodeDelegate(this, n"OnReceiveErrorCode");
        this.RegisterErrorCodeDelegate(local_4);
        FOnReceiveErrorCodeWithUidDelegate local_9 = FOnReceiveErrorCodeWithUidDelegate(this, n"OnReceiveErrorCodeWithUid");
        this.RegisterErrorCodeWithUidDelegate(local_9);
        this.DSHeartBeatRspDelegate.BindUFunction(this, n"OnDSHeartBeatRsp");
        this.RegisterProtoRsp(uint16(103), this.DSHeartBeatRspDelegate);
        this.PlayerEnterDSRspDelegate.BindUFunction(this, n"OnPlayerEnterDSRsp");
        this.RegisterProtoRsp(uint16(124), this.PlayerEnterDSRspDelegate);
        this.KickPlayerDSReqDelegate.BindUFunction(this, n"OnKickPlayerDSReq");
        this.RegisterProtoWithUidRsp(uint16(126), this.KickPlayerDSReqDelegate);
        this.PlayerEnterCommissionNotifyDelegate.BindUFunction(this, n"OnPlayerEnterCommissionNotify");
        this.RegisterProtoRsp(uint16(128), this.PlayerEnterCommissionNotifyDelegate);
        this.SocialTeamInfoNotifyDelegate.BindUFunction(this, n"OnSocialTeamInfoNotify");
        this.RegisterProtoWithUidRsp(uint16(405), this.SocialTeamInfoNotifyDelegate);
        this.PlayerTravelDSReqDelegate.BindUFunction(this, n"OnPlayerTravelDSReq");
        this.RegisterProtoWithUidRsp(uint16(129), this.PlayerTravelDSReqDelegate);
        this.GSServerAddItemRspDelegate.BindUFunction(this, n"OnGSAddItemRsp");
        this.RegisterProtoWithUidRsp(uint16(705), this.GSServerAddItemRspDelegate);
        this.DSServerAddItemReqDelegate.BindUFunction(this, n"OnDSAddItemReq");
        this.RegisterProtoWithUidRsp(uint16(704), this.DSServerAddItemReqDelegate);
        this.WearWeaponReqDelegate.BindUFunction(this, n"OnWearWeaponReq");
        this.RegisterProtoWithUidRsp(uint16(707), this.WearWeaponReqDelegate);
        this.ManageTalismanReqDelegate.BindUFunction(this, n"OnManageTalismanReq");
        this.RegisterProtoWithUidRsp(uint16(1113), this.ManageTalismanReqDelegate);
        this.AddDsBuffReqDelegate.BindUFunction(this, n"OnAddDsBuffReq");
        this.RegisterProtoWithUidRsp(uint16(146), this.AddDsBuffReqDelegate);
        this.ChangeDivineSkillDelegate.BindUFunction(this, n"OnChangeDivineSkillReq");
        this.RegisterProtoWithUidRsp(uint16(1103), this.ChangeDivineSkillDelegate);
        this.MissionPhaseCompleteRspDelegate.BindUFunction(this, n"OnMissionPhaseCompleteRsp");
        this.RegisterProtoWithUidRsp(uint16(1002), this.MissionPhaseCompleteRspDelegate);
        this.GSMissionStatusChangeNotifyDelegate.BindUFunction(this, n"OnGSMissionStatusChangeNotify");
        this.RegisterProtoWithUidRsp(uint16(1003), this.GSMissionStatusChangeNotifyDelegate);
        this.GSConditionProgressNotifyDelegate.BindUFunction(this, n"OnGSConditionProgressNotify");
        this.RegisterProtoWithUidRsp(uint16(1701), this.GSConditionProgressNotifyDelegate);
        this.PlayerFinishCommissionRspDelegate.BindUFunction(this, n"OnPlayerFinishCommissionRsp");
        this.RegisterProtoWithUidRsp(uint16(306), this.PlayerFinishCommissionRspDelegate);
        this.FinishTrainingRspDelegate.BindUFunction(this, n"OnFinishTrainingRsp");
        this.RegisterProtoWithUidRsp(uint16(1144), this.FinishTrainingRspDelegate);
        this.RegisterProtoWithUidRspByFunctionName(uint16(179), this, n"OnGetRandomFriendNameRsp");
        this.RegisterProtoWithUidRspByFunctionName(uint16(1503), this, n"OnPlayerBriefDataNotify");
        this.TeamInvitePlayerRspDelegate.BindUFunction(this, n"OnTeamInvitePlayerRsp");
        this.RegisterProtoWithUidRsp(uint16(409), this.TeamInvitePlayerRspDelegate);
        this.DsLeaveTeamRspDelegate.BindUFunction(this, n"OnDsLeaveTeamRsp");
        this.RegisterProtoWithUidRsp(uint16(404), this.DsLeaveTeamRspDelegate);
        this.RegisterProtoWithUidRspByFunctionName(uint16(427), this, n"OnTeamUpRsp");
        this.RegisterProtoWithUidRspByFunctionName(uint16(425), this, n"OnLeaveTeamRsp");
        this.RegisterProtoWithUidRspByFunctionName(uint16(407), this, n"OnKickTeammateRsp");
        this.RegisterProtoWithUidRspByFunctionName(uint16(423), this, n"OnTransferCaptainRsp");
        this.RegisterProtoWithUidRspByFunctionName(uint16(416), this, n"OnTeamInviteReplyRsp");
        this.RegisterProtoWithUidRspByFunctionName(uint16(420), this, n"OnTeamApplyReplyRsp");
        this.ManageTalentRspDelegate.BindUFunction(this, n"OnManageTalentRsp");
        this.RegisterProtoWithUidRsp(uint16(1118), this.ManageTalentRspDelegate);
        this.TalentStatusToDSNotifyDelegate.BindUFunction(this, n"OnTalentStatusToDSNotify");
        this.RegisterProtoWithUidRsp(uint16(1112), this.TalentStatusToDSNotifyDelegate);
        this.ServerBroadcastChatMsgNotifyDelegate.BindUFunction(this, n"OnServerBroadcastChatMsgNotify");
        this.RegisterProtoRsp(uint16(1805), this.ServerBroadcastChatMsgNotifyDelegate);
        this.UnlockAvatarNotifyDelegate.BindUFunction(this, n"OnUnlockAvatarNotify");
        this.RegisterProtoWithUidRsp(uint16(1116), this.UnlockAvatarNotifyDelegate);
        this.ChangeMainAvatarSpecialtyRspDelegate.BindUFunction(this, n"OnChangeMainAvatarSpecialtyRsp");
        this.RegisterProtoWithUidRsp(uint16(1120), this.ChangeMainAvatarSpecialtyRspDelegate);
        this.SwitchMainAvatarGenderNotifyDelegate.BindUFunction(this, n"OnSwitchMainAvatarGenderNotify");
        this.RegisterProtoWithUidRsp(uint16(1123), this.SwitchMainAvatarGenderNotifyDelegate);
        this.AllAvatarFashionNotifyDelegate.BindUFunction(this, n"OnAllAvatarFashionNotify");
        this.RegisterProtoWithUidRsp(uint16(1125), this.AllAvatarFashionNotifyDelegate);
        this.GSDeadNotifyDelegate.BindUFunction(this, n"OnGSDeadNotify");
        this.RegisterProtoRsp(uint16(156), this.GSDeadNotifyDelegate);
        this.AssembleTravelInDsNotifyDelegate.BindUFunction(this, n"OnAssembleTravelInDsNotify");
        this.RegisterProtoWithUidRsp(uint16(175), this.AssembleTravelInDsNotifyDelegate);
        return;
    }
    UFUNCTION()
    bool IsRecordOpened_Implementation() const
    {
        return ::UProtoToolSubsystem::Get().bRecordOpen;
    }
    UFUNCTION()
    bool IsInShowBlacklist_Implementation(const FProtoWrapper &inout ProtoWrapper) const
    {
        if (::UProtoToolSubsystem::Get().CmdIdShowBlackList.Contains(int(ProtoWrapper.CmdId)))
        {
            return true;
        }
        return false;
    }
    UFUNCTION()
    void AddToRecordList_Implementation(const FDateTime &inout RecordTime, const int Direction, const FProtoWrapper &inout ProtoWrapper, const bool bIsBlocked) const
    {
        UProtoToolSubsystem local_4 = ::UProtoToolSubsystem::Get();
        FProtoRecord local_14;
        local_14.TimeStamp = RecordTime;
        local_14.CmdId = int(ProtoWrapper.CmdId);
        local_14.Direction = Direction;
        local_14.Side = 1;
        local_14.bIsBlocked = bIsBlocked;
        local_14.ProtoJsonString = ProtoTool::MessageToJsonString(ProtoWrapper, false);
        local_4.ProtoRecordArray.Add(local_14);
        return;
    }
    UFUNCTION()
    bool IsBlockOpened_Implementation() const
    {
        return ::UProtoToolSubsystem::Get().bBlockOpen;
    }
    UFUNCTION()
    bool IsInBlocklist_Implementation(const FProtoWrapper &inout ProtoWrapper) const
    {
        if (::UProtoToolSubsystem::Get().CmdIdBlockList.Contains(int(ProtoWrapper.CmdId)))
        {
            return true;
        }
        return false;
    }
    UFUNCTION()
    void OnReceivedDSGlobalInfo_Implementation()
    {
        FPbDsGlobalInfo local_10 = this.GetDSGlobalInfo();
        local_10.IsValid();
        ::CommissionUtils::ServerInitCommissionByDSGlobalInfo(local_10.GetCommissionInfo());
        return;
    }
    UFUNCTION()
    void OnPlayerDSInfoInitialized_Implementation(const int Uid)
    {
        if (this.GetPlayerUidToEntityMap().Contains(Uid))
        {
            return;
        }
        AKLGameModeMP local_10 = (Cast<AKLGameModeMP>(Gameplay::GetGameMode(__GetWorldContext())));
        if (local_10 == nullptr)
        {
            return;
        }
        FECSEntity local_14;
        local_10.CreatePlayerControllerEntity(local_14);
        XLog(ELog(33), FString().Append("OnPlayerDSInfoInitialized: CreatePlayerControllerEntity with Uid=").Append(Uid).Append(", Entity=").Append(local_14));
        return;
    }
    uint64 GetDsID() const
    {
        return this.DsID;
    }
    UFUNCTION()
    void OnReceiveErrorCode(const int ErrorCode)
    {
        XError(ELog(27), FString().Append("Error code received ErrorCode=").Append(ErrorCode).Append(", Description=").Append(::FGameConnectionUtils::GetErrorCodeDebugString(ErrorCode)));
        return;
    }
    UFUNCTION()
    void OnReceiveErrorCodeWithUid(const int ErrorCode, const uint Uid)
    {
        XWarning(ELog(27), FString().Append("Error code received ErrorCode=").Append(ErrorCode).Append(" Uid=").Append(Uid).Append(", Description=").Append(::FGameConnectionUtils::GetErrorCodeDebugString(ErrorCode)));
        if (FECSEntity(this.GetPlayerEntityIdByUid(Uid)).IsValid())
        {
            FFPTime local_28 = FFPTime(-1);
            SendEvent local_26;
            local_26.opCall(local_28).ErrorCode = ErrorCode;
        }
        return;
    }
    UFUNCTION()
    void OnGSAddItemRsp(const FProtoWrapper &in ProtoWrapper, const uint Uid)
    {
        int local_107;
        int local_129;
        FPbServerAddItemRsp local_8 = FPbServerAddItemRsp::FromWrapper(ProtoWrapper);
        int local_14 = local_8.GetLatestIndex();
        XLog(ELog(27), FString().Append("RecvPacket OnGSAddItemRsp Uid=").Append(Uid).Append(" Retcode=").Append(local_8.GetRetcode()).Append(" Index=").Append(local_14));
        int local_13 = 0;
        this.AddItemSendRetryCount.FindOrAdd(Uid, local_13) = 0;
        FPbDsPlayerInfo local_36 = this.GetPlayerInfo(Uid);
        if (local_36.IsValid())
        {
            FPbDsPlayerItemCompInfo local_58 = local_36.GetItemCompInfo();
            int local_14_2 = local_58.GetGsItemMsgList_Num();
            int local_59 = local_8.GetLatestIndex();
            int local_61 = local_14_2;
            int local_62 = 0;
            for (; local_62 < local_14_2; ++local_62)
            {
                int local_63 = local_58.GetGsItemMsgList_Index(local_62).GetIndex();
                if (local_63 > local_59)
                {
                    local_61 = local_62;
                    break;
                }
            }
            if (local_61 == local_14_2)
            {
                local_58.ClearGsItemMsgList();
                XLog(ELog(27), FString().Append("OnGSAddItemRsp Uid=").Append(Uid).Append(" ClearGsItemMsgList all ").Append(local_14_2).Append(" acked"));
            }
            else
            {
                if (local_61 > 0)
                {
                    int local_63_2 = local_14_2 - local_61;
                    TArray<uint> local_78;
                    TArray<uint> local_82;
                    TArray<uint> local_86;
                    TArray<uint> local_90;
                    TArray<uint> local_94;
                    int local_95 = local_61;
                    for (; local_95 < local_14_2; ++local_95)
                    {
                        FPbAddItemMsg local_74 = local_58.GetGsItemMsgList_Index(local_95);
                        local_78.Add(local_74.GetIndex());
                        local_82.Add(local_74.GetReason());
                        local_94.Add(local_86.Num());
                        local_107 = 0;
                        for (; local_107 < local_74.GetOpList_Num(); )
                        {
                            FPbAddItemOp local_128 = local_74.GetOpList_Index(local_107);
                            local_86.Add(local_128.GetItemId());
                            local_90.Add(local_128.GetCount());
                            ++local_107;
                        }
                    }
                    local_94.Add(local_86.Num());
                    local_58.ClearGsItemMsgList();
                    local_95 = 0;
                    for (; local_95 < local_63_2; ++local_95)
                    {
                        FPbAddItemMsg local_106 = local_58.AddGsItemMsgList();
                        local_106.SetIndex(local_78[local_95]);
                        local_106.SetReason(local_82[local_95]);
                        local_107 = local_94[local_95];
                        local_62 = local_95 + 1;
                        local_62 = local_94[local_62];
                        local_129 = local_62;
                        int local_130 = local_107;
                        for (; local_130 < local_129; )
                        {
                            FPbAddItemOp local_118 = local_106.AddOpList();
                            local_118.SetItemId(local_86[local_130]);
                            local_118.SetCount(local_90[local_130]);
                            ++local_130;
                        }
                    }
                    XLog(ELog(27), FString().Append("OnGSAddItemRsp Uid=").Append(Uid).Append(" removed ").Append(local_61).Append(" acked, ").Append(local_63_2).Append(" remaining"));
                }
            }
        }
        return;
    }
    UFUNCTION()
    void OnDSAddItemReq(const FProtoWrapper &in ProtoWrapper, const uint Uid)
    {
        FPbServerAddItemReq local_8 = FPbServerAddItemReq::FromWrapper(ProtoWrapper);
        FPbServerAddItemRsp local_12;
        int local_13 = this.DSAddItemMsgIndexMap.FindOrAdd(Uid, 0);
        XLog(ELog(27), FString().Append("RecvPacket OnDSAddItemReq Uid=").Append(Uid).Append(" Retcode=").Append(local_8.GetItemMsgList_Num()).Append(" DSAddItemMsgIndex=").Append(local_13));
        FECSEntity local_30 = FECSEntity(this.GetPlayerEntityIdByUid(Uid));
        if (local_30.IsValid())
        {
            int local_32 = 0;
            for (; local_32 < local_8.GetItemMsgList_Num(); ++local_32)
            {
                FPbAddItemMsg local_52 = local_8.GetItemMsgList_Index(local_32);
                if (local_52.GetIndex() > local_13)
                {
                    local_13 = local_52.GetIndex();
                    int local_53 = 0;
                    for (; local_53 < local_52.GetOpList_Num(); ++local_53)
                    {
                        FPbAddItemOp local_74 = local_52.GetOpList_Index(local_53);
                        XLog(ELog(27), FString().Append("RecvPacket OnDSAddItemReq Uid=").Append(Uid).Append(" ItemMsg=").Append(local_52.GetIndex()).Append(" Op=").Append(local_74.GetItemId()).Append(" ").Append(local_74.GetCount()));
                        int local_126 = ::InventoryUtils::AddInventoryItem(local_30, ::FItemConfig::GetByDataId(local_74.GetItemId()), local_74.GetCount());
                        if (local_126 > 0)
                        {
                            XWarning(ELog(27), FString().Append("RecvPacket OnDSAddItemReq Uid=").Append(Uid).Append(" ItemMsg=").Append(local_52.GetIndex()).Append(" Op=").Append(local_74.GetItemId()).Append(" ").Append(local_74.GetCount()).Append(" RemainItemCount=").Append(local_126).Append(" send mail"));
                        }
                    }
                }
            }
            local_12.SetRetcode(0);
        }
        else
        {
            local_12.SetRetcode(103);
        }
        local_12.SetLatestIndex(local_13);
        this.DSAddItemMsgIndexMap[Uid] = local_13;
        FPbDsPlayerInfo local_146 = this.GetPlayerInfo(Uid);
        if (local_146.IsValid())
        {
            local_146.GetItemCompInfo().SetDsCurItemMsgIndex(local_13);
        }
        this.SendProtoWrapperByPlayerUid(Uid, local_12.ToWrapper());
        return;
    }
    UFUNCTION()
    void OnPlayerTravelDSReq(const FProtoWrapper &in ProtoWrapper, const uint Uid)
    {
        int local_42 = 0;
        FPbPlayerTravelDSReq local_8 = FPbPlayerTravelDSReq::FromWrapper(ProtoWrapper);
        XLog(ELog(27), FString().Append("[KFlow:").Append(Uid).Append("] RecvPacket OnPlayerTravelDSReq DsId=").Append(local_8.GetDsId()).Append(" Uid=").Append(local_8.GetUid()).Append(" NextLevelKey=").Append(local_8.GetNextLevelKey()).Append(" NextDsId=").Append(local_8.GetNextDsId()).Append(" NextDsSessionId=").Append(local_8.GetNextDsSessionId()));
        FPbPlayerTravelDSRsp local_24;
        local_24.SetDsId(this.DsID);
        int local_15 = this.GetPlayerEntityIdByUid(local_8.GetUid());
        FECSEntity local_34 = FECSEntity(local_15);
        if (local_34.IsValid())
        {
            int local_65;
            FPbDsPlayerInfo local_64 = this.GetPlayerInfo(local_42.GetPlayerId());
            local_65 = local_42.GetPlayerId();
            if (local_64.GetUid() == local_65)
            {
                local_24.SetRetcode(0);
                this.SaveDSPlayerInfo(local_34, local_42.GetPlayerId(), true, false);
                local_24.SetDsId(local_8.GetDsId());
                local_24.SetUid(local_65);
                local_24.SetLevelKey(this.DSRegisterLevelKey);
                local_24.SetNextDsId(local_8.GetNextDsId());
                local_24.SetNextDsSessionId(local_8.GetNextDsSessionId());
                local_24.SetNextLevelKey(local_8.GetNextLevelKey());
                local_24.SetNextDsaId(local_8.GetNextDsaId());
                local_24.SetNextDsPid(local_8.GetNextDsPid());
                XLog(ELog(27), FString().Append("Send FPbPlayerTravelDSRsp: DsId=").Append(this.DsID).Append(" Uid=").Append(local_65).Append(" LevelKey=").Append(this.DSRegisterLevelKey).Append(" NextLevelKey=").Append(local_8.GetNextLevelKey()));
                ::FGameConnectionUtils::DisconnectPlayer(local_34, EDisconnectReason(5));
            }
            else
            {
                XWarning(ELog(27), FString().Append("[KFlow:").Append(Uid).Append("] OnPlayerTravelDSReq PlayerInfo.Uid=").Append(local_64.GetUid()).Append(" is not the same as PlayerUid=").Append(local_65));
                local_24.SetRetcode(103);
            }
        }
        else
        {
            XWarning(ELog(27), FString().Append("OnPlayerEnterCommissionNotify PlayerEntityId=").Append(local_15).Append(" is invalid"));
            local_24.SetRetcode(103);
        }
        this.SendProtoWrapperByPlayerUid(local_8.GetUid(), local_24.ToWrapper());
        return;
    }
    UFUNCTION()
    void OnPlayerEnterCommissionNotify(const FProtoWrapper &in ProtoWrapper)
    {
        FPbPlayerEnterCommissionNotify local_8 = FPbPlayerEnterCommissionNotify::FromWrapper(ProtoWrapper);
        XLog(ELog(27), FString().Append("RecvPacket OnPlayerEnterCommissionNotify DsId=").Append(local_8.GetDsId()).Append(" Uid=").Append(local_8.GetUid()).Append(" LevelKey=").Append(local_8.GetLevelKey()));
        int local_16 = this.GetPlayerEntityIdByUid(local_8.GetUid());
        FECSEntity local_26 = FECSEntity(local_16);
        XLog(ELog(27), FString().Append("RecvPacket OnPlayerEnterCommissionNotify DsId=").Append(local_8.GetDsId()).Append(" Uid=").Append(local_8.GetUid()).Append(" LevelKey=").Append(local_8.GetLevelKey()));
        if (local_26.IsValid())
        {
            this.PlayerRequestEnterDS(local_26, local_8.GetLevelKey(), true, 0);
        }
        else
        {
            XWarning(ELog(27), FString().Append("OnPlayerEnterCommissionNotify PlayerEntityId=").Append(local_16).Append(" is invalid"));
        }
        return;
    }
    FString GetPlayerExitReasonStr(const uint Reason)
    {
        if (Reason == 2)
        {
            return "PLAYER_EXIT_GS_DISCONNECT";
        }
        if (Reason == 4)
        {
            return "PLAYER_EXIT_GM_KICK";
        }
        if (Reason == 3)
        {
            return "PLAYER_EXIT_CLOSE_SVR";
        }
        if (Reason == 1)
        {
            return "PLAYER_EXIT_DS_TIMEOUT";
        }
        return "UNKNOWN";
    }
    UFUNCTION()
    void OnKickPlayerDSReq(const FProtoWrapper &in ProtoWrapper, const uint Uid)
    {
        FPbKickPlayerDSReq local_8 = FPbKickPlayerDSReq::FromWrapper(ProtoWrapper);
        int local_10 = this.GetPlayerEntityIdByUid(Uid);
        FECSEntity local_18 = FECSEntity(local_10);
        FString local_26 = this.GetPlayerExitReasonStr(local_8.GetReason());
        XLog(ELog(27), FString().Append("[KFlow:").Append(Uid).Append("] RecvPacket OnKickPlayerDSReq DsId=").Append(local_8.GetDsId()).Append(" Reason=").Append(local_8.GetReason()).Append("(").Append(local_26).Append(")"));
        if (local_18.IsValid())
        {
            if (local_8.GetReason() == 2 || (local_8.GetReason() == 4) || (local_8.GetReason() == 3))
            {
                ::FGameConnectionUtils::DisconnectPlayer(local_18, EDisconnectReason(3));
            }
            else
            {
                if (local_8.GetReason() == 1)
                {
                    FPbDsPlayerInfo local_54 = this.GetPlayerInfo(Uid);
                    if (local_54.IsValid())
                    {
                        int local_31 = local_54.GetDsMiscInfo().GetPlayerMapInfo().GetWorldLevelKey();
                        if (this.IsCityOrBigWorld())
                        {
                            this.PlayerRequestEnterDS(local_18, this.DSRegisterLevelKey, true, 0);
                        }
                        else
                        {
                            if (local_31 > 0)
                            {
                                this.PlayerRequestEnterDS(local_18, local_31, true, 0);
                            }
                            else
                            {
                                ::FGameConnectionUtils::DisconnectPlayer(local_18, EDisconnectReason(3));
                            }
                        }
                    }
                }
                else
                {
                    ::FGameConnectionUtils::DisconnectPlayer(local_18, EDisconnectReason(3));
                }
            }
        }
        else
        {
            XWarning(ELog(27), FString().Append("[KFlow:").Append(Uid).Append("] OnKickPlayerDSReq PlayerEntityId=").Append(local_10).Append(" is invalid"));
            FECSWorldPtr local_88 = ECS::GetECSWorld();
            Get local_92;
            if (local_92.opCall())
            {
                FPbDsPlayerInfo local_44 = this.GetPlayerInfo(Uid);
                if (local_44.IsValid())
                {
                    int local_85_2 = local_44.GetTeamMemberUid_Num();
                    if (local_85_2 <= 1)
                    {
                        XLog(ELog(27), FString().Append("[KFlow:").Append(Uid).Append("] OnKickPlayerDSReq: PlayerEntity invalid, no other players (TeamMemberCount=").Append(local_85_2).Append("), exiting DS"));
                        FPbDSExitRsp local_98;
                        local_98.SetExitReason(4);
                        local_98.SetDsId(this.DsID);
                        this.SendProtoWrapper(local_98.ToWrapper());
                        this.DelayExitDS(3.0f);
                    }
                }
            }
        }
        FPbKickPlayerDSRsp local_110;
        local_110.SetDsId(this.DsID);
        local_110.SetUid(Uid);
        local_110.SetRetcode(0);
        this.SendProtoWrapperByPlayerUid(Uid, local_110.ToWrapper());
        return;
    }
    UFUNCTION()
    void OnDSHeartBeatRsp(const FProtoWrapper &in ProtoWrapper)
    {
        FPbDSHeartbeatRsp local_8 = FPbDSHeartbeatRsp::FromWrapper(ProtoWrapper);
        this.DSHeartbeatRspSeq = local_8.GetSeqNum();
        XLog(ELog(27), FString().Append("RecvPacket DSHeartbeatRsp Callback exec, Retcode=").Append(local_8.GetRetcode()).Append(" Seq:").Append(this.DSHeartbeatRspSeq));
        return;
    }
    UFUNCTION()
    void SaveDSPlayerInfo(const FECSEntity &inout Entity, const int PlayerId, const bool bSendToDBNow = true, const bool bIsLogoutSave = false)
    {
        bool local_6;
        int local_20 = 0;
        XLog(ELog(27), FString().Append("SaveDSPlayerInfo PlayerId=").Append(PlayerId).Append(" bSendToDBNow=").Append(bSendToDBNow).Append(" bIsLogoutSave=").Append(bIsLogoutSave));
        if (!(Entity.IsValid()))
        {
            local_6 = false;
        }
        else
        {
            bool local_13;
            FECSWorldPtr local_8 = Entity.GetWorld();
            Has local_12;
            local_13 = local_12.opCall();
            local_6 = local_13;
        }
        if (local_6)
        {
            FECSWorldPtr local_8_2 = Entity.GetWorld();
            if (int(local_20.GetGameModeType()) != 0)
            {
                XLog(ELog(27), FString().Append("SaveDSPlayerInfo skip PlayerId=").Append(PlayerId).Append(" bPVPGame=true, skip"));
                return;
            }
        }
        if (::FLevelUtils::GetCurrentLevelInfoConfig(nullptr))
        {
            if (0 == 6)
            {
                return;
            }
        }
        FPbDsPlayerInfo local_94 = this.GetPlayerInfo(PlayerId);
        if (local_94.IsValid())
        {
            bool local_13;
            this.SavePlayerAvatarCompInfo(Entity, local_94);
            this.SaveLocation(Entity, local_94);
            this.SavePlayerBuffInfo(Entity, local_94);
            this.SaveLevelObjectStatInfo(Entity, local_94);
            ::InventoryUtils::SaveItemInventory(Entity, bSendToDBNow);
            this.SaveCutSceneInfo(Entity, local_94);
            this.SaveDivineSkillInfo(Entity, local_94);
            ::ObjectiveUtils::SaveObjectiveDSConditionValue(Entity, EConditionUsage(1), local_94);
            ::MissionUtils::SaveMissionTrackInfo(Entity, local_94);
            FECSWorldPtr local_8_3 = ECS::GetECSWorld();
            Get local_100;
            const FCS_CommissionDSGlobalInfo& local_102 = local_100.opCall();
            if (local_102)
            {
                if ((int(local_102.CommissionProgress)) > 0)
                {
                    this.SaveCommissionProgress(Entity, local_94, local_102.CommissionInstId, int(local_102.CommissionProgress));
                }
            }
            if ((local_94.GetAvatarCompInfo().GetCurAvatarId()) != 0)
            {
                local_13 = false;
            }
            else
            {
                int local_116 = local_94.GetAvatarCompInfo().GetSwitchAvatarId();
                local_13 = (local_116 == 0);
            }
            if (local_13)
            {
                return;
            }
            this.SavePlayer(PlayerId, bIsLogoutSave);
        }
        return;
    }
    UFUNCTION()
    void SendServerAddItemReq(const int PlayerId)
    {
        FPbDsPlayerInfo local_20 = this.GetPlayerInfo(PlayerId);
        if (local_20.IsValid())
        {
            FPbDsPlayerItemCompInfo local_42 = local_20.GetItemCompInfo();
            if (local_42.GetGsItemMsgList_Num() > 0)
            {
                int local_46 = this.AddItemSendRetryCount.FindOrAdd(PlayerId, 0);
                if (int(local_46) >= this.AddItemMaxRetryCount)
                {
                    XWarning(ELog(27), FString().Append("SendServerAddItemReq PlayerId=").Append(PlayerId).Append(" GS no response after ").Append(local_46).Append(" retries, clearing GsItemMsgList (count=").Append(local_42.GetGsItemMsgList_Num()).Append(")"));
                    local_42.ClearGsItemMsgList();
                    local_46 = 0;
                    return;
                }
                FPbServerAddItemReq local_58;
                int local_59 = 0;
                for (; local_59 < local_42.GetGsItemMsgList_Num(); )
                {
                    FPbAddItemMsg local_80 = local_42.GetGsItemMsgList_Index(local_59);
                    FPbAddItemMsg local_70 = local_58.AddItemMsgList();
                    local_70.SetIndex(local_80.GetIndex());
                    local_70.SetReason(local_80.GetReason());
                    XLog(ELog(27), FString().Append("SendServerAddItemReq PlayerId=").Append(PlayerId).Append(" AddItemMsg=").Append(local_70.GetIndex()).Append(" Reason=").Append(local_70.GetReason()));
                    int local_92 = 0;
                    FPbAddItemOp local_112 = local_80.GetOpList_Index(local_92);
                    FPbAddItemOp local_102 = local_70.AddOpList();
                    local_102.SetItemId(local_112.GetItemId());
                    local_102.SetCount(local_112.GetCount());
                    ++local_92;
                    int local_91 = local_80.GetOpList_Num();
                    XLog(ELog(27), FString().Append("SendServerAddItemReq PlayerId=").Append(PlayerId).Append(" AddItemMsg=").Append(local_70.GetIndex()).Append(" Num").Append(local_70.GetOpList_Num()));
                    XLog(ELog(27), FString().Append("SendServerAddItemReq PlayerId=").Append(PlayerId).Append(" ItemMsg=").Append(local_80.GetIndex()).Append(" Num").Append(local_80.GetOpList_Num()));
                    ++local_59;
                }
                XLog(ELog(27), FString().Append("SendServerAddItemReq PlayerId=").Append(PlayerId).Append(" Req=").Append(local_42.GetGsItemMsgList_Num()).Append(" "));
                this.SendProtoWrapperByPlayerUid(PlayerId, local_58.ToWrapper());
                ++local_46;
            }
        }
        return;
    }
    uint GetCharacterDataId(const FECSEntity &inout PawnEntity, const UDataTable AvatarConfigTable)
    {
        FName local_4 = ::GetPrefabAvatarName(PawnEntity);
        FAvatarPrefabConfig local_668;
        if (AvatarConfigTable.FindRow(local_4, local_668))
        {
            return int(local_668.DataId);
        }
        return 0;
    }
    UFUNCTION()
    void SavePlayerAvatarCompInfo(const FECSEntity &inout PlayerEntity, FPbDsPlayerInfo &inout PlayerInfo)
    {
        int local_6 = 0;
        int local_14 = 0;
        int local_42 = 0;
        FDSAvatarEquipmentInfo local_132;
        if (PlayerInfo.IsValid())
        {
            int local_43;
            int local_41;
            if (!(local_14))
            {
                XError(ELog(27), FString().Append("Skip SavePlayerAvatarCompInfo for ").Append(local_6.GetPlayerId()).Append(" DSPlayerAvatarInfo is null"));
                return;
            }
            FPbDsPlayerAvatarCompInfo local_30 = PlayerInfo.GetAvatarCompInfo();
            local_41 = 0;
            local_43 = 0;
            if (local_6.GetAllPlayerPawnEntities().Num() > 0)
            {
                TDataObjectPtr<FAvatarPrefabConfig> local_68 = ::GetAvatarConfig(local_6.GetAllPlayerPawnEntities()[0]);
                local_41 = local_42;
                if (local_41 != 0)
                {
                    local_30.SetCurAvatarId(local_41);
                    XLog(ELog(27), FString().Append("SavePlayerAvatarCompInfo PlayerId=").Append(local_6.GetPlayerId()).Append(" SetCurAvatarId=").Append(local_41));
                }
                else
                {
                    XWarning(ELog(27), FString().Append("SavePlayerAvatarCompInfo PlayerId=").Append(local_6.GetPlayerId()).Append(" skip CurAvatarId write: pawn avatar config unresolved, keep persisted CurAvatarId"));
                }
            }
            else
            {
                XWarning(ELog(27), FString().Append("SavePlayerAvatarCompInfo PlayerId=").Append(local_6.GetPlayerId()).Append(" skip CurAvatarId write: no pawn spawned yet, keep persisted CurAvatarId"));
            }
            if (local_6.GetAllPlayerPawnEntities().Num() > 1)
            {
                TDataObjectPtr<FAvatarPrefabConfig> local_68_2 = ::GetAvatarConfig(local_6.GetAllPlayerPawnEntities()[1]);
                local_43 = local_42;
                local_30.SetSwitchAvatarId(local_43);
                XLog(ELog(27), FString().Append("SavePlayerAvatarCompInfo PlayerId=").Append(local_6.GetPlayerId()).Append(" SetSwitchAvatarId=").Append(local_43));
            }
            local_30.ClearAvatarList();
            for (auto& local_82 : local_14.GetAvatarList())
            {
                FPbAvatar local_92 = local_30.AddAvatarList();
                local_92.SetAvatarId(local_82.GetAvatarId());
                local_82.GetEquipmentInfos().Find(EEquipSlotType(1), local_132);
                local_92.SetCurWeaponGuid(local_132.GetGuid());
                XLog(ELog(27), FString().Append("SavePlayerAvatarCompInfo PlayerId=").Append(local_6.GetPlayerId()).Append(" AddAvatarList AvatarId=").Append(local_82.GetAvatarId()).Append(" CurWeaponGuid=").Append(local_132.GetGuid()));
            }
        }
        return;
    }
    bool IsCityOrBigWorld()
    {
        int local_9;
        int local_10 = 0;
        AAS_ECSWorldSettings local_2 = (Cast<AAS_ECSWorldSettings>(this.GetWorld().GetWorldSettings()));
        if (local_2 != nullptr)
        {
            if (local_2.LevelInfoConfig)
            {
                if (local_10 == 1)
                {
                    local_9 = 1;
                }
                else
                {
                    bool local_13 = (local_10 == 2);
                    local_9 = local_13;
                }
                return (local_9 != 0);
            }
        }
        return false;
    }
    void SaveLocation(const FECSEntity &inout Entity, FPbDsPlayerInfo &inout PlayerInfo)
    {
        bool local_1;
        int local_30 = 0;
        if (!(this.IsCityOrBigWorld()))
        {
            return;
        }
        if (PlayerInfo.IsValid())
        {
            if (!(::FASCommonUtils::GetControlledPawnEntity(Entity).IsValid()))
            {
                local_1 = false;
            }
            else
            {
                Has local_14;
                local_1 = local_14.opCall();
            }
            if (local_1)
            {
                if (this.DSRegisterLevelKey > 0)
                {
                    FVector local_24(FVector::ZeroVector);
                    Get local_34;
                    const FC_LastValidNavGround& local_36 = local_34.opCall();
                    if (local_36)
                    {
                        local_24 = local_36.GetLastNavGroundPosition();
                    }
                    else
                    {
                        XWarning(ELog(27), FString().Append("SaveLocation PlayerId=").Append(PlayerInfo.GetUid()).Append(" saving ZeroVector (invalid sentinel) because no FC_LastValidNavGround, CurrentLocation=").Append(local_30.GetPosition()).Append(" LevelKey=").Append(this.DSRegisterLevelKey));
                    }
                    FPbPlayerMapInfo local_62 = PlayerInfo.GetDsMiscInfo().GetPlayerMapInfo();
                    local_62.SetWorldLevelKey(this.DSRegisterLevelKey);
                    local_62.SetWorldLocationX(int(local_24.X));
                    local_62.SetWorldLocationY(int(local_24.Y));
                    local_62.SetWorldLocationZ(int(local_24.Z));
                    local_62.SetWorldDirection(int(local_30.GetRotation().Rotator().Yaw));
                    XLog(ELog(27), FString().Append("SaveLocation PlayerId=").Append(PlayerInfo.GetUid()).Append(" Location=").Append(local_24).Append(" LevelKey=").Append(this.DSRegisterLevelKey));
                }
            }
        }
        return;
    }
    void SavePlayerBuffInfo(const FECSEntity &inout PlayerEntity, FPbDsPlayerInfo &inout PlayerInfo)
    {
        int local_6 = 0;
        int local_22 = 0;
        int local_57 = 0;
        int local_91;
        if (!(PlayerInfo.IsValid()) || (local_6.GetAllPlayerPawnEntities().Num() == 0))
        {
            XWarning(ELog(27), FString().Append("SavePlayerBuffInfo PlayerId=").Append(local_6.GetPlayerId()).Append(" skip: player not ready (no pawn), keep persisted buffs"));
            return;
        }
        PlayerInfo.ClearBuffList();
        PlayerInfo.ClearNewBuffList();
        PlayerInfo.ClearMetaBuffCapList();
        if (local_22)
        {
            for (auto& local_36 : local_22.GetMetaBuffs())
            {
                if (local_36.GetMetaBuffConfig())
                {
                    FPbUint32Pair local_46 = PlayerInfo.AddBuffList();
                    local_46.SetFirst(local_57);
                    local_57 = local_36.GetStartTime();
                    local_46.SetSecond(local_57);
                    FPbUint32ListPair local_68 = PlayerInfo.AddNewBuffList();
                    local_68.SetKey(local_57);
                    auto local_84 = local_36.GetModifiersDataIDs().Iterator();
                    for (; local_84.CanProceed;)
                    {
                        local_57 = local_84.Proceed();
                        local_91 = local_57;
                        local_68.AddValues(local_91);
                    }
                    FPbUint32ListPair local_78 = PlayerInfo.AddMetaBuffCapList();
                    local_78.SetKey(local_57);
                    auto local_90 = local_36.GetCapabilitiesConfigs().Iterator();
                    for (; local_90.CanProceed;)
                    {
                        local_78.AddValues(local_90.Proceed());
                    }
                    local_57 = local_36.GetStartTime();
                    int local_9 = local_6.GetPlayerId();
                    FString local_14 = FString();
                }
            }
        }
        return;
    }
    void SaveCutSceneInfo(const FECSEntity &inout PlayerEntity, FPbDsPlayerInfo &inout PlayerInfo)
    {
        int local_29 = 0;
        if (PlayerInfo.IsValid())
        {
            FPbDSMiscInfo local_12 = PlayerInfo.GetDsMiscInfo();
            Get local_26;
            const FC_CutSceneLogicData& local_28 = local_26.opCall();
            if (local_28)
            {
                local_12.SetCutsceneDataKey(local_29);
                local_12.SetCutsceneStartTime((FDateTime::UtcNow().ToUnixTimestamp() - uint((float32((FFPTime(ECS::GetContextTime()) - local_28.GetStartTime()).ToSeconds()) + 0.5f))));
                if ((!((local_28.GetPlayerTag() == NAME_None))))
                {
                    local_12.SetCutscenePlayerTag(local_28.GetPlayerTag().ToString());
                }
                else
                {
                    local_12.SetCutscenePlayerTag("");
                }
            }
            else
            {
                local_12.SetCutsceneDataKey(0);
                local_12.SetCutsceneStartTime(0);
                local_12.SetCutscenePlayerTag("");
            }
        }
        return;
    }
    void SaveCommissionProgress(const FECSEntity &inout PlayerEntity, FPbDsPlayerInfo &inout PlayerInfo, const uint64 CommissionInstId, const int CommissionProgress)
    {
        if (PlayerInfo.IsValid())
        {
            FPbSaveCommissionProgressReq local_6;
            local_6.SetCommissionInstId(CommissionInstId);
            local_6.SetProgress(CommissionProgress);
            XLog(ELog(27), FString().Append("SaveCommissionProgress PlayerEntity=").Append(PlayerEntity).Append(" Uid=").Append(PlayerInfo.GetUid()).Append(" CommissionInstId=").Append(CommissionInstId).Append(" Progress=").Append(CommissionProgress));
            this.SendProtoWrapperByPlayerUid(PlayerInfo.GetUid(), local_6.ToWrapper());
        }
        return;
    }
    UFUNCTION()
    void LoadCutSceneInfo(const FECSEntity &inout PlayerEntity, FPbDsPlayerInfo &inout PlayerInfo)
    {
        int local_92 = 0;
        ULevelSequence local_144;
        float32 local_146;
        int local_156 = 0;
        if (PlayerInfo.IsValid())
        {
            FPbDSMiscInfo local_12 = PlayerInfo.GetDsMiscInfo();
            int local_23 = local_12.GetCutsceneDataKey();
            if (local_23 > 0)
            {
                FDataObjectPtr local_62;
                int local_23_2 = local_12.GetCutsceneDataKey();
                XLog(ELog(27), FString().Append("LoadCutSceneInfo valid cutscene data PlayerEntity=").Append(PlayerEntity).Append(" Uid=").Append(PlayerInfo.GetUid()).Append(" CutSceneDataKey=").Append(local_23_2));
                int local_24 = local_12.GetCutsceneDataKey();
                int local_23_3 = local_12.GetCutsceneStartTime();
                FString local_28 = local_12.GetCutscenePlayerTag();
                if (local_62.IsValid())
                {
                    FCutSceneEntityInfo local_170;
                    local_92.SetCutSceneData(TDataObjectPtr<FCutSceneData>());
                    FFPTime local_118 = FFPTime(ECS::GetContextTime());
                    int local_31 = FDateTime::UtcNow().ToUnixTimestamp();
                    local_92.SetStartTime((local_118 - FFPTime((local_31 - local_23_3))));
                    FSoftObjectPath local_138;
                    local_144 = (Cast<ULevelSequence>(local_138.TryLoad()));
                    if (local_144 != nullptr)
                    {
                        local_146 = local_144.GetDuration();
                    }
                    else
                    {
                        local_146 = 0.0f;
                    }
                    local_92.SetDuration(FFPTime(local_146));
                    local_92.SetbPrevTeleported(false);
                    local_92.SetbCrossDS(true);
                    if (!(local_28.IsEmpty()))
                    {
                        local_92.SetPlayerTag(FName(local_28));
                    }
                    FName local_150 = local_92.GetPlayerTag();
                    if (::UTagTargetPointManager::Get().GetTagTransform(local_170.EndLocationTag).IsSet())
                    {
                        FRotator local_240;
                        FVector local_234;
                        local_234.GetLocation();
                        local_156.Location = local_234;
                        local_240.Rotator();
                        local_156.Rotation = local_240;
                    }
                    XLog(ELog(27), FString().Append("LoadCutSceneInfo valid cutscene data PlayerEntity=").Append(PlayerEntity).Append(" Uid=").Append(PlayerInfo.GetUid()).Append(" PlayerTag=").Append(local_92.GetPlayerTag()).Append(", spawn point=").Append(local_156.Location));
                }
                local_12.SetCutsceneDataKey(0);
                local_12.SetCutsceneStartTime(0);
            }
        }
        return;
    }
    TDataObjectPtr<FDivineSkillConfig> GetValidatedDivineSkill(const TDataObjectPtr<FDivineSkillConfig> &inout RequestedSkill)
    {
        const UAvatarBuildSettings local_14;
        FName local_4 = ::FGameModeUtils::GetDivineSkillDisplayTag();
        if ((!((local_4 == NAME_None))))
        {
            EDivineSkillType local_7 = ::DivineSkillUtils::FilterTagToDivineSkillType(local_4);
            if ((RequestedSkill == nullptr) || (int(RequestedSkill.opArrow().DivineSkillType) != int(local_7)))
            {
                GetGameplaySettings<UAvatarBuildSettings> local_16;
                local_14 = local_16;
                if (local_14 != nullptr && local_14.SwordSpecialtyDivineSkillConfig.IsSet())
                {
                    return local_14.SwordSpecialtyDivineSkillConfig;
                }
            }
        }
        return RequestedSkill;
    }
    TDataObjectPtr<FDivineSkillConfig> TryGetPvpDivineSkillByAvatarId(FPbDsPlayerInfo &inout PlayerInfo, const uint AvatarId)
    {
        if (!(PlayerInfo.IsValid()))
        {
            return TDataObjectPtr<FDivineSkillConfig>(nullptr);
        }
        int local_51 = 0;
        for (; local_51 < PlayerInfo.GetAvatarCompInfo().GetPvpAvatarConfigList_Num(); ++local_51)
        {
            FPbPvpAvatarConfigBin local_74 = PlayerInfo.GetAvatarCompInfo().GetPvpAvatarConfigList_Index(local_51);
            if (local_74.GetAvatarId() != AvatarId)
            {
                continue;
            }
            int local_63 = local_74.GetDivineSkillId();
            GetDataObjectByGSDataId<FDivineSkillConfig> local_108;
            return this.GetValidatedDivineSkill(local_108.opImplConv());
        }
        return (TDataObjectPtr<FDivineSkillConfig>(nullptr));
    }
    UFUNCTION()
    void LoadDivineSkillInfo(const FECSEntity &inout PlayerEntity, FPbDsPlayerInfo &inout PlayerInfo)
    {
        FDivineSkillData local_24;
        int local_32 = 0;
        FECSWorldPtr local_26 = PlayerEntity.GetWorld();
        if (local_32 && (int(local_32.GetGameModeType()) != 0))
        {
            int local_46;
            bool local_45;
            if (int(local_32.GetGameModeType()) == 1 && (int(::PVXGameModeUtils::GetPVXCampFromMatchData(PlayerEntity)) == 6))
            {
                XLog(ELog(27), FString().Append("[PVXTEST] LoadDivineSkillInfo PlayerEntity=").Append(PlayerInfo.GetMainAvatarSpecialty()).Append(" is boss, return"));
                return;
            }
            local_45 = false;
            local_46 = PlayerInfo.GetMainAvatarSpecialty();
            TDataObjectPtr<FDivineSkillConfig> local_70 = this.TryGetPvpDivineSkillByAvatarId(PlayerInfo, local_46);
            if (local_70)
            {
                local_24.SetSkillConfig(local_70);
                local_45 = true;
                XLog(ELog(27), FString().Append("[PVXTEST] LoadDivineSkillInfo PlayerEntity=").Append(local_46).Append(" DivineSkillData.SkillConfig=").Append(local_24.GetSkillConfig().GetDataName()));
            }
            if (!(local_45))
            {
                int local_43 = PlayerInfo.GetAvatarCompInfo().GetCurDivineSkill().GetDivineSkillId();
                GetDataObjectByGSDataId<FDivineSkillConfig> local_140;
                local_24.SetSkillConfig(this.GetValidatedDivineSkill(local_140.opImplConv()));
            }
        }
        else
        {
            int local_43_2 = PlayerInfo.GetAvatarCompInfo().GetCurDivineSkill().GetDivineSkillId();
            GetDataObjectByGSDataId<FDivineSkillConfig> local_164;
            local_24.SetSkillConfig(this.GetValidatedDivineSkill(local_164.opImplConv()));
        }
        FFPTime local_194 = FFPTime(-1);
        return;
    }
    UFUNCTION()
    void SaveDivineSkillInfo(const FECSEntity &inout PlayerEntity, FPbDsPlayerInfo &inout PlayerInfo)
    {
        if (PlayerInfo.IsValid())
        {
            Get local_6;
            const FC_DivineSkill& local_8 = local_6.opCall();
            if (local_8)
            {
                if (local_8.GetDivineSkillData())
                {
                    PlayerInfo.GetAvatarCompInfo().GetCurDivineSkill().SetDivineSkillId(local_8.GetDivineSkillData().GetSkillConfig().opArrow().DataId);
                }
            }
        }
        return;
    }
    UFUNCTION()
    void LoadTalentInfo(const FECSEntity &inout PlayerEntity, FPbDsPlayerInfo &inout PlayerInfo)
    {
        int local_12 = 0;
        TArray<uint> local_16;
        PlayerInfo.GetAvatarCompInfo().GetAvatarUnlockedTalentList(local_16);
        auto local_32 = local_16.Iterator();
        for (; local_32.CanProceed;)
        {
            int local_41 = local_32.Proceed();
            GetDataObjectByGSDataId<FTalentConfig> local_90;
            TDataObjectPtr<FTalentConfig> local_66 = local_90.opImplConv();
            local_12.GetModify_UnlockTalentList().Add(local_66);
        }
        return;
    }
    void LoadLevelObjectStatInfo(const FECSEntity &inout PlayerEntity, FPbDsPlayerInfo &inout PlayerInfo)
    {
        int local_8 = 0;
        if (!(PlayerInfo.IsValid()))
        {
            return;
        }
        local_8.GetModify_TeleporterDataIds().Empty(0);
        local_8.GetModify_UnlockedTeleporterDataIds().Empty(0);
        local_8.GetModify_LevelObjectStatInfoList().Empty(0);
        FPbDSObjectStatInfo local_20 = PlayerInfo.GetDsObjectStatInfo();
        TArray<uint> local_34;
        local_20.GetTeleportIdList(local_34);
        local_8.GetModify_TeleporterDataIds().Append(local_34);
        TArray<uint> local_38;
        local_20.GetUnlockedTeleportIdList(local_38);
        local_8.GetModify_UnlockedTeleporterDataIds().Append(local_38);
        XLog(ELog(27), FString().Append("LoadLevelObjectStatInfo UnlockedTeleporterNum=").Append(local_38.Num()));
        int local_44 = 0;
        for (; local_44 < local_38.Num(); )
        {
            XLog(ELog(27), FString().Append("  UnlockedTeleportId[").Append(local_44).Append("]=").Append(local_38[local_44]));
            ++local_44;
        }
        int local_46 = 0;
        for (; local_46 < local_20.GetLevelObjectStatInfoList_Num(); )
        {
            FPbDSLevelObjectStatInfo local_58 = local_20.GetLevelObjectStatInfoList_Index(local_46);
            FLevelObjectStatInfo local_86;
            local_86.SetMapConfigId(local_58.GetMapConfigId());
            local_58.GetPortalIdList(local_86.GetModify_PortalIdList());
            local_58.GetOculusIdList(local_86.GetModify_OculusIdList());
            local_58.GetCollectionPrefabList(local_86.GetModify_CollectionPrefabList());
            XLog(ELog(27), FString().Append("LoadLevelObjectStatInfo CollectionPrefabNum=").Append(local_86.GetCollectionPrefabList().Num()));
            int local_87 = 0;
            FPbTreasureBoxInfo local_98 = local_58.GetTreasureBoxList_Index(local_87);
            FTreasureBoxInfo local_112;
            local_112.SetTreasureBoxId(local_98.GetTreasureBoxId());
            local_112.SetTreasureBoxTime(local_98.GetTreasureBoxTime());
            local_112.SetTreasureBoxState(local_98.GetTreasureBoxState());
            local_86.GetModify_TreasureBoxList().Add(local_112);
            ++local_87;
            int local_88 = local_58.GetTreasureBoxList_Num();
            local_8.GetModify_LevelObjectStatInfoList().Add(local_86);
            ++local_46;
        }
        XLog(ELog(27), FString().Append("LoadLevelObjectStatInfo PlayerEntity=").Append(PlayerEntity).Append(" Uid=").Append(PlayerInfo.GetUid()).Append(" TeleporterNum=").Append(local_8.GetTeleporterDataIds().Num()).Append(" LevelStatNum=").Append(local_8.GetLevelObjectStatInfoList().Num()));
        return;
    }
    void SaveLevelObjectStatInfo(const FECSEntity &inout PlayerEntity, FPbDsPlayerInfo &inout PlayerInfo)
    {
        int local_38 = 0;
        if (!(PlayerInfo.IsValid()))
        {
            return;
        }
        Has local_6;
        if (!(local_6.opCall()))
        {
            XLog(ELog(27), FString().Append("SaveLevelObjectStatInfo skip for PlayerEntity=").Append(PlayerEntity).Append(" Uid=").Append(PlayerInfo.GetUid()).Append(" because FC_PlayerLevelObjectStat is missing"));
            return;
        }
        FPbDSObjectStatInfo local_22 = PlayerInfo.GetDsObjectStatInfo();
        local_22.ClearTeleportIdList();
        local_22.ClearUnlockedTeleportIdList();
        local_22.ClearLevelObjectStatInfoList();
        auto local_44 = local_38.GetTeleporterDataIds().Iterator();
        for (; local_44.CanProceed;)
        {
            local_22.AddTeleportIdList(local_44.Proceed());
        }
        auto local_50 = local_38.GetUnlockedTeleporterDataIds().Iterator();
        for (; local_50.CanProceed;)
        {
            local_22.AddUnlockedTeleportIdList(local_50.Proceed());
        }
        for (auto& local_66 : local_38.GetLevelObjectStatInfoList())
        {
            FPbDSLevelObjectStatInfo local_76 = local_22.AddLevelObjectStatInfoList();
            local_76.SetMapConfigId(local_66.GetMapConfigId());
            auto local_44_2 = local_66.GetPortalIdList().Iterator();
            for (; local_44_2.CanProceed;)
            {
                local_76.AddPortalIdList(local_44_2.Proceed());
            }
            auto local_50_2 = local_66.GetOculusIdList().Iterator();
            for (; local_50_2.CanProceed;)
            {
                local_76.AddOculusIdList(local_50_2.Proceed());
            }
            local_44_2 = local_66.GetCollectionPrefabList().Iterator();
            for (; local_44_2.CanProceed;)
            {
                local_76.AddCollectionPrefabList(local_44_2.Proceed());
            }
            for (auto& local_100 : local_66.GetTreasureBoxList())
            {
                FPbTreasureBoxInfo local_110 = local_76.AddTreasureBoxList();
                local_110.SetTreasureBoxId(local_100.GetTreasureBoxId());
                local_110.SetTreasureBoxTime(local_100.GetTreasureBoxTime());
                local_110.SetTreasureBoxState(local_100.GetTreasureBoxState());
            }
        }
        XLog(ELog(27), FString().Append("SaveLevelObjectStatInfo PlayerEntity=").Append(PlayerEntity).Append(" Uid=").Append(PlayerInfo.GetUid()).Append(" TeleporterNum=").Append(local_38.GetTeleporterDataIds().Num()).Append(" UnlockedTeleporterNum=").Append(local_38.GetUnlockedTeleporterDataIds().Num()).Append(" LevelStatNum=").Append(local_38.GetLevelObjectStatInfoList().Num()));
        FPbDSObjectStatInfo local_32 = PlayerInfo.GetDsObjectStatInfo();
        XLog(ELog(27), FString().Append("  TeleportIdList Num=").Append(local_32.GetTeleportIdList_Num()));
        int local_51 = 0;
        for (; local_51 < local_32.GetTeleportIdList_Num(); )
        {
            XLog(ELog(27), FString().Append("    TeleportId[").Append(local_51).Append("]=").Append(local_32.GetTeleportIdList_Index(local_51)));
            ++local_51;
        }
        XLog(ELog(27), FString().Append("  UnlockedTeleportIdList Num=").Append(local_32.GetUnlockedTeleportIdList_Num()));
        int local_51_2 = 0;
        for (; local_51_2 < local_32.GetUnlockedTeleportIdList_Num(); )
        {
            XLog(ELog(27), FString().Append("    UnlockedTeleportId[").Append(local_51_2).Append("]=").Append(local_32.GetUnlockedTeleportIdList_Index(local_51_2)));
            ++local_51_2;
        }
        XLog(ELog(27), FString().Append("  LevelObjectStatInfoList Num=").Append(local_32.GetLevelObjectStatInfoList_Num()));
        int local_51_3 = 0;
        for (; local_51_3 < local_32.GetLevelObjectStatInfoList_Num(); ++local_51_3)
        {
            FPbDSLevelObjectStatInfo local_86 = local_32.GetLevelObjectStatInfoList_Index(local_51_3);
            XLog(ELog(27), FString().Append("    Level[").Append(local_51_3).Append("] LevelId=").Append(local_86.GetMapConfigId()).Append(" PortalNum=").Append(local_86.GetPortalIdList_Num()).Append(" OculusNum=").Append(local_86.GetOculusIdList_Num()).Append(" CollectionPrefabNum=").Append(local_86.GetCollectionPrefabList_Num()).Append(" TreasureNum=").Append(local_86.GetTreasureBoxList_Num()));
            int local_140 = 0;
            for (; local_140 < local_86.GetPortalIdList_Num(); )
            {
                XLog(ELog(27), FString().Append("      PortalId[").Append(local_140).Append("]=").Append(local_86.GetPortalIdList_Index(local_140)));
                ++local_140;
            }
            local_140 = 0;
            for (; local_140 < local_86.GetOculusIdList_Num(); )
            {
                XLog(ELog(27), FString().Append("      OculusId[").Append(local_140).Append("]=").Append(local_86.GetOculusIdList_Index(local_140)));
                ++local_140;
            }
            local_140 = 0;
            for (; local_140 < local_86.GetCollectionPrefabList_Num(); )
            {
                XLog(ELog(27), FString().Append("      CollectionPrefabId[").Append(local_140).Append("]=").Append(local_86.GetCollectionPrefabList_Index(local_140)));
                ++local_140;
            }
            local_140 = 0;
            for (; local_140 < local_86.GetTreasureBoxList_Num(); )
            {
                FPbTreasureBoxInfo local_120 = local_86.GetTreasureBoxList_Index(local_140);
                XLog(ELog(27), FString().Append("      TreasureBox[").Append(local_140).Append("] Id=").Append(local_120.GetTreasureBoxId()).Append(" Time=").Append(local_120.GetTreasureBoxTime()).Append(" State=").Append(local_120.GetTreasureBoxState()));
                ++local_140;
            }
        }
        return;
    }
    UFUNCTION()
    void SaveAllPlayer()
    {
        int local_49 = 0;
        TMap<uint, uint> local_20 = this.GetPlayerUidToEntityMap();
        for (auto& local_40 : local_20)
        {
            this.SaveDSPlayerInfo(FECSEntity(local_49), local_40.GetKey(), true, false);
        }
        return;
    }
    UFUNCTION()
    void CheckEmptyDS()
    {
        this.CheckEmptyDSEventId = 0;
        int local_2 = FGameUtils::GetAllPlayerControllerEntities(true).Num();
        XLog(ELog(27), FString().Append("checking empty ds ds_id=").Append(this.DsID).Append(", player_count=").Append(this.GetPlayerConnectionNum()).Append(" player_entity_count=").Append(local_2));
        if (local_2 == 0)
        {
            XLog(ELog(27), FString().Append("[uinitSvr] save player ds_id=").Append(this.DsID));
            this.SaveAllPlayer();
            FPbDSExitRsp local_18;
            local_18.SetExitReason(4);
            local_18.SetDsId(this.DsID);
            this.SendProtoWrapper(local_18.ToWrapper());
            XLog(ELog(27), FString().Append("[uinitSvr] destroy ds empty 60s later ds_id=").Append(this.DsID).Append(" "));
            this.DelayExitDS(60.0f);
        }
        return;
    }
    UFUNCTION()
    void CheckAddItem()
    {
        TMap<uint, uint> local_20 = this.GetPlayerUidToEntityMap();
        for (auto& local_40 : local_20)
        {
            this.SendServerAddItemReq(local_40.GetKey());
        }
        return;
    }
    UFUNCTION()
    void DSHeartBeat()
    {
        this.CheckDSRegister(this.DSRegisterLevelKey, this.DSRegisterLevelType);
        if (!(this.IsConnectedToGameServer()))
        {
            return;
        }
        int local_5 = this.GetPlayerConnectionNum();
        int local_4 = FGameUtils::GetAllPlayerControllerEntities(true).Num();
        FPbDSHeartbeatReq local_14;
        local_14.SetDsId(this.DsID);
        local_14.SetPid(int(this.ProcessID));
        ++this.DSHeartbeatSeq;
        local_14.SetSeqNum(this.DSHeartbeatSeq);
        local_14.SetPlayerCount(local_5);
        local_14.SetStartType(int(this.StartType));
        this.SendProtoWrapper(local_14.ToWrapper());
        if (int(::FGameModeUtils::GetGameStageType()) > 1)
        {
            if (!(this.IsCityOrBigWorld()))
            {
                if (local_4 == 0 && (this.CheckEmptyDSEventId == 0))
                {
                    FFPTime local_32 = (ECS::GetContextTime() + FFPTime(60));
                    FECSWorldPtr local_36 = ECS::GetECSWorld();
                    FCE_CheckEmptyDS local_42;
                    this.CheckEmptyDSEventId = int(local_42._base_FECSEvent);
                }
            }
        }
        if ((this.DSHeartbeatSeq - this.DSHeartbeatRspSeq) > 6)
        {
            XWarning(ELog(27), FString().Append("RecvPacket DSHeartbeatRsp local DSHeartbeatSeq ").Append(this.DSHeartbeatSeq).Append(", ").Append(this.DSHeartbeatRspSeq));
            this.DisconnectAllPlayers(true);
            this.DelayExitDS(20.0f);
        }
        return;
    }
    void DelayExitDS(const float32 DelayTime)
    {
        if (!(System::TimerExistsHandle(__GetWorldContext(), this.ExitDSTimerHandle)))
        {
            this.ExitDSTimerHandle = System::SetTimer(this, n"ExitDSTimerCallback", DelayTime, false, false, 0.0f, 0.0f);
        }
        return;
    }
    UFUNCTION()
    void ExitDSTimerCallback()
    {
        XLog(ELog(27), FString().Append("ExitDSTimerCallback call ExitDS"));
        this.ExitDS();
        return;
    }
    UFUNCTION()
    void PlayerLogout(const uint PlayerUid, const uint Reason)
    {
        XLog(ELog(27), FString().Append("PlayerLogout PlayerUid=").Append(PlayerUid));
        FPbPlayerLogoutReq local_10;
        local_10.SetReason(Reason);
        this.SendProtoWrapperByPlayerUid(PlayerUid, local_10.ToWrapper());
        return;
    }
    UFUNCTION()
    void PlayerLeaveDSNotify(const FECSEntity &inout PlayerEntity)
    {
        int local_6 = 0;
        FPbPlayerLeaveDSNotify local_10;
        local_10.SetDsId(this.DsID);
        local_10.SetUid(local_6.GetPlayerId());
        local_10.SetLevelKey(this.DSRegisterLevelKey);
        XLog(ELog(27), FString().Append("PlayerLeaveDSNotify PlayerEntity=").Append(PlayerEntity).Append(" PlayerId=").Append(local_6.GetPlayerId()));
        this.SendProtoWrapper(local_10.ToWrapper());
        return;
    }
    UFUNCTION()
    bool PlayerRequestEnterDS(const FECSEntity &inout PlayerEntity, const uint RequestLevelKey, const bool bCanEnterSameLevel = false, const uint TeleporterDataId = 0)
    {
        int local_28 = 0;
        int local_51;
        if ((RequestLevelKey == this.DSRegisterLevelKey && !(bCanEnterSameLevel)))
        {
            XWarning(ELog(27), (((FString("PlayerRequestEnterDS LevelKey is same as DSRegisterLevelKey") + RequestLevelKey) + " PlayerEntity=") + PlayerEntity));
            return false;
        }
        Has local_18;
        bool local_2 = local_18.opCall();
        if (local_2)
        {
            Get local_22;
            XWarning(ELog(27), FString().Append("PlayerRequestEnterDS ").Append(RequestLevelKey).Append(" refused: PlayerEntity ").Append(PlayerEntity).Append(" has FC_PlayerPendingChangeLevel: ").Append(local_22.opCall().GetLevelKey()));
            return false;
        }
        FPbDsPlayerInfo local_50 = this.GetPlayerInfo(local_28.GetPlayerId());
        local_51 = local_28.GetPlayerId();
        if (local_50.GetUid() == local_51)
        {
            if (TeleporterDataId > 0)
            {
                local_50.GetDsMiscInfo().SetTeleportKey(TeleporterDataId);
                XLog(ELog(27), FString().Append("[TeleportDiag][CrossDS] PlayerRequestEnterDS stash TeleportKey=").Append(TeleporterDataId).Append(" Uid=").Append(local_51).Append(" RequestLevelKey=").Append(RequestLevelKey));
            }
            this.SaveDSPlayerInfo(PlayerEntity, local_28.GetPlayerId(), true, false);
            FPbPlayerEnterDSReq local_66;
            local_66.SetDsId(this.DsID);
            int local_1 = this.GetPlayerGSAppId(local_51);
            local_66.SetGsAppId(local_1);
            local_66.SetUid(local_51);
            local_66.SetLevelKey(RequestLevelKey);
            XLog(ELog(27), FString().Append("Send FPbPlayerEnterDSReq: DsId=").Append(this.DsID).Append(" GsAppId=").Append(local_1).Append(" Uid=").Append(local_51).Append(" LevelKey=").Append(RequestLevelKey));
            this.SendProtoWrapperByPlayerUid(local_51, local_66.ToWrapper());
        }
        return true;
    }
    UFUNCTION()
    void OnPlayerEnterDSRsp(const FProtoWrapper &in ProtoWrapper)
    {
        FPbPlayerEnterDSRsp local_8 = FPbPlayerEnterDSRsp::FromWrapper(ProtoWrapper);
        int local_11 = this.GetPlayerEntityIdByUid(local_8.GetUid());
        FECSEntity local_20 = FECSEntity(local_11);
        XLog(ELog(27), FString().Append("Receive OnPlayerEnterDSRsp PlayerEntityId=").Append(local_11).Append(" Retcode=").Append(local_8.GetRetcode()));
        if (!(local_20.IsValid()))
        {
            XWarning(ELog(27), FString().Append("OnPlayerEnterDSRsp PlayerEntityId=").Append(local_11).Append(" is invalid"));
            return;
        }
        if (local_8.GetRetcode() != 0)
        {
            SendEvent local_32;
            local_32.opCall(FFPTime(local_8.GetRetcode()));
        }
        return;
    }
    UFUNCTION()
    void FinishCommission(const FECSEntity &inout PlayerEntity, const bool bSuccess)
    {
        int local_18 = 0;
        int local_19;
        int local_30 = 0;
        Has local_4;
        bool local_5 = local_4.opCall();
        if (local_5)
        {
            return;
        }
        Assign local_10;
        FC_PlayerFinishCommissionTag local_12;
        local_10.opCall(local_12);
        local_19 = local_18.GetPlayerId();
        if (local_19 > 0)
        {
            FECSWorldPtr local_24 = ECS::GetECSWorld();
            if (local_24.IsValid())
            {
                int local_42;
                int local_41;
                int local_40;
                FECSWorldPtr local_24_2 = ECS::GetECSWorld();
                if (local_30 && (int(local_30.GetGameModeType()) == 1))
                {
                    XLog(ELog(27), FString().Append("FinishCommission skip FPbFinishCommissionReq in PVX, PlayerUid=").Append(local_19).Append(", bSuccess=").Append(bSuccess));
                    return;
                }
                local_40 = 2;
                local_41 = 0;
                local_42 = 0;
                FECSWorldPtr local_24_3 = ECS::GetECSWorld();
                Get local_46;
                const FCS_CommissionFinish& local_48 = local_46.opCall();
                if (local_48)
                {
                    local_40 = local_48.GetbSuccess() ? 1 : 2;
                    local_41 = local_48.GetRewardScore();
                    local_42 = local_48.GetFinishTier();
                }
                FPbDsPlayerInfo local_70 = this.GetPlayerInfo(local_19);
                if (local_70.IsValid())
                {
                    int local_72 = local_70.GetCommissionInstId();
                    FPbFinishCommissionReq local_78;
                    local_78.SetCommissionInstId(local_72);
                    local_78.SetResult(local_40);
                    if (CommissionUtils::CVar_Commission_DebugEnableNewTierRule.GetBool())
                    {
                        int local_79;
                        local_79 = 0;
                        ::CommissionUtils::GetCommissionSettings().ScoreTier2MedalRewardPercentage.Find(ECommissionFinishScoreTier(local_42), local_79);
                        local_79 = FMath::Clamp(local_79, 0, 100);
                        local_78.SetMedalCount(local_79);
                    }
                    else
                    {
                        local_78.SetMedalCount(local_41);
                    }
                    local_78.SetTier(local_42);
                    FFPTime local_92 = ::CommissionUtils::GetRaceCommissionTime(FFPTime(-1));
                    if (local_92.opCmp(0.0) > 0)
                    {
                        local_78.SetCostTimeSec(uint(local_92.ToSeconds()));
                    }
                    TArray<FECSEntity> local_102 = ::FTeamUtils::GetTeammates(PlayerEntity);
                    for (auto& local_116 : local_102)
                    {
                        local_116;
                        Get local_16;
                        const FC_PlayerController& local_118 = local_16.opCall();
                        if (local_118)
                        {
                            int local_119;
                            local_119 = local_118.GetPlayerId();
                            if (local_119 > 0)
                            {
                                local_78.AddTeamMemberUid(local_119);
                            }
                        }
                    }
                    XLog(ELog(27), FString().Append("FinishCommission PlayerUid=").Append(local_19).Append(" CommissionInstanceID=").Append(local_72).Append(", bSuccess=").Append(bSuccess));
                    this.SendProtoWrapperByPlayerUid(local_19, local_78.ToWrapper());
                    local_10.opCall(local_12);
                    this.SaveDSPlayerInfo(PlayerEntity, local_19, true, false);
                }
            }
        }
        return;
    }
    UFUNCTION()
    void OnPlayerFinishCommissionRsp(const FProtoWrapper &in ProtoWrapper, const uint PlayerUid)
    {
        int local_32 = 0;
        int local_64 = 0;
        int local_91;
        bool local_92;
        FPbFinishCommissionRsp local_8 = FPbFinishCommissionRsp::FromWrapper(ProtoWrapper);
        if (local_8.GetRetcode() == 0)
        {
            FECSEntity local_22 = FECSEntity(this.GetPlayerEntityIdByUid(PlayerUid));
            Has local_26;
            bool local_11 = local_26.opCall();
            if (local_11)
            {
                local_32.GetModify_CommissionFirstReward().Empty(local_8.GetFirstClearRewardList_Num());
                local_32.GetModify_CommissionFirstReward().Empty(local_8.GetRewardList_Num());
                TArray<FPbReward> local_36;
                TArray<FPbReward> local_40;
                local_8.GetFirstClearRewardList(local_36);
                local_8.GetRewardList(local_40);
                for (auto& local_54 : local_36)
                {
                    local_32.GetModify_CommissionFirstReward().Add(FCommissionFinishRewardItem(local_54.GetItemId(), local_54.GetCount()));
                }
                for (auto& local_54 : local_40)
                {
                    local_32.GetModify_CommissionReward().Add(FCommissionFinishRewardItem(local_54.GetItemId(), local_54.GetCount()));
                }
                if (::CommissionUtils::IsRaceCommissionTimerStarted())
                {
                    TArray<uint> local_68;
                    local_8.GetAchievedTierList(local_68);
                    local_64.GetModify_AchievedTierList().Empty(local_68.Num());
                    auto local_74 = local_68.Iterator();
                    for (; local_74.CanProceed;)
                    {
                        int local_82 = local_74.Proceed();
                        local_64.GetModify_AchievedTierList().Add(ECommissionTier(local_82));
                    }
                    int local_9 = int(::CommissionUtils::GetRaceCommissionTime(FFPTime(-1)).ToSeconds());
                    local_64.SetCostTimeSec(local_9);
                    local_64.SetOldBestCostTimeSec(::NumericUtils::AsInt32(local_8.GetOldBestCostTimeSec()));
                    if (local_9 <= 0)
                    {
                        local_92 = false;
                    }
                    else
                    {
                        if (local_64.GetOldBestCostTimeSec() == 0)
                        {
                            local_91 = 1;
                        }
                        else
                        {
                            local_92 = (local_9 < local_64.GetOldBestCostTimeSec());
                            local_91 = local_92;
                        }
                        local_92 = (local_91 != 0);
                    }
                    local_64.SetbIsNewBest(local_92);
                }
                FFPTime local_88 = FFPTime(-1);
                SendEvent local_96;
                local_96.opCall(local_88);
            }
        }
        else
        {
            XLog(ELog(27), FString().Append("FinishCommission Rsp PlayerUid=").Append(PlayerUid).Append(" CommissionInstanceID=").Append(local_8.GetCommissionInstId()).Append(", RetCode=").Append(local_8.GetRetcode()));
        }
        return;
    }
    UFUNCTION()
    void SendFinishTrainingReq(const FECSEntity &inout PlayerEntity, const uint TrainingDataId)
    {
        int local_6;
        Has local_4;
        local_4.opCall();
        Get local_10;
        local_6 = local_10.opCall().GetPlayerId();
        if (local_6 == 0)
        {
            XWarning(ELog(27), FString().Append("SendFinishTrainingReq invalid PlayerUid, TrainingDataId=").Append(TrainingDataId));
            return;
        }
        FPbFinishTrainingReq local_22;
        local_22.SetDataId(TrainingDataId);
        XLog(ELog(27), FString().Append("SendFinishTrainingReq PlayerUid=").Append(local_6).Append(" TrainingDataId=").Append(TrainingDataId));
        this.SendProtoWrapperByPlayerUid(local_6, local_22.ToWrapper());
        return;
    }
    UFUNCTION()
    void OnFinishTrainingRsp(const FProtoWrapper &in ProtoWrapper, const uint PlayerUid)
    {
        FPbFinishTrainingRsp local_8 = FPbFinishTrainingRsp::FromWrapper(ProtoWrapper);
        bool local_12 = (local_8.GetRetcode() == 0);
        if (local_12)
        {
            XLog(ELog(27), FString().Append("OnFinishTrainingRsp succ PlayerUid=").Append(PlayerUid).Append(" TrainingDataId=").Append(local_8.GetDataId()));
        }
        else
        {
            XLog(ELog(27), FString().Append("OnFinishTrainingRsp failed PlayerUid=").Append(PlayerUid).Append(" TrainingDataId=").Append(local_8.GetDataId()).Append(" Retcode=").Append(local_8.GetRetcode()));
        }
        if (FECSEntity(this.GetPlayerEntityIdByUid(PlayerUid)).IsValid())
        {
            FCE_FinishTrainingResult local_36;
            FFPTime local_34 = FFPTime(-1);
            local_36.bSuccess = local_12;
            local_36.TrainingInfo = ::FTrainingInfoConfig::GetByDataId(local_8.GetDataId());
        }
        return;
    }
    UFUNCTION()
    void SendGetRandomFriendNameReq(const FECSEntity &inout PlayerEntity)
    {
        int local_6;
        Has local_4;
        local_4.opCall();
        Get local_10;
        local_6 = local_10.opCall().GetPlayerId();
        if (local_6 == 0)
        {
            XWarning(ELog(27), FString().Append("SendGetRandomFriendNameReq invalid PlayerUid"));
            return;
        }
        FPbGetRandomFriendNameReq local_22;
        XLog(ELog(27), FString().Append("SendGetRandomFriendNameReq PlayerUid=").Append(local_6));
        this.SendProtoWrapperByPlayerUid(local_6, local_22.ToWrapper());
        return;
    }
    UFUNCTION()
    void OnGetRandomFriendNameRsp(const FProtoWrapper &in ProtoWrapper, const uint PlayerUid)
    {
        FPbGetRandomFriendNameRsp local_8 = FPbGetRandomFriendNameRsp::FromWrapper(ProtoWrapper);
        bool local_12 = (local_8.GetRetcode() == 0);
        FString local_28 = local_12 ? local_8.GetFriendName() : FString();
        XLog(ELog(27), FString().Append("OnGetRandomFriendNameRsp PlayerUid=").Append(PlayerUid).Append(" Success=").Append(local_12).Append(" FriendName=").Append(local_28));
        FECSEntity local_40 = FECSEntity(this.GetPlayerEntityIdByUid(PlayerUid));
        if (local_40.IsValid())
        {
            ::ULevelEventManager::Get().NotifyRandomFriendNameResult(local_40, local_28);
        }
        return;
    }
    UFUNCTION()
    void DisconnectAllPlayers(const bool bForceToLoginLevel = false)
    {
        int local_32 = 0;
        XLog(ELog(27), "DisconnectAllPlayers");
        TArray<FECSEntity> local_12 = FGameUtils::GetAllPlayerControllerEntities(true);
        for (auto& local_26 : local_12)
        {
            FPbDsPlayerInfo local_44 = this.GetPlayerInfo(local_32.GetPlayerId());
            int local_55 = 0;
            bool local_7 = !(bForceToLoginLevel) && local_44.IsValid();
            if (local_7)
            {
                bool local_57;
                int local_56 = local_44.GetDsMiscInfo().GetPlayerMapInfo().GetWorldLevelKey();
                local_55 = local_56;
                FECSWorldPtr local_80 = ECS::GetECSWorld();
                Has local_84;
                local_57 = local_84.opCall();
                if (!(local_57))
                {
                    local_57 = false;
                }
                else
                {
                    FECSWorldPtr local_80_2 = ECS::GetECSWorld();
                    Get local_88;
                    local_7 = local_88.opCall().GetbSuccess();
                    local_57 = local_7;
                }
                if (local_57)
                {
                    TDataObjectPtr<FCommissionConfig> local_112 = ::CommissionUtils::GetCurrentCommissionConfig();
                    TDataObjectPtr<FGlobalSettingsConfig> local_160 = ::FGlobalSettingsConfig::Get();
                    if (local_160)
                    {
                        const TArray<TDataObjectPtr<FMissionCommissionConfig>>& local_186 = local_160.opArrow().GetTutorialMissionConfigs();
                        if (local_186.Num() <= 0)
                        {
                            local_7 = false;
                        }
                        else
                        {
                            TDataObjectPtr<FMissionCommissionConfig> local_212;
                            local_212 = local_186.Last(0);
                            local_7 = (local_212 == local_112.opImplConv());
                        }
                        if (local_7)
                        {
                            if (::FLevelUtils::GetCurrentLevelInfoConfig(nullptr))
                            {
                                int local_309;
                                local_309 = local_56;
                                if (local_309 > 0 && (local_309 != local_56))
                                {
                                    local_55 = local_309;
                                }
                            }
                        }
                    }
                }
            }
            if (local_55 > 0)
            {
                XLog(ELog(27), FString().Append("DisconnectAllPlayers PlayerEntity=").Append(local_26).Append(" TargetLevelKey=").Append(local_55));
                this.PlayerRequestEnterDS(local_26, local_55, true, 0);
            }
            else
            {
                ::FGameConnectionUtils::DisconnectPlayer(local_26, EDisconnectReason(4));
            }
        }
        return;
    }
    UFUNCTION()
    void OnTeamInvitePlayerRsp(const FProtoWrapper &in ProtoWrapper, const uint PlayerUid)
    {
        XLog(ELog(27), FString().Append("OnTeamInvitePlayerRsp PlayerUid=").Append(PlayerUid).Append(" Retcode=").Append(FPbTeamInvitePlayerRsp::FromWrapper(ProtoWrapper).GetRetcode()));
        return;
    }
    UFUNCTION()
    void OnDsLeaveTeamRsp(const FProtoWrapper &in ProtoWrapper, const uint PlayerUid)
    {
        XLog(ELog(27), FString().Append("OnDsLeaveTeamRsp PlayerUid=").Append(PlayerUid).Append(" Retcode=").Append(FPbDsLeaveTeamRsp::FromWrapper(ProtoWrapper).GetRetcode()));
        return;
    }
    UFUNCTION()
    void SendTeamUpRequest(const FECSEntity &inout PlayerEntity, const uint TargetUid)
    {
        int local_6;
        Has local_4;
        local_4.opCall();
        Get local_10;
        local_6 = local_10.opCall().GetPlayerId();
        XLog(ELog(27), FString().Append("SendTeamUpRequest PlayerUid=").Append(local_6).Append(" TargetUid=").Append(TargetUid));
        FPbTeamUpReq local_22;
        local_22.SetTargetUid(TargetUid);
        this.SendProtoWrapperByPlayerUid(local_6, local_22.ToWrapper());
        return;
    }
    UFUNCTION()
    void SendNewLeaveTeamRequest(const FECSEntity &inout PlayerEntity, const uint64 TeamId)
    {
        int local_6;
        Has local_4;
        local_4.opCall();
        Get local_10;
        local_6 = local_10.opCall().GetPlayerId();
        XLog(ELog(27), FString().Append("SendNewLeaveTeamRequest PlayerUid=").Append(local_6).Append(" TeamId=").Append(TeamId));
        FPbLeaveTeamReq local_22;
        local_22.SetTeamId(TeamId);
        this.SendProtoWrapperByPlayerUid(local_6, local_22.ToWrapper());
        return;
    }
    UFUNCTION()
    void SendKickTeammateRequest(const FECSEntity &inout PlayerEntity, const uint64 TeamId, const uint KickUid)
    {
        int local_6;
        Has local_4;
        local_4.opCall();
        Get local_10;
        local_6 = local_10.opCall().GetPlayerId();
        XLog(ELog(27), FString().Append("SendKickTeammateRequest PlayerUid=").Append(local_6).Append(" TeamId=").Append(TeamId).Append(" KickUid=").Append(KickUid));
        FPbKickTeammateReq local_22;
        local_22.SetTeamId(TeamId);
        local_22.SetUid(KickUid);
        this.SendProtoWrapperByPlayerUid(local_6, local_22.ToWrapper());
        return;
    }
    UFUNCTION()
    void SendTransferCaptainRequest(const FECSEntity &inout PlayerEntity, const uint64 TeamId, const uint NewCaptainUid)
    {
        int local_6;
        Has local_4;
        local_4.opCall();
        Get local_10;
        local_6 = local_10.opCall().GetPlayerId();
        XLog(ELog(27), FString().Append("SendTransferCaptainRequest PlayerUid=").Append(local_6).Append(" TeamId=").Append(TeamId).Append(" NewCaptainUid=").Append(NewCaptainUid));
        FPbTransferCaptainReq local_22;
        local_22.SetTeamId(TeamId);
        local_22.SetNewCaptainUid(NewCaptainUid);
        this.SendProtoWrapperByPlayerUid(local_6, local_22.ToWrapper());
        return;
    }
    UFUNCTION()
    void SendTeamInviteReplyRequest(const FECSEntity &inout PlayerEntity, const uint64 TeamId, const uint SourceUid, const bool bAccept)
    {
        int local_6;
        Has local_4;
        local_4.opCall();
        Get local_10;
        local_6 = local_10.opCall().GetPlayerId();
        XLog(ELog(27), FString().Append("SendTeamInviteReplyRequest PlayerUid=").Append(local_6).Append(" TeamId=").Append(TeamId).Append(" SourceUid=").Append(SourceUid).Append(" Accept=").Append(bAccept));
        FPbTeamInviteReplyReq local_22;
        local_22.SetTeamId(TeamId);
        local_22.SetSourceUid(SourceUid);
        local_22.SetAccept(bAccept);
        this.SendProtoWrapperByPlayerUid(local_6, local_22.ToWrapper());
        return;
    }
    UFUNCTION()
    void SendTeamApplyReplyRequest(const FECSEntity &inout PlayerEntity, const uint64 TeamId, const uint SourceUid, const bool bAccept)
    {
        int local_6;
        Has local_4;
        local_4.opCall();
        Get local_10;
        local_6 = local_10.opCall().GetPlayerId();
        XLog(ELog(27), FString().Append("SendTeamApplyReplyRequest PlayerUid=").Append(local_6).Append(" TeamId=").Append(TeamId).Append(" SourceUid=").Append(SourceUid).Append(" Accept=").Append(bAccept));
        FPbTeamApplyReplyReq local_22;
        local_22.SetTeamId(TeamId);
        local_22.SetSourceUid(SourceUid);
        local_22.SetAccept(bAccept);
        this.SendProtoWrapperByPlayerUid(local_6, local_22.ToWrapper());
        return;
    }
    UFUNCTION()
    void OnTeamUpRsp(const FProtoWrapper &in ProtoWrapper, const uint PlayerUid)
    {
        XLog(ELog(27), FString().Append("OnTeamUpRsp PlayerUid=").Append(PlayerUid).Append(" Retcode=").Append(FPbTeamUpRsp::FromWrapper(ProtoWrapper).GetRetcode()));
        return;
    }
    UFUNCTION()
    void OnLeaveTeamRsp(const FProtoWrapper &in ProtoWrapper, const uint PlayerUid)
    {
        XLog(ELog(27), FString().Append("OnLeaveTeamRsp PlayerUid=").Append(PlayerUid).Append(" Retcode=").Append(FPbLeaveTeamRsp::FromWrapper(ProtoWrapper).GetRetcode()));
        return;
    }
    UFUNCTION()
    void OnKickTeammateRsp(const FProtoWrapper &in ProtoWrapper, const uint PlayerUid)
    {
        XLog(ELog(27), FString().Append("OnKickTeammateRsp PlayerUid=").Append(PlayerUid).Append(" Retcode=").Append(FPbKickTeammateRsp::FromWrapper(ProtoWrapper).GetRetcode()));
        return;
    }
    UFUNCTION()
    void OnTransferCaptainRsp(const FProtoWrapper &in ProtoWrapper, const uint PlayerUid)
    {
        XLog(ELog(27), FString().Append("OnTransferCaptainRsp PlayerUid=").Append(PlayerUid).Append(" Retcode=").Append(FPbTransferCaptainRsp::FromWrapper(ProtoWrapper).GetRetcode()));
        return;
    }
    UFUNCTION()
    void OnTeamInviteReplyRsp(const FProtoWrapper &in ProtoWrapper, const uint PlayerUid)
    {
        XLog(ELog(27), FString().Append("OnTeamInviteReplyRsp PlayerUid=").Append(PlayerUid).Append(" Retcode=").Append(FPbTeamInviteReplyRsp::FromWrapper(ProtoWrapper).GetRetcode()));
        return;
    }
    UFUNCTION()
    void OnTeamApplyReplyRsp(const FProtoWrapper &in ProtoWrapper, const uint PlayerUid)
    {
        XLog(ELog(27), FString().Append("OnTeamApplyReplyRsp PlayerUid=").Append(PlayerUid).Append(" Retcode=").Append(FPbTeamApplyReplyRsp::FromWrapper(ProtoWrapper).GetRetcode()));
        return;
    }
    UFUNCTION()
    void OnManageTalentRsp(const FProtoWrapper &in ProtoWrapper, const uint PlayerUid)
    {
        int local_64 = 0;
        int local_80;
        FPbManageTalentRsp local_8 = FPbManageTalentRsp::FromWrapper(ProtoWrapper);
        XLog(ELog(27), FString().Append("OnManageTalentRsp PlayerUid=").Append(PlayerUid).Append(" Retcode=").Append(local_8.GetRetcode()));
        if (local_8.GetRetcode() == 0)
        {
            FCE_ChangeAvatarTalentEquipInfo local_34;
            FECSEntity local_26 = FECSEntity(this.GetPlayerEntityIdByUid(PlayerUid));
            FFPTime local_32 = FFPTime(-1);
            local_34.AvatarId = local_8.GetAvatarId();
            FPbAvatarEquippedTalentBin local_44 = local_8.GetAvatarEquippedTalent();
            local_34.NewFoundationId = local_44.GetFoundationId();
            local_44.GetChooseIdList(local_34.NewChooseTalentIdList);
            TArray<FPbAvatarReplaceSkillBin> local_58;
            local_44.GetReplaceSkillList(local_58);
            for (auto& local_78 : local_58)
            {
                int local_17 = local_78.GetTalentId();
                local_80 = local_17;
                if (local_64)
                {
                    local_80 = ::FTalentUtils::GetHighestUnlockedTalentIdInChain(local_17, local_64.GetUnlockTalentList());
                }
                int local_81 = local_78.GetSlot();
                local_34.NewTalentIdBySkillSlot.Add(ESkillSlot(local_81), local_80);
                XLog(ELog(27), FString().Append("OnManageTalentRsp ReplaceSkill Slot=").Append(local_78.GetSlot()).Append(" RecvTalentId=").Append(local_17).Append(" EquipTalentId=").Append(local_80));
            }
        }
        return;
    }
    UFUNCTION()
    void OnTalentStatusToDSNotify(const FProtoWrapper &in ProtoWrapper, const uint PlayerUid)
    {
        int local_40 = 0;
        FPbTalentStatusToDSNotify local_8 = FPbTalentStatusToDSNotify::FromWrapper(ProtoWrapper);
        XLog(ELog(27), FString().Append("OnTalentStatusToDSNotify PlayerUid=").Append(PlayerUid).Append("}"));
        TArray<uint> local_18;
        local_8.GetUnlockTalentList(local_18);
        if (FECSEntity(this.GetPlayerEntityIdByUid(PlayerUid)).IsValid())
        {
            FFPTime local_36 = FFPTime(-1);
            local_40.NewUnlockTalentIdList = local_18;
        }
        return;
    }
    UFUNCTION()
    void OnServerBroadcastChatMsgNotify(const FProtoWrapper &in ProtoWrapper)
    {
        FPbServerBroadcastChatMsgNotify local_8 = FPbServerBroadcastChatMsgNotify::FromWrapper(ProtoWrapper);
        FFPTime local_16 = FFPTime(-1);
        FECSWorldPtr local_10 = ECS::GetECSWorld();
        FCE_DSDispatchChat local_20;
        local_20.DispatchKind = EChatDSDispatchKind(0);
        local_20.SendChat = ::ChatSystemUtil::MakeSnapshotFromPbBroadcast(local_8);
        local_8.GetSender().GetPlayerBriefInfo();
        XLog(ELog(27), FString().Append("OnServerBroadcastChatMsgNotify dispatch ChannelType=").Append(local_8.GetChannelType()).Append(" SenderUid=").Append(local_20.SenderBrief.GetUid()));
        return;
    }
    UFUNCTION()
    void SendJoinInstanceRequest(const TArray<FECSEntity> &inout PlayerEntities, const uint RequestLevelKey)
    {
        int local_29;
        if (PlayerEntities.Num() == 0)
        {
            XWarning(ELog(27), "SendJoinInstanceRequest PlayerEntities is empty");
            return;
        }
        FPbJoinInstanceReq local_8;
        int local_9 = 0;
        for (auto& local_24 : PlayerEntities)
        {
            Has local_28;
            local_28.opCall();
            Get local_34;
            local_29 = local_34.opCall().GetPlayerId();
            if (local_9 == 0)
            {
                local_9 = local_29;
                local_8.SetUid(local_9);
            }
            local_8.AddJoinUid(local_29);
            XLog(ELog(27), FString().Append("SendJoinInstanceRequest PlayerEntity=").Append(local_24).Append(" PlayerUid=").Append(local_29));
        }
        local_8.SetLevelKey(RequestLevelKey);
        this.SendProtoWrapperByPlayerUid(local_9, local_8.ToWrapper());
        XLog(ELog(27), FString().Append("SendJoinInstanceRequest PlayerEntities=").Append(PlayerEntities.Num()).Append(" LevelKey=").Append(RequestLevelKey));
        return;
    }
    UFUNCTION()
    void OnSocialTeamInfoNotify(const FProtoWrapper &in ProtoWrapper, const uint PlayerUid)
    {
        int64 local_36;
        int64 local_62;
        int local_76 = 0;
        FPbSocialTeamInfoNotify local_8 = FPbSocialTeamInfoNotify::FromWrapper(ProtoWrapper);
        bool local_10 = local_8.GetIsInTeam();
        FPbSocialTeamInfo local_30 = local_8.GetTeamInfo();
        XLog(ELog(27), FString().Append("OnSocialTeamInfoNotify: InTeam=").Append(local_10).Append(", TeamID=").Append(local_30.GetTeamId()).Append(", LeaderID=").Append(local_30.GetCaptainUid()).Append(", Members=").Append(local_30.GetUidList_Num()));
        FPbDsPlayerInfo local_60 = this.GetPlayerInfo(PlayerUid);
        if (local_60.IsValid())
        {
            if (local_10)
            {
                local_62 = local_30.GetTeamId();
            }
            else
            {
                local_62 = 0;
            }
            local_60.SetTeamId(local_62);
        }
        if (FECSEntity(this.GetPlayerEntityIdByUid(PlayerUid)).IsValid())
        {
            if (local_10)
            {
                local_36 = local_30.GetTeamId();
            }
            else
            {
                local_36 = 0;
            }
            local_76.SetSocialTeamId(local_36);
            local_76.SetSocialTeamSize(local_30.GetUidList_Num());
            FECSWorldPtr local_78 = ECS::GetECSWorld();
            FCS_DSSocialTeamInfoPendingUpdateTag local_84;
            Assign local_82;
            local_82.opCall(local_84);
        }
        return;
    }
    UFUNCTION()
    void OnMissionPhaseCompleteRsp(const FProtoWrapper &in ProtoWrapper, const uint PlayerUid)
    {
        if (FECSEntity(this.GetPlayerEntityIdByUid(PlayerUid)).IsValid())
        {
            FPbMissionPhaseCompleteRsp local_16 = FPbMissionPhaseCompleteRsp::FromWrapper(ProtoWrapper);
            if (local_16.GetRetcode() == 0)
            {
                return;
            }
            PrintError("MissionPhaseCompleteRsp Failed!", 8.0f, FLinearColor::Red);
        }
        return;
    }
    UFUNCTION()
    void OnGSMissionStatusChangeNotify(const FProtoWrapper &in ProtoWrapper, const uint PlayerUid)
    {
        FECSEntity local_6 = FECSEntity(this.GetPlayerEntityIdByUid(PlayerUid));
        if (!(local_6.IsValid()))
        {
            XError(ELog(63), FString().Append("OnGSMissionStatusChangeNotify PlayerUid=").Append(PlayerUid).Append(" is invalid"));
            return;
        }
        FPbServerMissionStatusChangeNotify local_22 = FPbServerMissionStatusChangeNotify::FromWrapper(ProtoWrapper);
        TArray<FPbMissionStatusChange> local_30;
        local_22.GetMissionStatusChanges(local_30);
        if (local_30.Num() > 0)
        {
            ::MissionNetUtils::HandleMissionStatusChangeNotify(local_6, local_30);
        }
        return;
    }
    UFUNCTION()
    void OnGSConditionProgressNotify(const FProtoWrapper &in ProtoWrapper, const uint PlayerUid)
    {
        FECSEntity local_6 = FECSEntity(this.GetPlayerEntityIdByUid(PlayerUid));
        if (!(local_6.IsValid()))
        {
            XError(ELog(58), FString().Append("OnGSConditionProgressNotify PlayerUid=").Append(PlayerUid).Append(" is invalid"));
            return;
        }
        FPbGsConditionProgressNotify local_22 = FPbGsConditionProgressNotify::FromWrapper(ProtoWrapper);
        TArray<FPbUint32Pair> local_30;
        local_22.GetGsCondValues(local_30);
        TArray<FPbConditionInfo> local_34;
        local_22.GetGsEventValues(local_34);
        XLog(ELog(65), FString().Append("OnGSConditionProgressNotify PlayerUid=").Append(PlayerUid).Append(" GsCondValuesNum=").Append(local_30.Num()).Append(" GsEventValuesNum=").Append(local_34.Num()));
        ::ObjectiveUtils::HandleGSConditionProgressNotify(local_6, local_30, local_34);
        return;
    }
    void OnDestroyPlayerEntity(const FECSEntity &inout PlayerEntity)
    {
        XLog(ELog(27), FString().Append("OnDestroyPlayerEntity PlayerEntity=").Append(PlayerEntity));
        Get local_10;
        const FC_DSPlayerInfo& local_12 = local_10.opCall();
        if (local_12)
        {
            if (local_12.GetSocialTeamId() > 0)
            {
                XLog(ELog(27), FString().Append("OnDestroyPlayerEntity PlayerEntity=").Append(PlayerEntity).Append(" NickName=").Append(local_12.GetNickName()).Append(" SocialTeamId=").Append(local_12.GetSocialTeamId()));
                FECSWorldPtr local_24 = ECS::GetECSWorld();
                FCS_DSSocialTeamInfoPendingUpdateTag local_30;
                Assign local_28;
                local_28.opCall(local_30);
            }
        }
        if (this.OnPlayerExitDS.IsBound())
        {
            this.OnPlayerExitDS.Broadcast(PlayerEntity);
        }
        if (this.IsConnectedToGameServer())
        {
            int local_39;
            EDisconnectReason local_31;
            local_31 = EDisconnectReason(4);
            Get local_36;
            const FC_PlayerExitDSReason& local_38 = local_36.opCall();
            if (local_38)
            {
                local_31 = local_38.Reason;
            }
            Get local_44;
            local_39 = local_44.opCall().GetPlayerId();
            bool local_13 = (int(local_31) == 5);
            if (!(local_13))
            {
                this.SaveDSPlayerInfo(PlayerEntity, local_39, true, true);
            }
            this.PlayerLeaveDSNotify(PlayerEntity);
            if (!(local_13))
            {
                this.PlayerLogout(local_39, 2);
            }
        }
        return;
    }
    void OnPlayerEntityEnterDS(const FECSEntity &inout PlayerEntity)
    {
        int local_6 = 0;
        int local_12 = 0;
        int local_48;
        int local_49;
        int local_62 = 0;
        AECSPlayerController local_102;
        APlayerState local_104;
        ::InventoryUtils::LoadItemInventory(PlayerEntity);
        FPbDsPlayerInfo local_34 = this.GetPlayerInfo(local_6.GetPlayerId());
        XLog(ELog(27), FString().Append("OnPlayerEntityEnterDS PlayerInfo.GetUid()=").Append(local_34.GetUid()).Append(" C_PlayerController.PlayerId=").Append(local_6.GetPlayerId()).Append(", PlayerInfo.GetTeamId()=").Append(local_34.GetTeamId()));
        if (local_34.GetUid() > 0 && (local_34.GetUid() == local_6.GetPlayerId()))
        {
            local_12.SetNickName(local_34.GetNickname());
            int local_44 = local_34.GetAvatarGender();
            if (local_44 == 0)
            {
                local_49 = 0;
                local_48 = local_49;
            }
            else
            {
                local_49 = 1;
                local_48 = local_49;
            }
            local_12.SetGender(EGenderType(local_48));
            local_12.SetPlayerSpecialtyID(local_34.GetMainAvatarSpecialty());
            if (local_34.GetTeamId() > 0)
            {
                local_12.SetSocialTeamId(local_34.GetTeamId());
                FECSWorldPtr local_54 = ECS::GetECSWorld();
                FCS_DSSocialTeamInfoPendingUpdateTag local_60;
                Assign local_58;
                local_58.opCall(local_60);
            }
            local_62.InitByGameMode();
            local_62.GetModify_AvatarList().Empty(0);
            TArray<FPbAvatar> local_70;
            local_34.GetAvatarCompInfo().GetAvatarList(local_70);
            for (auto& local_94 : local_70)
            {
                local_62.AddAvatarByPbAvatar(local_94);
            }
            this.LoadCutSceneInfo(PlayerEntity, local_34);
            this.LoadLevelObjectStatInfo(PlayerEntity, local_34);
            this.LoadDivineSkillInfo(PlayerEntity, local_34);
            if (!(::FGameModeUtils::ShouldDisableTalent(local_62.GetbDisableTalent())))
            {
                this.LoadTalentInfo(PlayerEntity, local_34);
            }
            ::MissionUtils::InitializeMissionInfo(PlayerEntity, local_34);
            ::ObjectiveUtils::RecoverObjectiveConditionValue(PlayerEntity, EConditionUsage(1), local_34);
        }
        else
        {
            TWeakObjectPtr<AECSPlayerController> local_97 = local_6.GetUEPlayerController();
            if (local_102 != nullptr)
            {
                local_104 = local_102.PlayerState;
                if (local_104 != nullptr)
                {
                    TWeakObjectPtr<AECSPlayerController> local_106 = local_6.GetUEPlayerController();
                    AECSPlayerController local_108;
                    local_12.SetNickName(local_108.PlayerState.GetPlayerName());
                }
            }
        }
        if (this.OnPlayerEnterDS.IsBound())
        {
            this.OnPlayerEnterDS.Broadcast(PlayerEntity);
        }
        return;
    }
    UFUNCTION()
    void OnUnlockAvatarNotify(const FProtoWrapper &in ProtoWrapper, const uint PlayerUid)
    {
        int local_44 = 0;
        FPbUnlockAvatarNotify local_8 = FPbUnlockAvatarNotify::FromWrapper(ProtoWrapper);
        XLog(ELog(27), FString().Append("OnUnlockAvatarNotify PlayerUid=").Append(PlayerUid).Append(" AvatarNum=").Append(local_8.GetAvatarList_Num()));
        if (!(FECSEntity(this.GetPlayerEntityIdByUid(PlayerUid)).IsValid()))
        {
            XWarning(ELog(27), FString().Append("OnUnlockAvatarNotify invalid PlayerEntity PlayerUid=").Append(PlayerUid));
            return;
        }
        Has local_30;
        if (!(local_30.opCall()))
        {
            FC_DSPlayerAvatarInfo local_42;
            Assign local_34;
            local_34.opCall(local_42).InitByGameMode();
        }
        int local_49 = 0;
        for (; local_49 < local_8.GetAvatarList_Num(); )
        {
            local_44.AddAvatarByPbAvatar(local_8.GetAvatarList_Index(local_49));
            ++local_49;
        }
        return;
    }
    UFUNCTION()
    void OnChangeMainAvatarSpecialtyRsp(const FProtoWrapper &in ProtoWrapper, const uint PlayerUid)
    {
        int local_18;
        int local_20;
        FPbChangeMainAvatarSpecialtyRsp local_8 = FPbChangeMainAvatarSpecialtyRsp::FromWrapper(ProtoWrapper);
        if (local_8.GetRetcode() != 0)
        {
            XError(ELog(27), FString().Append("OnChangeMainAvatarSpecialtyRsp PlayerUid=").Append(PlayerUid).Append(" Retcode=").Append(local_8.GetRetcode()));
            return;
        }
        local_18 = local_8.GetFromAvatarId();
        local_20 = local_8.GetToAvatarId();
        FECSEntity local_30 = FECSEntity(this.GetPlayerEntityIdByUid(PlayerUid));
        Has local_34;
        bool local_11 = local_34.opCall();
        if (local_11)
        {
            Modify local_38;
            FC_DSPlayerInfo& local_40 = local_38.opCall();
            if (local_40)
            {
                local_40.SetPlayerSpecialtyID(local_20);
            }
        }
        FFPTime local_46 = FFPTime(-1);
        FCE_DispatchSpecialtyChangeFromDS local_48;
        local_48.FromSpecialtyID = local_18;
        local_48.ToSpecialtyID = local_20;
        return;
    }
    void CacheAllAvatarFashionNotify(const uint PlayerUid, const FPbAllAvatarFashionNotify &inout Notify)
    {
        FPbDsPlayerInfo local_20 = this.GetPlayerInfo(PlayerUid);
        if (!(local_20.IsValid()))
        {
            XWarning(ELog(27), FString().Append("CacheAllAvatarFashionNotify invalid PlayerInfo PlayerUid=").Append(PlayerUid));
            return;
        }
        FPbDsPlayerFashionInfo local_48 = local_20.GetFashionInfo();
        local_48.ClearAvatarFashionList();
        int local_49 = 0;
        for (; local_49 < Notify.GetAvatarFashionList_Num(); ++local_49)
        {
            FPbAvatarFashionInfo local_72 = Notify.GetAvatarFashionList_Index(local_49);
            FPbAvatarFashionBin local_92 = local_48.AddAvatarFashionList();
            local_92.SetAvatarId(local_72.GetAvatarId());
            local_92.SetHairId(local_72.GetHairId());
            local_92.SetTopId(local_72.GetTopId());
            local_92.SetBottomId(local_72.GetBottomId());
            local_92.SetSuitId(local_72.GetSuitId());
            local_92.SetBathrobeTopId(local_72.GetBathrobeTopId());
            local_92.SetBathrobeBottomId(local_72.GetBathrobeBottomId());
            int local_93 = 0;
            for (; local_93 < local_72.GetDecos_Num(); )
            {
                FPbDecoPointInfo local_114 = local_72.GetDecos_Index(local_93);
                FPbDecoPointBin local_134 = local_92.AddDecos();
                local_134.SetSlotType(local_114.GetSlotType());
                local_134.SetFashionId(local_114.GetFashionId());
                FPbFloat3 local_154 = local_114.GetAttachOffset();
                FPbFloat3 local_144 = local_134.GetAttachOffset();
                local_144.SetX(local_154.GetX());
                local_144.SetY(local_154.GetY());
                local_144.SetZ(local_154.GetZ());
                FPbFloat3 local_164 = local_114.GetAttachRotation();
                FPbFloat3 local_176 = local_134.GetAttachRotation();
                local_176.SetX(local_164.GetX());
                local_176.SetY(local_164.GetY());
                local_176.SetZ(local_164.GetZ());
                local_134.SetAttachScale(local_114.GetAttachScale());
                ++local_93;
            }
        }
        local_48.SetMountId(Notify.GetMountId());
        local_48.SetMountDecoId(Notify.GetMountDecoId());
        local_48.SetFacePresetId(Notify.GetFacePresetId());
        return;
    }
    UFUNCTION()
    void OnAllAvatarFashionNotify(const FProtoWrapper &in ProtoWrapper, const uint PlayerUid)
    {
        int local_154 = 0;
        int local_160 = 0;
        FPbAllAvatarFashionNotify local_8 = FPbAllAvatarFashionNotify::FromWrapper(ProtoWrapper);
        XLog(ELog(27), FString().Append("OnAllAvatarFashionNotify PlayerUid=").Append(PlayerUid).Append(" AvatarFashionCount=").Append(local_8.GetAvatarFashionList_Num()).Append(" MountId=").Append(local_8.GetMountId()).Append(" MountDecoId=").Append(local_8.GetMountDecoId()).Append(" FacePresetId=").Append(local_8.GetFacePresetId()));
        this.CacheAllAvatarFashionNotify(PlayerUid, local_8);
        if (!(FECSEntity(this.GetPlayerEntityIdByUid(PlayerUid)).IsValid()))
        {
            XWarning(ELog(27), FString().Append("OnAllAvatarFashionNotify invalid PlayerEntity PlayerUid=").Append(PlayerUid));
            return;
        }
        FPlayerFashionNotifySnapshot local_38;
        local_38.SetMountId(local_8.GetMountId());
        local_38.SetMountDecoId(local_8.GetMountDecoId());
        local_38.SetFacePresetId(local_8.GetFacePresetId());
        int local_39 = 0;
        for (; local_39 < local_8.GetAvatarFashionList_Num(); )
        {
            FPbAvatarFashionInfo local_60 = local_8.GetAvatarFashionList_Index(local_39);
            FAvatarFashionNotifyData local_74;
            local_74.SetAvatarId(local_60.GetAvatarId());
            local_74.SetHairId(local_60.GetHairId());
            local_74.SetTopId(local_60.GetTopId());
            local_74.SetBottomId(local_60.GetBottomId());
            local_74.SetSuitId(local_60.GetSuitId());
            local_74.SetBathrobeTopId(local_60.GetBathrobeTopId());
            local_74.SetBathrobeBottomId(local_60.GetBathrobeBottomId());
            int local_75 = 0;
            FPbDecoPointInfo local_96 = local_60.GetDecos_Index(local_75);
            FAvatarFashionDecoNotifyData local_106;
            local_106.SetSlotType(local_96.GetSlotType());
            local_106.SetFashionId(local_96.GetFashionId());
            FPbFloat3 local_126 = local_96.GetAttachOffset();
            local_106.SetAttachOffset(FVector3f(local_126.GetX(), local_126.GetY(), local_126.GetZ()));
            FPbFloat3 local_116 = local_96.GetAttachRotation();
            local_106.SetAttachRotation(FRotator3f(local_116.GetX(), local_116.GetY(), local_116.GetZ()));
            local_106.SetAttachScale(local_96.GetAttachScale());
            local_74.GetModify_Decos().Add(local_106);
            ++local_75;
            int local_16 = local_60.GetDecos_Num();
            local_38.GetModify_AvatarFashions().Add(local_74);
            ++local_39;
        }
        FFPTime local_152 = FFPTime(-1);
        local_154.Snapshot = local_38;
        FFPTime local_152_2 = FFPTime(-1);
        local_160.Snapshot = local_38;
        XLog(ELog(27), FString().Append("Dispatch AllAvatarFashionNotify snapshot via ECS PlayerUid=").Append(PlayerUid).Append(" AvatarFashionCount=").Append(local_38.GetAvatarFashions().Num()));
        return;
    }
    UFUNCTION()
    void OnSwitchMainAvatarGenderNotify(const FProtoWrapper &in ProtoWrapper, const uint PlayerUid)
    {
        int local_109;
        int local_110;
        int local_128 = 0;
        FPbSwitchMainAvatarGenderNotify local_8 = FPbSwitchMainAvatarGenderNotify::FromWrapper(ProtoWrapper);
        XLog(ELog(27), FString().Append("OnSwitchMainAvatarGenderNotify PlayerUid=").Append(PlayerUid).Append(" CurAvatarId=").Append(local_8.GetCurAvatarId()).Append(" SwitchAvatarId=").Append(local_8.GetSwitchAvatarId()).Append(" Gender=").Append(local_8.GetAvatarGender()).Append(" Specialty=").Append(local_8.GetMainAvatarSpecialty()));
        if (!(FECSEntity(this.GetPlayerEntityIdByUid(PlayerUid)).IsValid()))
        {
            XWarning(ELog(27), FString().Append("OnSwitchMainAvatarGenderNotify invalid PlayerEntity PlayerUid=").Append(PlayerUid));
            return;
        }
        FPbDsPlayerInfo local_48 = this.GetPlayerInfo(PlayerUid);
        if (local_48.IsValid())
        {
            local_48.SetAvatarGender(local_8.GetAvatarGender());
            local_48.SetMainAvatarSpecialty(local_8.GetMainAvatarSpecialty());
            FPbDsPlayerAvatarCompInfo local_58 = local_48.GetAvatarCompInfo();
            local_58.SetCurAvatarId(local_8.GetCurAvatarId());
            local_58.SetSwitchAvatarId(local_8.GetSwitchAvatarId());
            local_58.ClearAvatarList();
            int local_69 = 0;
            for (; local_69 < local_8.GetAvatarList_Num(); )
            {
                FPbAvatar local_90 = local_8.GetAvatarList_Index(local_69);
                FPbAvatar local_80 = local_58.AddAvatarList();
                local_80.SetAvatarId(local_90.GetAvatarId());
                local_80.SetCurWeaponGuid(local_90.GetCurWeaponGuid());
                ++local_69;
            }
        }
        Modify local_106;
        FC_DSPlayerInfo& local_108 = local_106.opCall();
        if (local_108)
        {
            int local_14 = local_8.GetAvatarGender();
            if (local_14 == 0)
            {
                local_110 = 0;
                local_109 = local_110;
            }
            else
            {
                local_110 = 1;
                local_109 = local_110;
            }
            local_108.SetGender(EGenderType(local_109));
            local_108.SetPlayerSpecialtyID(local_8.GetMainAvatarSpecialty());
        }
        Has local_114;
        if (!(local_114.opCall()))
        {
            FC_DSPlayerAvatarInfo local_126;
            Assign local_118;
            local_118.opCall(local_126).InitByGameMode();
        }
        local_128.GetModify_AvatarList().Empty(0);
        int local_69_2 = 0;
        for (; local_69_2 < local_8.GetAvatarList_Num(); )
        {
            local_128.AddAvatarByPbAvatar(local_8.GetAvatarList_Index(local_69_2));
            ++local_69_2;
        }
        FFPTime local_140 = FFPTime(-1);
        FCE_SwitchMainAvatarGender local_142;
        local_142.CurAvatarId = local_8.GetCurAvatarId();
        local_142.SwitchAvatarId = local_8.GetSwitchAvatarId();
        return;
    }
    UFUNCTION()
    void OnAssembleTravelInDsNotify(const FProtoWrapper &in ProtoWrapper, const uint PlayerUid)
    {
        int local_42 = 0;
        FPbAssembleTravelInDsNotify local_8 = FPbAssembleTravelInDsNotify::FromWrapper(ProtoWrapper);
        int local_9 = this.GetPlayerEntityIdByUid(local_8.GetAssemblerUid());
        if (!(FECSEntity(this.GetPlayerEntityIdByUid(local_8.GetUid())).IsValid()))
        {
            XWarning(ELog(27), FString().Append("OnAssembleTravelInDsNotify invalid PlayerEntity PlayerUid=").Append(local_8.GetUid()));
            return;
        }
        FECSEntity local_16 = FECSEntity(local_9);
        if (!(local_16.IsValid()))
        {
            XWarning(ELog(27), FString().Append("OnAssembleTravelInDsNotify invalid AssemblePlayerEntity PlayerUid=").Append(local_8.GetAssemblerUid()));
            return;
        }
        FFPTime local_38 = FFPTime(-1);
        local_42.AssemblerPlayerEntity = local_16;
        return;
    }
    UFUNCTION()
    void OnGSDeadNotify(const FProtoWrapper &in ProtoWrapper)
    {
        FPbGSDeadNotify local_8 = FPbGSDeadNotify::FromWrapper(ProtoWrapper);
        XLog(ELog(27), FString().Append("OnGSDeadNotify GsAppId=").Append(local_8.GetGsAppId()));
        TArray<uint> local_18;
        local_8.GetUidList(local_18);
        for (auto local_34 : local_18)
        {
            FECSEntity local_44 = FECSEntity(this.GetPlayerEntityIdByUid(int(local_34)));
            if (local_44.IsValid())
            {
                XLog(ELog(27), FString().Append("OnGSDeadNotify PlayerUid=").Append(local_34));
                ::FGameConnectionUtils::DisconnectPlayer(local_44, EDisconnectReason(4));
            }
        }
        return;
    }
    UFUNCTION()
    void OnPlayerBriefDataNotify(const FProtoWrapper &in ProtoWrapper, const uint PlayerUid)
    {
        FPbPlayerBriefDataNotify local_8 = FPbPlayerBriefDataNotify::FromWrapper(ProtoWrapper);
        XLog(ELog(27), FString().Append("RecvPacket OnPlayerBriefDataNotify Uid=").Append(PlayerUid).Append(" NickName=").Append(local_8.GetNickname()).Append(" Level=").Append(local_8.GetLevel()).Append(" Exp=").Append(local_8.GetCurExp()));
        FECSEntity local_28 = FECSEntity(this.GetPlayerEntityIdByUid(PlayerUid));
        if (local_28.IsValid())
        {
            bool local_47;
            bool local_30;
            local_30 = true;
            Get local_34;
            const FC_PlayerInGameState& local_36 = local_34.opCall();
            if (local_36)
            {
                if (local_36.GetCurLevel() == local_8.GetLevel())
                {
                    local_30 = false;
                }
            }
            if (local_30)
            {
                FCE_PlayerLevelUpdateByGS local_46;
                FFPTime local_44 = FFPTime(-1);
                local_46.NewLevel = local_8.GetLevel();
                local_46.NewExp = local_8.GetCurExp();
                if (!(::FGameModeUtils::ShouldDisableStigmata()))
                {
                    ::StigmataUtils::ApplyHealItemMaxByLevel(local_28, local_8.GetLevel());
                }
            }
            local_47 = true;
            Get local_52;
            const FC_DSPlayerInfo& local_54 = local_52.opCall();
            if (local_54)
            {
                if ((local_54.GetNickName() == local_8.GetNickname()))
                {
                    local_47 = false;
                }
            }
            if (local_47)
            {
                ModifyOrAdd local_58;
                local_58.opCall().SetNickName(local_8.GetNickname());
            }
        }
        return;
    }
    UFUNCTION()
    void OnWearWeaponReq(const FProtoWrapper &in ProtoWrapper, const uint PlayerUid)
    {
        FPbWearWeaponReq local_4 = FPbWearWeaponReq::FromWrapper(ProtoWrapper);
        int local_57 = local_4.GetAvatarId();
        GetDataObjectByGSDataId<FAvatarPrefabConfig> local_56;
        TDataObjectPtr<FAvatarPrefabConfig> local_32 = local_56.opImplConv();
        int local_57_2 = local_4.GetWeapon().GetItemId();
        GetDataObjectByGSDataId<FEquipmentConfig> local_164;
        TDataObjectPtr<FEquipmentConfig> local_130 = local_164.opImplConv();
        if (!(local_32.IsSet()) || !(local_130.IsSet()) || !(::FEquipmentUtils::AvatarCanEquip(local_32, local_130)))
        {
            return;
        }
        if (FECSEntity(this.GetPlayerEntityIdByUid(PlayerUid)).IsValid())
        {
            FCE_OnWearEquipReq local_232;
            FFPTime local_228 = FFPTime(-1);
            local_232.AvatarId = local_4.GetAvatarId();
            local_232.EquipSlot = EEquipSlotType(1);
            local_232.ItemUid = local_4.GetWeapon().GetGuid();
            local_232.SwitchAvatarId = local_4.GetSwitchedAvatarId();
            local_232.SwitchEquipSlot = EEquipSlotType(1);
            ::FEquipmentUtils::MakeEquipmentDataByPbEquip(local_4.GetWeapon().GetItemId(), local_4.GetWeapon().GetEquip());
        }
        return;
    }
    UFUNCTION()
    void OnManageTalismanReq(const FProtoWrapper &in ProtoWrapper, const uint PlayerUid)
    {
        FPbManageTalismanReq local_4 = FPbManageTalismanReq::FromWrapper(ProtoWrapper);
        int local_67 = local_4.GetCurAvatarInfo().GetAvatarId();
        GetDataObjectByGSDataId<FAvatarPrefabConfig> local_66;
        TDataObjectPtr<FAvatarPrefabConfig> local_32 = local_66.opImplConv();
        bool local_117 = !(local_32.IsSet());
        if (local_117)
        {
            return;
        }
        int local_67_2 = local_4.GetCurAvatarInfo().GetTalisman().GetItemId();
        if (local_67_2 != 0)
        {
            GetDataObjectByGSDataId<FEquipmentConfig> local_178;
            int local_129 = local_4.GetCurAvatarInfo().GetTalisman().GetItemId();
            TDataObjectPtr<FEquipmentConfig> local_154 = local_178.opImplConv();
            if (!(local_154.IsSet()) || !(::FEquipmentUtils::AvatarCanEquip(local_32, local_154)))
            {
                return;
            }
        }
        int local_67_3 = local_4.GetSwitchedAvatarInfo().GetAvatarId();
        if (local_67_3 == 0)
        {
            local_117 = false;
        }
        else
        {
            int local_129_2 = local_4.GetSwitchedAvatarInfo().GetTalisman().GetItemId();
            local_117 = (local_129_2 != 0);
        }
        if (local_117)
        {
            GetDataObjectByGSDataId<FEquipmentConfig> local_178;
            int local_67_4 = local_4.GetSwitchedAvatarInfo().GetAvatarId();
            TDataObjectPtr<FAvatarPrefabConfig> local_252 = local_66.opImplConv();
            int local_67_5 = local_4.GetSwitchedAvatarInfo().GetTalisman().GetItemId();
            TDataObjectPtr<FEquipmentConfig> local_154_2 = local_178.opImplConv();
            if (local_252.IsSet() && local_154_2.IsSet() && !(::FEquipmentUtils::AvatarCanEquip(local_252, local_154_2)))
            {
                return;
            }
        }
        if (FECSEntity(this.GetPlayerEntityIdByUid(PlayerUid)).IsValid())
        {
            FCE_OnWearEquipReq local_270;
            FFPTime local_266 = FFPTime(-1);
            local_270.AvatarId = local_4.GetCurAvatarInfo().GetAvatarId();
            local_270.EquipSlot = EEquipSlotType((local_4.GetCurAvatarInfo().GetSlot() + 2));
            local_270.ItemUid = local_4.GetCurAvatarInfo().GetTalismanGuid();
            ::FEquipmentUtils::MakeEquipmentDataByPbEquip(local_4.GetCurAvatarInfo().GetTalisman().GetItemId(), local_4.GetCurAvatarInfo().GetTalisman().GetEquip());
            local_270.SwitchAvatarId = local_4.GetSwitchedAvatarInfo().GetAvatarId();
            local_270.SwitchEquipSlot = EEquipSlotType((local_4.GetSwitchedAvatarInfo().GetSlot() + 2));
            local_270.SwitchItemUid = local_4.GetSwitchedAvatarInfo().GetTalismanGuid();
            ::FEquipmentUtils::MakeEquipmentDataByPbEquip(local_4.GetSwitchedAvatarInfo().GetTalisman().GetItemId(), local_4.GetSwitchedAvatarInfo().GetTalisman().GetEquip());
        }
        return;
    }
    UFUNCTION()
    void OnChangeDivineSkillReq(const FProtoWrapper &in ProtoWrapper, const uint PlayerUid)
    {
        FPbChangeDivineSkillReq local_4 = FPbChangeDivineSkillReq::FromWrapper(ProtoWrapper);
        if (FECSEntity(this.GetPlayerEntityIdByUid(PlayerUid)).IsValid())
        {
            FCE_OnChangeDivineSkillReq local_30;
            FFPTime local_26 = FFPTime(-1);
            int local_9 = local_4.GetDivineSkillId();
            GetDataObjectByGSDataId<FDivineSkillConfig> local_54;
            local_30.DivineSkillData.SetSkillConfig(this.GetValidatedDivineSkill(local_54.opImplConv()));
            local_30.DivineSkillData.GetSkillConfig().GetDataName();
            FString local_130 = FString();
            local_30.bNeedReply = true;
        }
        return;
    }
    UFUNCTION()
    void SendPurchaseCuisineRequest(const FECSEntity &inout PlayerEntity, const uint CityId, const uint CuisineType, const uint CoinCost, const uint BuffId)
    {
        int local_6;
        Has local_4;
        local_4.opCall();
        Get local_10;
        local_6 = local_10.opCall().GetPlayerId();
        FPbPurchaseCuisineReq local_16;
        local_16.SetCityId(CityId);
        local_16.SetCuisineType(CuisineType);
        local_16.SetCoinCost(CoinCost);
        local_16.SetBuffId(BuffId);
        this.SendProtoWrapperByPlayerUid(local_6, local_16.ToWrapper());
        XLog(ELog(27), FString().Append("SendPurchaseCuisineRequest PlayerEntity=").Append(PlayerEntity).Append(" PlayerUid=").Append(local_6).Append(" CoinCost=").Append(CoinCost).Append(" BuffId=").Append(BuffId));
        return;
    }
    UFUNCTION()
    void OnAddDsBuffReq(const FProtoWrapper &in ProtoWrapper, const uint PlayerUid)
    {
        bool local_39;
        int local_65;
        int local_103;
        FPbAddDsBuffReq local_4 = FPbAddDsBuffReq::FromWrapper(ProtoWrapper);
        FECSEntity local_14 = FECSEntity(this.GetPlayerEntityIdByUid(PlayerUid));
        FPbDsPlayerInfo local_38 = this.GetPlayerInfo(PlayerUid);
        if (local_14.IsValid())
        {
            FECSEntity local_18;
            ::FASCommonUtils::GetControlledPawnEntity(local_18);
            if (!(local_18.IsValid()))
            {
                local_39 = false;
            }
            else
            {
                Has local_48;
                local_39 = local_48.opCall();
            }
            if (local_39)
            {
                int local_50 = 0;
                for (; local_50 < local_4.GetBuffIdList_Num(); )
                {
                    int local_51 = local_4.GetBuffIdList_Index(local_50);
                    TArray<TDataObjectPtr<FGameplayModifierConfig>> local_60;
                    TArray<TDataObjectPtr<FMetaBuffCapabilityConfig>> local_64;
                    local_65 = 0;
                    for (; local_65 < local_38.GetNewBuffList_Num(); ++local_65)
                    {
                        if (local_38.GetNewBuffList_Index(local_65).GetKey() == local_51)
                        {
                            FPbUint32ListPair local_76 = local_38.GetNewBuffList_Index(local_65);
                            TArray<uint> local_90;
                            local_76.GetValues(local_90);
                            auto local_96 = local_90.Iterator();
                            for (; local_96.CanProceed;)
                            {
                                local_60.Add(::FGameplayModifier::GetByDataId(local_96.Proceed()));
                            }
                            break;
                        }
                    }
                    local_103 = 0;
                    for (; local_103 < local_38.GetMetaBuffCapList_Num(); ++local_103)
                    {
                        if (local_38.GetMetaBuffCapList_Index(local_103).GetKey() == local_51)
                        {
                            FPbUint32ListPair local_86 = local_38.GetMetaBuffCapList_Index(local_103);
                            TArray<uint> local_90;
                            local_86.GetValues(local_90);
                            auto local_102 = local_90.Iterator();
                            for (; local_102.CanProceed;)
                            {
                                local_64.Add(::FMetaBuffCapabilityConfig::GetByDataId(local_102.Proceed()));
                            }
                            break;
                        }
                    }
                    XLog(ELog(27), FString().Append("OnAddDsBuffReq PawnEntity=").Append(local_18).Append(" buff_id=").Append(local_51));
                    ::FMetaBuffUtils::AddMetaBuff(local_14, ::FMetaBuffConfig::GetByDataId(local_51), local_60, local_64);
                    ++local_50;
                }
            }
        }
        return;
    }
    int SendAwaitGsResourceRequest(const FECSEntity &inout PlayerEntity, FPbGetGsResourceReq &inout GsResourceReq, const FInstancedStruct &inout CallbackInstance)
    {
        Has local_4;
        int local_13;
        if (!(local_4.opCall()))
        {
            XError(ELog(27), FString().Append("SendAwaitGsResourceRequest PlayerEntity=").Append(PlayerEntity).Append(" is not a player controller"));
            return -1;
        }
        Get local_18;
        local_13 = local_18.opCall().GetPlayerId();
        FAwaitGsResourceCallback local_22;
        local_22.CallbackInstance = CallbackInstance;
        return this.AwaitGsResource(local_13, local_22, GsResourceReq);
    }
    int AddGsOpAndSendExecuteRequest(const FECSEntity &inout PlayerEntity, FPbGsOp &inout GsOp)
    {
        Has local_4;
        int local_13;
        if (!(local_4.opCall()))
        {
            XError(ELog(27), FString().Append("AddGsOpAndSendExecuteRequest PlayerEntity=").Append(PlayerEntity).Append(" is not a player controller"));
            return -1;
        }
        Get local_18;
        local_13 = local_18.opCall().GetPlayerId();
        return this.AddAndSendGsOp(local_13, GsOp);
    }
}

event void FOnPlayerExitDSDelegate(const FECSEntity &inout PlayerEntity);

