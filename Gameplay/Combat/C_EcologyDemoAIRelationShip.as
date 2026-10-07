
namespace __INTENRAL_FC_EcologyDemoAIRelationShipTeamMember_NS
{
    const TECSComponentDerivedPtr<FC_EcologyDemoAIRelationShipTeamMember> DerivedPtr = TECSComponentDerivedPtr<FC_EcologyDemoAIRelationShipTeamMember>();
    const FC_EcologyDemoAIRelationShipTeamMember DefaultValue = FC_EcologyDemoAIRelationShipTeamMember();
}
namespace __INTENRAL_FCS_EcologyDemoAIRelationShipTeam_NS
{
    const TECSComponentDerivedPtr<FCS_EcologyDemoAIRelationShipTeam> DerivedPtr = TECSComponentDerivedPtr<FCS_EcologyDemoAIRelationShipTeam>();
    const FCS_EcologyDemoAIRelationShipTeam DefaultValue = FCS_EcologyDemoAIRelationShipTeam();

}
struct FC_EcologyDemoAIRelationShipTeamMember : FECSComponent
{
    UPROPERTY()
    int TeamID = -1;


}

struct FEcologyDemoAIRelationShipTeamDetail
{
    UPROPERTY()
    int TeamID = -1;
    UPROPERTY()
    TSet<FTargetEntity> TeamMemberSet;
    UPROPERTY()
    FTargetEntity TeamLeader;


}

struct FCS_EcologyDemoAIRelationShipTeam : FECSSingleton
{
    UPROPERTY()
    TMap<int, FEcologyDemoAIRelationShipTeamDetail> RelationShipTeamDetailMap;
    UPROPERTY()
    int NextTeamID = 0;


}

namespace ECSFunc_FC_EcologyDemoAIRelationShipTeamMember
{
UFUNCTION()
bool HasEcologyDemoAIRelationShipTeamMember(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_EcologyDemoAIRelationShipTeamMember);
}
FC_EcologyDemoAIRelationShipTeamMember& AssignEcologyDemoAIRelationShipTeamMember(const FECSEntity &inout Entity, const FC_EcologyDemoAIRelationShipTeamMember &inout DefaultValue = FC_EcologyDemoAIRelationShipTeamMember())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_EcologyDemoAIRelationShipTeamMember, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignEcologyDemoAIRelationShipTeamMember_BP(const FECSEntity &inout Entity, const FC_EcologyDemoAIRelationShipTeamMember &inout DefaultValue = FC_EcologyDemoAIRelationShipTeamMember())
{
    ECSFunc_FC_EcologyDemoAIRelationShipTeamMember::AssignEcologyDemoAIRelationShipTeamMember(Entity, DefaultValue);
    return;
}
FC_EcologyDemoAIRelationShipTeamMember& ModifyEcologyDemoAIRelationShipTeamMember(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_EcologyDemoAIRelationShipTeamMember));
    return local_12.GetComp();
}
FC_EcologyDemoAIRelationShipTeamMember& ModifyOrAddEcologyDemoAIRelationShipTeamMember(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_EcologyDemoAIRelationShipTeamMember));
    return local_12.GetComp();
}
const FC_EcologyDemoAIRelationShipTeamMember& GetEcologyDemoAIRelationShipTeamMember(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_EcologyDemoAIRelationShipTeamMember));
    return local_12.GetComp();
}
UFUNCTION()
FC_EcologyDemoAIRelationShipTeamMember GetEcologyDemoAIRelationShipTeamMember_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_EcologyDemoAIRelationShipTeamMember& local_4 = ECSFunc_FC_EcologyDemoAIRelationShipTeamMember::GetEcologyDemoAIRelationShipTeamMember(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_EcologyDemoAIRelationShipTeamMember();
}
const FC_EcologyDemoAIRelationShipTeamMember GetDefaultedEcologyDemoAIRelationShipTeamMember(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_EcologyDemoAIRelationShipTeamMember __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_EcologyDemoAIRelationShipTeamMember);
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
FC_EcologyDemoAIRelationShipTeamMember GetDefaultedEcologyDemoAIRelationShipTeamMember_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_EcologyDemoAIRelationShipTeamMember::GetDefaultedEcologyDemoAIRelationShipTeamMember(Entity);
}
UFUNCTION()
bool RemoveEcologyDemoAIRelationShipTeamMember(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_EcologyDemoAIRelationShipTeamMember);
}
}
FECSMonitorRuntimeView __GetMonitorEcologyDemoAIRelationShipTeamMemberOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_EcologyDemoAIRelationShipTeamMember, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcologyDemoAIRelationShipTeamMemberOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_EcologyDemoAIRelationShipTeamMember, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcologyDemoAIRelationShipTeamMemberOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_EcologyDemoAIRelationShipTeamMember, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcologyDemoAIRelationShipTeamMemberOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_EcologyDemoAIRelationShipTeamMember, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcologyDemoAIRelationShipTeamMemberOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_EcologyDemoAIRelationShipTeamMember, bFixedFrame, bMustHandleAll);
}
void __MonitorEcologyDemoAIRelationShipTeamMemberLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_EcologyDemoAIRelationShipTeamMember, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcologyDemoAIRelationShipTeamMemberActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_EcologyDemoAIRelationShipTeamMember, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcologyDemoAIRelationShipTeamMemberModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_EcologyDemoAIRelationShipTeamMember, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FCS_EcologyDemoAIRelationShipTeam
{
UFUNCTION()
bool HasEcologyDemoAIRelationShipTeam(const FECSWorldPtr &inout World)
{
    return ECSInternal::Has(World, ENTITY_ID_NULL, FCS_EcologyDemoAIRelationShipTeam);
}
FCS_EcologyDemoAIRelationShipTeam& AssignEcologyDemoAIRelationShipTeam(const FECSWorldPtr &inout World, const FCS_EcologyDemoAIRelationShipTeam &inout DefaultValue = FCS_EcologyDemoAIRelationShipTeam())
{
    UScriptStruct local_6 = FCS_EcologyDemoAIRelationShipTeam;
    FECSComponentPtr local_8;
    int local_10 = local_8 = ECSInternal::Assign(World, ENTITY_ID_NULL, local_6, FECSComponentPtr(DefaultValue));
    local_10.InternalSet(local_8);
    return local_10.GetComp();
}
UFUNCTION()
void AssignEcologyDemoAIRelationShipTeam_BP(const FECSWorldPtr &inout World, const FCS_EcologyDemoAIRelationShipTeam &inout DefaultValue = FCS_EcologyDemoAIRelationShipTeam())
{
    ECSFunc_FCS_EcologyDemoAIRelationShipTeam::AssignEcologyDemoAIRelationShipTeam(World, DefaultValue);
    return;
}
FCS_EcologyDemoAIRelationShipTeam& ModifyEcologyDemoAIRelationShipTeam(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_EcologyDemoAIRelationShipTeam;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Modify(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
FCS_EcologyDemoAIRelationShipTeam& ModifyOrAddEcologyDemoAIRelationShipTeam(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_EcologyDemoAIRelationShipTeam;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::ModifyOrAdd(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
const FCS_EcologyDemoAIRelationShipTeam& GetEcologyDemoAIRelationShipTeam(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_EcologyDemoAIRelationShipTeam;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Get(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
UFUNCTION()
FCS_EcologyDemoAIRelationShipTeam GetEcologyDemoAIRelationShipTeam_BP(const FECSWorldPtr &inout World, bool &out bValid)
{
    FCS_EcologyDemoAIRelationShipTeam __r;
    bValid = false;
    bValid = ECSFunc_FCS_EcologyDemoAIRelationShipTeam::GetEcologyDemoAIRelationShipTeam(World);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FCS_EcologyDemoAIRelationShipTeam GetDefaultedEcologyDemoAIRelationShipTeam(const FECSWorldPtr &inout World)
{
    int local_10 = 0;
    const FCS_EcologyDemoAIRelationShipTeam __r;
    FECSComponentPtr local_6 = ECSInternal::GetDefaulted(World, ENTITY_ID_NULL, FCS_EcologyDemoAIRelationShipTeam);
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
FCS_EcologyDemoAIRelationShipTeam GetDefaultedEcologyDemoAIRelationShipTeam_BP(const FECSWorldPtr &inout World)
{
    FCS_EcologyDemoAIRelationShipTeam __r;
    return __r;
}
UFUNCTION()
bool RemoveEcologyDemoAIRelationShipTeam(const FECSWorldPtr &inout World)
{
    return ECSInternal::Remove(World, ENTITY_ID_NULL, FCS_EcologyDemoAIRelationShipTeam);
}
}
void __MonitorEcologyDemoAIRelationShipTeamLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FCS_EcologyDemoAIRelationShipTeam, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcologyDemoAIRelationShipTeamActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FCS_EcologyDemoAIRelationShipTeam, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcologyDemoAIRelationShipTeamModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FCS_EcologyDemoAIRelationShipTeam, bFixedFrame, Details);
    return;
}
