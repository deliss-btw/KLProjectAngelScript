
namespace UWidget_DropPreview
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_DropPreview : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_DropPreview> DropPreview;
    UPROPERTY()
    FGetEUIModelRef DropPreviewDelegate;

    UWidget_DropPreview()
    {
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.DropPreview.Initialize(this, FName("VM_DropPreview"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.DropPreviewDelegate.IsBound())
        {
            this.DropPreview.SetRef(this.DropPreviewDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_DropPreview
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
