
namespace UWidget_MissionDetailInfo
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_MissionDetailInfo : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_MissionDetailInfo> MissionDetailInfo;
    UPROPERTY()
    FGetEUIModelRef MissionDetailInfoDelegate;

    UWidget_MissionDetailInfo()
    {
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.MissionDetailInfo.Initialize(this, FName("VM_MissionDetailInfo"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.MissionDetailInfoDelegate.IsBound())
        {
            this.MissionDetailInfo.SetRef(this.MissionDetailInfoDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_MissionDetailInfo
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
