
namespace UPage_CommissionPanel
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UPage_CommissionPanel : UEUIActivatableWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_Page> Page;
    UPROPERTY()
    TEUIWidgetModelRef<FVMS_CommissionPanel> CommissionPanel;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_CommissionInfo> SelectedCommissionInfo;
    UPROPERTY()
    UEUIListView CommissionList;
    UPROPERTY()
    UEUIButtonBase EnterCommissionButton;
    UPROPERTY()
    FGetEUIModelRef PageDelegate;
    UPROPERTY()
    FGetEUIModelRef SelectedCommissionInfoDelegate;

    UPage_CommissionPanel()
    {
        return;
    }
    UFUNCTION()
    void Tick_Implementation(const FGeometry &inout MyGeometry, const float32 InDeltaTime)
    {
        // body not fully recovered вЂ” stub [unresolved-operand]
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
    TArray<FEUIModelWeakRef> CommissionPanel_CommissionList() const
    {
        FVMS_CommissionPanel& local_2;
        TArray<FEUIModelWeakRef> local_16;
        if (local_2)
        {
            local_16 = EUIInternal::AsWeakRefList(local_2.GetCommissionList());
        }
        else
        {
            local_16 = TArray<FEUIModelWeakRef>();
        }
        return local_16;
    }
    UFUNCTION()
    FEUIModelRef SelectedCommissionInfo_CommissionRewardList() const
    {
        FVM_CommissionInfo& local_2;
        FEUIModelRef local_8 = local_2 ? local_2.GetCommissionRewardList() : FEUIModelRef();
        return local_8;
    }
    UFUNCTION()
    FEUIModelRef SelectedCommissionInfo_CommissionFirstTimeRewardList() const
    {
        FVM_CommissionInfo& local_2;
        FEUIModelRef local_8 = local_2 ? local_2.GetCommissionFirstTimeRewardList() : FEUIModelRef();
        return local_8;
    }
    UFUNCTION()
    void SelectedCommissionInfo_StartCommission() const
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
        this.Page.Initialize(this, FName("VM_Page"), EEUIWidgetRefModelCreationType(0), false);
        this.CommissionPanel.Initialize(this, FName("VMS_CommissionPanel"), EEUIWidgetRefModelCreationType(0), false);
        this.SelectedCommissionInfo.Initialize(this, FName("VM_CommissionInfo"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.PageDelegate.IsBound())
        {
            this.Page.SetRef(this.PageDelegate.Execute());
        }
        if (this.SelectedCommissionInfoDelegate.IsBound())
        {
            this.SelectedCommissionInfo.SetRef(this.SelectedCommissionInfoDelegate.Execute());
        }
        return;
    }
}

namespace UPage_CommissionPanel
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
