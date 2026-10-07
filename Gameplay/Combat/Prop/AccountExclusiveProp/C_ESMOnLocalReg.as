
namespace __INTENRAL_FC_ActivateESMTriggerOnLocalReg_NS
{
    const TECSComponentDerivedPtr<FC_ActivateESMTriggerOnLocalReg> DerivedPtr = TECSComponentDerivedPtr<FC_ActivateESMTriggerOnLocalReg>();
    const FC_ActivateESMTriggerOnLocalReg DefaultValue = FC_ActivateESMTriggerOnLocalReg();
}
namespace __INTENRAL_FC_ESMExternalTransitOnLocalReg_NS
{
    const TECSComponentDerivedPtr<FC_ESMExternalTransitOnLocalReg> DerivedPtr = TECSComponentDerivedPtr<FC_ESMExternalTransitOnLocalReg>();
    const FC_ESMExternalTransitOnLocalReg DefaultValue = FC_ESMExternalTransitOnLocalReg();

}
struct FActivateESMTriggerOnLocalRegData
{
    UPROPERTY()
    FNameHandle_ESMBBTrigger TriggerName;
    UPROPERTY()
    float32 ValidTime;


}

struct FC_ActivateESMTriggerOnLocalReg : FECSComponent
{
    UPROPERTY()
    TArray<FActivateESMTriggerOnLocalRegData> TriggerDatas;

    FC_ActivateESMTriggerOnLocalReg()
    {
        return;
    }
}

struct FC_ESMExternalTransitOnLocalReg : FECSComponent
{
    UPROPERTY()
    FName SMName;
    UPROPERTY()
    FName StateName;

    FC_ESMExternalTransitOnLocalReg()
    {
        return;
    }
}

namespace ECSFunc_FC_ActivateESMTriggerOnLocalReg
{
UFUNCTION()
bool HasActivateESMTriggerOnLocalReg(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_ActivateESMTriggerOnLocalReg);
}
FC_ActivateESMTriggerOnLocalReg& AssignActivateESMTriggerOnLocalReg(const FECSEntity &inout Entity, const FC_ActivateESMTriggerOnLocalReg &inout DefaultValue = FC_ActivateESMTriggerOnLocalReg())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_ActivateESMTriggerOnLocalReg, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignActivateESMTriggerOnLocalReg_BP(const FECSEntity &inout Entity, const FC_ActivateESMTriggerOnLocalReg &inout DefaultValue = FC_ActivateESMTriggerOnLocalReg())
{
    ECSFunc_FC_ActivateESMTriggerOnLocalReg::AssignActivateESMTriggerOnLocalReg(Entity, DefaultValue);
    return;
}
FC_ActivateESMTriggerOnLocalReg& ModifyActivateESMTriggerOnLocalReg(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_ActivateESMTriggerOnLocalReg));
    return local_12.GetComp();
}
FC_ActivateESMTriggerOnLocalReg& ModifyOrAddActivateESMTriggerOnLocalReg(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_ActivateESMTriggerOnLocalReg));
    return local_12.GetComp();
}
const FC_ActivateESMTriggerOnLocalReg& GetActivateESMTriggerOnLocalReg(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_ActivateESMTriggerOnLocalReg));
    return local_12.GetComp();
}
UFUNCTION()
FC_ActivateESMTriggerOnLocalReg GetActivateESMTriggerOnLocalReg_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_ActivateESMTriggerOnLocalReg __r;
    bValid = false;
    bValid = ECSFunc_FC_ActivateESMTriggerOnLocalReg::GetActivateESMTriggerOnLocalReg(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_ActivateESMTriggerOnLocalReg GetDefaultedActivateESMTriggerOnLocalReg(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_ActivateESMTriggerOnLocalReg __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_ActivateESMTriggerOnLocalReg);
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
FC_ActivateESMTriggerOnLocalReg GetDefaultedActivateESMTriggerOnLocalReg_BP(const FECSEntity &inout Entity)
{
    FC_ActivateESMTriggerOnLocalReg __r;
    return __r;
}
UFUNCTION()
bool RemoveActivateESMTriggerOnLocalReg(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_ActivateESMTriggerOnLocalReg);
}
}
FECSMonitorRuntimeView __GetMonitorActivateESMTriggerOnLocalRegOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_ActivateESMTriggerOnLocalReg, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorActivateESMTriggerOnLocalRegOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_ActivateESMTriggerOnLocalReg, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorActivateESMTriggerOnLocalRegOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_ActivateESMTriggerOnLocalReg, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorActivateESMTriggerOnLocalRegOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_ActivateESMTriggerOnLocalReg, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorActivateESMTriggerOnLocalRegOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_ActivateESMTriggerOnLocalReg, bFixedFrame, bMustHandleAll);
}
void __MonitorActivateESMTriggerOnLocalRegLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_ActivateESMTriggerOnLocalReg, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorActivateESMTriggerOnLocalRegActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_ActivateESMTriggerOnLocalReg, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorActivateESMTriggerOnLocalRegModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_ActivateESMTriggerOnLocalReg, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_ESMExternalTransitOnLocalReg
{
UFUNCTION()
bool HasESMExternalTransitOnLocalReg(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_ESMExternalTransitOnLocalReg);
}
FC_ESMExternalTransitOnLocalReg& AssignESMExternalTransitOnLocalReg(const FECSEntity &inout Entity, const FC_ESMExternalTransitOnLocalReg &inout DefaultValue = FC_ESMExternalTransitOnLocalReg())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_ESMExternalTransitOnLocalReg, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignESMExternalTransitOnLocalReg_BP(const FECSEntity &inout Entity, const FC_ESMExternalTransitOnLocalReg &inout DefaultValue = FC_ESMExternalTransitOnLocalReg())
{
    ECSFunc_FC_ESMExternalTransitOnLocalReg::AssignESMExternalTransitOnLocalReg(Entity, DefaultValue);
    return;
}
FC_ESMExternalTransitOnLocalReg& ModifyESMExternalTransitOnLocalReg(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_ESMExternalTransitOnLocalReg));
    return local_12.GetComp();
}
FC_ESMExternalTransitOnLocalReg& ModifyOrAddESMExternalTransitOnLocalReg(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_ESMExternalTransitOnLocalReg));
    return local_12.GetComp();
}
const FC_ESMExternalTransitOnLocalReg& GetESMExternalTransitOnLocalReg(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_ESMExternalTransitOnLocalReg));
    return local_12.GetComp();
}
UFUNCTION()
FC_ESMExternalTransitOnLocalReg GetESMExternalTransitOnLocalReg_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_ESMExternalTransitOnLocalReg& local_4 = ECSFunc_FC_ESMExternalTransitOnLocalReg::GetESMExternalTransitOnLocalReg(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_ESMExternalTransitOnLocalReg();
}
const FC_ESMExternalTransitOnLocalReg GetDefaultedESMExternalTransitOnLocalReg(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_ESMExternalTransitOnLocalReg __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_ESMExternalTransitOnLocalReg);
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
FC_ESMExternalTransitOnLocalReg GetDefaultedESMExternalTransitOnLocalReg_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_ESMExternalTransitOnLocalReg::GetDefaultedESMExternalTransitOnLocalReg(Entity);
}
UFUNCTION()
bool RemoveESMExternalTransitOnLocalReg(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_ESMExternalTransitOnLocalReg);
}
}
FECSMonitorRuntimeView __GetMonitorESMExternalTransitOnLocalRegOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_ESMExternalTransitOnLocalReg, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorESMExternalTransitOnLocalRegOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_ESMExternalTransitOnLocalReg, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorESMExternalTransitOnLocalRegOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_ESMExternalTransitOnLocalReg, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorESMExternalTransitOnLocalRegOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_ESMExternalTransitOnLocalReg, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorESMExternalTransitOnLocalRegOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_ESMExternalTransitOnLocalReg, bFixedFrame, bMustHandleAll);
}
void __MonitorESMExternalTransitOnLocalRegLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_ESMExternalTransitOnLocalReg, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorESMExternalTransitOnLocalRegActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_ESMExternalTransitOnLocalReg, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorESMExternalTransitOnLocalRegModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_ESMExternalTransitOnLocalReg, bFixedFrame, Details);
    return;
}
