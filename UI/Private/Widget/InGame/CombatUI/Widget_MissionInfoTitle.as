namespace UWidget_MissionInfoTitle
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_MissionInfoTitle : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_MissionInfoTitle> TitleInfo;
    UPROPERTY()
    FText CacheCotent;
    UPROPERTY()
    float32 CheckHideInterval = 0.0f;
    FEUIModelWeakRef __TitleInfo;
    UPROPERTY()
    FGetEUIModelRef TitleInfoDelegate;

    UFUNCTION()
    void Construct_Implementation()
    {
        this.PlayFadeIn(0.0f);
        return;
    }
    UFUNCTION()
    void Tick_Implementation(const FGeometry &inout MyGeometry, const float32 InDeltaTime)
    {
        if (this.CheckHideInterval > 0.0f)
        {
            this.CheckHideInterval = (this.CheckHideInterval - InDeltaTime);
            return;
        }
        if (this.TitleInfo.IsValid())
        {
            if (this.TitleInfo.Get().GetbHide() && this.TitleInfo.Get().GetbCheckHide() && !(this.IsFadingOut()))
            {
                this.TitleInfo.Get().SetVisiable(false);
                return;
            }
            this.TitleInfo.Get().SetVisiable(true);
        }
        return;
    }
    UFUNCTION()
    void OnContentChange(const bool bPlay)
    {
        if (bPlay)
        {
            this.TitleInfo.Get().SetbPlayIn(false);
            this.PlayFadeIn(0.0f);
        }
        return;
    }
    UFUNCTION()
    void CloseInfoTitle(const bool bHide)
    {
        if (bHide)
        {
            this.TitleInfo.Get().SetbCheckHide(true);
            this.PlayFadeOut(0.0f);
            return;
        }
        this.PlayFadeIn(0.0f);
        return;
    }
    void HandleObservedModelChanges(FEUIReactiveSubscriberIterator &inout It)
    {
        TEUIModelRef<FVM_MissionInfoTitle> local_2 = this.TitleInfo.AsRef();
        FVM_MissionInfoTitle& local_6 = local_2.Get();
        for (; It; )
        {
            FEUIReactiveSubscriberTrackScope local_56 = FEUIReactiveSubscriberTrackScope(It);
            int local_57 = It.GetIndex();
            if (local_57 <= 1)
            {
                if (local_57 != 0)
                {
                    if (local_57 != 1)
                    {
                    }
                }
                else
                {
                    this.TitleInfo.TrackRead();
                    if (local_6)
                    {
                        local_6.TrackPropertyRead(::FVM_MissionInfoTitle::__IndexOf_bPlayIn());
                    }
                    if (local_6)
                    {
                        this.OnContentChange(local_6.GetbPlayIn());
                    }
                    this.TitleInfo.TrackRead();
                    if (local_6)
                    {
                        local_6.TrackPropertyRead(::FVM_MissionInfoTitle::__IndexOf_bHide());
                    }
                    if (local_6)
                    {
                        this.CloseInfoTitle(local_6.GetbHide());
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
                XError(ELog(17), "Remaining observed model change: OnContentChange");
            }
            if (It.IsDirty(1))
            {
                XError(ELog(17), "Remaining observed model change: CloseInfoTitle");
            }
            return;
        }
        this.__TitleInfo = local_2.opImplConv();
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.TitleInfo.Initialize(this, FName("VM_MissionInfoTitle"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.TitleInfoDelegate.IsBound())
        {
            this.TitleInfo.SetRef(this.TitleInfoDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_MissionInfoTitle
{
void GetModelInfo(FEUIWidgetMetaInfo &inout Result)
{
    Result.WidgetType = UWidget_MissionInfoTitle;
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnContentChange"));
    Result.ObservedModelChangesSubscriberNames.Add(FString("CloseInfoTitle"));
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
