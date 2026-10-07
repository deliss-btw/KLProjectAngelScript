
namespace UWidget_GameMenu
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_GameMenu : UEUIActivatableWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVMS_ExitLevel> ExitLevel;
    UPROPERTY()
    TEUIWidgetModelRef<FVMS_ExitGame> ExitGame;
    UPROPERTY()
    TEUIWidgetModelRef<FVMS_SelfPlayerInfo> SelfPlayerInfo;

    UWidget_GameMenu()
    {
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
    void ExitGame_ExitGame() const
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
        this.ExitLevel.Initialize(this, FName("VMS_ExitLevel"), EEUIWidgetRefModelCreationType(0), false);
        this.ExitGame.Initialize(this, FName("VMS_ExitGame"), EEUIWidgetRefModelCreationType(0), false);
        this.SelfPlayerInfo.Initialize(this, FName("VMS_SelfPlayerInfo"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        return;
    }
}

namespace UWidget_GameMenu
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
