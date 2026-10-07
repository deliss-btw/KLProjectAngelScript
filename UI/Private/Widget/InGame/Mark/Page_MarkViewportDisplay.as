
namespace UPage_MarkViewportDisplay
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UPage_MarkViewportDisplay : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_MarkViewportDisplay> MarkViewportDisplay;
    UPROPERTY()
    FGetEUIModelRef MarkViewportDisplayDelegate;

    UPage_MarkViewportDisplay()
    {
        return;
    }
    UFUNCTION()
    TArray<FECSEntity> MarkViewportDisplay_AllMarks() const
    {
        FVM_MarkViewportDisplay& local_2;
        TArray<FECSEntity> local_12;
        if (local_2)
        {
            local_12 = local_2.GetAllMarks();
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
        this.MarkViewportDisplay.Initialize(this, FName("VM_MarkViewportDisplay"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.MarkViewportDisplayDelegate.IsBound())
        {
            this.MarkViewportDisplay.SetRef(this.MarkViewportDisplayDelegate.Execute());
        }
        return;
    }
}

namespace UPage_MarkViewportDisplay
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
