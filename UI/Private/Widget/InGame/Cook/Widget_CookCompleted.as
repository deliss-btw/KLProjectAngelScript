
namespace UWidget_CookBuffInfo
{
    const int ViewID = 0;
}
namespace UWidget_CookCompleted
{
    const int ViewID = 0;

}
class UWidget_CookBuffInfo : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_CookBuffInfo> CookBuffInfo;
    UPROPERTY()
    FGetEUIModelRef CookBuffInfoDelegate;

    UWidget_CookBuffInfo()
    {
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.CookBuffInfo.Initialize(this, FName("VM_CookBuffInfo"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.CookBuffInfoDelegate.IsBound())
        {
            this.CookBuffInfo.SetRef(this.CookBuffInfoDelegate.Execute());
        }
        return;
    }
}

class UWidget_CookCompleted : UEUIActivatableWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_CookCompleted> CookReady;
    UPROPERTY()
    FEUIActionBinding CancelAction;
    UPROPERTY()
    FEUIActionBinding EatAction;
    float32 ACTIONBINDING_TIME = 10.0f;
    UPROPERTY()
    float32 ActionBindingTimer = this.ACTIONBINDING_TIME;
    UPROPERTY()
    FGetEUIModelRef CookReadyDelegate;


    UFUNCTION()
    void Construct_Implementation()
    {
        if (!(::FMetaBuffUtils::HasMetaBuffBySlot(::FASCommonUtils::GetLocalPlayerPawnEntity(), EMetaBuffSlot(1))))
        {
            this.CancelAction.SetCollapsed(true);
        }
        return;
    }
    UFUNCTION()
    void OnViewBind_Implementation()
    {
        this.PlayAnimation(this.Anim_In, 0.0f, 1, EUMGSequencePlayMode(0), 1.0f, (0 != 0));
        return;
    }
    UFUNCTION()
    void Tick_Implementation(const FGeometry &inout MyGeometry, const float32 InDeltaTime)
    {
        this.ActionBindingTimer -= InDeltaTime;
        if (this.ActionBindingTimer < 0.0f)
        {
            this.ActionBindingTimer = 3.4028235e38f;
            this.OnEat();
        }
        if (this.ActionBindingTimer <= this.ACTIONBINDING_TIME)
        {
            this.EatAction.SetOverrideDisplayText(FText::Format(NSLOCTEXT("Cook", "Cook_Complete_BtnConfirm", "йЈџз”Ёпј€{0}пј‰"), FMath::FloorToInt(this.ActionBindingTimer)));
        }
        return;
    }
    UFUNCTION()
    void OnEat()
    {
        int local_14 = 0;
        FFPTime local_10 = FFPTime(-1);
        FECSEntity local_4 = GetContext().GetLocalPlayerPawn();
        local_14.CookPropEntity = GetCookPropEntity();
        local_14.GetProductFood = GetProductFood();
        this.ClosePage(false);
        return;
    }
    UFUNCTION()
    void OnCancel()
    {
        FFPTime local_10 = FFPTime(-1);
        FECSEntity local_4 = GetContext().GetLocalPlayerPawn();
        0.CookPropEntity = GetCookPropEntity();
        this.ClosePage(false);
        return;
    }
    UFUNCTION()
    TArray<FEUIModelWeakRef> CookReady_CurCookBuffInfos() const
    {
        FVM_CookCompleted& local_2;
        TArray<FEUIModelWeakRef> local_16;
        if (local_2)
        {
            local_16 = EUIInternal::AsWeakRefList(local_2.GetCurCookBuffInfos());
        }
        else
        {
            local_16 = TArray<FEUIModelWeakRef>();
        }
        return local_16;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.CookReady.Initialize(this, FName("VM_CookCompleted"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.CookReadyDelegate.IsBound())
        {
            this.CookReady.SetRef(this.CookReadyDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_CookBuffInfo
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
namespace UWidget_CookCompleted
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
