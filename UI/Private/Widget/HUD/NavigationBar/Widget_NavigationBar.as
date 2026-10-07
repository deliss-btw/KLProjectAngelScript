
namespace UWidget_NavigationBar
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_NavigationBar : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_NavigationBar> NavigationBar;
    UPROPERTY()
    UCanvasPanel ESWNCanvas;
    UPROPERTY()
    UWidget East;
    UPROPERTY()
    UWidget South;
    UPROPERTY()
    UWidget West;
    UPROPERTY()
    UWidget North;
    UPROPERTY()
    TArray<UWidget> ESWN;
    UPROPERTY()
    TSet<UWidget_NavigationBarIcon> CenteredNavigationBarIcons;
    UPROPERTY()
    UWidget_NavigationBarIcon FirstCenteredNavigationBarIcon;
    FEUIModelWeakRef __NavigationBar;
    UPROPERTY()
    FGetEUIModelRef NavigationBarDelegate;

    UWidget_NavigationBar()
    {
        return;
    }
    UFUNCTION()
    void Construct_Implementation()
    {
        this.ESWN.Empty(0);
        this.ESWN.Add(this.East);
        this.ESWN.Add(this.South);
        this.ESWN.Add(this.West);
        this.ESWN.Add(this.North);
        return;
    }
    UFUNCTION()
    void Tick_Implementation(const FGeometry &inout MyGeometry, const float32 InDeltaTime)
    {
        int local_14 = 0;
        int local_24 = 0;
        UPanelSlot local_56;
        UCanvasPanelSlot local_60;
        float32 local_63;
        if (!(this.NavigationBar.IsValid()) || !(ECS::GetECSWorld().IsValid()))
        {
            return;
        }
        FECSWorldPtr local_4 = ECS::GetECSWorld();
        FVM_NavigationBar local_8;
        FECSEntity local_18 = local_8.GetContext().GetLocalPlayer();
        if ((!(local_14) || !(local_24)))
        {
            return;
        }
        float local_36 = FMath::FindDeltaAngleDegrees(-180.0, FRotator(local_14.ViewDir).Yaw);
        float32 local_39 = -180.0f;
        for (auto local_54 : this.ESWN)
        {
            local_56 = local_54.Slot;
            local_60 = Cast<UCanvasPanelSlot>(local_56);
            float local_32_2 = FMath::UnwindDegrees(local_39 - local_36);
            float32 local_40 = local_24.GetFOV() / 2.0f;
            local_63 = local_40;
            local_63 = -local_63;
            if ((local_32_2 < local_63 || (local_32_2 > local_40)))
            {
                local_54.SetVisibility(ESlateVisibility(1));
            }
            else
            {
                float32 local_66 = ::UWidget_NavigationBar::NormalizeAngleByFOV(float32(local_32_2), local_24.GetFOV());
                local_60.SetPosition(FVector2D(local_54.GetParent().GetTickSpaceGeometry().GetLocalSize().X * local_66, local_60.GetPosition().Y));
                local_54.SetVisibility(ESlateVisibility(4));
            }
            local_39 = local_39 + 90.0f;
        }
        FVector local_90 = FTransformUtils::GetLocation(local_8.GetContext().GetLocalPlayerPawn(), FFPTime(-1));
        TEUIWidgetModelRef<FVM_NavigationBarIcon> local_102 = TEUIWidgetModelRef<FVM_NavigationBarIcon>(nullptr);
        for (auto local_126 : this.CenteredNavigationBarIcons)
        {
            if (local_126.NavigationBarIcon.IsValid())
            {
                FVM_NavigationBarIcon& local_128;
                if (!(local_102) || ::PresentationSpotUtils::CompareDistance(local_90, local_128.GetSpot(), local_102.opArrow().GetSpot(), false))
                {
                    local_102 = local_126.NavigationBarIcon;
                    this.FirstCenteredNavigationBarIcon = local_126;
                }
            }
        }
        if (!(local_102))
        {
            this.FirstCenteredNavigationBarIcon = nullptr;
        }
        return;
    }
    UFUNCTION()
    void OnHasLockTargetChanged()
    {
        bool local_1 = this.NavigationBar.opArrow().GetShouldDisplay();
        if (local_1)
        {
            this.PlayAnimation(this.Anim_In, 0.0f, 1, EUMGSequencePlayMode(0), 1.0f, false);
            return;
        }
        this.PlayAnimationReverse(this.Anim_In, 1.0f, false);
        return;
    }
    void SetNavigationBarIconIsCentered(const UWidget_NavigationBarIcon NavigationBarIcon, const bool bIsCentered)
    {
        if (bIsCentered)
        {
            this.CenteredNavigationBarIcons.Add(NavigationBarIcon);
            return;
        }
        return;
    }
    bool IsFirstCenteredNavigationBarIcon(const UWidget_NavigationBarIcon NavigationBarIcon) const
    {
        return (this.FirstCenteredNavigationBarIcon == NavigationBarIcon);
    }
    void HandleObservedModelChanges(FEUIReactiveSubscriberIterator &inout It)
    {
        FVM_NavigationBar& local_6;
        TEUIModelRef<FVM_NavigationBar> local_2 = this.NavigationBar.AsRef();
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
                    this.NavigationBar.TrackRead();
                    if (local_6)
                    {
                        local_6.TrackPropertyRead(::FVM_NavigationBar::__IndexOf_bHasLockTarget());
                    }
                    if (local_6)
                    {
                        this.OnHasLockTargetChanged();
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
                XError(ELog(17), "Remaining observed model change: OnHasLockTargetChanged");
            }
            return;
        }
        this.__NavigationBar = local_2.opImplConv();
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.NavigationBar.Initialize(this, FName("VM_NavigationBar"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.NavigationBarDelegate.IsBound())
        {
            this.NavigationBar.SetRef(this.NavigationBarDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_NavigationBar
{
float32 NormalizeAngleByFOV(const float32 Angle, const float32 FOV)
{
    if (FMath::IsNearlyZero(FOV, 1e-8f))
    {
        XWarning(ELog(16), FString().Append("FOV is zero (").Append(FOV).Append("), failed to normalize navigation bar display angle."));
        return 0.0f;
    }
    return float32((FMath::Clamp((Angle / FOV), -1.0, 1.0)));
}
float32 CalculateHorizontalOffset(const FRotator &inout ViewRotation, const FVector &inout ViewPosition, const float32 FOV, const FVector &inout TargetPosition)
{
    return UWidget_NavigationBar::NormalizeAngleByFOV(float32((FMath::UnwindDegrees(FMath::FindDeltaAngleDegrees(ViewRotation.Yaw, (FRotator::MakeFromX((TargetPosition - ViewPosition)).Yaw))))), FOV);
}
void UpdateNavigationCanvasSlot(const UCanvasPanel Canvas, const UCanvasPanelSlot ChildSlot, const FRotator &inout ViewRotation, const FVector &inout ViewPosition, const float32 FOV, const FVector &inout TargetPosition)
{
    ChildSlot.SetPosition(FVector2D((Canvas.GetTickSpaceGeometry().GetLocalSize().X * (UWidget_NavigationBar::CalculateHorizontalOffset(ViewRotation, ViewPosition, FOV, TargetPosition))), ChildSlot.GetPosition().Y));
    return;
}
bool UpdateNavigationCanvasSlotAndReturnIfAtCenter(const UCanvasPanel Canvas, const UCanvasPanelSlot ChildSlot, const FRotator &inout ViewRotation, const FVector &inout ViewPosition, const float32 FOV, const FVector &inout TargetPosition)
{
    const UUtilitySettings local_2;
    GetGameplaySettings<UUtilitySettings> local_4;
    local_2 = local_4;
    float32 local_7 = UWidget_NavigationBar::CalculateHorizontalOffset(ViewRotation, ViewPosition, FOV, TargetPosition);
    ChildSlot.SetPosition(FVector2D((Canvas.GetTickSpaceGeometry().GetLocalSize().X * local_7), ChildSlot.GetPosition().Y));
    return (FMath::Abs(local_7) <= local_2.NavigationBarCenterThreshold);
}
FVector GetEntityPosition(const FECSEntity &inout Entity, const FECSEntity &inout LocalPlayer)
{
    Get local_4;
    const FC_Transform& local_6 = local_4.opCall();
    if (local_6)
    {
        return local_6.GetPosition();
    }
    if ((FGuidingPathUtils::GetGuidingPathTargetEntityID(LocalPlayer) == Entity.GetId()))
    {
        Get local_14;
        return local_14.opCall().GetTargetLocation();
    }
    return FVector::ZeroVector;
}
void GetModelInfo(FEUIWidgetMetaInfo &inout Result)
{
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnHasLockTargetChanged"));
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
