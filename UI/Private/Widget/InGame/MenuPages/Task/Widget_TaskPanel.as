
namespace UWidget_TaskPanel
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_TaskPanel : UEUIActivatableWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_Page> Page;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_MenuPage> MenuPage;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_TaskPanel> TaskPanel;
    UPROPERTY()
    UEUITreeView TaskList;
    UPROPERTY()
    FConfigVM_MenuPage MenuPageConfig;
    UPROPERTY()
    FConfigVM_TaskPanel TaskPanelConfig;
    FEUIModelWeakRef __TaskPanel;
    UPROPERTY()
    FGetEUIModelRef PageDelegate;
    UPROPERTY()
    FGetEUIModelRef MenuPageDelegate;
    UPROPERTY()
    FGetEUIModelRef TaskPanelDelegate;

    UWidget_TaskPanel()
    {
        return;
    }
    UFUNCTION()
    void OnTaskListChanged(const TArray<FEUIModelRef> &inout InTaskList)
    {
        if (!(InTaskList.IsEmpty()))
        {
            this.TaskList.SetItemExpansion(FEUIModelWeakRef(InTaskList[0]), true);
        }
        return;
    }
    UFUNCTION()
    TArray<FEUIModelWeakRef> GetTaskChildren(const FEUIModelWeakRef &inout Task) const
    {
        TArray<FEUIModelWeakRef> local_4;
        TArray<FEUIModelRef> local_10;
        local_10.GetTaskChildren(FEUIModelRef());
        for (auto& local_26 : local_10)
        {
            local_4.Add(FEUIModelWeakRef(local_26));
        }
        return local_4;
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
    TArray<FEUIModelWeakRef> TaskPanel_TaskList() const
    {
        FVM_TaskPanel& local_2;
        TArray<FEUIModelWeakRef> local_16;
        if (local_2)
        {
            local_16 = EUIInternal::AsWeakRefList(local_2.GetTaskList());
        }
        else
        {
            local_16 = TArray<FEUIModelWeakRef>();
        }
        return local_16;
    }
    UFUNCTION()
    TArray<FEUIModelWeakRef> TaskPanel_TaskTargetList() const
    {
        FVM_TaskPanel& local_2;
        TArray<FEUIModelWeakRef> local_16;
        if (local_2)
        {
            local_16 = EUIInternal::AsWeakRefList(local_2.GetTaskTargetList());
        }
        else
        {
            local_16 = TArray<FEUIModelWeakRef>();
        }
        return local_16;
    }
    UFUNCTION()
    FEUIModelRef TaskPanel_TaskRewardList() const
    {
        FVM_TaskPanel& local_2;
        FEUIModelRef local_8 = local_2 ? local_2.GetTaskRewardList() : FEUIModelRef();
        return local_8;
    }
    UFUNCTION()
    void TaskPanel_OnEntrySelected(const int Index) const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder::PushArg local_42;
        local_42.opCall(Index);
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    void HandleObservedModelChanges(FEUIReactiveSubscriberIterator &inout It)
    {
        FVM_TaskPanel& local_6;
        TEUIModelRef<FVM_TaskPanel> local_2 = this.TaskPanel.AsRef();
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
                    this.TaskPanel.TrackRead();
                    if (local_6)
                    {
                        local_6.TrackPropertyRead(::FVM_TaskPanel::__IndexOf_TaskList());
                    }
                    if (local_6)
                    {
                        this.OnTaskListChanged(local_6.GetTaskList());
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
                XError(ELog(17), "Remaining observed model change: OnTaskListChanged");
            }
            return;
        }
        this.__TaskPanel = local_2.opImplConv();
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.Page.Initialize(this, FName("VM_Page"), EEUIWidgetRefModelCreationType(0), false);
        this.MenuPage.Initialize(this, FName("VM_MenuPage"), EEUIWidgetRefModelCreationType(0), false);
        this.TaskPanel.Initialize(this, FName("VM_TaskPanel"), EEUIWidgetRefModelCreationType(0), false);
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
        if (this.TaskPanelDelegate.IsBound())
        {
            this.TaskPanel.SetRef(this.TaskPanelDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_TaskPanel
{
void GetModelInfo(FEUIWidgetMetaInfo &inout Result)
{
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnTaskListChanged"));
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
