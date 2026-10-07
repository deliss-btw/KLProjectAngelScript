
namespace __INTENRAL_FC_SyncDitherRequests_NS
{
    const TECSComponentDerivedPtr<FC_SyncDitherRequests> DerivedPtr = TECSComponentDerivedPtr<FC_SyncDitherRequests>();
    const FC_SyncDitherRequests DefaultValue = FC_SyncDitherRequests();

}
struct FDitherRequest
{
    FSubDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    FName m_RequestName;
    UPROPERTY()
    float32 m_BlendDuration;
    UPROPERTY()
    float32 m_StartValue;
    UPROPERTY()
    float32 m_TargetValue;
    UPROPERTY()
    FFPTime m_StartTime;
    UPROPERTY()
    bool m_bIncludeAttachEntity;

    FDitherRequest()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FDitherRequest(const FDitherRequest &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FDitherRequest opAssign(const FDitherRequest &inout Other)
    {
        FDitherRequest __r;
        this.SetRequestName(Other.GetRequestName());
        this.SetBlendDuration(Other.GetBlendDuration());
        this.SetStartValue(Other.GetStartValue());
        this.SetTargetValue(Other.GetTargetValue());
        this.SetStartTime(Other.GetStartTime());
        this.SetbIncludeAttachEntity(Other.GetbIncludeAttachEntity());
        return __r;
    }
    float32 GetCurrentDitherValue(const FFPTime &inout CurrentTime) const
    {
        if (this.GetBlendDuration() <= 0.0f)
        {
            return this.GetTargetValue();
        }
        float32 local_2 = float32((CurrentTime.ToSeconds() - this.GetStartTime().ToSeconds()));
        if (local_2 >= this.GetBlendDuration())
        {
            return this.GetTargetValue();
        }
        float32 local_1 = local_2 / this.GetBlendDuration();
        return FMath::Lerp(this.GetStartValue(), this.GetTargetValue(), local_1);
    }
    FName GetRequestName() const property
    {
        return this.m_RequestName;
    }
    void SetRequestName(const FName &inout __Value) property
    {
        if ((this.m_RequestName == __Value))
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_RequestName = __Value;
        return;
    }
    float32 GetBlendDuration() const property
    {
        return this.m_BlendDuration;
    }
    void SetBlendDuration(const float32 __Value) property
    {
        if (this.m_BlendDuration == __Value)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_BlendDuration = __Value;
        return;
    }
    float32 GetStartValue() const property
    {
        return this.m_StartValue;
    }
    void SetStartValue(const float32 __Value) property
    {
        if (this.m_StartValue == __Value)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_StartValue = __Value;
        return;
    }
    float32 GetTargetValue() const property
    {
        return this.m_TargetValue;
    }
    void SetTargetValue(const float32 __Value) property
    {
        if (this.m_TargetValue == __Value)
        {
            return;
        }
        this.__MarkDirty(3);
        this.m_TargetValue = __Value;
        return;
    }
    FFPTime GetStartTime() const property
    {
        FFPTime __r;
        return __r;
    }
    FFPTime GetModify_StartTime() property
    {
        FFPTime __r;
        this.__MarkDirty(4);
        return __r;
    }
    void SetStartTime(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(4);
        this.m_StartTime = __Value;
        return;
    }
    bool GetbIncludeAttachEntity() const property
    {
        return this.m_bIncludeAttachEntity;
    }
    void SetbIncludeAttachEntity(const bool __Value) property
    {
        if (!(this.m_bIncludeAttachEntity) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(5);
        this.m_bIncludeAttachEntity = __Value;
        return;
    }
}

struct FC_SyncDitherRequests : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    TArray<FDitherRequest> m_Requests;

    FC_SyncDitherRequests()
    {
        this.__InitDirtyFlags();
        return;
    }
    FC_SyncDitherRequests(const FC_SyncDitherRequests &inout Other)
    {
        this.__InitDirtyFlags();
        this.m_Requests = Other.m_Requests;
        return;
    }
    FC_SyncDitherRequests opAssign(const FC_SyncDitherRequests &inout Other)
    {
        FC_SyncDitherRequests __r;
        this.SetRequests(Other.GetRequests());
        return __r;
    }
    float32 GetCurrentDitherValue(const FFPTime &inout CurrentTime) const
    {
        if (this.GetRequests().Num() == 0)
        {
            return 0.0f;
        }
        float32 local_5 = 0.0f;
        for (auto& local_20 : this.GetRequests())
        {
            local_5 = FMath::Max(local_5, local_20.GetCurrentDitherValue(CurrentTime));
        }
        return local_5;
    }
    float32 GetCurrentAttachEntityDitherValue(const FFPTime &inout CurrentTime) const
    {
        float32 local_1 = 0.0f;
        for (auto& local_18 : this.GetRequests())
        {
            if (local_18.GetbIncludeAttachEntity())
            {
                local_1 = FMath::Max(local_1, local_18.GetCurrentDitherValue(CurrentTime));
            }
        }
        return local_1;
    }
    bool HasIncludeAttachEntityRequest() const
    {
        for (auto& local_16 : this.GetRequests())
        {
            if (local_16.GetbIncludeAttachEntity())
            {
                return true;
            }
        }
        return false;
    }
    int GetDitherRequestIndex(const FName &inout RequestName) const
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
        int __r; return __r;
    }
    const TArray<FDitherRequest> GetRequests() const property
    {
        const TArray<FDitherRequest> __r;
        return __r;
    }
    TArray<FDitherRequest> GetModify_Requests() property
    {
        TArray<FDitherRequest> __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetRequests(const TArray<FDitherRequest> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_Requests = __Value;
        return;
    }
}

namespace ECSFunc_FC_SyncDitherRequests
{
UFUNCTION()
bool HasSyncDitherRequests(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_SyncDitherRequests);
}
FC_SyncDitherRequests& AssignSyncDitherRequests(const FECSEntity &inout Entity, const FC_SyncDitherRequests &inout DefaultValue = FC_SyncDitherRequests())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_SyncDitherRequests, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignSyncDitherRequests_BP(const FECSEntity &inout Entity, const FC_SyncDitherRequests &inout DefaultValue = FC_SyncDitherRequests())
{
    ECSFunc_FC_SyncDitherRequests::AssignSyncDitherRequests(Entity, DefaultValue);
    return;
}
FC_SyncDitherRequests& ModifySyncDitherRequests(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_SyncDitherRequests));
    return local_12.GetComp();
}
FC_SyncDitherRequests& ModifyOrAddSyncDitherRequests(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_SyncDitherRequests));
    return local_12.GetComp();
}
const FC_SyncDitherRequests& GetSyncDitherRequests(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_SyncDitherRequests));
    return local_12.GetComp();
}
UFUNCTION()
FC_SyncDitherRequests GetSyncDitherRequests_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_SyncDitherRequests& local_4 = ECSFunc_FC_SyncDitherRequests::GetSyncDitherRequests(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_SyncDitherRequests();
}
const FC_SyncDitherRequests GetDefaultedSyncDitherRequests(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_SyncDitherRequests __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_SyncDitherRequests);
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
FC_SyncDitherRequests GetDefaultedSyncDitherRequests_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_SyncDitherRequests::GetDefaultedSyncDitherRequests(Entity);
}
UFUNCTION()
bool RemoveSyncDitherRequests(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_SyncDitherRequests);
}
}
FECSMonitorRuntimeView __GetMonitorSyncDitherRequestsOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_SyncDitherRequests, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSyncDitherRequestsOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_SyncDitherRequests, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSyncDitherRequestsOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_SyncDitherRequests, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSyncDitherRequestsOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_SyncDitherRequests, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSyncDitherRequestsOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_SyncDitherRequests, bFixedFrame, bMustHandleAll);
}
void __MonitorSyncDitherRequestsLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_SyncDitherRequests, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorSyncDitherRequestsActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_SyncDitherRequests, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorSyncDitherRequestsModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_SyncDitherRequests, bFixedFrame, Details);
    return;
}
namespace AutoDelta
{
FSubDirtyFlags8 GetDirtyFlags(FDitherRequest &inout Data)
{
    FSubDirtyFlags8 __r;
    return __r;
}
void ClearDirtyFlags(FDitherRequest &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FDitherRequest
{
int __IndexOf_RequestName()
{
    return 0;
}
int __IndexOf_BlendDuration()
{
    return 1;
}
int __IndexOf_StartValue()
{
    return 2;
}
int __IndexOf_TargetValue()
{
    return 3;
}
int __IndexOf_StartTime()
{
    return 4;
}
int __IndexOf_bIncludeAttachEntity()
{
    return 5;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_SyncDitherRequests &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_SyncDitherRequests &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_SyncDitherRequests &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_SyncDitherRequests
{
int __IndexOf_Requests()
{
    return 0;
}
}
