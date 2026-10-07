
namespace UWidget_DamageType
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_DamageType : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_DamageType> DamageType;
    UPROPERTY()
    FGetEUIModelRef DamageTypeDelegate;

    UWidget_DamageType()
    {
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.DamageType.Initialize(this, FName("VM_DamageType"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.DamageTypeDelegate.IsBound())
        {
            this.DamageType.SetRef(this.DamageTypeDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_DamageType
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
