
namespace FVMS_ProgressOperation
{
    const int ModelId = 0;

}
struct FVMS_ProgressOperation : FEUIViewModelSingleton
{
    FEUIViewModelSingleton _base_FEUIViewModelSingleton;
    UPROPERTY()
    FECSEntity m_PlayerPawnEntity;
    UPROPERTY()
    FECSEntity m_TargetEntity;
    UPROPERTY()
    EProgressOperationState m_State;
    UPROPERTY()
    float32 m_CurValue;
    UPROPERTY()
    float32 m_MaxValue;
    UPROPERTY()
    float32 m_CurTime;
    UPROPERTY()
    float32 m_MaxTime;
    UPROPERTY()
    bool m_bIsInitiator;
    UPROPERTY()
    bool m_bIsLeave;
    UPROPERTY()
    float32 m_ValueProgress;
    UPROPERTY()
    float32 m_TimeProgress;
    UPROPERTY()
    FWidgetTransform m_PointerTrans;
    UPROPERTY()
    FEUIWidgetRef m_PageHandle;
    UPROPERTY()
    ESlateVisibility m_CanvasVisibility;
    UPROPERTY()
    FText m_ExecuteWolfHint;

    FVMS_ProgressOperation()
    {
        this.m_ValueProgress = 0.0f;
        this.m_TimeProgress = 0.0f;
        this.m_State = EProgressOperationState(0);
        this.m_CurValue = 0.0f;
        this.m_MaxValue = 100.0f;
        this.m_CurTime = 0.0f;
        this.m_MaxTime = 0.0f;
        this.m_bIsInitiator = false;
        this.m_bIsLeave = false;
        this.m_CanvasVisibility = ESlateVisibility(0);
        this.m_ExecuteWolfHint = NSLOCTEXT("QTE", "GlimmeringWolf_Hint", "ењЁйЂ‚еЅ“ж—¶жњєжЋ§е€¶з›®ж ‡пјЊйЃїе…Ќе…¶йЂѓи„±пјЃ");
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVMS_ProgressOperation(const FVMS_ProgressOperation &inout Other)
    {
        this.m_ValueProgress = 0.0f;
        this.m_TimeProgress = 0.0f;
        this.m_State = EProgressOperationState(0);
        this.m_CurValue = 0.0f;
        this.m_MaxValue = 100.0f;
        this.m_CurTime = 0.0f;
        this.m_MaxTime = 0.0f;
        this.m_bIsInitiator = false;
        this.m_bIsLeave = false;
        this.m_CanvasVisibility = ESlateVisibility(0);
        this.m_ExecuteWolfHint = NSLOCTEXT("QTE", "GlimmeringWolf_Hint", "ењЁйЂ‚еЅ“ж—¶жњєжЋ§е€¶з›®ж ‡пјЊйЃїе…Ќе…¶йЂѓи„±пјЃ");
        this.m_PlayerPawnEntity = Other.m_PlayerPawnEntity;
        this.m_TargetEntity = Other.m_TargetEntity;
        this.m_State = Other.m_State;
        this.m_CurValue = Other.m_CurValue;
        this.m_MaxValue = Other.m_MaxValue;
        this.m_CurTime = Other.m_CurTime;
        this.m_MaxTime = Other.m_MaxTime;
        this.m_bIsInitiator = Other.m_bIsInitiator;
        this.m_bIsLeave = Other.m_bIsLeave;
        this.m_ValueProgress = Other.m_ValueProgress;
        this.m_TimeProgress = Other.m_TimeProgress;
        this.m_PointerTrans = Other.m_PointerTrans;
        this.m_PageHandle = Other.m_PageHandle;
        this.m_CanvasVisibility = Other.m_CanvasVisibility;
        this.m_ExecuteWolfHint = Other.m_ExecuteWolfHint;
        return;
    }
    FVMS_ProgressOperation& opAssign(const FVMS_ProgressOperation &inout Other)
    {
        this.m_PlayerPawnEntity = Other.m_PlayerPawnEntity;
        this.m_TargetEntity = Other.m_TargetEntity;
        this.m_State = Other.m_State;
        this.m_CurValue = Other.m_CurValue;
        this.m_MaxValue = Other.m_MaxValue;
        this.m_CurTime = Other.m_CurTime;
        this.m_MaxTime = Other.m_MaxTime;
        this.m_bIsInitiator = Other.m_bIsInitiator;
        this.m_bIsLeave = Other.m_bIsLeave;
        this.m_ValueProgress = Other.m_ValueProgress;
        this.m_TimeProgress = Other.m_TimeProgress;
        this.m_PointerTrans = Other.m_PointerTrans;
        this.m_PageHandle = Other.m_PageHandle;
        this.m_CanvasVisibility = Other.m_CanvasVisibility;
        return Other.m_ExecuteWolfHint;
    }
    void OnMonitorProgressLocalPredicationHide(const FC_ProgressLocalPredicationHide &inout ProgressLocalPredicationHideTag)
    {
        int local_2;
        if (ProgressLocalPredicationHideTag.GetbHide())
        {
            int local_3;
            local_3 = 2;
            local_2 = local_3;
        }
        else
        {
            int local_3;
            local_3 = 0;
            local_2 = local_3;
        }
        this.SetCanvasVisibility(ESlateVisibility(local_2));
        return;
    }
    void Tick()
    {
        this.SetPlayerPawnEntity(::FASCommonUtils::GetUniqueAvatarPawnEntity(this.GetContext().GetLocalPlayerPawn()));
        if (this.GetPlayerPawnEntity().IsValid())
        {
            Get local_14;
            const FC_ProgressOperationMember& local_16 = local_14.opCall();
            if (local_16)
            {
                this.SetbIsInitiator(local_16.GetbIsInitiator());
                Get local_20;
                const FC_ProgressOperationRuntime& local_22 = local_20.opCall();
                if (local_22)
                {
                    this.SetTargetEntity(local_22.GetTargetEntity());
                    this.SetState(local_22.GetState());
                    this.SetCurValue(local_22.GetProgressValue());
                    this.SetMaxValue(local_22.GetProgressMaxValue());
                    this.SetCurTime(float32(local_22.GetCurTime().ToSeconds()));
                    this.SetMaxTime(float32(local_22.GetTotalTime().ToSeconds()));
                }
                Get local_30;
                const FC_ProgressOperationUIData& local_32 = local_30.opCall();
                if (local_32)
                {
                    this.SetPageHandle(local_32.PageHandle);
                }
            }
            else
            {
                Get local_36;
                const FC_ProgressOperationResult& local_38 = local_36.opCall();
                if (local_38)
                {
                    this.SetState(local_38.GetFinalState());
                    this.SetCurValue(local_38.GetFinalProgressValue());
                    this.SetMaxValue(local_38.GetFinalProgressMaxValue());
                    this.SetCurTime(local_38.GetFinalProgressTime());
                    this.SetMaxTime(local_38.GetFinalProgressTotalTime());
                    this.SetbIsLeave(local_38.GetbIsLeave());
                }
            }
            float32 local_24 = this.GetCurValue() / this.GetMaxValue();
            this.SetValueProgress(local_24);
            float32 local_39 = this.GetMaxTime();
            if (local_39 != 0.0f)
            {
                local_39 = this.GetCurTime();
                local_39 = local_39 - 0.5f;
                float32 local_40 = FMath::Clamp(local_39, 0.0f, (this.GetCurTime() - 0.5f));
                float32 local_24_3 = this.GetMaxTime();
                local_39 = this.GetMaxTime();
                local_39 = local_39 - 0.5f;
                local_24_3 = FMath::Clamp(local_39, 0.01f, local_24_3 - 0.5f);
                this.SetTimeProgress(local_40 / local_24_3);
            }
            if ((this.GetTimeProgress() * 360.0f) > 180.0f)
            {
                float32 local_41 = this.GetTimeProgress();
                this.GetModify_PointerTrans().Angle = (((local_41 * 360.0f) - 180.0f) - 180.0f);
                return;
            }
            this.GetModify_PointerTrans().Angle = (this.GetTimeProgress() * 360.0f);
        }
        return;
    }
    FECSEntity GetPlayerPawnEntity() const property
    {
        FECSEntity __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    FECSEntity GetModify_PlayerPawnEntity() property
    {
        FECSEntity __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetPlayerPawnEntity(const FECSEntity &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_PlayerPawnEntity = __Value;
        return;
    }
    const FECSEntity GetTargetEntity() const property
    {
        const FECSEntity __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    FECSEntity GetModify_TargetEntity() property
    {
        FECSEntity __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetTargetEntity(const FECSEntity &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_TargetEntity = __Value;
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
    const float32 GetCurValue() const property
    {
        const float32 __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    float32 GetModify_CurValue() property
    {
        float32 __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetCurValue(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_CurValue = __Value;
        return;
    }
    float32 GetMaxValue() const property
    {
        float32 __r;
        this.TrackPropertyRead(4);
        return __r;
    }
    float32 GetModify_MaxValue() property
    {
        float32 __r;
        this.MarkPropertyDirty(4);
        return __r;
    }
    void SetMaxValue(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_MaxValue = __Value;
        return;
    }
    const float32 GetCurTime() const property
    {
        const float32 __r;
        this.TrackPropertyRead(5);
        return __r;
    }
    float32 GetModify_CurTime() property
    {
        float32 __r;
        this.MarkPropertyDirty(5);
        return __r;
    }
    void SetCurTime(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_CurTime = __Value;
        return;
    }
    const float32 GetMaxTime() const property
    {
        const float32 __r;
        this.TrackPropertyRead(6);
        return __r;
    }
    float32 GetModify_MaxTime() property
    {
        float32 __r;
        this.MarkPropertyDirty(6);
        return __r;
    }
    void SetMaxTime(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_MaxTime = __Value;
        return;
    }
    bool GetbIsInitiator() const property
    {
        this.TrackPropertyRead(7);
        return this.m_bIsInitiator;
    }
    void SetbIsInitiator(const bool __Value) property
    {
        if (!(this.m_bIsInitiator) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(7);
        this.m_bIsInitiator = __Value;
        return;
    }
    bool GetbIsLeave() const property
    {
        this.TrackPropertyRead(8);
        return this.m_bIsLeave;
    }
    void SetbIsLeave(const bool __Value) property
    {
        if (!(this.m_bIsLeave) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(8);
        this.m_bIsLeave = __Value;
        return;
    }
    const float32 GetValueProgress() const property
    {
        const float32 __r;
        this.TrackPropertyRead(9);
        return __r;
    }
    float32 GetModify_ValueProgress() property
    {
        float32 __r;
        this.MarkPropertyDirty(9);
        return __r;
    }
    void SetValueProgress(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(9);
        this.m_ValueProgress = __Value;
        return;
    }
    const float32 GetTimeProgress() const property
    {
        const float32 __r;
        this.TrackPropertyRead(10);
        return __r;
    }
    float32 GetModify_TimeProgress() property
    {
        float32 __r;
        this.MarkPropertyDirty(10);
        return __r;
    }
    void SetTimeProgress(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(10);
        this.m_TimeProgress = __Value;
        return;
    }
    const FWidgetTransform GetPointerTrans() const property
    {
        const FWidgetTransform __r;
        this.TrackPropertyRead(11);
        return __r;
    }
    FWidgetTransform GetModify_PointerTrans() property
    {
        FWidgetTransform __r;
        this.MarkPropertyDirty(11);
        return __r;
    }
    void SetPointerTrans(const FWidgetTransform &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(11);
        this.m_PointerTrans = __Value;
        return;
    }
    const FEUIWidgetRef GetPageHandle() const property
    {
        const FEUIWidgetRef __r;
        this.TrackPropertyRead(12);
        return __r;
    }
    FEUIWidgetRef GetModify_PageHandle() property
    {
        FEUIWidgetRef __r;
        this.MarkPropertyDirty(12);
        return __r;
    }
    void SetPageHandle(const FEUIWidgetRef &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(12);
        this.m_PageHandle = __Value;
        return;
    }
    ESlateVisibility GetCanvasVisibility() const property
    {
        this.TrackPropertyRead(13);
        return this.m_CanvasVisibility;
    }
    void SetCanvasVisibility(const ESlateVisibility __Value) property
    {
        if (int(this.m_CanvasVisibility) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(13);
        this.m_CanvasVisibility = __Value;
        return;
    }
    const FText GetExecuteWolfHint() const property
    {
        const FText __r;
        this.TrackPropertyRead(14);
        return __r;
    }
    FText GetModify_ExecuteWolfHint() property
    {
        FText __r;
        this.MarkPropertyDirty(14);
        return __r;
    }
    void SetExecuteWolfHint(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(14);
        this.m_ExecuteWolfHint = __Value;
        return;
    }
}

struct __GeneratedProperties_FVMS_ProgressOperation
{
    UPROPERTY()
    TEUIModelRef<FVMS_ProgressOperation> Self;

    __GeneratedProperties_FVMS_ProgressOperation()
    {
        return;
    }
}

namespace FVMS_ProgressOperation
{
FVMS_ProgressOperation& Get(const UObject ContextObject)
{
    return FVMS_ProgressOperation::GetByManager(EUIInternal::GetContextManager(ContextObject));
}
FVMS_ProgressOperation GetByManager(const UEUIManagerSubsystem Manager)
{
    FVMS_ProgressOperation __r;
    TEUIModelRef<FVMS_ProgressOperation> local_6 = TEUIModelRef<FVMS_ProgressOperation>(EUIInternal::MakeModelWithManager(Manager, FVMS_ProgressOperation::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "ValueProgress";
    local_14.TypeName = "float32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "TimeProgress";
    local_14.TypeName = "float32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "PointerTrans";
    local_14.TypeName = "FWidgetTransform";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CanvasVisibility";
    local_14.TypeName = "ESlateVisibility";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ExecuteWolfHint";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVMS_ProgressOperation>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVMS_ProgressOperation;
    FEUIModelMonitorDefine local_26;
    local_26.FunctionName = "__OnMonitorProgressLocalPredicationHide";
    local_26.ComponentType = FC_ProgressLocalPredicationHide;
    Result.MonitorFunctions.Add(local_26);
    Result.TickFunction.FunctionName = "__Tick";
    return;
}
UScriptStruct GetModelStruct()
{
    return FVMS_ProgressOperation;
}
void __OnMonitorProgressLocalPredicationHide(FVMS_ProgressOperation &inout Model, const FECSEntity &inout Entity, const FC_ProgressLocalPredicationHide &inout Component)
{
    Model.OnMonitorProgressLocalPredicationHide(Component);
    return;
}
void __Tick(FVMS_ProgressOperation &inout Model)
{
    Model.Tick();
    return;
}
void __Register_Monitor__(const FECSWorldPtr &inout ECSWorld)
{
    // body not fully recovered вЂ” stub [argmismatch:argtype]
}
float32 __UIGetter_ValueProgress(const FVMS_ProgressOperation &inout Model)
{
    return Model.GetValueProgress();
}
float32 __UIGetter_TimeProgress(const FVMS_ProgressOperation &inout Model)
{
    return Model.GetTimeProgress();
}
FWidgetTransform __UIGetter_PointerTrans(const FVMS_ProgressOperation &inout Model)
{
    return Model.GetPointerTrans();
}
ESlateVisibility __UIGetter_CanvasVisibility(const FVMS_ProgressOperation &inout Model)
{
    return Model.GetCanvasVisibility();
}
FText __UIGetter_ExecuteWolfHint(const FVMS_ProgressOperation &inout Model)
{
    return Model.GetExecuteWolfHint();
}
TEUIModelRef<FVMS_ProgressOperation> __UIGetter_Self(const FVMS_ProgressOperation &inout Model)
{
    return TEUIModelRef<FVMS_ProgressOperation>(Model);
}
int __IndexOf_PlayerPawnEntity()
{
    return 0;
}
int __IndexOf_TargetEntity()
{
    return 1;
}
int __IndexOf_State()
{
    return 2;
}
int __IndexOf_CurValue()
{
    return 3;
}
int __IndexOf_MaxValue()
{
    return 4;
}
int __IndexOf_CurTime()
{
    return 5;
}
int __IndexOf_MaxTime()
{
    return 6;
}
int __IndexOf_bIsInitiator()
{
    return 7;
}
int __IndexOf_bIsLeave()
{
    return 8;
}
int __IndexOf_ValueProgress()
{
    return 9;
}
int __IndexOf_TimeProgress()
{
    return 10;
}
int __IndexOf_PointerTrans()
{
    return 11;
}
int __IndexOf_PageHandle()
{
    return 12;
}
int __IndexOf_CanvasVisibility()
{
    return 13;
}
int __IndexOf_ExecuteWolfHint()
{
    return 14;
}
}
namespace __GeneratedProperties_FVMS_ProgressOperation
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
