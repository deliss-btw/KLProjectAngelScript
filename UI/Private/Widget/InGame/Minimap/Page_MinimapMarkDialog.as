
namespace UPage_MinimapMarkDialog
{
    const int ViewID = 0;
}
namespace UWidget_MinimapMarkHover
{
    const int ViewID = 0;
}
namespace UWidget_MinimapMarkTips
{
    const int ViewID = 0;
}
namespace UWidget_MinimapMarkDialogOption
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UPage_MinimapMarkDialog : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_Page> Page;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_MinimapMarkDialog> MinimapMarkDialog;
    FEUIModelWeakRef __MinimapMarkDialog;
    UPROPERTY()
    FGetEUIModelRef PageDelegate;
    UPROPERTY()
    FGetEUIModelRef MinimapMarkDialogDelegate;

    UPage_MinimapMarkDialog()
    {
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
    TArray<FEUIModelWeakRef> MinimapMarkDialog_Options() const
    {
        FVM_MinimapMarkDialog& local_2;
        TArray<FEUIModelWeakRef> local_16;
        if (local_2)
        {
            local_16 = EUIInternal::AsWeakRefList(local_2.GetOptions());
        }
        else
        {
            local_16 = TArray<FEUIModelWeakRef>();
        }
        return local_16;
    }
    UFUNCTION()
    bool MinimapMarkDialog_bHasSelect() const
    {
        FVM_MinimapMarkDialog& local_2;
        bool local_5;
        if (local_2)
        {
            local_5 = local_2.GetbHasSelect();
        }
        else
        {
            local_5 = false;
        }
        return local_5;
    }
    UFUNCTION()
    void MinimapMarkDialog_OnOptionSelected(const int Index) const
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
    void MinimapMarkDialog_OnConfirmSelection() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void MinimapMarkDialog_GuideToMark() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void MinimapMarkDialog_DeleteMark() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void MinimapMarkDialog_ConfirmChangeMarkConfig() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void MinimapMarkDialog_MarkAndGuide() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void MinimapMarkDialog_Cancel() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    void HandleObservedModelChanges(FEUIReactiveSubscriberIterator &inout It)
    {
        FVM_MinimapMarkDialog& local_6;
        TEUIModelRef<FVM_MinimapMarkDialog> local_2 = this.MinimapMarkDialog.AsRef();
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
                    this.MinimapMarkDialog.TrackRead();
                    if (local_6)
                    {
                        local_6.TrackPropertyRead(::FVM_MinimapMarkDialog::__IndexOf_bPendingClose());
                    }
                    if (local_6)
                    {
                        this.OnPendingClose(local_6.GetbPendingClose());
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
            return;
        }
        this.__MinimapMarkDialog = local_2.opImplConv();
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.Page.Initialize(this, FName("VM_Page"), EEUIWidgetRefModelCreationType(0), false);
        this.MinimapMarkDialog.Initialize(this, FName("VM_MinimapMarkDialog"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.PageDelegate.IsBound())
        {
            this.Page.SetRef(this.PageDelegate.Execute());
        }
        if (this.MinimapMarkDialogDelegate.IsBound())
        {
            this.MinimapMarkDialog.SetRef(this.MinimapMarkDialogDelegate.Execute());
        }
        return;
    }
}

UCLASS(Abstract)
class UWidget_MinimapMarkHover : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_MinimapMarkDialog> MinimapMarkDialog;
    UPROPERTY()
    TSoftClassPtr<UWidget_MarkMinimapIcon> DisplayIconWidget;
    FMinimapIconHandle DisplayingIconHandle;
    UPROPERTY()
    UEUIListView OptionList;
    FEUIModelWeakRef __MinimapMarkDialog;
    UPROPERTY()
    FGetEUIModelRef MinimapMarkDialogDelegate;

    UWidget_MinimapMarkHover()
    {
        return;
    }
    UFUNCTION()
    void Tick_Implementation(const FGeometry &inout MyGeometry, const float32 InDeltaTime)
    {
        // body not fully recovered вЂ” stub [unresolved-operand]
    }
    UFUNCTION()
    void Destruct_Implementation()
    {
        ::MinimapUtils::UnregisterIcon(this.DisplayingIconHandle);
        return;
    }
    UFUNCTION()
    void OnSelectedIndexChanged(const int InSelectedIndex)
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    UFUNCTION()
    TArray<FEUIModelWeakRef> MinimapMarkDialog_Options() const
    {
        FVM_MinimapMarkDialog& local_2;
        TArray<FEUIModelWeakRef> local_16;
        if (local_2)
        {
            local_16 = EUIInternal::AsWeakRefList(local_2.GetOptions());
        }
        else
        {
            local_16 = TArray<FEUIModelWeakRef>();
        }
        return local_16;
    }
    UFUNCTION()
    bool MinimapMarkDialog_bHasSelect() const
    {
        FVM_MinimapMarkDialog& local_2;
        bool local_5;
        if (local_2)
        {
            local_5 = local_2.GetbHasSelect();
        }
        else
        {
            local_5 = false;
        }
        return local_5;
    }
    UFUNCTION()
    void MinimapMarkDialog_OnOptionSelected(const int Index) const
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
    void MinimapMarkDialog_OnConfirmSelection() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void MinimapMarkDialog_GuideToMark() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void MinimapMarkDialog_DeleteMark() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void MinimapMarkDialog_ConfirmChangeMarkConfig() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void MinimapMarkDialog_MarkAndGuide() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void MinimapMarkDialog_Cancel() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    void HandleObservedModelChanges(FEUIReactiveSubscriberIterator &inout It)
    {
        FVM_MinimapMarkDialog& local_6;
        TEUIModelRef<FVM_MinimapMarkDialog> local_2 = this.MinimapMarkDialog.AsRef();
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
                    this.MinimapMarkDialog.TrackRead();
                    if (local_6)
                    {
                        local_6.TrackPropertyRead(::FVM_MinimapMarkDialog::__IndexOf_CurrentSelectedIndex());
                    }
                    if (local_6)
                    {
                        this.OnSelectedIndexChanged(local_6.GetCurrentSelectedIndex());
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
                XError(ELog(17), "Remaining observed model change: OnSelectedIndexChanged");
            }
            return;
        }
        this.__MinimapMarkDialog = local_2.opImplConv();
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.MinimapMarkDialog.Initialize(this, FName("VM_MinimapMarkDialog"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.MinimapMarkDialogDelegate.IsBound())
        {
            this.MinimapMarkDialog.SetRef(this.MinimapMarkDialogDelegate.Execute());
        }
        return;
    }
}

UCLASS(Abstract)
class UWidget_MinimapMarkTips : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_MinimapMarkDialog> MinimapMarkDialog;
    UPROPERTY()
    UEUIListView OptionList;
    UPROPERTY()
    FGetEUIModelRef MinimapMarkDialogDelegate;

    UWidget_MinimapMarkTips()
    {
        return;
    }
    UFUNCTION()
    void Tick_Implementation(const FGeometry &inout MyGeometry, const float32 InDeltaTime)
    {
        // body not fully recovered вЂ” stub [unresolved-operand]
    }
    UFUNCTION()
    TArray<FEUIModelWeakRef> MinimapMarkDialog_Options() const
    {
        FVM_MinimapMarkDialog& local_2;
        TArray<FEUIModelWeakRef> local_16;
        if (local_2)
        {
            local_16 = EUIInternal::AsWeakRefList(local_2.GetOptions());
        }
        else
        {
            local_16 = TArray<FEUIModelWeakRef>();
        }
        return local_16;
    }
    UFUNCTION()
    bool MinimapMarkDialog_bHasSelect() const
    {
        FVM_MinimapMarkDialog& local_2;
        bool local_5;
        if (local_2)
        {
            local_5 = local_2.GetbHasSelect();
        }
        else
        {
            local_5 = false;
        }
        return local_5;
    }
    UFUNCTION()
    void MinimapMarkDialog_OnOptionSelected(const int Index) const
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
    void MinimapMarkDialog_OnConfirmSelection() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void MinimapMarkDialog_GuideToMark() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void MinimapMarkDialog_DeleteMark() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void MinimapMarkDialog_ConfirmChangeMarkConfig() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void MinimapMarkDialog_MarkAndGuide() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void MinimapMarkDialog_Cancel() const
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
        this.MinimapMarkDialog.Initialize(this, FName("VM_MinimapMarkDialog"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.MinimapMarkDialogDelegate.IsBound())
        {
            this.MinimapMarkDialog.SetRef(this.MinimapMarkDialogDelegate.Execute());
        }
        return;
    }
}

UCLASS(Abstract)
class UWidget_MinimapMarkDialogOption : UEUIUserListItemWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_MinimapMarkDialogOption> Option;
    UPROPERTY()
    FGetEUIModelRef OptionDelegate;

    UWidget_MinimapMarkDialogOption()
    {
        return;
    }
    UFUNCTION()
    FSlateBrush Option_MarkIcon() const
    {
        FVM_MinimapMarkDialogOption& local_2;
        FSlateBrush local_92;
        if (local_2)
        {
            local_92 = local_2.GetMarkIcon();
        }
        else
        {
            local_92 = FSlateBrush();
        }
        return local_92;
    }
    UFUNCTION()
    ESlateVisibility Option_SlateVisibilitybSelected() const
    {
        FVM_MinimapMarkDialogOption& local_2;
        int local_5;
        if (local_2)
        {
            local_5 = int(local_2.bSelectedAsSlateVisibility());
        }
        else
        {
            local_5 = 0;
        }
        return ESlateVisibility(local_5);
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.Option.Initialize(this, FName("VM_MinimapMarkDialogOption"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.OptionDelegate.IsBound())
        {
            this.Option.SetRef(this.OptionDelegate.Execute());
        }
        return;
    }
}

namespace UPage_MinimapMarkDialog
{
void GetModelInfo(FEUIWidgetMetaInfo &inout Result)
{
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnPendingClose"));
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
namespace UWidget_MinimapMarkHover
{
void GetModelInfo(FEUIWidgetMetaInfo &inout Result)
{
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnSelectedIndexChanged"));
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
namespace UWidget_MinimapMarkTips
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
namespace UWidget_MinimapMarkDialogOption
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
