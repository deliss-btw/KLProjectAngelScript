
namespace UWidget_NavigationBarMarkIcon
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_NavigationBarMarkIcon : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_MarkInfo> MarkInfo;
    UPROPERTY()
    FGetEUIModelRef MarkInfoDelegate;

    UWidget_NavigationBarMarkIcon()
    {
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.MarkInfo.Initialize(this, FName("VM_MarkInfo"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.MarkInfoDelegate.IsBound())
        {
            this.MarkInfo.SetRef(this.MarkInfoDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_NavigationBarMarkIcon
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
