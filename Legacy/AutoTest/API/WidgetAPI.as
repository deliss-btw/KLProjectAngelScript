
namespace AutoTest::API::WidgetAPI
{
bool IsVisible(const FString &inout ClassName)
{
    TArray<UWidget> local_4;
    KLAutomation::GetAllWidgetsOfClass(local_4, UWidget, false);
    for (auto local_22 : local_4)
    {
        if ((local_22.GetClass().GetName() == ClassName))
        {
            if (AutoTest::WidgetUtils::IsWidgetVisible(local_22))
            {
                return true;
            }
        }
    }
    return false;
}
bool EUIIsVisible(const FName &inout ClassName)
{
    ULocalPlayer local_4 = AutoTest::CommonUtils::GetULocalPlayer();
    FEUIWidgetRef local_6 = FEUIWidget::FindWidgetByClassName(local_4, ClassName);
    if (!(local_6.IsValid()))
    {
        return false;
    }
    return local_6.SlowQueryIsWidgetVisible();
}
void LoginWidget_SelectServerType(const FString &inout ServerType)
{
    int local_23;
    TArray<UWidget> local_4;
    KLAutomation::GetAllWidgetsOfClass(local_4, UWidget_Login, false);
    ThrowIf((local_4.Num() != 1), FString().Append("Not found UWidget_Login. Found count: ").Append(local_4.Num()));
    UWidget local_18 = local_4[0];
    UWidget_Login local_22 = (Cast<UWidget_Login>(local_18));
    ThrowIf(local_22, !((local_22 != nullptr)));
    local_23 = local_22.ComboBoxString_ServerType.GetOptionCount();
    bool local_24 = false;
    int local_25 = 0;
    for (; local_25 < local_23; ++local_25)
    {
        FString local_12 = local_22.ComboBoxString_ServerType.GetOptionAtIndex(local_25);
        if (local_12.StartsWith(ServerType, ESearchCase(1)))
        {
            local_22.ComboBoxString_ServerType.SetSelectedOption(local_12);
            local_22.ComboBoxString_ServerType.OnSelectionChanged.Broadcast(local_12, ESelectInfo(3));
            local_24 = true;
            break;
        }
    }
    ThrowIf(!(local_24), FString().Append("ServerType: ").Append(ServerType).Append(" not found in ComboBox."));
    return;
}
void LoginWidget_SelectServer(const FString &inout ServerName)
{
    int local_23;
    TArray<UWidget> local_4;
    KLAutomation::GetAllWidgetsOfClass(local_4, UWidget_Login, false);
    ThrowIf((local_4.Num() != 1), FString().Append("Not found UWidget_Login. Found count: ").Append(local_4.Num()));
    UWidget local_18 = local_4[0];
    UWidget_Login local_22 = (Cast<UWidget_Login>(local_18));
    ThrowIf(local_22, !((local_22 != nullptr)));
    local_23 = local_22.ComboBoxString_ServerAddress.GetOptionCount();
    bool local_24 = false;
    int local_25 = 0;
    for (; local_25 < local_23; ++local_25)
    {
        FString local_12 = local_22.ComboBoxString_ServerAddress.GetOptionAtIndex(local_25);
        if (local_12.StartsWith(ServerName, ESearchCase(1)))
        {
            local_22.ComboBoxString_ServerAddress.SetSelectedOption(local_12);
            local_22.ComboBoxString_ServerAddress.OnSelectionChanged.Broadcast(local_12, ESelectInfo(3));
            local_24 = true;
            break;
        }
    }
    ThrowIf(!(local_24), FString().Append("ServerName: ").Append(ServerName).Append(" not found in ComboBox."));
    return;
}
void LoginWidget_SetUserName(const FString &inout UserName)
{
    TArray<UWidget> local_4;
    KLAutomation::GetAllWidgetsOfClass(local_4, UWidget_Login, false);
    ThrowIf((local_4.Num() != 1), FString().Append("Not found UWidget_Login. Found count: ").Append(local_4.Num()));
    UWidget local_18 = local_4[0];
    UWidget_Login local_22 = (Cast<UWidget_Login>(local_18));
    ThrowIf(local_22, !((local_22 != nullptr)));
    local_22.EditableTextBox_UserName.SetText(FText::FromString(UserName));
    local_22.EditableTextBox_UserName.OnTextChanged.Broadcast(FText::FromString(UserName));
    local_22.EditableTextBox_UserName.OnTextCommitted.Broadcast(FText::FromString(UserName), ETextCommit(0));
    return;
}
void LoginWidget_ClickLogin()
{
    TArray<UWidget> local_4;
    KLAutomation::GetAllWidgetsOfClass(local_4, UWidget_Login, false);
    ThrowIf((local_4.Num() != 1), FString().Append("Not found UWidget_Login. Found count: ").Append(local_4.Num()));
    UWidget local_18 = local_4[0];
    UWidget_Login local_22 = (Cast<UWidget_Login>(local_18));
    ThrowIf(local_22, !((local_22 != nullptr)));
    local_22.Button_Login.OnClicked.Broadcast();
    return;
}
UWidget_Login GetLoginWidgetOrThrow()
{
    TArray<UWidget> local_4;
    KLAutomation::GetAllWidgetsOfClass(local_4, UWidget_Login, false);
    ThrowIf((local_4.Num() != 1), FString().Append("Not found UWidget_Login. Found count: ").Append(local_4.Num()));
    UWidget local_18 = local_4[0];
    UWidget_Login local_22 = (Cast<UWidget_Login>(local_18));
    ThrowIf(local_22, !((local_22 != nullptr)));
    return local_22;
}
TArray<FString> LoginWidget_GetServerTypes()
{
    int local_9;
    UWidget_Login local_4 = AutoTest::API::WidgetAPI::GetLoginWidgetOrThrow();
    TArray<FString> local_8;
    local_9 = local_4.ComboBoxString_ServerType.GetOptionCount();
    int local_11 = 0;
    for (; local_11 < local_9; )
    {
        local_8.Add(local_4.ComboBoxString_ServerType.GetOptionAtIndex(local_11));
        ++local_11;
    }
    return local_8;
}
TArray<FString> LoginWidget_GetServers()
{
    int local_9;
    UWidget_Login local_4 = AutoTest::API::WidgetAPI::GetLoginWidgetOrThrow();
    TArray<FString> local_8;
    local_9 = local_4.ComboBoxString_ServerAddress.GetOptionCount();
    int local_11 = 0;
    for (; local_11 < local_9; )
    {
        local_8.Add(local_4.ComboBoxString_ServerAddress.GetOptionAtIndex(local_11));
        ++local_11;
    }
    return local_8;
}
void LoginWidget_SetServerAddress(const FString &inout ServerAddress)
{
    UWidget_Login local_4 = AutoTest::API::WidgetAPI::GetLoginWidgetOrThrow();
    local_4.EditableTextBox_ServerAddress.SetText(FText::FromString(ServerAddress));
    local_4.EditableTextBox_ServerAddress.OnTextChanged.Broadcast(FText::FromString(ServerAddress));
    local_4.EditableTextBox_ServerAddress.OnTextCommitted.Broadcast(FText::FromString(ServerAddress), ETextCommit(0));
    return;
}
void LoginWidget_SetIgnoreVersion(const bool bIgnore)
{
    UWidget_Login local_4 = AutoTest::API::WidgetAPI::GetLoginWidgetOrThrow();
    local_4.CheckBox_IgnoreVersion.SetIsChecked(bIgnore);
    local_4.CheckBox_IgnoreVersion.OnCheckStateChanged.Broadcast(bIgnore);
    return;
}
void LoginWidget_SetCreatePlayer(const bool bCreate)
{
    UWidget_Login local_4 = AutoTest::API::WidgetAPI::GetLoginWidgetOrThrow();
    local_4.CheckBox_CreatePlayer.SetIsChecked(bCreate);
    local_4.CheckBox_CreatePlayer.OnCheckStateChanged.Broadcast(bCreate);
    return;
}
bool LoginWidget_SetSkipTutorial(const bool bSkip)
{
    UWidget_Login local_4 = AutoTest::API::WidgetAPI::GetLoginWidgetOrThrow();
    if (local_4.CheckBox_Skip_Tutorial == nullptr)
    {
        return false;
    }
    local_4.CheckBox_Skip_Tutorial.SetIsChecked(bSkip);
    local_4.CheckBox_Skip_Tutorial.OnCheckStateChanged.Broadcast(bSkip);
    return true;
}
UWidget_CreatePlayer GetCreatePlayerWidgetOrNull()
{
    TArray<UWidget> local_4;
    KLAutomation::GetAllWidgetsOfClass(local_4, UWidget_CreatePlayer, false);
    if (local_4.Num() == 0)
    {
        UWidget_CreatePlayer local_12;
        return local_12;
    }
    UWidget local_14 = local_4[0];
    return Cast<UWidget_CreatePlayer>(local_14);
}
bool CreatePlayer_IsVisible()
{
    if ((!((AutoTest::API::WidgetAPI::GetCreatePlayerWidgetOrNull() != nullptr))))
    {
        return false;
    }
    return true;
}
int CreatePlayer_GetPhase()
{
    UWidget_CreatePlayer local_4 = AutoTest::API::WidgetAPI::GetCreatePlayerWidgetOrNull();
    ThrowIf(local_4, !((local_4 != nullptr)));
    return int(GetCreatePlayerPhase());
}
void CreatePlayer_SelectGender(const bool bMale)
{
    UWidget_CreatePlayer local_4 = AutoTest::API::WidgetAPI::GetCreatePlayerWidgetOrNull();
    ThrowIf(local_4, !((local_4 != nullptr)));
    if (bMale)
    {
        OnMaleSelected();
        return;
    }
    OnFamaleSelected();
    return;
}
void CreatePlayer_SetNickname(const FString &inout Nickname)
{
    UWidget_CreatePlayer local_4 = AutoTest::API::WidgetAPI::GetCreatePlayerWidgetOrNull();
    ThrowIf(local_4, !((local_4 != nullptr)));
    local_4.OnInputTextChanged(FText::FromString(Nickname));
    return;
}
void CreatePlayer_Next()
{
    UWidget_CreatePlayer local_4 = AutoTest::API::WidgetAPI::GetCreatePlayerWidgetOrNull();
    ThrowIf(local_4, !((local_4 != nullptr)));
    OnNextPhase();
    return;
}
void CreatePlayer_Confirm()
{
    UWidget_CreatePlayer local_4 = AutoTest::API::WidgetAPI::GetCreatePlayerWidgetOrNull();
    ThrowIf(local_4, !((local_4 != nullptr)));
    OnConfirmPhase();
    return;
}
void CreatePlayer_AutoCreate(const FString &inout Nickname, const bool bMale)
{
    UWidget_CreatePlayer local_4 = AutoTest::API::WidgetAPI::GetCreatePlayerWidgetOrNull();
    ThrowIf(local_4, !((local_4 != nullptr)));
    if (bMale)
    {
        OnMaleSelected();
    }
    else
    {
        OnFamaleSelected();
    }
    int local_6 = 0;
    while (!(IsOnLastActivePhase()) && (local_6 < 16))
    {
        if (int(GetCreatePlayerPhase()) == 3)
        {
            local_4.OnInputTextChanged(FText::FromString(Nickname));
        }
        OnNextPhase();
        local_6 = local_6 + 1;
    }
    if (int(GetCreatePlayerPhase()) == 3)
    {
        local_4.OnInputTextChanged(FText::FromString(Nickname));
    }
    OnConfirmPhase();
    return;
}
UWidget_BornSelectSpecialty GetBornSpecialtyWidgetOrNull()
{
    TArray<UWidget> local_4;
    KLAutomation::GetAllWidgetsOfClass(local_4, UWidget_BornSelectSpecialty, false);
    if (local_4.Num() == 0)
    {
        UWidget_BornSelectSpecialty local_12;
        return local_12;
    }
    UWidget local_14 = local_4[0];
    return Cast<UWidget_BornSelectSpecialty>(local_14);
}
bool BornSpecialty_IsVisible()
{
    if ((!((AutoTest::API::WidgetAPI::GetBornSpecialtyWidgetOrNull() != nullptr))))
    {
        return false;
    }
    return true;
}
void BornSpecialty_PickAndConfirm(const bool bLeft)
{
    UWidget_BornSelectSpecialty local_4 = AutoTest::API::WidgetAPI::GetBornSpecialtyWidgetOrNull();
    ThrowIf(local_4, !((local_4 != nullptr)));
    if (bLeft)
    {
        AB_ClickLeftAvatar();
    }
    else
    {
        AB_ClickRightAvatar();
    }
    AB_ConfirmSpecialty();
    return;
}
int AutoAcceptPendingConfirms()
{
    ULocalPlayer local_4 = AutoTest::CommonUtils::GetULocalPlayer();
    if ((!((local_4 != nullptr))))
    {
        return 0;
    }
    FMS_PendingConfirmMessage& local_8 = FMS_PendingConfirmMessage::Get(local_4);
    TArray<int64> local_12;
    for (auto& local_26 : local_8.GetPendingEntries())
    {
        local_12.Add(int(local_26.CommonPopupId));
    }
    int local_29 = 0;
    int local_30 = 0;
    for (; local_30 < local_12.Num(); )
    {
        local_8.ConfirmMessage(local_12[local_30], EPendingConfirmAction(1));
        local_29 = local_29 + 1;
        ++local_30;
    }
    return local_29;
}
bool AutoConfirmCommissionDraft()
{
    ULocalPlayer local_4 = AutoTest::CommonUtils::GetULocalPlayer();
    if ((!((local_4 != nullptr))))
    {
        return false;
    }
    return (FMS_DraftData::Get(local_4).AutoReplyAllPendingDrafts(true) > 0);
}
bool AutoConfirmMatchConfirm()
{
    TArray<UWidget> local_4;
    KLAutomation::GetAllWidgetsOfClass(local_4, UWidget_TeamMemberConfirmPopup, false);
    if (local_4.Num() == 0)
    {
        return false;
    }
    UWidget local_12 = local_4[0];
    UWidget_TeamMemberConfirmPopup local_16 = (Cast<UWidget_TeamMemberConfirmPopup>(local_12));
    if ((!((local_16 != nullptr))))
    {
        return false;
    }
    if (GetReplyStatusIndex() != 0)
    {
        return false;
    }
    OnAgree();
    return true;
}
int AcceptAllConfirms()
{
    int local_1 = 0 + AutoTest::API::WidgetAPI::AutoAcceptPendingConfirms();
    if (AutoTest::API::WidgetAPI::AutoConfirmCommissionDraft())
    {
        local_1 = local_1 + 1;
    }
    if (AutoTest::API::WidgetAPI::AutoConfirmMatchConfirm())
    {
        local_1 = local_1 + 1;
    }
    return local_1;
}
int GetLocalPlayerLevel()
{
    ULocalPlayer local_4 = AutoTest::CommonUtils::GetULocalPlayer();
    if ((!((local_4 != nullptr))))
    {
        return 0;
    }
    return FM_LocalPlayerLevel::Get(local_4).GetLevel();
}
FString GetLocalPlayerName()
{
    ULocalPlayer local_4 = AutoTest::CommonUtils::GetULocalPlayer();
    if ((!((local_4 != nullptr))))
    {
        return "";
    }
    return FM_LocalPlayerLevel::Get(local_4).GetPlayerNameString();
}
uint GetLocalPlayerUid()
{
    int local_16 = 0;
    FECSEntity local_4 = FASCommonUtils::GetLocalPlayerProxy();
    if (!(local_4.IsValid()))
    {
        return 0;
    }
    if (!(local_16))
    {
        return 0;
    }
    return local_16.GetPlayerId();
}
void TeamInviteByUid(const uint TargetUid)
{
    int local_12 = 0;
    if (!(ECS::GetECSWorld().IsValid()))
    {
        return;
    }
    if (!(local_12))
    {
        return;
    }
    FSocialTeamUtils::ClientSendTeamUp(local_12.PlayerEntity, TargetUid);
    return;
}
void TeamLeave()
{
    FECSEntity local_4 = FASCommonUtils::GetLocalPlayerProxy();
    if (!(local_4.IsValid()))
    {
        return;
    }
    FSocialTeamUtils::ClientSendLeaveTeam(local_4);
    return;
}
FString GetSocialTeamId()
{
    FECSEntity local_4 = FASCommonUtils::GetLocalPlayerProxy();
    if (!(local_4.IsValid()))
    {
        return "";
    }
    int64 local_14 = FSocialTeamUtils::GetSocialTeamId(local_4);
    if (local_14 == 0)
    {
        return "";
    }
    return FString().Append(local_14);
}
FString GetChatDebugInfo()
{
    int local_1 = 0;
    UGameClientConnectionSubsystem local_6 = UGameClientConnectionSubsystem::Get();
    if (local_6 != nullptr && local_6.IsConnectedToGameServer())
    {
        local_1 = 1;
    }
    int local_9 = 0;
    ULocalPlayer local_14 = AutoTest::CommonUtils::GetULocalPlayer();
    if (local_14 != nullptr && FMS_PlayerSocialTeamData::Get(local_14).IsLocalPlayerInTeam())
    {
        local_9 = 1;
    }
    int64 local_16 = 0;
    FECSEntity local_22 = FASCommonUtils::GetLocalPlayerProxy();
    if (local_22.IsValid())
    {
        local_16 = FSocialTeamUtils::GetSocialTeamId(local_22);
    }
    return FString().Append("gs=").Append(local_1).Append(";social=").Append(local_9).Append(";teamid=").Append(local_16);
}
void VOXForceOff()
{
    VOXUtils::SetMicMode(EVOXVoiceMode(2));
    VOXUtils::SetSpeakerMode(EVOXVoiceMode(2));
    return;
}
bool QuitGameInGame()
{
    APlayerController local_4 = FASCommonUtils::GetLocalPlayerController();
    if ((!((local_4 != nullptr))))
    {
        return false;
    }
    FGameConnectionUtils::UICallQuitGame(local_4);
    return true;
}
void Chat_Send(const FString &inout Channel, const FString &inout Text)
{
    ULocalPlayer local_4 = AutoTest::CommonUtils::GetULocalPlayer();
    if ((!((local_4 != nullptr))))
    {
        return;
    }
    int local_6 = 1;
    if ((Channel == "BattleTeam"))
    {
        local_6 = 3;
    }
    else
    {
        if ((Channel == "SocialTeam"))
        {
            local_6 = 2;
        }
        else
        {
            if ((Channel == "System"))
            {
                local_6 = 4;
            }
        }
    }
    FMS_ChatDataModel::Get(local_4).GS_SendChatText(local_6, 0, Text);
    return;
}
void CloseUIPageByLayer(const FString &inout PageName)
{
    int local_3 = 0;
    int local_12 = 0;
    if ((PageName == "Window"))
    {
        local_3 = 4;
    }
    else
    {
        if ((PageName == "HUD"))
        {
            local_3 = 3;
        }
        else
        {
            if ((PageName == "Message"))
            {
                local_3 = 5;
            }
            else
            {
                return;
            }
        }
    }
    FECSWorldPtr local_6 = ECS::GetECSWorld();
    FEUIWidget::RemoveLayoutWidgets(local_12.UEPlayerController.GetLocalPlayer());
    return;
}
TArray<FString> GetCurrentSmallSideHintMessages()
{
    UWidget_CommonSideHintEntry_Small local_30;
    TArray<FString> local_4;
    TArray<UWidget> local_8;
    KLAutomation::GetAllWidgetsOfClass(local_8, UWidget_CommonSideHintEntry_Small, false);
    for (auto local_26 : local_8)
    {
        local_30 = Cast<UWidget_CommonSideHintEntry_Small>(local_26);
        ThrowIf(local_30, !((local_30 != nullptr)));
        if (local_30.CommonSideHint.IsValid())
        {
            local_4.Add(GetContent().ToString());
        }
    }
    return local_4;
}
TArray<FString> GetCurrentLargeSideHintMessages()
{
    UWidget_CommonSideHintEntry_Large local_30;
    TArray<FString> local_4;
    TArray<UWidget> local_8;
    KLAutomation::GetAllWidgetsOfClass(local_8, UWidget_CommonSideHintEntry_Large, false);
    for (auto local_26 : local_8)
    {
        local_30 = Cast<UWidget_CommonSideHintEntry_Large>(local_26);
        ThrowIf(local_30, !((local_30 != nullptr)));
        local_4.Add(GetContent().ToString());
    }
    return local_4;
}
TArray<FString> GetCurrentWeatherHintMessages()
{
    UWidget_CommonSideHintEntry_Large local_30;
    TArray<FString> local_4;
    TArray<UWidget> local_8;
    KLAutomation::GetAllWidgetsOfClass(local_8, UWidget_CommonSideHintEntry_Large, false);
    for (auto local_26 : local_8)
    {
        local_30 = Cast<UWidget_CommonSideHintEntry_Large>(local_26);
        ThrowIf(local_30, !((local_30 != nullptr)));
        local_4.Add(GetContent().ToString());
    }
    return local_4;
}
TArray<FString> GetCurrentBannerMessages()
{
    UWidget_CommonBanner local_30;
    TArray<FString> local_4;
    TArray<UWidget> local_8;
    KLAutomation::GetAllWidgetsOfClass(local_8, UWidget_CommonBanner, false);
    for (auto local_26 : local_8)
    {
        local_30 = Cast<UWidget_CommonBanner>(local_26);
        ThrowIf(local_30, !((local_30 != nullptr)));
        local_4.Add(GetTitle().ToString());
    }
    return local_4;
}
}
