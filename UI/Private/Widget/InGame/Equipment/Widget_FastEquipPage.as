
namespace UWidget_FastEquipPage
{
    const int ViewID = 0;
}
namespace UWidget_FastEquipPageEntry
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_FastEquipPage : UEUIActivatableWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_FastEquipPage> FastEquipPage;
    UPROPERTY()
    UEUIListView AvatarListView;
    UPROPERTY()
    FGetEUIModelRef FastEquipPageDelegate;

    UWidget_FastEquipPage()
    {
        return;
    }
    UFUNCTION()
    void Tick_Implementation(const FGeometry &inout MyGeometry, const float32 InDeltaTime)
    {
        FVM_FastEquipPage& local_2;
        if (local_2)
        {
            FEUIModelWeakRef local_6 = this.AvatarListView.GetSelectedItem();
            FEUIModelRef local_10 = local_6.AsRef();
            Get local_14;
            FVM_FastEquipPageItem& local_16 = local_14.opCall();
            if (local_16)
            {
                local_2.SetSelectedAvatarConfig(local_16.GetAvatarConfig());
                return;
            }
        }
        this.AvatarListView.SetSelectedIndex(0);
        return;
    }
    UFUNCTION()
    FEUIModelRef FastEquipPage_EquipmentSelectDetail() const
    {
        FVM_FastEquipPage& local_2;
        FEUIModelRef local_8 = local_2 ? local_2.GetEquipmentSelectDetail() : FEUIModelRef();
        return local_8;
    }
    UFUNCTION()
    TArray<FEUIModelWeakRef> FastEquipPage_AvatarList() const
    {
        FVM_FastEquipPage& local_2;
        TArray<FEUIModelWeakRef> local_16;
        if (local_2)
        {
            local_16 = EUIInternal::AsWeakRefList(local_2.GetAvatarList());
        }
        else
        {
            local_16 = TArray<FEUIModelWeakRef>();
        }
        return local_16;
    }
    UFUNCTION()
    void FastEquipPage_SwitchShowCompare() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void FastEquipPage_ConfirmEquip() const
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
        this.FastEquipPage.Initialize(this, FName("VM_FastEquipPage"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.FastEquipPageDelegate.IsBound())
        {
            this.FastEquipPage.SetRef(this.FastEquipPageDelegate.Execute());
        }
        return;
    }
}

UCLASS(Abstract)
class UWidget_FastEquipPageEntry : UEUIUserListItemWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_FastEquipPageItem> FastEquipPageItem;
    UPROPERTY()
    FGetEUIModelRef FastEquipPageItemDelegate;

    UWidget_FastEquipPageEntry()
    {
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.FastEquipPageItem.Initialize(this, FName("VM_FastEquipPageItem"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.FastEquipPageItemDelegate.IsBound())
        {
            this.FastEquipPageItem.SetRef(this.FastEquipPageItemDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_FastEquipPage
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
namespace UWidget_FastEquipPageEntry
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
