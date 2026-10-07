
namespace UWidget_TalentUpgradeDesc
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_TalentUpgradeDesc : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_TalentUpgradeDesc> DescModel;
    UPROPERTY()
    FGetEUIModelRef DescModelDelegate;

    UWidget_TalentUpgradeDesc()
    {
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.DescModel.Initialize(this, FName("VM_TalentUpgradeDesc"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.DescModelDelegate.IsBound())
        {
            this.DescModel.SetRef(this.DescModelDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_TalentUpgradeDesc
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
