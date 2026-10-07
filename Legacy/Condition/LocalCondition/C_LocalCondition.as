
namespace FLocalConditionInstanceData
{
    const FLocalConditionInstanceData Invalid = FLocalConditionInstanceData();
}
namespace FLocalConditionInstanceContainer
{
    const FLocalConditionInstanceContainer Empty = FLocalConditionInstanceContainer();
}
namespace __INTENRAL_FCS_LocalConditionManager_NS
{
    const TECSComponentDerivedPtr<FCS_LocalConditionManager> DerivedPtr = TECSComponentDerivedPtr<FCS_LocalConditionManager>();
    const FCS_LocalConditionManager DefaultValue = FCS_LocalConditionManager();
}
namespace __INTENRAL_FCS_LocalConditionNewlyCreatedInstances_NS
{
    const TECSComponentDerivedPtr<FCS_LocalConditionNewlyCreatedInstances> DerivedPtr = TECSComponentDerivedPtr<FCS_LocalConditionNewlyCreatedInstances>();
    const FCS_LocalConditionNewlyCreatedInstances DefaultValue = FCS_LocalConditionNewlyCreatedInstances();
}
namespace __INTENRAL_FCS_LocalConditionRemovedInstances_NS
{
    const TECSComponentDerivedPtr<FCS_LocalConditionRemovedInstances> DerivedPtr = TECSComponentDerivedPtr<FCS_LocalConditionRemovedInstances>();
    const FCS_LocalConditionRemovedInstances DefaultValue = FCS_LocalConditionRemovedInstances();
}
namespace __INTENRAL_FCS_ServerLocalConditionView_NS
{
    const TECSComponentDerivedPtr<FCS_ServerLocalConditionView> DerivedPtr = TECSComponentDerivedPtr<FCS_ServerLocalConditionView>();
    const FCS_ServerLocalConditionView DefaultValue = FCS_ServerLocalConditionView();
}
namespace __INTENRAL_FC_EntityLocalConditionView_NS
{
    const TECSComponentDerivedPtr<FC_EntityLocalConditionView> DerivedPtr = TECSComponentDerivedPtr<FC_EntityLocalConditionView>();
    const FC_EntityLocalConditionView DefaultValue = FC_EntityLocalConditionView();
}
namespace __INTENRAL_FCS_ServerLocalConditionUpdateTag_NS
{
    const TECSComponentDerivedPtr<FCS_ServerLocalConditionUpdateTag> DerivedPtr = TECSComponentDerivedPtr<FCS_ServerLocalConditionUpdateTag>();
    const FCS_ServerLocalConditionUpdateTag DefaultValue = FCS_ServerLocalConditionUpdateTag();
}
namespace __INTENRAL_FC_EntityLocalConditionUpdateTag_NS
{
    const TECSComponentDerivedPtr<FC_EntityLocalConditionUpdateTag> DerivedPtr = TECSComponentDerivedPtr<FC_EntityLocalConditionUpdateTag>();
    const FC_EntityLocalConditionUpdateTag DefaultValue = FC_EntityLocalConditionUpdateTag();

}
struct FLocalConditionInstanceData
{
    FSubDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    TDataObjectPtr<FLocalConditionConfig> m_ConditionConfig;
    UPROPERTY()
    FECSEntity m_ContextEntity;
    UPROPERTY()
    int m_CurrentValue;

    FLocalConditionInstanceData()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FLocalConditionInstanceData(const FLocalConditionInstanceData &inout Other)
    {
        this.m_CurrentValue = 0;
        this.m_ConditionConfig = Other.m_ConditionConfig;
        this.m_ContextEntity = Other.m_ContextEntity;
        this.m_CurrentValue = int(Other.m_CurrentValue);
        return;
    }
    FLocalConditionInstanceData opAssign(const FLocalConditionInstanceData &inout Other)
    {
        FLocalConditionInstanceData __r;
        this.SetConditionConfig(Other.GetConditionConfig());
        this.SetContextEntity(Other.GetContextEntity());
        this.SetCurrentValue(Other.GetCurrentValue());
        return __r;
    }
    bool IsValid() const
    {
        TDataObjectPtr<FLocalConditionConfig> local_24;
        local_24 = this.GetConditionConfig();
        return (!((local_24 == nullptr)));
    }
    TDataObjectPtr<FLocalConditionConfig> GetConditionConfig() const property
    {
        TDataObjectPtr<FLocalConditionConfig> __r;
        return __r;
    }
    TDataObjectPtr<FLocalConditionConfig> GetModify_ConditionConfig() property
    {
        TDataObjectPtr<FLocalConditionConfig> __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetConditionConfig(const TDataObjectPtr<FLocalConditionConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_ConditionConfig = __Value;
        return;
    }
    const FECSEntity GetContextEntity() const property
    {
        const FECSEntity __r;
        return __r;
    }
    FECSEntity GetModify_ContextEntity() property
    {
        FECSEntity __r;
        this.__MarkDirty(1);
        return __r;
    }
    void SetContextEntity(const FECSEntity &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_ContextEntity = __Value;
        return;
    }
    int GetCurrentValue() const property
    {
        return this.m_CurrentValue;
    }
    void SetCurrentValue(const int __Value) property
    {
        if (this.m_CurrentValue == __Value)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_CurrentValue = __Value;
        return;
    }
}

struct FLocalConditionInstanceContainer
{
    UPROPERTY()
    TArray<int> m_Instances;

    FLocalConditionInstanceContainer()
    {
        return;
    }
    const TArray<int> GetInstances() const property
    {
        const TArray<int> __r;
        return __r;
    }
    TArray<int> GetInstances() property
    {
        TArray<int> __r;
        return __r;
    }
    void SetInstances(const TArray<int> &inout __Value) property
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
}

struct FLocalConditionInstance
{
    FSubDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    int m_InstanceId;
    UPROPERTY()
    FLocalConditionInstanceData m_InstanceData;

    FLocalConditionInstance()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FLocalConditionInstance(const FLocalConditionInstance &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FLocalConditionInstance(const int InInstanceId, const FLocalConditionInstanceData &inout InInstanceData)
    {
        this.m_InstanceId = 0;
        this.SetInstanceId(InInstanceId);
        this.SetInstanceData(InInstanceData);
        return;
    }
    FLocalConditionInstance opAssign(const FLocalConditionInstance &inout Other)
    {
        FLocalConditionInstance __r;
        this.SetInstanceId(Other.GetInstanceId());
        this.SetInstanceData();
        return __r;
    }
    FConditionInstanceHandle GetHandle() const property
    {
        FConditionInstanceHandle __r;
        FConditionInstanceHandle local_26 = FConditionInstanceHandle(GetConditionConfig(), this.GetInstanceId());
        return __r;
    }
    TDataObjectPtr<FLocalConditionConfig> GetConditionConfig() const property
    {
        return GetConditionConfig();
    }
    int GetInstanceId() const property
    {
        return this.m_InstanceId;
    }
    void SetInstanceId(const int __Value) property
    {
        if (this.m_InstanceId == __Value)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_InstanceId = __Value;
        return;
    }
    FLocalConditionInstanceData GetInstanceData() const property
    {
        FLocalConditionInstanceData __r;
        return __r;
    }
    FLocalConditionInstanceData GetInstanceData() property
    {
        FLocalConditionInstanceData __r;
        return __r;
    }
    void SetInstanceData(const FLocalConditionInstanceData &inout __Value) property
    {
        this.m_InstanceData = __Value;
        return;
    }
}

struct FCS_LocalConditionManager : FECSSingleton
{
    UPROPERTY()
    TMap<int, FLocalConditionInstanceData> ConditionInstanceData;
    UPROPERTY()
    TMap<FECSEntity, FLocalConditionInstanceContainer> EntityToInstances;
    UPROPERTY()
    TMap<int, FECSEntity> InstanceIdToEntity;
    UPROPERTY()
    TMap<ULocalConditionTypeDefineBase, FLocalConditionInstanceContainer> TypeToInstances;
    UPROPERTY()
    int NextInstanceId;


    int CreateInstance(const FECSEntity &inout ContextEntity, const TDataObjectPtr<FLocalConditionConfig> &inout ConditionConfig)
    {
        FLocalConditionInstanceData local_32;
        local_32.SetConditionConfig(ConditionConfig);
        local_32.SetContextEntity(ContextEntity);
        local_32.SetCurrentValue(0);
        int local_34 = this.NextInstanceId;
        this.Add(this.NextInstanceId, local_32);
        this.InstanceIdToEntity.Add(this.EntityToInstances.FindOrAdd(ContextEntity).GetInstances().Add(this.NextInstanceId), ContextEntity);
        this.TypeToInstances.FindOrAdd(::ConditionUtils::GetConditionTypeDefine(ConditionConfig)).GetInstances().Add(this.NextInstanceId);
        ++this.NextInstanceId;
        if ((!((this.NextInstanceId >= 0))))
        {
            this.NextInstanceId = 0;
        }
        return local_34;
    }
    void RemoveInstance(const int InstanceId)
    {
        FLocalConditionInstanceData local_32;
        if (this.RemoveAndCopyValue(InstanceId, local_32))
        {
            TArray<int>& local_40;
            if (local_32.GetConditionConfig())
            {
                const ULocalConditionTypeDefineBase local_36 = ::ConditionUtils::GetConditionTypeDefine(local_32.GetConditionConfig());
                if (this.TypeToInstances.Contains(local_36))
                {
                    local_40 = this.TypeToInstances[local_36].GetInstances();
                    if (local_40.IsEmpty())
                    {
                    }
                }
            }
        }
        FECSEntity local_46;
        if (this.InstanceIdToEntity.RemoveAndCopyValue(InstanceId, local_46))
        {
            TArray<int>& local_40;
            if (this.EntityToInstances.Contains(local_46))
            {
                local_40 = this.EntityToInstances[local_46].GetInstances();
                if (local_40.IsEmpty())
                {
                }
            }
        }
        return;
    }
    bool HasInstance(const int InstanceId) const
    {
        return this.Contains(InstanceId);
    }
    FLocalConditionInstanceData GetInstanceData(const int InstanceId) const
    {
        FLocalConditionInstanceData __r;
        if (this.Contains(InstanceId))
        {
            return this[InstanceId];
        }
        return __r;
    }
    FLocalConditionInstanceData& ModifyInstanceData(const int InstanceId)
    {
        return this[InstanceId];
    }
    const FLocalConditionInstanceContainer FindInstancesByType(const TSubclassOf<ULocalConditionTypeDefineBase> &inout ConditionType) const
    {
        const FLocalConditionInstanceContainer __r;
        if (this.TypeToInstances.Contains(ConditionType.GetDefaultObject()))
        {
            return this.TypeToInstances[ConditionType.GetDefaultObject()];
        }
        return __r;
    }
    const FLocalConditionInstanceContainer FindInstancesByEntity(const FECSEntity &inout ContextEntity) const
    {
        const FLocalConditionInstanceContainer __r;
        if (this.EntityToInstances.Contains(ContextEntity))
        {
            return this.EntityToInstances[ContextEntity];
        }
        return __r;
    }
    const TMap<int, FLocalConditionInstanceData> GetAllInstanceData() const
    {
        const TMap<int, FLocalConditionInstanceData> __r;
        return __r;
    }
    FECSEntity GetContextEntityByInstanceId(const int InstanceId) const
    {
        if (this.InstanceIdToEntity.Contains(InstanceId))
        {
            return this.InstanceIdToEntity[InstanceId];
        }
        return ENTITY_NULL;
    }
    TArray<int> GetAllInstanceIds() const
    {
        TArray<int> local_4;
        this.GetKeys(local_4);
        return local_4;
    }
}

struct FCS_LocalConditionNewlyCreatedInstances : FECSSingleton
{
    UPROPERTY()
    TArray<int> NewlyCreatedInstances;

    FCS_LocalConditionNewlyCreatedInstances()
    {
        return;
    }
}

struct FCS_LocalConditionRemovedInstances : FECSSingleton
{
    UPROPERTY()
    TArray<FLocalConditionInstance> RemovedInstances;

    FCS_LocalConditionRemovedInstances()
    {
        return;
    }
}

struct FCS_ServerLocalConditionView : FECSSingleton
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    TMap<int, FLocalConditionInstanceData> m_InstanceDatas;

    FCS_ServerLocalConditionView()
    {
        this.__InitDirtyFlags();
        return;
    }
    FCS_ServerLocalConditionView(const FCS_ServerLocalConditionView &inout Other)
    {
        this.__InitDirtyFlags();
        this.m_InstanceDatas = Other.m_InstanceDatas;
        return;
    }
    FCS_ServerLocalConditionView opAssign(const FCS_ServerLocalConditionView &inout Other)
    {
        FCS_ServerLocalConditionView __r;
        this.SetInstanceDatas(Other.GetInstanceDatas());
        return __r;
    }
    const TMap<int, FLocalConditionInstanceData> GetInstanceDatas() const property
    {
        const TMap<int, FLocalConditionInstanceData> __r;
        return __r;
    }
    TMap<int, FLocalConditionInstanceData> GetModify_InstanceDatas() property
    {
        TMap<int, FLocalConditionInstanceData> __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetInstanceDatas(const TMap<int, FLocalConditionInstanceData> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_InstanceDatas = __Value;
        return;
    }
}

struct FC_EntityLocalConditionView : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    TMap<int, FLocalConditionInstanceData> m_InstanceDatas;

    FC_EntityLocalConditionView()
    {
        this.__InitDirtyFlags();
        return;
    }
    FC_EntityLocalConditionView(const FC_EntityLocalConditionView &inout Other)
    {
        this.__InitDirtyFlags();
        this.m_InstanceDatas = Other.m_InstanceDatas;
        return;
    }
    FC_EntityLocalConditionView opAssign(const FC_EntityLocalConditionView &inout Other)
    {
        FC_EntityLocalConditionView __r;
        this.SetInstanceDatas(Other.GetInstanceDatas());
        return __r;
    }
    const TMap<int, FLocalConditionInstanceData> GetInstanceDatas() const property
    {
        const TMap<int, FLocalConditionInstanceData> __r;
        return __r;
    }
    TMap<int, FLocalConditionInstanceData> GetModify_InstanceDatas() property
    {
        TMap<int, FLocalConditionInstanceData> __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetInstanceDatas(const TMap<int, FLocalConditionInstanceData> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_InstanceDatas = __Value;
        return;
    }
}

struct FCS_ServerLocalConditionUpdateTag : FECSSingleton
{
    FCS_ServerLocalConditionUpdateTag()
    {
        return;
    }
}

struct FC_EntityLocalConditionUpdateTag : FECSComponent
{
    FC_EntityLocalConditionUpdateTag()
    {
        return;
    }
}

namespace ECSFunc_FCS_LocalConditionManager
{
UFUNCTION()
bool HasLocalConditionManager(const FECSWorldPtr &inout World)
{
    return ECSInternal::Has(World, ENTITY_ID_NULL, FCS_LocalConditionManager);
}
FCS_LocalConditionManager& AssignLocalConditionManager(const FECSWorldPtr &inout World, const FCS_LocalConditionManager &inout DefaultValue = FCS_LocalConditionManager())
{
    UScriptStruct local_6 = FCS_LocalConditionManager;
    FECSComponentPtr local_8;
    int local_10 = local_8 = ECSInternal::Assign(World, ENTITY_ID_NULL, local_6, FECSComponentPtr(DefaultValue));
    local_10.InternalSet(local_8);
    return local_10.GetComp();
}
UFUNCTION()
void AssignLocalConditionManager_BP(const FECSWorldPtr &inout World, const FCS_LocalConditionManager &inout DefaultValue = FCS_LocalConditionManager())
{
    ECSFunc_FCS_LocalConditionManager::AssignLocalConditionManager(World, DefaultValue);
    return;
}
FCS_LocalConditionManager& ModifyLocalConditionManager(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_LocalConditionManager;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Modify(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
FCS_LocalConditionManager& ModifyOrAddLocalConditionManager(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_LocalConditionManager;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::ModifyOrAdd(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
const FCS_LocalConditionManager& GetLocalConditionManager(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_LocalConditionManager;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Get(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
UFUNCTION()
FCS_LocalConditionManager GetLocalConditionManager_BP(const FECSWorldPtr &inout World, bool &out bValid)
{
    FCS_LocalConditionManager __r;
    bValid = false;
    bValid = ECSFunc_FCS_LocalConditionManager::GetLocalConditionManager(World);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FCS_LocalConditionManager GetDefaultedLocalConditionManager(const FECSWorldPtr &inout World)
{
    int local_10 = 0;
    const FCS_LocalConditionManager __r;
    FECSComponentPtr local_6 = ECSInternal::GetDefaulted(World, ENTITY_ID_NULL, FCS_LocalConditionManager);
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
FCS_LocalConditionManager GetDefaultedLocalConditionManager_BP(const FECSWorldPtr &inout World)
{
    FCS_LocalConditionManager __r;
    return __r;
}
UFUNCTION()
bool RemoveLocalConditionManager(const FECSWorldPtr &inout World)
{
    return ECSInternal::Remove(World, ENTITY_ID_NULL, FCS_LocalConditionManager);
}
}
void __MonitorLocalConditionManagerLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FCS_LocalConditionManager, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorLocalConditionManagerActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FCS_LocalConditionManager, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorLocalConditionManagerModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FCS_LocalConditionManager, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FCS_LocalConditionNewlyCreatedInstances
{
UFUNCTION()
bool HasLocalConditionNewlyCreatedInstances(const FECSWorldPtr &inout World)
{
    return ECSInternal::Has(World, ENTITY_ID_NULL, FCS_LocalConditionNewlyCreatedInstances);
}
FCS_LocalConditionNewlyCreatedInstances& AssignLocalConditionNewlyCreatedInstances(const FECSWorldPtr &inout World, const FCS_LocalConditionNewlyCreatedInstances &inout DefaultValue = FCS_LocalConditionNewlyCreatedInstances())
{
    UScriptStruct local_6 = FCS_LocalConditionNewlyCreatedInstances;
    FECSComponentPtr local_8;
    int local_10 = local_8 = ECSInternal::Assign(World, ENTITY_ID_NULL, local_6, FECSComponentPtr(DefaultValue));
    local_10.InternalSet(local_8);
    return local_10.GetComp();
}
UFUNCTION()
void AssignLocalConditionNewlyCreatedInstances_BP(const FECSWorldPtr &inout World, const FCS_LocalConditionNewlyCreatedInstances &inout DefaultValue = FCS_LocalConditionNewlyCreatedInstances())
{
    ECSFunc_FCS_LocalConditionNewlyCreatedInstances::AssignLocalConditionNewlyCreatedInstances(World, DefaultValue);
    return;
}
FCS_LocalConditionNewlyCreatedInstances& ModifyLocalConditionNewlyCreatedInstances(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_LocalConditionNewlyCreatedInstances;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Modify(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
FCS_LocalConditionNewlyCreatedInstances& ModifyOrAddLocalConditionNewlyCreatedInstances(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_LocalConditionNewlyCreatedInstances;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::ModifyOrAdd(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
const FCS_LocalConditionNewlyCreatedInstances& GetLocalConditionNewlyCreatedInstances(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_LocalConditionNewlyCreatedInstances;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Get(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
UFUNCTION()
FCS_LocalConditionNewlyCreatedInstances GetLocalConditionNewlyCreatedInstances_BP(const FECSWorldPtr &inout World, bool &out bValid)
{
    FCS_LocalConditionNewlyCreatedInstances __r;
    bValid = false;
    bValid = ECSFunc_FCS_LocalConditionNewlyCreatedInstances::GetLocalConditionNewlyCreatedInstances(World);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FCS_LocalConditionNewlyCreatedInstances GetDefaultedLocalConditionNewlyCreatedInstances(const FECSWorldPtr &inout World)
{
    int local_10 = 0;
    const FCS_LocalConditionNewlyCreatedInstances __r;
    FECSComponentPtr local_6 = ECSInternal::GetDefaulted(World, ENTITY_ID_NULL, FCS_LocalConditionNewlyCreatedInstances);
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
FCS_LocalConditionNewlyCreatedInstances GetDefaultedLocalConditionNewlyCreatedInstances_BP(const FECSWorldPtr &inout World)
{
    FCS_LocalConditionNewlyCreatedInstances __r;
    return __r;
}
UFUNCTION()
bool RemoveLocalConditionNewlyCreatedInstances(const FECSWorldPtr &inout World)
{
    return ECSInternal::Remove(World, ENTITY_ID_NULL, FCS_LocalConditionNewlyCreatedInstances);
}
}
void __MonitorLocalConditionNewlyCreatedInstancesLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FCS_LocalConditionNewlyCreatedInstances, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorLocalConditionNewlyCreatedInstancesActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FCS_LocalConditionNewlyCreatedInstances, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorLocalConditionNewlyCreatedInstancesModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FCS_LocalConditionNewlyCreatedInstances, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FCS_LocalConditionRemovedInstances
{
UFUNCTION()
bool HasLocalConditionRemovedInstances(const FECSWorldPtr &inout World)
{
    return ECSInternal::Has(World, ENTITY_ID_NULL, FCS_LocalConditionRemovedInstances);
}
FCS_LocalConditionRemovedInstances& AssignLocalConditionRemovedInstances(const FECSWorldPtr &inout World, const FCS_LocalConditionRemovedInstances &inout DefaultValue = FCS_LocalConditionRemovedInstances())
{
    UScriptStruct local_6 = FCS_LocalConditionRemovedInstances;
    FECSComponentPtr local_8;
    int local_10 = local_8 = ECSInternal::Assign(World, ENTITY_ID_NULL, local_6, FECSComponentPtr(DefaultValue));
    local_10.InternalSet(local_8);
    return local_10.GetComp();
}
UFUNCTION()
void AssignLocalConditionRemovedInstances_BP(const FECSWorldPtr &inout World, const FCS_LocalConditionRemovedInstances &inout DefaultValue = FCS_LocalConditionRemovedInstances())
{
    ECSFunc_FCS_LocalConditionRemovedInstances::AssignLocalConditionRemovedInstances(World, DefaultValue);
    return;
}
FCS_LocalConditionRemovedInstances& ModifyLocalConditionRemovedInstances(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_LocalConditionRemovedInstances;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Modify(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
FCS_LocalConditionRemovedInstances& ModifyOrAddLocalConditionRemovedInstances(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_LocalConditionRemovedInstances;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::ModifyOrAdd(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
const FCS_LocalConditionRemovedInstances& GetLocalConditionRemovedInstances(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_LocalConditionRemovedInstances;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Get(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
UFUNCTION()
FCS_LocalConditionRemovedInstances GetLocalConditionRemovedInstances_BP(const FECSWorldPtr &inout World, bool &out bValid)
{
    FCS_LocalConditionRemovedInstances __r;
    bValid = false;
    bValid = ECSFunc_FCS_LocalConditionRemovedInstances::GetLocalConditionRemovedInstances(World);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FCS_LocalConditionRemovedInstances GetDefaultedLocalConditionRemovedInstances(const FECSWorldPtr &inout World)
{
    int local_10 = 0;
    const FCS_LocalConditionRemovedInstances __r;
    FECSComponentPtr local_6 = ECSInternal::GetDefaulted(World, ENTITY_ID_NULL, FCS_LocalConditionRemovedInstances);
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
FCS_LocalConditionRemovedInstances GetDefaultedLocalConditionRemovedInstances_BP(const FECSWorldPtr &inout World)
{
    FCS_LocalConditionRemovedInstances __r;
    return __r;
}
UFUNCTION()
bool RemoveLocalConditionRemovedInstances(const FECSWorldPtr &inout World)
{
    return ECSInternal::Remove(World, ENTITY_ID_NULL, FCS_LocalConditionRemovedInstances);
}
}
void __MonitorLocalConditionRemovedInstancesLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FCS_LocalConditionRemovedInstances, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorLocalConditionRemovedInstancesActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FCS_LocalConditionRemovedInstances, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorLocalConditionRemovedInstancesModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FCS_LocalConditionRemovedInstances, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FCS_ServerLocalConditionView
{
UFUNCTION()
bool HasServerLocalConditionView(const FECSWorldPtr &inout World)
{
    return ECSInternal::Has(World, ENTITY_ID_NULL, FCS_ServerLocalConditionView);
}
FCS_ServerLocalConditionView& AssignServerLocalConditionView(const FECSWorldPtr &inout World, const FCS_ServerLocalConditionView &inout DefaultValue = FCS_ServerLocalConditionView())
{
    UScriptStruct local_6 = FCS_ServerLocalConditionView;
    FECSComponentPtr local_8;
    int local_10 = local_8 = ECSInternal::Assign(World, ENTITY_ID_NULL, local_6, FECSComponentPtr(DefaultValue));
    local_10.InternalSet(local_8);
    return local_10.GetComp();
}
UFUNCTION()
void AssignServerLocalConditionView_BP(const FECSWorldPtr &inout World, const FCS_ServerLocalConditionView &inout DefaultValue = FCS_ServerLocalConditionView())
{
    ECSFunc_FCS_ServerLocalConditionView::AssignServerLocalConditionView(World, DefaultValue);
    return;
}
FCS_ServerLocalConditionView& ModifyServerLocalConditionView(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_ServerLocalConditionView;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Modify(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
FCS_ServerLocalConditionView& ModifyOrAddServerLocalConditionView(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_ServerLocalConditionView;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::ModifyOrAdd(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
const FCS_ServerLocalConditionView& GetServerLocalConditionView(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_ServerLocalConditionView;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Get(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
UFUNCTION()
FCS_ServerLocalConditionView GetServerLocalConditionView_BP(const FECSWorldPtr &inout World, bool &out bValid)
{
    bValid = false;
    const FCS_ServerLocalConditionView& local_4 = ECSFunc_FCS_ServerLocalConditionView::GetServerLocalConditionView(World);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FCS_ServerLocalConditionView();
}
const FCS_ServerLocalConditionView GetDefaultedServerLocalConditionView(const FECSWorldPtr &inout World)
{
    int local_10 = 0;
    const FCS_ServerLocalConditionView __r;
    FECSComponentPtr local_6 = ECSInternal::GetDefaulted(World, ENTITY_ID_NULL, FCS_ServerLocalConditionView);
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
FCS_ServerLocalConditionView GetDefaultedServerLocalConditionView_BP(const FECSWorldPtr &inout World)
{
    return ECSFunc_FCS_ServerLocalConditionView::GetDefaultedServerLocalConditionView(World);
}
UFUNCTION()
bool RemoveServerLocalConditionView(const FECSWorldPtr &inout World)
{
    return ECSInternal::Remove(World, ENTITY_ID_NULL, FCS_ServerLocalConditionView);
}
}
void __MonitorServerLocalConditionViewLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FCS_ServerLocalConditionView, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorServerLocalConditionViewActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FCS_ServerLocalConditionView, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorServerLocalConditionViewModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FCS_ServerLocalConditionView, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_EntityLocalConditionView
{
UFUNCTION()
bool HasEntityLocalConditionView(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_EntityLocalConditionView);
}
FC_EntityLocalConditionView& AssignEntityLocalConditionView(const FECSEntity &inout Entity, const FC_EntityLocalConditionView &inout DefaultValue = FC_EntityLocalConditionView())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_EntityLocalConditionView, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignEntityLocalConditionView_BP(const FECSEntity &inout Entity, const FC_EntityLocalConditionView &inout DefaultValue = FC_EntityLocalConditionView())
{
    ECSFunc_FC_EntityLocalConditionView::AssignEntityLocalConditionView(Entity, DefaultValue);
    return;
}
FC_EntityLocalConditionView& ModifyEntityLocalConditionView(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_EntityLocalConditionView));
    return local_12.GetComp();
}
FC_EntityLocalConditionView& ModifyOrAddEntityLocalConditionView(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_EntityLocalConditionView));
    return local_12.GetComp();
}
const FC_EntityLocalConditionView& GetEntityLocalConditionView(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_EntityLocalConditionView));
    return local_12.GetComp();
}
UFUNCTION()
FC_EntityLocalConditionView GetEntityLocalConditionView_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_EntityLocalConditionView& local_4 = ECSFunc_FC_EntityLocalConditionView::GetEntityLocalConditionView(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_EntityLocalConditionView();
}
const FC_EntityLocalConditionView GetDefaultedEntityLocalConditionView(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_EntityLocalConditionView __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_EntityLocalConditionView);
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
FC_EntityLocalConditionView GetDefaultedEntityLocalConditionView_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_EntityLocalConditionView::GetDefaultedEntityLocalConditionView(Entity);
}
UFUNCTION()
bool RemoveEntityLocalConditionView(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_EntityLocalConditionView);
}
}
FECSMonitorRuntimeView __GetMonitorEntityLocalConditionViewOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_EntityLocalConditionView, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEntityLocalConditionViewOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_EntityLocalConditionView, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEntityLocalConditionViewOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_EntityLocalConditionView, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEntityLocalConditionViewOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_EntityLocalConditionView, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEntityLocalConditionViewOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_EntityLocalConditionView, bFixedFrame, bMustHandleAll);
}
void __MonitorEntityLocalConditionViewLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_EntityLocalConditionView, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEntityLocalConditionViewActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_EntityLocalConditionView, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEntityLocalConditionViewModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_EntityLocalConditionView, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FCS_ServerLocalConditionUpdateTag
{
UFUNCTION()
bool HasServerLocalConditionUpdateTag(const FECSWorldPtr &inout World)
{
    return ECSInternal::Has(World, ENTITY_ID_NULL, FCS_ServerLocalConditionUpdateTag);
}
FCS_ServerLocalConditionUpdateTag& AssignServerLocalConditionUpdateTag(const FECSWorldPtr &inout World, const FCS_ServerLocalConditionUpdateTag &inout DefaultValue = FCS_ServerLocalConditionUpdateTag())
{
    UScriptStruct local_6 = FCS_ServerLocalConditionUpdateTag;
    FECSComponentPtr local_8;
    int local_10 = local_8 = ECSInternal::Assign(World, ENTITY_ID_NULL, local_6, FECSComponentPtr(DefaultValue));
    local_10.InternalSet(local_8);
    return local_10.GetComp();
}
UFUNCTION()
void AssignServerLocalConditionUpdateTag_BP(const FECSWorldPtr &inout World, const FCS_ServerLocalConditionUpdateTag &inout DefaultValue = FCS_ServerLocalConditionUpdateTag())
{
    ECSFunc_FCS_ServerLocalConditionUpdateTag::AssignServerLocalConditionUpdateTag(World, DefaultValue);
    return;
}
FCS_ServerLocalConditionUpdateTag& ModifyServerLocalConditionUpdateTag(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_ServerLocalConditionUpdateTag;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Modify(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
FCS_ServerLocalConditionUpdateTag& ModifyOrAddServerLocalConditionUpdateTag(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_ServerLocalConditionUpdateTag;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::ModifyOrAdd(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
const FCS_ServerLocalConditionUpdateTag& GetServerLocalConditionUpdateTag(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_ServerLocalConditionUpdateTag;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Get(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
UFUNCTION()
FCS_ServerLocalConditionUpdateTag GetServerLocalConditionUpdateTag_BP(const FECSWorldPtr &inout World, bool &out bValid)
{
    bValid = false;
    const FCS_ServerLocalConditionUpdateTag& local_4 = ECSFunc_FCS_ServerLocalConditionUpdateTag::GetServerLocalConditionUpdateTag(World);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FCS_ServerLocalConditionUpdateTag();
}
const FCS_ServerLocalConditionUpdateTag GetDefaultedServerLocalConditionUpdateTag(const FECSWorldPtr &inout World)
{
    int local_10 = 0;
    const FCS_ServerLocalConditionUpdateTag __r;
    FECSComponentPtr local_6 = ECSInternal::GetDefaulted(World, ENTITY_ID_NULL, FCS_ServerLocalConditionUpdateTag);
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
FCS_ServerLocalConditionUpdateTag GetDefaultedServerLocalConditionUpdateTag_BP(const FECSWorldPtr &inout World)
{
    return ECSFunc_FCS_ServerLocalConditionUpdateTag::GetDefaultedServerLocalConditionUpdateTag(World);
}
UFUNCTION()
bool RemoveServerLocalConditionUpdateTag(const FECSWorldPtr &inout World)
{
    return ECSInternal::Remove(World, ENTITY_ID_NULL, FCS_ServerLocalConditionUpdateTag);
}
}
void __MonitorServerLocalConditionUpdateTagLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FCS_ServerLocalConditionUpdateTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorServerLocalConditionUpdateTagActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FCS_ServerLocalConditionUpdateTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorServerLocalConditionUpdateTagModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FCS_ServerLocalConditionUpdateTag, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_EntityLocalConditionUpdateTag
{
UFUNCTION()
bool HasEntityLocalConditionUpdateTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_EntityLocalConditionUpdateTag);
}
FC_EntityLocalConditionUpdateTag& AssignEntityLocalConditionUpdateTag(const FECSEntity &inout Entity, const FC_EntityLocalConditionUpdateTag &inout DefaultValue = FC_EntityLocalConditionUpdateTag())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_EntityLocalConditionUpdateTag, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignEntityLocalConditionUpdateTag_BP(const FECSEntity &inout Entity, const FC_EntityLocalConditionUpdateTag &inout DefaultValue = FC_EntityLocalConditionUpdateTag())
{
    ECSFunc_FC_EntityLocalConditionUpdateTag::AssignEntityLocalConditionUpdateTag(Entity, DefaultValue);
    return;
}
FC_EntityLocalConditionUpdateTag& ModifyEntityLocalConditionUpdateTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_EntityLocalConditionUpdateTag));
    return local_12.GetComp();
}
FC_EntityLocalConditionUpdateTag& ModifyOrAddEntityLocalConditionUpdateTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_EntityLocalConditionUpdateTag));
    return local_12.GetComp();
}
const FC_EntityLocalConditionUpdateTag& GetEntityLocalConditionUpdateTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_EntityLocalConditionUpdateTag));
    return local_12.GetComp();
}
UFUNCTION()
FC_EntityLocalConditionUpdateTag GetEntityLocalConditionUpdateTag_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_EntityLocalConditionUpdateTag& local_4 = ECSFunc_FC_EntityLocalConditionUpdateTag::GetEntityLocalConditionUpdateTag(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_EntityLocalConditionUpdateTag();
}
const FC_EntityLocalConditionUpdateTag GetDefaultedEntityLocalConditionUpdateTag(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_EntityLocalConditionUpdateTag __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_EntityLocalConditionUpdateTag);
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
FC_EntityLocalConditionUpdateTag GetDefaultedEntityLocalConditionUpdateTag_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_EntityLocalConditionUpdateTag::GetDefaultedEntityLocalConditionUpdateTag(Entity);
}
UFUNCTION()
bool RemoveEntityLocalConditionUpdateTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_EntityLocalConditionUpdateTag);
}
}
FECSMonitorRuntimeView __GetMonitorEntityLocalConditionUpdateTagOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_EntityLocalConditionUpdateTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEntityLocalConditionUpdateTagOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_EntityLocalConditionUpdateTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEntityLocalConditionUpdateTagOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_EntityLocalConditionUpdateTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEntityLocalConditionUpdateTagOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_EntityLocalConditionUpdateTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEntityLocalConditionUpdateTagOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_EntityLocalConditionUpdateTag, bFixedFrame, bMustHandleAll);
}
void __MonitorEntityLocalConditionUpdateTagLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_EntityLocalConditionUpdateTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEntityLocalConditionUpdateTagActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_EntityLocalConditionUpdateTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEntityLocalConditionUpdateTagModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_EntityLocalConditionUpdateTag, bFixedFrame, Details);
    return;
}
namespace AutoDelta
{
FSubDirtyFlags8 GetDirtyFlags(FLocalConditionInstanceData &inout Data)
{
    FSubDirtyFlags8 __r;
    return __r;
}
void ClearDirtyFlags(FLocalConditionInstanceData &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FLocalConditionInstanceData
{
int __IndexOf_ConditionConfig()
{
    return 0;
}
int __IndexOf_ContextEntity()
{
    return 1;
}
int __IndexOf_CurrentValue()
{
    return 2;
}
}
namespace AutoDelta
{
FSubDirtyFlags8 GetDirtyFlags(FLocalConditionInstance &inout Data)
{
    FSubDirtyFlags8 __r;
    return __r;
}
void ClearDirtyFlags(FLocalConditionInstance &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FLocalConditionInstance
{
int __IndexOf_InstanceId()
{
    return 0;
}
int __IndexOf_InstanceData()
{
    return 1;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FCS_ServerLocalConditionView &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FCS_ServerLocalConditionView &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FCS_ServerLocalConditionView &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FCS_ServerLocalConditionView
{
int __IndexOf_InstanceDatas()
{
    return 0;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_EntityLocalConditionView &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_EntityLocalConditionView &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_EntityLocalConditionView &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_EntityLocalConditionView
{
int __IndexOf_InstanceDatas()
{
    return 0;
}
}
