
namespace UWidget_CookReady
{
    const int ViewID = 0;
}
namespace UWidget_CookReadyHeadAvatar
{
    const int ViewID = 0;

}
class UWidget_CookReady : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_CookReady> CookReady;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_Cook> CookMain;
    UPROPERTY()
    UWidgetAnimation Anim_countdown;
    FEUIModelWeakRef __CookReady;
    UPROPERTY()
    FGetEUIModelRef CookReadyDelegate;
    UPROPERTY()
    FGetEUIModelRef CookMainDelegate;

    UWidget_CookReady()
    {
        return;
    }
    UFUNCTION()
    void OnAllReady(const bool bReady)
    {
        if (bReady)
        {
            this.PlayAnimation(this.Anim_countdown, 0.0f, 1, EUMGSequencePlayMode(0), 1.0f, (0 != 0));
            return;
        }
        this.StopAnimation(this.Anim_countdown);
        return;
    }
    UFUNCTION()
    TArray<FEUIModelWeakRef> CookReady_CurrentHeadAvatars() const
    {
        FVM_CookReady& local_2;
        TArray<FEUIModelWeakRef> local_16;
        if (local_2)
        {
            local_16 = EUIInternal::AsWeakRefList(local_2.GetCurrentHeadAvatars());
        }
        else
        {
            local_16 = TArray<FEUIModelWeakRef>();
        }
        return local_16;
    }
    UFUNCTION()
    void CookReady_OnClickReady() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    TArray<FEUIModelWeakRef> CookMain_CurrentDisplayItems() const
    {
        FVM_Cook& local_2;
        TArray<FEUIModelWeakRef> local_16;
        if (local_2)
        {
            local_16 = EUIInternal::AsWeakRefList(local_2.GetCurrentDisplayItems());
        }
        else
        {
            local_16 = TArray<FEUIModelWeakRef>();
        }
        return local_16;
    }
    UFUNCTION()
    void CookMain_OnClickPushFood() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void CookMain_OnClickCancelReadyFood() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void CookMain_OnClickReady() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void CookMain_OnSelectCategory(const int Index) const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder::PushArg local_42;
        local_42.opCall(Index);
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void CookMain_OnClickEsc() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    void HandleObservedModelChanges(FEUIReactiveSubscriberIterator &inout It)
    {
        FVM_CookReady& local_6;
        TEUIModelRef<FVM_CookReady> local_2 = this.CookReady.AsRef();
        for (; It; )
        {
            FEUIReactiveSubscriberTrackScope local_56 = FEUIReactiveSubscriberTrackScope(It);
            int local_57 = It.GetIndex();
            if (local_57 <= 0)
            {
                if (local_57 != 0)
                {
                }
                else
                {
                    this.CookReady.TrackRead();
                    if (local_6)
                    {
                        local_6.TrackPropertyRead(::FVM_CookReady::__IndexOf_bReady());
                    }
                    if (local_6)
                    {
                        this.OnAllReady(local_6.GetbReady());
                    }
                }
            }
            It.MarkCurrentClean();
            It.opPreInc();
        }
        if (It.ReachMax())
        {
            XError(ELog(17), "Observed model changes consume max.");
            if (It.IsDirty(0))
            {
                XError(ELog(17), "Remaining observed model change: OnAllReady");
            }
            return;
        }
        this.__CookReady = local_2.opImplConv();
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.CookReady.Initialize(this, FName("VM_CookReady"), EEUIWidgetRefModelCreationType(0), false);
        this.CookMain.Initialize(this, FName("VM_Cook"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.CookReadyDelegate.IsBound())
        {
            this.CookReady.SetRef(this.CookReadyDelegate.Execute());
        }
        if (this.CookMainDelegate.IsBound())
        {
            this.CookMain.SetRef(this.CookMainDelegate.Execute());
        }
        return;
    }
}

class UWidget_CookReadyHeadAvatar : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_CookReadyHeadAvatar> CookReady;
    UPROPERTY()
    FGetEUIModelRef CookReadyDelegate;

    UWidget_CookReadyHeadAvatar()
    {
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.CookReady.Initialize(this, FName("VM_CookReadyHeadAvatar"), EEUIWidgetRefModelCreationType(0), false);
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

namespace UWidget_CookReady
{
void GetModelInfo(FEUIWidgetMetaInfo &inout Result)
{
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnAllReady"));
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
namespace UWidget_CookReadyHeadAvatar
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
