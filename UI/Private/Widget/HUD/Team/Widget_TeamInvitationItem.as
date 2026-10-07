
namespace UWidget_TeamInvitationItem
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_TeamInvitationItem : UEUIActivatableWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_TeamInvitationItem> InvitationItem;
    UPROPERTY()
    FEUIActionBinding ConfirimKeyBinding;
    UPROPERTY()
    FEUIActionBinding SelectHeadIconKeyBinding;
    bool bItemSelected = false;
    UPROPERTY()
    FGetEUIModelRef InvitationItemDelegate;


    UFUNCTION()
    void OnItemSelected()
    {
        this.bItemSelected = true;
        this.RefreshActionBindingVisibility();
        return;
    }
    UFUNCTION()
    void OnItemDeselected()
    {
        this.bItemSelected = false;
        this.RefreshActionBindingVisibility();
        return;
    }
    void RefreshActionBindingVisibility()
    {
        bool local_5 = (int(this.GetCurrentInputType()) == 1);
        this.ConfirimKeyBinding.SetCollapsed(!(local_5) || !(this.bItemSelected));
        this.SelectHeadIconKeyBinding.SetCollapsed(!(local_5) || !(this.bItemSelected));
        return;
    }
    UFUNCTION()
    void InvitationItem_OnButtonClick() const
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
        this.InvitationItem.Initialize(this, FName("VM_TeamInvitationItem"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.InvitationItemDelegate.IsBound())
        {
            this.InvitationItem.SetRef(this.InvitationItemDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_TeamInvitationItem
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
