
namespace UPage_EntityDialogPanel
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UPage_EntityDialogPanel : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVMS_EntityDialogPanel> EntityDialogPanel;

    UPage_EntityDialogPanel()
    {
        return;
    }
    UFUNCTION()
    TArray<FECSEntity> EntityDialogPanel_Speakers() const
    {
        FVMS_EntityDialogPanel& local_2;
        TArray<FECSEntity> local_12;
        if (local_2)
        {
            local_12 = local_2.GetSpeakers();
        }
        else
        {
            local_12 = TArray<FECSEntity>();
        }
        return local_12;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.EntityDialogPanel.Initialize(this, FName("VMS_EntityDialogPanel"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        return;
    }
}

namespace UPage_EntityDialogPanel
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
