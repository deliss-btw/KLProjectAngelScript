
namespace UWidget_MinimapTempMarkDialog
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_MinimapTempMarkDialog : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_MinimapTempMarkDialog> MinimapTempMarkDialog;
    UPROPERTY()
    TSoftClassPtr<UWidget_MarkMinimapIcon> DisplayIconWidget;
    FMinimapIconHandle DisplayingIconHandle;
    UPROPERTY()
    FGetEUIModelRef MinimapTempMarkDialogDelegate;

    UWidget_MinimapTempMarkDialog()
    {
        return;
    }
    UFUNCTION()
    void Tick_Implementation(const FGeometry &inout MyGeometry, const float32 InDeltaTime)
    {
        if (!(::MinimapUtils::IsValidHandle(this.DisplayingIconHandle)) && this.MinimapTempMarkDialog.IsValid())
        {
            FMinimapIconInfo local_46 = ::MarkUtil::BuildIconInfoFromMarkConfigForUIDisplay(::MarkUtil::GetMarkConfigSetting().MinimapTempMark, this.DisplayIconWidget);
            local_46.WorldPosition = GetMarkWorldPosition();
            this.DisplayingIconHandle = ::MinimapUtils::AddSystemIcon(local_46);
        }
        return;
    }
    UFUNCTION()
    void Destruct_Implementation()
    {
        ::MinimapUtils::UnregisterIcon(this.DisplayingIconHandle);
        return;
    }
    UFUNCTION()
    void MinimapTempMarkDialog_MarkAndGuide() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void MinimapTempMarkDialog_SwitchToConstantMark() const
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
        this.MinimapTempMarkDialog.Initialize(this, FName("VM_MinimapTempMarkDialog"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.MinimapTempMarkDialogDelegate.IsBound())
        {
            this.MinimapTempMarkDialog.SetRef(this.MinimapTempMarkDialogDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_MinimapTempMarkDialog
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
