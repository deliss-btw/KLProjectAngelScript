
namespace __INTENRAL_FC_CameraLockPointModify_NS
{
    const TECSComponentDerivedPtr<FC_CameraLockPointModify> DerivedPtr = TECSComponentDerivedPtr<FC_CameraLockPointModify>();
    const FC_CameraLockPointModify DefaultValue = FC_CameraLockPointModify();

}
struct FLockPointModifyConfig
{
    FSubDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    bool m_bValidConfig;
    UPROPERTY()
    float32 m_StableHeightTargetOffset;
    UPROPERTY()
    float32 m_StableHeightTargetMinMaxRatio;
    UPROPERTY()
    float32 m_LockPointHeightOffset;

    FLockPointModifyConfig()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FLockPointModifyConfig(const FLockPointModifyConfig &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FLockPointModifyConfig opAssign(const FLockPointModifyConfig &inout Other)
    {
        FLockPointModifyConfig __r;
        this.SetbValidConfig(Other.GetbValidConfig());
        this.SetStableHeightTargetOffset(Other.GetStableHeightTargetOffset());
        this.SetStableHeightTargetMinMaxRatio(Other.GetStableHeightTargetMinMaxRatio());
        this.SetLockPointHeightOffset(Other.GetLockPointHeightOffset());
        return __r;
    }
    void BlendTo(const FLockPointModifyConfig &inout Other, const float32 T)
    {
        this.SetStableHeightTargetOffset(FMath::Lerp(this.GetStableHeightTargetOffset(), Other.GetStableHeightTargetOffset(), T));
        this.SetStableHeightTargetMinMaxRatio(FMath::Lerp(this.GetStableHeightTargetMinMaxRatio(), Other.GetStableHeightTargetMinMaxRatio(), T));
        this.SetLockPointHeightOffset(FMath::Lerp(this.GetLockPointHeightOffset(), Other.GetLockPointHeightOffset(), T));
        return;
    }
    bool GetbValidConfig() const property
    {
        return this.m_bValidConfig;
    }
    void SetbValidConfig(const bool __Value) property
    {
        if (!(this.m_bValidConfig) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_bValidConfig = __Value;
        return;
    }
    float32 GetStableHeightTargetOffset() const property
    {
        return this.m_StableHeightTargetOffset;
    }
    void SetStableHeightTargetOffset(const float32 __Value) property
    {
        if (this.m_StableHeightTargetOffset == __Value)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_StableHeightTargetOffset = __Value;
        return;
    }
    float32 GetStableHeightTargetMinMaxRatio() const property
    {
        return this.m_StableHeightTargetMinMaxRatio;
    }
    void SetStableHeightTargetMinMaxRatio(const float32 __Value) property
    {
        if (this.m_StableHeightTargetMinMaxRatio == __Value)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_StableHeightTargetMinMaxRatio = __Value;
        return;
    }
    float32 GetLockPointHeightOffset() const property
    {
        return this.m_LockPointHeightOffset;
    }
    void SetLockPointHeightOffset(const float32 __Value) property
    {
        if (this.m_LockPointHeightOffset == __Value)
        {
            return;
        }
        this.__MarkDirty(3);
        this.m_LockPointHeightOffset = __Value;
        return;
    }
}

struct FCameraLookPointModify
{
    FSubDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    int m_LockPointIndex;
    UPROPERTY()
    FName m_SourceKey;
    UPROPERTY()
    FLockPointModifyConfig m_ModifyConfig;

    FCameraLookPointModify()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FCameraLookPointModify(const FCameraLookPointModify &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FCameraLookPointModify opAssign(const FCameraLookPointModify &inout Other)
    {
        FCameraLookPointModify __r;
        this.SetLockPointIndex(Other.GetLockPointIndex());
        this.SetSourceKey(Other.GetSourceKey());
        this.SetModifyConfig(Other.GetModifyConfig());
        return __r;
    }
    int GetLockPointIndex() const property
    {
        return this.m_LockPointIndex;
    }
    void SetLockPointIndex(const int __Value) property
    {
        if (this.m_LockPointIndex == __Value)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_LockPointIndex = __Value;
        return;
    }
    FName GetSourceKey() const property
    {
        return this.m_SourceKey;
    }
    void SetSourceKey(const FName &inout __Value) property
    {
        if ((this.m_SourceKey == __Value))
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_SourceKey = __Value;
        return;
    }
    const FLockPointModifyConfig GetModifyConfig() const property
    {
        const FLockPointModifyConfig __r;
        return __r;
    }
    FLockPointModifyConfig GetModifyConfig() property
    {
        FLockPointModifyConfig __r;
        return __r;
    }
    void SetModifyConfig(const FLockPointModifyConfig &inout __Value) property
    {
        this.m_ModifyConfig = __Value;
        return;
    }
}

struct FC_CameraLockPointModify : FECSComponent
{
    UPROPERTY()
    TArray<FCameraLookPointModify> ModifyItem;

    FC_CameraLockPointModify()
    {
        return;
    }
    FLockPointModifyConfig GetModifyItem(const int LockPointId) const
    {
        int local_1 = 0;
        for (; local_1 < this.Num(); ++local_1)
        {
            if (this[local_1].GetLockPointIndex() == LockPointId)
            {
                return this[local_1].GetModifyConfig();
            }
        }
        FLockPointModifyConfig local_10;
        local_10.SetbValidConfig(false);
        return local_10;
    }
    void AddOrUpdateModifyItem(const FName &inout SourceKey, const int LockPointId, const FLockPointModifyConfig &inout ModifyConfig)
    {
        FCameraLookPointModify local_10;
        local_10.SetSourceKey(SourceKey);
        local_10.SetLockPointIndex(LockPointId);
        local_10.SetModifyConfig(ModifyConfig);
        int local_11 = 0;
        for (; local_11 < this.Num(); ++local_11)
        {
            if ((this[local_11].GetSourceKey() == SourceKey))
            {
                this[local_11] = local_10;
                return;
            }
        }
        this.Add(local_10);
        return;
    }
    void RemoveModifyItem(const FName &inout SourceKey)
    {
        int local_1 = 0;
        for (; local_1 < this.Num(); ++local_1)
        {
            if ((this[local_1].GetSourceKey() == SourceKey))
            {
                this.RemoveAt(local_1);
                break;
            }
        }
        return;
    }
}

namespace ECSFunc_FC_CameraLockPointModify
{
UFUNCTION()
bool HasCameraLockPointModify(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_CameraLockPointModify);
}
FC_CameraLockPointModify& AssignCameraLockPointModify(const FECSEntity &inout Entity, const FC_CameraLockPointModify &inout DefaultValue = FC_CameraLockPointModify())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_CameraLockPointModify, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignCameraLockPointModify_BP(const FECSEntity &inout Entity, const FC_CameraLockPointModify &inout DefaultValue = FC_CameraLockPointModify())
{
    ECSFunc_FC_CameraLockPointModify::AssignCameraLockPointModify(Entity, DefaultValue);
    return;
}
FC_CameraLockPointModify& ModifyCameraLockPointModify(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_CameraLockPointModify));
    return local_12.GetComp();
}
FC_CameraLockPointModify& ModifyOrAddCameraLockPointModify(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_CameraLockPointModify));
    return local_12.GetComp();
}
const FC_CameraLockPointModify& GetCameraLockPointModify(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_CameraLockPointModify));
    return local_12.GetComp();
}
UFUNCTION()
FC_CameraLockPointModify GetCameraLockPointModify_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_CameraLockPointModify __r;
    bValid = false;
    bValid = ECSFunc_FC_CameraLockPointModify::GetCameraLockPointModify(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_CameraLockPointModify GetDefaultedCameraLockPointModify(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_CameraLockPointModify __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_CameraLockPointModify);
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
FC_CameraLockPointModify GetDefaultedCameraLockPointModify_BP(const FECSEntity &inout Entity)
{
    FC_CameraLockPointModify __r;
    return __r;
}
UFUNCTION()
bool RemoveCameraLockPointModify(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_CameraLockPointModify);
}
}
FECSMonitorRuntimeView __GetMonitorCameraLockPointModifyOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_CameraLockPointModify, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCameraLockPointModifyOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_CameraLockPointModify, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCameraLockPointModifyOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_CameraLockPointModify, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCameraLockPointModifyOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_CameraLockPointModify, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCameraLockPointModifyOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_CameraLockPointModify, bFixedFrame, bMustHandleAll);
}
void __MonitorCameraLockPointModifyLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_CameraLockPointModify, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCameraLockPointModifyActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_CameraLockPointModify, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCameraLockPointModifyModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_CameraLockPointModify, bFixedFrame, Details);
    return;
}
namespace AutoDelta
{
FSubDirtyFlags8 GetDirtyFlags(FLockPointModifyConfig &inout Data)
{
    FSubDirtyFlags8 __r;
    return __r;
}
void ClearDirtyFlags(FLockPointModifyConfig &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FLockPointModifyConfig
{
int __IndexOf_bValidConfig()
{
    return 0;
}
int __IndexOf_StableHeightTargetOffset()
{
    return 1;
}
int __IndexOf_StableHeightTargetMinMaxRatio()
{
    return 2;
}
int __IndexOf_LockPointHeightOffset()
{
    return 3;
}
}
namespace AutoDelta
{
FSubDirtyFlags8 GetDirtyFlags(FCameraLookPointModify &inout Data)
{
    FSubDirtyFlags8 __r;
    return __r;
}
void ClearDirtyFlags(FCameraLookPointModify &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FCameraLookPointModify
{
int __IndexOf_LockPointIndex()
{
    return 0;
}
int __IndexOf_SourceKey()
{
    return 1;
}
int __IndexOf_ModifyConfig()
{
    return 2;
}
}
