
namespace __INTENRAL_FC_MountSeatsConfig_NS
{
    const TECSComponentDerivedPtr<FC_MountSeatsConfig> DerivedPtr = TECSComponentDerivedPtr<FC_MountSeatsConfig>();
    const FC_MountSeatsConfig DefaultValue = FC_MountSeatsConfig();
}
namespace __INTENRAL_FC_RuntimeMountSeatInfo_NS
{
    const TECSComponentDerivedPtr<FC_RuntimeMountSeatInfo> DerivedPtr = TECSComponentDerivedPtr<FC_RuntimeMountSeatInfo>();
    const FC_RuntimeMountSeatInfo DefaultValue = FC_RuntimeMountSeatInfo();
}
namespace __INTENRAL_FC_MountDashConfig_NS
{
    const TECSComponentDerivedPtr<FC_MountDashConfig> DerivedPtr = TECSComponentDerivedPtr<FC_MountDashConfig>();
    const FC_MountDashConfig DefaultValue = FC_MountDashConfig();
}
namespace __INTENRAL_FC_ControllerEquipMount_NS
{
    const TECSComponentDerivedPtr<FC_ControllerEquipMount> DerivedPtr = TECSComponentDerivedPtr<FC_ControllerEquipMount>();
    const FC_ControllerEquipMount DefaultValue = FC_ControllerEquipMount();
}
namespace __INTENRAL_FC_PawnRiddingMount_NS
{
    const TECSComponentDerivedPtr<FC_PawnRiddingMount> DerivedPtr = TECSComponentDerivedPtr<FC_PawnRiddingMount>();
    const FC_PawnRiddingMount DefaultValue = FC_PawnRiddingMount();
}
namespace __INTENRAL_FC_MountIsDrivenBy_NS
{
    const TECSComponentDerivedPtr<FC_MountIsDrivenBy> DerivedPtr = TECSComponentDerivedPtr<FC_MountIsDrivenBy>();
    const FC_MountIsDrivenBy DefaultValue = FC_MountIsDrivenBy();
}
namespace __INTENRAL_FC_MountPendingInitTag_NS
{
    const TECSComponentDerivedPtr<FC_MountPendingInitTag> DerivedPtr = TECSComponentDerivedPtr<FC_MountPendingInitTag>();
    const FC_MountPendingInitTag DefaultValue = FC_MountPendingInitTag();
}
namespace __INTENRAL_FC_MountPendingChangeTag_NS
{
    const TECSComponentDerivedPtr<FC_MountPendingChangeTag> DerivedPtr = TECSComponentDerivedPtr<FC_MountPendingChangeTag>();
    const FC_MountPendingChangeTag DefaultValue = FC_MountPendingChangeTag();
}
namespace __INTENRAL_FC_MountPendingInactive_NS
{
    const TECSComponentDerivedPtr<FC_MountPendingInactive> DerivedPtr = TECSComponentDerivedPtr<FC_MountPendingInactive>();
    const FC_MountPendingInactive DefaultValue = FC_MountPendingInactive();
}
namespace __INTENRAL_FC_MountDisallowed_NS
{
    const TECSComponentDerivedPtr<FC_MountDisallowed> DerivedPtr = TECSComponentDerivedPtr<FC_MountDisallowed>();
    const FC_MountDisallowed DefaultValue = FC_MountDisallowed();
}
namespace __INTENRAL_FCE_OnBeginMount_NS
{
    const TECSEventDerivedPtr<FCE_OnBeginMount> DerivedPtr = TECSEventDerivedPtr<FCE_OnBeginMount>();
}
namespace __INTENRAL_FCE_OnEndMount_NS
{
    const TECSEventDerivedPtr<FCE_OnEndMount> DerivedPtr = TECSEventDerivedPtr<FCE_OnEndMount>();

}
struct FMountSeatInfo
{
    UPROPERTY()
    FName SocketName;
    UPROPERTY()
    FVector AttachLocationOffset;
    UPROPERTY()
    FRotator AttachRotationOffset;
    UPROPERTY()
    FVector DetachLocationOffset;
    UPROPERTY()
    FRotator DetachRotationOffset;

    FMountSeatInfo()
    {
        return;
    }
}

struct FC_MountSeatsConfig : FECSComponent
{
    UPROPERTY()
    TArray<FMountSeatInfo> MountSeatInfos;

    FC_MountSeatsConfig()
    {
        return;
    }
    void PostPrefabLoad(const FECSEntity &inout Entity)
    {
        int local_6 = 0;
        local_6.GetModify_RiddenByEntities().SetNum(this.Num());
        local_6.GetModify_ReservedByEntities().SetNum(this.Num());
        return;
    }
}

struct FC_RuntimeMountSeatInfo : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    TArray<FECSEntity> m_RiddenByEntities;
    UPROPERTY()
    TArray<FECSEntity> m_ReservedByEntities;

    FC_RuntimeMountSeatInfo()
    {
        this.__InitDirtyFlags();
        return;
    }
    FC_RuntimeMountSeatInfo(const FC_RuntimeMountSeatInfo &inout Other)
    {
        this.__InitDirtyFlags();
        this.m_RiddenByEntities = Other.m_RiddenByEntities;
        this.m_ReservedByEntities = Other.m_ReservedByEntities;
        return;
    }
    FC_RuntimeMountSeatInfo opAssign(const FC_RuntimeMountSeatInfo &inout Other)
    {
        FC_RuntimeMountSeatInfo __r;
        this.SetRiddenByEntities(Other.GetRiddenByEntities());
        this.SetReservedByEntities(Other.GetReservedByEntities());
        return __r;
    }
    int GetAvailableSeatIndex(const bool bIncludeDriverSeat = false) const
    {
        int local_2 = bIncludeDriverSeat ? 0 : 1;
        for (; local_2 < this.GetRiddenByEntities().Num(); ++local_2)
        {
            if (!(this.GetRiddenByEntities()[local_2].IsValid()))
            {
                return local_2;
            }
        }
        return -1;
    }
    bool IsSeatAvailable(const int SeatIndex) const
    {
        if (SeatIndex < 0 || (SeatIndex >= this.GetRiddenByEntities().Num()))
        {
            return false;
        }
        return !(this.GetRiddenByEntities()[SeatIndex].IsValid());
    }
    int GetPassengerCount() const
    {
        int local_1 = 0;
        int local_3 = 1;
        for (; local_3 < this.GetRiddenByEntities().Num(); ++local_3)
        {
            if (this.GetRiddenByEntities()[local_3].IsValid())
            {
                ++local_1;
            }
        }
        return local_1;
    }
    FECSEntity GetPassenger(const int InPassengerIdx) const
    {
        int local_1 = -1;
        int local_3 = 1;
        for (; local_3 < this.GetRiddenByEntities().Num(); ++local_3)
        {
            if (this.GetRiddenByEntities()[local_3].IsValid())
            {
                ++local_1;
                if (local_1 == InPassengerIdx)
                {
                    return this.GetRiddenByEntities()[local_3];
                }
            }
        }
        return ENTITY_NULL;
    }
    FECSEntity GetFirstPassenger() const
    {
        return this.GetPassenger(0);
    }
    const TArray<FECSEntity> GetRiddenByEntities() const property
    {
        const TArray<FECSEntity> __r;
        return __r;
    }
    TArray<FECSEntity> GetModify_RiddenByEntities() property
    {
        TArray<FECSEntity> __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetRiddenByEntities(const TArray<FECSEntity> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_RiddenByEntities = __Value;
        return;
    }
    const TArray<FECSEntity> GetReservedByEntities() const property
    {
        const TArray<FECSEntity> __r;
        return __r;
    }
    TArray<FECSEntity> GetModify_ReservedByEntities() property
    {
        TArray<FECSEntity> __r;
        this.__MarkDirty(1);
        return __r;
    }
    void SetReservedByEntities(const TArray<FECSEntity> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_ReservedByEntities = __Value;
        return;
    }
}

struct FC_MountDashConfig : FECSComponent
{
    UPROPERTY()
    TObjectPtr<UCurveFloat> DashSpeedCurve;

    FC_MountDashConfig()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
}

struct FC_ControllerEquipMount : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    FECSEntity m_MountEntity;

    FC_ControllerEquipMount()
    {
        this.__InitDirtyFlags();
        return;
    }
    FC_ControllerEquipMount(const FC_ControllerEquipMount &inout Other)
    {
        this.__InitDirtyFlags();
        this.m_MountEntity = Other.m_MountEntity;
        return;
    }
    FC_ControllerEquipMount opAssign(const FC_ControllerEquipMount &inout Other)
    {
        FC_ControllerEquipMount __r;
        this.SetMountEntity(Other.GetMountEntity());
        return __r;
    }
    const FECSEntity GetMountEntity() const property
    {
        const FECSEntity __r;
        return __r;
    }
    FECSEntity GetModify_MountEntity() property
    {
        FECSEntity __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetMountEntity(const FECSEntity &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_MountEntity = __Value;
        return;
    }
}

struct FC_PawnRiddingMount : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    FECSEntity m_MountEntity;
    UPROPERTY()
    int m_SeatIndex;

    FC_PawnRiddingMount()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_PawnRiddingMount(const FC_PawnRiddingMount &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_PawnRiddingMount opAssign(const FC_PawnRiddingMount &inout Other)
    {
        FC_PawnRiddingMount __r;
        this.SetMountEntity(Other.GetMountEntity());
        this.SetSeatIndex(Other.GetSeatIndex());
        return __r;
    }
    bool IsMountActive() const
    {
        return this.GetMountEntity().IsActive();
    }
    bool IsDriver() const
    {
        return (this.GetSeatIndex() == 0);
    }
    bool HasPassenger() const
    {
        GetDefaulted local_6;
        return this.IsDriver() && (local_6.opCall().GetPassengerCount() > 0);
    }
    const FECSEntity GetMountEntity() const property
    {
        const FECSEntity __r;
        return __r;
    }
    FECSEntity GetModify_MountEntity() property
    {
        FECSEntity __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetMountEntity(const FECSEntity &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_MountEntity = __Value;
        return;
    }
    int GetSeatIndex() const property
    {
        return this.m_SeatIndex;
    }
    void SetSeatIndex(const int __Value) property
    {
        if (this.m_SeatIndex == __Value)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_SeatIndex = __Value;
        return;
    }
}

struct FC_MountIsDrivenBy : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    FECSEntity m_DriverEntity;

    FC_MountIsDrivenBy()
    {
        this.__InitDirtyFlags();
        return;
    }
    FC_MountIsDrivenBy(const FC_MountIsDrivenBy &inout Other)
    {
        this.__InitDirtyFlags();
        this.m_DriverEntity = Other.m_DriverEntity;
        return;
    }
    FC_MountIsDrivenBy opAssign(const FC_MountIsDrivenBy &inout Other)
    {
        FC_MountIsDrivenBy __r;
        this.SetDriverEntity(Other.GetDriverEntity());
        return __r;
    }
    bool IsDriverActive() const
    {
        return this.GetDriverEntity().IsActive();
    }
    const FECSEntity GetDriverEntity() const property
    {
        const FECSEntity __r;
        return __r;
    }
    FECSEntity GetModify_DriverEntity() property
    {
        FECSEntity __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetDriverEntity(const FECSEntity &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_DriverEntity = __Value;
        return;
    }
}

struct FC_MountPendingInitTag : FECSComponent
{
    FC_MountPendingInitTag()
    {
        return;
    }
}

struct FC_MountPendingChangeTag : FECSComponent
{
    FC_MountPendingChangeTag()
    {
        return;
    }
}

struct FC_MountPendingInactive : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    FFPTime m_InactiveTime;

    FC_MountPendingInactive()
    {
        this.__InitDirtyFlags();
        return;
    }
    FC_MountPendingInactive(const FC_MountPendingInactive &inout Other)
    {
        this.__InitDirtyFlags();
        this.m_InactiveTime = Other.m_InactiveTime;
        return;
    }
    FC_MountPendingInactive opAssign(const FC_MountPendingInactive &inout Other)
    {
        FC_MountPendingInactive __r;
        this.SetInactiveTime(Other.GetInactiveTime());
        return __r;
    }
    const FFPTime GetInactiveTime() const property
    {
        const FFPTime __r;
        return __r;
    }
    FFPTime GetModify_InactiveTime() property
    {
        FFPTime __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetInactiveTime(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_InactiveTime = __Value;
        return;
    }
}

struct FC_MountDisallowed : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    bool m_bIsDisallowed;

    FC_MountDisallowed()
    {
        this.m_bIsDisallowed = false;
        this.__InitDirtyFlags();
        return;
    }
    FC_MountDisallowed(const FC_MountDisallowed &inout Other)
    {
        this.m_bIsDisallowed = false;
        this.__InitDirtyFlags();
        this.m_bIsDisallowed = Other.m_bIsDisallowed;
        return;
    }
    FC_MountDisallowed opAssign(const FC_MountDisallowed &inout Other)
    {
        FC_MountDisallowed __r;
        this.SetbIsDisallowed(Other.GetbIsDisallowed());
        return __r;
    }
    bool GetbIsDisallowed() const property
    {
        return this.m_bIsDisallowed;
    }
    void SetbIsDisallowed(const bool __Value) property
    {
        if (!(this.m_bIsDisallowed) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_bIsDisallowed = __Value;
        return;
    }
}

struct FCE_OnBeginMount : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FECSEntity MountEntity;
    UPROPERTY()
    bool bIsDriver = false;
    UPROPERTY()
    bool bIsPrivateMount = false;


}

struct FCE_OnEndMount : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FECSEntity MountEntity;
    UPROPERTY()
    bool bIsDriver = false;
    UPROPERTY()
    bool bIsPrivateMount = false;


}

namespace ECSFunc_FC_MountSeatsConfig
{
UFUNCTION()
bool HasMountSeatsConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_MountSeatsConfig);
}
FC_MountSeatsConfig& AssignMountSeatsConfig(const FECSEntity &inout Entity, const FC_MountSeatsConfig &inout DefaultValue = FC_MountSeatsConfig())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_MountSeatsConfig, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignMountSeatsConfig_BP(const FECSEntity &inout Entity, const FC_MountSeatsConfig &inout DefaultValue = FC_MountSeatsConfig())
{
    ECSFunc_FC_MountSeatsConfig::AssignMountSeatsConfig(Entity, DefaultValue);
    return;
}
FC_MountSeatsConfig& ModifyMountSeatsConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_MountSeatsConfig));
    return local_12.GetComp();
}
FC_MountSeatsConfig& ModifyOrAddMountSeatsConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_MountSeatsConfig));
    return local_12.GetComp();
}
const FC_MountSeatsConfig& GetMountSeatsConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_MountSeatsConfig));
    return local_12.GetComp();
}
UFUNCTION()
FC_MountSeatsConfig GetMountSeatsConfig_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_MountSeatsConfig __r;
    bValid = false;
    bValid = ECSFunc_FC_MountSeatsConfig::GetMountSeatsConfig(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_MountSeatsConfig GetDefaultedMountSeatsConfig(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_MountSeatsConfig __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_MountSeatsConfig);
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
FC_MountSeatsConfig GetDefaultedMountSeatsConfig_BP(const FECSEntity &inout Entity)
{
    FC_MountSeatsConfig __r;
    return __r;
}
UFUNCTION()
bool RemoveMountSeatsConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_MountSeatsConfig);
}
}
FECSMonitorRuntimeView __GetMonitorMountSeatsConfigOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_MountSeatsConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorMountSeatsConfigOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_MountSeatsConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorMountSeatsConfigOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_MountSeatsConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorMountSeatsConfigOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_MountSeatsConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorMountSeatsConfigOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_MountSeatsConfig, bFixedFrame, bMustHandleAll);
}
void __MonitorMountSeatsConfigLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_MountSeatsConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorMountSeatsConfigActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_MountSeatsConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorMountSeatsConfigModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_MountSeatsConfig, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_RuntimeMountSeatInfo
{
UFUNCTION()
bool HasRuntimeMountSeatInfo(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_RuntimeMountSeatInfo);
}
FC_RuntimeMountSeatInfo& AssignRuntimeMountSeatInfo(const FECSEntity &inout Entity, const FC_RuntimeMountSeatInfo &inout DefaultValue = FC_RuntimeMountSeatInfo())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_RuntimeMountSeatInfo, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignRuntimeMountSeatInfo_BP(const FECSEntity &inout Entity, const FC_RuntimeMountSeatInfo &inout DefaultValue = FC_RuntimeMountSeatInfo())
{
    ECSFunc_FC_RuntimeMountSeatInfo::AssignRuntimeMountSeatInfo(Entity, DefaultValue);
    return;
}
FC_RuntimeMountSeatInfo& ModifyRuntimeMountSeatInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_RuntimeMountSeatInfo));
    return local_12.GetComp();
}
FC_RuntimeMountSeatInfo& ModifyOrAddRuntimeMountSeatInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_RuntimeMountSeatInfo));
    return local_12.GetComp();
}
const FC_RuntimeMountSeatInfo& GetRuntimeMountSeatInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_RuntimeMountSeatInfo));
    return local_12.GetComp();
}
UFUNCTION()
FC_RuntimeMountSeatInfo GetRuntimeMountSeatInfo_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_RuntimeMountSeatInfo& local_4 = ECSFunc_FC_RuntimeMountSeatInfo::GetRuntimeMountSeatInfo(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_RuntimeMountSeatInfo();
}
const FC_RuntimeMountSeatInfo GetDefaultedRuntimeMountSeatInfo(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_RuntimeMountSeatInfo __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_RuntimeMountSeatInfo);
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
FC_RuntimeMountSeatInfo GetDefaultedRuntimeMountSeatInfo_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_RuntimeMountSeatInfo::GetDefaultedRuntimeMountSeatInfo(Entity);
}
UFUNCTION()
bool RemoveRuntimeMountSeatInfo(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_RuntimeMountSeatInfo);
}
}
FECSMonitorRuntimeView __GetMonitorRuntimeMountSeatInfoOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_RuntimeMountSeatInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorRuntimeMountSeatInfoOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_RuntimeMountSeatInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorRuntimeMountSeatInfoOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_RuntimeMountSeatInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorRuntimeMountSeatInfoOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_RuntimeMountSeatInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorRuntimeMountSeatInfoOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_RuntimeMountSeatInfo, bFixedFrame, bMustHandleAll);
}
void __MonitorRuntimeMountSeatInfoLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_RuntimeMountSeatInfo, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorRuntimeMountSeatInfoActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_RuntimeMountSeatInfo, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorRuntimeMountSeatInfoModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_RuntimeMountSeatInfo, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_MountDashConfig
{
UFUNCTION()
bool HasMountDashConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_MountDashConfig);
}
FC_MountDashConfig& AssignMountDashConfig(const FECSEntity &inout Entity, const FC_MountDashConfig &inout DefaultValue = FC_MountDashConfig())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_MountDashConfig, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignMountDashConfig_BP(const FECSEntity &inout Entity, const FC_MountDashConfig &inout DefaultValue = FC_MountDashConfig())
{
    ECSFunc_FC_MountDashConfig::AssignMountDashConfig(Entity, DefaultValue);
    return;
}
FC_MountDashConfig& ModifyMountDashConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_MountDashConfig));
    return local_12.GetComp();
}
FC_MountDashConfig& ModifyOrAddMountDashConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_MountDashConfig));
    return local_12.GetComp();
}
const FC_MountDashConfig& GetMountDashConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_MountDashConfig));
    return local_12.GetComp();
}
UFUNCTION()
FC_MountDashConfig GetMountDashConfig_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_MountDashConfig __r;
    bValid = false;
    bValid = ECSFunc_FC_MountDashConfig::GetMountDashConfig(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_MountDashConfig GetDefaultedMountDashConfig(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_MountDashConfig __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_MountDashConfig);
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
FC_MountDashConfig GetDefaultedMountDashConfig_BP(const FECSEntity &inout Entity)
{
    FC_MountDashConfig __r;
    return __r;
}
UFUNCTION()
bool RemoveMountDashConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_MountDashConfig);
}
}
FECSMonitorRuntimeView __GetMonitorMountDashConfigOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_MountDashConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorMountDashConfigOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_MountDashConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorMountDashConfigOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_MountDashConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorMountDashConfigOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_MountDashConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorMountDashConfigOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_MountDashConfig, bFixedFrame, bMustHandleAll);
}
void __MonitorMountDashConfigLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_MountDashConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorMountDashConfigActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_MountDashConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorMountDashConfigModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_MountDashConfig, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_ControllerEquipMount
{
UFUNCTION()
bool HasControllerEquipMount(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_ControllerEquipMount);
}
FC_ControllerEquipMount& AssignControllerEquipMount(const FECSEntity &inout Entity, const FC_ControllerEquipMount &inout DefaultValue = FC_ControllerEquipMount())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_ControllerEquipMount, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignControllerEquipMount_BP(const FECSEntity &inout Entity, const FC_ControllerEquipMount &inout DefaultValue = FC_ControllerEquipMount())
{
    ECSFunc_FC_ControllerEquipMount::AssignControllerEquipMount(Entity, DefaultValue);
    return;
}
FC_ControllerEquipMount& ModifyControllerEquipMount(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_ControllerEquipMount));
    return local_12.GetComp();
}
FC_ControllerEquipMount& ModifyOrAddControllerEquipMount(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_ControllerEquipMount));
    return local_12.GetComp();
}
const FC_ControllerEquipMount& GetControllerEquipMount(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_ControllerEquipMount));
    return local_12.GetComp();
}
UFUNCTION()
FC_ControllerEquipMount GetControllerEquipMount_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_ControllerEquipMount& local_4 = ECSFunc_FC_ControllerEquipMount::GetControllerEquipMount(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_ControllerEquipMount();
}
const FC_ControllerEquipMount GetDefaultedControllerEquipMount(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_ControllerEquipMount __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_ControllerEquipMount);
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
FC_ControllerEquipMount GetDefaultedControllerEquipMount_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_ControllerEquipMount::GetDefaultedControllerEquipMount(Entity);
}
UFUNCTION()
bool RemoveControllerEquipMount(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_ControllerEquipMount);
}
}
FECSMonitorRuntimeView __GetMonitorControllerEquipMountOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_ControllerEquipMount, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorControllerEquipMountOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_ControllerEquipMount, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorControllerEquipMountOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_ControllerEquipMount, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorControllerEquipMountOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_ControllerEquipMount, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorControllerEquipMountOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_ControllerEquipMount, bFixedFrame, bMustHandleAll);
}
void __MonitorControllerEquipMountLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_ControllerEquipMount, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorControllerEquipMountActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_ControllerEquipMount, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorControllerEquipMountModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_ControllerEquipMount, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_PawnRiddingMount
{
UFUNCTION()
bool HasPawnRiddingMount(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_PawnRiddingMount);
}
FC_PawnRiddingMount& AssignPawnRiddingMount(const FECSEntity &inout Entity, const FC_PawnRiddingMount &inout DefaultValue = FC_PawnRiddingMount())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_PawnRiddingMount, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignPawnRiddingMount_BP(const FECSEntity &inout Entity, const FC_PawnRiddingMount &inout DefaultValue = FC_PawnRiddingMount())
{
    ECSFunc_FC_PawnRiddingMount::AssignPawnRiddingMount(Entity, DefaultValue);
    return;
}
FC_PawnRiddingMount& ModifyPawnRiddingMount(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_PawnRiddingMount));
    return local_12.GetComp();
}
FC_PawnRiddingMount& ModifyOrAddPawnRiddingMount(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_PawnRiddingMount));
    return local_12.GetComp();
}
const FC_PawnRiddingMount& GetPawnRiddingMount(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_PawnRiddingMount));
    return local_12.GetComp();
}
UFUNCTION()
FC_PawnRiddingMount GetPawnRiddingMount_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_PawnRiddingMount& local_4 = ECSFunc_FC_PawnRiddingMount::GetPawnRiddingMount(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_PawnRiddingMount();
}
const FC_PawnRiddingMount GetDefaultedPawnRiddingMount(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_PawnRiddingMount __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_PawnRiddingMount);
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
FC_PawnRiddingMount GetDefaultedPawnRiddingMount_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_PawnRiddingMount::GetDefaultedPawnRiddingMount(Entity);
}
UFUNCTION()
bool RemovePawnRiddingMount(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_PawnRiddingMount);
}
}
FECSMonitorRuntimeView __GetMonitorPawnRiddingMountOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_PawnRiddingMount, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPawnRiddingMountOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_PawnRiddingMount, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPawnRiddingMountOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_PawnRiddingMount, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPawnRiddingMountOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_PawnRiddingMount, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPawnRiddingMountOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_PawnRiddingMount, bFixedFrame, bMustHandleAll);
}
void __MonitorPawnRiddingMountLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_PawnRiddingMount, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPawnRiddingMountActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_PawnRiddingMount, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPawnRiddingMountModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_PawnRiddingMount, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_MountIsDrivenBy
{
UFUNCTION()
bool HasMountIsDrivenBy(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_MountIsDrivenBy);
}
FC_MountIsDrivenBy& AssignMountIsDrivenBy(const FECSEntity &inout Entity, const FC_MountIsDrivenBy &inout DefaultValue = FC_MountIsDrivenBy())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_MountIsDrivenBy, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignMountIsDrivenBy_BP(const FECSEntity &inout Entity, const FC_MountIsDrivenBy &inout DefaultValue = FC_MountIsDrivenBy())
{
    ECSFunc_FC_MountIsDrivenBy::AssignMountIsDrivenBy(Entity, DefaultValue);
    return;
}
FC_MountIsDrivenBy& ModifyMountIsDrivenBy(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_MountIsDrivenBy));
    return local_12.GetComp();
}
FC_MountIsDrivenBy& ModifyOrAddMountIsDrivenBy(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_MountIsDrivenBy));
    return local_12.GetComp();
}
const FC_MountIsDrivenBy& GetMountIsDrivenBy(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_MountIsDrivenBy));
    return local_12.GetComp();
}
UFUNCTION()
FC_MountIsDrivenBy GetMountIsDrivenBy_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_MountIsDrivenBy& local_4 = ECSFunc_FC_MountIsDrivenBy::GetMountIsDrivenBy(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_MountIsDrivenBy();
}
const FC_MountIsDrivenBy GetDefaultedMountIsDrivenBy(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_MountIsDrivenBy __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_MountIsDrivenBy);
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
FC_MountIsDrivenBy GetDefaultedMountIsDrivenBy_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_MountIsDrivenBy::GetDefaultedMountIsDrivenBy(Entity);
}
UFUNCTION()
bool RemoveMountIsDrivenBy(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_MountIsDrivenBy);
}
}
FECSMonitorRuntimeView __GetMonitorMountIsDrivenByOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_MountIsDrivenBy, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorMountIsDrivenByOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_MountIsDrivenBy, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorMountIsDrivenByOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_MountIsDrivenBy, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorMountIsDrivenByOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_MountIsDrivenBy, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorMountIsDrivenByOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_MountIsDrivenBy, bFixedFrame, bMustHandleAll);
}
void __MonitorMountIsDrivenByLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_MountIsDrivenBy, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorMountIsDrivenByActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_MountIsDrivenBy, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorMountIsDrivenByModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_MountIsDrivenBy, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_MountPendingInitTag
{
UFUNCTION()
bool HasMountPendingInitTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_MountPendingInitTag);
}
FC_MountPendingInitTag& AssignMountPendingInitTag(const FECSEntity &inout Entity, const FC_MountPendingInitTag &inout DefaultValue = FC_MountPendingInitTag())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_MountPendingInitTag, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignMountPendingInitTag_BP(const FECSEntity &inout Entity, const FC_MountPendingInitTag &inout DefaultValue = FC_MountPendingInitTag())
{
    ECSFunc_FC_MountPendingInitTag::AssignMountPendingInitTag(Entity, DefaultValue);
    return;
}
FC_MountPendingInitTag& ModifyMountPendingInitTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_MountPendingInitTag));
    return local_12.GetComp();
}
FC_MountPendingInitTag& ModifyOrAddMountPendingInitTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_MountPendingInitTag));
    return local_12.GetComp();
}
const FC_MountPendingInitTag& GetMountPendingInitTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_MountPendingInitTag));
    return local_12.GetComp();
}
UFUNCTION()
FC_MountPendingInitTag GetMountPendingInitTag_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_MountPendingInitTag& local_4 = ECSFunc_FC_MountPendingInitTag::GetMountPendingInitTag(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_MountPendingInitTag();
}
const FC_MountPendingInitTag GetDefaultedMountPendingInitTag(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_MountPendingInitTag __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_MountPendingInitTag);
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
FC_MountPendingInitTag GetDefaultedMountPendingInitTag_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_MountPendingInitTag::GetDefaultedMountPendingInitTag(Entity);
}
UFUNCTION()
bool RemoveMountPendingInitTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_MountPendingInitTag);
}
}
FECSMonitorRuntimeView __GetMonitorMountPendingInitTagOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_MountPendingInitTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorMountPendingInitTagOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_MountPendingInitTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorMountPendingInitTagOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_MountPendingInitTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorMountPendingInitTagOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_MountPendingInitTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorMountPendingInitTagOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_MountPendingInitTag, bFixedFrame, bMustHandleAll);
}
void __MonitorMountPendingInitTagLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_MountPendingInitTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorMountPendingInitTagActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_MountPendingInitTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorMountPendingInitTagModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_MountPendingInitTag, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_MountPendingChangeTag
{
UFUNCTION()
bool HasMountPendingChangeTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_MountPendingChangeTag);
}
FC_MountPendingChangeTag& AssignMountPendingChangeTag(const FECSEntity &inout Entity, const FC_MountPendingChangeTag &inout DefaultValue = FC_MountPendingChangeTag())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_MountPendingChangeTag, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignMountPendingChangeTag_BP(const FECSEntity &inout Entity, const FC_MountPendingChangeTag &inout DefaultValue = FC_MountPendingChangeTag())
{
    ECSFunc_FC_MountPendingChangeTag::AssignMountPendingChangeTag(Entity, DefaultValue);
    return;
}
FC_MountPendingChangeTag& ModifyMountPendingChangeTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_MountPendingChangeTag));
    return local_12.GetComp();
}
FC_MountPendingChangeTag& ModifyOrAddMountPendingChangeTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_MountPendingChangeTag));
    return local_12.GetComp();
}
const FC_MountPendingChangeTag& GetMountPendingChangeTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_MountPendingChangeTag));
    return local_12.GetComp();
}
UFUNCTION()
FC_MountPendingChangeTag GetMountPendingChangeTag_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_MountPendingChangeTag& local_4 = ECSFunc_FC_MountPendingChangeTag::GetMountPendingChangeTag(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_MountPendingChangeTag();
}
const FC_MountPendingChangeTag GetDefaultedMountPendingChangeTag(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_MountPendingChangeTag __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_MountPendingChangeTag);
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
FC_MountPendingChangeTag GetDefaultedMountPendingChangeTag_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_MountPendingChangeTag::GetDefaultedMountPendingChangeTag(Entity);
}
UFUNCTION()
bool RemoveMountPendingChangeTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_MountPendingChangeTag);
}
}
FECSMonitorRuntimeView __GetMonitorMountPendingChangeTagOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_MountPendingChangeTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorMountPendingChangeTagOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_MountPendingChangeTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorMountPendingChangeTagOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_MountPendingChangeTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorMountPendingChangeTagOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_MountPendingChangeTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorMountPendingChangeTagOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_MountPendingChangeTag, bFixedFrame, bMustHandleAll);
}
void __MonitorMountPendingChangeTagLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_MountPendingChangeTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorMountPendingChangeTagActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_MountPendingChangeTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorMountPendingChangeTagModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_MountPendingChangeTag, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_MountPendingInactive
{
UFUNCTION()
bool HasMountPendingInactive(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_MountPendingInactive);
}
FC_MountPendingInactive& AssignMountPendingInactive(const FECSEntity &inout Entity, const FC_MountPendingInactive &inout DefaultValue = FC_MountPendingInactive())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_MountPendingInactive, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignMountPendingInactive_BP(const FECSEntity &inout Entity, const FC_MountPendingInactive &inout DefaultValue = FC_MountPendingInactive())
{
    ECSFunc_FC_MountPendingInactive::AssignMountPendingInactive(Entity, DefaultValue);
    return;
}
FC_MountPendingInactive& ModifyMountPendingInactive(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_MountPendingInactive));
    return local_12.GetComp();
}
FC_MountPendingInactive& ModifyOrAddMountPendingInactive(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_MountPendingInactive));
    return local_12.GetComp();
}
const FC_MountPendingInactive& GetMountPendingInactive(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_MountPendingInactive));
    return local_12.GetComp();
}
UFUNCTION()
FC_MountPendingInactive GetMountPendingInactive_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_MountPendingInactive& local_4 = ECSFunc_FC_MountPendingInactive::GetMountPendingInactive(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_MountPendingInactive();
}
const FC_MountPendingInactive GetDefaultedMountPendingInactive(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_MountPendingInactive __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_MountPendingInactive);
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
FC_MountPendingInactive GetDefaultedMountPendingInactive_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_MountPendingInactive::GetDefaultedMountPendingInactive(Entity);
}
UFUNCTION()
bool RemoveMountPendingInactive(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_MountPendingInactive);
}
}
FECSMonitorRuntimeView __GetMonitorMountPendingInactiveOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_MountPendingInactive, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorMountPendingInactiveOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_MountPendingInactive, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorMountPendingInactiveOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_MountPendingInactive, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorMountPendingInactiveOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_MountPendingInactive, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorMountPendingInactiveOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_MountPendingInactive, bFixedFrame, bMustHandleAll);
}
void __MonitorMountPendingInactiveLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_MountPendingInactive, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorMountPendingInactiveActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_MountPendingInactive, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorMountPendingInactiveModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_MountPendingInactive, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_MountDisallowed
{
UFUNCTION()
bool HasMountDisallowed(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_MountDisallowed);
}
FC_MountDisallowed& AssignMountDisallowed(const FECSEntity &inout Entity, const FC_MountDisallowed &inout DefaultValue = FC_MountDisallowed())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_MountDisallowed, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignMountDisallowed_BP(const FECSEntity &inout Entity, const FC_MountDisallowed &inout DefaultValue = FC_MountDisallowed())
{
    ECSFunc_FC_MountDisallowed::AssignMountDisallowed(Entity, DefaultValue);
    return;
}
FC_MountDisallowed& ModifyMountDisallowed(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_MountDisallowed));
    return local_12.GetComp();
}
FC_MountDisallowed& ModifyOrAddMountDisallowed(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_MountDisallowed));
    return local_12.GetComp();
}
const FC_MountDisallowed& GetMountDisallowed(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_MountDisallowed));
    return local_12.GetComp();
}
UFUNCTION()
FC_MountDisallowed GetMountDisallowed_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_MountDisallowed& local_4 = ECSFunc_FC_MountDisallowed::GetMountDisallowed(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_MountDisallowed();
}
const FC_MountDisallowed GetDefaultedMountDisallowed(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_MountDisallowed __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_MountDisallowed);
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
FC_MountDisallowed GetDefaultedMountDisallowed_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_MountDisallowed::GetDefaultedMountDisallowed(Entity);
}
UFUNCTION()
bool RemoveMountDisallowed(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_MountDisallowed);
}
}
FECSMonitorRuntimeView __GetMonitorMountDisallowedOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_MountDisallowed, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorMountDisallowedOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_MountDisallowed, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorMountDisallowedOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_MountDisallowed, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorMountDisallowedOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_MountDisallowed, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorMountDisallowedOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_MountDisallowed, bFixedFrame, bMustHandleAll);
}
void __MonitorMountDisallowedLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_MountDisallowed, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorMountDisallowedActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_MountDisallowed, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorMountDisallowedModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_MountDisallowed, bFixedFrame, Details);
    return;
}
namespace EntityBB
{
void GetEntityBBVar_PawnRiddingMount_MountEntity(const FECSEntity &inout Entity, FECSEntity &inout OutRetValue)
{
    GetDefaulted local_4;
    OutRetValue = FECSEntity(local_4.opCall().GetMountEntity());
    return;
}
void GetEntityBBVar_MountIsDrivenBy_DriverEntity(const FECSEntity &inout Entity, FECSEntity &inout OutRetValue)
{
    GetDefaulted local_4;
    OutRetValue = FECSEntity(local_4.opCall().GetDriverEntity());
    return;
}
void GetEntityBBVar_MountDisallowed_bIsDisallowed(const FECSEntity &inout Entity, bool &inout OutRetValue)
{
    GetDefaulted local_4;
    OutRetValue = local_4.opCall().GetbIsDisallowed();
    return;
}
void GetEntityBBVar_RuntimeMountSeatInfo_GetPassengerCount(const FECSEntity &inout Entity, int &inout OutRetValue)
{
    GetDefaulted local_4;
    OutRetValue = local_4.opCall().GetPassengerCount();
    return;
}
void GetEntityBBVar_RuntimeMountSeatInfo_GetFirstPassenger(const FECSEntity &inout Entity, FECSEntity &inout OutRetValue)
{
    GetDefaulted local_4;
    OutRetValue = FECSEntity(local_4.opCall().GetFirstPassenger());
    return;
}
void GetEntityBBVar_PawnRiddingMount_IsMountActive(const FECSEntity &inout Entity, bool &inout OutRetValue)
{
    GetDefaulted local_4;
    OutRetValue = local_4.opCall().IsMountActive();
    return;
}
void GetEntityBBVar_PawnRiddingMount_IsDriver(const FECSEntity &inout Entity, bool &inout OutRetValue)
{
    GetDefaulted local_4;
    OutRetValue = local_4.opCall().IsDriver();
    return;
}
void GetEntityBBVar_PawnRiddingMount_HasPassenger(const FECSEntity &inout Entity, bool &inout OutRetValue)
{
    GetDefaulted local_4;
    OutRetValue = local_4.opCall().HasPassenger();
    return;
}
void GetEntityBBVar_MountIsDrivenBy_IsDriverActive(const FECSEntity &inout Entity, bool &inout OutRetValue)
{
    GetDefaulted local_4;
    OutRetValue = local_4.opCall().IsDriverActive();
    return;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_RuntimeMountSeatInfo &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_RuntimeMountSeatInfo &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_RuntimeMountSeatInfo &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_RuntimeMountSeatInfo
{
int __IndexOf_RiddenByEntities()
{
    return 0;
}
int __IndexOf_ReservedByEntities()
{
    return 1;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_ControllerEquipMount &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_ControllerEquipMount &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_ControllerEquipMount &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_ControllerEquipMount
{
int __IndexOf_MountEntity()
{
    return 0;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_PawnRiddingMount &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_PawnRiddingMount &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_PawnRiddingMount &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_PawnRiddingMount
{
int __IndexOf_MountEntity()
{
    return 0;
}
int __IndexOf_SeatIndex()
{
    return 1;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_MountIsDrivenBy &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_MountIsDrivenBy &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_MountIsDrivenBy &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_MountIsDrivenBy
{
int __IndexOf_DriverEntity()
{
    return 0;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_MountPendingInactive &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_MountPendingInactive &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_MountPendingInactive &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_MountPendingInactive
{
int __IndexOf_InactiveTime()
{
    return 0;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_MountDisallowed &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_MountDisallowed &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_MountDisallowed &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_MountDisallowed
{
int __IndexOf_bIsDisallowed()
{
    return 0;
}
}
