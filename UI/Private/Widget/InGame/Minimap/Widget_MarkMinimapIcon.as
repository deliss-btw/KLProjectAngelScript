
namespace UWidget_MarkMinimapIcon
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_MarkMinimapIcon : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_MarkMinimapIcon> MinimapIcon;
    UPROPERTY()
    FGetEUIModelRef MinimapIconDelegate;

    UWidget_MarkMinimapIcon()
    {
        return;
    }
    UFUNCTION()
    void MinimapIcon_RemoveMark() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.MinimapIcon.Initialize(this, FName("VM_MarkMinimapIcon"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.MinimapIconDelegate.IsBound())
        {
            this.MinimapIcon.SetRef(this.MinimapIconDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_MarkMinimapIcon
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
