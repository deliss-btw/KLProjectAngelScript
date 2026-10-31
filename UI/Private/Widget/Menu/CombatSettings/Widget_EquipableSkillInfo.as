namespace UWidget_EquipableSkillInfo
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_EquipableSkillInfo : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_DivineSkillInfo> EquipableSkillInfo;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_CommonHoverProvider> HoverProvider;
    UPROPERTY()
    TSoftClassPtr<UUserWidget> HoverWidgetClass;
    UPROPERTY()
    bool bCanHoverGoTo = true;
    UPROPERTY()
    UEUIButton HoverBtn;
    UPROPERTY()
    bool bIsEntrance = false;
    UPROPERTY()
    bool bForbidOpenDivineSkill = false;
    UPROPERTY()
    TDataObjectPtr<FEUIWidgetConfig> DivineSkillWidgetConfig;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_RedDot> RedDotVM;
    UPROPERTY()
    FConfigVM_CommonHoverProvider HoverProviderConfig;
    UPROPERTY()
    FConfigVM_RedDot RedDotVMConfig;
    UPROPERTY()
    FGetEUIModelRef EquipableSkillInfoDelegate;
    UPROPERTY()
    FGetEUIModelRef HoverProviderDelegate;
    UPROPERTY()
    FGetEUIModelRef RedDotVMDelegate;

    UFUNCTION()
    void OnViewBind_Implementation()
    {
        FVM_CommonHoverProvider& local_2 = this.HoverProvider.Get();
        if (this.HoverBtn != nullptr && !(local_2.GetbIsForbidHover()))
        {
            local_2.SetHoverForWidget(this.HoverBtn);
            local_2.SetHoverWidgetClass(this.HoverWidgetClass);
        }
        if (this.bIsEntrance)
        {
            this.RedDotVM = FEUIModelRef(::FVM_RedDot::Create(this, FRedDotNodeData(GameplayTags::RedDotSystem_Partner_DivineSkillEntrance, 0)));
        }
        return;
    }
    UFUNCTION()
    void ShowDivineSkillTips()
    {
        if (this.HoverProvider.IsValid())
        {
            if (this.EquipableSkillInfo.IsValid())
            {
                TEUIModelRef<FVM_EquipHoverTips> local_6 = this.EquipableSkillInfo.Get().GetHoverTips();
                local_6.Get().SetbCanHoverGoTo((this.bCanHoverGoTo));
                local_6.Get().SetOverrideClickWidgetConfig(this.DivineSkillWidgetConfig);
                this.HoverProvider.Get().ResetHoverModel(local_6.opImplConv());
                this.HoverProvider.Get().NotifyMouseEnter();
            }
        }
        return;
    }
    UFUNCTION()
    void HideDivineSkillTips()
    {
        if (this.HoverProvider.IsValid())
        {
            FVM_CommonHoverProvider& local_4 = this.HoverProvider.Get();
            if (!(local_4.GetbIsForbidHover()))
            {
                local_4.NotifyMouseLeave();
            }
        }
        return;
    }
    UFUNCTION()
    void OnDivineSkillTipsClicked()
    {
        if (!(this.bForbidOpenDivineSkill) && this.DivineSkillWidgetConfig.IsSet())
        {
            FEUIWidget::AddWidget(this.GetOwningLocalPlayer(), this.DivineSkillWidgetConfig.Get().WidgetTag);
        }
        return;
    }
    UFUNCTION()
    void HoverProvider_NotifyMouseEnter() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void HoverProvider_NotifyMouseLeave() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void HoverProvider_NotifyGamepadFocusReceive() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void HoverProvider_NotifyGamepadFocusLoss() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void HoverProvider_NotifyClick() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void HoverProvider_PinCurrentHover() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void HoverProvider_PinOrOpenPinnedPassThrough() const
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
        this.EquipableSkillInfo.Initialize(this, FName("VM_DivineSkillInfo"), EEUIWidgetRefModelCreationType(0), false);
        this.HoverProvider.Initialize(this, FName("VM_CommonHoverProvider"), EEUIWidgetRefModelCreationType(0), false);
        this.RedDotVM.Initialize(this, FName("VM_RedDot"), EEUIWidgetRefModelCreationType(0), true);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.EquipableSkillInfoDelegate.IsBound())
        {
            this.EquipableSkillInfo.SetRef(this.EquipableSkillInfoDelegate.Execute());
        }
        if (this.HoverProviderDelegate.IsBound())
        {
            this.HoverProvider.SetRef(this.HoverProviderDelegate.Execute());
        }
        if (this.RedDotVMDelegate.IsBound())
        {
            this.RedDotVM.SetRef(this.RedDotVMDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_EquipableSkillInfo
{
void GetModelInfo(FEUIWidgetMetaInfo &inout Result)
{
    Result.WidgetType = UWidget_EquipableSkillInfo;
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
