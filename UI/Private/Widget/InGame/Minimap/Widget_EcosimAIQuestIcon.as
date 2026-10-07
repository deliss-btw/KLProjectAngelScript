
namespace UWidget_EcosimAIQuestIcon
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_EcosimAIQuestIcon : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_EcosimAIQuestIcon> Icon;
    UPROPERTY()
    FGetEUIModelRef IconDelegate;

    UWidget_EcosimAIQuestIcon()
    {
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.Icon.Initialize(this, FName("VM_EcosimAIQuestIcon"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.IconDelegate.IsBound())
        {
            this.Icon.SetRef(this.IconDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_EcosimAIQuestIcon
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
