
namespace LevelObjectStatUnlockCondition
{
enum ETwoHandOperator
{
    LargerThan,
    LessThan,
    LargerThanOrEqual,
    LessThanOrEqual,
    Equal,
    NotEqual,
}

}
namespace __INTENRAL_FC_LevelObjectStatUnlockConditionConfig_NS
{
    const TECSComponentDerivedPtr<FC_LevelObjectStatUnlockConditionConfig> DerivedPtr = TECSComponentDerivedPtr<FC_LevelObjectStatUnlockConditionConfig>();
    const FC_LevelObjectStatUnlockConditionConfig DefaultValue = FC_LevelObjectStatUnlockConditionConfig();

}
UCLASS(Abstract)
class ULevelObjectStatUnlockConditionBase : UObject
{
    ULevelObjectStatUnlockConditionBase()
    {
        return;
    }
    bool CheckCondition(const FECSEntity &inout PlayerPawnEntity) const
    {
        return true;
    }
}

class ULevelObjectStatUnlockCondition_PlayerLevel : ULevelObjectStatUnlockConditionBase
{
    UPROPERTY()
    LevelObjectStatUnlockCondition::ETwoHandOperator Operator = LevelObjectStatUnlockCondition::ETwoHandOperator(2);
    UPROPERTY()
    int RequiredLevel = 0;


    bool CheckCondition(const FECSEntity &inout PlayerPawnEntity) const
    {
        Get local_8;
        int local_16 = 0;
        if (!(FECSEntity(local_8.opCall().GetPlayerEntity()).IsValid()))
        {
            return false;
        }
        if (!(local_16))
        {
            return false;
        }
        return (local_16.GetCurLevel() >= this.RequiredLevel);
    }
}

struct FLevelObjectStatUnlockConditionLogicAndGroup
{
    UPROPERTY()
    TArray<ULevelObjectStatUnlockConditionBase> UnlockConditions;

    FLevelObjectStatUnlockConditionLogicAndGroup()
    {
        return;
    }
}

struct FC_LevelObjectStatUnlockConditionConfig : FECSComponent
{
    UPROPERTY()
    TArray<FLevelObjectStatUnlockConditionLogicAndGroup> UnlockConditions;

    FC_LevelObjectStatUnlockConditionConfig()
    {
        return;
    }
    bool CheckUnlockConditions(const FECSEntity &inout PlayerPawnEntity) const
    {
        bool local_17;
        for (auto& local_16 : this)
        {
            local_17 = true;
            for (auto local_32 : local_16.UnlockConditions)
            {
                if (!(local_32.CheckCondition(PlayerPawnEntity)))
                {
                    local_17 = false;
                    break;
                }
            }
            if (local_17)
            {
                return true;
            }
        }
        return false;
    }
}

namespace LevelObjectStatUnlockCondition
{
bool CheckOperator(const int Value, const int CompareValue, const LevelObjectStatUnlockCondition::ETwoHandOperator Operator)
{
    switch (int(Operator))
    {
    case 0:
    {
        return (Value > CompareValue);
    }
    case 1:
    {
        return (Value < CompareValue);
    }
    case 2:
    {
        return (Value >= CompareValue);
    }
    case 3:
    {
        return (Value <= CompareValue);
    }
    case 4:
    {
        return (Value == CompareValue);
    }
    case 5:
    {
        return (Value != CompareValue);
    }
    }
    return true;
}
bool CheckOperator(const float32 Value, const float32 CompareValue, const LevelObjectStatUnlockCondition::ETwoHandOperator Operator)
{
    switch (int(Operator))
    {
    case 0:
    {
        return (Value > CompareValue);
    }
    case 1:
    {
        return (Value < CompareValue);
    }
    case 2:
    {
        return (Value >= CompareValue);
    }
    case 3:
    {
        return (Value <= CompareValue);
    }
    case 4:
    {
        return (Value == CompareValue);
    }
    case 5:
    {
        return (Value != CompareValue);
    }
    }
    return true;
}
}
namespace ECSFunc_FC_LevelObjectStatUnlockConditionConfig
{
UFUNCTION()
bool HasLevelObjectStatUnlockConditionConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_LevelObjectStatUnlockConditionConfig);
}
FC_LevelObjectStatUnlockConditionConfig& AssignLevelObjectStatUnlockConditionConfig(const FECSEntity &inout Entity, const FC_LevelObjectStatUnlockConditionConfig &inout DefaultValue = FC_LevelObjectStatUnlockConditionConfig())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_LevelObjectStatUnlockConditionConfig, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignLevelObjectStatUnlockConditionConfig_BP(const FECSEntity &inout Entity, const FC_LevelObjectStatUnlockConditionConfig &inout DefaultValue = FC_LevelObjectStatUnlockConditionConfig())
{
    ECSFunc_FC_LevelObjectStatUnlockConditionConfig::AssignLevelObjectStatUnlockConditionConfig(Entity, DefaultValue);
    return;
}
FC_LevelObjectStatUnlockConditionConfig& ModifyLevelObjectStatUnlockConditionConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_LevelObjectStatUnlockConditionConfig));
    return local_12.GetComp();
}
FC_LevelObjectStatUnlockConditionConfig& ModifyOrAddLevelObjectStatUnlockConditionConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_LevelObjectStatUnlockConditionConfig));
    return local_12.GetComp();
}
const FC_LevelObjectStatUnlockConditionConfig& GetLevelObjectStatUnlockConditionConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_LevelObjectStatUnlockConditionConfig));
    return local_12.GetComp();
}
UFUNCTION()
FC_LevelObjectStatUnlockConditionConfig GetLevelObjectStatUnlockConditionConfig_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_LevelObjectStatUnlockConditionConfig __r;
    bValid = false;
    bValid = ECSFunc_FC_LevelObjectStatUnlockConditionConfig::GetLevelObjectStatUnlockConditionConfig(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_LevelObjectStatUnlockConditionConfig GetDefaultedLevelObjectStatUnlockConditionConfig(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_LevelObjectStatUnlockConditionConfig __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_LevelObjectStatUnlockConditionConfig);
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
FC_LevelObjectStatUnlockConditionConfig GetDefaultedLevelObjectStatUnlockConditionConfig_BP(const FECSEntity &inout Entity)
{
    FC_LevelObjectStatUnlockConditionConfig __r;
    return __r;
}
UFUNCTION()
bool RemoveLevelObjectStatUnlockConditionConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_LevelObjectStatUnlockConditionConfig);
}
}
FECSMonitorRuntimeView __GetMonitorLevelObjectStatUnlockConditionConfigOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_LevelObjectStatUnlockConditionConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLevelObjectStatUnlockConditionConfigOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_LevelObjectStatUnlockConditionConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLevelObjectStatUnlockConditionConfigOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_LevelObjectStatUnlockConditionConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLevelObjectStatUnlockConditionConfigOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_LevelObjectStatUnlockConditionConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLevelObjectStatUnlockConditionConfigOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_LevelObjectStatUnlockConditionConfig, bFixedFrame, bMustHandleAll);
}
void __MonitorLevelObjectStatUnlockConditionConfigLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_LevelObjectStatUnlockConditionConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorLevelObjectStatUnlockConditionConfigActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_LevelObjectStatUnlockConditionConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorLevelObjectStatUnlockConditionConfigModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_LevelObjectStatUnlockConditionConfig, bFixedFrame, Details);
    return;
}
