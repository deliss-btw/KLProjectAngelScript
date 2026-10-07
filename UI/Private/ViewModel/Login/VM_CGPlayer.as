
enum ECgPlayerPagePhase
{
    Idle,
    FadingIn,
    FadingOut,
}

namespace FVM_CGPlayer
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature GoNextPageOrFinish = FEUIModelCallbackSignature();

}
struct FVM_CGPlayer : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TDataObjectPtr<FCGConfig> m_CGConfig;
    UPROPERTY()
    bool m_bCanClickNext;
    UPROPERTY()
    FSoftBrush m_CurrentImage;
    UPROPERTY()
    FText m_CurrentDesc;
    UPROPERTY()
    float32 m_CurrentAlpha;
    UPROPERTY()
    int m_CurrentPage;
    UPROPERTY()
    FMW_CounterDown m_ClickCounterDown;
    UPROPERTY()
    FMW_TimeProgress m_PageFadeProgress;
    UPROPERTY()
    ECgPlayerPagePhase m_PagePhase;
    UPROPERTY()
    bool m_bIsCountDownVisible;
    UPROPERTY()
    bool m_bPendingFinishAfterFadeOut;
    UPROPERTY()
    bool m_bCanClose;
    UPROPERTY()
    int m_NextButtonCountdownSeconds;
    UPROPERTY()
    FText m_ActionTimeDisplayText;
    UPROPERTY()
    FText m_ActionName;

    FVM_CGPlayer()
    {
        this.m_bCanClickNext = false;
        this.m_CurrentAlpha = 0.0f;
        this.m_CurrentPage = 0;
        this.m_PagePhase = ECgPlayerPagePhase(0);
        this.m_bIsCountDownVisible = true;
        this.m_bPendingFinishAfterFadeOut = false;
        this.m_bCanClose = false;
        this.m_NextButtonCountdownSeconds = 0;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_CGPlayer' by default constructor.");
        return;
    }
    FVM_CGPlayer(const FVM_CGPlayer &inout Other)
    {
        this.m_bCanClickNext = false;
        this.m_CurrentAlpha = 0.0f;
        this.m_CurrentPage = 0;
        this.m_PagePhase = ECgPlayerPagePhase(0);
        this.m_bIsCountDownVisible = true;
        this.m_bPendingFinishAfterFadeOut = false;
        this.m_bCanClose = false;
        this.m_NextButtonCountdownSeconds = 0;
        this.m_CGConfig = Other.m_CGConfig;
        this.m_bCanClickNext = Other.m_bCanClickNext;
        this.m_CurrentImage = Other.m_CurrentImage;
        this.m_CurrentDesc = Other.m_CurrentDesc;
        this.m_CurrentAlpha = Other.m_CurrentAlpha;
        this.m_CurrentPage = int(Other.m_CurrentPage);
        this.m_ClickCounterDown = Other.m_ClickCounterDown;
        this.m_PageFadeProgress = Other.m_PageFadeProgress;
        this.m_PagePhase = Other.m_PagePhase;
        this.m_bIsCountDownVisible = Other.m_bIsCountDownVisible;
        this.m_bPendingFinishAfterFadeOut = Other.m_bPendingFinishAfterFadeOut;
        this.m_bCanClose = Other.m_bCanClose;
        this.m_NextButtonCountdownSeconds = int(Other.m_NextButtonCountdownSeconds);
        this.m_ActionTimeDisplayText = Other.m_ActionTimeDisplayText;
        this.m_ActionName = Other.m_ActionName;
        return;
    }
    FVM_CGPlayer(const TDataObjectPtr<FCGConfig> &inout InCGConfig)
    {
        this.m_bCanClickNext = false;
        this.m_CurrentAlpha = 0.0f;
        this.m_CurrentPage = 0;
        this.m_PagePhase = ECgPlayerPagePhase(0);
        this.m_bIsCountDownVisible = true;
        this.m_bPendingFinishAfterFadeOut = false;
        this.m_bCanClose = false;
        this.m_NextButtonCountdownSeconds = 0;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetCGConfig(InCGConfig);
        return;
    }
    FVM_CGPlayer& opAssign(const FVM_CGPlayer &inout Other)
    {
        this.m_CGConfig = Other.m_CGConfig;
        this.m_bCanClickNext = Other.m_bCanClickNext;
        this.m_CurrentImage = Other.m_CurrentImage;
        this.m_CurrentDesc = Other.m_CurrentDesc;
        this.m_CurrentAlpha = Other.m_CurrentAlpha;
        this.m_CurrentPage = int(Other.m_CurrentPage);
        this.m_ClickCounterDown = Other.m_ClickCounterDown;
        this.m_PageFadeProgress = Other.m_PageFadeProgress;
        this.m_PagePhase = Other.m_PagePhase;
        this.m_bIsCountDownVisible = Other.m_bIsCountDownVisible;
        this.m_bPendingFinishAfterFadeOut = Other.m_bPendingFinishAfterFadeOut;
        this.m_bCanClose = Other.m_bCanClose;
        this.m_NextButtonCountdownSeconds = int(Other.m_NextButtonCountdownSeconds);
        this.m_ActionTimeDisplayText = Other.m_ActionTimeDisplayText;
        return Other.m_ActionName;
    }
    void PostConstruct()
    {
        this.ResetState();
        this.RefreshCurrentPage();
        return;
    }
    void SetupByCGConfig(const TDataObjectPtr<FCGConfig> &inout InCGConfig)
    {
        if (!(InCGConfig.IsSet()))
        {
            XError(ELog(16), "FVM_CGPlayer::SetupByCGConfig failed: config is invalid");
            return;
        }
        this.SetCGConfig(InCGConfig);
        this.SetCurrentPage(0);
        this.RefreshCurrentPage();
        return;
    }
    void RefreshActionTimeDisplayText()
    {
        if (this.GetbCanClickNext() || (this.GetNextButtonCountdownSeconds() <= 0))
        {
            FText local_8;
            this.SetActionTimeDisplayText(local_8);
        }
        else
        {
            this.SetActionTimeDisplayText(FText::Format(NSLOCTEXT("CGPlayer", "NextButtonCountdown", "{0}({1}s)"), this.GetActionName(), this.GetNextButtonCountdownSeconds()));
        }
        this.SetbIsCountDownVisible((this.GetNextButtonCountdownSeconds() > 0));
        return;
    }
    void RefreshBtnState()
    {
        if ((int(this.GetPagePhase())) != 0)
        {
            this.SetbCanClickNext(false);
            this.SetNextButtonCountdownSeconds(0);
            return;
        }
        float32 local_9 = this.GetClickCounterDown().GetRemainedTime();
        this.SetbCanClickNext((local_9 <= 0.0f));
        this.SetNextButtonCountdownSeconds(FMath::CeilToInt(FMath::Max(local_9, 0.0f)));
        return;
    }
    void UpdatePageFade()
    {
        if (int(this.GetPagePhase()) == 1)
        {
            this.SetCurrentAlpha(this.GetPageFadeProgress().GetProgress());
            this.SetbIsCountDownVisible(false);
            if (this.GetPageFadeProgress().IsFinished())
            {
                this.EnterIdleAfterFadeIn();
            }
            return;
        }
        if (int(this.GetPagePhase()) == 2)
        {
            this.SetCurrentAlpha(1.0f - this.GetPageFadeProgress().GetProgress());
            this.SetbIsCountDownVisible(false);
            if (this.GetPageFadeProgress().IsFinished())
            {
                this.EnterNextPageAfterFadeOut();
            }
            return;
        }
        this.SetCurrentAlpha(1.0f);
        return;
    }
    void GoNextPageOrFinish()
    {
        if (!(this.GetbCanClickNext()))
        {
            return;
        }
        if (this.HasPageFadeOut(this.GetCurrentPageConfig()))
        {
            if (this.IsLastPage())
            {
                this.SetbPendingFinishAfterFadeOut(true);
            }
            this.BeginFadeOut();
            return;
        }
        if (this.IsLastPage())
        {
            this.NotifyPlaybackFinished();
            this.SetbCanClose(true);
            return;
        }
        this.SetCurrentPage((this.GetCurrentPage() + 1));
        this.RefreshCurrentPage();
        return;
    }
    bool IsLastPage() const
    {
        int local_3 = 0;
        if (!(this.GetCGConfig().IsSet()))
        {
            return true;
        }
        return (local_3 <= 0 || (this.GetCurrentPage() >= (local_3 - 1)));
    }
    bool HasPageFadeIn(const FCGContextConfig &inout PageConfig) const
    {
        return (PageConfig.FadeInDuration > 0.0f);
    }
    bool HasPageFadeOut(const FCGContextConfig &inout PageConfig) const
    {
        return (PageConfig.FadeOutDuration > 0.0f);
    }
    FCGContextConfig GetCurrentPageConfig() const
    {
        FCGContextConfig __r;
        if (this.GetCGConfig().IsSet())
        {
            TArray<FCGContextConfig> local_56;
            if (local_56.IsValidIndex(this.GetCurrentPage()))
            {
                int local_57 = this.GetCurrentPage();
            }
        }
        return __r;
    }
    void ResetState()
    {
        this.SetbCanClose(false);
        this.SetCurrentPage(0);
        this.SetbCanClickNext(false);
        this.SetbIsCountDownVisible(true);
        this.SetbPendingFinishAfterFadeOut(false);
        this.SetPagePhase(ECgPlayerPagePhase(0));
        this.SetCurrentAlpha(1.0f);
        this.SetCurrentImage(FSoftBrush());
        this.SetCurrentDesc(FText());
        return;
    }
    void RefreshCurrentPage()
    {
        TArray<FCGContextConfig> local_4;
        if (!(this.GetCGConfig().IsSet()))
        {
            return;
        }
        if (!(local_4.IsValidIndex(this.GetCurrentPage())))
        {
            XWarning(ELog(16), FString().Append("FVM_CGPlayer::RefreshCurrentPage failed: invalid page index ").Append(this.GetCurrentPage()));
            this.SetbCanClickNext(true);
            return;
        }
        const FCGContextConfig& local_14 = local_4[this.GetCurrentPage()];
        this.SetCurrentImage(local_14.Image);
        this.SetCurrentDesc(local_14.Desc);
        this.SetbPendingFinishAfterFadeOut(false);
        if (this.HasPageFadeIn(local_14))
        {
            this.SetPagePhase(ECgPlayerPagePhase(1));
            this.SetbIsCountDownVisible(false);
            this.SetbCanClickNext(false);
            this.GetModify_PageFadeProgress().RestartSmooth(FFPTime(local_14.FadeInDuration));
            this.SetCurrentAlpha(0.0f);
            return;
        }
        this.SetPagePhase(ECgPlayerPagePhase(0));
        this.SetbIsCountDownVisible(true);
        this.SetCurrentAlpha(1.0f);
        this.StartBtnState(local_14.NextButtonShowDelay);
        return;
    }
    void BeginFadeOut()
    {
        FCGContextConfig local_104 = this.GetCurrentPageConfig();
        this.SetPagePhase(ECgPlayerPagePhase(2));
        this.SetbIsCountDownVisible(false);
        this.SetbCanClickNext(false);
        this.GetModify_PageFadeProgress().RestartSmooth(FFPTime(local_104.FadeOutDuration));
        this.SetCurrentAlpha(1.0f);
        return;
    }
    void EnterIdleAfterFadeIn()
    {
        if ((int(this.GetPagePhase())) != 1)
        {
            return;
        }
        FCGContextConfig local_108 = this.GetCurrentPageConfig();
        this.SetPagePhase(ECgPlayerPagePhase(ECgPlayerPagePhase(0)));
        this.SetbIsCountDownVisible(true);
        this.SetCurrentAlpha(1.0f);
        this.StartBtnState(local_108.NextButtonShowDelay);
        return;
    }
    void EnterNextPageAfterFadeOut()
    {
        if (int(this.GetPagePhase()) != 2)
        {
            return;
        }
        this.SetPagePhase(ECgPlayerPagePhase(ECgPlayerPagePhase(0)));
        if (this.GetbPendingFinishAfterFadeOut())
        {
            this.SetbPendingFinishAfterFadeOut(false);
            this.NotifyPlaybackFinished();
            this.SetbCanClose(true);
            return;
        }
        this.SetCurrentPage((this.GetCurrentPage() + 1));
        this.RefreshCurrentPage();
        return;
    }
    void StartBtnState(const float32 Delay)
    {
        if (Delay > 0.0f)
        {
            this.SetbCanClickNext(false);
            this.GetModify_ClickCounterDown().SetRemainedTimeWithPrecision(FFPTime(Delay), EMWCounterDownPrecision(1));
            return;
        }
        this.SetbCanClickNext(true);
        return;
    }
    void NotifyPlaybackFinished()
    {
        int local_2 = 0;
        FEUIModelRef local_8 = FEUIModelRef(this);
        FEUIMessageBus::Publish(EUIMessageBus);
        local_2.CGConfig = this.GetCGConfig();
        return;
    }
    const TDataObjectPtr<FCGConfig> GetCGConfig() const property
    {
        const TDataObjectPtr<FCGConfig> __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    TDataObjectPtr<FCGConfig> GetModify_CGConfig() property
    {
        TDataObjectPtr<FCGConfig> __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetCGConfig(const TDataObjectPtr<FCGConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_CGConfig = __Value;
        return;
    }
    bool GetbCanClickNext() const property
    {
        this.TrackPropertyRead(1);
        return this.m_bCanClickNext;
    }
    void SetbCanClickNext(const bool __Value) property
    {
        if (!(this.m_bCanClickNext) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_bCanClickNext = __Value;
        return;
    }
    FSoftBrush GetCurrentImage() const property
    {
        FSoftBrush __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    FSoftBrush GetModify_CurrentImage() property
    {
        FSoftBrush __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetCurrentImage(const FSoftBrush &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_CurrentImage = __Value;
        return;
    }
    FText GetCurrentDesc() const property
    {
        FText __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    FText GetModify_CurrentDesc() property
    {
        FText __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetCurrentDesc(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_CurrentDesc = __Value;
        return;
    }
    const float32 GetCurrentAlpha() const property
    {
        const float32 __r;
        this.TrackPropertyRead(4);
        return __r;
    }
    float32 GetModify_CurrentAlpha() property
    {
        float32 __r;
        this.MarkPropertyDirty(4);
        return __r;
    }
    void SetCurrentAlpha(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_CurrentAlpha = __Value;
        return;
    }
    int GetCurrentPage() const property
    {
        this.TrackPropertyRead(5);
        return this.m_CurrentPage;
    }
    void SetCurrentPage(const int __Value) property
    {
        if (this.m_CurrentPage == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_CurrentPage = __Value;
        return;
    }
    const FMW_CounterDown GetClickCounterDown() const property
    {
        const FMW_CounterDown __r;
        this.TrackPropertyRead(6);
        return __r;
    }
    FMW_CounterDown GetModify_ClickCounterDown() property
    {
        FMW_CounterDown __r;
        this.MarkPropertyDirty(6);
        return __r;
    }
    void SetClickCounterDown(const FMW_CounterDown &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_ClickCounterDown = __Value;
        return;
    }
    const FMW_TimeProgress GetPageFadeProgress() const property
    {
        const FMW_TimeProgress __r;
        this.TrackPropertyRead(7);
        return __r;
    }
    FMW_TimeProgress GetModify_PageFadeProgress() property
    {
        FMW_TimeProgress __r;
        this.MarkPropertyDirty(7);
        return __r;
    }
    void SetPageFadeProgress(const FMW_TimeProgress &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(7);
        this.m_PageFadeProgress = __Value;
        return;
    }
    ECgPlayerPagePhase GetPagePhase() const property
    {
        this.TrackPropertyRead(8);
        return this.m_PagePhase;
    }
    void SetPagePhase(const ECgPlayerPagePhase __Value) property
    {
        if (int(this.m_PagePhase) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(8);
        this.m_PagePhase = __Value;
        return;
    }
    bool GetbIsCountDownVisible() const property
    {
        this.TrackPropertyRead(9);
        return this.m_bIsCountDownVisible;
    }
    void SetbIsCountDownVisible(const bool __Value) property
    {
        if (!(this.m_bIsCountDownVisible) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(9);
        this.m_bIsCountDownVisible = __Value;
        return;
    }
    bool GetbPendingFinishAfterFadeOut() const property
    {
        this.TrackPropertyRead(10);
        return this.m_bPendingFinishAfterFadeOut;
    }
    void SetbPendingFinishAfterFadeOut(const bool __Value) property
    {
        if (!(this.m_bPendingFinishAfterFadeOut) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(10);
        this.m_bPendingFinishAfterFadeOut = __Value;
        return;
    }
    bool GetbCanClose() const property
    {
        this.TrackPropertyRead(11);
        return this.m_bCanClose;
    }
    void SetbCanClose(const bool __Value) property
    {
        if (!(this.m_bCanClose) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(11);
        this.m_bCanClose = __Value;
        return;
    }
    int GetNextButtonCountdownSeconds() const property
    {
        this.TrackPropertyRead(12);
        return this.m_NextButtonCountdownSeconds;
    }
    void SetNextButtonCountdownSeconds(const int __Value) property
    {
        if (this.m_NextButtonCountdownSeconds == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(12);
        this.m_NextButtonCountdownSeconds = __Value;
        return;
    }
    const FText GetActionTimeDisplayText() const property
    {
        const FText __r;
        this.TrackPropertyRead(13);
        return __r;
    }
    FText GetModify_ActionTimeDisplayText() property
    {
        FText __r;
        this.MarkPropertyDirty(13);
        return __r;
    }
    void SetActionTimeDisplayText(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(13);
        this.m_ActionTimeDisplayText = __Value;
        return;
    }
    const FText GetActionName() const property
    {
        const FText __r;
        this.TrackPropertyRead(14);
        return __r;
    }
    FText GetModify_ActionName() property
    {
        FText __r;
        this.MarkPropertyDirty(14);
        return __r;
    }
    void SetActionName(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(14);
        this.m_ActionName = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_CGPlayer
{
    UPROPERTY()
    TEUIModelRef<FVM_CGPlayer> Self;

    __GeneratedProperties_FVM_CGPlayer()
    {
        return;
    }
}

namespace FVM_CGPlayer
{
FVM_CGPlayer& Create(const UObject ContextObject, const TDataObjectPtr<FCGConfig> &inout CGConfig)
{
    return FVM_CGPlayer::CreateByManager(EUIInternal::GetContextManager(ContextObject), CGConfig);
}
FVM_CGPlayer CreateByManager(const UEUIManagerSubsystem Manager, const TDataObjectPtr<FCGConfig> &inout CGConfig)
{
    FVM_CGPlayer __r;
    TEUIModelRef<FVM_CGPlayer> local_6 = TEUIModelRef<FVM_CGPlayer>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_CGPlayer::ModelId, 0, CGConfig));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "CurrentImage";
    local_14.TypeName = "FSoftBrush";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CurrentDesc";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CurrentAlpha";
    local_14.TypeName = "float32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bIsCountDownVisible";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ActionTimeDisplayText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_CGPlayer>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_CGPlayer;
    FEUIModelWatcherProperty local_19;
    local_19.PropertyName = FName("ClickCounterDown");
    int local_2_2 = FVM_CGPlayer::__IndexOf_ClickCounterDown();
    Result.WatcherProperties.Add(local_19);
    local_19.PropertyName = FName("PageFadeProgress");
    int local_2_3 = FVM_CGPlayer::__IndexOf_PageFadeProgress();
    Result.WatcherProperties.Add(local_19);
    FEUIModelEffectDefine local_26;
    local_26.FunctionName = "RefreshActionTimeDisplayText";
    Result.EffectFunctions.Add(local_26);
    local_26.FunctionName = "RefreshBtnState";
    Result.EffectFunctions.Add(local_26);
    local_26.FunctionName = "UpdatePageFade";
    Result.EffectFunctions.Add(local_26);
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_CGPlayer;
}
FSoftBrush __UIGetter_CurrentImage(const FVM_CGPlayer &inout Model)
{
    return Model.GetCurrentImage();
}
FText __UIGetter_CurrentDesc(const FVM_CGPlayer &inout Model)
{
    return Model.GetCurrentDesc();
}
float32 __UIGetter_CurrentAlpha(const FVM_CGPlayer &inout Model)
{
    return Model.GetCurrentAlpha();
}
bool __UIGetter_bIsCountDownVisible(const FVM_CGPlayer &inout Model)
{
    return Model.GetbIsCountDownVisible();
}
FText __UIGetter_ActionTimeDisplayText(const FVM_CGPlayer &inout Model)
{
    return Model.GetActionTimeDisplayText();
}
TEUIModelRef<FVM_CGPlayer> __UIGetter_Self(const FVM_CGPlayer &inout Model)
{
    return TEUIModelRef<FVM_CGPlayer>(Model);
}
int __IndexOf_CGConfig()
{
    return 0;
}
int __IndexOf_bCanClickNext()
{
    return 1;
}
int __IndexOf_CurrentImage()
{
    return 2;
}
int __IndexOf_CurrentDesc()
{
    return 3;
}
int __IndexOf_CurrentAlpha()
{
    return 4;
}
int __IndexOf_CurrentPage()
{
    return 5;
}
int __IndexOf_ClickCounterDown()
{
    return 6;
}
int __IndexOf_PageFadeProgress()
{
    return 7;
}
int __IndexOf_PagePhase()
{
    return 8;
}
int __IndexOf_bIsCountDownVisible()
{
    return 9;
}
int __IndexOf_bPendingFinishAfterFadeOut()
{
    return 10;
}
int __IndexOf_bCanClose()
{
    return 11;
}
int __IndexOf_NextButtonCountdownSeconds()
{
    return 12;
}
int __IndexOf_ActionTimeDisplayText()
{
    return 13;
}
int __IndexOf_ActionName()
{
    return 14;
}
}
namespace __GeneratedProperties_FVM_CGPlayer
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
