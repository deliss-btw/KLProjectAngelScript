
namespace UPage_CommonHover
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UPage_CommonHover : UEUIActivatableWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_CommonHover> CommonHover;
    UPROPERTY()
    UWidget HoverWidget;
    bool bLoggedHoverOutOfBounds = false;
    bool bHoverChainNextNavigationBound = false;
    bool bHoverChainPreviousNavigationBound = false;
    bool bEnteredByHoverChainNavigation = false;
    FTimerHandle DeferredHoverChainFocusExitTimerHandle;
    bool bDeferredHoverChainFocusExitScheduled = false;
    FEUIModelWeakRef __CommonHover;
    UPROPERTY()
    FGetEUIModelRef CommonHoverDelegate;


    UFUNCTION()
    void OnViewBind_Implementation()
    {
        this.bEnteredByHoverChainNavigation = false;
        this.SetRuntimeSupportsActivationFocus(this.CommonHover.IsValid() && GetbFocusHover());
        this.RefreshHoverChainNavigation();
        return;
    }
    UFUNCTION()
    void OnViewUnbind_Implementation()
    {
        this.CancelContentEnterByChainNavigation();
        this.ClearDeferredHoverChainFocusExitCheck();
        this.bEnteredByHoverChainNavigation = false;
        this.SetRuntimeSupportsActivationFocus(false);
        if (this.bHoverChainNextNavigationBound)
        {
            this.ClearNavigationRuleCustomWithActionDisplay(EUINavigation(4));
            this.bHoverChainNextNavigationBound = false;
        }
        if (this.bHoverChainPreviousNavigationBound)
        {
            this.ClearNavigationRuleCustomWithActionDisplay(EUINavigation(5));
            this.bHoverChainPreviousNavigationBound = false;
        }
        return;
    }
    UFUNCTION()
    UWidget GetDesiredFocusWidget_Implementation() const
    {
        return this.HoverWidget;
    }
    UFUNCTION()
    void OnAddedToFocusPath_Implementation(const FFocusEvent &inout InFocusEvent)
    {
        if (!(this.CommonHover.IsValid()))
        {
            return;
        }
        this.MarkEnteredByHoverChainFocus();
        this.RefreshHoverChainNavigation();
        if ((int(InFocusEvent.GetCause())) == 1)
        {
            this.NotifyContentEnteredByChainNavigation();
        }
        return;
    }
    UFUNCTION()
    void OnRemovedFromFocusPath_Implementation(const FFocusEvent &inout InFocusEvent)
    {
        this.CancelContentEnterByChainNavigation();
        this.ScheduleHoverChainFocusExitCheck();
        return;
    }
    UFUNCTION()
    void Construct_Implementation()
    {
        this.HoverWidget.SetVisibility(ESlateVisibility(2));
        this.bLoggedHoverOutOfBounds = false;
        return;
    }
    UFUNCTION()
    void Tick_Implementation(const FGeometry &inout MyGeometry, const float32 InDeltaTime)
    {
        if (this.CommonHover.IsValid())
        {
            FGeometry local_18 = this.HoverWidget.GetParent().GetTickSpaceGeometry();
            FGeometry local_34 = WidgetLayout::GetViewportWidgetGeometry(__GetWorldContext());
            FGeometry local_62;
            if (this.CommonHover.opArrow().GetHoverLimitationViewportSpaceOverride().bIsValid)
            {
                FVector2D local_70 = local_18.AbsoluteToLocal(local_34.LocalToAbsolute(this.CommonHover.opArrow().GetHoverLimitationViewportSpaceOverride().Min));
                local_62 = local_18.MakeChild(local_70, (local_18.AbsoluteToLocal(local_34.LocalToAbsolute(this.CommonHover.opArrow().GetHoverLimitationViewportSpaceOverride().Max)) - local_70));
            }
            else
            {
                local_62 = local_18;
            }
            if (!(local_62.GetLocalSize().IsZero()))
            {
                FBox2D local_88;
                local_88.Min = local_34.LocalToAbsolute(GetAnchorsViewportSpace().Min);
                local_88.Max = local_34.LocalToAbsolute(GetAnchorsViewportSpace().Max);
                local_88.bIsValid = (GetAnchorsViewportSpace().bIsValid != 0);
                if (this.UpdateHoverAnchors(local_18, local_62, local_88))
                {
                    this.HoverWidget.SetVisibility(ESlateVisibility(4));
                    this.HoverWidget.SetRenderOpacity(1.0f);
                }
                else
                {
                    this.HoverWidget.SetVisibility(ESlateVisibility(3));
                    this.HoverWidget.SetRenderOpacity(0.0f);
                }
            }
        }
        return;
    }
    UFUNCTION()
    void OnHoverChainNavigationStateChanged()
    {
        this.RefreshHoverChainNavigation();
        return;
    }
    void MarkEnteredByHoverChainFocus()
    {
        this.ClearDeferredHoverChainFocusExitCheck();
        this.bEnteredByHoverChainNavigation = true;
        this.SetRuntimeSupportsActivationFocus(true);
        return;
    }
    void ScheduleHoverChainFocusExitCheck()
    {
        if (!(this.CommonHover.IsValid()) || GetbFocusHover() || !(this.bEnteredByHoverChainNavigation))
        {
            return;
        }
        if (this.bDeferredHoverChainFocusExitScheduled)
        {
            return;
        }
        this.bDeferredHoverChainFocusExitScheduled = true;
        this.DeferredHoverChainFocusExitTimerHandle = System::SetTimer(this, n"DeferredCheckHoverChainFocusExit", 0.001f, false, false, 0.0f, 0.0f);
        return;
    }
    void ClearDeferredHoverChainFocusExitCheck()
    {
        this.bDeferredHoverChainFocusExitScheduled = false;
        System::ClearAndInvalidateTimerHandle(__GetWorldContext(), this.DeferredHoverChainFocusExitTimerHandle);
        return;
    }
    UFUNCTION()
    void DeferredCheckHoverChainFocusExit()
    {
        System::ClearAndInvalidateTimerHandle(__GetWorldContext(), this.DeferredHoverChainFocusExitTimerHandle);
        this.bDeferredHoverChainFocusExitScheduled = false;
        if (!(this.CommonHover.IsValid()) || GetbFocusHover() || !(this.bEnteredByHoverChainNavigation))
        {
            return;
        }
        if (this.IsPartOfFocusPath(this))
        {
            return;
        }
        FCommonHoverHandle local_8 = this.ResolveDisplayedChildHover(GetHoverHandle());
        if (local_8.IsValid())
        {
            UWidget local_10 = Cast<UWidget>(local_8.WidgetRef.GetUserWidget());
            if (IsValid(local_10) && this.IsPartOfFocusPath(local_10))
            {
                return;
            }
        }
        this.bEnteredByHoverChainNavigation = false;
        this.SetRuntimeSupportsActivationFocus(false);
        return;
    }
    UFUNCTION()
    UWidget ResolveCommonHoverChainNextNavigationTarget(const EUINavigation InNavigation)
    {
        UEUIUserWidget local_16;
        if (int(InNavigation) != 4 || !(this.CommonHover.IsValid()))
        {
            return nullptr;
        }
        FCommonHoverHandle local_8;
        FCommonHoverHandle local_10;
        local_10 = this.ResolveDisplayedChildHover(local_8);
        if (local_10.IsValid())
        {
            local_16 = local_10.WidgetRef.GetUserWidget();
        }
        else
        {
        }
        return local_16;
    }
    UFUNCTION()
    UWidget ResolveCommonHoverChainPreviousNavigationTarget(const EUINavigation InNavigation)
    {
        if (int(InNavigation) != 5 || !(this.CommonHover.IsValid()))
        {
            return nullptr;
        }
        if (GetParentHoverHandle().IsValid())
        {
            return GetParentHoverHandle().WidgetRef.GetUserWidget();
        }
        return nullptr;
    }
    FCommonHoverHandle ResolveDisplayedChildHover(const FCommonHoverHandle &inout CurrentHoverHandle) const
    {
        FCommonHoverHandle __r;
        bool local_1 = !(this.CommonHover.IsValid()) || !(CurrentHoverHandle.IsValid());
        if (local_1)
        {
            local_1 = true;
        }
        else
        {
            FCommonHoverHandle local_4;
            local_1 = (local_4.opCmp(CurrentHoverHandle) != 0);
        }
        if (local_1)
        {
        }
        else
        {
        }
        return __r;
    }
    void NotifyContentEnteredByChainNavigation()
    {
        if (!(this.CommonHover.IsValid()) || !(SupportsChainNavigation()))
        {
            return;
        }
        if (this.ResolveDisplayedChildHover(GetHoverHandle()).IsValid())
        {
            return;
        }
        RequestContentEnterByChainNavigation();
        return;
    }
    void CancelContentEnterByChainNavigation()
    {
        if (this.CommonHover.IsValid())
        {
            CancelContentEnterByChainNavigation();
        }
        return;
    }
    void RefreshHoverChainNavigation()
    {
        bool local_2 = this.CommonHover.IsValid() && SupportsChainNavigation();
        bool local_1 = local_2 && IsValid(this.ResolveCommonHoverChainNextNavigationTarget(EUINavigation(4)));
        bool local_3 = local_2 && IsValid(this.ResolveCommonHoverChainPreviousNavigationTarget(EUINavigation(5)));
        bool local_4 = !(this.bHoverChainNextNavigationBound);
        if (!(local_1) != local_4)
        {
            this.bHoverChainNextNavigationBound = local_1;
            if (this.bHoverChainNextNavigationBound)
            {
                this.SetNavigationRuleCustomWithActionDisplay(EUINavigation(4), FCustomWidgetNavigationDelegate(this, n"ResolveCommonHoverChainNextNavigationTarget"), EEUIActionDisplay(0), EEUIActionDisplaySlot(0), false);
            }
            else
            {
                this.ClearNavigationRuleCustomWithActionDisplay(EUINavigation(4));
            }
        }
        bool local_4_2 = !(this.bHoverChainPreviousNavigationBound);
        if (!(local_3) != local_4_2)
        {
            this.bHoverChainPreviousNavigationBound = local_3;
            if (this.bHoverChainPreviousNavigationBound)
            {
                this.SetNavigationRuleCustomWithActionDisplay(EUINavigation(5), FCustomWidgetNavigationDelegate(this, n"ResolveCommonHoverChainPreviousNavigationTarget"), EEUIActionDisplay(0), EEUIActionDisplaySlot(0), false);
                return;
            }
            this.ClearNavigationRuleCustomWithActionDisplay(EUINavigation(5));
        }
        return;
    }
    bool UpdateHoverAnchors(const FGeometry &inout SlotGeometry, const FGeometry &inout BoundaryGeometry, const FBox2D &inout AnchorsBox)
    {
        float32 local_47;
        float32 local_48;
        bool local_49;
        float local_56;
        float local_58;
        int local_1 = 1106247680;
        FBox2D local_12;
        local_12.Min = BoundaryGeometry.AbsoluteToLocal(AnchorsBox.Min);
        local_12.Max = BoundaryGeometry.AbsoluteToLocal(AnchorsBox.Max);
        UPanelSlot local_18 = this.HoverWidget.Slot;
        UCanvasPanelSlot local_22 = (Cast<UCanvasPanelSlot>(local_18));
        if (local_22 != nullptr)
        {
            ECommonHoverLayout local_33;
            bool local_23;
            this.HoverWidget.ForceLayoutPrepass();
            FVector2D local_16 = this.HoverWidget.GetDesiredSize();
            if (local_16.IsZero())
            {
                return false;
            }
            FVector2D local_28 = BoundaryGeometry.GetLocalSize();
            local_33 = GetHoverLayout();
            local_23 = (int(local_33) == 0) || (int(local_33) == 1);
            FVector2D local_42;
            FVector2D local_46;
            if (local_23)
            {
                local_49 = false;
                int local_37 = int(local_33);
                if (local_37 <= 1)
                {
                    if (local_37 != 0)
                    {
                        if (local_37 != 1)
                        {
                        }
                    }
                    else
                    {
                        local_49 = ((local_16.X + local_12.Max.X) > local_28.X);
                        local_56 = local_12.Min.X;
                        local_49 = ((local_56 - local_16.X) > 0.0);
                    }
                }
                if (local_49)
                {
                    local_58 = local_12.Min.X;
                    float local_60 = local_58 - 30.0;
                }
                else
                {
                    local_58 = 30.0;
                    float local_60_2 = local_12.Max.X + local_58;
                }
                local_42 = FVector2D();
                float local_54_4 = local_42.Y;
                local_56 = local_28.Y;
                local_58 = local_16.Y;
                float local_60_3 = local_56 - local_58;
                local_58 = FMath::Min(local_60_3, local_54_4);
                local_60_3 = FMath::Max(0.0, local_58);
                this.ClampFixPoint(local_42, local_28);
                if (local_49)
                {
                    local_56 = local_42.X;
                }
                else
                {
                    local_56 = local_28.X - local_42.X;
                }
                local_58 = local_16.X;
                local_47 = float32((FMath::Min(local_58, local_56)));
                local_60_3 = local_16.Y;
                local_58 = FMath::Min(local_60_3, local_28.Y);
                local_48 = float32(local_58);
                int local_36 = local_49 ? 1 : 0;
                local_12.Min.Y = local_36;
                local_46 = FVector2D();
            }
            else
            {
                local_49 = false;
                int local_36_2 = int(local_33);
                if (local_36_2 <= 3)
                {
                    if (local_36_2 != 2)
                    {
                        if (local_36_2 != 3)
                        {
                        }
                        else
                        {
                            local_56 = local_16.Y + local_12.Max.Y;
                            local_49 = (local_56 > local_28.Y);
                        }
                    }
                    else
                    {
                        local_56 = local_12.Min.Y - local_16.Y;
                        local_49 = (local_56 > 0.0);
                    }
                }
                float local_62_2 = local_12.Min.X;
                local_56 = local_62_2 + local_12.Max.X;
                float32 local_2 = float32((local_56 * 0.5));
                if (local_49)
                {
                    local_62_2 = local_12.Min.Y - 30.0;
                }
                else
                {
                    local_62_2 = local_12.Max.Y + 30.0;
                }
                local_58 = local_2;
                local_42 = FVector2D(local_58, local_62_2);
                local_58 = local_16.X * 0.5;
                float32 local_63 = float32(local_58);
                local_58 = local_28.X;
                local_56 = local_58 - local_63;
                local_56 = FMath::Max(local_63, FMath::Min(local_56, local_42.X));
                this.ClampFixPoint(local_42, local_28);
                local_47 = float32((FMath::Min(local_16.X, local_28.X)));
                if (local_49)
                {
                    local_58 = local_42.Y;
                }
                else
                {
                    local_58 = local_28.Y - local_42.Y;
                }
                local_48 = float32((FMath::Min(local_16.Y, local_58)));
                local_36_2 = local_49 ? 1 : 0;
                local_46 = FVector2D(0.5, local_36_2);
            }
            this.LogHoverOutOfBoundsIfNeeded(local_28, local_12, local_42, local_46, local_47, local_48, local_16, ECommonHoverLayout(local_33));
            FVector2D local_68 = SlotGeometry.AbsoluteToLocal(BoundaryGeometry.LocalToAbsolute(local_42));
            local_58 = local_68.Y;
            float32 local_64 = float32(local_58);
            local_58 = local_68.X;
            local_22.SetOffsets(FMargin(float32(local_58), local_64, local_47, local_48));
            local_22.SetAlignment(local_46);
            return true;
        }
        return false;
    }
    void LogHoverOutOfBoundsIfNeeded(const FVector2D &inout BoundaryLocalSize, const FBox2D &inout LocalAnchors, const FVector2D &inout FixPoint, const FVector2D &inout Alignment, const float32 AllocateX, const float32 AllocateY, const FVector2D &inout HoverDesiredSize, const ECommonHoverLayout Layout)
    {
        float32 local_9 = float32((FixPoint.X - (Alignment.X * AllocateX)));
        float32 local_1 = float32((FixPoint.Y - (Alignment.Y * AllocateY)));
        float32 local_10 = local_9 + AllocateX;
        float32 local_13 = local_1 + AllocateY;
        int local_15 = 1056964608;
        if (!((local_9 < -0.5f) || (local_1 < -0.5f) || ((local_10 > (BoundaryLocalSize.X + 0.5))) || ((local_13 > (BoundaryLocalSize.Y + 0.5)))))
        {
            this.bLoggedHoverOutOfBounds = false;
            return;
        }
        if (this.bLoggedHoverOutOfBounds)
        {
            return;
        }
        this.bLoggedHoverOutOfBounds = true;
        int local_20 = int(Layout);
        XVerbose(ELog(16), FString().Append("CommonHover layout may exceed boundary: Layout=").Append(local_20).Append(" Desired=(").Append(HoverDesiredSize.X).Append(", ").Append(HoverDesiredSize.Y).Append(") Boundary=(").Append(BoundaryLocalSize.X).Append(", ").Append(BoundaryLocalSize.Y).Append(") LocalAnchorsMin=(").Append(LocalAnchors.Min.X).Append(", ").Append(LocalAnchors.Min.Y).Append(") LocalAnchorsMax=(").Append(LocalAnchors.Max.X).Append(", ").Append(LocalAnchors.Max.Y).Append(") FixPoint=(").Append(FixPoint.X).Append(", ").Append(FixPoint.Y).Append(") Alignment=(").Append(Alignment.X).Append(", ").Append(Alignment.Y).Append(") Alloc=(").Append(AllocateX).Append(", ").Append(AllocateY).Append(") ResultRect=(").Append(local_9).Append(", ").Append(local_1).Append(")-(").Append(local_10).Append(", ").Append(local_13).Append(")"));
        return;
    }
    void ClampFixPoint(FVector2D &inout FixPoint, const FVector2D &inout BoundaryLocalSize)
    {
        if (FixPoint.X < 0.0)
        {
        }
        else
        {
            if (FixPoint.X > BoundaryLocalSize.X)
            {
                float local_2_2 = BoundaryLocalSize.X;
            }
        }
        if (FixPoint.Y < 0.0)
        {
            return;
        }
        if (FixPoint.Y > BoundaryLocalSize.Y)
        {
            float local_2_4 = BoundaryLocalSize.Y;
        }
        return;
    }
    UFUNCTION()
    TSoftClassPtr<UUserWidget> CommonHover_ContentWidget() const
    {
        FVM_CommonHover& local_2;
        TSoftClassPtr<UUserWidget> local_34;
        if (local_2)
        {
            local_34 = local_2.GetContentWidget();
        }
        else
        {
            local_34 = TSoftClassPtr<UUserWidget>();
        }
        return local_34;
    }
    UFUNCTION()
    FEUIModelContainer CommonHover_ContentModels() const
    {
        FVM_CommonHover& local_2;
        FEUIModelContainer local_32 = local_2 ? local_2.GetContentModels() : FEUIModelContainer();
        return local_32;
    }
    UFUNCTION()
    ESlateVisibility CommonHover_SlateVisibilitybClickClose() const
    {
        FVM_CommonHover& local_2;
        int local_5;
        if (local_2)
        {
            local_5 = int(local_2.bClickCloseAsSlateVisibility());
        }
        else
        {
            local_5 = 0;
        }
        return ESlateVisibility(local_5);
    }
    UFUNCTION()
    void CommonHover_CloseHover() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    void HandleObservedModelChanges(FEUIReactiveSubscriberIterator &inout It)
    {
        FVM_CommonHover& local_6;
        TEUIModelRef<FVM_CommonHover> local_2 = this.CommonHover.AsRef();
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
                    this.CommonHover.TrackRead();
                    if (local_6)
                    {
                        local_6.TrackPropertyRead(::FVM_CommonHover::__IndexOf_OutsideCloseMode());
                        local_6.TrackPropertyRead(::FVM_CommonHover::__IndexOf_ParentHoverHandle());
                        local_6.TrackPropertyRead(::FVM_CommonHover::__IndexOf_HoverHandle());
                        local_6.TrackPropertyRead(::FVM_CommonHover::__IndexOf_DisplayedChildHoverHandle());
                    }
                    if (local_6)
                    {
                        this.OnHoverChainNavigationStateChanged();
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
                XError(ELog(17), "Remaining observed model change: OnHoverChainNavigationStateChanged");
            }
            return;
        }
        this.__CommonHover = local_2.opImplConv();
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.CommonHover.Initialize(this, FName("VM_CommonHover"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.CommonHoverDelegate.IsBound())
        {
            this.CommonHover.SetRef(this.CommonHoverDelegate.Execute());
        }
        return;
    }
}

namespace UPage_CommonHover
{
void GetModelInfo(FEUIWidgetMetaInfo &inout Result)
{
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnHoverChainNavigationStateChanged"));
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
