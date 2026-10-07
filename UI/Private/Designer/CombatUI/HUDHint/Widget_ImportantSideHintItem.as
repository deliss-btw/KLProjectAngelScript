
namespace UWidget_ImportantSideHintItem
{
    const int ViewID = 0;

}
class UWidget_ImportantSideHintItem : UEUIUserListItemWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_SideHintItem> SideHintItem;
    UPROPERTY()
    FGetEUIModelRef SideHintItemDelegate;

    UWidget_ImportantSideHintItem()
    {
        return;
    }
    UFUNCTION()
    bool SideHintItem_bShowHint() const
    {
        FVM_SideHintItem& local_2;
        bool local_5;
        if (local_2)
        {
            local_5 = local_2.GetbShowHint();
        }
        else
        {
            local_5 = false;
        }
        return local_5;
    }
    UFUNCTION()
    UTexture2D SideHintItem_Icon() const
    {
        FVM_SideHintItem& local_2;
        UTexture2D local_8;
        if (local_2)
        {
            local_8 = local_2.GetIcon();
        }
        else
        {
        }
        return local_8;
    }
    UFUNCTION()
    FText SideHintItem_HintTitle() const
    {
        FVM_SideHintItem& local_2;
        FText local_12 = local_2 ? local_2.GetHintTitle() : FText();
        return local_12;
    }
    UFUNCTION()
    FText SideHintItem_HintText() const
    {
        FVM_SideHintItem& local_2;
        FText local_12 = local_2 ? local_2.GetHintText() : FText();
        return local_12;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.SideHintItem.Initialize(this, FName("VM_SideHintItem"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.SideHintItemDelegate.IsBound())
        {
            this.SideHintItem.SetRef(this.SideHintItemDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_ImportantSideHintItem
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
