
namespace UWidget_PVX_Settlement_Main
{
    const int ViewID = 0;

}
class UWidget_PVX_Settlement_Main : UEUIActivatableWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_PVX_Settlement_Main> PVX_Settlement_Main;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_Page> Page;
    UPROPERTY()
    UEUIDynamicWidget EUIDynamicWidget_SettlementPhase;
    UPROPERTY()
    FEUIActionBinding AdvancePhaseActionBinding;
    UPROPERTY()
    TMap<EPVX_SettlementPhaseType, TSubclassOf<UWidget>> PhaseActionWidgetClassMap;
    FEUIModelWeakRef __PVX_Settlement_Main;
    UPROPERTY()
    FGetEUIModelRef PVX_Settlement_MainDelegate;
    UPROPERTY()
    FGetEUIModelRef PageDelegate;

    UWidget_PVX_Settlement_Main()
    {
        return;
    }
    UFUNCTION()
    void OnViewBind_Implementation()
    {
        return;
    }
    UFUNCTION()
    void OnDynamicWidgetChanged(const FEUIDynamicWidgetData &inout InDynamicWidget) const
    {
        this.EUIDynamicWidget_SettlementPhase.SetDynamicWidgetData(InDynamicWidget);
        return;
    }
    UFUNCTION()
    void OnCountdownSecondsChanged(const int Seconds)
    {
        this.AdvancePhaseActionBinding.SetOverrideDisplayText(FText::Format(NSLOCTEXT("PVX", "Settlement_AdvanceBtn", "з»§з»­({0}s)"), Seconds));
        return;
    }
    UFUNCTION()
    void OnAllPhasesCompletedChanged(const bool bAllPhasesCompleted)
    {
        if (bAllPhasesCompleted)
        {
            ClosePage();
            ::FGameConnectionUtils::UICallLeaveCurrentLevel(GetContext().GetLocalPlayer());
        }
        return;
    }
    UFUNCTION()
    void OnCurrentPhaseTypeChanged(const EPVX_SettlementPhaseType PhaseType)
    {
        if (this.PhaseActionWidgetClassMap.Contains(PhaseType))
        {
            this.AdvancePhaseActionBinding.SetSpecifiedActionWidgetClass(this.PhaseActionWidgetClassMap[PhaseType]);
            return;
        }
        this.AdvancePhaseActionBinding.SetSpecifiedActionWidgetClass(TSubclassOf<UWidget>(nullptr));
        return;
    }
    UFUNCTION()
    void OnAdvancePhasePressed()
    {
        if (this.PVX_Settlement_Main.IsValid())
        {
            OnPlayerAdvancePhase();
        }
        return;
    }
    UFUNCTION()
    void PVX_Settlement_Main_OnPlayerAdvancePhase() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
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
    void HandleObservedModelChanges(FEUIReactiveSubscriberIterator &inout It)
    {
        FVM_PVX_Settlement_Main& local_6;
        TEUIModelRef<FVM_PVX_Settlement_Main> local_2 = this.PVX_Settlement_Main.AsRef();
        for (; It; )
        {
            FEUIReactiveSubscriberTrackScope local_56 = FEUIReactiveSubscriberTrackScope(It);
            switch (It.GetIndex())
            {
            case 0:
            {
                this.PVX_Settlement_Main.TrackRead();
                if (local_6)
                {
                    local_6.TrackPropertyRead(::FVM_PVX_Settlement_Main::__IndexOf_DynamicWidget());
                }
                if (local_6)
                {
                    this.OnDynamicWidgetChanged(local_6.GetDynamicWidget());
                }
                break;
            }
            case 1:
            {
                this.PVX_Settlement_Main.TrackRead();
                if (local_6)
                {
                    local_6.TrackPropertyRead(::FVM_PVX_Settlement_Main::__IndexOf_CountdownDisplaySeconds());
                }
                if (local_6)
                {
                    this.OnCountdownSecondsChanged(local_6.GetCountdownDisplaySeconds());
                }
                break;
            }
            case 2:
            {
                this.PVX_Settlement_Main.TrackRead();
                if (local_6)
                {
                    local_6.TrackPropertyRead(::FVM_PVX_Settlement_Main::__IndexOf_bAllPhasesCompleted());
                }
                if (local_6)
                {
                    this.OnAllPhasesCompletedChanged(local_6.GetbAllPhasesCompleted());
                }
                break;
            }
            case 3:
            {
                this.PVX_Settlement_Main.TrackRead();
                if (local_6)
                {
                    local_6.TrackPropertyRead(::FVM_PVX_Settlement_Main::__IndexOf_CurrentPhaseType());
                }
                if (local_6)
                {
                    this.OnCurrentPhaseTypeChanged(local_6.GetCurrentPhaseType());
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
                XError(ELog(17), "Remaining observed model change: OnDynamicWidgetChanged");
            }
            if (It.IsDirty(1))
            {
                XError(ELog(17), "Remaining observed model change: OnCountdownSecondsChanged");
            }
            if (It.IsDirty(2))
            {
                XError(ELog(17), "Remaining observed model change: OnAllPhasesCompletedChanged");
            }
            if (It.IsDirty(3))
            {
                XError(ELog(17), "Remaining observed model change: OnCurrentPhaseTypeChanged");
            }
            return;
        }
        this.__PVX_Settlement_Main = local_2.opImplConv();
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.PVX_Settlement_Main.Initialize(this, FName("VM_PVX_Settlement_Main"), EEUIWidgetRefModelCreationType(0), false);
        this.Page.Initialize(this, FName("VM_Page"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.PVX_Settlement_MainDelegate.IsBound())
        {
            this.PVX_Settlement_Main.SetRef(this.PVX_Settlement_MainDelegate.Execute());
        }
        if (this.PageDelegate.IsBound())
        {
            this.Page.SetRef(this.PageDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_PVX_Settlement_Main
{
void GetModelInfo(FEUIWidgetMetaInfo &inout Result)
{
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnDynamicWidgetChanged"));
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnCountdownSecondsChanged"));
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnAllPhasesCompletedChanged"));
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnCurrentPhaseTypeChanged"));
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
