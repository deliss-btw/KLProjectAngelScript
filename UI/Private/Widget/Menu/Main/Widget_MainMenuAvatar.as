
namespace UWidget_AvatarBuildTypeEntry
{
    const int ViewID = 0;
}
namespace UWidget_MainMenuAvatar
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_AvatarBuildTypeEntry : UEUIActivatableWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_MainMenuAvatarBuildTypeEntry> EntryDesc;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_CommonHoverProvider> HoverProvider;
    UPROPERTY()
    TSoftClassPtr<UUserWidget> HoverWidgetClass;
    UPROPERTY()
    UEUIButton HoverBtn;
    UPROPERTY()
    FConfigVM_CommonHoverProvider HoverProviderConfig;
    UPROPERTY()
    FGetEUIModelRef EntryDescDelegate;
    UPROPERTY()
    FGetEUIModelRef HoverProviderDelegate;

    UWidget_AvatarBuildTypeEntry()
    {
        return;
    }
    UFUNCTION()
    void OnViewBind_Implementation()
    {
        if (this.HoverProvider.IsValid())
        {
            FVM_CommonHoverProvider& local_4;
            if (this.HoverBtn != nullptr && !(local_4.GetbIsForbidHover()))
            {
                local_4.SetHoverForWidget(this.HoverBtn);
                local_4.SetHoverWidgetClass(this.HoverWidgetClass);
            }
        }
        return;
    }
    UFUNCTION()
    void OnHover()
    {
        if (this.HoverProvider.IsValid())
        {
            if (this.EntryDesc.IsValid())
            {
                FEUIModelRef local_4;
                local_4.GetHoverTips();
                local_4.ResetHoverModel();
                NotifyMouseEnter();
            }
        }
        return;
    }
    UFUNCTION()
    void OnUnhover()
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
        this.EntryDesc.Initialize(this, FName("VM_MainMenuAvatarBuildTypeEntry"), EEUIWidgetRefModelCreationType(0), false);
        this.HoverProvider.Initialize(this, FName("VM_CommonHoverProvider"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.EntryDescDelegate.IsBound())
        {
            this.EntryDesc.SetRef(this.EntryDescDelegate.Execute());
        }
        if (this.HoverProviderDelegate.IsBound())
        {
            this.HoverProvider.SetRef(this.HoverProviderDelegate.Execute());
        }
        return;
    }
}

UCLASS(Abstract)
class UWidget_MainMenuAvatar : UEUIActivatableWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_MenuPage> Menu;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_MainMenuAvatar> MainMenuAvatar;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_AvatarShowcase> Showcase;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_AvatarWardrobeEntrance> WardrobeEntrance;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_MainMenuAvatarReturnBtnState> ReturnBtnState;
    UPROPERTY()
    UEUICommonListView AvatarList;
    UPROPERTY()
    FEUIActionBinding AvatarStroryActionBinding;
    UPROPERTY()
    FEUIActionBinding AvatarUnLockActionBinding;
    UPROPERTY()
    FEUIActionBinding AvatarTrainingActionBinding;
    UPROPERTY()
    FEUIActionBinding AvatarAttributeDetailActionBinding;
    UPROPERTY()
    FEUIActionBinding AvatarAffixDetailsActionBinding;
    UPROPERTY()
    bool bIsShowAttr = false;
    UPROPERTY()
    bool bIsAvatarUnLocked = false;
    UPROPERTY()
    FConfigVM_MenuPage MenuConfig;
    UPROPERTY()
    FConfigVM_MainMenuAvatar MainMenuAvatarConfig;
    UPROPERTY()
    FConfigVM_AvatarShowcase ShowcaseConfig;
    FEUIModelWeakRef __MainMenuAvatar;
    UPROPERTY()
    FGetEUIModelRef MenuDelegate;
    UPROPERTY()
    FGetEUIModelRef MainMenuAvatarDelegate;
    UPROPERTY()
    FGetEUIModelRef ShowcaseDelegate;
    UPROPERTY()
    FGetEUIModelRef WardrobeEntranceDelegate;
    UPROPERTY()
    FGetEUIModelRef ReturnBtnStateDelegate;


    UFUNCTION()
    void OnViewBind_Implementation()
    {
        TEUIModelRef<FVM_AvatarShowcase> local_2;
        local_2;
        local_2.SetCurrentShowcase();
        this.bIsShowAttr = GetbDisplayAttributeOrSkill();
        TEUIModelRef<FVM_AvatarInfo> local_6;
        local_6.GetSelectedAvatar();
        if (local_6.IsValid())
        {
            TEUIModelRef<FM_Avatar> local_8;
            local_6.GetSelectedAvatar();
            local_8.GetAvatar();
            if (local_8.IsValid())
            {
                local_6.GetSelectedAvatar();
                local_8.GetAvatar();
                this.bIsAvatarUnLocked = GetbIsUnlocked();
            }
        }
        this.RefreshActionBinding();
        if (this.AvatarList != nullptr)
        {
            this.AvatarList.SetSelectedIndex(GetSelectedAvatarIndex());
        }
        return;
    }
    UFUNCTION()
    void OnSelectedAvatarIndexChanged(const int ItemIndex)
    {
        this.AvatarList.SetSelectedIndex(ItemIndex);
        return;
    }
    UFUNCTION()
    void OnDisplayAttributeOrSkillChanged()
    {
        this.bIsShowAttr = GetbDisplayAttributeOrSkill();
        this.RefreshActionBinding();
        return;
    }
    UFUNCTION()
    void OnAvatarTraitListChanged()
    {
        TEUIModelRef<FVM_AvatarInfo> local_2;
        local_2.GetSelectedAvatar();
        if (local_2.IsValid())
        {
            TEUIModelRef<FM_Avatar> local_6;
            local_2.GetSelectedAvatar();
            local_6.GetAvatar();
            if (local_6.IsValid())
            {
                local_2.GetSelectedAvatar();
                local_6.GetAvatar();
                this.bIsAvatarUnLocked = GetbIsUnlocked();
                this.RefreshActionBinding();
            }
        }
        return;
    }
    UFUNCTION()
    void AB_AvatarStrory()
    {
        if (this.MainMenuAvatar.IsNull())
        {
            return;
        }
        this.OpenAvatarDetailPop(0);
        return;
    }
    UFUNCTION()
    void AB_AvatarUnLock()
    {
        if (this.MainMenuAvatar.IsNull())
        {
            return;
        }
        TEUIModelRef<FVM_AvatarInfo> local_6;
        local_6.GetSelectedAvatar();
        TEUIModelRef<FM_Avatar> local_8;
        local_8.GetAvatar();
        TEUIModelRef<FM_Avatar> local_4;
        if (local_4)
        {
            if (FEUIWidget::FindWidget(this.GetOwningLocalPlayer(), GameplayTags::UI_Type_Avatar_Condition).IsValid())
            {
                return;
            }
            FEUIWidget::AddWidget(this.GetOwningLocalPlayer(), GameplayTags::UI_Type_Avatar_Condition, FEUIModelRef(::FVM_AvatarAllUnlockConditions::Create(this, local_4)));
        }
        return;
    }
    UFUNCTION()
    void AB_AvatarTraining()
    {
        if (this.MainMenuAvatar.IsNull())
        {
            return;
        }
        OnAvatarTrainingClick();
        return;
    }
    UFUNCTION()
    void AB_AvatarAttributeDetail()
    {
        if (this.MainMenuAvatar.IsNull())
        {
            return;
        }
        this.OpenAvatarDetailPop(1);
        return;
    }
    UFUNCTION()
    void AB_AvatarAffixDetails()
    {
        if (this.MainMenuAvatar.IsNull())
        {
            return;
        }
        this.OpenAvatarDetailPop(2);
        return;
    }
    void OpenAvatarDetailPop(const int PopIndex)
    {
        int local_14 = 0;
        FEUIWidgetRef local_4 = FEUIWidget::FindWidget(this.GetOwningLocalPlayer(), GameplayTags::UI_Type_Avatar_DetailPop);
        if (local_4.IsValid())
        {
            FEUIWidget::RemoveWidget(local_4);
        }
        TEUIModelRef<FVM_AvatarInfo> local_10;
        local_10.GetSelectedAvatar();
        local_14.SetPopIndex(PopIndex);
        FEUIWidget::AddWidget(this.GetOwningLocalPlayer(), GameplayTags::UI_Type_Avatar_DetailPop, FEUIModelRef(local_14));
        return;
    }
    UFUNCTION()
    void OnAvatarHasUnlockedTrainingChanged()
    {
        this.RefreshActionBinding();
        return;
    }
    void RefreshActionBinding()
    {
        bool local_2;
        this.AvatarStroryActionBinding.SetCollapsed(this.bIsShowAttr);
        this.AvatarAttributeDetailActionBinding.SetCollapsed(!(this.bIsShowAttr));
        this.AvatarAffixDetailsActionBinding.SetCollapsed(!(this.bIsShowAttr));
        if (this.bIsShowAttr)
        {
            this.AvatarUnLockActionBinding.SetCollapsed(true);
            this.AvatarTrainingActionBinding.SetCollapsed(true);
            return;
        }
        local_2 = GetbAvatarHasUnlockedTraining();
        this.AvatarUnLockActionBinding.SetCollapsed(this.bIsAvatarUnLocked);
        bool local_5 = ::FMS_SystemControl::Get(this).IsSystemUnlock(ESystemModule(103), false);
        this.AvatarTrainingActionBinding.SetCollapsed(!(this.bIsAvatarUnLocked) || !(local_2) || !(local_5));
        return;
    }
    UFUNCTION()
    TArray<FEUIModelContainer> MainMenuAvatar_AvatarList() const
    {
        FVM_MainMenuAvatar& local_2;
        TArray<FEUIModelContainer> local_12;
        if (local_2)
        {
            local_12 = local_2.GetAvatarList();
        }
        else
        {
            local_12 = TArray<FEUIModelContainer>();
        }
        return local_12;
    }
    UFUNCTION()
    void MainMenuAvatar_SelectAvatarByIndex(const int Index) const
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
    void MainMenuAvatar_GotoAvatarBuildPage() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void WardrobeEntrance_HandleWardrobeClicked() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    void HandleObservedModelChanges(FEUIReactiveSubscriberIterator &inout It)
    {
        FVM_MainMenuAvatar& local_6;
        TEUIModelRef<FVM_MainMenuAvatar> local_2 = this.MainMenuAvatar.AsRef();
        for (; It; )
        {
            FEUIReactiveSubscriberTrackScope local_56 = FEUIReactiveSubscriberTrackScope(It);
            switch (It.GetIndex())
            {
            case 0:
            {
                this.MainMenuAvatar.TrackRead();
                if (local_6)
                {
                    local_6.TrackPropertyRead(::FVM_MainMenuAvatar::__IndexOf_SelectedAvatarIndex());
                }
                if (local_6)
                {
                    this.OnSelectedAvatarIndexChanged(local_6.GetSelectedAvatarIndex());
                }
                break;
            }
            case 1:
            {
                this.MainMenuAvatar.TrackRead();
                if (local_6)
                {
                    local_6.TrackPropertyRead(::FVM_MainMenuAvatar::__IndexOf_bDisplayAttributeOrSkill());
                }
                if (local_6)
                {
                    this.OnDisplayAttributeOrSkillChanged();
                }
                break;
            }
            case 2:
            {
                this.MainMenuAvatar.TrackRead();
                if (local_6)
                {
                    local_6.TrackPropertyRead(::FVM_MainMenuAvatar::__IndexOf_SelectedAvatar());
                }
                if (local_6)
                {
                    this.OnAvatarTraitListChanged();
                }
                break;
            }
            case 3:
            {
                this.MainMenuAvatar.TrackRead();
                if (local_6)
                {
                    local_6.TrackPropertyRead(::FVM_MainMenuAvatar::__IndexOf_bAvatarHasUnlockedTraining());
                }
                if (local_6)
                {
                    this.OnAvatarHasUnlockedTrainingChanged();
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
                XError(ELog(17), "Remaining observed model change: OnSelectedAvatarIndexChanged");
            }
            if (It.IsDirty(1))
            {
                XError(ELog(17), "Remaining observed model change: OnDisplayAttributeOrSkillChanged");
            }
            if (It.IsDirty(2))
            {
                XError(ELog(17), "Remaining observed model change: OnAvatarTraitListChanged");
            }
            if (It.IsDirty(3))
            {
                XError(ELog(17), "Remaining observed model change: OnAvatarHasUnlockedTrainingChanged");
            }
            return;
        }
        this.__MainMenuAvatar = local_2.opImplConv();
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.Menu.Initialize(this, FName("VM_MenuPage"), EEUIWidgetRefModelCreationType(0), false);
        this.MainMenuAvatar.Initialize(this, FName("VM_MainMenuAvatar"), EEUIWidgetRefModelCreationType(0), false);
        this.Showcase.Initialize(this, FName("VM_AvatarShowcase"), EEUIWidgetRefModelCreationType(0), false);
        this.WardrobeEntrance.Initialize(this, FName("VM_AvatarWardrobeEntrance"), EEUIWidgetRefModelCreationType(0), false);
        this.ReturnBtnState.Initialize(this, FName("VM_MainMenuAvatarReturnBtnState"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.MenuDelegate.IsBound())
        {
            this.Menu.SetRef(this.MenuDelegate.Execute());
        }
        if (this.MainMenuAvatarDelegate.IsBound())
        {
            this.MainMenuAvatar.SetRef(this.MainMenuAvatarDelegate.Execute());
        }
        if (this.ShowcaseDelegate.IsBound())
        {
            this.Showcase.SetRef(this.ShowcaseDelegate.Execute());
        }
        if (this.WardrobeEntranceDelegate.IsBound())
        {
            this.WardrobeEntrance.SetRef(this.WardrobeEntranceDelegate.Execute());
        }
        if (this.ReturnBtnStateDelegate.IsBound())
        {
            this.ReturnBtnState.SetRef(this.ReturnBtnStateDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_AvatarBuildTypeEntry
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
namespace UWidget_MainMenuAvatar
{
void GetModelInfo(FEUIWidgetMetaInfo &inout Result)
{
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnSelectedAvatarIndexChanged"));
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnDisplayAttributeOrSkillChanged"));
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnAvatarTraitListChanged"));
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnAvatarHasUnlockedTrainingChanged"));
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
