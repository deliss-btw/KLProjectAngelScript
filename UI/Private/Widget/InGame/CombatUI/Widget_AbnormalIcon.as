
namespace UWidget_AbnormalIcon
{
    const int ViewID = 0;

}
class UWidget_AbnormalIcon : UEUIUserListItemWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_AbnormalIcon> AbnormalIcon;
    UPROPERTY()
    FGetEUIModelRef AbnormalIconDelegate;

    UWidget_AbnormalIcon()
    {
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.AbnormalIcon.Initialize(this, FName("VM_AbnormalIcon"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.AbnormalIconDelegate.IsBound())
        {
            this.AbnormalIcon.SetRef(this.AbnormalIconDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_AbnormalIcon
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
