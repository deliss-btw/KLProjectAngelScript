
namespace UWidget_SpecialtyItem
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_SpecialtyItem : UEUIUserListItemWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_SpecialtyItem> SpecialtyItemModel;
    UPROPERTY()
    FGetEUIModelRef SpecialtyItemModelDelegate;

    UWidget_SpecialtyItem()
    {
        return;
    }
    UFUNCTION()
    void SpecialtyItemModel_OnClickItem() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void SpecialtyItemModel_OnHoverEnter() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void SpecialtyItemModel_OnHoverExit() const
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
        this.SpecialtyItemModel.Initialize(this, FName("VM_SpecialtyItem"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.SpecialtyItemModelDelegate.IsBound())
        {
            this.SpecialtyItemModel.SetRef(this.SpecialtyItemModelDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_SpecialtyItem
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
