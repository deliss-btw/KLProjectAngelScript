
namespace UWidget_VirtualJoystick
{
    const int ViewID = 0;

}
class UWidget_VirtualJoystick : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_MoveJoystick> MoveJoystick;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_TouchLook> TouchLook;
    UPROPERTY()
    UEUIImage Img_JoystickBase;
    UPROPERTY()
    UEUIImage Img_JoystickThumb;
    UPROPERTY()
    UWidget Overlay_Arrow;
    UPROPERTY()
    UEUICanvasPanel Canvas_TouchZone;
    UPROPERTY()
    FConfigVM_MoveJoystick MoveJoystickConfig;
    UPROPERTY()
    FConfigVM_TouchLook TouchLookConfig;
    UPROPERTY()
    FGetEUIModelRef MoveJoystickDelegate;
    UPROPERTY()
    FGetEUIModelRef TouchLookDelegate;

    UWidget_VirtualJoystick()
    {
        return;
    }
    UFUNCTION()
    void Tick_Implementation(const FGeometry &inout MyGeometry, const float32 InDeltaTime)
    {
        if ((int(::UICommonUtil::GetCurrentInputType(nullptr))) != 2)
        {
            this.Img_JoystickBase.SetVisibility(ESlateVisibility(1));
            this.Img_JoystickThumb.SetVisibility(ESlateVisibility(1));
            this.SetOverlayArrowVisibility(ESlateVisibility(1));
            return;
        }
        if (this.MoveJoystick.IsValid() && this.TouchLook.IsValid())
        {
            if (this.MoveJoystick.opArrow().GetbIsActive())
            {
                this.Img_JoystickBase.SetVisibility(ESlateVisibility(4));
                this.Img_JoystickThumb.SetVisibility(ESlateVisibility(4));
                this.Img_JoystickBase.SetRenderTranslation(this.MoveJoystick.opArrow().GetBasePosition());
                this.Img_JoystickThumb.SetRenderTranslation((FVector2D(this.MoveJoystick.opArrow().GetBasePosition()) + this.MoveJoystick.opArrow().GetThumbOffset()));
                this.UpdateOverlayArrow(this.MoveJoystick.opArrow().GetBasePosition(), this.MoveJoystick.opArrow().GetThumbOffset());
            }
            else
            {
                this.Img_JoystickBase.SetVisibility(ESlateVisibility(1));
                this.Img_JoystickThumb.SetVisibility(ESlateVisibility(1));
                this.SetOverlayArrowVisibility(ESlateVisibility(1));
            }
            FSlateApplication::Get().OnControllerAnalog(this.MoveJoystick.opArrow().GetConfig().XAxis.GetKeyName(), float32(this.MoveJoystick.opArrow().GetMoveAxis().X));
            FSlateApplication::Get().OnControllerAnalog(this.MoveJoystick.opArrow().GetConfig().YAxis.GetKeyName(), float32(this.MoveJoystick.opArrow().GetMoveAxis().Y));
            FSlateApplication::Get().OnControllerAnalog(this.TouchLook.opArrow().GetXAxis().GetKeyName(), float32(this.TouchLook.opArrow().GetLookDelta().X));
            FSlateApplication::Get().OnControllerAnalog(this.TouchLook.opArrow().GetYAxis().GetKeyName(), float32(this.TouchLook.opArrow().GetLookDelta().Y));
        }
        return;
    }
    void SetOverlayArrowVisibility(const ESlateVisibility InVisibility)
    {
        if (this.Overlay_Arrow != nullptr)
        {
            this.Overlay_Arrow.SetVisibility(ESlateVisibility(InVisibility));
        }
        return;
    }
    void UpdateOverlayArrow(const FVector2D &inout InBasePosition, const FVector2D &inout InThumbOffset)
    {
        if (this.Overlay_Arrow == nullptr)
        {
            return;
        }
        this.Overlay_Arrow.SetVisibility(ESlateVisibility(4));
        this.Overlay_Arrow.SetRenderTranslation(InBasePosition);
        if (InThumbOffset.SizeSquared() > 9.999999747378752e-5)
        {
            this.Overlay_Arrow.SetRenderTransformAngle(float32((FMath::Atan2(InThumbOffset.X, -InThumbOffset.Y) * 57.29577791868205)));
        }
        return;
    }
    FVector2D ScreenPosToLocal(const FVector2D &inout ScreenPos)
    {
        return this.Canvas_TouchZone.GetCachedGeometry().AbsoluteToLocal((WidgetLayout::GetViewportWidgetGeometry(__GetWorldContext()).LocalToAbsolute((ScreenPos / WidgetLayout::GetViewportScale(__GetWorldContext())))));
    }
    UFUNCTION()
    void OnScreenTouchStarted(const FVector2D &inout ScreenPos, const int FingerIndex)
    {
        FVector2D local_8 = this.ScreenPosToLocal(ScreenPos);
        float local_16_2 = (float32((WorldUtils::GetViewportSize().X * 0.5)));
        if (ScreenPos.X < local_16_2)
        {
            this.MoveJoystick_HandleTouchStarted(local_8, FingerIndex);
            return;
        }
        this.TouchLook_HandleTouchStarted(local_8, FingerIndex);
        return;
    }
    UFUNCTION()
    void OnScreenTouchMoved(const FVector2D &inout ScreenPos, const int FingerIndex)
    {
        FVector2D local_8 = this.ScreenPosToLocal(ScreenPos);
        this.MoveJoystick_HandleTouchMoved(local_8, FingerIndex);
        this.TouchLook_HandleTouchMoved(local_8, FingerIndex);
        return;
    }
    UFUNCTION()
    void OnScreenTouchEnded(const int FingerIndex)
    {
        this.MoveJoystick_HandleTouchEnded(FingerIndex);
        this.TouchLook_HandleTouchEnded(FingerIndex);
        return;
    }
    UFUNCTION()
    FVector2D MoveJoystick_ThumbOffset() const
    {
        FVM_MoveJoystick& local_2;
        FVector2D local_12 = local_2 ? local_2.GetThumbOffset() : FVector2D();
        return local_12;
    }
    UFUNCTION()
    FVector2D MoveJoystick_BasePosition() const
    {
        FVM_MoveJoystick& local_2;
        FVector2D local_12 = local_2 ? local_2.GetBasePosition() : FVector2D();
        return local_12;
    }
    UFUNCTION()
    bool MoveJoystick_bIsActive() const
    {
        FVM_MoveJoystick& local_2;
        bool local_5;
        if (local_2)
        {
            local_5 = local_2.GetbIsActive();
        }
        else
        {
            local_5 = false;
        }
        return local_5;
    }
    UFUNCTION()
    FVector2D MoveJoystick_MoveAxis() const
    {
        FVM_MoveJoystick& local_2;
        FVector2D local_12 = local_2 ? local_2.GetMoveAxis() : FVector2D();
        return local_12;
    }
    UFUNCTION()
    void MoveJoystick_HandleTouchStarted(const FVector2D &inout ScreenPos, const int FingerIndex) const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder::PushArg local_42;
        local_42.opCall(ScreenPos);
        FEUIWidgetModelCallbackBuilder::PushArg local_46;
        local_46.opCall(FingerIndex);
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void MoveJoystick_HandleTouchMoved(const FVector2D &inout ScreenPos, const int FingerIndex) const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder::PushArg local_42;
        local_42.opCall(ScreenPos);
        FEUIWidgetModelCallbackBuilder::PushArg local_46;
        local_46.opCall(FingerIndex);
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void MoveJoystick_HandleTouchEnded(const int FingerIndex) const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder::PushArg local_42;
        local_42.opCall(FingerIndex);
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    FVector2D TouchLook_LookDelta() const
    {
        FVM_TouchLook& local_2;
        FVector2D local_12 = local_2 ? local_2.GetLookDelta() : FVector2D();
        return local_12;
    }
    UFUNCTION()
    void TouchLook_HandleTouchStarted(const FVector2D &inout ScreenPos, const int FingerIndex) const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder::PushArg local_42;
        local_42.opCall(ScreenPos);
        FEUIWidgetModelCallbackBuilder::PushArg local_46;
        local_46.opCall(FingerIndex);
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void TouchLook_HandleTouchMoved(const FVector2D &inout ScreenPos, const int FingerIndex) const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder::PushArg local_42;
        local_42.opCall(ScreenPos);
        FEUIWidgetModelCallbackBuilder::PushArg local_46;
        local_46.opCall(FingerIndex);
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void TouchLook_HandleTouchEnded(const int FingerIndex) const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder::PushArg local_42;
        local_42.opCall(FingerIndex);
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.MoveJoystick.Initialize(this, FName("VM_MoveJoystick"), EEUIWidgetRefModelCreationType(0), false);
        this.TouchLook.Initialize(this, FName("VM_TouchLook"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.MoveJoystickDelegate.IsBound())
        {
            this.MoveJoystick.SetRef(this.MoveJoystickDelegate.Execute());
        }
        if (this.TouchLookDelegate.IsBound())
        {
            this.TouchLook.SetRef(this.TouchLookDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_VirtualJoystick
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
