
namespace UWidget_Match_HintComp
{
    const int ViewID = 0;

}
class UWidget_Match_HintComp : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_Match_HintComp> Match_HintComp;
    UPROPERTY()
    bool bShowJumpAction = false;
    UPROPERTY()
    FEUIActionBinding JumpActionBinding;
    UPROPERTY()
    FGetEUIModelRef Match_HintCompDelegate;


    UFUNCTION()
    void Construct_Implementation()
    {
        if (this.bShowJumpAction)
        {
            this.JumpActionBinding.Register(this, n"JumpToMatchAction");
        }
        return;
    }
    UFUNCTION()
    void JumpToMatchAction()
    {
        if (this.Match_HintComp.IsValid())
        {
            JumpToMatch();
        }
        return;
    }
    UFUNCTION()
    void Match_HintComp_JumpToMatch() const
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
        this.Match_HintComp.Initialize(this, FName("VM_Match_HintComp"), EEUIWidgetRefModelCreationType(0), true);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.Match_HintCompDelegate.IsBound())
        {
            this.Match_HintComp.SetRef(this.Match_HintCompDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_Match_HintComp
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
