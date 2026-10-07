
namespace __INTENRAL_FC_PlayerEnterRegionCondition_NS
{
    const TECSComponentDerivedPtr<FC_PlayerEnterRegionCondition> DerivedPtr = TECSComponentDerivedPtr<FC_PlayerEnterRegionCondition>();
    const FC_PlayerEnterRegionCondition DefaultValue = FC_PlayerEnterRegionCondition();

}
struct FEnterRegionInfo
{
    UPROPERTY()
    FConditionInstanceHandle ConditionHandle;
    UPROPERTY()
    bool bHasReset = true;
    UPROPERTY()
    TDataObjectPtr<FLevelInfoConfig> LevelInfo;
    UPROPERTY()
    FVector Center;
    UPROPERTY()
    float32 Radius;


}

struct FC_PlayerEnterRegionCondition : FECSComponent
{
    UPROPERTY()
    TMap<int, FEnterRegionInfo> EnterRegionInfos;

    FC_PlayerEnterRegionCondition()
    {
        return;
    }
}

namespace ECSFunc_FC_PlayerEnterRegionCondition
{
UFUNCTION()
bool HasPlayerEnterRegionCondition(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_PlayerEnterRegionCondition);
}
FC_PlayerEnterRegionCondition& AssignPlayerEnterRegionCondition(const FECSEntity &inout Entity, const FC_PlayerEnterRegionCondition &inout DefaultValue = FC_PlayerEnterRegionCondition())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_PlayerEnterRegionCondition, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignPlayerEnterRegionCondition_BP(const FECSEntity &inout Entity, const FC_PlayerEnterRegionCondition &inout DefaultValue = FC_PlayerEnterRegionCondition())
{
    ECSFunc_FC_PlayerEnterRegionCondition::AssignPlayerEnterRegionCondition(Entity, DefaultValue);
    return;
}
FC_PlayerEnterRegionCondition& ModifyPlayerEnterRegionCondition(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_PlayerEnterRegionCondition));
    return local_12.GetComp();
}
FC_PlayerEnterRegionCondition& ModifyOrAddPlayerEnterRegionCondition(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_PlayerEnterRegionCondition));
    return local_12.GetComp();
}
const FC_PlayerEnterRegionCondition& GetPlayerEnterRegionCondition(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_PlayerEnterRegionCondition));
    return local_12.GetComp();
}
UFUNCTION()
FC_PlayerEnterRegionCondition GetPlayerEnterRegionCondition_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_PlayerEnterRegionCondition __r;
    bValid = false;
    bValid = ECSFunc_FC_PlayerEnterRegionCondition::GetPlayerEnterRegionCondition(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_PlayerEnterRegionCondition GetDefaultedPlayerEnterRegionCondition(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_PlayerEnterRegionCondition __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_PlayerEnterRegionCondition);
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
FC_PlayerEnterRegionCondition GetDefaultedPlayerEnterRegionCondition_BP(const FECSEntity &inout Entity)
{
    FC_PlayerEnterRegionCondition __r;
    return __r;
}
UFUNCTION()
bool RemovePlayerEnterRegionCondition(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_PlayerEnterRegionCondition);
}
}
FECSMonitorRuntimeView __GetMonitorPlayerEnterRegionConditionOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_PlayerEnterRegionCondition, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPlayerEnterRegionConditionOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_PlayerEnterRegionCondition, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPlayerEnterRegionConditionOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_PlayerEnterRegionCondition, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPlayerEnterRegionConditionOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_PlayerEnterRegionCondition, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPlayerEnterRegionConditionOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_PlayerEnterRegionCondition, bFixedFrame, bMustHandleAll);
}
void __MonitorPlayerEnterRegionConditionLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_PlayerEnterRegionCondition, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPlayerEnterRegionConditionActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_PlayerEnterRegionCondition, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPlayerEnterRegionConditionModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_PlayerEnterRegionCondition, bFixedFrame, Details);
    return;
}
