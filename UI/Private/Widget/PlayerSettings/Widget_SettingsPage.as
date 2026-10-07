
namespace UWidget_SettingsPage
{
    const int ViewID = 0;
}
namespace UWidget_SettingsPage_JustForHint
{
    const int ViewID = 0;

}
class UWidget_SettingsPage : UEUIActivatableWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_Page> Page;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_MenuPage> MenuPage;
    UPROPERTY()
    TEUIWidgetModelRef<FVMS_PlayerKeyMappings> KeyMappings;
    UPROPERTY()
    FText RequireCloseTitle;
    UPROPERTY()
    TArray<FCommonDialogOption> RequireCloseOptions;
    UPROPERTY()
    FConfigVM_MenuPage MenuPageConfig;
    UPROPERTY()
    FGetEUIModelRef PageDelegate;
    UPROPERTY()
    FGetEUIModelRef MenuPageDelegate;

    UWidget_SettingsPage()
    {
        return;
    }
    UFUNCTION()
    void RequireClose()
    {
        if (this.KeyMappings.opArrow().HasAnyModification())
        {
            FDialogDynamicCallback local_6;
            local_6.BindUFunction(this, n"HandleRequireCloseAnswer");
            NSLOCTEXT("PlayerSettings", "RequireCloseTitle", "зЎ®и®¤йЂЂе‡є");
            return;
        }
        this.ClosePage(false);
        return;
    }
    UFUNCTION()
    bool HandleRequireCloseAnswer(const FCommonDialogAnswer &inout Answer) const
    {
        FVMS_PlayerKeyMappings& local_2;
        if (int(Answer.AnswerType) == 1)
        {
            local_2.SetbShouldSave(true);
            this.ClosePage(false);
        }
        else
        {
            if (int(Answer.AnswerType) == 2)
            {
                local_2.SetbShouldSave(false);
                this.ClosePage(false);
            }
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
    TArray<FEUIModelWeakRef> KeyMappings_KeyboardMouseItems() const
    {
        FVMS_PlayerKeyMappings& local_2;
        TArray<FEUIModelWeakRef> local_16;
        if (local_2)
        {
            local_16 = EUIInternal::AsWeakRefList(local_2.GetKeyboardMouseItems());
        }
        else
        {
            local_16 = TArray<FEUIModelWeakRef>();
        }
        return local_16;
    }
    UFUNCTION()
    TArray<FEUIModelWeakRef> KeyMappings_GamepadItems() const
    {
        FVMS_PlayerKeyMappings& local_2;
        TArray<FEUIModelWeakRef> local_16;
        if (local_2)
        {
            local_16 = EUIInternal::AsWeakRefList(local_2.GetGamepadItems());
        }
        else
        {
            local_16 = TArray<FEUIModelWeakRef>();
        }
        return local_16;
    }
    UFUNCTION()
    void KeyMappings_OnEntrySelected(const int Index) const
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
    void KeyMappings_ResetKeys() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void KeyMappings_RevertKey() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void KeyMappings_SaveKeySettings() const
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
        this.Page.Initialize(this, FName("VM_Page"), EEUIWidgetRefModelCreationType(0), false);
        this.MenuPage.Initialize(this, FName("VM_MenuPage"), EEUIWidgetRefModelCreationType(0), false);
        this.KeyMappings.Initialize(this, FName("VMS_PlayerKeyMappings"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.PageDelegate.IsBound())
        {
            this.Page.SetRef(this.PageDelegate.Execute());
        }
        if (this.MenuPageDelegate.IsBound())
        {
            this.MenuPage.SetRef(this.MenuPageDelegate.Execute());
        }
        return;
    }
}

class UWidget_SettingsPage_JustForHint : UEUIActivatableWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_Page> Page;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_MenuPage> MenuPage;
    UPROPERTY()
    TEUIWidgetModelRef<FVMS_PlayerKeyMappings> KeyMappings;
    UPROPERTY()
    FText RequireCloseTitle;
    UPROPERTY()
    TArray<FCommonDialogOption> RequireCloseOptions;
    UPROPERTY()
    FConfigVM_MenuPage MenuPageConfig;
    UPROPERTY()
    FGetEUIModelRef PageDelegate;
    UPROPERTY()
    FGetEUIModelRef MenuPageDelegate;

    UWidget_SettingsPage_JustForHint()
    {
        return;
    }
    UFUNCTION()
    void RequireClose()
    {
        if (this.KeyMappings.opArrow().HasAnyModification())
        {
            FDialogDynamicCallback local_6;
            local_6.BindUFunction(this, n"HandleRequireCloseAnswer");
            NSLOCTEXT("PlayerSettings", "RequireCloseTitle", "зЎ®и®¤йЂЂе‡є");
            return;
        }
        this.ClosePage(false);
        return;
    }
    UFUNCTION()
    bool HandleRequireCloseAnswer(const FCommonDialogAnswer &inout Answer) const
    {
        FVMS_PlayerKeyMappings& local_2;
        if (int(Answer.AnswerType) == 1)
        {
            local_2.SetbShouldSave(true);
            this.ClosePage(false);
        }
        else
        {
            if (int(Answer.AnswerType) == 2)
            {
                local_2.SetbShouldSave(false);
                this.ClosePage(false);
            }
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
    TArray<FEUIModelWeakRef> KeyMappings_KeyboardMouseItems() const
    {
        FVMS_PlayerKeyMappings& local_2;
        TArray<FEUIModelWeakRef> local_16;
        if (local_2)
        {
            local_16 = EUIInternal::AsWeakRefList(local_2.GetKeyboardMouseItems());
        }
        else
        {
            local_16 = TArray<FEUIModelWeakRef>();
        }
        return local_16;
    }
    UFUNCTION()
    TArray<FEUIModelWeakRef> KeyMappings_GamepadItems() const
    {
        FVMS_PlayerKeyMappings& local_2;
        TArray<FEUIModelWeakRef> local_16;
        if (local_2)
        {
            local_16 = EUIInternal::AsWeakRefList(local_2.GetGamepadItems());
        }
        else
        {
            local_16 = TArray<FEUIModelWeakRef>();
        }
        return local_16;
    }
    UFUNCTION()
    void KeyMappings_OnEntrySelected(const int Index) const
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
    void KeyMappings_ResetKeys() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void KeyMappings_RevertKey() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void KeyMappings_SaveKeySettings() const
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
        this.Page.Initialize(this, FName("VM_Page"), EEUIWidgetRefModelCreationType(0), false);
        this.MenuPage.Initialize(this, FName("VM_MenuPage"), EEUIWidgetRefModelCreationType(0), false);
        this.KeyMappings.Initialize(this, FName("VMS_PlayerKeyMappings"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.PageDelegate.IsBound())
        {
            this.Page.SetRef(this.PageDelegate.Execute());
        }
        if (this.MenuPageDelegate.IsBound())
        {
            this.MenuPage.SetRef(this.MenuPageDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_SettingsPage
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
namespace UWidget_SettingsPage_JustForHint
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
