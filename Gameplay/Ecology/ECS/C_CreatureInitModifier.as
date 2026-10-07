
namespace __INTENRAL_FC_CreatureInitModifier_NS
{
    const TECSComponentDerivedPtr<FC_CreatureInitModifier> DerivedPtr = TECSComponentDerivedPtr<FC_CreatureInitModifier>();
    const FC_CreatureInitModifier DefaultValue = FC_CreatureInitModifier();

}
struct FC_CreatureInitModifier : FECSComponent
{
    UPROPERTY()
    bool bDisableAI = false;


    void ApplyModifier(const FECSEntity &inout Entity) const
    {
        if (this.bDisableAI)
        {
            ::FASCommonUtils::SetEntityBehaviorTreeRunState(Entity, false);
            ::FHTNUtils::StopHTN(Entity);
        }
        return;
    }
}

namespace ECSFunc_FC_CreatureInitModifier
{
UFUNCTION()
bool HasCreatureInitModifier(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_CreatureInitModifier);
}
FC_CreatureInitModifier& AssignCreatureInitModifier(const FECSEntity &inout Entity, const FC_CreatureInitModifier &inout DefaultValue = FC_CreatureInitModifier())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_CreatureInitModifier, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignCreatureInitModifier_BP(const FECSEntity &inout Entity, const FC_CreatureInitModifier &inout DefaultValue = FC_CreatureInitModifier())
{
    ECSFunc_FC_CreatureInitModifier::AssignCreatureInitModifier(Entity, DefaultValue);
    return;
}
FC_CreatureInitModifier& ModifyCreatureInitModifier(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_CreatureInitModifier));
    return local_12.GetComp();
}
FC_CreatureInitModifier& ModifyOrAddCreatureInitModifier(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_CreatureInitModifier));
    return local_12.GetComp();
}
const FC_CreatureInitModifier& GetCreatureInitModifier(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_CreatureInitModifier));
    return local_12.GetComp();
}
UFUNCTION()
FC_CreatureInitModifier GetCreatureInitModifier_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_CreatureInitModifier& local_4 = ECSFunc_FC_CreatureInitModifier::GetCreatureInitModifier(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_CreatureInitModifier();
}
const FC_CreatureInitModifier GetDefaultedCreatureInitModifier(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_CreatureInitModifier __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_CreatureInitModifier);
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
FC_CreatureInitModifier GetDefaultedCreatureInitModifier_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_CreatureInitModifier::GetDefaultedCreatureInitModifier(Entity);
}
UFUNCTION()
bool RemoveCreatureInitModifier(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_CreatureInitModifier);
}
}
FECSMonitorRuntimeView __GetMonitorCreatureInitModifierOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_CreatureInitModifier, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCreatureInitModifierOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_CreatureInitModifier, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCreatureInitModifierOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_CreatureInitModifier, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCreatureInitModifierOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_CreatureInitModifier, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCreatureInitModifierOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_CreatureInitModifier, bFixedFrame, bMustHandleAll);
}
void __MonitorCreatureInitModifierLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_CreatureInitModifier, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCreatureInitModifierActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_CreatureInitModifier, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCreatureInitModifierModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_CreatureInitModifier, bFixedFrame, Details);
    return;
}
