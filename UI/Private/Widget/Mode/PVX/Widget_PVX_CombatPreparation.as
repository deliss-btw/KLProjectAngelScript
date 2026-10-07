
namespace UWidget_PVX_CombatPreparation
{
    const int ViewID = 0;

}
class UWidget_PVX_CombatPreparation : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_PVX_CombatPreparation> PVX_CombatPreparation;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_AvatarShowcase> Showcase;
    UPROPERTY()
    UEUICommonListViewBase w_list_tab;
    UPROPERTY()
    UEUICommonListViewBase w_list_human;
    UPROPERTY()
    UWidget_AvatarDetails UI_PVX_Comp_AvatarInfo;
    UPROPERTY()
    FEUIActionBinding GoToMatchActionBinding;
    UPROPERTY()
    FEUIActionBinding GamepadNextActionBinding;
    UPROPERTY()
    FEUIActionBinding BackActionBinding;
    UPROPERTY()
    FConfigVM_AvatarShowcase ShowcaseConfig;
    UPROPERTY()
    FGetEUIModelRef PVX_CombatPreparationDelegate;
    UPROPERTY()
    FGetEUIModelRef ShowcaseDelegate;

    UWidget_PVX_CombatPreparation()
    {
        return;
    }
    UFUNCTION()
    void Construct_Implementation()
    {
        this.BackActionBinding.Register(this);
        return;
    }
    UFUNCTION()
    void Destruct_Implementation()
    {
        this.BackActionBinding.UnRegister();
        return;
    }
    UFUNCTION()
    void OnViewBind_Implementation()
    {
        ::FMS_PvpModeState::Get(this).SetbIsPvpMode(true);
        if (this.w_list_tab != nullptr)
        {
            this.w_list_tab.SetSelectedIndex(0);
        }
        TEUIModelRef<FVM_AvatarShowcase> local_8;
        local_8;
        local_8.SetCurrentShowcase();
        return;
    }
    UFUNCTION()
    void OnViewUnbind_Implementation()
    {
        FMS_PvpModeState& local_2 = ::FMS_PvpModeState::Get(this);
        local_2.SetbIsPvpMode(false);
        local_2.SetCurrentPvpAvatarId(0);
        return;
    }
    UFUNCTION()
    void HandleRelatedFocusChanged_Implementation()
    {
        int local_2 = 1;
        int local_1 = local_2;
        if (this.IsPartOfFocusPath(this.w_list_tab))
        {
            int local_2_2 = 0;
            local_1 = local_2_2;
        }
        else
        {
            if (this.IsPartOfFocusPath(this.w_list_human))
            {
                int local_2_3 = 0;
                local_1 = local_2_3;
            }
        }
        this.GamepadNextActionBinding.SetCollapsed((local_1 != 0));
        return;
    }
    UFUNCTION()
    void OnGoToMatchAction()
    {
        FEUIMessageBus::PublishWithWidgetReferencedModels(EUIMessageBus);
        FMsg_PVXSwitchMenuCategory local_2;
        local_2.TargetType = EPVXMenuCategoryType(1);
        return;
    }
    UFUNCTION()
    void OnGamepadNextAction()
    {
        if (this.w_list_tab != nullptr && this.IsPartOfFocusPath(this.w_list_tab))
        {
            this.RuleSetUserFocus(this.w_list_human);
            return;
        }
        if (this.w_list_human != nullptr && this.IsPartOfFocusPath(this.w_list_human))
        {
            this.RuleSetUserFocus(this.UI_PVX_Comp_AvatarInfo);
        }
        return;
    }
    UFUNCTION()
    void OnBackAction()
    {
        bool local_1 = true;
        if ((int(this.GetCurrentInputType())) == 1)
        {
            if (this.UI_PVX_Comp_AvatarInfo != nullptr && this.IsPartOfFocusPath(this.UI_PVX_Comp_AvatarInfo))
            {
                this.RuleSetUserFocus(this.w_list_human);
                local_1 = false;
            }
            else
            {
                if (this.w_list_human != nullptr && this.IsPartOfFocusPath(this.w_list_human))
                {
                    this.RuleSetUserFocus(this.w_list_tab);
                    local_1 = false;
                }
            }
        }
        if (local_1)
        {
            FEUIWidgetRef local_16 = FEUIWidget::FindWidget(this.GetOwningLocalPlayer(), GameplayTags::UI_Type_Mode_PVX_Match);
            if (local_16)
            {
                FEUIWidget::RemoveWidget(local_16);
            }
        }
        return;
    }
    UFUNCTION()
    void PVX_CombatPreparation_OnSelectIllustrateFilter(const int IllustrateFilterItemIndex) const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder::PushArg local_42;
        local_42.opCall(IllustrateFilterItemIndex);
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void PVX_CombatPreparation_OnSelectAvatar(const int AvatarIndex) const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder::PushArg local_42;
        local_42.opCall(AvatarIndex);
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.PVX_CombatPreparation.Initialize(this, FName("VM_PVX_CombatPreparation"), EEUIWidgetRefModelCreationType(0), false);
        this.Showcase.Initialize(this, FName("VM_AvatarShowcase"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.PVX_CombatPreparationDelegate.IsBound())
        {
            this.PVX_CombatPreparation.SetRef(this.PVX_CombatPreparationDelegate.Execute());
        }
        if (this.ShowcaseDelegate.IsBound())
        {
            this.Showcase.SetRef(this.ShowcaseDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_PVX_CombatPreparation
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
