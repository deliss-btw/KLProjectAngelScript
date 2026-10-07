
namespace UWidget_AvatarEquipmentItemInfoCompare
{
    const int ViewID = 0;

}
class UWidget_AvatarEquipmentItemInfoCompare : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_AvatarEquipmentItemInfoCompare> InfoCompare;
    UPROPERTY()
    FGetEUIModelRef InfoCompareDelegate;

    UWidget_AvatarEquipmentItemInfoCompare()
    {
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.InfoCompare.Initialize(this, FName("VM_AvatarEquipmentItemInfoCompare"), EEUIWidgetRefModelCreationType(0), true);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.InfoCompareDelegate.IsBound())
        {
            this.InfoCompare.SetRef(this.InfoCompareDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_AvatarEquipmentItemInfoCompare
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
