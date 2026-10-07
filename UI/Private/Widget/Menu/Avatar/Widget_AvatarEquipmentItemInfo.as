
namespace UWidget_AvatarEquipmentItemInfo
{
    const int ViewID = 0;

}
class UWidget_AvatarEquipmentItemInfo : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_AvatarEquipmentItemInfo> Info;
    UPROPERTY()
    FEUIActionBinding GoToActionBinding;
    UPROPERTY()
    FGetEUIModelRef InfoDelegate;

    UWidget_AvatarEquipmentItemInfo()
    {
        return;
    }
    void RegisterGoToAction(const UWidget WidgetContext)
    {
        this.GoToActionBinding.Register(WidgetContext);
        return;
    }
    void UnregisterGoToAction()
    {
        this.GoToActionBinding.UnRegister();
        return;
    }
    UFUNCTION()
    void Info_OnGoToEquipmentPage() const
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
        this.Info.Initialize(this, FName("VM_AvatarEquipmentItemInfo"), EEUIWidgetRefModelCreationType(0), true);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.InfoDelegate.IsBound())
        {
            this.Info.SetRef(this.InfoDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_AvatarEquipmentItemInfo
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
