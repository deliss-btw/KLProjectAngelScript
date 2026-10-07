
namespace UWidget_MissionObjectiveInfo
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_MissionObjectiveInfo : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_ObjectiveInfo> ObjectiveInfo;
    UPROPERTY()
    FGetEUIModelRef ObjectiveInfoDelegate;

    UWidget_MissionObjectiveInfo()
    {
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.ObjectiveInfo.Initialize(this, FName("VM_ObjectiveInfo"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.ObjectiveInfoDelegate.IsBound())
        {
            this.ObjectiveInfo.SetRef(this.ObjectiveInfoDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_MissionObjectiveInfo
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
