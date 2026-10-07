
namespace UWidget_LevelInfo
{
    const int ViewID = 0;

}
struct FLevelInfoWidgetAnimPayload
{
    UPROPERTY()
    FText Title;
    UPROPERTY()
    FText Desc;
    UPROPERTY()
    FSlateBrush Icon;
    UPROPERTY()
    UWidgetAnimation Anim = nullptr;

    FLevelInfoWidgetAnimPayload()
    {
        return;
    }
}

struct FLevelInfoCurrentAnim
{
    UPROPERTY()
    float32 WaitTime;
    UPROPERTY()
    bool bForwardPlayed;
    UPROPERTY()
    bool bReversePlayed;


    void Reset(const float32 InWaitTime)
    {
        this.WaitTime = InWaitTime;
        this.bForwardPlayed = false;
        this.bReversePlayed = false;
        return;
    }
}

UCLASS(Abstract)
class UWidget_LevelInfo : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVMS_CurrentWeather> Weather;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_TimeOfDay> TimeOfDay;
    UPROPERTY()
    TEUIWidgetModelRef<FVMS_ExitLevel> ExitLevel;
    UPROPERTY()
    UWidgetAnimation Anim_Switch;
    UPROPERTY()
    UWidget UI_Common_WeatherUnfold;
    UPROPERTY()
    UWidget WeatherOld;
    FEUIModelWeakRef __Weather;

    UWidget_LevelInfo()
    {
        return;
    }
    UFUNCTION()
    void OnTriggerAddExpAnim(const uint AnimShowWeatherID)
    {
        if (this.Weather.IsValid() && (AnimShowWeatherID > 0))
        {
            if (this.UI_Common_WeatherUnfold != nullptr)
            {
                this.UI_Common_WeatherUnfold.SetRenderOpacity(0.0f);
            }
            if (this.WeatherOld != nullptr)
            {
                this.WeatherOld.SetRenderOpacity(1.0f);
            }
            this.PlayAnimation(this.Anim_Switch, 0.0f, 1, EUMGSequencePlayMode(0), 1.0f, false);
        }
        return;
    }
    UFUNCTION()
    void Weather_ShowHover(const UWidget Widget) const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder::PushArg local_42;
        local_42.opCall(Widget);
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void Weather_HideHover() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void TimeOfDay_ShowHover(const UWidget Widget) const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder::PushArg local_42;
        local_42.opCall(Widget);
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void TimeOfDay_HideHover() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void ExitLevel_OnClick() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    void HandleObservedModelChanges(FEUIReactiveSubscriberIterator &inout It)
    {
        FVMS_CurrentWeather& local_6;
        TEUIModelRef<FVMS_CurrentWeather> local_2 = this.Weather.AsRef();
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
                    this.Weather.TrackRead();
                    if (local_6)
                    {
                        local_6.TrackPropertyRead(::FVMS_CurrentWeather::__IndexOf_NeedAnimShowWeatherID());
                    }
                    if (local_6)
                    {
                        this.OnTriggerAddExpAnim(local_6.GetNeedAnimShowWeatherID());
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
                XError(ELog(17), "Remaining observed model change: OnTriggerAddExpAnim");
            }
            return;
        }
        this.__Weather = local_2.opImplConv();
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.Weather.Initialize(this, FName("VMS_CurrentWeather"), EEUIWidgetRefModelCreationType(0), false);
        this.TimeOfDay.Initialize(this, FName("VM_TimeOfDay"), EEUIWidgetRefModelCreationType(0), false);
        this.ExitLevel.Initialize(this, FName("VMS_ExitLevel"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        return;
    }
}

namespace UWidget_LevelInfo
{
void GetModelInfo(FEUIWidgetMetaInfo &inout Result)
{
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnTriggerAddExpAnim"));
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
