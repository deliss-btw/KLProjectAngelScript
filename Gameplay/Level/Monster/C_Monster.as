
namespace __INTENRAL_FC_MonsterInfo_NS
{
    const TECSComponentDerivedPtr<FC_MonsterInfo> DerivedPtr = TECSComponentDerivedPtr<FC_MonsterInfo>();
    const FC_MonsterInfo DefaultValue = FC_MonsterInfo();

}
struct FC_MonsterInfo : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    TDataObjectPtr<FMonsterMainConfig> m_MonsterConfig;
    UPROPERTY()
    TDataObjectPtr<FMonsterPresentationConfig> m_PresentationConfig;
    UPROPERTY()
    int m_MonsterLevel;
    UPROPERTY()
    EMonsterRank m_MonsterRank;

    FC_MonsterInfo()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_MonsterInfo(const FC_MonsterInfo &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_MonsterInfo opAssign(const FC_MonsterInfo &inout Other)
    {
        FC_MonsterInfo __r;
        this.SetMonsterConfig(Other.GetMonsterConfig());
        this.SetPresentationConfig(Other.GetPresentationConfig());
        this.SetMonsterLevel(Other.GetMonsterLevel());
        this.SetMonsterRank(Other.GetMonsterRank());
        return __r;
    }
    TDataObjectPtr<FMonsterMainConfig> GetMonsterConfig() const property
    {
        TDataObjectPtr<FMonsterMainConfig> __r;
        return __r;
    }
    TDataObjectPtr<FMonsterMainConfig> GetModify_MonsterConfig() property
    {
        TDataObjectPtr<FMonsterMainConfig> __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetMonsterConfig(const TDataObjectPtr<FMonsterMainConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_MonsterConfig = __Value;
        return;
    }
    TDataObjectPtr<FMonsterPresentationConfig> GetPresentationConfig() const property
    {
        TDataObjectPtr<FMonsterPresentationConfig> __r;
        return __r;
    }
    TDataObjectPtr<FMonsterPresentationConfig> GetModify_PresentationConfig() property
    {
        TDataObjectPtr<FMonsterPresentationConfig> __r;
        this.__MarkDirty(1);
        return __r;
    }
    void SetPresentationConfig(const TDataObjectPtr<FMonsterPresentationConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_PresentationConfig = __Value;
        return;
    }
    int GetMonsterLevel() const property
    {
        return this.m_MonsterLevel;
    }
    void SetMonsterLevel(const int __Value) property
    {
        if (this.m_MonsterLevel == __Value)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_MonsterLevel = __Value;
        return;
    }
    EMonsterRank GetMonsterRank() const property
    {
        return this.m_MonsterRank;
    }
    void SetMonsterRank(const EMonsterRank __Value) property
    {
        if (int(this.m_MonsterRank) == int(__Value))
        {
            return;
        }
        this.__MarkDirty(3);
        this.m_MonsterRank = __Value;
        return;
    }
}

namespace ECSFunc_FC_MonsterInfo
{
UFUNCTION()
bool HasMonsterInfo(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_MonsterInfo);
}
FC_MonsterInfo& AssignMonsterInfo(const FECSEntity &inout Entity, const FC_MonsterInfo &inout DefaultValue = FC_MonsterInfo())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_MonsterInfo, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignMonsterInfo_BP(const FECSEntity &inout Entity, const FC_MonsterInfo &inout DefaultValue = FC_MonsterInfo())
{
    ECSFunc_FC_MonsterInfo::AssignMonsterInfo(Entity, DefaultValue);
    return;
}
FC_MonsterInfo& ModifyMonsterInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_MonsterInfo));
    return local_12.GetComp();
}
FC_MonsterInfo& ModifyOrAddMonsterInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_MonsterInfo));
    return local_12.GetComp();
}
const FC_MonsterInfo& GetMonsterInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_MonsterInfo));
    return local_12.GetComp();
}
UFUNCTION()
FC_MonsterInfo GetMonsterInfo_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_MonsterInfo& local_4 = ECSFunc_FC_MonsterInfo::GetMonsterInfo(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_MonsterInfo();
}
const FC_MonsterInfo GetDefaultedMonsterInfo(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_MonsterInfo __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_MonsterInfo);
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
FC_MonsterInfo GetDefaultedMonsterInfo_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_MonsterInfo::GetDefaultedMonsterInfo(Entity);
}
UFUNCTION()
bool RemoveMonsterInfo(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_MonsterInfo);
}
}
FECSMonitorRuntimeView __GetMonitorMonsterInfoOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_MonsterInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorMonsterInfoOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_MonsterInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorMonsterInfoOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_MonsterInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorMonsterInfoOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_MonsterInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorMonsterInfoOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_MonsterInfo, bFixedFrame, bMustHandleAll);
}
void __MonitorMonsterInfoLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_MonsterInfo, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorMonsterInfoActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_MonsterInfo, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorMonsterInfoModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_MonsterInfo, bFixedFrame, Details);
    return;
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_MonsterInfo &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_MonsterInfo &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_MonsterInfo &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_MonsterInfo
{
int __IndexOf_MonsterConfig()
{
    return 0;
}
int __IndexOf_PresentationConfig()
{
    return 1;
}
int __IndexOf_MonsterLevel()
{
    return 2;
}
int __IndexOf_MonsterRank()
{
    return 3;
}
}
