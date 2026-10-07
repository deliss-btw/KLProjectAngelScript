
namespace UWidget_MarkDecoractor
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_MarkDecoractor : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_MarkInfo> Decoractor;
    UPROPERTY()
    FGetEUIModelRef DecoractorDelegate;

    UWidget_MarkDecoractor()
    {
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.Decoractor.Initialize(this, FName("VM_MarkInfo"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.DecoractorDelegate.IsBound())
        {
            this.Decoractor.SetRef(this.DecoractorDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_MarkDecoractor
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
