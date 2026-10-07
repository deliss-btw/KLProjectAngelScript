
namespace UWidget_SwitchSpecialty
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_SwitchSpecialty : UEUIActivatableWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_SwitchSpecialty> SpecialtyModel;
    UPROPERTY()
    FEUIActionBinding ConfirmActionBinding;
    FEUIModelWeakRef __SpecialtyModel;
    UPROPERTY()
    FGetEUIModelRef SpecialtyModelDelegate;

    UWidget_SwitchSpecialty()
    {
        return;
    }
    UFUNCTION()
    void OnViewBind_Implementation()
    {
        this.ConfirmActionBinding.SetCollapsed(true);
        return;
    }
    UFUNCTION()
    void OnSelectSpecialty(const uint SelectedAvatarId)
    {
        this.ConfirmActionBinding.SetCollapsed((SelectedAvatarId == 0));
        return;
    }
    UFUNCTION()
    void OnSpecialtyChangeSucc(const bool bIsChangeSucc)
    {
        if (bIsChangeSucc)
        {
            this.ClosePage(false);
        }
        return;
    }
    UFUNCTION()
    void SpecialtyModel_AB_ConfirmSpecialty() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void SpecialtyModel_OnSelectIndexChanged(const int Index) const
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
        FVM_SwitchSpecialty& local_6;
        TEUIModelRef<FVM_SwitchSpecialty> local_2 = this.SpecialtyModel.AsRef();
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
                    this.SpecialtyModel.TrackRead();
                    if (local_6)
                    {
                        local_6.TrackPropertyRead(::FVM_SwitchSpecialty::__IndexOf_SelectedAvatarId());
                    }
                    if (local_6)
                    {
                        this.OnSelectSpecialty(local_6.GetSelectedAvatarId());
                    }
                    this.SpecialtyModel.TrackRead();
                    if (local_6)
                    {
                        local_6.TrackPropertyRead(::FVM_SwitchSpecialty::__IndexOf_bIsChangeSucc());
                    }
                    if (local_6)
                    {
                        this.OnSpecialtyChangeSucc(local_6.GetbIsChangeSucc());
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
                XError(ELog(17), "Remaining observed model change: OnSelectSpecialty");
            }
            if (It.IsDirty(1))
            {
                XError(ELog(17), "Remaining observed model change: OnSpecialtyChangeSucc");
            }
            return;
        }
        this.__SpecialtyModel = local_2.opImplConv();
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.SpecialtyModel.Initialize(this, FName("VM_SwitchSpecialty"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.SpecialtyModelDelegate.IsBound())
        {
            this.SpecialtyModel.SetRef(this.SpecialtyModelDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_SwitchSpecialty
{
void GetModelInfo(FEUIWidgetMetaInfo &inout Result)
{
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnSelectSpecialty"));
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnSpecialtyChangeSucc"));
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
