
enum EPlayerNotify
{
    CommissionStart,
    CommissionEnd,
    MAX,
}

namespace __INTENRAL_FCS_PlayerNotifyRegistry_NS
{
    const TECSComponentDerivedPtr<FCS_PlayerNotifyRegistry> DerivedPtr = TECSComponentDerivedPtr<FCS_PlayerNotifyRegistry>();
    const FCS_PlayerNotifyRegistry DefaultValue = FCS_PlayerNotifyRegistry();
}
namespace __INTENRAL_FC_PlayerNotify_NS
{
    const TECSComponentDerivedPtr<FC_PlayerNotify> DerivedPtr = TECSComponentDerivedPtr<FC_PlayerNotify>();
    const FC_PlayerNotify DefaultValue = FC_PlayerNotify();
}
namespace __INTENRAL_FC_PlayerNotifyClientCache_NS
{
    const TECSComponentDerivedPtr<FC_PlayerNotifyClientCache> DerivedPtr = TECSComponentDerivedPtr<FC_PlayerNotifyClientCache>();
    const FC_PlayerNotifyClientCache DefaultValue = FC_PlayerNotifyClientCache();
}
namespace __INTENRAL_FC_PlayerNotifyPendingResponse_NS
{
    const TECSComponentDerivedPtr<FC_PlayerNotifyPendingResponse> DerivedPtr = TECSComponentDerivedPtr<FC_PlayerNotifyPendingResponse>();
    const FC_PlayerNotifyPendingResponse DefaultValue = FC_PlayerNotifyPendingResponse();
}
namespace __INTENRAL_FCE_PlayerNotifyClientResponse_NS
{
    const TECSEventDerivedPtr<FCE_PlayerNotifyClientResponse> DerivedPtr = TECSEventDerivedPtr<FCE_PlayerNotifyClientResponse>();
}
namespace __INTENRAL_FCE_OnReceivePlayerNotify_NS
{
    const TECSEventDerivedPtr<FCE_OnReceivePlayerNotify> DerivedPtr = TECSEventDerivedPtr<FCE_OnReceivePlayerNotify>();

}
struct FCS_PlayerNotifyRegistry : FECSSingleton
{
    UPROPERTY()
    FBitSet32 PlayerNotifies;

    FCS_PlayerNotifyRegistry()
    {
        return;
    }
}

struct FC_PlayerNotify : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    FBitSet32 m_PlayerNotifies;
    UPROPERTY()
    FBitSet32 m_PlayerResponce;

    FC_PlayerNotify()
    {
        this.__InitDirtyFlags();
        return;
    }
    FC_PlayerNotify(const FC_PlayerNotify &inout Other)
    {
        this.__InitDirtyFlags();
        this.m_PlayerNotifies = Other.m_PlayerNotifies;
        this.m_PlayerResponce = Other.m_PlayerResponce;
        return;
    }
    FC_PlayerNotify opAssign(const FC_PlayerNotify &inout Other)
    {
        FC_PlayerNotify __r;
        this.SetPlayerNotifies(Other.GetPlayerNotifies());
        this.SetPlayerResponce(Other.GetPlayerResponce());
        return __r;
    }
    const FBitSet32 GetPlayerNotifies() const property
    {
        const FBitSet32 __r;
        return __r;
    }
    FBitSet32 GetModify_PlayerNotifies() property
    {
        FBitSet32 __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetPlayerNotifies(const FBitSet32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_PlayerNotifies = __Value;
        return;
    }
    const FBitSet32 GetPlayerResponce() const property
    {
        const FBitSet32 __r;
        return __r;
    }
    FBitSet32 GetModify_PlayerResponce() property
    {
        FBitSet32 __r;
        this.__MarkDirty(1);
        return __r;
    }
    void SetPlayerResponce(const FBitSet32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_PlayerResponce = __Value;
        return;
    }
}

struct FC_PlayerNotifyClientCache : FECSComponent
{
    UPROPERTY()
    FBitSet32 HandledNotifies;
    UPROPERTY()
    FBitSet32 HasSendEventToView;

    FC_PlayerNotifyClientCache()
    {
        return;
    }
}

struct FCE_PlayerNotifyClientResponse : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FBitSet32 Response;

    FCE_PlayerNotifyClientResponse()
    {
        return;
    }
}

struct FC_PlayerNotifyPendingResponse : FECSComponent
{
    UPROPERTY()
    FBitSet32 Responce;

    FC_PlayerNotifyPendingResponse()
    {
        return;
    }
}

struct FCE_OnReceivePlayerNotify : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    EPlayerNotify NotifyType;


}

namespace ECSFunc_FCS_PlayerNotifyRegistry
{
UFUNCTION()
bool HasPlayerNotifyRegistry(const FECSWorldPtr &inout World)
{
    return ECSInternal::Has(World, ENTITY_ID_NULL, FCS_PlayerNotifyRegistry);
}
FCS_PlayerNotifyRegistry& AssignPlayerNotifyRegistry(const FECSWorldPtr &inout World, const FCS_PlayerNotifyRegistry &inout DefaultValue = FCS_PlayerNotifyRegistry())
{
    UScriptStruct local_6 = FCS_PlayerNotifyRegistry;
    FECSComponentPtr local_8;
    int local_10 = local_8 = ECSInternal::Assign(World, ENTITY_ID_NULL, local_6, FECSComponentPtr(DefaultValue));
    local_10.InternalSet(local_8);
    return local_10.GetComp();
}
UFUNCTION()
void AssignPlayerNotifyRegistry_BP(const FECSWorldPtr &inout World, const FCS_PlayerNotifyRegistry &inout DefaultValue = FCS_PlayerNotifyRegistry())
{
    ECSFunc_FCS_PlayerNotifyRegistry::AssignPlayerNotifyRegistry(World, DefaultValue);
    return;
}
FCS_PlayerNotifyRegistry& ModifyPlayerNotifyRegistry(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_PlayerNotifyRegistry;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Modify(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
FCS_PlayerNotifyRegistry& ModifyOrAddPlayerNotifyRegistry(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_PlayerNotifyRegistry;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::ModifyOrAdd(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
const FCS_PlayerNotifyRegistry& GetPlayerNotifyRegistry(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_PlayerNotifyRegistry;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Get(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
UFUNCTION()
FCS_PlayerNotifyRegistry GetPlayerNotifyRegistry_BP(const FECSWorldPtr &inout World, bool &out bValid)
{
    FCS_PlayerNotifyRegistry __r;
    bValid = false;
    bValid = ECSFunc_FCS_PlayerNotifyRegistry::GetPlayerNotifyRegistry(World);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FCS_PlayerNotifyRegistry GetDefaultedPlayerNotifyRegistry(const FECSWorldPtr &inout World)
{
    int local_10 = 0;
    const FCS_PlayerNotifyRegistry __r;
    FECSComponentPtr local_6 = ECSInternal::GetDefaulted(World, ENTITY_ID_NULL, FCS_PlayerNotifyRegistry);
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
FCS_PlayerNotifyRegistry GetDefaultedPlayerNotifyRegistry_BP(const FECSWorldPtr &inout World)
{
    FCS_PlayerNotifyRegistry __r;
    return __r;
}
UFUNCTION()
bool RemovePlayerNotifyRegistry(const FECSWorldPtr &inout World)
{
    return ECSInternal::Remove(World, ENTITY_ID_NULL, FCS_PlayerNotifyRegistry);
}
}
void __MonitorPlayerNotifyRegistryLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FCS_PlayerNotifyRegistry, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPlayerNotifyRegistryActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FCS_PlayerNotifyRegistry, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPlayerNotifyRegistryModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FCS_PlayerNotifyRegistry, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_PlayerNotify
{
UFUNCTION()
bool HasPlayerNotify(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_PlayerNotify);
}
FC_PlayerNotify& AssignPlayerNotify(const FECSEntity &inout Entity, const FC_PlayerNotify &inout DefaultValue = FC_PlayerNotify())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_PlayerNotify, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignPlayerNotify_BP(const FECSEntity &inout Entity, const FC_PlayerNotify &inout DefaultValue = FC_PlayerNotify())
{
    ECSFunc_FC_PlayerNotify::AssignPlayerNotify(Entity, DefaultValue);
    return;
}
FC_PlayerNotify& ModifyPlayerNotify(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_PlayerNotify));
    return local_12.GetComp();
}
FC_PlayerNotify& ModifyOrAddPlayerNotify(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_PlayerNotify));
    return local_12.GetComp();
}
const FC_PlayerNotify& GetPlayerNotify(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_PlayerNotify));
    return local_12.GetComp();
}
UFUNCTION()
FC_PlayerNotify GetPlayerNotify_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_PlayerNotify& local_4 = ECSFunc_FC_PlayerNotify::GetPlayerNotify(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_PlayerNotify();
}
const FC_PlayerNotify GetDefaultedPlayerNotify(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_PlayerNotify __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_PlayerNotify);
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
FC_PlayerNotify GetDefaultedPlayerNotify_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_PlayerNotify::GetDefaultedPlayerNotify(Entity);
}
UFUNCTION()
bool RemovePlayerNotify(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_PlayerNotify);
}
}
FECSMonitorRuntimeView __GetMonitorPlayerNotifyOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_PlayerNotify, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPlayerNotifyOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_PlayerNotify, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPlayerNotifyOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_PlayerNotify, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPlayerNotifyOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_PlayerNotify, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPlayerNotifyOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_PlayerNotify, bFixedFrame, bMustHandleAll);
}
void __MonitorPlayerNotifyLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_PlayerNotify, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPlayerNotifyActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_PlayerNotify, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPlayerNotifyModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_PlayerNotify, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_PlayerNotifyClientCache
{
UFUNCTION()
bool HasPlayerNotifyClientCache(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_PlayerNotifyClientCache);
}
FC_PlayerNotifyClientCache& AssignPlayerNotifyClientCache(const FECSEntity &inout Entity, const FC_PlayerNotifyClientCache &inout DefaultValue = FC_PlayerNotifyClientCache())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_PlayerNotifyClientCache, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignPlayerNotifyClientCache_BP(const FECSEntity &inout Entity, const FC_PlayerNotifyClientCache &inout DefaultValue = FC_PlayerNotifyClientCache())
{
    ECSFunc_FC_PlayerNotifyClientCache::AssignPlayerNotifyClientCache(Entity, DefaultValue);
    return;
}
FC_PlayerNotifyClientCache& ModifyPlayerNotifyClientCache(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_PlayerNotifyClientCache));
    return local_12.GetComp();
}
FC_PlayerNotifyClientCache& ModifyOrAddPlayerNotifyClientCache(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_PlayerNotifyClientCache));
    return local_12.GetComp();
}
const FC_PlayerNotifyClientCache& GetPlayerNotifyClientCache(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_PlayerNotifyClientCache));
    return local_12.GetComp();
}
UFUNCTION()
FC_PlayerNotifyClientCache GetPlayerNotifyClientCache_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_PlayerNotifyClientCache __r;
    bValid = false;
    bValid = ECSFunc_FC_PlayerNotifyClientCache::GetPlayerNotifyClientCache(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_PlayerNotifyClientCache GetDefaultedPlayerNotifyClientCache(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_PlayerNotifyClientCache __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_PlayerNotifyClientCache);
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
FC_PlayerNotifyClientCache GetDefaultedPlayerNotifyClientCache_BP(const FECSEntity &inout Entity)
{
    FC_PlayerNotifyClientCache __r;
    return __r;
}
UFUNCTION()
bool RemovePlayerNotifyClientCache(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_PlayerNotifyClientCache);
}
}
FECSMonitorRuntimeView __GetMonitorPlayerNotifyClientCacheOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_PlayerNotifyClientCache, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPlayerNotifyClientCacheOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_PlayerNotifyClientCache, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPlayerNotifyClientCacheOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_PlayerNotifyClientCache, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPlayerNotifyClientCacheOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_PlayerNotifyClientCache, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPlayerNotifyClientCacheOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_PlayerNotifyClientCache, bFixedFrame, bMustHandleAll);
}
void __MonitorPlayerNotifyClientCacheLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_PlayerNotifyClientCache, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPlayerNotifyClientCacheActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_PlayerNotifyClientCache, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPlayerNotifyClientCacheModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_PlayerNotifyClientCache, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_PlayerNotifyPendingResponse
{
UFUNCTION()
bool HasPlayerNotifyPendingResponse(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_PlayerNotifyPendingResponse);
}
FC_PlayerNotifyPendingResponse& AssignPlayerNotifyPendingResponse(const FECSEntity &inout Entity, const FC_PlayerNotifyPendingResponse &inout DefaultValue = FC_PlayerNotifyPendingResponse())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_PlayerNotifyPendingResponse, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignPlayerNotifyPendingResponse_BP(const FECSEntity &inout Entity, const FC_PlayerNotifyPendingResponse &inout DefaultValue = FC_PlayerNotifyPendingResponse())
{
    ECSFunc_FC_PlayerNotifyPendingResponse::AssignPlayerNotifyPendingResponse(Entity, DefaultValue);
    return;
}
FC_PlayerNotifyPendingResponse& ModifyPlayerNotifyPendingResponse(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_PlayerNotifyPendingResponse));
    return local_12.GetComp();
}
FC_PlayerNotifyPendingResponse& ModifyOrAddPlayerNotifyPendingResponse(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_PlayerNotifyPendingResponse));
    return local_12.GetComp();
}
const FC_PlayerNotifyPendingResponse& GetPlayerNotifyPendingResponse(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_PlayerNotifyPendingResponse));
    return local_12.GetComp();
}
UFUNCTION()
FC_PlayerNotifyPendingResponse GetPlayerNotifyPendingResponse_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_PlayerNotifyPendingResponse __r;
    bValid = false;
    bValid = ECSFunc_FC_PlayerNotifyPendingResponse::GetPlayerNotifyPendingResponse(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_PlayerNotifyPendingResponse GetDefaultedPlayerNotifyPendingResponse(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_PlayerNotifyPendingResponse __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_PlayerNotifyPendingResponse);
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
FC_PlayerNotifyPendingResponse GetDefaultedPlayerNotifyPendingResponse_BP(const FECSEntity &inout Entity)
{
    FC_PlayerNotifyPendingResponse __r;
    return __r;
}
UFUNCTION()
bool RemovePlayerNotifyPendingResponse(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_PlayerNotifyPendingResponse);
}
}
FECSMonitorRuntimeView __GetMonitorPlayerNotifyPendingResponseOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_PlayerNotifyPendingResponse, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPlayerNotifyPendingResponseOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_PlayerNotifyPendingResponse, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPlayerNotifyPendingResponseOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_PlayerNotifyPendingResponse, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPlayerNotifyPendingResponseOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_PlayerNotifyPendingResponse, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPlayerNotifyPendingResponseOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_PlayerNotifyPendingResponse, bFixedFrame, bMustHandleAll);
}
void __MonitorPlayerNotifyPendingResponseLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_PlayerNotifyPendingResponse, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPlayerNotifyPendingResponseActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_PlayerNotifyPendingResponse, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPlayerNotifyPendingResponseModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_PlayerNotifyPendingResponse, bFixedFrame, Details);
    return;
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_PlayerNotify &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_PlayerNotify &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_PlayerNotify &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_PlayerNotify
{
int __IndexOf_PlayerNotifies()
{
    return 0;
}
int __IndexOf_PlayerResponce()
{
    return 1;
}
}
