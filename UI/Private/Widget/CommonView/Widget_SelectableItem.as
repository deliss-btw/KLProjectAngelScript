
namespace UWidget_SelectableItem
{
    const int ViewID = 0;
}
namespace UWidget_SelectableItem_Text
{
    const int ViewID = 0;
}
namespace UWidget_SelectableItem_ImageAndText
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_SelectableItem : UEUIUserListItemWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_SelectableItem> Item;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_Image> ItemIcon;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_RedDot> RedDot;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_CommonTabItem> TabItem;
    UPROPERTY()
    FConfigVM_RedDot RedDotConfig;
    UPROPERTY()
    FGetEUIModelRef ItemDelegate;
    UPROPERTY()
    FGetEUIModelRef ItemIconDelegate;
    UPROPERTY()
    FGetEUIModelRef RedDotDelegate;
    UPROPERTY()
    FGetEUIModelRef TabItemDelegate;

    UWidget_SelectableItem()
    {
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.Item.Initialize(this, FName("VM_SelectableItem"), EEUIWidgetRefModelCreationType(0), false);
        this.ItemIcon.Initialize(this, FName("VM_Image"), EEUIWidgetRefModelCreationType(0), true);
        this.RedDot.Initialize(this, FName("VM_RedDot"), EEUIWidgetRefModelCreationType(0), true);
        this.TabItem.Initialize(this, FName("VM_CommonTabItem"), EEUIWidgetRefModelCreationType(1), true);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.ItemDelegate.IsBound())
        {
            this.Item.SetRef(this.ItemDelegate.Execute());
        }
        if (this.ItemIconDelegate.IsBound())
        {
            this.ItemIcon.SetRef(this.ItemIconDelegate.Execute());
        }
        if (this.RedDotDelegate.IsBound())
        {
            this.RedDot.SetRef(this.RedDotDelegate.Execute());
        }
        if (this.TabItemDelegate.IsBound())
        {
            this.TabItem.SetRef(this.TabItemDelegate.Execute());
        }
        return;
    }
}

UCLASS(Abstract)
class UWidget_SelectableItem_Text : UEUIUserListItemWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_SelectableItem> Item;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_Text> ItemText;
    UPROPERTY()
    FGetEUIModelRef ItemDelegate;
    UPROPERTY()
    FGetEUIModelRef ItemTextDelegate;

    UWidget_SelectableItem_Text()
    {
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.Item.Initialize(this, FName("VM_SelectableItem"), EEUIWidgetRefModelCreationType(0), false);
        this.ItemText.Initialize(this, FName("VM_Text"), EEUIWidgetRefModelCreationType(0), true);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.ItemDelegate.IsBound())
        {
            this.Item.SetRef(this.ItemDelegate.Execute());
        }
        if (this.ItemTextDelegate.IsBound())
        {
            this.ItemText.SetRef(this.ItemTextDelegate.Execute());
        }
        return;
    }
}

UCLASS(Abstract)
class UWidget_SelectableItem_ImageAndText : UEUIUserListItemWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_SelectableItem> Item;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_BtnOperationItem> BtnOperationItem;
    UPROPERTY()
    FGetEUIModelRef ItemDelegate;
    UPROPERTY()
    FGetEUIModelRef BtnOperationItemDelegate;

    UWidget_SelectableItem_ImageAndText()
    {
        return;
    }
    UFUNCTION()
    void BtnOperationItem_ExecuteOnClickGoTo() const
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
        this.Item.Initialize(this, FName("VM_SelectableItem"), EEUIWidgetRefModelCreationType(0), false);
        this.BtnOperationItem.Initialize(this, FName("VM_BtnOperationItem"), EEUIWidgetRefModelCreationType(0), true);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.ItemDelegate.IsBound())
        {
            this.Item.SetRef(this.ItemDelegate.Execute());
        }
        if (this.BtnOperationItemDelegate.IsBound())
        {
            this.BtnOperationItem.SetRef(this.BtnOperationItemDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_SelectableItem
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
namespace UWidget_SelectableItem_Text
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
namespace UWidget_SelectableItem_ImageAndText
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
