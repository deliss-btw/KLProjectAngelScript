
namespace UWidget_MarkIcon
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_MarkIcon : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_MarkIcon> MarkIcon;
    UPROPERTY()
    FGetEUIModelRef MarkIconDelegate;

    UWidget_MarkIcon()
    {
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.MarkIcon.Initialize(this, FName("VM_MarkIcon"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.MarkIconDelegate.IsBound())
        {
            this.MarkIcon.SetRef(this.MarkIconDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_MarkIcon
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
