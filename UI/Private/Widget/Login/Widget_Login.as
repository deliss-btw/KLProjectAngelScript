
namespace UWidget_Login
{
    const int ViewID = 0;

}
struct FLoginGateInfoDisplaySorter
{
    FLoginGateInfoDisplaySorter()
    {
        return;
    }
    bool opCall(const FLoginGateInfo &inout A, const FLoginGateInfo &inout B) const
    {
        bool local_4 = (A.RegionTitle.Len() > 0) && (A.RegionTitle[0] > 127);
        bool local_1 = (B.RegionTitle.Len() > 0) && (B.RegionTitle[0] > 127);
        bool local_7 = !(local_4);
        if (local_7 != !(local_1))
        {
            return local_4;
        }
        return (A.RegionTitle.opCmp(B.RegionTitle) < 0);
    }
}

class UWidget_Login : UEUIActivatableWidget
{
    UPROPERTY()
    UEditableTextBox EditableTextBox_UserName;
    UPROPERTY()
    UComboBoxString ComboBoxString_RecentUserNames;
    UPROPERTY()
    UEditableTextBox EditableTextBox_DS_ID;
    UPROPERTY()
    UCheckBox CheckBox_EnterTestLevel;
    UPROPERTY()
    UCheckBox CheckBox_IgnoreVersion;
    UPROPERTY()
    UCheckBox CheckBox_ShowSDKControls;
    UPROPERTY()
    UCheckBox CheckBox_CreatePlayer;
    UPROPERTY()
    UCheckBox CheckBox_Skip_Tutorial;
    UPROPERTY()
    UHorizontalBox HorizontalBox_SDK;
    UPROPERTY()
    UEditableTextBox EditableTextBox_ServerAddress;
    UPROPERTY()
    UTextBlock TextBlock_Version;
    UPROPERTY()
    UTextBlock TextBlock_Message;
    UPROPERTY()
    UComboBoxString ComboBoxString_ServerType;
    UPROPERTY()
    UComboBoxString ComboBoxString_ServerAddress;
    UPROPERTY()
    UEditableTextBox EditableTextBox_ServerSearch;
    UPROPERTY()
    UEditableTextBox EditableTextBox_SDKEnv;
    UPROPERTY()
    UEditableTextBox EditableTextBox_SDKRoleId;
    UPROPERTY()
    UHorizontalBox HorizontalBox_PSOPrecompile;
    UPROPERTY()
    UTextBlock TextBlock_PSOCompilePercentage;
    UPROPERTY()
    UEUIButton Button_Login;
    UPROPERTY()
    UEUIButton Button_Login_SDK;
    UPROPERTY()
    UEUIButton Button_Logout;
    UPROPERTY()
    UEUIButton Button_EnterGame;
    UPROPERTY()
    UCanvasPanel Panel_Connecting;
    UPROPERTY()
    UEUIButton Button_CancelConnecting;
    TArray<FLoginGateInfo> GateInfoList;
    TArray<FLoginGateInfo> AllGateInfoList;
    UPROPERTY()
    TMap<FString, int> RegionDSVersion;
    UPROPERTY()
    TArray<FString> RecentUserNames;
    UPROPERTY()
    int MaxRecentUserNames = 5;
    uint64 LocalDsID;
    int PendingLoginGateIndex = -1;
    FString PendingCheckCLRegionAddress;
    FTimerHandle WaitDSConnectTimerHandle;
    float32 WaitDSConnectInterval = 0.1f;
    float32 WaitDSConnectTimeout = 15.0f;
    float32 WaitDSConnectElapsed = 0.0f;
    UPROPERTY()
    FSDKLoginResult CachedSDKLoginResult;
    UPROPERTY()
    bool bIsSDKLogin = false;
    UPROPERTY()
    bool bSDKLoginSuccess = false;
    uint64 CachedDsID = 0;
    uint CachedLevelKey = 0;
    uint CachedCommissionKey = 0;
    bool bCachedEnterTestLevel = false;
    FString CachedPlayerUid;
    FString CachedAccountUid;
    FString CachedToken;
    FString CachedServerId;
    FHttpRspDelegate RecievedRegionListDelegate;
    FHttpRspDelegate RecievedGateAddressDelegate;
    FOnKCPConnectedToServerDelegate OnConnectToGateSuccessDelegate;
    FProtoRspDelegate GetPlayerTokenRspDelegate;
    FProtoRspDelegate PlayerLoginRspDelegate;
    FString SaveDsIDFilePath;
    FString SaveRecentServerFilePath;
    FString SaveRecentServerTypeFilePath;
    FString SaveRecentUserNamesFilePath;
    FString SaveIgnoreVersionFilePath;
    FString SaveSkipTutorialFilePath;
    int NumTotalPSOsToCompile = 0;
    bool bPSOFileOpened = false;
    bool bPSOPrecompileFinished = false;
    float32 DownloadSpeedMBps = 0.0f;
    bool bHasLastDownloadProgressSample = false;
    uint64 LastDownloadedByte = 0;
    float LastDownloadProgressTimeSeconds = 0.0;


    UFUNCTION()
    void Construct_Implementation()
    {
        this.Button_Login.OnClicked.AddUFunction(this, n"login");
        this.Button_Login_SDK.OnClicked.AddUFunction(this, n"Login_SDK");
        this.Button_Logout.OnClicked.AddUFunction(this, n"Logout");
        this.Button_EnterGame.OnClicked.AddUFunction(this, n"EnterGame");
        this.Button_CancelConnecting.OnClicked.AddUFunction(this, n"CancelConnecting");
        this.RecievedRegionListDelegate.BindUFunction(this, n"OnRegionListReceived");
        this.RecievedGateAddressDelegate.BindUFunction(this, n"OnGateAddressReceived");
        this.OnConnectToGateSuccessDelegate.BindUFunction(this, n"OnConnectToGateSuccess");
        UGameClientConnectionSubsystem local_6 = ::UGameClientConnectionSubsystem::Get();
        if (local_6.IsConnectedToGameServer())
        {
            local_6.PlayerLogout();
            local_6.EndKcpClient();
        }
        local_6.RequestForRegionList(this.RecievedRegionListDelegate);
        this.GetPlayerTokenRspDelegate.BindUFunction(this, n"OnGetPlayerTokenRsp");
        local_6.RegisterProtoRsp(uint16(6), this.GetPlayerTokenRspDelegate);
        this.PlayerLoginRspDelegate.BindUFunction(this, n"OnPlayerLoginRsp");
        local_6.RegisterProtoRsp(uint16(2), this.PlayerLoginRspDelegate);
        this.SaveDsIDFilePath = (FPlatformProcess::UserSettingsDir() + "/KLGame/Login/ds_id.txt");
        this.SaveRecentServerFilePath = (FPlatformProcess::UserSettingsDir() + "/KLGame/Login/recent_server.txt");
        this.SaveRecentServerTypeFilePath = (FPlatformProcess::UserSettingsDir() + "/KLGame/Login/recent_server_type.txt");
        this.SaveRecentUserNamesFilePath = (FPlatformProcess::UserSettingsDir() + "/KLGame/Login/recent_user_names.txt");
        this.SaveIgnoreVersionFilePath = (FPlatformProcess::UserSettingsDir() + "/KLGame/Login/ignore_version.txt");
        this.SaveSkipTutorialFilePath = (FPlatformProcess::UserSettingsDir() + "/KLGame/Login/skip_tutorial.txt");
        FString local_20;
        FFileHelper::LoadFileToString(local_20, this.SaveIgnoreVersionFilePath, FFileHelper::EHashOptions(0), 4);
        if (!(local_20.IsEmpty()) && (local_20.TrimStartAndEnd() == "1"))
        {
            this.CheckBox_IgnoreVersion.SetIsChecked(true);
        }
        if (this.CheckBox_Skip_Tutorial != nullptr)
        {
            FString local_30;
            FFileHelper::LoadFileToString(local_30, this.SaveSkipTutorialFilePath, FFileHelper::EHashOptions(0), 4);
            if (!(local_30.IsEmpty()) && (local_30.TrimStartAndEnd() == "1"))
            {
                this.CheckBox_Skip_Tutorial.SetIsChecked(true);
            }
        }
        FString local_30;
        FFileHelper::LoadFileToString(local_30, this.SaveDsIDFilePath, FFileHelper::EHashOptions(0), 4);
        if (!(EngineUtils::RequiresCookedData()))
        {
            this.EditableTextBox_DS_ID.SetText(FText::FromString(local_30));
        }
        this.InitUserName();
        this.EditableTextBox_SDKEnv.SetText(FText::FromString("22"));
        this.EditableTextBox_SDKRoleId.SetText(FText::FromString("1001"));
        this.TextBlock_Version.SetText(FText::FromString(FString().Append(" ").Append(FBlueprintDebugFunctions::GetEngineVersionBranch()).Append(" ").Append(System::GetBuildConfiguration()).Append(" ").Append(ECS::GetNetworkVersion()).Append(" ")));
        this.CheckBox_IgnoreVersion.OnCheckStateChanged.AddUFunction(this, n"OnIgnoreVersionChanged");
        if (this.CheckBox_Skip_Tutorial != nullptr)
        {
            this.CheckBox_Skip_Tutorial.OnCheckStateChanged.AddUFunction(this, n"OnSkipTutorialChanged");
        }
        this.CheckBox_ShowSDKControls.OnCheckStateChanged.AddUFunction(this, n"OnShowSDKControlsChanged");
        this.CheckBox_ShowSDKControls.SetIsChecked(false);
        this.UpdateSDKControlsVisibility(false);
        UECSLocalPlayer local_44 = (Cast<UECSLocalPlayer>(this.GetOwningLocalPlayer()));
        if (local_44 != nullptr)
        {
            local_44.OnDisconnectedFromDS.AddUFunction(this, n"OnDSDisconnected");
        }
        this.PlayLoginBGM();
        return;
    }
    UFUNCTION()
    void Destruct_Implementation()
    {
        System::ClearAndInvalidateTimerHandle(__GetWorldContext(), this.WaitDSConnectTimerHandle);
        UECSLocalPlayer local_8 = (Cast<UECSLocalPlayer>(this.GetOwningLocalPlayer()));
        if (local_8 != nullptr)
        {
            local_8.OnDisconnectedFromDS.UnbindObject(this);
        }
        this.StopLoginBGM();
        return;
    }
    UFUNCTION()
    void Tick_Implementation(const FGeometry &inout MyGeometry, const float32 InDeltaTime)
    {
        if (!(this.bPSOFileOpened))
        {
            this.bPSOFileOpened = true;
            KLPipelineCache::OpenPipelineFileCache();
        }
        this.UpdatePSOPrecompileHint();
        if (KLPipelineCache::GetNumPrecompilesRemaining() == 0 && !(this.bPSOPrecompileFinished))
        {
            this.bPSOPrecompileFinished = true;
            KLPipelineCache::OnPrecompileFinished();
        }
        return;
    }
    UFUNCTION()
    void OnDownloadProgress(const uint64 DownloadedSize, const uint64 TotalSize)
    {
        XLog(ELog(0), FString().Append("OnDownloadProgress: DownloadedSize---").Append(DownloadedSize).Append(" TotalSize----").Append(TotalSize));
        this.UpdateDownLoadProcess(DownloadedSize, TotalSize);
        return;
    }
    UFUNCTION()
    void OnDownloadCompleted(const bool bSuccess, const int Code)
    {
        XLog(ELog(0), FString().Append("OnDownloadCompleted: bSuccess---").Append(bSuccess).Append(" Code----").Append(Code));
        if (bSuccess)
        {
            int local_7 = this.FindGateInfoIndexByRegionAddress(this.PendingCheckCLRegionAddress);
            if (local_7 >= 0)
            {
                this.BeginLoginFlow(local_7);
                this.PendingCheckCLRegionAddress = "";
                return;
            }
            XWarning(ELog(27), FString().Append("Failed to find pending gate info for ").Append(this.PendingCheckCLRegionAddress));
        }
        return;
    }
    UFUNCTION()
    void OnDownloadManifestCompleted(const bool bSuccess, const int Code)
    {
        XLog(ELog(0), FString().Append("OnDownloadManifestCompleted: bSuccess---").Append(bSuccess).Append(" Code----").Append(Code));
        return;
    }
    void InitUserName()
    {
        this.RecentUserNames.Empty(0);
        FString local_6;
        FFileHelper::LoadFileToString(local_6, this.SaveRecentUserNamesFilePath, FFileHelper::EHashOptions(0), 4);
        TArray<FString> local_14;
        local_6.ParseIntoArray(local_14, "\n", true);
        for (auto& local_28 : local_14)
        {
            this.RecentUserNames.Add(local_28);
            if (this.RecentUserNames.Num() >= this.MaxRecentUserNames)
            {
                break;
            }
        }
        this.ComboBoxString_RecentUserNames.ClearOptions();
        for (auto& local_28 : this.RecentUserNames)
        {
            this.ComboBoxString_RecentUserNames.AddOption(local_28);
        }
        if (this.RecentUserNames.Num() > 0)
        {
            this.ComboBoxString_RecentUserNames.SetSelectedIndex(0);
            this.EditableTextBox_UserName.SetText(FText::FromString(this.RecentUserNames[0]));
        }
        else
        {
            this.EditableTextBox_UserName.SetText(FText::FromString(::FASCommonUtils::GetPlatformUserName()));
        }
        this.ComboBoxString_RecentUserNames.OnSelectionChanged.AddUFunction(this, n"OnRecentUserNameSelected");
        this.ComboBoxString_ServerType.OnSelectionChanged.AddUFunction(this, n"OnServerTypeSelected");
        this.ComboBoxString_ServerAddress.OnSelectionChanged.AddUFunction(this, n"OnServerAddressSelected");
        if (this.EditableTextBox_ServerSearch != nullptr)
        {
            this.EditableTextBox_ServerSearch.OnTextChanged.AddUFunction(this, n"OnServerSearchTextChanged");
        }
        return;
    }
    void SaveRecentUserNames()
    {
        FString local_4;
        FString local_16 = this.EditableTextBox_UserName.GetText().ToString();
        FString local_8 = (local_16 + "\n");
        local_4 += local_8;
        int local_17 = 1;
        if (local_17 >= this.MaxRecentUserNames)
        {
            return;
        }
        for (auto& local_34 : this.RecentUserNames)
        {
            if ((local_34 == local_16))
            {
                continue;
            }
            FString local_8_2 = (local_34 + "\n");
            local_4 += local_8_2;
            ++local_17;
            if (local_17 >= this.MaxRecentUserNames)
            {
                break;
            }
        }
        FFileHelper::SaveStringToFile(local_4, this.SaveRecentUserNamesFilePath, FFileHelper::EEncodingOptions(4), 0);
        return;
    }
    UFUNCTION()
    void OnRecentUserNameSelected(const FString &inout SelectedItem, const ESelectInfo SelectInfo)
    {
        this.EditableTextBox_UserName.SetText(FText::FromString(SelectedItem));
        return;
    }
    UFUNCTION()
    void OnServerAddressSelected(const FString &inout SelectedItem, const ESelectInfo SelectInfo)
    {
        int local_2 = this.ComboBoxString_ServerAddress.GetSelectedIndex();
        if (local_2 < 0 || (local_2 >= this.GateInfoList.Num()))
        {
            return;
        }
        this.EditableTextBox_ServerAddress.SetText(FText::FromString(FString(this.GateInfoList[local_2].RegionAddress)));
        return;
    }
    FString GetServerTypeDisplayName(const FString &inout RawType)
    {
        if ((RawType == "Public"))
        {
            return "е…¬жњЌ";
        }
        if ((RawType == "Private"))
        {
            return "з§ЃжњЌ";
        }
        if ((RawType == "QA"))
        {
            return "жµ‹иЇ•жњЌ";
        }
        return RawType;
    }
    FString GetServerTypeRawName(const FString &inout DisplayName)
    {
        if ((DisplayName == "е…¬жњЌ"))
        {
            return "Public";
        }
        if ((DisplayName == "з§ЃжњЌ"))
        {
            return "Private";
        }
        if ((DisplayName == "жµ‹иЇ•жњЌ"))
        {
            return "QA";
        }
        return DisplayName;
    }
    UFUNCTION()
    void OnServerTypeSelected(const FString &inout SelectedItem, const ESelectInfo SelectInfo)
    {
        this.RefreshServerList();
        return;
    }
    UFUNCTION()
    void OnServerSearchTextChanged(const FText &in Text)
    {
        this.RefreshServerList();
        return;
    }
    void RefreshServerList()
    {
        FString local_12 = this.GetServerTypeRawName(this.ComboBoxString_ServerType.GetSelectedOption());
        FString local_28;
        if (this.EditableTextBox_ServerSearch != nullptr)
        {
            local_28 = this.EditableTextBox_ServerSearch.GetText().ToString().TrimStartAndEnd();
        }
        else
        {
            local_28 = "";
        }
        this.ComboBoxString_ServerAddress.ClearOptions();
        this.GateInfoList.Empty(0);
        FString local_34;
        FFileHelper::LoadFileToString(local_34, this.SaveRecentServerFilePath, FFileHelper::EHashOptions(0), 4);
        FString local_8 = local_34.TrimStartAndEnd();
        int local_41 = 0;
        for (auto& local_56 : this.AllGateInfoList)
        {
            if ((!((local_56.RegionType == local_12))))
            {
                continue;
            }
            if (local_56.GateAddress.IsEmpty())
            {
                continue;
            }
            if ((!(local_28.IsEmpty()) && !(local_56.RegionTitle.Contains(local_28, ESearchCase(1), ESearchDir(0))) && !(local_56.RegionName.Contains(local_28, ESearchCase(1), ESearchDir(0))) && !(((FString("") + local_56.DSVersion)).Contains(local_28, ESearchCase(1), ESearchDir(0)))))
            {
                continue;
            }
            this.GateInfoList.Add(local_56);
        }
        for (auto& local_56 : this.GateInfoList)
        {
            FString local_64 = local_56.RegionTitle;
            if (int(local_56.DSVersion) > 0)
            {
                FString local_40 = " (";
                FString local_4 = (local_40 + local_56.DSVersion);
                local_64 += local_4;
                if (!(local_56.DSBuildType.IsEmpty()))
                {
                    FString local_16 = (FString(" ") + local_56.DSBuildType);
                    local_64 += local_16;
                }
                local_64 += ")";
            }
            this.ComboBoxString_ServerAddress.AddOption(local_64);
            if ((local_56.RegionAddress == local_8))
            {
                local_41 = this.ComboBoxString_ServerAddress.GetOptionCount() - 1;
            }
        }
        if (this.ComboBoxString_ServerAddress.GetOptionCount() > 0)
        {
            this.ComboBoxString_ServerAddress.SetSelectedIndex(local_41);
        }
        return;
    }
    UFUNCTION()
    void OnIgnoreVersionChanged(const bool bIsChecked)
    {
        FString local_8;
        if (bIsChecked)
        {
            local_8 = "1";
        }
        else
        {
            local_8 = "0";
        }
        bool local_12 = FFileHelper::SaveStringToFile(local_8, this.SaveIgnoreVersionFilePath, FFileHelper::EEncodingOptions(4), 0);
        if (!(local_12))
        {
            XError(ELog(0), FString().Append("SaveIgnoreVersion to ").Append(this.SaveIgnoreVersionFilePath).Append(" Fail"));
        }
        return;
    }
    UFUNCTION()
    void OnSkipTutorialChanged(const bool bIsChecked)
    {
        FString local_8;
        if (bIsChecked)
        {
            local_8 = "1";
        }
        else
        {
            local_8 = "0";
        }
        bool local_12 = FFileHelper::SaveStringToFile(local_8, this.SaveSkipTutorialFilePath, FFileHelper::EEncodingOptions(4), 0);
        if (!(local_12))
        {
            XError(ELog(0), FString().Append("SaveSkipTutorial to ").Append(this.SaveSkipTutorialFilePath).Append(" Fail"));
        }
        return;
    }
    UFUNCTION()
    void OnRegionListReceived(const bool bSuccess, const FString &inout ReqURL, const TArray<uint8> &in RspData)
    {
        this.ComboBoxString_ServerType.ClearOptions();
        this.ComboBoxString_ServerAddress.ClearOptions();
        this.AllGateInfoList.Empty(0);
        this.GateInfoList.Empty(0);
        if (bSuccess)
        {
            FPbQueryRegionListHttpRsp local_6;
            local_6.ParseFromArray(RspData);
            TArray<FPbRegionSimpleInfo> local_12;
            local_6.GetRegionList(local_12);
            TArray<FString> local_16;
            for (auto& local_30 : local_12)
            {
                FLoginGateInfo local_76;
                local_76.RegionType = local_30.GetType();
                local_76.RegionName = local_30.GetName();
                local_76.RegionTitle = local_30.GetTitle();
                local_76.RegionAddress = local_30.GetDispatchUrl();
                this.AllGateInfoList.Add(local_76);
                if (!(local_16.Contains(local_30.GetType())))
                {
                    if ((local_30.GetType() == "Public"))
                    {
                        local_16.Insert(local_30.GetType(), 0);
                    }
                    else
                    {
                        local_16.Add(local_30.GetType());
                    }
                }
                ::UGameClientConnectionSubsystem::Get().RequestForGateAddress(local_30.GetDispatchUrl(), false, this.RecievedGateAddressDelegate);
            }
            for (auto& local_96 : local_16)
            {
                this.ComboBoxString_ServerType.AddOption(this.GetServerTypeDisplayName(local_96));
            }
            if (this.ComboBoxString_ServerType.GetOptionCount() > 0)
            {
                FString local_102;
                FFileHelper::LoadFileToString(local_102, this.SaveRecentServerTypeFilePath, FFileHelper::EHashOptions(0), 4);
                local_102 = local_102.TrimStartAndEnd();
                int local_105 = 0;
                if (!(local_102.IsEmpty()))
                {
                    FString local_80 = this.GetServerTypeDisplayName(local_102);
                    int local_111 = 0;
                    for (; local_111 < this.ComboBoxString_ServerType.GetOptionCount(); ++local_111)
                    {
                        if ((this.ComboBoxString_ServerType.GetOptionAtIndex(local_111) == local_80))
                        {
                            local_105 = local_111;
                            break;
                        }
                    }
                }
                this.ComboBoxString_ServerType.SetSelectedIndex(local_105);
                this.RefreshServerList();
            }
            else
            {
                this.DisplayErrorMessage("region list is empty");
            }
            return;
        }
        this.DisplayErrorMessage("Failed to get region list");
        return;
    }
    UFUNCTION()
    void Login()
    {
        FString local_12 = this.EditableTextBox_UserName.GetText().ToString();
        bool local_13 = false;
        int local_15 = 0;
        for (; local_15 < local_12.Len(); ++local_15)
        {
            int local_17 = local_12[local_15];
            if ((((local_17 >= 55296 && (local_17 <= 57343)) || (local_17 >= 9728 && (local_17 <= 10175))) || (local_17 == 65039)) || (local_17 == 8205))
            {
                local_13 = true;
                break;
            }
        }
        if (local_13)
        {
            this.DisplayErrorMessage("з”Ёж€·еђЌдёЌиѓЅеЊ…еђ«иЎЁжѓ…з¬¦еЏ·");
            return;
        }
        FString local_4 = this.EditableTextBox_DS_ID.GetText().ToString();
        FString local_30 = "";
        FString local_34 = "0123456789";
        int local_15_2 = 0;
        for (; local_15_2 < local_4.Len(); ++local_15_2)
        {
            FString local_26 = local_4.Mid(local_15_2, 1);
            if (local_34.Contains(local_26, ESearchCase(1), ESearchDir(0)))
            {
                local_30 += local_26;
            }
        }
        local_4 = local_30;
        if (!((local_30 == this.EditableTextBox_DS_ID.GetText().ToString())))
        {
            this.EditableTextBox_DS_ID.SetText(FText::FromString(local_30));
        }
        if (true)
        {
            bool local_20;
            local_20 = FFileHelper::SaveStringToFile(local_4, this.SaveDsIDFilePath, FFileHelper::EEncodingOptions(4), 0);
            if (!(local_20))
            {
                XError(ELog(0), FString().Append("AppendCandidateDataTo ").Append(this.SaveDsIDFilePath).Append(" Fail"));
            }
        }
        FFileHelper::SaveStringToFile(this.GetServerTypeRawName(this.ComboBoxString_ServerType.GetSelectedOption()), this.SaveRecentServerTypeFilePath, FFileHelper::EEncodingOptions(4), 0);
        if (!(FFileHelper::SaveStringToFile(this.EditableTextBox_ServerAddress.GetText().ToString(), this.SaveRecentServerFilePath, FFileHelper::EEncodingOptions(4), 0)))
        {
            XError(ELog(0), FString().Append("AppendCandidateDataTo ").Append(this.SaveRecentServerFilePath).Append(" Fail"));
        }
        if (local_4.IsEmpty())
        {
            this.LocalDsID = 0;
        }
        else
        {
            if (!(local_4.IsNumeric()))
            {
                XError(ELog(0), FString().Append("DsID is Not numberic"));
                this.DisplayErrorMessage("DsID is Not numberic");
                this.EditableTextBox_DS_ID.SetFocus();
                return;
            }
            this.LocalDsID = String::Conv_StringToInt64(local_4);
        }
        this.SaveRecentUserNames();
        int local_16 = this.ComboBoxString_ServerAddress.GetSelectedIndex();
        if (local_16 < 0 || (local_16 >= this.GateInfoList.Num()))
        {
            this.DisplayErrorMessage("Invalid server address");
            return;
        }
        this.PendingCheckCLRegionAddress = "";
        if (!(this.CheckBox_IgnoreVersion.IsChecked()))
        {
            this.PendingCheckCLRegionAddress = this.GateInfoList[local_16].RegionAddress;
            ::UGameClientConnectionSubsystem::Get().RequestForGateAddress(this.PendingCheckCLRegionAddress, true, this.RecievedGateAddressDelegate);
            return;
        }
        this.BeginLoginFlow(local_16);
        return;
    }
    void BeginLoginFlow(const int SelectedIndex)
    {
        int local_1 = SelectedIndex;
        this.BeginConnecting();
        this.DoConnectToGate(local_1);
        return;
    }
    void DoConnectToGate(const int Index)
    {
        XLog(ELog(27), FString().Append("DoConnectToGate: ").Append(this.GateInfoList[Index].GateAddress).Append(" ").Append(this.GateInfoList[Index].Port));
        FString local_10 = this.GateInfoList[Index].RegionName;
        local_10.RemoveFromStart("kl-ack-dev-", ESearchCase(1));
        UPerformanceUtils::SetDebugServerInfo(local_10, "");
        ::UGameClientConnectionSubsystem::Get().StoreSelectedServerPingInfo(this.GateInfoList[Index]);
        ::UGameClientConnectionSubsystem::Get().SetCachedGateAddress(this.GateInfoList[Index].GateAddress);
        ::UGameClientConnectionSubsystem::Get().ConnectToGate(this.GateInfoList[Index].GateAddress, this.GateInfoList[Index].Port, this.OnConnectToGateSuccessDelegate);
        return;
    }
    UFUNCTION()
    void OnWaitDSConnectToGS()
    {
        return;
    }
    UFUNCTION()
    bool OnCLVersionMismatchConfirmed(const FCommonDialogAnswer &inout Answer)
    {
        if (int(Answer.AnswerType) == 1)
        {
            if (this.PendingLoginGateIndex >= 0 && (this.PendingLoginGateIndex < this.GateInfoList.Num()))
            {
                this.DoConnectToGate(this.PendingLoginGateIndex);
                this.PendingLoginGateIndex = -1;
            }
        }
        else
        {
            this.PendingLoginGateIndex = -1;
        }
        return true;
    }
    UFUNCTION()
    void OnGateAddressReceived(const bool bSuccess, const FString &inout ReqURL, const TArray<uint8> &in RspData)
    {
        XLog(ELog(27), FString().Append("OnGateAddressReceived: ").Append(ReqURL).Append(" bSuccess: ").Append(bSuccess));
        bool local_6 = !(bSuccess);
        if (local_6)
        {
            XWarning(ELog(27), FString().Append("Failed to get gate address for ").Append(ReqURL));
            return;
        }
        FPbQueryCurRegionHttpRsp local_10;
        local_10.ParseFromArray(RspData);
        bool local_11 = false;
        bool local_6_2 = !(this.PendingCheckCLRegionAddress.IsEmpty());
        if (local_6_2)
        {
            if (ReqURL.StartsWith(this.PendingCheckCLRegionAddress, ESearchCase(1)))
            {
                local_11 = true;
            }
        }
        if (local_10.GetRetcode() != 0)
        {
            XWarning(ELog(27), FString().Append("Failed to get query cur region for ").Append(ReqURL).Append(",Msg: ").Append(local_10.GetMsg()));
            return;
        }
        FString local_4 = FString(local_10.GetRegionInfo().GetGateserverIp());
        int local_29;
        local_29 = local_10.GetRegionInfo().GetGateserverPort();
        FString local_34 = FString(local_10.GetDsaInfo().GetIp());
        int local_30 = local_10.GetDsaInfo().GetPort();
        XLog(ELog(27), FString().Append("ReqURL:").Append(ReqURL).Append(",Dsa address: ").Append(local_34).Append(" DsaPort: ").Append(local_30));
        if (local_4.IsEmpty())
        {
            XWarning(ELog(27), FString().Append("Gate address is empty for ").Append(ReqURL));
            return;
        }
        if (local_29 <= 0)
        {
            XWarning(ELog(27), FString().Append("Gate port is not valid for ").Append(ReqURL));
            return;
        }
        int local_13 = local_10.GetVersionInfo().GetDsCl();
        FString local_18 = local_10.GetVersionInfo().GetDsBuildType();
        this.RegionDSVersion.FindOrAdd(ReqURL, local_13);
        XLog(ELog(27), FString().Append("OnGateAddressReceived: ").Append(ReqURL).Append(" DSVersion ").Append(local_13));
        for (auto& local_74 : this.AllGateInfoList)
        {
            if (ReqURL.StartsWith(local_74.RegionAddress, ESearchCase(1)))
            {
                FPbClientResDownloadInfo local_94 = local_10.GetClientResDownloadInfo();
                local_74.CDNUrl = local_94.GetCdnUrl();
                local_74.ClientVersion = local_94.GetClientVersion();
                bool local_6_3 = local_94.GetNeedRestartClient();
                local_74.bNeedRestartClient = local_6_3;
                local_6_3 = local_94.GetNeedExitClient();
                local_74.bNeedExitClient = local_6_3;
                local_74.DownloadExtraInfo = local_94.GetDownloadExtraInfo();
                local_74.GateAddress = local_4;
                local_74.DSVersion = local_13;
                local_74.DSBuildType = local_18;
                local_74.Port = local_29;
                local_74.DsaAddress = local_34;
                local_74.DsaPort = local_30;
                break;
            }
        }
        this.RefreshServerList();
        if (local_11)
        {
            bool local_6_4 = this.TryDownLoadCLVersion(local_10);
            if (local_6_4)
            {
                return;
            }
            if (this.CheckPendingCLVersion(local_10))
            {
                int local_46 = this.FindGateInfoIndexByRegionAddress(this.PendingCheckCLRegionAddress);
                if (local_46 >= 0)
                {
                    this.BeginLoginFlow(local_46);
                    this.PendingCheckCLRegionAddress = "";
                }
                else
                {
                    XWarning(ELog(27), FString().Append("Failed to find pending gate info for ").Append(this.PendingCheckCLRegionAddress));
                }
            }
        }
        return;
    }
    int FindGateInfoIndexByRegionAddress(const FString &inout RegionAddress)
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
        int __r; return __r;
    }
    bool TryDownLoadCLVersion(const FPbQueryCurRegionHttpRsp &inout QueryCurRegionHttpRsp)
    {
        const ULoginSettings local_4;
        UKLDownloadService local_66;
        int local_2 = this.FindGateInfoIndexByRegionAddress(this.PendingCheckCLRegionAddress);
        GetGameplaySettings<ULoginSettings> local_6;
        local_4 = local_6;
        if (!(IsValid(local_4)) || local_4.HotUpdateInfo.bDisableHotUpdate || Login::IsHotUpdateDisabledByCVar())
        {
            return false;
        }
        if (local_2 >= 0)
        {
            int local_47;
            FPbClientResDownloadInfo local_20 = QueryCurRegionHttpRsp.GetClientResDownloadInfo();
            FString local_38 = local_20.GetClientVersion();
            FString local_34 = local_20.GetCdnUrl();
            if (local_34.IsEmpty())
            {
                return false;
            }
            FString local_42 = local_20.GetDownloadExtraInfo();
            local_47 = 0;
            if (!(local_42.IsEmpty()))
            {
                TArray<FString> local_52;
                local_42.ParseIntoArray(local_52, ":", true);
                if (local_52.Num() >= 2)
                {
                    FString local_46 = local_52[1].TrimStartAndEnd();
                    if (local_46.IsNumeric())
                    {
                        local_47 = String::Conv_StringToInt(local_46);
                    }
                }
            }
            XLog(ELog(0), FString().Append("TryDownLoadCLVersion: ClientVersion---").Append(local_38).Append(" DownloadExtraSize---").Append(local_47));
            USDKServiceSubSystem local_62 = USDKServiceSubSystem::Get();
            if (IsValid(local_62))
            {
                local_66 = (Cast<UKLDownloadService>(local_62.GetSdkServiceByType(ESDKServiceType(1))));
                if (IsValid(local_66) && local_66.CheckVersionUpdate(local_38))
                {
                    local_66.StartVersionUpdate(local_34, local_38, local_47);
                    local_66.GetDownloadProgressDelegate().AddUFunction(this, n"OnDownloadProgress");
                    local_66.GetDownloadCompletedDelegate().AddUFunction(this, n"OnDownloadCompleted");
                    local_66.GetDownloadManifestCompletedDelegate().AddUFunction(this, n"OnDownloadManifestCompleted");
                    return true;
                }
            }
        }
        return false;
    }
    bool CheckPendingCLVersion(const FPbQueryCurRegionHttpRsp &inout QueryCurRegionHttpRsp)
    {
        int local_2 = this.FindGateInfoIndexByRegionAddress(this.PendingCheckCLRegionAddress);
        if (local_2 < 0)
        {
            XWarning(ELog(27), FString().Append("Failed to find pending gate info for ").Append(this.PendingCheckCLRegionAddress));
            return false;
        }
        int local_10 = this.GateInfoList[local_2].DSVersion;
        FString local_14 = this.GateInfoList[local_2].DSBuildType;
        FString local_18 = FString().Append(local_10);
        FPbClientResDownloadInfo local_28 = QueryCurRegionHttpRsp.GetClientResDownloadInfo();
        FString local_8 = local_28.GetClientVersion();
        FString local_42 = ::UGameClientConnectionSubsystem::Get().GetClientVersion();
        FString local_46 = System::GetBuildConfiguration();
        if (local_10 != 0 && !((local_18 == local_42)))
        {
            this.DisplayErrorMessage(FString().Append("DSз‰€жњ¬дёЌеЊ№й…ЌпјљDSVersion(").Append(local_18).Append(") != е®ўж€·з«ЇCL(").Append(local_42).Append(")пјЊеЏЇеїЅз•Ґз»§з»­з™»еЅ•"));
            return false;
        }
        if (!(local_8.IsEmpty()) && !((local_8 == local_42)))
        {
            this.DisplayErrorMessage(FString().Append("е®ўж€·з«Їз‰€жњ¬дёЌеЊ№й…ЌпјљжњЌеЉЎе™ЁCL(").Append(local_8).Append(") != е®ўж€·з«ЇCL(").Append(local_42).Append(")пјЊеЏЇеїЅз•Ґз»§з»­з™»еЅ•"));
            return false;
        }
        if (!(local_14.IsEmpty()) && !((local_14 == local_46)))
        {
            this.DisplayErrorMessage(FString().Append("жћ„е»єз±»ећ‹дёЌеЊ№й…ЌпјљDSBuildType(").Append(local_14).Append(") != е®ўж€·з«ЇBuildType(").Append(local_46).Append(")пјЊеЏЇеїЅз•Ґз»§з»­з™»еЅ•"));
            return false;
        }
        return true;
    }
    UFUNCTION()
    void OnConnectToGateSuccess()
    {
        XLog(ELog(27), FString().Append("OnConnectToGateSuccess bIsSDKLogin=").Append(this.bIsSDKLogin));
        FString local_4 = this.EditableTextBox_UserName.GetText().ToString();
        if (this.bIsSDKLogin)
        {
            XLog(ELog(27), FString().Append("Using SDK login data - OpenID:").Append(this.CachedSDKLoginResult.Data.OpenId));
            ::UGameClientConnectionSubsystem::Get().GetSDKPlayerToken(local_4, this.CachedSDKLoginResult);
        }
        else
        {
            XLog(ELog(27), FString().Append("Using normal login - UserName:").Append(local_4));
            ::UGameClientConnectionSubsystem::Get().GetPlayerToken(local_4);
        }
        return;
    }
    UFUNCTION()
    void OnGetPlayerTokenRsp(const FProtoWrapper &in ProtoWrapper)
    {
        XLog(ELog(27), FString().Append("OnGetPlayerTokenRsp"));
        FPbGetPlayerTokenRsp local_14 = FPbGetPlayerTokenRsp::FromWrapper(ProtoWrapper);
        this.CachedPlayerUid = FString().Append(local_14.GetUid());
        this.CachedServerId = local_14.GetServerId();
        this.CachedAccountUid = local_14.GetAccountUid();
        this.CachedToken = local_14.GetAccountToken();
        ::UGameClientConnectionSubsystem::Get().SetCachedLoginUserId(local_14.GetUid());
        FString local_4 = local_14.GetAuthKey();
        if (!(local_4.IsEmpty()))
        {
            ::UGameClientConnectionSubsystem::Get().SetCachedVOXAuthKey(local_4);
            XLog(ELog(1), "[VOX] Auth key cached from login");
        }
        ::UGameClientConnectionSubsystem::Get().SetCachedFeedbackToken(local_14.GetFeedbackToken());
        XLog(ELog(27), FString().Append("PlayerUid: ").Append(this.CachedPlayerUid));
        XLog(ELog(27), FString().Append("AccountUid: ").Append(this.CachedAccountUid));
        int local_24 = 0;
        int local_25 = 0;
        bool local_23 = this.CheckBox_EnterTestLevel.IsChecked();
        this.CachedDsID = this.LocalDsID;
        this.CachedLevelKey = local_24;
        this.CachedCommissionKey = local_25;
        this.bCachedEnterTestLevel = local_23;
        if (this.bIsSDKLogin)
        {
            XLog(ELog(27), FString().Append("SDK Login: Calling WillEnterGame verification"));
            FSDKEnterGameInfo local_40;
            local_40.ServerID = this.CachedServerId;
            local_40.RoleID = FString().Append(this.CachedPlayerUid);
            local_40.AccountID = this.CachedAccountUid;
            FSDKWillEnterGameDelegate local_44;
            local_44.BindUFunction(this, n"OnWillEnterGameVerified");
            UMiHoYoSDKHelper::WillEnterGame(local_40, local_44);
        }
        else
        {
            XLog(ELog(27), FString().Append("NoSDK Login: skip SDK verification, proceed to login directly"));
            this.OnWillEnterGameVerified(true);
        }
        return;
    }
    UFUNCTION()
    void OnWillEnterGameVerified(const bool bSuccess)
    {
        XLog(ELog(27), FString().Append("OnWillEnterGameVerified: ").Append(bSuccess));
        if (bSuccess)
        {
            this.DisplayCommonMessage("SDK verification passed, logging in...");
            ::UGameClientConnectionSubsystem::Get().PlayerLogin(this.CachedDsID, this.CachedLevelKey, this.CachedCommissionKey, this.bCachedEnterTestLevel, this.CachedToken, this.CheckBox_IgnoreVersion.IsChecked(), this.CheckBox_CreatePlayer.IsChecked(), (this.CheckBox_Skip_Tutorial != nullptr) && this.CheckBox_Skip_Tutorial.IsChecked());
            return;
        }
        this.DisplayErrorMessage("SDK verification failed, please check anti-addiction or real-name status");
        XError(ELog(27), FString().Append("SDK WillEnterGame verification failed"));
        this.bIsSDKLogin = false;
        this.CancelConnecting();
        return;
    }
    UFUNCTION()
    void OnPlayerLoginRsp(const FProtoWrapper &in ProtoWrapper)
    {
        ULocalPlayer local_20;
        XLog(ELog(27), FString().Append("OnPlayerLoginRsp"));
        FPbPlayerLoginRsp local_14 = FPbPlayerLoginRsp::FromWrapper(ProtoWrapper);
        int local_16 = local_14.GetRetcode();
        if (local_16 != 0)
        {
            this.OnLoginFailed(local_16);
            return;
        }
        if (this.bIsSDKLogin)
        {
            this.bIsSDKLogin = false;
            UMiHoYoSDKHelper::LogToScreenAndConsole(FString().Append("GS Login Success"), 5.0f);
        }
        ::FMS_Login::Get(this.GetOwningLocalPlayer()).SetCanCreatePlayer(false);
        if (local_14.GetPlayerPhase() == 1)
        {
            FMsg_LoginNextPhase local_40;
            if (FCommandLine::Get().Contains("nullrhi", ESearchCase(1), ESearchDir(0)))
            {
                FString local_26 = this.EditableTextBox_UserName.GetText().ToString();
                XLog(ELog(27), FString().Append("NEW player (nullrhi headless): auto create via protocol, Nickname=").Append(local_26));
                ::UGameClientConnectionSubsystem::Get().RequestCreatePlayer(local_26, 0);
            }
            else
            {
                this.ClosePage(false);
                ::FMS_Login::Get(this.GetOwningLocalPlayer()).SetCanCreatePlayer(true);
                local_20 = this.GetOwningLocalPlayer();
                FEUIMessageBus::Publish(EUIMessageBus);
                local_40.NextPhase = ELoginShowPhase(2);
            }
        }
        else
        {
            FMsg_LoginNextPhase local_40;
            if (local_14.GetPlayerPhase() == 2)
            {
                local_20 = this.GetOwningLocalPlayer();
                FEUIMessageBus::Publish(EUIMessageBus);
                local_40.NextPhase = ELoginShowPhase(5);
            }
            else
            {
                if (local_14.GetPlayerPhase() == 3)
                {
                    ::UGameClientConnectionSubsystem::Get().QueryGmlist();
                }
            }
        }
        return;
    }
    UFUNCTION()
    void Logout()
    {
        this.bIsSDKLogin = false;
        ::UGameClientConnectionSubsystem::Get().PlayerLogout();
        ::UGameClientConnectionSubsystem::Get().EndKcpClient();
        System::QuitGame(__GetWorldContext(), this.GetOwningPlayer(), EQuitPreference(0), true);
        return;
    }
    void BeginConnecting()
    {
        this.Panel_Connecting.SetVisibility(ESlateVisibility(0));
        return;
    }
    UFUNCTION()
    void CancelConnecting()
    {
        System::ClearAndInvalidateTimerHandle(__GetWorldContext(), this.WaitDSConnectTimerHandle);
        this.PendingLoginGateIndex = -1;
        this.bIsSDKLogin = false;
        ::UGameClientConnectionSubsystem::Get().PlayerLogout();
        ::UGameClientConnectionSubsystem::Get().EndKcpClient();
        this.Panel_Connecting.SetVisibility(ESlateVisibility(1));
        return;
    }
    void DisplayCommonMessage(const FString &inout Message)
    {
        this.TextBlock_Message.SetColorAndOpacity(FSlateColor(FLinearColor(1.0f, 0.0f, 0.0f, 1.0f)));
        this.TextBlock_Message.SetText(FText::FromString(Message));
        return;
    }
    void DisplayErrorMessage(const FString &inout Message)
    {
        this.TextBlock_Message.SetColorAndOpacity(FSlateColor(FLinearColor(1.0f, 0.0f, 0.0f, 1.0f)));
        this.TextBlock_Message.SetText(FText::FromString(Message));
        return;
    }
    UFUNCTION()
    void OnDSDisconnected(const int Reason)
    {
        this.CancelConnecting();
        FText local_10 = ::FGameConnectionUtils::GetDSDisconnectReasonText(EDisconnectReason(Reason));
        this.TextBlock_Message.SetColorAndOpacity(FSlateColor(FLinearColor(1.0f, 0.0f, 0.0f, 1.0f)));
        this.TextBlock_Message.SetText(local_10);
        return;
    }
    UFUNCTION()
    void Login_SDK()
    {
        XLog(ELog(27), FString().Append("Login_SDK: Start SDK initialization and login"));
        FString local_4 = this.EditableTextBox_SDKEnv.GetText().ToString();
        if (local_4.IsEmpty())
        {
            local_4 = "6";
        }
        UMiHoYoSDKHelper::LogToScreenAndConsole(FString().Append("Step 1: Setting SDK environment to ").Append(local_4), 5.0f);
        UMiHoYoSDKHelper::SetEnv(local_4);
        UMiHoYoSDKHelper::LogToScreenAndConsole("Step 2: Setting SDK language to zh-cn", 5.0f);
        UMiHoYoSDKHelper::SetLanguage("zh-cn");
        UMiHoYoSDKHelper::LogToScreenAndConsole("Step 3: Initializing SDK", 5.0f);
        FSDKInitResultDelegate local_20;
        UMiHoYoSDKHelper::InitSDK(local_20);
        UMiHoYoSDKHelper::LogToScreenAndConsole("Step 4: Enable Water Mark", 5.0f);
        UMiHoYoSDKHelper::SetWaterMark(true);
        UMiHoYoSDKHelper::LogToScreenAndConsole("Step 5: Calling SDK Login", 5.0f);
        FSDKLoginResultDelegate local_24;
        local_24.BindUFunction(this, n"OnSDKLoginResult");
        bool local_15 = UMiHoYoSDKHelper::SDKLogin(local_24);
        if (local_15)
        {
            this.DisplayCommonMessage("SDK Login initiated, waiting for callback...");
            XLog(ELog(27), FString().Append("SDK Login called successfully"));
        }
        else
        {
            this.DisplayErrorMessage("Failed to initiate SDK Login");
            XError(ELog(27), FString().Append("SDK Login call failed"));
        }
        return;
    }
    UFUNCTION()
    void OnSDKLoginResult(const FSDKLoginResult &in LoginResult)
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
            this.DisplayCommonMessage(FString().Append("SDK Login Success! OpenID: ").Append(LoginResult.Data.OpenId).Append(". Please click Enter Game button."));
            this.CachedSDKLoginResult = LoginResult;
            this.bIsSDKLogin = true;
            this.bSDKLoginSuccess = true;
            UMiHoYoSDKHelper::SetEnv("1");
            ::UGameClientConnectionSubsystem::Get().SetCachedVOXAppId(LoginResult.Data.AppId);
            this.Button_EnterGame.SetVisibility(ESlateVisibility(0));
            return;
        }
        UMiHoYoSDKHelper::LogToScreenAndConsole(FString().Append("SDK Login Failed: ret=").Append(LoginResult.Ret).Append(", msg=").Append(LoginResult.Msg), 5.0f);
        this.DisplayErrorMessage(FString().Append("SDK Login Failed: ").Append(LoginResult.Msg));
        this.bSDKLoginSuccess = false;
        return;
    }
    UFUNCTION()
    void EnterGame()
    {
        if (!(this.bSDKLoginSuccess))
        {
            this.DisplayErrorMessage("Please login with SDK first");
            return;
        }
        this.Login();
        return;
    }
    UFUNCTION()
    void OnShowSDKControlsChanged(const bool bIsChecked)
    {
        this.UpdateSDKControlsVisibility(bIsChecked);
        return;
    }
    void UpdateSDKControlsVisibility(const bool bShow)
    {
        int local_2;
        if (bShow)
        {
            int local_3;
            local_3 = 0;
            local_2 = local_3;
        }
        else
        {
            int local_3;
            local_3 = 1;
            local_2 = local_3;
        }
        this.HorizontalBox_SDK.SetVisibility(ESlateVisibility(local_2));
        return;
    }
    void UpdatePSOPrecompileHint()
    {
        int local_26;
        int local_2 = KLPipelineCache::GetNumPrecompilesRemaining();
        if ((this.NumTotalPSOsToCompile == 0 || (local_2 > this.NumTotalPSOsToCompile)))
        {
            this.NumTotalPSOsToCompile = FMath::Max(local_2, 1);
        }
        this.TextBlock_PSOCompilePercentage.SetText(FText::FromString(FString().Append("( ").Append(FString::ApplyFormat((FMath::Clamp(((this.NumTotalPSOsToCompile - local_2) / this.NumTotalPSOsToCompile), 0.0f, 1.0f) * 100.0f), ".1f")).Append("% )")));
        if (local_2 <= 0)
        {
            int local_27;
            local_27 = 2;
            local_26 = local_27;
        }
        else
        {
            int local_27;
            local_27 = 0;
            local_26 = local_27;
        }
        this.HorizontalBox_PSOPrecompile.SetVisibility(ESlateVisibility(local_26));
        return;
    }
    void OnLoginFailed(const int Retcode)
    {
        const UErrorCodeSettings local_2;
        GetGameplaySettings<UErrorCodeSettings> local_4;
        local_2 = local_4;
        FText local_10;
        if (local_2.GetErrorCodeText(Retcode, local_10))
        {
            this.DisplayErrorMessage(local_10.ToString());
        }
        this.CancelConnecting();
        return;
    }
    void PlayLoginBGM()
    {
        const ULoginSettings local_2;
        GetGameplaySettings<ULoginSettings> local_4;
        local_2 = local_4;
        if (local_2 == nullptr)
        {
            return;
        }
        if (local_2.LoginBGMStartEventName.IsEmpty())
        {
            return;
        }
        FGameAudioUtils::PlayEventBGM(FName(local_2.LoginBGMStartEventName), FLoadEventCallback(), FGameAudioUtils::GetCachedAudioWorld(), true);
        return;
    }
    void StopLoginBGM()
    {
        const ULoginSettings local_2;
        GetGameplaySettings<ULoginSettings> local_4;
        local_2 = local_4;
        if (local_2 == nullptr)
        {
            return;
        }
        if (local_2.LoginBGMEndEventName.IsEmpty())
        {
            return;
        }
        FGameAudioUtils::PlayEventBGM(FName(local_2.LoginBGMEndEventName), FLoadEventCallback(), FGameAudioUtils::GetCachedAudioWorld(), true);
        return;
    }
    void UpdateDownLoadProcess(const uint64 DownloadedSize, const uint64 TotalSize)
    {
        this.DownloadSpeedMBps = this.CalcDownloadSpeedMBps(DownloadedSize);
        FString local_6 = FString().Append(::FloatUtils::FormatFloatOneDecimal(this.DownloadSpeedMBps)).Append(" MB/s");
        FString local_14 = this.ByteToDownloadSizeShow(DownloadedSize);
        FString local_10 = this.ByteToDownloadSizeShow(TotalSize);
        this.TextBlock_Message.SetColorAndOpacity(FSlateColor(FLinearColor(1.0f, 1.0f, 1.0f, 1.0f)));
        this.TextBlock_Message.SetText(FText::FromString(FString().Append(local_6).Append(" ").Append(local_14).Append("/").Append(local_10)));
        return;
    }
    FString ByteToDownloadSizeShow(const uint64 ByteSize) const
    {
        int64 local_2 = 4697254411347427328;
        int64 local_6 = 4742290407621132288;
        if (ByteSize >= 1073741824.0)
        {
            return FString().Append(::FloatUtils::FormatFloatOneDecimal((float32((ByteSize / 1073741824.0))))).Append(" GB");
        }
        return FString().Append(::FloatUtils::FormatFloatOneDecimal(float32((ByteSize / 1048576.0)))).Append(" MB");
    }
    float32 CalcDownloadSpeedMBps(const uint64 DownloadedSize)
    {
        UWorld local_2 = this.GetWorld();
        if (!(IsValid(local_2)))
        {
            return 0.0f;
        }
        float local_10 = local_2.GetTimeSeconds();
        if (!(this.bHasLastDownloadProgressSample))
        {
            this.bHasLastDownloadProgressSample = true;
            this.LastDownloadedByte = DownloadedSize;
            this.LastDownloadProgressTimeSeconds = local_10;
            return 0.0f;
        }
        float local_8 = local_10 - this.LastDownloadProgressTimeSeconds;
        int64 local_14 = this.LastDownloadedByte;
        this.LastDownloadedByte = DownloadedSize;
        this.LastDownloadProgressTimeSeconds = local_10;
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
}

namespace UWidget_Login
{
void GetModelInfo(FEUIWidgetMetaInfo &inout Result)
{
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
