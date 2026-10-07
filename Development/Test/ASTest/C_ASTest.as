
namespace __INTENRAL_FC_TestDestruct_NS
{
    const TECSComponentDerivedPtr<FC_TestDestruct> DerivedPtr = TECSComponentDerivedPtr<FC_TestDestruct>();
    const FC_TestDestruct DefaultValue = FC_TestDestruct();
}
namespace __INTENRAL_FC_TestTemplateMethod_NS
{
    const TECSComponentDerivedPtr<FC_TestTemplateMethod> DerivedPtr = TECSComponentDerivedPtr<FC_TestTemplateMethod>();
    const FC_TestTemplateMethod DefaultValue = FC_TestTemplateMethod();
}
namespace __INTENRAL_FC_TestTemplateMethodTag_NS
{
    const TECSComponentDerivedPtr<FC_TestTemplateMethodTag> DerivedPtr = TECSComponentDerivedPtr<FC_TestTemplateMethodTag>();
    const FC_TestTemplateMethodTag DefaultValue = FC_TestTemplateMethodTag();
}
namespace __INTENRAL_FCE_TestTemplateMethodEvent_NS
{
    const TECSEventDerivedPtr<FCE_TestTemplateMethodEvent> DerivedPtr = TECSEventDerivedPtr<FCE_TestTemplateMethodEvent>();

}
struct FC_TestDestruct : FECSComponent
{
    UPROPERTY()
    UECSTestCounter Counter;

    FC_TestDestruct()
    {
        return;
    }
}

struct FC_TestTemplateMethod : FECSComponent
{
    UPROPERTY()
    int A = 0;
    UPROPERTY()
    FString B;


}

struct FC_TestTemplateMethodTag : FECSComponent
{
    FC_TestTemplateMethodTag()
    {
        return;
    }
}

struct FCE_TestTemplateMethodEvent : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    int A = 0;
    UPROPERTY()
    FString B;


}

namespace ECSFunc_FC_TestDestruct
{
UFUNCTION()
bool HasTestDestruct(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_TestDestruct);
}
FC_TestDestruct& AssignTestDestruct(const FECSEntity &inout Entity, const FC_TestDestruct &inout DefaultValue = FC_TestDestruct())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_TestDestruct, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignTestDestruct_BP(const FECSEntity &inout Entity, const FC_TestDestruct &inout DefaultValue = FC_TestDestruct())
{
    ECSFunc_FC_TestDestruct::AssignTestDestruct(Entity, DefaultValue);
    return;
}
FC_TestDestruct& ModifyTestDestruct(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_TestDestruct));
    return local_12.GetComp();
}
FC_TestDestruct& ModifyOrAddTestDestruct(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_TestDestruct));
    return local_12.GetComp();
}
const FC_TestDestruct& GetTestDestruct(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_TestDestruct));
    return local_12.GetComp();
}
UFUNCTION()
FC_TestDestruct GetTestDestruct_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_TestDestruct& local_4 = ECSFunc_FC_TestDestruct::GetTestDestruct(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_TestDestruct();
}
const FC_TestDestruct GetDefaultedTestDestruct(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_TestDestruct __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_TestDestruct);
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
FC_TestDestruct GetDefaultedTestDestruct_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_TestDestruct::GetDefaultedTestDestruct(Entity);
}
UFUNCTION()
bool RemoveTestDestruct(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_TestDestruct);
}
}
FECSMonitorRuntimeView __GetMonitorTestDestructOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_TestDestruct, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorTestDestructOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_TestDestruct, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorTestDestructOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_TestDestruct, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorTestDestructOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_TestDestruct, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorTestDestructOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_TestDestruct, bFixedFrame, bMustHandleAll);
}
void __MonitorTestDestructLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_TestDestruct, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorTestDestructActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_TestDestruct, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorTestDestructModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_TestDestruct, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_TestTemplateMethod
{
UFUNCTION()
bool HasTestTemplateMethod(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_TestTemplateMethod);
}
FC_TestTemplateMethod& AssignTestTemplateMethod(const FECSEntity &inout Entity, const FC_TestTemplateMethod &inout DefaultValue = FC_TestTemplateMethod())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_TestTemplateMethod, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignTestTemplateMethod_BP(const FECSEntity &inout Entity, const FC_TestTemplateMethod &inout DefaultValue = FC_TestTemplateMethod())
{
    ECSFunc_FC_TestTemplateMethod::AssignTestTemplateMethod(Entity, DefaultValue);
    return;
}
FC_TestTemplateMethod& ModifyTestTemplateMethod(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_TestTemplateMethod));
    return local_12.GetComp();
}
FC_TestTemplateMethod& ModifyOrAddTestTemplateMethod(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_TestTemplateMethod));
    return local_12.GetComp();
}
const FC_TestTemplateMethod& GetTestTemplateMethod(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_TestTemplateMethod));
    return local_12.GetComp();
}
UFUNCTION()
FC_TestTemplateMethod GetTestTemplateMethod_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_TestTemplateMethod __r;
    bValid = false;
    bValid = ECSFunc_FC_TestTemplateMethod::GetTestTemplateMethod(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_TestTemplateMethod GetDefaultedTestTemplateMethod(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_TestTemplateMethod __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_TestTemplateMethod);
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
FC_TestTemplateMethod GetDefaultedTestTemplateMethod_BP(const FECSEntity &inout Entity)
{
    FC_TestTemplateMethod __r;
    return __r;
}
UFUNCTION()
bool RemoveTestTemplateMethod(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_TestTemplateMethod);
}
}
FECSMonitorRuntimeView __GetMonitorTestTemplateMethodOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_TestTemplateMethod, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorTestTemplateMethodOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_TestTemplateMethod, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorTestTemplateMethodOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_TestTemplateMethod, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorTestTemplateMethodOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_TestTemplateMethod, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorTestTemplateMethodOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_TestTemplateMethod, bFixedFrame, bMustHandleAll);
}
void __MonitorTestTemplateMethodLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_TestTemplateMethod, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorTestTemplateMethodActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_TestTemplateMethod, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorTestTemplateMethodModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_TestTemplateMethod, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_TestTemplateMethodTag
{
UFUNCTION()
bool HasTestTemplateMethodTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_TestTemplateMethodTag);
}
FC_TestTemplateMethodTag& AssignTestTemplateMethodTag(const FECSEntity &inout Entity, const FC_TestTemplateMethodTag &inout DefaultValue = FC_TestTemplateMethodTag())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_TestTemplateMethodTag, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignTestTemplateMethodTag_BP(const FECSEntity &inout Entity, const FC_TestTemplateMethodTag &inout DefaultValue = FC_TestTemplateMethodTag())
{
    ECSFunc_FC_TestTemplateMethodTag::AssignTestTemplateMethodTag(Entity, DefaultValue);
    return;
}
FC_TestTemplateMethodTag& ModifyTestTemplateMethodTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_TestTemplateMethodTag));
    return local_12.GetComp();
}
FC_TestTemplateMethodTag& ModifyOrAddTestTemplateMethodTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_TestTemplateMethodTag));
    return local_12.GetComp();
}
const FC_TestTemplateMethodTag& GetTestTemplateMethodTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_TestTemplateMethodTag));
    return local_12.GetComp();
}
UFUNCTION()
FC_TestTemplateMethodTag GetTestTemplateMethodTag_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_TestTemplateMethodTag& local_4 = ECSFunc_FC_TestTemplateMethodTag::GetTestTemplateMethodTag(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_TestTemplateMethodTag();
}
const FC_TestTemplateMethodTag GetDefaultedTestTemplateMethodTag(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_TestTemplateMethodTag __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_TestTemplateMethodTag);
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
FC_TestTemplateMethodTag GetDefaultedTestTemplateMethodTag_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_TestTemplateMethodTag::GetDefaultedTestTemplateMethodTag(Entity);
}
UFUNCTION()
bool RemoveTestTemplateMethodTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_TestTemplateMethodTag);
}
}
FECSMonitorRuntimeView __GetMonitorTestTemplateMethodTagOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_TestTemplateMethodTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorTestTemplateMethodTagOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_TestTemplateMethodTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorTestTemplateMethodTagOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_TestTemplateMethodTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorTestTemplateMethodTagOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_TestTemplateMethodTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorTestTemplateMethodTagOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_TestTemplateMethodTag, bFixedFrame, bMustHandleAll);
}
void __MonitorTestTemplateMethodTagLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_TestTemplateMethodTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorTestTemplateMethodTagActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_TestTemplateMethodTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorTestTemplateMethodTagModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_TestTemplateMethodTag, bFixedFrame, Details);
    return;
}
