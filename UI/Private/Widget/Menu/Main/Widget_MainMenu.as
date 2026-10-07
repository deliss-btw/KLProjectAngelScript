
namespace UWidget_MainMenu
{
    const int ViewID = 0;
}
namespace UWidget_MainMenuCategory
{
    const int ViewID = 0;
}
namespace UWidget_MainMenuEntry
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_MainMenu : UEUIActivatableWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_MainMenu> MainMenu;
    UPROPERTY()
    TEUIWidgetModelRef<FVMS_ExitGame> ExitGame;
    UPROPERTY()
    TEUIWidgetModelRef<FVMS_ExitLevel> ExitLevel;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_PlayerInfo> LocalPlayerInfo;
    UPROPERTY()
    TEUIWidgetModelRef<FVMS_Commission> Commission;
    UPROPERTY()
    FGetEUIModelRef MainMenuDelegate;
    UPROPERTY()
    FGetEUIModelRef LocalPlayerInfoDelegate;

    UWidget_MainMenu()
    {
        return;
    }
    UFUNCTION()
    void OnViewBind_Implementation()
    {
        this.LocalPlayerInfo.SetRef(TEUIModelRef<FVM_PlayerInfo>(::FVM_PlayerInfo::Create(this, ::FMS_PlayerData::Get(this).GetLocalPlayerData())));
        return;
    }
    UFUNCTION()
    void MainMenu_OnMenuCategorySelected(const FEUIModelContainer &inout MenuCategory) const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder::PushArg local_42;
        local_42.opCall(MenuCategory);
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void MainMenu_OnMenuCategoryIndexSelected(const int Index) const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder::PushArg local_42;
        local_42.opCall(Index);
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void ExitGame_ExitGame() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void ExitLevel_OnClick() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void LocalPlayerInfo_CopyUidToClipboard() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.MainMenu.Initialize(this, FName("VM_MainMenu"), EEUIWidgetRefModelCreationType(0), false);
        this.ExitGame.Initialize(this, FName("VMS_ExitGame"), EEUIWidgetRefModelCreationType(0), false);
        this.ExitLevel.Initialize(this, FName("VMS_ExitLevel"), EEUIWidgetRefModelCreationType(0), false);
        this.LocalPlayerInfo.Initialize(this, FName("VM_PlayerInfo"), EEUIWidgetRefModelCreationType(0), true);
        this.Commission.Initialize(this, FName("VMS_Commission"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.MainMenuDelegate.IsBound())
        {
            this.MainMenu.SetRef(this.MainMenuDelegate.Execute());
        }
        if (this.LocalPlayerInfoDelegate.IsBound())
        {
            this.LocalPlayerInfo.SetRef(this.LocalPlayerInfoDelegate.Execute());
        }
        return;
    }
}

UCLASS(Abstract)
class UWidget_MainMenuCategory : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_MainMenuCategory> MainMenuCategory;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_SelectableItem> SelectableItem;
    UPROPERTY()
    FGetEUIModelRef MainMenuCategoryDelegate;
    UPROPERTY()
    FGetEUIModelRef SelectableItemDelegate;

    UWidget_MainMenuCategory()
    {
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.MainMenuCategory.Initialize(this, FName("VM_MainMenuCategory"), EEUIWidgetRefModelCreationType(0), false);
        this.SelectableItem.Initialize(this, FName("VM_SelectableItem"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.MainMenuCategoryDelegate.IsBound())
        {
            this.MainMenuCategory.SetRef(this.MainMenuCategoryDelegate.Execute());
        }
        if (this.SelectableItemDelegate.IsBound())
        {
            this.SelectableItem.SetRef(this.SelectableItemDelegate.Execute());
        }
        return;
    }
}

UCLASS(Abstract)
class UWidget_MainMenuEntry : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_MainMenuEntry> MainMenuEntry;
    UPROPERTY()
    FGetEUIModelRef MainMenuEntryDelegate;

    UWidget_MainMenuEntry()
    {
        return;
    }
    UFUNCTION()
    void MainMenuEntry_EnterMenuPage() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.MainMenuEntry.Initialize(this, FName("VM_MainMenuEntry"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.MainMenuEntryDelegate.IsBound())
        {
            this.MainMenuEntry.SetRef(this.MainMenuEntryDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_MainMenu
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
namespace UWidget_MainMenuCategory
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
namespace UWidget_MainMenuEntry
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
