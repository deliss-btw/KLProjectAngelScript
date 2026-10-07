
namespace UWidget_CommissionTeamerItem
{
    const int ViewID = 0;
}
namespace UWidget_CommissionTeamerItemLikeButton
{
    const int ViewID = 0;
}
namespace UWidget_CommissionTeamerItemTag
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_CommissionTeamerItem : UEUIActivatableWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_CommissionTeamerItem> CommissionFinish;
    UPROPERTY()
    FGetEUIModelRef CommissionFinishDelegate;

    UWidget_CommissionTeamerItem()
    {
        return;
    }
    UFUNCTION()
    void CommissionFinish_LikeThis() const
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
        this.CommissionFinish.Initialize(this, FName("VM_CommissionTeamerItem"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.CommissionFinishDelegate.IsBound())
        {
            this.CommissionFinish.SetRef(this.CommissionFinishDelegate.Execute());
        }
        return;
    }
}

UCLASS(Abstract)
class UWidget_CommissionTeamerItemLikeButton : UEUIActivatableWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_CommissionTeamerItem> CommissionFinish;
    UPROPERTY()
    FGetEUIModelRef CommissionFinishDelegate;

    UWidget_CommissionTeamerItemLikeButton()
    {
        return;
    }
    UFUNCTION()
    void CommissionFinish_LikeThis() const
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
        this.CommissionFinish.Initialize(this, FName("VM_CommissionTeamerItem"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.CommissionFinishDelegate.IsBound())
        {
            this.CommissionFinish.SetRef(this.CommissionFinishDelegate.Execute());
        }
        return;
    }
}

UCLASS(Abstract)
class UWidget_CommissionTeamerItemTag : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_CommissionTeamerItem> CommissionFinish;
    UPROPERTY()
    FGetEUIModelRef CommissionFinishDelegate;

    UWidget_CommissionTeamerItemTag()
    {
        return;
    }
    UFUNCTION()
    void CommissionFinish_LikeThis() const
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
        this.CommissionFinish.Initialize(this, FName("VM_CommissionTeamerItem"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.CommissionFinishDelegate.IsBound())
        {
            this.CommissionFinish.SetRef(this.CommissionFinishDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_CommissionTeamerItem
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
namespace UWidget_CommissionTeamerItemLikeButton
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
namespace UWidget_CommissionTeamerItemTag
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
