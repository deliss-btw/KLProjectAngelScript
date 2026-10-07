
namespace FLocalConditionHandleList
{
    const FLocalConditionHandleList Empty = FLocalConditionHandleList();
}
namespace __INTENRAL_FCS_LocalConditionSubscriptionManager_NS
{
    const TECSComponentDerivedPtr<FCS_LocalConditionSubscriptionManager> DerivedPtr = TECSComponentDerivedPtr<FCS_LocalConditionSubscriptionManager>();
    const FCS_LocalConditionSubscriptionManager DefaultValue = FCS_LocalConditionSubscriptionManager();

}
struct FLocalConditionHandleList
{
    UPROPERTY()
    TArray<FConditionInstanceHandle> ConditionInstances;

    FLocalConditionHandleList()
    {
        return;
    }
}

struct FLocalConditionTypeSubscriptions
{
    UPROPERTY()
    TMap<FName, FLocalConditionHandleList> KeyedHandles;

    FLocalConditionTypeSubscriptions()
    {
        return;
    }
}

struct FCS_LocalConditionSubscriptionManager : FECSSingleton
{
    UPROPERTY()
    TMap<ULocalConditionTypeDefineBase, FLocalConditionTypeSubscriptions> TypeSubscriptions;

    FCS_LocalConditionSubscriptionManager()
    {
        return;
    }
    void Subscribe(const ULocalConditionTypeDefineBase TypeDefine, const FName &inout Key, const FConditionInstanceHandle &inout Handle)
    {
        if (TypeDefine == nullptr)
        {
            return;
        }
        this.FindOrAdd(TypeDefine).KeyedHandles.FindOrAdd(Key).ConditionInstances.Add(Handle);
        return;
    }
    void Unsubscribe(const ULocalConditionTypeDefineBase TypeDefine, const FName &inout Key, const FConditionInstanceHandle &inout Handle)
    {
        if (TypeDefine == nullptr || !(this.Contains(TypeDefine)))
        {
            return;
        }
        FLocalConditionTypeSubscriptions& local_4 = this[TypeDefine];
        if (local_4.KeyedHandles.Contains(Key))
        {
            TArray<FConditionInstanceHandle> local_6;
            if (local_6.IsEmpty())
            {
            }
        }
        if (local_4.KeyedHandles.IsEmpty())
        {
        }
        return;
    }
    const FLocalConditionHandleList& GetHandleList(const TSubclassOf<ULocalConditionTypeDefineBase> &inout ConditionType, const FName &inout Key) const
    {
        ULocalConditionTypeDefineBase local_2 = ConditionType.GetDefaultObject();
        bool local_5 = local_2 != nullptr && this.Contains(local_2);
        if (local_5)
        {
            TMap<FName, FLocalConditionHandleList> local_8;
            if (local_8.Contains(Key))
            {
                return local_8[Key];
            }
        }
        return local_5;
    }
    bool IsEmpty() const
    {
        return this.IsEmpty();
    }
}

namespace ECSFunc_FCS_LocalConditionSubscriptionManager
{
UFUNCTION()
bool HasLocalConditionSubscriptionManager(const FECSWorldPtr &inout World)
{
    return ECSInternal::Has(World, ENTITY_ID_NULL, FCS_LocalConditionSubscriptionManager);
}
FCS_LocalConditionSubscriptionManager& AssignLocalConditionSubscriptionManager(const FECSWorldPtr &inout World, const FCS_LocalConditionSubscriptionManager &inout DefaultValue = FCS_LocalConditionSubscriptionManager())
{
    UScriptStruct local_6 = FCS_LocalConditionSubscriptionManager;
    FECSComponentPtr local_8;
    int local_10 = local_8 = ECSInternal::Assign(World, ENTITY_ID_NULL, local_6, FECSComponentPtr(DefaultValue));
    local_10.InternalSet(local_8);
    return local_10.GetComp();
}
UFUNCTION()
void AssignLocalConditionSubscriptionManager_BP(const FECSWorldPtr &inout World, const FCS_LocalConditionSubscriptionManager &inout DefaultValue = FCS_LocalConditionSubscriptionManager())
{
    ECSFunc_FCS_LocalConditionSubscriptionManager::AssignLocalConditionSubscriptionManager(World, DefaultValue);
    return;
}
FCS_LocalConditionSubscriptionManager& ModifyLocalConditionSubscriptionManager(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_LocalConditionSubscriptionManager;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Modify(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
FCS_LocalConditionSubscriptionManager& ModifyOrAddLocalConditionSubscriptionManager(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_LocalConditionSubscriptionManager;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::ModifyOrAdd(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
const FCS_LocalConditionSubscriptionManager& GetLocalConditionSubscriptionManager(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_LocalConditionSubscriptionManager;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Get(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
UFUNCTION()
FCS_LocalConditionSubscriptionManager GetLocalConditionSubscriptionManager_BP(const FECSWorldPtr &inout World, bool &out bValid)
{
    FCS_LocalConditionSubscriptionManager __r;
    bValid = false;
    bValid = ECSFunc_FCS_LocalConditionSubscriptionManager::GetLocalConditionSubscriptionManager(World);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FCS_LocalConditionSubscriptionManager GetDefaultedLocalConditionSubscriptionManager(const FECSWorldPtr &inout World)
{
    int local_10 = 0;
    const FCS_LocalConditionSubscriptionManager __r;
    FECSComponentPtr local_6 = ECSInternal::GetDefaulted(World, ENTITY_ID_NULL, FCS_LocalConditionSubscriptionManager);
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
FCS_LocalConditionSubscriptionManager GetDefaultedLocalConditionSubscriptionManager_BP(const FECSWorldPtr &inout World)
{
    FCS_LocalConditionSubscriptionManager __r;
    return __r;
}
UFUNCTION()
bool RemoveLocalConditionSubscriptionManager(const FECSWorldPtr &inout World)
{
    return ECSInternal::Remove(World, ENTITY_ID_NULL, FCS_LocalConditionSubscriptionManager);
}
}
void __MonitorLocalConditionSubscriptionManagerLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FCS_LocalConditionSubscriptionManager, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorLocalConditionSubscriptionManagerActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FCS_LocalConditionSubscriptionManager, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorLocalConditionSubscriptionManagerModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FCS_LocalConditionSubscriptionManager, bFixedFrame, Details);
    return;
}
