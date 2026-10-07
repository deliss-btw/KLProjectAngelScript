
namespace UWidget_AvatarQuicklyEquip
{
    const int ViewID = 0;

}
class UWidget_AvatarQuicklyEquip : UEUIActivatableWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_Page> Page;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_AvatarQuicklyEquip> AvatarQuicklyEquipVM;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_AvatarShowcase> Showcase;
    UPROPERTY()
    FEUIActionBinding CloseActionBinding;
    UPROPERTY()
    FEUIActionBinding EquipActionBinding;
    UPROPERTY()
    FEUIActionBinding TraitCompareActionBinding;
    UPROPERTY()
    FEUIInputActionDataRow TraitCompareIARow;
    UPROPERTY()
    FEUIInputActionDataRow CancelTraitCompareIARow;
    UPROPERTY()
    FConfigVM_AvatarShowcase ShowcaseConfig;
    FEUIModelWeakRef __AvatarQuicklyEquipVM;
    UPROPERTY()
    FGetEUIModelRef PageDelegate;
    UPROPERTY()
    FGetEUIModelRef AvatarQuicklyEquipVMDelegate;
    UPROPERTY()
    FGetEUIModelRef ShowcaseDelegate;

    UWidget_AvatarQuicklyEquip()
    {
        return;
    }
    UFUNCTION()
    void OnViewBind_Implementation()
    {
        TEUIModelRef<FVM_AvatarShowcase> local_2;
        local_2;
        local_2.SetCurrentShowcase();
        return;
    }
    UFUNCTION()
    void HandleCurEquipmentEquipedUpdate(const bool bCurEquipmentEquiped)
    {
        if (bCurEquipmentEquiped)
        {
            this.ClosePage(false);
        }
        return;
    }
    UFUNCTION()
    void HandleItemTraitComparedChanged(const bool bItemTraitCompared)
    {
        if (bItemTraitCompared)
        {
        }
        else
        {
        }
        this.TraitCompareActionBinding.SetInputAction();
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
    UFUNCTION()
    void AvatarQuicklyEquipVM_OnSelectAvatar(const int AvatarIndex) const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder::PushArg local_42;
        local_42.opCall(AvatarIndex);
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void AvatarQuicklyEquipVM_SwitchItemTraitCompare() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void AvatarQuicklyEquipVM_OnItemEquip() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    void HandleObservedModelChanges(FEUIReactiveSubscriberIterator &inout It)
    {
        FVM_AvatarQuicklyEquip& local_6;
        TEUIModelRef<FVM_AvatarQuicklyEquip> local_2 = this.AvatarQuicklyEquipVM.AsRef();
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
                    this.AvatarQuicklyEquipVM.TrackRead();
                    if (local_6)
                    {
                        local_6.TrackPropertyRead(::FVM_AvatarQuicklyEquip::__IndexOf_bCurEquipmentEquiped());
                    }
                    if (local_6)
                    {
                        this.HandleCurEquipmentEquipedUpdate(local_6.GetbCurEquipmentEquiped());
                    }
                    this.AvatarQuicklyEquipVM.TrackRead();
                    if (local_6)
                    {
                        local_6.TrackPropertyRead(::FVM_AvatarQuicklyEquip::__IndexOf_bItemTraitCompared());
                    }
                    if (local_6)
                    {
                        this.HandleItemTraitComparedChanged(local_6.GetbItemTraitCompared());
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
                XError(ELog(17), "Remaining observed model change: HandleCurEquipmentEquipedUpdate");
            }
            if (It.IsDirty(1))
            {
                XError(ELog(17), "Remaining observed model change: HandleItemTraitComparedChanged");
            }
            return;
        }
        this.__AvatarQuicklyEquipVM = local_2.opImplConv();
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.Page.Initialize(this, FName("VM_Page"), EEUIWidgetRefModelCreationType(0), false);
        this.AvatarQuicklyEquipVM.Initialize(this, FName("VM_AvatarQuicklyEquip"), EEUIWidgetRefModelCreationType(0), false);
        this.Showcase.Initialize(this, FName("VM_AvatarShowcase"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.PageDelegate.IsBound())
        {
            this.Page.SetRef(this.PageDelegate.Execute());
        }
        if (this.AvatarQuicklyEquipVMDelegate.IsBound())
        {
            this.AvatarQuicklyEquipVM.SetRef(this.AvatarQuicklyEquipVMDelegate.Execute());
        }
        if (this.ShowcaseDelegate.IsBound())
        {
            this.Showcase.SetRef(this.ShowcaseDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_AvatarQuicklyEquip
{
void GetModelInfo(FEUIWidgetMetaInfo &inout Result)
{
    Result.ObservedModelChangesSubscriberNames.Add(FString("HandleCurEquipmentEquipedUpdate"));
    Result.ObservedModelChangesSubscriberNames.Add(FString("HandleItemTraitComparedChanged"));
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
