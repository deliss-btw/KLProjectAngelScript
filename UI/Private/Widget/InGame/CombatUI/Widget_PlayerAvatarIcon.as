
namespace UWidget_PlayerAvatarIcon
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_PlayerAvatarIcon : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_PlayerAvatarIcon> PlayerAvatarIcon;
    UPROPERTY()
    FGetEUIModelRef PlayerAvatarIconDelegate;

    UWidget_PlayerAvatarIcon()
    {
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.PlayerAvatarIcon.Initialize(this, FName("VM_PlayerAvatarIcon"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.PlayerAvatarIconDelegate.IsBound())
        {
            this.PlayerAvatarIcon.SetRef(this.PlayerAvatarIconDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_PlayerAvatarIcon
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
