
namespace UWidget_MinimapIconTemplate
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_MinimapIconTemplate : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_MinimapIcon> MinimapIcon;
    UPROPERTY()
    bool bAllowGuide;
    UPROPERTY()
    bool bAllowMark;
    UPROPERTY()
    bool bAllowTeleport;
    UPROPERTY()
    bool bShowTooltip = true;
    UPROPERTY()
    TSoftClassPtr<UEUIUserWidget> CustomTooltipWidget;
    UPROPERTY()
    FEUIModelContainer CustomTooltipModel;
    FKey HoverMouseButton = EKeys::LeftMouseButton;
    FKey MarkMouseButton = EKeys::LeftMouseButton;
    FKey GuideMouseButton = EKeys::RightMouseButton;
    UPROPERTY()
    UUserWidget OwningMinimapIcon;
    UPROPERTY()
    UMinimap OwningMinimap;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_MinimapIconHelper> MinimapIconHelper;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_MinimapIconHoverProvider> HoverProvider;
    TOptional<FVector2f> MouseDownPosition;
    FEUIModelWeakRef __MinimapIcon;
    UPROPERTY()
    FGetEUIModelRef MinimapIconDelegate;
    UPROPERTY()
    FGetEUIModelRef MinimapIconHelperDelegate;
    UPROPERTY()
    FGetEUIModelRef HoverProviderDelegate;


    UFUNCTION()
    void OnViewBind_Implementation()
    {
        TEUIModelRef<FVM_MinimapIcon> local_2;
        local_2;
        FEUIModelRef local_4;
        this.MinimapIconHelper = local_4;
        if (this.bShowTooltip)
        {
            this.CreateHoverProvider();
        }
        return;
    }
    UFUNCTION()
    void OnViewUnbind_Implementation()
    {
        if (this.HoverProvider)
        {
            this.HoverProvider.opArrow().CloseFixedHover();
        }
        return;
    }
    UFUNCTION()
    void Tick_Implementation(const FGeometry &inout MyGeometry, const float32 InDeltaTime)
    {
        if (this.OwningMinimap != nullptr)
        {
            float32 local_4 = this.OwningMinimap.GetMapScale();
            local_4.SetMapScale();
        }
        return;
    }
    UFUNCTION()
    FEventReply OnMouseButtonDown_Implementation(const FGeometry &inout MyGeometry, const FPointerEvent &inout MouseEvent)
    {
        return this.OnMouseDownInternal(MouseEvent);
    }
    UFUNCTION()
    FEventReply OnMouseButtonDoubleClick_Implementation(const FGeometry &inout InMyGeometry, const FPointerEvent &inout InMouseEvent)
    {
        return this.OnMouseDownInternal(InMouseEvent);
    }
    UFUNCTION()
    FEventReply OnMouseButtonUp_Implementation(const FGeometry &inout MyGeometry, const FPointerEvent &inout MouseEvent)
    {
        if (!(this.MouseDownPosition.IsSet()))
        {
            return FEventReply::Unhandled();
        }
        if (FSlateApplication::Get().HasTraveledFarEnoughToTriggerDrag(MouseEvent))
        {
            this.MouseDownPosition.Reset();
            return FEventReply::Unhandled();
        }
        if ((MouseEvent.GetEffectingButton() == EKeys::LeftMouseButton))
        {
            FVM_MinimapIconHoverProvider& local_50;
            if (local_50.GetbAllowMark() && local_50.GetbAllowGuide())
            {
                if (::MarkUtil::IsEntityMarkedBySelf(this.MinimapIcon.opArrow().GetContext().GetLocalPlayer(), this.MinimapIcon.opArrow().GetSpot().opArrow().GetEntityId()) || ::MarkUtil::IsSelfCreateMark(this.MinimapIcon.opArrow().GetContext().GetLocalPlayer(), this.MinimapIcon.opArrow().GetSpot().opArrow().GetEntityId()) || (::FGuidingPathUtils::GetGuidingPathTargetEntityID(this.MinimapIcon.opArrow().GetContext().GetLocalPlayer()) == this.MinimapIcon.opArrow().GetSpot().opArrow().GetEntityId()))
                {
                    local_50.CancelMarkAndGuideEntity();
                }
                else
                {
                    local_50.MarkAndGuideEntity();
                }
                return FEventReply::Handled();
            }
        }
        if ((MouseEvent.GetEffectingButton() == this.MarkMouseButton))
        {
            FCommonTipsParam local_86;
            FVM_MinimapIconHoverProvider& local_50;
            if (local_50.GetbAllowMark())
            {
                this.HoverProvider_FastMarkEntity();
            }
            else
            {
                bool local_68;
                local_68 = false;
                if (local_50.GetbAllowTeleport())
                {
                    FSpotViewAdapter local_76;
                    if (::GetTeleporterData(this.MinimapIcon.opArrow().GetSpot().opArrow(), local_76))
                    {
                        ::FVM_TeleporterUtils::Get(this).RequestTeleportWithSpecialCaseComfirm(::GetTeleporterData(this.MinimapIcon.opArrow().GetSpot().opArrow(), local_76).opArrow().GetTeleporterConfig());
                        local_68 = true;
                    }
                    else
                    {
                        if (!((this.MinimapIcon.opArrow().GetSpot().opArrow().GetEntityId() == ENTITY_ID_NULL)))
                        {
                            this.HoverProvider_RequestTeleportToEntityWithConfirm();
                            local_68 = true;
                        }
                    }
                }
                if (!(local_68))
                {
                    ::CommonPopup::WeakTips(NSLOCTEXT("MinimapIconDecorator", "FastMarkEntity_Failed", "иЇҐењ°з‚№дёЌеЏЇиў«ж ‡и®°"), local_86);
                }
            }
            return FEventReply::Handled();
        }
        if ((MouseEvent.GetEffectingButton() == this.HoverMouseButton))
        {
            this.OwningMinimap.SetSelectedIconWidget(this.OwningMinimapIcon);
            return FEventReply::Handled();
        }
        if ((MouseEvent.GetEffectingButton() == this.GuideMouseButton))
        {
            FCommonTipsParam local_86;
            FVM_MinimapIconHoverProvider& local_50;
            if (local_50.GetbAllowGuide())
            {
                local_50.SetGuideTarget();
            }
            else
            {
                ::CommonPopup::WeakTips(NSLOCTEXT("MinimapIconDecorator", "GuideToEntity_Failed", "иЇҐењ°з‚№дёЌеЏЇиў«еЇји€Є"), local_86);
            }
            return FEventReply::Handled();
        }
        return FEventReply::Unhandled();
    }
    UFUNCTION()
    void OnMouseEnter_Implementation(const FGeometry &inout MyGeometry, const FPointerEvent &inout MouseEvent)
    {
        if ((int(::UICommonUtil::GetCurrentInputType(this.GetOwningLocalPlayer()))) != 0)
        {
            return;
        }
        if (this.MinimapIconHelper.IsValid())
        {
            FVM_MinimapIconHoverProvider& local_8;
            1.SetbHasMouseHover();
            if (local_8)
            {
                local_8.ShowHover(false);
            }
        }
        return;
    }
    UFUNCTION()
    void OnMouseLeave_Implementation(const FPointerEvent &inout MouseEvent)
    {
        this.MouseDownPosition.Reset();
        if ((int(::UICommonUtil::GetCurrentInputType(this.GetOwningLocalPlayer()))) != 0)
        {
            return;
        }
        if (this.MinimapIconHelper.IsValid())
        {
            FVM_MinimapIconHoverProvider& local_8;
            0.SetbHasMouseHover();
            if (local_8)
            {
                local_8.HideHover();
            }
        }
        return;
    }
    UFUNCTION()
    FEventReply OnMouseMove_Implementation(const FGeometry &inout MyGeometry, const FPointerEvent &inout MouseEvent)
    {
        if (this.MouseDownPosition.IsSet())
        {
            if (FSlateApplication::Get().HasTraveledFarEnoughToTriggerDrag(MouseEvent))
            {
                this.MouseDownPosition.Reset();
            }
        }
        return FEventReply::Unhandled();
    }
    UFUNCTION()
    void SetAllowGuide(const bool InAllowGuide)
    {
        this.bAllowGuide = InAllowGuide;
        if (this.HoverProvider)
        {
            this.HoverProvider.opArrow().SetbAllowGuide(InAllowGuide && this.IsAllowGuideByConfig());
        }
        return;
    }
    UFUNCTION()
    void SetAllowMark(const bool InAllowMark)
    {
        this.bAllowMark = InAllowMark;
        if (this.HoverProvider)
        {
            this.HoverProvider.opArrow().SetbAllowMark(InAllowMark && this.IsAllowMarkByConfig());
        }
        return;
    }
    UFUNCTION()
    void SetAllowTeleport(const bool InAllowTeleport)
    {
        this.bAllowTeleport = InAllowTeleport;
        if (this.HoverProvider)
        {
            this.HoverProvider.opArrow().SetbAllowTeleport(InAllowTeleport);
        }
        return;
    }
    UFUNCTION()
    void SetShowTooltip(const bool InShowTooltip)
    {
        this.bShowTooltip = InShowTooltip;
        if (!(this.bShowTooltip))
        {
            if (this.HoverProvider)
            {
                this.HoverProvider.opArrow().CloseFixedHover();
            }
            this.HoverProvider.ResetRef();
            return;
        }
        if (!(this.HoverProvider))
        {
            this.CreateHoverProvider();
        }
        return;
    }
    UFUNCTION()
    void SetCustomTooltipWidget(const TSoftClassPtr<UEUIUserWidget> &inout InCustomTooltipWidget)
    {
        this.CustomTooltipWidget = InCustomTooltipWidget;
        if (this.HoverProvider)
        {
            this.HoverProvider.opArrow().SetTooltipWidgetClass(InCustomTooltipWidget);
        }
        return;
    }
    UFUNCTION()
    void SetCustomTooltipModel(const FEUIModelContainer &inout InCustomTooltipModel)
    {
        this.CustomTooltipModel = InCustomTooltipModel;
        if (this.HoverProvider)
        {
            this.HoverProvider.opArrow().SetTooltipModels(InCustomTooltipModel);
        }
        return;
    }
    UFUNCTION()
    void SetOwningMinimapIcon(const UUserWidget InOwningMinimapIcon)
    {
        return;
    }
    UFUNCTION()
    void SetOwningMinimap(const UMinimap InOwningMinimap)
    {
        return;
    }
    UFUNCTION()
    void HandleMinimapSelectionChanged(const bool bSelected)
    {
        FVM_MinimapIconHoverProvider& local_2;
        if (local_2)
        {
            if (bSelected)
            {
                local_2.ShowHover(true);
                return;
            }
            local_2.CloseFixedHover();
        }
        return;
    }
    UFUNCTION()
    void HandleMinimapIconConfigChanged(const TDataObjectPtr<FMinimapIconConfig> &inout InMinimapIconConfig, const TWeakObjectPtr<UEUIUserWidget> &inout InOwningIcon)
    {
        if (!(InOwningIcon.IsValid()))
        {
            return;
        }
        CastTo local_6;
        TDataObjectPtr<FMinimapIconConfig_Common> local_30 = local_6.opCall();
        if (local_30)
        {
            if (local_30.opArrow().bNeverHittestable)
            {
                InOwningIcon.opArrow().SetVisibility(ESlateVisibility(3));
                return;
            }
        }
        InOwningIcon.opArrow().SetVisibility(ESlateVisibility(4));
        return;
    }
    FEventReply OnMouseDownInternal(const FPointerEvent &inout MouseEvent)
    {
        this.MouseDownPosition = FVector2f(MouseEvent.GetScreenSpacePosition());
        return FEventReply::Handled();
    }
    void CreateHoverProvider()
    {
        int local_4 = 0;
        TEUIModelRef<FVM_MinimapIcon> local_2;
        local_2;
        local_4.SetbAllowGuide(this.bAllowGuide && this.IsAllowGuideByConfig());
        local_4.SetbAllowMark(this.bAllowMark && this.IsAllowMarkByConfig());
        local_4.SetbAllowTeleport(this.bAllowTeleport);
        local_4.SetTooltipWidgetClass(this.CustomTooltipWidget);
        local_4.SetTooltipModels(this.CustomTooltipModel);
        this.HoverProvider.SetRef(TEUIModelRef<FVM_MinimapIconHoverProvider>(local_4));
        return;
    }
    bool IsAllowGuideByConfig() const
    {
        FSpotViewAdapter local_10;
        if (::GetMinimapIconConfig(this.MinimapIcon.opArrow().GetSpot().opArrow(), local_10))
        {
            CastTo local_64;
            TDataObjectPtr<FMinimapIconConfig_Common> local_88 = local_64.opCall();
            if (local_88)
            {
                return local_88.opArrow().bCanSetGuideTarget;
            }
        }
        return true;
    }
    bool IsAllowMarkByConfig() const
    {
        FSpotViewAdapter local_10;
        TDataObjectPtr<FPresentationConfig> local_34 = ::GetPresentationConfig(this.MinimapIcon.opArrow().GetSpot().opArrow(), local_10);
        if (local_34)
        {
            return local_34.opArrow().bSupportMark;
        }
        return false;
    }
    UFUNCTION()
    bool HoverProvider_bAllowGuide() const
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
    bool HoverProvider_bAllowMark() const
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
    bool HoverProvider_bAllowTeleport() const
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
    void HoverProvider_ShowHover(const bool bFixMode) const
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
    void HoverProvider_HideHover() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void HoverProvider_CloseFixedHover() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void HoverProvider_FastMarkEntity() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void HoverProvider_RequestTeleportToEntityWithConfirm() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void HoverProvider_SelectIcon() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    void HandleObservedModelChanges(FEUIReactiveSubscriberIterator &inout It)
    {
        FVM_MinimapIcon& local_6;
        TEUIModelRef<FVM_MinimapIcon> local_2 = this.MinimapIcon.AsRef();
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
                    this.MinimapIcon.TrackRead();
                    if (local_6)
                    {
                        local_6.TrackPropertyRead(::FVM_MinimapIcon::__IndexOf_bIsSelected());
                    }
                    if (local_6)
                    {
                        this.HandleMinimapSelectionChanged(local_6.GetbIsSelected());
                    }
                    this.MinimapIcon.TrackRead();
                    if (local_6)
                    {
                        local_6.TrackPropertyRead(::FVM_MinimapIcon::__IndexOf_MinimapIconConfig());
                        local_6.TrackPropertyRead(::FVM_MinimapIcon::__IndexOf_OwningIcon());
                    }
                    if (local_6)
                    {
                        this.HandleMinimapIconConfigChanged(local_6.GetMinimapIconConfig(), local_6.GetOwningIcon());
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
                XError(ELog(17), "Remaining observed model change: HandleMinimapSelectionChanged");
            }
            if (It.IsDirty(1))
            {
                XError(ELog(17), "Remaining observed model change: HandleMinimapIconConfigChanged");
            }
            return;
        }
        this.__MinimapIcon = local_2.opImplConv();
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.MinimapIcon.Initialize(this, FName("VM_MinimapIcon"), EEUIWidgetRefModelCreationType(1), false);
        this.MinimapIconHelper.Initialize(this, FName("VM_MinimapIconHelper"), EEUIWidgetRefModelCreationType(0), true);
        this.HoverProvider.Initialize(this, FName("VM_MinimapIconHoverProvider"), EEUIWidgetRefModelCreationType(0), true);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.MinimapIconDelegate.IsBound())
        {
            this.MinimapIcon.SetRef(this.MinimapIconDelegate.Execute());
        }
        if (this.MinimapIconHelperDelegate.IsBound())
        {
            this.MinimapIconHelper.SetRef(this.MinimapIconHelperDelegate.Execute());
        }
        if (this.HoverProviderDelegate.IsBound())
        {
            this.HoverProvider.SetRef(this.HoverProviderDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_MinimapIconTemplate
{
void GetModelInfo(FEUIWidgetMetaInfo &inout Result)
{
    Result.ObservedModelChangesSubscriberNames.Add(FString("HandleMinimapSelectionChanged"));
    Result.ObservedModelChangesSubscriberNames.Add(FString("HandleMinimapIconConfigChanged"));
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
