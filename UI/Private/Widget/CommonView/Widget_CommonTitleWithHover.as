
namespace UWidget_CommonTitleWithHover
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_CommonTitleWithHover : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_TitleAndDesc> HoverTipsVM;
    UPROPERTY()
    UWidget_CommonHoverProvider w_tips;
    UPROPERTY()
    bool bClickForExecute = false;
    UPROPERTY()
    FGameplayTag SubPageTag;
    UPROPERTY()
    FGetEUIModelRef HoverTipsVMDelegate;


    UFUNCTION()
    void OnViewBind_Implementation()
    {
        if (this.bClickForExecute && this.SubPageTag.IsValid())
        {
            this.SubPageTag.SetSubPageConfig();
            bool local_1 = true;
            local_1.SetbClickForExecute();
        }
        return;
    }
    UFUNCTION()
    void HoverTipsVM_ExecuteOnClickGoTo() const
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
        this.HoverTipsVM.Initialize(this, FName("VM_TitleAndDesc"), EEUIWidgetRefModelCreationType(0), true);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.HoverTipsVMDelegate.IsBound())
        {
            this.HoverTipsVM.SetRef(this.HoverTipsVMDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_CommonTitleWithHover
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
