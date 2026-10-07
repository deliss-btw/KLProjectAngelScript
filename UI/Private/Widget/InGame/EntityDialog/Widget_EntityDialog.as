
namespace UWidget_EntityDialog
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_EntityDialog : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_EntityDialog> EntityDialog;
    UPROPERTY()
    FGetEUIModelRef EntityDialogDelegate;

    UWidget_EntityDialog()
    {
        return;
    }
    UFUNCTION()
    void SetEntity_Implementation(const FECSEntity &inout Entity)
    {
        this.EntityDialog.SetRef(TEUIModelRef<FVM_EntityDialog>(::FVM_EntityDialog::Create(this, Entity)));
        return;
    }
    UFUNCTION()
    bool OverrideIconLocation_Implementation(const FECSEntity &inout Entity, FVector &out OverrideLocation) const
    {
        FVector local_6;
        OverrideLocation = local_6;
        OverrideLocation = FTransformUtils::GetOffsetRefLocation(Entity, FTransformUtils::GetTransform(Entity, FFPTime(-1)), EOffsetRefType(2));
        return true;
    }
    UFUNCTION()
    FText EntityDialog_DialogText() const
    {
        FVM_EntityDialog& local_2;
        FText local_16;
        if (local_2)
        {
            local_16 = local_2.GetDialogText();
        }
        else
        {
            local_16 = FText();
        }
        return local_16;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.EntityDialog.Initialize(this, FName("VM_EntityDialog"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.EntityDialogDelegate.IsBound())
        {
            this.EntityDialog.SetRef(this.EntityDialogDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_EntityDialog
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
