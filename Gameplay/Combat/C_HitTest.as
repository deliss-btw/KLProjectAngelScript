
namespace __INTENRAL_FC_ArealStrikeTimeFilter_NS
{
    const TECSComponentDerivedPtr<FC_ArealStrikeTimeFilter> DerivedPtr = TECSComponentDerivedPtr<FC_ArealStrikeTimeFilter>();
    const FC_ArealStrikeTimeFilter DefaultValue = FC_ArealStrikeTimeFilter();
}
namespace __INTENRAL_FCS_PerReceiverArealStrikeRequestClear_NS
{
    const TECSComponentDerivedPtr<FCS_PerReceiverArealStrikeRequestClear> DerivedPtr = TECSComponentDerivedPtr<FCS_PerReceiverArealStrikeRequestClear>();
    const FCS_PerReceiverArealStrikeRequestClear DefaultValue = FCS_PerReceiverArealStrikeRequestClear();
}
namespace __INTENRAL_FCS_ServerHitTestDebugRecords_NS
{
    const TECSComponentDerivedPtr<FCS_ServerHitTestDebugRecords> DerivedPtr = TECSComponentDerivedPtr<FCS_ServerHitTestDebugRecords>();
    const FCS_ServerHitTestDebugRecords DefaultValue = FCS_ServerHitTestDebugRecords();
}
namespace __INTENRAL_FCS_ClientHitTestDebugRecords_NS
{
    const TECSComponentDerivedPtr<FCS_ClientHitTestDebugRecords> DerivedPtr = TECSComponentDerivedPtr<FCS_ClientHitTestDebugRecords>();
    const FCS_ClientHitTestDebugRecords DefaultValue = FCS_ClientHitTestDebugRecords();

}
struct FC_ArealStrikeTimeFilter : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    FFPTime m_LastFilterTime;
    UPROPERTY()
    FFPTime m_CurFilterTime;
    UPROPERTY()
    FFPTime m_LastEventCheckJobTime;

    FC_ArealStrikeTimeFilter()
    {
        this.m_LastFilterTime = -1;
        this.m_CurFilterTime = -1;
        this.m_LastEventCheckJobTime = -1;
        this.__InitDirtyFlags();
        return;
    }
    FC_ArealStrikeTimeFilter(const FC_ArealStrikeTimeFilter &inout Other)
    {
        this.m_LastFilterTime = -1;
        this.m_CurFilterTime = -1;
        this.m_LastEventCheckJobTime = -1;
        this.__InitDirtyFlags();
        this.m_LastFilterTime = Other.m_LastFilterTime;
        this.m_CurFilterTime = Other.m_CurFilterTime;
        this.m_LastEventCheckJobTime = Other.m_LastEventCheckJobTime;
        return;
    }
    FC_ArealStrikeTimeFilter opAssign(const FC_ArealStrikeTimeFilter &inout Other)
    {
        FC_ArealStrikeTimeFilter __r;
        this.SetLastFilterTime(Other.GetLastFilterTime());
        this.SetCurFilterTime(Other.GetCurFilterTime());
        this.SetLastEventCheckJobTime(Other.GetLastEventCheckJobTime());
        return __r;
    }
    const FFPTime GetLastFilterTime() const property
    {
        const FFPTime __r;
        return __r;
    }
    FFPTime GetModify_LastFilterTime() property
    {
        FFPTime __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetLastFilterTime(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_LastFilterTime = __Value;
        return;
    }
    const FFPTime GetCurFilterTime() const property
    {
        const FFPTime __r;
        return __r;
    }
    FFPTime GetModify_CurFilterTime() property
    {
        FFPTime __r;
        this.__MarkDirty(1);
        return __r;
    }
    void SetCurFilterTime(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_CurFilterTime = __Value;
        return;
    }
    const FFPTime GetLastEventCheckJobTime() const property
    {
        const FFPTime __r;
        return __r;
    }
    FFPTime GetModify_LastEventCheckJobTime() property
    {
        FFPTime __r;
        this.__MarkDirty(2);
        return __r;
    }
    void SetLastEventCheckJobTime(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_LastEventCheckJobTime = __Value;
        return;
    }
}

struct FCS_PerReceiverArealStrikeRequestClear : FECSSingleton
{
    UPROPERTY()
    TArray<int> EventIds;

    FCS_PerReceiverArealStrikeRequestClear()
    {
        return;
    }
}

struct FHitTestDebugRecord
{
    FSubDirtyFlags32 __DirtyFlags;
    UPROPERTY()
    bool m_bServer;
    UPROPERTY()
    float m_ServerHitTimeSeconds;
    UPROPERTY()
    FFPTime m_ClientHitTime;
    UPROPERTY()
    int m_ServerFixedFrame;
    UPROPERTY()
    int m_ClientFixedFrame;
    UPROPERTY()
    float m_ServerRequestTimeSeconds;
    UPROPERTY()
    FFPTime m_ClientRequestTime;
    UPROPERTY()
    int m_RequestCreatedFrame;
    UPROPERTY()
    int m_RequestEventId;
    UPROPERTY()
    int m_ActionFromFrame;
    UPROPERTY()
    int m_ActionToFrame;
    UPROPERTY()
    FECSEntityId m_SenderEntityId;
    UPROPERTY()
    FName m_ActionIdentifier;
    UPROPERTY()
    FName m_StrikeKey;
    UPROPERTY()
    bool m_bPerEntityQuest;
    UPROPERTY()
    TArray<FECSEntityId> m_HitEntityIds;

    FHitTestDebugRecord()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FHitTestDebugRecord(const FHitTestDebugRecord &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FHitTestDebugRecord opAssign(const FHitTestDebugRecord &inout Other)
    {
        FHitTestDebugRecord __r;
        this.SetbServer(Other.GetbServer());
        this.SetServerHitTimeSeconds(Other.GetServerHitTimeSeconds());
        this.SetClientHitTime(Other.GetClientHitTime());
        this.SetServerFixedFrame(Other.GetServerFixedFrame());
        this.SetClientFixedFrame(Other.GetClientFixedFrame());
        this.SetServerRequestTimeSeconds(Other.GetServerRequestTimeSeconds());
        this.SetClientRequestTime(Other.GetClientRequestTime());
        this.SetRequestCreatedFrame(Other.GetRequestCreatedFrame());
        this.SetRequestEventId(Other.GetRequestEventId());
        this.SetActionFromFrame(Other.GetActionFromFrame());
        this.SetActionToFrame(Other.GetActionToFrame());
        this.SetSenderEntityId(Other.GetSenderEntityId());
        this.SetActionIdentifier(Other.GetActionIdentifier());
        this.SetStrikeKey(Other.GetStrikeKey());
        this.SetbPerEntityQuest(Other.GetbPerEntityQuest());
        this.SetHitEntityIds(Other.GetHitEntityIds());
        return __r;
    }
    bool GetbServer() const property
    {
        return this.m_bServer;
    }
    void SetbServer(const bool __Value) property
    {
        if (!(this.m_bServer) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_bServer = __Value;
        return;
    }
    float GetServerHitTimeSeconds() const property
    {
        return this.m_ServerHitTimeSeconds;
    }
    void SetServerHitTimeSeconds(const float __Value) property
    {
        if (this.m_ServerHitTimeSeconds == __Value)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_ServerHitTimeSeconds = __Value;
        return;
    }
    const FFPTime GetClientHitTime() const property
    {
        const FFPTime __r;
        return __r;
    }
    FFPTime GetModify_ClientHitTime() property
    {
        FFPTime __r;
        this.__MarkDirty(2);
        return __r;
    }
    void SetClientHitTime(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_ClientHitTime = __Value;
        return;
    }
    int GetServerFixedFrame() const property
    {
        return this.m_ServerFixedFrame;
    }
    void SetServerFixedFrame(const int __Value) property
    {
        if (this.m_ServerFixedFrame == __Value)
        {
            return;
        }
        this.__MarkDirty(3);
        this.m_ServerFixedFrame = __Value;
        return;
    }
    int GetClientFixedFrame() const property
    {
        return this.m_ClientFixedFrame;
    }
    void SetClientFixedFrame(const int __Value) property
    {
        if (this.m_ClientFixedFrame == __Value)
        {
            return;
        }
        this.__MarkDirty(4);
        this.m_ClientFixedFrame = __Value;
        return;
    }
    float GetServerRequestTimeSeconds() const property
    {
        return this.m_ServerRequestTimeSeconds;
    }
    void SetServerRequestTimeSeconds(const float __Value) property
    {
        if (this.m_ServerRequestTimeSeconds == __Value)
        {
            return;
        }
        this.__MarkDirty(5);
        this.m_ServerRequestTimeSeconds = __Value;
        return;
    }
    const FFPTime GetClientRequestTime() const property
    {
        const FFPTime __r;
        return __r;
    }
    FFPTime GetModify_ClientRequestTime() property
    {
        FFPTime __r;
        this.__MarkDirty(6);
        return __r;
    }
    void SetClientRequestTime(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(6);
        this.m_ClientRequestTime = __Value;
        return;
    }
    int GetRequestCreatedFrame() const property
    {
        return this.m_RequestCreatedFrame;
    }
    void SetRequestCreatedFrame(const int __Value) property
    {
        if (this.m_RequestCreatedFrame == __Value)
        {
            return;
        }
        this.__MarkDirty(7);
        this.m_RequestCreatedFrame = __Value;
        return;
    }
    int GetRequestEventId() const property
    {
        return this.m_RequestEventId;
    }
    void SetRequestEventId(const int __Value) property
    {
        if (this.m_RequestEventId == __Value)
        {
            return;
        }
        this.__MarkDirty(8);
        this.m_RequestEventId = __Value;
        return;
    }
    int GetActionFromFrame() const property
    {
        return this.m_ActionFromFrame;
    }
    void SetActionFromFrame(const int __Value) property
    {
        if (this.m_ActionFromFrame == __Value)
        {
            return;
        }
        this.__MarkDirty(9);
        this.m_ActionFromFrame = __Value;
        return;
    }
    int GetActionToFrame() const property
    {
        return this.m_ActionToFrame;
    }
    void SetActionToFrame(const int __Value) property
    {
        if (this.m_ActionToFrame == __Value)
        {
            return;
        }
        this.__MarkDirty(10);
        this.m_ActionToFrame = __Value;
        return;
    }
    const FECSEntityId GetSenderEntityId() const property
    {
        const FECSEntityId __r;
        return __r;
    }
    FECSEntityId GetModify_SenderEntityId() property
    {
        FECSEntityId __r;
        this.__MarkDirty(11);
        return __r;
    }
    void SetSenderEntityId(const FECSEntityId &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(11);
        this.m_SenderEntityId = __Value;
        return;
    }
    FName GetActionIdentifier() const property
    {
        return this.m_ActionIdentifier;
    }
    void SetActionIdentifier(const FName &inout __Value) property
    {
        if ((this.m_ActionIdentifier == __Value))
        {
            return;
        }
        this.__MarkDirty(12);
        this.m_ActionIdentifier = __Value;
        return;
    }
    FName GetStrikeKey() const property
    {
        return this.m_StrikeKey;
    }
    void SetStrikeKey(const FName &inout __Value) property
    {
        if ((this.m_StrikeKey == __Value))
        {
            return;
        }
        this.__MarkDirty(13);
        this.m_StrikeKey = __Value;
        return;
    }
    bool GetbPerEntityQuest() const property
    {
        return this.m_bPerEntityQuest;
    }
    void SetbPerEntityQuest(const bool __Value) property
    {
        if (!(this.m_bPerEntityQuest) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(14);
        this.m_bPerEntityQuest = __Value;
        return;
    }
    const TArray<FECSEntityId> GetHitEntityIds() const property
    {
        const TArray<FECSEntityId> __r;
        return __r;
    }
    TArray<FECSEntityId> GetModify_HitEntityIds() property
    {
        TArray<FECSEntityId> __r;
        this.__MarkDirty(15);
        return __r;
    }
    void SetHitEntityIds(const TArray<FECSEntityId> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(15);
        this.m_HitEntityIds = __Value;
        return;
    }
}

struct FCS_ServerHitTestDebugRecords : FECSSingleton
{
    UPROPERTY()
    bool bEnabled = false;
    UPROPERTY()
    bool bPausePIEOnHit = false;
    UPROPERTY()
    TArray<FHitTestDebugRecord> Records;


}

struct FCS_ClientHitTestDebugRecords : FECSSingleton
{
    UPROPERTY()
    bool bEnabled = false;
    UPROPERTY()
    bool bPausePIEOnHit = false;
    UPROPERTY()
    TArray<FHitTestDebugRecord> Records;


}

namespace ECSFunc_FC_ArealStrikeTimeFilter
{
UFUNCTION()
bool HasArealStrikeTimeFilter(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_ArealStrikeTimeFilter);
}
FC_ArealStrikeTimeFilter& AssignArealStrikeTimeFilter(const FECSEntity &inout Entity, const FC_ArealStrikeTimeFilter &inout DefaultValue = FC_ArealStrikeTimeFilter())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_ArealStrikeTimeFilter, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignArealStrikeTimeFilter_BP(const FECSEntity &inout Entity, const FC_ArealStrikeTimeFilter &inout DefaultValue = FC_ArealStrikeTimeFilter())
{
    ECSFunc_FC_ArealStrikeTimeFilter::AssignArealStrikeTimeFilter(Entity, DefaultValue);
    return;
}
FC_ArealStrikeTimeFilter& ModifyArealStrikeTimeFilter(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_ArealStrikeTimeFilter));
    return local_12.GetComp();
}
FC_ArealStrikeTimeFilter& ModifyOrAddArealStrikeTimeFilter(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_ArealStrikeTimeFilter));
    return local_12.GetComp();
}
const FC_ArealStrikeTimeFilter& GetArealStrikeTimeFilter(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_ArealStrikeTimeFilter));
    return local_12.GetComp();
}
UFUNCTION()
FC_ArealStrikeTimeFilter GetArealStrikeTimeFilter_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_ArealStrikeTimeFilter& local_4 = ECSFunc_FC_ArealStrikeTimeFilter::GetArealStrikeTimeFilter(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_ArealStrikeTimeFilter();
}
const FC_ArealStrikeTimeFilter GetDefaultedArealStrikeTimeFilter(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_ArealStrikeTimeFilter __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_ArealStrikeTimeFilter);
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
FC_ArealStrikeTimeFilter GetDefaultedArealStrikeTimeFilter_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_ArealStrikeTimeFilter::GetDefaultedArealStrikeTimeFilter(Entity);
}
UFUNCTION()
bool RemoveArealStrikeTimeFilter(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_ArealStrikeTimeFilter);
}
}
FECSMonitorRuntimeView __GetMonitorArealStrikeTimeFilterOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_ArealStrikeTimeFilter, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorArealStrikeTimeFilterOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_ArealStrikeTimeFilter, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorArealStrikeTimeFilterOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_ArealStrikeTimeFilter, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorArealStrikeTimeFilterOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_ArealStrikeTimeFilter, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorArealStrikeTimeFilterOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_ArealStrikeTimeFilter, bFixedFrame, bMustHandleAll);
}
void __MonitorArealStrikeTimeFilterLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_ArealStrikeTimeFilter, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorArealStrikeTimeFilterActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_ArealStrikeTimeFilter, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorArealStrikeTimeFilterModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_ArealStrikeTimeFilter, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FCS_PerReceiverArealStrikeRequestClear
{
UFUNCTION()
bool HasPerReceiverArealStrikeRequestClear(const FECSWorldPtr &inout World)
{
    return ECSInternal::Has(World, ENTITY_ID_NULL, FCS_PerReceiverArealStrikeRequestClear);
}
FCS_PerReceiverArealStrikeRequestClear& AssignPerReceiverArealStrikeRequestClear(const FECSWorldPtr &inout World, const FCS_PerReceiverArealStrikeRequestClear &inout DefaultValue = FCS_PerReceiverArealStrikeRequestClear())
{
    UScriptStruct local_6 = FCS_PerReceiverArealStrikeRequestClear;
    FECSComponentPtr local_8;
    int local_10 = local_8 = ECSInternal::Assign(World, ENTITY_ID_NULL, local_6, FECSComponentPtr(DefaultValue));
    local_10.InternalSet(local_8);
    return local_10.GetComp();
}
UFUNCTION()
void AssignPerReceiverArealStrikeRequestClear_BP(const FECSWorldPtr &inout World, const FCS_PerReceiverArealStrikeRequestClear &inout DefaultValue = FCS_PerReceiverArealStrikeRequestClear())
{
    ECSFunc_FCS_PerReceiverArealStrikeRequestClear::AssignPerReceiverArealStrikeRequestClear(World, DefaultValue);
    return;
}
FCS_PerReceiverArealStrikeRequestClear& ModifyPerReceiverArealStrikeRequestClear(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_PerReceiverArealStrikeRequestClear;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Modify(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
FCS_PerReceiverArealStrikeRequestClear& ModifyOrAddPerReceiverArealStrikeRequestClear(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_PerReceiverArealStrikeRequestClear;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::ModifyOrAdd(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
const FCS_PerReceiverArealStrikeRequestClear& GetPerReceiverArealStrikeRequestClear(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_PerReceiverArealStrikeRequestClear;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Get(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
UFUNCTION()
FCS_PerReceiverArealStrikeRequestClear GetPerReceiverArealStrikeRequestClear_BP(const FECSWorldPtr &inout World, bool &out bValid)
{
    FCS_PerReceiverArealStrikeRequestClear __r;
    bValid = false;
    bValid = ECSFunc_FCS_PerReceiverArealStrikeRequestClear::GetPerReceiverArealStrikeRequestClear(World);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FCS_PerReceiverArealStrikeRequestClear GetDefaultedPerReceiverArealStrikeRequestClear(const FECSWorldPtr &inout World)
{
    int local_10 = 0;
    const FCS_PerReceiverArealStrikeRequestClear __r;
    FECSComponentPtr local_6 = ECSInternal::GetDefaulted(World, ENTITY_ID_NULL, FCS_PerReceiverArealStrikeRequestClear);
    if ((local_6 == nullptr))
    {
    }
    else
    {
        local_10.InternalSet(local_6);
        return local_10.GetComp();
    }
    return __r;
}
UFUNCTION()
FCS_PerReceiverArealStrikeRequestClear GetDefaultedPerReceiverArealStrikeRequestClear_BP(const FECSWorldPtr &inout World)
{
    FCS_PerReceiverArealStrikeRequestClear __r;
    return __r;
}
UFUNCTION()
bool RemovePerReceiverArealStrikeRequestClear(const FECSWorldPtr &inout World)
{
    return ECSInternal::Remove(World, ENTITY_ID_NULL, FCS_PerReceiverArealStrikeRequestClear);
}
}
void __MonitorPerReceiverArealStrikeRequestClearLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FCS_PerReceiverArealStrikeRequestClear, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPerReceiverArealStrikeRequestClearActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FCS_PerReceiverArealStrikeRequestClear, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPerReceiverArealStrikeRequestClearModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FCS_PerReceiverArealStrikeRequestClear, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FCS_ServerHitTestDebugRecords
{
UFUNCTION()
bool HasServerHitTestDebugRecords(const FECSWorldPtr &inout World)
{
    return ECSInternal::Has(World, ENTITY_ID_NULL, FCS_ServerHitTestDebugRecords);
}
FCS_ServerHitTestDebugRecords& AssignServerHitTestDebugRecords(const FECSWorldPtr &inout World, const FCS_ServerHitTestDebugRecords &inout DefaultValue = FCS_ServerHitTestDebugRecords())
{
    UScriptStruct local_6 = FCS_ServerHitTestDebugRecords;
    FECSComponentPtr local_8;
    int local_10 = local_8 = ECSInternal::Assign(World, ENTITY_ID_NULL, local_6, FECSComponentPtr(DefaultValue));
    local_10.InternalSet(local_8);
    return local_10.GetComp();
}
UFUNCTION()
void AssignServerHitTestDebugRecords_BP(const FECSWorldPtr &inout World, const FCS_ServerHitTestDebugRecords &inout DefaultValue = FCS_ServerHitTestDebugRecords())
{
    ECSFunc_FCS_ServerHitTestDebugRecords::AssignServerHitTestDebugRecords(World, DefaultValue);
    return;
}
FCS_ServerHitTestDebugRecords& ModifyServerHitTestDebugRecords(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_ServerHitTestDebugRecords;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Modify(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
FCS_ServerHitTestDebugRecords& ModifyOrAddServerHitTestDebugRecords(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_ServerHitTestDebugRecords;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::ModifyOrAdd(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
const FCS_ServerHitTestDebugRecords& GetServerHitTestDebugRecords(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_ServerHitTestDebugRecords;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Get(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
UFUNCTION()
FCS_ServerHitTestDebugRecords GetServerHitTestDebugRecords_BP(const FECSWorldPtr &inout World, bool &out bValid)
{
    FCS_ServerHitTestDebugRecords __r;
    bValid = false;
    bValid = ECSFunc_FCS_ServerHitTestDebugRecords::GetServerHitTestDebugRecords(World);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FCS_ServerHitTestDebugRecords GetDefaultedServerHitTestDebugRecords(const FECSWorldPtr &inout World)
{
    int local_10 = 0;
    const FCS_ServerHitTestDebugRecords __r;
    FECSComponentPtr local_6 = ECSInternal::GetDefaulted(World, ENTITY_ID_NULL, FCS_ServerHitTestDebugRecords);
    if ((local_6 == nullptr))
    {
    }
    else
    {
        local_10.InternalSet(local_6);
        return local_10.GetComp();
    }
    return __r;
}
UFUNCTION()
FCS_ServerHitTestDebugRecords GetDefaultedServerHitTestDebugRecords_BP(const FECSWorldPtr &inout World)
{
    FCS_ServerHitTestDebugRecords __r;
    return __r;
}
UFUNCTION()
bool RemoveServerHitTestDebugRecords(const FECSWorldPtr &inout World)
{
    return ECSInternal::Remove(World, ENTITY_ID_NULL, FCS_ServerHitTestDebugRecords);
}
}
void __MonitorServerHitTestDebugRecordsLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FCS_ServerHitTestDebugRecords, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorServerHitTestDebugRecordsActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FCS_ServerHitTestDebugRecords, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorServerHitTestDebugRecordsModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FCS_ServerHitTestDebugRecords, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FCS_ClientHitTestDebugRecords
{
UFUNCTION()
bool HasClientHitTestDebugRecords(const FECSWorldPtr &inout World)
{
    return ECSInternal::Has(World, ENTITY_ID_NULL, FCS_ClientHitTestDebugRecords);
}
FCS_ClientHitTestDebugRecords& AssignClientHitTestDebugRecords(const FECSWorldPtr &inout World, const FCS_ClientHitTestDebugRecords &inout DefaultValue = FCS_ClientHitTestDebugRecords())
{
    UScriptStruct local_6 = FCS_ClientHitTestDebugRecords;
    FECSComponentPtr local_8;
    int local_10 = local_8 = ECSInternal::Assign(World, ENTITY_ID_NULL, local_6, FECSComponentPtr(DefaultValue));
    local_10.InternalSet(local_8);
    return local_10.GetComp();
}
UFUNCTION()
void AssignClientHitTestDebugRecords_BP(const FECSWorldPtr &inout World, const FCS_ClientHitTestDebugRecords &inout DefaultValue = FCS_ClientHitTestDebugRecords())
{
    ECSFunc_FCS_ClientHitTestDebugRecords::AssignClientHitTestDebugRecords(World, DefaultValue);
    return;
}
FCS_ClientHitTestDebugRecords& ModifyClientHitTestDebugRecords(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_ClientHitTestDebugRecords;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Modify(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
FCS_ClientHitTestDebugRecords& ModifyOrAddClientHitTestDebugRecords(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_ClientHitTestDebugRecords;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::ModifyOrAdd(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
const FCS_ClientHitTestDebugRecords& GetClientHitTestDebugRecords(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_ClientHitTestDebugRecords;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Get(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
UFUNCTION()
FCS_ClientHitTestDebugRecords GetClientHitTestDebugRecords_BP(const FECSWorldPtr &inout World, bool &out bValid)
{
    FCS_ClientHitTestDebugRecords __r;
    bValid = false;
    bValid = ECSFunc_FCS_ClientHitTestDebugRecords::GetClientHitTestDebugRecords(World);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FCS_ClientHitTestDebugRecords GetDefaultedClientHitTestDebugRecords(const FECSWorldPtr &inout World)
{
    int local_10 = 0;
    const FCS_ClientHitTestDebugRecords __r;
    FECSComponentPtr local_6 = ECSInternal::GetDefaulted(World, ENTITY_ID_NULL, FCS_ClientHitTestDebugRecords);
    if ((local_6 == nullptr))
    {
    }
    else
    {
        local_10.InternalSet(local_6);
        return local_10.GetComp();
    }
    return __r;
}
UFUNCTION()
FCS_ClientHitTestDebugRecords GetDefaultedClientHitTestDebugRecords_BP(const FECSWorldPtr &inout World)
{
    FCS_ClientHitTestDebugRecords __r;
    return __r;
}
UFUNCTION()
bool RemoveClientHitTestDebugRecords(const FECSWorldPtr &inout World)
{
    return ECSInternal::Remove(World, ENTITY_ID_NULL, FCS_ClientHitTestDebugRecords);
}
}
void __MonitorClientHitTestDebugRecordsLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FCS_ClientHitTestDebugRecords, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorClientHitTestDebugRecordsActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FCS_ClientHitTestDebugRecords, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorClientHitTestDebugRecordsModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FCS_ClientHitTestDebugRecords, bFixedFrame, Details);
    return;
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_ArealStrikeTimeFilter &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_ArealStrikeTimeFilter &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_ArealStrikeTimeFilter &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_ArealStrikeTimeFilter
{
int __IndexOf_LastFilterTime()
{
    return 0;
}
int __IndexOf_CurFilterTime()
{
    return 1;
}
int __IndexOf_LastEventCheckJobTime()
{
    return 2;
}
}
namespace AutoDelta
{
FSubDirtyFlags32 GetDirtyFlags(FHitTestDebugRecord &inout Data)
{
    FSubDirtyFlags32 __r;
    return __r;
}
void ClearDirtyFlags(FHitTestDebugRecord &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FHitTestDebugRecord
{
int __IndexOf_bServer()
{
    return 0;
}
int __IndexOf_ServerHitTimeSeconds()
{
    return 1;
}
int __IndexOf_ClientHitTime()
{
    return 2;
}
int __IndexOf_ServerFixedFrame()
{
    return 3;
}
int __IndexOf_ClientFixedFrame()
{
    return 4;
}
int __IndexOf_ServerRequestTimeSeconds()
{
    return 5;
}
int __IndexOf_ClientRequestTime()
{
    return 6;
}
int __IndexOf_RequestCreatedFrame()
{
    return 7;
}
int __IndexOf_RequestEventId()
{
    return 8;
}
int __IndexOf_ActionFromFrame()
{
    return 9;
}
int __IndexOf_ActionToFrame()
{
    return 10;
}
int __IndexOf_SenderEntityId()
{
    return 11;
}
int __IndexOf_ActionIdentifier()
{
    return 12;
}
int __IndexOf_StrikeKey()
{
    return 13;
}
int __IndexOf_bPerEntityQuest()
{
    return 14;
}
int __IndexOf_HitEntityIds()
{
    return 15;
}
}
