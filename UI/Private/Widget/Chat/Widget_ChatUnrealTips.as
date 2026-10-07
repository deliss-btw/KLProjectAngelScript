
namespace UWidget_ChatUnReadTips
{
    const int ViewID = 0;

}
class UWidget_ChatUnReadTips : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_ChatUnReadTips> UnReadTips;
    UPROPERTY()
    FGetEUIModelRef UnReadTipsDelegate;

    UWidget_ChatUnReadTips()
    {
        return;
    }
    UFUNCTION()
    void UnReadTips_OnReadBtnClicked() const
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
        this.UnReadTips.Initialize(this, FName("VM_ChatUnReadTips"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.UnReadTipsDelegate.IsBound())
        {
            this.UnReadTips.SetRef(this.UnReadTipsDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_ChatUnReadTips
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
