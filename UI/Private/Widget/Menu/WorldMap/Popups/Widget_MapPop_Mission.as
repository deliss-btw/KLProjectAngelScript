
namespace UWidget_MapPop_Mission
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_MapPop_Mission : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_MissionSpotInfo> MissionSpotInfo;
    UPROPERTY()
    FGetEUIModelRef MissionSpotInfoDelegate;

    UWidget_MapPop_Mission()
    {
        return;
    }
    UFUNCTION()
    void MissionSpotInfo_OnGotoMissionButtonClicked() const
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
        this.MissionSpotInfo.Initialize(this, FName("VM_MissionSpotInfo"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.MissionSpotInfoDelegate.IsBound())
        {
            this.MissionSpotInfo.SetRef(this.MissionSpotInfoDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_MapPop_Mission
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
