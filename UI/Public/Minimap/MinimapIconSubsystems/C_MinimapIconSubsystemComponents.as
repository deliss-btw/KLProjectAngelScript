
namespace __INTENRAL_FC_GuidingPathTargetMinimapIcon_NS
{
    const TECSComponentDerivedPtr<FC_GuidingPathTargetMinimapIcon> DerivedPtr = TECSComponentDerivedPtr<FC_GuidingPathTargetMinimapIcon>();
    const FC_GuidingPathTargetMinimapIcon DefaultValue = FC_GuidingPathTargetMinimapIcon();

}
struct FC_GuidingPathTargetMinimapIcon : FECSComponent
{
    UPROPERTY()
    FMinimapIconHandle IconHandle;
    UPROPERTY()
    FECSEntityId TargetEntityID;

    FC_GuidingPathTargetMinimapIcon()
    {
        return;
    }
}

namespace ECSFunc_FC_GuidingPathTargetMinimapIcon
{
UFUNCTION()
bool HasGuidingPathTargetMinimapIcon(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_GuidingPathTargetMinimapIcon);
}
FC_GuidingPathTargetMinimapIcon& AssignGuidingPathTargetMinimapIcon(const FECSEntity &inout Entity, const FC_GuidingPathTargetMinimapIcon &inout DefaultValue = FC_GuidingPathTargetMinimapIcon())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_GuidingPathTargetMinimapIcon, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignGuidingPathTargetMinimapIcon_BP(const FECSEntity &inout Entity, const FC_GuidingPathTargetMinimapIcon &inout DefaultValue = FC_GuidingPathTargetMinimapIcon())
{
    ECSFunc_FC_GuidingPathTargetMinimapIcon::AssignGuidingPathTargetMinimapIcon(Entity, DefaultValue);
    return;
}
FC_GuidingPathTargetMinimapIcon& ModifyGuidingPathTargetMinimapIcon(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_GuidingPathTargetMinimapIcon));
    return local_12.GetComp();
}
FC_GuidingPathTargetMinimapIcon& ModifyOrAddGuidingPathTargetMinimapIcon(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_GuidingPathTargetMinimapIcon));
    return local_12.GetComp();
}
const FC_GuidingPathTargetMinimapIcon& GetGuidingPathTargetMinimapIcon(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_GuidingPathTargetMinimapIcon));
    return local_12.GetComp();
}
UFUNCTION()
FC_GuidingPathTargetMinimapIcon GetGuidingPathTargetMinimapIcon_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_GuidingPathTargetMinimapIcon __r;
    bValid = false;
    bValid = ECSFunc_FC_GuidingPathTargetMinimapIcon::GetGuidingPathTargetMinimapIcon(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_GuidingPathTargetMinimapIcon GetDefaultedGuidingPathTargetMinimapIcon(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_GuidingPathTargetMinimapIcon __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_GuidingPathTargetMinimapIcon);
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
FC_GuidingPathTargetMinimapIcon GetDefaultedGuidingPathTargetMinimapIcon_BP(const FECSEntity &inout Entity)
{
    FC_GuidingPathTargetMinimapIcon __r;
    return __r;
}
UFUNCTION()
bool RemoveGuidingPathTargetMinimapIcon(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_GuidingPathTargetMinimapIcon);
}
}
FECSMonitorRuntimeView __GetMonitorGuidingPathTargetMinimapIconOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_GuidingPathTargetMinimapIcon, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorGuidingPathTargetMinimapIconOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_GuidingPathTargetMinimapIcon, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorGuidingPathTargetMinimapIconOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_GuidingPathTargetMinimapIcon, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorGuidingPathTargetMinimapIconOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_GuidingPathTargetMinimapIcon, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorGuidingPathTargetMinimapIconOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_GuidingPathTargetMinimapIcon, bFixedFrame, bMustHandleAll);
}
void __MonitorGuidingPathTargetMinimapIconLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_GuidingPathTargetMinimapIcon, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorGuidingPathTargetMinimapIconActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_GuidingPathTargetMinimapIcon, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorGuidingPathTargetMinimapIconModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_GuidingPathTargetMinimapIcon, bFixedFrame, Details);
    return;
}
