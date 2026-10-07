
namespace UWidget_TalentUpgradeTreeTiitle
{
    const int ViewID = 0;

}
class UWidget_TalentUpgradeTreeTiitle : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_TalentUpgradeFormulaTree> TreeData;
    UPROPERTY()
    FGetEUIModelRef TreeDataDelegate;

    UWidget_TalentUpgradeTreeTiitle()
    {
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.TreeData.Initialize(this, FName("VM_TalentUpgradeFormulaTree"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.TreeDataDelegate.IsBound())
        {
            this.TreeData.SetRef(this.TreeDataDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_TalentUpgradeTreeTiitle
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
