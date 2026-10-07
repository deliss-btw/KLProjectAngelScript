
namespace UWidget_InventoryRootTab
{
    const int ViewID = 0;
}
namespace UWidget_InventoryTab
{
    const int ViewID = 0;
}
namespace UWidget_InventoryMainTabSecond
{
    const int ViewID = 0;

}
class UWidget_InventoryRootTab : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_InventoryRootCategory> RootCategory;
    UPROPERTY()
    FGetEUIModelRef RootCategoryDelegate;

    UWidget_InventoryRootTab()
    {
        return;
    }
    UFUNCTION()
    void RootCategory_OnSelect() const
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
        this.RootCategory.Initialize(this, FName("VM_InventoryRootCategory"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.RootCategoryDelegate.IsBound())
        {
            this.RootCategory.SetRef(this.RootCategoryDelegate.Execute());
        }
        return;
    }
}

class UWidget_InventoryTab : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_InventoryCategory> Category;
    UPROPERTY()
    FGetEUIModelRef CategoryDelegate;

    UWidget_InventoryTab()
    {
        return;
    }
    UFUNCTION()
    void Category_OnSelect() const
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
        this.Category.Initialize(this, FName("VM_InventoryCategory"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.CategoryDelegate.IsBound())
        {
            this.Category.SetRef(this.CategoryDelegate.Execute());
        }
        return;
    }
}

class UWidget_InventoryMainTabSecond : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_InventoryMainCategory> Category;
    UPROPERTY()
    UEUIButton w_btn_click;
    UPROPERTY()
    FGetEUIModelRef CategoryDelegate;

    UWidget_InventoryMainTabSecond()
    {
        return;
    }
    UFUNCTION()
    void Construct_Implementation()
    {
        if (this.w_btn_click != nullptr)
        {
            this.w_btn_click.OnClicked.AddUFunction(this, n"OnTabClicked");
        }
        return;
    }
    UFUNCTION()
    void Destruct_Implementation()
    {
        if (this.w_btn_click != nullptr)
        {
            this.w_btn_click.OnClicked.Unbind(this, n"OnTabClicked");
        }
        return;
    }
    UFUNCTION()
    void OnTabClicked()
    {
        if (this.Category.IsValid())
        {
            Select();
        }
        return;
    }
    UFUNCTION()
    void Category_Select() const
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
        this.Category.Initialize(this, FName("VM_InventoryMainCategory"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.CategoryDelegate.IsBound())
        {
            this.Category.SetRef(this.CategoryDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_InventoryRootTab
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
namespace UWidget_InventoryTab
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
namespace UWidget_InventoryMainTabSecond
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
