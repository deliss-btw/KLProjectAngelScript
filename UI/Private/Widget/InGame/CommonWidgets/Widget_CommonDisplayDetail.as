
namespace UWidget_CommonDisplayDetail
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_CommonDisplayDetail : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_CommonDisplayDetail> DisplayDetail;
    UPROPERTY()
    FGetEUIModelRef DisplayDetailDelegate;

    UWidget_CommonDisplayDetail()
    {
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.DisplayDetail.Initialize(this, FName("VM_CommonDisplayDetail"), EEUIWidgetRefModelCreationType(1), true);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.DisplayDetailDelegate.IsBound())
        {
            this.DisplayDetail.SetRef(this.DisplayDetailDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_CommonDisplayDetail
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
