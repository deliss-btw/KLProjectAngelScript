
namespace __INTENRAL_FC_PresentationCameraLookAt_NS
{
    const TECSComponentDerivedPtr<FC_PresentationCameraLookAt> DerivedPtr = TECSComponentDerivedPtr<FC_PresentationCameraLookAt>();
    const FC_PresentationCameraLookAt DefaultValue = FC_PresentationCameraLookAt();
}
namespace __INTENRAL_FC_LogicCachePresentationCameraModificationContext_NS
{
    const TECSComponentDerivedPtr<FC_LogicCachePresentationCameraModificationContext> DerivedPtr = TECSComponentDerivedPtr<FC_LogicCachePresentationCameraModificationContext>();
    const FC_LogicCachePresentationCameraModificationContext DefaultValue = FC_LogicCachePresentationCameraModificationContext();
}
namespace __INTENRAL_FC_PresentationCameraModificationContext_NS
{
    const TECSComponentDerivedPtr<FC_PresentationCameraModificationContext> DerivedPtr = TECSComponentDerivedPtr<FC_PresentationCameraModificationContext>();
    const FC_PresentationCameraModificationContext DefaultValue = FC_PresentationCameraModificationContext();
}
namespace __INTENRAL_FC_LogicPresentationCameraModificationEventChangeTag_NS
{
    const TECSComponentDerivedPtr<FC_LogicPresentationCameraModificationEventChangeTag> DerivedPtr = TECSComponentDerivedPtr<FC_LogicPresentationCameraModificationEventChangeTag>();
    const FC_LogicPresentationCameraModificationEventChangeTag DefaultValue = FC_LogicPresentationCameraModificationEventChangeTag();

}
struct FPresentationCameraLookAtParams
{
    FSubDirtyFlags16 __DirtyFlags;
    UPROPERTY()
    FECSEntity m_LookAtTargetEntity;
    UPROPERTY()
    FName m_LookAtTargetSocketName;
    UPROPERTY()
    FVector3f m_LookAtSocketOffset = FVector3f::ZeroVector;
    UPROPERTY()
    bool m_bOverrideWorldDir = false;
    UPROPERTY()
    FVector3f m_OverrideWorldDir = FVector3f::ZeroVector;
    UPROPERTY()
    FVector m_Location = FVector::ZeroVector;
    UPROPERTY()
    FVector3f m_LocationOffset = FVector3f::ZeroVector;
    UPROPERTY()
    FVector m_SmoothedLocation = FVector::ZeroVector;
    UPROPERTY()
    float32 m_PitchCompensation = 0.0f;
    UPROPERTY()
    FDataObjectPtr m_LookAtTargetConfigRef;
    UPROPERTY()
    bool m_bContributeInput = false;
    UPROPERTY()
    FFPTime m_RequestTime;
    UPROPERTY()
    bool m_bValid = false;

    FPresentationCameraLookAtParams(const FPresentationCameraLookAtParams &inout Other)
    {
        this.m_LookAtTargetEntity = Other.m_LookAtTargetEntity;
        this.m_LookAtTargetSocketName = Other.m_LookAtTargetSocketName;
        this.m_LookAtSocketOffset = Other.m_LookAtSocketOffset;
        this.m_bOverrideWorldDir = Other.m_bOverrideWorldDir;
        this.m_OverrideWorldDir = Other.m_OverrideWorldDir;
        this.m_Location = Other.m_Location;
        this.m_LocationOffset = Other.m_LocationOffset;
        this.m_SmoothedLocation = Other.m_SmoothedLocation;
        this.m_PitchCompensation = Other.m_PitchCompensation;
        this.m_LookAtTargetConfigRef = Other.m_LookAtTargetConfigRef;
        this.m_bContributeInput = Other.m_bContributeInput;
        this.m_RequestTime = Other.m_RequestTime;
        this.m_bValid = Other.m_bValid;
        return;
    }
    FPresentationCameraLookAtParams opAssign(const FPresentationCameraLookAtParams &inout Other)
    {
        FPresentationCameraLookAtParams __r;
        this.SetLookAtTargetEntity(Other.GetLookAtTargetEntity());
        this.SetLookAtTargetSocketName(Other.GetLookAtTargetSocketName());
        this.SetLookAtSocketOffset(Other.GetLookAtSocketOffset());
        this.SetbOverrideWorldDir(Other.GetbOverrideWorldDir());
        this.SetOverrideWorldDir(Other.GetOverrideWorldDir());
        this.SetLocation(Other.GetLocation());
        this.SetLocationOffset(Other.GetLocationOffset());
        this.SetSmoothedLocation(Other.GetSmoothedLocation());
        this.SetPitchCompensation(Other.GetPitchCompensation());
        this.SetLookAtTargetConfigRef(Other.GetLookAtTargetConfigRef());
        this.SetbContributeInput(Other.GetbContributeInput());
        this.SetRequestTime(Other.GetRequestTime());
        this.SetbValid(Other.GetbValid());
        return __r;
    }
    bool IsValid() const
    {
        return this.GetbValid() && this.GetLookAtTargetConfigRef().IsValid();
    }
    void SetValid(const bool IValid)
    {
        this.SetbValid(IValid);
        return;
    }
    void CopyFrom(const FPresentationCameraLookAtParams &inout Other)
    {
        this.SetLookAtTargetEntity(Other.GetLookAtTargetEntity());
        this.SetLookAtTargetSocketName(Other.GetLookAtTargetSocketName());
        this.SetLookAtSocketOffset(Other.GetLookAtSocketOffset());
        this.SetLocation(Other.GetLocation());
        this.SetLocationOffset(Other.GetLocationOffset());
        this.SetPitchCompensation(Other.GetPitchCompensation());
        this.SetLookAtTargetConfigRef(Other.GetLookAtTargetConfigRef());
        this.SetbContributeInput(Other.GetbContributeInput());
        this.SetRequestTime(Other.GetRequestTime());
        this.SetbOverrideWorldDir(Other.GetbOverrideWorldDir());
        this.SetOverrideWorldDir(Other.GetOverrideWorldDir());
        return;
    }
    const FECSEntity GetLookAtTargetEntity() const property
    {
        const FECSEntity __r;
        return __r;
    }
    FECSEntity GetModify_LookAtTargetEntity() property
    {
        FECSEntity __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetLookAtTargetEntity(const FECSEntity &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_LookAtTargetEntity = __Value;
        return;
    }
    FName GetLookAtTargetSocketName() const property
    {
        return this.m_LookAtTargetSocketName;
    }
    void SetLookAtTargetSocketName(const FName &inout __Value) property
    {
        if ((this.m_LookAtTargetSocketName == __Value))
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_LookAtTargetSocketName = __Value;
        return;
    }
    const FVector3f GetLookAtSocketOffset() const property
    {
        const FVector3f __r;
        return __r;
    }
    FVector3f GetModify_LookAtSocketOffset() property
    {
        FVector3f __r;
        this.__MarkDirty(2);
        return __r;
    }
    void SetLookAtSocketOffset(const FVector3f &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_LookAtSocketOffset = __Value;
        return;
    }
    bool GetbOverrideWorldDir() const property
    {
        return this.m_bOverrideWorldDir;
    }
    void SetbOverrideWorldDir(const bool __Value) property
    {
        if (!(this.m_bOverrideWorldDir) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(3);
        this.m_bOverrideWorldDir = __Value;
        return;
    }
    const FVector3f GetOverrideWorldDir() const property
    {
        const FVector3f __r;
        return __r;
    }
    FVector3f GetModify_OverrideWorldDir() property
    {
        FVector3f __r;
        this.__MarkDirty(4);
        return __r;
    }
    void SetOverrideWorldDir(const FVector3f &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(4);
        this.m_OverrideWorldDir = __Value;
        return;
    }
    FVector GetLocation() const property
    {
        FVector __r;
        return __r;
    }
    FVector GetModify_Location() property
    {
        FVector __r;
        this.__MarkDirty(5);
        return __r;
    }
    void SetLocation(const FVector &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(5);
        this.m_Location = __Value;
        return;
    }
    const FVector3f GetLocationOffset() const property
    {
        const FVector3f __r;
        return __r;
    }
    FVector3f GetModify_LocationOffset() property
    {
        FVector3f __r;
        this.__MarkDirty(6);
        return __r;
    }
    void SetLocationOffset(const FVector3f &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(6);
        this.m_LocationOffset = __Value;
        return;
    }
    const FVector GetSmoothedLocation() const property
    {
        const FVector __r;
        return __r;
    }
    FVector GetModify_SmoothedLocation() property
    {
        FVector __r;
        this.__MarkDirty(7);
        return __r;
    }
    void SetSmoothedLocation(const FVector &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(7);
        this.m_SmoothedLocation = __Value;
        return;
    }
    float32 GetPitchCompensation() const property
    {
        return this.m_PitchCompensation;
    }
    void SetPitchCompensation(const float32 __Value) property
    {
        if (this.m_PitchCompensation == __Value)
        {
            return;
        }
        this.__MarkDirty(8);
        this.m_PitchCompensation = __Value;
        return;
    }
    const FDataObjectPtr GetLookAtTargetConfigRef() const property
    {
        const FDataObjectPtr __r;
        return __r;
    }
    FDataObjectPtr GetModify_LookAtTargetConfigRef() property
    {
        FDataObjectPtr __r;
        this.__MarkDirty(9);
        return __r;
    }
    void SetLookAtTargetConfigRef(const FDataObjectPtr &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(9);
        this.m_LookAtTargetConfigRef = __Value;
        return;
    }
    bool GetbContributeInput() const property
    {
        return this.m_bContributeInput;
    }
    void SetbContributeInput(const bool __Value) property
    {
        if (!(this.m_bContributeInput) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(10);
        this.m_bContributeInput = __Value;
        return;
    }
    const FFPTime GetRequestTime() const property
    {
        const FFPTime __r;
        return __r;
    }
    FFPTime GetModify_RequestTime() property
    {
        FFPTime __r;
        this.__MarkDirty(11);
        return __r;
    }
    void SetRequestTime(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(11);
        this.m_RequestTime = __Value;
        return;
    }
    bool GetbValid() const property
    {
        return this.m_bValid;
    }
    void SetbValid(const bool __Value) property
    {
        if (!(this.m_bValid) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(12);
        this.m_bValid = __Value;
        return;
    }
}

struct FPresentationCameraLookAtRuntimeData
{
    UPROPERTY()
    bool bHasBaseDir = false;
    UPROPERTY()
    FRotator3f BaseDir = FRotator3f::ZeroRotator;
    UPROPERTY()
    FRotator3f DirVelocity = FRotator3f::ZeroRotator;
    UPROPERTY()
    float32 ArmLengthRatioFromLookAtTarget = 1.0f;
    UPROPERTY()
    FVector3f FollowTargetOffsetFromLookAt = FVector3f::ZeroVector;
    UPROPERTY()
    float32 LookAtTargetBlend = 1.0f;


}

struct FC_PresentationCameraLookAt : FECSComponent
{
    UPROPERTY()
    FPresentationCameraLookAtParams LookAtParams;

    FC_PresentationCameraLookAt()
    {
        return;
    }
}

struct FPresentationCameraModifierRuntimeData
{
    UPROPERTY()
    TArray<FTPCameraModifierInstance> ActiveModifiers;
    UPROPERTY()
    TArray<int> ModifierTickOrder;

    FPresentationCameraModifierRuntimeData()
    {
        return;
    }
}

struct FPresentationCameraModificationParams
{
    FSubDirtyFlags16 __DirtyFlags;
    UPROPERTY()
    FPresentationCameraLookAtParams m_LookAtParams;
    UPROPERTY()
    TArray<FInstancedStruct> m_PendingCameraModifierEventDatas;

    FPresentationCameraModificationParams()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FPresentationCameraModificationParams(const FPresentationCameraModificationParams &inout Other)
    {
        this.m_LookAtParams = Other.m_LookAtParams;
        this.m_PendingCameraModifierEventDatas = Other.m_PendingCameraModifierEventDatas;
        return;
    }
    FPresentationCameraModificationParams opAssign(const FPresentationCameraModificationParams &inout Other)
    {
        FPresentationCameraModificationParams __r;
        this.SetLookAtParams(Other.GetLookAtParams());
        this.SetPendingCameraModifierEventDatas(Other.GetPendingCameraModifierEventDatas());
        return __r;
    }
    const FPresentationCameraLookAtParams GetLookAtParams() const property
    {
        const FPresentationCameraLookAtParams __r;
        return __r;
    }
    FPresentationCameraLookAtParams GetLookAtParams() property
    {
        FPresentationCameraLookAtParams __r;
        return __r;
    }
    void SetLookAtParams(const FPresentationCameraLookAtParams &inout __Value) property
    {
        this.m_LookAtParams = __Value;
        return;
    }
    const TArray<FInstancedStruct> GetPendingCameraModifierEventDatas() const property
    {
        const TArray<FInstancedStruct> __r;
        return __r;
    }
    TArray<FInstancedStruct> GetPendingCameraModifierEventDatas() property
    {
        TArray<FInstancedStruct> __r;
        return __r;
    }
    void SetPendingCameraModifierEventDatas(const TArray<FInstancedStruct> &inout __Value) property
    {
        this.m_PendingCameraModifierEventDatas = __Value;
        return;
    }
}

struct FC_LogicCachePresentationCameraModificationContext : FECSComponent
{
    FRootDirtyFlags16 __DirtyFlags;
    UPROPERTY()
    FPresentationCameraModificationParams m_Params;

    FC_LogicCachePresentationCameraModificationContext()
    {
        this.__InitDirtyFlags();
        return;
    }
    FC_LogicCachePresentationCameraModificationContext(const FC_LogicCachePresentationCameraModificationContext &inout Other)
    {
        this.__InitDirtyFlags();
        this.m_Params = Other.m_Params;
        return;
    }
    FC_LogicCachePresentationCameraModificationContext opAssign(const FC_LogicCachePresentationCameraModificationContext &inout Other)
    {
        FC_LogicCachePresentationCameraModificationContext __r;
        this.SetParams(Other.GetParams());
        return __r;
    }
    FPresentationCameraModificationParams GetParams() const property
    {
        FPresentationCameraModificationParams __r;
        return __r;
    }
    FPresentationCameraModificationParams GetParams() property
    {
        FPresentationCameraModificationParams __r;
        return __r;
    }
    void SetParams(const FPresentationCameraModificationParams &inout __Value) property
    {
        this.m_Params = __Value;
        return;
    }
}

struct FC_PresentationCameraModificationContext : FECSComponent
{
    UPROPERTY()
    FPresentationCameraModificationParams Params;
    UPROPERTY()
    FPresentationCameraLookAtRuntimeData LookAtRuntime;
    UPROPERTY()
    FPresentationCameraModifierRuntimeData CameraModifierCollection;

    FC_PresentationCameraModificationContext()
    {
        return;
    }
}

struct FCameraModifierEventData_PresentationCameraLookAtTarget
{
    UPROPERTY()
    FECSEntity LookAtTargetEntity;
    UPROPERTY()
    FVector LookAtSocketOffset;
    UPROPERTY()
    FName LookAtTargetSocketName;
    UPROPERTY()
    bool bContributeInput = false;
    UPROPERTY()
    bool bOverrideWorldDir = false;
    UPROPERTY()
    FVector OverrideWorldDir = FVector::ZeroVector;
    UPROPERTY()
    TDataObjectPtr<FCameraLookAtTargetConfig> LookAtConfig;
    UPROPERTY()
    FFPTime RequestTime;


}

struct FCameraModifierEventData_PresentationCameraLookAtLocation
{
    UPROPERTY()
    FVector Location;
    UPROPERTY()
    FVector LocationOffset;
    UPROPERTY()
    bool bContributeInput = false;
    UPROPERTY()
    TDataObjectPtr<FCameraLookAtTargetConfig> LookAtConfig;
    UPROPERTY()
    FFPTime RequestTime;


}

struct FCameraModifierEventData_ClearPresentationCameraLookAt
{
    FCameraModifierEventData_ClearPresentationCameraLookAt()
    {
        return;
    }
}

struct FCameraModifierEventData_StartPresentationModifier
{
    UPROPERTY()
    FECSEntity TargetEntity;
    UPROPERTY()
    FName SourceIdentifier;
    UPROPERTY()
    FTPCameraModifierConfigRef ModifierConfig;
    UPROPERTY()
    float32 OverrideEnterDuration = -1.0f;
    UPROPERTY()
    FFPTime RequestTime;


}

struct FCameraModifierEventData_StopPresentationModifier
{
    UPROPERTY()
    FECSEntity TargetEntity;
    UPROPERTY()
    FName SourceIdentifier;
    UPROPERTY()
    FTPCameraModifierConfigRef ModifierConfig;
    UPROPERTY()
    float32 OverrideExitDuration = -1.0f;
    UPROPERTY()
    bool bWarnIfNotExists = true;
    UPROPERTY()
    FFPTime RequestTime;


}

struct FC_LogicPresentationCameraModificationEventChangeTag : FECSComponent
{
    FC_LogicPresentationCameraModificationEventChangeTag()
    {
        return;
    }
}

namespace ECSFunc_FC_PresentationCameraLookAt
{
UFUNCTION()
bool HasPresentationCameraLookAt(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_PresentationCameraLookAt);
}
FC_PresentationCameraLookAt& AssignPresentationCameraLookAt(const FECSEntity &inout Entity, const FC_PresentationCameraLookAt &inout DefaultValue = FC_PresentationCameraLookAt())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_PresentationCameraLookAt, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignPresentationCameraLookAt_BP(const FECSEntity &inout Entity, const FC_PresentationCameraLookAt &inout DefaultValue = FC_PresentationCameraLookAt())
{
    ECSFunc_FC_PresentationCameraLookAt::AssignPresentationCameraLookAt(Entity, DefaultValue);
    return;
}
FC_PresentationCameraLookAt& ModifyPresentationCameraLookAt(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_PresentationCameraLookAt));
    return local_12.GetComp();
}
FC_PresentationCameraLookAt& ModifyOrAddPresentationCameraLookAt(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_PresentationCameraLookAt));
    return local_12.GetComp();
}
const FC_PresentationCameraLookAt& GetPresentationCameraLookAt(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_PresentationCameraLookAt));
    return local_12.GetComp();
}
UFUNCTION()
FC_PresentationCameraLookAt GetPresentationCameraLookAt_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_PresentationCameraLookAt __r;
    bValid = false;
    bValid = ECSFunc_FC_PresentationCameraLookAt::GetPresentationCameraLookAt(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_PresentationCameraLookAt GetDefaultedPresentationCameraLookAt(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_PresentationCameraLookAt __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_PresentationCameraLookAt);
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
FC_PresentationCameraLookAt GetDefaultedPresentationCameraLookAt_BP(const FECSEntity &inout Entity)
{
    FC_PresentationCameraLookAt __r;
    return __r;
}
UFUNCTION()
bool RemovePresentationCameraLookAt(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_PresentationCameraLookAt);
}
}
FECSMonitorRuntimeView __GetMonitorPresentationCameraLookAtOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_PresentationCameraLookAt, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPresentationCameraLookAtOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_PresentationCameraLookAt, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPresentationCameraLookAtOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_PresentationCameraLookAt, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPresentationCameraLookAtOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_PresentationCameraLookAt, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPresentationCameraLookAtOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_PresentationCameraLookAt, bFixedFrame, bMustHandleAll);
}
void __MonitorPresentationCameraLookAtLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_PresentationCameraLookAt, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPresentationCameraLookAtActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_PresentationCameraLookAt, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPresentationCameraLookAtModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_PresentationCameraLookAt, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_LogicCachePresentationCameraModificationContext
{
UFUNCTION()
bool HasLogicCachePresentationCameraModificationContext(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_LogicCachePresentationCameraModificationContext);
}
FC_LogicCachePresentationCameraModificationContext& AssignLogicCachePresentationCameraModificationContext(const FECSEntity &inout Entity, const FC_LogicCachePresentationCameraModificationContext &inout DefaultValue = FC_LogicCachePresentationCameraModificationContext())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_LogicCachePresentationCameraModificationContext, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignLogicCachePresentationCameraModificationContext_BP(const FECSEntity &inout Entity, const FC_LogicCachePresentationCameraModificationContext &inout DefaultValue = FC_LogicCachePresentationCameraModificationContext())
{
    ECSFunc_FC_LogicCachePresentationCameraModificationContext::AssignLogicCachePresentationCameraModificationContext(Entity, DefaultValue);
    return;
}
FC_LogicCachePresentationCameraModificationContext& ModifyLogicCachePresentationCameraModificationContext(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_LogicCachePresentationCameraModificationContext));
    return local_12.GetComp();
}
FC_LogicCachePresentationCameraModificationContext& ModifyOrAddLogicCachePresentationCameraModificationContext(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_LogicCachePresentationCameraModificationContext));
    return local_12.GetComp();
}
const FC_LogicCachePresentationCameraModificationContext& GetLogicCachePresentationCameraModificationContext(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_LogicCachePresentationCameraModificationContext));
    return local_12.GetComp();
}
UFUNCTION()
FC_LogicCachePresentationCameraModificationContext GetLogicCachePresentationCameraModificationContext_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_LogicCachePresentationCameraModificationContext& local_4 = ECSFunc_FC_LogicCachePresentationCameraModificationContext::GetLogicCachePresentationCameraModificationContext(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_LogicCachePresentationCameraModificationContext();
}
const FC_LogicCachePresentationCameraModificationContext GetDefaultedLogicCachePresentationCameraModificationContext(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_LogicCachePresentationCameraModificationContext __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_LogicCachePresentationCameraModificationContext);
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
FC_LogicCachePresentationCameraModificationContext GetDefaultedLogicCachePresentationCameraModificationContext_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_LogicCachePresentationCameraModificationContext::GetDefaultedLogicCachePresentationCameraModificationContext(Entity);
}
UFUNCTION()
bool RemoveLogicCachePresentationCameraModificationContext(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_LogicCachePresentationCameraModificationContext);
}
}
FECSMonitorRuntimeView __GetMonitorLogicCachePresentationCameraModificationContextOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_LogicCachePresentationCameraModificationContext, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLogicCachePresentationCameraModificationContextOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_LogicCachePresentationCameraModificationContext, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLogicCachePresentationCameraModificationContextOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_LogicCachePresentationCameraModificationContext, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLogicCachePresentationCameraModificationContextOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_LogicCachePresentationCameraModificationContext, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLogicCachePresentationCameraModificationContextOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_LogicCachePresentationCameraModificationContext, bFixedFrame, bMustHandleAll);
}
void __MonitorLogicCachePresentationCameraModificationContextLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_LogicCachePresentationCameraModificationContext, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorLogicCachePresentationCameraModificationContextActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_LogicCachePresentationCameraModificationContext, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorLogicCachePresentationCameraModificationContextModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_LogicCachePresentationCameraModificationContext, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_PresentationCameraModificationContext
{
UFUNCTION()
bool HasPresentationCameraModificationContext(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_PresentationCameraModificationContext);
}
FC_PresentationCameraModificationContext& AssignPresentationCameraModificationContext(const FECSEntity &inout Entity, const FC_PresentationCameraModificationContext &inout DefaultValue = FC_PresentationCameraModificationContext())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_PresentationCameraModificationContext, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignPresentationCameraModificationContext_BP(const FECSEntity &inout Entity, const FC_PresentationCameraModificationContext &inout DefaultValue = FC_PresentationCameraModificationContext())
{
    ECSFunc_FC_PresentationCameraModificationContext::AssignPresentationCameraModificationContext(Entity, DefaultValue);
    return;
}
FC_PresentationCameraModificationContext& ModifyPresentationCameraModificationContext(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_PresentationCameraModificationContext));
    return local_12.GetComp();
}
FC_PresentationCameraModificationContext& ModifyOrAddPresentationCameraModificationContext(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_PresentationCameraModificationContext));
    return local_12.GetComp();
}
const FC_PresentationCameraModificationContext& GetPresentationCameraModificationContext(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_PresentationCameraModificationContext));
    return local_12.GetComp();
}
UFUNCTION()
FC_PresentationCameraModificationContext GetPresentationCameraModificationContext_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_PresentationCameraModificationContext __r;
    bValid = false;
    bValid = ECSFunc_FC_PresentationCameraModificationContext::GetPresentationCameraModificationContext(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_PresentationCameraModificationContext GetDefaultedPresentationCameraModificationContext(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_PresentationCameraModificationContext __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_PresentationCameraModificationContext);
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
FC_PresentationCameraModificationContext GetDefaultedPresentationCameraModificationContext_BP(const FECSEntity &inout Entity)
{
    FC_PresentationCameraModificationContext __r;
    return __r;
}
UFUNCTION()
bool RemovePresentationCameraModificationContext(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_PresentationCameraModificationContext);
}
}
FECSMonitorRuntimeView __GetMonitorPresentationCameraModificationContextOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_PresentationCameraModificationContext, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPresentationCameraModificationContextOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_PresentationCameraModificationContext, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPresentationCameraModificationContextOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_PresentationCameraModificationContext, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPresentationCameraModificationContextOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_PresentationCameraModificationContext, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPresentationCameraModificationContextOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_PresentationCameraModificationContext, bFixedFrame, bMustHandleAll);
}
void __MonitorPresentationCameraModificationContextLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_PresentationCameraModificationContext, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPresentationCameraModificationContextActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_PresentationCameraModificationContext, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPresentationCameraModificationContextModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_PresentationCameraModificationContext, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_LogicPresentationCameraModificationEventChangeTag
{
UFUNCTION()
bool HasLogicPresentationCameraModificationEventChangeTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_LogicPresentationCameraModificationEventChangeTag);
}
FC_LogicPresentationCameraModificationEventChangeTag& AssignLogicPresentationCameraModificationEventChangeTag(const FECSEntity &inout Entity, const FC_LogicPresentationCameraModificationEventChangeTag &inout DefaultValue = FC_LogicPresentationCameraModificationEventChangeTag())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_LogicPresentationCameraModificationEventChangeTag, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignLogicPresentationCameraModificationEventChangeTag_BP(const FECSEntity &inout Entity, const FC_LogicPresentationCameraModificationEventChangeTag &inout DefaultValue = FC_LogicPresentationCameraModificationEventChangeTag())
{
    ECSFunc_FC_LogicPresentationCameraModificationEventChangeTag::AssignLogicPresentationCameraModificationEventChangeTag(Entity, DefaultValue);
    return;
}
FC_LogicPresentationCameraModificationEventChangeTag& ModifyLogicPresentationCameraModificationEventChangeTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_LogicPresentationCameraModificationEventChangeTag));
    return local_12.GetComp();
}
FC_LogicPresentationCameraModificationEventChangeTag& ModifyOrAddLogicPresentationCameraModificationEventChangeTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_LogicPresentationCameraModificationEventChangeTag));
    return local_12.GetComp();
}
const FC_LogicPresentationCameraModificationEventChangeTag& GetLogicPresentationCameraModificationEventChangeTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_LogicPresentationCameraModificationEventChangeTag));
    return local_12.GetComp();
}
UFUNCTION()
FC_LogicPresentationCameraModificationEventChangeTag GetLogicPresentationCameraModificationEventChangeTag_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_LogicPresentationCameraModificationEventChangeTag& local_4 = ECSFunc_FC_LogicPresentationCameraModificationEventChangeTag::GetLogicPresentationCameraModificationEventChangeTag(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_LogicPresentationCameraModificationEventChangeTag();
}
const FC_LogicPresentationCameraModificationEventChangeTag GetDefaultedLogicPresentationCameraModificationEventChangeTag(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_LogicPresentationCameraModificationEventChangeTag __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_LogicPresentationCameraModificationEventChangeTag);
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
FC_LogicPresentationCameraModificationEventChangeTag GetDefaultedLogicPresentationCameraModificationEventChangeTag_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_LogicPresentationCameraModificationEventChangeTag::GetDefaultedLogicPresentationCameraModificationEventChangeTag(Entity);
}
UFUNCTION()
bool RemoveLogicPresentationCameraModificationEventChangeTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_LogicPresentationCameraModificationEventChangeTag);
}
}
FECSMonitorRuntimeView __GetMonitorLogicPresentationCameraModificationEventChangeTagOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_LogicPresentationCameraModificationEventChangeTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLogicPresentationCameraModificationEventChangeTagOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_LogicPresentationCameraModificationEventChangeTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLogicPresentationCameraModificationEventChangeTagOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_LogicPresentationCameraModificationEventChangeTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLogicPresentationCameraModificationEventChangeTagOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_LogicPresentationCameraModificationEventChangeTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLogicPresentationCameraModificationEventChangeTagOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_LogicPresentationCameraModificationEventChangeTag, bFixedFrame, bMustHandleAll);
}
void __MonitorLogicPresentationCameraModificationEventChangeTagLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_LogicPresentationCameraModificationEventChangeTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorLogicPresentationCameraModificationEventChangeTagActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_LogicPresentationCameraModificationEventChangeTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorLogicPresentationCameraModificationEventChangeTagModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_LogicPresentationCameraModificationEventChangeTag, bFixedFrame, Details);
    return;
}
namespace AutoDelta
{
FSubDirtyFlags16 GetDirtyFlags(FPresentationCameraLookAtParams &inout Data)
{
    FSubDirtyFlags16 __r;
    return __r;
}
void ClearDirtyFlags(FPresentationCameraLookAtParams &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FPresentationCameraLookAtParams
{
int __IndexOf_LookAtTargetEntity()
{
    return 0;
}
int __IndexOf_LookAtTargetSocketName()
{
    return 1;
}
int __IndexOf_LookAtSocketOffset()
{
    return 2;
}
int __IndexOf_bOverrideWorldDir()
{
    return 3;
}
int __IndexOf_OverrideWorldDir()
{
    return 4;
}
int __IndexOf_Location()
{
    return 5;
}
int __IndexOf_LocationOffset()
{
    return 6;
}
int __IndexOf_SmoothedLocation()
{
    return 7;
}
int __IndexOf_PitchCompensation()
{
    return 8;
}
int __IndexOf_LookAtTargetConfigRef()
{
    return 9;
}
int __IndexOf_bContributeInput()
{
    return 10;
}
int __IndexOf_RequestTime()
{
    return 11;
}
int __IndexOf_bValid()
{
    return 12;
}
}
namespace AutoDelta
{
FSubDirtyFlags16 GetDirtyFlags(FPresentationCameraModificationParams &inout Data)
{
    FSubDirtyFlags16 __r;
    return __r;
}
void ClearDirtyFlags(FPresentationCameraModificationParams &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FPresentationCameraModificationParams
{
int __IndexOf_LookAtParams()
{
    return 0;
}
}
namespace AutoDelta
{
FRootDirtyFlags16 GetDirtyFlags(FC_LogicCachePresentationCameraModificationContext &inout Data)
{
    FRootDirtyFlags16 __r;
    return __r;
}
void InitDirtyFlags(FC_LogicCachePresentationCameraModificationContext &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_LogicCachePresentationCameraModificationContext &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_LogicCachePresentationCameraModificationContext
{
int __IndexOf_Params()
{
    return 0;
}
}
