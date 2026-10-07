
namespace __INTENRAL_FC_OverrideVelocityDeferred_NS
{
    const TECSComponentDerivedPtr<FC_OverrideVelocityDeferred> DerivedPtr = TECSComponentDerivedPtr<FC_OverrideVelocityDeferred>();
    const FC_OverrideVelocityDeferred DefaultValue = FC_OverrideVelocityDeferred();
}
namespace __INTENRAL_FC_CharacterStuckInfo_NS
{
    const TECSComponentDerivedPtr<FC_CharacterStuckInfo> DerivedPtr = TECSComponentDerivedPtr<FC_CharacterStuckInfo>();
    const FC_CharacterStuckInfo DefaultValue = FC_CharacterStuckInfo();
}
namespace __INTENRAL_FCE_UnstuckTeleportRequest_NS
{
    const TECSEventDerivedPtr<FCE_UnstuckTeleportRequest> DerivedPtr = TECSEventDerivedPtr<FCE_UnstuckTeleportRequest>();

}
struct FC_OverrideVelocityDeferred : FECSComponent
{
    FRootDirtyFlags16 __DirtyFlags;
    UPROPERTY()
    FVector3f m_Velocity;
    UPROPERTY()
    bool m_bIsLocalSpace;
    UPROPERTY()
    bool m_bOverrideX;
    UPROPERTY()
    bool m_bIsAbsoluteValueX;
    UPROPERTY()
    bool m_bOverrideY;
    UPROPERTY()
    bool m_bIsAbsoluteValueY;
    UPROPERTY()
    bool m_bOverrideZ;
    UPROPERTY()
    bool m_bIsAbsoluteValueZ;

    FC_OverrideVelocityDeferred()
    {
        this.m_Velocity = FVector3f::ZeroVector;
        this.m_bIsLocalSpace = true;
        this.m_bOverrideX = false;
        this.m_bIsAbsoluteValueX = false;
        this.m_bOverrideY = false;
        this.m_bIsAbsoluteValueY = false;
        this.m_bOverrideZ = false;
        this.m_bIsAbsoluteValueZ = false;
        this.__InitDirtyFlags();
        return;
    }
    FC_OverrideVelocityDeferred(const FC_OverrideVelocityDeferred &inout Other)
    {
        this.m_Velocity = FVector3f::ZeroVector;
        this.m_bIsLocalSpace = true;
        this.m_bOverrideX = false;
        this.m_bIsAbsoluteValueX = false;
        this.m_bOverrideY = false;
        this.m_bIsAbsoluteValueY = false;
        this.m_bOverrideZ = false;
        this.m_bIsAbsoluteValueZ = false;
        this.__InitDirtyFlags();
        this.m_Velocity = Other.m_Velocity;
        this.m_bIsLocalSpace = Other.m_bIsLocalSpace;
        this.m_bOverrideX = Other.m_bOverrideX;
        this.m_bIsAbsoluteValueX = Other.m_bIsAbsoluteValueX;
        this.m_bOverrideY = Other.m_bOverrideY;
        this.m_bIsAbsoluteValueY = Other.m_bIsAbsoluteValueY;
        this.m_bOverrideZ = Other.m_bOverrideZ;
        this.m_bIsAbsoluteValueZ = Other.m_bIsAbsoluteValueZ;
        return;
    }
    FC_OverrideVelocityDeferred opAssign(const FC_OverrideVelocityDeferred &inout Other)
    {
        FC_OverrideVelocityDeferred __r;
        this.SetVelocity(Other.GetVelocity());
        this.SetbIsLocalSpace(Other.GetbIsLocalSpace());
        this.SetbOverrideX(Other.GetbOverrideX());
        this.SetbIsAbsoluteValueX(Other.GetbIsAbsoluteValueX());
        this.SetbOverrideY(Other.GetbOverrideY());
        this.SetbIsAbsoluteValueY(Other.GetbIsAbsoluteValueY());
        this.SetbOverrideZ(Other.GetbOverrideZ());
        this.SetbIsAbsoluteValueZ(Other.GetbIsAbsoluteValueZ());
        return __r;
    }
    FVector3f GetVelocity() const property
    {
        FVector3f __r;
        return __r;
    }
    FVector3f GetModify_Velocity() property
    {
        FVector3f __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetVelocity(const FVector3f &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_Velocity = __Value;
        return;
    }
    bool GetbIsLocalSpace() const property
    {
        return this.m_bIsLocalSpace;
    }
    void SetbIsLocalSpace(const bool __Value) property
    {
        if (!(this.m_bIsLocalSpace) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_bIsLocalSpace = __Value;
        return;
    }
    bool GetbOverrideX() const property
    {
        return this.m_bOverrideX;
    }
    void SetbOverrideX(const bool __Value) property
    {
        if (!(this.m_bOverrideX) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_bOverrideX = __Value;
        return;
    }
    bool GetbIsAbsoluteValueX() const property
    {
        return this.m_bIsAbsoluteValueX;
    }
    void SetbIsAbsoluteValueX(const bool __Value) property
    {
        if (!(this.m_bIsAbsoluteValueX) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(3);
        this.m_bIsAbsoluteValueX = __Value;
        return;
    }
    bool GetbOverrideY() const property
    {
        return this.m_bOverrideY;
    }
    void SetbOverrideY(const bool __Value) property
    {
        if (!(this.m_bOverrideY) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(4);
        this.m_bOverrideY = __Value;
        return;
    }
    bool GetbIsAbsoluteValueY() const property
    {
        return this.m_bIsAbsoluteValueY;
    }
    void SetbIsAbsoluteValueY(const bool __Value) property
    {
        if (!(this.m_bIsAbsoluteValueY) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(5);
        this.m_bIsAbsoluteValueY = __Value;
        return;
    }
    bool GetbOverrideZ() const property
    {
        return this.m_bOverrideZ;
    }
    void SetbOverrideZ(const bool __Value) property
    {
        if (!(this.m_bOverrideZ) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(6);
        this.m_bOverrideZ = __Value;
        return;
    }
    bool GetbIsAbsoluteValueZ() const property
    {
        return this.m_bIsAbsoluteValueZ;
    }
    void SetbIsAbsoluteValueZ(const bool __Value) property
    {
        if (!(this.m_bIsAbsoluteValueZ) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(7);
        this.m_bIsAbsoluteValueZ = __Value;
        return;
    }
}

struct FC_CharacterStuckInfo : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    FFPTime m_StuckStartTime;
    UPROPERTY()
    int m_SwingCount;
    UPROPERTY()
    FVector m_StartPosition;
    UPROPERTY()
    FVector3f m_InputDir1;
    UPROPERTY()
    FVector3f m_InputDir2;
    UPROPERTY()
    bool m_bVerified;

    FC_CharacterStuckInfo()
    {
        this.m_SwingCount = 0;
        this.m_StuckStartTime = -1;
        this.m_bVerified = false;
        this.__InitDirtyFlags();
        return;
    }
    FC_CharacterStuckInfo(const FC_CharacterStuckInfo &inout Other)
    {
        this.m_SwingCount = 0;
        this.m_StuckStartTime = -1;
        this.m_bVerified = false;
        this.__InitDirtyFlags();
        this.m_StuckStartTime = Other.m_StuckStartTime;
        this.m_SwingCount = int(Other.m_SwingCount);
        this.m_StartPosition = Other.m_StartPosition;
        this.m_InputDir1 = Other.m_InputDir1;
        this.m_InputDir2 = Other.m_InputDir2;
        this.m_bVerified = Other.m_bVerified;
        return;
    }
    FC_CharacterStuckInfo opAssign(const FC_CharacterStuckInfo &inout Other)
    {
        FC_CharacterStuckInfo __r;
        this.SetStuckStartTime(Other.GetStuckStartTime());
        this.SetSwingCount(Other.GetSwingCount());
        this.SetStartPosition(Other.GetStartPosition());
        this.SetInputDir1(Other.GetInputDir1());
        this.SetInputDir2(Other.GetInputDir2());
        this.SetbVerified(Other.GetbVerified());
        return __r;
    }
    void Reset(const FFPTime &inout Time, const FVector &inout Position)
    {
        this.SetStuckStartTime(Time);
        this.SetStartPosition(Position);
        this.SetInputDir1(FVector3f::ZeroVector);
        this.SetInputDir2(FVector3f::ZeroVector);
        this.SetSwingCount(0);
        this.SetbVerified(false);
        return;
    }
    const FFPTime GetStuckStartTime() const property
    {
        const FFPTime __r;
        return __r;
    }
    FFPTime GetModify_StuckStartTime() property
    {
        FFPTime __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetStuckStartTime(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_StuckStartTime = __Value;
        return;
    }
    int GetSwingCount() const property
    {
        return this.m_SwingCount;
    }
    void SetSwingCount(const int __Value) property
    {
        if (this.m_SwingCount == __Value)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_SwingCount = __Value;
        return;
    }
    FVector GetStartPosition() const property
    {
        FVector __r;
        return __r;
    }
    FVector GetModify_StartPosition() property
    {
        FVector __r;
        this.__MarkDirty(2);
        return __r;
    }
    void SetStartPosition(const FVector &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_StartPosition = __Value;
        return;
    }
    const FVector3f GetInputDir1() const property
    {
        const FVector3f __r;
        return __r;
    }
    FVector3f GetModify_InputDir1() property
    {
        FVector3f __r;
        this.__MarkDirty(3);
        return __r;
    }
    void SetInputDir1(const FVector3f &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(3);
        this.m_InputDir1 = __Value;
        return;
    }
    const FVector3f GetInputDir2() const property
    {
        const FVector3f __r;
        return __r;
    }
    FVector3f GetModify_InputDir2() property
    {
        FVector3f __r;
        this.__MarkDirty(4);
        return __r;
    }
    void SetInputDir2(const FVector3f &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(4);
        this.m_InputDir2 = __Value;
        return;
    }
    bool GetbVerified() const property
    {
        return this.m_bVerified;
    }
    void SetbVerified(const bool __Value) property
    {
        if (!(this.m_bVerified) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(5);
        this.m_bVerified = __Value;
        return;
    }
}

struct FCE_UnstuckTeleportRequest : FECSEvent
{
    FECSEvent _base_FECSEvent;

    FCE_UnstuckTeleportRequest()
    {
        return;
    }
    bool Validate() const
    {
        return true;
    }
}

namespace ECSFunc_FC_OverrideVelocityDeferred
{
UFUNCTION()
bool HasOverrideVelocityDeferred(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_OverrideVelocityDeferred);
}
FC_OverrideVelocityDeferred& AssignOverrideVelocityDeferred(const FECSEntity &inout Entity, const FC_OverrideVelocityDeferred &inout DefaultValue = FC_OverrideVelocityDeferred())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_OverrideVelocityDeferred, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignOverrideVelocityDeferred_BP(const FECSEntity &inout Entity, const FC_OverrideVelocityDeferred &inout DefaultValue = FC_OverrideVelocityDeferred())
{
    ECSFunc_FC_OverrideVelocityDeferred::AssignOverrideVelocityDeferred(Entity, DefaultValue);
    return;
}
FC_OverrideVelocityDeferred& ModifyOverrideVelocityDeferred(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_OverrideVelocityDeferred));
    return local_12.GetComp();
}
FC_OverrideVelocityDeferred& ModifyOrAddOverrideVelocityDeferred(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_OverrideVelocityDeferred));
    return local_12.GetComp();
}
const FC_OverrideVelocityDeferred& GetOverrideVelocityDeferred(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_OverrideVelocityDeferred));
    return local_12.GetComp();
}
UFUNCTION()
FC_OverrideVelocityDeferred GetOverrideVelocityDeferred_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_OverrideVelocityDeferred& local_4 = ECSFunc_FC_OverrideVelocityDeferred::GetOverrideVelocityDeferred(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_OverrideVelocityDeferred();
}
const FC_OverrideVelocityDeferred GetDefaultedOverrideVelocityDeferred(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_OverrideVelocityDeferred __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_OverrideVelocityDeferred);
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
FC_OverrideVelocityDeferred GetDefaultedOverrideVelocityDeferred_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_OverrideVelocityDeferred::GetDefaultedOverrideVelocityDeferred(Entity);
}
UFUNCTION()
bool RemoveOverrideVelocityDeferred(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_OverrideVelocityDeferred);
}
}
FECSMonitorRuntimeView __GetMonitorOverrideVelocityDeferredOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_OverrideVelocityDeferred, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorOverrideVelocityDeferredOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_OverrideVelocityDeferred, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorOverrideVelocityDeferredOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_OverrideVelocityDeferred, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorOverrideVelocityDeferredOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_OverrideVelocityDeferred, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorOverrideVelocityDeferredOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_OverrideVelocityDeferred, bFixedFrame, bMustHandleAll);
}
void __MonitorOverrideVelocityDeferredLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_OverrideVelocityDeferred, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorOverrideVelocityDeferredActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_OverrideVelocityDeferred, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorOverrideVelocityDeferredModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_OverrideVelocityDeferred, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_CharacterStuckInfo
{
UFUNCTION()
bool HasCharacterStuckInfo(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_CharacterStuckInfo);
}
FC_CharacterStuckInfo& AssignCharacterStuckInfo(const FECSEntity &inout Entity, const FC_CharacterStuckInfo &inout DefaultValue = FC_CharacterStuckInfo())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_CharacterStuckInfo, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignCharacterStuckInfo_BP(const FECSEntity &inout Entity, const FC_CharacterStuckInfo &inout DefaultValue = FC_CharacterStuckInfo())
{
    ECSFunc_FC_CharacterStuckInfo::AssignCharacterStuckInfo(Entity, DefaultValue);
    return;
}
FC_CharacterStuckInfo& ModifyCharacterStuckInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_CharacterStuckInfo));
    return local_12.GetComp();
}
FC_CharacterStuckInfo& ModifyOrAddCharacterStuckInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_CharacterStuckInfo));
    return local_12.GetComp();
}
const FC_CharacterStuckInfo& GetCharacterStuckInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_CharacterStuckInfo));
    return local_12.GetComp();
}
UFUNCTION()
FC_CharacterStuckInfo GetCharacterStuckInfo_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_CharacterStuckInfo& local_4 = ECSFunc_FC_CharacterStuckInfo::GetCharacterStuckInfo(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_CharacterStuckInfo();
}
const FC_CharacterStuckInfo GetDefaultedCharacterStuckInfo(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_CharacterStuckInfo __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_CharacterStuckInfo);
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
FC_CharacterStuckInfo GetDefaultedCharacterStuckInfo_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_CharacterStuckInfo::GetDefaultedCharacterStuckInfo(Entity);
}
UFUNCTION()
bool RemoveCharacterStuckInfo(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_CharacterStuckInfo);
}
}
FECSMonitorRuntimeView __GetMonitorCharacterStuckInfoOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_CharacterStuckInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCharacterStuckInfoOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_CharacterStuckInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCharacterStuckInfoOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_CharacterStuckInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCharacterStuckInfoOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_CharacterStuckInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCharacterStuckInfoOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_CharacterStuckInfo, bFixedFrame, bMustHandleAll);
}
void __MonitorCharacterStuckInfoLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_CharacterStuckInfo, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCharacterStuckInfoActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_CharacterStuckInfo, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCharacterStuckInfoModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_CharacterStuckInfo, bFixedFrame, Details);
    return;
}
namespace AutoDelta
{
FRootDirtyFlags16 GetDirtyFlags(FC_OverrideVelocityDeferred &inout Data)
{
    FRootDirtyFlags16 __r;
    return __r;
}
void InitDirtyFlags(FC_OverrideVelocityDeferred &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_OverrideVelocityDeferred &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_OverrideVelocityDeferred
{
int __IndexOf_Velocity()
{
    return 0;
}
int __IndexOf_bIsLocalSpace()
{
    return 1;
}
int __IndexOf_bOverrideX()
{
    return 2;
}
int __IndexOf_bIsAbsoluteValueX()
{
    return 3;
}
int __IndexOf_bOverrideY()
{
    return 4;
}
int __IndexOf_bIsAbsoluteValueY()
{
    return 5;
}
int __IndexOf_bOverrideZ()
{
    return 6;
}
int __IndexOf_bIsAbsoluteValueZ()
{
    return 7;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_CharacterStuckInfo &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_CharacterStuckInfo &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_CharacterStuckInfo &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_CharacterStuckInfo
{
int __IndexOf_StuckStartTime()
{
    return 0;
}
int __IndexOf_SwingCount()
{
    return 1;
}
int __IndexOf_StartPosition()
{
    return 2;
}
int __IndexOf_InputDir1()
{
    return 3;
}
int __IndexOf_InputDir2()
{
    return 4;
}
int __IndexOf_bVerified()
{
    return 5;
}
}
