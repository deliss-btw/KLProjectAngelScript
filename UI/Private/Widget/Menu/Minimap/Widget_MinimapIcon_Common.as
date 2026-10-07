
namespace UWidget_MinimapIcon_Common
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_MinimapIcon_Common : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_MinimapIcon> MinimapIcon;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_SpotInfo> SpotInfo;
    UPROPERTY()
    FGetEUIModelRef MinimapIconDelegate;
    UPROPERTY()
    FGetEUIModelRef SpotInfoDelegate;

    UWidget_MinimapIcon_Common()
    {
        return;
    }
    UFUNCTION()
    void OnViewBind_Implementation()
    {
        TEUIModelRef<FM_Spot> local_4 = this.MinimapIcon.opArrow().GetSpot();
        TEUIModelRef<FM_Spot> local_2;
        if (local_2)
        {
            this.SpotInfo.SetRef(TEUIModelRef<FVM_SpotInfo>(::FVM_SpotInfo::Create(this, local_2, EPresentationSpotUsage(0))));
        }
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.MinimapIcon.Initialize(this, FName("VM_MinimapIcon"), EEUIWidgetRefModelCreationType(0), false);
        this.SpotInfo.Initialize(this, FName("VM_SpotInfo"), EEUIWidgetRefModelCreationType(0), true);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.MinimapIconDelegate.IsBound())
        {
            this.MinimapIcon.SetRef(this.MinimapIconDelegate.Execute());
        }
        if (this.SpotInfoDelegate.IsBound())
        {
            this.SpotInfo.SetRef(this.SpotInfoDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_MinimapIcon_Common
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
