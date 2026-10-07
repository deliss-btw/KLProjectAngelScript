
namespace UWidget_PendingConfirmBubble
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_PendingConfirmBubble : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_PendingConfirmItem> Bubble;
    UPROPERTY()
    TEUIWidgetModelRef<FVMS_PendingConfirmQueue> QueueVM;
    UPROPERTY()
    bool bHasStartedFadeOut = false;
    UPROPERTY()
    UEUIKeyPrompt BP_KeyPrompt_Refuse;
    UPROPERTY()
    UEUIKeyPrompt BP_KeyPrompt_RefuseHandle;
    UPROPERTY()
    UEUIKeyPrompt BP_KeyPrompt_Accept;
    UPROPERTY()
    UEUIKeyPrompt BP_KeyPrompt_AcceptHandle;
    UPROPERTY()
    FEUIActionBinding OnAcceptAction;
    UPROPERTY()
    FEUIActionBinding OnRefuseAction;
    UPROPERTY()
    UEUITextBlock w_txt_accept;
    UPROPERTY()
    UEUITextBlock w_txt_refuse;
    UPROPERTY()
    FEUIActionBinding OnAcceptAction_Handle;
    UPROPERTY()
    FEUIActionBinding OnRefuseAction_Handle;
    UPROPERTY()
    FEUIActionBinding OnShowFull;
    UPROPERTY()
    UWidget Root;
    FEUIModelWeakRef __QueueVM;
    UPROPERTY()
    FGetEUIModelRef BubbleDelegate;


    UFUNCTION()
    void OnViewBind_Implementation()
    {
        this.PlayAnimation(this.Anim_In, 0.0f, 1, EUMGSequencePlayMode(0), 1.0f, (0 != 0));
        if ((int(::UICommonUtil::GetCurrentInputType(this.GetOwningLocalPlayer()))) == 1)
        {
            this.BP_KeyPrompt_RefuseHandle.SetVisibility(ESlateVisibility(0));
            this.BP_KeyPrompt_AcceptHandle.SetVisibility(ESlateVisibility(0));
            this.BP_KeyPrompt_Refuse.SetVisibility(ESlateVisibility(1));
            this.BP_KeyPrompt_Accept.SetVisibility(ESlateVisibility(1));
            this.w_txt_accept.SetText(NSLOCTEXT("PendingConfirm", "AcceptTextGamepad", "й•їжЊ‰жЋҐеЏ—"));
            this.w_txt_refuse.SetText(NSLOCTEXT("PendingConfirm", "RefuseTextGamepad", "й•їжЊ‰ж‹’з»ќ"));
            return;
        }
        this.BP_KeyPrompt_RefuseHandle.SetVisibility(ESlateVisibility(1));
        this.BP_KeyPrompt_AcceptHandle.SetVisibility(ESlateVisibility(1));
        this.BP_KeyPrompt_Refuse.SetVisibility(ESlateVisibility(0));
        this.BP_KeyPrompt_Accept.SetVisibility(ESlateVisibility(0));
        this.w_txt_accept.SetText(NSLOCTEXT("PendingConfirm", "AcceptTextKeyMouse", "жЋҐеЏ—"));
        this.w_txt_refuse.SetText(NSLOCTEXT("PendingConfirm", "RefuseTextKeyMouse", "ж‹’з»ќ"));
        return;
    }
    UFUNCTION()
    void Tick_Implementation(const FGeometry &inout MyGeometry, const float32 InDeltaTime)
    {
        if (!(this.Bubble.IsValid()))
        {
            return;
        }
        return;
    }
    UFUNCTION()
    void OnActionButtonClicked(const EPendingConfirmAction Action)
    {
        if (!(this.Bubble.IsValid()))
        {
            return;
        }
        return;
    }
    UFUNCTION()
    void OnSelectMainTabUpdated(const bool bExpanded)
    {
        if (bExpanded)
        {
            this.Root.SetVisibility(ESlateVisibility(2));
            this.OnAcceptAction.SetDisabled(true);
            this.OnRefuseAction.SetDisabled(true);
            this.OnAcceptAction_Handle.SetDisabled(true);
            this.OnRefuseAction_Handle.SetDisabled(true);
            this.OnShowFull.SetDisabled(true);
            return;
        }
        this.Root.SetVisibility(ESlateVisibility(0));
        this.OnAcceptAction.SetDisabled(false);
        this.OnRefuseAction.SetDisabled(false);
        this.OnAcceptAction_Handle.SetDisabled(false);
        this.OnRefuseAction_Handle.SetDisabled(false);
        this.OnShowFull.SetDisabled(false);
        return;
    }
    UFUNCTION()
    void Bubble_OnConfirm() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void Bubble_OnCancel() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void QueueVM_ShowFullList() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void QueueVM_HideFullList() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    void HandleObservedModelChanges(FEUIReactiveSubscriberIterator &inout It)
    {
        FVMS_PendingConfirmQueue& local_6;
        TEUIModelRef<FVMS_PendingConfirmQueue> local_2 = this.QueueVM.AsRef();
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
                    this.QueueVM.TrackRead();
                    if (local_6)
                    {
                        local_6.TrackPropertyRead(::FVMS_PendingConfirmQueue::__IndexOf_bExpanded());
                    }
                    if (local_6)
                    {
                        this.OnSelectMainTabUpdated(local_6.GetbExpanded());
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
                XError(ELog(17), "Remaining observed model change: OnSelectMainTabUpdated");
            }
            return;
        }
        this.__QueueVM = local_2.opImplConv();
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.Bubble.Initialize(this, FName("VM_PendingConfirmItem"), EEUIWidgetRefModelCreationType(0), false);
        this.QueueVM.Initialize(this, FName("VMS_PendingConfirmQueue"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.BubbleDelegate.IsBound())
        {
            this.Bubble.SetRef(this.BubbleDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_PendingConfirmBubble
{
void GetModelInfo(FEUIWidgetMetaInfo &inout Result)
{
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnSelectMainTabUpdated"));
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
