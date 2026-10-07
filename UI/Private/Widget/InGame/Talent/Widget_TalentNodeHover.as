
namespace UWidget_TalentNodeHover
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_TalentNodeHover : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_TalentNodeHover> TalentNodeHover;
    UPROPERTY()
    FGetEUIModelRef TalentNodeHoverDelegate;

    UWidget_TalentNodeHover()
    {
        return;
    }
    UFUNCTION()
    void TalentNodeHover_OpenDetails() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void TalentNodeHover_SwitchChoice() const
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
        this.TalentNodeHover.Initialize(this, FName("VM_TalentNodeHover"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.TalentNodeHoverDelegate.IsBound())
        {
            this.TalentNodeHover.SetRef(this.TalentNodeHoverDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_TalentNodeHover
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
