
namespace UWidget_SelectTarget
{
    const int ViewID = 0;

}
class UWidget_SelectTarget : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_SelectTarget> SelectTargetUI;
    UPROPERTY()
    UCanvasPanel Panel_TargetSelect;
    UPROPERTY()
    FGetEUIModelRef SelectTargetUIDelegate;

    UWidget_SelectTarget()
    {
        return;
    }
    UFUNCTION()
    void Construct_Implementation()
    {
        return;
    }
    UFUNCTION()
    void Tick_Implementation(const FGeometry &inout MyGeometry, const float32 InDeltaTime)
    {
        FECSEntity local_4 = FECSEntity(GetSelectTargetEntity());
        APlayerController local_6 = this.GetOwningPlayer();
        if ((local_4 == ENTITY_NULL))
        {
            this.SetVisibility(ESlateVisibility(1));
            return;
        }
        this.SetVisibility(ESlateVisibility(3));
        FVector local_16;
        TArray<FLockPointInfo> local_20;
        FFPTime local_24 = FECSInterpoUtils::GetInterpoTime(local_4);
        ::FLockTargetUtils::GetMainLockPointsFromEntity(local_4, local_20, local_24);
        if (!(local_20.IsEmpty()))
        {
            local_16 = local_20[0].Position;
        }
        else
        {
            Get local_30;
            local_16 = local_30.opCall().GetPosition();
        }
        FVector2D local_34;
        local_6.ProjectWorldLocationToScreen(local_16, local_34, false);
        const FGeometry& local_40 = this.GetParent().GetTickSpaceGeometry();
        FVector2D local_44;
        UPanelSlot local_46 = this.Panel_TargetSelect.Slot;
        UCanvasPanelSlot local_50 = (Cast<UCanvasPanelSlot>(local_46));
        Slate::ScreenToWidgetLocal(__GetWorldContext(), local_40, local_34, local_44, false);
        local_50.SetPosition(local_44);
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.SelectTargetUI.Initialize(this, FName("VM_SelectTarget"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.SelectTargetUIDelegate.IsBound())
        {
            this.SelectTargetUI.SetRef(this.SelectTargetUIDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_SelectTarget
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
