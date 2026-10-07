
namespace __INTENRAL_FC_MotionUnlock_NS
{
    const TECSComponentDerivedPtr<FC_MotionUnlock> DerivedPtr = TECSComponentDerivedPtr<FC_MotionUnlock>();
    const FC_MotionUnlock DefaultValue = FC_MotionUnlock();
}
namespace __INTENRAL_FCE_NotifyMotionUnlocked_NS
{
    const TECSEventDerivedPtr<FCE_NotifyMotionUnlocked> DerivedPtr = TECSEventDerivedPtr<FCE_NotifyMotionUnlocked>();

}
struct FC_MotionUnlock : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    TArray<TDataObjectPtr<FMotionData>> m_UnlockedMotionData;

    FC_MotionUnlock()
    {
        this.__InitDirtyFlags();
        return;
    }
    FC_MotionUnlock(const FC_MotionUnlock &inout Other)
    {
        this.__InitDirtyFlags();
        this.m_UnlockedMotionData = Other.m_UnlockedMotionData;
        return;
    }
    FC_MotionUnlock opAssign(const FC_MotionUnlock &inout Other)
    {
        FC_MotionUnlock __r;
        this.SetUnlockedMotionData(Other.GetUnlockedMotionData());
        return __r;
    }
    void Save(const FECSEntity &inout Entity)
    {
        Get local_4;
        const FC_PlayerController& local_6 = local_4.opCall();
        if (local_6)
        {
            int local_8;
            local_8 = local_6.GetPlayerId();
            FPbDsPlayerInfo local_32 = ::UGameDSConnectionSubsystem::Get().GetPlayerInfo(local_8);
            if (local_32.IsValid())
            {
                FPbDSMiscInfo local_52 = local_32.GetDsMiscInfo();
                local_52.ClearUnlockEmojList();
                for (auto& local_66 : this.GetUnlockedMotionData())
                {
                    local_52.AddUnlockEmojList(local_66.opArrow().DataId);
                }
            }
        }
        return;
    }
    void Load(const FECSEntity &inout Entity)
    {
        Get local_4;
        const FC_PlayerController& local_6 = local_4.opCall();
        if (local_6)
        {
            int local_8;
            local_8 = local_6.GetPlayerId();
            FPbDsPlayerInfo local_32 = ::UGameDSConnectionSubsystem::Get().GetPlayerInfo(local_8);
            if (local_32.IsValid())
            {
                FPbDSMiscInfo local_52 = local_32.GetDsMiscInfo();
                TArray<int> local_56;
                local_52.GetUnlockEmojList(local_56);
                for (auto local_70 : local_56)
                {
                    this.GetModify_UnlockedMotionData().AddUnique(::FMotionData::GetByDataId(int(local_70)));
                }
            }
        }
        return;
    }
    const TArray<TDataObjectPtr<FMotionData>> GetUnlockedMotionData() const property
    {
        const TArray<TDataObjectPtr<FMotionData>> __r;
        return __r;
    }
    TArray<TDataObjectPtr<FMotionData>> GetModify_UnlockedMotionData() property
    {
        TArray<TDataObjectPtr<FMotionData>> __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetUnlockedMotionData(const TArray<TDataObjectPtr<FMotionData>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_UnlockedMotionData = __Value;
        return;
    }
}

struct FCE_NotifyMotionUnlocked : FECSEvent
{
    FECSEvent _base_FECSEvent;

    FCE_NotifyMotionUnlocked()
    {
        return;
    }
}

namespace ECSFunc_FC_MotionUnlock
{
UFUNCTION()
bool HasMotionUnlock(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_MotionUnlock);
}
FC_MotionUnlock& AssignMotionUnlock(const FECSEntity &inout Entity, const FC_MotionUnlock &inout DefaultValue = FC_MotionUnlock())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_MotionUnlock, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignMotionUnlock_BP(const FECSEntity &inout Entity, const FC_MotionUnlock &inout DefaultValue = FC_MotionUnlock())
{
    ECSFunc_FC_MotionUnlock::AssignMotionUnlock(Entity, DefaultValue);
    return;
}
FC_MotionUnlock& ModifyMotionUnlock(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_MotionUnlock));
    return local_12.GetComp();
}
FC_MotionUnlock& ModifyOrAddMotionUnlock(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_MotionUnlock));
    return local_12.GetComp();
}
const FC_MotionUnlock& GetMotionUnlock(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_MotionUnlock));
    return local_12.GetComp();
}
UFUNCTION()
FC_MotionUnlock GetMotionUnlock_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_MotionUnlock& local_4 = ECSFunc_FC_MotionUnlock::GetMotionUnlock(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_MotionUnlock();
}
const FC_MotionUnlock GetDefaultedMotionUnlock(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_MotionUnlock __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_MotionUnlock);
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
FC_MotionUnlock GetDefaultedMotionUnlock_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_MotionUnlock::GetDefaultedMotionUnlock(Entity);
}
UFUNCTION()
bool RemoveMotionUnlock(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_MotionUnlock);
}
}
FECSMonitorRuntimeView __GetMonitorMotionUnlockOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_MotionUnlock, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorMotionUnlockOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_MotionUnlock, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorMotionUnlockOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_MotionUnlock, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorMotionUnlockOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_MotionUnlock, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorMotionUnlockOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_MotionUnlock, bFixedFrame, bMustHandleAll);
}
void __MonitorMotionUnlockLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_MotionUnlock, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorMotionUnlockActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_MotionUnlock, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorMotionUnlockModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_MotionUnlock, bFixedFrame, Details);
    return;
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_MotionUnlock &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_MotionUnlock &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_MotionUnlock &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_MotionUnlock
{
int __IndexOf_UnlockedMotionData()
{
    return 0;
}
}
