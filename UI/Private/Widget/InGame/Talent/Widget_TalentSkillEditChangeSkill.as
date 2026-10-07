
namespace UWidget_TalentSkillChangeWidget
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_TalentSkillChangeWidget : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_TalentEditPageChangeSkill> TalentSkillChangeEditPage;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_TalentEditPage> TalentEditPage;
    UPROPERTY()
    UEUICommonListView w_list_tab;
    UPROPERTY()
    UWidget_TalentSkillEditPage OwnerEditPage;
    FEUIModelWeakRef __TalentSkillChangeEditPage;
    UPROPERTY()
    FGetEUIModelRef TalentSkillChangeEditPageDelegate;
    UPROPERTY()
    FGetEUIModelRef TalentEditPageDelegate;

    UWidget_TalentSkillChangeWidget()
    {
        return;
    }
    UWidget_TalentSkillInfoItem GetSelectedInfoItem()
    {
        UUserWidget local_8;
        if (this.w_list_tab == nullptr)
        {
            return nullptr;
        }
        if (!(this.w_list_tab.TryGetSelectedEntryWidget(local_8)))
        {
            return nullptr;
        }
        return Cast<UWidget_TalentSkillInfoItem>(local_8);
    }
    UFUNCTION()
    void CloseSkillChange()
    {
        FVM_TalentEditPage& local_2;
        if (local_2)
        {
            local_2.CloseSkillChoice();
            return;
        }
        this.RemoveFromLayout();
        return;
    }
    void SetOwnerEditPage(const UWidget_TalentSkillEditPage InOwnerEditPage)
    {
        return;
    }
    UFUNCTION()
    void OnChangeSkillSelectionChanged(const int CurrentSkillIndex)
    {
        if (this.OwnerEditPage != nullptr)
        {
            this.InjectOwnerToDisplayedItems(this.OwnerEditPage);
        }
        return;
    }
    void InjectOwnerToDisplayedItems(const UWidget_TalentSkillEditPage InOwnerEditPage)
    {
        UWidget_TalentSkillInfoItem local_22;
        if (this.w_list_tab == nullptr)
        {
            return;
        }
        for (auto local_18 : this.w_list_tab.GetDisplayedEntryWidgets())
        {
            local_22 = Cast<UWidget_TalentSkillInfoItem>(local_18);
            if (local_22 != nullptr)
            {
                local_22.SetOwnerEditPage(InOwnerEditPage);
            }
        }
        return;
    }
    UFUNCTION()
    void TalentSkillChangeEditPage_OnSkillItemSelected(const FEUIModelContainer &inout SkillItem) const
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
        FVM_TalentEditPageChangeSkill& local_6;
        TEUIModelRef<FVM_TalentEditPageChangeSkill> local_2 = this.TalentSkillChangeEditPage.AsRef();
        for (; It; )
        {
            FEUIReactiveSubscriberTrackScope local_56 = FEUIReactiveSubscriberTrackScope(It);
            int local_57 = It.GetIndex();
            if (local_57 <= 0)
            {
                if (local_57 != 0)
                {
                }
                else
                {
                    this.TalentSkillChangeEditPage.TrackRead();
                    if (local_6)
                    {
                        local_6.TrackPropertyRead(::FVM_TalentEditPageChangeSkill::__IndexOf_CurrentSkillIndex());
                    }
                    if (local_6)
                    {
                        this.OnChangeSkillSelectionChanged(local_6.GetCurrentSkillIndex());
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
                XError(ELog(17), "Remaining observed model change: OnChangeSkillSelectionChanged");
            }
            return;
        }
        this.__TalentSkillChangeEditPage = local_2.opImplConv();
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.TalentSkillChangeEditPage.Initialize(this, FName("VM_TalentEditPageChangeSkill"), EEUIWidgetRefModelCreationType(0), false);
        this.TalentEditPage.Initialize(this, FName("VM_TalentEditPage"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.TalentSkillChangeEditPageDelegate.IsBound())
        {
            this.TalentSkillChangeEditPage.SetRef(this.TalentSkillChangeEditPageDelegate.Execute());
        }
        if (this.TalentEditPageDelegate.IsBound())
        {
            this.TalentEditPage.SetRef(this.TalentEditPageDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_TalentSkillChangeWidget
{
void GetModelInfo(FEUIWidgetMetaInfo &inout Result)
{
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnChangeSkillSelectionChanged"));
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
