
namespace UWidget_StigmataItem
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_StigmataItem : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_StigmataItem> StigmataItem;
    UPROPERTY()
    FGetEUIModelRef StigmataItemDelegate;

    UWidget_StigmataItem()
    {
        return;
    }
    UFUNCTION()
    void OnMouseEnter_Implementation(const FGeometry &inout MyGeometry, const FPointerEvent &inout MouseEvent)
    {
        if (MouseEvent.IsTouchEvent())
        {
            return;
        }
        this.ConsumeItemRedDot();
        return;
    }
    UFUNCTION()
    void OnAddedToFocusPath_Implementation(const FFocusEvent &inout InFocusEvent)
    {
        if ((int(::UICommonUtil::GetCurrentInputType(this.GetOwningLocalPlayer()))) == 1)
        {
            this.ConsumeItemRedDot();
        }
        return;
    }
    UFUNCTION()
    FEventReply OnMouseButtonDown_Implementation(const FGeometry &inout MyGeometry, const FPointerEvent &inout MouseEvent)
    {
        if (MouseEvent.IsTouchEvent())
        {
            this.ConsumeItemRedDot();
        }
        return FEventReply::Unhandled();
    }
    void ConsumeItemRedDot()
    {
        if (this.StigmataItem.IsValid())
        {
            ConsumeRedDot();
        }
        return;
    }
    UFUNCTION()
    void StigmataItem_ConsumeRedDot() const
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
        this.StigmataItem.Initialize(this, FName("VM_StigmataItem"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.StigmataItemDelegate.IsBound())
        {
            this.StigmataItem.SetRef(this.StigmataItemDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_StigmataItem
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
