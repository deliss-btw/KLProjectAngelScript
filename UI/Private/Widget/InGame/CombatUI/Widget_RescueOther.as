
namespace UWidget_RescueOther
{
    const int ViewID = 0;
}
namespace UWidget_RevivalTimeProgressBar
{
    const int ViewID = 0;

}
class UWidget_RescueOther : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_RescueOther> VM_NearDeath;
    UPROPERTY()
    FGetEUIModelRef VM_NearDeathDelegate;

    UWidget_RescueOther()
    {
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.VM_NearDeath.Initialize(this, FName("VM_RescueOther"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.VM_NearDeathDelegate.IsBound())
        {
            this.VM_NearDeath.SetRef(this.VM_NearDeathDelegate.Execute());
        }
        return;
    }
}

class UWidget_RevivalTimeProgressBar : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_RevivalTimeProgressBar> VM_RevivalTimeProgressBar;
    UPROPERTY()
    FColor ProgressBarColor = FColor::White;
    UPROPERTY()
    UProgressBar ProgressBar;
    UPROPERTY()
    FGetEUIModelRef VM_RevivalTimeProgressBarDelegate;

    UWidget_RevivalTimeProgressBar()
    {
        return;
    }
    UFUNCTION()
    void PreConstruct_Implementation(const bool IsDesignTime)
    {
        this.ProgressBar.SetFillColorAndOpacity(FLinearColor(this.ProgressBarColor));
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.VM_RevivalTimeProgressBar.Initialize(this, FName("VM_RevivalTimeProgressBar"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.VM_RevivalTimeProgressBarDelegate.IsBound())
        {
            this.VM_RevivalTimeProgressBar.SetRef(this.VM_RevivalTimeProgressBarDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_RescueOther
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
namespace UWidget_RevivalTimeProgressBar
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
