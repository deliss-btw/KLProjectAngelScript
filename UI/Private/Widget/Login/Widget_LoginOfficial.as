
namespace UWidget_LoginOfficial
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_LoginOfficial : UEUIActivatableWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVMS_Login> LoginVM;
    FHttpRspDelegate RecievedRegionListDelegate;
    FHttpRspDelegate RecievedGateAddressDelegate;
    FOnKCPConnectedToServerDelegate OnConnectToGateSuccessDelegate;
    FProtoRspDelegate GetPlayerTokenRspDelegate;
    FProtoRspDelegate PlayerLoginRspDelegate;
    bool bDownloadDelegatesRegistered = false;
    ULoginSettings LoginSettings;
    bool bIsSDKStartLogin = false;
    bool bCachedEnterTestLevel = false;
    uint CachedPlayerUid;
    FString CachedAccountUid;
    FString CachedToken;
    FString CachedServerId;
    bool bIsLoggingIn = false;
    bool bLoginStepTimeoutActive = false;
    float32 LoginStepTimeoutRemaining = 0.0f;
    FEUIModelWeakRef __LoginVM;


    UFUNCTION()
    void Construct_Implementation()
    {
        GetGameplaySettings<ULoginSettings> local_2;
        this.LoginSettings = local_2;
        this.RecievedRegionListDelegate.BindUFunction(this, n"OnRecievedRegionList");
        this.RecievedGateAddressDelegate.BindUFunction(this, n"OnRecievedGateAddress");
        this.OnConnectToGateSuccessDelegate.BindUFunction(this, n"OnConnectToGateSuccess");
        this.GetPlayerTokenRspDelegate.BindUFunction(this, n"OnGetPlayerTokenRsp");
        this.PlayerLoginRspDelegate.BindUFunction(this, n"OnPlayerLoginRsp");
        UGameClientConnectionSubsystem local_10 = ::UGameClientConnectionSubsystem::Get();
        local_10.ResetClientHotPatchNotified();
        if (local_10.IsConnectedToGameServer())
        {
            local_10.PlayerLogout();
            local_10.EndKcpClient();
        }
        local_10.RegisterProtoRsp(uint16(6), this.GetPlayerTokenRspDelegate);
        local_10.RegisterProtoRsp(uint16(2), this.PlayerLoginRspDelegate);
        return;
    }
    UFUNCTION()
    void OnViewUnbind_Implementation()
    {
        UKLDownloadService local_8;
        this.EndLoginPhase();
        if (this.bDownloadDelegatesRegistered)
        {
            USDKServiceSubSystem local_4 = USDKServiceSubSystem::Get();
            if (IsValid(local_4))
            {
                local_8 = (Cast<UKLDownloadService>(local_4.GetSdkServiceByType(ESDKServiceType(1))));
                if (IsValid(local_8))
                {
                }
            }
        }
        this.bDownloadDelegatesRegistered = false;
        ResetDownloadSpeedSampling();
        this.StopLoginBGM();
        return;
    }
    UFUNCTION()
    void OnViewBind_Implementation()
    {
        ResetLoginState();
        this.RecievedRegionListDelegate.RequestRegionList();
        this.PlayLoginBGM();
        return;
    }
    UFUNCTION()
    void Tick_Implementation(const FGeometry &inout MyGeometry, const float32 InDeltaTime)
    {
        if ((int(GetLoginState())) == 4)
        {
            InDeltaTime.UpdatePSOProgress();
        }
        if (this.bLoginStepTimeoutActive)
        {
            this.LoginStepTimeoutRemaining -= InDeltaTime;
            if (this.LoginStepTimeoutRemaining <= 0.0f)
            {
                this.bLoginStepTimeoutActive = false;
                this.OnLoginStepTimeout();
            }
        }
        return;
    }
    UFUNCTION()
    void OnLoginStateChanged(const ELoginState LoginState)
    {
        if (int(LoginState) == 3)
        {
            this.TryStartDownload();
            return;
        }
        if (int(LoginState) == 4)
        {
            StartPSOPrecompile();
            return;
        }
        if (int(LoginState) == 5)
        {
            this.StartLoginSDK();
            return;
        }
        if (int(LoginState) == 7)
        {
        }
        return;
    }
    UFUNCTION()
    void OnStartLoginSDKRequested(const int StartLoginSDKRequestSeq)
    {
        if (StartLoginSDKRequestSeq == 0)
        {
            return;
        }
        this.StartLoginSDK();
        return;
    }
    UFUNCTION()
    void OnContinueGameRequested(const int ContinueGameRequestSeq)
    {
        if (ContinueGameRequestSeq == 0)
        {
            return;
        }
        if (!(GetbIsSDKLoginSucc()))
        {
            this.HandleLoginFailed(0, this.GetSDKNotLoginTip());
            XError(ELog(78), "OnContinueGame: SDK login not successful, cannot proceed");
            return;
        }
        int local_1 = GetSelectRegionIndex();
        if (!(GetRegionInfos().IsValidIndex()))
        {
            XError(ELog(78), "OnContinueGame: region index invalid");
            return;
        }
        if (!(TEUIModelRef<FVM_RegionInfo>(GetRegionInfos()[]).IsValid()))
        {
            XError(ELog(78), "OnContinueGame: RegionInfo invalid");
            return;
        }
        FString local_20 = GetName().Replace("-", "_", ESearchCase(1));
        XLog(ELog(78), FString().Append("OnContinueGame: CheckDeviceLimit serverID=").Append(local_20));
        FSDKCheckDeviceLimitDelegate local_24;
        local_24.BindUFunction(this, n"OnCheckDeviceLimitResult");
        UMiHoYoSDKHelper::CheckDeviceLimit(local_20, local_24);
        return;
    }
    UFUNCTION()
    void OnCheckDeviceLimitResult(const bool bCanEnter)
    {
        if (!(bCanEnter))
        {
            XWarning(ELog(78), "OnCheckDeviceLimitResult: device limit exceeded, SDK will handle the prompt");
            ULocalPlayer local_4 = this.GetOwningLocalPlayer();
            if (IsValid(local_4))
            {
                FCommonTipsParam local_34;
                ::CommonPopup_Internal::OpenTips(this.GetLoginErrorTip(ELoginErrorTipType(0)), local_34, ECommonTipsType(0), FEUIModelContainer(), local_4);
            }
            return;
        }
        XLog(ELog(78), "OnCheckDeviceLimitResult: check passed, entering login phase and connecting to gate server");
        this.BeginLoginPhase();
        this.ConnectToGateServer();
        return;
    }
    UFUNCTION()
    void OnSwitchAccountRequested(const int SwitchAccountRequestSeq)
    {
        if (SwitchAccountRequestSeq == 0)
        {
            return;
        }
        UMiHoYoSDKHelper::Logout(1);
        this.StartLoginSDK();
        return;
    }
    UFUNCTION()
    void OnRecievedRegionList(const bool bSuccess, const FString &inout ReqURL, const TArray<uint8> &in RspData)
    {
        if (!(bSuccess))
        {
            XError(ELog(78), FString().Append("Failed to receive region list! ReqURL: ").Append(ReqURL));
            return;
        }
        FPbQueryRegionListHttpRsp local_12;
        if (!(local_12.ParseFromArray(RspData)))
        {
            XError(ELog(78), FString().Append("Failed to parse region list! ReqURL: ").Append(ReqURL));
            return;
        }
        local_12.OnRecievedRegionList();
        if (GetRegionInfos().Num() > 0)
        {
            this.RecievedGateAddressDelegate.RequestGateAddress();
        }
        return;
    }
    UFUNCTION()
    void OnRecievedGateAddress(const bool bSuccess, const FString &inout ReqURL, const TArray<uint8> &in RspData)
    {
        FPbQueryCurRegionHttpRsp local_4;
        bool local_5 = bSuccess;
        if (local_5)
        {
            if (!(local_4.ParseFromArray(RspData)))
            {
                XError(ELog(78), FString().Append("Failed to parse gate address! ReqURL: ").Append(ReqURL));
                local_5 = false;
            }
        }
        else
        {
            XWarning(ELog(78), FString().Append("Failed to receive gate address! ReqURL: ").Append(ReqURL));
        }
        local_5.OnRecievedGateAddress(local_4, ReqURL);
        return;
    }
    UFUNCTION()
    void OnConnectToGateSuccess()
    {
        XLog(ELog(78), "OnConnectToGateSuccess");
        OnConnectToGateSuccess();
        this.StartLoginStepTimeout();
        return;
    }
    UFUNCTION()
    void OnGetPlayerTokenRsp(const FProtoWrapper &in ProtoWrapper)
    {
        XLog(ELog(78), "UWidget_LoginOfficial::OnGetPlayerTokenRsp");
        FPbGetPlayerTokenRsp local_10 = FPbGetPlayerTokenRsp::FromWrapper(ProtoWrapper);
        if (local_10.GetRetcode() != 0)
        {
            this.HandleLoginFailed(local_10.GetRetcode(), this.GetLoginErrorTip(ELoginErrorTipType(3)));
            return;
        }
        this.CachedPlayerUid = local_10.GetUid();
        this.CachedServerId = local_10.GetServerId();
        this.CachedAccountUid = local_10.GetAccountUid();
        this.CachedToken = local_10.GetAccountToken();
        FString local_24 = local_10.GetAuthKey();
        if (!(local_24.IsEmpty()))
        {
            ::UGameClientConnectionSubsystem::Get().SetCachedVOXAuthKey(local_24);
            XLog(ELog(1), "[VOX] Auth key cached from login");
        }
        ::UGameClientConnectionSubsystem::Get().SetCachedFeedbackToken(local_10.GetFeedbackToken());
        this.bCachedEnterTestLevel = false;
        FSDKEnterGameInfo local_42;
        local_42.ServerID = this.CachedServerId;
        local_42.RoleID = FString().Append(this.CachedPlayerUid);
        local_42.AccountID = this.CachedAccountUid;
        this.StopLoginStepTimeout();
        FSDKWillEnterGameDelegate local_46;
        local_46.BindUFunction(this, n"OnWillEnterGameVerified");
        UMiHoYoSDKHelper::WillEnterGame(local_42, local_46);
        return;
    }
    UFUNCTION()
    void OnWillEnterGameVerified(const bool bSuccess)
    {
        XLog(ELog(78), FString().Append("UWidget_LoginOfficial::OnWillEnterGameVerified: ").Append(bSuccess));
        if (bSuccess)
        {
            this.StartLoginStepTimeout();
            ::UGameClientConnectionSubsystem::Get().PlayerLogin(0, 0, 0, false, this.CachedToken, false, true, false);
            return;
        }
        XError(ELog(78), "OnWillEnterGameVerified: SDK verification failed, please check anti-addiction or real-name status");
        this.HandleLoginFailed(0, this.GetLoginErrorTip(ELoginErrorTipType(4)));
        return;
    }
    UFUNCTION()
    void OnPlayerLoginRsp(const FProtoWrapper &in ProtoWrapper)
    {
        ULocalPlayer local_22;
        XLog(ELog(78), "OnPlayerLoginRsp");
        FPbPlayerLoginRsp local_10 = FPbPlayerLoginRsp::FromWrapper(ProtoWrapper);
        if (!(local_10.IsValid()))
        {
            XError(ELog(78), "OnPlayerLoginRsp: PlayerLoginRsp is invalid");
            this.HandleLoginFailed(0, this.GetLoginErrorTip(ELoginErrorTipType(5)));
            return;
        }
        if (local_10.GetRetcode() != 0)
        {
            this.HandleLoginFailed(local_10.GetRetcode(), this.GetLoginErrorTip(ELoginErrorTipType(5)));
            return;
        }
        this.EndLoginPhase();
        UMiHoYoSDKHelper::LogToScreenAndConsole("GS Login Success", 5.0f);
        this.ReportBaseInfo();
        local_10.OnPlayerLoginRsp();
        ::FMS_Login::Get(this.GetOwningLocalPlayer()).SetCanCreatePlayer(false);
        if (local_10.GetPlayerPhase() == 1)
        {
            FMsg_LoginNextPhase local_26;
            this.ClosePage(false);
            ::FMS_Login::Get(this.GetOwningLocalPlayer()).SetCanCreatePlayer(true);
            local_22 = this.GetOwningLocalPlayer();
            FEUIMessageBus::Publish(EUIMessageBus);
            local_26.NextPhase = ELoginShowPhase(2);
        }
        else
        {
            FMsg_LoginNextPhase local_26;
            if (local_10.GetPlayerPhase() == 2)
            {
                local_22 = this.GetOwningLocalPlayer();
                FEUIMessageBus::Publish(EUIMessageBus);
                local_26.NextPhase = ELoginShowPhase(5);
            }
        }
        return;
    }
    void HandleLoginFailed(const int Retcode, const FText &inout FallbackTip)
    {
        const UErrorCodeSettings local_14;
        this.EndLoginPhase();
        this.ResetCachedLoginInfo();
        OnSDKEnterGameFailed();
        FText local_4 = FallbackTip;
        if (local_4.IsEmpty())
        {
            local_4 = this.GetLoginErrorTip(ELoginErrorTipType(6));
        }
        if (Retcode != 0)
        {
            GetGameplaySettings<UErrorCodeSettings> local_16;
            local_14 = local_16;
            FText local_22;
            if (local_14.GetErrorCodeText(Retcode, local_22))
            {
                local_4 = local_22;
            }
        }
        ULocalPlayer local_24 = this.GetOwningLocalPlayer();
        if (IsValid(local_24))
        {
            FCommonTipsParam local_44;
            ::CommonPopup_Internal::OpenTips(local_4, local_44, ECommonTipsType(0), FEUIModelContainer(), local_24);
        }
        this.CancelConnecting();
        XError(ELog(78), FString().Append("Login failed. retcode=").Append(Retcode).Append(", message=").Append(local_4.ToString()));
        return;
    }
    void CancelConnecting()
    {
        ::UGameClientConnectionSubsystem::Get().PlayerLogout();
        ::UGameClientConnectionSubsystem::Get().EndKcpClient();
        return;
    }
    void BeginLoginPhase()
    {
        this.bIsLoggingIn = true;
        ::UGameClientConnectionSubsystem::Get().SetInLoginPhase(true);
        this.StartLoginStepTimeout();
        return;
    }
    void EndLoginPhase()
    {
        this.bIsLoggingIn = false;
        ::UGameClientConnectionSubsystem::Get().SetInLoginPhase(false);
        this.StopLoginStepTimeout();
        return;
    }
    void StartLoginStepTimeout()
    {
        float32 local_1 = 20.0f;
        if ((this.LoginSettings != nullptr && ((this.LoginSettings.LoginTimeoutSeconds > 0.0f))))
        {
            local_1 = this.LoginSettings.LoginTimeoutSeconds;
        }
        this.LoginStepTimeoutRemaining = local_1;
        this.bLoginStepTimeoutActive = true;
        return;
    }
    void StopLoginStepTimeout()
    {
        this.bLoginStepTimeoutActive = false;
        this.LoginStepTimeoutRemaining = 0.0f;
        return;
    }
    void OnLoginStepTimeout()
    {
        if (!(this.bIsLoggingIn))
        {
            return;
        }
        XError(ELog(78), "OnLoginStepTimeout: login step timed out, returning to login");
        this.HandleLoginFailed(0, this.GetLoginErrorTip(ELoginErrorTipType(2)));
        return;
    }
    FText GetLoginErrorTip(const ELoginErrorTipType TipType)
    {
        if (this.LoginSettings == nullptr)
        {
            return FText();
        }
        TDataObjectPtr<FKLTextData> local_32;
        switch (int(TipType))
        {
        case 0:
        {
            local_32 = this.LoginSettings.LoginErrorTips.DeviceLimitTip;
            break;
        }
        case 1:
        {
            local_32 = this.LoginSettings.LoginErrorTips.ServerInvalidTip;
            break;
        }
        case 2:
        {
            local_32 = this.LoginSettings.LoginErrorTips.ConnectFailedTip;
            break;
        }
        case 3:
        {
            local_32 = this.LoginSettings.LoginErrorTips.GetTokenFailedTip;
            break;
        }
        case 4:
        {
            local_32 = this.LoginSettings.LoginErrorTips.SdkVerifyFailedTip;
            break;
        }
        case 5:
        {
            local_32 = this.LoginSettings.LoginErrorTips.PlayerLoginFailedTip;
            break;
        }
        default:
        {
            local_32 = this.LoginSettings.LoginErrorTips.GenericTip;
        }
        }
        return ::LoginSystemUtil::ResolveLoginTextData(local_32);
    }
    FText GetSDKNotLoginTip()
    {
        if (this.LoginSettings == nullptr)
        {
            return FText();
        }
        return ::LoginSystemUtil::ResolveLoginTextData(this.LoginSettings.LoginErrorTips.SDKNotLoginTip);
    }
    void ResetCachedLoginInfo()
    {
        this.bCachedEnterTestLevel = false;
        this.CachedPlayerUid = 0;
        this.CachedAccountUid = "";
        this.CachedToken = "";
        this.CachedServerId = "";
        return;
    }
    void TryStartDownload()
    {
        FLoginDownloadInfo local_14;
        if (!(local_14.TryGetDownloadInfo()))
        {
            XError(ELog(78), FString().Append("Failed to get download info!"));
            return;
        }
        USDKServiceSubSystem local_24 = USDKServiceSubSystem::Get();
        if (!(IsValid(local_24)))
        {
            XError(ELog(78), FString().Append("Failed to get download service!"));
            return;
        }
        UKLDownloadService local_28 = (Cast<UKLDownloadService>(local_24.GetSdkServiceByType(ESDKServiceType(1))));
        if (!(IsValid(local_28)))
        {
            XError(ELog(78), FString().Append("Failed to get download service!"));
            return;
        }
        FString local_38 = local_14.ClientVersion;
        FString local_42 = local_14.CdnUrl;
        if (local_42.IsEmpty())
        {
            XError(ELog(78), FString().Append("Failed to get download cdn url info!"));
            return;
        }
        FString local_46 = local_14.DownloadExtraInfo;
        int local_47 = 0;
        if (!(local_46.IsEmpty()))
        {
            TArray<FString> local_52;
            local_46.ParseIntoArray(local_52, ":", true);
            if (local_52.Num() >= 2)
            {
                FString local_20 = local_52[1].TrimStartAndEnd();
                if (local_20.IsNumeric())
                {
                    local_47 = String::Conv_StringToInt(local_20);
                }
            }
        }
        XLog(ELog(78), FString().Append("TryDownLoadCLVersion: ClientVersion---").Append(local_38).Append(" DownloadExtraSize---").Append(local_47));
        ResetDownloadSpeedSampling();
        local_28.StartVersionUpdate(local_42, local_38, local_47);
        if (!(this.bDownloadDelegatesRegistered))
        {
            local_28.GetDownloadProgressDelegate().AddUFunction(this, n"OnDownloadProgress");
            local_28.GetDownloadCompletedDelegate().AddUFunction(this, n"OnDownloadCompleted");
            local_28.GetDownloadManifestCompletedDelegate().AddUFunction(this, n"OnDownloadManifestCompleted");
        }
        this.bDownloadDelegatesRegistered = true;
        return;
    }
    void StartLoginSDK()
    {
        ResetSDKLoginAuthState();
        this.bIsSDKStartLogin = true;
        this.InitSDK();
        return;
    }
    UFUNCTION()
    void OnSDKInitResult(const bool bSuccess)
    {
        if (!(bSuccess))
        {
            XError(ELog(78), "OnSDKInitResult: SDK init failed, abort login");
            return;
        }
        UMiHoYoSDKHelper::LogToScreenAndConsole("Step 4: Enable Water Mark", 5.0f);
        UMiHoYoSDKHelper::SetWaterMark(true);
        UMiHoYoSDKHelper::LogToScreenAndConsole("Step 5: Calling SDK Login", 5.0f);
        FSDKLoginResultDelegate local_7;
        local_7.BindUFunction(this, n"OnSDKLoginResult");
        bool local_1 = UMiHoYoSDKHelper::SDKLogin(local_7);
        if (local_1)
        {
            XLog(ELog(78), FString().Append("SDK Login called successfully"));
        }
        else
        {
            XError(ELog(78), FString().Append("SDK Login call failed"));
        }
        return;
    }
    void ConnectToGateServer()
    {
        if (!(GetbIsSDKLoginSucc()))
        {
            XError(ELog(78), "ConnectToGateServer: SDK login failed");
            this.HandleLoginFailed(0, this.GetLoginErrorTip(ELoginErrorTipType(1)));
            return;
        }
        int local_9 = GetSelectRegionIndex();
        if (!(GetRegionInfos().IsValidIndex()))
        {
            XError(ELog(78), "ConnectToGateServer: SelectRegionIndex is invalid");
            this.HandleLoginFailed(0, this.GetLoginErrorTip(ELoginErrorTipType(1)));
            return;
        }
        if (!(TEUIModelRef<FVM_RegionInfo>(GetRegionInfos()[]).IsValid()))
        {
            XError(ELog(78), "ConnectToGateServer: RegionInfo is invalid");
            this.HandleLoginFailed(0, this.GetLoginErrorTip(ELoginErrorTipType(1)));
            return;
        }
        FLoginGateInfo local_58;
        local_58.RegionType = GetType();
        local_58.RegionName = GetName();
        local_58.RegionTitle = GetTitle();
        local_58.RegionAddress = GetDispatchURL();
        local_58.GateAddress = GetGateAddress();
        local_58.DsaAddress = GetDSAAddress();
        local_58.DsaPort = GetDSAPort();
        local_58.Port = GetGatePort();
        local_58.DSVersion = GetDSVersion();
        if (local_58.GateAddress.IsEmpty() || (int(local_58.Port) <= 0))
        {
            XError(ELog(78), "ConnectToGateServer: Selected server gate is invalid");
            this.HandleLoginFailed(0, this.GetLoginErrorTip(ELoginErrorTipType(1)));
            return;
        }
        ::UGameClientConnectionSubsystem::Get().StoreSelectedServerPingInfo(local_58);
        ::UGameClientConnectionSubsystem::Get().SetCachedGateAddress(local_58.GateAddress);
        ::UGameClientConnectionSubsystem::Get().ConnectToGate(local_58.GateAddress, int(local_58.Port), this.OnConnectToGateSuccessDelegate);
        return;
    }
    UFUNCTION()
    void OnDownloadProgress(const uint64 DownloadedSize, const uint64 TotalSize)
    {
        TotalSize.HandleDownloadProgress();
        return;
    }
    UFUNCTION()
    void OnDownloadCompleted(const bool bSuccess, const int Code)
    {
        FCommonTipsParam local_38;
        FLoginDownloadInfo local_54;
        XLog(ELog(78), FString().Append("Widget_LoginOfficial OnDownloadCompleted: bSuccess=").Append(bSuccess).Append(" Code=").Append(Code));
        ULocalPlayer local_8 = this.GetOwningLocalPlayer();
        if (!(IsValid(local_8)))
        {
            XError(ELog(78), "OnDownloadCompleted: LocalPlayer is invalid");
            return;
        }
        if (!(bSuccess))
        {
            bSuccess.HandleDownloadCompleted();
            ::CommonPopup_Internal::OpenTips(NSLOCTEXT("Login", "DownloadFailedTips", "иµ„жєђж›ґж–°е¤±иґҐгЂ‚"), local_38, ECommonTipsType(0), FEUIModelContainer(), local_8);
            return;
        }
        if (!(local_54.TryGetDownloadInfo()))
        {
            XError(ELog(78), FString().Append("OnDownloadCompleted Failed to get download info!"));
            return;
        }
        if ((local_54.bNeedExitClient || local_54.bNeedRestartClient))
        {
            FText local_16 = NSLOCTEXT("Login", "DownloadTitle", "иµ„жєђж›ґж–°");
            FDialogDynamicCallback local_60;
            FCommonDialogParam local_62;
            local_62.bIsForbidIgnored = true;
            FText local_20 = NSLOCTEXT("HotPatch", "ExitClientMessage", "жёёж€Џз‰€жњ¬е·Іж›ґж–°пјЊиЇ·йЂЂе‡єжёёж€ЏеђЋй‡Ќж–°еђЇеЉЁе®ўж€·з«ЇгЂ‚");
            local_60.BindUFunction(this, n"OnClientExitGameConfirmed");
            UCommonPopupSettings local_72 = ::CommonPopupSettings::Get();
            FEUIInputAction local_78;
            if (local_72.CommonDialogAction.Find(ECommonDialogAnswerType(1), local_78))
            {
                TArray<FCommonDialogOption> local_84;
                FText local_66;
                local_84.Add(FCommonDialogOption(ECommonDialogAnswerType(1), local_78, local_66));
                ::CommonPopup_Internal::OpenDialogForLocalPlayer(local_8, local_16, local_20, local_84, FDialogCallback(local_60), local_62);
            }
            return;
        }
        ::CommonPopup_Internal::OpenTips(NSLOCTEXT("Login", "DownloadCompletedTips", "иµ„жєђж›ґж–°е®Њж€ђгЂ‚"), local_38, ECommonTipsType(0), FEUIModelContainer(), local_8);
        bSuccess.HandleDownloadCompleted();
        return;
    }
    UFUNCTION()
    void OnDownloadManifestCompleted(const bool bSuccess, const int Code)
    {
        bSuccess.HandleDownloadManifestCompleted();
        return;
    }
    UFUNCTION()
    bool OnClientExitGameConfirmed(const FCommonDialogAnswer &inout Answer)
    {
        if (int(Answer.AnswerType) != 1)
        {
            return true;
        }
        ::FGameConnectionUtils::UICallQuitGame(this.GetOwningPlayer());
        return true;
    }
    UFUNCTION()
    void OnSDKLoginResult(const FSDKLoginResult &in LoginResult)
    {
        LoginResult.OnSDKLoginResult();
        return;
    }
    void InitSDK()
    {
        FString local_8 = UMiHoYoSDKHelper::GetConfiguredEnvironment();
        if (local_8.IsEmpty())
        {
            XError(ELog(78), "InitSDK: SDK environment configuration is missing or empty");
            return;
        }
        FString local_4 = UMiHoYoSDKHelper::GetConfiguredLanguage();
        if (local_4.IsEmpty())
        {
            XError(ELog(78), "InitSDK: SDK language configuration is missing or empty");
            return;
        }
        UMiHoYoSDKHelper::LogToScreenAndConsole(FString().Append("Step 1: Setting SDK environment to ").Append(local_8), 5.0f);
        UMiHoYoSDKHelper::SetEnv(local_8);
        UMiHoYoSDKHelper::LogToScreenAndConsole(FString().Append("Step 2: Setting SDK language to ").Append(local_4), 5.0f);
        UMiHoYoSDKHelper::SetLanguage(local_4);
        UMiHoYoSDKHelper::LogToScreenAndConsole("Step 3: Initializing SDK", 5.0f);
        FSDKInitResultDelegate local_19;
        local_19.BindUFunction(this, n"OnSDKInitResult");
        UMiHoYoSDKHelper::InitSDK(local_19);
        return;
    }
    void ReportBaseInfo()
    {
        FSDKReportInfo local_38;
        local_38.AppName = "kl";
        local_38.ClientVersion = ::UGameClientConnectionSubsystem::Get().GetClientVersion();
        local_38.Region = this.CachedServerId;
        local_38.Uid = this.CachedAccountUid;
        UMiHoYoSDKHelper::SetReportInfo(local_38);
        UMiHoYoSDKHelper::MarkReportContextReady(::UGameClientConnectionSubsystem::Get().GetCachedSDKDeviceId(), FString(::UGameClientConnectionSubsystem::Get().CachedLoginUserName));
        return;
    }
    void PlayLoginBGM()
    {
        if (this.LoginSettings == nullptr)
        {
            return;
        }
        if (this.LoginSettings.LoginBGMStartEventName.IsEmpty())
        {
            return;
        }
        FGameAudioUtils::PlayEventBGM(FName(this.LoginSettings.LoginBGMStartEventName), FLoadEventCallback(), FGameAudioUtils::GetCachedAudioWorld(), true);
        return;
    }
    void StopLoginBGM()
    {
        if (this.LoginSettings == nullptr)
        {
            return;
        }
        if (this.LoginSettings.LoginBGMEndEventName.IsEmpty())
        {
            return;
        }
        FGameAudioUtils::PlayEventBGM(FName(this.LoginSettings.LoginBGMEndEventName), FLoadEventCallback(), FGameAudioUtils::GetCachedAudioWorld(), true);
        return;
    }
    UFUNCTION()
    void LoginVM_OnServerRootClick() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    void HandleObservedModelChanges(FEUIReactiveSubscriberIterator &inout It)
    {
        FVMS_Login& local_6;
        TEUIModelRef<FVMS_Login> local_2 = this.LoginVM.AsRef();
        for (; It; )
        {
            FEUIReactiveSubscriberTrackScope local_56 = FEUIReactiveSubscriberTrackScope(It);
            switch (It.GetIndex())
            {
            case 0:
            {
                this.LoginVM.TrackRead();
                if (local_6)
                {
                    local_6.TrackPropertyRead(::FVMS_Login::__IndexOf_LoginState());
                }
                if (local_6)
                {
                    this.OnLoginStateChanged(local_6.GetLoginState());
                }
                break;
            }
            case 1:
            {
                this.LoginVM.TrackRead();
                if (local_6)
                {
                    local_6.TrackPropertyRead(::FVMS_Login::__IndexOf_StartLoginSDKRequestSeq());
                }
                if (local_6)
                {
                    this.OnStartLoginSDKRequested(local_6.GetStartLoginSDKRequestSeq());
                }
                break;
            }
            case 2:
            {
                this.LoginVM.TrackRead();
                if (local_6)
                {
                    local_6.TrackPropertyRead(::FVMS_Login::__IndexOf_ContinueGameRequestSeq());
                }
                if (local_6)
                {
                    this.OnContinueGameRequested(local_6.GetContinueGameRequestSeq());
                }
                break;
            }
            case 3:
            {
                this.LoginVM.TrackRead();
                if (local_6)
                {
                    local_6.TrackPropertyRead(::FVMS_Login::__IndexOf_SwitchAccountRequestSeq());
                }
                if (local_6)
                {
                    this.OnSwitchAccountRequested(local_6.GetSwitchAccountRequestSeq());
                }
            }
            }
            It.MarkCurrentClean();
            It.opPreInc();
        }
        if (It.ReachMax())
        {
            XError(ELog(17), "Observed model changes consume max.");
            if (It.IsDirty(0))
            {
                XError(ELog(17), "Remaining observed model change: OnLoginStateChanged");
            }
            if (It.IsDirty(1))
            {
                XError(ELog(17), "Remaining observed model change: OnStartLoginSDKRequested");
            }
            if (It.IsDirty(2))
            {
                XError(ELog(17), "Remaining observed model change: OnContinueGameRequested");
            }
            if (It.IsDirty(3))
            {
                XError(ELog(17), "Remaining observed model change: OnSwitchAccountRequested");
            }
            return;
        }
        this.__LoginVM = local_2.opImplConv();
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.LoginVM.Initialize(this, FName("VMS_Login"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        return;
    }
}

namespace UWidget_LoginOfficial
{
void GetModelInfo(FEUIWidgetMetaInfo &inout Result)
{
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnLoginStateChanged"));
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnStartLoginSDKRequested"));
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnContinueGameRequested"));
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnSwitchAccountRequested"));
    return;
}
FEUIWidgetRef CreateWidget(const APlayerController OwningPlayer, const TSoftClassPtr<UEUIUserWidget> &inout WidgetClass)
{
    return FEUIWidget::CreateWidget(OwningPlayer.GetLocalPlayer(), WidgetClass);
}
FEUIWidgetRef AddWidget(const APlayerController OwningPlayer, const FGameplayTag &inout WidgetTag)
{
    return FEUIWidget::AddWidget(OwningPlayer.GetLocalPlayer(), WidgetTag);
}
}
