
namespace UWidget_AvatarEquipment
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_AvatarEquipment : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_AvatarEquipment> AvatarEquipment;
    UPROPERTY()
    FGetEUIModelRef AvatarEquipmentDelegate;

    UWidget_AvatarEquipment()
    {
        return;
    }
    UFUNCTION()
    TEUIModelRef<FVM_EquipmentInfo> AvatarEquipment_Equipment() const
    {
        FVM_AvatarEquipment& local_2;
        TEUIModelRef<FVM_EquipmentInfo> local_10;
        if (local_2)
        {
            local_10 = local_2.GetEquipment();
        }
        else
        {
            local_10 = TEUIModelRef<FVM_EquipmentInfo>();
        }
        return local_10;
    }
    UFUNCTION()
    void AvatarEquipment_GotoChangeEquipment() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.AvatarEquipment.Initialize(this, FName("VM_AvatarEquipment"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.AvatarEquipmentDelegate.IsBound())
        {
            this.AvatarEquipment.SetRef(this.AvatarEquipmentDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_AvatarEquipment
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
