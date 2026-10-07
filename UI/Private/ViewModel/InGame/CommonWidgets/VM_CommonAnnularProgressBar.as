
namespace FVM_CommonAnnularProgressBar
{
    const int ModelId = 0;

}
struct FVM_CommonAnnularProgressBar : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    FFPTime m_EndTime;
    UPROPERTY()
    FFPTime m_Duration;
    UPROPERTY()
    FMW_TimeProgress m_TimeProgress;
    UPROPERTY()
    float m_Progress;

    FVM_CommonAnnularProgressBar()
    {
        this.m_Progress = 0.0;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_CommonAnnularProgressBar' by default constructor.");
        return;
    }
    FVM_CommonAnnularProgressBar(const FVM_CommonAnnularProgressBar &inout Other)
    {
        this.m_Progress = 0.0;
        this.m_EndTime = Other.m_EndTime;
        this.m_Duration = Other.m_Duration;
        this.m_TimeProgress = Other.m_TimeProgress;
        this.m_Progress = Other.m_Progress;
        return;
    }
    FVM_CommonAnnularProgressBar(const FFPTime &inout InEndTime, const FFPTime &inout InDuration)
    {
        this.m_Progress = 0.0;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetEndTime(InEndTime);
        this.SetDuration(InDuration);
        return;
    }
    FVM_CommonAnnularProgressBar opAssign(const FVM_CommonAnnularProgressBar &inout Other)
    {
        FVM_CommonAnnularProgressBar __r;
        this.m_EndTime = Other.m_EndTime;
        this.m_Duration = Other.m_Duration;
        this.m_TimeProgress = Other.m_TimeProgress;
        this.m_Progress = Other.m_Progress;
        return __r;
    }
    void RefreshTimeProgress()
    {
        if (this.GetDuration().ToSeconds() <= 0.0)
        {
            return;
        }
        this.GetModify_TimeProgress().EndAtSmooth(this.GetEndTime(), this.GetDuration());
        return;
    }
    float GetShowProgress() const
    {
        return FMath::Clamp((this.GetTimeProgress().GetRemainingRatio() - 0.5f), -0.5f, 0.5f);
    }
    void Tick()
    {
        this.SetProgress(this.GetShowProgress());
        return;
    }
    FFPTime GetEndTime() const property
    {
        FFPTime __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    FFPTime GetModify_EndTime() property
    {
        FFPTime __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetEndTime(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_EndTime = __Value;
        return;
    }
    FFPTime GetDuration() const property
    {
        FFPTime __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    FFPTime GetModify_Duration() property
    {
        FFPTime __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetDuration(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_Duration = __Value;
        return;
    }
    const FMW_TimeProgress GetTimeProgress() const property
    {
        const FMW_TimeProgress __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    FMW_TimeProgress GetModify_TimeProgress() property
    {
        FMW_TimeProgress __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetTimeProgress(const FMW_TimeProgress &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_TimeProgress = __Value;
        return;
    }
    float GetProgress() const property
    {
        float __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    float GetModify_Progress() property
    {
        float __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetProgress(const float &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_Progress = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_CommonAnnularProgressBar
{
    UPROPERTY()
    float ShowProgress;
    UPROPERTY()
    TEUIModelRef<FVM_CommonAnnularProgressBar> Self;


}

namespace FVM_CommonAnnularProgressBar
{
FVM_CommonAnnularProgressBar& Create(const UObject ContextObject, const FFPTime &inout EndTime, const FFPTime &inout Duration)
{
    return FVM_CommonAnnularProgressBar::CreateByManager(EUIInternal::GetContextManager(ContextObject), EndTime, Duration);
}
FVM_CommonAnnularProgressBar CreateByManager(const UEUIManagerSubsystem Manager, const FFPTime &inout EndTime, const FFPTime &inout Duration)
{
    FVM_CommonAnnularProgressBar __r;
    TEUIModelRef<FVM_CommonAnnularProgressBar> local_6 = TEUIModelRef<FVM_CommonAnnularProgressBar>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_CommonAnnularProgressBar::ModelId, 0, EndTime, Duration));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "ShowProgress";
    local_14.TypeName = "float64";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_CommonAnnularProgressBar>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_CommonAnnularProgressBar;
    FEUIModelWatcherProperty local_19;
    local_19.PropertyName = FName("TimeProgress");
    int local_2_2 = FVM_CommonAnnularProgressBar::__IndexOf_TimeProgress();
    Result.WatcherProperties.Add(local_19);
    FEUIModelEffectDefine local_26;
    local_26.FunctionName = "RefreshTimeProgress";
    Result.EffectFunctions.Add(local_26);
    Result.TickFunction.FunctionName = "__Tick";
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_CommonAnnularProgressBar;
}
void __Tick(FVM_CommonAnnularProgressBar &inout Model)
{
    Model.Tick();
    return;
}
float __UIGetter_ShowProgress(const FVM_CommonAnnularProgressBar &inout Model)
{
    return Model.GetShowProgress();
}
TEUIModelRef<FVM_CommonAnnularProgressBar> __UIGetter_Self(const FVM_CommonAnnularProgressBar &inout Model)
{
    return TEUIModelRef<FVM_CommonAnnularProgressBar>(Model);
}
int __IndexOf_EndTime()
{
    return 0;
}
int __IndexOf_Duration()
{
    return 1;
}
int __IndexOf_TimeProgress()
{
    return 2;
}
int __IndexOf_Progress()
{
    return 3;
}
}
namespace __GeneratedProperties_FVM_CommonAnnularProgressBar
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
