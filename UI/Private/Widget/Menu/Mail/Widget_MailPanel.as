
namespace UWidget_MailPanel
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_MailPanel : UEUIActivatableWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_MailPanel> MailPanel;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_MailDetail> SelectedMailDetail;
    UPROPERTY()
    UEUICommonListView w_list_email;
    UPROPERTY()
    UWidget_MailDetail UI_Email_Comp_Content;
    UPROPERTY()
    FEUIActionBinding BackOrCloseBinding;
    UPROPERTY()
    FEUIActionBinding ViewDetailsBinding;
    UPROPERTY()
    FEUIActionBinding OpenLinkBinding;
    UPROPERTY()
    FEUIActionBinding ClaimBinding;
    UPROPERTY()
    FEUIActionBinding ClaimAllPCBinding;
    UPROPERTY()
    FEUIActionBinding ClaimAllGamepadBinding;
    UPROPERTY()
    FEUIActionBinding DeleteBinding;
    UPROPERTY()
    FEUIActionBinding ClearReadPCBinding;
    UPROPERTY()
    FEUIActionBinding ClearReadGamepadBinding;
    bool bIsUpdatingView = false;
    FEUIModelWeakRef __MailPanel;
    FEUIModelWeakRef __SelectedMailDetail;
    UPROPERTY()
    FGetEUIModelRef MailPanelDelegate;
    UPROPERTY()
    FGetEUIModelRef SelectedMailDetailDelegate;


    UFUNCTION()
    void OnInitialized_Implementation()
    {
        this.w_list_email.BP_OnItemClicked.AddUFunction(this, n"OnMailItemClicked");
        this.w_list_email.BP_OnItemSelectionChanged.AddUFunction(this, n"OnMailItemSelectionChanged");
        this.w_list_email.BP_OnListViewScrolled.AddUFunction(this, n"OnMailListScrolled");
        UEUIInputSubsystem::Get(this.GetOwningLocalPlayer()).OnInputMethodChanged.AddUFunction(this, n"OnInputMethodChanged");
        return;
    }
    UFUNCTION()
    void OnViewBind_Implementation()
    {
        this.bIsUpdatingView = false;
        if (!(this.MailPanel))
        {
            this.MailPanel.SetRef(TEUIModelRef<FVM_MailPanel>(::FVM_MailPanel::Create(this)));
        }
        this.SelectedMailDetail.SetRef(this.MailPanel.opArrow().GetMailDetailVM());
        if (this.UI_Email_Comp_Content != nullptr)
        {
            this.UI_Email_Comp_Content.SetVisibility(ESlateVisibility(1));
            UEUITextBlock local_12 = this.UI_Email_Comp_Content.GetContentTextBlock();
            if (local_12 != nullptr)
            {
                local_12.OnHyperlinkClicked.BindUFunction(this, n"OnMailContentHyperlinkClicked");
            }
        }
        this.RefreshActionBindingVisibility();
        return;
    }
    UFUNCTION()
    void HandleRelatedFocusChanged_Implementation()
    {
        if (this.IsInFocusPath())
        {
            this.RefreshActionBindingVisibility();
        }
        return;
    }
    bool IsListFocused() const
    {
        return this.IsPartOfFocusPath(this.w_list_email);
    }
    UFUNCTION()
    void OnInputMethodChanged(const EEUIInputType NewInputType)
    {
        this.RefreshActionBindingVisibility();
        return;
    }
    UFUNCTION()
    void OnMailItemClicked(const FEUIModelContainer &inout Item)
    {
        TEUIModelRef<FVM_MailBriefItem> local_8 = TEUIModelRef<FVM_MailBriefItem>(FEUIModelContainer::GetModel(Item).opCall());
        if (local_8)
        {
            int local_10 = GetMailId();
            this.MailPanel.opArrow().SelectMail();
        }
        return;
    }
    UFUNCTION()
    void OnMailItemSelectionChanged(const FEUIModelContainer &inout Item, const bool bIsSelected)
    {
        if ((bIsSelected && !(this.bIsUpdatingView)))
        {
            this.RefreshActionBindingVisibility();
            TEUIModelRef<FVM_MailBriefItem> local_10 = TEUIModelRef<FVM_MailBriefItem>(FEUIModelContainer::GetModel(Item).opCall());
            if (local_10)
            {
                int local_11 = GetMailId();
                this.MailPanel.opArrow().SelectMail();
            }
        }
        return;
    }
    UFUNCTION()
    void OnMailListScrolled(const float32 ItemOffset, const float32 DistanceRemaining)
    {
        int local_2 = this.w_list_email.GetNumItems();
        if ((local_2 > 0 && (((ItemOffset + 15.0f) >= local_2))))
        {
            this.MailPanel.opArrow().LoadNextPage();
        }
        return;
    }
    UFUNCTION()
    void OnSelectedMailIndexChanged(const int Index)
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    UFUNCTION()
    void OnMailDetailVMChanged(const TEUIModelRef<FVM_MailDetail> &inout InMailDetail)
    {
        this.SelectedMailDetail.SetRef(InMailDetail);
        return;
    }
    UFUNCTION()
    void OnCanClaimAttachmentChanged(const bool bCanClaim)
    {
        this.RefreshActionBindingVisibility();
        return;
    }
    UFUNCTION()
    void OnHasRewardDisplayChanged(const bool bHasReward)
    {
        this.RefreshActionBindingVisibility();
        return;
    }
    UFUNCTION()
    void OnHasClaimableAttachmentChanged(const bool bHasClaimable)
    {
        this.RefreshActionBindingVisibility();
        return;
    }
    UFUNCTION()
    void OnHasDeletableReadMailChanged(const bool bHasDeletable)
    {
        this.RefreshActionBindingVisibility();
        return;
    }
    UFUNCTION()
    void OnBackOrClosePressed()
    {
        bool local_2 = !(this.MailPanel) || this.MailPanel.opArrow().IsMailEmpty();
        if ((int(this.GetCurrentInputType())) == 1 && !(this.IsListFocused()) && !(local_2))
        {
            this.OnBackToList();
            return;
        }
        this.ClosePage(false);
        return;
    }
    UFUNCTION()
    void OnViewDetailsPressed()
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    UFUNCTION()
    void OnOpenLinkPressed()
    {
        if (this.UI_Email_Comp_Content == nullptr)
        {
            return;
        }
        UEUITextBlock local_6 = this.UI_Email_Comp_Content.GetContentTextBlock();
        if (local_6 == nullptr)
        {
            return;
        }
        TArray<FEUIHyperlinkInfo> local_16 = local_6.GetHyperlinkInfos();
        if (local_16.Num() > 0)
        {
            local_6.HandleHyperlinkClicked(local_16[0]);
        }
        return;
    }
    UFUNCTION()
    bool OnMailContentHyperlinkClicked(const FEUIHyperlinkInfo &in Info)
    {
        bool local_4 = Info.Href.Contains("{playeruid}", ESearchCase(1), ESearchDir(0));
        bool local_1 = Info.Href.Contains("{level}", ESearchCase(1), ESearchDir(0));
        if (Info.Href.IsEmpty() || (!(local_4) && !(local_1)))
        {
            return false;
        }
        TEUIModelRef<FM_Player> local_10 = ::FMS_PlayerData::Get(this).GetLocalPlayerData();
        if (!(local_10.IsValid()))
        {
            XWarning(ELog(16), FString().Append("Mail hyperlink skipped: local player data is invalid, href=").Append(Info.Href));
            return true;
        }
        FString local_22 = FString(Info.Href);
        if (local_4)
        {
            int local_24 = GetPlayerUid();
            if (local_24 == 0)
            {
                XWarning(ELog(16), FString().Append("Mail hyperlink skipped: local player uid is 0, href=").Append(Info.Href));
                return true;
            }
            local_22 = local_22.Replace("{playeruid}", FString().Append(local_24), ESearchCase(1));
        }
        if (local_1)
        {
            int local_30 = GetLevel();
            if (local_30 <= 0)
            {
                XWarning(ELog(16), FString().Append("Mail hyperlink skipped: local player level is invalid, href=").Append(Info.Href));
                return true;
            }
            local_22 = local_22.Replace("{level}", FString().Append(local_30), ESearchCase(1));
        }
        FString local_34;
        FPlatformProcess::LaunchURL(local_22, FString(), local_34);
        if (local_34.Len() > 0)
        {
            XWarning(ELog(16), FString().Append("Mail hyperlink launch failed: ").Append(local_34).Append(", href=").Append(local_22));
        }
        return true;
    }
    UFUNCTION()
    void OnClaimPressed()
    {
        if (this.MailPanel.opArrow().GetMailDetailVM())
        {
            this.MailPanel.opArrow().GetMailDetailVM().opArrow().ClaimAttachment();
        }
        this.OnBackToList();
        return;
    }
    UFUNCTION()
    void OnClaimAllPressed()
    {
        this.MailPanel.opArrow().ClaimAllAttachment();
        this.OnBackToList();
        return;
    }
    UFUNCTION()
    void OnDeletePressed()
    {
        if (!(this.MailPanel) || !(this.MailPanel.opArrow().GetMailDetailVM()))
        {
            return;
        }
        if (this.MailPanel.opArrow().GetMailDetailVM().opArrow().GetHasAttachment())
        {
            FDialogDynamicCallback local_10;
            local_10.BindUFunction(this, n"OnConfirmDeleteMail");
            FText local_16 = NSLOCTEXT("Mail", "DialogCancel", "иї”е›ћ");
            FText local_20 = NSLOCTEXT("Mail", "DialogConfirm", "зЎ®и®¤");
            FDialogCallback local_52 = FDialogCallback(local_10);
            FText local_56 = NSLOCTEXT("Mail", "DeleteMailWithAttachment", "иЇҐй‚®д»¶еђ«жњ‰й™„д»¶жњЄйў†еЏ–пјЊжЇеђ¦е€ й™¤пјџ");
            FText local_60 = NSLOCTEXT("Mail", "DeleteMailTitle", "жЏђз¤є");
            FCommonDialogParam local_62;
            ::CommonPopup::Dialog_Decision(local_60, local_56, local_52, local_20, local_16, local_62);
            return;
        }
        this.MailPanel.opArrow().GetMailDetailVM().opArrow().DeleteMail();
        this.OnBackToList();
        return;
    }
    UFUNCTION()
    bool OnConfirmDeleteMail(const FCommonDialogAnswer &inout Answer)
    {
        if (int(Answer.AnswerType) == 1)
        {
            if (!(!(this.MailPanel)) && this.MailPanel.opArrow().GetMailDetailVM())
            {
                this.MailPanel.opArrow().GetMailDetailVM().opArrow().DeleteMail();
            }
            this.OnBackToList();
        }
        return true;
    }
    UFUNCTION()
    void OnClearReadPressed()
    {
        if (!(this.MailPanel))
        {
            return;
        }
        FDialogDynamicCallback local_6;
        local_6.BindUFunction(this, n"OnConfirmClearRead");
        FText local_12 = NSLOCTEXT("Mail", "DialogCancel", "иї”е›ћ");
        FText local_16 = NSLOCTEXT("Mail", "DialogConfirm", "зЎ®и®¤");
        FDialogCallback local_48 = FDialogCallback(local_6);
        FText local_52 = NSLOCTEXT("Mail", "ClearReadMessage", "зЎ®и®¤е€ й™¤ж‰Ђжњ‰е·ІиЇ»й‚®д»¶пјџ\n<Gray16>жњЄйў†еЏ–й™„д»¶зљ„й‚®д»¶дёЌдјљиў«е€ й™¤</>");
        FText local_56 = NSLOCTEXT("Mail", "ClearReadTitle", "жЏђз¤є");
        FCommonDialogParam local_58;
        ::CommonPopup::Dialog_Decision(local_56, local_52, local_48, local_16, local_12, local_58);
        return;
    }
    UFUNCTION()
    bool OnConfirmClearRead(const FCommonDialogAnswer &inout Answer)
    {
        if (int(Answer.AnswerType) == 1)
        {
            if (this.MailPanel)
            {
                this.MailPanel.opArrow().DeleteAllReadMail();
            }
            this.OnBackToList();
        }
        return true;
    }
    void OnBackToList()
    {
        this.RuleSetUserFocus(this.w_list_email);
        this.RefreshActionBindingVisibility();
        return;
    }
    void RefreshActionBindingVisibility()
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    UFUNCTION()
    void MailPanel_SelectMailByIndex(const int Index) const
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
    void MailPanel_SelectMail(const uint MailId) const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder::PushArg local_42;
        local_42.opCall(MailId);
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void MailPanel_LoadNextPage() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void MailPanel_ClaimAllAttachment() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void MailPanel_DeleteAllReadMail() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void SelectedMailDetail_ClaimAttachment() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void SelectedMailDetail_DeleteMail() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    void HandleObservedModelChanges(FEUIReactiveSubscriberIterator &inout It)
    {
        FVM_MailPanel& local_6;
        FVM_MailDetail& local_12;
        TEUIModelRef<FVM_MailPanel> local_2 = this.MailPanel.AsRef();
        TEUIModelRef<FVM_MailDetail> local_8 = this.SelectedMailDetail.AsRef();
        for (; It; )
        {
            FEUIReactiveSubscriberTrackScope local_62 = FEUIReactiveSubscriberTrackScope(It);
            switch (It.GetIndex())
            {
            case 0:
            {
                this.MailPanel.TrackRead();
                if (local_6)
                {
                    local_6.TrackPropertyRead(::FVM_MailPanel::__IndexOf_SelectedMailIndex());
                }
                if (local_6)
                {
                    this.OnSelectedMailIndexChanged(local_6.GetSelectedMailIndex());
                }
                break;
            }
            case 1:
            {
                this.MailPanel.TrackRead();
                if (local_6)
                {
                    local_6.TrackPropertyRead(::FVM_MailPanel::__IndexOf_MailDetailVM());
                }
                if (local_6)
                {
                    this.OnMailDetailVMChanged(local_6.GetMailDetailVM());
                }
                break;
            }
            case 2:
            {
                this.SelectedMailDetail.TrackRead();
                if (local_12)
                {
                    local_12.TrackPropertyRead(::FVM_MailDetail::__IndexOf_bCanClaimAttachment());
                }
                if (local_12)
                {
                    this.OnCanClaimAttachmentChanged(local_12.GetbCanClaimAttachment());
                }
                break;
            }
            case 3:
            {
                this.SelectedMailDetail.TrackRead();
                if (local_12)
                {
                    local_12.TrackPropertyRead(::FVM_MailDetail::__IndexOf_bHasRewardDisplay());
                }
                if (local_12)
                {
                    this.OnHasRewardDisplayChanged(local_12.GetbHasRewardDisplay());
                }
                break;
            }
            case 4:
            {
                this.MailPanel.TrackRead();
                if (local_6)
                {
                    local_6.TrackPropertyRead(::FVM_MailPanel::__IndexOf_bHasClaimableAttachment());
                }
                if (local_6)
                {
                    this.OnHasClaimableAttachmentChanged(local_6.GetbHasClaimableAttachment());
                }
                break;
            }
            case 5:
            {
                this.MailPanel.TrackRead();
                if (local_6)
                {
                    local_6.TrackPropertyRead(::FVM_MailPanel::__IndexOf_bHasDeletableReadMail());
                }
                if (local_6)
                {
                    this.OnHasDeletableReadMailChanged(local_6.GetbHasDeletableReadMail());
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
                XError(ELog(17), "Remaining observed model change: OnSelectedMailIndexChanged");
            }
            if (It.IsDirty(1))
            {
                XError(ELog(17), "Remaining observed model change: OnMailDetailVMChanged");
            }
            if (It.IsDirty(2))
            {
                XError(ELog(17), "Remaining observed model change: OnCanClaimAttachmentChanged");
            }
            if (It.IsDirty(3))
            {
                XError(ELog(17), "Remaining observed model change: OnHasRewardDisplayChanged");
            }
            if (It.IsDirty(4))
            {
                XError(ELog(17), "Remaining observed model change: OnHasClaimableAttachmentChanged");
            }
            if (It.IsDirty(5))
            {
                XError(ELog(17), "Remaining observed model change: OnHasDeletableReadMailChanged");
            }
            return;
        }
        this.__MailPanel = local_2.opImplConv();
        this.__SelectedMailDetail = local_8.opImplConv();
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.MailPanel.Initialize(this, FName("VM_MailPanel"), EEUIWidgetRefModelCreationType(0), false);
        this.SelectedMailDetail.Initialize(this, FName("VM_MailDetail"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.MailPanelDelegate.IsBound())
        {
            this.MailPanel.SetRef(this.MailPanelDelegate.Execute());
        }
        if (this.SelectedMailDetailDelegate.IsBound())
        {
            this.SelectedMailDetail.SetRef(this.SelectedMailDetailDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_MailPanel
{
void GetModelInfo(FEUIWidgetMetaInfo &inout Result)
{
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnSelectedMailIndexChanged"));
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnMailDetailVMChanged"));
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnCanClaimAttachmentChanged"));
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnHasRewardDisplayChanged"));
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnHasClaimableAttachmentChanged"));
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnHasDeletableReadMailChanged"));
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
