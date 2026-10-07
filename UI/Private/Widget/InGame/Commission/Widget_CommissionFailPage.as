
namespace UWidget_CommissionFailPage
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_CommissionFailPage : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_CommissionFail> CommissionFail;
    UPROPERTY()
    UTextBlock TextBlock_LeaveTips;
    FString LeaveTipsTemplate;
    float ShowStartTime;
    UPROPERTY()
    FGetEUIModelRef CommissionFailDelegate;

    UWidget_CommissionFailPage()
    {
        return;
    }
    UFUNCTION()
    void Construct_Implementation()
    {
        this.LeaveTipsTemplate = this.TextBlock_LeaveTips.GetText().ToString();
        this.ShowStartTime = this.GetWorld().GetTimeSeconds();
        return;
    }
    UFUNCTION()
    void Tick_Implementation(const FGeometry &inout MyGeometry, const float32 InDeltaTime)
    {
        this.TextBlock_LeaveTips.SetText(FText::FromString(this.LeaveTipsTemplate.Replace("{Time}", String::Conv_IntToString(FMath::CeilToInt(FMath::Max(0.0, GetLeaveTime() - (this.GetWorld().GetTimeSeconds() - this.ShowStartTime)))), ESearchCase(1))));
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.CommissionFail.Initialize(this, FName("VM_CommissionFail"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.CommissionFailDelegate.IsBound())
        {
            this.CommissionFail.SetRef(this.CommissionFailDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_CommissionFailPage
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
