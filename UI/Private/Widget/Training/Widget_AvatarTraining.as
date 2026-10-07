
namespace UWidget_AvatarTraining
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_AvatarTraining : UEUIActivatableWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_AvatarTraining> AvatarTrainingVM;
    UPROPERTY()
    FGetEUIModelRef AvatarTrainingVMDelegate;

    UWidget_AvatarTraining()
    {
        return;
    }
    UFUNCTION()
    void AvatarTrainingVM_OnSelectIndexChanged(const int Index) const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder::PushArg local_42;
        local_42.opCall(Index);
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.AvatarTrainingVM.Initialize(this, FName("VM_AvatarTraining"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.AvatarTrainingVMDelegate.IsBound())
        {
            this.AvatarTrainingVM.SetRef(this.AvatarTrainingVMDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_AvatarTraining
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
