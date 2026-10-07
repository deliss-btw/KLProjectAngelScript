
namespace UWidget_ArmWrestle_Progress
{
    const int ViewID = 0;

}
class UWidget_ArmWrestle_Progress : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVMS_ProgressOperation> VMS_ProgressOperation;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_ArmWrestle_Progress> VM_ArmWrestle_Progress;
    UPROPERTY()
    float32 timer = 9999.0f;
    FEUIModelWeakRef __VMS_ProgressOperation;
    UPROPERTY()
    FGetEUIModelRef VM_ArmWrestle_ProgressDelegate;


    UFUNCTION()
    void Construct_Implementation()
    {
        return;
    }
    UFUNCTION()
    void Tick_Implementation(const FGeometry &inout MyGeometry, const float32 InDeltaTime)
    {
        this.timer -= InDeltaTime;
        if (this.timer <= 0.0f)
        {
            FVMS_ProgressOperation local_4;
            FEUIWidget::RemoveWidget(local_4.GetPageHandle());
            this.timer = 9999.0f;
        }
        return;
    }
    UFUNCTION()
    void OnStateChanged(const EProgressOperationState State)
    {
        FVMS_ProgressOperation& local_2;
        if (int(State) > 3)
        {
            FEUIWidget::RemoveWidget(local_2.GetPageHandle());
        }
        if (int(State) == 3)
        {
            this.timer = ((local_2.GetMaxTime() - local_2.GetCurTime()) + 0.4f);
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
    TArray<FEUIModelWeakRef> VM_ArmWrestle_Progress_DisplaySelfResults() const
    {
        FVM_ArmWrestle_Progress& local_2;
        TArray<FEUIModelWeakRef> local_16;
        if (local_2)
        {
            local_16 = EUIInternal::AsWeakRefList(local_2.GetDisplaySelfResults());
        }
        else
        {
            local_16 = TArray<FEUIModelWeakRef>();
        }
        return local_16;
    }
    UFUNCTION()
    TArray<FEUIModelWeakRef> VM_ArmWrestle_Progress_DisplayOpponentResults() const
    {
        FVM_ArmWrestle_Progress& local_2;
        TArray<FEUIModelWeakRef> local_16;
        if (local_2)
        {
            local_16 = EUIInternal::AsWeakRefList(local_2.GetDisplayOpponentResults());
        }
        else
        {
            local_16 = TArray<FEUIModelWeakRef>();
        }
        return local_16;
    }
    UFUNCTION()
    int VM_ArmWrestle_Progress_SelfWinTimes() const
    {
        FVM_ArmWrestle_Progress& local_2;
        return local_2 ? local_2.GetSelfWinTimes() : 0;
    }
    UFUNCTION()
    int VM_ArmWrestle_Progress_OpponentWinTimes() const
    {
        FVM_ArmWrestle_Progress& local_2;
        return local_2 ? local_2.GetOpponentWinTimes() : 0;
    }
    UFUNCTION()
    float32 VM_ArmWrestle_Progress_WrestleProgress() const
    {
        FVM_ArmWrestle_Progress& local_2;
        return local_2 ? local_2.GetWrestleProgress() : 0.0f;
    }
    UFUNCTION()
    int VM_ArmWrestle_Progress_CountDownTime() const
    {
        FVM_ArmWrestle_Progress& local_2;
        return local_2 ? local_2.GetCountDownTime() : 0;
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
        this.VM_ArmWrestle_Progress.Initialize(this, FName("VM_ArmWrestle_Progress"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.VM_ArmWrestle_ProgressDelegate.IsBound())
        {
            this.VM_ArmWrestle_Progress.SetRef(this.VM_ArmWrestle_ProgressDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_ArmWrestle_Progress
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
