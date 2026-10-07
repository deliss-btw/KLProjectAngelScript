
namespace UWidget_TauntHintPointer
{
    const int ViewID = 0;

}
class UWidget_TauntHintPointer : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_TauntHintPointer> TauntHintPointer;
    UPROPERTY()
    UEUICanvasPanel ParentOverlay;
    bool bFirstFrame = true;
    UPROPERTY()
    FGetEUIModelRef TauntHintPointerDelegate;


    UFUNCTION()
    void Construct_Implementation()
    {
        return;
    }
    UFUNCTION()
    void Tick_Implementation(const FGeometry &inout MyGeometry, const float32 InDeltaTime)
    {
        UPanelSlot local_4;
        UCanvasPanelSlot local_8;
        if (this.bFirstFrame)
        {
            this.bFirstFrame = false;
        }
        else
        {
            local_4 = this.Slot;
            local_8 = (Cast<UCanvasPanelSlot>(local_4));
            local_8.SetAnchors(FAnchors(0.0f, 0.0f, 1.0f, 1.0f));
            local_8.SetOffsets(FMargin(0.0f, 0.0f, 0.0f, 0.0f));
        }
        FECSEntity local_28 = FECSEntity(GetTargetEntity());
        APlayerController local_30 = this.GetOwningPlayer();
        if ((local_28 == ENTITY_NULL))
        {
            return;
        }
        FECSEntity local_40 = ::FASCommonUtils::GetLocalPlayerPawnEntity();
        if ((local_40 == ENTITY_NULL))
        {
            return;
        }
        FVector local_64 = (this.GetEntityLocation(local_28) - this.GetEntityLocation(local_40));
        FQuat local_88 = local_30.PlayerCameraManager.GetCameraRotation().Quaternion();
        this.ParentOverlay.SetRenderTransformAngle(float32((local_64.Rotation().Yaw - local_88.Rotator().Yaw)));
        return;
    }
    FVector GetEntityLocation(const FECSEntity &inout Entity)
    {
        const AActor local_4;
        local_4 = Entity.GetActor();
        if (local_4 != nullptr)
        {
            return local_4.GetActorLocation();
        }
        Has local_16;
        bool local_5 = local_16.opCall();
        if (local_5)
        {
            Get local_20;
            return local_20.opCall().GetPosition();
        }
        return FVector::ZeroVector;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.TauntHintPointer.Initialize(this, FName("VM_TauntHintPointer"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.TauntHintPointerDelegate.IsBound())
        {
            this.TauntHintPointer.SetRef(this.TauntHintPointerDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_TauntHintPointer
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
