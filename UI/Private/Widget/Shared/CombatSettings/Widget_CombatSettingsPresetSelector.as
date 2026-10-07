
namespace UWidget_CombatSettingsPresetSelector
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_CombatSettingsPresetSelector : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_CombatSettingPresetSelector> CombatSettingPresetSelector;
    UPROPERTY()
    FGetEUIModelRef CombatSettingPresetSelectorDelegate;

    UWidget_CombatSettingsPresetSelector()
    {
        return;
    }
    UFUNCTION()
    void OnViewBind_Implementation()
    {
        FVMS_CombatSettingPresetSelectorCache& local_2 = ::FVMS_CombatSettingPresetSelectorCache::Get(this);
        if (local_2)
        {
            TEUIModelRef<FVM_CombatSettingPresetSelector> local_8 = local_2.GetCombatSettingPresetSelector();
            TEUIModelRef<FVM_CombatSettingPresetSelector> local_6;
            if (local_6)
            {
                this.CombatSettingPresetSelector.SetRef(local_6);
            }
            else
            {
                FVM_CombatSettingPresetSelector& local_10 = ::FVM_CombatSettingPresetSelector::Create(this);
                this.CombatSettingPresetSelector.SetRef(TEUIModelRef<FVM_CombatSettingPresetSelector>(local_10));
                local_2.SetCombatSettingPresetSelector(TEUIModelRef<FVM_CombatSettingPresetSelector>(local_10));
            }
        }
        return;
    }
    UFUNCTION()
    void CombatSettingPresetSelector_OnPresetSelected(const int Index) const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder::PushArg local_42;
        local_42.opCall(Index);
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.CombatSettingPresetSelector.Initialize(this, FName("VM_CombatSettingPresetSelector"), EEUIWidgetRefModelCreationType(0), true);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.CombatSettingPresetSelectorDelegate.IsBound())
        {
            this.CombatSettingPresetSelector.SetRef(this.CombatSettingPresetSelectorDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_CombatSettingsPresetSelector
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
