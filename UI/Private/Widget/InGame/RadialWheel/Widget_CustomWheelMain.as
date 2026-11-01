namespace UWidget_CustomWheelMain
{
enum ECustomWheelMousePosType
{
    InInner,
    InRanRing,
    OutOfCircle,
}

    const int ViewID = 0;

}
class UWidget_CustomWheelMain : UEUIActivatableWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_Page> Page;
    UPROPERTY()
    TEUIWidgetModelRef<FVMS_CustomWheel> VMS_CustomWheel;
    UPROPERTY()
    UOverlay WheelRoot;
    UPROPERTY()
    UEUIImage BG_Inner;
    UPROPERTY()
    UEUIImage FollowCursorImage;
    UPROPERTY()
    float32 StickDeadZone = 0.5f;
    UPROPERTY()
    float32 StickSelectThreshold = 0.75f;
    UPROPERTY()
    int InnerWidth = 130;
    UPROPERTY()
    int OuterWidth = 250;
    UPROPERTY()
    float32 Angle = 45.0f;
    UPROPERTY()
    float32 AngleOffset = 22.5f;
    FOnButtonClickedEvent OnFanRingClickedEvent;
    FVector2D CachedMouseScreenPosition;
    FVector2D CachedRightStickValue;
    int GamepadLatchedIndex = INDEX_NONE;
    TArray<UWidget_CustomWheelMainButton> Buttons;
    UWidget_CustomWheelMain::ECustomWheelMousePosType MousePosType = UWidget_CustomWheelMain::ECustomWheelMousePosType(2);
    int ClickedDownIndex = INDEX_NONE;
    int ClickedUpIndex = INDEX_NONE;
    EEUIInputType CachedInputType = EEUIInputType(0);
    FEUIModelWeakRef __VMS_CustomWheel;
    UPROPERTY()
    FGetEUIModelRef PageDelegate;

    UFUNCTION()
    void Construct_Implementation()
    {
        UWidget_CustomWheelMainButton local_18;
        UEUIInputSubsystem::Get(this.GetOwningLocalPlayer()).OnInputMethodChanged.AddUFunction(this, n"OnInputMethodChanged");
        this.CachedInputType = this.GetCurrentInputType();
        this.OnFanRingClickedEvent.AddUFunction(this, n"OnFanRingClickedEventCallback");
        this.GamepadLatchedIndex = INDEX_NONE;
        this.FollowCursorImage.SetVisibility(ESlateVisibility(2));
        int local_5 = this.WheelRoot.GetChildrenCount();
        this.Buttons.SetNum(local_5);
        int local_9 = 0;
        for (; local_9 < local_5; ++local_9)
        {
            local_18 = Cast<UWidget_CustomWheelMainButton>(this.WheelRoot.GetChildAt(local_9));
            if (local_18 != nullptr)
            {
                this.Buttons[local_9] = local_18;
            }
        }
        return;
    }
    UFUNCTION()
    FEventReply OnAnalogValueChanged_Implementation(const FGeometry &inout MyGeometry, const FAnalogInputEvent &inout InAnalogInputEvent)
    {
        if ((int(this.GetCurrentInputType())) == 1)
        {
            FKey local_16 = InAnalogInputEvent.GetKey();
            float32 local_18 = InAnalogInputEvent.GetAnalogValue();
            FName local_22 = local_16.GetKeyName();
            if ((local_22 == n"Gamepad_RightX"))
            {
                this.CachedRightStickValue.X = local_18;
                this.UpdateGamepadSelectButtonIndex();
            }
            else
            {
                if ((local_22 == n"Gamepad_RightY"))
                {
                    this.CachedRightStickValue.Y = local_18;
                    this.UpdateGamepadSelectButtonIndex();
                }
            }
        }
        return FEventReply::Unhandled();
    }
    UFUNCTION()
    FEventReply OnMouseMove_Implementation(const FGeometry &inout MyGeometry, const FPointerEvent &inout MouseEvent)
    {
        if (int(this.CachedInputType) != 0)
        {
            return FEventReply::Unhandled();
        }
        this.CachedMouseScreenPosition = MouseEvent.GetScreenSpacePosition();
        FGeometry local_72 = this.BG_Inner.GetTickSpaceGeometry();
        FVector2D local_86 = (this.CachedMouseScreenPosition - (local_72.GetAbsolutePosition() + (local_72.GetAbsoluteSize() * 0.5)));
        this.UpdateMousePosHoverState((local_86 / local_72.GetRenderTransformScale()));
        return FEventReply::Unhandled();
    }
    UFUNCTION()
    void OnMouseLeave_Implementation(const FPointerEvent &inout MouseEvent)
    {
        this.MousePosType = UWidget_CustomWheelMain::ECustomWheelMousePosType(2);
        this.SetHoverButtonIndex(INDEX_NONE);
        this.SetCursorImageVisibility((int(this.MousePosType) == 0));
        return;
    }
    UFUNCTION()
    FEventReply OnMouseButtonDown_Implementation(const FGeometry &inout MyGeometry, const FPointerEvent &inout MouseEvent)
    {
        int local_1;
        local_1 = this.VMS_CustomWheel.Get().GetSelectedIndex();
        int local_2 = INDEX_NONE;
        if (local_1 != local_2 && (MouseEvent.GetEffectingButton() == EKeys::LeftMouseButton))
        {
            this.ClickedDownIndex = local_1;
            return FEventReply::Handled();
        }
        return FEventReply::Unhandled();
    }
    UFUNCTION()
    FEventReply OnMouseButtonUp_Implementation(const FGeometry &inout MyGeometry, const FPointerEvent &inout MouseEvent)
    {
        int local_1;
        local_1 = this.VMS_CustomWheel.Get().GetSelectedIndex();
        if (this.ClickedDownIndex != INDEX_NONE && (this.ClickedDownIndex == local_1) && (MouseEvent.GetEffectingButton() == EKeys::LeftMouseButton))
        {
            this.OnFanRingClickedEvent.Broadcast();
            return FEventReply::Handled();
        }
        return FEventReply::Unhandled();
    }
    UFUNCTION()
    void OnInputMethodChanged(const EEUIInputType NewInputType)
    {
        this.CachedInputType = NewInputType;
        if (int(this.CachedInputType) == 1)
        {
            this.SetHoverButtonIndex(INDEX_NONE);
            this.SetCursorImageVisibility(false);
        }
        return;
    }
    UFUNCTION()
    void OnCloseCustomWheel(const bool bShouldClose)
    {
        if (bShouldClose)
        {
            this.ClosePage(false);
        }
        return;
    }
    UFUNCTION()
    void OnFanRingClickedEventCallback()
    {
        this.VMS_CustomWheel.Get().OnConfirmButtonClicked();
        return;
    }
    void UpdateMousePosHoverState(const FVector2D &inout LocalPos)
    {
        float32 local_5 = float32(LocalPos.Distance(FVector2D::ZeroVector));
        UWidget_CustomWheelMain::ECustomWheelMousePosType local_6 = this.MousePosType;
        if (local_5 < this.InnerWidth)
        {
            local_6 = UWidget_CustomWheelMain::ECustomWheelMousePosType(0);
            this.UpdateCursorImagePosition(LocalPos);
            this.SetHoverButtonIndex(INDEX_NONE);
        }
        else
        {
            if (local_5 < this.OuterWidth)
            {
                int local_10;
                local_6 = UWidget_CustomWheelMain::ECustomWheelMousePosType(1);
                local_10 = INDEX_NONE;
                float local_4_2 = -LocalPos.Y;
                float32 local_11 = (FMath::RadiansToDegrees(float32((FMath::Atan2(LocalPos.X, local_4_2))))) + this.AngleOffset;
                if (local_11 < 0.0f)
                {
                    local_11 = local_11 + 360.0f;
                }
                this.SetHoverButtonIndex(uint((local_11 / this.Angle)) % 8);
            }
            else
            {
                local_6 = UWidget_CustomWheelMain::ECustomWheelMousePosType(2);
                this.SetHoverButtonIndex(INDEX_NONE);
            }
        }
        if (int(local_6) != int(this.MousePosType))
        {
            this.MousePosType = UWidget_CustomWheelMain::ECustomWheelMousePosType(local_6);
            this.SetCursorImageVisibility((int(this.MousePosType) == 0));
        }
        return;
    }
    void SetHoverButtonIndex(const int HoverButtonIndex)
    {
        if (this.VMS_CustomWheel.IsValid())
        {
            int local_2;
            local_2 = this.VMS_CustomWheel.Get().GetSelectedIndex();
            if (HoverButtonIndex != local_2)
            {
                int local_3 = INDEX_NONE;
                if (local_2 != local_3)
                {
                    this.VMS_CustomWheel.Get().ChangeSelectedState(false, local_2);
                }
                this.VMS_CustomWheel.Get().SetSelectedIndex(HoverButtonIndex);
                local_3 = INDEX_NONE;
                if (HoverButtonIndex != local_3)
                {
                    this.VMS_CustomWheel.Get().ChangeSelectedState(true, HoverButtonIndex);
                    return;
                }
                this.ClickedDownIndex = INDEX_NONE;
            }
        }
        return;
    }
    void SetCursorImageVisibility(const bool bIsVisible)
    {
        if ((!((this.FollowCursorImage != nullptr))))
        {
            return;
        }
        if (bIsVisible)
        {
            if (int(this.CachedInputType) == 0)
            {
                this.FollowCursorImage.SetVisibility(ESlateVisibility(0));
            }
            return;
        }
        this.FollowCursorImage.SetVisibility(ESlateVisibility(2));
        return;
    }
    void UpdateCursorImagePosition(const FVector2D &inout LocalPos)
    {
        if ((!((this.FollowCursorImage != nullptr))))
        {
            return;
        }
        FVector2D local_12 = (LocalPos - (this.FollowCursorImage.GetCachedGeometry().GetLocalSize() * 0.5));
        this.FollowCursorImage.SetRenderTranslation(LocalPos);
        return;
    }
    void UpdateGamepadSelectButtonIndex()
    {
        if (!(this.VMS_CustomWheel.IsValid()))
        {
            return;
        }
        float32 local_5 = float32(this.CachedRightStickValue.DistSquared(FVector2D::ZeroVector));
        if (local_5 < (this.StickDeadZone * this.StickDeadZone))
        {
            if (this.GamepadLatchedIndex != INDEX_NONE)
            {
                this.VMS_CustomWheel.Get().OnConfirmButtonClicked();
                this.GamepadLatchedIndex = INDEX_NONE;
                this.SetHoverButtonIndex(INDEX_NONE);
            }
            return;
        }
        if (local_5 < (this.StickSelectThreshold * this.StickSelectThreshold))
        {
            return;
        }
        float32 local_6 = FMath::RadiansToDegrees(float32((FMath::Atan2(this.CachedRightStickValue.X, this.CachedRightStickValue.Y))));
        if (local_6 < 0.0f)
        {
            local_6 = local_6 + 360.0f;
        }
        int local_7 = (uint(((local_6 + this.AngleOffset) / this.Angle))) % 8;
        this.GamepadLatchedIndex = local_7;
        if (local_7 != this.VMS_CustomWheel.Get().GetSelectedIndex())
        {
            this.SetHoverButtonIndex(local_7);
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
    void VMS_CustomWheel_OnConfirmButtonClicked() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    void HandleObservedModelChanges(FEUIReactiveSubscriberIterator &inout It)
    {
        TEUIModelRef<FVMS_CustomWheel> local_2 = this.VMS_CustomWheel.AsRef();
        FVMS_CustomWheel& local_6 = local_2.Get();
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
                    this.VMS_CustomWheel.TrackRead();
                    if (local_6)
                    {
                        local_6.TrackPropertyRead(::FVMS_CustomWheel::__IndexOf_bShouldClose());
                    }
                    if (local_6)
                    {
                        this.OnCloseCustomWheel(local_6.GetbShouldClose());
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
                XError(ELog(17), "Remaining observed model change: OnCloseCustomWheel");
            }
            return;
        }
        this.__VMS_CustomWheel = local_2.opImplConv();
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.Page.Initialize(this, FName("VM_Page"), EEUIWidgetRefModelCreationType(0), false);
        this.VMS_CustomWheel.Initialize(this, FName("VMS_CustomWheel"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.PageDelegate.IsBound())
        {
            this.Page.SetRef(this.PageDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_CustomWheelMain
{
void GetModelInfo(FEUIWidgetMetaInfo &inout Result)
{
    Result.WidgetType = UWidget_CustomWheelMain;
    Result.ObservedModelChangesSubscriberCount = 1;
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnCloseCustomWheel"));
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
