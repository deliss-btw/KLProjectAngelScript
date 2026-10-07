
namespace UWidget_DynamicImage
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_DynamicImage : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_Image> Image;
    UPROPERTY()
    FGetEUIModelRef ImageDelegate;

    UWidget_DynamicImage()
    {
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.Image.Initialize(this, FName("VM_Image"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.ImageDelegate.IsBound())
        {
            this.Image.SetRef(this.ImageDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_DynamicImage
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
