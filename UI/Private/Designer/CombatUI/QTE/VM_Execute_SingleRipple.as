
namespace FVM_Execute_SingleRipple
{
    const int ModelId = 0;

}
struct FVM_Execute_SingleRipple : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    EProgressOperationState m_State;
    UPROPERTY()
    FEUIWidgetRef m_PageHandle;
    UPROPERTY()
    float32 m_CurTime;
    UPROPERTY()
    float32 m_MaxTime;
    UPROPERTY()
    FText m_TapHint;

    FVM_Execute_SingleRipple()
    {
        this.m_State = EProgressOperationState(0);
        this.m_CurTime = 0.0f;
        this.m_MaxTime = 0.0f;
        this.m_TapHint = NSLOCTEXT("QTE", "SingleRipple_Hint", "ж‹је€Ђ");
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVM_Execute_SingleRipple(const FVM_Execute_SingleRipple &inout Other)
    {
        this.m_State = EProgressOperationState(0);
        this.m_CurTime = 0.0f;
        this.m_MaxTime = 0.0f;
        this.m_TapHint = NSLOCTEXT("QTE", "SingleRipple_Hint", "ж‹је€Ђ");
        this.m_State = Other.m_State;
        this.m_PageHandle = Other.m_PageHandle;
        this.m_CurTime = Other.m_CurTime;
        this.m_MaxTime = Other.m_MaxTime;
        this.m_TapHint = Other.m_TapHint;
        return;
    }
    FVM_Execute_SingleRipple& opAssign(const FVM_Execute_SingleRipple &inout Other)
    {
        this.m_State = Other.m_State;
        this.m_PageHandle = Other.m_PageHandle;
        this.m_CurTime = Other.m_CurTime;
        this.m_MaxTime = Other.m_MaxTime;
        return Other.m_TapHint;
    }
    void RefreshOperationState()
    {
        FECSEntity local_4 = FECSEntity(this.GetContext().GetLocalPlayerPawn());
        Get local_12;
        if (local_12.opCall())
        {
            Get local_20;
            const FC_ProgressOperationRuntime& local_22 = local_20.opCall();
            if (local_22)
            {
                this.SetState(local_22.GetState());
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
                this.SetState(local_40.GetFinalState());
                this.SetCurTime(local_40.GetFinalProgressTime());
                this.SetMaxTime(local_40.GetFinalProgressTotalTime());
            }
            else
            {
                this.SetState(EProgressOperationState(5));
            }
        }
        return;
    }
    EProgressOperationState GetState() const property
    {
        this.TrackPropertyRead(0);
        return this.m_State;
    }
    void SetState(const EProgressOperationState __Value) property
    {
        if (int(this.m_State) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_State = __Value;
        return;
    }
    const FEUIWidgetRef GetPageHandle() const property
    {
        const FEUIWidgetRef __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    FEUIWidgetRef GetModify_PageHandle() property
    {
        FEUIWidgetRef __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetPageHandle(const FEUIWidgetRef &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_PageHandle = __Value;
        return;
    }
    const float32 GetCurTime() const property
    {
        const float32 __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    float32 GetModify_CurTime() property
    {
        float32 __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetCurTime(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_CurTime = __Value;
        return;
    }
    const float32 GetMaxTime() const property
    {
        const float32 __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    float32 GetModify_MaxTime() property
    {
        float32 __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetMaxTime(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_MaxTime = __Value;
        return;
    }
    const FText GetTapHint() const property
    {
        const FText __r;
        this.TrackPropertyRead(4);
        return __r;
    }
    FText GetModify_TapHint() property
    {
        FText __r;
        this.MarkPropertyDirty(4);
        return __r;
    }
    void SetTapHint(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_TapHint = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_Execute_SingleRipple
{
    UPROPERTY()
    TEUIModelRef<FVM_Execute_SingleRipple> Self;

    __GeneratedProperties_FVM_Execute_SingleRipple()
    {
        return;
    }
}

namespace FVM_Execute_SingleRipple
{
FVM_Execute_SingleRipple& Create(const UObject ContextObject)
{
    return FVM_Execute_SingleRipple::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_Execute_SingleRipple CreateByManager(const UEUIManagerSubsystem Manager)
{
    FVM_Execute_SingleRipple __r;
    TEUIModelRef<FVM_Execute_SingleRipple> local_6 = TEUIModelRef<FVM_Execute_SingleRipple>(EUIInternal::MakeModelWithManager(Manager, FVM_Execute_SingleRipple::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "TapHint";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_Execute_SingleRipple>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_Execute_SingleRipple;
    FEUIModelEffectDefine local_20;
    local_20.FunctionName = "RefreshOperationState";
    Result.EffectFunctions.Add(local_20);
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_Execute_SingleRipple;
}
FText __UIGetter_TapHint(const FVM_Execute_SingleRipple &inout Model)
{
    return Model.GetTapHint();
}
TEUIModelRef<FVM_Execute_SingleRipple> __UIGetter_Self(const FVM_Execute_SingleRipple &inout Model)
{
    return TEUIModelRef<FVM_Execute_SingleRipple>(Model);
}
int __IndexOf_State()
{
    return 0;
}
int __IndexOf_PageHandle()
{
    return 1;
}
int __IndexOf_CurTime()
{
    return 2;
}
int __IndexOf_MaxTime()
{
    return 3;
}
int __IndexOf_TapHint()
{
    return 4;
}
}
namespace __GeneratedProperties_FVM_Execute_SingleRipple
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
