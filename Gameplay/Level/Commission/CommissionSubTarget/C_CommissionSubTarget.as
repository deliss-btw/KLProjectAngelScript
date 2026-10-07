
enum ECommissionSubTargetStatus
{
    Pending,
    Success,
    Failed,
}

namespace __INTENRAL_FCS_CommissionSubTarget_NS
{
    const TECSComponentDerivedPtr<FCS_CommissionSubTarget> DerivedPtr = TECSComponentDerivedPtr<FCS_CommissionSubTarget>();
    const FCS_CommissionSubTarget DefaultValue = FCS_CommissionSubTarget();
}
namespace __INTENRAL_FCE_CommissionSubTargetFinished_NS
{
    const TECSEventDerivedPtr<FCE_CommissionSubTargetFinished> DerivedPtr = TECSEventDerivedPtr<FCE_CommissionSubTargetFinished>();

}
struct FCommissionSubTargetProgress
{
    UPROPERTY()
    int m_SuccessProgressValue;
    UPROPERTY()
    int m_FailedProgressValue;


    int GetSuccessProgressValue() const property
    {
        return this.m_SuccessProgressValue;
    }
    void SetSuccessProgressValue(const int __Value) property
    {
        this.m_SuccessProgressValue = __Value;
        return;
    }
    int GetFailedProgressValue() const property
    {
        return this.m_FailedProgressValue;
    }
    void SetFailedProgressValue(const int __Value) property
    {
        this.m_FailedProgressValue = __Value;
        return;
    }
}

struct FCE_CommissionSubTargetFinished : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    ECommissionSubTargetStatus Status;


}

struct FCS_CommissionSubTarget : FECSSingleton
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    TDataObjectPtr<FObjectiveConfig> m_SubTargetConfig;
    UPROPERTY()
    ECommissionSubTargetStatus m_Status;
    UPROPERTY()
    uint m_ObjectiveInstanceId;
    UPROPERTY()
    FCommissionSubTargetProgress m_Progress;
    UPROPERTY()
    TMap<uint, FCommissionSubTargetProgress> m_ChildProgress;

    FCS_CommissionSubTarget()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FCS_CommissionSubTarget(const FCS_CommissionSubTarget &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FCS_CommissionSubTarget opAssign(const FCS_CommissionSubTarget &inout Other)
    {
        FCS_CommissionSubTarget __r;
        this.SetSubTargetConfig(Other.GetSubTargetConfig());
        this.SetStatus(Other.GetStatus());
        this.SetObjectiveInstanceId(Other.GetObjectiveInstanceId());
        this.SetProgress(Other.GetProgress());
        this.SetChildProgress(Other.GetChildProgress());
        return __r;
    }
    void SetSubTargetStatus(const ECommissionSubTargetStatus InStatus)
    {
        this.SetStatus(ECommissionSubTargetStatus(InStatus));
        if (int(InStatus) != 0)
        {
            FFPTime local_12 = FFPTime(-1);
            FECSWorldPtr local_6 = ECS::GetECSWorld();
            SendEvent local_10;
            local_10.opCall(ENTITY_NULL, local_12).Status = InStatus;
            ::ObjectiveUtils::DeactivateObjectives(this.GetObjectiveInstanceId());
        }
        return;
    }
    TDataObjectPtr<FObjectiveConfig> GetSubTargetConfig() const property
    {
        TDataObjectPtr<FObjectiveConfig> __r;
        return __r;
    }
    TDataObjectPtr<FObjectiveConfig> GetModify_SubTargetConfig() property
    {
        TDataObjectPtr<FObjectiveConfig> __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetSubTargetConfig(const TDataObjectPtr<FObjectiveConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_SubTargetConfig = __Value;
        return;
    }
    ECommissionSubTargetStatus GetStatus() const property
    {
        return this.m_Status;
    }
    void SetStatus(const ECommissionSubTargetStatus __Value) property
    {
        if (int(this.m_Status) == int(__Value))
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_Status = __Value;
        return;
    }
    uint GetObjectiveInstanceId() const property
    {
        return this.m_ObjectiveInstanceId;
    }
    void SetObjectiveInstanceId(const uint __Value) property
    {
        this.m_ObjectiveInstanceId = __Value;
        return;
    }
    FCommissionSubTargetProgress GetProgress() const property
    {
        FCommissionSubTargetProgress __r;
        return __r;
    }
    FCommissionSubTargetProgress GetModify_Progress() property
    {
        FCommissionSubTargetProgress __r;
        this.__MarkDirty(2);
        return __r;
    }
    void SetProgress(const FCommissionSubTargetProgress &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_Progress = __Value;
        return;
    }
    const TMap<uint, FCommissionSubTargetProgress> GetChildProgress() const property
    {
        const TMap<uint, FCommissionSubTargetProgress> __r;
        return __r;
    }
    TMap<uint, FCommissionSubTargetProgress> GetModify_ChildProgress() property
    {
        TMap<uint, FCommissionSubTargetProgress> __r;
        this.__MarkDirty(3);
        return __r;
    }
    void SetChildProgress(const TMap<uint, FCommissionSubTargetProgress> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(3);
        this.m_ChildProgress = __Value;
        return;
    }
}

namespace ECSFunc_FCS_CommissionSubTarget
{
UFUNCTION()
bool HasCommissionSubTarget(const FECSWorldPtr &inout World)
{
    return ECSInternal::Has(World, ENTITY_ID_NULL, FCS_CommissionSubTarget);
}
FCS_CommissionSubTarget& AssignCommissionSubTarget(const FECSWorldPtr &inout World, const FCS_CommissionSubTarget &inout DefaultValue = FCS_CommissionSubTarget())
{
    UScriptStruct local_6 = FCS_CommissionSubTarget;
    FECSComponentPtr local_8;
    int local_10 = local_8 = ECSInternal::Assign(World, ENTITY_ID_NULL, local_6, FECSComponentPtr(DefaultValue));
    local_10.InternalSet(local_8);
    return local_10.GetComp();
}
UFUNCTION()
void AssignCommissionSubTarget_BP(const FECSWorldPtr &inout World, const FCS_CommissionSubTarget &inout DefaultValue = FCS_CommissionSubTarget())
{
    ECSFunc_FCS_CommissionSubTarget::AssignCommissionSubTarget(World, DefaultValue);
    return;
}
FCS_CommissionSubTarget& ModifyCommissionSubTarget(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_CommissionSubTarget;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Modify(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
FCS_CommissionSubTarget& ModifyOrAddCommissionSubTarget(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_CommissionSubTarget;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::ModifyOrAdd(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
const FCS_CommissionSubTarget& GetCommissionSubTarget(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_CommissionSubTarget;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Get(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
UFUNCTION()
FCS_CommissionSubTarget GetCommissionSubTarget_BP(const FECSWorldPtr &inout World, bool &out bValid)
{
    bValid = false;
    const FCS_CommissionSubTarget& local_4 = ECSFunc_FCS_CommissionSubTarget::GetCommissionSubTarget(World);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FCS_CommissionSubTarget();
}
const FCS_CommissionSubTarget GetDefaultedCommissionSubTarget(const FECSWorldPtr &inout World)
{
    int local_10 = 0;
    const FCS_CommissionSubTarget __r;
    FECSComponentPtr local_6 = ECSInternal::GetDefaulted(World, ENTITY_ID_NULL, FCS_CommissionSubTarget);
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
FCS_CommissionSubTarget GetDefaultedCommissionSubTarget_BP(const FECSWorldPtr &inout World)
{
    return ECSFunc_FCS_CommissionSubTarget::GetDefaultedCommissionSubTarget(World);
}
UFUNCTION()
bool RemoveCommissionSubTarget(const FECSWorldPtr &inout World)
{
    return ECSInternal::Remove(World, ENTITY_ID_NULL, FCS_CommissionSubTarget);
}
}
void __MonitorCommissionSubTargetLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FCS_CommissionSubTarget, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCommissionSubTargetActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FCS_CommissionSubTarget, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCommissionSubTargetModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FCS_CommissionSubTarget, bFixedFrame, Details);
    return;
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FCS_CommissionSubTarget &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FCS_CommissionSubTarget &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FCS_CommissionSubTarget &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FCS_CommissionSubTarget
{
int __IndexOf_SubTargetConfig()
{
    return 0;
}
int __IndexOf_Status()
{
    return 1;
}
int __IndexOf_Progress()
{
    return 2;
}
int __IndexOf_ChildProgress()
{
    return 3;
}
}
