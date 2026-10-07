
namespace UPage_CommonTips
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UPage_CommonTips : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_Page> Page;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_CommonTips> CommonTips;
    UPROPERTY()
    bool bPendingClose;
    UPROPERTY()
    FGetEUIModelRef PageDelegate;
    UPROPERTY()
    FGetEUIModelRef CommonTipsDelegate;

    UPage_CommonTips()
    {
        return;
    }
    UFUNCTION()
    void Construct_Implementation()
    {
        this.bPendingClose = false;
        this.PlayFadeIn(0.0f);
        return;
    }
    UFUNCTION()
    void OnViewBind_Implementation()
    {
        if (this.CommonTips && this.CommonTips.opArrow().GetbEnableAutoCloseByLifetime() && (this.CommonTips.opArrow().GetAutoCloseLifetimeSeconds() > 0.0f))
        {
            System::SetTimer(this, n"OnAutoCloseTipsByLifetime", this.CommonTips.opArrow().GetAutoCloseLifetimeSeconds(), false, false, 0.0f, 0.0f);
        }
        return;
    }
    UFUNCTION()
    void Tick_Implementation(const FGeometry &inout MyGeometry, const float32 InDeltaTime)
    {
        if (this.bPendingClose && !(this.IsFadingOut()))
        {
            this.RemoveFromLayout();
        }
        return;
    }
    void CloseCommonTips()
    {
        if (this.PlayFadeOut(0.0f))
        {
            this.bPendingClose = true;
            return;
        }
        this.RemoveFromLayout();
        return;
    }
    UFUNCTION()
    void OnAutoCloseTipsByLifetime()
    {
        this.CloseCommonTips();
        return;
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
        this.Page.Initialize(this, FName("VM_Page"), EEUIWidgetRefModelCreationType(0), false);
        this.CommonTips.Initialize(this, FName("VM_CommonTips"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.PageDelegate.IsBound())
        {
            this.Page.SetRef(this.PageDelegate.Execute());
        }
        if (this.CommonTipsDelegate.IsBound())
        {
            this.CommonTips.SetRef(this.CommonTipsDelegate.Execute());
        }
        return;
    }
}

namespace UPage_CommonTips
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
