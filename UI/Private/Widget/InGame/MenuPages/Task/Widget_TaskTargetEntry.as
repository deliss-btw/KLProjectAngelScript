
namespace UWidget_TaskTargetEntry
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_TaskTargetEntry : UEUIUserListItemWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_TaskTarget> TaskTarget;
    UPROPERTY()
    FGetEUIModelRef TaskTargetDelegate;

    UWidget_TaskTargetEntry()
    {
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.TaskTarget.Initialize(this, FName("VM_TaskTarget"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.TaskTargetDelegate.IsBound())
        {
            this.TaskTarget.SetRef(this.TaskTargetDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_TaskTargetEntry
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
