
namespace UWidget_CommissionEntrance
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_CommissionEntrance : UEUIActivatableWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_CommissionEntrance> CommissionEntrance;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_SimpleLevelSequence> CommissionLevelSequence;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_BindCompPosition> NormalVM;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_BindCompPosition> MidVM;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_BindCompPosition> HardVM;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_BindCompPosition> GoldVM;
    UPROPERTY()
    UWidget Normal;
    UPROPERTY()
    UWidget Mid;
    UPROPERTY()
    UWidget Hard;
    UPROPERTY()
    UWidget Gold;
    bool bVisibilityOverrideEnabled = false;
    UPROPERTY()
    FConfigVM_CommissionEntrance CommissionEntranceConfig;
    UPROPERTY()
    FConfigVM_SimpleLevelSequence CommissionLevelSequenceConfig;
    UPROPERTY()
    FConfigVM_BindCompPosition NormalVMConfig;
    UPROPERTY()
    FConfigVM_BindCompPosition MidVMConfig;
    UPROPERTY()
    FConfigVM_BindCompPosition HardVMConfig;
    UPROPERTY()
    FConfigVM_BindCompPosition GoldVMConfig;
    FEUIModelWeakRef __CommissionLevelSequence;
    UPROPERTY()
    FGetEUIModelRef CommissionEntranceDelegate;
    UPROPERTY()
    FGetEUIModelRef CommissionLevelSequenceDelegate;
    UPROPERTY()
    FGetEUIModelRef NormalVMDelegate;
    UPROPERTY()
    FGetEUIModelRef MidVMDelegate;
    UPROPERTY()
    FGetEUIModelRef HardVMDelegate;
    UPROPERTY()
    FGetEUIModelRef GoldVMDelegate;


    UFUNCTION()
    void OnViewBind_Implementation()
    {
        this.BindWidget(this.NormalVM, this.Normal);
        this.BindWidget(this.MidVM, this.Mid);
        this.BindWidget(this.HardVM, this.Hard);
        this.BindWidget(this.GoldVM, this.Gold);
        return;
    }
    UFUNCTION()
    void Destruct_Implementation()
    {
        if (this.bVisibilityOverrideEnabled)
        {
            FGlobalVisibilityOverrideUtils::DisableGlobalVisibilityOverride();
            this.bVisibilityOverrideEnabled = false;
        }
        return;
    }
    UFUNCTION()
    void OnVisibilityOverrideChanged(const bool bActive)
    {
        if (bActive)
        {
            FVM_SimpleLevelSequence& local_2;
            TSet<FECSEntity> local_22;
            if (local_2.GetCachedTargetEntity())
            {
                local_22.Add(local_2.GetCachedTargetEntity());
            }
            if ((int(local_2.GetVisibilityMode())) == 2)
            {
                FECSEntity local_34 = ::FASCommonUtils::GetLocalPlayerProxy();
                if (local_34)
                {
                    local_22.Add(local_34);
                }
            }
            FGlobalVisibilityOverrideUtils::EnableGlobalVisibilityOverride(local_22);
            this.bVisibilityOverrideEnabled = true;
            return;
        }
        if (this.bVisibilityOverrideEnabled)
        {
            FGlobalVisibilityOverrideUtils::DisableGlobalVisibilityOverride();
            this.bVisibilityOverrideEnabled = false;
        }
        return;
    }
    void BindWidget(TEUIWidgetModelRef<FVM_BindCompPosition> &inout VM, const UWidget Widget)
    {
        if (!(IsValid(Widget)))
        {
            return;
        }
        Widget.SetBoundWidget();
        Widget.GetRenderTransform().SetRenderTransform();
        return;
    }
    UFUNCTION()
    void CommissionLevelSequence_PlayToStopTime() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void CommissionLevelSequence_PlayToEnd() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    void HandleObservedModelChanges(FEUIReactiveSubscriberIterator &inout It)
    {
        FVM_SimpleLevelSequence& local_6;
        TEUIModelRef<FVM_SimpleLevelSequence> local_2 = this.CommissionLevelSequence.AsRef();
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
                    this.CommissionLevelSequence.TrackRead();
                    if (local_6)
                    {
                        local_6.TrackPropertyRead(::FVM_SimpleLevelSequence::__IndexOf_bVisibilityOverrideActive());
                    }
                    if (local_6)
                    {
                        this.OnVisibilityOverrideChanged(local_6.GetbVisibilityOverrideActive());
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
                XError(ELog(17), "Remaining observed model change: OnVisibilityOverrideChanged");
            }
            return;
        }
        this.__CommissionLevelSequence = local_2.opImplConv();
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.CommissionEntrance.Initialize(this, FName("VM_CommissionEntrance"), EEUIWidgetRefModelCreationType(0), false);
        this.CommissionLevelSequence.Initialize(this, FName("VM_SimpleLevelSequence"), EEUIWidgetRefModelCreationType(0), false);
        this.NormalVM.Initialize(this, FName("VM_BindCompPosition"), EEUIWidgetRefModelCreationType(0), false);
        this.MidVM.Initialize(this, FName("VM_BindCompPosition"), EEUIWidgetRefModelCreationType(0), false);
        this.HardVM.Initialize(this, FName("VM_BindCompPosition"), EEUIWidgetRefModelCreationType(0), false);
        this.GoldVM.Initialize(this, FName("VM_BindCompPosition"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.CommissionEntranceDelegate.IsBound())
        {
            this.CommissionEntrance.SetRef(this.CommissionEntranceDelegate.Execute());
        }
        if (this.CommissionLevelSequenceDelegate.IsBound())
        {
            this.CommissionLevelSequence.SetRef(this.CommissionLevelSequenceDelegate.Execute());
        }
        if (this.NormalVMDelegate.IsBound())
        {
            this.NormalVM.SetRef(this.NormalVMDelegate.Execute());
        }
        if (this.MidVMDelegate.IsBound())
        {
            this.MidVM.SetRef(this.MidVMDelegate.Execute());
        }
        if (this.HardVMDelegate.IsBound())
        {
            this.HardVM.SetRef(this.HardVMDelegate.Execute());
        }
        if (this.GoldVMDelegate.IsBound())
        {
            this.GoldVM.SetRef(this.GoldVMDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_CommissionEntrance
{
void GetModelInfo(FEUIWidgetMetaInfo &inout Result)
{
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnVisibilityOverrideChanged"));
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
