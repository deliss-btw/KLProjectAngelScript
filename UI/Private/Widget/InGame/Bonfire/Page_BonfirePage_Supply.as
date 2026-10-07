
namespace UPage_BonfirePage_Supply
{
    const int ViewID = 0;

}
class UPage_BonfirePage_Supply : UEUIActivatableWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_Page> Page;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_BonfirePage_Supply> BonfirePage;
    UPROPERTY()
    UWidget_CommonTitleWithHover w_title;
    UPROPERTY()
    UEUICommonListView w_list_tab;
    UPROPERTY()
    FEUIActionBinding ClickAction;
    UPROPERTY()
    FEUIActionBinding SupplyAction;
    UPROPERTY()
    FGetEUIModelRef PageDelegate;
    UPROPERTY()
    FGetEUIModelRef BonfirePageDelegate;

    UPage_BonfirePage_Supply()
    {
        return;
    }
    UFUNCTION()
    void OnViewBind_Implementation()
    {
        if (this.w_list_tab != nullptr)
        {
            this.w_list_tab.SetSelectedIndex(0);
        }
        if (this.w_title != nullptr)
        {
            TEUIModelRef<FVM_TitleAndDesc> local_10;
            local_10.GetTitleAndDescVM();
            this.w_title.GetView().SetViewModel(local_10.opImplConv(), NAME_None);
        }
        this.SupplyAction.Register(this, n"NotifySupplyAction");
        this.ClickAction.Register(this, n"NotifyClickAction");
        return;
    }
    UFUNCTION()
    void NotifySupplyAction()
    {
        if (this.BonfirePage.IsValid() && (int(GetAddButtonVisibility()) == 0))
        {
            OnAddButtonClicked();
        }
        return;
    }
    UFUNCTION()
    void NotifyClickAction()
    {
        if (this.w_title.w_tips.IsHoverDisplayed())
        {
            NotifyClick();
        }
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
    FEUIModelContainer BonfirePage_HoverModels() const
    {
        FVM_BonfirePage_Supply& local_2;
        FEUIModelContainer local_32 = local_2 ? local_2.GetHoverModels() : FEUIModelContainer();
        return local_32;
    }
    UFUNCTION()
    TSoftClassPtr<UUserWidget> BonfirePage_HoverWidgetClass() const
    {
        FVM_BonfirePage_Supply& local_2;
        TSoftClassPtr<UUserWidget> local_34;
        if (local_2)
        {
            local_34 = local_2.GetHoverWidgetClass();
        }
        else
        {
            local_34 = TSoftClassPtr<UUserWidget>();
        }
        return local_34;
    }
    UFUNCTION()
    int BonfirePage_BonfireState() const
    {
        FVM_BonfirePage_Supply& local_2;
        return local_2 ? local_2.GetBonfireState() : 0;
    }
    UFUNCTION()
    FText BonfirePage_RemainedRefillTimes() const
    {
        FVM_BonfirePage_Supply& local_2;
        FText local_12 = local_2 ? local_2.GetRemainedRefillTimes() : FText();
        return local_12;
    }
    UFUNCTION()
    FText BonfirePage_RemainedRefillTimesMax() const
    {
        FVM_BonfirePage_Supply& local_2;
        FText local_12 = local_2 ? local_2.GetRemainedRefillTimesMax() : FText();
        return local_12;
    }
    UFUNCTION()
    FText BonfirePage_ResidualText() const
    {
        FVM_BonfirePage_Supply& local_2;
        FText local_12 = local_2 ? local_2.GetResidualText() : FText();
        return local_12;
    }
    UFUNCTION()
    FText BonfirePage_RefillCostHint() const
    {
        FVM_BonfirePage_Supply& local_2;
        FText local_12 = local_2 ? local_2.GetRefillCostHint() : FText();
        return local_12;
    }
    UFUNCTION()
    FText BonfirePage_HintText() const
    {
        FVM_BonfirePage_Supply& local_2;
        FText local_12 = local_2 ? local_2.GetHintText() : FText();
        return local_12;
    }
    UFUNCTION()
    FText BonfirePage_ButtonText() const
    {
        FVM_BonfirePage_Supply& local_2;
        FText local_12 = local_2 ? local_2.GetButtonText() : FText();
        return local_12;
    }
    UFUNCTION()
    FText BonfirePage_ConsumeKeyText() const
    {
        FVM_BonfirePage_Supply& local_2;
        FText local_12 = local_2 ? local_2.GetConsumeKeyText() : FText();
        return local_12;
    }
    UFUNCTION()
    FText BonfirePage_SupplyHintText() const
    {
        FVM_BonfirePage_Supply& local_2;
        FText local_12 = local_2 ? local_2.GetSupplyHintText() : FText();
        return local_12;
    }
    UFUNCTION()
    float32 BonfirePage_ConsumeOpacity() const
    {
        FVM_BonfirePage_Supply& local_2;
        return local_2 ? local_2.GetConsumeOpacity() : 0.0f;
    }
    UFUNCTION()
    TArray<FEUIModelWeakRef> BonfirePage_ItemRefs() const
    {
        FVM_BonfirePage_Supply& local_2;
        TArray<FEUIModelWeakRef> local_16;
        if (local_2)
        {
            local_16 = EUIInternal::AsWeakRefList(local_2.GetItemRefs());
        }
        else
        {
            local_16 = TArray<FEUIModelWeakRef>();
        }
        return local_16;
    }
    UFUNCTION()
    float32 BonfirePage_FillPercent() const
    {
        FVM_BonfirePage_Supply& local_2;
        return local_2 ? local_2.GetFillPercent() : 0.0f;
    }
    UFUNCTION()
    void BonfirePage_GenerateHoverModel() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void BonfirePage_OnAddButtonClicked() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void BonfirePage_OnConfirmButtonClicked() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void BonfirePage_OnCancelButtonClicked() const
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
        this.BonfirePage.Initialize(this, FName("VM_BonfirePage_Supply"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.PageDelegate.IsBound())
        {
            this.Page.SetRef(this.PageDelegate.Execute());
        }
        if (this.BonfirePageDelegate.IsBound())
        {
            this.BonfirePage.SetRef(this.BonfirePageDelegate.Execute());
        }
        return;
    }
}

namespace UPage_BonfirePage_Supply
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
