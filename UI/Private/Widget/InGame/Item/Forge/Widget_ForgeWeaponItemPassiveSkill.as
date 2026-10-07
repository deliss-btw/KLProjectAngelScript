
namespace UWidget_ForgeWeaponItemPassiveSkill
{
    const int ViewID = 0;

}
class UWidget_ForgeWeaponItemPassiveSkill : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_ForgeWeaponItemPassiveSkill> PassiveSkill;
    UPROPERTY()
    FGetEUIModelRef PassiveSkillDelegate;

    UWidget_ForgeWeaponItemPassiveSkill()
    {
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.PassiveSkill.Initialize(this, FName("VM_ForgeWeaponItemPassiveSkill"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.PassiveSkillDelegate.IsBound())
        {
            this.PassiveSkill.SetRef(this.PassiveSkillDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_ForgeWeaponItemPassiveSkill
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
