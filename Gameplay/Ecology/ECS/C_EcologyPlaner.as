
enum EEcologyTargetPlanerType
{
    CommonEntity,
    Flock,
    Creature,
}

enum EEcologyPlanerFuncType
{
    None,
    Script,
    HTN,
}

namespace __INTENRAL_FC_EcologyPlaner_NS
{
    const TECSComponentDerivedPtr<FC_EcologyPlaner> DerivedPtr = TECSComponentDerivedPtr<FC_EcologyPlaner>();
    const FC_EcologyPlaner DefaultValue = FC_EcologyPlaner();
}
namespace __INTENRAL_FC_EcologyHTNPlanerConfig_NS
{
    const TECSComponentDerivedPtr<FC_EcologyHTNPlanerConfig> DerivedPtr = TECSComponentDerivedPtr<FC_EcologyHTNPlanerConfig>();
    const FC_EcologyHTNPlanerConfig DefaultValue = FC_EcologyHTNPlanerConfig();

}
struct FC_EcologyPlaner : FECSComponent
{
    UPROPERTY()
    EEcologyPlanerFuncType FuncType;
    UPROPERTY()
    EEcologyTargetPlanerType PlanerType;
    UPROPERTY()
    TObjectPtr<UBaseEcologyPlanerDefine> PlanerDefine;


}

struct FHTNPlanerDefineConfig
{
    UPROPERTY()
    TSoftObjectPtr<UHTN> HTNAsset;
    UPROPERTY()
    TSoftObjectPtr<UBlackboardData> BlackboardAsset;
    UPROPERTY()
    TMap<FGameplayTag, TSoftObjectPtr<UHTN>> DynamicHTNSet;
    UPROPERTY()
    TMap<FGameplayTag, TSoftObjectPtr<UBehaviorTree>> DynamicBehaviorTree;

    FHTNPlanerDefineConfig()
    {
        return;
    }
    void SetupEcologyPlanerEntity(const FECSEntity &inout PlanerEntity, FC_EcologyPlaner &inout EcologyPlaner) const
    {
        int local_82 = 0;
        this.SyncLoad();
        if (!(this.IsValid()) || !(this.BlackboardAsset.IsValid()))
        {
            return;
        }
        EcologyPlaner.FuncType = EEcologyPlanerFuncType(2);
        local_82.DynamicSetup(this, this.BlackboardAsset, this.DynamicHTNSet);
        local_82.InitDynamicBehaviorTreeSet(this.DynamicBehaviorTree);
        FC_HTNNeedRestartTag local_88;
        Assign local_86;
        local_86.opCall(local_88);
        return;
    }
    void SyncLoad() const
    {
        Ecology::SyncLoadObject(this.ToSoftObjectPath());
        Ecology::SyncLoadObject(this.BlackboardAsset.ToSoftObjectPath());
        return;
    }
}

struct FC_EcologyHTNPlanerConfig : FECSComponent
{
    UPROPERTY()
    FHTNPlanerDefineConfig Config;

    FC_EcologyHTNPlanerConfig()
    {
        return;
    }
    void Setup(const FECSEntity &inout Owner) const
    {
        if (!(Owner))
        {
            return;
        }
        Has local_6;
        bool local_1 = local_6.opCall();
        if (local_1)
        {
            XLog(ELog(30), FString().Append("[Error] Owner already has FC_EcologyPlaner. Skipping Setup."));
            return;
        }
        int local_24 = 0;
        int local_23 = local_24;
        Has local_28;
        bool local_1_2 = local_28.opCall();
        if (local_1_2)
        {
            int local_24_2 = 2;
            local_23 = local_24_2;
        }
        else
        {
            Has local_32;
            bool local_1_3 = local_32.opCall();
            if (local_1_3)
            {
                int local_24_3 = 1;
                local_23 = local_24_3;
            }
        }
        FC_EcologyPlaner local_22;
        local_22.PlanerType = EEcologyTargetPlanerType(local_23);
        TObjectPtr<UBaseEcologyPlanerDefine> local_34;
        local_22.PlanerDefine = local_34;
        this.SetupEcologyPlanerEntity(Owner, local_22);
        return;
    }
}

struct FT_EcologyPlanerTrait : FECSTrait
{
    FECSTrait _base_FECSTrait;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_EcologyHTNPlanerConfig_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_EcologyHTNPlanerConfig, NAME_None);
    UPROPERTY()
    bool bHas_FC_EcologyHTNPlanerConfig = false;
    UPROPERTY()
    FC_EcologyHTNPlanerConfig Config_FC_EcologyHTNPlanerConfig;


}

namespace ECSFunc_FC_EcologyPlaner
{
UFUNCTION()
bool HasEcologyPlaner(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_EcologyPlaner);
}
FC_EcologyPlaner& AssignEcologyPlaner(const FECSEntity &inout Entity, const FC_EcologyPlaner &inout DefaultValue = FC_EcologyPlaner())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_EcologyPlaner, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignEcologyPlaner_BP(const FECSEntity &inout Entity, const FC_EcologyPlaner &inout DefaultValue = FC_EcologyPlaner())
{
    ECSFunc_FC_EcologyPlaner::AssignEcologyPlaner(Entity, DefaultValue);
    return;
}
FC_EcologyPlaner& ModifyEcologyPlaner(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_EcologyPlaner));
    return local_12.GetComp();
}
FC_EcologyPlaner& ModifyOrAddEcologyPlaner(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_EcologyPlaner));
    return local_12.GetComp();
}
const FC_EcologyPlaner& GetEcologyPlaner(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_EcologyPlaner));
    return local_12.GetComp();
}
UFUNCTION()
FC_EcologyPlaner GetEcologyPlaner_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_EcologyPlaner __r;
    bValid = false;
    bValid = ECSFunc_FC_EcologyPlaner::GetEcologyPlaner(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_EcologyPlaner GetDefaultedEcologyPlaner(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_EcologyPlaner __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_EcologyPlaner);
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
FC_EcologyPlaner GetDefaultedEcologyPlaner_BP(const FECSEntity &inout Entity)
{
    FC_EcologyPlaner __r;
    return __r;
}
UFUNCTION()
bool RemoveEcologyPlaner(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_EcologyPlaner);
}
}
FECSMonitorRuntimeView __GetMonitorEcologyPlanerOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_EcologyPlaner, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcologyPlanerOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_EcologyPlaner, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcologyPlanerOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_EcologyPlaner, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcologyPlanerOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_EcologyPlaner, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcologyPlanerOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_EcologyPlaner, bFixedFrame, bMustHandleAll);
}
void __MonitorEcologyPlanerLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_EcologyPlaner, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcologyPlanerActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_EcologyPlaner, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcologyPlanerModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_EcologyPlaner, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_EcologyHTNPlanerConfig
{
UFUNCTION()
bool HasEcologyHTNPlanerConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_EcologyHTNPlanerConfig);
}
FC_EcologyHTNPlanerConfig& AssignEcologyHTNPlanerConfig(const FECSEntity &inout Entity, const FC_EcologyHTNPlanerConfig &inout DefaultValue = FC_EcologyHTNPlanerConfig())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_EcologyHTNPlanerConfig, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignEcologyHTNPlanerConfig_BP(const FECSEntity &inout Entity, const FC_EcologyHTNPlanerConfig &inout DefaultValue = FC_EcologyHTNPlanerConfig())
{
    ECSFunc_FC_EcologyHTNPlanerConfig::AssignEcologyHTNPlanerConfig(Entity, DefaultValue);
    return;
}
FC_EcologyHTNPlanerConfig& ModifyEcologyHTNPlanerConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_EcologyHTNPlanerConfig));
    return local_12.GetComp();
}
FC_EcologyHTNPlanerConfig& ModifyOrAddEcologyHTNPlanerConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_EcologyHTNPlanerConfig));
    return local_12.GetComp();
}
const FC_EcologyHTNPlanerConfig& GetEcologyHTNPlanerConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_EcologyHTNPlanerConfig));
    return local_12.GetComp();
}
UFUNCTION()
FC_EcologyHTNPlanerConfig GetEcologyHTNPlanerConfig_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_EcologyHTNPlanerConfig __r;
    bValid = false;
    bValid = ECSFunc_FC_EcologyHTNPlanerConfig::GetEcologyHTNPlanerConfig(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_EcologyHTNPlanerConfig GetDefaultedEcologyHTNPlanerConfig(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_EcologyHTNPlanerConfig __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_EcologyHTNPlanerConfig);
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
FC_EcologyHTNPlanerConfig GetDefaultedEcologyHTNPlanerConfig_BP(const FECSEntity &inout Entity)
{
    FC_EcologyHTNPlanerConfig __r;
    return __r;
}
UFUNCTION()
bool RemoveEcologyHTNPlanerConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_EcologyHTNPlanerConfig);
}
}
FECSMonitorRuntimeView __GetMonitorEcologyHTNPlanerConfigOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_EcologyHTNPlanerConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcologyHTNPlanerConfigOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_EcologyHTNPlanerConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcologyHTNPlanerConfigOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_EcologyHTNPlanerConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcologyHTNPlanerConfigOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_EcologyHTNPlanerConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcologyHTNPlanerConfigOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_EcologyHTNPlanerConfig, bFixedFrame, bMustHandleAll);
}
void __MonitorEcologyHTNPlanerConfigLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_EcologyHTNPlanerConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcologyHTNPlanerConfigActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_EcologyHTNPlanerConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcologyHTNPlanerConfigModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_EcologyHTNPlanerConfig, bFixedFrame, Details);
    return;
}
