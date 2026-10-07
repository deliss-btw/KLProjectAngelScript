
namespace UWidget_CommonBGItemMenu
{
    const int ViewID = 0;

}
class UWidget_CommonBGItemMenu : UEUIUserListItemWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_CommonBGItemMenu> CommonBGItemMenu;
    UPROPERTY()
    FGetEUIModelRef CommonBGItemMenuDelegate;

    UWidget_CommonBGItemMenu()
    {
        return;
    }
    UFUNCTION()
    FText CommonBGItemMenu_DisplayText() const
    {
        FVM_CommonBGItemMenu& local_2;
        FText local_12 = local_2 ? local_2.GetDisplayText() : FText();
        return local_12;
    }
    UFUNCTION()
    float32 CommonBGItemMenu_ForbiddenOpacity() const
    {
        FVM_CommonBGItemMenu& local_2;
        return local_2 ? local_2.GetForbiddenOpacity() : 0.0f;
    }
    UFUNCTION()
    int CommonBGItemMenu_HoveredIndex() const
    {
        FVM_CommonBGItemMenu& local_2;
        return local_2 ? local_2.GetHoveredIndex() : 0;
    }
    UFUNCTION()
    void CommonBGItemMenu_OnButtonClicked() const
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
        this.CommonBGItemMenu.Initialize(this, FName("VM_CommonBGItemMenu"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.CommonBGItemMenuDelegate.IsBound())
        {
            this.CommonBGItemMenu.SetRef(this.CommonBGItemMenuDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_CommonBGItemMenu
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
