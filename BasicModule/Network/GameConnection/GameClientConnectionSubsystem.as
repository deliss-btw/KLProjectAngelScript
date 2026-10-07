

struct FClientPingInfo
{
    UPROPERTY()
    FString Address;
    UPROPERTY()
    int Port = 0;
    UPROPERTY()
    float32 PingMs = -1.0f;
    UPROPERTY()
    float32 AvgPingMs = -1.0f;
    UPROPERTY()
    int PingSampleCount = 0;


}

class UGameClientConnectionSubsystem : UGameClientConnectionSubsystemBase
{
    FString TEST_TOKEN = "test_token";
    FString TEST_DEVICE_NAME = "test_device_name";
    FString CachedLoginUserName;
    FString CachedLoginUserId;
    FString CachedDsId;
    FString CachedVOXAuthKey;
    FString CachedVOXAppId;
    FString CachedFeedbackToken;
    FString CachedSDKOpenId;
    FString CachedSDKComboId;
    FString CachedSDKDeviceId;
    FString CachedSDKChannelId;
    FString CachedSDKAppId;
    FString CachedSDKClientType;
    int CachedSDKAccountType = 0;
    bool bCachedSDKGuest = false;
    FString CachedGateAddress;
    FProtoRspDelegate EnterDSRspDelegate;
    FProtoRspDelegate PlayerEnterDSNotifyDelegate;
    FProtoRspDelegate SocialTeamInfoNotifyDelegate;
    FProtoRspDelegate QueryGmlistRspDelegate;
    FProtoRspDelegate PlatformAntiAddictNotifyDelegate;
    FProtoRspDelegate DSVersionNotifyDelegate;
    FProtoRspDelegate DsAllocatingNotifyDelegate;
    FProtoRspDelegate KickPlayerNotifyDelegate;
    FProtoRspDelegate ReloginNotifyDelegate;
    FProtoRspDelegate ClientHotPatchNotifyDelegate;
    FProtoRspDelegate ServerExecConsoleCommandNotifyDelegate;
    FProtoRspDelegate ClientControlSwitchNotify;
    bool bClientHotPatchNotified = false;
    UPROPERTY()
    FClientSocialTeamInfo ClientSocialTeamInfo;
    UPROPERTY()
    FClientPingInfo GatePingInfo;
    UPROPERTY()
    FClientPingInfo DSPingInfo;
    FOnUDPPingComplete PingCompleteDelegate;
    TArray<FString> CachedGmList;
    bool bInLoginPhase = false;


    UFUNCTION()
    void OnInitialize_Implementation()
    {
        UKLGameInstance local_6 = (Cast<UKLGameInstance>(this.GetOuter()));
        if (local_6 != nullptr)
        {
            local_6.GetPreFastTravelToSameMapDelegate().AddUFunction(this, n"OnPreFastTravelToSameMap");
            local_6.GetPostFastTravelToSameMapDelegate().AddUFunction(this, n"OnPostFastTravelToSameMap");
        }
        FOnReceiveErrorCodeDelegate local_12 = FOnReceiveErrorCodeDelegate(this, n"OnReceiveErrorCode");
        this.RegisterErrorCodeDelegate(local_12);
        this.EnterDSRspDelegate.BindUFunction(this, n"OnEnterDsInfoNotify");
        this.RegisterProtoRsp(uint16(115), this.EnterDSRspDelegate);
        this.PlayerEnterDSNotifyDelegate.BindUFunction(this, n"OnPlayerEnterDSNotify");
        this.RegisterProtoRsp(uint16(9), this.PlayerEnterDSNotifyDelegate);
        this.SocialTeamInfoNotifyDelegate.BindUFunction(this, n"OnSocialTeamInfoNotify");
        this.RegisterProtoRsp(uint16(405), this.SocialTeamInfoNotifyDelegate);
        this.QueryGmlistRspDelegate.BindUFunction(this, n"OnQueryGmlistRsp");
        this.RegisterProtoRsp(uint16(209), this.QueryGmlistRspDelegate);
        this.PlatformAntiAddictNotifyDelegate.BindUFunction(this, n"OnPlatformAntiAddictNotify");
        this.RegisterProtoRsp(uint16(12), this.PlatformAntiAddictNotifyDelegate);
        this.KickPlayerNotifyDelegate.BindUFunction(this, n"OnKickoutPlayerNotify");
        this.RegisterProtoRsp(uint16(11), this.KickPlayerNotifyDelegate);
        this.ReloginNotifyDelegate.BindUFunction(this, n"OnReloginNotify");
        this.RegisterProtoRsp(uint16(18), this.ReloginNotifyDelegate);
        this.ClientHotPatchNotifyDelegate.BindUFunction(this, n"OnClientHotPatchNotify");
        this.RegisterProtoRsp(uint16(213), this.ClientHotPatchNotifyDelegate);
        this.DSVersionNotifyDelegate.BindUFunction(this, n"OnDSVersionNotify");
        this.RegisterProtoRsp(uint16(116), this.DSVersionNotifyDelegate);
        this.DsAllocatingNotifyDelegate.BindUFunction(this, n"OnDsAllocatingNotify");
        this.RegisterProtoRsp(uint16(154), this.DsAllocatingNotifyDelegate);
        this.ServerExecConsoleCommandNotifyDelegate.BindUFunction(this, n"OnServerExecConsoleCommandNotify");
        this.RegisterProtoRsp(uint16(215), this.ServerExecConsoleCommandNotifyDelegate);
        this.ClientControlSwitchNotify.BindUFunction(this, n"OnClientControlSwitchNotify");
        this.RegisterProtoRsp(uint16(216), this.ClientControlSwitchNotify);
        this.PingCompleteDelegate.BindUFunction(this, n"OnUDPPingComplete");
        UUDPPingSubsystem::Get().RegisterPingCompleteDelegate(this.PingCompleteDelegate);
        this.OnKCPDisconnected.AddUFunction(this, n"OnDisconnectedFromGSCallback");
        return;
    }
    UFUNCTION()
    void OnLocalPlayerCreated_Implementation(const ULocalPlayer LocalPlayer)
    {
        UECSLocalPlayer local_4 = (Cast<UECSLocalPlayer>(LocalPlayer));
        if (local_4 != nullptr)
        {
            local_4.OnDisconnectedFromDS.AddUFunction(this, n"OnDisconnectedFromDSCallback");
        }
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
        local_14.Side = 0;
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
    void SetCachedLoginUserId(const uint Uid)
    {
        this.CachedLoginUserId = (FString("") + Uid);
        return;
    }
    FString GetCachedDsId() const
    {
        return this.CachedDsId;
    }
    void SetCachedVOXAuthKey(const FString &inout InAuthKey)
    {
        this.CachedVOXAuthKey = InAuthKey;
        XLog(ELog(1), "[VOX] Auth key cached via subsystem");
        return;
    }
    void SetCachedVOXAppId(const FString &inout InAppId)
    {
        this.CachedVOXAppId = InAppId;
        return;
    }
    FString GetCachedVOXAuthKey() const
    {
        return this.CachedVOXAuthKey;
    }
    FString GetCachedVOXAppId() const
    {
        return this.CachedVOXAppId;
    }
    void SetCachedFeedbackToken(const FString &inout InFeedbackToken)
    {
        this.CachedFeedbackToken = InFeedbackToken;
        return;
    }
    FString GetCachedFeedbackToken() const
    {
        return this.CachedFeedbackToken;
    }
    FString GetCachedSDKOpenId() const
    {
        return this.CachedSDKOpenId;
    }
    FString GetCachedSDKComboId() const
    {
        return this.CachedSDKComboId;
    }
    FString GetCachedSDKDeviceId() const
    {
        return this.CachedSDKDeviceId;
    }
    FString GetCachedSDKChannelId() const
    {
        return this.CachedSDKChannelId;
    }
    FString GetCachedSDKAppId() const
    {
        return this.CachedSDKAppId;
    }
    FString GetCachedSDKClientType() const
    {
        return this.CachedSDKClientType;
    }
    int GetCachedSDKAccountType() const
    {
        return this.CachedSDKAccountType;
    }
    bool IsCachedSDKGuest() const
    {
        return this.bCachedSDKGuest;
    }
    void SetCachedGateAddress(const FString &inout InGateAddress)
    {
        this.CachedGateAddress = InGateAddress;
        return;
    }
    FString GetCachedGateAddress() const
    {
        return this.CachedGateAddress;
    }
    UFUNCTION()
    void OnQueryGmlistRsp(const FProtoWrapper &in ProtoWrapper)
    {
        XLog(ELog(27), FString().Append("OnQueryGmlistRsp"));
        FPbQueryGmListRsp local_14 = FPbQueryGmListRsp::FromWrapper(ProtoWrapper);
        TArray<FString> local_18;
        local_14.GetGmList(local_18);
        this.CachedGmList = local_18;
        return;
    }
    TArray<FString> GetCachedGmList() const
    {
        return this.CachedGmList;
    }
    UFUNCTION()
    void OnPlatformAntiAddictNotify(const FProtoWrapper &in ProtoWrapper)
    {
        XLog(ELog(27), FString().Append("OnPlatformAntiAddictNotify"));
        FPbPlatformAntiAddictNotify local_14 = FPbPlatformAntiAddictNotify::FromWrapper(ProtoWrapper);
        FString local_4 = local_14.GetMsg();
        FString local_18 = local_14.GetLevel();
        XLog(ELog(27), FString().Append("PlatformAntiAddictNotify - Level: ").Append(local_18).Append(", Msg: ").Append(local_4));
        FText local_30 = NSLOCTEXT("AntiAddiction", "Title", "йІжІ‰иї·жЏђз¤є");
        FText local_26 = FText::FromString(local_4);
        FString local_22 = local_18.ToLower();
        if (local_22.Contains("error", ESearchCase(1), ESearchDir(0)))
        {
            UMiHoYoSDKHelper::LogToScreenAndConsole(FString().Append(local_30).Append(":").Append(local_26), 10.0f);
            UMiHoYoSDKHelper::Logout(1);
        }
        else
        {
            if (local_22.Contains("warn", ESearchCase(1), ESearchDir(0)))
            {
                UMiHoYoSDKHelper::LogToScreenAndConsole(FString().Append(local_30).Append(":").Append(local_26), 10.0f);
            }
            else
            {
                XLog(ELog(27), FString().Append("Unknown anti-addict level: ").Append(local_18).Append(", using Warn callback"));
            }
        }
        return;
    }
    UFUNCTION()
    void OnKickoutPlayerNotify(const FProtoWrapper &in ProtoWrapper)
    {
        FPbKickoutPlayerNotify local_8 = FPbKickoutPlayerNotify::FromWrapper(ProtoWrapper);
        XLog(ELog(27), FString().Append("OnKickPlayerDSNotify Reason=").Append(local_8.GetReason()));
        UMiHoYoSDKHelper::LogToScreenAndConsole(FString().Append("OnKickPlayerDSNotify Reason=").Append(local_8.GetReason()), 10.0f);
        UMiHoYoSDKHelper::Logout(1);
        this.EndKcpClient();
        this.ShowDisconnectDialog(::FGameConnectionUtils::GetKickoutErrorCodeText(local_8.GetReason()));
        return;
    }
    UFUNCTION()
    void OnReloginNotify(const FProtoWrapper &in ProtoWrapper)
    {
        FPbReloginNotify::FromWrapper(ProtoWrapper);
        XLog(ELog(27), FString().Append("OnReloginNotify"));
        this.ShowDisconnectDialog(NSLOCTEXT("Disconnect", "GSDisconnect", "жњЌеЉЎе™ЁиїћжЋҐж–­ејЂ"));
        return;
    }
    UFUNCTION()
    void OnClientHotPatchNotify(const FProtoWrapper &in ProtoWrapper)
    {
        if (this.bClientHotPatchNotified)
        {
            XLog(ELog(27), "OnClientHotPatchNotify ignored: dialog already shown this session");
            return;
        }
        this.bClientHotPatchNotified = true;
        bool local_1 = FPbClientHotPatchNotify::FromWrapper(ProtoWrapper).GetNeedExitClient();
        XLog(ELog(27), FString().Append("OnClientHotPatchNotify need_exit_client=").Append(local_1));
        FText local_24 = NSLOCTEXT("HotPatch", "Title", "з‰€жњ¬ж›ґж–°");
        FDialogDynamicCallback local_28;
        FCommonDialogParam local_30;
        local_30.bIsForbidIgnored = true;
        if (local_1)
        {
            FText local_20 = NSLOCTEXT("HotPatch", "ExitClientMessage", "жёёж€Џз‰€жњ¬е·Іж›ґж–°пјЊиЇ·йЂЂе‡єжёёж€ЏеђЋй‡Ќж–°еђЇеЉЁе®ўж€·з«ЇгЂ‚");
            local_28.BindUFunction(this, n"OnClientHotPatchExitGameConfirmed");
            ::CommonPopup::Dialog_Confirm(local_24, local_20, FDialogCallback(local_28), FText(), local_30);
        }
        else
        {
            FText local_34 = NSLOCTEXT("HotPatch", "ReturnLoginMessage", "жёёж€Џз‰€жњ¬е·Іж›ґж–°пјЊиЇ·иї”е›ћз™»еЅ•з•ЊйќўгЂ‚");
            local_28.BindUFunction(this, n"OnClientHotPatchReturnLoginConfirmed");
            ::CommonPopup::Dialog_Confirm(local_24, local_34, FDialogCallback(local_28), FText(), local_30);
        }
        return;
    }
    UFUNCTION()
    bool OnClientHotPatchExitGameConfirmed(const FCommonDialogAnswer &inout Answer)
    {
        APlayerController local_6;
        UECSLocalPlayer local_18;
        if (int(Answer.AnswerType) != 1)
        {
            return true;
        }
        UKLGameInstance local_12 = (Cast<UKLGameInstance>(this.GetOuter()));
        if (local_12 != nullptr)
        {
            local_18 = (Cast<UECSLocalPlayer>(local_12.GetLocalPlayerByIndex(0)));
            if (local_18 != nullptr)
            {
                local_6 = local_18.GetUEPlayerController();
            }
        }
        ::FGameConnectionUtils::UICallForceQuitGame(local_6);
        return true;
    }
    UFUNCTION()
    bool OnClientHotPatchReturnLoginConfirmed(const FCommonDialogAnswer &inout Answer)
    {
        if (int(Answer.AnswerType) == 1)
        {
            this.EndKcpClient();
            EngineUtils::BrowseToDefaultMap(__GetWorldContext());
        }
        return true;
    }
    void ResetClientHotPatchNotified()
    {
        this.bClientHotPatchNotified = false;
        return;
    }
    UFUNCTION()
    void OnServerExecConsoleCommandNotify(const FProtoWrapper &in ProtoWrapper)
    {
        FPbServerExecConsoleCommandNotify local_8 = FPbServerExecConsoleCommandNotify::FromWrapper(ProtoWrapper);
        FString local_16 = local_8.GetCmd();
        XLog(ELog(27), FString().Append("OnServerExecConsoleCommandNotify Command=").Append(local_16));
        if (local_16.IsEmpty())
        {
            return;
        }
        System::ExecuteConsoleCommand(__GetWorldContext(), local_16, nullptr);
        return;
    }
    UFUNCTION()
    void OnClientControlSwitchNotify(const FProtoWrapper &in ProtoWrapper)
    {
        FPbClientControlSwitchNotify local_8 = FPbClientControlSwitchNotify::FromWrapper(ProtoWrapper);
        FString local_16 = local_8.GetSwitchInfo();
        XLog(ELog(27), FString().Append("ClientControlSwitchNotify Command=").Append(local_16));
        if (local_16.IsEmpty())
        {
            return;
        }
        AECSGameManagerActor::CVarOverrideFromServer(local_16);
        return;
    }
    UFUNCTION()
    bool OnAntiAddictWarnConfirmed(const FCommonDialogAnswer &inout Answer)
    {
        XLog(ELog(27), FString().Append("OnAntiAddictWarnConfirmed - User acknowledged the warning"));
        return true;
    }
    UFUNCTION()
    bool OnAntiAddictErrorConfirmed(const FCommonDialogAnswer &inout Answer)
    {
        XLog(ELog(27), FString().Append("OnAntiAddictErrorConfirmed - User confirmed, logging out"));
        if (int(Answer.AnswerType) == 1)
        {
            UMiHoYoSDKHelper::Logout(0);
            this.PlayerLogout();
            this.EndKcpClient();
        }
        return true;
    }
    UFUNCTION()
    void OnPreFastTravelToSameMap(const UWorld InWorld)
    {
        XLog(ELog(27), FString().Append("OnPreFastTravelToSameMap"));
        UKLGameInstance local_12 = (Cast<UKLGameInstance>(this.GetOuter()));
        if (local_12 != nullptr)
        {
            FEUIWidget::RemoveLayoutWidgets(local_12.GetLocalPlayerByIndex(0), EEUILayoutLayer(4));
        }
        return;
    }
    UFUNCTION()
    void OnPostFastTravelToSameMap(const UWorld InWorld)
    {
        XLog(ELog(27), FString().Append("OnPostFastTravelToSameMap"));
        AAS_ECSWorldSettings local_12 = (Cast<AAS_ECSWorldSettings>(InWorld.GetWorldSettings()));
        if (local_12 != nullptr)
        {
            local_12.InitLevelInfo();
        }
        return;
    }
    void ClearCacheData()
    {
        this.CachedLoginUserName = "";
        this.CachedLoginUserId = "";
        this.CachedDsId = "";
        this.CachedFeedbackToken = "";
        return;
    }
    UFUNCTION()
    void OnReceiveErrorCode(const int ErrorCode)
    {
        ELog local_8;
        (FString("Error code received ErrorCode=") + int(local_8));
        UKLGameInstance local_16 = (Cast<UKLGameInstance>(this.GetOuter()));
        if (local_16 != nullptr)
        {
            ULocalPlayer local_22 = local_16.GetLocalPlayerByIndex(0);
            if (local_22 != nullptr)
            {
                ::FGameConnectionUtils::DisplayErrorCodeWithoutECSWorld(local_22, ErrorCode);
            }
        }
        return;
    }
    UFUNCTION()
    void OnDsAllocatingNotify(const FProtoWrapper &in ProtoWrapper)
    {
        FPbDsAllocatingNotify local_8 = FPbDsAllocatingNotify::FromWrapper(ProtoWrapper);
        int local_10 = local_8.GetEnterDsSource();
        bool local_12 = local_8.GetIsStart();
        int local_14 = local_8.GetRetcode();
        if (local_14 != 0)
        {
            XLog(ELog(27), FString().Append("OnDsAllocatingNotify failed: retcode=").Append(local_14));
            ::FGameConnectionUtils::DisplayErrorCode(local_14);
        }
        XLog(ELog(27), FString().Append("[KFlow:").Append(this.CachedLoginUserId).Append("] OnDsAllocatingNotify EnterDsSource=").Append(local_10).Append(" bIsDsAllocating=").Append(local_12));
        return;
    }
    UFUNCTION()
    void OnDSVersionNotify(const FProtoWrapper &in ProtoWrapper)
    {
        FPbDSVersionNotify local_8 = FPbDSVersionNotify::FromWrapper(ProtoWrapper);
        int local_18 = local_8.GetDsChangelist();
        int local_17 = this.GetChangeList();
        XWarning(ELog(27), FString().Append("OnDSVersionNotify version mismatch! DS Version=").Append(local_8.GetDsVersion()).Append(" DS CL=").Append(local_18).Append(" Client CL=").Append(local_17));
        if (local_18 != local_17)
        {
            UMiHoYoSDKHelper::LogToScreenAndConsole(FString().Append("з‰€жњ¬дёЌеЊ№й…Ќ - е®ўж€·з«Ї: CL ").Append(local_17).Append(", жњЌеЉЎе™Ё: CL ").Append(local_18), 30.0f);
        }
        return;
    }
    UFUNCTION()
    void OnPlayerEnterDSNotify(const FProtoWrapper &in ProtoWrapper)
    {
        FPbPlayerEnterDSNotify local_8 = FPbPlayerEnterDSNotify::FromWrapper(ProtoWrapper);
        FString local_14 = "OnPlayerEnterDSNotify Retcode=";
        int local_9 = local_8.GetRetcode();
        ELog local_18;
        (local_14 + int(local_18));
        FString local_14_2 = (local_18 + " LevelKey=");
        int local_19 = local_8.GetLevelKey();
        (local_14_2 + int(local_18));
        if (local_8.GetRetcode() != 0)
        {
            FCommonTipsParam local_30;
            ::CommonPopup::Tips(NSLOCTEXT("EnterDS", "EnterDS_Failed", "иї›е…ҐDSе¤±иґҐ"), local_30);
        }
        return;
    }
    UFUNCTION()
    void OnEnterDsInfoNotify(const FProtoWrapper &in ProtoWrapper)
    {
        UKLGameInstance local_42;
        FPbEnterDsInfoNotify local_8 = FPbEnterDsInfoNotify::FromWrapper(ProtoWrapper);
        FString local_16 = local_8.GetDsUrl();
        int local_21 = local_16.Find("DsID=", ESearchCase(1), ESearchDir(0), -1);
        if (local_21 >= 0)
        {
            FString local_12 = local_16.Mid(local_21 + 5, 2147483647);
            int local_18 = local_12.Find("?", ESearchCase(1), ESearchDir(0), -1);
            if (local_18 >= 0)
            {
                local_12 = local_12.Left(local_18);
            }
            this.CachedDsId = local_12;
        }
        UPerformanceUtils::SetDebugDsId(this.CachedDsId);
        int local_28 = local_16.Find("NickName=", ESearchCase(1), ESearchDir(0), -1);
        if (local_28 >= 0)
        {
            FString local_26 = local_16.Mid(local_28 + 9, 2147483647);
            int local_27 = local_26.Find("?", ESearchCase(1), ESearchDir(0), -1);
            if (local_27 >= 0)
            {
                local_26 = local_26.Left(local_27);
            }
            UPerformanceUtils::SetDebugPlayerName(local_26);
        }
        XLog(ELog(27), (FString(FString().Append("[KFlow:").Append(this.CachedLoginUserId).Append("] OnEnterDsInfoNotify DsId=").Append(this.CachedDsId).Append(" ")) + local_16));
        if (local_16.IsEmpty())
        {
            XLog(ELog(27), FString().Append("[KFlow:").Append(this.CachedLoginUserId).Append("] OnEnterDsInfoNotify failed: DSUrl is empty!"));
            return;
        }
        if (UECSReplayRecorderSubsystem::IsReplayActive())
        {
            XLog(ELog(27), FString().Append("[KFlow:").Append(this.CachedLoginUserId).Append("] OnEnterDsInfoNotify skipped during replay"));
            return;
        }
        if (local_21 >= 0 && !(this.CachedDsId.IsEmpty()))
        {
            local_42 = (Cast<UKLGameInstance>(this.GetOuter()));
            if (local_42 != nullptr)
            {
                ULocalPlayer local_46 = local_42.GetLocalPlayerByIndex(0);
                if (local_46 != nullptr)
                {
                    UKLEnhancedInputManagerSubsystem local_50 = UKLEnhancedInputManagerSubsystem::Get(local_46);
                    if (local_50 != nullptr)
                    {
                        local_50.BeginTeleportInputSession(this.CachedDsId);
                    }
                }
            }
        }
        local_16 += FString().Append("?Version=").Append(this.GetClientVersion());
        UECSReplayRecorderSubsystem::Get().RecordDSSwitchEvent();
        this.EnterDSByUrl(local_16);
        return;
    }
    FString GetRegionServerUrl() const
    {
        FString local_4;
        UGameConnectionSettings local_6 = UGameConnectionSettings.GetDefaultObject();
        if (local_6 != nullptr)
        {
            local_4 = local_6.RegionServerAddr;
        }
        FString local_14;
        if (FParse::Value(FCommandLine::Get(), "RegionServer=", local_14))
        {
            local_4 = local_14;
        }
        return local_4;
    }
    FString GetClientVerForQueryRegion() const
    {
        FString local_4;
        UGameConnectionSettings local_6 = UGameConnectionSettings.GetDefaultObject();
        if (local_6 != nullptr)
        {
            local_4 = local_6.DefaultClientVer;
        }
        FString local_14;
        if (FParse::Value(FCommandLine::Get(), "ClientVer=", local_14))
        {
            local_4 = local_14;
        }
        return local_4;
    }
    void GetPlayerToken(const FString &inout UserName)
    {
        this.CachedLoginUserName = UserName;
        FString local_4 = "Req GetPlayerToken UserName:";
        FPbGetPlayerTokenReq local_14;
        local_14.SetIsSdkLogin(false);
        local_14.SetAccountType(1);
        local_14.SetAccountUid(UserName);
        local_14.SetAccountToken(this.TEST_TOKEN);
        local_14.SetPlatformType(0);
        this.SendProtoWrapper(local_14.ToWrapper());
        return;
    }
    void GetSDKPlayerToken(const FString &inout UserName, const FSDKLoginResult &in SDKLoginResult)
    {
        this.CachedLoginUserName = UserName;
        FString local_4 = "Req GetSDKPlayerToken OpenID:";
        FString local_4_2 = "  ComboToken:";
        ELog local_8;
        (FString("  AccountType:") + int(local_8));
        FString local_4_3 = (local_8 + " DeviceID:");
        this.CachedSDKOpenId = SDKLoginResult.Data.OpenId;
        this.CachedSDKComboId = SDKLoginResult.Data.ComboId;
        this.CachedSDKDeviceId = SDKLoginResult.Data.DeviceId;
        this.CachedSDKChannelId = SDKLoginResult.Data.ChannelId;
        this.CachedSDKAppId = SDKLoginResult.Data.AppId;
        this.CachedSDKClientType = SDKLoginResult.Data.ClientType;
        this.CachedSDKAccountType = int(SDKLoginResult.Data.AccountType);
        this.bCachedSDKGuest = SDKLoginResult.Data.bGuest;
        FPbGetPlayerTokenReq local_16;
        local_16.SetIsSdkLogin(true);
        local_16.SetAccountType(int(SDKLoginResult.Data.AccountType));
        local_16.SetAccountUid(SDKLoginResult.Data.OpenId);
        local_16.SetAccountToken(SDKLoginResult.Data.ComboToken);
        local_16.SetPlatformType(0);
        if (!(SDKLoginResult.Data.ChannelId.IsEmpty()) && SDKLoginResult.Data.ChannelId.IsNumeric())
        {
            local_16.SetChannelId(String::Conv_StringToInt(SDKLoginResult.Data.ChannelId));
        }
        local_16.SetDeviceId(SDKLoginResult.Data.DeviceId);
        local_16.SetClientType(SDKLoginResult.Data.ClientType);
        this.SendProtoWrapper(local_16.ToWrapper());
        return;
    }
    void PlayerLogin(const uint64 DsID, const uint LevelKey, const uint CommissionKey, const bool bEnterTestLevel, const FString &inout Token, const bool bIgnoreVersion, const bool bNeedCreatePlayer, const bool bSkipTutorial = false)
    {
        UPerformanceUtils::SetDebugPlayerName(this.CachedLoginUserName);
        XLog(ELog(27), FString().Append("[KFlow:").Append(this.CachedLoginUserId).Append("] Req PlayerLogin Name=").Append(this.CachedLoginUserName).Append(" DsId=").Append(DsID).Append(" LevelKey=").Append(LevelKey).Append(" CommissionKey=").Append(CommissionKey).Append(" bEnterTestLevel=").Append(bEnterTestLevel).Append(" ClientVersion=").Append(this.GetChangeList()));
        FPbPlayerLoginReq local_10;
        local_10.SetToken(Token);
        local_10.SetPlatformType(0);
        local_10.SetDeviceName(this.TEST_DEVICE_NAME);
        local_10.SetDsId(DsID);
        local_10.SetLevelKey(LevelKey);
        local_10.SetCommissionConfigId(CommissionKey);
        local_10.SetEnterTestLevel(bEnterTestLevel);
        local_10.SetClientVersion(this.GetClientVersion());
        local_10.SetIgnoreDsVersionCheck(bIgnoreVersion);
        local_10.SetLanguageType(::FGameConnectionUtils::GetCurrentProtoLanguageType());
        local_10.SetNeedCreatePlayer(bNeedCreatePlayer);
        local_10.SetSkipTutorialCommission(bSkipTutorial);
        local_10.SetClientBuildType(System::GetBuildConfiguration());
        local_10.SetUpdateChannel(this.GetUpdateChannel());
        this.SendProtoWrapper(local_10.ToWrapper());
        return;
    }
    void PlayerLogout()
    {
        XLog(ELog(27), FString().Append("[KFlow:").Append(this.CachedLoginUserId).Append("] Req PlayerLogout Name=").Append(this.CachedLoginUserName));
        FPbPlayerLogoutReq local_10;
        this.SendProtoWrapper(local_10.ToWrapper());
        this.ClearCacheData();
        return;
    }
    void RequestForRegionList(const FHttpRspDelegate &inout RspDelegate)
    {
        FString local_8 = this.GetRegionServerUrl();
        if (local_8.IsEmpty())
        {
            XLog(ELog(27), "RequestForRegionList failed: region server Url is empty!");
            return;
        }
        FString local_4 = this.GetClientVerForQueryRegion();
        if (!(local_4.IsEmpty()))
        {
            local_8 = FString().Append(local_8).Append("/query_region_list?ver=").Append(local_4);
        }
        else
        {
            local_8 = FString().Append(local_8).Append("/query_region_list");
        }
        this.SendHttpRequest(local_8, "GET", RspDelegate);
        return;
    }
    void RequestForGateAddress(const FString &inout RegionServerAddress, const bool bCheckCL, const FHttpRspDelegate &inout RspDelegate)
    {
        FString local_4 = RegionServerAddress;
        if (local_4.IsEmpty())
        {
            XLog(ELog(27), "RequestForGateAddress failed: region server Url is empty!");
            RspDelegate.ExecuteIfBound(false, local_4, TArray<uint8>());
            return;
        }
        FString local_18 = this.GetClientVersion();
        FString local_14 = this.GetUpdateChannel();
        bool local_23 = false;
        if (bCheckCL && !(local_18.IsEmpty()))
        {
            bool local_23_2 = true;
            local_4 = FString().Append(local_4).Append("/query_cur_region?client_ver=").Append(local_18).Append("&update_channel=").Append(local_14);
        }
        else
        {
            local_4 = FString().Append(local_4).Append("/query_cur_region");
        }
        XLog(ELog(27), FString().Append("RequestForGateAddress ServerUrl: ").Append(local_4));
        this.SendHttpRequest(local_4, "GET", RspDelegate);
        return;
    }
    void SendGmTalkReq(const FString &inout Msg)
    {
        FString local_4 = "Req GmTalkReq Msg:";
        FPbGmTalkReq local_14;
        local_14.SetMsg(Msg);
        this.SendProtoWrapper(local_14.ToWrapper());
        return;
    }
    void QueryGmlist()
    {
        XLog(ELog(27), "Req Gmlist");
        FPbQueryGmListReq local_6;
        this.SendProtoWrapper(local_6.ToWrapper());
        return;
    }
    void EnterInitScene()
    {
        XLog(ELog(27), "EnterInitScene");
        FPbEnterInitSceneReq local_6;
        this.SendProtoWrapper(local_6.ToWrapper());
        return;
    }
    void RequestCreatePlayer(const FString &inout Nickname, const uint Gender)
    {
        FString local_4 = "Req CreatePlayer Nickname:";
        ELog local_8;
        FString local_4_2 = (local_8 + " Gender:");
        (local_4_2 + int(local_8));
        FPbCreatePlayerReq local_14;
        local_14.SetNickname(Nickname);
        local_14.SetGender(Gender);
        this.SendProtoWrapper(local_14.ToWrapper());
        return;
    }
    UFUNCTION()
    void OnSocialTeamInfoNotify(const FProtoWrapper &in ProtoWrapper)
    {
        int64 local_42;
        FPbSocialTeamInfoNotify local_8 = FPbSocialTeamInfoNotify::FromWrapper(ProtoWrapper);
        bool local_10 = local_8.GetIsInTeam();
        FPbSocialTeamInfo local_30 = local_8.GetTeamInfo();
        XLog(ELog(27), FString().Append("OnSocialTeamInfoNotify: InTeam=").Append(local_10).Append(", TeamID=").Append(local_30.GetTeamId()).Append(", LeaderID=").Append(local_30.GetCaptainUid()).Append(", Members=").Append(local_30.GetUidList_Num()));
        if (local_10)
        {
            local_42 = local_30.GetTeamId();
        }
        else
        {
            local_42 = 0;
        }
        this.ClientSocialTeamInfo.TeamID = local_42;
        this.ClientSocialTeamInfo.LeaderID = local_30.GetCaptainUid();
        this.ClientSocialTeamInfo.Members.Empty(0);
        int local_44 = 0;
        for (; local_44 < local_30.GetUidList_Num(); )
        {
            FSocialTeamMember local_76;
            local_76.MemberID = local_30.GetUidList_Index(local_44).GetUid();
            local_76.MemberName = local_30.GetUidList_Index(local_44).GetNickname();
            local_76.CharacterKey = local_30.GetUidList_Index(local_44).GetCurAvatarId();
            local_76.bOffline = !(local_30.GetUidList_Index(local_44).GetIsOnline());
            int local_38 = local_30.GetUidList_Index(local_44).GetDivineSkillId();
            GetDataObjectByGSDataId<FDivineSkillConfig> local_110;
            local_76.DivineSkillData.SetSkillConfig(local_110.opImplConv());
            this.ClientSocialTeamInfo.Members.Add(local_76);
            ++local_44;
        }
        return;
    }
    void SendStartDungeonReq(const uint DungeonId)
    {
        ELog local_8;
        (FString("Req StartDungeonReq DungeonId:") + int(local_8));
        FPbStartDungeonReq local_14;
        local_14.SetDungeonId(DungeonId);
        this.SendProtoWrapper(local_14.ToWrapper());
        return;
    }
    void PingServerList(const TArray<FLoginGateInfo> &in GateInfoList)
    {
        for (auto& local_16 : GateInfoList)
        {
            XLog(ELog(27), FString().Append("PingServerList Gate=").Append(local_16.GateAddress).Append(":").Append(local_16.Port).Append(" dsa=").Append(local_16.DsaAddress).Append(":").Append(local_16.DsaPort));
            if (!(local_16.GateAddress.IsEmpty()) && (int(local_16.Port) > 0))
            {
                UUDPPingSubsystem::Get().SendPing(local_16.GateAddress, int(local_16.Port), 3.0f);
            }
            if (!(local_16.DsaAddress.IsEmpty()) && (int(local_16.DsaPort) > 0))
            {
                UUDPPingSubsystem::Get().SendPing(local_16.DsaAddress, int(local_16.DsaPort), 3.0f);
            }
        }
        return;
    }
    void StoreSelectedServerPingInfo(const FLoginGateInfo &in GateInfo)
    {
        if (GateInfo.GateAddress.IsEmpty() || (int(GateInfo.Port) <= 0))
        {
            XLog(ELog(27), FString().Append("StoreSelectedServerPingInfo SKIPPED: GateAddress is empty or Port is invalid"));
            return;
        }
        this.GatePingInfo.Address = GateInfo.GateAddress;
        this.GatePingInfo.Port = int(GateInfo.Port);
        this.GatePingInfo.PingMs = UUDPPingSubsystem::Get().GetLatestPingMs(GateInfo.GateAddress, int(GateInfo.Port));
        if (this.GatePingInfo.PingMs >= 0.0f)
        {
            this.GatePingInfo.AvgPingMs = this.GatePingInfo.PingMs;
            this.GatePingInfo.PingSampleCount = 1;
        }
        this.DSPingInfo.Address = GateInfo.DsaAddress;
        this.DSPingInfo.Port = int(GateInfo.DsaPort);
        this.DSPingInfo.PingMs = UUDPPingSubsystem::Get().GetLatestPingMs(GateInfo.DsaAddress, int(GateInfo.DsaPort));
        if (this.DSPingInfo.PingMs >= 0.0f)
        {
            this.DSPingInfo.AvgPingMs = this.DSPingInfo.PingMs;
            this.DSPingInfo.PingSampleCount = 1;
        }
        XLog(ELog(27), FString().Append("StoreSelectedServerPingInfo Gate=").Append(this.GatePingInfo.Address).Append(":").Append(this.GatePingInfo.Port).Append(" ping=").Append(this.GatePingInfo.PingMs).Append("ms DS=").Append(this.DSPingInfo.Address).Append(":").Append(this.DSPingInfo.Port).Append(" ping=").Append(this.DSPingInfo.PingMs).Append("ms"));
        return;
    }
    void UpdateDSPingTarget(const FString &inout DsaAddress, const int DsaPort)
    {
        this.DSPingInfo.Address = DsaAddress;
        this.DSPingInfo.Port = DsaPort;
        this.DSPingInfo.PingMs = -1.0f;
        this.DSPingInfo.AvgPingMs = -1.0f;
        this.DSPingInfo.PingSampleCount = 0;
        if (!(DsaAddress.IsEmpty()) && (DsaPort > 0))
        {
            UUDPPingSubsystem::Get().SendPing(DsaAddress, DsaPort, 3.0f);
        }
        XLog(ELog(27), FString().Append("UpdateDSPingTarget DS=").Append(DsaAddress).Append(":").Append(DsaPort));
        return;
    }
    void PingSelectedServer()
    {
        XLog(ELog(27), FString().Append("PingSelectedServer Gate=").Append(this.GatePingInfo.Address).Append(":").Append(this.GatePingInfo.Port).Append(" ping=").Append(this.GatePingInfo.PingMs).Append("ms DS=").Append(this.DSPingInfo.Address).Append(":").Append(this.DSPingInfo.Port));
        if (!(this.GatePingInfo.Address.IsEmpty()) && (this.GatePingInfo.Port > 0))
        {
            UUDPPingSubsystem::Get().SendPing(this.GatePingInfo.Address, this.GatePingInfo.Port, 3.0f);
        }
        if (!(this.DSPingInfo.Address.IsEmpty()) && (this.DSPingInfo.Port > 0))
        {
            UUDPPingSubsystem::Get().SendPing(this.DSPingInfo.Address, this.DSPingInfo.Port, 3.0f);
        }
        return;
    }
    bool HasSelectedServer() const
    {
        return !(this.GatePingInfo.Address.IsEmpty()) && (this.GatePingInfo.Port > 0);
    }
    FClientPingInfo GetGatePingInfo() const
    {
        FClientPingInfo __r;
        return __r;
    }
    FClientPingInfo GetDSPingInfo() const
    {
        FClientPingInfo __r;
        return __r;
    }
    UFUNCTION()
    void OnUDPPingComplete(const FUDPPingResult &in Result)
    {
        if (!(Result.bSuccess))
        {
            return;
        }
        if ((FString(Result.Address) == this.GatePingInfo.Address) && (int(Result.Port) == this.GatePingInfo.Port))
        {
            this.UpdatePingSlot(this.GatePingInfo, int(Result.PingMs));
        }
        else
        {
            if ((FString(Result.Address) == this.DSPingInfo.Address) && (int(Result.Port) == this.DSPingInfo.Port))
            {
                this.UpdatePingSlot(this.DSPingInfo, int(Result.PingMs));
            }
        }
        this.ReportPingToServer();
        return;
    }
    void UpdatePingSlot(FClientPingInfo &inout Slot, const float32 NewPingMs)
    {
        Slot.PingMs = NewPingMs;
        if (int(Slot.PingSampleCount) == 0)
        {
            Slot.AvgPingMs = NewPingMs;
        }
        else
        {
            Slot.AvgPingMs = ((Slot.AvgPingMs * 0.7f) + (NewPingMs * 0.3f));
        }
        ++Slot.PingSampleCount;
        return;
    }
    void ReportPingToServer()
    {
        if (!(this.IsConnectedToGameServer()))
        {
            return;
        }
        FPbPingReportReq local_6;
        FPbPingReportParam local_16 = local_6.GetPingReportParam();
        if (!(this.GatePingInfo.Address.IsEmpty()) && (this.GatePingInfo.Port > 0))
        {
            FPbPingData local_40 = local_16.AddPingDataList();
            local_40.SetDstIp(FString().Append(this.GatePingInfo.Address).Append(":").Append(local_40));
            local_40.SetPing(uint(int(this.GatePingInfo.AvgPingMs)));
            local_40.SetServerType(2);
        }
        if (!(this.DSPingInfo.Address.IsEmpty()) && (this.DSPingInfo.Port > 0))
        {
            FPbPingData local_50 = local_16.AddPingDataList();
            local_50.SetDstIp(FString().Append(this.DSPingInfo.Address).Append(":").Append(local_50));
            local_50.SetPing(uint(int(this.DSPingInfo.AvgPingMs)));
            local_50.SetServerType(1);
        }
        this.SendProtoWrapper(local_6.ToWrapper());
        XLog(ELog(27), FString().Append("ReportPingToServer Gate=").Append(this.GatePingInfo.PingMs).Append("ms(avg=").Append(this.GatePingInfo.AvgPingMs).Append("ms) DS=").Append(this.DSPingInfo.PingMs).Append("ms(avg=").Append(this.DSPingInfo.AvgPingMs).Append("ms)"));
        return;
    }
    FString GetClientVersion()
    {
        UKLDownloadService local_12;
        FString local_4 = "";
        USDKServiceSubSystem local_6 = USDKServiceSubSystem::Get();
        if (IsValid(local_6))
        {
            local_12 = (Cast<UKLDownloadService>(local_6.GetSdkServiceByType(ESDKServiceType(1))));
            if (IsValid(local_12))
            {
                local_4 = local_12.GetClientVersion();
            }
        }
        if (local_4.IsEmpty())
        {
            local_4 = FString().Append(this.GetChangeList());
        }
        return local_4;
    }
    FString GetUpdateChannel()
    {
        UKLDownloadService local_12;
        FString local_4 = "None";
        USDKServiceSubSystem local_6 = USDKServiceSubSystem::Get();
        if (IsValid(local_6))
        {
            local_12 = (Cast<UKLDownloadService>(local_6.GetSdkServiceByType(ESDKServiceType(1))));
            if (IsValid(local_12))
            {
                local_4 = local_12.GetUpdateChannel();
            }
        }
        return local_4;
    }
    UFUNCTION()
    void OnDisconnectedFromDSCallback(const int InReason)
    {
        APlayerController local_12;
        UKLGameInstance local_18;
        UECSLocalPlayer local_26;
        int local_2 = InReason;
        XLog(ELog(27), FString().Append("OnDisconnectedFromDSCallback Reason=").Append(local_2));
        switch (local_2)
        {
        case 6:
        {
            local_18 = (Cast<UKLGameInstance>(this.GetOuter()));
            if (local_18 != nullptr)
            {
                local_26 = (Cast<UECSLocalPlayer>(local_18.GetLocalPlayerByIndex(0)));
                if (local_26 != nullptr)
                {
                    local_12 = local_26.GetUEPlayerController();
                }
            }
            System::QuitGame(__GetWorldContext(), local_12, EQuitPreference(0), true);
            return;
        }
        case 3:
        case 5:
        {
            return;
        }
        case 4:
        default:
        {
            this.ShowDisconnectDialog(::FGameConnectionUtils::GetDSDisconnectReasonText(EDisconnectReason(local_2)));
        }
        }
    }
    void SetInLoginPhase(const bool bInPhase)
    {
        this.bInLoginPhase = bInPhase;
        return;
    }
    UFUNCTION()
    void OnDisconnectedFromGSCallback(const int InReason)
    {
        XLog(ELog(27), FString().Append("OnDisconnectedFromGSCallback Reason=").Append(InReason).Append(" bInLoginPhase=").Append(this.bInLoginPhase));
        if (this.bInLoginPhase)
        {
            return;
        }
        this.ShowDisconnectDialog(NSLOCTEXT("Disconnect", "GSDisconnect", "жњЌеЉЎе™ЁиїћжЋҐж–­ејЂ"));
        return;
    }
    ULocalPlayer GetOwningLocalPlayerSafe()
    {
        UKLGameInstance local_6 = (Cast<UKLGameInstance>(this.GetOuter()));
        if (local_6 != nullptr)
        {
            return local_6.GetLocalPlayerByIndex(0);
        }
        return nullptr;
    }
    void ShowDisconnectDialog(const FText &inout Message)
    {
        ULocalPlayer local_2 = this.GetOwningLocalPlayerSafe();
        if ((!((local_2 != nullptr))))
        {
            XError(ELog(27), "ShowDisconnectDialog: LocalPlayer invalid, skip dialog");
            return;
        }
        FDialogDynamicCallback local_10;
        local_10.BindUFunction(this, n"OnDisconnectDialogConfirmed");
        UCommonPopupSettings local_16 = ::CommonPopupSettings::Get();
        FEUIInputAction local_22;
        if (!(local_16.CommonDialogAction.Find(ECommonDialogAnswerType(1), local_22)))
        {
            return;
        }
        TArray<FCommonDialogOption> local_28;
        FText local_32;
        local_28.Add(FCommonDialogOption(ECommonDialogAnswerType(1), local_22, local_32));
        FCommonDialogParam local_78;
        ::CommonPopup_Internal::OpenDialogForLocalPlayer(local_2, NSLOCTEXT("Disconnect", "Title", "иїћжЋҐж–­ејЂ"), Message, local_28, FDialogCallback(local_10), local_78);
        return;
    }
    UFUNCTION()
    bool OnDisconnectDialogConfirmed(const FCommonDialogAnswer &inout Answer)
    {
        EngineUtils::BrowseToDefaultMap(__GetWorldContext());
        return true;
    }
}

