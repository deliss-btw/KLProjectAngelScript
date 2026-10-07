
namespace UWidget_GameEntry_PVX
{
    const int ViewID = 0;

}
class UWidget_GameEntry_PVX : UEUIActivatableWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVMS_GameEntry_PVX> GameEntry_PVX;
    UPROPERTY()
    UEditableTextBox EditableTextBox_NickName;
    UPROPERTY()
    UComboBoxString ComboBoxString_Faction;
    UPROPERTY()
    UComboBoxString ComboBoxString_SpawnPoint;
    UPROPERTY()
    UComboBoxString ComboBoxString_Prefab;
    UPROPERTY()
    UComboBoxString ComboBoxString_Prefab_Player;
    UPROPERTY()
    UEUIButton Button_Enter;
    TArray<FECSEntity> SpawnPoints;
    bool bSpawnPointInitilized = false;


    UFUNCTION()
    void OnViewBind_Implementation()
    {
        this.EditableTextBox_NickName.SetText(FText::FromString(::FASCommonUtils::GetPlatformUserName()));
        this.Button_Enter.OnClicked.AddUFunction(this, n"OnEnterButtonClicked");
        this.ComboBoxString_Faction.OnSelectionChanged.AddUFunction(this, n"OnSelectionChanged_Faction");
        this.InitFaction();
        this.InitPrefab();
        this.InitPlayerPrefab();
        return;
    }
    UFUNCTION()
    void Tick_Implementation(const FGeometry &inout MyGeometry, const float32 InDeltaTime)
    {
        if (!(this.bSpawnPointInitilized))
        {
            this.InitSpawnPoint();
        }
        AAS_ECSPlayerController local_4 = (Cast<AAS_ECSPlayerController>(this.GetOwningPlayer()));
        if (local_4 != nullptr)
        {
            if (FECSEntity(local_4.GetPlayerEntity()).IsValid())
            {
                Get local_20;
                const FC_PlayerStates& local_22 = local_20.opCall();
                if (local_22)
                {
                    if (local_22.GetbReady())
                    {
                        this.ClosePage(true);
                    }
                }
            }
        }
        return;
    }
    void InitFaction()
    {
        this.ComboBoxString_Faction.AddOption("Player");
        this.ComboBoxString_Faction.AddOption("Invader");
        this.ComboBoxString_Faction.AddOption("Boss");
        this.ComboBoxString_Faction.SetSelectedIndex(0);
        0.SetSelectedTeamID();
        return;
    }
    void InitSpawnPoint()
    {
        int local_6 = 0;
        ECS::GetECSWorldOfObject(this);
        if (!(local_6))
        {
            return;
        }
        UKLGameModeSettings local_14 = (Cast<UKLGameModeSettings>(UECSGameModeSettingsBase::Get(this.GetWorld())));
        TArray<FECSEntityId> local_26 = local_6.GetTeamSpawners(this.ComboBoxString_Faction.GetSelectedIndex());
        this.SpawnPoints.Empty(0);
        this.ComboBoxString_SpawnPoint.ClearOptions();
        int local_31 = 0;
        for (; local_31 < local_26.Num(); )
        {
            this.SpawnPoints.Add(FECSEntity(local_26[local_31]));
            Get local_44;
            this.ComboBoxString_SpawnPoint.AddOption(local_44.opCall().Name);
            ++local_31;
        }
        if (this.SpawnPoints.Num() > 0)
        {
            this.ComboBoxString_SpawnPoint.SetSelectedIndex(0);
            this.bSpawnPointInitilized = true;
        }
        return;
    }
    void InitPrefab()
    {
        UAS_GameModeSettingsPVX local_8 = (Cast<UAS_GameModeSettingsPVX>(UECSGameModeSettingsBase::Get(this.GetWorld())));
        for (auto& local_24 : local_8.BossPrefabs)
        {
            FString local_34 = local_24.GetDefaultObject().GetPathName(nullptr);
            local_34 = local_34.RightChop((local_34.Find(".", ESearchCase(0), ESearchDir(1), -1) + 1));
            local_34 = local_34.RightChop(FString("Default__").Len());
            local_34 = local_34.LeftChop(FString("_C").Len());
            this.ComboBoxString_Prefab.AddOption(local_34);
        }
        this.ComboBoxString_Prefab.SetSelectedIndex(0);
        return;
    }
    void InitPlayerPrefab()
    {
        UAS_GameModeSettingsPVX local_8 = (Cast<UAS_GameModeSettingsPVX>(UECSGameModeSettingsBase::Get(this.GetWorld())));
        for (auto& local_24 : local_8.ChangeRoleDataObjects)
        {
            local_24;
            FString local_28;
            this.ComboBoxString_Prefab_Player.AddOption(local_28);
        }
        this.ComboBoxString_Prefab_Player.SetSelectedIndex(0);
        return;
    }
    UFUNCTION()
    void OnSelectionChanged_Faction(const FString &inout SelectedItem, const ESelectInfo SelectionType)
    {
        FVMS_GameEntry_PVX local_2;
        local_2.SetSelectedTeamID(this.ComboBoxString_Faction.GetSelectedIndex());
        this.bSpawnPointInitilized = false;
        return;
    }
    UFUNCTION()
    void OnEnterButtonClicked()
    {
        AAS_ECSPlayerController local_2 = (Cast<AAS_ECSPlayerController>(this.GetOwningPlayer()));
        if (local_2 != nullptr)
        {
            int local_9;
            int local_8;
            bool local_7;
            local_7 = false;
            local_8 = local_7;
            local_9 = -1;
            FString local_14 = this.ComboBoxString_Faction.GetSelectedOption();
            if ((local_14 == "Player"))
            {
                local_7 = false;
                local_8 = local_7;
                local_9 = -1;
            }
            else
            {
                if ((local_14 == "Invader"))
                {
                    local_7 = true;
                    local_8 = local_7;
                    local_9 = -1;
                }
                else
                {
                    if ((local_14 == "Boss"))
                    {
                        local_7 = false;
                        local_8 = local_7;
                        local_9 = this.ComboBoxString_Prefab.GetSelectedIndex();
                    }
                }
            }
            FECSEntity local_22 = FECSEntity(ENTITY_NULL);
            int local_10 = this.ComboBoxString_SpawnPoint.GetSelectedIndex();
            if (local_10 >= 0 && (local_10 < this.SpawnPoints.Num()))
            {
                local_22 = this.SpawnPoints[local_10];
            }
            FString local_28 = FString().Append(this.ComboBoxString_Faction.GetSelectedOption()).Append(" - ").Append(this.EditableTextBox_NickName.GetText().ToString());
            int local_23 = this.ComboBoxString_Prefab_Player.GetSelectedIndex();
            if (FECSEntity(local_2.GetPlayerEntity()).IsValid())
            {
                FCE_PlayerEnterPVX local_58;
                FFPTime local_56 = FFPTime(-1);
                local_58.bIsInvader = (local_8 != 0);
                local_58.BossPrefabIdx = local_9;
                local_58.SpawnPoint = local_22;
                local_58.UserNameOverride = local_28;
                local_58.PlayerPrefabIdx = local_23;
            }
        }
        return;
    }
    UFUNCTION()
    int GameEntry_PVX_SelectCharWidgetSwitcherIndex() const
    {
        FVMS_GameEntry_PVX& local_2;
        return local_2 ? local_2.GetSelectCharWidgetSwitcherIndex() : 0;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.GameEntry_PVX.Initialize(this, FName("VMS_GameEntry_PVX"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        return;
    }
}

namespace UWidget_GameEntry_PVX
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
