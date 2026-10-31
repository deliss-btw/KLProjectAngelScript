enum EApplyTargetType
{
    CharacterOrMount,
    WeaponDragging,
    WeaponHitEnvSurface,
    Fx,
}

namespace __INTENRAL_FC_SurfaceMaterialCheck_NS
{
    const TECSComponentDerivedPtr<FC_SurfaceMaterialCheck> DerivedPtr = TECSComponentDerivedPtr<FC_SurfaceMaterialCheck>();
    const FC_SurfaceMaterialCheck DefaultValue = FC_SurfaceMaterialCheck();
}
namespace __INTENRAL_FCE_SurfaceContactEvent_NS
{
    const TECSEventDerivedPtr<FCE_SurfaceContactEvent> DerivedPtr = TECSEventDerivedPtr<FCE_SurfaceContactEvent>();
}
namespace __INTENRAL_FCE_CleanupWeaponDraggingFX_NS
{
    const TECSEventDerivedPtr<FCE_CleanupWeaponDraggingFX> DerivedPtr = TECSEventDerivedPtr<FCE_CleanupWeaponDraggingFX>();

}
struct FSimpleSurfaceLineTraceConfig
{
    UPROPERTY()
    FName RootBoneName = n"None";
    UPROPERTY()
    FAttachRefName TraceStartBoneOrSocketName;
    UPROPERTY()
    float32 TraceLength = 200.0f;
    UPROPERTY()
    FVector TraceStartOffset = FVector::ZeroVector;
    UPROPERTY()
    FVector TraceDir = FVector::DownVector;

}

struct FSurfaceLineTraceConfig
{
    UPROPERTY()
    FName RootBoneName = n"None";
    UPROPERTY()
    FAttachRefName TraceStartBoneOrSocketName;
    UPROPERTY()
    float32 TraceLength = 200.0f;
    UPROPERTY()
    FName WeaponMeshComponent = n"None";
    UPROPERTY()
    FVector FxStartLocation = FVector::ZeroVector;
    UPROPERTY()
    FVector TraceStartOffset = FVector::ZeroVector;
    UPROPERTY()
    FVector TraceDir = FVector::DownVector;
    UPROPERTY()
    EImpactRotationType ImpactRotationType = EImpactRotationType(0);
    UPROPERTY()
    float32 VFXDelay = 0.0f;
    UPROPERTY()
    bool bFinalFxTransformAdjustment = false;
    UPROPERTY()
    bool bAdjustFxTransformOnSurfaceDetected = false;
    UPROPERTY()
    EFxAdjustmentSpace FxAdjustmentSpace = EFxAdjustmentSpace(0);
    UPROPERTY()
    FVector FxAdjustLocationOffset = FVector::ZeroVector;
    UPROPERTY()
    FRotator FxAdjustRotationOffset = FRotator::ZeroRotator;

}

struct FSurfaceContactInfo
{
    FSubDirtyFlags16 __DirtyFlags;
    UPROPERTY()
    EApplyTargetType m_ApplyTargetType;
    UPROPERTY()
    ECharacterBodySize m_CharacterSize;
    UPROPERTY()
    FName m_RootBoneName;
    UPROPERTY()
    FName m_WeaponMeshComponent;
    UPROPERTY()
    FAttachRefName m_SocketName;
    UPROPERTY()
    FVector m_FxStartLocation;
    UPROPERTY()
    FVector m_TraceStartOffset;
    UPROPERTY()
    FVector m_TraceDir;
    UPROPERTY()
    float32 m_TraceLength;
    UPROPERTY()
    bool m_bDurational;
    UPROPERTY()
    EImpactRotationType m_ImpactRotationType;
    UPROPERTY()
    EImpactEventType m_ImpactEventType;
    UPROPERTY()
    bool m_bUseEntitySystem;

    FSurfaceContactInfo()
    {
        FSubDirtyFlags16 local_2;
        this.__DirtyFlags = local_2;
        this.m_ApplyTargetType = EApplyTargetType(0);
        this.m_CharacterSize = ECharacterBodySize(0);
        this.m_RootBoneName = n"Rider_Point";
        this.m_WeaponMeshComponent = n"None";
        this.m_FxStartLocation = FVector::ZeroVector;
        this.m_TraceStartOffset = FVector::ZeroVector;
        this.m_TraceDir = FVector::DownVector;
        this.m_TraceLength = 200.0f;
        this.m_bDurational = false;
        this.m_ImpactRotationType = EImpactRotationType(0);
        this.m_ImpactEventType = EImpactEventType(0);
        this.m_bUseEntitySystem = false;
        return;
    }
    FSurfaceContactInfo(const FSurfaceContactInfo &inout Other)
    {
        FSubDirtyFlags16 local_8;
        this.__DirtyFlags = local_8;
        this.m_ApplyTargetType = EApplyTargetType(0);
        this.m_CharacterSize = ECharacterBodySize(0);
        this.m_RootBoneName = n"Rider_Point";
        this.m_WeaponMeshComponent = n"None";
        this.m_FxStartLocation = FVector::ZeroVector;
        this.m_TraceStartOffset = FVector::ZeroVector;
        this.m_TraceDir = FVector::DownVector;
        this.m_TraceLength = 200.0f;
        this.m_bDurational = false;
        this.m_ImpactRotationType = EImpactRotationType(0);
        this.m_ImpactEventType = EImpactEventType(0);
        this.m_bUseEntitySystem = false;
        this.m_ApplyTargetType = Other.m_ApplyTargetType;
        this.m_CharacterSize = Other.m_CharacterSize;
        this.m_RootBoneName = Other.m_RootBoneName;
        this.m_WeaponMeshComponent = Other.m_WeaponMeshComponent;
        this.m_SocketName = Other.m_SocketName;
        this.m_FxStartLocation = Other.m_FxStartLocation;
        this.m_TraceStartOffset = Other.m_TraceStartOffset;
        this.m_TraceDir = Other.m_TraceDir;
        this.m_TraceLength = Other.m_TraceLength;
        this.m_bDurational = Other.m_bDurational;
        this.m_ImpactRotationType = Other.m_ImpactRotationType;
        this.m_ImpactEventType = Other.m_ImpactEventType;
        this.m_bUseEntitySystem = Other.m_bUseEntitySystem;
        return;
    }
    FSurfaceContactInfo opAssign(const FSurfaceContactInfo &inout Other)
    {
        FSurfaceContactInfo __r;
        this.SetApplyTargetType(Other.GetApplyTargetType());
        this.SetCharacterSize(Other.GetCharacterSize());
        this.SetRootBoneName(Other.GetRootBoneName());
        this.SetWeaponMeshComponent(Other.GetWeaponMeshComponent());
        this.SetSocketName(Other.GetSocketName());
        this.SetFxStartLocation(Other.GetFxStartLocation());
        this.SetTraceStartOffset(Other.GetTraceStartOffset());
        this.SetTraceDir(Other.GetTraceDir());
        this.SetTraceLength(Other.GetTraceLength());
        this.SetbDurational(Other.GetbDurational());
        this.SetImpactRotationType(Other.GetImpactRotationType());
        this.SetImpactEventType(Other.GetImpactEventType());
        this.SetbUseEntitySystem(Other.GetbUseEntitySystem());
        return __r;
    }
    EApplyTargetType GetApplyTargetType() const property
    {
        return this.m_ApplyTargetType;
    }
    void SetApplyTargetType(const EApplyTargetType __Value) property
    {
        if (int(this.m_ApplyTargetType) == int(__Value))
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_ApplyTargetType = __Value;
        return;
    }
    ECharacterBodySize GetCharacterSize() const property
    {
        return this.m_CharacterSize;
    }
    void SetCharacterSize(const ECharacterBodySize __Value) property
    {
        if (int(this.m_CharacterSize) == int(__Value))
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_CharacterSize = __Value;
        return;
    }
    FName GetRootBoneName() const property
    {
        return this.m_RootBoneName;
    }
    void SetRootBoneName(const FName &inout __Value) property
    {
        if ((this.m_RootBoneName == __Value))
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_RootBoneName = __Value;
        return;
    }
    FName GetWeaponMeshComponent() const property
    {
        return this.m_WeaponMeshComponent;
    }
    void SetWeaponMeshComponent(const FName &inout __Value) property
    {
        if ((this.m_WeaponMeshComponent == __Value))
        {
            return;
        }
        this.__MarkDirty(3);
        this.m_WeaponMeshComponent = __Value;
        return;
    }
    FAttachRefName GetSocketName() const property
    {
        FAttachRefName __r;
        return __r;
    }
    FAttachRefName GetModify_SocketName() property
    {
        FAttachRefName __r;
        this.__MarkDirty(4);
        return __r;
    }
    void SetSocketName(const FAttachRefName &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(4);
        this.m_SocketName = __Value;
        return;
    }
    const FVector GetFxStartLocation() const property
    {
        const FVector __r;
        return __r;
    }
    FVector GetModify_FxStartLocation() property
    {
        FVector __r;
        this.__MarkDirty(5);
        return __r;
    }
    void SetFxStartLocation(const FVector &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(5);
        this.m_FxStartLocation = __Value;
        return;
    }
    const FVector GetTraceStartOffset() const property
    {
        const FVector __r;
        return __r;
    }
    FVector GetModify_TraceStartOffset() property
    {
        FVector __r;
        this.__MarkDirty(6);
        return __r;
    }
    void SetTraceStartOffset(const FVector &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(6);
        this.m_TraceStartOffset = __Value;
        return;
    }
    const FVector GetTraceDir() const property
    {
        const FVector __r;
        return __r;
    }
    FVector GetModify_TraceDir() property
    {
        FVector __r;
        this.__MarkDirty(7);
        return __r;
    }
    void SetTraceDir(const FVector &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(7);
        this.m_TraceDir = __Value;
        return;
    }
    float32 GetTraceLength() const property
    {
        return this.m_TraceLength;
    }
    void SetTraceLength(const float32 __Value) property
    {
        if (this.m_TraceLength == __Value)
        {
            return;
        }
        this.__MarkDirty(8);
        this.m_TraceLength = __Value;
        return;
    }
    bool GetbDurational() const property
    {
        return this.m_bDurational;
    }
    void SetbDurational(const bool __Value) property
    {
        if (!(this.m_bDurational) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(9);
        this.m_bDurational = __Value;
        return;
    }
    EImpactRotationType GetImpactRotationType() const property
    {
        return this.m_ImpactRotationType;
    }
    void SetImpactRotationType(const EImpactRotationType __Value) property
    {
        if (int(this.m_ImpactRotationType) == int(__Value))
        {
            return;
        }
        this.__MarkDirty(10);
        this.m_ImpactRotationType = __Value;
        return;
    }
    EImpactEventType GetImpactEventType() const property
    {
        return this.m_ImpactEventType;
    }
    void SetImpactEventType(const EImpactEventType __Value) property
    {
        if (int(this.m_ImpactEventType) == int(__Value))
        {
            return;
        }
        this.__MarkDirty(11);
        this.m_ImpactEventType = __Value;
        return;
    }
    bool GetbUseEntitySystem() const property
    {
        return this.m_bUseEntitySystem;
    }
    void SetbUseEntitySystem(const bool __Value) property
    {
        if (!(this.m_bUseEntitySystem) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(12);
        this.m_bUseEntitySystem = __Value;
        return;
    }
}

struct FCE_SurfaceContactEvent : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FSurfaceContactInfo SurfaceContactInfo;

    FCE_SurfaceContactEvent()
    {
        return;
    }
}

struct FCE_CleanupWeaponDraggingFX : FECSEvent
{
    FECSEvent _base_FECSEvent;

    FCE_CleanupWeaponDraggingFX()
    {
        return;
    }
}

struct FC_SurfaceMaterialCheck : FECSComponent
{
    UPROPERTY()
    FName OldSurfaceName = NAME_None;
    UPROPERTY()
    FName NewSurfaceName = NAME_None;
    UPROPERTY()
    int NewSurfaceIndex = 0;

}

namespace ECSFunc_FC_SurfaceMaterialCheck
{
UFUNCTION()
bool HasSurfaceMaterialCheck(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_SurfaceMaterialCheck);
}
FC_SurfaceMaterialCheck& AssignSurfaceMaterialCheck(const FECSEntity &inout Entity, const FC_SurfaceMaterialCheck &inout DefaultValue = FC_SurfaceMaterialCheck())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_SurfaceMaterialCheck, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignSurfaceMaterialCheck_BP(const FECSEntity &inout Entity, const FC_SurfaceMaterialCheck &inout DefaultValue = FC_SurfaceMaterialCheck())
{
    ECSFunc_FC_SurfaceMaterialCheck::AssignSurfaceMaterialCheck(Entity, DefaultValue);
    return;
}
FC_SurfaceMaterialCheck& ModifySurfaceMaterialCheck(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_SurfaceMaterialCheck));
    return local_12.GetComp();
}
FC_SurfaceMaterialCheck& ModifyOrAddSurfaceMaterialCheck(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_SurfaceMaterialCheck));
    return local_12.GetComp();
}
const FC_SurfaceMaterialCheck& GetSurfaceMaterialCheck(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_SurfaceMaterialCheck));
    return local_12.GetComp();
}
UFUNCTION()
FC_SurfaceMaterialCheck GetSurfaceMaterialCheck_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_SurfaceMaterialCheck& local_4 = ECSFunc_FC_SurfaceMaterialCheck::GetSurfaceMaterialCheck(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_SurfaceMaterialCheck();
}
const FC_SurfaceMaterialCheck GetDefaultedSurfaceMaterialCheck(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_SurfaceMaterialCheck __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_SurfaceMaterialCheck);
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
FC_SurfaceMaterialCheck GetDefaultedSurfaceMaterialCheck_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_SurfaceMaterialCheck::GetDefaultedSurfaceMaterialCheck(Entity);
}
UFUNCTION()
bool RemoveSurfaceMaterialCheck(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_SurfaceMaterialCheck);
}
}
FECSMonitorRuntimeView __GetMonitorSurfaceMaterialCheckOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_SurfaceMaterialCheck, EECSRegType(RegType), bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSurfaceMaterialCheckOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_SurfaceMaterialCheck, EECSRegType(RegType), bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSurfaceMaterialCheckOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_SurfaceMaterialCheck, EECSRegType(RegType), bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSurfaceMaterialCheckOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_SurfaceMaterialCheck, EECSRegType(RegType), bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSurfaceMaterialCheckOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_SurfaceMaterialCheck, EECSRegType(RegType), bFixedFrame, bMustHandleAll);
}
void __MonitorSurfaceMaterialCheckLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_SurfaceMaterialCheck, EECSRegType(RegType), bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorSurfaceMaterialCheckActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_SurfaceMaterialCheck, EECSRegType(RegType), bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorSurfaceMaterialCheckModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_SurfaceMaterialCheck, EECSRegType(RegType), bFixedFrame, Details);
    return;
}
namespace AutoDelta
{
FSubDirtyFlags16 GetDirtyFlags(FSurfaceContactInfo &inout Data)
{
    FSubDirtyFlags16 __r;
    return __r;
}
void ClearDirtyFlags(FSurfaceContactInfo &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FSurfaceContactInfo
{
int __IndexOf_ApplyTargetType()
{
    return 0;
}
int __IndexOf_CharacterSize()
{
    return 1;
}
int __IndexOf_RootBoneName()
{
    return 2;
}
int __IndexOf_WeaponMeshComponent()
{
    return 3;
}
int __IndexOf_SocketName()
{
    return 4;
}
int __IndexOf_FxStartLocation()
{
    return 5;
}
int __IndexOf_TraceStartOffset()
{
    return 6;
}
int __IndexOf_TraceDir()
{
    return 7;
}
int __IndexOf_TraceLength()
{
    return 8;
}
int __IndexOf_bDurational()
{
    return 9;
}
int __IndexOf_ImpactRotationType()
{
    return 10;
}
int __IndexOf_ImpactEventType()
{
    return 11;
}
int __IndexOf_bUseEntitySystem()
{
    return 12;
}
}
