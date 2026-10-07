
namespace UWidget_ChatCommonAvatar
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_ChatCommonAvatar : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_ChatCommonAvatar> ChatCommonAvatar;
    UPROPERTY()
    FGetEUIModelRef ChatCommonAvatarDelegate;

    UWidget_ChatCommonAvatar()
    {
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.ChatCommonAvatar.Initialize(this, FName("VM_ChatCommonAvatar"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.ChatCommonAvatarDelegate.IsBound())
        {
            this.ChatCommonAvatar.SetRef(this.ChatCommonAvatarDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_ChatCommonAvatar
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
