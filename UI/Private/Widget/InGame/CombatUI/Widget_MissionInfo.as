
namespace UWidget_MissionInfo
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_MissionInfo : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVMS_Commission> Commission;

    UWidget_MissionInfo()
    {
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.Commission.Initialize(this, FName("VMS_Commission"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        return;
    }
}

namespace UWidget_MissionInfo
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
