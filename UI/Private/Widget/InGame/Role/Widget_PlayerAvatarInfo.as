
namespace UWidget_PlayerAvatarInfo
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_PlayerAvatarInfo : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_PlayerAvatar> PlayerAvatar;
    UPROPERTY()
    FGetEUIModelRef PlayerAvatarDelegate;

    UWidget_PlayerAvatarInfo()
    {
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.PlayerAvatar.Initialize(this, FName("VM_PlayerAvatar"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.PlayerAvatarDelegate.IsBound())
        {
            this.PlayerAvatar.SetRef(this.PlayerAvatarDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_PlayerAvatarInfo
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
