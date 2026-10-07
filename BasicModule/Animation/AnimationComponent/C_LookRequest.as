
enum EAnimLookSource
{
    Default,
    Slope = 5,
    IdleAmbient = 10,
    SampleTrajectory = 25,
    Aim = 50,
    LockTarget = 55,
    Skill = 60,
    SkillAngle = 65,
}

enum EAnimSnapshotType
{
    Position,
    Rotation,
}

namespace FC_LookRequest
{
    const TMap<EAnimLookSource, FString> EAnimLookSourceNameMap = TMap<EAnimLookSource, FString>();
}
namespace __INTENRAL_FC_LookRequest_NS
{
    const TECSComponentDerivedPtr<FC_LookRequest> DerivedPtr = TECSComponentDerivedPtr<FC_LookRequest>();
    const FC_LookRequest DefaultValue = FC_LookRequest();
}
namespace __InterpoComponentRegister
{
    const FECSInterpoManager::FAngelscriptInterpoComponentRegister FC_LookRequestRegister = FECSInterpoManager::FAngelscriptInterpoComponentRegister();

}
struct FLookRequestEntry
{
    UPROPERTY()
    EAnimLookSource Source = EAnimLookSource(0);
    UPROPERTY()
    int Priority = 0;
    UPROPERTY()
    bool bHasExpire = false;
    UPROPERTY()
    FFPTime ExpireTime;
    UPROPERTY()
    TWeakObjectPtr<AActor> TargetActor = nullptr;
    UPROPERTY()
    FVector FallbackPosWS = FVector::ZeroVector;
    UPROPERTY()
    uint8 SnapshotTypeMask = false;
    UPROPERTY()
    FRotator TargetRotationCS = FRotator::ZeroRotator;


}

struct FAnimSnapshot
{
    FSubDirtyFlags40 __DirtyFlags;
    UPROPERTY()
    EAnimLookSource m_Source;
    UPROPERTY()
    int m_Priority;
    UPROPERTY()
    uint8 m_AnimSnapshotTypeMask;
    UPROPERTY()
    FVector m_Position;
    UPROPERTY()
    FRotator m_Rotator;

    FAnimSnapshot()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FAnimSnapshot(const FAnimSnapshot &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FAnimSnapshot opAssign(const FAnimSnapshot &inout Other)
    {
        FAnimSnapshot __r;
        this.SetSource(Other.GetSource());
        this.SetPriority(Other.GetPriority());
        this.SetAnimSnapshotTypeMask(uint8(Other.GetAnimSnapshotTypeMask()));
        this.SetPosition(Other.GetPosition());
        this.SetRotator(Other.GetRotator());
        return __r;
    }
    EAnimLookSource GetSource() const property
    {
        return this.m_Source;
    }
    void SetSource(const EAnimLookSource __Value) property
    {
        if (int(this.m_Source) == int(__Value))
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_Source = __Value;
        return;
    }
    int GetPriority() const property
    {
        return this.m_Priority;
    }
    void SetPriority(const int __Value) property
    {
        if (this.m_Priority == __Value)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_Priority = __Value;
        return;
    }
    uint8 GetAnimSnapshotTypeMask() const property
    {
        return this.m_AnimSnapshotTypeMask;
    }
    void SetAnimSnapshotTypeMask(const uint8 __Value) property
    {
        if (this.m_AnimSnapshotTypeMask == __Value)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_AnimSnapshotTypeMask = (__Value != 0);
        return;
    }
    FVector GetPosition() const property
    {
        FVector __r;
        return __r;
    }
    FVector GetModify_Position() property
    {
        FVector __r;
        this.__MarkDirty(3);
        return __r;
    }
    void SetPosition(const FVector &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(3);
        this.m_Position = __Value;
        return;
    }
    FRotator GetRotator() const property
    {
        FRotator __r;
        return __r;
    }
    FRotator GetModify_Rotator() property
    {
        FRotator __r;
        this.__MarkDirty(4);
        return __r;
    }
    void SetRotator(const FRotator &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(4);
        this.m_Rotator = __Value;
        return;
    }
}

struct FLookSnapshot : FAnimSnapshot
{
    FAnimSnapshot _base_FAnimSnapshot;

    FLookSnapshot()
    {
        super();
        return;
    }
    FLookSnapshot(const FLookSnapshot &inout Other)
    {
        super();
        Super::opAssign(Other._base_FAnimSnapshot);
        return;
    }
    FLookSnapshot& opAssign(const FLookSnapshot &inout Other)
    {
        return Super::opAssign(Other._base_FAnimSnapshot);
    }
}

struct FC_LookRequest : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    FLookSnapshot m_TopRequest;
    UPROPERTY()
    bool m_bTopValid;

    FC_LookRequest()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_LookRequest(const FC_LookRequest &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_LookRequest opAssign(const FC_LookRequest &inout Other)
    {
        FC_LookRequest __r;
        this.SetTopRequest(Other.GetTopRequest());
        this.SetbTopValid(Other.GetbTopValid());
        return __r;
    }
    const FLookSnapshot GetTopRequest() const property
    {
        const FLookSnapshot __r;
        return __r;
    }
    FLookSnapshot GetTopRequest() property
    {
        FLookSnapshot __r;
        return __r;
    }
    void SetTopRequest(const FLookSnapshot &inout __Value) property
    {
        this.m_TopRequest = __Value;
        return;
    }
    bool GetbTopValid() const property
    {
        return this.m_bTopValid;
    }
    void SetbTopValid(const bool __Value) property
    {
        if (!(this.m_bTopValid) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(5);
        this.m_bTopValid = __Value;
        return;
    }
}

namespace FAnimSnapshot
{
uint8 MakeSnapshotTypeMask(const EAnimSnapshotType SnapshotType)
{
    int local_3 = (1 << int(SnapshotType));
    return local_3;
}
bool HasSnapshotType(const FAnimSnapshot &inout Snapshot, const EAnimSnapshotType SnapshotType)
{
    int local_5 = Snapshot.GetAnimSnapshotTypeMask() & FAnimSnapshot::MakeSnapshotTypeMask(EAnimSnapshotType(SnapshotType));
    return (local_5 != 0);
}
bool HasType(const uint8 Mask, const EAnimSnapshotType SnapshotType)
{
    int local_4 = Mask & FAnimSnapshot::MakeSnapshotTypeMask(EAnimSnapshotType(SnapshotType));
    return (local_4 != 0);
}
FAnimSnapshot Interpolate(const FAnimSnapshot &inout A, const FAnimSnapshot &inout B, const float32 T, const float32 DeltaTime)
{
    int local_23;
    int local_26;
    int local_29;
    FAnimSnapshot local_18;
    if (T < 0.5f)
    {
        local_23 = int(A.GetSource());
    }
    else
    {
        local_23 = int(B.GetSource());
    }
    local_18.SetSource(EAnimLookSource(local_23));
    if (T < 0.5f)
    {
        local_26 = A.GetPriority();
    }
    else
    {
        local_26 = B.GetPriority();
    }
    local_18.SetPriority(local_26);
    if (T < 0.5f)
    {
        local_29 = A.GetAnimSnapshotTypeMask();
    }
    else
    {
        local_29 = B.GetAnimSnapshotTypeMask();
    }
    local_18.SetAnimSnapshotTypeMask(uint8(local_29));
    local_18.SetPosition(FMath::Lerp(A.GetPosition(), B.GetPosition(), T));
    local_18.SetRotator(FMath::LerpShortestPath(A.GetRotator(), B.GetRotator(), T));
    return local_18;
}
}
namespace FLookSnapshot
{
FLookSnapshot Interpolate(const FLookSnapshot &inout A, const FLookSnapshot &inout B, const float32 T, const float32 DeltaTime)
{
    FAnimSnapshot local_36 = FAnimSnapshot::Interpolate(DeltaTime, T, B, A);
    FLookSnapshot local_54;
    local_54.SetSource(local_36.GetSource());
    local_54.SetPriority(local_36.GetPriority());
    local_54.SetAnimSnapshotTypeMask(uint8(local_36.GetAnimSnapshotTypeMask()));
    local_54.SetPosition(local_36.GetPosition());
    local_54.SetRotator(local_36.GetRotator());
    return local_54;
}
}
namespace FC_LookRequest
{
FC_LookRequest Interpolate(const FC_LookRequest &inout A, const FC_LookRequest &inout B, const float32 T, const float32 DeltaTime)
{
    bool local_27;
    FC_LookRequest local_22;
    if (T < 0.5f)
    {
        local_27 = A.GetbTopValid();
    }
    else
    {
        local_27 = B.GetbTopValid();
    }
    local_22.SetbTopValid(local_27);
    local_22.SetTopRequest(FLookSnapshot::Interpolate(A.GetTopRequest(), B.GetTopRequest(), T, DeltaTime));
    return local_22;
}
void Push(const FECSEntity &inout Entity, const EAnimLookSource Source, const int Priority, const uint8 SnapshotTypeMask, const AActor TargetActor = nullptr, const FVector &inout FallbackPosWS = FVector::ZeroVector, const float32 ExpireSeconds = -1.f, const FRotator &inout RotationCS = FRotator::ZeroRotator)
{
    int local_6 = 0;
    FLookRequestEntry local_28;
    local_28.Source = Source;
    local_28.Priority = Priority;
    local_28.SnapshotTypeMask = (SnapshotTypeMask != 0);
    local_28.TargetActor = TargetActor;
    local_28.FallbackPosWS = FallbackPosWS;
    local_28.TargetRotationCS = RotationCS;
    if (ExpireSeconds >= 0.0f)
    {
        local_28.bHasExpire = true;
        local_28.ExpireTime = (FFPTime(ECS::GetECSWorld().GetFixedTime().Time) + FFPTime(ExpireSeconds));
    }
    local_6.RequestArray.Add(local_28);
    return;
}
void ReleaseBySource(const FECSEntity &inout Entity, const EAnimLookSource Source)
{
    Modify local_4;
    FC_LookRequestLocal& local_6 = local_4.opCall();
    if (local_6)
    {
        int local_11 = local_6.RequestArray.Num() - 1;
        for (; local_11 >= 0; --local_11)
        {
            if (int(local_6.RequestArray[local_11].Source) == int(Source))
            {
                local_6.RequestArray.RemoveAt(local_11);
            }
        }
    }
    return;
}
void PushOrUpdateBySource(const FECSEntity &inout Entity, const EAnimLookSource Source, const int Priority, const uint8 SnapshotTypeMask, const AActor TargetActor = nullptr, const FVector &inout FallbackPosWS = FVector::ZeroVector, const float32 ExpireSeconds = 0.2f, const FRotator &inout RotationCS = FRotator::ZeroRotator)
{
    FC_LookRequest::ReleaseBySource(Entity, EAnimLookSource(Source));
    FC_LookRequest::Push(Entity, EAnimLookSource(Source), Priority, uint8(SnapshotTypeMask), TargetActor, FallbackPosWS, ExpireSeconds, RotationCS);
    return;
}
void PushView(const FECSEntity &inout Entity, const EAnimLookSource Source, const int Priority, const uint8 SnapshotTypeMask, const AActor TargetActor = nullptr, const FVector &inout FallbackPosWS = FVector::ZeroVector, const float32 ExpireSeconds = -1.f, const FRotator &inout RotationCS = FRotator::ZeroRotator)
{
    int local_6 = 0;
    FLookRequestEntry local_28;
    local_28.Source = Source;
    local_28.Priority = Priority;
    local_28.SnapshotTypeMask = (SnapshotTypeMask != 0);
    local_28.TargetActor = TargetActor;
    local_28.FallbackPosWS = FallbackPosWS;
    local_28.TargetRotationCS = RotationCS;
    if (ExpireSeconds >= 0.0f)
    {
        local_28.bHasExpire = true;
        local_28.ExpireTime = (FFPTime(ECS::GetECSWorld().GetFixedTime().Time) + FFPTime(ExpireSeconds));
    }
    local_6.RequestArray.Add(local_28);
    return;
}
void ReleaseViewBySource(const FECSEntity &inout Entity, const EAnimLookSource Source)
{
    Modify local_4;
    FC_LookRequestViewLocal& local_6 = local_4.opCall();
    if (local_6)
    {
        int local_11 = local_6.RequestArray.Num() - 1;
        for (; local_11 >= 0; --local_11)
        {
            if (int(local_6.RequestArray[local_11].Source) == int(Source))
            {
                local_6.RequestArray.RemoveAt(local_11);
            }
        }
    }
    return;
}
void PushOrUpdateViewBySource(const FECSEntity &inout Entity, const EAnimLookSource Source, const int Priority, const uint8 SnapshotTypeMask, const AActor TargetActor = nullptr, const FVector &inout FallbackPosWS = FVector::ZeroVector, const float32 ExpireSeconds = 0.2f, const FRotator &inout RotationCS = FRotator::ZeroRotator)
{
    FC_LookRequest::ReleaseViewBySource(Entity, EAnimLookSource(Source));
    FC_LookRequest::PushView(Entity, EAnimLookSource(Source), Priority, uint8(SnapshotTypeMask), TargetActor, FallbackPosWS, ExpireSeconds, RotationCS);
    return;
}
bool IsBetterThan(const FLookRequestEntry &inout Local, const FLookRequestEntry &inout Sync)
{
    if (int(Local.Priority) != int(Sync.Priority))
    {
        return (Local.Priority > Sync.Priority);
    }
    if (int(Local.Source) != int(Sync.Source))
    {
        return (int(Local.Source) > int(Sync.Source));
    }
    return true;
}
FTransform ChangeTransformToBottomLocation(const FECSEntity &inout Entity, const FTransform &inout Transform)
{
    FTransform local_24 = Transform;
    local_24.SetLocation(FTransformUtils::GetOffsetRefLocation(Entity, Transform, EOffsetRefType(0)));
    return local_24;
}
}
namespace ECSFunc_FC_LookRequest
{
UFUNCTION()
bool HasLookRequest(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_LookRequest);
}
FC_LookRequest& AssignLookRequest(const FECSEntity &inout Entity, const FC_LookRequest &inout DefaultValue = FC_LookRequest())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_LookRequest, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignLookRequest_BP(const FECSEntity &inout Entity, const FC_LookRequest &inout DefaultValue = FC_LookRequest())
{
    ECSFunc_FC_LookRequest::AssignLookRequest(Entity, DefaultValue);
    return;
}
FC_LookRequest& ModifyLookRequest(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_LookRequest));
    return local_12.GetComp();
}
FC_LookRequest& ModifyOrAddLookRequest(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_LookRequest));
    return local_12.GetComp();
}
const FC_LookRequest& GetLookRequest(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_LookRequest));
    return local_12.GetComp();
}
UFUNCTION()
FC_LookRequest GetLookRequest_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_LookRequest& local_4 = ECSFunc_FC_LookRequest::GetLookRequest(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_LookRequest();
}
const FC_LookRequest GetDefaultedLookRequest(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_LookRequest __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_LookRequest);
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
FC_LookRequest GetDefaultedLookRequest_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_LookRequest::GetDefaultedLookRequest(Entity);
}
UFUNCTION()
bool RemoveLookRequest(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_LookRequest);
}
}
FECSMonitorRuntimeView __GetMonitorLookRequestOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_LookRequest, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLookRequestOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_LookRequest, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLookRequestOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_LookRequest, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLookRequestOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_LookRequest, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLookRequestOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_LookRequest, bFixedFrame, bMustHandleAll);
}
void __MonitorLookRequestLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_LookRequest, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorLookRequestActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_LookRequest, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorLookRequestModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_LookRequest, bFixedFrame, Details);
    return;
}
namespace AutoDelta
{
FSubDirtyFlags40 GetDirtyFlags(FAnimSnapshot &inout Data)
{
    FSubDirtyFlags40 __r;
    return __r;
}
void ClearDirtyFlags(FAnimSnapshot &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FAnimSnapshot
{
int __IndexOf_Source()
{
    return 0;
}
int __IndexOf_Priority()
{
    return 1;
}
int __IndexOf_AnimSnapshotTypeMask()
{
    return 2;
}
int __IndexOf_Position()
{
    return 3;
}
int __IndexOf_Rotator()
{
    return 4;
}
}
namespace AutoDelta
{
FSubDirtyFlags40& GetDirtyFlags(FLookSnapshot &inout Data)
{
    return Data.__GetSharedDirtyFlags();
}
void ClearDirtyFlags(FLookSnapshot &inout Data)
{
    Data.__ClearOwnChildren_FLookSnapshot(false);
    Data.__ClearAllDirtyFlags();
    if (!(Data.__GetSharedDirtyFlags().IsBitmapOwner()))
    {
        int local_2 = 0;
        for (; local_2 < 5; )
        {
            Data.__GetSharedDirtyFlags().ClearDirty(local_2);
            ++local_2;
        }
    }
    return;
}
FRootDirtyFlags8 GetDirtyFlags(FC_LookRequest &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_LookRequest &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_LookRequest &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_LookRequest
{
int __IndexOf_TopRequest()
{
    return 0;
}
int __IndexOf_bTopValid()
{
    return 5;
}
}
