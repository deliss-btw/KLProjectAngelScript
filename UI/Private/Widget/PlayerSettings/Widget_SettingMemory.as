
namespace UWidget_SettingMemory
{
    const int ViewID = 0;

}
class UWidget_SettingMemory : UEUIActivatableWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_SettingMemory> Memory;
    UPROPERTY()
    UProgressBar w_pBar_self;
    FTimerHandle SlowTickHandle;
    FEUIModelWeakRef __Memory;
    UPROPERTY()
    FGetEUIModelRef MemoryDelegate;

    UWidget_SettingMemory()
    {
        return;
    }
    UFUNCTION()
    void OnViewBind_Implementation()
    {
        this.SlowTickHandle = System::SetTimer(this, n"OnSlowTick", 3.0f, true, false, 0.0f, 0.0f);
        return;
    }
    UFUNCTION()
    void OnViewUnbind_Implementation()
    {
        System::ClearAndInvalidateTimerHandle(__GetWorldContext(), this.SlowTickHandle);
        return;
    }
    UFUNCTION()
    void OnSlowTick()
    {
        RefreshVideoMemory();
        return;
    }
    UFUNCTION()
    void OnIsFullChanged()
    {
        this.w_pBar_self.SetFillColorAndOpacity(GetSelfColor());
        return;
    }
    UFUNCTION()
    void Memory_RefreshVideoMemory() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    void HandleObservedModelChanges(FEUIReactiveSubscriberIterator &inout It)
    {
        FVM_SettingMemory& local_6;
        TEUIModelRef<FVM_SettingMemory> local_2 = this.Memory.AsRef();
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
                    this.Memory.TrackRead();
                    if (local_6)
                    {
                        local_6.TrackPropertyRead(::FVM_SettingMemory::__IndexOf_bIsFull());
                    }
                    if (local_6)
                    {
                        this.OnIsFullChanged();
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
                XError(ELog(17), "Remaining observed model change: OnIsFullChanged");
            }
            return;
        }
        this.__Memory = local_2.opImplConv();
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.Memory.Initialize(this, FName("VM_SettingMemory"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.MemoryDelegate.IsBound())
        {
            this.Memory.SetRef(this.MemoryDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_SettingMemory
{
void GetModelInfo(FEUIWidgetMetaInfo &inout Result)
{
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnIsFullChanged"));
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
