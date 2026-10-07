
namespace UWidget_ServerItem
{
    const int ViewID = 0;

}
class UWidget_ServerItem : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_RegionInfo> RegionVM;
    UPROPERTY()
    UWidgetSwitcher w_switcher_state;
    UPROPERTY()
    bool bIsHovered = false;
    UPROPERTY()
    bool bIsSelected = false;
    UPROPERTY()
    UWidget_SelectServer SelectServerPage;
    UPROPERTY()
    FGetEUIModelRef RegionVMDelegate;


    UFUNCTION()
    void OnViewBind_Implementation()
    {
        this.bIsSelected = GetIsSelected();
        int local_2 = this.bIsSelected ? 1 : 0;
        this.w_switcher_state.SetActiveWidgetIndex(local_2);
        return;
    }
    UFUNCTION()
    void OnHover()
    {
        if (!(this.bIsHovered))
        {
            this.bIsHovered = true;
            this.w_switcher_state.SetActiveWidgetIndex(1);
        }
        return;
    }
    UFUNCTION()
    void OnUnhover()
    {
        if (this.bIsHovered)
        {
            this.bIsHovered = false;
            if (!(this.bIsSelected))
            {
                this.w_switcher_state.SetActiveWidgetIndex(0);
            }
        }
        return;
    }
    UFUNCTION()
    void RegionVM_OnRegionInfoClick() const
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
        this.RegionVM.Initialize(this, FName("VM_RegionInfo"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.RegionVMDelegate.IsBound())
        {
            this.RegionVM.SetRef(this.RegionVMDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_ServerItem
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
