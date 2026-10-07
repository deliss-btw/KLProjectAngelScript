
namespace UWidget_StigmataGifts
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_StigmataGifts : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_StigmataGifts> StigmataGifts;
    UPROPERTY()
    FGetEUIModelRef StigmataGiftsDelegate;

    UWidget_StigmataGifts()
    {
        return;
    }
    UFUNCTION()
    FText StigmataGifts_UnlockPercentText() const
    {
        FVM_StigmataGifts& local_2;
        FText local_12 = local_2 ? local_2.GetUnlockPercentText() : FText();
        return local_12;
    }
    UFUNCTION()
    float32 StigmataGifts_UnlockPercent() const
    {
        FVM_StigmataGifts& local_2;
        return local_2 ? local_2.GetUnlockPercent() : 0.0f;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.StigmataGifts.Initialize(this, FName("VM_StigmataGifts"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.StigmataGiftsDelegate.IsBound())
        {
            this.StigmataGifts.SetRef(this.StigmataGiftsDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_StigmataGifts
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
