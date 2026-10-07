
namespace UWidget_CommonSideHintList
{
    const int ViewID = 0;
}
namespace UWidget_CommonSideHintEntry_Large
{
    const int ViewID = 0;
}
namespace UWidget_CommonSideHintEntry_LargeWithAction
{
    const int ViewID = 0;
}
namespace UWidget_CommonSideHintEntry_Small
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_CommonSideHintList : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_CommonSideHintList> CommonSideHintList;
    UPROPERTY()
    FConfigVM_CommonSideHintList CommonSideHintListConfig;
    UPROPERTY()
    FGetEUIModelRef CommonSideHintListDelegate;

    UWidget_CommonSideHintList()
    {
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.CommonSideHintList.Initialize(this, FName("VM_CommonSideHintList"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.CommonSideHintListDelegate.IsBound())
        {
            this.CommonSideHintList.SetRef(this.CommonSideHintListDelegate.Execute());
        }
        return;
    }
}

UCLASS(Abstract)
class UWidget_CommonSideHintEntry_Large : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_CommonSideHint_Large> CommonSideHint;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_Lifetime> Lifetime;
    UPROPERTY()
    FGetEUIModelRef CommonSideHintDelegate;
    UPROPERTY()
    FGetEUIModelRef LifetimeDelegate;

    UWidget_CommonSideHintEntry_Large()
    {
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.CommonSideHint.Initialize(this, FName("VM_CommonSideHint_Large"), EEUIWidgetRefModelCreationType(0), false);
        this.Lifetime.Initialize(this, FName("VM_Lifetime"), EEUIWidgetRefModelCreationType(0), false);
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
        return;
    }
}

UCLASS(Abstract)
class UWidget_CommonSideHintEntry_LargeWithAction : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_CommonSideHint_Large> CommonSideHint;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_Lifetime> Lifetime;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_InputActionList> InputActionList;
    UPROPERTY()
    FGetEUIModelRef CommonSideHintDelegate;
    UPROPERTY()
    FGetEUIModelRef LifetimeDelegate;
    UPROPERTY()
    FGetEUIModelRef InputActionListDelegate;

    UWidget_CommonSideHintEntry_LargeWithAction()
    {
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.CommonSideHint.Initialize(this, FName("VM_CommonSideHint_Large"), EEUIWidgetRefModelCreationType(0), false);
        this.Lifetime.Initialize(this, FName("VM_Lifetime"), EEUIWidgetRefModelCreationType(0), false);
        this.InputActionList.Initialize(this, FName("VM_InputActionList"), EEUIWidgetRefModelCreationType(0), false);
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
class UWidget_CommonSideHintEntry_Small : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_CommonSideHint_Small> CommonSideHint;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_Lifetime> Lifetime;
    UPROPERTY()
    FGetEUIModelRef CommonSideHintDelegate;
    UPROPERTY()
    FGetEUIModelRef LifetimeDelegate;

    UWidget_CommonSideHintEntry_Small()
    {
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.CommonSideHint.Initialize(this, FName("VM_CommonSideHint_Small"), EEUIWidgetRefModelCreationType(0), false);
        this.Lifetime.Initialize(this, FName("VM_Lifetime"), EEUIWidgetRefModelCreationType(0), false);
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
        return;
    }
}

namespace UWidget_CommonSideHintList
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
namespace UWidget_CommonSideHintEntry_Large
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
namespace UWidget_CommonSideHintEntry_LargeWithAction
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
namespace UWidget_CommonSideHintEntry_Small
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
