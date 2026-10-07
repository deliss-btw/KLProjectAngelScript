
namespace UWidget_SideHintEntry_LargeBuff
{
    const int ViewID = 0;
}
namespace UWidget_CommonSideHintEntry_SmallWithBuffStack
{
    const int ViewID = 0;
}
namespace UWidget_SideHintEntry_LargeBuffDescItem
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_SideHintEntry_LargeBuff : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_CommonSideHint_Large> CommonSideHint;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_Lifetime> Lifetime;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_BuffSideHintDescList> BuffDescList;
    UPROPERTY()
    FGetEUIModelRef CommonSideHintDelegate;
    UPROPERTY()
    FGetEUIModelRef LifetimeDelegate;
    UPROPERTY()
    FGetEUIModelRef BuffDescListDelegate;

    UWidget_SideHintEntry_LargeBuff()
    {
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.CommonSideHint.Initialize(this, FName("VM_CommonSideHint_Large"), EEUIWidgetRefModelCreationType(0), false);
        this.Lifetime.Initialize(this, FName("VM_Lifetime"), EEUIWidgetRefModelCreationType(0), false);
        this.BuffDescList.Initialize(this, FName("VM_BuffSideHintDescList"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.CommonSideHintDelegate.IsBound())
        {
            this.CommonSideHint.SetRef(this.CommonSideHintDelegate.Execute());
        }
        if (this.LifetimeDelegate.IsBound())
        {
            this.Lifetime.SetRef(this.LifetimeDelegate.Execute());
        }
        if (this.BuffDescListDelegate.IsBound())
        {
            this.BuffDescList.SetRef(this.BuffDescListDelegate.Execute());
        }
        return;
    }
}

UCLASS(Abstract)
class UWidget_CommonSideHintEntry_SmallWithBuffStack : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_CommonSideHint_Small> CommonSideHint;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_Lifetime> Lifetime;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_BuffHintStackCountList> InputActionList;
    UPROPERTY()
    FGetEUIModelRef CommonSideHintDelegate;
    UPROPERTY()
    FGetEUIModelRef LifetimeDelegate;
    UPROPERTY()
    FGetEUIModelRef InputActionListDelegate;

    UWidget_CommonSideHintEntry_SmallWithBuffStack()
    {
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.CommonSideHint.Initialize(this, FName("VM_CommonSideHint_Small"), EEUIWidgetRefModelCreationType(0), false);
        this.Lifetime.Initialize(this, FName("VM_Lifetime"), EEUIWidgetRefModelCreationType(0), false);
        this.InputActionList.Initialize(this, FName("VM_BuffHintStackCountList"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.CommonSideHintDelegate.IsBound())
        {
            this.CommonSideHint.SetRef(this.CommonSideHintDelegate.Execute());
        }
        if (this.LifetimeDelegate.IsBound())
        {
            this.Lifetime.SetRef(this.LifetimeDelegate.Execute());
        }
        if (this.InputActionListDelegate.IsBound())
        {
            this.InputActionList.SetRef(this.InputActionListDelegate.Execute());
        }
        return;
    }
}

UCLASS(Abstract)
class UWidget_SideHintEntry_LargeBuffDescItem : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_BuffSideHintDesc> DescItem;
    UPROPERTY()
    FGetEUIModelRef DescItemDelegate;

    UWidget_SideHintEntry_LargeBuffDescItem()
    {
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.DescItem.Initialize(this, FName("VM_BuffSideHintDesc"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.DescItemDelegate.IsBound())
        {
            this.DescItem.SetRef(this.DescItemDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_SideHintEntry_LargeBuff
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
namespace UWidget_CommonSideHintEntry_SmallWithBuffStack
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
namespace UWidget_SideHintEntry_LargeBuffDescItem
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
