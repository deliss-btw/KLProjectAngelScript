
namespace __INTENRAL_FC_SFXStatePresentation_NS
{
    const TECSComponentDerivedPtr<FC_SFXStatePresentation> DerivedPtr = TECSComponentDerivedPtr<FC_SFXStatePresentation>();
    const FC_SFXStatePresentation DefaultValue = FC_SFXStatePresentation();

}
struct FC_SFXStatePresentation : FECSComponent
{
    UPROPERTY()
    uint64 LastEnableBitFlags = 0;


}

namespace ECSFunc_FC_SFXStatePresentation
{
UFUNCTION()
bool HasSFXStatePresentation(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_SFXStatePresentation);
}
FC_SFXStatePresentation& AssignSFXStatePresentation(const FECSEntity &inout Entity, const FC_SFXStatePresentation &inout DefaultValue = FC_SFXStatePresentation())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_SFXStatePresentation, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignSFXStatePresentation_BP(const FECSEntity &inout Entity, const FC_SFXStatePresentation &inout DefaultValue = FC_SFXStatePresentation())
{
    ECSFunc_FC_SFXStatePresentation::AssignSFXStatePresentation(Entity, DefaultValue);
    return;
}
FC_SFXStatePresentation& ModifySFXStatePresentation(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_SFXStatePresentation));
    return local_12.GetComp();
}
FC_SFXStatePresentation& ModifyOrAddSFXStatePresentation(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_SFXStatePresentation));
    return local_12.GetComp();
}
const FC_SFXStatePresentation& GetSFXStatePresentation(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_SFXStatePresentation));
    return local_12.GetComp();
}
UFUNCTION()
FC_SFXStatePresentation GetSFXStatePresentation_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_SFXStatePresentation& local_4 = ECSFunc_FC_SFXStatePresentation::GetSFXStatePresentation(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_SFXStatePresentation();
}
const FC_SFXStatePresentation GetDefaultedSFXStatePresentation(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_SFXStatePresentation __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_SFXStatePresentation);
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
FC_SFXStatePresentation GetDefaultedSFXStatePresentation_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_SFXStatePresentation::GetDefaultedSFXStatePresentation(Entity);
}
UFUNCTION()
bool RemoveSFXStatePresentation(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_SFXStatePresentation);
}
}
FECSMonitorRuntimeView __GetMonitorSFXStatePresentationOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_SFXStatePresentation, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSFXStatePresentationOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_SFXStatePresentation, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSFXStatePresentationOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_SFXStatePresentation, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSFXStatePresentationOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_SFXStatePresentation, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSFXStatePresentationOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_SFXStatePresentation, bFixedFrame, bMustHandleAll);
}
void __MonitorSFXStatePresentationLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_SFXStatePresentation, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorSFXStatePresentationActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_SFXStatePresentation, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorSFXStatePresentationModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_SFXStatePresentation, bFixedFrame, Details);
    return;
}
