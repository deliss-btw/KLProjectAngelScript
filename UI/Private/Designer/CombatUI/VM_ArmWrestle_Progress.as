
namespace FVM_ArmWrestle_Progress
{
    const int ModelId = 0;

}
struct FVM_ArmWrestle_Progress : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TArray<FEUIModelRef> m_DisplaySelfResults;
    UPROPERTY()
    TArray<FEUIModelRef> m_DisplayOpponentResults;
    UPROPERTY()
    int m_SelfWinTimes;
    UPROPERTY()
    int m_OpponentWinTimes;
    UPROPERTY()
    float32 m_WrestleProgress;
    UPROPERTY()
    int m_CountDownTime;
    UPROPERTY()
    float32 m_CountDownRemainSeconds;
    UPROPERTY()
    ESlateVisibility m_bIsShow;

    FVM_ArmWrestle_Progress()
    {
        this.m_SelfWinTimes = 0;
        this.m_OpponentWinTimes = 0;
        this.m_WrestleProgress = 0.0f;
        this.m_CountDownTime = 3;
        this.m_CountDownRemainSeconds = 3.0f;
        this.m_bIsShow = ESlateVisibility(0);
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVM_ArmWrestle_Progress(const FVM_ArmWrestle_Progress &inout Other)
    {
        this.m_SelfWinTimes = 0;
        this.m_OpponentWinTimes = 0;
        this.m_WrestleProgress = 0.0f;
        this.m_CountDownTime = 3;
        this.m_CountDownRemainSeconds = 3.0f;
        this.m_bIsShow = ESlateVisibility(0);
        this.m_DisplaySelfResults = Other.m_DisplaySelfResults;
        this.m_DisplayOpponentResults = Other.m_DisplayOpponentResults;
        this.m_SelfWinTimes = int(Other.m_SelfWinTimes);
        this.m_OpponentWinTimes = int(Other.m_OpponentWinTimes);
        this.m_WrestleProgress = Other.m_WrestleProgress;
        this.m_CountDownTime = int(Other.m_CountDownTime);
        this.m_CountDownRemainSeconds = Other.m_CountDownRemainSeconds;
        this.m_bIsShow = Other.m_bIsShow;
        return;
    }
    FVM_ArmWrestle_Progress opAssign(const FVM_ArmWrestle_Progress &inout Other)
    {
        FVM_ArmWrestle_Progress __r;
        this.m_DisplaySelfResults = Other.m_DisplaySelfResults;
        this.m_DisplayOpponentResults = Other.m_DisplayOpponentResults;
        this.m_SelfWinTimes = int(Other.m_SelfWinTimes);
        this.m_OpponentWinTimes = int(Other.m_OpponentWinTimes);
        this.m_WrestleProgress = Other.m_WrestleProgress;
        this.m_CountDownTime = int(Other.m_CountDownTime);
        this.m_CountDownRemainSeconds = Other.m_CountDownRemainSeconds;
        this.m_bIsShow = Other.m_bIsShow;
        return __r;
    }
    void PostConstruct()
    {
        this.SetCountDownTime(0);
        this.SetCountDownRemainSeconds(3.0f);
        this.SetbIsShow(ESlateVisibility(0));
        return;
    }
    void OnShowWrestleResult(const FCE_ShowWrestleResultEvent &inout Event)
    {
        FECSEntity local_8 = ::FASCommonUtils::GetLocalPlayerProxy();
        if ((FECSEntity(Event.Sender) == local_8))
        {
            if (this.GetDisplaySelfResults().Num() >= 5)
            {
                this.GetModify_DisplaySelfResults().Empty(0);
            }
            this.AddResultToList(this.GetModify_DisplaySelfResults(), int(Event.ResultIndex));
        }
        else
        {
            if (this.GetDisplayOpponentResults().Num() >= 5)
            {
                this.GetModify_DisplayOpponentResults().Empty(0);
            }
            this.AddResultToList(this.GetModify_DisplayOpponentResults(), int(Event.ResultIndex));
        }
        return;
    }
    void OnBeginWrestle(const FCE_BeginWrestleEvent &inout Event)
    {
        this.SetCountDownTime(3);
        return;
    }
    void Tick()
    {
        if (this.GetCountDownTime() > 0)
        {
            this.SetbIsShow(ESlateVisibility(0));
            float32 local_9 = ECS::GetUEWorld().GetDeltaSeconds();
            if (local_9 > 0.0f)
            {
                this.SetCountDownRemainSeconds(FMath::Max(0.0f, (this.GetCountDownRemainSeconds() - local_9)));
                this.SetCountDownTime(FMath::CeilToInt(this.GetCountDownRemainSeconds()));
            }
        }
        if (this.GetCountDownTime() <= 0)
        {
            this.SetbIsShow(ESlateVisibility(2));
        }
        FECSEntity local_16 = FECSEntity(this.GetContext().GetLocalPlayerPawn());
        if (!(local_16.IsValid()))
        {
            return;
        }
        FNameHandle_EntityBBVarInt local_24;
        local_24;
        this.SetSelfWinTimes(local_16.GetBB_Int(local_24));
        FNameHandle_EntityBBVarEntity local_32;
        local_32;
        FECSEntity local_20 = local_16.GetBB_Entity(local_32);
        if (!(local_20.IsValid()))
        {
            return;
        }
        local_24;
        this.SetOpponentWinTimes(local_20.GetBB_Int(local_24));
        this.SetWrestleProgress(float32((((this.GetSelfWinTimes() - this.GetOpponentWinTimes()) + 3) / 6.0)));
        return;
    }
    UTexture2D LoadResultTexture(const int ResultIndex) const
    {
        UCombatGlobalSettings local_6 = ::UCombatGlobalSettings::Get();
        TArray<UTexture2D> local_4 = local_6.ArmWrestleResultTextures;
        if (local_4.IsValidIndex(ResultIndex))
        {
            return local_4[ResultIndex];
        }
        UTexture2D local_10;
        return local_10;
    }
    void AddResultToList(TArray<FEUIModelRef> &inout ResultList, const int ResultIndex)
    {
        UTexture2D local_2 = this.LoadResultTexture(ResultIndex);
        if (local_2 == nullptr)
        {
            return;
        }
        FVM_ArmWrestle_Result& local_8 = ::FVM_ArmWrestle_Result::Create(this.GetContext().Manager);
        local_8.SetResultTexture(local_2);
        ResultList.Add(FEUIModelRef(local_8));
        return;
    }
    const TArray<FEUIModelRef> GetDisplaySelfResults() const property
    {
        const TArray<FEUIModelRef> __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    TArray<FEUIModelRef> GetModify_DisplaySelfResults() property
    {
        TArray<FEUIModelRef> __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetDisplaySelfResults(const TArray<FEUIModelRef> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_DisplaySelfResults = __Value;
        return;
    }
    const TArray<FEUIModelRef> GetDisplayOpponentResults() const property
    {
        const TArray<FEUIModelRef> __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    TArray<FEUIModelRef> GetModify_DisplayOpponentResults() property
    {
        TArray<FEUIModelRef> __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetDisplayOpponentResults(const TArray<FEUIModelRef> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_DisplayOpponentResults = __Value;
        return;
    }
    int GetSelfWinTimes() const property
    {
        this.TrackPropertyRead(2);
        return this.m_SelfWinTimes;
    }
    void SetSelfWinTimes(const int __Value) property
    {
        if (this.m_SelfWinTimes == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_SelfWinTimes = __Value;
        return;
    }
    int GetOpponentWinTimes() const property
    {
        this.TrackPropertyRead(3);
        return this.m_OpponentWinTimes;
    }
    void SetOpponentWinTimes(const int __Value) property
    {
        if (this.m_OpponentWinTimes == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_OpponentWinTimes = __Value;
        return;
    }
    const float32 GetWrestleProgress() const property
    {
        const float32 __r;
        this.TrackPropertyRead(4);
        return __r;
    }
    float32 GetModify_WrestleProgress() property
    {
        float32 __r;
        this.MarkPropertyDirty(4);
        return __r;
    }
    void SetWrestleProgress(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_WrestleProgress = __Value;
        return;
    }
    int GetCountDownTime() const property
    {
        this.TrackPropertyRead(5);
        return this.m_CountDownTime;
    }
    void SetCountDownTime(const int __Value) property
    {
        if (this.m_CountDownTime == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_CountDownTime = __Value;
        return;
    }
    const float32 GetCountDownRemainSeconds() const property
    {
        const float32 __r;
        this.TrackPropertyRead(6);
        return __r;
    }
    float32 GetModify_CountDownRemainSeconds() property
    {
        float32 __r;
        this.MarkPropertyDirty(6);
        return __r;
    }
    void SetCountDownRemainSeconds(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_CountDownRemainSeconds = __Value;
        return;
    }
    ESlateVisibility GetbIsShow() const property
    {
        this.TrackPropertyRead(7);
        return this.m_bIsShow;
    }
    void SetbIsShow(const ESlateVisibility __Value) property
    {
        if (int(this.m_bIsShow) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(7);
        this.m_bIsShow = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_ArmWrestle_Progress
{
    UPROPERTY()
    TEUIModelRef<FVM_ArmWrestle_Progress> Self;

    __GeneratedProperties_FVM_ArmWrestle_Progress()
    {
        return;
    }
}

namespace FVM_ArmWrestle_Progress
{
FVM_ArmWrestle_Progress& Create(const UObject ContextObject)
{
    return FVM_ArmWrestle_Progress::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_ArmWrestle_Progress CreateByManager(const UEUIManagerSubsystem Manager)
{
    FVM_ArmWrestle_Progress __r;
    TEUIModelRef<FVM_ArmWrestle_Progress> local_6 = TEUIModelRef<FVM_ArmWrestle_Progress>(EUIInternal::MakeModelWithManager(Manager, FVM_ArmWrestle_Progress::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "DisplaySelfResults";
    local_14.TypeName = "TArray<FEUIModelRef>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "DisplayOpponentResults";
    local_14.TypeName = "TArray<FEUIModelRef>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "SelfWinTimes";
    local_14.TypeName = "int";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "OpponentWinTimes";
    local_14.TypeName = "int";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "WrestleProgress";
    local_14.TypeName = "float32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CountDownTime";
    local_14.TypeName = "int";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bIsShow";
    local_14.TypeName = "ESlateVisibility";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_ArmWrestle_Progress>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_ArmWrestle_Progress;
    FEUIModelEventDefine local_22;
    local_22.FunctionName = "__OnShowWrestleResult";
    local_22.EventType = FCE_ShowWrestleResultEvent;
    Result.EventFunctions.Add(local_22);
    local_22.FunctionName = "__OnBeginWrestle";
    local_22.EventType = FCE_BeginWrestleEvent;
    Result.EventFunctions.Add(local_22);
    Result.TickFunction.FunctionName = "__Tick";
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_ArmWrestle_Progress;
}
void __OnShowWrestleResult(FVM_ArmWrestle_Progress &inout Model, const FCE_ShowWrestleResultEvent &inout Event)
{
    Model.OnShowWrestleResult(Event);
    return;
}
void __OnBeginWrestle(FVM_ArmWrestle_Progress &inout Model, const FCE_BeginWrestleEvent &inout Event)
{
    Model.OnBeginWrestle(Event);
    return;
}
void __Tick(FVM_ArmWrestle_Progress &inout Model)
{
    Model.Tick();
    return;
}
TArray<FEUIModelRef> __UIGetter_DisplaySelfResults(const FVM_ArmWrestle_Progress &inout Model)
{
    return Model.GetDisplaySelfResults();
}
TArray<FEUIModelRef> __UIGetter_DisplayOpponentResults(const FVM_ArmWrestle_Progress &inout Model)
{
    return Model.GetDisplayOpponentResults();
}
int __UIGetter_SelfWinTimes(const FVM_ArmWrestle_Progress &inout Model)
{
    return Model.GetSelfWinTimes();
}
int __UIGetter_OpponentWinTimes(const FVM_ArmWrestle_Progress &inout Model)
{
    return Model.GetOpponentWinTimes();
}
float32 __UIGetter_WrestleProgress(const FVM_ArmWrestle_Progress &inout Model)
{
    return Model.GetWrestleProgress();
}
int __UIGetter_CountDownTime(const FVM_ArmWrestle_Progress &inout Model)
{
    return Model.GetCountDownTime();
}
ESlateVisibility __UIGetter_bIsShow(const FVM_ArmWrestle_Progress &inout Model)
{
    return Model.GetbIsShow();
}
TEUIModelRef<FVM_ArmWrestle_Progress> __UIGetter_Self(const FVM_ArmWrestle_Progress &inout Model)
{
    return TEUIModelRef<FVM_ArmWrestle_Progress>(Model);
}
int __IndexOf_DisplaySelfResults()
{
    return 0;
}
int __IndexOf_DisplayOpponentResults()
{
    return 1;
}
int __IndexOf_SelfWinTimes()
{
    return 2;
}
int __IndexOf_OpponentWinTimes()
{
    return 3;
}
int __IndexOf_WrestleProgress()
{
    return 4;
}
int __IndexOf_CountDownTime()
{
    return 5;
}
int __IndexOf_CountDownRemainSeconds()
{
    return 6;
}
int __IndexOf_bIsShow()
{
    return 7;
}
}
namespace __GeneratedProperties_FVM_ArmWrestle_Progress
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
