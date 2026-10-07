
namespace UWidget_SocialDungeonMinimapIcon
{
    const int ViewID = 0;
}
namespace UWidget_SocialDungeonMinimapIconTooltip
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_SocialDungeonMinimapIcon : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_SocialDungeonMinimapIcon> SocialDungeonMinimapIcon;
    UPROPERTY()
    FGetEUIModelRef SocialDungeonMinimapIconDelegate;

    UWidget_SocialDungeonMinimapIcon()
    {
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.SocialDungeonMinimapIcon.Initialize(this, FName("VM_SocialDungeonMinimapIcon"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.SocialDungeonMinimapIconDelegate.IsBound())
        {
            this.SocialDungeonMinimapIcon.SetRef(this.SocialDungeonMinimapIconDelegate.Execute());
        }
        return;
    }
}

UCLASS(Abstract)
class UWidget_SocialDungeonMinimapIconTooltip : UEUIActivatableWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_SocialDungeonMinimapIcon> SocialDungeonMinimapIcon;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_MinimapIconDecoratorTooltip> DecoratorTooltip;
    UPROPERTY()
    FGetEUIModelRef SocialDungeonMinimapIconDelegate;
    UPROPERTY()
    FGetEUIModelRef DecoratorTooltipDelegate;

    UWidget_SocialDungeonMinimapIconTooltip()
    {
        return;
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
        this.SocialDungeonMinimapIcon.Initialize(this, FName("VM_SocialDungeonMinimapIcon"), EEUIWidgetRefModelCreationType(0), false);
        this.DecoratorTooltip.Initialize(this, FName("VM_MinimapIconDecoratorTooltip"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.SocialDungeonMinimapIconDelegate.IsBound())
        {
            this.SocialDungeonMinimapIcon.SetRef(this.SocialDungeonMinimapIconDelegate.Execute());
        }
        if (this.DecoratorTooltipDelegate.IsBound())
        {
            this.DecoratorTooltip.SetRef(this.DecoratorTooltipDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_SocialDungeonMinimapIcon
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
namespace UWidget_SocialDungeonMinimapIconTooltip
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
