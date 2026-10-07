
namespace __INTENRAL_FC_InitAITeammate_NS
{
    const TECSComponentDerivedPtr<FC_InitAITeammate> DerivedPtr = TECSComponentDerivedPtr<FC_InitAITeammate>();
    const FC_InitAITeammate DefaultValue = FC_InitAITeammate();
}
namespace __INTENRAL_FC_AIPlayerTag_NS
{
    const TECSComponentDerivedPtr<FC_AIPlayerTag> DerivedPtr = TECSComponentDerivedPtr<FC_AIPlayerTag>();
    const FC_AIPlayerTag DefaultValue = FC_AIPlayerTag();

}
struct FC_InitAITeammate : FECSComponent
{
    UPROPERTY()
    FECSEntity PlayerEntity;

    FC_InitAITeammate()
    {
        return;
    }
}

struct FC_AIPlayerTag : FECSComponent
{
    FC_AIPlayerTag()
    {
        return;
    }
}

namespace ECSFunc_FC_InitAITeammate
{
UFUNCTION()
bool HasInitAITeammate(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_InitAITeammate);
}
FC_InitAITeammate& AssignInitAITeammate(const FECSEntity &inout Entity, const FC_InitAITeammate &inout DefaultValue = FC_InitAITeammate())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_InitAITeammate, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignInitAITeammate_BP(const FECSEntity &inout Entity, const FC_InitAITeammate &inout DefaultValue = FC_InitAITeammate())
{
    ECSFunc_FC_InitAITeammate::AssignInitAITeammate(Entity, DefaultValue);
    return;
}
FC_InitAITeammate& ModifyInitAITeammate(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_InitAITeammate));
    return local_12.GetComp();
}
FC_InitAITeammate& ModifyOrAddInitAITeammate(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_InitAITeammate));
    return local_12.GetComp();
}
const FC_InitAITeammate& GetInitAITeammate(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_InitAITeammate));
    return local_12.GetComp();
}
UFUNCTION()
FC_InitAITeammate GetInitAITeammate_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_InitAITeammate __r;
    bValid = false;
    bValid = ECSFunc_FC_InitAITeammate::GetInitAITeammate(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_InitAITeammate GetDefaultedInitAITeammate(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_InitAITeammate __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_InitAITeammate);
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
FC_InitAITeammate GetDefaultedInitAITeammate_BP(const FECSEntity &inout Entity)
{
    FC_InitAITeammate __r;
    return __r;
}
UFUNCTION()
bool RemoveInitAITeammate(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_InitAITeammate);
}
}
FECSMonitorRuntimeView __GetMonitorInitAITeammateOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_InitAITeammate, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorInitAITeammateOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_InitAITeammate, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorInitAITeammateOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_InitAITeammate, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorInitAITeammateOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_InitAITeammate, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorInitAITeammateOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_InitAITeammate, bFixedFrame, bMustHandleAll);
}
void __MonitorInitAITeammateLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_InitAITeammate, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorInitAITeammateActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_InitAITeammate, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorInitAITeammateModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_InitAITeammate, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_AIPlayerTag
{
UFUNCTION()
bool HasAIPlayerTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_AIPlayerTag);
}
FC_AIPlayerTag& AssignAIPlayerTag(const FECSEntity &inout Entity, const FC_AIPlayerTag &inout DefaultValue = FC_AIPlayerTag())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_AIPlayerTag, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignAIPlayerTag_BP(const FECSEntity &inout Entity, const FC_AIPlayerTag &inout DefaultValue = FC_AIPlayerTag())
{
    ECSFunc_FC_AIPlayerTag::AssignAIPlayerTag(Entity, DefaultValue);
    return;
}
FC_AIPlayerTag& ModifyAIPlayerTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_AIPlayerTag));
    return local_12.GetComp();
}
FC_AIPlayerTag& ModifyOrAddAIPlayerTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_AIPlayerTag));
    return local_12.GetComp();
}
const FC_AIPlayerTag& GetAIPlayerTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_AIPlayerTag));
    return local_12.GetComp();
}
UFUNCTION()
FC_AIPlayerTag GetAIPlayerTag_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_AIPlayerTag& local_4 = ECSFunc_FC_AIPlayerTag::GetAIPlayerTag(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_AIPlayerTag();
}
const FC_AIPlayerTag GetDefaultedAIPlayerTag(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_AIPlayerTag __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_AIPlayerTag);
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
FC_AIPlayerTag GetDefaultedAIPlayerTag_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_AIPlayerTag::GetDefaultedAIPlayerTag(Entity);
}
UFUNCTION()
bool RemoveAIPlayerTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_AIPlayerTag);
}
}
FECSMonitorRuntimeView __GetMonitorAIPlayerTagOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_AIPlayerTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAIPlayerTagOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_AIPlayerTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAIPlayerTagOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_AIPlayerTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAIPlayerTagOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_AIPlayerTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAIPlayerTagOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_AIPlayerTag, bFixedFrame, bMustHandleAll);
}
void __MonitorAIPlayerTagLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_AIPlayerTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAIPlayerTagActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_AIPlayerTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAIPlayerTagModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_AIPlayerTag, bFixedFrame, Details);
    return;
}
