
namespace UPage_SettingsMainPage
{
    const int ViewID = 0;

}
class UPage_SettingsMainPage : UEUIActivatableWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_MenuPage> MenuPage;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_Page> Page;
    UPROPERTY()
    TEUIWidgetModelRef<FVMS_SettingPage> Settings;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_SettingSystemMainState> SystemMainState;
    UPROPERTY()
    FText RequireCloseTitle;
    UPROPERTY()
    TArray<FCommonDialogOption> RequireCloseOptions;
    UPROPERTY()
    FText RequireSwitchCategoryTitle;
    UPROPERTY()
    TArray<FCommonDialogOption> RequireSwitchCategoryOptions;
    UPROPERTY()
    FText RequireResetTitle;
    UPROPERTY()
    TArray<FCommonDialogOption> RequireResetOptions;
    UPROPERTY()
    FEUIActionBinding Revert;
    UPROPERTY()
    FEUIActionBinding Exit;
    UPROPERTY()
    FEUIActionBinding Save;
    UPROPERTY()
    FEUIActionBinding Bind;
    UPROPERTY()
    FEUIActionBinding ResetCurrentPage;
    UPROPERTY()
    UEUICustomEntryListView EUICustomEntryListView;
    UPROPERTY()
    UEUICommonListView w_list_tab;
    FTimerHandle WatchSettingValueTimerHandle;
    FGameplayTag ItemTagToWatch = FGameplayTag::RequestGameplayTag(n"Setting.Display.Display.ScreenMode", true);
    bool bWasTabFocused = false;
    bool bWasEntryListFocused = false;
    UPROPERTY()
    FConfigVM_MenuPage MenuPageConfig;
    FEUIModelWeakRef __Settings;
    UPROPERTY()
    FGetEUIModelRef MenuPageDelegate;
    UPROPERTY()
    FGetEUIModelRef PageDelegate;
    UPROPERTY()
    FGetEUIModelRef SystemMainStateDelegate;


    UFUNCTION()
    void Construct_Implementation()
    {
        UKLGameUserSettings::Get().OnSupportedResolutionsChanged.AddUFunction(this, n"OnSupportedResolutionsChanged");
        this.WatchSettingValueTimerHandle = System::SetTimer(this, n"WatchSettingValue", 0.1f, true, false, 0.0f, 0.0f);
        return;
    }
    UFUNCTION()
    void Destruct_Implementation()
    {
        if (UKLGameUserSettings::Get() != nullptr)
        {
            UKLGameUserSettings::Get().OnSupportedResolutionsChanged.Unbind(this, n"OnSupportedResolutionsChanged");
        }
        System::ClearAndInvalidateTimerHandle(__GetWorldContext(), this.WatchSettingValueTimerHandle);
        return;
    }
    UFUNCTION()
    void OnViewBind_Implementation()
    {
        if (!(this.Settings.IsValid()))
        {
            FEUIModelRef local_4;
            this.Settings = local_4;
        }
        InitData();
        if (this.w_list_tab != nullptr)
        {
            this.w_list_tab.SetSelectedIndex(GetSelectedCategoryIndex());
            this.RuleSetUserFocus(this.w_list_tab);
            this.w_list_tab.SetFocus();
        }
        this.ActionbarRegister();
        return;
    }
    UFUNCTION()
    void HandleRelatedFocusChanged_Implementation()
    {
        this.ActionbarRegister();
        bool local_5 = (this.w_list_tab != nullptr) && this.IsPartOfFocusPath(this.w_list_tab);
        bool local_1 = (this.EUICustomEntryListView != nullptr) && this.IsPartOfFocusPath(this.EUICustomEntryListView);
        int local_14 = ((int(::UICommonUtil::GetCurrentInputType(this.GetOwningLocalPlayer()))) == 1 && this.IsPartOfFocusPath(this.w_list_tab)) ? 1059481190 : 1065353216;
        local_14.SetItemsOpacity();
        if (this.IsPartOfFocusPath(this.EUICustomEntryListView))
        {
            this.EUICustomEntryListView.GetSelectedItem().SetPrevSelectedItem();
        }
        if ((this.bWasTabFocused && !(local_5)) && local_1)
        {
            this.ListViewNavigatForEnter();
        }
        if ((!(this.bWasTabFocused) && !(local_5) && !(this.bWasEntryListFocused)) && local_1)
        {
            this.ListViewNavigatForReturn();
        }
        this.bWasTabFocused = local_5;
        this.bWasEntryListFocused = local_1;
        return;
    }
    UFUNCTION()
    void OnSupportedResolutionsChanged()
    {
        if (!(this.Settings.IsValid()))
        {
            FEUIModelRef local_4;
            this.Settings = local_4;
        }
        if (this.Settings.IsValid())
        {
            UpdateResolutionDropDownOptions();
        }
        return;
    }
    UFUNCTION()
    void RequireSwitchCategory()
    {
        if (!(this.Settings.IsValid()))
        {
            return;
        }
        TEUIModelRef<FVMS_PlayerKeyMappings> local_4;
        local_4.GetKeyMappings();
        if (!(local_4.IsValid()))
        {
            TEUIModelRef<FVMS_PlayerKeyMappings>(::FVMS_PlayerKeyMappings::Get(this)).SetKeyMappings();
            return;
        }
        if (CheckHasValueActuallyChanged())
        {
            FDialogDynamicCallback local_8;
            local_8.BindUFunction(this, n"HandleRequireSwitchCategoryAnswer");
            FCommonDialogParam local_12;
            local_12.bIsForbidIgnored = false;
            NSLOCTEXT("Settings", "RequireSwitchTitle", "и­¦е‘Љ");
            ULocalPlayer local_52 = this.GetOwningLocalPlayer();
        }
        return;
    }
    UFUNCTION()
    bool HandleRequireSwitchCategoryAnswer(const FCommonDialogAnswer &inout Answer) const
    {
        if (int(Answer.AnswerType) == 0)
        {
            this.w_list_tab.SetSelectedIndex(GetSelectedCategoryIndex());
        }
        int(Answer.AnswerType).CheckHasSettingsChangedForSwitch();
        return true;
    }
    UFUNCTION()
    void RequireReset()
    {
        FDialogDynamicCallback local_4;
        local_4.BindUFunction(this, n"HandleRequireResetAnswer");
        FCommonDialogParam local_8;
        local_8.bIsForbidIgnored = false;
        NSLOCTEXT("Settings", "RequireResetTitle", "й‡ЌзЅ®жњ¬йЎµи®ѕзЅ®");
        ULocalPlayer local_50 = this.GetOwningLocalPlayer();
        return;
    }
    UFUNCTION()
    bool HandleRequireResetAnswer(const FCommonDialogAnswer &inout Answer) const
    {
        int(Answer.AnswerType).CheckHasSettingsReset();
        return true;
    }
    UFUNCTION()
    void WatchSettingValue()
    {
        if (GetItems().Contains(this.ItemTagToWatch) && IsDisplayCategory())
        {
            if (TEUIModelRef<FVM_SettingItem>(GetItems()[this.ItemTagToWatch]))
            {
                float32 local_5 = ::SettingUtils::GetCurrentValue(GetApplyEffect(), this.ItemTagToWatch.IsDisplayOrGraphicsItem());
                if (local_5 != GetCurrentValue())
                {
                    local_5.UpdateCurrentValue();
                    local_5.UpdateComponentValue(false);
                    SyncPreviousValue();
                    for (auto& local_24 : GetItems())
                    {
                        local_24;
                        false.SetbIsHovered();
                    }
                }
            }
        }
        return;
    }
    UFUNCTION()
    void ApplyRevert()
    {
        TEUIModelRef<FVMS_PlayerKeyMappings> local_2;
        local_2.GetKeyMappings();
        if (!(local_2.IsValid()))
        {
            return;
        }
        local_2.GetKeyMappings();
        if (local_2.opArrow().CanRevert())
        {
            local_2.GetKeyMappings();
            local_2.opArrow().RevertKey();
        }
        return;
    }
    UFUNCTION()
    void ApplyExitKeySelecting()
    {
        TEUIModelRef<FVMS_PlayerKeyMappings> local_2;
        local_2.GetKeyMappings();
        if (!(local_2.IsValid()))
        {
            return;
        }
        local_2.GetKeyMappings();
        local_2.opArrow().ExitKeySelecting();
        return;
    }
    UFUNCTION()
    void ActionbarRegister()
    {
        if ((int(::UICommonUtil::GetCurrentInputType(this.GetOwningLocalPlayer()))) == 0)
        {
            this.KeyboardAndMouseActionbarRegister();
            return;
        }
        this.GamepadActionbarRegister(this.IsPartOfFocusPath(this.w_list_tab));
        return;
    }
    UFUNCTION()
    void OnKeyMappingsCanRevertChanged()
    {
        TEUIModelRef<FVMS_PlayerKeyMappings> local_2;
        local_2.GetKeyMappings();
        if (!(local_2.IsValid()))
        {
            return;
        }
        return;
    }
    void ListViewNavigatForEnter()
    {
        if (!((this.EUICustomEntryListView != nullptr)) || (int(::UICommonUtil::GetCurrentInputType(this.GetOwningLocalPlayer())) == 0))
        {
            return;
        }
        if (this.EUICustomEntryListView.GetNumItems() == 0 || (this.w_list_tab.GetNumItems() == 0))
        {
            return;
        }
        if (GetFirstItem().IsEmpty())
        {
            return;
        }
        this.EUICustomEntryListView.NavigateToItem(GetFirstItem());
        return;
    }
    void ListViewNavigatForReturn()
    {
        if ((!((this.EUICustomEntryListView != nullptr))))
        {
            return;
        }
        if (this.EUICustomEntryListView.GetNumItems() == 0 || (this.w_list_tab.GetNumItems() == 0))
        {
            return;
        }
        if (GetPrevSelectedItem().IsEmpty())
        {
            return;
        }
        this.EUICustomEntryListView.NavigateToItem(GetPrevSelectedItem());
        return;
    }
    void GamepadActionbarRegister(const bool bLeftFocused)
    {
        if ((int(::UICommonUtil::GetCurrentInputType(this.GetOwningLocalPlayer()))) == 0)
        {
            return;
        }
        if (bLeftFocused)
        {
            this.Exit.SetOverrideDisplayText(NSLOCTEXT("Settings", "Return", "иї”е›ћ"));
            this.Save.SetCollapsed(true);
            this.ResetCurrentPage.SetCollapsed(true);
            this.Bind.SetCollapsed(true);
            return;
        }
        this.Exit.SetOverrideDisplayText(NSLOCTEXT("Settings", "Return", "иї”е›ћ"));
        this.Save.SetCollapsed(false);
        this.ResetCurrentPage.SetCollapsed(false);
        bool local_6 = IsGamepadCategory();
        if (!(local_6))
        {
            this.Bind.SetCollapsed(true);
            return;
        }
        this.Bind.SetCollapsed(false);
        return;
    }
    void KeyboardAndMouseActionbarRegister()
    {
        if ((int(::UICommonUtil::GetCurrentInputType(this.GetOwningLocalPlayer()))) == 1)
        {
            return;
        }
        this.Bind.SetCollapsed(true);
        if (GetbIsKeyMapping() && GetbIsKeySelecting())
        {
            this.Exit.SetOverrideDisplayText(NSLOCTEXT("Settings", "ExitKeySelecting", "еЏ–ж¶€и®ѕзЅ®"));
            this.Save.SetCollapsed(true);
            this.ResetCurrentPage.SetCollapsed(true);
            return;
        }
        this.Exit.SetOverrideDisplayText(NSLOCTEXT("Settings", "Exit", "иї”е›ћ"));
        this.Save.SetCollapsed(false);
        this.ResetCurrentPage.SetCollapsed(false);
        return;
    }
    UFUNCTION()
    void RequireCloseOrExitKeySelecting()
    {
        if (int(::UICommonUtil::GetCurrentInputType(this.GetOwningLocalPlayer())) == 1)
        {
            if (!(this.IsPartOfFocusPath(this.w_list_tab)))
            {
                this.w_list_tab.SetSelectedIndex(GetSelectedCategoryIndex());
                this.RuleSetUserFocus(this.w_list_tab);
                this.w_list_tab.SetFocus();
            }
            else
            {
                this.RequireClose();
            }
            return;
        }
        if (GetbIsKeyMapping() && GetbIsKeySelecting())
        {
            this.ApplyExitKeySelecting();
            return;
        }
        this.RequireClose();
        return;
    }
    UFUNCTION()
    void RequireClose()
    {
        TEUIModelRef<FVMS_PlayerKeyMappings> local_2;
        local_2.GetKeyMappings();
        if (!(local_2.IsValid()))
        {
            return;
        }
        if (CheckHasValueActuallyChanged())
        {
            FDialogDynamicCallback local_8;
            local_8.BindUFunction(this, n"HandleRequireCloseAnswer");
            FCommonDialogParam local_12;
            local_12.bIsForbidIgnored = false;
            NSLOCTEXT("Settings", "RequireCloseTitle", "зЎ®и®¤йЂЂе‡є");
            ULocalPlayer local_52 = this.GetOwningLocalPlayer();
            return;
        }
        ::FMS_SettingMain::Get(this).PrevIndex = 0;
        this.ClosePage(false);
        return;
    }
    UFUNCTION()
    bool HandleRequireCloseAnswer(const FCommonDialogAnswer &inout Answer)
    {
        int(Answer.AnswerType).CheckHasSettingsChangedForClose();
        if (int(Answer.AnswerType) != 0)
        {
            ::FMS_SettingMain::Get(this).PrevIndex = 0;
            this.ClosePage(false);
        }
        return true;
    }
    UFUNCTION()
    void Page_ClosePage() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void Page_CloseGroup() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    TEUIModelRef<FVMS_PlayerKeyMappings> Settings_KeyMappings() const
    {
        FVMS_SettingPage& local_2;
        TEUIModelRef<FVMS_PlayerKeyMappings> local_10;
        if (local_2)
        {
            local_10 = local_2.GetKeyMappings();
        }
        else
        {
            local_10 = TEUIModelRef<FVMS_PlayerKeyMappings>();
        }
        return local_10;
    }
    UFUNCTION()
    TArray<FEUIModelContainer> Settings_CategoryListItems() const
    {
        FVMS_SettingPage& local_2;
        TArray<FEUIModelContainer> local_12;
        if (local_2)
        {
            local_12 = local_2.GetCategoryListItems();
        }
        else
        {
            local_12 = TArray<FEUIModelContainer>();
        }
        return local_12;
    }
    UFUNCTION()
    TArray<FEUIDynamicWidgetData> Settings_SelectedListItems() const
    {
        FVMS_SettingPage& local_2;
        TArray<FEUIDynamicWidgetData> local_12;
        if (local_2)
        {
            local_12 = local_2.GetSelectedListItems();
        }
        else
        {
            local_12 = TArray<FEUIDynamicWidgetData>();
        }
        return local_12;
    }
    UFUNCTION()
    FEUIDynamicWidgetData Settings_FirstItem() const
    {
        FVMS_SettingPage& local_2;
        FEUIDynamicWidgetData local_52 = local_2 ? local_2.GetFirstItem() : FEUIDynamicWidgetData();
        return local_52;
    }
    UFUNCTION()
    FEUIDynamicWidgetData Settings_PrevSelectedItem() const
    {
        FVMS_SettingPage& local_2;
        FEUIDynamicWidgetData local_52 = local_2 ? local_2.GetPrevSelectedItem() : FEUIDynamicWidgetData();
        return local_52;
    }
    UFUNCTION()
    TDataObjectPtr<FSettingItemConfig> Settings_SelectedItemConfig() const
    {
        FVMS_SettingPage& local_2;
        TDataObjectPtr<FSettingItemConfig> local_52;
        if (local_2)
        {
            local_52 = local_2.GetSelectedItemConfig();
        }
        else
        {
            local_52 = TDataObjectPtr<FSettingItemConfig>();
        }
        return local_52;
    }
    UFUNCTION()
    void Settings_SelectCategory(const int Index) const
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
    void Settings_UpdateResolutionDropDownOptions() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void Settings_SaveChangedSettings() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void Settings_ResetChangedSettings() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void Settings_RevertUnsavedSettings() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void Settings_BroadcastSettingsChanged(const float32 Value) const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder::PushArg local_42;
        local_42.opCall(Value);
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    void HandleObservedModelChanges(FEUIReactiveSubscriberIterator &inout It)
    {
        FVMS_SettingPage& local_6;
        TEUIModelRef<FVMS_SettingPage> local_2 = this.Settings.AsRef();
        for (; It; )
        {
            FEUIReactiveSubscriberTrackScope local_56 = FEUIReactiveSubscriberTrackScope(It);
            switch (It.GetIndex())
            {
            case 0:
            {
                this.Settings.TrackRead();
                if (local_6)
                {
                    local_6.TrackPropertyRead(::FVMS_SettingPage::__IndexOf_bHasSelectedCategoryChanged());
                }
                if (local_6)
                {
                    this.RequireSwitchCategory();
                }
                break;
            }
            case 1:
            {
                this.Settings.TrackRead();
                if (local_6)
                {
                    local_6.TrackPropertyRead(::FVMS_SettingPage::__IndexOf_bIsKeyMapping());
                    local_6.TrackPropertyRead(::FVMS_SettingPage::__IndexOf_bIsKeySelecting());
                }
                if (local_6)
                {
                    this.ActionbarRegister();
                }
                break;
            }
            case 2:
            {
                this.Settings.TrackRead();
                if (local_6)
                {
                    local_6.TrackPropertyRead(::FVMS_SettingPage::__IndexOf_bCanRevert());
                }
                if (local_6)
                {
                    this.OnKeyMappingsCanRevertChanged();
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
                XError(ELog(17), "Remaining observed model change: RequireSwitchCategory");
            }
            if (It.IsDirty(1))
            {
                XError(ELog(17), "Remaining observed model change: ActionbarRegister");
            }
            if (It.IsDirty(2))
            {
                XError(ELog(17), "Remaining observed model change: OnKeyMappingsCanRevertChanged");
            }
            return;
        }
        this.__Settings = local_2.opImplConv();
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.MenuPage.Initialize(this, FName("VM_MenuPage"), EEUIWidgetRefModelCreationType(0), false);
        this.Page.Initialize(this, FName("VM_Page"), EEUIWidgetRefModelCreationType(0), false);
        this.Settings.Initialize(this, FName("VMS_SettingPage"), EEUIWidgetRefModelCreationType(0), false);
        this.SystemMainState.Initialize(this, FName("VM_SettingSystemMainState"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.MenuPageDelegate.IsBound())
        {
            this.MenuPage.SetRef(this.MenuPageDelegate.Execute());
        }
        if (this.PageDelegate.IsBound())
        {
            this.Page.SetRef(this.PageDelegate.Execute());
        }
        if (this.SystemMainStateDelegate.IsBound())
        {
            this.SystemMainState.SetRef(this.SystemMainStateDelegate.Execute());
        }
        return;
    }
}

namespace UPage_SettingsMainPage
{
void GetModelInfo(FEUIWidgetMetaInfo &inout Result)
{
    Result.ObservedModelChangesSubscriberNames.Add(FString("RequireSwitchCategory"));
    Result.ObservedModelChangesSubscriberNames.Add(FString("ActionbarRegister"));
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnKeyMappingsCanRevertChanged"));
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
