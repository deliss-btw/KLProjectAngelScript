
namespace UWidget_Mode_EntranceItem
{
    const int ViewID = 0;

}
class UWidget_Mode_EntranceItem : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_Mode_EntranceItem> Mode_EntranceItem;
    UPROPERTY()
    UEUIButton w_btn_enter;
    UPROPERTY()
    FConfigVM_Mode_EntranceItem Mode_EntranceItemConfig;
    UPROPERTY()
    FGetEUIModelRef Mode_EntranceItemDelegate;

    UWidget_Mode_EntranceItem()
    {
        return;
    }
    UFUNCTION()
    void Construct_Implementation()
    {
        if (this.w_btn_enter != nullptr)
        {
            this.w_btn_enter.OnHovered.AddUFunction(this, n"OnHovered");
            this.w_btn_enter.OnClicked.AddUFunction(this, n"OnClicked");
        }
        return;
    }
    UFUNCTION()
    void Destruct_Implementation()
    {
        if (this.w_btn_enter != nullptr)
        {
            this.w_btn_enter.OnHovered.Unbind(this, n"OnHovered");
            this.w_btn_enter.OnClicked.Unbind(this, n"OnClicked");
        }
        return;
    }
    UFUNCTION()
    void OnHovered()
    {
        int local_2 = 0;
        FEUIMessageBus::PublishWithWidgetReferencedModels(EUIMessageBus);
        TEUIModelWeakRef<FVM_Mode_EntranceItem> local_8;
        local_2.HoveredModeItem = local_8;
        return;
    }
    UFUNCTION()
    void OnClicked()
    {
        int local_2 = 0;
        FEUIMessageBus::PublishWithWidgetReferencedModels(EUIMessageBus);
        TEUIModelWeakRef<FVM_Mode_EntranceItem> local_8;
        local_2.ClickedModeItem = local_8;
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.Mode_EntranceItem.Initialize(this, FName("VM_Mode_EntranceItem"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.Mode_EntranceItemDelegate.IsBound())
        {
            this.Mode_EntranceItem.SetRef(this.Mode_EntranceItemDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_Mode_EntranceItem
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
