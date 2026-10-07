
namespace UWidget_LevelAreaEvent
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_LevelAreaEvent : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVMS_LevelAreaEvent> LevelAreaEvent;

    UWidget_LevelAreaEvent()
    {
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.LevelAreaEvent.Initialize(this, FName("VMS_LevelAreaEvent"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        return;
    }
}

namespace UWidget_LevelAreaEvent
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
