
namespace UWidget_AvatarBuildBackground
{
    const int ViewID = 0;

}
class UWidget_AvatarBuildBackground : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_AvatarBuildBackground> Background;
    UPROPERTY()
    FGetEUIModelRef BackgroundDelegate;

    UWidget_AvatarBuildBackground()
    {
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.Background.Initialize(this, FName("VM_AvatarBuildBackground"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.BackgroundDelegate.IsBound())
        {
            this.Background.SetRef(this.BackgroundDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_AvatarBuildBackground
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
