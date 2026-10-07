
namespace UWidget_ImportantTips
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_ImportantTips : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_CommonTips> CommonTips;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_ImportantTips> ImportantTips;
    UPROPERTY()
    FGetEUIModelRef CommonTipsDelegate;
    UPROPERTY()
    FGetEUIModelRef ImportantTipsDelegate;

    UWidget_ImportantTips()
    {
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.CommonTips.Initialize(this, FName("VM_CommonTips"), EEUIWidgetRefModelCreationType(0), false);
        this.ImportantTips.Initialize(this, FName("VM_ImportantTips"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.CommonTipsDelegate.IsBound())
        {
            this.CommonTips.SetRef(this.CommonTipsDelegate.Execute());
        }
        if (this.ImportantTipsDelegate.IsBound())
        {
            this.ImportantTips.SetRef(this.ImportantTipsDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_ImportantTips
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
