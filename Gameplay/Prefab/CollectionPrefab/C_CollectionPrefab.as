
enum ECollectionPrefabPresentationState
{
    None,
    Show,
    InteractedDisappear,
    LifeCycleDisappear,
}

namespace __INTENRAL_FC_CollectionPrefabPresentationConfig_NS
{
    const TECSComponentDerivedPtr<FC_CollectionPrefabPresentationConfig> DerivedPtr = TECSComponentDerivedPtr<FC_CollectionPrefabPresentationConfig>();
    const FC_CollectionPrefabPresentationConfig DefaultValue = FC_CollectionPrefabPresentationConfig();
}
namespace __INTENRAL_FC_CollectionPrefabPresentationState_NS
{
    const TECSComponentDerivedPtr<FC_CollectionPrefabPresentationState> DerivedPtr = TECSComponentDerivedPtr<FC_CollectionPrefabPresentationState>();
    const FC_CollectionPrefabPresentationState DefaultValue = FC_CollectionPrefabPresentationState();
}
namespace __INTENRAL_FC_CollectionPrefabPresentationCache_NS
{
    const TECSComponentDerivedPtr<FC_CollectionPrefabPresentationCache> DerivedPtr = TECSComponentDerivedPtr<FC_CollectionPrefabPresentationCache>();
    const FC_CollectionPrefabPresentationCache DefaultValue = FC_CollectionPrefabPresentationCache();
}
namespace __INTENRAL_FC_CollectionPrefabPresentationStateDelayTimer_Show_NS
{
    const TECSComponentDerivedPtr<FC_CollectionPrefabPresentationStateDelayTimer_Show> DerivedPtr = TECSComponentDerivedPtr<FC_CollectionPrefabPresentationStateDelayTimer_Show>();
    const FC_CollectionPrefabPresentationStateDelayTimer_Show DefaultValue = FC_CollectionPrefabPresentationStateDelayTimer_Show();
}
namespace __INTENRAL_FC_CollectionPrefabPresentationStateDelayTimer_Normal_NS
{
    const TECSComponentDerivedPtr<FC_CollectionPrefabPresentationStateDelayTimer_Normal> DerivedPtr = TECSComponentDerivedPtr<FC_CollectionPrefabPresentationStateDelayTimer_Normal>();
    const FC_CollectionPrefabPresentationStateDelayTimer_Normal DefaultValue = FC_CollectionPrefabPresentationStateDelayTimer_Normal();

}
struct FCollectionPrefabPlayFXCallParam
{
    UPROPERTY()
    TSubclassOf<AFXActor> FXActorClass;
    UPROPERTY()
    TArray<FFXOverrideParam> OverrideParam;
    UPROPERTY()
    FVector LocationOrOffset = FVector::ZeroVector;
    UPROPERTY()
    FRotator RotationOrOffset = FRotator::ZeroRotator;
    UPROPERTY()
    FFXSurfaceTraceParam SurfaceTraceParam;
    UPROPERTY()
    bool bRandomSeed = true;
    UPROPERTY()
    bool bAffectedByScreenDarkness = true;


}

struct FCollectionPrefabStateConfigItem_Show
{
    UPROPERTY()
    float32 DelayTimeSeconds = 0.0f;
    UPROPERTY()
    TArray<FPlayFXCallParam> FXConfigs;
    UPROPERTY()
    TArray<FCollectionPrefabPlayFXCallParam> InstantFXConfigs;


}

struct FCollectionPrefabStateConfigItem_Normal
{
    UPROPERTY()
    float32 DelayTimeSeconds = 0.0f;
    UPROPERTY()
    TArray<FPlayFXCallParam> FXConfigs;
    UPROPERTY()
    TArray<FCollectionPrefabPlayFXCallParam> DurationalFXConfigs;


}

struct FCollectionPrefabStateConfigItem_InteractedDisappear
{
    UPROPERTY()
    TArray<FPlayFXCallParam> FXConfigs;
    UPROPERTY()
    TArray<FCollectionPrefabPlayFXCallParam> InstantFXConfigs;

    FCollectionPrefabStateConfigItem_InteractedDisappear()
    {
        return;
    }
}

struct FCollectionPrefabStateConfigItem_LifeCycleDisappear
{
    UPROPERTY()
    TArray<FPlayFXCallParam> FXConfigs;
    UPROPERTY()
    TArray<FCollectionPrefabPlayFXCallParam> InstantFXConfigs;

    FCollectionPrefabStateConfigItem_LifeCycleDisappear()
    {
        return;
    }
}

struct FC_CollectionPrefabPresentationConfig : FECSComponent
{
    UPROPERTY()
    FCollectionPrefabStateConfigItem_Show StateShow;
    UPROPERTY()
    FCollectionPrefabStateConfigItem_Normal StateNormal;
    UPROPERTY()
    FCollectionPrefabStateConfigItem_InteractedDisappear StateInteractedDisappear;
    UPROPERTY()
    FCollectionPrefabStateConfigItem_LifeCycleDisappear StateLifeCycleDisappear;

    FC_CollectionPrefabPresentationConfig()
    {
        return;
    }
    void PostPrefabLoad(const FECSEntity &inout Entity)
    {
        if (ECS::GetRuntimeInfo().IsClient)
        {
            FC_CollectionPrefabPresentationCache local_10;
            Assign local_6;
            local_6.opCall(local_10);
            return;
        }
        FC_CollectionPrefabPresentationState local_16;
        Assign local_14;
        FC_CollectionPrefabPresentationState& local_18 = local_14.opCall(local_16);
        if (local_18)
        {
            local_18.SetState(ECollectionPrefabPresentationState(1));
        }
        return;
    }
}

struct FC_CollectionPrefabPresentationState : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    ECollectionPrefabPresentationState m_State;

    FC_CollectionPrefabPresentationState()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_CollectionPrefabPresentationState(const FC_CollectionPrefabPresentationState &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_CollectionPrefabPresentationState opAssign(const FC_CollectionPrefabPresentationState &inout Other)
    {
        FC_CollectionPrefabPresentationState __r;
        this.SetState(Other.GetState());
        return __r;
    }
    ECollectionPrefabPresentationState GetState() const property
    {
        return this.m_State;
    }
    void SetState(const ECollectionPrefabPresentationState __Value) property
    {
        if (int(this.m_State) == int(__Value))
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_State = __Value;
        return;
    }
}

struct FC_CollectionPrefabPresentationCache : FECSComponent
{
    UPROPERTY()
    TArray<FECSEntity> NormalDurationalFXEntities;

    FC_CollectionPrefabPresentationCache()
    {
        return;
    }
}

struct FC_CollectionPrefabPresentationStateDelayTimer_Show : FECSComponent
{
    UPROPERTY()
    FFPTime TargetTime;

    FC_CollectionPrefabPresentationStateDelayTimer_Show()
    {
        return;
    }
}

struct FC_CollectionPrefabPresentationStateDelayTimer_Normal : FECSComponent
{
    UPROPERTY()
    FFPTime TargetTime;

    FC_CollectionPrefabPresentationStateDelayTimer_Normal()
    {
        return;
    }
}

namespace ECSFunc_FC_CollectionPrefabPresentationConfig
{
UFUNCTION()
bool HasCollectionPrefabPresentationConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_CollectionPrefabPresentationConfig);
}
FC_CollectionPrefabPresentationConfig& AssignCollectionPrefabPresentationConfig(const FECSEntity &inout Entity, const FC_CollectionPrefabPresentationConfig &inout DefaultValue = FC_CollectionPrefabPresentationConfig())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_CollectionPrefabPresentationConfig, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignCollectionPrefabPresentationConfig_BP(const FECSEntity &inout Entity, const FC_CollectionPrefabPresentationConfig &inout DefaultValue = FC_CollectionPrefabPresentationConfig())
{
    ECSFunc_FC_CollectionPrefabPresentationConfig::AssignCollectionPrefabPresentationConfig(Entity, DefaultValue);
    return;
}
FC_CollectionPrefabPresentationConfig& ModifyCollectionPrefabPresentationConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_CollectionPrefabPresentationConfig));
    return local_12.GetComp();
}
FC_CollectionPrefabPresentationConfig& ModifyOrAddCollectionPrefabPresentationConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_CollectionPrefabPresentationConfig));
    return local_12.GetComp();
}
const FC_CollectionPrefabPresentationConfig& GetCollectionPrefabPresentationConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_CollectionPrefabPresentationConfig));
    return local_12.GetComp();
}
UFUNCTION()
FC_CollectionPrefabPresentationConfig GetCollectionPrefabPresentationConfig_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_CollectionPrefabPresentationConfig __r;
    bValid = false;
    bValid = ECSFunc_FC_CollectionPrefabPresentationConfig::GetCollectionPrefabPresentationConfig(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_CollectionPrefabPresentationConfig GetDefaultedCollectionPrefabPresentationConfig(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_CollectionPrefabPresentationConfig __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_CollectionPrefabPresentationConfig);
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
FC_CollectionPrefabPresentationConfig GetDefaultedCollectionPrefabPresentationConfig_BP(const FECSEntity &inout Entity)
{
    FC_CollectionPrefabPresentationConfig __r;
    return __r;
}
UFUNCTION()
bool RemoveCollectionPrefabPresentationConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_CollectionPrefabPresentationConfig);
}
}
FECSMonitorRuntimeView __GetMonitorCollectionPrefabPresentationConfigOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_CollectionPrefabPresentationConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCollectionPrefabPresentationConfigOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_CollectionPrefabPresentationConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCollectionPrefabPresentationConfigOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_CollectionPrefabPresentationConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCollectionPrefabPresentationConfigOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_CollectionPrefabPresentationConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCollectionPrefabPresentationConfigOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_CollectionPrefabPresentationConfig, bFixedFrame, bMustHandleAll);
}
void __MonitorCollectionPrefabPresentationConfigLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_CollectionPrefabPresentationConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCollectionPrefabPresentationConfigActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_CollectionPrefabPresentationConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCollectionPrefabPresentationConfigModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_CollectionPrefabPresentationConfig, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_CollectionPrefabPresentationState
{
UFUNCTION()
bool HasCollectionPrefabPresentationState(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_CollectionPrefabPresentationState);
}
FC_CollectionPrefabPresentationState& AssignCollectionPrefabPresentationState(const FECSEntity &inout Entity, const FC_CollectionPrefabPresentationState &inout DefaultValue = FC_CollectionPrefabPresentationState())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_CollectionPrefabPresentationState, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignCollectionPrefabPresentationState_BP(const FECSEntity &inout Entity, const FC_CollectionPrefabPresentationState &inout DefaultValue = FC_CollectionPrefabPresentationState())
{
    ECSFunc_FC_CollectionPrefabPresentationState::AssignCollectionPrefabPresentationState(Entity, DefaultValue);
    return;
}
FC_CollectionPrefabPresentationState& ModifyCollectionPrefabPresentationState(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_CollectionPrefabPresentationState));
    return local_12.GetComp();
}
FC_CollectionPrefabPresentationState& ModifyOrAddCollectionPrefabPresentationState(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_CollectionPrefabPresentationState));
    return local_12.GetComp();
}
const FC_CollectionPrefabPresentationState& GetCollectionPrefabPresentationState(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_CollectionPrefabPresentationState));
    return local_12.GetComp();
}
UFUNCTION()
FC_CollectionPrefabPresentationState GetCollectionPrefabPresentationState_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_CollectionPrefabPresentationState& local_4 = ECSFunc_FC_CollectionPrefabPresentationState::GetCollectionPrefabPresentationState(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_CollectionPrefabPresentationState();
}
const FC_CollectionPrefabPresentationState GetDefaultedCollectionPrefabPresentationState(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_CollectionPrefabPresentationState __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_CollectionPrefabPresentationState);
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
FC_CollectionPrefabPresentationState GetDefaultedCollectionPrefabPresentationState_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_CollectionPrefabPresentationState::GetDefaultedCollectionPrefabPresentationState(Entity);
}
UFUNCTION()
bool RemoveCollectionPrefabPresentationState(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_CollectionPrefabPresentationState);
}
}
FECSMonitorRuntimeView __GetMonitorCollectionPrefabPresentationStateOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_CollectionPrefabPresentationState, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCollectionPrefabPresentationStateOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_CollectionPrefabPresentationState, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCollectionPrefabPresentationStateOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_CollectionPrefabPresentationState, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCollectionPrefabPresentationStateOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_CollectionPrefabPresentationState, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCollectionPrefabPresentationStateOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_CollectionPrefabPresentationState, bFixedFrame, bMustHandleAll);
}
void __MonitorCollectionPrefabPresentationStateLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_CollectionPrefabPresentationState, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCollectionPrefabPresentationStateActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_CollectionPrefabPresentationState, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCollectionPrefabPresentationStateModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_CollectionPrefabPresentationState, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_CollectionPrefabPresentationCache
{
UFUNCTION()
bool HasCollectionPrefabPresentationCache(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_CollectionPrefabPresentationCache);
}
FC_CollectionPrefabPresentationCache& AssignCollectionPrefabPresentationCache(const FECSEntity &inout Entity, const FC_CollectionPrefabPresentationCache &inout DefaultValue = FC_CollectionPrefabPresentationCache())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_CollectionPrefabPresentationCache, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignCollectionPrefabPresentationCache_BP(const FECSEntity &inout Entity, const FC_CollectionPrefabPresentationCache &inout DefaultValue = FC_CollectionPrefabPresentationCache())
{
    ECSFunc_FC_CollectionPrefabPresentationCache::AssignCollectionPrefabPresentationCache(Entity, DefaultValue);
    return;
}
FC_CollectionPrefabPresentationCache& ModifyCollectionPrefabPresentationCache(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_CollectionPrefabPresentationCache));
    return local_12.GetComp();
}
FC_CollectionPrefabPresentationCache& ModifyOrAddCollectionPrefabPresentationCache(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_CollectionPrefabPresentationCache));
    return local_12.GetComp();
}
const FC_CollectionPrefabPresentationCache& GetCollectionPrefabPresentationCache(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_CollectionPrefabPresentationCache));
    return local_12.GetComp();
}
UFUNCTION()
FC_CollectionPrefabPresentationCache GetCollectionPrefabPresentationCache_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_CollectionPrefabPresentationCache __r;
    bValid = false;
    bValid = ECSFunc_FC_CollectionPrefabPresentationCache::GetCollectionPrefabPresentationCache(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_CollectionPrefabPresentationCache GetDefaultedCollectionPrefabPresentationCache(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_CollectionPrefabPresentationCache __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_CollectionPrefabPresentationCache);
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
FC_CollectionPrefabPresentationCache GetDefaultedCollectionPrefabPresentationCache_BP(const FECSEntity &inout Entity)
{
    FC_CollectionPrefabPresentationCache __r;
    return __r;
}
UFUNCTION()
bool RemoveCollectionPrefabPresentationCache(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_CollectionPrefabPresentationCache);
}
}
FECSMonitorRuntimeView __GetMonitorCollectionPrefabPresentationCacheOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_CollectionPrefabPresentationCache, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCollectionPrefabPresentationCacheOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_CollectionPrefabPresentationCache, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCollectionPrefabPresentationCacheOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_CollectionPrefabPresentationCache, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCollectionPrefabPresentationCacheOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_CollectionPrefabPresentationCache, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCollectionPrefabPresentationCacheOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_CollectionPrefabPresentationCache, bFixedFrame, bMustHandleAll);
}
void __MonitorCollectionPrefabPresentationCacheLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_CollectionPrefabPresentationCache, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCollectionPrefabPresentationCacheActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_CollectionPrefabPresentationCache, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCollectionPrefabPresentationCacheModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_CollectionPrefabPresentationCache, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_CollectionPrefabPresentationStateDelayTimer_Show
{
UFUNCTION()
bool HasCollectionPrefabPresentationStateDelayTimer_Show(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_CollectionPrefabPresentationStateDelayTimer_Show);
}
FC_CollectionPrefabPresentationStateDelayTimer_Show& AssignCollectionPrefabPresentationStateDelayTimer_Show(const FECSEntity &inout Entity, const FC_CollectionPrefabPresentationStateDelayTimer_Show &inout DefaultValue = FC_CollectionPrefabPresentationStateDelayTimer_Show())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_CollectionPrefabPresentationStateDelayTimer_Show, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignCollectionPrefabPresentationStateDelayTimer_Show_BP(const FECSEntity &inout Entity, const FC_CollectionPrefabPresentationStateDelayTimer_Show &inout DefaultValue = FC_CollectionPrefabPresentationStateDelayTimer_Show())
{
    ECSFunc_FC_CollectionPrefabPresentationStateDelayTimer_Show::AssignCollectionPrefabPresentationStateDelayTimer_Show(Entity, DefaultValue);
    return;
}
FC_CollectionPrefabPresentationStateDelayTimer_Show& ModifyCollectionPrefabPresentationStateDelayTimer_Show(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_CollectionPrefabPresentationStateDelayTimer_Show));
    return local_12.GetComp();
}
FC_CollectionPrefabPresentationStateDelayTimer_Show& ModifyOrAddCollectionPrefabPresentationStateDelayTimer_Show(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_CollectionPrefabPresentationStateDelayTimer_Show));
    return local_12.GetComp();
}
const FC_CollectionPrefabPresentationStateDelayTimer_Show& GetCollectionPrefabPresentationStateDelayTimer_Show(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_CollectionPrefabPresentationStateDelayTimer_Show));
    return local_12.GetComp();
}
UFUNCTION()
FC_CollectionPrefabPresentationStateDelayTimer_Show GetCollectionPrefabPresentationStateDelayTimer_Show_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_CollectionPrefabPresentationStateDelayTimer_Show __r;
    bValid = false;
    bValid = ECSFunc_FC_CollectionPrefabPresentationStateDelayTimer_Show::GetCollectionPrefabPresentationStateDelayTimer_Show(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_CollectionPrefabPresentationStateDelayTimer_Show GetDefaultedCollectionPrefabPresentationStateDelayTimer_Show(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_CollectionPrefabPresentationStateDelayTimer_Show __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_CollectionPrefabPresentationStateDelayTimer_Show);
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
FC_CollectionPrefabPresentationStateDelayTimer_Show GetDefaultedCollectionPrefabPresentationStateDelayTimer_Show_BP(const FECSEntity &inout Entity)
{
    FC_CollectionPrefabPresentationStateDelayTimer_Show __r;
    return __r;
}
UFUNCTION()
bool RemoveCollectionPrefabPresentationStateDelayTimer_Show(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_CollectionPrefabPresentationStateDelayTimer_Show);
}
}
FECSMonitorRuntimeView __GetMonitorCollectionPrefabPresentationStateDelayTimer_ShowOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_CollectionPrefabPresentationStateDelayTimer_Show, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCollectionPrefabPresentationStateDelayTimer_ShowOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_CollectionPrefabPresentationStateDelayTimer_Show, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCollectionPrefabPresentationStateDelayTimer_ShowOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_CollectionPrefabPresentationStateDelayTimer_Show, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCollectionPrefabPresentationStateDelayTimer_ShowOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_CollectionPrefabPresentationStateDelayTimer_Show, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCollectionPrefabPresentationStateDelayTimer_ShowOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_CollectionPrefabPresentationStateDelayTimer_Show, bFixedFrame, bMustHandleAll);
}
void __MonitorCollectionPrefabPresentationStateDelayTimer_ShowLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_CollectionPrefabPresentationStateDelayTimer_Show, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCollectionPrefabPresentationStateDelayTimer_ShowActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_CollectionPrefabPresentationStateDelayTimer_Show, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCollectionPrefabPresentationStateDelayTimer_ShowModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_CollectionPrefabPresentationStateDelayTimer_Show, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_CollectionPrefabPresentationStateDelayTimer_Normal
{
UFUNCTION()
bool HasCollectionPrefabPresentationStateDelayTimer_Normal(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_CollectionPrefabPresentationStateDelayTimer_Normal);
}
FC_CollectionPrefabPresentationStateDelayTimer_Normal& AssignCollectionPrefabPresentationStateDelayTimer_Normal(const FECSEntity &inout Entity, const FC_CollectionPrefabPresentationStateDelayTimer_Normal &inout DefaultValue = FC_CollectionPrefabPresentationStateDelayTimer_Normal())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_CollectionPrefabPresentationStateDelayTimer_Normal, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignCollectionPrefabPresentationStateDelayTimer_Normal_BP(const FECSEntity &inout Entity, const FC_CollectionPrefabPresentationStateDelayTimer_Normal &inout DefaultValue = FC_CollectionPrefabPresentationStateDelayTimer_Normal())
{
    ECSFunc_FC_CollectionPrefabPresentationStateDelayTimer_Normal::AssignCollectionPrefabPresentationStateDelayTimer_Normal(Entity, DefaultValue);
    return;
}
FC_CollectionPrefabPresentationStateDelayTimer_Normal& ModifyCollectionPrefabPresentationStateDelayTimer_Normal(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_CollectionPrefabPresentationStateDelayTimer_Normal));
    return local_12.GetComp();
}
FC_CollectionPrefabPresentationStateDelayTimer_Normal& ModifyOrAddCollectionPrefabPresentationStateDelayTimer_Normal(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_CollectionPrefabPresentationStateDelayTimer_Normal));
    return local_12.GetComp();
}
const FC_CollectionPrefabPresentationStateDelayTimer_Normal& GetCollectionPrefabPresentationStateDelayTimer_Normal(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_CollectionPrefabPresentationStateDelayTimer_Normal));
    return local_12.GetComp();
}
UFUNCTION()
FC_CollectionPrefabPresentationStateDelayTimer_Normal GetCollectionPrefabPresentationStateDelayTimer_Normal_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_CollectionPrefabPresentationStateDelayTimer_Normal __r;
    bValid = false;
    bValid = ECSFunc_FC_CollectionPrefabPresentationStateDelayTimer_Normal::GetCollectionPrefabPresentationStateDelayTimer_Normal(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_CollectionPrefabPresentationStateDelayTimer_Normal GetDefaultedCollectionPrefabPresentationStateDelayTimer_Normal(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_CollectionPrefabPresentationStateDelayTimer_Normal __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_CollectionPrefabPresentationStateDelayTimer_Normal);
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
FC_CollectionPrefabPresentationStateDelayTimer_Normal GetDefaultedCollectionPrefabPresentationStateDelayTimer_Normal_BP(const FECSEntity &inout Entity)
{
    FC_CollectionPrefabPresentationStateDelayTimer_Normal __r;
    return __r;
}
UFUNCTION()
bool RemoveCollectionPrefabPresentationStateDelayTimer_Normal(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_CollectionPrefabPresentationStateDelayTimer_Normal);
}
}
FECSMonitorRuntimeView __GetMonitorCollectionPrefabPresentationStateDelayTimer_NormalOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_CollectionPrefabPresentationStateDelayTimer_Normal, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCollectionPrefabPresentationStateDelayTimer_NormalOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_CollectionPrefabPresentationStateDelayTimer_Normal, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCollectionPrefabPresentationStateDelayTimer_NormalOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_CollectionPrefabPresentationStateDelayTimer_Normal, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCollectionPrefabPresentationStateDelayTimer_NormalOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_CollectionPrefabPresentationStateDelayTimer_Normal, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCollectionPrefabPresentationStateDelayTimer_NormalOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_CollectionPrefabPresentationStateDelayTimer_Normal, bFixedFrame, bMustHandleAll);
}
void __MonitorCollectionPrefabPresentationStateDelayTimer_NormalLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_CollectionPrefabPresentationStateDelayTimer_Normal, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCollectionPrefabPresentationStateDelayTimer_NormalActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_CollectionPrefabPresentationStateDelayTimer_Normal, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCollectionPrefabPresentationStateDelayTimer_NormalModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_CollectionPrefabPresentationStateDelayTimer_Normal, bFixedFrame, Details);
    return;
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_CollectionPrefabPresentationState &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_CollectionPrefabPresentationState &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_CollectionPrefabPresentationState &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_CollectionPrefabPresentationState
{
int __IndexOf_State()
{
    return 0;
}
}
