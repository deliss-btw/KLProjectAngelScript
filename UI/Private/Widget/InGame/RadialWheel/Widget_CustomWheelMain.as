
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
    float32 StickDeadZone;
    UPROPERTY()
    float32 StickSelectThreshold;
    UPROPERTY()
    int InnerWidth;
    UPROPERTY()
    int OuterWidth;
    UPROPERTY()
    float32 Angle;
    UPROPERTY()
    float32 AngleOffset;
    FOnButtonClickedEvent OnFanRingClickedEvent;
    FVector2D CachedMouseScreenPosition;
    FVector2D CachedRightStickValue;
    int GamepadLatchedIndex;
    TArray<UWidget_CustomWheelMainButton> Buttons;
    UWidget_CustomWheelMain::ECustomWheelMousePosType MousePosType;
    int ClickedDownIndex;
    int ClickedUpIndex;
    EEUIInputType CachedInputType;
    FEUIModelWeakRef __VMS_CustomWheel;
    UPROPERTY()
    FGetEUIModelRef PageDelegate;

    UWidget_CustomWheelMain()
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    UFUNCTION()
    void Construct_Implementation()
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
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
        // body not fully recovered вЂ” stub [opcode-uncovered]
        FEventReply __r; return __r;
    }
    UFUNCTION()
    FEventReply OnMouseButtonUp_Implementation(const FGeometry &inout MyGeometry, const FPointerEvent &inout MouseEvent)
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
        FEventReply __r; return __r;
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
        OnConfirmButtonClicked();
        return;
    }
    void UpdateMousePosHoverState(const FVector2D &inout LocalPos)
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    void SetHoverButtonIndex(const int HoverButtonIndex)
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
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
        // body not fully recovered вЂ” stub [opcode-uncovered]
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
        FVMS_CustomWheel& local_6;
        TEUIModelRef<FVMS_CustomWheel> local_2 = this.VMS_CustomWheel.AsRef();
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
