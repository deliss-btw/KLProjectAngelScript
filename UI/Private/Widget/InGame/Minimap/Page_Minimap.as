
namespace UPage_Minimap
{
    const int ViewID = 0;

}
class UPage_Minimap : UEUIActivatableWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_Page> Page;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_Minimap> Minimap;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_CameraModifier> CameraModifier;
    UPROPERTY()
    UMinimap MinimapWidget;
    UPROPERTY()
    UCanvasPanel GamepadCursorCanvas;
    UPROPERTY()
    UWidget_MinimapBorder MinimapBorder;
    UPROPERTY()
    FText MapTitle;
    bool MinimapModelInit = false;
    TWeakObjectPtr<UUserWidget> GamepadFocusedIconWidget;
    UPROPERTY()
    float32 GamepadMoveSpeed = 500.0f;
    UPROPERTY()
    float32 GamepadScaleSpeed = 10.0f;
    UPROPERTY()
    float32 GamepadMoveResistance = 0.5f;
    bool bLastInputTypeGamepad;
    UPROPERTY()
    FConfigVM_CameraModifier CameraModifierConfig;
    FEUIModelWeakRef __Minimap;
    UPROPERTY()
    FGetEUIModelRef PageDelegate;
    UPROPERTY()
    FGetEUIModelRef MinimapDelegate;
    UPROPERTY()
    FGetEUIModelRef CameraModifierDelegate;


    UFUNCTION()
    void OnViewBind_Implementation()
    {
        TDataObjectPtr<FMinimapDisplayConfig> local_24 = ::MinimapUtils::GetCurrentMinimapDisplayConfig();
        if (!(local_24))
        {
            XError(ELog(16), FString().Append("Failed to find minimap display config for level ").Append(this.GetWorld()));
            return;
        }
        UMinimapConfig local_62 = Cast<UMinimapConfig>(System::LoadAsset_Blocking(local_24.opArrow().MinimapConfig));
        if ((!((local_62 != nullptr))))
        {
            XWarning(ELog(16), FString().Append("Minimap config for level ").Append(this.GetWorld()).Append(" not found"));
            return;
        }
        this.MinimapWidget.SetBaseMapScale(int(local_24.opArrow().BaseMapScale));
        this.MinimapWidget.SetMapConfig(local_62);
        if (!(local_24.opArrow().DefaultIconRegistry.IsNull()))
        {
            this.MinimapWidget.AddIconRegistry(TSubclassOf<UMinimapIconRegistryAsset>(System::LoadClassAsset_Blocking(local_24.opArrow().DefaultIconRegistry)));
        }
        this.MinimapWidget.SetMapScale(int(local_24.opArrow().DefaultMapScale));
        return;
    }
    UFUNCTION()
    void Tick_Implementation(const FGeometry &inout MyGeometry, const float32 InDeltaTime)
    {
        bool local_1;
        AAS_ECSProxyPlayerController local_16;
        UPanelSlot local_38;
        UCanvasPanelSlot local_42;
        if (!(this.MinimapModelInit))
        {
            FVM_Minimap& local_4;
            if (local_4)
            {
                if (local_4.GetbLocalPlayerPositionSet())
                {
                    this.MinimapWidget.SetCenterWorldPosition(local_4.GetLocalPlayerPosition());
                    this.MinimapModelInit = true;
                }
            }
            return;
        }
        if ((int(::UICommonUtil::GetCurrentInputType(this.GetOwningLocalPlayer()))) == 1)
        {
            float32 local_69;
            this.bLastInputTypeGamepad = true;
            local_16 = (Cast<AAS_ECSProxyPlayerController>(this.GetOwningPlayer()));
            if (!((local_16 != nullptr)))
            {
                return;
            }
            float local_26;
            FVector2D local_30 = (local_16.MoveAxisValue * InDeltaTime);
            FVector2D local_24 = (local_30 * this.GamepadMoveSpeed);
            if (::MinimapUtils::IsValidHandle(this.MinimapWidget.GetSelectedIcon()))
            {
                local_24 *= this.GamepadMoveResistance;
            }
            local_38 = this.GamepadCursorCanvas.GetChildAt(0).Slot;
            local_42 = (Cast<UCanvasPanelSlot>(local_38));
            local_1 = !(local_24.IsZero());
            if (local_1)
            {
                FVector2D local_20 = local_42.GetPosition();
                float local_48 = FMath::Sign(local_24.X);
                float local_50 = FMath::Sign(local_20.X);
                if ((local_48 * local_50) < 0.0)
                {
                    float local_52 = local_24.X;
                    float local_50_2 = FMath::Sign(local_52);
                    local_52 = FMath::Abs(local_20.X);
                    float local_48_2 = FMath::Min(FMath::Abs(local_24.X), local_52);
                    local_52 = local_50_2 * local_48_2;
                    float local_54 = local_20.X + local_52;
                }
                else
                {
                    float local_54_2 = local_24.X;
                    local_1 = local_54_2 > 0.0 && this.MinimapWidget.IsAtRightEdge();
                    if (local_1 || (local_24.X < 0.0 && this.MinimapWidget.IsAtLeftEdge()))
                    {
                        local_54_2 = local_24.X;
                        float local_50_3 = local_20.X + local_54_2;
                        local_54_2 = 0.0;
                    }
                }
                float local_54_3 = local_20.X;
                if (FMath::IsNearlyZero(local_54_3, 9.99999993922529e-9))
                {
                }
                float local_48_7 = FMath::Sign(local_24.Y);
                local_54_3 = local_20.Y;
                float local_50_4 = local_48_7 * FMath::Sign(local_54_3);
                if (local_50_4 < 0.0)
                {
                    float local_48_8 = local_24.Y;
                    float local_50_6 = FMath::Abs(local_48_8);
                    local_54_3 = FMath::Min(local_50_6, FMath::Abs(local_20.Y));
                    float local_48_9 = FMath::Sign(local_24.Y) * local_54_3;
                    float local_52_2 = local_20.Y + local_48_9;
                    local_26 = 0.0;
                }
                else
                {
                    float local_52_3 = local_24.Y;
                    if (local_52_3 < 0.0 && this.MinimapWidget.IsAtTop())
                    {
                        local_1 = true;
                    }
                    else
                    {
                        local_54_3 = local_24.Y;
                        local_1 = local_54_3 > 0.0 && this.MinimapWidget.IsAtBottom();
                    }
                    if (local_1)
                    {
                        local_52_3 = local_20.Y;
                        local_54_3 = local_52_3 + local_24.Y;
                    }
                }
                if (FMath::IsNearlyZero(local_20.Y, 9.99999993922529e-9))
                {
                }
                if (!(local_24.IsZero()))
                {
                    this.MinimapWidget.MoveByLocalOffset(local_24);
                }
                const FGeometry& local_60 = this.GamepadCursorCanvas.GetTickSpaceGeometry();
                FVector2D local_64 = (local_60.GetLocalSize() / 2.0);
                float local_50_10 = -local_64.Y;
                float local_52_5 = local_20.Y;
                local_54_3 = FMath::Clamp(local_52_5, local_50_10, local_64.Y);
                local_52_5 = local_64.X;
                float local_58_2 = -local_64.X;
                local_42.SetPosition(FVector2D(FMath::Clamp(local_20.X, local_58_2, local_52_5), local_54_3));
            }
            const FGeometry& local_60_2 = local_42.GetContent().GetTickSpaceGeometry();
            FVector2D local_68 = this.MinimapWidget.GetTickSpaceGeometry().AbsoluteToLocal(local_60_2.LocalToAbsolute((local_60_2.GetLocalSize() / 2.0)));
            local_69 = local_16.ScaleAxisValue;
            this.MinimapWidget.SetMapScaleWithScaleCenter(((((local_69 * InDeltaTime) * this.GamepadScaleSpeed) + 1.0f) * this.MinimapWidget.GetMapScale()), local_68);
            if (!(this.MinimapWidget.SelectIconAtPosition(local_68, EMinimapIconDetectRule(0))))
            {
                this.MinimapWidget.ClearIconSelection();
            }
            return;
        }
        if (this.bLastInputTypeGamepad)
        {
            this.bLastInputTypeGamepad = false;
            this.MinimapWidget.ClearIconSelection();
        }
        if (!(::CommonPopup::HasAnyHover()))
        {
            this.MinimapWidget.ClearIconSelection();
        }
        return;
    }
    UFUNCTION()
    void OnGamepadMark()
    {
        if ((int(::UICommonUtil::GetCurrentInputType(this.GetOwningLocalPlayer()))) != 1)
        {
            return;
        }
        FVector2D local_10 = this.GetGamepadCursorMapPosition();
        this.Minimap_MarkPosition(this.MinimapWidget.GetTickSpaceGeometry().LocalToAbsolute(local_10), this.MinimapWidget.MinimapWidgetPositionToWorldPosition(local_10));
        return;
    }
    UFUNCTION()
    void OnGamepadGuide()
    {
        if ((int(::UICommonUtil::GetCurrentInputType(this.GetOwningLocalPlayer()))) != 1)
        {
            return;
        }
        this.Minimap_MarkAndGuideToPosition(this.MinimapWidget.MinimapWidgetPositionToWorldPosition(this.GetGamepadCursorMapPosition()));
        return;
    }
    FVector2D GetGamepadCursorMapPosition() const
    {
        UPanelSlot local_6 = this.GamepadCursorCanvas.GetChildAt(0).Slot;
        UCanvasPanelSlot local_10 = (Cast<UCanvasPanelSlot>(local_6));
        const FGeometry& local_12 = local_10.GetContent().GetTickSpaceGeometry();
        FVector2D local_16 = local_12.LocalToAbsolute((local_12.GetLocalSize() / 2.0));
        return this.MinimapWidget.GetTickSpaceGeometry().AbsoluteToLocal(local_16);
    }
    UFUNCTION()
    void OnDisplayPathsChanged(const TArray<FMinimapPath> &inout DisplayPaths)
    {
        this.MinimapWidget.ClearPath();
        for (auto& local_16 : DisplayPaths)
        {
            this.MinimapWidget.AddPath(local_16);
        }
        return;
    }
    UFUNCTION()
    void OnDisplayBorderChanged(const FMinimapBorderInfo &inout DisplayBorder)
    {
        this.MinimapBorder.SetBorderInfo(DisplayBorder);
        return;
    }
    UFUNCTION()
    void OnMinimapCenterChanged(const FVector2D &inout MinimapCenter)
    {
        if (MinimapCenter.IsZero())
        {
            return;
        }
        this.MinimapWidget.SetCenterWorldPosition(MinimapCenter);
        return;
    }
    UFUNCTION()
    void TryInvokeDebugMove(const FPointerEvent &inout MouseEvent) const
    {
        if (this.MinimapWidget != nullptr)
        {
            const FGeometry& local_6 = this.MinimapWidget.GetTickSpaceGeometry();
            FVector2D local_14 = local_6.AbsoluteToLocal(MouseEvent.GetScreenSpacePosition());
            if (local_14.X > 0.0 && (local_14.Y > 0.0) && (local_14.X < local_6.GetLocalSize().X) && (local_14.Y < local_6.GetLocalSize().Y))
            {
                this.Minimap_DebugMoveToLocation(this.MinimapWidget.MinimapWidgetPositionToWorldPosition(local_14));
            }
        }
        return;
    }
    UFUNCTION()
    void MarkPosition(const FVector2D &inout WorldPosition)
    {
        FVector2D local_12 = this.MinimapWidget.GetTickSpaceGeometry().LocalToAbsolute(this.MinimapWidget.WorldPositionToMinimapWidgetPosition(WorldPosition));
        this.Minimap_MarkPosition(local_12, WorldPosition);
        return;
    }
    UFUNCTION()
    void MarkAndGuideToPosition(const FVector2D &inout ScreenSpacePosition)
    {
        if (this.MinimapWidget != nullptr)
        {
            const FGeometry& local_6 = this.MinimapWidget.GetTickSpaceGeometry();
            FVector2D local_10 = local_6.AbsoluteToLocal(ScreenSpacePosition);
            if (local_10.X > 0.0 && (local_10.Y > 0.0) && (local_10.X < local_6.GetLocalSize().X) && (local_10.Y < local_6.GetLocalSize().Y))
            {
                this.Minimap_MarkAndGuideToPosition(this.MinimapWidget.MinimapWidgetPositionToWorldPosition(local_10));
            }
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
    bool Minimap_bLocalPlayerPositionSet() const
    {
        FVM_Minimap& local_2;
        bool local_5;
        if (local_2)
        {
            local_5 = local_2.GetbLocalPlayerPositionSet();
        }
        else
        {
            local_5 = false;
        }
        return local_5;
    }
    UFUNCTION()
    FVector2D Minimap_LocalPlayerPosition() const
    {
        FVM_Minimap& local_2;
        FVector2D local_12 = local_2 ? local_2.GetLocalPlayerPosition() : FVector2D();
        return local_12;
    }
    UFUNCTION()
    void Minimap_SetNavigationTarget(const FVector2D &inout WorldPosition) const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder::PushArg local_42;
        local_42.opCall(WorldPosition);
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void Minimap_DebugMoveToLocation(const FVector2D &inout WorldPosition) const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder::PushArg local_42;
        local_42.opCall(WorldPosition);
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void Minimap_MarkPosition(const FVector2D &inout HoverPosition, const FVector2D &inout WorldPosition) const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder::PushArg local_42;
        local_42.opCall(HoverPosition);
        local_42.opCall(WorldPosition);
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void Minimap_FastMarkPosition(const FVector2D &inout WorldPosition) const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder::PushArg local_42;
        local_42.opCall(WorldPosition);
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void Minimap_MarkAndGuideToPosition(const FVector2D &inout WorldPosition) const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder::PushArg local_42;
        local_42.opCall(WorldPosition);
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    void HandleObservedModelChanges(FEUIReactiveSubscriberIterator &inout It)
    {
        FVM_Minimap& local_6;
        TEUIModelRef<FVM_Minimap> local_2 = this.Minimap.AsRef();
        for (; It; )
        {
            FEUIReactiveSubscriberTrackScope local_56 = FEUIReactiveSubscriberTrackScope(It);
            switch (It.GetIndex())
            {
            case 0:
            {
                this.Minimap.TrackRead();
                if (local_6)
                {
                    local_6.TrackPropertyRead(::FVM_Minimap::__IndexOf_DisplayPaths());
                }
                if (local_6)
                {
                    this.OnDisplayPathsChanged(local_6.GetDisplayPaths());
                }
                break;
            }
            case 1:
            {
                this.Minimap.TrackRead();
                if (local_6)
                {
                    local_6.TrackPropertyRead(::FVM_Minimap::__IndexOf_DisplayBorder());
                }
                if (local_6)
                {
                    this.OnDisplayBorderChanged(local_6.GetDisplayBorder());
                }
                break;
            }
            case 2:
            {
                this.Minimap.TrackRead();
                if (local_6)
                {
                    local_6.TrackPropertyRead(::FVM_Minimap::__IndexOf_MinimapCenter());
                }
                if (local_6)
                {
                    this.OnMinimapCenterChanged(local_6.GetMinimapCenter());
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
                XError(ELog(17), "Remaining observed model change: OnDisplayPathsChanged");
            }
            if (It.IsDirty(1))
            {
                XError(ELog(17), "Remaining observed model change: OnDisplayBorderChanged");
            }
            if (It.IsDirty(2))
            {
                XError(ELog(17), "Remaining observed model change: OnMinimapCenterChanged");
            }
            return;
        }
        this.__Minimap = local_2.opImplConv();
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.Page.Initialize(this, FName("VM_Page"), EEUIWidgetRefModelCreationType(0), false);
        this.Minimap.Initialize(this, FName("VM_Minimap"), EEUIWidgetRefModelCreationType(0), false);
        this.CameraModifier.Initialize(this, FName("VM_CameraModifier"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.PageDelegate.IsBound())
        {
            this.Page.SetRef(this.PageDelegate.Execute());
        }
        if (this.MinimapDelegate.IsBound())
        {
            this.Minimap.SetRef(this.MinimapDelegate.Execute());
        }
        if (this.CameraModifierDelegate.IsBound())
        {
            this.CameraModifier.SetRef(this.CameraModifierDelegate.Execute());
        }
        return;
    }
}

namespace UPage_Minimap
{
void GetModelInfo(FEUIWidgetMetaInfo &inout Result)
{
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnDisplayPathsChanged"));
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnDisplayBorderChanged"));
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnMinimapCenterChanged"));
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
