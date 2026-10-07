
namespace UWidget_CommissionObjItem
{
    const int ViewID = 0;
}
namespace UWidget_CommissionObjItemSegment
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_CommissionObjItem : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_CommissionObjItemModel> CommissionObjItem;
    UPROPERTY()
    UWidget RootOverlay;
    UPROPERTY()
    UWidget w_switcher_bar;
    UPROPERTY()
    bool bCommissionObjIntroAnimHandled = false;
    FEUIModelWeakRef __CommissionObjItem;
    UPROPERTY()
    FGetEUIModelRef CommissionObjItemDelegate;


    UFUNCTION()
    void OnViewBind_Implementation()
    {
        this.bCommissionObjIntroAnimHandled = false;
        if (!(this.CommissionObjItem.IsValid()) || (this.Anim_In == nullptr))
        {
            return;
        }
        if ((int(GetAnimState())) == 0)
        {
            this.SetNormalAnimState();
            this.bCommissionObjIntroAnimHandled = true;
        }
        return;
    }
    UFUNCTION()
    void Tick_Implementation(const FGeometry &inout MyGeometry, const float32 InDeltaTime)
    {
        UWidgetAnimation local_2 = this.Anim_In;
        if (local_2 == nullptr || !(this.CommissionObjItem.IsValid()))
        {
            return;
        }
        if ((int(GetAnimState())) != 0)
        {
            return;
        }
        this.SetNormalAnimState();
        return;
    }
    void ApplyCommissionObjAnimState(const ECommissionObjAnimState AnimState)
    {
        if ((int(AnimState) == 2 && ((this.Anim_Out != nullptr))))
        {
            this.PlayAnimation(this.Anim_Out, 0.0f, 1, EUMGSequencePlayMode(0), 1.0f, false);
            return;
        }
        if ((int(AnimState) == 1 && ((this.Anim_In != nullptr))))
        {
            this.PlayAnimation(this.Anim_In, 0.0f, 1, EUMGSequencePlayMode(0), 1.0f, false);
            this.bCommissionObjIntroAnimHandled = true;
            return;
        }
        if ((int(AnimState) == 0 && ((this.Anim_In != nullptr)) && !(this.bCommissionObjIntroAnimHandled)))
        {
            this.SetNormalAnimState();
            this.bCommissionObjIntroAnimHandled = true;
        }
        return;
    }
    UFUNCTION()
    void OnAnimStateChanged(const ECommissionObjAnimState AnimState)
    {
        this.ApplyCommissionObjAnimState(ECommissionObjAnimState(AnimState));
        return;
    }
    void SetNormalAnimState()
    {
        if (this.RootOverlay.GetRenderOpacity() < 1.0f)
        {
            this.RootOverlay.SetRenderOpacity(1.0f);
        }
        if (this.w_switcher_bar.GetRenderOpacity() < 1.0f)
        {
            this.w_switcher_bar.SetRenderOpacity(1.0f);
        }
        return;
    }
    void HandleObservedModelChanges(FEUIReactiveSubscriberIterator &inout It)
    {
        FVM_CommissionObjItemModel& local_6;
        TEUIModelRef<FVM_CommissionObjItemModel> local_2 = this.CommissionObjItem.AsRef();
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
                    this.CommissionObjItem.TrackRead();
                    if (local_6)
                    {
                        local_6.TrackPropertyRead(::FVM_CommissionObjItemModel::__IndexOf_AnimState());
                    }
                    if (local_6)
                    {
                        this.OnAnimStateChanged(local_6.GetAnimState());
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
                XError(ELog(17), "Remaining observed model change: OnAnimStateChanged");
            }
            return;
        }
        this.__CommissionObjItem = local_2.opImplConv();
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.CommissionObjItem.Initialize(this, FName("VM_CommissionObjItemModel"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.CommissionObjItemDelegate.IsBound())
        {
            this.CommissionObjItem.SetRef(this.CommissionObjItemDelegate.Execute());
        }
        return;
    }
}

UCLASS(Abstract)
class UWidget_CommissionObjItemSegment : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_SegmentBarItem> SegmentState;
    UPROPERTY()
    FGetEUIModelRef SegmentStateDelegate;

    UWidget_CommissionObjItemSegment()
    {
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.SegmentState.Initialize(this, FName("VM_SegmentBarItem"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.SegmentStateDelegate.IsBound())
        {
            this.SegmentState.SetRef(this.SegmentStateDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_CommissionObjItem
{
void GetModelInfo(FEUIWidgetMetaInfo &inout Result)
{
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnAnimStateChanged"));
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
namespace UWidget_CommissionObjItemSegment
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
