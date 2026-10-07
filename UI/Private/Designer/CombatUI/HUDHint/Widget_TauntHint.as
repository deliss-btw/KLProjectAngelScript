
namespace UWidget_TauntHint
{
    const int ViewID = 0;

}
class UWidget_TauntHint : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_TauntHint> TauntHint;
    UPROPERTY()
    UCanvasPanel Panel_TauntHint;
    UPROPERTY()
    UWidgetAnimation Init;
    UPROPERTY()
    FGetEUIModelRef TauntHintDelegate;

    UWidget_TauntHint()
    {
        return;
    }
    UFUNCTION()
    void Construct_Implementation()
    {
        this.PlayAnimationForward(this.Init, 1.0f, false);
        return;
    }
    UFUNCTION()
    void Tick_Implementation(const FGeometry &inout MyGeometry, const float32 InDeltaTime)
    {
        const AActor local_20;
        FECSEntity local_4 = FECSEntity(GetSelfEntity());
        APlayerController local_6 = this.GetOwningPlayer();
        if ((local_4 == ENTITY_NULL))
        {
            return;
        }
        FVector local_16;
        local_20 = local_4.GetActor();
        USkeletalMeshComponent local_24 = Cast<USkeletalMeshComponent>(local_20.GetComponentByClass(USkeletalMeshComponent));
        if ((!((local_24.GetSocketBoneName(n"DefaultLockSocket") == NAME_None))))
        {
            local_16 = local_24.GetSocketLocation(n"DefaultLockSocket");
        }
        else
        {
            Get local_38;
            local_16 = local_38.opCall().GetPosition();
        }
        FVector2D local_42;
        local_6.ProjectWorldLocationToScreen(local_16, local_42, false);
        const FGeometry& local_48 = this.GetParent().GetTickSpaceGeometry();
        FVector2D local_52;
        UPanelSlot local_54 = this.Panel_TauntHint.Slot;
        UCanvasPanelSlot local_58 = (Cast<UCanvasPanelSlot>(local_54));
        Slate::ScreenToWidgetLocal(__GetWorldContext(), local_48, local_42, local_52, false);
        local_58.SetPosition(local_52);
        return;
    }
    UFUNCTION()
    TArray<FEUIModelWeakRef> TauntHint_PlayerTauntHintModelArray() const
    {
        FVM_TauntHint& local_2;
        TArray<FEUIModelWeakRef> local_16;
        if (local_2)
        {
            local_16 = EUIInternal::AsWeakRefList(local_2.GetPlayerTauntHintModelArray());
        }
        else
        {
            local_16 = TArray<FEUIModelWeakRef>();
        }
        return local_16;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.TauntHint.Initialize(this, FName("VM_TauntHint"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.TauntHintDelegate.IsBound())
        {
            this.TauntHint.SetRef(this.TauntHintDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_TauntHint
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
