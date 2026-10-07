
namespace UWidget_AvatarEquipmentItemInfoTitle
{
    const int ViewID = 0;

}
class UWidget_AvatarEquipmentItemInfoTitle : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_AvatarEquipmentItemInfoTitle> InfoTitle;
    UPROPERTY()
    FGetEUIModelRef InfoTitleDelegate;

    UWidget_AvatarEquipmentItemInfoTitle()
    {
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.InfoTitle.Initialize(this, FName("VM_AvatarEquipmentItemInfoTitle"), EEUIWidgetRefModelCreationType(0), true);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.InfoTitleDelegate.IsBound())
        {
            this.InfoTitle.SetRef(this.InfoTitleDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_AvatarEquipmentItemInfoTitle
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
