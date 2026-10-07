
namespace UWidget_Qiong_BuffTip
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_Qiong_BuffTip : UEUIUserWidget
{
    UPROPERTY()
    UCanvasPanel CanvasPanel;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_Qiong_BuffTip> BuffTipVM;
    UPROPERTY()
    FGetEUIModelRef BuffTipVMDelegate;

    UWidget_Qiong_BuffTip()
    {
        return;
    }
    UFUNCTION()
    void Tick_Implementation(const FGeometry &inout MyGeometry, const float32 InDeltaTime)
    {
        UPanelSlot local_124;
        APlayerController local_4 = this.GetOwningPlayer();
        if (local_4 != nullptr)
        {
            FVector2D local_10;
            const USceneComponent local_14 = GetAttachEntity().GetActorVisualSceneRoot();
            if (local_14 != nullptr)
            {
                if (!(WidgetLayout::ProjectWorldLocationToWidgetPosition(local_4, local_14.GetSocketTransform(FName("DefaultLockSocket"), ERelativeTransformSpace(0)).GetLocation(), local_10, false)))
                {
                    return;
                }
            }
            local_124 = this.CanvasPanel.GetChildAt(0).Slot;
            Cast<UCanvasPanelSlot>(local_124).SetPosition(MyGeometry.AbsoluteToLocal(WidgetLayout::GetViewportWidgetGeometry(__GetWorldContext()).LocalToAbsolute(local_10)));
        }
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.BuffTipVM.Initialize(this, FName("VM_Qiong_BuffTip"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.BuffTipVMDelegate.IsBound())
        {
            this.BuffTipVM.SetRef(this.BuffTipVMDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_Qiong_BuffTip
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
