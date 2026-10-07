
namespace UWidget_TalentSkillEditPage
{
    const int ViewID = 0;
}
namespace UWidget_TalentSkillEditPageWidget
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_TalentSkillEditPage : UEUIActivatableWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_Page> Page;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_TalentEditPage> TalentEditPage;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_AvatarShowcase> Showcase;
    UPROPERTY()
    UEUIUserWidget TalentReplaceSkill;
    UPROPERTY()
    UWidget w_entry_skill;
    UPROPERTY()
    UWidgetAnimation Anim_Talent_Details;
    UPROPERTY()
    float32 ResetFocusToReplaceWaitTime;
    UPROPERTY()
    bool bNeedResetFocusToReplace = false;
    UPROPERTY()
    bool bNeedResetFocusToTalentTree = false;
    UPROPERTY()
    bool bFocusOnSkillList = false;
    UPROPERTY()
    UScrollBox RegisteredScrollBox;
    UPROPERTY()
    FEUIActionBinding OnShowRightSkillDetail;
    UPROPERTY()
    FEUIActionBinding OnFocusToEquipmentSkillSlist;
    UPROPERTY()
    bool bDetailAnimInitialized = false;
    UPROPERTY()
    bool bLastDetailSelected = false;
    UPROPERTY()
    FConfigVM_AvatarShowcase ShowcaseConfig;
    FEUIModelWeakRef __TalentEditPage;
    UPROPERTY()
    FGetEUIModelRef PageDelegate;
    UPROPERTY()
    FGetEUIModelRef TalentEditPageDelegate;
    UPROPERTY()
    FGetEUIModelRef ShowcaseDelegate;


    UFUNCTION()
    void Tick_Implementation(const FGeometry &inout MyGeometry, const float32 InDeltaTime)
    {
        if (this.bNeedResetFocusToReplace)
        {
            this.ResetFocusToReplaceWaitTime -= InDeltaTime;
            if (this.ResetFocusToReplaceWaitTime < 0.0f)
            {
                this.bNeedResetFocusToReplace = false;
                this.RuleSetUserFocus(this.TalentReplaceSkill);
                this.OnSkillChangePageReady();
            }
        }
        return;
    }
    UFUNCTION()
    void OnViewBind_Implementation()
    {
        TEUIModelRef<FVM_AvatarShowcase> local_2;
        local_2;
        local_2.SetCurrentShowcase();
        UWidget_TalentSkillChangeWidget local_6 = this.GetSkillChangeWidget();
        if (local_6 != nullptr)
        {
            local_6.SetOwnerEditPage(this);
        }
        return;
    }
    UFUNCTION()
    void OnPendingClose(const bool bPendingClose)
    {
        if (bPendingClose)
        {
            this.ClosePage(false);
        }
        return;
    }
    UFUNCTION()
    void OnSkillListSelectChange(const int CurrentSkillIndex)
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    UFUNCTION()
    void OnSelectedDetailTalentChanged()
    {
        bool local_2 = GetIsDetailSelected();
        if (this.Showcase.IsValid())
        {
            if (local_2)
            {
            }
            else
            {
            }
            ChangeShowcaseConfigIndex();
        }
        if (!(this.bDetailAnimInitialized))
        {
            this.bDetailAnimInitialized = true;
            this.bLastDetailSelected = local_2;
            return;
        }
        if (!(local_2) == !(this.bLastDetailSelected))
        {
            return;
        }
        this.bLastDetailSelected = local_2;
        if (local_2)
        {
            this.OnFocusToEquipmentSkillSlist.SetCollapsed(true);
            this.PlayAnimationForward(this.Anim_Talent_Details, 1.0f, false);
            return;
        }
        this.OnFocusToEquipmentSkillSlist.SetCollapsed(false);
        this.PlayAnimationReverse(this.Anim_Talent_Details, 1.0f, false);
        return;
    }
    UFUNCTION()
    void OnSkillChoiceOpenChanged(const bool bSkillChoiceOpen)
    {
        if (bSkillChoiceOpen)
        {
            this.OnFocusToEquipmentSkillSlist.SetCollapsed(true);
            this.OnShowRightSkillDetail.SetDisabled(true);
            this.bNeedResetFocusToTalentTree = false;
            this.bNeedResetFocusToReplace = true;
            this.ResetFocusToReplaceWaitTime = 0.2f;
            return;
        }
        this.OnFocusToEquipmentSkillSlist.SetCollapsed(false);
        this.OnShowRightSkillDetail.SetDisabled(false);
        this.RuleSetUserFocus(this.w_entry_skill);
        this.bNeedResetFocusToReplace = false;
        this.UnregisterCurrentScrollRecipient();
        return;
    }
    UWidget_TalentSkillChangeWidget GetSkillChangeWidget()
    {
        return Cast<UWidget_TalentSkillChangeWidget>(this.TalentReplaceSkill);
    }
    UWidget_TalentSkillInfoItem GetSelectedSkillInfoItem()
    {
        UWidget_TalentSkillChangeWidget local_4 = this.GetSkillChangeWidget();
        if (local_4 == nullptr)
        {
            return nullptr;
        }
        return local_4.GetSelectedInfoItem();
    }
    void OnSkillChangePageReady()
    {
        UWidget_TalentSkillChangeWidget local_4 = this.GetSkillChangeWidget();
        if (local_4 == nullptr)
        {
            return;
        }
        local_4.InjectOwnerToDisplayedItems(this);
        UWidget_TalentSkillInfoItem local_10 = local_4.GetSelectedInfoItem();
        if (local_10 != nullptr)
        {
            this.OnItemSelected(local_10.GetContextScrollBox());
        }
        return;
    }
    void OnItemSelected(const UScrollBox Box)
    {
        this.UnregisterCurrentScrollRecipient();
        if (Box == nullptr)
        {
            return;
        }
        this.RegisterScrollRecipientExternal(Box);
        return;
    }
    void OnItemDeselected(const UScrollBox Box)
    {
        if ((Box != nullptr && ((this.RegisteredScrollBox == Box))))
        {
            this.UnregisterCurrentScrollRecipient();
        }
        return;
    }
    void UnregisterCurrentScrollRecipient()
    {
        if (this.RegisteredScrollBox != nullptr)
        {
            this.UnregisterScrollRecipientExternal(this.RegisteredScrollBox);
            this.RegisteredScrollBox = nullptr;
        }
        return;
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
    void TalentEditPage_OnSkillItemSelected(const FEUIModelContainer &inout SkillItem) const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder::PushArg local_42;
        local_42.opCall(SkillItem);
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void TalentEditPage_OnSkillItemSelectedSlot(const ESkillSlot SkillSlot) const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder::PushArg local_42;
        local_42.opCall(SkillSlot);
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void TalentEditPage_SelectNextSkill() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void TalentEditPage_SelectPrevSkill() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void TalentEditPage_SelectFirst() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void TalentEditPage_ClosePage() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void TalentEditPage_OnBlankClick() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void TalentEditPage_CloseSkillChoice() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void TalentEditPage_UpdateSkillSellectType(const ESkillSlot SkillSlot, const ESkillType SkillType) const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder::PushArg local_42;
        local_42.opCall(SkillSlot);
        FEUIWidgetModelCallbackBuilder::PushArg local_46;
        local_46.opCall(SkillType);
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void TalentEditPage_OnSwitchCurSelectChoiceEquip() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void TalentEditPage_ShowTalentNodeHoverOpenDetails() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    void HandleObservedModelChanges(FEUIReactiveSubscriberIterator &inout It)
    {
        FVM_TalentEditPage& local_6;
        TEUIModelRef<FVM_TalentEditPage> local_2 = this.TalentEditPage.AsRef();
        for (; It; )
        {
            FEUIReactiveSubscriberTrackScope local_56 = FEUIReactiveSubscriberTrackScope(It);
            switch (It.GetIndex())
            {
            case 0:
            {
                this.TalentEditPage.TrackRead();
                if (local_6)
                {
                    local_6.TrackPropertyRead(::FVM_TalentEditPage::__IndexOf_bPendingClose());
                }
                if (local_6)
                {
                    this.OnPendingClose(local_6.GetbPendingClose());
                }
                break;
            }
            case 1:
            {
                this.TalentEditPage.TrackRead();
                if (local_6)
                {
                    local_6.TrackPropertyRead(::FVM_TalentEditPage::__IndexOf_CurrentSkillIndex());
                }
                if (local_6)
                {
                    this.OnSkillListSelectChange(local_6.GetCurrentSkillIndex());
                }
                break;
            }
            case 2:
            {
                this.TalentEditPage.TrackRead();
                if (local_6)
                {
                    local_6.TrackPropertyRead(::FVM_TalentEditPage::__IndexOf_SelectedDetailTalentNode());
                }
                if (local_6)
                {
                    this.OnSelectedDetailTalentChanged();
                }
                break;
            }
            case 3:
            {
                this.TalentEditPage.TrackRead();
                if (local_6)
                {
                    local_6.TrackPropertyRead(::FVM_TalentEditPage::__IndexOf_TalentSkillChangePageIsOpen());
                }
                if (local_6)
                {
                    this.OnSkillChoiceOpenChanged(local_6.GetTalentSkillChangePageIsOpen());
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
                XError(ELog(17), "Remaining observed model change: OnPendingClose");
            }
            if (It.IsDirty(1))
            {
                XError(ELog(17), "Remaining observed model change: OnSkillListSelectChange");
            }
            if (It.IsDirty(2))
            {
                XError(ELog(17), "Remaining observed model change: OnSelectedDetailTalentChanged");
            }
            if (It.IsDirty(3))
            {
                XError(ELog(17), "Remaining observed model change: OnSkillChoiceOpenChanged");
            }
            return;
        }
        this.__TalentEditPage = local_2.opImplConv();
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.Page.Initialize(this, FName("VM_Page"), EEUIWidgetRefModelCreationType(0), false);
        this.TalentEditPage.Initialize(this, FName("VM_TalentEditPage"), EEUIWidgetRefModelCreationType(0), false);
        this.Showcase.Initialize(this, FName("VM_AvatarShowcase"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.PageDelegate.IsBound())
        {
            this.Page.SetRef(this.PageDelegate.Execute());
        }
        if (this.TalentEditPageDelegate.IsBound())
        {
            this.TalentEditPage.SetRef(this.TalentEditPageDelegate.Execute());
        }
        if (this.ShowcaseDelegate.IsBound())
        {
            this.Showcase.SetRef(this.ShowcaseDelegate.Execute());
        }
        return;
    }
}

UCLASS(Abstract)
class UWidget_TalentSkillEditPageWidget : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_TalentEditPage> TalentEditPage;
    UPROPERTY()
    FGetEUIModelRef TalentEditPageDelegate;

    UWidget_TalentSkillEditPageWidget()
    {
        return;
    }
    UFUNCTION()
    void TalentEditPage_OnSkillItemSelected(const FEUIModelContainer &inout SkillItem) const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder::PushArg local_42;
        local_42.opCall(SkillItem);
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void TalentEditPage_OnSkillItemSelectedSlot(const ESkillSlot SkillSlot) const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder::PushArg local_42;
        local_42.opCall(SkillSlot);
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void TalentEditPage_SelectNextSkill() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void TalentEditPage_SelectPrevSkill() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void TalentEditPage_SelectFirst() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void TalentEditPage_ClosePage() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void TalentEditPage_OnBlankClick() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void TalentEditPage_CloseSkillChoice() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void TalentEditPage_UpdateSkillSellectType(const ESkillSlot SkillSlot, const ESkillType SkillType) const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder::PushArg local_42;
        local_42.opCall(SkillSlot);
        FEUIWidgetModelCallbackBuilder::PushArg local_46;
        local_46.opCall(SkillType);
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void TalentEditPage_OnSwitchCurSelectChoiceEquip() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void TalentEditPage_ShowTalentNodeHoverOpenDetails() const
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
        this.TalentEditPage.Initialize(this, FName("VM_TalentEditPage"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.TalentEditPageDelegate.IsBound())
        {
            this.TalentEditPage.SetRef(this.TalentEditPageDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_TalentSkillEditPage
{
void GetModelInfo(FEUIWidgetMetaInfo &inout Result)
{
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnPendingClose"));
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnSkillListSelectChange"));
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnSelectedDetailTalentChanged"));
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnSkillChoiceOpenChanged"));
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
namespace UWidget_TalentSkillEditPageWidget
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
