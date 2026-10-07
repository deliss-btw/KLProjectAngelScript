
namespace UWidget_BornSelectSpecialty
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_BornSelectSpecialty : UEUIActivatableWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_BornSelectSpecialty> SelectSpecialtyModel;
    UPROPERTY()
    FEUIActionBinding ConfirmActionBinding;
    FEUIModelWeakRef __SelectSpecialtyModel;
    UPROPERTY()
    FGetEUIModelRef SelectSpecialtyModelDelegate;

    UWidget_BornSelectSpecialty()
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
    void OnBornAlreadyChanged(const bool bBornAlready)
    {
        if (bBornAlready)
        {
            this.ClosePage(false);
        }
        return;
    }
    UFUNCTION()
    void OnSelectSpecialty(const uint SelectedAvatarId)
    {
        this.ConfirmActionBinding.SetCollapsed((SelectedAvatarId == 0));
        return;
    }
    UFUNCTION()
    void SelectSpecialtyModel_AB_ClickLeftAvatar() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void SelectSpecialtyModel_AB_ClickRightAvatar() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void SelectSpecialtyModel_AB_ConfirmSpecialty() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    void HandleObservedModelChanges(FEUIReactiveSubscriberIterator &inout It)
    {
        FVM_BornSelectSpecialty& local_6;
        TEUIModelRef<FVM_BornSelectSpecialty> local_2 = this.SelectSpecialtyModel.AsRef();
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
                    this.SelectSpecialtyModel.TrackRead();
                    if (local_6)
                    {
                        local_6.TrackPropertyRead(::FVM_BornSelectSpecialty::__IndexOf_bBornAlready());
                    }
                    if (local_6)
                    {
                        this.OnBornAlreadyChanged(local_6.GetbBornAlready());
                    }
                    this.SelectSpecialtyModel.TrackRead();
                    if (local_6)
                    {
                        local_6.TrackPropertyRead(::FVM_BornSelectSpecialty::__IndexOf_SelectedAvatarId());
                    }
                    if (local_6)
                    {
                        this.OnSelectSpecialty(local_6.GetSelectedAvatarId());
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
                XError(ELog(17), "Remaining observed model change: OnBornAlreadyChanged");
            }
            if (It.IsDirty(1))
            {
                XError(ELog(17), "Remaining observed model change: OnSelectSpecialty");
            }
            return;
        }
        this.__SelectSpecialtyModel = local_2.opImplConv();
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.SelectSpecialtyModel.Initialize(this, FName("VM_BornSelectSpecialty"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.SelectSpecialtyModelDelegate.IsBound())
        {
            this.SelectSpecialtyModel.SetRef(this.SelectSpecialtyModelDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_BornSelectSpecialty
{
void GetModelInfo(FEUIWidgetMetaInfo &inout Result)
{
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnBornAlreadyChanged"));
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnSelectSpecialty"));
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
