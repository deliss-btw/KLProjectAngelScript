
namespace __INTENRAL_FC_GTCRemoteSession_NS
{
    const TECSComponentDerivedPtr<FC_GTCRemoteSession> DerivedPtr = TECSComponentDerivedPtr<FC_GTCRemoteSession>();
    const FC_GTCRemoteSession DefaultValue = FC_GTCRemoteSession();
}
namespace __INTENRAL_FC_GTCRemoteSessionDSConnectedTag_NS
{
    const TECSComponentDerivedPtr<FC_GTCRemoteSessionDSConnectedTag> DerivedPtr = TECSComponentDerivedPtr<FC_GTCRemoteSessionDSConnectedTag>();
    const FC_GTCRemoteSessionDSConnectedTag DefaultValue = FC_GTCRemoteSessionDSConnectedTag();

}
struct FC_GTCRemoteSession : FECSComponent
{
    UPROPERTY()
    FString SessionID;
    UPROPERTY()
    FString TCPHost;
    UPROPERTY()
    int TCPPort = 0;
    UPROPERTY()
    FString APIKey;


}

struct FC_GTCRemoteSessionDSConnectedTag : FECSComponent
{
    FC_GTCRemoteSessionDSConnectedTag()
    {
        return;
    }
}

namespace ECSFunc_FC_GTCRemoteSession
{
UFUNCTION()
bool HasGTCRemoteSession(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_GTCRemoteSession);
}
FC_GTCRemoteSession& AssignGTCRemoteSession(const FECSEntity &inout Entity, const FC_GTCRemoteSession &inout DefaultValue = FC_GTCRemoteSession())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_GTCRemoteSession, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignGTCRemoteSession_BP(const FECSEntity &inout Entity, const FC_GTCRemoteSession &inout DefaultValue = FC_GTCRemoteSession())
{
    ECSFunc_FC_GTCRemoteSession::AssignGTCRemoteSession(Entity, DefaultValue);
    return;
}
FC_GTCRemoteSession& ModifyGTCRemoteSession(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_GTCRemoteSession));
    return local_12.GetComp();
}
FC_GTCRemoteSession& ModifyOrAddGTCRemoteSession(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_GTCRemoteSession));
    return local_12.GetComp();
}
const FC_GTCRemoteSession& GetGTCRemoteSession(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_GTCRemoteSession));
    return local_12.GetComp();
}
UFUNCTION()
FC_GTCRemoteSession GetGTCRemoteSession_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_GTCRemoteSession __r;
    bValid = false;
    bValid = ECSFunc_FC_GTCRemoteSession::GetGTCRemoteSession(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_GTCRemoteSession GetDefaultedGTCRemoteSession(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_GTCRemoteSession __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_GTCRemoteSession);
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
FC_GTCRemoteSession GetDefaultedGTCRemoteSession_BP(const FECSEntity &inout Entity)
{
    FC_GTCRemoteSession __r;
    return __r;
}
UFUNCTION()
bool RemoveGTCRemoteSession(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_GTCRemoteSession);
}
}
FECSMonitorRuntimeView __GetMonitorGTCRemoteSessionOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_GTCRemoteSession, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorGTCRemoteSessionOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_GTCRemoteSession, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorGTCRemoteSessionOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_GTCRemoteSession, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorGTCRemoteSessionOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_GTCRemoteSession, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorGTCRemoteSessionOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_GTCRemoteSession, bFixedFrame, bMustHandleAll);
}
void __MonitorGTCRemoteSessionLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_GTCRemoteSession, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorGTCRemoteSessionActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_GTCRemoteSession, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorGTCRemoteSessionModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_GTCRemoteSession, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_GTCRemoteSessionDSConnectedTag
{
UFUNCTION()
bool HasGTCRemoteSessionDSConnectedTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_GTCRemoteSessionDSConnectedTag);
}
FC_GTCRemoteSessionDSConnectedTag& AssignGTCRemoteSessionDSConnectedTag(const FECSEntity &inout Entity, const FC_GTCRemoteSessionDSConnectedTag &inout DefaultValue = FC_GTCRemoteSessionDSConnectedTag())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_GTCRemoteSessionDSConnectedTag, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignGTCRemoteSessionDSConnectedTag_BP(const FECSEntity &inout Entity, const FC_GTCRemoteSessionDSConnectedTag &inout DefaultValue = FC_GTCRemoteSessionDSConnectedTag())
{
    ECSFunc_FC_GTCRemoteSessionDSConnectedTag::AssignGTCRemoteSessionDSConnectedTag(Entity, DefaultValue);
    return;
}
FC_GTCRemoteSessionDSConnectedTag& ModifyGTCRemoteSessionDSConnectedTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_GTCRemoteSessionDSConnectedTag));
    return local_12.GetComp();
}
FC_GTCRemoteSessionDSConnectedTag& ModifyOrAddGTCRemoteSessionDSConnectedTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_GTCRemoteSessionDSConnectedTag));
    return local_12.GetComp();
}
const FC_GTCRemoteSessionDSConnectedTag& GetGTCRemoteSessionDSConnectedTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_GTCRemoteSessionDSConnectedTag));
    return local_12.GetComp();
}
UFUNCTION()
FC_GTCRemoteSessionDSConnectedTag GetGTCRemoteSessionDSConnectedTag_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_GTCRemoteSessionDSConnectedTag& local_4 = ECSFunc_FC_GTCRemoteSessionDSConnectedTag::GetGTCRemoteSessionDSConnectedTag(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_GTCRemoteSessionDSConnectedTag();
}
const FC_GTCRemoteSessionDSConnectedTag GetDefaultedGTCRemoteSessionDSConnectedTag(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_GTCRemoteSessionDSConnectedTag __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_GTCRemoteSessionDSConnectedTag);
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
FC_GTCRemoteSessionDSConnectedTag GetDefaultedGTCRemoteSessionDSConnectedTag_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_GTCRemoteSessionDSConnectedTag::GetDefaultedGTCRemoteSessionDSConnectedTag(Entity);
}
UFUNCTION()
bool RemoveGTCRemoteSessionDSConnectedTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_GTCRemoteSessionDSConnectedTag);
}
}
FECSMonitorRuntimeView __GetMonitorGTCRemoteSessionDSConnectedTagOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_GTCRemoteSessionDSConnectedTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorGTCRemoteSessionDSConnectedTagOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_GTCRemoteSessionDSConnectedTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorGTCRemoteSessionDSConnectedTagOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_GTCRemoteSessionDSConnectedTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorGTCRemoteSessionDSConnectedTagOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_GTCRemoteSessionDSConnectedTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorGTCRemoteSessionDSConnectedTagOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_GTCRemoteSessionDSConnectedTag, bFixedFrame, bMustHandleAll);
}
void __MonitorGTCRemoteSessionDSConnectedTagLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_GTCRemoteSessionDSConnectedTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorGTCRemoteSessionDSConnectedTagActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_GTCRemoteSessionDSConnectedTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorGTCRemoteSessionDSConnectedTagModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_GTCRemoteSessionDSConnectedTag, bFixedFrame, Details);
    return;
}
