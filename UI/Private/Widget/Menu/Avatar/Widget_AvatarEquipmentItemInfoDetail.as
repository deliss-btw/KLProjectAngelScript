
namespace UWidget_AvatarEquipmentItemInfoDetail
{
    const int ViewID = 0;

}
class UWidget_AvatarEquipmentItemInfoDetail : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_AvatarEquipmentItemInfoDetail> InfoDetail;
    UPROPERTY()
    FGetEUIModelRef InfoDetailDelegate;

    UWidget_AvatarEquipmentItemInfoDetail()
    {
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.InfoDetail.Initialize(this, FName("VM_AvatarEquipmentItemInfoDetail"), EEUIWidgetRefModelCreationType(0), true);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.InfoDetailDelegate.IsBound())
        {
            this.InfoDetail.SetRef(this.InfoDetailDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_AvatarEquipmentItemInfoDetail
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
