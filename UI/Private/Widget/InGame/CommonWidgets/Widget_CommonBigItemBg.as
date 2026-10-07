
namespace UWidget_CommonBigItemBg
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_CommonBigItemBg : UEUIUserWidget
{
    UPROPERTY()
    UWidgetSwitcher w_switcher_state;
    bool bHovered = false;
    bool bSelected = false;


    UFUNCTION()
    void OnViewBind_Implementation()
    {
        this.RefreshState();
        return;
    }
    UFUNCTION()
    void OnMouseEnter_Implementation(const FGeometry &inout MyGeometry, const FPointerEvent &inout MouseEvent)
    {
        this.bHovered = true;
        this.RefreshState();
        return;
    }
    UFUNCTION()
    void OnMouseLeave_Implementation(const FPointerEvent &inout MouseEvent)
    {
        this.bHovered = false;
        this.RefreshState();
        return;
    }
    void SetSelected(const bool bInSelected)
    {
        if (!(this.bSelected) == !(bInSelected))
        {
            return;
        }
        this.bSelected = bInSelected;
        this.RefreshState();
        return;
    }
    void RefreshState()
    {
        int local_8;
        if (this.w_switcher_state == nullptr)
        {
            return;
        }
        if (this.bSelected)
        {
            local_8 = 2;
        }
        else
        {
            local_8 = this.bHovered ? 1 : 0;
        }
        this.w_switcher_state.SetActiveWidgetIndex(local_8);
        return;
    }
}

namespace UWidget_CommonBigItemBg
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
