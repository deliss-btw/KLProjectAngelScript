
namespace FVM_RaceCommissionTimer
{
    const int ModelId = 0;

}
struct FVM_RaceCommissionTimer : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    bool m_bShouldShow;
    UPROPERTY()
    bool m_bIsStarted;
    UPROPERTY()
    FFPTime m_Time;
    UPROPERTY()
    FText m_TimeText;
    UPROPERTY()
    FEUITimerHandle m_RaceTimerTick;

    FVM_RaceCommissionTimer()
    {
        this.m_bShouldShow = false;
        this.m_bIsStarted = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVM_RaceCommissionTimer(const FVM_RaceCommissionTimer &inout Other)
    {
        this.m_bShouldShow = false;
        this.m_bIsStarted = false;
        this.m_bShouldShow = Other.m_bShouldShow;
        this.m_bIsStarted = Other.m_bIsStarted;
        this.m_Time = Other.m_Time;
        this.m_TimeText = Other.m_TimeText;
        this.m_RaceTimerTick = Other.m_RaceTimerTick;
        return;
    }
    FVM_RaceCommissionTimer& opAssign(const FVM_RaceCommissionTimer &inout Other)
    {
        this.m_bShouldShow = Other.m_bShouldShow;
        this.m_bIsStarted = Other.m_bIsStarted;
        this.m_Time = Other.m_Time;
        this.m_TimeText = Other.m_TimeText;
        return Other.m_RaceTimerTick;
    }
    void PostConstruct()
    {
        this.ScheduleTick(this.GetModify_RaceTimerTick(), n"PollRaceTimer", 0.1f, -1.0f);
        return;
    }
    bool ShouldShow() const
    {
        return this.GetbShouldShow();
    }
    void UpdateShouldShow()
    {
        this.SetbShouldShow(this.CheckShouldShow());
        return;
    }
    void BeginDestroy()
    {
        this.ClearTimer(this.GetModify_RaceTimerTick());
        return;
    }
    bool CheckShouldShow()
    {
        int local_8 = 0;
        if (!(this.GetContext().World))
        {
            return false;
        }
        if (!(local_8) || !(local_8.CommissionConfig) || (int(local_8.CommissionConfig.opArrow().CommissionType) != 5))
        {
            return false;
        }
        bool local_1 = FECSWorldUIRef::Has<FCS_CommissionFinish>(this.GetContext().World).opCall();
        if (local_1)
        {
            TEUIModelRef<FM_CommissionPopup> local_22 = ::FMS_CommissionModelFactory::Get(this.GetManager()).GetCommissionPopup();
            TEUIModelRef<FM_CommissionPopup> local_20;
            if (!(local_20.IsValid()))
            {
                return true;
            }
            return !(local_20.opArrow().GetbSkipRewardPopups()) && !(local_20.opArrow().GetbFullScreenRewardPopOpened());
        }
        return true;
    }
    void PollRaceTimer()
    {
        this.SetbIsStarted(::CommissionUtils::IsRaceCommissionTimerStarted());
        this.SetTime(::CommissionUtils::GetRaceCommissionTime(this.GetContext().Time));
        this.SetTimeText(::CommissionUtils::GetRaceCommissionTimeText(int(this.GetTime().ToSeconds())));
        return;
    }
    bool GetbShouldShow() const property
    {
        this.TrackPropertyRead(0);
        return this.m_bShouldShow;
    }
    void SetbShouldShow(const bool __Value) property
    {
        if (!(this.m_bShouldShow) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_bShouldShow = __Value;
        return;
    }
    bool GetbIsStarted() const property
    {
        this.TrackPropertyRead(1);
        return this.m_bIsStarted;
    }
    void SetbIsStarted(const bool __Value) property
    {
        if (!(this.m_bIsStarted) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_bIsStarted = __Value;
        return;
    }
    FFPTime GetTime() const property
    {
        FFPTime __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    FFPTime GetModify_Time() property
    {
        FFPTime __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetTime(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_Time = __Value;
        return;
    }
    const FText GetTimeText() const property
    {
        const FText __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    FText GetModify_TimeText() property
    {
        FText __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetTimeText(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_TimeText = __Value;
        return;
    }
    const FEUITimerHandle GetRaceTimerTick() const property
    {
        const FEUITimerHandle __r;
        this.TrackPropertyRead(4);
        return __r;
    }
    FEUITimerHandle GetModify_RaceTimerTick() property
    {
        FEUITimerHandle __r;
        this.MarkPropertyDirty(4);
        return __r;
    }
    void SetRaceTimerTick(const FEUITimerHandle &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_RaceTimerTick = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_RaceCommissionTimer
{
    UPROPERTY()
    bool ShouldShow;
    UPROPERTY()
    TEUIModelRef<FVM_RaceCommissionTimer> Self;


}

namespace FVM_RaceCommissionTimer
{
FVM_RaceCommissionTimer& Create(const UObject ContextObject)
{
    return FVM_RaceCommissionTimer::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_RaceCommissionTimer CreateByManager(const UEUIManagerSubsystem Manager)
{
    FVM_RaceCommissionTimer __r;
    TEUIModelRef<FVM_RaceCommissionTimer> local_6 = TEUIModelRef<FVM_RaceCommissionTimer>(EUIInternal::MakeModelWithManager(Manager, FVM_RaceCommissionTimer::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasBeginDestroy(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "bIsStarted";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Time";
    local_14.TypeName = "FFPTime";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "TimeText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ShouldShow";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_RaceCommissionTimer>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_RaceCommissionTimer;
    FEUIModelEffectDefine local_20;
    local_20.FunctionName = "UpdateShouldShow";
    Result.EffectFunctions.Add(local_20);
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_RaceCommissionTimer;
}
bool __UIGetter_bIsStarted(const FVM_RaceCommissionTimer &inout Model)
{
    return Model.GetbIsStarted();
}
FFPTime __UIGetter_Time(const FVM_RaceCommissionTimer &inout Model)
{
    return Model.GetTime();
}
FText __UIGetter_TimeText(const FVM_RaceCommissionTimer &inout Model)
{
    return Model.GetTimeText();
}
bool __UIGetter_ShouldShow(const FVM_RaceCommissionTimer &inout Model)
{
    return Model.ShouldShow();
}
TEUIModelRef<FVM_RaceCommissionTimer> __UIGetter_Self(const FVM_RaceCommissionTimer &inout Model)
{
    return TEUIModelRef<FVM_RaceCommissionTimer>(Model);
}
int __IndexOf_bShouldShow()
{
    return 0;
}
int __IndexOf_bIsStarted()
{
    return 1;
}
int __IndexOf_Time()
{
    return 2;
}
int __IndexOf_TimeText()
{
    return 3;
}
int __IndexOf_RaceTimerTick()
{
    return 4;
}
}
namespace __GeneratedProperties_FVM_RaceCommissionTimer
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
