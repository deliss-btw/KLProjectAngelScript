
namespace UWidget_GuideMinimapIcon
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_GuideMinimapIcon : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_GuideMinimapIcon> GuideMinimapIcon;
    UPROPERTY()
    FGetEUIModelRef GuideMinimapIconDelegate;

    UWidget_GuideMinimapIcon()
    {
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.GuideMinimapIcon.Initialize(this, FName("VM_GuideMinimapIcon"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.GuideMinimapIconDelegate.IsBound())
        {
            this.GuideMinimapIcon.SetRef(this.GuideMinimapIconDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_GuideMinimapIcon
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
