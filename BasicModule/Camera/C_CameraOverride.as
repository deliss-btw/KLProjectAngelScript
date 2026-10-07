
enum ECameraOverrideLayer
{
    Default,
    Ability,
    Interact,
    SubIneteract,
    FrontendSystem,
    Level,
}

namespace __INTENRAL_FC_CameraOverrides_NS
{
    const TECSComponentDerivedPtr<FC_CameraOverrides> DerivedPtr = TECSComponentDerivedPtr<FC_CameraOverrides>();
    const FC_CameraOverrides DefaultValue = FC_CameraOverrides();
}
namespace __INTENRAL_FC_CameraLookAtTargetOverride_NS
{
    const TECSComponentDerivedPtr<FC_CameraLookAtTargetOverride> DerivedPtr = TECSComponentDerivedPtr<FC_CameraLookAtTargetOverride>();
    const FC_CameraLookAtTargetOverride DefaultValue = FC_CameraLookAtTargetOverride();
}
namespace __INTENRAL_FC_SyncCameraOverride_NS
{
    const TECSComponentDerivedPtr<FC_SyncCameraOverride> DerivedPtr = TECSComponentDerivedPtr<FC_SyncCameraOverride>();
    const FC_SyncCameraOverride DefaultValue = FC_SyncCameraOverride();
}
namespace __INTENRAL_FCE_AddCameraOverrideEvent_NS
{
    const TECSEventDerivedPtr<FCE_AddCameraOverrideEvent> DerivedPtr = TECSEventDerivedPtr<FCE_AddCameraOverrideEvent>();
}
namespace __INTENRAL_FCE_RemoveCameraOverrideEvent_NS
{
    const TECSEventDerivedPtr<FCE_RemoveCameraOverrideEvent> DerivedPtr = TECSEventDerivedPtr<FCE_RemoveCameraOverrideEvent>();

}
struct FCameraOverrideParam
{
    FSubDirtyFlags16 __DirtyFlags;
    UPROPERTY()
    ECameraOverrideLayer m_Layer;
    UPROPERTY()
    FECSEntity m_LookAtTargetEntity;
    UPROPERTY()
    FVector m_LookAtTargetOffset;
    UPROPERTY()
    FName m_LookAtTargetSocketName;
    UPROPERTY()
    FDataObjectPtr m_LookAtConfig;
    UPROPERTY()
    FDataObjectPtr m_CameraState;
    UPROPERTY()
    bool m_UseOverrideCameraData;
    UPROPERTY()
    FOverrideCameraData m_OverrideCamera;

    FCameraOverrideParam()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FCameraOverrideParam(const FCameraOverrideParam &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FCameraOverrideParam opAssign(const FCameraOverrideParam &inout Other)
    {
        FCameraOverrideParam __r;
        this.SetLayer(Other.GetLayer());
        this.SetLookAtTargetEntity(Other.GetLookAtTargetEntity());
        this.SetLookAtTargetOffset(Other.GetLookAtTargetOffset());
        this.SetLookAtTargetSocketName(Other.GetLookAtTargetSocketName());
        this.SetLookAtConfig(Other.GetLookAtConfig());
        this.SetCameraState(Other.GetCameraState());
        this.SetUseOverrideCameraData(Other.GetUseOverrideCameraData());
        this.SetOverrideCamera(Other.GetOverrideCamera());
        return __r;
    }
    ECameraOverrideLayer GetLayer() const property
    {
        return this.m_Layer;
    }
    void SetLayer(const ECameraOverrideLayer __Value) property
    {
        if (int(this.m_Layer) == int(__Value))
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_Layer = __Value;
        return;
    }
    const FECSEntity GetLookAtTargetEntity() const property
    {
        const FECSEntity __r;
        return __r;
    }
    FECSEntity GetModify_LookAtTargetEntity() property
    {
        FECSEntity __r;
        this.__MarkDirty(1);
        return __r;
    }
    void SetLookAtTargetEntity(const FECSEntity &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_LookAtTargetEntity = __Value;
        return;
    }
    const FVector GetLookAtTargetOffset() const property
    {
        const FVector __r;
        return __r;
    }
    FVector GetModify_LookAtTargetOffset() property
    {
        FVector __r;
        this.__MarkDirty(2);
        return __r;
    }
    void SetLookAtTargetOffset(const FVector &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_LookAtTargetOffset = __Value;
        return;
    }
    FName GetLookAtTargetSocketName() const property
    {
        return this.m_LookAtTargetSocketName;
    }
    void SetLookAtTargetSocketName(const FName &inout __Value) property
    {
        if ((this.m_LookAtTargetSocketName == __Value))
        {
            return;
        }
        this.__MarkDirty(3);
        this.m_LookAtTargetSocketName = __Value;
        return;
    }
    const FDataObjectPtr GetLookAtConfig() const property
    {
        const FDataObjectPtr __r;
        return __r;
    }
    FDataObjectPtr GetModify_LookAtConfig() property
    {
        FDataObjectPtr __r;
        this.__MarkDirty(4);
        return __r;
    }
    void SetLookAtConfig(const FDataObjectPtr &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(4);
        this.m_LookAtConfig = __Value;
        return;
    }
    const FDataObjectPtr GetCameraState() const property
    {
        const FDataObjectPtr __r;
        return __r;
    }
    FDataObjectPtr GetModify_CameraState() property
    {
        FDataObjectPtr __r;
        this.__MarkDirty(5);
        return __r;
    }
    void SetCameraState(const FDataObjectPtr &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(5);
        this.m_CameraState = __Value;
        return;
    }
    bool GetUseOverrideCameraData() const property
    {
        return this.m_UseOverrideCameraData;
    }
    void SetUseOverrideCameraData(const bool __Value) property
    {
        if (!(this.m_UseOverrideCameraData) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(6);
        this.m_UseOverrideCameraData = __Value;
        return;
    }
    const FOverrideCameraData GetOverrideCamera() const property
    {
        const FOverrideCameraData __r;
        return __r;
    }
    FOverrideCameraData GetOverrideCamera() property
    {
        FOverrideCameraData __r;
        return __r;
    }
    void SetOverrideCamera(const FOverrideCameraData &inout __Value) property
    {
        this.m_OverrideCamera = __Value;
        return;
    }
}

struct FC_CameraOverrides : FECSComponent
{
    UPROPERTY()
    TArray<int> CameraOverridesIndex;
    UPROPERTY()
    TArray<FCameraOverrideParam> LocalCameraOverrides;
    UPROPERTY()
    TArray<FCameraOverrideParam> SyncCameraOverrides;
    UPROPERTY()
    int CurrentActiveIndex;

    FC_CameraOverrides()
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    int GetCameraOverrideLayerIndex(const ECameraOverrideLayer Layer, const TArray<FCameraOverrideParam> &inout InCameraOverrides)
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
        int __r; return __r;
    }
    const FCameraOverrideParam GetCameraOverrideParam(const int Index) const
    {
        const FCameraOverrideParam __r;
        int local_1 = this[Index];
        if (local_1 < 0)
        {
        }
        else
        {
            int local_2 = this.LocalCameraOverrides.Num() + this.SyncCameraOverrides.Num();
        }
        if (local_1 < this.LocalCameraOverrides.Num())
        {
        }
        else
        {
            int local_2_2 = local_1 - this.LocalCameraOverrides.Num();
        }
        return __r;
    }
    void SetSyncCameraOverrides(const TArray<FCameraOverrideParam> &inout InSyncCameraOverrides)
    {
        this.SyncCameraOverrides = InSyncCameraOverrides;
        this.MergeCameraOverrides();
        return;
    }
    void MergeCameraOverrides()
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
}

struct FC_CameraLookAtTargetOverride : FECSComponent
{
    UPROPERTY()
    FECSEntity TargetEntity;
    UPROPERTY()
    FVector Offset;
    UPROPERTY()
    FName SocketName;
    UPROPERTY()
    FDataObjectPtr LookAtConfig;

    FC_CameraLookAtTargetOverride()
    {
        return;
    }
}

struct FCE_AddCameraOverrideEvent : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FCameraOverrideParam CameraOverrideParam;

    FCE_AddCameraOverrideEvent()
    {
        return;
    }
}

struct FCE_RemoveCameraOverrideEvent : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    ECameraOverrideLayer Layer;


}

struct FC_SyncCameraOverride : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    TArray<FCameraOverrideParam> m_CameraOverrideParams;

    FC_SyncCameraOverride()
    {
        this.__InitDirtyFlags();
        return;
    }
    FC_SyncCameraOverride(const FC_SyncCameraOverride &inout Other)
    {
        this.__InitDirtyFlags();
        this.m_CameraOverrideParams = Other.m_CameraOverrideParams;
        return;
    }
    FC_SyncCameraOverride opAssign(const FC_SyncCameraOverride &inout Other)
    {
        FC_SyncCameraOverride __r;
        this.SetCameraOverrideParams(Other.GetCameraOverrideParams());
        return __r;
    }
    FCameraOverrideParam ModifyOrAddCameraOverrideParam(const ECameraOverrideLayer Layer)
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
        FCameraOverrideParam __r; return __r;
    }
    void RemoveCameraOverrideParam(const ECameraOverrideLayer Layer)
    {
        int local_1 = 0;
        for (; local_1 < this.GetCameraOverrideParams().Num(); ++local_1)
        {
            if ((int(this.GetCameraOverrideParams()[local_1].GetLayer())) == (int(Layer)))
            {
                this.GetModify_CameraOverrideParams().RemoveAt(local_1);
                break;
            }
        }
        return;
    }
    const TArray<FCameraOverrideParam> GetCameraOverrideParams() const property
    {
        const TArray<FCameraOverrideParam> __r;
        return __r;
    }
    TArray<FCameraOverrideParam> GetModify_CameraOverrideParams() property
    {
        TArray<FCameraOverrideParam> __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetCameraOverrideParams(const TArray<FCameraOverrideParam> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_CameraOverrideParams = __Value;
        return;
    }
}

namespace ECSFunc_FC_CameraOverrides
{
UFUNCTION()
bool HasCameraOverrides(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_CameraOverrides);
}
FC_CameraOverrides& AssignCameraOverrides(const FECSEntity &inout Entity, const FC_CameraOverrides &inout DefaultValue = FC_CameraOverrides())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_CameraOverrides, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignCameraOverrides_BP(const FECSEntity &inout Entity, const FC_CameraOverrides &inout DefaultValue = FC_CameraOverrides())
{
    ECSFunc_FC_CameraOverrides::AssignCameraOverrides(Entity, DefaultValue);
    return;
}
FC_CameraOverrides& ModifyCameraOverrides(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_CameraOverrides));
    return local_12.GetComp();
}
FC_CameraOverrides& ModifyOrAddCameraOverrides(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_CameraOverrides));
    return local_12.GetComp();
}
const FC_CameraOverrides& GetCameraOverrides(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_CameraOverrides));
    return local_12.GetComp();
}
UFUNCTION()
FC_CameraOverrides GetCameraOverrides_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_CameraOverrides __r;
    bValid = false;
    bValid = ECSFunc_FC_CameraOverrides::GetCameraOverrides(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_CameraOverrides GetDefaultedCameraOverrides(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_CameraOverrides __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_CameraOverrides);
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
FC_CameraOverrides GetDefaultedCameraOverrides_BP(const FECSEntity &inout Entity)
{
    FC_CameraOverrides __r;
    return __r;
}
UFUNCTION()
bool RemoveCameraOverrides(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_CameraOverrides);
}
}
FECSMonitorRuntimeView __GetMonitorCameraOverridesOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_CameraOverrides, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCameraOverridesOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_CameraOverrides, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCameraOverridesOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_CameraOverrides, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCameraOverridesOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_CameraOverrides, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCameraOverridesOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_CameraOverrides, bFixedFrame, bMustHandleAll);
}
void __MonitorCameraOverridesLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_CameraOverrides, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCameraOverridesActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_CameraOverrides, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCameraOverridesModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_CameraOverrides, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_CameraLookAtTargetOverride
{
UFUNCTION()
bool HasCameraLookAtTargetOverride(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_CameraLookAtTargetOverride);
}
FC_CameraLookAtTargetOverride& AssignCameraLookAtTargetOverride(const FECSEntity &inout Entity, const FC_CameraLookAtTargetOverride &inout DefaultValue = FC_CameraLookAtTargetOverride())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_CameraLookAtTargetOverride, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignCameraLookAtTargetOverride_BP(const FECSEntity &inout Entity, const FC_CameraLookAtTargetOverride &inout DefaultValue = FC_CameraLookAtTargetOverride())
{
    ECSFunc_FC_CameraLookAtTargetOverride::AssignCameraLookAtTargetOverride(Entity, DefaultValue);
    return;
}
FC_CameraLookAtTargetOverride& ModifyCameraLookAtTargetOverride(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_CameraLookAtTargetOverride));
    return local_12.GetComp();
}
FC_CameraLookAtTargetOverride& ModifyOrAddCameraLookAtTargetOverride(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_CameraLookAtTargetOverride));
    return local_12.GetComp();
}
const FC_CameraLookAtTargetOverride& GetCameraLookAtTargetOverride(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_CameraLookAtTargetOverride));
    return local_12.GetComp();
}
UFUNCTION()
FC_CameraLookAtTargetOverride GetCameraLookAtTargetOverride_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_CameraLookAtTargetOverride __r;
    bValid = false;
    bValid = ECSFunc_FC_CameraLookAtTargetOverride::GetCameraLookAtTargetOverride(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_CameraLookAtTargetOverride GetDefaultedCameraLookAtTargetOverride(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_CameraLookAtTargetOverride __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_CameraLookAtTargetOverride);
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
FC_CameraLookAtTargetOverride GetDefaultedCameraLookAtTargetOverride_BP(const FECSEntity &inout Entity)
{
    FC_CameraLookAtTargetOverride __r;
    return __r;
}
UFUNCTION()
bool RemoveCameraLookAtTargetOverride(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_CameraLookAtTargetOverride);
}
}
FECSMonitorRuntimeView __GetMonitorCameraLookAtTargetOverrideOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_CameraLookAtTargetOverride, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCameraLookAtTargetOverrideOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_CameraLookAtTargetOverride, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCameraLookAtTargetOverrideOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_CameraLookAtTargetOverride, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCameraLookAtTargetOverrideOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_CameraLookAtTargetOverride, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCameraLookAtTargetOverrideOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_CameraLookAtTargetOverride, bFixedFrame, bMustHandleAll);
}
void __MonitorCameraLookAtTargetOverrideLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_CameraLookAtTargetOverride, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCameraLookAtTargetOverrideActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_CameraLookAtTargetOverride, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCameraLookAtTargetOverrideModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_CameraLookAtTargetOverride, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_SyncCameraOverride
{
UFUNCTION()
bool HasSyncCameraOverride(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_SyncCameraOverride);
}
FC_SyncCameraOverride& AssignSyncCameraOverride(const FECSEntity &inout Entity, const FC_SyncCameraOverride &inout DefaultValue = FC_SyncCameraOverride())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_SyncCameraOverride, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignSyncCameraOverride_BP(const FECSEntity &inout Entity, const FC_SyncCameraOverride &inout DefaultValue = FC_SyncCameraOverride())
{
    ECSFunc_FC_SyncCameraOverride::AssignSyncCameraOverride(Entity, DefaultValue);
    return;
}
FC_SyncCameraOverride& ModifySyncCameraOverride(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_SyncCameraOverride));
    return local_12.GetComp();
}
FC_SyncCameraOverride& ModifyOrAddSyncCameraOverride(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_SyncCameraOverride));
    return local_12.GetComp();
}
const FC_SyncCameraOverride& GetSyncCameraOverride(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_SyncCameraOverride));
    return local_12.GetComp();
}
UFUNCTION()
FC_SyncCameraOverride GetSyncCameraOverride_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_SyncCameraOverride& local_4 = ECSFunc_FC_SyncCameraOverride::GetSyncCameraOverride(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_SyncCameraOverride();
}
const FC_SyncCameraOverride GetDefaultedSyncCameraOverride(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_SyncCameraOverride __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_SyncCameraOverride);
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
FC_SyncCameraOverride GetDefaultedSyncCameraOverride_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_SyncCameraOverride::GetDefaultedSyncCameraOverride(Entity);
}
UFUNCTION()
bool RemoveSyncCameraOverride(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_SyncCameraOverride);
}
}
FECSMonitorRuntimeView __GetMonitorSyncCameraOverrideOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_SyncCameraOverride, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSyncCameraOverrideOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_SyncCameraOverride, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSyncCameraOverrideOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_SyncCameraOverride, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSyncCameraOverrideOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_SyncCameraOverride, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSyncCameraOverrideOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_SyncCameraOverride, bFixedFrame, bMustHandleAll);
}
void __MonitorSyncCameraOverrideLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_SyncCameraOverride, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorSyncCameraOverrideActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_SyncCameraOverride, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorSyncCameraOverrideModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_SyncCameraOverride, bFixedFrame, Details);
    return;
}
namespace AutoDelta
{
FSubDirtyFlags16 GetDirtyFlags(FCameraOverrideParam &inout Data)
{
    FSubDirtyFlags16 __r;
    return __r;
}
void ClearDirtyFlags(FCameraOverrideParam &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FCameraOverrideParam
{
int __IndexOf_Layer()
{
    return 0;
}
int __IndexOf_LookAtTargetEntity()
{
    return 1;
}
int __IndexOf_LookAtTargetOffset()
{
    return 2;
}
int __IndexOf_LookAtTargetSocketName()
{
    return 3;
}
int __IndexOf_LookAtConfig()
{
    return 4;
}
int __IndexOf_CameraState()
{
    return 5;
}
int __IndexOf_UseOverrideCameraData()
{
    return 6;
}
int __IndexOf_OverrideCamera()
{
    return 7;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_SyncCameraOverride &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_SyncCameraOverride &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_SyncCameraOverride &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_SyncCameraOverride
{
int __IndexOf_CameraOverrideParams()
{
    return 0;
}
}
