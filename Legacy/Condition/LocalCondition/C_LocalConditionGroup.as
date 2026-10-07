
namespace __INTENRAL_FCS_LocalConditionGroupManager_NS
{
    const TECSComponentDerivedPtr<FCS_LocalConditionGroupManager> DerivedPtr = TECSComponentDerivedPtr<FCS_LocalConditionGroupManager>();
    const FCS_LocalConditionGroupManager DefaultValue = FCS_LocalConditionGroupManager();

}
struct FLocalConditionGroupInstanceData
{
    UPROPERTY()
    TDataObjectPtr<FConditionGroupConfig> ConditionGroupConfig;
    UPROPERTY()
    TArray<int> InnerConditionInstanceIds;
    UPROPERTY()
    bool bCachedReached;


}

struct FCS_LocalConditionGroupManager : FECSSingleton
{
    UPROPERTY()
    TMap<int, FLocalConditionGroupInstanceData> ConditionGroupInstanceData;
    UPROPERTY()
    TMap<int, int> ConditionInstanceIdToGroupInstanceId;
    UPROPERTY()
    int NextConditionGroupInstanceId;


    int AddConditionGroupInstance(const TDataObjectPtr<FConditionGroupConfig> &inout ConditionGroupConfig, const TArray<int> &inout InnerConditionInstanceIds)
    {
        FLocalConditionGroupInstanceData local_30;
        local_30.ConditionGroupConfig = ConditionGroupConfig;
        local_30.InnerConditionInstanceIds = InnerConditionInstanceIds;
        int local_55 = this.NextConditionGroupInstanceId;
        this.Add(local_55, local_30);
        for (auto local_70 : InnerConditionInstanceIds)
        {
            this.ConditionInstanceIdToGroupInstanceId.Add(local_70, local_55);
        }
        ++this.NextConditionGroupInstanceId;
        if ((!((this.NextConditionGroupInstanceId >= 0))))
        {
            this.NextConditionGroupInstanceId = 0;
        }
        return local_55;
    }
    void RemoveConditionGroupInstance(const int ConditionGroupInstanceId)
    {
        if (this.Contains(ConditionGroupInstanceId))
        {
            auto local_10 = this[ConditionGroupInstanceId].InnerConditionInstanceIds.Iterator();
            for (; local_10.CanProceed;)
            {
                int local_18 = local_10.Proceed();
            }
        }
        return;
    }
}

namespace ECSFunc_FCS_LocalConditionGroupManager
{
UFUNCTION()
bool HasLocalConditionGroupManager(const FECSWorldPtr &inout World)
{
    return ECSInternal::Has(World, ENTITY_ID_NULL, FCS_LocalConditionGroupManager);
}
FCS_LocalConditionGroupManager& AssignLocalConditionGroupManager(const FECSWorldPtr &inout World, const FCS_LocalConditionGroupManager &inout DefaultValue = FCS_LocalConditionGroupManager())
{
    UScriptStruct local_6 = FCS_LocalConditionGroupManager;
    FECSComponentPtr local_8;
    int local_10 = local_8 = ECSInternal::Assign(World, ENTITY_ID_NULL, local_6, FECSComponentPtr(DefaultValue));
    local_10.InternalSet(local_8);
    return local_10.GetComp();
}
UFUNCTION()
void AssignLocalConditionGroupManager_BP(const FECSWorldPtr &inout World, const FCS_LocalConditionGroupManager &inout DefaultValue = FCS_LocalConditionGroupManager())
{
    ECSFunc_FCS_LocalConditionGroupManager::AssignLocalConditionGroupManager(World, DefaultValue);
    return;
}
FCS_LocalConditionGroupManager& ModifyLocalConditionGroupManager(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_LocalConditionGroupManager;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Modify(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
FCS_LocalConditionGroupManager& ModifyOrAddLocalConditionGroupManager(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_LocalConditionGroupManager;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::ModifyOrAdd(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
const FCS_LocalConditionGroupManager& GetLocalConditionGroupManager(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_LocalConditionGroupManager;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Get(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
UFUNCTION()
FCS_LocalConditionGroupManager GetLocalConditionGroupManager_BP(const FECSWorldPtr &inout World, bool &out bValid)
{
    FCS_LocalConditionGroupManager __r;
    bValid = false;
    bValid = ECSFunc_FCS_LocalConditionGroupManager::GetLocalConditionGroupManager(World);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FCS_LocalConditionGroupManager GetDefaultedLocalConditionGroupManager(const FECSWorldPtr &inout World)
{
    int local_10 = 0;
    const FCS_LocalConditionGroupManager __r;
    FECSComponentPtr local_6 = ECSInternal::GetDefaulted(World, ENTITY_ID_NULL, FCS_LocalConditionGroupManager);
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
FCS_LocalConditionGroupManager GetDefaultedLocalConditionGroupManager_BP(const FECSWorldPtr &inout World)
{
    FCS_LocalConditionGroupManager __r;
    return __r;
}
UFUNCTION()
bool RemoveLocalConditionGroupManager(const FECSWorldPtr &inout World)
{
    return ECSInternal::Remove(World, ENTITY_ID_NULL, FCS_LocalConditionGroupManager);
}
}
void __MonitorLocalConditionGroupManagerLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FCS_LocalConditionGroupManager, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorLocalConditionGroupManagerActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FCS_LocalConditionGroupManager, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorLocalConditionGroupManagerModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FCS_LocalConditionGroupManager, bFixedFrame, Details);
    return;
}
