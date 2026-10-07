
enum ELoginState
{
    None,
    Dispatching,
    Gate,
    Downloading,
    PSO,
    SDKLogin,
    Login,
    LoginFinish,
}

namespace FVM_RegionInfo
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature OnRegionInfoClick = FEUIModelCallbackSignature();
}
namespace FVMS_Login
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature OnServerRootClick = FEUIModelCallbackSignature();

}
struct FMsg_LoginServerSelect : FEUIMessage
{
    UPROPERTY()
    FString ServerName;

    FMsg_LoginServerSelect()
    {
        return;
    }
}

struct FLoginDownloadInfo
{
    UPROPERTY()
    FString CdnUrl;
    UPROPERTY()
    FString ClientVersion;
    UPROPERTY()
    bool bNeedRestartClient = false;
    UPROPERTY()
    bool bNeedExitClient = false;
    UPROPERTY()
    FString DownloadExtraInfo;


}

struct FVM_RegionInfo : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    FString m_Name;
    UPROPERTY()
    FString m_Title;
    UPROPERTY()
    FString m_Type;
    UPROPERTY()
    FString m_DispatchURL;
    UPROPERTY()
    FString m_GateAddress;
    UPROPERTY()
    uint m_GatePort;
    UPROPERTY()
    int m_DSVersion;
    UPROPERTY()
    FString m_DSAAddress;
    UPROPERTY()
    uint m_DSAPort;
    UPROPERTY()
    FLoginDownloadInfo m_LoginDownloadInfo;
    UPROPERTY()
    bool m_bValid;
    UPROPERTY()
    bool m_bGateAddressReceived;

    FVM_RegionInfo()
    {
        this.m_GatePort = 0;
        this.m_DSVersion = 0;
        this.m_DSAPort = 0;
        this.m_bValid = false;
        this.m_bGateAddressReceived = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVM_RegionInfo(const FVM_RegionInfo &inout Other)
    {
        this.m_GatePort = 0;
        this.m_DSVersion = 0;
        this.m_DSAPort = 0;
        this.m_bValid = false;
        this.m_bGateAddressReceived = false;
        this.m_Name = Other.m_Name;
        this.m_Title = Other.m_Title;
        this.m_Type = Other.m_Type;
        this.m_DispatchURL = Other.m_DispatchURL;
        this.m_GateAddress = Other.m_GateAddress;
        this.m_GatePort = int(Other.m_GatePort);
        this.m_DSVersion = int(Other.m_DSVersion);
        this.m_DSAAddress = Other.m_DSAAddress;
        this.m_DSAPort = int(Other.m_DSAPort);
        this.m_bValid = Other.m_bValid;
        this.m_bGateAddressReceived = Other.m_bGateAddressReceived;
        return;
    }
    FVM_RegionInfo opAssign(const FVM_RegionInfo &inout Other)
    {
        FVM_RegionInfo __r;
        this.m_Name = Other.m_Name;
        this.m_Title = Other.m_Title;
        this.m_Type = Other.m_Type;
        this.m_DispatchURL = Other.m_DispatchURL;
        this.m_GateAddress = Other.m_GateAddress;
        this.m_GatePort = int(Other.m_GatePort);
        this.m_DSVersion = int(Other.m_DSVersion);
        this.m_DSAAddress = Other.m_DSAAddress;
        this.m_DSAPort = int(Other.m_DSAPort);
        this.m_bValid = Other.m_bValid;
        this.m_bGateAddressReceived = Other.m_bGateAddressReceived;
        return __r;
    }
    void PostConstruct()
    {
        this.SetbValid(false);
        this.SetbGateAddressReceived(false);
        return;
    }
    bool GetIsSelected() const
    {
        if ((FString(::FVMS_Login::Get(this.GetManager()).GetSelectServerName()) == this.GetName()))
        {
            return true;
        }
        return false;
    }
    void OnRegionInfoClick()
    {
        int local_8 = 0;
        FEUIModelRef local_6 = FEUIModelRef(this);
        FEUIMessageBus::Publish(EUIMessageBus);
        local_8.ServerName = this.GetName();
        return;
    }
    void FillSimpleDataByPb(const FPbRegionSimpleInfo &inout RegionSimpleInfo)
    {
        this.SetName(RegionSimpleInfo.GetName());
        this.SetTitle(RegionSimpleInfo.GetTitle());
        this.SetType(RegionSimpleInfo.GetType());
        this.SetDispatchURL(RegionSimpleInfo.GetDispatchUrl());
        return;
    }
    bool TryFillDetailDataByPb(FPbQueryCurRegionHttpRsp &inout QueryCurRegionHttpRsp)
    {
        if (QueryCurRegionHttpRsp.GetRetcode() != 0)
        {
            this.SetbValid(false);
            return false;
        }
        FString local_22 = QueryCurRegionHttpRsp.GetRegionInfo().GetGateserverIp();
        int local_24 = QueryCurRegionHttpRsp.GetRegionInfo().GetGateserverPort();
        if (local_22.IsEmpty() || (local_24 <= 0))
        {
            this.SetbValid(false);
            return false;
        }
        this.SetbValid(true);
        this.SetGateAddress(local_22);
        this.SetGatePort(local_24);
        this.SetDSVersion(QueryCurRegionHttpRsp.GetVersionInfo().GetDsCl());
        this.SetDSAAddress(QueryCurRegionHttpRsp.GetDsaInfo().GetIp());
        this.SetDSAPort(QueryCurRegionHttpRsp.GetDsaInfo().GetPort());
        FPbClientResDownloadInfo local_66 = QueryCurRegionHttpRsp.GetClientResDownloadInfo();
        FLoginDownloadInfo local_80;
        local_80.CdnUrl = local_66.GetCdnUrl();
        local_80.ClientVersion = local_66.GetClientVersion();
        local_80.bNeedRestartClient = local_66.GetNeedRestartClient();
        local_80.bNeedExitClient = local_66.GetNeedExitClient();
        local_80.DownloadExtraInfo = local_66.GetDownloadExtraInfo();
        this.SetLoginDownloadInfo(local_80);
        XLog(ELog(78), FString().Append("TryFillDetailDataByPb region=").Append(this.GetName()).Append(" LoginDownloadInfo: CdnUrl=").Append(this.GetLoginDownloadInfo().CdnUrl).Append(" ClientVersion=").Append(this.GetLoginDownloadInfo().ClientVersion).Append(" bNeedRestartClient=").Append(this.GetLoginDownloadInfo().bNeedRestartClient).Append(" bNeedExitClient=").Append(this.GetLoginDownloadInfo().bNeedExitClient).Append(" DownloadExtraInfo=").Append(this.GetLoginDownloadInfo().DownloadExtraInfo));
        return true;
    }
    FString GetName() const property
    {
        FString __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    FString GetModify_Name() property
    {
        FString __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetName(const FString &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_Name = __Value;
        return;
    }
    FString GetTitle() const property
    {
        FString __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    FString GetModify_Title() property
    {
        FString __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetTitle(const FString &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_Title = __Value;
        return;
    }
    FString GetType() const property
    {
        FString __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    FString GetModify_Type() property
    {
        FString __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetType(const FString &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_Type = __Value;
        return;
    }
    const FString GetDispatchURL() const property
    {
        const FString __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    FString GetModify_DispatchURL() property
    {
        FString __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetDispatchURL(const FString &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_DispatchURL = __Value;
        return;
    }
    const FString GetGateAddress() const property
    {
        const FString __r;
        this.TrackPropertyRead(4);
        return __r;
    }
    FString GetModify_GateAddress() property
    {
        FString __r;
        this.MarkPropertyDirty(4);
        return __r;
    }
    void SetGateAddress(const FString &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_GateAddress = __Value;
        return;
    }
    uint GetGatePort() const property
    {
        this.TrackPropertyRead(5);
        return this.m_GatePort;
    }
    void SetGatePort(const uint __Value) property
    {
        if (this.m_GatePort == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_GatePort = __Value;
        return;
    }
    int GetDSVersion() const property
    {
        this.TrackPropertyRead(6);
        return this.m_DSVersion;
    }
    void SetDSVersion(const int __Value) property
    {
        if (this.m_DSVersion == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_DSVersion = __Value;
        return;
    }
    const FString GetDSAAddress() const property
    {
        const FString __r;
        this.TrackPropertyRead(7);
        return __r;
    }
    FString GetModify_DSAAddress() property
    {
        FString __r;
        this.MarkPropertyDirty(7);
        return __r;
    }
    void SetDSAAddress(const FString &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(7);
        this.m_DSAAddress = __Value;
        return;
    }
    uint GetDSAPort() const property
    {
        this.TrackPropertyRead(8);
        return this.m_DSAPort;
    }
    void SetDSAPort(const uint __Value) property
    {
        if (this.m_DSAPort == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(8);
        this.m_DSAPort = __Value;
        return;
    }
    const FLoginDownloadInfo GetLoginDownloadInfo() const property
    {
        const FLoginDownloadInfo __r;
        this.TrackPropertyRead(9);
        return __r;
    }
    FLoginDownloadInfo GetModify_LoginDownloadInfo() property
    {
        FLoginDownloadInfo __r;
        this.MarkPropertyDirty(9);
        return __r;
    }
    void SetLoginDownloadInfo(const FLoginDownloadInfo &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(9);
        return;
    }
    bool GetbValid() const property
    {
        this.TrackPropertyRead(10);
        return this.m_bValid;
    }
    void SetbValid(const bool __Value) property
    {
        if (!(this.m_bValid) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(10);
        this.m_bValid = __Value;
        return;
    }
    bool GetbGateAddressReceived() const property
    {
        this.TrackPropertyRead(11);
        return this.m_bGateAddressReceived;
    }
    void SetbGateAddressReceived(const bool __Value) property
    {
        if (!(this.m_bGateAddressReceived) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(11);
        this.m_bGateAddressReceived = __Value;
        return;
    }
}

struct FVMS_Login : FEUIViewModelSingleton
{
    FEUIViewModelSingleton _base_FEUIViewModelSingleton;
    UPROPERTY()
    ULoginSettings m_LoginSettings;
    UPROPERTY()
    int m_LoginSwitchIndex;
    UPROPERTY()
    bool m_bShowLoginSwitch;
    UPROPERTY()
    int m_SelectRegionIndex;
    UPROPERTY()
    FText m_HotUpdateProgressText;
    UPROPERTY()
    FText m_PSOPrecompileText;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_RegionInfo>> m_RegionInfos;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_LoginButton>> m_LoginButtons;
    UPROPERTY()
    TEUIModelRef<FVM_LoginButton> m_StartGameButton;
    UPROPERTY()
    TEUIModelRef<FVM_LoginButton> m_ContinueGameButton;
    UPROPERTY()
    TEUIModelRef<FVM_LoginButton> m_SwitchAccountButton;
    UPROPERTY()
    TEUIModelRef<FVM_LoginButton> m_NoticeButton;
    UPROPERTY()
    TEUIModelRef<FVM_LoginButton> m_SettingsButton;
    UPROPERTY()
    TEUIModelRef<FVM_LoginButton> m_ExitGameButton;
    UPROPERTY()
    UGameClientConnectionSubsystem m_ClientConnectionSubsystem;
    UPROPERTY()
    ELoginState m_LoginState;
    UPROPERTY()
    FString m_RecentServerName;
    UPROPERTY()
    uint64 m_DownloadProgressDownloaded;
    UPROPERTY()
    uint64 m_DownloadProgressTotal;
    UPROPERTY()
    float32 m_DownloadSpeedMBps;
    UPROPERTY()
    bool m_bHasLastDownloadProgressSample;
    UPROPERTY()
    uint64 m_LastDownloadedByte;
    UPROPERTY()
    float m_LastDownloadProgressTimeSeconds;
    UPROPERTY()
    FString m_ClientVersionStr;
    UPROPERTY()
    float32 m_DownloadProgress;
    UPROPERTY()
    float32 m_PSOPercentage;
    UPROPERTY()
    int m_PSOTotalCount;
    UPROPERTY()
    bool m_bPSOSawWork;
    UPROPERTY()
    float32 m_PSOElapsedSeconds;
    UPROPERTY()
    FText m_DownloadTotalString;
    UPROPERTY()
    bool m_bIsSDKLoginSucc;
    UPROPERTY()
    FSDKLoginResult m_CachedSDKLoginResult;
    UPROPERTY()
    int m_StartLoginSDKRequestSeq;
    UPROPERTY()
    int m_ContinueGameRequestSeq;
    UPROPERTY()
    int m_SwitchAccountRequestSeq;
    UPROPERTY()
    bool bIsLoggingIn;
    UPROPERTY()
    FString m_SelectServerName;
    UPROPERTY()
    FString m_SelectServerTitle;
    UPROPERTY()
    bool m_bRegionInfoFinish;

    FVMS_Login()
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    FVMS_Login(const FVMS_Login &inout Other)
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    FVMS_Login opAssign(const FVMS_Login &inout Other)
    {
        FVMS_Login __r;
        this.m_LoginSettings = Other.m_LoginSettings;
        this.m_LoginSwitchIndex = int(Other.m_LoginSwitchIndex);
        this.m_bShowLoginSwitch = Other.m_bShowLoginSwitch;
        this.m_SelectRegionIndex = int(Other.m_SelectRegionIndex);
        this.m_HotUpdateProgressText = Other.m_HotUpdateProgressText;
        this.m_PSOPrecompileText = Other.m_PSOPrecompileText;
        this.m_RegionInfos = Other.m_RegionInfos;
        this.m_LoginButtons = Other.m_LoginButtons;
        this.m_StartGameButton = Other.m_StartGameButton;
        this.m_ContinueGameButton = Other.m_ContinueGameButton;
        this.m_SwitchAccountButton = Other.m_SwitchAccountButton;
        this.m_NoticeButton = Other.m_NoticeButton;
        this.m_SettingsButton = Other.m_SettingsButton;
        this.m_ExitGameButton = Other.m_ExitGameButton;
        this.m_ClientConnectionSubsystem = Other.m_ClientConnectionSubsystem;
        this.m_LoginState = Other.m_LoginState;
        this.m_RecentServerName = Other.m_RecentServerName;
        this.m_DownloadProgressDownloaded = Other.m_DownloadProgressDownloaded;
        this.m_DownloadProgressTotal = Other.m_DownloadProgressTotal;
        this.m_DownloadSpeedMBps = Other.m_DownloadSpeedMBps;
        this.m_bHasLastDownloadProgressSample = Other.m_bHasLastDownloadProgressSample;
        this.m_LastDownloadedByte = Other.m_LastDownloadedByte;
        this.m_LastDownloadProgressTimeSeconds = Other.m_LastDownloadProgressTimeSeconds;
        this.m_ClientVersionStr = Other.m_ClientVersionStr;
        this.m_DownloadProgress = Other.m_DownloadProgress;
        this.m_PSOPercentage = Other.m_PSOPercentage;
        this.m_PSOTotalCount = int(Other.m_PSOTotalCount);
        this.m_bPSOSawWork = Other.m_bPSOSawWork;
        this.m_PSOElapsedSeconds = Other.m_PSOElapsedSeconds;
        this.m_DownloadTotalString = Other.m_DownloadTotalString;
        this.m_bIsSDKLoginSucc = Other.m_bIsSDKLoginSucc;
        this.m_CachedSDKLoginResult = Other.m_CachedSDKLoginResult;
        this.m_StartLoginSDKRequestSeq = int(Other.m_StartLoginSDKRequestSeq);
        this.m_ContinueGameRequestSeq = int(Other.m_ContinueGameRequestSeq);
        this.m_SwitchAccountRequestSeq = int(Other.m_SwitchAccountRequestSeq);
        this.m_SelectServerName = Other.m_SelectServerName;
        this.m_SelectServerTitle = Other.m_SelectServerTitle;
        this.m_bRegionInfoFinish = Other.m_bRegionInfoFinish;
        return __r;
    }
    FText GetDownloadSpeedString() const
    {
        if ((int(this.GetLoginState())) == 4)
        {
            return FText();
        }
        FNumberFormattingOptions local_14;
        local_14.SetMinimumFractionalDigits(1);
        local_14.SetMaximumFractionalDigits(1);
        return FText::Format(NSLOCTEXT("Login", "DownloadSpeed", "{0} MB/s"), FText::AsNumber(this.GetDownloadSpeedMBps(), local_14));
    }
    FText GetDownloadInfoString() const
    {
        if ((int(this.GetLoginState())) == 4)
        {
            return FText();
        }
        return FText::Format(INVTEXT("({0}/{1})"), this.ByteToDownloadSizeShow(this.GetDownloadProgressDownloaded()), this.GetDownloadTotalString());
    }
    ESlateVisibility ServerRootVisibility() const
    {
        int local_2;
        if (this.GetbIsSDKLoginSucc())
        {
            local_2 = 0;
        }
        else
        {
            local_2 = 1;
        }
        return ESlateVisibility(local_2);
    }
    ESlateVisibility VersionVisibility() const
    {
        int local_5;
        if ((int(this.GetLoginState())) == 4)
        {
            return ESlateVisibility(1);
        }
        if (this.GetbRegionInfoFinish())
        {
            local_5 = 0;
        }
        else
        {
            local_5 = 1;
        }
        return ESlateVisibility(local_5);
    }
    ESlateVisibility StartBtnVisibility() const
    {
        int local_4;
        if (this.GetStartGameButton().IsValid())
        {
            TEUIModelRef<FVM_LoginButton> local_2 = this.GetStartGameButton();
            if (GetbIsVisible())
            {
                local_4 = 0;
            }
            else
            {
                local_4 = 1;
            }
            return ESlateVisibility(local_4);
        }
        return ESlateVisibility(1);
    }
    ESlateVisibility ContinueBtnVisibility() const
    {
        int local_4;
        if (this.GetContinueGameButton().IsValid())
        {
            TEUIModelRef<FVM_LoginButton> local_2 = this.GetContinueGameButton();
            if (GetbIsVisible())
            {
                local_4 = 0;
            }
            else
            {
                local_4 = 1;
            }
            return ESlateVisibility(local_4);
        }
        return ESlateVisibility(1);
    }
    ESlateVisibility SwitchAccountBtnVisibility() const
    {
        int local_4;
        if (this.GetSwitchAccountButton().IsValid())
        {
            TEUIModelRef<FVM_LoginButton> local_2 = this.GetSwitchAccountButton();
            if (GetbIsVisible())
            {
                local_4 = 0;
            }
            else
            {
                local_4 = 1;
            }
            return ESlateVisibility(local_4);
        }
        return ESlateVisibility(1);
    }
    ESlateVisibility NoticeBtnVisibility() const
    {
        int local_4;
        if (this.GetNoticeButton().IsValid())
        {
            TEUIModelRef<FVM_LoginButton> local_2 = this.GetNoticeButton();
            if (GetbIsVisible())
            {
                local_4 = 0;
            }
            else
            {
                local_4 = 1;
            }
            return ESlateVisibility(local_4);
        }
        return ESlateVisibility(1);
    }
    ESlateVisibility SettingsBtnVisibility() const
    {
        int local_4;
        if (this.GetSettingsButton().IsValid())
        {
            TEUIModelRef<FVM_LoginButton> local_2 = this.GetSettingsButton();
            if (GetbIsVisible())
            {
                local_4 = 0;
            }
            else
            {
                local_4 = 1;
            }
            return ESlateVisibility(local_4);
        }
        return ESlateVisibility(1);
    }
    ESlateVisibility ExitGameBtnVisibility() const
    {
        int local_4;
        if (this.GetExitGameButton().IsValid())
        {
            TEUIModelRef<FVM_LoginButton> local_2 = this.GetExitGameButton();
            if (GetbIsVisible())
            {
                local_4 = 0;
            }
            else
            {
                local_4 = 1;
            }
            return ESlateVisibility(local_4);
        }
        return ESlateVisibility(1);
    }
    void PostConstruct()
    {
        this.SetLoginState(ELoginState(1));
        GetGameplaySettings<ULoginSettings> local_4;
        this.SetLoginSettings(local_4);
        this.SetClientConnectionSubsystem(::UGameClientConnectionSubsystem::Get());
        this.SetRecentServerName("");
        FString local_20 = (FPlatformProcess::UserSettingsDir() + "/Login/recent_server.txt");
        FString local_24;
        bool local_28 = FFileHelper::LoadFileToString(local_24, local_20, FFileHelper::EHashOptions(0), 4);
        if (local_28)
        {
            this.SetRecentServerName(local_24.TrimStartAndEnd());
        }
        if (IsValid(this.GetLoginSettings()))
        {
            this.SetHotUpdateProgressText(::LoginSystemUtil::ResolveLoginTextData(this.GetLoginSettings().HotUpdateInfo.HotUpdateProgressTextData));
            this.SetPSOPrecompileText(::LoginSystemUtil::ResolveLoginTextData(this.GetLoginSettings().PSOPrecompileInfo.PSOPrecompileTextData));
        }
        this.InitLoginButtons();
        return;
    }
    void HandleLoginServerSelect(const FMsg_LoginServerSelect &inout Msg)
    {
        FString local_4 = Msg.ServerName;
        int local_5 = 0;
        for (; local_5 < this.GetRegionInfos().Num(); ++local_5)
        {
            if ((FString(GetName()) == local_4))
            {
                this.SetSelectRegionIndex(local_5);
                break;
            }
        }
        this.RecordRecentServerName();
        return;
    }
    void RefreshLoginButtons()
    {
        if (this.GetStartGameButton().IsValid())
        {
            TEUIModelRef<FVM_LoginButton> local_2 = this.GetStartGameButton();
            !(this.GetbIsSDKLoginSucc()).SetVisible();
        }
        if (this.GetContinueGameButton().IsValid())
        {
            bool local_3_2 = this.GetbIsSDKLoginSucc();
            TEUIModelRef<FVM_LoginButton> local_2_2 = this.GetContinueGameButton();
            local_3_2.SetVisible();
        }
        return;
    }
    void RefreshServerRootInfo()
    {
        if (this.GetRegionInfos().IsValidIndex(this.GetSelectRegionIndex()))
        {
            int local_1 = this.GetSelectRegionIndex();
            this.SetSelectServerName(GetName());
            int local_1_2 = this.GetSelectRegionIndex();
            this.SetSelectServerTitle(GetTitle());
        }
        return;
    }
    void OnServerRootClick()
    {
        if (this.bIsLoggingIn)
        {
            return;
        }
        if (!(this.GetbIsSDKLoginSucc()))
        {
            return;
        }
        if (this.GetRegionInfos().Num() <= 1)
        {
            return;
        }
        FVM_LoginServer& local_6 = ::FVM_LoginServer::Create(this.GetManager());
        local_6.SetRegionVMList(this.GetRegionInfos());
        local_6.SetSelectedRegionIndex(this.GetSelectRegionIndex());
        FEUIWidget::AddWidget(this.GetContext().UELocalPlayer, GameplayTags::UI_Type_ServerSelect, FEUIModelRef(local_6));
        return;
    }
    void InitLoginButtons()
    {
        if (!(IsValid(this.GetLoginSettings())))
        {
            return;
        }
        this.GetModify_LoginButtons().Empty(0);
        TMap<ELoginButtonType, FLoginButtonInfo> local_6 = this.GetLoginSettings().LoginButtonsInfo;
        if (local_6.Contains(ELoginButtonType(0)))
        {
            this.SetStartGameButton(this.CreateLoginButton(ELoginButtonType(0), local_6[ELoginButtonType(0)]));
            this.GetModify_LoginButtons().Add(this.GetStartGameButton());
        }
        if (local_6.Contains(ELoginButtonType(1)))
        {
            this.SetContinueGameButton(this.CreateLoginButton(ELoginButtonType(1), local_6[ELoginButtonType(1)]));
            this.GetModify_LoginButtons().Add(this.GetContinueGameButton());
        }
        if (local_6.Contains(ELoginButtonType(2)))
        {
            this.SetSwitchAccountButton(this.CreateLoginButton(ELoginButtonType(2), local_6[ELoginButtonType(2)]));
            this.GetModify_LoginButtons().Add(this.GetSwitchAccountButton());
        }
        if (local_6.Contains(ELoginButtonType(3)))
        {
            this.SetNoticeButton(this.CreateLoginButton(ELoginButtonType(3), local_6[ELoginButtonType(3)]));
            this.GetModify_LoginButtons().Add(this.GetNoticeButton());
        }
        if (local_6.Contains(ELoginButtonType(4)))
        {
            this.SetSettingsButton(this.CreateLoginButton(ELoginButtonType(4), local_6[ELoginButtonType(4)]));
            this.GetModify_LoginButtons().Add(this.GetSettingsButton());
        }
        if (local_6.Contains(ELoginButtonType(5)))
        {
            this.SetExitGameButton(this.CreateLoginButton(ELoginButtonType(5), local_6[ELoginButtonType(5)]));
            this.GetModify_LoginButtons().Add(this.GetExitGameButton());
        }
        return;
    }
    TEUIModelRef<FVM_LoginButton> CreateLoginButton(const ELoginButtonType InButtonType, const FLoginButtonInfo &inout ButtonInfo)
    {
        FVM_LoginButton& local_4 = ::FVM_LoginButton::Create(this.GetManager());
        local_4.Init(ButtonInfo);
        return TEUIModelRef<FVM_LoginButton>(local_4);
    }
    void HandleLoginButtonClick(const ELoginButtonType ButtonType)
    {
        if (this.bIsLoggingIn)
        {
            XLog(ELog(78), FString().Append("HandleLoginButtonClick ignored during login phase: ").Append(ButtonType));
            return;
        }
        else
        {
            switch (int(ButtonType))
            {
            case 0:
            {
                this.OnLoginButtonStartGame();
                return;
            }
            case 1:
            {
                this.OnLoginButtonContinueGame();
                return;
            }
            case 2:
            {
                this.OnLoginButtonSwitchAccount();
                return;
            }
            case 3:
            {
                this.OnLoginButtonNotice();
                return;
            }
            case 4:
            {
                this.OnLoginButtonSettings();
                return;
            }
            case 5:
            {
                this.OnLoginButtonExitGame();
                return;
            }
            }
        }
    }
    void OnLoginButtonStartGame()
    {
        this.SetStartLoginSDKRequestSeq((this.GetStartLoginSDKRequestSeq() + 1));
        return;
    }
    void OnLoginButtonContinueGame()
    {
        this.SetContinueGameRequestSeq((this.GetContinueGameRequestSeq() + 1));
        return;
    }
    void OnLoginButtonSwitchAccount()
    {
        XLog(ELog(78), "LoginVM: OnSwitchAccount");
        this.SetbIsSDKLoginSucc(false);
        this.SetSwitchAccountRequestSeq((this.GetSwitchAccountRequestSeq() + 1));
        return;
    }
    void OnLoginButtonNotice()
    {
        XLog(ELog(78), "LoginVM: OnNotice");
        return;
    }
    void OnLoginButtonSettings()
    {
        ULocalPlayer local_4;
        XLog(ELog(78), "LoginVM: OnSettings");
        if (local_4 == nullptr)
        {
            return;
        }
        if (FEUIWidget::FindWidget(this.GetContext().UELocalPlayer, GameplayTags::UI_Type_Settings))
        {
            return;
        }
        FVM_SettingSystemMainState& local_12 = ::FVM_SettingSystemMainState::Create(this.GetManager());
        local_12.SetbIsHiddenSystemMain(true);
        FEUIModelContainer local_26;
        local_26.AddModel(FEUIModelRef(local_12), false);
        FEUIWidget::AddWidgetWithModelContainer(this.GetContext().UELocalPlayer, GameplayTags::UI_Type_Settings, local_26);
        return;
    }
    void OnLoginButtonExitGame()
    {
        APlayerController local_4;
        XLog(ELog(78), "LoginVM: OnExitGame");
        ULocalPlayer local_6;
        UECSLocalPlayer local_10 = (Cast<UECSLocalPlayer>(local_6));
        if (local_10 != nullptr)
        {
            local_4 = local_10.GetUEPlayerController();
        }
        ::FVMS_ExitGame::Get(this.GetManager()).ExitGameByLocalPlayer(this.GetContext().UELocalPlayer, local_4);
        return;
    }
    void RefreshLoginSwitchState()
    {
        if (int(this.GetLoginState()) == 3 || (int(this.GetLoginState()) == 4))
        {
            this.SetLoginSwitchIndex(0);
            return;
        }
        if (int(this.GetLoginState()) == 5 || (int(this.GetLoginState()) == 6) || (int(this.GetLoginState()) == 7))
        {
            this.SetLoginSwitchIndex(1);
        }
        return;
    }
    void ResetLoginState()
    {
        this.SetLoginState(ELoginState(1));
        this.SetStartLoginSDKRequestSeq(0);
        this.SetContinueGameRequestSeq(0);
        this.SetSwitchAccountRequestSeq(0);
        this.ResetDownloadSpeedSampling();
        return;
    }
    void ResetDownloadSpeedSampling()
    {
        this.SetbHasLastDownloadProgressSample(false);
        this.SetLastDownloadedByte(0);
        this.SetLastDownloadProgressTimeSeconds(0.0);
        this.SetDownloadSpeedMBps(0.0f);
        return;
    }
    bool TryGetDownloadInfo(FLoginDownloadInfo &inout DownloadInfo)
    {
        for (auto& local_16 : this.GetRegionInfos())
        {
            local_16;
            if (GetbValid() && !(GetLoginDownloadInfo().ClientVersion.IsEmpty()))
            {
                return true;
            }
        }
        return false;
    }
    void RequestRegionList(const FHttpRspDelegate &inout RspDelegate)
    {
        this.SetbRegionInfoFinish(false);
        this.SetLoginState(ELoginState(1));
        if (this.GetClientConnectionSubsystem() != nullptr)
        {
            this.GetClientConnectionSubsystem().RequestForRegionList(RspDelegate);
        }
        return;
    }
    void RequestGateAddress(const FHttpRspDelegate &inout RspDelegate)
    {
        this.SetLoginState(ELoginState(2));
        for (auto& local_18 : this.GetRegionInfos())
        {
            local_18;
            this.GetClientConnectionSubsystem().RequestForGateAddress(GetDispatchURL(), true, RspDelegate);
        }
        return;
    }
    void OnRecievedRegionList(const FPbQueryRegionListHttpRsp &inout QueryRegionListHttpRsp)
    {
        TArray<FPbRegionSimpleInfo> local_4;
        QueryRegionListHttpRsp.GetRegionList(local_4);
        this.GetModify_RegionInfos().Empty(0);
        TSet<FString> local_26;
        for (auto& local_42 : local_4)
        {
            FString local_50 = local_42.GetName();
            FString local_46 = local_42.GetDispatchUrl();
            if (local_50.IsEmpty() || local_46.IsEmpty())
            {
                XError(ELog(78), FString().Append("[GateDbg] OnRecievedRegionList: skip invalid region Name=").Append(local_50).Append(" DispatchURL=").Append(local_46));
                continue;
            }
            if (local_26.Contains(local_46))
            {
                XError(ELog(78), FString().Append("[GateDbg] OnRecievedRegionList: skip duplicate DispatchURL region Name=").Append(local_50).Append(" DispatchURL=").Append(local_46));
                continue;
            }
            local_26.Add(local_46);
            FVM_RegionInfo& local_60 = ::FVM_RegionInfo::Create(this.GetManager());
            local_60.FillSimpleDataByPb(local_42);
            this.GetModify_RegionInfos().Add(TEUIModelRef<FVM_RegionInfo>(local_60));
        }
        XLog(ELog(78), FString().Append("[GateDbg] OnRecievedRegionList: valid region count after filter=").Append(this.GetRegionInfos().Num()));
        this.RefreshSelectRegionIndex();
        return;
    }
    void OnRecievedGateAddress(const bool bSuccess, const FString &inout ReqURL, FPbQueryCurRegionHttpRsp &inout QueryCurRegionHttpRsp)
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    void ResetSDKLoginAuthState()
    {
        this.SetbIsSDKLoginSucc(false);
        this.SetCachedSDKLoginResult(FSDKLoginResult());
        return;
    }
    void OnSDKLoginResult(const FSDKLoginResult &inout LoginResult)
    {
        UMiHoYoSDKHelper::LogToScreenAndConsole(FString().Append("SDK Login Result - ret: ").Append(LoginResult.Ret).Append(", msg: ").Append(LoginResult.Msg), 5.0f);
        if (int(LoginResult.Ret) == 0)
        {
            UMiHoYoSDKHelper::LogToScreenAndConsole(FString().Append("SDK Login Success!"), 5.0f);
            UMiHoYoSDKHelper::LogToScreenAndConsole(FString().Append("  ComboId: ").Append(LoginResult.Data.ComboId), 5.0f);
            UMiHoYoSDKHelper::LogToScreenAndConsole(FString().Append("  OpenId: ").Append(LoginResult.Data.OpenId), 5.0f);
            UMiHoYoSDKHelper::LogToScreenAndConsole(FString().Append("  ComboToken: ").Append(LoginResult.Data.ComboToken), 5.0f);
            UMiHoYoSDKHelper::LogToScreenAndConsole(FString().Append("  AccountType: ").Append(LoginResult.Data.AccountType), 5.0f);
            UMiHoYoSDKHelper::LogToScreenAndConsole(FString().Append("  DeviceId: ").Append(LoginResult.Data.DeviceId), 5.0f);
            UMiHoYoSDKHelper::LogToScreenAndConsole(FString().Append("  ChannelId: ").Append(LoginResult.Data.ChannelId), 5.0f);
            UMiHoYoSDKHelper::LogToScreenAndConsole(FString().Append("  AppId: ").Append(LoginResult.Data.AppId), 5.0f);
            UMiHoYoSDKHelper::LogToScreenAndConsole(FString().Append("  ChannelToken: ").Append(LoginResult.Data.ChannelToken), 5.0f);
            UMiHoYoSDKHelper::LogToScreenAndConsole(FString().Append("  Guest: ").Append(LoginResult.Data.bGuest), 5.0f);
            UMiHoYoSDKHelper::LogToScreenAndConsole(FString().Append("  ClientType: ").Append(LoginResult.Data.ClientType), 5.0f);
            XLog(ELog(27), FString().Append("SDK Login Success! OpenID: ").Append(LoginResult.Data.OpenId).Append(". Ready to continue game."));
            this.SetCachedSDKLoginResult(LoginResult);
            this.SetbIsSDKLoginSucc(true);
            ::UGameClientConnectionSubsystem::Get().SetCachedVOXAppId(LoginResult.Data.AppId);
            return;
        }
        XError(ELog(27), FString().Append("SDK Login Failed: ret=").Append(LoginResult.Ret).Append(", msg=").Append(LoginResult.Msg));
        this.SetbIsSDKLoginSucc(false);
        return;
    }
    void OnConnectToGateSuccess()
    {
        XLog(ELog(78), "OnConnectToGateSuccess");
        this.SetLoginState(ELoginState(6));
        this.GetClientConnectionSubsystem().GetSDKPlayerToken(this.GetCachedSDKLoginResult().Data.OpenId, this.GetCachedSDKLoginResult());
        return;
    }
    void OnSDKEnterGameFailed()
    {
        XError(ELog(78), "OnSDKEnterGameFailed");
        this.SetLoginState(ELoginState(5));
        return;
    }
    void OnPlayerLoginRsp(const FPbPlayerLoginRsp &inout PlayerLoginRsp)
    {
        this.SetLoginState(ELoginState(7));
        return;
    }
    void TryAdvanceAfterAllGateAddressesReceived()
    {
        for (auto& local_16 : this.GetRegionInfos())
        {
            local_16;
            if (!(GetbGateAddressReceived()))
            {
                return;
            }
        }
        int local_20 = this.GetRegionInfos().Num() - 1;
        for (; local_20 >= 0; --local_20)
        {
            if (!(GetbValid()))
            {
                XLog(ELog(78), FString().Append("Remove invalid region after gate query: ").Append(GetName()));
                this.GetModify_RegionInfos().RemoveAt(local_20);
            }
        }
        if (this.GetRegionInfos().Num() == 0)
        {
            XError(ELog(78), "All regions failed gate address query");
            return;
        }
        this.RefreshSelectRegionIndex();
        this.TryStartDownloadStep();
        this.SetbRegionInfoFinish(true);
        return;
    }
    void RefreshSelectRegionIndex()
    {
        this.SetSelectRegionIndex(0);
        if (!(this.GetRecentServerName().IsEmpty()))
        {
            int local_3 = 0;
            for (; local_3 < this.GetRegionInfos().Num(); ++local_3)
            {
                if ((FString(GetName()) == this.GetRecentServerName()))
                {
                    this.SetSelectRegionIndex(local_3);
                }
            }
        }
        this.RecordRecentServerName();
        return;
    }
    void RecordRecentServerName()
    {
        if (!(this.GetRegionInfos().IsValidIndex(this.GetSelectRegionIndex())))
        {
            XError(ELog(78), "SelectRegionIndex is out of range");
            return;
        }
        int local_1 = this.GetSelectRegionIndex();
        this.SetRecentServerName(GetName());
        FString local_16 = (FPlatformProcess::UserSettingsDir() + "/Login/recent_server.txt");
        bool local_2 = FFileHelper::SaveStringToFile(this.GetRecentServerName(), local_16, FFileHelper::EEncodingOptions(4), 0);
        if (!(local_2))
        {
            XError(ELog(78), FString().Append("Save recent server name failed, file path: ").Append(local_16).Append(", server name: ").Append(this.GetRecentServerName()));
        }
        return;
    }
    bool CheckRegionInfo()
    {
        FVM_RegionInfo& local_6;
        if (!(this.GetRegionInfos().IsValidIndex(this.GetSelectRegionIndex())))
        {
            XError(ELog(78), "TryStartDownloadStep: SelectRegionIndex is out of range");
            return false;
        }
        int local_1 = this.GetSelectRegionIndex();
        if (!(local_6.GetbValid()))
        {
            XError(ELog(78), FString().Append("TryStartDownloadStep: selected region ").Append(local_6.GetName()).Append(" is invalid"));
            return false;
        }
        return true;
    }
    void TryStartDownloadStep()
    {
        if (this.CheckRegionInfo())
        {
            this.SetClientVersionStr(this.GetClientConnectionSubsystem().GetClientVersion());
            FLoginDownloadInfo local_22;
            for (auto& local_36 : this.GetRegionInfos())
            {
                local_36;
                if (GetbValid() && !(GetLoginDownloadInfo().ClientVersion.IsEmpty()))
                {
                    break;
                }
            }
            if (this.NeedVersionUpdate(local_22))
            {
                this.SetLoginState(ELoginState(3));
                this.ResetDownloadSpeedSampling();
                return;
            }
        }
        this.EnterPSOOrSDKLogin();
        return;
    }
    bool IsPSOPrecompileDisabled() const
    {
        bool local_3;
        if (!(IsValid(this.GetLoginSettings())))
        {
            local_3 = false;
        }
        else
        {
            local_3 = this.GetLoginSettings().PSOPrecompileInfo.bDisablePSOPrecompile;
        }
        return local_3;
    }
    void EnterPSOOrSDKLogin()
    {
        int local_2;
        this.SetbIsSDKLoginSucc(false);
        if (this.IsPSOPrecompileDisabled())
        {
            int local_3;
            local_3 = 5;
            local_2 = local_3;
        }
        else
        {
            int local_3;
            local_3 = 4;
            local_2 = local_3;
        }
        this.SetLoginState(ELoginState(local_2));
        return;
    }
    FText ByteToDownloadSizeShow(const uint64 ByteSize) const
    {
        FText local_24;
        FText local_32;
        int64 local_2 = 4697254411347427328;
        int64 local_6 = 4742290407621132288;
        FNumberFormattingOptions local_12;
        local_12.SetMinimumFractionalDigits(1);
        local_12.SetMaximumFractionalDigits(1);
        if (ByteSize >= 1073741824.0)
        {
            FText::AsNumber(local_24, float32((ByteSize / 1073741824.0)));
            NSLOCTEXT("Login", "DownloadSizeGB", "{0} GB");
            FText::Format(local_32);
            return local_32;
        }
        FText::AsNumber(local_32, float32((ByteSize / 1048576.0)));
        NSLOCTEXT("Login", "DownloadSizeMB", "{0} MB");
        FText::Format(local_24);
        return local_24;
    }
    int ParseDownloadExtraSize(const FString &inout DownloadExtraInfo)
    {
        if (DownloadExtraInfo.IsEmpty())
        {
            return 0;
        }
        TArray<FString> local_6;
        DownloadExtraInfo.ParseIntoArray(local_6, ":", true);
        if (local_6.Num() < 2)
        {
            return 0;
        }
        FString local_16 = local_6[1].TrimStartAndEnd();
        if (!(local_16.IsNumeric()))
        {
            return 0;
        }
        return String::Conv_StringToInt(local_16);
    }
    bool NeedVersionUpdate(const FLoginDownloadInfo &inout DownloadInfo)
    {
        bool local_3 = !(IsValid(this.GetLoginSettings()));
        if (local_3)
        {
            local_3 = true;
        }
        else
        {
            local_3 = this.GetLoginSettings().HotUpdateInfo.bDisableHotUpdate;
        }
        local_3 = local_3 || Login::IsHotUpdateDisabledByCVar();
        if (local_3)
        {
            return false;
        }
        if (DownloadInfo.CdnUrl.IsEmpty())
        {
            return false;
        }
        FString local_8 = DownloadInfo.ClientVersion;
        XLog(ELog(78), FString().Append("TryStartVersionUpdateIfNeeded: ClientNewVersion=").Append(local_8).Append(" DownloadExtraSize=").Append(this.ParseDownloadExtraSize(DownloadInfo.DownloadExtraInfo)));
        USDKServiceSubSystem local_18 = USDKServiceSubSystem::Get();
        if (!(IsValid(local_18)))
        {
            return false;
        }
        UKLDownloadService local_22 = (Cast<UKLDownloadService>(local_18.GetSdkServiceByType(ESDKServiceType(1))));
        if (!(IsValid(local_22)) || !(local_22.CheckVersionUpdate(local_8)))
        {
            return false;
        }
        return true;
    }
    void HandleDownloadProgress(const uint64 DownloadedSize, const uint64 TotalSize)
    {
        this.SetDownloadProgressDownloaded(DownloadedSize);
        if (this.GetDownloadProgressTotal() != TotalSize)
        {
            this.SetDownloadProgressTotal(TotalSize);
            this.SetDownloadTotalString(this.ByteToDownloadSizeShow(TotalSize));
        }
        if (TotalSize > 0)
        {
            this.SetDownloadProgress(float32((DownloadedSize / TotalSize)));
        }
        else
        {
            this.SetDownloadProgress(0.0f);
        }
        this.SetDownloadSpeedMBps(this.CalcDownloadSpeedMBps(DownloadedSize));
        XLog(ELog(78), FString().Append("OnDownloadProgress: DownloadedSize=").Append(DownloadedSize).Append(" TotalSize=").Append(TotalSize).Append(" SpeedMBps=").Append(this.GetDownloadSpeedMBps()));
        return;
    }
    float32 CalcDownloadSpeedMBps(const uint64 DownloadedSize)
    {
        int64 local_14;
        UWorld local_2 = this.GetContext().UELocalPlayer.GetWorld();
        if (!(IsValid(local_2)))
        {
            return 0.0f;
        }
        float local_10 = local_2.GetTimeSeconds();
        if (!(this.GetbHasLastDownloadProgressSample()))
        {
            this.SetbHasLastDownloadProgressSample(true);
            this.SetLastDownloadedByte(DownloadedSize);
            this.SetLastDownloadProgressTimeSeconds(local_10);
            return 0.0f;
        }
        float local_8 = local_10 - this.GetLastDownloadProgressTimeSeconds();
        local_14 = this.GetLastDownloadedByte();
        this.SetLastDownloadedByte(DownloadedSize);
        this.SetLastDownloadProgressTimeSeconds(local_10);
        if (local_8 <= 0.0)
        {
            return 0.0f;
        }
        int64 local_18 = 0;
        if (DownloadedSize > local_14)
        {
            local_18 = DownloadedSize - local_14;
        }
        float local_20 = (local_18 / local_8) / 1048576.0;
        return float32(local_20);
    }
    void HandleDownloadCompleted(const bool bSuccess, const int Code)
    {
        XLog(ELog(78), FString().Append("HandleDownloadCompleted: bSuccess=").Append(bSuccess).Append(" Code=").Append(Code).Append(" LoginState=").Append(this.GetLoginState()));
        if (!(bSuccess))
        {
            return;
        }
        if ((int(this.GetLoginState())) == 3)
        {
            this.EnterPSOOrSDKLogin();
        }
        return;
    }
    FText FormatPSOHintText() const
    {
        FNumberFormattingOptions local_6;
        local_6.SetMinimumFractionalDigits(1);
        local_6.SetMaximumFractionalDigits(1);
        FText local_12;
        FText::AsNumber(local_12, this.GetPSOPercentage());
        return FText::Format(this.GetPSOPrecompileText(), local_12);
    }
    void StartPSOPrecompile()
    {
        XLog(ELog(78), "StartPSOPrecompile");
        this.SetPSOTotalCount(0);
        this.SetPSOPercentage(0.0f);
        this.SetbPSOSawWork(false);
        this.SetPSOElapsedSeconds(0.0f);
        this.SetDownloadProgress(0.0f);
        this.SetHotUpdateProgressText(this.FormatPSOHintText());
        KLPipelineCache::SetPrecompileSpeed(EKLPSOPrecompileSpeed(2));
        KLPipelineCache::OpenPipelineFileCache();
        return;
    }
    void UpdatePSOProgress(const float32 DeltaSeconds)
    {
        if (int(this.GetLoginState()) != 4)
        {
            return;
        }
        this.SetPSOElapsedSeconds((this.GetPSOElapsedSeconds() + DeltaSeconds));
        int local_2 = KLPipelineCache::GetNumPrecompilesRemaining();
        if (local_2 > 0)
        {
            this.SetbPSOSawWork(true);
        }
        if (this.GetPSOTotalCount() == 0 || (local_2 > this.GetPSOTotalCount()))
        {
            this.SetPSOTotalCount(FMath::Max(local_2, 1));
        }
        this.SetPSOPercentage(FMath::Clamp(((this.GetPSOTotalCount() - local_2) / this.GetPSOTotalCount()), 0.0f, 1.0f) * 100.0f);
        this.SetDownloadProgress(this.GetPSOPercentage() / 100.0f);
        this.SetHotUpdateProgressText(this.FormatPSOHintText());
        int local_17 = 1056964608;
        if ((this.GetbPSOSawWork() || (this.GetPSOElapsedSeconds() >= 0.5f)) && (local_2 <= 0))
        {
            this.SetPSOPercentage(100.0f);
            this.SetDownloadProgress(1.0f);
            XLog(ELog(78), "UpdatePSOProgress: precompile finished, advance to SDKLogin");
            KLPipelineCache::OnPrecompileFinished();
            this.SetbIsSDKLoginSucc(false);
            this.SetLoginState(ELoginState(ELoginState(5)));
        }
        return;
    }
    void HandleDownloadManifestCompleted(const bool bSuccess, const int Code)
    {
        XLog(ELog(78), FString().Append("OnDownloadManifestCompleted: bSuccess=").Append(bSuccess).Append(" Code=").Append(Code));
        return;
    }
    ULoginSettings GetLoginSettings() const property
    {
        this.TrackPropertyRead(0);
        return this.m_LoginSettings;
    }
    void SetLoginSettings(const ULoginSettings __Value) property
    {
        if (this.m_LoginSettings == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        return;
    }
    int GetLoginSwitchIndex() const property
    {
        this.TrackPropertyRead(1);
        return this.m_LoginSwitchIndex;
    }
    void SetLoginSwitchIndex(const int __Value) property
    {
        if (this.m_LoginSwitchIndex == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_LoginSwitchIndex = __Value;
        return;
    }
    bool GetbShowLoginSwitch() const property
    {
        this.TrackPropertyRead(2);
        return this.m_bShowLoginSwitch;
    }
    void SetbShowLoginSwitch(const bool __Value) property
    {
        if (!(this.m_bShowLoginSwitch) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_bShowLoginSwitch = __Value;
        return;
    }
    int GetSelectRegionIndex() const property
    {
        this.TrackPropertyRead(3);
        return this.m_SelectRegionIndex;
    }
    void SetSelectRegionIndex(const int __Value) property
    {
        if (this.m_SelectRegionIndex == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_SelectRegionIndex = __Value;
        return;
    }
    const FText GetHotUpdateProgressText() const property
    {
        const FText __r;
        this.TrackPropertyRead(4);
        return __r;
    }
    FText GetModify_HotUpdateProgressText() property
    {
        FText __r;
        this.MarkPropertyDirty(4);
        return __r;
    }
    void SetHotUpdateProgressText(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_HotUpdateProgressText = __Value;
        return;
    }
    const FText GetPSOPrecompileText() const property
    {
        const FText __r;
        this.TrackPropertyRead(5);
        return __r;
    }
    FText GetModify_PSOPrecompileText() property
    {
        FText __r;
        this.MarkPropertyDirty(5);
        return __r;
    }
    void SetPSOPrecompileText(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_PSOPrecompileText = __Value;
        return;
    }
    const TArray<TEUIModelRef<FVM_RegionInfo>> GetRegionInfos() const property
    {
        const TArray<TEUIModelRef<FVM_RegionInfo>> __r;
        this.TrackPropertyRead(6);
        return __r;
    }
    TArray<TEUIModelRef<FVM_RegionInfo>> GetModify_RegionInfos() property
    {
        TArray<TEUIModelRef<FVM_RegionInfo>> __r;
        this.MarkPropertyDirty(6);
        return __r;
    }
    void SetRegionInfos(const TArray<TEUIModelRef<FVM_RegionInfo>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_RegionInfos = __Value;
        return;
    }
    const TArray<TEUIModelRef<FVM_LoginButton>> GetLoginButtons() const property
    {
        const TArray<TEUIModelRef<FVM_LoginButton>> __r;
        this.TrackPropertyRead(7);
        return __r;
    }
    TArray<TEUIModelRef<FVM_LoginButton>> GetModify_LoginButtons() property
    {
        TArray<TEUIModelRef<FVM_LoginButton>> __r;
        this.MarkPropertyDirty(7);
        return __r;
    }
    void SetLoginButtons(const TArray<TEUIModelRef<FVM_LoginButton>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(7);
        this.m_LoginButtons = __Value;
        return;
    }
    TEUIModelRef<FVM_LoginButton> GetStartGameButton() const property
    {
        this.TrackPropertyRead(8);
        return this.m_StartGameButton;
    }
    void SetStartGameButton(const TEUIModelRef<FVM_LoginButton> &inout __Value) property
    {
        TEUIModelRef<FVM_LoginButton> local_2;
        local_2 = this.m_StartGameButton;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(8);
        this.m_StartGameButton = __Value;
        return;
    }
    TEUIModelRef<FVM_LoginButton> GetContinueGameButton() const property
    {
        this.TrackPropertyRead(9);
        return this.m_ContinueGameButton;
    }
    void SetContinueGameButton(const TEUIModelRef<FVM_LoginButton> &inout __Value) property
    {
        TEUIModelRef<FVM_LoginButton> local_2;
        local_2 = this.m_ContinueGameButton;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(9);
        this.m_ContinueGameButton = __Value;
        return;
    }
    TEUIModelRef<FVM_LoginButton> GetSwitchAccountButton() const property
    {
        this.TrackPropertyRead(10);
        return this.m_SwitchAccountButton;
    }
    void SetSwitchAccountButton(const TEUIModelRef<FVM_LoginButton> &inout __Value) property
    {
        TEUIModelRef<FVM_LoginButton> local_2;
        local_2 = this.m_SwitchAccountButton;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(10);
        this.m_SwitchAccountButton = __Value;
        return;
    }
    TEUIModelRef<FVM_LoginButton> GetNoticeButton() const property
    {
        this.TrackPropertyRead(11);
        return this.m_NoticeButton;
    }
    void SetNoticeButton(const TEUIModelRef<FVM_LoginButton> &inout __Value) property
    {
        TEUIModelRef<FVM_LoginButton> local_2;
        local_2 = this.m_NoticeButton;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(11);
        this.m_NoticeButton = __Value;
        return;
    }
    TEUIModelRef<FVM_LoginButton> GetSettingsButton() const property
    {
        this.TrackPropertyRead(12);
        return this.m_SettingsButton;
    }
    void SetSettingsButton(const TEUIModelRef<FVM_LoginButton> &inout __Value) property
    {
        TEUIModelRef<FVM_LoginButton> local_2;
        local_2 = this.m_SettingsButton;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(12);
        this.m_SettingsButton = __Value;
        return;
    }
    TEUIModelRef<FVM_LoginButton> GetExitGameButton() const property
    {
        this.TrackPropertyRead(13);
        return this.m_ExitGameButton;
    }
    void SetExitGameButton(const TEUIModelRef<FVM_LoginButton> &inout __Value) property
    {
        TEUIModelRef<FVM_LoginButton> local_2;
        local_2 = this.m_ExitGameButton;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(13);
        this.m_ExitGameButton = __Value;
        return;
    }
    UGameClientConnectionSubsystem GetClientConnectionSubsystem() const property
    {
        this.TrackPropertyRead(14);
        return this.m_ClientConnectionSubsystem;
    }
    void SetClientConnectionSubsystem(const UGameClientConnectionSubsystem __Value) property
    {
        if (this.m_ClientConnectionSubsystem == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(14);
        return;
    }
    ELoginState GetLoginState() const property
    {
        this.TrackPropertyRead(15);
        return this.m_LoginState;
    }
    void SetLoginState(const ELoginState __Value) property
    {
        if (int(this.m_LoginState) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(15);
        this.m_LoginState = __Value;
        return;
    }
    const FString GetRecentServerName() const property
    {
        const FString __r;
        this.TrackPropertyRead(16);
        return __r;
    }
    FString GetModify_RecentServerName() property
    {
        FString __r;
        this.MarkPropertyDirty(16);
        return __r;
    }
    void SetRecentServerName(const FString &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(16);
        this.m_RecentServerName = __Value;
        return;
    }
    uint64 GetDownloadProgressDownloaded() const property
    {
        this.TrackPropertyRead(17);
        return this.m_DownloadProgressDownloaded;
    }
    void SetDownloadProgressDownloaded(const uint64 __Value) property
    {
        if (this.m_DownloadProgressDownloaded == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(17);
        this.m_DownloadProgressDownloaded = __Value;
        return;
    }
    uint64 GetDownloadProgressTotal() const property
    {
        this.TrackPropertyRead(18);
        return this.m_DownloadProgressTotal;
    }
    void SetDownloadProgressTotal(const uint64 __Value) property
    {
        if (this.m_DownloadProgressTotal == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(18);
        this.m_DownloadProgressTotal = __Value;
        return;
    }
    const float32 GetDownloadSpeedMBps() const property
    {
        const float32 __r;
        this.TrackPropertyRead(19);
        return __r;
    }
    float32 GetModify_DownloadSpeedMBps() property
    {
        float32 __r;
        this.MarkPropertyDirty(19);
        return __r;
    }
    void SetDownloadSpeedMBps(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(19);
        this.m_DownloadSpeedMBps = __Value;
        return;
    }
    bool GetbHasLastDownloadProgressSample() const property
    {
        this.TrackPropertyRead(20);
        return this.m_bHasLastDownloadProgressSample;
    }
    void SetbHasLastDownloadProgressSample(const bool __Value) property
    {
        if (!(this.m_bHasLastDownloadProgressSample) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(20);
        this.m_bHasLastDownloadProgressSample = __Value;
        return;
    }
    uint64 GetLastDownloadedByte() const property
    {
        this.TrackPropertyRead(21);
        return this.m_LastDownloadedByte;
    }
    void SetLastDownloadedByte(const uint64 __Value) property
    {
        if (this.m_LastDownloadedByte == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(21);
        this.m_LastDownloadedByte = __Value;
        return;
    }
    const float GetLastDownloadProgressTimeSeconds() const property
    {
        const float __r;
        this.TrackPropertyRead(22);
        return __r;
    }
    float GetModify_LastDownloadProgressTimeSeconds() property
    {
        float __r;
        this.MarkPropertyDirty(22);
        return __r;
    }
    void SetLastDownloadProgressTimeSeconds(const float &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(22);
        this.m_LastDownloadProgressTimeSeconds = __Value;
        return;
    }
    const FString GetClientVersionStr() const property
    {
        const FString __r;
        this.TrackPropertyRead(23);
        return __r;
    }
    FString GetModify_ClientVersionStr() property
    {
        FString __r;
        this.MarkPropertyDirty(23);
        return __r;
    }
    void SetClientVersionStr(const FString &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(23);
        this.m_ClientVersionStr = __Value;
        return;
    }
    const float32 GetDownloadProgress() const property
    {
        const float32 __r;
        this.TrackPropertyRead(24);
        return __r;
    }
    float32 GetModify_DownloadProgress() property
    {
        float32 __r;
        this.MarkPropertyDirty(24);
        return __r;
    }
    void SetDownloadProgress(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(24);
        this.m_DownloadProgress = __Value;
        return;
    }
    const float32 GetPSOPercentage() const property
    {
        const float32 __r;
        this.TrackPropertyRead(25);
        return __r;
    }
    float32 GetModify_PSOPercentage() property
    {
        float32 __r;
        this.MarkPropertyDirty(25);
        return __r;
    }
    void SetPSOPercentage(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(25);
        this.m_PSOPercentage = __Value;
        return;
    }
    int GetPSOTotalCount() const property
    {
        this.TrackPropertyRead(26);
        return this.m_PSOTotalCount;
    }
    void SetPSOTotalCount(const int __Value) property
    {
        if (this.m_PSOTotalCount == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(26);
        this.m_PSOTotalCount = __Value;
        return;
    }
    bool GetbPSOSawWork() const property
    {
        this.TrackPropertyRead(27);
        return this.m_bPSOSawWork;
    }
    void SetbPSOSawWork(const bool __Value) property
    {
        if (!(this.m_bPSOSawWork) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(27);
        this.m_bPSOSawWork = __Value;
        return;
    }
    const float32 GetPSOElapsedSeconds() const property
    {
        const float32 __r;
        this.TrackPropertyRead(28);
        return __r;
    }
    float32 GetModify_PSOElapsedSeconds() property
    {
        float32 __r;
        this.MarkPropertyDirty(28);
        return __r;
    }
    void SetPSOElapsedSeconds(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(28);
        this.m_PSOElapsedSeconds = __Value;
        return;
    }
    const FText GetDownloadTotalString() const property
    {
        const FText __r;
        this.TrackPropertyRead(29);
        return __r;
    }
    FText GetModify_DownloadTotalString() property
    {
        FText __r;
        this.MarkPropertyDirty(29);
        return __r;
    }
    void SetDownloadTotalString(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(29);
        this.m_DownloadTotalString = __Value;
        return;
    }
    bool GetbIsSDKLoginSucc() const property
    {
        this.TrackPropertyRead(30);
        return this.m_bIsSDKLoginSucc;
    }
    void SetbIsSDKLoginSucc(const bool __Value) property
    {
        if (!(this.m_bIsSDKLoginSucc) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(30);
        this.m_bIsSDKLoginSucc = __Value;
        return;
    }
    const FSDKLoginResult GetCachedSDKLoginResult() const property
    {
        const FSDKLoginResult __r;
        this.TrackPropertyRead(31);
        return __r;
    }
    FSDKLoginResult GetModify_CachedSDKLoginResult() property
    {
        FSDKLoginResult __r;
        this.MarkPropertyDirty(31);
        return __r;
    }
    void SetCachedSDKLoginResult(const FSDKLoginResult &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(31);
        this.m_CachedSDKLoginResult = __Value;
        return;
    }
    int GetStartLoginSDKRequestSeq() const property
    {
        this.TrackPropertyRead(32);
        return this.m_StartLoginSDKRequestSeq;
    }
    void SetStartLoginSDKRequestSeq(const int __Value) property
    {
        if (this.m_StartLoginSDKRequestSeq == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(32);
        this.m_StartLoginSDKRequestSeq = __Value;
        return;
    }
    int GetContinueGameRequestSeq() const property
    {
        this.TrackPropertyRead(33);
        return this.m_ContinueGameRequestSeq;
    }
    void SetContinueGameRequestSeq(const int __Value) property
    {
        if (this.m_ContinueGameRequestSeq == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(33);
        this.m_ContinueGameRequestSeq = __Value;
        return;
    }
    int GetSwitchAccountRequestSeq() const property
    {
        this.TrackPropertyRead(34);
        return this.m_SwitchAccountRequestSeq;
    }
    void SetSwitchAccountRequestSeq(const int __Value) property
    {
        if (this.m_SwitchAccountRequestSeq == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(34);
        this.m_SwitchAccountRequestSeq = __Value;
        return;
    }
    const FString GetSelectServerName() const property
    {
        const FString __r;
        this.TrackPropertyRead(35);
        return __r;
    }
    FString GetModify_SelectServerName() property
    {
        FString __r;
        this.MarkPropertyDirty(35);
        return __r;
    }
    void SetSelectServerName(const FString &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(35);
        this.m_SelectServerName = __Value;
        return;
    }
    const FString GetSelectServerTitle() const property
    {
        const FString __r;
        this.TrackPropertyRead(36);
        return __r;
    }
    FString GetModify_SelectServerTitle() property
    {
        FString __r;
        this.MarkPropertyDirty(36);
        return __r;
    }
    void SetSelectServerTitle(const FString &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(36);
        this.m_SelectServerTitle = __Value;
        return;
    }
    bool GetbRegionInfoFinish() const property
    {
        this.TrackPropertyRead(37);
        return this.m_bRegionInfoFinish;
    }
    void SetbRegionInfoFinish(const bool __Value) property
    {
        if (!(this.m_bRegionInfoFinish) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(37);
        this.m_bRegionInfoFinish = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_RegionInfo
{
    UPROPERTY()
    bool IsSelected;
    UPROPERTY()
    TEUIModelRef<FVM_RegionInfo> Self;


}

struct __GeneratedProperties_FVMS_Login
{
    UPROPERTY()
    FText DownloadSpeedString;
    UPROPERTY()
    FText DownloadInfoString;
    UPROPERTY()
    ESlateVisibility ServerRootVisibility;
    UPROPERTY()
    ESlateVisibility VersionVisibility;
    UPROPERTY()
    ESlateVisibility StartBtnVisibility;
    UPROPERTY()
    ESlateVisibility ContinueBtnVisibility;
    UPROPERTY()
    ESlateVisibility SwitchAccountBtnVisibility;
    UPROPERTY()
    ESlateVisibility NoticeBtnVisibility;
    UPROPERTY()
    ESlateVisibility SettingsBtnVisibility;
    UPROPERTY()
    ESlateVisibility ExitGameBtnVisibility;
    UPROPERTY()
    TEUIModelRef<FVMS_Login> Self;


}

namespace FVM_RegionInfo
{
FVM_RegionInfo& Create(const UObject ContextObject)
{
    return FVM_RegionInfo::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_RegionInfo CreateByManager(const UEUIManagerSubsystem Manager)
{
    FVM_RegionInfo __r;
    TEUIModelRef<FVM_RegionInfo> local_6 = TEUIModelRef<FVM_RegionInfo>(EUIInternal::MakeModelWithManager(Manager, FVM_RegionInfo::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "Name";
    local_14.TypeName = "FString";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Title";
    local_14.TypeName = "FString";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Type";
    local_14.TypeName = "FString";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IsSelected";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_RegionInfo>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_RegionInfo;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_RegionInfo;
}
FString __UIGetter_Name(const FVM_RegionInfo &inout Model)
{
    return Model.GetName();
}
FString __UIGetter_Title(const FVM_RegionInfo &inout Model)
{
    return Model.GetTitle();
}
FString __UIGetter_Type(const FVM_RegionInfo &inout Model)
{
    return Model.GetType();
}
bool __UIGetter_IsSelected(const FVM_RegionInfo &inout Model)
{
    return Model.GetIsSelected();
}
TEUIModelRef<FVM_RegionInfo> __UIGetter_Self(const FVM_RegionInfo &inout Model)
{
    return TEUIModelRef<FVM_RegionInfo>(Model);
}
int __IndexOf_Name()
{
    return 0;
}
int __IndexOf_Title()
{
    return 1;
}
int __IndexOf_Type()
{
    return 2;
}
int __IndexOf_DispatchURL()
{
    return 3;
}
int __IndexOf_GateAddress()
{
    return 4;
}
int __IndexOf_GatePort()
{
    return 5;
}
int __IndexOf_DSVersion()
{
    return 6;
}
int __IndexOf_DSAAddress()
{
    return 7;
}
int __IndexOf_DSAPort()
{
    return 8;
}
int __IndexOf_LoginDownloadInfo()
{
    return 9;
}
int __IndexOf_bValid()
{
    return 10;
}
int __IndexOf_bGateAddressReceived()
{
    return 11;
}
}
namespace __GeneratedProperties_FVM_RegionInfo
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
namespace FVMS_Login
{
FVMS_Login& Get(const UObject ContextObject)
{
    return FVMS_Login::GetByManager(EUIInternal::GetContextManager(ContextObject));
}
FVMS_Login GetByManager(const UEUIManagerSubsystem Manager)
{
    FVMS_Login __r;
    TEUIModelRef<FVMS_Login> local_6 = TEUIModelRef<FVMS_Login>(EUIInternal::MakeModelWithManager(Manager, FVMS_Login::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "LoginSwitchIndex";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bShowLoginSwitch";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "SelectRegionIndex";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "HotUpdateProgressText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "LoginButtons";
    local_14.TypeName = "TArray<TEUIModelRef<FVM_LoginButton>>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "StartGameButton";
    local_14.TypeName = "TEUIModelRef<FVM_LoginButton>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ContinueGameButton";
    local_14.TypeName = "TEUIModelRef<FVM_LoginButton>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "SwitchAccountButton";
    local_14.TypeName = "TEUIModelRef<FVM_LoginButton>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "NoticeButton";
    local_14.TypeName = "TEUIModelRef<FVM_LoginButton>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "SettingsButton";
    local_14.TypeName = "TEUIModelRef<FVM_LoginButton>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ExitGameButton";
    local_14.TypeName = "TEUIModelRef<FVM_LoginButton>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ClientVersionStr";
    local_14.TypeName = "FString";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "DownloadProgress";
    local_14.TypeName = "float32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "DownloadTotalString";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "SelectServerName";
    local_14.TypeName = "FString";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "SelectServerTitle";
    local_14.TypeName = "FString";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "DownloadSpeedString";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "DownloadInfoString";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ServerRootVisibility";
    local_14.TypeName = "ESlateVisibility";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "VersionVisibility";
    local_14.TypeName = "ESlateVisibility";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "StartBtnVisibility";
    local_14.TypeName = "ESlateVisibility";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ContinueBtnVisibility";
    local_14.TypeName = "ESlateVisibility";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "SwitchAccountBtnVisibility";
    local_14.TypeName = "ESlateVisibility";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "NoticeBtnVisibility";
    local_14.TypeName = "ESlateVisibility";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "SettingsBtnVisibility";
    local_14.TypeName = "ESlateVisibility";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ExitGameBtnVisibility";
    local_14.TypeName = "ESlateVisibility";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVMS_Login>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVMS_Login;
    FEUIModelMsgHandleDefine local_26;
    local_26.FunctionName = "__HandleLoginServerSelect";
    local_26.MessageTypeName = "Msg_LoginServerSelect";
    local_26.SourcePropertyModelRefs = FBitSet64(0);
    Result.MessageHandleFunctions.Add(local_26);
    FEUIModelEffectDefine local_34;
    local_34.FunctionName = "RefreshLoginButtons";
    Result.EffectFunctions.Add(local_34);
    local_34.FunctionName = "RefreshServerRootInfo";
    Result.EffectFunctions.Add(local_34);
    local_34.FunctionName = "RefreshLoginSwitchState";
    Result.EffectFunctions.Add(local_34);
    return;
}
UScriptStruct GetModelStruct()
{
    return FVMS_Login;
}
void __HandleLoginServerSelect(FVMS_Login &inout Model, const FMsg_LoginServerSelect &inout Message)
{
    Model.HandleLoginServerSelect(Message);
    return;
}
int __UIGetter_LoginSwitchIndex(const FVMS_Login &inout Model)
{
    return Model.GetLoginSwitchIndex();
}
bool __UIGetter_bShowLoginSwitch(const FVMS_Login &inout Model)
{
    return Model.GetbShowLoginSwitch();
}
int __UIGetter_SelectRegionIndex(const FVMS_Login &inout Model)
{
    return Model.GetSelectRegionIndex();
}
FText __UIGetter_HotUpdateProgressText(const FVMS_Login &inout Model)
{
    return Model.GetHotUpdateProgressText();
}
TArray<TEUIModelRef<FVM_LoginButton>> __UIGetter_LoginButtons(const FVMS_Login &inout Model)
{
    return Model.GetLoginButtons();
}
TEUIModelRef<FVM_LoginButton> __UIGetter_StartGameButton(const FVMS_Login &inout Model)
{
    return Model.GetStartGameButton();
}
TEUIModelRef<FVM_LoginButton> __UIGetter_ContinueGameButton(const FVMS_Login &inout Model)
{
    return Model.GetContinueGameButton();
}
TEUIModelRef<FVM_LoginButton> __UIGetter_SwitchAccountButton(const FVMS_Login &inout Model)
{
    return Model.GetSwitchAccountButton();
}
TEUIModelRef<FVM_LoginButton> __UIGetter_NoticeButton(const FVMS_Login &inout Model)
{
    return Model.GetNoticeButton();
}
TEUIModelRef<FVM_LoginButton> __UIGetter_SettingsButton(const FVMS_Login &inout Model)
{
    return Model.GetSettingsButton();
}
TEUIModelRef<FVM_LoginButton> __UIGetter_ExitGameButton(const FVMS_Login &inout Model)
{
    return Model.GetExitGameButton();
}
FString __UIGetter_ClientVersionStr(const FVMS_Login &inout Model)
{
    return Model.GetClientVersionStr();
}
float32 __UIGetter_DownloadProgress(const FVMS_Login &inout Model)
{
    return Model.GetDownloadProgress();
}
FText __UIGetter_DownloadTotalString(const FVMS_Login &inout Model)
{
    return Model.GetDownloadTotalString();
}
FString __UIGetter_SelectServerName(const FVMS_Login &inout Model)
{
    return Model.GetSelectServerName();
}
FString __UIGetter_SelectServerTitle(const FVMS_Login &inout Model)
{
    return Model.GetSelectServerTitle();
}
FText __UIGetter_DownloadSpeedString(const FVMS_Login &inout Model)
{
    return Model.GetDownloadSpeedString();
}
FText __UIGetter_DownloadInfoString(const FVMS_Login &inout Model)
{
    return Model.GetDownloadInfoString();
}
ESlateVisibility __UIGetter_ServerRootVisibility(const FVMS_Login &inout Model)
{
    return Model.ServerRootVisibility();
}
ESlateVisibility __UIGetter_VersionVisibility(const FVMS_Login &inout Model)
{
    return Model.VersionVisibility();
}
ESlateVisibility __UIGetter_StartBtnVisibility(const FVMS_Login &inout Model)
{
    return Model.StartBtnVisibility();
}
ESlateVisibility __UIGetter_ContinueBtnVisibility(const FVMS_Login &inout Model)
{
    return Model.ContinueBtnVisibility();
}
ESlateVisibility __UIGetter_SwitchAccountBtnVisibility(const FVMS_Login &inout Model)
{
    return Model.SwitchAccountBtnVisibility();
}
ESlateVisibility __UIGetter_NoticeBtnVisibility(const FVMS_Login &inout Model)
{
    return Model.NoticeBtnVisibility();
}
ESlateVisibility __UIGetter_SettingsBtnVisibility(const FVMS_Login &inout Model)
{
    return Model.SettingsBtnVisibility();
}
ESlateVisibility __UIGetter_ExitGameBtnVisibility(const FVMS_Login &inout Model)
{
    return Model.ExitGameBtnVisibility();
}
TEUIModelRef<FVMS_Login> __UIGetter_Self(const FVMS_Login &inout Model)
{
    return TEUIModelRef<FVMS_Login>(Model);
}
int __IndexOf_LoginSettings()
{
    return 0;
}
int __IndexOf_LoginSwitchIndex()
{
    return 1;
}
int __IndexOf_bShowLoginSwitch()
{
    return 2;
}
int __IndexOf_SelectRegionIndex()
{
    return 3;
}
int __IndexOf_HotUpdateProgressText()
{
    return 4;
}
int __IndexOf_PSOPrecompileText()
{
    return 5;
}
int __IndexOf_RegionInfos()
{
    return 6;
}
int __IndexOf_LoginButtons()
{
    return 7;
}
int __IndexOf_StartGameButton()
{
    return 8;
}
int __IndexOf_ContinueGameButton()
{
    return 9;
}
int __IndexOf_SwitchAccountButton()
{
    return 10;
}
int __IndexOf_NoticeButton()
{
    return 11;
}
int __IndexOf_SettingsButton()
{
    return 12;
}
int __IndexOf_ExitGameButton()
{
    return 13;
}
int __IndexOf_ClientConnectionSubsystem()
{
    return 14;
}
int __IndexOf_LoginState()
{
    return 15;
}
int __IndexOf_RecentServerName()
{
    return 16;
}
int __IndexOf_DownloadProgressDownloaded()
{
    return 17;
}
int __IndexOf_DownloadProgressTotal()
{
    return 18;
}
int __IndexOf_DownloadSpeedMBps()
{
    return 19;
}
int __IndexOf_bHasLastDownloadProgressSample()
{
    return 20;
}
int __IndexOf_LastDownloadedByte()
{
    return 21;
}
int __IndexOf_LastDownloadProgressTimeSeconds()
{
    return 22;
}
int __IndexOf_ClientVersionStr()
{
    return 23;
}
int __IndexOf_DownloadProgress()
{
    return 24;
}
int __IndexOf_PSOPercentage()
{
    return 25;
}
int __IndexOf_PSOTotalCount()
{
    return 26;
}
int __IndexOf_bPSOSawWork()
{
    return 27;
}
int __IndexOf_PSOElapsedSeconds()
{
    return 28;
}
int __IndexOf_DownloadTotalString()
{
    return 29;
}
int __IndexOf_bIsSDKLoginSucc()
{
    return 30;
}
int __IndexOf_CachedSDKLoginResult()
{
    return 31;
}
int __IndexOf_StartLoginSDKRequestSeq()
{
    return 32;
}
int __IndexOf_ContinueGameRequestSeq()
{
    return 33;
}
int __IndexOf_SwitchAccountRequestSeq()
{
    return 34;
}
int __IndexOf_SelectServerName()
{
    return 35;
}
int __IndexOf_SelectServerTitle()
{
    return 36;
}
int __IndexOf_bRegionInfoFinish()
{
    return 37;
}
}
namespace __GeneratedProperties_FVMS_Login
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
