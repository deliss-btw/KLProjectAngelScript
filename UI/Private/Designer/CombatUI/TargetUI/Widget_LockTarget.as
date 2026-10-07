
namespace UWidget_LockTarget
{
    const int ViewID = 0;

}
class UWidget_LockTarget : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVMS_LockTarget> LockTargetUI;
    UPROPERTY()
    UImage Image_LockTargetPoint;
    UPROPERTY()
    ESlateVisibility Visibility_LockTargetPoint = ESlateVisibility(2);


    UFUNCTION()
    void Construct_Implementation()
    {
        return;
    }
    UFUNCTION()
    void Tick_Implementation(const FGeometry &inout MyGeometry, const float32 InDeltaTime)
    {
        int local_122 = 0;
        UPanelSlot local_136;
        UCanvasPanelSlot local_140;
        FECSEntity local_4 = FECSEntity(this.LockTargetUI.opArrow().GetContext().GetLocalPlayerPawn());
        if (!(local_4.IsValid()))
        {
            return;
        }
        if (!(local_4.GetWorld().IsValid()))
        {
            return;
        }
        Get local_20;
        APlayerController local_16 = local_20.opCall().UEPlayerController;
        if (local_16 == nullptr)
        {
            return;
        }
        bool local_21 = false;
        Get local_26;
        const FC_LockTarget& local_28 = local_26.opCall();
        if (local_28)
        {
            if ((int(local_28.GetType())) == 2 && local_28.GetTargetEntity().IsValid())
            {
                local_21 = true;
                this.Visibility_LockTargetPoint = ESlateVisibility(0);
                FVector local_40;
                const USceneComponent local_44 = local_28.GetTargetEntity().GetActorVisualSceneRoot();
                if (local_44 != nullptr)
                {
                    FTransform local_72 = local_44.GetSocketTransform(local_28.GetCachedLockTargetConfig().GetLockSocket(), ERelativeTransformSpace(0));
                    local_40 = local_28.GetCachedLockTargetConfig().GetLockLocation(local_72.GetLocation(), local_72.GetRotation());
                }
                else
                {
                    FTransform local_96 = local_122.ToFTransform();
                    local_40 = local_96.TransformPosition(local_28.GetCachedLockTargetConfig().GetLockTargetTransform().GetLockTargetOffset());
                }
                FVector2D local_126;
                local_16.ProjectWorldLocationToScreen(local_40, local_126, false);
                const FGeometry& local_130 = this.GetParent().GetTickSpaceGeometry();
                FVector2D local_134;
                local_136 = this.Image_LockTargetPoint.Slot;
                local_140 = (Cast<UCanvasPanelSlot>(local_136));
                Slate::ScreenToWidgetLocal(__GetWorldContext(), local_130, local_126, local_134, false);
                local_140.SetPosition(local_134);
            }
        }
        bool local_9 = !(local_21);
        if (local_9)
        {
            local_9 = true;
        }
        else
        {
            Has local_146;
            local_9 = local_146.opCall();
        }
        if (local_9)
        {
            this.Visibility_LockTargetPoint = ESlateVisibility(2);
        }
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.LockTargetUI.Initialize(this, FName("VMS_LockTarget"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        return;
    }
}

namespace UWidget_LockTarget
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
