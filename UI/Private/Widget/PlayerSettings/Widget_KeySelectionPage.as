
namespace UWidget_KeySelectionItem
{
    const int ViewID = 0;
}
namespace UWidget_KeySelectionPage
{
    const int ViewID = 0;

}
class UWidget_KeySelectionItem : UEUIUserListItemWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_PlayerMappableKey> Key;
    UPROPERTY()
    FGetEUIModelRef KeyDelegate;

    UWidget_KeySelectionItem()
    {
        return;
    }
    UFUNCTION()
    void Key_InvokeOnSelect() const
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
        this.Key.Initialize(this, FName("VM_PlayerMappableKey"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.KeyDelegate.IsBound())
        {
            this.Key.SetRef(this.KeyDelegate.Execute());
        }
        return;
    }
}

class UWidget_KeySelectionPage : UEUIActivatableWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_KeyList> Keys;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_Page> Page;
    UPROPERTY()
    UEUICommonListView list;
    UPROPERTY()
    FEUIActionBinding Esc_AB;
    UPROPERTY()
    FEUIActionBinding Save_AB;
    UPROPERTY()
    FGetEUIModelRef KeysDelegate;
    UPROPERTY()
    FGetEUIModelRef PageDelegate;

    UWidget_KeySelectionPage()
    {
        return;
    }
    void NavigateToItem(const FEUIModelContainer &inout Item)
    {
        this.list.NavigateToItem(Item);
        return;
    }
    UFUNCTION()
    TArray<FEUIModelContainer> Keys_Keys() const
    {
        FVM_KeyList& local_2;
        TArray<FEUIModelContainer> local_12;
        if (local_2)
        {
            local_12 = local_2.GetKeys();
        }
        else
        {
            local_12 = TArray<FEUIModelContainer>();
        }
        return local_12;
    }
    UFUNCTION()
    FText Keys_ActionName() const
    {
        FVM_KeyList& local_2;
        FText local_12 = local_2 ? local_2.GetActionName() : FText();
        return local_12;
    }
    UFUNCTION()
    void Page_ClosePage() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void Page_CloseGroup() const
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
        this.Keys.Initialize(this, FName("VM_KeyList"), EEUIWidgetRefModelCreationType(0), false);
        this.Page.Initialize(this, FName("VM_Page"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.KeysDelegate.IsBound())
        {
            this.Keys.SetRef(this.KeysDelegate.Execute());
        }
        if (this.PageDelegate.IsBound())
        {
            this.Page.SetRef(this.PageDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_KeySelectionItem
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
namespace UWidget_KeySelectionPage
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
