
namespace UWidget_MarkMinimapIconTips
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_MarkMinimapIconTips : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_MarkMinimapIconTips> Tips;
    UPROPERTY()
    FGetEUIModelRef TipsDelegate;

    UWidget_MarkMinimapIconTips()
    {
        return;
    }
    UFUNCTION()
    void Tips_GuideToMark() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void Tips_CancelGuide() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void Tips_RemoveMark() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void Tips_ConvertToConstant() const
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
        this.Tips.Initialize(this, FName("VM_MarkMinimapIconTips"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.TipsDelegate.IsBound())
        {
            this.Tips.SetRef(this.TipsDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_MarkMinimapIconTips
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
