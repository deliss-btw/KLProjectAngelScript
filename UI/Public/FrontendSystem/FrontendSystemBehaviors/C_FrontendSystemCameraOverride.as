
namespace __INTENRAL_FC_FrontendSystemCameraOverride_NS
{
    const TECSComponentDerivedPtr<FC_FrontendSystemCameraOverride> DerivedPtr = TECSComponentDerivedPtr<FC_FrontendSystemCameraOverride>();
    const FC_FrontendSystemCameraOverride DefaultValue = FC_FrontendSystemCameraOverride();
}
namespace __INTENRAL_FC_FrontendSystemCameraOverrideNeedUpdateTag_NS
{
    const TECSComponentDerivedPtr<FC_FrontendSystemCameraOverrideNeedUpdateTag> DerivedPtr = TECSComponentDerivedPtr<FC_FrontendSystemCameraOverrideNeedUpdateTag>();
    const FC_FrontendSystemCameraOverrideNeedUpdateTag DefaultValue = FC_FrontendSystemCameraOverrideNeedUpdateTag();
}
namespace __INTENRAL_FCE_FrontendSystemCameraOverrideUpdated_NS
{
    const TECSEventDerivedPtr<FCE_FrontendSystemCameraOverrideUpdated> DerivedPtr = TECSEventDerivedPtr<FCE_FrontendSystemCameraOverrideUpdated>();

}
struct FFrontendSystemCameraOverride
{
    UPROPERTY()
    TWeakObjectPtr<UObject> SourceBehavior;
    UPROPERTY()
    FCameraOverrideParam OverrideParam;

    FFrontendSystemCameraOverride()
    {
        return;
    }
}

struct FC_FrontendSystemCameraOverride : FECSComponent
{
    UPROPERTY()
    TArray<FFrontendSystemCameraOverride> OverrideParams;

    FC_FrontendSystemCameraOverride()
    {
        return;
    }
}

struct FC_FrontendSystemCameraOverrideNeedUpdateTag : FECSComponent
{
    FC_FrontendSystemCameraOverrideNeedUpdateTag()
    {
        return;
    }
}

struct FCE_FrontendSystemCameraOverrideUpdated : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    bool bOverride;
    UPROPERTY()
    FCameraOverrideParam OverrideParam;


}

namespace ECSFunc_FC_FrontendSystemCameraOverride
{
UFUNCTION()
bool HasFrontendSystemCameraOverride(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_FrontendSystemCameraOverride);
}
FC_FrontendSystemCameraOverride& AssignFrontendSystemCameraOverride(const FECSEntity &inout Entity, const FC_FrontendSystemCameraOverride &inout DefaultValue = FC_FrontendSystemCameraOverride())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_FrontendSystemCameraOverride, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignFrontendSystemCameraOverride_BP(const FECSEntity &inout Entity, const FC_FrontendSystemCameraOverride &inout DefaultValue = FC_FrontendSystemCameraOverride())
{
    ECSFunc_FC_FrontendSystemCameraOverride::AssignFrontendSystemCameraOverride(Entity, DefaultValue);
    return;
}
FC_FrontendSystemCameraOverride& ModifyFrontendSystemCameraOverride(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_FrontendSystemCameraOverride));
    return local_12.GetComp();
}
FC_FrontendSystemCameraOverride& ModifyOrAddFrontendSystemCameraOverride(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_FrontendSystemCameraOverride));
    return local_12.GetComp();
}
const FC_FrontendSystemCameraOverride& GetFrontendSystemCameraOverride(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_FrontendSystemCameraOverride));
    return local_12.GetComp();
}
UFUNCTION()
FC_FrontendSystemCameraOverride GetFrontendSystemCameraOverride_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_FrontendSystemCameraOverride __r;
    bValid = false;
    bValid = ECSFunc_FC_FrontendSystemCameraOverride::GetFrontendSystemCameraOverride(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_FrontendSystemCameraOverride GetDefaultedFrontendSystemCameraOverride(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_FrontendSystemCameraOverride __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_FrontendSystemCameraOverride);
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
FC_FrontendSystemCameraOverride GetDefaultedFrontendSystemCameraOverride_BP(const FECSEntity &inout Entity)
{
    FC_FrontendSystemCameraOverride __r;
    return __r;
}
UFUNCTION()
bool RemoveFrontendSystemCameraOverride(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_FrontendSystemCameraOverride);
}
}
FECSMonitorRuntimeView __GetMonitorFrontendSystemCameraOverrideOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_FrontendSystemCameraOverride, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorFrontendSystemCameraOverrideOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_FrontendSystemCameraOverride, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorFrontendSystemCameraOverrideOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_FrontendSystemCameraOverride, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorFrontendSystemCameraOverrideOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_FrontendSystemCameraOverride, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorFrontendSystemCameraOverrideOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_FrontendSystemCameraOverride, bFixedFrame, bMustHandleAll);
}
void __MonitorFrontendSystemCameraOverrideLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_FrontendSystemCameraOverride, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorFrontendSystemCameraOverrideActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_FrontendSystemCameraOverride, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorFrontendSystemCameraOverrideModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_FrontendSystemCameraOverride, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_FrontendSystemCameraOverrideNeedUpdateTag
{
UFUNCTION()
bool HasFrontendSystemCameraOverrideNeedUpdateTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_FrontendSystemCameraOverrideNeedUpdateTag);
}
FC_FrontendSystemCameraOverrideNeedUpdateTag& AssignFrontendSystemCameraOverrideNeedUpdateTag(const FECSEntity &inout Entity, const FC_FrontendSystemCameraOverrideNeedUpdateTag &inout DefaultValue = FC_FrontendSystemCameraOverrideNeedUpdateTag())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_FrontendSystemCameraOverrideNeedUpdateTag, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignFrontendSystemCameraOverrideNeedUpdateTag_BP(const FECSEntity &inout Entity, const FC_FrontendSystemCameraOverrideNeedUpdateTag &inout DefaultValue = FC_FrontendSystemCameraOverrideNeedUpdateTag())
{
    ECSFunc_FC_FrontendSystemCameraOverrideNeedUpdateTag::AssignFrontendSystemCameraOverrideNeedUpdateTag(Entity, DefaultValue);
    return;
}
FC_FrontendSystemCameraOverrideNeedUpdateTag& ModifyFrontendSystemCameraOverrideNeedUpdateTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_FrontendSystemCameraOverrideNeedUpdateTag));
    return local_12.GetComp();
}
FC_FrontendSystemCameraOverrideNeedUpdateTag& ModifyOrAddFrontendSystemCameraOverrideNeedUpdateTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_FrontendSystemCameraOverrideNeedUpdateTag));
    return local_12.GetComp();
}
const FC_FrontendSystemCameraOverrideNeedUpdateTag& GetFrontendSystemCameraOverrideNeedUpdateTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_FrontendSystemCameraOverrideNeedUpdateTag));
    return local_12.GetComp();
}
UFUNCTION()
FC_FrontendSystemCameraOverrideNeedUpdateTag GetFrontendSystemCameraOverrideNeedUpdateTag_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_FrontendSystemCameraOverrideNeedUpdateTag& local_4 = ECSFunc_FC_FrontendSystemCameraOverrideNeedUpdateTag::GetFrontendSystemCameraOverrideNeedUpdateTag(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_FrontendSystemCameraOverrideNeedUpdateTag();
}
const FC_FrontendSystemCameraOverrideNeedUpdateTag GetDefaultedFrontendSystemCameraOverrideNeedUpdateTag(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_FrontendSystemCameraOverrideNeedUpdateTag __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_FrontendSystemCameraOverrideNeedUpdateTag);
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
FC_FrontendSystemCameraOverrideNeedUpdateTag GetDefaultedFrontendSystemCameraOverrideNeedUpdateTag_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_FrontendSystemCameraOverrideNeedUpdateTag::GetDefaultedFrontendSystemCameraOverrideNeedUpdateTag(Entity);
}
UFUNCTION()
bool RemoveFrontendSystemCameraOverrideNeedUpdateTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_FrontendSystemCameraOverrideNeedUpdateTag);
}
}
FECSMonitorRuntimeView __GetMonitorFrontendSystemCameraOverrideNeedUpdateTagOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_FrontendSystemCameraOverrideNeedUpdateTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorFrontendSystemCameraOverrideNeedUpdateTagOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_FrontendSystemCameraOverrideNeedUpdateTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorFrontendSystemCameraOverrideNeedUpdateTagOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_FrontendSystemCameraOverrideNeedUpdateTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorFrontendSystemCameraOverrideNeedUpdateTagOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_FrontendSystemCameraOverrideNeedUpdateTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorFrontendSystemCameraOverrideNeedUpdateTagOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_FrontendSystemCameraOverrideNeedUpdateTag, bFixedFrame, bMustHandleAll);
}
void __MonitorFrontendSystemCameraOverrideNeedUpdateTagLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_FrontendSystemCameraOverrideNeedUpdateTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorFrontendSystemCameraOverrideNeedUpdateTagActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_FrontendSystemCameraOverrideNeedUpdateTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorFrontendSystemCameraOverrideNeedUpdateTagModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_FrontendSystemCameraOverrideNeedUpdateTag, bFixedFrame, Details);
    return;
}
