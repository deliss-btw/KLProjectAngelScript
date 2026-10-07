
namespace UWidget_EscapeExecuted_Progress
{
    const int ViewID = 0;

}
class UWidget_EscapeExecuted_Progress : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVMS_ProgressOperation> VMS_ProgressOperation;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_EscapeExecuted_Progress> VM_EscapeExecuted_Progress;
    FEUIModelWeakRef __VMS_ProgressOperation;
    UPROPERTY()
    FGetEUIModelRef VM_EscapeExecuted_ProgressDelegate;

    UWidget_EscapeExecuted_Progress()
    {
        return;
    }
    UFUNCTION()
    void Construct_Implementation()
    {
        return;
    }
    UFUNCTION()
    void OnStateChanged(const EProgressOperationState State)
    {
        if (int(State) >= 3)
        {
            FVMS_ProgressOperation local_6;
            FEUIWidget::RemoveWidget(local_6.GetPageHandle());
        }
        return;
    }
    UFUNCTION()
    float32 VMS_ProgressOperation_ValueProgress() const
    {
        FVMS_ProgressOperation& local_2;
        return local_2 ? local_2.GetValueProgress() : 0.0f;
    }
    UFUNCTION()
    float32 VMS_ProgressOperation_TimeProgress() const
    {
        FVMS_ProgressOperation& local_2;
        float32 local_4;
        if (local_2)
        {
            local_4 = local_2.GetTimeProgress();
        }
        else
        {
            local_4 = 0.0f;
        }
        return local_4;
    }
    UFUNCTION()
    FWidgetTransform VMS_ProgressOperation_PointerTrans() const
    {
        FVMS_ProgressOperation& local_2;
        FWidgetTransform local_32 = local_2 ? local_2.GetPointerTrans() : FWidgetTransform();
        return local_32;
    }
    UFUNCTION()
    FText VM_EscapeExecuted_Progress_HintText() const
    {
        FVM_EscapeExecuted_Progress& local_2;
        FText local_12 = local_2 ? local_2.GetHintText() : FText();
        return local_12;
    }
    void HandleObservedModelChanges(FEUIReactiveSubscriberIterator &inout It)
    {
        FVMS_ProgressOperation& local_6;
        TEUIModelRef<FVMS_ProgressOperation> local_2 = this.VMS_ProgressOperation.AsRef();
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
                    this.VMS_ProgressOperation.TrackRead();
                    if (local_6)
                    {
                        local_6.TrackPropertyRead(::FVMS_ProgressOperation::__IndexOf_State());
                    }
                    if (local_6)
                    {
                        this.OnStateChanged(local_6.GetState());
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
                XError(ELog(17), "Remaining observed model change: OnStateChanged");
            }
            return;
        }
        this.__VMS_ProgressOperation = local_2.opImplConv();
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.VMS_ProgressOperation.Initialize(this, FName("VMS_ProgressOperation"), EEUIWidgetRefModelCreationType(0), false);
        this.VM_EscapeExecuted_Progress.Initialize(this, FName("VM_EscapeExecuted_Progress"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.VM_EscapeExecuted_ProgressDelegate.IsBound())
        {
            this.VM_EscapeExecuted_Progress.SetRef(this.VM_EscapeExecuted_ProgressDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_EscapeExecuted_Progress
{
void GetModelInfo(FEUIWidgetMetaInfo &inout Result)
{
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnStateChanged"));
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
