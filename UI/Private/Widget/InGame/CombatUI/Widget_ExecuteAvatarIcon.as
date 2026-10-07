
namespace UWidget_ExecuteAvatarIcon
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_ExecuteAvatarIcon : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_ExecuteAvatarIcon> ExecuteAvatarIcon;
    UPROPERTY()
    FGetEUIModelRef ExecuteAvatarIconDelegate;

    UWidget_ExecuteAvatarIcon()
    {
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.ExecuteAvatarIcon.Initialize(this, FName("VM_ExecuteAvatarIcon"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.ExecuteAvatarIconDelegate.IsBound())
        {
            this.ExecuteAvatarIcon.SetRef(this.ExecuteAvatarIconDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_ExecuteAvatarIcon
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
