
namespace __INTENRAL_FC_ProgressOperationRuntime_NS
{
    const TECSComponentDerivedPtr<FC_ProgressOperationRuntime> DerivedPtr = TECSComponentDerivedPtr<FC_ProgressOperationRuntime>();
    const FC_ProgressOperationRuntime DefaultValue = FC_ProgressOperationRuntime();
}
namespace __INTENRAL_FC_ProgressOperationMember_NS
{
    const TECSComponentDerivedPtr<FC_ProgressOperationMember> DerivedPtr = TECSComponentDerivedPtr<FC_ProgressOperationMember>();
    const FC_ProgressOperationMember DefaultValue = FC_ProgressOperationMember();
}
namespace __INTENRAL_FC_ProgressOperationTarget_NS
{
    const TECSComponentDerivedPtr<FC_ProgressOperationTarget> DerivedPtr = TECSComponentDerivedPtr<FC_ProgressOperationTarget>();
    const FC_ProgressOperationTarget DefaultValue = FC_ProgressOperationTarget();
}
namespace __INTENRAL_FC_ProgressOperationResult_NS
{
    const TECSComponentDerivedPtr<FC_ProgressOperationResult> DerivedPtr = TECSComponentDerivedPtr<FC_ProgressOperationResult>();
    const FC_ProgressOperationResult DefaultValue = FC_ProgressOperationResult();
}
namespace __INTENRAL_FC_ProgressOperationUIData_NS
{
    const TECSComponentDerivedPtr<FC_ProgressOperationUIData> DerivedPtr = TECSComponentDerivedPtr<FC_ProgressOperationUIData>();
    const FC_ProgressOperationUIData DefaultValue = FC_ProgressOperationUIData();
}
namespace __INTENRAL_FC_ProgressLocalPredicationHide_NS
{
    const TECSComponentDerivedPtr<FC_ProgressLocalPredicationHide> DerivedPtr = TECSComponentDerivedPtr<FC_ProgressLocalPredicationHide>();
    const FC_ProgressLocalPredicationHide DefaultValue = FC_ProgressLocalPredicationHide();
}
namespace __INTENRAL_FCE_ProgressOerationEndEvent_NS
{
    const TECSEventDerivedPtr<FCE_ProgressOerationEndEvent> DerivedPtr = TECSEventDerivedPtr<FCE_ProgressOerationEndEvent>();

}
struct FC_ProgressOperationRuntime : FECSComponent
{
    FRootDirtyFlags16 __DirtyFlags;
    UPROPERTY()
    TDataObjectPtr<FProgressOperationConfig> m_Config;
    UPROPERTY()
    FECSEntity m_OperationEntity;
    UPROPERTY()
    FECSEntity m_InitiatorEntity;
    UPROPERTY()
    TArray<FECSEntity> m_ParticipantEntities;
    UPROPERTY()
    FECSEntity m_TargetEntity;
    UPROPERTY()
    float32 m_ProgressValueWhenAccurateInput;
    UPROPERTY()
    EProgressOperationState m_State;
    UPROPERTY()
    EProgressOperationState m_NextState;
    UPROPERTY()
    float32 m_ProgressValue;
    UPROPERTY()
    float32 m_ProgressMaxValue;
    UPROPERTY()
    float32 m_ProgressIncreseSpeed;
    UPROPERTY()
    FFPTime m_CurTime;
    UPROPERTY()
    FFPTime m_TotalTime;
    UPROPERTY()
    bool m_bLocalPrediction;

    FC_ProgressOperationRuntime()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_ProgressOperationRuntime(const FC_ProgressOperationRuntime &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_ProgressOperationRuntime opAssign(const FC_ProgressOperationRuntime &inout Other)
    {
        FC_ProgressOperationRuntime __r;
        this.SetConfig(Other.GetConfig());
        this.SetOperationEntity(Other.GetOperationEntity());
        this.SetInitiatorEntity(Other.GetInitiatorEntity());
        this.SetParticipantEntities(Other.GetParticipantEntities());
        this.SetTargetEntity(Other.GetTargetEntity());
        this.SetProgressValueWhenAccurateInput(Other.GetProgressValueWhenAccurateInput());
        this.SetState(Other.GetState());
        this.SetNextState(Other.GetNextState());
        this.SetProgressValue(Other.GetProgressValue());
        this.SetProgressMaxValue(Other.GetProgressMaxValue());
        this.SetProgressIncreseSpeed(Other.GetProgressIncreseSpeed());
        this.SetCurTime(Other.GetCurTime());
        this.SetTotalTime(Other.GetTotalTime());
        this.SetbLocalPrediction(Other.GetbLocalPrediction());
        return __r;
    }
    TDataObjectPtr<FProgressOperationConfig> GetConfig() const property
    {
        TDataObjectPtr<FProgressOperationConfig> __r;
        return __r;
    }
    TDataObjectPtr<FProgressOperationConfig> GetModify_Config() property
    {
        TDataObjectPtr<FProgressOperationConfig> __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetConfig(const TDataObjectPtr<FProgressOperationConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_Config = __Value;
        return;
    }
    const FECSEntity GetOperationEntity() const property
    {
        const FECSEntity __r;
        return __r;
    }
    FECSEntity GetModify_OperationEntity() property
    {
        FECSEntity __r;
        this.__MarkDirty(1);
        return __r;
    }
    void SetOperationEntity(const FECSEntity &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_OperationEntity = __Value;
        return;
    }
    const FECSEntity GetInitiatorEntity() const property
    {
        const FECSEntity __r;
        return __r;
    }
    FECSEntity GetModify_InitiatorEntity() property
    {
        FECSEntity __r;
        this.__MarkDirty(2);
        return __r;
    }
    void SetInitiatorEntity(const FECSEntity &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_InitiatorEntity = __Value;
        return;
    }
    const TArray<FECSEntity> GetParticipantEntities() const property
    {
        const TArray<FECSEntity> __r;
        return __r;
    }
    TArray<FECSEntity> GetModify_ParticipantEntities() property
    {
        TArray<FECSEntity> __r;
        this.__MarkDirty(3);
        return __r;
    }
    void SetParticipantEntities(const TArray<FECSEntity> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(3);
        this.m_ParticipantEntities = __Value;
        return;
    }
    const FECSEntity GetTargetEntity() const property
    {
        const FECSEntity __r;
        return __r;
    }
    FECSEntity GetModify_TargetEntity() property
    {
        FECSEntity __r;
        this.__MarkDirty(4);
        return __r;
    }
    void SetTargetEntity(const FECSEntity &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(4);
        this.m_TargetEntity = __Value;
        return;
    }
    float32 GetProgressValueWhenAccurateInput() const property
    {
        return this.m_ProgressValueWhenAccurateInput;
    }
    void SetProgressValueWhenAccurateInput(const float32 __Value) property
    {
        if (this.m_ProgressValueWhenAccurateInput == __Value)
        {
            return;
        }
        this.__MarkDirty(5);
        this.m_ProgressValueWhenAccurateInput = __Value;
        return;
    }
    EProgressOperationState GetState() const property
    {
        return this.m_State;
    }
    void SetState(const EProgressOperationState __Value) property
    {
        if (int(this.m_State) == int(__Value))
        {
            return;
        }
        this.__MarkDirty(6);
        this.m_State = __Value;
        return;
    }
    EProgressOperationState GetNextState() const property
    {
        return this.m_NextState;
    }
    void SetNextState(const EProgressOperationState __Value) property
    {
        if (int(this.m_NextState) == int(__Value))
        {
            return;
        }
        this.__MarkDirty(7);
        this.m_NextState = __Value;
        return;
    }
    float32 GetProgressValue() const property
    {
        return this.m_ProgressValue;
    }
    void SetProgressValue(const float32 __Value) property
    {
        if (this.m_ProgressValue == __Value)
        {
            return;
        }
        this.__MarkDirty(8);
        this.m_ProgressValue = __Value;
        return;
    }
    float32 GetProgressMaxValue() const property
    {
        return this.m_ProgressMaxValue;
    }
    void SetProgressMaxValue(const float32 __Value) property
    {
        if (this.m_ProgressMaxValue == __Value)
        {
            return;
        }
        this.__MarkDirty(9);
        this.m_ProgressMaxValue = __Value;
        return;
    }
    float32 GetProgressIncreseSpeed() const property
    {
        return this.m_ProgressIncreseSpeed;
    }
    void SetProgressIncreseSpeed(const float32 __Value) property
    {
        if (this.m_ProgressIncreseSpeed == __Value)
        {
            return;
        }
        this.__MarkDirty(10);
        this.m_ProgressIncreseSpeed = __Value;
        return;
    }
    const FFPTime GetCurTime() const property
    {
        const FFPTime __r;
        return __r;
    }
    FFPTime GetModify_CurTime() property
    {
        FFPTime __r;
        this.__MarkDirty(11);
        return __r;
    }
    void SetCurTime(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(11);
        this.m_CurTime = __Value;
        return;
    }
    const FFPTime GetTotalTime() const property
    {
        const FFPTime __r;
        return __r;
    }
    FFPTime GetModify_TotalTime() property
    {
        FFPTime __r;
        this.__MarkDirty(12);
        return __r;
    }
    void SetTotalTime(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(12);
        this.m_TotalTime = __Value;
        return;
    }
    bool GetbLocalPrediction() const property
    {
        return this.m_bLocalPrediction;
    }
    void SetbLocalPrediction(const bool __Value) property
    {
        if (!(this.m_bLocalPrediction) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(13);
        this.m_bLocalPrediction = __Value;
        return;
    }
}

struct FC_ProgressOperationMember : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    FECSEntity m_OperationEntity;
    UPROPERTY()
    TDataObjectPtr<FProgressOperationConfig> m_Config;
    UPROPERTY()
    bool m_bIsInitiator;

    FC_ProgressOperationMember()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_ProgressOperationMember(const FC_ProgressOperationMember &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_ProgressOperationMember opAssign(const FC_ProgressOperationMember &inout Other)
    {
        FC_ProgressOperationMember __r;
        this.SetOperationEntity(Other.GetOperationEntity());
        this.SetConfig(Other.GetConfig());
        this.SetbIsInitiator(Other.GetbIsInitiator());
        return __r;
    }
    const FECSEntity GetOperationEntity() const property
    {
        const FECSEntity __r;
        return __r;
    }
    FECSEntity GetModify_OperationEntity() property
    {
        FECSEntity __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetOperationEntity(const FECSEntity &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_OperationEntity = __Value;
        return;
    }
    TDataObjectPtr<FProgressOperationConfig> GetConfig() const property
    {
        TDataObjectPtr<FProgressOperationConfig> __r;
        return __r;
    }
    TDataObjectPtr<FProgressOperationConfig> GetModify_Config() property
    {
        TDataObjectPtr<FProgressOperationConfig> __r;
        this.__MarkDirty(1);
        return __r;
    }
    void SetConfig(const TDataObjectPtr<FProgressOperationConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_Config = __Value;
        return;
    }
    bool GetbIsInitiator() const property
    {
        return this.m_bIsInitiator;
    }
    void SetbIsInitiator(const bool __Value) property
    {
        if (!(this.m_bIsInitiator) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_bIsInitiator = __Value;
        return;
    }
}

struct FC_ProgressOperationTarget : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    FECSEntity m_OperationEntity;
    UPROPERTY()
    TDataObjectPtr<FProgressOperationConfig> m_Config;

    FC_ProgressOperationTarget()
    {
        this.__InitDirtyFlags();
        return;
    }
    FC_ProgressOperationTarget(const FC_ProgressOperationTarget &inout Other)
    {
        this.__InitDirtyFlags();
        this.m_OperationEntity = Other.m_OperationEntity;
        this.m_Config = Other.m_Config;
        return;
    }
    FC_ProgressOperationTarget opAssign(const FC_ProgressOperationTarget &inout Other)
    {
        FC_ProgressOperationTarget __r;
        this.SetOperationEntity(Other.GetOperationEntity());
        this.SetConfig(Other.GetConfig());
        return __r;
    }
    const FECSEntity GetOperationEntity() const property
    {
        const FECSEntity __r;
        return __r;
    }
    FECSEntity GetModify_OperationEntity() property
    {
        FECSEntity __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetOperationEntity(const FECSEntity &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_OperationEntity = __Value;
        return;
    }
    TDataObjectPtr<FProgressOperationConfig> GetConfig() const property
    {
        TDataObjectPtr<FProgressOperationConfig> __r;
        return __r;
    }
    TDataObjectPtr<FProgressOperationConfig> GetModify_Config() property
    {
        TDataObjectPtr<FProgressOperationConfig> __r;
        this.__MarkDirty(1);
        return __r;
    }
    void SetConfig(const TDataObjectPtr<FProgressOperationConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_Config = __Value;
        return;
    }
}

struct FCE_ProgressOerationEndEvent : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    EProgressOperationState FinalState = EProgressOperationState(3);
    UPROPERTY()
    float32 FinalProgressValue = 0.0f;
    UPROPERTY()
    float32 FinalProgressMaxValue = 0.0f;
    UPROPERTY()
    float32 FinalProgressTime = 0.0f;
    UPROPERTY()
    float32 FinalProgressTotalTime = 0.0f;


}

struct FC_ProgressOperationResult : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    EProgressOperationState m_FinalState;
    UPROPERTY()
    float32 m_FinalProgressValue;
    UPROPERTY()
    float32 m_FinalProgressMaxValue;
    UPROPERTY()
    float32 m_FinalProgressTime;
    UPROPERTY()
    float32 m_FinalProgressTotalTime;
    UPROPERTY()
    bool m_bIsLeave;

    FC_ProgressOperationResult()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_ProgressOperationResult(const FC_ProgressOperationResult &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_ProgressOperationResult opAssign(const FC_ProgressOperationResult &inout Other)
    {
        FC_ProgressOperationResult __r;
        this.SetFinalState(Other.GetFinalState());
        this.SetFinalProgressValue(Other.GetFinalProgressValue());
        this.SetFinalProgressMaxValue(Other.GetFinalProgressMaxValue());
        this.SetFinalProgressTime(Other.GetFinalProgressTime());
        this.SetFinalProgressTotalTime(Other.GetFinalProgressTotalTime());
        this.SetbIsLeave(Other.GetbIsLeave());
        return __r;
    }
    EProgressOperationState GetFinalState() const property
    {
        return this.m_FinalState;
    }
    void SetFinalState(const EProgressOperationState __Value) property
    {
        if (int(this.m_FinalState) == int(__Value))
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_FinalState = __Value;
        return;
    }
    float32 GetFinalProgressValue() const property
    {
        return this.m_FinalProgressValue;
    }
    void SetFinalProgressValue(const float32 __Value) property
    {
        if (this.m_FinalProgressValue == __Value)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_FinalProgressValue = __Value;
        return;
    }
    float32 GetFinalProgressMaxValue() const property
    {
        return this.m_FinalProgressMaxValue;
    }
    void SetFinalProgressMaxValue(const float32 __Value) property
    {
        if (this.m_FinalProgressMaxValue == __Value)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_FinalProgressMaxValue = __Value;
        return;
    }
    float32 GetFinalProgressTime() const property
    {
        return this.m_FinalProgressTime;
    }
    void SetFinalProgressTime(const float32 __Value) property
    {
        if (this.m_FinalProgressTime == __Value)
        {
            return;
        }
        this.__MarkDirty(3);
        this.m_FinalProgressTime = __Value;
        return;
    }
    float32 GetFinalProgressTotalTime() const property
    {
        return this.m_FinalProgressTotalTime;
    }
    void SetFinalProgressTotalTime(const float32 __Value) property
    {
        if (this.m_FinalProgressTotalTime == __Value)
        {
            return;
        }
        this.__MarkDirty(4);
        this.m_FinalProgressTotalTime = __Value;
        return;
    }
    bool GetbIsLeave() const property
    {
        return this.m_bIsLeave;
    }
    void SetbIsLeave(const bool __Value) property
    {
        if (!(this.m_bIsLeave) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(5);
        this.m_bIsLeave = __Value;
        return;
    }
}

struct FC_ProgressOperationUIData : FECSComponent
{
    UPROPERTY()
    TSoftClassPtr<UEUIUserWidget> UIWidgetClass;
    UPROPERTY()
    FEUIWidgetRef PageHandle;

    FC_ProgressOperationUIData()
    {
        return;
    }
}

struct FC_ProgressLocalPredicationHide : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    bool m_bHide;

    FC_ProgressLocalPredicationHide()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_ProgressLocalPredicationHide(const FC_ProgressLocalPredicationHide &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_ProgressLocalPredicationHide opAssign(const FC_ProgressLocalPredicationHide &inout Other)
    {
        FC_ProgressLocalPredicationHide __r;
        this.SetbHide(Other.GetbHide());
        return __r;
    }
    bool GetbHide() const property
    {
        return this.m_bHide;
    }
    void SetbHide(const bool __Value) property
    {
        if (!(this.m_bHide) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_bHide = __Value;
        return;
    }
}

namespace ECSFunc_FC_ProgressOperationRuntime
{
UFUNCTION()
bool HasProgressOperationRuntime(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_ProgressOperationRuntime);
}
FC_ProgressOperationRuntime& AssignProgressOperationRuntime(const FECSEntity &inout Entity, const FC_ProgressOperationRuntime &inout DefaultValue = FC_ProgressOperationRuntime())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_ProgressOperationRuntime, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignProgressOperationRuntime_BP(const FECSEntity &inout Entity, const FC_ProgressOperationRuntime &inout DefaultValue = FC_ProgressOperationRuntime())
{
    ECSFunc_FC_ProgressOperationRuntime::AssignProgressOperationRuntime(Entity, DefaultValue);
    return;
}
FC_ProgressOperationRuntime& ModifyProgressOperationRuntime(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_ProgressOperationRuntime));
    return local_12.GetComp();
}
FC_ProgressOperationRuntime& ModifyOrAddProgressOperationRuntime(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_ProgressOperationRuntime));
    return local_12.GetComp();
}
const FC_ProgressOperationRuntime& GetProgressOperationRuntime(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_ProgressOperationRuntime));
    return local_12.GetComp();
}
UFUNCTION()
FC_ProgressOperationRuntime GetProgressOperationRuntime_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_ProgressOperationRuntime& local_4 = ECSFunc_FC_ProgressOperationRuntime::GetProgressOperationRuntime(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_ProgressOperationRuntime();
}
const FC_ProgressOperationRuntime GetDefaultedProgressOperationRuntime(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_ProgressOperationRuntime __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_ProgressOperationRuntime);
    if ((local_10 == nullptr))
    {
    }
    else
    {
        local_14.InternalSet(local_10);
        return local_14.GetComp();
    }
    return __r;
}
UFUNCTION()
FC_ProgressOperationRuntime GetDefaultedProgressOperationRuntime_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_ProgressOperationRuntime::GetDefaultedProgressOperationRuntime(Entity);
}
UFUNCTION()
bool RemoveProgressOperationRuntime(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_ProgressOperationRuntime);
}
}
FECSMonitorRuntimeView __GetMonitorProgressOperationRuntimeOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_ProgressOperationRuntime, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorProgressOperationRuntimeOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_ProgressOperationRuntime, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorProgressOperationRuntimeOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_ProgressOperationRuntime, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorProgressOperationRuntimeOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_ProgressOperationRuntime, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorProgressOperationRuntimeOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_ProgressOperationRuntime, bFixedFrame, bMustHandleAll);
}
void __MonitorProgressOperationRuntimeLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_ProgressOperationRuntime, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorProgressOperationRuntimeActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_ProgressOperationRuntime, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorProgressOperationRuntimeModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_ProgressOperationRuntime, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_ProgressOperationMember
{
UFUNCTION()
bool HasProgressOperationMember(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_ProgressOperationMember);
}
FC_ProgressOperationMember& AssignProgressOperationMember(const FECSEntity &inout Entity, const FC_ProgressOperationMember &inout DefaultValue = FC_ProgressOperationMember())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_ProgressOperationMember, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignProgressOperationMember_BP(const FECSEntity &inout Entity, const FC_ProgressOperationMember &inout DefaultValue = FC_ProgressOperationMember())
{
    ECSFunc_FC_ProgressOperationMember::AssignProgressOperationMember(Entity, DefaultValue);
    return;
}
FC_ProgressOperationMember& ModifyProgressOperationMember(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_ProgressOperationMember));
    return local_12.GetComp();
}
FC_ProgressOperationMember& ModifyOrAddProgressOperationMember(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_ProgressOperationMember));
    return local_12.GetComp();
}
const FC_ProgressOperationMember& GetProgressOperationMember(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_ProgressOperationMember));
    return local_12.GetComp();
}
UFUNCTION()
FC_ProgressOperationMember GetProgressOperationMember_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_ProgressOperationMember& local_4 = ECSFunc_FC_ProgressOperationMember::GetProgressOperationMember(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_ProgressOperationMember();
}
const FC_ProgressOperationMember GetDefaultedProgressOperationMember(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_ProgressOperationMember __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_ProgressOperationMember);
    if ((local_10 == nullptr))
    {
    }
    else
    {
        local_14.InternalSet(local_10);
        return local_14.GetComp();
    }
    return __r;
}
UFUNCTION()
FC_ProgressOperationMember GetDefaultedProgressOperationMember_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_ProgressOperationMember::GetDefaultedProgressOperationMember(Entity);
}
UFUNCTION()
bool RemoveProgressOperationMember(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_ProgressOperationMember);
}
}
FECSMonitorRuntimeView __GetMonitorProgressOperationMemberOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_ProgressOperationMember, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorProgressOperationMemberOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_ProgressOperationMember, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorProgressOperationMemberOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_ProgressOperationMember, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorProgressOperationMemberOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_ProgressOperationMember, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorProgressOperationMemberOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_ProgressOperationMember, bFixedFrame, bMustHandleAll);
}
void __MonitorProgressOperationMemberLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_ProgressOperationMember, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorProgressOperationMemberActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_ProgressOperationMember, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorProgressOperationMemberModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_ProgressOperationMember, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_ProgressOperationTarget
{
UFUNCTION()
bool HasProgressOperationTarget(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_ProgressOperationTarget);
}
FC_ProgressOperationTarget& AssignProgressOperationTarget(const FECSEntity &inout Entity, const FC_ProgressOperationTarget &inout DefaultValue = FC_ProgressOperationTarget())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_ProgressOperationTarget, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignProgressOperationTarget_BP(const FECSEntity &inout Entity, const FC_ProgressOperationTarget &inout DefaultValue = FC_ProgressOperationTarget())
{
    ECSFunc_FC_ProgressOperationTarget::AssignProgressOperationTarget(Entity, DefaultValue);
    return;
}
FC_ProgressOperationTarget& ModifyProgressOperationTarget(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_ProgressOperationTarget));
    return local_12.GetComp();
}
FC_ProgressOperationTarget& ModifyOrAddProgressOperationTarget(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_ProgressOperationTarget));
    return local_12.GetComp();
}
const FC_ProgressOperationTarget& GetProgressOperationTarget(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_ProgressOperationTarget));
    return local_12.GetComp();
}
UFUNCTION()
FC_ProgressOperationTarget GetProgressOperationTarget_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_ProgressOperationTarget& local_4 = ECSFunc_FC_ProgressOperationTarget::GetProgressOperationTarget(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_ProgressOperationTarget();
}
const FC_ProgressOperationTarget GetDefaultedProgressOperationTarget(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_ProgressOperationTarget __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_ProgressOperationTarget);
    if ((local_10 == nullptr))
    {
    }
    else
    {
        local_14.InternalSet(local_10);
        return local_14.GetComp();
    }
    return __r;
}
UFUNCTION()
FC_ProgressOperationTarget GetDefaultedProgressOperationTarget_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_ProgressOperationTarget::GetDefaultedProgressOperationTarget(Entity);
}
UFUNCTION()
bool RemoveProgressOperationTarget(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_ProgressOperationTarget);
}
}
FECSMonitorRuntimeView __GetMonitorProgressOperationTargetOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_ProgressOperationTarget, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorProgressOperationTargetOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_ProgressOperationTarget, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorProgressOperationTargetOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_ProgressOperationTarget, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorProgressOperationTargetOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_ProgressOperationTarget, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorProgressOperationTargetOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_ProgressOperationTarget, bFixedFrame, bMustHandleAll);
}
void __MonitorProgressOperationTargetLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_ProgressOperationTarget, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorProgressOperationTargetActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_ProgressOperationTarget, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorProgressOperationTargetModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_ProgressOperationTarget, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_ProgressOperationResult
{
UFUNCTION()
bool HasProgressOperationResult(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_ProgressOperationResult);
}
FC_ProgressOperationResult& AssignProgressOperationResult(const FECSEntity &inout Entity, const FC_ProgressOperationResult &inout DefaultValue = FC_ProgressOperationResult())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_ProgressOperationResult, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignProgressOperationResult_BP(const FECSEntity &inout Entity, const FC_ProgressOperationResult &inout DefaultValue = FC_ProgressOperationResult())
{
    ECSFunc_FC_ProgressOperationResult::AssignProgressOperationResult(Entity, DefaultValue);
    return;
}
FC_ProgressOperationResult& ModifyProgressOperationResult(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_ProgressOperationResult));
    return local_12.GetComp();
}
FC_ProgressOperationResult& ModifyOrAddProgressOperationResult(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_ProgressOperationResult));
    return local_12.GetComp();
}
const FC_ProgressOperationResult& GetProgressOperationResult(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_ProgressOperationResult));
    return local_12.GetComp();
}
UFUNCTION()
FC_ProgressOperationResult GetProgressOperationResult_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_ProgressOperationResult& local_4 = ECSFunc_FC_ProgressOperationResult::GetProgressOperationResult(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_ProgressOperationResult();
}
const FC_ProgressOperationResult GetDefaultedProgressOperationResult(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_ProgressOperationResult __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_ProgressOperationResult);
    if ((local_10 == nullptr))
    {
    }
    else
    {
        local_14.InternalSet(local_10);
        return local_14.GetComp();
    }
    return __r;
}
UFUNCTION()
FC_ProgressOperationResult GetDefaultedProgressOperationResult_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_ProgressOperationResult::GetDefaultedProgressOperationResult(Entity);
}
UFUNCTION()
bool RemoveProgressOperationResult(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_ProgressOperationResult);
}
}
FECSMonitorRuntimeView __GetMonitorProgressOperationResultOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_ProgressOperationResult, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorProgressOperationResultOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_ProgressOperationResult, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorProgressOperationResultOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_ProgressOperationResult, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorProgressOperationResultOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_ProgressOperationResult, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorProgressOperationResultOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_ProgressOperationResult, bFixedFrame, bMustHandleAll);
}
void __MonitorProgressOperationResultLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_ProgressOperationResult, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorProgressOperationResultActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_ProgressOperationResult, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorProgressOperationResultModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_ProgressOperationResult, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_ProgressOperationUIData
{
UFUNCTION()
bool HasProgressOperationUIData(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_ProgressOperationUIData);
}
FC_ProgressOperationUIData& AssignProgressOperationUIData(const FECSEntity &inout Entity, const FC_ProgressOperationUIData &inout DefaultValue = FC_ProgressOperationUIData())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_ProgressOperationUIData, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignProgressOperationUIData_BP(const FECSEntity &inout Entity, const FC_ProgressOperationUIData &inout DefaultValue = FC_ProgressOperationUIData())
{
    ECSFunc_FC_ProgressOperationUIData::AssignProgressOperationUIData(Entity, DefaultValue);
    return;
}
FC_ProgressOperationUIData& ModifyProgressOperationUIData(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_ProgressOperationUIData));
    return local_12.GetComp();
}
FC_ProgressOperationUIData& ModifyOrAddProgressOperationUIData(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_ProgressOperationUIData));
    return local_12.GetComp();
}
const FC_ProgressOperationUIData& GetProgressOperationUIData(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_ProgressOperationUIData));
    return local_12.GetComp();
}
UFUNCTION()
FC_ProgressOperationUIData GetProgressOperationUIData_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_ProgressOperationUIData __r;
    bValid = false;
    bValid = ECSFunc_FC_ProgressOperationUIData::GetProgressOperationUIData(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_ProgressOperationUIData GetDefaultedProgressOperationUIData(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_ProgressOperationUIData __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_ProgressOperationUIData);
    if ((local_10 == nullptr))
    {
    }
    else
    {
        local_14.InternalSet(local_10);
        return local_14.GetComp();
    }
    return __r;
}
UFUNCTION()
FC_ProgressOperationUIData GetDefaultedProgressOperationUIData_BP(const FECSEntity &inout Entity)
{
    FC_ProgressOperationUIData __r;
    return __r;
}
UFUNCTION()
bool RemoveProgressOperationUIData(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_ProgressOperationUIData);
}
}
FECSMonitorRuntimeView __GetMonitorProgressOperationUIDataOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_ProgressOperationUIData, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorProgressOperationUIDataOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_ProgressOperationUIData, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorProgressOperationUIDataOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_ProgressOperationUIData, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorProgressOperationUIDataOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_ProgressOperationUIData, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorProgressOperationUIDataOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_ProgressOperationUIData, bFixedFrame, bMustHandleAll);
}
void __MonitorProgressOperationUIDataLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_ProgressOperationUIData, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorProgressOperationUIDataActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_ProgressOperationUIData, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorProgressOperationUIDataModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_ProgressOperationUIData, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_ProgressLocalPredicationHide
{
UFUNCTION()
bool HasProgressLocalPredicationHide(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_ProgressLocalPredicationHide);
}
FC_ProgressLocalPredicationHide& AssignProgressLocalPredicationHide(const FECSEntity &inout Entity, const FC_ProgressLocalPredicationHide &inout DefaultValue = FC_ProgressLocalPredicationHide())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_ProgressLocalPredicationHide, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignProgressLocalPredicationHide_BP(const FECSEntity &inout Entity, const FC_ProgressLocalPredicationHide &inout DefaultValue = FC_ProgressLocalPredicationHide())
{
    ECSFunc_FC_ProgressLocalPredicationHide::AssignProgressLocalPredicationHide(Entity, DefaultValue);
    return;
}
FC_ProgressLocalPredicationHide& ModifyProgressLocalPredicationHide(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_ProgressLocalPredicationHide));
    return local_12.GetComp();
}
FC_ProgressLocalPredicationHide& ModifyOrAddProgressLocalPredicationHide(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_ProgressLocalPredicationHide));
    return local_12.GetComp();
}
const FC_ProgressLocalPredicationHide& GetProgressLocalPredicationHide(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_ProgressLocalPredicationHide));
    return local_12.GetComp();
}
UFUNCTION()
FC_ProgressLocalPredicationHide GetProgressLocalPredicationHide_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_ProgressLocalPredicationHide& local_4 = ECSFunc_FC_ProgressLocalPredicationHide::GetProgressLocalPredicationHide(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_ProgressLocalPredicationHide();
}
const FC_ProgressLocalPredicationHide GetDefaultedProgressLocalPredicationHide(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_ProgressLocalPredicationHide __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_ProgressLocalPredicationHide);
    if ((local_10 == nullptr))
    {
    }
    else
    {
        local_14.InternalSet(local_10);
        return local_14.GetComp();
    }
    return __r;
}
UFUNCTION()
FC_ProgressLocalPredicationHide GetDefaultedProgressLocalPredicationHide_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_ProgressLocalPredicationHide::GetDefaultedProgressLocalPredicationHide(Entity);
}
UFUNCTION()
bool RemoveProgressLocalPredicationHide(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_ProgressLocalPredicationHide);
}
}
FECSMonitorRuntimeView __GetMonitorProgressLocalPredicationHideOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_ProgressLocalPredicationHide, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorProgressLocalPredicationHideOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_ProgressLocalPredicationHide, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorProgressLocalPredicationHideOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_ProgressLocalPredicationHide, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorProgressLocalPredicationHideOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_ProgressLocalPredicationHide, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorProgressLocalPredicationHideOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_ProgressLocalPredicationHide, bFixedFrame, bMustHandleAll);
}
void __MonitorProgressLocalPredicationHideLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_ProgressLocalPredicationHide, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorProgressLocalPredicationHideActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_ProgressLocalPredicationHide, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorProgressLocalPredicationHideModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_ProgressLocalPredicationHide, bFixedFrame, Details);
    return;
}
namespace AutoDelta
{
FRootDirtyFlags16 GetDirtyFlags(FC_ProgressOperationRuntime &inout Data)
{
    FRootDirtyFlags16 __r;
    return __r;
}
void InitDirtyFlags(FC_ProgressOperationRuntime &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_ProgressOperationRuntime &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_ProgressOperationRuntime
{
int __IndexOf_Config()
{
    return 0;
}
int __IndexOf_OperationEntity()
{
    return 1;
}
int __IndexOf_InitiatorEntity()
{
    return 2;
}
int __IndexOf_ParticipantEntities()
{
    return 3;
}
int __IndexOf_TargetEntity()
{
    return 4;
}
int __IndexOf_ProgressValueWhenAccurateInput()
{
    return 5;
}
int __IndexOf_State()
{
    return 6;
}
int __IndexOf_NextState()
{
    return 7;
}
int __IndexOf_ProgressValue()
{
    return 8;
}
int __IndexOf_ProgressMaxValue()
{
    return 9;
}
int __IndexOf_ProgressIncreseSpeed()
{
    return 10;
}
int __IndexOf_CurTime()
{
    return 11;
}
int __IndexOf_TotalTime()
{
    return 12;
}
int __IndexOf_bLocalPrediction()
{
    return 13;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_ProgressOperationMember &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_ProgressOperationMember &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_ProgressOperationMember &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_ProgressOperationMember
{
int __IndexOf_OperationEntity()
{
    return 0;
}
int __IndexOf_Config()
{
    return 1;
}
int __IndexOf_bIsInitiator()
{
    return 2;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_ProgressOperationTarget &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_ProgressOperationTarget &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_ProgressOperationTarget &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_ProgressOperationTarget
{
int __IndexOf_OperationEntity()
{
    return 0;
}
int __IndexOf_Config()
{
    return 1;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_ProgressOperationResult &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_ProgressOperationResult &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_ProgressOperationResult &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_ProgressOperationResult
{
int __IndexOf_FinalState()
{
    return 0;
}
int __IndexOf_FinalProgressValue()
{
    return 1;
}
int __IndexOf_FinalProgressMaxValue()
{
    return 2;
}
int __IndexOf_FinalProgressTime()
{
    return 3;
}
int __IndexOf_FinalProgressTotalTime()
{
    return 4;
}
int __IndexOf_bIsLeave()
{
    return 5;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_ProgressLocalPredicationHide &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_ProgressLocalPredicationHide &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_ProgressLocalPredicationHide &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_ProgressLocalPredicationHide
{
int __IndexOf_bHide()
{
    return 0;
}
}
