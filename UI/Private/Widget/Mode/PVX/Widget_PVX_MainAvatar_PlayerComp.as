
namespace UWidget_PVX_MainAvatar_PlayerComp
{
    const int ViewID = 0;

}
class UWidget_PVX_MainAvatar_PlayerComp : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_PVX_MainAvatar_PlayerComp> PVX_MainAvatar_PlayerComp;
    UPROPERTY()
    FGetEUIModelRef PVX_MainAvatar_PlayerCompDelegate;

    UWidget_PVX_MainAvatar_PlayerComp()
    {
        return;
    }
    UFUNCTION()
    void Construct_Implementation()
    {
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.PVX_MainAvatar_PlayerComp.Initialize(this, FName("VM_PVX_MainAvatar_PlayerComp"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.PVX_MainAvatar_PlayerCompDelegate.IsBound())
        {
            this.PVX_MainAvatar_PlayerComp.SetRef(this.PVX_MainAvatar_PlayerCompDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_PVX_MainAvatar_PlayerComp
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
