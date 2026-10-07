
namespace UWidget_TalentUpgradeSelectInfo
{
    const int ViewID = 0;

}
class UWidget_TalentUpgradeSelectInfo : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_TalentUpgradeInfo> Info;
    UPROPERTY()
    FGetEUIModelRef InfoDelegate;

    UWidget_TalentUpgradeSelectInfo()
    {
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.Info.Initialize(this, FName("VM_TalentUpgradeInfo"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.InfoDelegate.IsBound())
        {
            this.Info.SetRef(this.InfoDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_TalentUpgradeSelectInfo
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
