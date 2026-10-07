
namespace UWidget_MobilePageEntrance
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_MobilePageEntrance : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_MobilePageEntrance> MobilePageEntrance;
    UPROPERTY()
    FConfigVM_MobilePageEntrance MobilePageEntranceConfig;
    UPROPERTY()
    FGetEUIModelRef MobilePageEntranceDelegate;

    UWidget_MobilePageEntrance()
    {
        return;
    }
    UFUNCTION()
    void MobilePageEntrance_OpenPage() const
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
        this.MobilePageEntrance.Initialize(this, FName("VM_MobilePageEntrance"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.MobilePageEntranceDelegate.IsBound())
        {
            this.MobilePageEntrance.SetRef(this.MobilePageEntranceDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_MobilePageEntrance
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
