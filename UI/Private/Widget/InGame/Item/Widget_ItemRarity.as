
namespace UWidget_ItemRarity
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_ItemRarity : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_ItemRarity> ItemRarity;
    UPROPERTY()
    FGetEUIModelRef ItemRarityDelegate;

    UWidget_ItemRarity()
    {
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.ItemRarity.Initialize(this, FName("VM_ItemRarity"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.ItemRarityDelegate.IsBound())
        {
            this.ItemRarity.SetRef(this.ItemRarityDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_ItemRarity
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
