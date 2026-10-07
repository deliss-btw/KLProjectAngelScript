
namespace UWidget_Execute_SingleRipple
{
    const int ViewID = 0;

}
class UWidget_Execute_SingleRipple : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_Execute_SingleRipple> SingleRippleVM;
    UPROPERTY()
    UWidgetAnimation Anim_Success;
    UPROPERTY()
    UWidgetAnimation Anim_Failed;
    UPROPERTY()
    float32 timer = 9999.0f;
    FEUIModelWeakRef __SingleRippleVM;
    UPROPERTY()
    FGetEUIModelRef SingleRippleVMDelegate;


    UFUNCTION()
    void Tick_Implementation(const FGeometry &inout MyGeometry, const float32 InDeltaTime)
    {
        this.timer -= InDeltaTime;
        if (this.timer <= 0.0f)
        {
            FVM_Execute_SingleRipple local_2;
            FEUIWidget::RemoveWidget(local_2.GetPageHandle());
            this.timer = 9999.0f;
        }
        return;
    }
    UFUNCTION()
    void OnStateChanged(const EProgressOperationState State)
    {
        if (int(State) == 3)
        {
            this.PlayAnimation(this.Anim_Success, 0.0f, 1, EUMGSequencePlayMode(0), 1.0f, false);
        }
        else
        {
            if ((int(State) == 4 || (int(State) == 5)))
            {
                this.PlayAnimation(this.Anim_Failed, 0.0f, 1, EUMGSequencePlayMode(0), 1.0f, false);
            }
        }
        if (int(State) >= 3)
        {
            FVM_Execute_SingleRipple& local_14;
            this.timer = ((local_14.GetMaxTime() - local_14.GetCurTime()) + 0.35f);
        }
        return;
    }
    void HandleObservedModelChanges(FEUIReactiveSubscriberIterator &inout It)
    {
        FVM_Execute_SingleRipple& local_6;
        TEUIModelRef<FVM_Execute_SingleRipple> local_2 = this.SingleRippleVM.AsRef();
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
                    this.SingleRippleVM.TrackRead();
                    if (local_6)
                    {
                        local_6.TrackPropertyRead(::FVM_Execute_SingleRipple::__IndexOf_State());
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
        this.__SingleRippleVM = local_2.opImplConv();
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.SingleRippleVM.Initialize(this, FName("VM_Execute_SingleRipple"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.SingleRippleVMDelegate.IsBound())
        {
            this.SingleRippleVM.SetRef(this.SingleRippleVMDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_Execute_SingleRipple
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
