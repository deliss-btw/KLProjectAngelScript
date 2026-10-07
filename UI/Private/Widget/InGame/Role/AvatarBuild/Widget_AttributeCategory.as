
namespace UWidget_AttributeCategory
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_AttributeCategory : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_Text> AttributeCategory;
    UPROPERTY()
    FGetEUIModelRef AttributeCategoryDelegate;

    UWidget_AttributeCategory()
    {
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.AttributeCategory.Initialize(this, FName("VM_Text"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.AttributeCategoryDelegate.IsBound())
        {
            this.AttributeCategory.SetRef(this.AttributeCategoryDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_AttributeCategory
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
