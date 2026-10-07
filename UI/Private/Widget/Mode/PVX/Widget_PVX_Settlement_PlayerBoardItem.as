
namespace UWidget_PVX_Settlement_PlayerBoardItem
{
    const int ViewID = 0;

}
class UWidget_PVX_Settlement_PlayerBoardItem : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_PVX_Settlement_PlayerInfo> PlayerInfo;
    UPROPERTY()
    FGetEUIModelRef PlayerInfoDelegate;

    UWidget_PVX_Settlement_PlayerBoardItem()
    {
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.PlayerInfo.Initialize(this, FName("VM_PVX_Settlement_PlayerInfo"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.PlayerInfoDelegate.IsBound())
        {
            this.PlayerInfo.SetRef(this.PlayerInfoDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_PVX_Settlement_PlayerBoardItem
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
