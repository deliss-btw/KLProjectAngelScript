
namespace UWidget_LevelUpPopup
{
    const int ViewID = 0;

}
class UWidget_LevelUpPopup : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_LevelUp> LevelUp;
    UPROPERTY()
    float32 ShowDuration = 3.0f;
    UPROPERTY()
    FGetEUIModelRef LevelUpDelegate;


    UFUNCTION()
    void Construct_Implementation()
    {
        System::SetTimer(this, n"OnShowDurationEnd", this.ShowDuration, false, false, 0.0f, 0.0f);
        return;
    }
    UFUNCTION()
    void OnShowDurationEnd()
    {
        this.ClosePage(false);
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.LevelUp.Initialize(this, FName("VM_LevelUp"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.LevelUpDelegate.IsBound())
        {
            this.LevelUp.SetRef(this.LevelUpDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_LevelUpPopup
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
