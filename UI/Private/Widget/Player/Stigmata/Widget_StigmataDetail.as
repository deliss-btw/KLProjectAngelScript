
namespace UWidget_StigmataDetail
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_StigmataDetail : UEUIActivatableWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_StigmataDetail> StigmataDetail;
    UPROPERTY()
    UEUIScrollBox w_scroll_content;
    UPROPERTY()
    UEUIDynamicEntryBox w_entry_tree;
    UPROPERTY()
    UWidget_StigmataGifts UI_AccountLevel_Comp_InherentAbility;
    UPROPERTY()
    FEUIActionBinding LevelIntrinsicAction;
    UPROPERTY()
    FEUIActionBinding LevelExtrinsicAction;
    UPROPERTY()
    FEUIActionBinding ViewLimitBreakAction;
    UPROPERTY()
    FEUIActionBinding JumpLimitBreakAction;
    bool bScrolledToBottom = false;
    float32 SCROLL_BOTTOM_THRESHOLD = 1.0f;
    UPROPERTY()
    UWidget PendingScrollFocusTarget;
    FEUIModelWeakRef __StigmataDetail;
    UPROPERTY()
    FGetEUIModelRef StigmataDetailDelegate;


    UFUNCTION()
    void Construct_Implementation()
    {
        if (this.w_scroll_content != nullptr)
        {
            this.w_scroll_content.OnUserScrolled.AddUFunction(this, n"OnScrollChanged");
            this.w_scroll_content.OnScrollFinished.AddUFunction(this, n"OnScrollFinished");
        }
        this.LevelIntrinsicAction.SetCollapsed(true);
        this.LevelExtrinsicAction.SetCollapsed(true);
        return;
    }
    UFUNCTION()
    void OnReadyBreakthroughChanged(const bool bReadyBreakthrough)
    {
        this.ViewLimitBreakAction.SetCollapsed(bReadyBreakthrough);
        bool local_1 = !(bReadyBreakthrough);
        this.JumpLimitBreakAction.SetCollapsed(local_1);
        return;
    }
    UFUNCTION()
    void OnTreeRowsChanged()
    {
        if (this.w_scroll_content != nullptr)
        {
            this.w_scroll_content.ForceLayoutPrepass();
        }
        this.RefreshScrollActions();
        return;
    }
    void RefreshScrollActions()
    {
        if (!(this.CanScroll()))
        {
            this.LevelIntrinsicAction.SetCollapsed(true);
            this.LevelExtrinsicAction.SetCollapsed(true);
            this.bScrolledToBottom = false;
            return;
        }
        this.LevelIntrinsicAction.SetCollapsed(this.bScrolledToBottom);
        this.LevelExtrinsicAction.SetCollapsed(!(this.bScrolledToBottom));
        return;
    }
    bool CanScroll() const
    {
        if (this.w_scroll_content == nullptr)
        {
            return false;
        }
        return (this.w_scroll_content.GetScrollOffsetOfEnd() > this.SCROLL_BOTTOM_THRESHOLD);
    }
    UFUNCTION()
    void AutoScroll()
    {
        if (!(this.CanScroll()))
        {
            return;
        }
        this.w_scroll_content.EndInertialScrolling();
        if (this.bScrolledToBottom)
        {
            this.PendingScrollFocusTarget = this.w_entry_tree;
            this.w_scroll_content.ScrollToStart();
            this.SetScrolledToBottom(false);
            return;
        }
        this.PendingScrollFocusTarget = this.UI_AccountLevel_Comp_InherentAbility;
        this.w_scroll_content.ScrollToEnd();
        this.SetScrolledToBottom(true);
        return;
    }
    UFUNCTION()
    void OnScrollFinished()
    {
        bool local_18;
        if (this.w_scroll_content == nullptr || ((this.PendingScrollFocusTarget == nullptr)))
        {
            return;
        }
        UWidget local_12 = this.UI_AccountLevel_Comp_InherentAbility;
        bool local_7 = (this.PendingScrollFocusTarget == local_12);
        float32 local_14 = this.w_scroll_content.GetScrollOffset();
        float32 local_13 = this.w_scroll_content.GetScrollOffsetOfEnd();
        if (local_7)
        {
            local_18 = ((local_13 - local_14) <= this.SCROLL_BOTTOM_THRESHOLD);
        }
        else
        {
            local_18 = (local_14 <= this.SCROLL_BOTTOM_THRESHOLD);
        }
        UWidget local_20 = this.PendingScrollFocusTarget;
        this.PendingScrollFocusTarget = nullptr;
        if (local_18)
        {
            this.RuleSetUserFocus(local_20);
        }
        return;
    }
    UFUNCTION()
    void OnScrollChanged(const float32 CurrentOffset)
    {
        if (this.w_scroll_content == nullptr)
        {
            return;
        }
        this.PendingScrollFocusTarget = nullptr;
        this.SetScrolledToBottom(((this.w_scroll_content.GetScrollOffsetOfEnd() - CurrentOffset) <= this.SCROLL_BOTTOM_THRESHOLD));
        return;
    }
    void SetScrolledToBottom(const bool bNewValue)
    {
        bool local_3;
        if (!(this.CanScroll()))
        {
            local_3 = false;
        }
        else
        {
            bool local_2 = (!(this.bScrolledToBottom) == !(bNewValue));
            local_3 = local_2;
        }
        if (local_3)
        {
            return;
        }
        if (this.CanScroll())
        {
            local_3 = bNewValue;
        }
        else
        {
            local_3 = false;
        }
        this.bScrolledToBottom = local_3;
        this.RefreshScrollActions();
        return;
    }
    UFUNCTION()
    void StigmataDetail_GotoBreakthrough() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void StigmataDetail_GotoOverView() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    void HandleObservedModelChanges(FEUIReactiveSubscriberIterator &inout It)
    {
        FVM_StigmataDetail& local_6;
        TEUIModelRef<FVM_StigmataDetail> local_2 = this.StigmataDetail.AsRef();
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
                    this.StigmataDetail.TrackRead();
                    if (local_6)
                    {
                        local_6.TrackPropertyRead(::FVM_StigmataDetail::__IndexOf_bReadyBreakthrough());
                    }
                    if (local_6)
                    {
                        this.OnReadyBreakthroughChanged(local_6.GetbReadyBreakthrough());
                    }
                    this.StigmataDetail.TrackRead();
                    if (local_6)
                    {
                        local_6.TrackPropertyRead(::FVM_StigmataDetail::__IndexOf_TreeRows());
                    }
                    if (local_6)
                    {
                        this.OnTreeRowsChanged();
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
                XError(ELog(17), "Remaining observed model change: OnReadyBreakthroughChanged");
            }
            if (It.IsDirty(1))
            {
                XError(ELog(17), "Remaining observed model change: OnTreeRowsChanged");
            }
            return;
        }
        this.__StigmataDetail = local_2.opImplConv();
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.StigmataDetail.Initialize(this, FName("VM_StigmataDetail"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.StigmataDetailDelegate.IsBound())
        {
            this.StigmataDetail.SetRef(this.StigmataDetailDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_StigmataDetail
{
void GetModelInfo(FEUIWidgetMetaInfo &inout Result)
{
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnReadyBreakthroughChanged"));
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnTreeRowsChanged"));
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
