
namespace __INTENRAL_FC_Mark_RemoveWhenNoLongerGuidingTargetTag_NS
{
    const TECSComponentDerivedPtr<FC_Mark_RemoveWhenNoLongerGuidingTargetTag> DerivedPtr = TECSComponentDerivedPtr<FC_Mark_RemoveWhenNoLongerGuidingTargetTag>();
    const FC_Mark_RemoveWhenNoLongerGuidingTargetTag DefaultValue = FC_Mark_RemoveWhenNoLongerGuidingTargetTag();
}
namespace __INTENRAL_FC_Mark_RemoveWhenCreaterApproachDistanceTag_NS
{
    const TECSComponentDerivedPtr<FC_Mark_RemoveWhenCreaterApproachDistanceTag> DerivedPtr = TECSComponentDerivedPtr<FC_Mark_RemoveWhenCreaterApproachDistanceTag>();
    const FC_Mark_RemoveWhenCreaterApproachDistanceTag DefaultValue = FC_Mark_RemoveWhenCreaterApproachDistanceTag();
}
namespace __INTENRAL_FC_Mark_ActorComponentPendingInitTag_NS
{
    const TECSComponentDerivedPtr<FC_Mark_ActorComponentPendingInitTag> DerivedPtr = TECSComponentDerivedPtr<FC_Mark_ActorComponentPendingInitTag>();
    const FC_Mark_ActorComponentPendingInitTag DefaultValue = FC_Mark_ActorComponentPendingInitTag();
}
namespace __INTENRAL_FC_Mark_NS
{
    const TECSComponentDerivedPtr<FC_Mark> DerivedPtr = TECSComponentDerivedPtr<FC_Mark>();
    const FC_Mark DefaultValue = FC_Mark();
}
namespace __INTENRAL_FC_Marked_NS
{
    const TECSComponentDerivedPtr<FC_Marked> DerivedPtr = TECSComponentDerivedPtr<FC_Marked>();
    const FC_Marked DefaultValue = FC_Marked();
}
namespace __INTENRAL_FC_MarkedComponentPendingRemoveTag_NS
{
    const TECSComponentDerivedPtr<FC_MarkedComponentPendingRemoveTag> DerivedPtr = TECSComponentDerivedPtr<FC_MarkedComponentPendingRemoveTag>();
    const FC_MarkedComponentPendingRemoveTag DefaultValue = FC_MarkedComponentPendingRemoveTag();
}
namespace __INTENRAL_FC_PlayerMarks_NS
{
    const TECSComponentDerivedPtr<FC_PlayerMarks> DerivedPtr = TECSComponentDerivedPtr<FC_PlayerMarks>();
    const FC_PlayerMarks DefaultValue = FC_PlayerMarks();
}
namespace __INTENRAL_FC_UpdateMarkLevelSpotViewersDeferTag_NS
{
    const TECSComponentDerivedPtr<FC_UpdateMarkLevelSpotViewersDeferTag> DerivedPtr = TECSComponentDerivedPtr<FC_UpdateMarkLevelSpotViewersDeferTag>();
    const FC_UpdateMarkLevelSpotViewersDeferTag DefaultValue = FC_UpdateMarkLevelSpotViewersDeferTag();
}
namespace __INTENRAL_FC_DispatchFastMarkRequestTag_NS
{
    const TECSComponentDerivedPtr<FC_DispatchFastMarkRequestTag> DerivedPtr = TECSComponentDerivedPtr<FC_DispatchFastMarkRequestTag>();
    const FC_DispatchFastMarkRequestTag DefaultValue = FC_DispatchFastMarkRequestTag();
}
namespace __INTENRAL_FCE_RequestMarkEntity_NS
{
    const TECSEventDerivedPtr<FCE_RequestMarkEntity> DerivedPtr = TECSEventDerivedPtr<FCE_RequestMarkEntity>();
}
namespace __INTENRAL_FCE_RequestMarkLocation_NS
{
    const TECSEventDerivedPtr<FCE_RequestMarkLocation> DerivedPtr = TECSEventDerivedPtr<FCE_RequestMarkLocation>();
}
namespace __INTENRAL_FCE_RequestFastMarkEntity_NS
{
    const TECSEventDerivedPtr<FCE_RequestFastMarkEntity> DerivedPtr = TECSEventDerivedPtr<FCE_RequestFastMarkEntity>();
}
namespace __INTENRAL_FCE_RequestChangeMarkConfig_NS
{
    const TECSEventDerivedPtr<FCE_RequestChangeMarkConfig> DerivedPtr = TECSEventDerivedPtr<FCE_RequestChangeMarkConfig>();
}
namespace __INTENRAL_FCE_RequestRemoveMark_NS
{
    const TECSEventDerivedPtr<FCE_RequestRemoveMark> DerivedPtr = TECSEventDerivedPtr<FCE_RequestRemoveMark>();
}
namespace __INTENRAL_FCE_ServerNotifyUpdateMark_NS
{
    const TECSEventDerivedPtr<FCE_ServerNotifyUpdateMark> DerivedPtr = TECSEventDerivedPtr<FCE_ServerNotifyUpdateMark>();
}
namespace __INTENRAL_FCE_NotifyUI_RefreshVisibleMarks_NS
{
    const TECSEventDerivedPtr<FCE_NotifyUI_RefreshVisibleMarks> DerivedPtr = TECSEventDerivedPtr<FCE_NotifyUI_RefreshVisibleMarks>();

}
struct FMarkInfo
{
    FSubDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    TDataObjectPtr<FMarkConfig> m_MarkConfig;
    UPROPERTY()
    FVector m_MarkPosition;
    UPROPERTY()
    FECSEntityId m_MarkedEntityID;
    UPROPERTY()
    FFPTime m_MarkTime;

    FMarkInfo()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FMarkInfo(const FMarkInfo &inout Other)
    {
        this.m_MarkConfig = Other.m_MarkConfig;
        this.m_MarkPosition = Other.m_MarkPosition;
        this.m_MarkedEntityID = Other.m_MarkedEntityID;
        this.m_MarkTime = Other.m_MarkTime;
        return;
    }
    FMarkInfo opAssign(const FMarkInfo &inout Other)
    {
        FMarkInfo __r;
        this.SetMarkConfig(Other.GetMarkConfig());
        this.SetMarkPosition(Other.GetMarkPosition());
        this.SetMarkedEntityID(Other.GetMarkedEntityID());
        this.SetMarkTime(Other.GetMarkTime());
        return __r;
    }
    const TDataObjectPtr<FMarkConfig> GetMarkConfig() const property
    {
        const TDataObjectPtr<FMarkConfig> __r;
        return __r;
    }
    TDataObjectPtr<FMarkConfig> GetModify_MarkConfig() property
    {
        TDataObjectPtr<FMarkConfig> __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetMarkConfig(const TDataObjectPtr<FMarkConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_MarkConfig = __Value;
        return;
    }
    const FVector GetMarkPosition() const property
    {
        const FVector __r;
        return __r;
    }
    FVector GetModify_MarkPosition() property
    {
        FVector __r;
        this.__MarkDirty(1);
        return __r;
    }
    void SetMarkPosition(const FVector &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_MarkPosition = __Value;
        return;
    }
    const FECSEntityId GetMarkedEntityID() const property
    {
        const FECSEntityId __r;
        return __r;
    }
    FECSEntityId GetModify_MarkedEntityID() property
    {
        FECSEntityId __r;
        this.__MarkDirty(2);
        return __r;
    }
    void SetMarkedEntityID(const FECSEntityId &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_MarkedEntityID = __Value;
        return;
    }
    const FFPTime GetMarkTime() const property
    {
        const FFPTime __r;
        return __r;
    }
    FFPTime GetModify_MarkTime() property
    {
        FFPTime __r;
        this.__MarkDirty(3);
        return __r;
    }
    void SetMarkTime(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(3);
        this.m_MarkTime = __Value;
        return;
    }
}

struct FMarkPool
{
    UPROPERTY()
    int m_NumLimit;
    UPROPERTY()
    TArray<FECSEntity> m_MarkEntities;

    FMarkPool()
    {
        this.m_NumLimit = 0;
        this.SetNumLimit(-1);
        return;
    }
    FMarkPool(const int InNumLimit)
    {
        this.m_NumLimit = 0;
        this.SetNumLimit(InNumLimit);
        return;
    }
    bool IsFull() const
    {
        return this.GetNumLimit() >= 0 && (this.GetMarkEntities().Num() >= this.GetNumLimit());
    }
    bool IsEmpty() const
    {
        return this.GetMarkEntities().IsEmpty();
    }
    void Push(const FECSEntity &inout MarkEntity)
    {
        if (!(this.IsFull()))
        {
            this.GetMarkEntities().Add(MarkEntity);
        }
        return;
    }
    FECSEntity Pop()
    {
        if (!(this.IsEmpty()))
        {
            FECSEntity local_6 = FECSEntity(this.GetMarkEntities()[0]);
            this.GetMarkEntities().RemoveAt(0);
            return local_6;
        }
        return ENTITY_NULL;
    }
    bool Remove(const FECSEntity &inout MarkEntity)
    {
        return (0 > 0);
    }
    const TArray<FECSEntity>& AllMarks() const
    {
        return this.GetMarkEntities();
    }
    int GetNumLimit() const property
    {
        return this.m_NumLimit;
    }
    void SetNumLimit(const int __Value) property
    {
        this.m_NumLimit = __Value;
        return;
    }
    const TArray<FECSEntity> GetMarkEntities() const property
    {
        const TArray<FECSEntity> __r;
        return __r;
    }
    TArray<FECSEntity> GetMarkEntities() property
    {
        TArray<FECSEntity> __r;
        return __r;
    }
    void SetMarkEntities(const TArray<FECSEntity> &inout __Value) property
    {
        this.m_MarkEntities = __Value;
        return;
    }
}

struct FC_Mark_RemoveWhenNoLongerGuidingTargetTag : FECSComponent
{
    FC_Mark_RemoveWhenNoLongerGuidingTargetTag()
    {
        return;
    }
}

struct FC_Mark_RemoveWhenCreaterApproachDistanceTag : FECSComponent
{
    FC_Mark_RemoveWhenCreaterApproachDistanceTag()
    {
        return;
    }
}

struct FC_Mark_ActorComponentPendingInitTag : FECSComponent
{
    FC_Mark_ActorComponentPendingInitTag()
    {
        return;
    }
}

struct FC_Mark : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    FECSEntity m_CreaterPlayer;

    FC_Mark()
    {
        this.__InitDirtyFlags();
        return;
    }
    FC_Mark(const FC_Mark &inout Other)
    {
        this.__InitDirtyFlags();
        this.m_CreaterPlayer = Other.m_CreaterPlayer;
        return;
    }
    FC_Mark opAssign(const FC_Mark &inout Other)
    {
        FC_Mark __r;
        this.SetCreaterPlayer(Other.GetCreaterPlayer());
        return __r;
    }
    const FECSEntity GetCreaterPlayer() const property
    {
        const FECSEntity __r;
        return __r;
    }
    FECSEntity GetModify_CreaterPlayer() property
    {
        FECSEntity __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetCreaterPlayer(const FECSEntity &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_CreaterPlayer = __Value;
        return;
    }
}

struct FC_Marked : FECSComponent
{
    UPROPERTY()
    TArray<FECSEntity> MarkPlayers;

    FC_Marked()
    {
        return;
    }
}

struct FC_MarkedComponentPendingRemoveTag : FECSComponent
{
    FC_MarkedComponentPendingRemoveTag()
    {
        return;
    }
}

struct FC_PlayerMarks : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    TMap<TDataObjectPtr<FMarkPoolConfig>, FMarkPool> m_MarkPools;
    UPROPERTY()
    TMap<FECSEntityId, FMarkInfo> m_AllMarks;

    FC_PlayerMarks()
    {
        this.__InitDirtyFlags();
        return;
    }
    FC_PlayerMarks(const FC_PlayerMarks &inout Other)
    {
        this.__InitDirtyFlags();
        this.m_MarkPools = Other.m_MarkPools;
        this.m_AllMarks = Other.m_AllMarks;
        return;
    }
    FC_PlayerMarks opAssign(const FC_PlayerMarks &inout Other)
    {
        FC_PlayerMarks __r;
        this.SetMarkPools(Other.GetMarkPools());
        this.SetAllMarks(Other.GetAllMarks());
        return __r;
    }
    const TMap<TDataObjectPtr<FMarkPoolConfig>, FMarkPool> GetMarkPools() const property
    {
        const TMap<TDataObjectPtr<FMarkPoolConfig>, FMarkPool> __r;
        return __r;
    }
    TMap<TDataObjectPtr<FMarkPoolConfig>, FMarkPool> GetModify_MarkPools() property
    {
        TMap<TDataObjectPtr<FMarkPoolConfig>, FMarkPool> __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetMarkPools(const TMap<TDataObjectPtr<FMarkPoolConfig>, FMarkPool> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_MarkPools = __Value;
        return;
    }
    const TMap<FECSEntityId, FMarkInfo> GetAllMarks() const property
    {
        const TMap<FECSEntityId, FMarkInfo> __r;
        return __r;
    }
    TMap<FECSEntityId, FMarkInfo> GetModify_AllMarks() property
    {
        TMap<FECSEntityId, FMarkInfo> __r;
        this.__MarkDirty(1);
        return __r;
    }
    void SetAllMarks(const TMap<FECSEntityId, FMarkInfo> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_AllMarks = __Value;
        return;
    }
}

struct FC_UpdateMarkLevelSpotViewersDeferTag : FECSComponent
{
    FC_UpdateMarkLevelSpotViewersDeferTag()
    {
        return;
    }
}

struct FC_DispatchFastMarkRequestTag : FECSComponent
{
    FC_DispatchFastMarkRequestTag()
    {
        return;
    }
}

struct FCE_RequestMarkEntity : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FECSEntityId EntityID;
    UPROPERTY()
    TDataObjectPtr<FMarkConfig> MarkConfig;

    FCE_RequestMarkEntity()
    {
        return;
    }
}

struct FCE_RequestMarkLocation : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FVector Location;
    UPROPERTY()
    TDataObjectPtr<FMarkConfig> MarkConfig;
    UPROPERTY()
    bool bGuideToMark;
    UPROPERTY()
    bool bNeedRecalculateHeight;


}

struct FCE_RequestFastMarkEntity : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FECSEntityId EntityID;

    FCE_RequestFastMarkEntity()
    {
        return;
    }
}

struct FCE_RequestChangeMarkConfig : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FECSEntityId MarkEntityID;
    UPROPERTY()
    TDataObjectPtr<FMarkConfig> MarkConfig;

    FCE_RequestChangeMarkConfig()
    {
        return;
    }
}

struct FCE_RequestRemoveMark : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FECSEntityId MarkOrMarkedEntityID;

    FCE_RequestRemoveMark()
    {
        return;
    }
}

struct FCE_ServerNotifyUpdateMark : FECSEvent
{
    FECSEvent _base_FECSEvent;

    FCE_ServerNotifyUpdateMark()
    {
        return;
    }
}

struct FCE_NotifyUI_RefreshVisibleMarks : FECSEvent
{
    FECSEvent _base_FECSEvent;

    FCE_NotifyUI_RefreshVisibleMarks()
    {
        return;
    }
}

namespace ECSFunc_FC_Mark_RemoveWhenNoLongerGuidingTargetTag
{
UFUNCTION()
bool HasMark_RemoveWhenNoLongerGuidingTargetTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_Mark_RemoveWhenNoLongerGuidingTargetTag);
}
FC_Mark_RemoveWhenNoLongerGuidingTargetTag& AssignMark_RemoveWhenNoLongerGuidingTargetTag(const FECSEntity &inout Entity, const FC_Mark_RemoveWhenNoLongerGuidingTargetTag &inout DefaultValue = FC_Mark_RemoveWhenNoLongerGuidingTargetTag())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_Mark_RemoveWhenNoLongerGuidingTargetTag, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignMark_RemoveWhenNoLongerGuidingTargetTag_BP(const FECSEntity &inout Entity, const FC_Mark_RemoveWhenNoLongerGuidingTargetTag &inout DefaultValue = FC_Mark_RemoveWhenNoLongerGuidingTargetTag())
{
    ECSFunc_FC_Mark_RemoveWhenNoLongerGuidingTargetTag::AssignMark_RemoveWhenNoLongerGuidingTargetTag(Entity, DefaultValue);
    return;
}
FC_Mark_RemoveWhenNoLongerGuidingTargetTag& ModifyMark_RemoveWhenNoLongerGuidingTargetTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_Mark_RemoveWhenNoLongerGuidingTargetTag));
    return local_12.GetComp();
}
FC_Mark_RemoveWhenNoLongerGuidingTargetTag& ModifyOrAddMark_RemoveWhenNoLongerGuidingTargetTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_Mark_RemoveWhenNoLongerGuidingTargetTag));
    return local_12.GetComp();
}
const FC_Mark_RemoveWhenNoLongerGuidingTargetTag& GetMark_RemoveWhenNoLongerGuidingTargetTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_Mark_RemoveWhenNoLongerGuidingTargetTag));
    return local_12.GetComp();
}
UFUNCTION()
FC_Mark_RemoveWhenNoLongerGuidingTargetTag GetMark_RemoveWhenNoLongerGuidingTargetTag_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_Mark_RemoveWhenNoLongerGuidingTargetTag& local_4 = ECSFunc_FC_Mark_RemoveWhenNoLongerGuidingTargetTag::GetMark_RemoveWhenNoLongerGuidingTargetTag(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_Mark_RemoveWhenNoLongerGuidingTargetTag();
}
const FC_Mark_RemoveWhenNoLongerGuidingTargetTag GetDefaultedMark_RemoveWhenNoLongerGuidingTargetTag(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_Mark_RemoveWhenNoLongerGuidingTargetTag __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_Mark_RemoveWhenNoLongerGuidingTargetTag);
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
FC_Mark_RemoveWhenNoLongerGuidingTargetTag GetDefaultedMark_RemoveWhenNoLongerGuidingTargetTag_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_Mark_RemoveWhenNoLongerGuidingTargetTag::GetDefaultedMark_RemoveWhenNoLongerGuidingTargetTag(Entity);
}
UFUNCTION()
bool RemoveMark_RemoveWhenNoLongerGuidingTargetTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_Mark_RemoveWhenNoLongerGuidingTargetTag);
}
}
FECSMonitorRuntimeView __GetMonitorMark_RemoveWhenNoLongerGuidingTargetTagOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_Mark_RemoveWhenNoLongerGuidingTargetTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorMark_RemoveWhenNoLongerGuidingTargetTagOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_Mark_RemoveWhenNoLongerGuidingTargetTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorMark_RemoveWhenNoLongerGuidingTargetTagOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_Mark_RemoveWhenNoLongerGuidingTargetTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorMark_RemoveWhenNoLongerGuidingTargetTagOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_Mark_RemoveWhenNoLongerGuidingTargetTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorMark_RemoveWhenNoLongerGuidingTargetTagOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_Mark_RemoveWhenNoLongerGuidingTargetTag, bFixedFrame, bMustHandleAll);
}
void __MonitorMark_RemoveWhenNoLongerGuidingTargetTagLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_Mark_RemoveWhenNoLongerGuidingTargetTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorMark_RemoveWhenNoLongerGuidingTargetTagActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_Mark_RemoveWhenNoLongerGuidingTargetTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorMark_RemoveWhenNoLongerGuidingTargetTagModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_Mark_RemoveWhenNoLongerGuidingTargetTag, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_Mark_RemoveWhenCreaterApproachDistanceTag
{
UFUNCTION()
bool HasMark_RemoveWhenCreaterApproachDistanceTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_Mark_RemoveWhenCreaterApproachDistanceTag);
}
FC_Mark_RemoveWhenCreaterApproachDistanceTag& AssignMark_RemoveWhenCreaterApproachDistanceTag(const FECSEntity &inout Entity, const FC_Mark_RemoveWhenCreaterApproachDistanceTag &inout DefaultValue = FC_Mark_RemoveWhenCreaterApproachDistanceTag())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_Mark_RemoveWhenCreaterApproachDistanceTag, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignMark_RemoveWhenCreaterApproachDistanceTag_BP(const FECSEntity &inout Entity, const FC_Mark_RemoveWhenCreaterApproachDistanceTag &inout DefaultValue = FC_Mark_RemoveWhenCreaterApproachDistanceTag())
{
    ECSFunc_FC_Mark_RemoveWhenCreaterApproachDistanceTag::AssignMark_RemoveWhenCreaterApproachDistanceTag(Entity, DefaultValue);
    return;
}
FC_Mark_RemoveWhenCreaterApproachDistanceTag& ModifyMark_RemoveWhenCreaterApproachDistanceTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_Mark_RemoveWhenCreaterApproachDistanceTag));
    return local_12.GetComp();
}
FC_Mark_RemoveWhenCreaterApproachDistanceTag& ModifyOrAddMark_RemoveWhenCreaterApproachDistanceTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_Mark_RemoveWhenCreaterApproachDistanceTag));
    return local_12.GetComp();
}
const FC_Mark_RemoveWhenCreaterApproachDistanceTag& GetMark_RemoveWhenCreaterApproachDistanceTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_Mark_RemoveWhenCreaterApproachDistanceTag));
    return local_12.GetComp();
}
UFUNCTION()
FC_Mark_RemoveWhenCreaterApproachDistanceTag GetMark_RemoveWhenCreaterApproachDistanceTag_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_Mark_RemoveWhenCreaterApproachDistanceTag& local_4 = ECSFunc_FC_Mark_RemoveWhenCreaterApproachDistanceTag::GetMark_RemoveWhenCreaterApproachDistanceTag(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_Mark_RemoveWhenCreaterApproachDistanceTag();
}
const FC_Mark_RemoveWhenCreaterApproachDistanceTag GetDefaultedMark_RemoveWhenCreaterApproachDistanceTag(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_Mark_RemoveWhenCreaterApproachDistanceTag __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_Mark_RemoveWhenCreaterApproachDistanceTag);
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
FC_Mark_RemoveWhenCreaterApproachDistanceTag GetDefaultedMark_RemoveWhenCreaterApproachDistanceTag_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_Mark_RemoveWhenCreaterApproachDistanceTag::GetDefaultedMark_RemoveWhenCreaterApproachDistanceTag(Entity);
}
UFUNCTION()
bool RemoveMark_RemoveWhenCreaterApproachDistanceTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_Mark_RemoveWhenCreaterApproachDistanceTag);
}
}
FECSMonitorRuntimeView __GetMonitorMark_RemoveWhenCreaterApproachDistanceTagOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_Mark_RemoveWhenCreaterApproachDistanceTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorMark_RemoveWhenCreaterApproachDistanceTagOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_Mark_RemoveWhenCreaterApproachDistanceTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorMark_RemoveWhenCreaterApproachDistanceTagOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_Mark_RemoveWhenCreaterApproachDistanceTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorMark_RemoveWhenCreaterApproachDistanceTagOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_Mark_RemoveWhenCreaterApproachDistanceTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorMark_RemoveWhenCreaterApproachDistanceTagOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_Mark_RemoveWhenCreaterApproachDistanceTag, bFixedFrame, bMustHandleAll);
}
void __MonitorMark_RemoveWhenCreaterApproachDistanceTagLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_Mark_RemoveWhenCreaterApproachDistanceTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorMark_RemoveWhenCreaterApproachDistanceTagActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_Mark_RemoveWhenCreaterApproachDistanceTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorMark_RemoveWhenCreaterApproachDistanceTagModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_Mark_RemoveWhenCreaterApproachDistanceTag, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_Mark_ActorComponentPendingInitTag
{
UFUNCTION()
bool HasMark_ActorComponentPendingInitTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_Mark_ActorComponentPendingInitTag);
}
FC_Mark_ActorComponentPendingInitTag& AssignMark_ActorComponentPendingInitTag(const FECSEntity &inout Entity, const FC_Mark_ActorComponentPendingInitTag &inout DefaultValue = FC_Mark_ActorComponentPendingInitTag())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_Mark_ActorComponentPendingInitTag, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignMark_ActorComponentPendingInitTag_BP(const FECSEntity &inout Entity, const FC_Mark_ActorComponentPendingInitTag &inout DefaultValue = FC_Mark_ActorComponentPendingInitTag())
{
    ECSFunc_FC_Mark_ActorComponentPendingInitTag::AssignMark_ActorComponentPendingInitTag(Entity, DefaultValue);
    return;
}
FC_Mark_ActorComponentPendingInitTag& ModifyMark_ActorComponentPendingInitTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_Mark_ActorComponentPendingInitTag));
    return local_12.GetComp();
}
FC_Mark_ActorComponentPendingInitTag& ModifyOrAddMark_ActorComponentPendingInitTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_Mark_ActorComponentPendingInitTag));
    return local_12.GetComp();
}
const FC_Mark_ActorComponentPendingInitTag& GetMark_ActorComponentPendingInitTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_Mark_ActorComponentPendingInitTag));
    return local_12.GetComp();
}
UFUNCTION()
FC_Mark_ActorComponentPendingInitTag GetMark_ActorComponentPendingInitTag_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_Mark_ActorComponentPendingInitTag& local_4 = ECSFunc_FC_Mark_ActorComponentPendingInitTag::GetMark_ActorComponentPendingInitTag(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_Mark_ActorComponentPendingInitTag();
}
const FC_Mark_ActorComponentPendingInitTag GetDefaultedMark_ActorComponentPendingInitTag(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_Mark_ActorComponentPendingInitTag __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_Mark_ActorComponentPendingInitTag);
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
FC_Mark_ActorComponentPendingInitTag GetDefaultedMark_ActorComponentPendingInitTag_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_Mark_ActorComponentPendingInitTag::GetDefaultedMark_ActorComponentPendingInitTag(Entity);
}
UFUNCTION()
bool RemoveMark_ActorComponentPendingInitTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_Mark_ActorComponentPendingInitTag);
}
}
FECSMonitorRuntimeView __GetMonitorMark_ActorComponentPendingInitTagOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_Mark_ActorComponentPendingInitTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorMark_ActorComponentPendingInitTagOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_Mark_ActorComponentPendingInitTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorMark_ActorComponentPendingInitTagOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_Mark_ActorComponentPendingInitTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorMark_ActorComponentPendingInitTagOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_Mark_ActorComponentPendingInitTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorMark_ActorComponentPendingInitTagOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_Mark_ActorComponentPendingInitTag, bFixedFrame, bMustHandleAll);
}
void __MonitorMark_ActorComponentPendingInitTagLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_Mark_ActorComponentPendingInitTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorMark_ActorComponentPendingInitTagActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_Mark_ActorComponentPendingInitTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorMark_ActorComponentPendingInitTagModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_Mark_ActorComponentPendingInitTag, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_Mark
{
UFUNCTION()
bool HasMark(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_Mark);
}
FC_Mark& AssignMark(const FECSEntity &inout Entity, const FC_Mark &inout DefaultValue = FC_Mark())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_Mark, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignMark_BP(const FECSEntity &inout Entity, const FC_Mark &inout DefaultValue = FC_Mark())
{
    ECSFunc_FC_Mark::AssignMark(Entity, DefaultValue);
    return;
}
FC_Mark& ModifyMark(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_Mark));
    return local_12.GetComp();
}
FC_Mark& ModifyOrAddMark(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_Mark));
    return local_12.GetComp();
}
const FC_Mark& GetMark(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_Mark));
    return local_12.GetComp();
}
UFUNCTION()
FC_Mark GetMark_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_Mark& local_4 = ECSFunc_FC_Mark::GetMark(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_Mark();
}
const FC_Mark GetDefaultedMark(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_Mark __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_Mark);
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
FC_Mark GetDefaultedMark_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_Mark::GetDefaultedMark(Entity);
}
UFUNCTION()
bool RemoveMark(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_Mark);
}
}
FECSMonitorRuntimeView __GetMonitorMarkOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_Mark, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorMarkOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_Mark, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorMarkOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_Mark, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorMarkOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_Mark, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorMarkOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_Mark, bFixedFrame, bMustHandleAll);
}
void __MonitorMarkLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_Mark, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorMarkActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_Mark, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorMarkModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_Mark, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_Marked
{
UFUNCTION()
bool HasMarked(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_Marked);
}
FC_Marked& AssignMarked(const FECSEntity &inout Entity, const FC_Marked &inout DefaultValue = FC_Marked())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_Marked, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignMarked_BP(const FECSEntity &inout Entity, const FC_Marked &inout DefaultValue = FC_Marked())
{
    ECSFunc_FC_Marked::AssignMarked(Entity, DefaultValue);
    return;
}
FC_Marked& ModifyMarked(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_Marked));
    return local_12.GetComp();
}
FC_Marked& ModifyOrAddMarked(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_Marked));
    return local_12.GetComp();
}
const FC_Marked& GetMarked(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_Marked));
    return local_12.GetComp();
}
UFUNCTION()
FC_Marked GetMarked_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_Marked __r;
    bValid = false;
    bValid = ECSFunc_FC_Marked::GetMarked(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_Marked GetDefaultedMarked(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_Marked __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_Marked);
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
FC_Marked GetDefaultedMarked_BP(const FECSEntity &inout Entity)
{
    FC_Marked __r;
    return __r;
}
UFUNCTION()
bool RemoveMarked(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_Marked);
}
}
FECSMonitorRuntimeView __GetMonitorMarkedOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_Marked, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorMarkedOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_Marked, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorMarkedOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_Marked, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorMarkedOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_Marked, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorMarkedOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_Marked, bFixedFrame, bMustHandleAll);
}
void __MonitorMarkedLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_Marked, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorMarkedActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_Marked, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorMarkedModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_Marked, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_MarkedComponentPendingRemoveTag
{
UFUNCTION()
bool HasMarkedComponentPendingRemoveTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_MarkedComponentPendingRemoveTag);
}
FC_MarkedComponentPendingRemoveTag& AssignMarkedComponentPendingRemoveTag(const FECSEntity &inout Entity, const FC_MarkedComponentPendingRemoveTag &inout DefaultValue = FC_MarkedComponentPendingRemoveTag())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_MarkedComponentPendingRemoveTag, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignMarkedComponentPendingRemoveTag_BP(const FECSEntity &inout Entity, const FC_MarkedComponentPendingRemoveTag &inout DefaultValue = FC_MarkedComponentPendingRemoveTag())
{
    ECSFunc_FC_MarkedComponentPendingRemoveTag::AssignMarkedComponentPendingRemoveTag(Entity, DefaultValue);
    return;
}
FC_MarkedComponentPendingRemoveTag& ModifyMarkedComponentPendingRemoveTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_MarkedComponentPendingRemoveTag));
    return local_12.GetComp();
}
FC_MarkedComponentPendingRemoveTag& ModifyOrAddMarkedComponentPendingRemoveTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_MarkedComponentPendingRemoveTag));
    return local_12.GetComp();
}
const FC_MarkedComponentPendingRemoveTag& GetMarkedComponentPendingRemoveTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_MarkedComponentPendingRemoveTag));
    return local_12.GetComp();
}
UFUNCTION()
FC_MarkedComponentPendingRemoveTag GetMarkedComponentPendingRemoveTag_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_MarkedComponentPendingRemoveTag& local_4 = ECSFunc_FC_MarkedComponentPendingRemoveTag::GetMarkedComponentPendingRemoveTag(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_MarkedComponentPendingRemoveTag();
}
const FC_MarkedComponentPendingRemoveTag GetDefaultedMarkedComponentPendingRemoveTag(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_MarkedComponentPendingRemoveTag __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_MarkedComponentPendingRemoveTag);
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
FC_MarkedComponentPendingRemoveTag GetDefaultedMarkedComponentPendingRemoveTag_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_MarkedComponentPendingRemoveTag::GetDefaultedMarkedComponentPendingRemoveTag(Entity);
}
UFUNCTION()
bool RemoveMarkedComponentPendingRemoveTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_MarkedComponentPendingRemoveTag);
}
}
FECSMonitorRuntimeView __GetMonitorMarkedComponentPendingRemoveTagOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_MarkedComponentPendingRemoveTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorMarkedComponentPendingRemoveTagOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_MarkedComponentPendingRemoveTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorMarkedComponentPendingRemoveTagOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_MarkedComponentPendingRemoveTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorMarkedComponentPendingRemoveTagOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_MarkedComponentPendingRemoveTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorMarkedComponentPendingRemoveTagOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_MarkedComponentPendingRemoveTag, bFixedFrame, bMustHandleAll);
}
void __MonitorMarkedComponentPendingRemoveTagLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_MarkedComponentPendingRemoveTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorMarkedComponentPendingRemoveTagActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_MarkedComponentPendingRemoveTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorMarkedComponentPendingRemoveTagModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_MarkedComponentPendingRemoveTag, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_PlayerMarks
{
UFUNCTION()
bool HasPlayerMarks(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_PlayerMarks);
}
FC_PlayerMarks& AssignPlayerMarks(const FECSEntity &inout Entity, const FC_PlayerMarks &inout DefaultValue = FC_PlayerMarks())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_PlayerMarks, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignPlayerMarks_BP(const FECSEntity &inout Entity, const FC_PlayerMarks &inout DefaultValue = FC_PlayerMarks())
{
    ECSFunc_FC_PlayerMarks::AssignPlayerMarks(Entity, DefaultValue);
    return;
}
FC_PlayerMarks& ModifyPlayerMarks(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_PlayerMarks));
    return local_12.GetComp();
}
FC_PlayerMarks& ModifyOrAddPlayerMarks(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_PlayerMarks));
    return local_12.GetComp();
}
const FC_PlayerMarks& GetPlayerMarks(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_PlayerMarks));
    return local_12.GetComp();
}
UFUNCTION()
FC_PlayerMarks GetPlayerMarks_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_PlayerMarks& local_4 = ECSFunc_FC_PlayerMarks::GetPlayerMarks(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_PlayerMarks();
}
const FC_PlayerMarks GetDefaultedPlayerMarks(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_PlayerMarks __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_PlayerMarks);
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
FC_PlayerMarks GetDefaultedPlayerMarks_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_PlayerMarks::GetDefaultedPlayerMarks(Entity);
}
UFUNCTION()
bool RemovePlayerMarks(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_PlayerMarks);
}
}
FECSMonitorRuntimeView __GetMonitorPlayerMarksOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_PlayerMarks, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPlayerMarksOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_PlayerMarks, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPlayerMarksOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_PlayerMarks, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPlayerMarksOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_PlayerMarks, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPlayerMarksOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_PlayerMarks, bFixedFrame, bMustHandleAll);
}
void __MonitorPlayerMarksLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_PlayerMarks, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPlayerMarksActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_PlayerMarks, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPlayerMarksModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_PlayerMarks, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_UpdateMarkLevelSpotViewersDeferTag
{
UFUNCTION()
bool HasUpdateMarkLevelSpotViewersDeferTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_UpdateMarkLevelSpotViewersDeferTag);
}
FC_UpdateMarkLevelSpotViewersDeferTag& AssignUpdateMarkLevelSpotViewersDeferTag(const FECSEntity &inout Entity, const FC_UpdateMarkLevelSpotViewersDeferTag &inout DefaultValue = FC_UpdateMarkLevelSpotViewersDeferTag())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_UpdateMarkLevelSpotViewersDeferTag, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignUpdateMarkLevelSpotViewersDeferTag_BP(const FECSEntity &inout Entity, const FC_UpdateMarkLevelSpotViewersDeferTag &inout DefaultValue = FC_UpdateMarkLevelSpotViewersDeferTag())
{
    ECSFunc_FC_UpdateMarkLevelSpotViewersDeferTag::AssignUpdateMarkLevelSpotViewersDeferTag(Entity, DefaultValue);
    return;
}
FC_UpdateMarkLevelSpotViewersDeferTag& ModifyUpdateMarkLevelSpotViewersDeferTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_UpdateMarkLevelSpotViewersDeferTag));
    return local_12.GetComp();
}
FC_UpdateMarkLevelSpotViewersDeferTag& ModifyOrAddUpdateMarkLevelSpotViewersDeferTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_UpdateMarkLevelSpotViewersDeferTag));
    return local_12.GetComp();
}
const FC_UpdateMarkLevelSpotViewersDeferTag& GetUpdateMarkLevelSpotViewersDeferTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_UpdateMarkLevelSpotViewersDeferTag));
    return local_12.GetComp();
}
UFUNCTION()
FC_UpdateMarkLevelSpotViewersDeferTag GetUpdateMarkLevelSpotViewersDeferTag_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_UpdateMarkLevelSpotViewersDeferTag& local_4 = ECSFunc_FC_UpdateMarkLevelSpotViewersDeferTag::GetUpdateMarkLevelSpotViewersDeferTag(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_UpdateMarkLevelSpotViewersDeferTag();
}
const FC_UpdateMarkLevelSpotViewersDeferTag GetDefaultedUpdateMarkLevelSpotViewersDeferTag(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_UpdateMarkLevelSpotViewersDeferTag __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_UpdateMarkLevelSpotViewersDeferTag);
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
FC_UpdateMarkLevelSpotViewersDeferTag GetDefaultedUpdateMarkLevelSpotViewersDeferTag_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_UpdateMarkLevelSpotViewersDeferTag::GetDefaultedUpdateMarkLevelSpotViewersDeferTag(Entity);
}
UFUNCTION()
bool RemoveUpdateMarkLevelSpotViewersDeferTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_UpdateMarkLevelSpotViewersDeferTag);
}
}
FECSMonitorRuntimeView __GetMonitorUpdateMarkLevelSpotViewersDeferTagOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_UpdateMarkLevelSpotViewersDeferTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorUpdateMarkLevelSpotViewersDeferTagOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_UpdateMarkLevelSpotViewersDeferTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorUpdateMarkLevelSpotViewersDeferTagOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_UpdateMarkLevelSpotViewersDeferTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorUpdateMarkLevelSpotViewersDeferTagOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_UpdateMarkLevelSpotViewersDeferTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorUpdateMarkLevelSpotViewersDeferTagOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_UpdateMarkLevelSpotViewersDeferTag, bFixedFrame, bMustHandleAll);
}
void __MonitorUpdateMarkLevelSpotViewersDeferTagLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_UpdateMarkLevelSpotViewersDeferTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorUpdateMarkLevelSpotViewersDeferTagActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_UpdateMarkLevelSpotViewersDeferTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorUpdateMarkLevelSpotViewersDeferTagModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_UpdateMarkLevelSpotViewersDeferTag, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_DispatchFastMarkRequestTag
{
UFUNCTION()
bool HasDispatchFastMarkRequestTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_DispatchFastMarkRequestTag);
}
FC_DispatchFastMarkRequestTag& AssignDispatchFastMarkRequestTag(const FECSEntity &inout Entity, const FC_DispatchFastMarkRequestTag &inout DefaultValue = FC_DispatchFastMarkRequestTag())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_DispatchFastMarkRequestTag, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignDispatchFastMarkRequestTag_BP(const FECSEntity &inout Entity, const FC_DispatchFastMarkRequestTag &inout DefaultValue = FC_DispatchFastMarkRequestTag())
{
    ECSFunc_FC_DispatchFastMarkRequestTag::AssignDispatchFastMarkRequestTag(Entity, DefaultValue);
    return;
}
FC_DispatchFastMarkRequestTag& ModifyDispatchFastMarkRequestTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_DispatchFastMarkRequestTag));
    return local_12.GetComp();
}
FC_DispatchFastMarkRequestTag& ModifyOrAddDispatchFastMarkRequestTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_DispatchFastMarkRequestTag));
    return local_12.GetComp();
}
const FC_DispatchFastMarkRequestTag& GetDispatchFastMarkRequestTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_DispatchFastMarkRequestTag));
    return local_12.GetComp();
}
UFUNCTION()
FC_DispatchFastMarkRequestTag GetDispatchFastMarkRequestTag_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_DispatchFastMarkRequestTag& local_4 = ECSFunc_FC_DispatchFastMarkRequestTag::GetDispatchFastMarkRequestTag(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_DispatchFastMarkRequestTag();
}
const FC_DispatchFastMarkRequestTag GetDefaultedDispatchFastMarkRequestTag(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_DispatchFastMarkRequestTag __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_DispatchFastMarkRequestTag);
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
FC_DispatchFastMarkRequestTag GetDefaultedDispatchFastMarkRequestTag_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_DispatchFastMarkRequestTag::GetDefaultedDispatchFastMarkRequestTag(Entity);
}
UFUNCTION()
bool RemoveDispatchFastMarkRequestTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_DispatchFastMarkRequestTag);
}
}
FECSMonitorRuntimeView __GetMonitorDispatchFastMarkRequestTagOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_DispatchFastMarkRequestTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDispatchFastMarkRequestTagOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_DispatchFastMarkRequestTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDispatchFastMarkRequestTagOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_DispatchFastMarkRequestTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDispatchFastMarkRequestTagOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_DispatchFastMarkRequestTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDispatchFastMarkRequestTagOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_DispatchFastMarkRequestTag, bFixedFrame, bMustHandleAll);
}
void __MonitorDispatchFastMarkRequestTagLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_DispatchFastMarkRequestTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorDispatchFastMarkRequestTagActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_DispatchFastMarkRequestTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorDispatchFastMarkRequestTagModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_DispatchFastMarkRequestTag, bFixedFrame, Details);
    return;
}
namespace AutoDelta
{
FSubDirtyFlags8 GetDirtyFlags(FMarkInfo &inout Data)
{
    FSubDirtyFlags8 __r;
    return __r;
}
void ClearDirtyFlags(FMarkInfo &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FMarkInfo
{
int __IndexOf_MarkConfig()
{
    return 0;
}
int __IndexOf_MarkPosition()
{
    return 1;
}
int __IndexOf_MarkedEntityID()
{
    return 2;
}
int __IndexOf_MarkTime()
{
    return 3;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_Mark &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_Mark &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_Mark &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_Mark
{
int __IndexOf_CreaterPlayer()
{
    return 0;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_PlayerMarks &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_PlayerMarks &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_PlayerMarks &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_PlayerMarks
{
int __IndexOf_MarkPools()
{
    return 0;
}
int __IndexOf_AllMarks()
{
    return 1;
}
}
