
namespace UWidget_MinimapIconDecorator
{
    const int ViewID = 0;
}
namespace UWidget_MinimapIconDecoratorPanel
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_MinimapIconDecorator : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_MinimapIconDecorator> Decorator;
    UPROPERTY()
    USizeBox DecoratorWidgetContainer;
    FEUIModelWeakRef __Decorator;
    UPROPERTY()
    FGetEUIModelRef DecoratorDelegate;

    UWidget_MinimapIconDecorator()
    {
        return;
    }
    UFUNCTION()
    void OnViewBind_Implementation()
    {
        this.UpdateDecoratorSlot(GetDecoratorType());
        return;
    }
    UFUNCTION()
    void OnDecoratorTypeChanged(const EMinimapIconDecoratorType DecoratorType)
    {
        this.UpdateDecoratorSlot(EMinimapIconDecoratorType(DecoratorType));
        return;
    }
    void UpdateDecoratorSlot(const EMinimapIconDecoratorType DecoratorType)
    {
        UMinimapIconDecoratorBase local_2;
        UPanelSlot local_8;
        UCanvasPanelSlot local_12;
        USizeBoxSlot local_36;
        if (::MinimapUtils::GetMinimapGlobalConfig().MinimapIconDecorators.Find(DecoratorType, local_2))
        {
            local_8 = this.Slot;
            local_12 = (Cast<UCanvasPanelSlot>(local_8));
            if (local_12 != nullptr)
            {
                local_12.SetAnchors(FAnchors(0.0f, 0.0f, 1.0f, 1.0f));
                local_12.SetOffsets(FMargin(0.0f));
                local_12.SetZOrder(int(local_2.ZOrder));
                this.SetVisibility(ESlateVisibility(3));
            }
            else
            {
                this.SetVisibility(ESlateVisibility(2));
            }
            local_36 = (Cast<USizeBoxSlot>(this.DecoratorWidgetContainer.GetContentSlot()));
            if (local_36 != nullptr)
            {
                local_36.SetHorizontalAlignment(local_2.HorizontalAlignment);
                local_36.SetVerticalAlignment(local_2.VerticalAlignment);
                local_36.SetPadding(local_2.Padding);
            }
        }
        return;
    }
    UFUNCTION()
    TSoftClassPtr<UUserWidget> Decorator_DecoratorWidgetClass() const
    {
        FVM_MinimapIconDecorator& local_2;
        TSoftClassPtr<UUserWidget> local_34;
        if (local_2)
        {
            local_34 = local_2.GetDecoratorWidgetClass();
        }
        else
        {
            local_34 = TSoftClassPtr<UUserWidget>();
        }
        return local_34;
    }
    UFUNCTION()
    FEUIModelRef Decorator_DecoratorWidgetModel() const
    {
        FVM_MinimapIconDecorator& local_2;
        FEUIModelRef local_8 = local_2 ? local_2.GetDecoratorWidgetModel() : FEUIModelRef();
        return local_8;
    }
    void HandleObservedModelChanges(FEUIReactiveSubscriberIterator &inout It)
    {
        FVM_MinimapIconDecorator& local_6;
        TEUIModelRef<FVM_MinimapIconDecorator> local_2 = this.Decorator.AsRef();
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
                    this.Decorator.TrackRead();
                    if (local_6)
                    {
                        local_6.TrackPropertyRead(::FVM_MinimapIconDecorator::__IndexOf_DecoratorType());
                    }
                    if (local_6)
                    {
                        this.OnDecoratorTypeChanged(local_6.GetDecoratorType());
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
                XError(ELog(17), "Remaining observed model change: OnDecoratorTypeChanged");
            }
            return;
        }
        this.__Decorator = local_2.opImplConv();
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.Decorator.Initialize(this, FName("VM_MinimapIconDecorator"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.DecoratorDelegate.IsBound())
        {
            this.Decorator.SetRef(this.DecoratorDelegate.Execute());
        }
        return;
    }
}

UCLASS(Abstract)
class UWidget_MinimapIconDecoratorPanel : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_MinimapIconHoverProvider> DecoratorPanel;
    UPROPERTY()
    FGetEUIModelRef DecoratorPanelDelegate;

    UWidget_MinimapIconDecoratorPanel()
    {
        return;
    }
    UFUNCTION()
    bool DecoratorPanel_bAllowGuide() const
    {
        FVM_MinimapIconHoverProvider& local_2;
        bool local_5;
        if (local_2)
        {
            local_5 = local_2.GetbAllowGuide();
        }
        else
        {
            local_5 = false;
        }
        return local_5;
    }
    UFUNCTION()
    bool DecoratorPanel_bAllowMark() const
    {
        FVM_MinimapIconHoverProvider& local_2;
        bool local_5;
        if (local_2)
        {
            local_5 = local_2.GetbAllowMark();
        }
        else
        {
            local_5 = false;
        }
        return local_5;
    }
    UFUNCTION()
    bool DecoratorPanel_bAllowTeleport() const
    {
        FVM_MinimapIconHoverProvider& local_2;
        bool local_5;
        if (local_2)
        {
            local_5 = local_2.GetbAllowTeleport();
        }
        else
        {
            local_5 = false;
        }
        return local_5;
    }
    UFUNCTION()
    void DecoratorPanel_ShowHover(const bool bFixMode) const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder::PushArg local_42;
        local_42.opCall(bFixMode);
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void DecoratorPanel_HideHover() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void DecoratorPanel_CloseFixedHover() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void DecoratorPanel_FastMarkEntity() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void DecoratorPanel_RequestTeleportToEntityWithConfirm() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void DecoratorPanel_SelectIcon() const
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
        this.DecoratorPanel.Initialize(this, FName("VM_MinimapIconHoverProvider"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.DecoratorPanelDelegate.IsBound())
        {
            this.DecoratorPanel.SetRef(this.DecoratorPanelDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_MinimapIconDecorator
{
void GetModelInfo(FEUIWidgetMetaInfo &inout Result)
{
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnDecoratorTypeChanged"));
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
namespace UWidget_MinimapIconDecoratorPanel
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
