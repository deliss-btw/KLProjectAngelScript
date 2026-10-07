
namespace UWidget_ForgeWeaponTitle
{
    const int ViewID = 0;

}
class UWidget_ForgeWeaponTitle : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_ForgeWeaponTitle> Title;
    UPROPERTY()
    FGetEUIModelRef TitleDelegate;

    UWidget_ForgeWeaponTitle()
    {
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.Title.Initialize(this, FName("VM_ForgeWeaponTitle"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.TitleDelegate.IsBound())
        {
            this.Title.SetRef(this.TitleDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_ForgeWeaponTitle
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
