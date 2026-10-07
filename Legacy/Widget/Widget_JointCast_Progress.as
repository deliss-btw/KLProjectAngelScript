
namespace UWidget_JointCast_Progress
{
    const int ViewID = 0;

}
class UWidget_JointCast_Progress : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVMS_ProgressOperation> VMS_ProgressOperation;
    UPROPERTY()
    UWidgetAnimation FadeIn;
    UPROPERTY()
    UWidgetAnimation ShowParticipant;
    UPROPERTY()
    UWidgetAnimation ShowInitiator;
    FEUIModelWeakRef __VMS_ProgressOperation;

    UWidget_JointCast_Progress()
    {
        return;
    }
    UFUNCTION()
    void Construct_Implementation()
    {
        this.PlayAnimation(this.FadeIn, 0.0f, 1, EUMGSequencePlayMode(0), 1.0f, (0 != 0));
        return;
    }
    UFUNCTION()
    void OnStateChanged(const EProgressOperationState State)
    {
        FVMS_ProgressOperation& local_2;
        if (int(State) == 2)
        {
            if (local_2.GetbIsInitiator())
            {
                this.PlayAnimation(this.ShowInitiator, 0.0f, 1, EUMGSequencePlayMode(0), 1.0f, false);
            }
            else
            {
                this.PlayAnimation(this.ShowParticipant, 0.0f, 1, EUMGSequencePlayMode(0), 1.0f, false);
            }
        }
        if (int(State) >= 3)
        {
            FEUIWidget::RemoveWidget(local_2.GetPageHandle());
        }
        return;
    }
    UFUNCTION()
    void OnIsLeaveChanged(const bool bIsLeave)
    {
        if (bIsLeave)
        {
            FVMS_ProgressOperation local_2;
            FEUIWidget::RemoveWidget(local_2.GetPageHandle());
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
    void HandleObservedModelChanges(FEUIReactiveSubscriberIterator &inout It)
    {
        FVMS_ProgressOperation& local_6;
        TEUIModelRef<FVMS_ProgressOperation> local_2 = this.VMS_ProgressOperation.AsRef();
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
                    this.VMS_ProgressOperation.TrackRead();
                    if (local_6)
                    {
                        local_6.TrackPropertyRead(::FVMS_ProgressOperation::__IndexOf_State());
                    }
                    if (local_6)
                    {
                        this.OnStateChanged(local_6.GetState());
                    }
                    this.VMS_ProgressOperation.TrackRead();
                    if (local_6)
                    {
                        local_6.TrackPropertyRead(::FVMS_ProgressOperation::__IndexOf_bIsLeave());
                    }
                    if (local_6)
                    {
                        this.OnIsLeaveChanged(local_6.GetbIsLeave());
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
            if (It.IsDirty(1))
            {
                XError(ELog(17), "Remaining observed model change: OnIsLeaveChanged");
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
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        return;
    }
}

namespace UWidget_JointCast_Progress
{
void GetModelInfo(FEUIWidgetMetaInfo &inout Result)
{
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnStateChanged"));
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnIsLeaveChanged"));
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
