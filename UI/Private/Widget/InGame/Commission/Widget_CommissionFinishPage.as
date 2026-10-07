
namespace UWidget_CommissionFinishPage
{
    const int ViewID = 0;
}
namespace UWidget_CommissionFinishWidget
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_CommissionFinishPage : UEUIActivatableWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_CommissionFinish> CommissionFinish;
    UPROPERTY()
    UWidgetAnimation AnimToNextState;
    UPROPERTY()
    FEUIActionBinding SkipWaitActionBinding;
    FEUIModelWeakRef __CommissionFinish;
    UPROPERTY()
    FGetEUIModelRef CommissionFinishDelegate;

    UWidget_CommissionFinishPage()
    {
        return;
    }
    UFUNCTION()
    void OnPendingCloseChanged(const bool bPendingClose)
    {
        if (bPendingClose)
        {
            this.ClosePage(false);
        }
        return;
    }
    UFUNCTION()
    void OnbMarkAChanged(const bool StateChange)
    {
        if (StateChange)
        {
            this.PlayAnimation(this.AnimToNextState, 0.0f, 1, EUMGSequencePlayMode(0), 1.0f, (0 != 0));
        }
        return;
    }
    UFUNCTION()
    void OnSkipCountdownChanged(const int Seconds)
    {
        this.SkipWaitActionBinding.SetOverrideDisplayText(FText::Format(NSLOCTEXT("CommissionFinish", "SkipWaitBtn", "з»§з»­пј€{0}sпј‰"), Seconds));
        return;
    }
    UFUNCTION()
    void OnShowSkipButtonChanged(const bool bShow)
    {
        bool local_1 = !(bShow);
        this.SkipWaitActionBinding.SetCollapsed(local_1);
        return;
    }
    UFUNCTION()
    void OnSkipWaitPressed()
    {
        if (this.CommissionFinish.IsValid())
        {
            OnSkipWaitPhase();
        }
        return;
    }
    UFUNCTION()
    TArray<FEUIModelWeakRef> CommissionFinish_RewardsData() const
    {
        FVM_CommissionFinish& local_2;
        TArray<FEUIModelWeakRef> local_16;
        if (local_2)
        {
            local_16 = EUIInternal::AsWeakRefList(local_2.GetRewardsData());
        }
        else
        {
            local_16 = TArray<FEUIModelWeakRef>();
        }
        return local_16;
    }
    UFUNCTION()
    void CommissionFinish_CommissionFinishClose() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void CommissionFinish_OnSkipWaitPhase() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    void HandleObservedModelChanges(FEUIReactiveSubscriberIterator &inout It)
    {
        FVM_CommissionFinish& local_6;
        TEUIModelRef<FVM_CommissionFinish> local_2 = this.CommissionFinish.AsRef();
        for (; It; )
        {
            FEUIReactiveSubscriberTrackScope local_56 = FEUIReactiveSubscriberTrackScope(It);
            switch (It.GetIndex())
            {
            case 0:
            {
                this.CommissionFinish.TrackRead();
                if (local_6)
                {
                    local_6.TrackPropertyRead(::FVM_CommissionFinish::__IndexOf_bPendingClose());
                }
                if (local_6)
                {
                    this.OnPendingCloseChanged(local_6.GetbPendingClose());
                }
                break;
            }
            case 1:
            {
                this.CommissionFinish.TrackRead();
                if (local_6)
                {
                    local_6.TrackPropertyRead(::FVM_CommissionFinish::__IndexOf_StateChange());
                }
                if (local_6)
                {
                    this.OnbMarkAChanged(local_6.GetStateChange());
                }
                break;
            }
            case 2:
            {
                this.CommissionFinish.TrackRead();
                if (local_6)
                {
                    local_6.TrackPropertyRead(::FVM_CommissionFinish::__IndexOf_SkipCountdownSeconds());
                }
                if (local_6)
                {
                    this.OnSkipCountdownChanged(local_6.GetSkipCountdownSeconds());
                }
                break;
            }
            case 3:
            {
                this.CommissionFinish.TrackRead();
                if (local_6)
                {
                    local_6.TrackPropertyRead(::FVM_CommissionFinish::__IndexOf_bShowSkipButton());
                }
                if (local_6)
                {
                    this.OnShowSkipButtonChanged(local_6.GetbShowSkipButton());
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
                XError(ELog(17), "Remaining observed model change: OnPendingCloseChanged");
            }
            if (It.IsDirty(1))
            {
                XError(ELog(17), "Remaining observed model change: OnbMarkAChanged");
            }
            if (It.IsDirty(2))
            {
                XError(ELog(17), "Remaining observed model change: OnSkipCountdownChanged");
            }
            if (It.IsDirty(3))
            {
                XError(ELog(17), "Remaining observed model change: OnShowSkipButtonChanged");
            }
            return;
        }
        this.__CommissionFinish = local_2.opImplConv();
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.CommissionFinish.Initialize(this, FName("VM_CommissionFinish"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.CommissionFinishDelegate.IsBound())
        {
            this.CommissionFinish.SetRef(this.CommissionFinishDelegate.Execute());
        }
        return;
    }
}

UCLASS(Abstract)
class UWidget_CommissionFinishWidget : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_CommissionFinish> CommissionFinish;
    UPROPERTY()
    FGetEUIModelRef CommissionFinishDelegate;

    UWidget_CommissionFinishWidget()
    {
        return;
    }
    UFUNCTION()
    TArray<FEUIModelWeakRef> CommissionFinish_RewardsData() const
    {
        FVM_CommissionFinish& local_2;
        TArray<FEUIModelWeakRef> local_16;
        if (local_2)
        {
            local_16 = EUIInternal::AsWeakRefList(local_2.GetRewardsData());
        }
        else
        {
            local_16 = TArray<FEUIModelWeakRef>();
        }
        return local_16;
    }
    UFUNCTION()
    void CommissionFinish_CommissionFinishClose() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void CommissionFinish_OnSkipWaitPhase() const
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
        this.CommissionFinish.Initialize(this, FName("VM_CommissionFinish"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.CommissionFinishDelegate.IsBound())
        {
            this.CommissionFinish.SetRef(this.CommissionFinishDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_CommissionFinishPage
{
void GetModelInfo(FEUIWidgetMetaInfo &inout Result)
{
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnPendingCloseChanged"));
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnbMarkAChanged"));
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnSkipCountdownChanged"));
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnShowSkipButtonChanged"));
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
namespace UWidget_CommissionFinishWidget
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
