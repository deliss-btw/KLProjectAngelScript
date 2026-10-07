
namespace UWidget_Index
{
    const int ViewID = 0;
}
namespace UWidget_TeammateIndex
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_Index : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_Index> Index;
    UPROPERTY()
    FGetEUIModelRef IndexDelegate;

    UWidget_Index()
    {
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.Index.Initialize(this, FName("VM_Index"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.IndexDelegate.IsBound())
        {
            this.Index.SetRef(this.IndexDelegate.Execute());
        }
        return;
    }
}

UCLASS(Abstract)
class UWidget_TeammateIndex : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_TeammateInfo> TeammateInfo;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_Index> Index;
    FEUIModelWeakRef __TeammateInfo;
    UPROPERTY()
    FGetEUIModelRef TeammateInfoDelegate;
    UPROPERTY()
    FGetEUIModelRef IndexDelegate;

    UWidget_TeammateIndex()
    {
        return;
    }
    UFUNCTION()
    void OnTeammateIndexChanged()
    {
        this.Index = this.TeammateInfo.opArrow().GetIndex().opImplConv();
        return;
    }
    UFUNCTION()
    void TeammateInfo_OnClickTeamItem(const UWidget Widget) const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder::PushArg local_42;
        local_42.opCall(Widget);
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    void HandleObservedModelChanges(FEUIReactiveSubscriberIterator &inout It)
    {
        FVM_TeammateInfo& local_6;
        TEUIModelRef<FVM_TeammateInfo> local_2 = this.TeammateInfo.AsRef();
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
                    this.TeammateInfo.TrackRead();
                    if (local_6)
                    {
                        local_6.TrackPropertyRead(::FVM_TeammateInfo::__IndexOf_Index());
                    }
                    if (local_6)
                    {
                        this.OnTeammateIndexChanged();
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
                XError(ELog(17), "Remaining observed model change: OnTeammateIndexChanged");
            }
            return;
        }
        this.__TeammateInfo = local_2.opImplConv();
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.TeammateInfo.Initialize(this, FName("VM_TeammateInfo"), EEUIWidgetRefModelCreationType(0), true);
        this.Index.Initialize(this, FName("VM_Index"), EEUIWidgetRefModelCreationType(0), true);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.TeammateInfoDelegate.IsBound())
        {
            this.TeammateInfo.SetRef(this.TeammateInfoDelegate.Execute());
        }
        if (this.IndexDelegate.IsBound())
        {
            this.Index.SetRef(this.IndexDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_Index
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
namespace UWidget_TeammateIndex
{
void GetModelInfo(FEUIWidgetMetaInfo &inout Result)
{
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnTeammateIndexChanged"));
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
