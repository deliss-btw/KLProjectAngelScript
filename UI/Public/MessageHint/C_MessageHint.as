
namespace __INTENRAL_FC_TeamMemberInfoSkillHintTag_NS
{
    const TECSComponentDerivedPtr<FC_TeamMemberInfoSkillHintTag> DerivedPtr = TECSComponentDerivedPtr<FC_TeamMemberInfoSkillHintTag>();
    const FC_TeamMemberInfoSkillHintTag DefaultValue = FC_TeamMemberInfoSkillHintTag();
}
namespace __INTENRAL_FCE_ShowMessageHint_Server_NS
{
    const TECSEventDerivedPtr<FCE_ShowMessageHint_Server> DerivedPtr = TECSEventDerivedPtr<FCE_ShowMessageHint_Server>();
}
namespace __INTENRAL_FCE_ShowMessageHint_Client_NS
{
    const TECSEventDerivedPtr<FCE_ShowMessageHint_Client> DerivedPtr = TECSEventDerivedPtr<FCE_ShowMessageHint_Client>();

}
struct FCE_ShowMessageHint_Server : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FShowMessageHintParams Params;

    FCE_ShowMessageHint_Server()
    {
        return;
    }
}

struct FCE_ShowMessageHint_Client : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FShowMessageHintParams Params;

    FCE_ShowMessageHint_Client()
    {
        return;
    }
}

struct FC_TeamMemberInfoSkillHintTag : FECSComponent
{
    FC_TeamMemberInfoSkillHintTag()
    {
        return;
    }
}

namespace ECSFunc_FC_TeamMemberInfoSkillHintTag
{
UFUNCTION()
bool HasTeamMemberInfoSkillHintTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_TeamMemberInfoSkillHintTag);
}
FC_TeamMemberInfoSkillHintTag& AssignTeamMemberInfoSkillHintTag(const FECSEntity &inout Entity, const FC_TeamMemberInfoSkillHintTag &inout DefaultValue = FC_TeamMemberInfoSkillHintTag())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_TeamMemberInfoSkillHintTag, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignTeamMemberInfoSkillHintTag_BP(const FECSEntity &inout Entity, const FC_TeamMemberInfoSkillHintTag &inout DefaultValue = FC_TeamMemberInfoSkillHintTag())
{
    ECSFunc_FC_TeamMemberInfoSkillHintTag::AssignTeamMemberInfoSkillHintTag(Entity, DefaultValue);
    return;
}
FC_TeamMemberInfoSkillHintTag& ModifyTeamMemberInfoSkillHintTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_TeamMemberInfoSkillHintTag));
    return local_12.GetComp();
}
FC_TeamMemberInfoSkillHintTag& ModifyOrAddTeamMemberInfoSkillHintTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_TeamMemberInfoSkillHintTag));
    return local_12.GetComp();
}
const FC_TeamMemberInfoSkillHintTag& GetTeamMemberInfoSkillHintTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_TeamMemberInfoSkillHintTag));
    return local_12.GetComp();
}
UFUNCTION()
FC_TeamMemberInfoSkillHintTag GetTeamMemberInfoSkillHintTag_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_TeamMemberInfoSkillHintTag& local_4 = ECSFunc_FC_TeamMemberInfoSkillHintTag::GetTeamMemberInfoSkillHintTag(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_TeamMemberInfoSkillHintTag();
}
const FC_TeamMemberInfoSkillHintTag GetDefaultedTeamMemberInfoSkillHintTag(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_TeamMemberInfoSkillHintTag __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_TeamMemberInfoSkillHintTag);
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
FC_TeamMemberInfoSkillHintTag GetDefaultedTeamMemberInfoSkillHintTag_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_TeamMemberInfoSkillHintTag::GetDefaultedTeamMemberInfoSkillHintTag(Entity);
}
UFUNCTION()
bool RemoveTeamMemberInfoSkillHintTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_TeamMemberInfoSkillHintTag);
}
}
FECSMonitorRuntimeView __GetMonitorTeamMemberInfoSkillHintTagOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_TeamMemberInfoSkillHintTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorTeamMemberInfoSkillHintTagOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_TeamMemberInfoSkillHintTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorTeamMemberInfoSkillHintTagOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_TeamMemberInfoSkillHintTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorTeamMemberInfoSkillHintTagOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_TeamMemberInfoSkillHintTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorTeamMemberInfoSkillHintTagOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_TeamMemberInfoSkillHintTag, bFixedFrame, bMustHandleAll);
}
void __MonitorTeamMemberInfoSkillHintTagLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_TeamMemberInfoSkillHintTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorTeamMemberInfoSkillHintTagActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_TeamMemberInfoSkillHintTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorTeamMemberInfoSkillHintTagModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_TeamMemberInfoSkillHintTag, bFixedFrame, Details);
    return;
}
