
namespace __INTENRAL_FC_DelayArealStrike_NS
{
    const TECSComponentDerivedPtr<FC_DelayArealStrike> DerivedPtr = TECSComponentDerivedPtr<FC_DelayArealStrike>();
    const FC_DelayArealStrike DefaultValue = FC_DelayArealStrike();

}
struct FC_DelayArealStrike : FECSComponent
{
    UPROPERTY()
    FFPTime DelayTime;
    UPROPERTY()
    FDataObjectPtr AttackData;
    UPROPERTY()
    FVector PostionOffset = FVector::ZeroVector;
    UPROPERTY()
    FHitTestShape HitTestShape;
    UPROPERTY()
    FAreaStrikeShape StrikeShape;
    UPROPERTY()
    FVector3f StrikeDirection = FVector3f::UpVector;

    FC_DelayArealStrike()
    {
        return;
    }
}

namespace ECSFunc_FC_DelayArealStrike
{
UFUNCTION()
bool HasDelayArealStrike(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_DelayArealStrike);
}
FC_DelayArealStrike& AssignDelayArealStrike(const FECSEntity &inout Entity, const FC_DelayArealStrike &inout DefaultValue = FC_DelayArealStrike())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_DelayArealStrike, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignDelayArealStrike_BP(const FECSEntity &inout Entity, const FC_DelayArealStrike &inout DefaultValue = FC_DelayArealStrike())
{
    ECSFunc_FC_DelayArealStrike::AssignDelayArealStrike(Entity, DefaultValue);
    return;
}
FC_DelayArealStrike& ModifyDelayArealStrike(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_DelayArealStrike));
    return local_12.GetComp();
}
FC_DelayArealStrike& ModifyOrAddDelayArealStrike(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_DelayArealStrike));
    return local_12.GetComp();
}
const FC_DelayArealStrike& GetDelayArealStrike(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_DelayArealStrike));
    return local_12.GetComp();
}
UFUNCTION()
FC_DelayArealStrike GetDelayArealStrike_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_DelayArealStrike __r;
    bValid = false;
    bValid = ECSFunc_FC_DelayArealStrike::GetDelayArealStrike(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_DelayArealStrike GetDefaultedDelayArealStrike(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_DelayArealStrike __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_DelayArealStrike);
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
FC_DelayArealStrike GetDefaultedDelayArealStrike_BP(const FECSEntity &inout Entity)
{
    FC_DelayArealStrike __r;
    return __r;
}
UFUNCTION()
bool RemoveDelayArealStrike(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_DelayArealStrike);
}
}
FECSMonitorRuntimeView __GetMonitorDelayArealStrikeOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_DelayArealStrike, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDelayArealStrikeOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_DelayArealStrike, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDelayArealStrikeOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_DelayArealStrike, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDelayArealStrikeOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_DelayArealStrike, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDelayArealStrikeOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_DelayArealStrike, bFixedFrame, bMustHandleAll);
}
void __MonitorDelayArealStrikeLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_DelayArealStrike, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorDelayArealStrikeActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_DelayArealStrike, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorDelayArealStrikeModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_DelayArealStrike, bFixedFrame, Details);
    return;
}
