
namespace UWidget_EquipmentEditPage
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_EquipmentEditPage : UEUIActivatableWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_EquipmentEditPage> EquipmentEdit;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_EquipmentInfo> SelectedEquipmentInfo;
    UPROPERTY()
    UEUIListView SelectList;
    FEUIModelWeakRef __EquipmentEdit;
    UPROPERTY()
    FGetEUIModelRef EquipmentEditDelegate;
    UPROPERTY()
    FGetEUIModelRef SelectedEquipmentInfoDelegate;

    UWidget_EquipmentEditPage()
    {
        return;
    }
    UFUNCTION()
    void Tick_Implementation(const FGeometry &inout MyGeometry, const float32 InDeltaTime)
    {
        bool local_3 = false;
        FEUIModelWeakRef local_2 = this.SelectList.GetSelectedItem();
        local_3 = !local_3;
        if (local_3)
        {
            this.SelectList.SetSelectedIndex(0);
        }
        return;
    }
    UFUNCTION()
    void OnSelectedEquipmentInfoChange(const TEUIModelRef<FM_Equipment> &inout Equipment)
    {
        if (Equipment)
        {
            this.SelectedEquipmentInfo.SetRef(TEUIModelRef<FVM_EquipmentInfo>(::FVM_EquipmentInfo::Create(this, Equipment)));
            return;
        }
        this.SelectedEquipmentInfo.SetRef(FEUIModelRef());
        return;
    }
    UFUNCTION()
    TArray<FEUIModelWeakRef> EquipmentEdit_EquipmentSelectList() const
    {
        FVM_EquipmentEditPage& local_2;
        TArray<FEUIModelWeakRef> local_16;
        if (local_2)
        {
            local_16 = EUIInternal::AsWeakRefList(local_2.GetEquipmentSelectList());
        }
        else
        {
            local_16 = TArray<FEUIModelWeakRef>();
        }
        return local_16;
    }
    UFUNCTION()
    FEUIModelRef EquipmentEdit_EquipmentSelectDetail() const
    {
        FVM_EquipmentEditPage& local_2;
        FEUIModelRef local_8 = local_2 ? local_2.GetEquipmentSelectDetail() : FEUIModelRef();
        return local_8;
    }
    UFUNCTION()
    void EquipmentEdit_ConfirmEquip() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void EquipmentEdit_SwitchShowCompare() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    TArray<FEUIModelWeakRef> SelectedEquipmentInfo_EquipmentTraits() const
    {
        FVM_EquipmentInfo& local_2;
        TArray<FEUIModelWeakRef> local_16;
        if (local_2)
        {
            local_16 = EUIInternal::AsWeakRefList(local_2.GetEquipmentTraits());
        }
        else
        {
            local_16 = TArray<FEUIModelWeakRef>();
        }
        return local_16;
    }
    UFUNCTION()
    TArray<FEUIModelWeakRef> SelectedEquipmentInfo_EquipmentAttributes() const
    {
        FVM_EquipmentInfo& local_2;
        TArray<FEUIModelWeakRef> local_16;
        if (local_2)
        {
            local_16 = EUIInternal::AsWeakRefList(local_2.GetEquipmentAttributes());
        }
        else
        {
            local_16 = TArray<FEUIModelWeakRef>();
        }
        return local_16;
    }
    UFUNCTION()
    bool SelectedEquipmentInfo_bShowDescription() const
    {
        FVM_EquipmentInfo& local_2;
        bool local_5;
        if (local_2)
        {
            local_5 = local_2.GetbShowDescription();
        }
        else
        {
            local_5 = false;
        }
        return local_5;
    }
    void HandleObservedModelChanges(FEUIReactiveSubscriberIterator &inout It)
    {
        FVM_EquipmentEditPage& local_6;
        TEUIModelRef<FVM_EquipmentEditPage> local_2 = this.EquipmentEdit.AsRef();
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
                    this.EquipmentEdit.TrackRead();
                    if (local_6)
                    {
                        local_6.TrackPropertyRead(::FVM_EquipmentEditPage::__IndexOf_Equipment());
                    }
                    if (local_6)
                    {
                        this.OnSelectedEquipmentInfoChange(local_6.GetEquipment());
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
                XError(ELog(17), "Remaining observed model change: OnSelectedEquipmentInfoChange");
            }
            return;
        }
        this.__EquipmentEdit = local_2.opImplConv();
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.EquipmentEdit.Initialize(this, FName("VM_EquipmentEditPage"), EEUIWidgetRefModelCreationType(0), false);
        this.SelectedEquipmentInfo.Initialize(this, FName("VM_EquipmentInfo"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.EquipmentEditDelegate.IsBound())
        {
            this.EquipmentEdit.SetRef(this.EquipmentEditDelegate.Execute());
        }
        if (this.SelectedEquipmentInfoDelegate.IsBound())
        {
            this.SelectedEquipmentInfo.SetRef(this.SelectedEquipmentInfoDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_EquipmentEditPage
{
void GetModelInfo(FEUIWidgetMetaInfo &inout Result)
{
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnSelectedEquipmentInfoChange"));
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
