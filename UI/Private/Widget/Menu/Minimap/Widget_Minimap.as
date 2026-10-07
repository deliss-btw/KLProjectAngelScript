
namespace UWidget_Minimap
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_Minimap : UEUIActivatableWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_Minimap> Minimap;
    UPROPERTY()
    UMinimap MinimapWidget;
    UPROPERTY()
    UMaterialInstance RegionMaskMaterial;
    UPROPERTY()
    UCanvasPanel GamepadCursorCanvas;
    UPROPERTY()
    float32 GamepadMoveSpeed = 500.0f;
    UPROPERTY()
    float32 GamepadScaleSpeed = 10.0f;
    UPROPERTY()
    float32 GamepadMoveResistance = 0.5f;
    UPROPERTY()
    float32 GamepadStickDeadZone = 0.15f;
    bool bLastInputTypeGamepad;
    FVector2D GamepadMoveInput;
    float32 GamepadScaleInput;
    UPROPERTY()
    FEUIActionBinding MarkAndGuideDisplayBinding;
    UPROPERTY()
    FEUIActionBinding MarkAndGuideGamepadBinding;
    UPROPERTY()
    bool bRequestingInitMapScaleAndPosition = false;
    UPROPERTY()
    FGetEUIModelRef MinimapDelegate;


    UFUNCTION()
    FEventReply OnAnalogValueChanged_Implementation(const FGeometry &inout MyGeometry, const FAnalogInputEvent &inout InAnalogInputEvent)
    {
        FKey local_12 = InAnalogInputEvent.GetKey();
        float32 local_14 = InAnalogInputEvent.GetAnalogValue();
        if ((local_12 == EKeys::Gamepad_LeftX))
        {
            this.GamepadMoveInput.X = this.ApplyDeadZone(local_14);
            return FEventReply::Handled();
        }
        if ((local_12 == EKeys::Gamepad_LeftY))
        {
            this.GamepadMoveInput.Y = this.ApplyDeadZone(-local_14);
            return FEventReply::Handled();
        }
        if ((local_12 == EKeys::Gamepad_LeftTriggerAxis))
        {
            this.GamepadScaleInput = this.ApplyDeadZone(local_14);
            return FEventReply::Handled();
        }
        if ((local_12 == EKeys::Gamepad_RightTriggerAxis))
        {
            this.GamepadScaleInput = this.ApplyDeadZone(-local_14);
            return FEventReply::Handled();
        }
        return FEventReply::Unhandled();
    }
    UFUNCTION()
    void OnInitialized_Implementation()
    {
        UEUIInputSubsystem::Get(this.GetOwningLocalPlayer()).OnInputMethodChanged.AddUFunction(this, n"OnInputMethodChanged");
        return;
    }
    UFUNCTION()
    void OnViewBind_Implementation()
    {
        FVM_Minimap& local_2;
        this.InitMapScaleAndPositionDeferred();
        if (!(local_2.GetMinimapDisplayConfig().opArrow().DefaultIconRegistry.IsNull()))
        {
            this.MinimapWidget.AddIconRegistry(TSubclassOf<UMinimapIconRegistryAsset>(System::LoadClassAsset_Blocking(local_2.GetMinimapDisplayConfig().opArrow().DefaultIconRegistry)));
        }
        this.RefreshMarkAndGuideBindingRegistration();
        return;
    }
    UFUNCTION()
    void Destruct_Implementation()
    {
        this.MarkAndGuideDisplayBinding.UnRegister();
        this.MarkAndGuideGamepadBinding.UnRegister();
        return;
    }
    UFUNCTION()
    void Tick_Implementation(const FGeometry &inout MyGeometry, const float32 InDeltaTime)
    {
        UPanelSlot local_36;
        UCanvasPanelSlot local_40;
        if (this.bRequestingInitMapScaleAndPosition)
        {
            if (!(this.MinimapWidget.GetTickSpaceGeometry().GetLocalSize().IsZero()))
            {
                this.MinimapWidget.SetMapScale(this.Minimap.opArrow().GetMinimapDisplayConfig().opArrow().DefaultMapScale);
                if (this.Minimap.opArrow().GetbSetMinimapCenter())
                {
                    this.MinimapWidget.SetCenterWorldPosition(this.Minimap.opArrow().GetMinimapCenter());
                    this.Minimap.opArrow().SetbSetMinimapCenter(false);
                }
                else
                {
                    this.SetMapPositionToLocalPlayer();
                }
                this.bRequestingInitMapScaleAndPosition = false;
            }
        }
        if (this.Minimap)
        {
            if (this.Minimap.opArrow().GetMinimapDisplayConfig().opArrow().bShowDSBoundary && !(this.Minimap.opArrow().GetMinimapDisplayConfig().opArrow().DSBoundaryMaskTexture.IsNull()))
            {
                if (this.RegionMaskMaterial != nullptr)
                {
                    if (!((this.MinimapWidget.GetRetainerEffectMaterial() != nullptr)))
                    {
                        this.MinimapWidget.SetRetainerEffectMaterial(this.RegionMaskMaterial);
                    }
                    this.UpdateRegionMask();
                }
            }
            else
            {
                this.MinimapWidget.SetRetainerEffectMaterial(nullptr);
            }
        }
        if ((int(::UICommonUtil::GetCurrentInputType(this.GetOwningLocalPlayer()))) == 1)
        {
            float32 local_67;
            if (!(this.bLastInputTypeGamepad))
            {
                this.RuleSetFocus();
            }
            this.bLastInputTypeGamepad = true;
            float local_24;
            FVector2D local_28 = (this.GamepadMoveInput * InDeltaTime);
            FVector2D local_6 = (local_28 * this.GamepadMoveSpeed);
            if (::MinimapUtils::IsValidHandle(this.MinimapWidget.GetSelectedIcon()))
            {
                local_6 *= this.GamepadMoveResistance;
            }
            local_36 = this.GamepadCursorCanvas.GetChildAt(0).Slot;
            local_40 = (Cast<UCanvasPanelSlot>(local_36));
            if (!(local_6.IsZero()))
            {
                FVector2D local_22 = local_40.GetPosition();
                float local_46 = FMath::Sign(local_6.X);
                float local_48 = FMath::Sign(local_22.X);
                if ((local_46 * local_48) < 0.0)
                {
                    float local_50 = local_6.X;
                    float local_48_2 = FMath::Sign(local_50);
                    local_50 = FMath::Abs(local_22.X);
                    float local_46_2 = FMath::Min(FMath::Abs(local_6.X), local_50);
                    local_50 = local_48_2 * local_46_2;
                    float local_52 = local_22.X + local_50;
                }
                else
                {
                    float local_52_2 = local_6.X;
                    if ((local_52_2 > 0.0 && this.MinimapWidget.IsAtRightEdge()) || (local_6.X < 0.0 && this.MinimapWidget.IsAtLeftEdge()))
                    {
                        local_52_2 = local_22.X;
                        float local_46_5 = local_52_2 + local_6.X;
                    }
                }
                if (FMath::IsNearlyZero(local_22.X, 9.99999993922529e-9))
                {
                }
                float local_52_4 = FMath::Sign(local_6.Y);
                float local_46_6 = local_52_4 * FMath::Sign(local_22.Y);
                if (local_46_6 < 0.0)
                {
                    local_52_4 = local_6.Y;
                    float local_46_8 = FMath::Abs(local_52_4);
                    float local_48_7 = FMath::Min(local_46_8, FMath::Abs(local_22.Y));
                    local_52_4 = FMath::Sign(local_6.Y) * local_48_7;
                    float local_50_2 = local_22.Y + local_52_4;
                    local_24 = 0.0;
                }
                else
                {
                    float local_50_3 = local_6.Y;
                    if ((local_50_3 < 0.0 && this.MinimapWidget.IsAtTop()) || (local_6.Y > 0.0 && this.MinimapWidget.IsAtBottom()))
                    {
                        local_50_3 = local_22.Y;
                        float local_48_9 = local_50_3 + local_6.Y;
                    }
                }
                if (FMath::IsNearlyZero(local_22.Y, 9.99999993922529e-9))
                {
                }
                if (!(local_6.IsZero()))
                {
                    this.MinimapWidget.MoveByLocalOffset(local_6);
                }
                const FGeometry& local_58 = this.GamepadCursorCanvas.GetTickSpaceGeometry();
                FVector2D local_62 = (local_58.GetLocalSize() / 2.0);
                float local_46_12 = -local_62.Y;
                float local_50_5 = local_22.Y;
                float local_48_10 = FMath::Clamp(local_50_5, local_46_12, local_62.Y);
                local_50_5 = local_62.X;
                float local_56_2 = -local_62.X;
                local_40.SetPosition(FVector2D(FMath::Clamp(local_22.X, local_56_2, local_50_5), local_48_10));
            }
            const FGeometry& local_58_2 = local_40.GetContent().GetTickSpaceGeometry();
            FVector2D local_66 = this.MinimapWidget.GetTickSpaceGeometry().AbsoluteToLocal(local_58_2.LocalToAbsolute((local_58_2.GetLocalSize() / 2.0)));
            local_67 = this.GamepadScaleInput;
            this.MinimapWidget.SetMapScaleWithScaleCenter(((((local_67 * InDeltaTime) * this.GamepadScaleSpeed) + 1.0f) * this.MinimapWidget.GetMapScale()), local_66);
            if (!(this.MinimapWidget.SelectIconAtPosition(local_66, EMinimapIconDetectRule(0))))
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
    float32 ApplyDeadZone(const float32 Value) const
    {
        if (FMath::Abs(Value) < this.GamepadStickDeadZone)
        {
            return 0.0f;
        }
        return ((FMath::Sign(Value) * (FMath::Abs(Value) - this.GamepadStickDeadZone)) / (1.0f - this.GamepadStickDeadZone));
    }
    UFUNCTION()
    void OnInputMethodChanged(const EEUIInputType NewInputType)
    {
        this.RefreshMarkAndGuideBindingRegistration();
        return;
    }
    void RefreshMarkAndGuideBindingRegistration()
    {
        bool local_8 = (int(::UICommonUtil::GetCurrentInputType(this.GetOwningLocalPlayer())) == 1);
        if (local_8)
        {
            if (this.MarkAndGuideDisplayBinding.IsRegistered())
            {
                this.MarkAndGuideDisplayBinding.UnRegister();
            }
            if (!(this.MarkAndGuideGamepadBinding.IsRegistered()))
            {
                this.MarkAndGuideGamepadBinding.Register(this);
            }
            return;
        }
        if (this.MarkAndGuideGamepadBinding.IsRegistered())
        {
            this.MarkAndGuideGamepadBinding.UnRegister();
        }
        if (!(this.MarkAndGuideDisplayBinding.IsRegistered()))
        {
            this.MarkAndGuideDisplayBinding.Register(this);
        }
        return;
    }
    UFUNCTION()
    void SetMapPositionToLocalPlayer()
    {
        this.MinimapWidget.SetCenterWorldPosition(::MinimapUtils::GamePositionToMapPosition(FTransformUtils::GetLocation(this.Minimap.opArrow().GetContext().GetLocalPlayerPawn(), FFPTime(-1))));
        return;
    }
    void InitMapScaleAndPositionDeferred()
    {
        this.bRequestingInitMapScaleAndPosition = true;
        return;
    }
    UFUNCTION()
    void OnGamepadMark()
    {
        if ((int(::UICommonUtil::GetCurrentInputType(this.GetOwningLocalPlayer()))) != 1)
        {
            return;
        }
        this.Minimap_FastMarkPosition(this.MinimapWidget.MinimapWidgetPositionToWorldPosition(this.GetGamepadCursorMapPosition()));
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
    void UpdateRegionMask() const
    {
        UTexture2D local_4;
        if ((!((local_4 != nullptr))))
        {
            return;
        }
        FVector2f local_12 = FVector2f(this.MinimapWidget.GetCachedGeometry().GetLocalSize());
        if (local_12.IsZero())
        {
            return;
        }
        this.MinimapWidget.SetRetainerMaterialTextureParameter(n"Mask", local_4);
        FLinearColor local_27;
        local_27.R = (local_12.X / local_4.Blueprint_GetSizeX());
        local_27.G = (local_12.Y / local_4.Blueprint_GetSizeY());
        local_27.B = 0.0f;
        float32 local_28_3 = 0.0f;
        local_27.A = 0.0f;
        this.MinimapWidget.SetRetainerMaterialVectorParameter(n"TextureTiling", local_27);
        if (this.Minimap.opArrow().GetMinimapDisplayConfig().opArrow().bDSBoundaryMaskStandsForUnreachable)
        {
            local_28_3 = 1.0f;
        }
        else
        {
            local_28_3 = 0.0f;
        }
        this.MinimapWidget.SetRetainerMaterialScalarParameter(n"InverseMask", local_28_3);
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
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.Minimap.Initialize(this, FName("VM_Minimap"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.MinimapDelegate.IsBound())
        {
            this.Minimap.SetRef(this.MinimapDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_Minimap
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
