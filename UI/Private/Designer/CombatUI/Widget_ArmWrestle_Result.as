
namespace UWidget_ArmWrestle_Result
{
    const int ViewID = 0;

}
class UWidget_ArmWrestle_Result : UEUIUserListItemWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_ArmWrestle_Result> VM_ArmWrestle_Result;
    UPROPERTY()
    FGetEUIModelRef VM_ArmWrestle_ResultDelegate;

    UWidget_ArmWrestle_Result()
    {
        return;
    }
    UFUNCTION()
    void Construct_Implementation()
    {
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.VM_ArmWrestle_Result.Initialize(this, FName("VM_ArmWrestle_Result"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.VM_ArmWrestle_ResultDelegate.IsBound())
        {
            this.VM_ArmWrestle_Result.SetRef(this.VM_ArmWrestle_ResultDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_ArmWrestle_Result
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
