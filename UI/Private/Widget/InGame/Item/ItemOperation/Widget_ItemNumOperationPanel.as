
namespace UWidget_ItemNumOperationPanel
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_ItemNumOperationPanel : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_ItemNumOperation> ItemNumOperation;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_CommonRewardList> ResultPreview;
    UPROPERTY()
    FConfigVM_CommonRewardList ResultPreviewConfig;
    FEUIModelWeakRef __ItemNumOperation;
    UPROPERTY()
    FGetEUIModelRef ItemNumOperationDelegate;
    UPROPERTY()
    FGetEUIModelRef ResultPreviewDelegate;

    UWidget_ItemNumOperationPanel()
    {
        return;
    }
    UFUNCTION()
    void OnViewBind_Implementation()
    {
        this.RefreshChildModels();
        return;
    }
    UFUNCTION()
    void OnViewUnbind_Implementation()
    {
        this.ResultPreview.SetRef(FEUIModelRef());
        return;
    }
    UFUNCTION()
    void OnResultPreviewChanged(const TEUIModelRef<FVM_CommonRewardList> &inout InResultPreview)
    {
        this.ResultPreview.SetRef(InResultPreview);
        return;
    }
    UFUNCTION()
    bool ShouldShowResultPreview() const
    {
        return this.ResultPreview.IsValid() && HasRewards();
    }
    void RefreshChildModels()
    {
        if (!(this.ItemNumOperation.IsValid()))
        {
            this.ResultPreview.SetRef(FEUIModelRef());
            return;
        }
        TEUIModelRef<FVM_CommonRewardList> local_6;
        local_6.GetResultPreview();
        this.ResultPreview.SetRef(local_6);
        return;
    }
    UFUNCTION()
    void ItemNumOperation_ExecuteOperation() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    TArray<FEUIModelWeakRef> ResultPreview_Rewards() const
    {
        FVM_CommonRewardList& local_2;
        TArray<FEUIModelWeakRef> local_16;
        if (local_2)
        {
            local_16 = EUIInternal::AsWeakRefList(local_2.GetRewards());
        }
        else
        {
            local_16 = TArray<FEUIModelWeakRef>();
        }
        return local_16;
    }
    UFUNCTION()
    void ResultPreview_GotoCommissionRewardDetail() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    void HandleObservedModelChanges(FEUIReactiveSubscriberIterator &inout It)
    {
        FVM_ItemNumOperation& local_6;
        TEUIModelRef<FVM_ItemNumOperation> local_2 = this.ItemNumOperation.AsRef();
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
                    this.ItemNumOperation.TrackRead();
                    if (local_6)
                    {
                        local_6.TrackPropertyRead(::FVM_ItemNumOperation::__IndexOf_ResultPreview());
                    }
                    if (local_6)
                    {
                        this.OnResultPreviewChanged(local_6.GetResultPreview());
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
                XError(ELog(17), "Remaining observed model change: OnResultPreviewChanged");
            }
            return;
        }
        this.__ItemNumOperation = local_2.opImplConv();
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.ItemNumOperation.Initialize(this, FName("VM_ItemNumOperation"), EEUIWidgetRefModelCreationType(0), false);
        this.ResultPreview.Initialize(this, FName("VM_CommonRewardList"), EEUIWidgetRefModelCreationType(1), true);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.ItemNumOperationDelegate.IsBound())
        {
            this.ItemNumOperation.SetRef(this.ItemNumOperationDelegate.Execute());
        }
        if (this.ResultPreviewDelegate.IsBound())
        {
            this.ResultPreview.SetRef(this.ResultPreviewDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_ItemNumOperationPanel
{
void GetModelInfo(FEUIWidgetMetaInfo &inout Result)
{
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnResultPreviewChanged"));
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
