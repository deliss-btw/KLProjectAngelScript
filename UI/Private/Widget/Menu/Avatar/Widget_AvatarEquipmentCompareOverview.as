
namespace UWidget_AvatarEquipmentCompareOverview
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_AvatarEquipmentCompareOverview : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_AvatarEquipmentCompareOverview> CompareOverview;
    UPROPERTY()
    FGetEUIModelRef CompareOverviewDelegate;

    UWidget_AvatarEquipmentCompareOverview()
    {
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.CompareOverview.Initialize(this, FName("VM_AvatarEquipmentCompareOverview"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.CompareOverviewDelegate.IsBound())
        {
            this.CompareOverview.SetRef(this.CompareOverviewDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_AvatarEquipmentCompareOverview
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
