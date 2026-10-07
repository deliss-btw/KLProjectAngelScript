
namespace UWidget_AvatarSelectBar
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_AvatarSelectBar : UEUIActivatableWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_AvatarSelectBar> AvatarSelectBar;
    UPROPERTY()
    FGetEUIModelRef AvatarSelectBarDelegate;

    UWidget_AvatarSelectBar()
    {
        return;
    }
    UFUNCTION()
    TArray<FEUIModelWeakRef> AvatarSelectBar_AvatarList() const
    {
        FVM_AvatarSelectBar& local_2;
        TArray<FEUIModelWeakRef> local_16;
        if (local_2)
        {
            local_16 = EUIInternal::AsWeakRefList(local_2.GetAvatarList());
        }
        else
        {
            local_16 = TArray<FEUIModelWeakRef>();
        }
        return local_16;
    }
    UFUNCTION()
    void AvatarSelectBar_SelectNextAvatar() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void AvatarSelectBar_SelectPrevAvatar() const
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
        this.AvatarSelectBar.Initialize(this, FName("VM_AvatarSelectBar"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.AvatarSelectBarDelegate.IsBound())
        {
            this.AvatarSelectBar.SetRef(this.AvatarSelectBarDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_AvatarSelectBar
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
