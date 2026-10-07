
namespace UWidget_GameEntryPVP_V2
{
    const int ViewID = 0;

}
class UWidget_GameEntryPVP_V2 : UEUIActivatableWidget
{
    int MaxPlayersPerTeam = 5;
    UPROPERTY()
    TEUIWidgetModelRef<FVMS_PVP_Lobby> VMS;
    UPROPERTY()
    UEUIButton ReadyButton;
    UPROPERTY()
    UEUIButton GoButton;
    UPROPERTY()
    UButton TeamButton_1;
    UPROPERTY()
    UButton TeamButton_2;
    UPROPERTY()
    UListView PlayerInfoList_1;
    UPROPERTY()
    UListView PlayerInfoList_2;
    UPROPERTY()
    UTextBlock RoomText;
    UPROPERTY()
    UEUITextBlock RoomID;
    UPROPERTY()
    UComboBoxString GameRuleComboBox;
    UPROPERTY()
    UButton ExitButton;
    UPROPERTY()
    UButton AddBotButton_1;
    UPROPERTY()
    UButton AddBotButton_2;
    UPROPERTY()
    UButton RemoveBotButton_1;
    UPROPERTY()
    UButton RemoveBotButton_2;
    bool bSuppressGameRuleCallback = false;
    UPROPERTY()
    TArray<UPVP_PlayerListItemData> PlayerStateItems_1;
    UPROPERTY()
    TArray<UPVP_PlayerListItemData> PlayerStateItems_2;


    UFUNCTION()
    void OnViewBind_Implementation()
    {
        if (ECS::GetECSWorld().IsValid())
        {
            this.MaxPlayersPerTeam = ::FGameModeDataBridge::GetMaxPlayersPerTeam(ECS::GetECSWorld());
        }
        else
        {
            this.MaxPlayersPerTeam = 5;
        }
        this.ReadyButton.OnClicked.AddUFunction(this, n"OnReadyButtonClicked");
        this.GoButton.OnClicked.AddUFunction(this, n"OnGoButtonClicked");
        this.TeamButton_1.OnClicked.AddUFunction(this, n"OnTeamButtonClicked_1");
        this.TeamButton_2.OnClicked.AddUFunction(this, n"OnTeamButtonClicked_2");
        if (this.GameRuleComboBox != nullptr)
        {
            this.GameRuleComboBox.AddOption(this.GetGameRuleDisplayName(EPVPGameRuleType(1)));
            this.GameRuleComboBox.AddOption(this.GetGameRuleDisplayName(EPVPGameRuleType(2)));
            this.GameRuleComboBox.AddOption("еЌ з‚№пј€жњЄе®ћзЋ°пј‰");
            this.GameRuleComboBox.AddOption("Mobaпј€жњЄе®ћзЋ°пј‰");
            this.GameRuleComboBox.SetSelectedIndex(0);
            this.GameRuleComboBox.OnSelectionChanged.AddUFunction(this, n"OnGameRuleSelectionChanged");
        }
        if (this.ExitButton != nullptr)
        {
            this.ExitButton.OnClicked.AddUFunction(this, n"OnExitButtonClicked");
        }
        if (this.AddBotButton_1 != nullptr)
        {
            this.AddBotButton_1.OnClicked.AddUFunction(this, n"OnAddBotClicked_1");
        }
        if (this.AddBotButton_2 != nullptr)
        {
            this.AddBotButton_2.OnClicked.AddUFunction(this, n"OnAddBotClicked_2");
        }
        if (this.RemoveBotButton_1 != nullptr)
        {
            this.RemoveBotButton_1.OnClicked.AddUFunction(this, n"OnRemoveBotClicked_1");
        }
        if (this.RemoveBotButton_2 != nullptr)
        {
            this.RemoveBotButton_2.OnClicked.AddUFunction(this, n"OnRemoveBotClicked_2");
        }
        int local_15 = 0;
        for (; local_15 < this.MaxPlayersPerTeam; )
        {
            this.PlayerStateItems_1.Add(Cast<UPVP_PlayerListItemData>(NewObject(this, UPVP_PlayerListItemData, NAME_None, false)));
            this.PlayerStateItems_2.Add(Cast<UPVP_PlayerListItemData>(NewObject(this, UPVP_PlayerListItemData, NAME_None, false)));
            ++local_15;
        }
        this.PlayerInfoList_1.SetListItems(this.PlayerStateItems_1);
        this.PlayerInfoList_2.SetListItems(this.PlayerStateItems_2);
        return;
    }
    UFUNCTION()
    void Tick_Implementation(const FGeometry &inout MyGeometry, const float32 InDeltaTime)
    {
        FVMS_PVP_Lobby& local_4;
        int local_29;
        FPVPLobbyPlayerEntry& local_214;
        UPVP_PlayerListItemData local_218;
        bool local_235;
        if (!(this.VMS.IsValid()))
        {
            return;
        }
        if (local_4.GetbShouldHide())
        {
            APlayerController local_6 = this.GetOwningPlayer();
            if (local_6 != nullptr)
            {
                local_6.SetbShowMouseCursor(false);
            }
            this.RemoveFromLayout();
            return;
        }
        this.SetVisibility(ESlateVisibility(4));
        AAS_ECSPlayerController local_12 = (Cast<AAS_ECSPlayerController>(this.GetOwningPlayer()));
        if (local_12 == nullptr)
        {
            return;
        }
        FECSEntity local_18 = FECSEntity(local_12.GetPlayerEntity());
        if (!(local_18.IsValid()))
        {
            return;
        }
        FECSWorldPtr local_24 = local_18.GetWorld();
        if (!(::FGameModeDataBridge::HasPVPLobbyData(local_24)))
        {
            return;
        }
        local_12.SetbShowMouseCursor(true);
        this.RoomText.SetText(local_4.GetRoomIDText());
        this.RoomID.SetText(local_4.GetRoomIDText());
        int local_28 = ::FASCommonUtils::GetPlayerUidFromPlayerEntity(local_18);
        int local_27 = ::FGameModeDataBridge::GetPVPHostPlayerUID(local_24);
        EPVPGameRuleType local_31 = ::FGameModeDataBridge::GetPVPSelectedGameRule(local_24);
        TMap<uint, FPVPLobbyPlayerEntry> local_52;
        ::FGameModeDataBridge::GetPVPLobbyPlayerEntries(local_24, local_52);
        TMap<uint, FECSEntity> local_72;
        FECSRuntimeView local_110 = local_24.GetRuntimeView(EECSRuntimeViewType(2));
        Include local_114;
        local_114.opCall();
        Include local_118;
        local_118.opCall();
        FECSRuntimeViewIterator local_152 = local_110.Iterator();
        for (; local_152.CanProceed;)
        {
            const FECSEntity& local_188 = local_152.Proceed();
            local_29 = ::FASCommonUtils::GetPlayerUidFromPlayerEntity(local_188);
            if (local_29 > 0)
            {
                local_72.Add(local_29, local_188);
            }
        }
        int local_190 = 0;
        for (; local_190 < this.MaxPlayersPerTeam; )
        {
            this.PlayerStateItems_1[local_190].bOccupied = false;
            this.PlayerStateItems_2[local_190].bOccupied = false;
            ++local_190;
        }
        bool local_1 = false;
        bool local_193 = local_1;
        for (auto& local_212 : local_52)
        {
            if (local_1)
            {
                local_1 = true;
                local_193 = local_1;
                break;
            }
        }
        int local_190_2 = 1;
        for (auto& local_212_2 : local_52)
        {
            local_29 = local_212_2.GetKey();
            if (int(local_214.PlayerInTeamIndex) < 0 || (int(local_214.PlayerInTeamIndex) >= this.MaxPlayersPerTeam))
            {
                continue;
            }
            if (local_214.bIsBot)
            {
                if (int(local_214.TeamID) == 0)
                {
                    int local_192 = int(local_214.PlayerInTeamIndex);
                }
                else
                {
                    int local_191 = int(local_214.PlayerInTeamIndex);
                }
                bool local_1_2 = true;
                local_218.bOccupied = local_1_2;
                local_218.PlayerName = FString().Append("Bot ").Append(local_190_2);
                local_218.bReady = true;
                local_1_2 = false;
                local_218.bIsLocal = local_1_2;
                local_218.bIsHost = false;
                local_1_2 = true;
                local_218.bIsBot = local_1_2;
                ++local_190_2;
                continue;
            }
            if (!(local_72.Contains(local_29)))
            {
                continue;
            }
            if (local_193 && !(local_214.bWantsBackToRoom))
            {
                continue;
            }
            FECSEntity local_226 = FECSEntity(local_72[local_29]);
            Get local_234;
            FString local_230 = FString(local_234.opCall().GetNickName());
            Get local_240;
            local_235 = local_240.opCall().GetbReady();
            if (int(local_214.TeamID) == 0)
            {
                int local_192_2 = int(local_214.PlayerInTeamIndex);
            }
            else
            {
                int local_191_2 = int(local_214.PlayerInTeamIndex);
            }
            bool local_1_3 = true;
            local_218.bOccupied = local_1_3;
            local_218.PlayerName = local_230;
            local_218.bReady = local_235;
            bool local_215 = (local_29 == local_28);
            local_218.bIsLocal = local_215;
            local_1_3 = (local_29 == local_27);
            local_218.bIsHost = local_1_3;
            local_215 = false;
            local_218.bIsBot = local_215;
        }
        this.PushDataToEntries(this.PlayerInfoList_1, this.PlayerStateItems_1);
        this.PushDataToEntries(this.PlayerInfoList_2, this.PlayerStateItems_2);
        if (this.GameRuleComboBox != nullptr)
        {
            int local_191_3 = this.GameRuleTypeToComboIndex(local_31);
            int local_192_3 = this.GameRuleComboBox.GetSelectedIndex();
            local_235 = false;
            if (local_191_3 == 1)
            {
                local_235 = (local_192_3 != 1);
            }
            else
            {
                local_235 = (local_192_3 == 1);
            }
            if (local_235)
            {
                this.bSuppressGameRuleCallback = true;
                this.GameRuleComboBox.SetSelectedIndex(local_191_3);
                this.bSuppressGameRuleCallback = false;
            }
            this.GameRuleComboBox.SetIsEnabled(local_4.GetbIsHost());
        }
        if (!(local_4.GetbIsHost()))
        {
            this.GoButton.SetVisibility(ESlateVisibility(2));
        }
        else
        {
            this.GoButton.SetVisibility(ESlateVisibility(0));
            this.GoButton.SetIsEnabled(local_4.GetbAllReady());
        }
        int local_245 = 1;
        if (this.AddBotButton_1 != nullptr)
        {
            this.AddBotButton_1.SetVisibility(ESlateVisibility(local_245));
        }
        if (this.AddBotButton_2 != nullptr)
        {
            this.AddBotButton_2.SetVisibility(ESlateVisibility(local_245));
        }
        if (this.RemoveBotButton_1 != nullptr)
        {
            this.RemoveBotButton_1.SetVisibility(ESlateVisibility(local_245));
        }
        if (this.RemoveBotButton_2 != nullptr)
        {
            this.RemoveBotButton_2.SetVisibility(ESlateVisibility(local_245));
        }
        return;
    }
    UFUNCTION()
    void OnReadyButtonClicked()
    {
        if (this.VMS.IsValid())
        {
            RequestReady();
        }
        return;
    }
    UFUNCTION()
    void OnGoButtonClicked()
    {
        if (this.VMS.IsValid())
        {
            RequestGo();
        }
        return;
    }
    UFUNCTION()
    void OnTeamButtonClicked_1()
    {
        if (this.VMS.IsValid())
        {
            0.RequestSwitchTeam();
        }
        return;
    }
    UFUNCTION()
    void OnTeamButtonClicked_2()
    {
        if (this.VMS.IsValid())
        {
            1.RequestSwitchTeam();
        }
        return;
    }
    UFUNCTION()
    void OnExitButtonClicked()
    {
        if (this.VMS.IsValid())
        {
            RequestExit();
        }
        return;
    }
    UFUNCTION()
    void OnAddBotClicked_1()
    {
        if (this.VMS.IsValid())
        {
            0.RequestAddBot();
        }
        return;
    }
    UFUNCTION()
    void OnAddBotClicked_2()
    {
        if (this.VMS.IsValid())
        {
            1.RequestAddBot();
        }
        return;
    }
    UFUNCTION()
    void OnRemoveBotClicked_1()
    {
        if (this.VMS.IsValid())
        {
            0.RequestRemoveBot();
        }
        return;
    }
    UFUNCTION()
    void OnRemoveBotClicked_2()
    {
        if (this.VMS.IsValid())
        {
            1.RequestRemoveBot();
        }
        return;
    }
    UFUNCTION()
    void OnGameRuleSelectionChanged(const FString &inout SelectedItem, const ESelectInfo SelectionType)
    {
        if (this.bSuppressGameRuleCallback)
        {
            return;
        }
        if (this.VMS.IsValid())
        {
            int local_2 = int(this.GameRuleDisplayNameToType(SelectedItem));
            RequestSwitchGameRule();
        }
        return;
    }
    FString GetGameRuleDisplayName(const EPVPGameRuleType RuleType) const
    {
        FString __return;
        int local_1 = int(RuleType);
        if (local_1 <= 2)
        {
            if (local_1 != 1)
            {
                if (local_1 != 2)
                {
                }
            }
            else
            {
                __return = "д№±ж–—";
                __return = "TDM";
            }
        }
        return "жњЄзџҐ";
    }
    EPVPGameRuleType GameRuleDisplayNameToType(const FString &inout DisplayName) const
    {
        if ((DisplayName == "TDM"))
        {
            return EPVPGameRuleType(2);
        }
        return EPVPGameRuleType(1);
    }
    int GameRuleTypeToComboIndex(const EPVPGameRuleType RuleType) const
    {
        switch (int(RuleType))
        {
            case 1:
                return 0;
            case 2:
                return 1;
            default:
                return 0;
        }
    }
    void PushDataToEntries(const UListView ListView, const TArray<UPVP_PlayerListItemData> &inout Items)
    {
        UUserWidget local_10;
        UWidget_GameEntryPVP_PlayerState local_14;
        TArray<UUserWidget> local_4 = ListView.GetDisplayedEntryWidgets();
        int local_5 = 0;
        for (; local_5 < local_4.Num(); ++local_5)
        {
            local_10 = local_4[local_5];
            local_14 = Cast<UWidget_GameEntryPVP_PlayerState>(local_10);
            if (local_14 == nullptr)
            {
                continue;
            }
            if (local_5 < Items.Num())
            {
            }
            else
            {
            }
            UPVP_PlayerListItemData local_16;
            local_14.SetData(local_16);
        }
        return;
    }
    UFUNCTION()
    FText VMS_RoomIDText() const
    {
        FVMS_PVP_Lobby& local_2;
        FText local_12 = local_2 ? local_2.GetRoomIDText() : FText();
        return local_12;
    }
    UFUNCTION()
    bool VMS_bIsHost() const
    {
        FVMS_PVP_Lobby& local_2;
        bool local_5;
        if (local_2)
        {
            local_5 = local_2.GetbIsHost();
        }
        else
        {
            local_5 = false;
        }
        return local_5;
    }
    UFUNCTION()
    bool VMS_bAllReady() const
    {
        FVMS_PVP_Lobby& local_2;
        bool local_5;
        if (local_2)
        {
            local_5 = local_2.GetbAllReady();
        }
        else
        {
            local_5 = false;
        }
        return local_5;
    }
    UFUNCTION()
    bool VMS_bShouldHide() const
    {
        FVMS_PVP_Lobby& local_2;
        bool local_5;
        if (local_2)
        {
            local_5 = local_2.GetbShouldHide();
        }
        else
        {
            local_5 = false;
        }
        return local_5;
    }
    UFUNCTION()
    int VMS_SelectedGameRuleIndex() const
    {
        FVMS_PVP_Lobby& local_2;
        return local_2 ? local_2.GetSelectedGameRuleIndex() : 0;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.VMS.Initialize(this, FName("VMS_PVP_Lobby"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        return;
    }
}

namespace UWidget_GameEntryPVP_V2
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
