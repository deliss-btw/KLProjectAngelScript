
namespace UWidget_CommissionLeaderBoardEntry
{
    const int ViewID = 0;

}
class UWidget_CommissionLeaderBoardEntry : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_CommissionMyRank> CommissionMyRank;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_CommissionInfo> CommissionInfo;
    FEUIModelWeakRef __CommissionInfo;
    UPROPERTY()
    FGetEUIModelRef CommissionMyRankDelegate;
    UPROPERTY()
    FGetEUIModelRef CommissionInfoDelegate;

    UWidget_CommissionLeaderBoardEntry()
    {
        return;
    }
    UFUNCTION()
    void OnCommissionInfoChanged()
    {
        if (this.CommissionInfo.opArrow().IsRaceCommission())
        {
            this.CommissionMyRank.SetRef(TEUIModelRef<FVM_CommissionMyRank>(::FVM_CommissionMyRank::Create(this, this.CommissionInfo.opArrow().GetCommissionModel().opArrow().GetCommissionConfig())));
        }
        return;
    }
    UFUNCTION()
    void GotoLeaderboard()
    {
        TDataObjectPtr<FCommissionConfig> local_24 = this.CommissionInfo.opArrow().GetCommissionConfig();
        FEUIWidget::AddWidget(this.GetOwningLocalPlayer(), GameplayTags::UI_Type_CommissionLeaderBoard, FEUIModelRef());
        return;
    }
    UFUNCTION()
    FEUIModelRef CommissionInfo_CommissionRewardList() const
    {
        FVM_CommissionInfo& local_2;
        FEUIModelRef local_8 = local_2 ? local_2.GetCommissionRewardList() : FEUIModelRef();
        return local_8;
    }
    UFUNCTION()
    FEUIModelRef CommissionInfo_CommissionFirstTimeRewardList() const
    {
        FVM_CommissionInfo& local_2;
        FEUIModelRef local_8 = local_2 ? local_2.GetCommissionFirstTimeRewardList() : FEUIModelRef();
        return local_8;
    }
    UFUNCTION()
    void CommissionInfo_StartCommission() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    void HandleObservedModelChanges(FEUIReactiveSubscriberIterator &inout It)
    {
        FVM_CommissionInfo& local_6;
        TEUIModelRef<FVM_CommissionInfo> local_2 = this.CommissionInfo.AsRef();
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
                    this.CommissionInfo.TrackRead();
                    if (local_6)
                    {
                        local_6.TrackPropertyRead(::FVM_CommissionInfo::__IndexOf_CommissionModel());
                    }
                    if (local_6)
                    {
                        this.OnCommissionInfoChanged();
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
                XError(ELog(17), "Remaining observed model change: OnCommissionInfoChanged");
            }
            return;
        }
        this.__CommissionInfo = local_2.opImplConv();
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.CommissionMyRank.Initialize(this, FName("VM_CommissionMyRank"), EEUIWidgetRefModelCreationType(0), true);
        this.CommissionInfo.Initialize(this, FName("VM_CommissionInfo"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.CommissionMyRankDelegate.IsBound())
        {
            this.CommissionMyRank.SetRef(this.CommissionMyRankDelegate.Execute());
        }
        if (this.CommissionInfoDelegate.IsBound())
        {
            this.CommissionInfo.SetRef(this.CommissionInfoDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_CommissionLeaderBoardEntry
{
void GetModelInfo(FEUIWidgetMetaInfo &inout Result)
{
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnCommissionInfoChanged"));
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
