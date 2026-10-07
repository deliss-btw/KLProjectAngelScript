
namespace __INTENRAL_FC_GuidingMinimapPath_NS
{
    const TECSComponentDerivedPtr<FC_GuidingMinimapPath> DerivedPtr = TECSComponentDerivedPtr<FC_GuidingMinimapPath>();
    const FC_GuidingMinimapPath DefaultValue = FC_GuidingMinimapPath();
}
namespace __INTENRAL_FCE_NotityUI_GuidingPathPointsChanged_NS
{
    const TECSEventDerivedPtr<FCE_NotityUI_GuidingPathPointsChanged> DerivedPtr = TECSEventDerivedPtr<FCE_NotityUI_GuidingPathPointsChanged>();

}
struct FCE_NotityUI_GuidingPathPointsChanged : FECSEvent
{
    FECSEvent _base_FECSEvent;

    FCE_NotityUI_GuidingPathPointsChanged()
    {
        return;
    }
}

struct FC_GuidingMinimapPath : FECSComponent
{
    UPROPERTY()
    FMinimapPath Path;

    FC_GuidingMinimapPath()
    {
        return;
    }
}

namespace ECSFunc_FC_GuidingMinimapPath
{
UFUNCTION()
bool HasGuidingMinimapPath(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_GuidingMinimapPath);
}
FC_GuidingMinimapPath& AssignGuidingMinimapPath(const FECSEntity &inout Entity, const FC_GuidingMinimapPath &inout DefaultValue = FC_GuidingMinimapPath())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_GuidingMinimapPath, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignGuidingMinimapPath_BP(const FECSEntity &inout Entity, const FC_GuidingMinimapPath &inout DefaultValue = FC_GuidingMinimapPath())
{
    ECSFunc_FC_GuidingMinimapPath::AssignGuidingMinimapPath(Entity, DefaultValue);
    return;
}
FC_GuidingMinimapPath& ModifyGuidingMinimapPath(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_GuidingMinimapPath));
    return local_12.GetComp();
}
FC_GuidingMinimapPath& ModifyOrAddGuidingMinimapPath(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_GuidingMinimapPath));
    return local_12.GetComp();
}
const FC_GuidingMinimapPath& GetGuidingMinimapPath(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_GuidingMinimapPath));
    return local_12.GetComp();
}
UFUNCTION()
FC_GuidingMinimapPath GetGuidingMinimapPath_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_GuidingMinimapPath __r;
    bValid = false;
    bValid = ECSFunc_FC_GuidingMinimapPath::GetGuidingMinimapPath(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_GuidingMinimapPath GetDefaultedGuidingMinimapPath(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_GuidingMinimapPath __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_GuidingMinimapPath);
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
FC_GuidingMinimapPath GetDefaultedGuidingMinimapPath_BP(const FECSEntity &inout Entity)
{
    FC_GuidingMinimapPath __r;
    return __r;
}
UFUNCTION()
bool RemoveGuidingMinimapPath(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_GuidingMinimapPath);
}
}
FECSMonitorRuntimeView __GetMonitorGuidingMinimapPathOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_GuidingMinimapPath, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorGuidingMinimapPathOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_GuidingMinimapPath, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorGuidingMinimapPathOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_GuidingMinimapPath, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorGuidingMinimapPathOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_GuidingMinimapPath, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorGuidingMinimapPathOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_GuidingMinimapPath, bFixedFrame, bMustHandleAll);
}
void __MonitorGuidingMinimapPathLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_GuidingMinimapPath, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorGuidingMinimapPathActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_GuidingMinimapPath, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorGuidingMinimapPathModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_GuidingMinimapPath, bFixedFrame, Details);
    return;
}
