
namespace UWidget_EquipableSkillSettings
{
    const int ViewID = 0;
}
namespace UWidget_EquipableDivineSkillDescription
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_EquipableSkillSettings : UEUIActivatableWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_DivineSkillSettings> EquipableSkillSettings;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_CommonHoverProvider> HoverProvider;
    UPROPERTY()
    TSoftClassPtr<UUserWidget> HoverWidgetClass;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_AvatarShowcase> AvatarShowcase;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_DivineSkillInfo> SelectedDivineSkill;
    UPROPERTY()
    UEUIButton HoverBtn;
    UPROPERTY()
    FEUIActionBinding ChangeSkillActionBinding;
    UPROPERTY()
    bool bCanHoverGoTo = true;
    UPROPERTY()
    FConfigVM_DivineSkillSettings EquipableSkillSettingsConfig;
    UPROPERTY()
    FConfigVM_CommonHoverProvider HoverProviderConfig;
    UPROPERTY()
    FConfigVM_AvatarShowcase AvatarShowcaseConfig;
    FEUIModelWeakRef __EquipableSkillSettings;
    UPROPERTY()
    FGetEUIModelRef EquipableSkillSettingsDelegate;
    UPROPERTY()
    FGetEUIModelRef HoverProviderDelegate;
    UPROPERTY()
    FGetEUIModelRef AvatarShowcaseDelegate;
    UPROPERTY()
    FGetEUIModelRef SelectedDivineSkillDelegate;


    UFUNCTION()
    void OnViewBind_Implementation()
    {
        FVM_CommonHoverProvider& local_10;
        if (this.EquipableSkillSettings.IsValid() && this.AvatarShowcase.IsValid() && (GetConfigs().Num() > 0))
        {
            TEUIModelRef<FVM_AvatarShowcase> local_6;
            local_6;
            local_6.SetCurrentShowcase();
        }
        this.SelectedDivineSkill.SetRef(this.EquipableSkillSettings.opArrow().GetSelectedEquipableSkill());
        if (this.HoverBtn != nullptr && !(local_10.GetbIsForbidHover()))
        {
            local_10.SetHoverForWidget(this.HoverBtn);
            local_10.SetHoverWidgetClass(this.HoverWidgetClass);
        }
        return;
    }
    UFUNCTION()
    void Tick_Implementation(const FGeometry &inout MyGeometry, const float32 InDeltaTime)
    {
        if (!(this.EquipableSkillSettings))
        {
            return;
        }
        if (this.EquipableSkillSettings.opArrow().GetbShouldClosePage())
        {
            this.RemoveFromLayout();
        }
        this.SelectedDivineSkill.SetRef(this.EquipableSkillSettings.opArrow().GetSelectedEquipableSkill());
        return;
    }
    UFUNCTION()
    void OnShouldClosePageChanged(const bool bShouldClosePage)
    {
        return;
    }
    UFUNCTION()
    void OnCanChangeToSelectedEquipableSkillChanged(const bool bCanChangeToSelectedEquipableSkill)
    {
        bool local_1 = !(bCanChangeToSelectedEquipableSkill);
        this.ChangeSkillActionBinding.SetCollapsed(local_1);
        return;
    }
    UFUNCTION()
    void ShowDivineSkillTips()
    {
        if (this.HoverProvider.IsValid())
        {
            if (this.EquipableSkillSettings.IsValid())
            {
                TEUIModelRef<FVM_EquipHoverTips> local_6;
                local_6.GetHoverTips();
                this.bCanHoverGoTo.SetbCanHoverGoTo();
                local_6.opImplConv().ResetHoverModel();
                NotifyMouseEnter();
            }
        }
        return;
    }
    UFUNCTION()
    void HideDivineSkillTips()
    {
        if (this.HoverProvider.IsValid())
        {
            FVM_CommonHoverProvider& local_4;
            if (!(local_4.GetbIsForbidHover()))
            {
                local_4.NotifyMouseLeave();
            }
        }
        return;
    }
    UFUNCTION()
    void ShowDivineSkillDescription()
    {
        if (this.EquipableSkillSettings.IsValid())
        {
            this.EquipableSkillSettings.opArrow().OpenDivineSkillDescription();
        }
        return;
    }
    UFUNCTION()
    void EquipableSkillSettings_SetCurrentShowcase(const TEUIModelRef<FVM_AvatarShowcase> &inout InShowcase) const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder::PushArg local_42;
        local_42.opCall(InShowcase);
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void EquipableSkillSettings_OnSelectedEquipableSkillItemChanged(const FEUIModelContainer &inout InSelectedEquipableSkillItem) const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder::PushArg local_42;
        local_42.opCall(InSelectedEquipableSkillItem);
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void EquipableSkillSettings_OnSelectedEquipableSkillCategoryItemIndexChanged(const int InSelectedEquipableSkillCategoryItemIndex) const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder::PushArg local_42;
        local_42.opCall(InSelectedEquipableSkillCategoryItemIndex);
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void EquipableSkillSettings_SelectPreviousCategory() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void EquipableSkillSettings_SelectNextCategory() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void EquipableSkillSettings_ChangeToSelectedEquipableSkill() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
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
    void HandleObservedModelChanges(FEUIReactiveSubscriberIterator &inout It)
    {
        FVM_DivineSkillSettings& local_6;
        TEUIModelRef<FVM_DivineSkillSettings> local_2 = this.EquipableSkillSettings.AsRef();
        for (; It; )
        {
            FEUIReactiveSubscriberTrackScope local_56 = FEUIReactiveSubscriberTrackScope(It);
            int local_57 = It.GetIndex();
            if (local_57 <= 1)
            {
                if (local_57 != 0)
                {
                    if (local_57 != 1)
                    {
                    }
                }
                else
                {
                    this.EquipableSkillSettings.TrackRead();
                    if (local_6)
                    {
                        local_6.TrackPropertyRead(::FVM_DivineSkillSettings::__IndexOf_bShouldClosePage());
                    }
                    if (local_6)
                    {
                        this.OnShouldClosePageChanged(local_6.GetbShouldClosePage());
                    }
                    this.EquipableSkillSettings.TrackRead();
                    if (local_6)
                    {
                        local_6.TrackPropertyRead(::FVM_DivineSkillSettings::__IndexOf_bCanChangeToSelectedEquipableSkill());
                    }
                    if (local_6)
                    {
                        this.OnCanChangeToSelectedEquipableSkillChanged(local_6.GetbCanChangeToSelectedEquipableSkill());
                    }
                }
            }
            It.MarkCurrentClean();
            It.opPreInc();
        }
        if (It.ReachMax())
        {
            XError(ELog(17), "Observed model changes consume max.");
            if (It.IsDirty(0))
            {
                XError(ELog(17), "Remaining observed model change: OnShouldClosePageChanged");
            }
            if (It.IsDirty(1))
            {
                XError(ELog(17), "Remaining observed model change: OnCanChangeToSelectedEquipableSkillChanged");
            }
            return;
        }
        this.__EquipableSkillSettings = local_2.opImplConv();
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.EquipableSkillSettings.Initialize(this, FName("VM_DivineSkillSettings"), EEUIWidgetRefModelCreationType(0), false);
        this.HoverProvider.Initialize(this, FName("VM_CommonHoverProvider"), EEUIWidgetRefModelCreationType(0), false);
        this.AvatarShowcase.Initialize(this, FName("VM_AvatarShowcase"), EEUIWidgetRefModelCreationType(0), false);
        this.SelectedDivineSkill.Initialize(this, FName("VM_DivineSkillInfo"), EEUIWidgetRefModelCreationType(0), true);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.EquipableSkillSettingsDelegate.IsBound())
        {
            this.EquipableSkillSettings.SetRef(this.EquipableSkillSettingsDelegate.Execute());
        }
        if (this.HoverProviderDelegate.IsBound())
        {
            this.HoverProvider.SetRef(this.HoverProviderDelegate.Execute());
        }
        if (this.AvatarShowcaseDelegate.IsBound())
        {
            this.AvatarShowcase.SetRef(this.AvatarShowcaseDelegate.Execute());
        }
        if (this.SelectedDivineSkillDelegate.IsBound())
        {
            this.SelectedDivineSkill.SetRef(this.SelectedDivineSkillDelegate.Execute());
        }
        return;
    }
}

UCLASS(Abstract)
class UWidget_EquipableDivineSkillDescription : UEUIActivatableWidget
{
    UWidget_EquipableDivineSkillDescription()
    {
        return;
    }
}

namespace UWidget_EquipableSkillSettings
{
void GetModelInfo(FEUIWidgetMetaInfo &inout Result)
{
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnShouldClosePageChanged"));
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnCanChangeToSelectedEquipableSkillChanged"));
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
namespace UWidget_EquipableDivineSkillDescription
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
