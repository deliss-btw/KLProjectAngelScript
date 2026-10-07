
namespace UWidget_MinimapIconDecoratorTooltip
{
    const int ViewID = 0;
}
namespace UWidget_MinimapIconDecoratorTooltipPanel
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_MinimapIconDecoratorTooltip : UEUIUserListItemWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_MinimapIconDecoratorTooltip> Tooltip;
    UPROPERTY()
    FGetEUIModelRef TooltipDelegate;

    UWidget_MinimapIconDecoratorTooltip()
    {
        return;
    }
    UFUNCTION()
    UWidget Tooltip_TipsFromWidget() const
    {
        FVM_MinimapIconDecoratorTooltip& local_2;
        UWidget local_8;
        if (local_2)
        {
            local_8 = local_2.GetTipsFromWidget();
        }
        else
        {
        }
        return local_8;
    }
    UFUNCTION()
    FText Tooltip_TooltipText() const
    {
        FVM_MinimapIconDecoratorTooltip& local_2;
        FText local_12 = local_2 ? local_2.GetTooltipText() : FText();
        return local_12;
    }
    UFUNCTION()
    FText Tooltip_DetailText() const
    {
        FVM_MinimapIconDecoratorTooltip& local_2;
        FText local_12 = local_2 ? local_2.GetDetailText() : FText();
        return local_12;
    }
    UFUNCTION()
    TArray<FEUIModelWeakRef> Tooltip_Actions() const
    {
        FVM_MinimapIconDecoratorTooltip& local_2;
        TArray<FEUIModelWeakRef> local_16;
        if (local_2)
        {
            local_16 = EUIInternal::AsWeakRefList(local_2.GetActions());
        }
        else
        {
            local_16 = TArray<FEUIModelWeakRef>();
        }
        return local_16;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.Tooltip.Initialize(this, FName("VM_MinimapIconDecoratorTooltip"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.TooltipDelegate.IsBound())
        {
            this.Tooltip.SetRef(this.TooltipDelegate.Execute());
        }
        return;
    }
}

UCLASS(Abstract)
class UWidget_MinimapIconDecoratorTooltipPanel : UEUIActivatableWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_MinimapIconDecoratorTooltipPanel> Tooltip;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_MinimapIconDecoratorExtraModel> ExtraModel;
    UPROPERTY()
    USizeBox TileViewSize;
    UPROPERTY()
    UEUITileView TileView;
    UPROPERTY()
    int RowNum = 4;
    FEUIModelWeakRef __Tooltip;
    FEUIModelWeakRef __ExtraModel;
    UPROPERTY()
    FGetEUIModelRef TooltipDelegate;
    UPROPERTY()
    FGetEUIModelRef ExtraModelDelegate;


    UFUNCTION()
    void PreConstruct_Implementation(const bool IsDesignTime)
    {
        this.TileView.SetScrollbarVisibility(ESlateVisibility(1));
        return;
    }
    UFUNCTION()
    void UpdateDesiredWidth(const TArray<FEUIModelRef> &inout Tooltips)
    {
        this.TileViewSize.SetHeightOverride((this.TileView.GetEntryHeight() * (FMath::Min(this.RowNum, Tooltips.Num()))));
        float32 local_1_2 = this.TileView.GetEntryWidth();
        this.TileViewSize.SetWidthOverride(local_1_2 * (FMath::CeilToInt((Tooltips.Num() / this.RowNum))));
        return;
    }
    UFUNCTION()
    void UpdateExtraModel(const FEUIModelRef &inout InExtraModel)
    {
        InExtraModel.SetExtraModel();
        return;
    }
    UFUNCTION()
    TArray<FEUIModelWeakRef> Tooltip_DecoratorTooltips() const
    {
        FVM_MinimapIconDecoratorTooltipPanel& local_2;
        TArray<FEUIModelWeakRef> local_16;
        if (local_2)
        {
            local_16 = EUIInternal::AsWeakRefList(local_2.GetDecoratorTooltips());
        }
        else
        {
            local_16 = TArray<FEUIModelWeakRef>();
        }
        return local_16;
    }
    UFUNCTION()
    TSoftClassPtr<UUserWidget> Tooltip_BaseTooltipWidgetClass() const
    {
        FVM_MinimapIconDecoratorTooltipPanel& local_2;
        TSoftClassPtr<UUserWidget> local_34;
        if (local_2)
        {
            local_34 = local_2.GetBaseTooltipWidgetClass();
        }
        else
        {
            local_34 = TSoftClassPtr<UUserWidget>();
        }
        return local_34;
    }
    UFUNCTION()
    ESlateVisibility Tooltip_BaseTooltipVisibility() const
    {
        FVM_MinimapIconDecoratorTooltipPanel& local_2;
        int local_5;
        if (local_2)
        {
            local_5 = int(local_2.GetBaseTooltipVisibility());
        }
        else
        {
            local_5 = 0;
        }
        return ESlateVisibility(local_5);
    }
    UFUNCTION()
    ESlateVisibility Tooltip_DecoratorTooltipVisibility() const
    {
        FVM_MinimapIconDecoratorTooltipPanel& local_2;
        int local_5;
        if (local_2)
        {
            local_5 = int(local_2.GetDecoratorTooltipVisibility());
        }
        else
        {
            local_5 = 0;
        }
        return ESlateVisibility(local_5);
    }
    void HandleObservedModelChanges(FEUIReactiveSubscriberIterator &inout It)
    {
        FVM_MinimapIconDecoratorTooltipPanel& local_6;
        FVM_MinimapIconDecoratorExtraModel& local_12;
        TEUIModelRef<FVM_MinimapIconDecoratorTooltipPanel> local_2 = this.Tooltip.AsRef();
        TEUIModelRef<FVM_MinimapIconDecoratorExtraModel> local_8 = this.ExtraModel.AsRef();
        for (; It; )
        {
            FEUIReactiveSubscriberTrackScope local_62 = FEUIReactiveSubscriberTrackScope(It);
            int local_63 = It.GetIndex();
            if (local_63 <= 1)
            {
                if (local_63 != 0)
                {
                    if (local_63 != 1)
                    {
                    }
                }
                else
                {
                    this.Tooltip.TrackRead();
                    if (local_6)
                    {
                        local_6.TrackPropertyRead(::FVM_MinimapIconDecoratorTooltipPanel::__IndexOf_DecoratorTooltips());
                    }
                    if (local_6)
                    {
                        this.UpdateDesiredWidth(local_6.GetDecoratorTooltips());
                    }
                    this.ExtraModel.TrackRead();
                    if (local_12)
                    {
                        local_12.TrackPropertyRead(::FVM_MinimapIconDecoratorExtraModel::__IndexOf_ExtraModel());
                    }
                    if (local_12)
                    {
                        this.UpdateExtraModel(local_12.GetExtraModel());
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
                XError(ELog(17), "Remaining observed model change: UpdateDesiredWidth");
            }
            if (It.IsDirty(1))
            {
                XError(ELog(17), "Remaining observed model change: UpdateExtraModel");
            }
            return;
        }
        this.__Tooltip = local_2.opImplConv();
        this.__ExtraModel = local_8.opImplConv();
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.Tooltip.Initialize(this, FName("VM_MinimapIconDecoratorTooltipPanel"), EEUIWidgetRefModelCreationType(0), false);
        this.ExtraModel.Initialize(this, FName("VM_MinimapIconDecoratorExtraModel"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.TooltipDelegate.IsBound())
        {
            this.Tooltip.SetRef(this.TooltipDelegate.Execute());
        }
        if (this.ExtraModelDelegate.IsBound())
        {
            this.ExtraModel.SetRef(this.ExtraModelDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_MinimapIconDecoratorTooltip
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
namespace UWidget_MinimapIconDecoratorTooltipPanel
{
void GetModelInfo(FEUIWidgetMetaInfo &inout Result)
{
    Result.ObservedModelChangesSubscriberNames.Add(FString("UpdateDesiredWidth"));
    Result.ObservedModelChangesSubscriberNames.Add(FString("UpdateExtraModel"));
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
