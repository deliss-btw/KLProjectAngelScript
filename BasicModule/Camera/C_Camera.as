
enum ECameraAdditionalInputModifierCategory
{
    Level0,
    NATIVE_MAX = 0,
    Level1,
    Level2,
}

namespace __INTENRAL_FC_CameraAdditionalInput_NS
{
    const TECSComponentDerivedPtr<FC_CameraAdditionalInput> DerivedPtr = TECSComponentDerivedPtr<FC_CameraAdditionalInput>();
    const FC_CameraAdditionalInput DefaultValue = FC_CameraAdditionalInput();
}
namespace __INTENRAL_FC_CameraShakeIDCache_NS
{
    const TECSComponentDerivedPtr<FC_CameraShakeIDCache> DerivedPtr = TECSComponentDerivedPtr<FC_CameraShakeIDCache>();
    const FC_CameraShakeIDCache DefaultValue = FC_CameraShakeIDCache();
}
namespace __INTENRAL_FCS_CameraAdditionalInputCVarState_NS
{
    const TECSComponentDerivedPtr<FCS_CameraAdditionalInputCVarState> DerivedPtr = TECSComponentDerivedPtr<FCS_CameraAdditionalInputCVarState>();
    const FCS_CameraAdditionalInputCVarState DefaultValue = FCS_CameraAdditionalInputCVarState();
}
namespace __INTENRAL_FCE_CameraFreezeAndLookAtFollowTarget_NS
{
    const TECSEventDerivedPtr<FCE_CameraFreezeAndLookAtFollowTarget> DerivedPtr = TECSEventDerivedPtr<FCE_CameraFreezeAndLookAtFollowTarget>();
}
namespace __INTENRAL_FCE_CameraUnFreezeAndLookAtFollowTarget_NS
{
    const TECSEventDerivedPtr<FCE_CameraUnFreezeAndLookAtFollowTarget> DerivedPtr = TECSEventDerivedPtr<FCE_CameraUnFreezeAndLookAtFollowTarget>();
}
namespace __INTENRAL_FCE_SetAdditionalInputModifierIndexNotify_NS
{
    const TECSEventDerivedPtr<FCE_SetAdditionalInputModifierIndexNotify> DerivedPtr = TECSEventDerivedPtr<FCE_SetAdditionalInputModifierIndexNotify>();

}
struct FC_CameraAdditionalInput : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    ECameraAdditionalInputModifierCategory m_ModifierCategory;
    UPROPERTY()
    int m_ModifierIndex;
    UPROPERTY()
    int m_DesiredModifierIndex;

    FC_CameraAdditionalInput()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_CameraAdditionalInput(const FC_CameraAdditionalInput &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_CameraAdditionalInput opAssign(const FC_CameraAdditionalInput &inout Other)
    {
        FC_CameraAdditionalInput __r;
        this.SetModifierCategory(Other.GetModifierCategory());
        this.SetModifierIndex(Other.GetModifierIndex());
        this.SetDesiredModifierIndex(Other.GetDesiredModifierIndex());
        return __r;
    }
    ECameraAdditionalInputModifierCategory GetModifierCategory() const property
    {
        return this.m_ModifierCategory;
    }
    void SetModifierCategory(const ECameraAdditionalInputModifierCategory __Value) property
    {
        if (int(this.m_ModifierCategory) == int(__Value))
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_ModifierCategory = __Value;
        return;
    }
    int GetModifierIndex() const property
    {
        return this.m_ModifierIndex;
    }
    void SetModifierIndex(const int __Value) property
    {
        if (this.m_ModifierIndex == __Value)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_ModifierIndex = __Value;
        return;
    }
    int GetDesiredModifierIndex() const property
    {
        return this.m_DesiredModifierIndex;
    }
    void SetDesiredModifierIndex(const int __Value) property
    {
        if (this.m_DesiredModifierIndex == __Value)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_DesiredModifierIndex = __Value;
        return;
    }
}

struct FC_CameraShakeIDCache : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    int m_IDCache;

    FC_CameraShakeIDCache()
    {
        this.m_IDCache = 0;
        this.__InitDirtyFlags();
        return;
    }
    FC_CameraShakeIDCache(const FC_CameraShakeIDCache &inout Other)
    {
        this.m_IDCache = 0;
        this.__InitDirtyFlags();
        this.m_IDCache = int(Other.m_IDCache);
        return;
    }
    FC_CameraShakeIDCache opAssign(const FC_CameraShakeIDCache &inout Other)
    {
        FC_CameraShakeIDCache __r;
        this.SetIDCache(Other.GetIDCache());
        return __r;
    }
    int GetIDCache() const property
    {
        return this.m_IDCache;
    }
    void SetIDCache(const int __Value) property
    {
        if (this.m_IDCache == __Value)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_IDCache = __Value;
        return;
    }
}

struct FCE_CameraFreezeAndLookAtFollowTarget : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FName LookAtSocketName;
    UPROPERTY()
    FVector LookAtSocketOffset;
    UPROPERTY()
    TDataObjectPtr<FCameraLookAtTargetConfig> LookAtConfig;

    FCE_CameraFreezeAndLookAtFollowTarget()
    {
        return;
    }
}

struct FCE_CameraUnFreezeAndLookAtFollowTarget : FECSEvent
{
    FECSEvent _base_FECSEvent;

    FCE_CameraUnFreezeAndLookAtFollowTarget()
    {
        return;
    }
}

struct FCE_SetAdditionalInputModifierIndexNotify : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    int DesiredIndex;


    bool Validate() const
    {
        return true;
    }
}

struct FCS_CameraAdditionalInputCVarState : FECSSingleton
{
    UPROPERTY()
    int LastSentModifierIndex = 0;


}

namespace ECSFunc_FC_CameraAdditionalInput
{
UFUNCTION()
bool HasCameraAdditionalInput(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_CameraAdditionalInput);
}
FC_CameraAdditionalInput& AssignCameraAdditionalInput(const FECSEntity &inout Entity, const FC_CameraAdditionalInput &inout DefaultValue = FC_CameraAdditionalInput())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_CameraAdditionalInput, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignCameraAdditionalInput_BP(const FECSEntity &inout Entity, const FC_CameraAdditionalInput &inout DefaultValue = FC_CameraAdditionalInput())
{
    ECSFunc_FC_CameraAdditionalInput::AssignCameraAdditionalInput(Entity, DefaultValue);
    return;
}
FC_CameraAdditionalInput& ModifyCameraAdditionalInput(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_CameraAdditionalInput));
    return local_12.GetComp();
}
FC_CameraAdditionalInput& ModifyOrAddCameraAdditionalInput(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_CameraAdditionalInput));
    return local_12.GetComp();
}
const FC_CameraAdditionalInput& GetCameraAdditionalInput(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_CameraAdditionalInput));
    return local_12.GetComp();
}
UFUNCTION()
FC_CameraAdditionalInput GetCameraAdditionalInput_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_CameraAdditionalInput& local_4 = ECSFunc_FC_CameraAdditionalInput::GetCameraAdditionalInput(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_CameraAdditionalInput();
}
const FC_CameraAdditionalInput GetDefaultedCameraAdditionalInput(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_CameraAdditionalInput __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_CameraAdditionalInput);
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
FC_CameraAdditionalInput GetDefaultedCameraAdditionalInput_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_CameraAdditionalInput::GetDefaultedCameraAdditionalInput(Entity);
}
UFUNCTION()
bool RemoveCameraAdditionalInput(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_CameraAdditionalInput);
}
}
FECSMonitorRuntimeView __GetMonitorCameraAdditionalInputOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_CameraAdditionalInput, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCameraAdditionalInputOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_CameraAdditionalInput, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCameraAdditionalInputOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_CameraAdditionalInput, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCameraAdditionalInputOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_CameraAdditionalInput, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCameraAdditionalInputOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_CameraAdditionalInput, bFixedFrame, bMustHandleAll);
}
void __MonitorCameraAdditionalInputLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_CameraAdditionalInput, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCameraAdditionalInputActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_CameraAdditionalInput, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCameraAdditionalInputModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_CameraAdditionalInput, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_CameraShakeIDCache
{
UFUNCTION()
bool HasCameraShakeIDCache(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_CameraShakeIDCache);
}
FC_CameraShakeIDCache& AssignCameraShakeIDCache(const FECSEntity &inout Entity, const FC_CameraShakeIDCache &inout DefaultValue = FC_CameraShakeIDCache())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_CameraShakeIDCache, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignCameraShakeIDCache_BP(const FECSEntity &inout Entity, const FC_CameraShakeIDCache &inout DefaultValue = FC_CameraShakeIDCache())
{
    ECSFunc_FC_CameraShakeIDCache::AssignCameraShakeIDCache(Entity, DefaultValue);
    return;
}
FC_CameraShakeIDCache& ModifyCameraShakeIDCache(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_CameraShakeIDCache));
    return local_12.GetComp();
}
FC_CameraShakeIDCache& ModifyOrAddCameraShakeIDCache(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_CameraShakeIDCache));
    return local_12.GetComp();
}
const FC_CameraShakeIDCache& GetCameraShakeIDCache(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_CameraShakeIDCache));
    return local_12.GetComp();
}
UFUNCTION()
FC_CameraShakeIDCache GetCameraShakeIDCache_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_CameraShakeIDCache& local_4 = ECSFunc_FC_CameraShakeIDCache::GetCameraShakeIDCache(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_CameraShakeIDCache();
}
const FC_CameraShakeIDCache GetDefaultedCameraShakeIDCache(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_CameraShakeIDCache __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_CameraShakeIDCache);
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
FC_CameraShakeIDCache GetDefaultedCameraShakeIDCache_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_CameraShakeIDCache::GetDefaultedCameraShakeIDCache(Entity);
}
UFUNCTION()
bool RemoveCameraShakeIDCache(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_CameraShakeIDCache);
}
}
FECSMonitorRuntimeView __GetMonitorCameraShakeIDCacheOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_CameraShakeIDCache, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCameraShakeIDCacheOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_CameraShakeIDCache, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCameraShakeIDCacheOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_CameraShakeIDCache, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCameraShakeIDCacheOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_CameraShakeIDCache, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCameraShakeIDCacheOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_CameraShakeIDCache, bFixedFrame, bMustHandleAll);
}
void __MonitorCameraShakeIDCacheLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_CameraShakeIDCache, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCameraShakeIDCacheActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_CameraShakeIDCache, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCameraShakeIDCacheModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_CameraShakeIDCache, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FCS_CameraAdditionalInputCVarState
{
UFUNCTION()
bool HasCameraAdditionalInputCVarState(const FECSWorldPtr &inout World)
{
    return ECSInternal::Has(World, ENTITY_ID_NULL, FCS_CameraAdditionalInputCVarState);
}
FCS_CameraAdditionalInputCVarState& AssignCameraAdditionalInputCVarState(const FECSWorldPtr &inout World, const FCS_CameraAdditionalInputCVarState &inout DefaultValue = FCS_CameraAdditionalInputCVarState())
{
    UScriptStruct local_6 = FCS_CameraAdditionalInputCVarState;
    FECSComponentPtr local_8;
    int local_10 = local_8 = ECSInternal::Assign(World, ENTITY_ID_NULL, local_6, FECSComponentPtr(DefaultValue));
    local_10.InternalSet(local_8);
    return local_10.GetComp();
}
UFUNCTION()
void AssignCameraAdditionalInputCVarState_BP(const FECSWorldPtr &inout World, const FCS_CameraAdditionalInputCVarState &inout DefaultValue = FCS_CameraAdditionalInputCVarState())
{
    ECSFunc_FCS_CameraAdditionalInputCVarState::AssignCameraAdditionalInputCVarState(World, DefaultValue);
    return;
}
FCS_CameraAdditionalInputCVarState& ModifyCameraAdditionalInputCVarState(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_CameraAdditionalInputCVarState;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Modify(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
FCS_CameraAdditionalInputCVarState& ModifyOrAddCameraAdditionalInputCVarState(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_CameraAdditionalInputCVarState;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::ModifyOrAdd(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
const FCS_CameraAdditionalInputCVarState& GetCameraAdditionalInputCVarState(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_CameraAdditionalInputCVarState;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Get(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
UFUNCTION()
FCS_CameraAdditionalInputCVarState GetCameraAdditionalInputCVarState_BP(const FECSWorldPtr &inout World, bool &out bValid)
{
    bValid = false;
    const FCS_CameraAdditionalInputCVarState& local_4 = ECSFunc_FCS_CameraAdditionalInputCVarState::GetCameraAdditionalInputCVarState(World);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FCS_CameraAdditionalInputCVarState();
}
const FCS_CameraAdditionalInputCVarState GetDefaultedCameraAdditionalInputCVarState(const FECSWorldPtr &inout World)
{
    int local_10 = 0;
    const FCS_CameraAdditionalInputCVarState __r;
    FECSComponentPtr local_6 = ECSInternal::GetDefaulted(World, ENTITY_ID_NULL, FCS_CameraAdditionalInputCVarState);
    if ((local_6 == nullptr))
    {
    }
    else
    {
        local_10.InternalSet(local_6);
        return local_10.GetComp();
    }
    return __r;
}
UFUNCTION()
FCS_CameraAdditionalInputCVarState GetDefaultedCameraAdditionalInputCVarState_BP(const FECSWorldPtr &inout World)
{
    return ECSFunc_FCS_CameraAdditionalInputCVarState::GetDefaultedCameraAdditionalInputCVarState(World);
}
UFUNCTION()
bool RemoveCameraAdditionalInputCVarState(const FECSWorldPtr &inout World)
{
    return ECSInternal::Remove(World, ENTITY_ID_NULL, FCS_CameraAdditionalInputCVarState);
}
}
void __MonitorCameraAdditionalInputCVarStateLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FCS_CameraAdditionalInputCVarState, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCameraAdditionalInputCVarStateActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FCS_CameraAdditionalInputCVarState, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCameraAdditionalInputCVarStateModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FCS_CameraAdditionalInputCVarState, bFixedFrame, Details);
    return;
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_CameraAdditionalInput &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_CameraAdditionalInput &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_CameraAdditionalInput &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_CameraAdditionalInput
{
int __IndexOf_ModifierCategory()
{
    return 0;
}
int __IndexOf_ModifierIndex()
{
    return 1;
}
int __IndexOf_DesiredModifierIndex()
{
    return 2;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_CameraShakeIDCache &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_CameraShakeIDCache &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_CameraShakeIDCache &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_CameraShakeIDCache
{
int __IndexOf_IDCache()
{
    return 0;
}
}
