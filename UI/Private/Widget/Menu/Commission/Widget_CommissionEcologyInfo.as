
namespace UWidget_CommissionEcologyInfo
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_CommissionEcologyInfo : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_CommissionEcologyInfo> CommissionEcologyInfo;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_CommissionEcologyElement> SelectedEcologyElement;
    FEUIModelWeakRef __CommissionEcologyInfo;
    UPROPERTY()
    FGetEUIModelRef CommissionEcologyInfoDelegate;
    UPROPERTY()
    FGetEUIModelRef SelectedEcologyElementDelegate;

    UWidget_CommissionEcologyInfo()
    {
        return;
    }
    UFUNCTION()
    void OnSelectedEcologyElementChanged(const TEUIModelRef<FVM_CommissionEcologyElement> &inout InSelectedEcologyElement)
    {
        this.SelectedEcologyElement.SetRef(InSelectedEcologyElement);
        return;
    }
    UFUNCTION()
    void SelectedEcologyElement_SelectEcologyElement() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    void HandleObservedModelChanges(FEUIReactiveSubscriberIterator &inout It)
    {
        FVM_CommissionEcologyInfo& local_6;
        TEUIModelRef<FVM_CommissionEcologyInfo> local_2 = this.CommissionEcologyInfo.AsRef();
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
                    this.CommissionEcologyInfo.TrackRead();
                    if (local_6)
                    {
                        local_6.TrackPropertyRead(::FVM_CommissionEcologyInfo::__IndexOf_SelectedEcologyElement());
                    }
                    if (local_6)
                    {
                        this.OnSelectedEcologyElementChanged(local_6.GetSelectedEcologyElement());
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
                XError(ELog(17), "Remaining observed model change: OnSelectedEcologyElementChanged");
            }
            return;
        }
        this.__CommissionEcologyInfo = local_2.opImplConv();
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.CommissionEcologyInfo.Initialize(this, FName("VM_CommissionEcologyInfo"), EEUIWidgetRefModelCreationType(0), false);
        this.SelectedEcologyElement.Initialize(this, FName("VM_CommissionEcologyElement"), EEUIWidgetRefModelCreationType(0), true);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.CommissionEcologyInfoDelegate.IsBound())
        {
            this.CommissionEcologyInfo.SetRef(this.CommissionEcologyInfoDelegate.Execute());
        }
        if (this.SelectedEcologyElementDelegate.IsBound())
        {
            this.SelectedEcologyElement.SetRef(this.SelectedEcologyElementDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_CommissionEcologyInfo
{
void GetModelInfo(FEUIWidgetMetaInfo &inout Result)
{
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnSelectedEcologyElementChanged"));
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
