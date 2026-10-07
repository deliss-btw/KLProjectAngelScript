
namespace UWidget_AvatarBuild
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_AvatarBuild : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_MainMenuAvatarBuildTypeEntry> EntryDesc;
    UPROPERTY()
    FGetEUIModelRef EntryDescDelegate;

    UWidget_AvatarBuild()
    {
        return;
    }
    UFUNCTION()
    void EntryDesc_OnHoverChanged(const bool bIsHover) const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder::PushArg local_42;
        local_42.opCall(bIsHover);
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void EntryDesc_OnEntryClick() const
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
        this.EntryDesc.Initialize(this, FName("VM_MainMenuAvatarBuildTypeEntry"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.EntryDescDelegate.IsBound())
        {
            this.EntryDesc.SetRef(this.EntryDescDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_AvatarBuild
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
