
namespace UWidget_AvatarSpecialtyHoverItem
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_AvatarSpecialtyHoverItem : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_AvatarInfo> Avatar;
    UPROPERTY()
    FGetEUIModelRef AvatarDelegate;

    UWidget_AvatarSpecialtyHoverItem()
    {
        return;
    }
    UFUNCTION()
    void OnChangeAvatarSpecialty()
    {
        if (this.Avatar.IsNull() || !(GetAvatarConfig().IsSet()))
        {
            return;
        }
        OnChangeSpecialty();
        return;
    }
    UFUNCTION()
    void Avatar_OnChangeSpecialty() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void Avatar_OnCurrentAvatarsChanged() const
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
        this.Avatar.Initialize(this, FName("VM_AvatarInfo"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.AvatarDelegate.IsBound())
        {
            this.Avatar.SetRef(this.AvatarDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_AvatarSpecialtyHoverItem
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
