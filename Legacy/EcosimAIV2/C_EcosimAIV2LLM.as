
namespace __INTENRAL_FC_EcosimAIV2LLMSpeakMemory_NS
{
    const TECSComponentDerivedPtr<FC_EcosimAIV2LLMSpeakMemory> DerivedPtr = TECSComponentDerivedPtr<FC_EcosimAIV2LLMSpeakMemory>();
    const FC_EcosimAIV2LLMSpeakMemory DefaultValue = FC_EcosimAIV2LLMSpeakMemory();
}
namespace __INTENRAL_FC_EcosimAIV2LLMCallBack_NS
{
    const TECSComponentDerivedPtr<FC_EcosimAIV2LLMCallBack> DerivedPtr = TECSComponentDerivedPtr<FC_EcosimAIV2LLMCallBack>();
    const FC_EcosimAIV2LLMCallBack DefaultValue = FC_EcosimAIV2LLMCallBack();

}
struct FC_EcosimAIV2LLMSpeakMemory : FECSComponent
{
    UPROPERTY()
    TArray<FString> SpeakMemoryContentList;

    FC_EcosimAIV2LLMSpeakMemory()
    {
        return;
    }
}

struct FC_EcosimAIV2LLMCallBack : FECSComponent
{
    UPROPERTY()
    TArray<FString> ContentList;

    FC_EcosimAIV2LLMCallBack()
    {
        return;
    }
}

namespace ECSFunc_FC_EcosimAIV2LLMSpeakMemory
{
UFUNCTION()
bool HasEcosimAIV2LLMSpeakMemory(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2LLMSpeakMemory);
}
FC_EcosimAIV2LLMSpeakMemory& AssignEcosimAIV2LLMSpeakMemory(const FECSEntity &inout Entity, const FC_EcosimAIV2LLMSpeakMemory &inout DefaultValue = FC_EcosimAIV2LLMSpeakMemory())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2LLMSpeakMemory, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignEcosimAIV2LLMSpeakMemory_BP(const FECSEntity &inout Entity, const FC_EcosimAIV2LLMSpeakMemory &inout DefaultValue = FC_EcosimAIV2LLMSpeakMemory())
{
    ECSFunc_FC_EcosimAIV2LLMSpeakMemory::AssignEcosimAIV2LLMSpeakMemory(Entity, DefaultValue);
    return;
}
FC_EcosimAIV2LLMSpeakMemory& ModifyEcosimAIV2LLMSpeakMemory(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2LLMSpeakMemory));
    return local_12.GetComp();
}
FC_EcosimAIV2LLMSpeakMemory& ModifyOrAddEcosimAIV2LLMSpeakMemory(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2LLMSpeakMemory));
    return local_12.GetComp();
}
const FC_EcosimAIV2LLMSpeakMemory& GetEcosimAIV2LLMSpeakMemory(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2LLMSpeakMemory));
    return local_12.GetComp();
}
UFUNCTION()
FC_EcosimAIV2LLMSpeakMemory GetEcosimAIV2LLMSpeakMemory_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_EcosimAIV2LLMSpeakMemory __r;
    bValid = false;
    bValid = ECSFunc_FC_EcosimAIV2LLMSpeakMemory::GetEcosimAIV2LLMSpeakMemory(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_EcosimAIV2LLMSpeakMemory GetDefaultedEcosimAIV2LLMSpeakMemory(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_EcosimAIV2LLMSpeakMemory __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2LLMSpeakMemory);
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
FC_EcosimAIV2LLMSpeakMemory GetDefaultedEcosimAIV2LLMSpeakMemory_BP(const FECSEntity &inout Entity)
{
    FC_EcosimAIV2LLMSpeakMemory __r;
    return __r;
}
UFUNCTION()
bool RemoveEcosimAIV2LLMSpeakMemory(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2LLMSpeakMemory);
}
}
FECSMonitorRuntimeView __GetMonitorEcosimAIV2LLMSpeakMemoryOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_EcosimAIV2LLMSpeakMemory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcosimAIV2LLMSpeakMemoryOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_EcosimAIV2LLMSpeakMemory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcosimAIV2LLMSpeakMemoryOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_EcosimAIV2LLMSpeakMemory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcosimAIV2LLMSpeakMemoryOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_EcosimAIV2LLMSpeakMemory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcosimAIV2LLMSpeakMemoryOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_EcosimAIV2LLMSpeakMemory, bFixedFrame, bMustHandleAll);
}
void __MonitorEcosimAIV2LLMSpeakMemoryLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_EcosimAIV2LLMSpeakMemory, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcosimAIV2LLMSpeakMemoryActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_EcosimAIV2LLMSpeakMemory, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcosimAIV2LLMSpeakMemoryModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_EcosimAIV2LLMSpeakMemory, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_EcosimAIV2LLMCallBack
{
UFUNCTION()
bool HasEcosimAIV2LLMCallBack(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2LLMCallBack);
}
FC_EcosimAIV2LLMCallBack& AssignEcosimAIV2LLMCallBack(const FECSEntity &inout Entity, const FC_EcosimAIV2LLMCallBack &inout DefaultValue = FC_EcosimAIV2LLMCallBack())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2LLMCallBack, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignEcosimAIV2LLMCallBack_BP(const FECSEntity &inout Entity, const FC_EcosimAIV2LLMCallBack &inout DefaultValue = FC_EcosimAIV2LLMCallBack())
{
    ECSFunc_FC_EcosimAIV2LLMCallBack::AssignEcosimAIV2LLMCallBack(Entity, DefaultValue);
    return;
}
FC_EcosimAIV2LLMCallBack& ModifyEcosimAIV2LLMCallBack(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2LLMCallBack));
    return local_12.GetComp();
}
FC_EcosimAIV2LLMCallBack& ModifyOrAddEcosimAIV2LLMCallBack(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2LLMCallBack));
    return local_12.GetComp();
}
const FC_EcosimAIV2LLMCallBack& GetEcosimAIV2LLMCallBack(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2LLMCallBack));
    return local_12.GetComp();
}
UFUNCTION()
FC_EcosimAIV2LLMCallBack GetEcosimAIV2LLMCallBack_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_EcosimAIV2LLMCallBack __r;
    bValid = false;
    bValid = ECSFunc_FC_EcosimAIV2LLMCallBack::GetEcosimAIV2LLMCallBack(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_EcosimAIV2LLMCallBack GetDefaultedEcosimAIV2LLMCallBack(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_EcosimAIV2LLMCallBack __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2LLMCallBack);
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
FC_EcosimAIV2LLMCallBack GetDefaultedEcosimAIV2LLMCallBack_BP(const FECSEntity &inout Entity)
{
    FC_EcosimAIV2LLMCallBack __r;
    return __r;
}
UFUNCTION()
bool RemoveEcosimAIV2LLMCallBack(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2LLMCallBack);
}
}
FECSMonitorRuntimeView __GetMonitorEcosimAIV2LLMCallBackOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_EcosimAIV2LLMCallBack, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcosimAIV2LLMCallBackOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_EcosimAIV2LLMCallBack, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcosimAIV2LLMCallBackOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_EcosimAIV2LLMCallBack, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcosimAIV2LLMCallBackOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_EcosimAIV2LLMCallBack, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcosimAIV2LLMCallBackOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_EcosimAIV2LLMCallBack, bFixedFrame, bMustHandleAll);
}
void __MonitorEcosimAIV2LLMCallBackLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_EcosimAIV2LLMCallBack, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcosimAIV2LLMCallBackActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_EcosimAIV2LLMCallBack, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcosimAIV2LLMCallBackModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_EcosimAIV2LLMCallBack, bFixedFrame, Details);
    return;
}
