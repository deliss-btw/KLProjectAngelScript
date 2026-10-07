
namespace UWidget_AvatarAttributeListEntry
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_AvatarAttributeListEntry : UEUIUserListItemWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_AvatarAttributeItem> AttributeItem;
    UPROPERTY()
    FGetEUIModelRef AttributeItemDelegate;

    UWidget_AvatarAttributeListEntry()
    {
        return;
    }
    UFUNCTION()
    FEUIModelRef AttributeItem_InnerModel() const
    {
        FVM_AvatarAttributeItem& local_2;
        FEUIModelRef local_8 = local_2 ? local_2.GetInnerModel() : FEUIModelRef();
        return local_8;
    }
    UFUNCTION()
    TSoftClassPtr<UUserWidget> AttributeItem_WidgetClass() const
    {
        FVM_AvatarAttributeItem& local_2;
        TSoftClassPtr<UUserWidget> local_34;
        if (local_2)
        {
            local_34 = local_2.GetWidgetClass();
        }
        else
        {
            local_34 = TSoftClassPtr<UUserWidget>();
        }
        return local_34;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.AttributeItem.Initialize(this, FName("VM_AvatarAttributeItem"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.AttributeItemDelegate.IsBound())
        {
            this.AttributeItem.SetRef(this.AttributeItemDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_AvatarAttributeListEntry
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
