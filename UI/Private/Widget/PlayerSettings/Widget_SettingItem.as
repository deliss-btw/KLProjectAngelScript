
namespace UWidget_SettingSubTitle
{
    const int ViewID = 0;
}
namespace UWidget_SettingItem
{
    const int ViewID = 0;

}
class UWidget_SettingSubTitle : UEUIActivatableWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_SettingSubTitle> SubTitle;
    UPROPERTY()
    FGetEUIModelRef SubTitleDelegate;

    UWidget_SettingSubTitle()
    {
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.SubTitle.Initialize(this, FName("VM_SettingSubTitle"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.SubTitleDelegate.IsBound())
        {
            this.SubTitle.SetRef(this.SubTitleDelegate.Execute());
        }
        return;
    }
}

class UWidget_SettingItem : UEUIActivatableWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_SettingItem> Item;
    UPROPERTY()
    UEUIDynamicWidget w_comp;
    UPROPERTY()
    FText RequireSaveItemTitle;
    UPROPERTY()
    TArray<FCommonDialogOption> RequireSaveItemOptions;
    FTimerHandle ApplyAndSaveDisplayOptionsTimerHandle;
    FTimerHandle ApplyGraphicOptionsTimerHandle;
    int ApplyGraphicOptionsCount = 0;
    FEUIModelWeakRef __Item;
    UPROPERTY()
    FGetEUIModelRef ItemDelegate;


    UFUNCTION()
    void Destruct_Implementation()
    {
        System::ClearAndInvalidateTimerHandle(__GetWorldContext(), this.ApplyAndSaveDisplayOptionsTimerHandle);
        System::ClearAndInvalidateTimerHandle(__GetWorldContext(), this.ApplyGraphicOptionsTimerHandle);
        return;
    }
    UFUNCTION()
    void OnMouseEnter_Implementation(const FGeometry &inout MyGeometry, const FPointerEvent &inout MouseEvent)
    {
        if (!(this.Item.IsValid()))
        {
            return;
        }
        OnComponentHovered();
        return;
    }
    UFUNCTION()
    void OnMouseLeave_Implementation(const FPointerEvent &inout MouseEvent)
    {
        if (!(this.Item.IsValid()))
        {
            return;
        }
        OnComponentUnhovered();
        return;
    }
    UFUNCTION()
    void DeferredApplyAndSaveDisplayOptions()
    {
        System::ClearAndInvalidateTimerHandle(__GetWorldContext(), this.ApplyAndSaveDisplayOptionsTimerHandle);
        UKLGameUserSettings::Get().ApplyDisplayOptions();
        UKLGameUserSettings::Get().SaveDisplayOptions();
        ::FVMS_SettingPage::Get(this).RefreshSettingValueCurrentValue();
        ::FVMS_SettingPage::Get(this).RefreshSettingValuePreviousValue();
        return;
    }
    UFUNCTION()
    void DeferredApplyGraphicOptions()
    {
        if (this.ApplyGraphicOptionsCount == 0)
        {
            if (::FVMS_SettingPage::Get(this).isInmediateApply)
            {
                UKLGameUserSettings::Get().ApplyNonResolutionGraphicOptions();
                ::FVMS_SettingPage::Get(this).isInmediateApply = false;
            }
            else
            {
                UKLGameUserSettings::Get().ApplyResolutionGraphicOptions();
            }
        }
        if (this.ApplyGraphicOptionsCount < 10)
        {
            ++this.ApplyGraphicOptionsCount;
            ::FVMS_SettingPage::Get(this).RefreshSettingValueCurrentValue();
            return;
        }
        this.ApplyGraphicOptionsCount = 0;
        System::ClearAndInvalidateTimerHandle(__GetWorldContext(), this.ApplyGraphicOptionsTimerHandle);
        UKLGameUserSettings::Get().SaveGraphicOptions();
        return;
    }
    UFUNCTION()
    void ApplyDisplayAndGraphicOptions()
    {
        int local_2 = 0;
        if (!(GetbNeedApply()))
        {
            return;
        }
        bool local_5 = ::FVMS_SettingPage::Get(this).isInmediateApply;
        if (local_5)
        {
            local_5 = true;
        }
        else
        {
            int local_3 = local_2;
            local_5 = (local_3 == 0);
        }
        ::FVMS_SettingPage::Get(this).isInmediateApply = local_5;
        System::ClearAndInvalidateTimerHandle(__GetWorldContext(), this.ApplyGraphicOptionsTimerHandle);
        this.ApplyGraphicOptionsTimerHandle = System::SetTimer(this, n"DeferredApplyGraphicOptions", 0.1f, true, false, 0.0f, 0.0f);
        bool local_1 = false;
        local_1.SetbNeedApply();
        return;
    }
    UFUNCTION()
    void RequireSaveItem()
    {
        if (!(GetbHasResolutionOptionChanged()))
        {
            return;
        }
        FDialogDynamicCallback local_6;
        local_6.BindUFunction(this, n"HandleRequireSaveItemAnswer");
        FCommonDialogParam local_10;
        local_10.bIsForbidIgnored = false;
        NSLOCTEXT("PlayerSettings", "RequireSaveItemTitle", "жЏђз¤є");
        ULocalPlayer local_50 = this.GetOwningLocalPlayer();
        return;
    }
    UFUNCTION()
    bool HandleRequireSaveItemAnswer(const FCommonDialogAnswer &inout Answer)
    {
        if (int(Answer.AnswerType) == 0)
        {
            int(GetPreviousValue()).InitializeApplyValue(0.0f);
        }
        else
        {
            if (int(Answer.AnswerType) == 1)
            {
                ApplyChangedValue();
                TEUIModelWeakRef<FVMS_SettingPage> local_8;
                local_8.GetOwnerPage();
                UpdateResolutionDropDownOptions();
                SyncPreviousValue();
                System::ClearAndInvalidateTimerHandle(__GetWorldContext(), this.ApplyAndSaveDisplayOptionsTimerHandle);
                this.ApplyAndSaveDisplayOptionsTimerHandle = System::SetTimer(this, n"DeferredApplyAndSaveDisplayOptions", 0.001f, false, false, 0.0f, 0.0f);
            }
        }
        return true;
    }
    UFUNCTION()
    void OnComponentWidgetDataChanged() const
    {
        if (this.w_comp != nullptr)
        {
            this.w_comp.SetDynamicWidgetData(GetComponentWidgetData());
        }
        return;
    }
    UFUNCTION()
    bool Item_bIsEnabled() const
    {
        FVM_SettingItem& local_2;
        bool local_5;
        if (local_2)
        {
            local_5 = local_2.GetbIsEnabled();
        }
        else
        {
            local_5 = false;
        }
        return local_5;
    }
    UFUNCTION()
    bool Item_bNeedApply() const
    {
        FVM_SettingItem& local_2;
        bool local_5;
        if (local_2)
        {
            local_5 = local_2.GetbNeedApply();
        }
        else
        {
            local_5 = false;
        }
        return local_5;
    }
    UFUNCTION()
    bool Item_bIsDisplayOrGraphics() const
    {
        FVM_SettingItem& local_2;
        bool local_5;
        if (local_2)
        {
            local_5 = local_2.GetbIsDisplayOrGraphics();
        }
        else
        {
            local_5 = false;
        }
        return local_5;
    }
    UFUNCTION()
    void Item_OnComponentHovered() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void Item_OnComponentUnhovered() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void Item_OnItemSelectedOrValueChanged(const float32 Value) const
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
        FVM_SettingItem& local_6;
        TEUIModelRef<FVM_SettingItem> local_2 = this.Item.AsRef();
        for (; It; )
        {
            FEUIReactiveSubscriberTrackScope local_56 = FEUIReactiveSubscriberTrackScope(It);
            switch (It.GetIndex())
            {
            case 0:
            {
                this.Item.TrackRead();
                if (local_6)
                {
                    local_6.TrackPropertyRead(::FVM_SettingItem::__IndexOf_bNeedApply());
                }
                if (local_6)
                {
                    this.ApplyDisplayAndGraphicOptions();
                }
                break;
            }
            case 1:
            {
                this.Item.TrackRead();
                if (local_6)
                {
                    local_6.TrackPropertyRead(::FVM_SettingItem::__IndexOf_bHasResolutionOptionChanged());
                }
                if (local_6)
                {
                    this.RequireSaveItem();
                }
                break;
            }
            case 2:
            {
                this.Item.TrackRead();
                if (local_6)
                {
                    local_6.TrackPropertyRead(::FVM_SettingItem::__IndexOf_ComponentWidgetData());
                    local_6.TrackPropertyRead(::FVM_SettingItem::__IndexOf_bRefreshComponentWidget());
                }
                if (local_6)
                {
                    this.OnComponentWidgetDataChanged();
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
                XError(ELog(17), "Remaining observed model change: ApplyDisplayAndGraphicOptions");
            }
            if (It.IsDirty(1))
            {
                XError(ELog(17), "Remaining observed model change: RequireSaveItem");
            }
            if (It.IsDirty(2))
            {
                XError(ELog(17), "Remaining observed model change: OnComponentWidgetDataChanged");
            }
            return;
        }
        this.__Item = local_2.opImplConv();
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.Item.Initialize(this, FName("VM_SettingItem"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.ItemDelegate.IsBound())
        {
            this.Item.SetRef(this.ItemDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_SettingSubTitle
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
namespace UWidget_SettingItem
{
void GetModelInfo(FEUIWidgetMetaInfo &inout Result)
{
    Result.ObservedModelChangesSubscriberNames.Add(FString("ApplyDisplayAndGraphicOptions"));
    Result.ObservedModelChangesSubscriberNames.Add(FString("RequireSaveItem"));
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnComponentWidgetDataChanged"));
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
