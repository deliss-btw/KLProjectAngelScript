
namespace FVM_Execute_InputPushProgress
{
    const int ModelId = 0;

}
struct FVM_Execute_InputPushProgress : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    float32 m_CurProgress;
    UPROPERTY()
    float32 m_CurProgressRatio;
    UPROPERTY()
    EProgressOperationState m_State;
    UPROPERTY()
    FEUIWidgetRef m_PageHandle;
    UPROPERTY()
    float32 m_CurTime;
    UPROPERTY()
    float32 m_MaxTime;
    UPROPERTY()
    FText m_RiderMutualClashHint;
    UPROPERTY()
    FText m_EscapeWolfCubHint;

    FVM_Execute_InputPushProgress()
    {
        this.m_CurProgress = 0.0f;
        this.m_CurProgressRatio = 0.0f;
        this.m_State = EProgressOperationState(0);
        this.m_CurTime = 0.0f;
        this.m_MaxTime = 0.0f;
        this.m_RiderMutualClashHint = NSLOCTEXT("QTE", "RiderMutualClash_Hint", "иїћз‚№дёЋж•Њдєєи§’еЉ›");
        this.m_EscapeWolfCubHint = NSLOCTEXT("QTE", "EscapeWolfCub_Hint", "иїћз‚№жЊЈи„±");
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVM_Execute_InputPushProgress(const FVM_Execute_InputPushProgress &inout Other)
    {
        this.m_CurProgress = 0.0f;
        this.m_CurProgressRatio = 0.0f;
        this.m_State = EProgressOperationState(0);
        this.m_CurTime = 0.0f;
        this.m_MaxTime = 0.0f;
        this.m_RiderMutualClashHint = NSLOCTEXT("QTE", "RiderMutualClash_Hint", "иїћз‚№дёЋж•Њдєєи§’еЉ›");
        this.m_EscapeWolfCubHint = NSLOCTEXT("QTE", "EscapeWolfCub_Hint", "иїћз‚№жЊЈи„±");
        this.m_CurProgress = Other.m_CurProgress;
        this.m_CurProgressRatio = Other.m_CurProgressRatio;
        this.m_State = Other.m_State;
        this.m_PageHandle = Other.m_PageHandle;
        this.m_CurTime = Other.m_CurTime;
        this.m_MaxTime = Other.m_MaxTime;
        this.m_RiderMutualClashHint = Other.m_RiderMutualClashHint;
        this.m_EscapeWolfCubHint = Other.m_EscapeWolfCubHint;
        return;
    }
    FVM_Execute_InputPushProgress& opAssign(const FVM_Execute_InputPushProgress &inout Other)
    {
        this.m_CurProgress = Other.m_CurProgress;
        this.m_CurProgressRatio = Other.m_CurProgressRatio;
        this.m_State = Other.m_State;
        this.m_PageHandle = Other.m_PageHandle;
        this.m_CurTime = Other.m_CurTime;
        this.m_MaxTime = Other.m_MaxTime;
        this.m_RiderMutualClashHint = Other.m_RiderMutualClashHint;
        return Other.m_EscapeWolfCubHint;
    }
    float32 GetProgressValue() const
    {
        return this.GetCurProgress();
    }
    float32 GetProgressRatio() const
    {
        return this.GetCurProgressRatio();
    }
    void Tick()
    {
        FECSEntity local_4 = FECSEntity(this.GetContext().GetLocalPlayerPawn());
        Get local_12;
        if (local_12.opCall())
        {
            Get local_20;
            const FC_ProgressOperationRuntime& local_22 = local_20.opCall();
            if (local_22)
            {
                this.SetState(EProgressOperationState(local_22.GetState()));
                this.SetCurProgress(local_22.GetProgressValue());
                float32 local_24 = local_22.GetProgressValue();
                float32 local_25 = local_22.GetProgressMaxValue();
                local_24 = local_24 / local_25;
                this.SetCurProgressRatio(local_25);
                this.SetCurTime(float32(local_22.GetCurTime().ToSeconds()));
                this.SetMaxTime(float32(local_22.GetTotalTime().ToSeconds()));
            }
            Get local_32;
            const FC_ProgressOperationUIData& local_34 = local_32.opCall();
            if (local_34)
            {
                this.SetPageHandle(local_34.PageHandle);
            }
        }
        else
        {
            Get local_38;
            const FC_ProgressOperationResult& local_40 = local_38.opCall();
            if (local_40)
            {
                this.SetState(EProgressOperationState(local_40.GetFinalState()));
                this.SetCurTime(local_40.GetFinalProgressTime());
                this.SetMaxTime(local_40.GetFinalProgressTotalTime());
                this.SetCurProgress(local_40.GetFinalProgressValue());
                if ((int(local_40.GetFinalState())) == 3)
                {
                    this.SetCurProgressRatio(1.0f);
                }
            }
            else
            {
                this.SetState(EProgressOperationState(EProgressOperationState(5)));
            }
        }
        return;
    }
    const float32 GetCurProgress() const property
    {
        const float32 __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    float32 GetModify_CurProgress() property
    {
        float32 __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetCurProgress(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_CurProgress = __Value;
        return;
    }
    const float32 GetCurProgressRatio() const property
    {
        const float32 __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    float32 GetModify_CurProgressRatio() property
    {
        float32 __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetCurProgressRatio(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_CurProgressRatio = __Value;
        return;
    }
    EProgressOperationState GetState() const property
    {
        this.TrackPropertyRead(2);
        return this.m_State;
    }
    void SetState(const EProgressOperationState __Value) property
    {
        if (int(this.m_State) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_State = __Value;
        return;
    }
    const FEUIWidgetRef GetPageHandle() const property
    {
        const FEUIWidgetRef __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    FEUIWidgetRef GetModify_PageHandle() property
    {
        FEUIWidgetRef __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetPageHandle(const FEUIWidgetRef &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_PageHandle = __Value;
        return;
    }
    const float32 GetCurTime() const property
    {
        const float32 __r;
        this.TrackPropertyRead(4);
        return __r;
    }
    float32 GetModify_CurTime() property
    {
        float32 __r;
        this.MarkPropertyDirty(4);
        return __r;
    }
    void SetCurTime(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_CurTime = __Value;
        return;
    }
    const float32 GetMaxTime() const property
    {
        const float32 __r;
        this.TrackPropertyRead(5);
        return __r;
    }
    float32 GetModify_MaxTime() property
    {
        float32 __r;
        this.MarkPropertyDirty(5);
        return __r;
    }
    void SetMaxTime(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_MaxTime = __Value;
        return;
    }
    const FText GetRiderMutualClashHint() const property
    {
        const FText __r;
        this.TrackPropertyRead(6);
        return __r;
    }
    FText GetModify_RiderMutualClashHint() property
    {
        FText __r;
        this.MarkPropertyDirty(6);
        return __r;
    }
    void SetRiderMutualClashHint(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_RiderMutualClashHint = __Value;
        return;
    }
    const FText GetEscapeWolfCubHint() const property
    {
        const FText __r;
        this.TrackPropertyRead(7);
        return __r;
    }
    FText GetModify_EscapeWolfCubHint() property
    {
        FText __r;
        this.MarkPropertyDirty(7);
        return __r;
    }
    void SetEscapeWolfCubHint(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(7);
        this.m_EscapeWolfCubHint = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_Execute_InputPushProgress
{
    UPROPERTY()
    float32 ProgressValue;
    UPROPERTY()
    float32 ProgressRatio;
    UPROPERTY()
    TEUIModelRef<FVM_Execute_InputPushProgress> Self;


}

namespace FVM_Execute_InputPushProgress
{
FVM_Execute_InputPushProgress& Create(const UObject ContextObject)
{
    return FVM_Execute_InputPushProgress::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_Execute_InputPushProgress CreateByManager(const UEUIManagerSubsystem Manager)
{
    FVM_Execute_InputPushProgress __r;
    TEUIModelRef<FVM_Execute_InputPushProgress> local_6 = TEUIModelRef<FVM_Execute_InputPushProgress>(EUIInternal::MakeModelWithManager(Manager, FVM_Execute_InputPushProgress::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "RiderMutualClashHint";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "EscapeWolfCubHint";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ProgressValue";
    local_14.TypeName = "float32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ProgressRatio";
    local_14.TypeName = "float32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_Execute_InputPushProgress>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_Execute_InputPushProgress;
    Result.TickFunction.FunctionName = "__Tick";
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_Execute_InputPushProgress;
}
void __Tick(FVM_Execute_InputPushProgress &inout Model)
{
    Model.Tick();
    return;
}
FText __UIGetter_RiderMutualClashHint(const FVM_Execute_InputPushProgress &inout Model)
{
    return Model.GetRiderMutualClashHint();
}
FText __UIGetter_EscapeWolfCubHint(const FVM_Execute_InputPushProgress &inout Model)
{
    return Model.GetEscapeWolfCubHint();
}
float32 __UIGetter_ProgressValue(const FVM_Execute_InputPushProgress &inout Model)
{
    return Model.GetProgressValue();
}
float32 __UIGetter_ProgressRatio(const FVM_Execute_InputPushProgress &inout Model)
{
    return Model.GetProgressRatio();
}
TEUIModelRef<FVM_Execute_InputPushProgress> __UIGetter_Self(const FVM_Execute_InputPushProgress &inout Model)
{
    return TEUIModelRef<FVM_Execute_InputPushProgress>(Model);
}
int __IndexOf_CurProgress()
{
    return 0;
}
int __IndexOf_CurProgressRatio()
{
    return 1;
}
int __IndexOf_State()
{
    return 2;
}
int __IndexOf_PageHandle()
{
    return 3;
}
int __IndexOf_CurTime()
{
    return 4;
}
int __IndexOf_MaxTime()
{
    return 5;
}
int __IndexOf_RiderMutualClashHint()
{
    return 6;
}
int __IndexOf_EscapeWolfCubHint()
{
    return 7;
}
}
namespace __GeneratedProperties_FVM_Execute_InputPushProgress
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
