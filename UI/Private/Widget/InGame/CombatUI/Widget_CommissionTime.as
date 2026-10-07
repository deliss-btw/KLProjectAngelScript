
namespace UWidget_CommissionTime
{
    const int ViewID = 0;
}
namespace UWidget_CommissionTimeHover
{
    const int ViewID = 0;

}
class UWidget_CommissionTime : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVMS_CommissionTime> CommissionTime;
    UPROPERTY()
    UWidget_CommonHoverProvider UI_Common_HoverProvider;

    UWidget_CommissionTime()
    {
        return;
    }
    UFUNCTION()
    void OnViewBind_Implementation()
    {
        if (this.UI_Common_HoverProvider != nullptr)
        {
            this.UI_Common_HoverProvider.OnHoverIntent.Unbind(this, n"OnHoverProviderHoverIntent");
            this.UI_Common_HoverProvider.OnHoverIntent.AddUFunction(this, n"OnHoverProviderHoverIntent");
        }
        return;
    }
    UFUNCTION()
    void OnViewUnbind_Implementation()
    {
        if (this.UI_Common_HoverProvider != nullptr)
        {
            this.UI_Common_HoverProvider.OnHoverIntent.Unbind(this, n"OnHoverProviderHoverIntent");
        }
        return;
    }
    UFUNCTION()
    void OnHoverProviderHoverIntent()
    {
        if (this.UI_Common_HoverProvider == nullptr || !(this.CommissionTime.IsValid()))
        {
            return;
        }
        FEUIModelContainer local_18;
        local_18.MakeHoverModels();
        this.UI_Common_HoverProvider.SetHoverModels(local_18);
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.CommissionTime.Initialize(this, FName("VMS_CommissionTime"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        return;
    }
}

class UWidget_CommissionTimeHover : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_CommissionTimeHover> CommissionTimeHover;
    UPROPERTY()
    FGetEUIModelRef CommissionTimeHoverDelegate;

    UWidget_CommissionTimeHover()
    {
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.CommissionTimeHover.Initialize(this, FName("VM_CommissionTimeHover"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.CommissionTimeHoverDelegate.IsBound())
        {
            this.CommissionTimeHover.SetRef(this.CommissionTimeHoverDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_CommissionTime
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
namespace UWidget_CommissionTimeHover
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
