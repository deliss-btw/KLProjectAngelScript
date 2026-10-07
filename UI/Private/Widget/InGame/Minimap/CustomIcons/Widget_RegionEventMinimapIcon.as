
namespace UWidget_RegionEventMinimapIcon
{
    const int ViewID = 0;
}
namespace UWidget_RegionEventMinimapIconTooltip
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_RegionEventMinimapIcon : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_RegionEventMinimapIcon> RegionEventMinimapIcon;
    UPROPERTY()
    FGetEUIModelRef RegionEventMinimapIconDelegate;

    UWidget_RegionEventMinimapIcon()
    {
        return;
    }
    UFUNCTION()
    TEUIModelRef<FVM_CommonRewardList> RegionEventMinimapIcon_RewardList() const
    {
        FVM_RegionEventMinimapIcon& local_2;
        TEUIModelRef<FVM_CommonRewardList> local_10;
        if (local_2)
        {
            local_10 = local_2.GetRewardList();
        }
        else
        {
            local_10 = TEUIModelRef<FVM_CommonRewardList>();
        }
        return local_10;
    }
    UFUNCTION()
    FText RegionEventMinimapIcon_RewardBuffDesc() const
    {
        FVM_RegionEventMinimapIcon& local_2;
        FText local_12 = local_2 ? local_2.GetRewardBuffDesc() : FText();
        return local_12;
    }
    UFUNCTION()
    FText RegionEventMinimapIcon_ToolTipDesc() const
    {
        FVM_RegionEventMinimapIcon& local_2;
        FText local_12 = local_2 ? local_2.GetToolTipDesc() : FText();
        return local_12;
    }
    UFUNCTION()
    FSoftBrush RegionEventMinimapIcon_DungeonIcon() const
    {
        FVM_RegionEventMinimapIcon& local_2;
        FSoftBrush local_92 = local_2 ? local_2.GetDungeonIcon() : FSoftBrush();
        return local_92;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.RegionEventMinimapIcon.Initialize(this, FName("VM_RegionEventMinimapIcon"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.RegionEventMinimapIconDelegate.IsBound())
        {
            this.RegionEventMinimapIcon.SetRef(this.RegionEventMinimapIconDelegate.Execute());
        }
        return;
    }
}

UCLASS(Abstract)
class UWidget_RegionEventMinimapIconTooltip : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_RegionEventMinimapIcon> RegionEventMinimapIcon;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_MinimapIconDecoratorTooltip> DecoratorTooltip;
    UPROPERTY()
    FGetEUIModelRef RegionEventMinimapIconDelegate;
    UPROPERTY()
    FGetEUIModelRef DecoratorTooltipDelegate;

    UWidget_RegionEventMinimapIconTooltip()
    {
        return;
    }
    UFUNCTION()
    TEUIModelRef<FVM_CommonRewardList> RegionEventMinimapIcon_RewardList() const
    {
        FVM_RegionEventMinimapIcon& local_2;
        TEUIModelRef<FVM_CommonRewardList> local_10;
        if (local_2)
        {
            local_10 = local_2.GetRewardList();
        }
        else
        {
            local_10 = TEUIModelRef<FVM_CommonRewardList>();
        }
        return local_10;
    }
    UFUNCTION()
    FText RegionEventMinimapIcon_RewardBuffDesc() const
    {
        FVM_RegionEventMinimapIcon& local_2;
        FText local_12 = local_2 ? local_2.GetRewardBuffDesc() : FText();
        return local_12;
    }
    UFUNCTION()
    FText RegionEventMinimapIcon_ToolTipDesc() const
    {
        FVM_RegionEventMinimapIcon& local_2;
        FText local_12 = local_2 ? local_2.GetToolTipDesc() : FText();
        return local_12;
    }
    UFUNCTION()
    FSoftBrush RegionEventMinimapIcon_DungeonIcon() const
    {
        FVM_RegionEventMinimapIcon& local_2;
        FSoftBrush local_92 = local_2 ? local_2.GetDungeonIcon() : FSoftBrush();
        return local_92;
    }
    UFUNCTION()
    UWidget DecoratorTooltip_TipsFromWidget() const
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
    FText DecoratorTooltip_TooltipText() const
    {
        FVM_MinimapIconDecoratorTooltip& local_2;
        FText local_12 = local_2 ? local_2.GetTooltipText() : FText();
        return local_12;
    }
    UFUNCTION()
    FText DecoratorTooltip_DetailText() const
    {
        FVM_MinimapIconDecoratorTooltip& local_2;
        FText local_12 = local_2 ? local_2.GetDetailText() : FText();
        return local_12;
    }
    UFUNCTION()
    TArray<FEUIModelWeakRef> DecoratorTooltip_Actions() const
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
        this.RegionEventMinimapIcon.Initialize(this, FName("VM_RegionEventMinimapIcon"), EEUIWidgetRefModelCreationType(0), false);
        this.DecoratorTooltip.Initialize(this, FName("VM_MinimapIconDecoratorTooltip"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.RegionEventMinimapIconDelegate.IsBound())
        {
            this.RegionEventMinimapIcon.SetRef(this.RegionEventMinimapIconDelegate.Execute());
        }
        if (this.DecoratorTooltipDelegate.IsBound())
        {
            this.DecoratorTooltip.SetRef(this.DecoratorTooltipDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_RegionEventMinimapIcon
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
namespace UWidget_RegionEventMinimapIconTooltip
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
