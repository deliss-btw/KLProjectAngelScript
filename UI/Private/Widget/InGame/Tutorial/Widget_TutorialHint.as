
namespace UWidget_TutorialHint
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_TutorialHint : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_TutorialHint> HintVM;
    UPROPERTY()
    UEUIInputButtonBase UI_Common_Key;
    UPROPERTY()
    FGetEUIModelRef HintVMDelegate;

    UWidget_TutorialHint()
    {
        return;
    }
    UFUNCTION()
    void OnViewBind_Implementation()
    {
        this.RefreshHintAction();
        return;
    }
    UFUNCTION()
    void OnHintActionPressed()
    {
        if (this.HintVM.IsValid())
        {
            this.HintVM.opArrow().OpenManualDetail();
        }
        return;
    }
    void RefreshHintAction()
    {
        int local_4;
        if (!(this.HintVM.IsValid()))
        {
            return;
        }
        if ((this.HintVM.opArrow().GetbShowAction() && !(this.HintVM.opArrow().GetHintInputAction().IsNull())))
        {
            int local_5;
            local_5 = 4;
            local_4 = local_5;
        }
        else
        {
            int local_5;
            local_5 = 1;
            local_4 = local_5;
        }
        this.UI_Common_Key.SetVisibility(ESlateVisibility(local_4));
        return;
    }
    UFUNCTION()
    void HintVM_OpenManualDetail() const
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
        this.HintVM.Initialize(this, FName("VM_TutorialHint"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.HintVMDelegate.IsBound())
        {
            this.HintVM.SetRef(this.HintVMDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_TutorialHint
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
