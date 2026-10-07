
namespace __INTENRAL_FC_EquipmentHolder_NS
{
    const TECSComponentDerivedPtr<FC_EquipmentHolder> DerivedPtr = TECSComponentDerivedPtr<FC_EquipmentHolder>();
    const FC_EquipmentHolder DefaultValue = FC_EquipmentHolder();
}
namespace __INTENRAL_FC_EquipmentUpdateRequest_NS
{
    const TECSComponentDerivedPtr<FC_EquipmentUpdateRequest> DerivedPtr = TECSComponentDerivedPtr<FC_EquipmentUpdateRequest>();
    const FC_EquipmentUpdateRequest DefaultValue = FC_EquipmentUpdateRequest();
}
namespace __INTENRAL_FCE_OnWearEquipReq_NS
{
    const TECSEventDerivedPtr<FCE_OnWearEquipReq> DerivedPtr = TECSEventDerivedPtr<FCE_OnWearEquipReq>();

}
struct FEquipmentRuntimeInfo
{
    FSubDirtyFlags16 __DirtyFlags;
    UPROPERTY()
    int m_Id;
    UPROPERTY()
    EEquipSlotType m_EquipSlot;
    UPROPERTY()
    TDataObjectPtr<FEquipmentConfig> m_Config;
    UPROPERTY()
    TArray<FGameplayModifierConfigRefWithArgs> m_ModifierConfigs;
    UPROPERTY()
    TArray<int> m_ModifierInstanceIds;
    UPROPERTY()
    TArray<FCapabilityConfigWithLevel> m_Capabilities;
    UPROPERTY()
    TArray<FCapabilityInstanceId> m_CapabilityInstanceIds;
    UPROPERTY()
    FECSEntity m_Entity;

    FEquipmentRuntimeInfo()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FEquipmentRuntimeInfo(const FEquipmentRuntimeInfo &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FEquipmentRuntimeInfo opAssign(const FEquipmentRuntimeInfo &inout Other)
    {
        FEquipmentRuntimeInfo __r;
        this.SetId(Other.GetId());
        this.SetEquipSlot(Other.GetEquipSlot());
        this.SetConfig(Other.GetConfig());
        this.SetModifierConfigs(Other.GetModifierConfigs());
        this.SetModifierInstanceIds(Other.GetModifierInstanceIds());
        this.SetCapabilities(Other.GetCapabilities());
        this.SetCapabilityInstanceIds(Other.GetCapabilityInstanceIds());
        this.SetEntity(Other.GetEntity());
        return __r;
    }
    int GetId() const property
    {
        return this.m_Id;
    }
    void SetId(const int __Value) property
    {
        if (this.m_Id == __Value)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_Id = __Value;
        return;
    }
    EEquipSlotType GetEquipSlot() const property
    {
        return this.m_EquipSlot;
    }
    void SetEquipSlot(const EEquipSlotType __Value) property
    {
        if (int(this.m_EquipSlot) == int(__Value))
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_EquipSlot = __Value;
        return;
    }
    TDataObjectPtr<FEquipmentConfig> GetConfig() const property
    {
        TDataObjectPtr<FEquipmentConfig> __r;
        return __r;
    }
    TDataObjectPtr<FEquipmentConfig> GetModify_Config() property
    {
        TDataObjectPtr<FEquipmentConfig> __r;
        this.__MarkDirty(2);
        return __r;
    }
    void SetConfig(const TDataObjectPtr<FEquipmentConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_Config = __Value;
        return;
    }
    const TArray<FGameplayModifierConfigRefWithArgs> GetModifierConfigs() const property
    {
        const TArray<FGameplayModifierConfigRefWithArgs> __r;
        return __r;
    }
    TArray<FGameplayModifierConfigRefWithArgs> GetModify_ModifierConfigs() property
    {
        TArray<FGameplayModifierConfigRefWithArgs> __r;
        this.__MarkDirty(3);
        return __r;
    }
    void SetModifierConfigs(const TArray<FGameplayModifierConfigRefWithArgs> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(3);
        this.m_ModifierConfigs = __Value;
        return;
    }
    const TArray<int> GetModifierInstanceIds() const property
    {
        const TArray<int> __r;
        return __r;
    }
    TArray<int> GetModify_ModifierInstanceIds() property
    {
        TArray<int> __r;
        this.__MarkDirty(4);
        return __r;
    }
    void SetModifierInstanceIds(const TArray<int> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(4);
        this.m_ModifierInstanceIds = __Value;
        return;
    }
    const TArray<FCapabilityConfigWithLevel> GetCapabilities() const property
    {
        const TArray<FCapabilityConfigWithLevel> __r;
        return __r;
    }
    TArray<FCapabilityConfigWithLevel> GetModify_Capabilities() property
    {
        TArray<FCapabilityConfigWithLevel> __r;
        this.__MarkDirty(5);
        return __r;
    }
    void SetCapabilities(const TArray<FCapabilityConfigWithLevel> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(5);
        this.m_Capabilities = __Value;
        return;
    }
    const TArray<FCapabilityInstanceId> GetCapabilityInstanceIds() const property
    {
        const TArray<FCapabilityInstanceId> __r;
        return __r;
    }
    TArray<FCapabilityInstanceId> GetModify_CapabilityInstanceIds() property
    {
        TArray<FCapabilityInstanceId> __r;
        this.__MarkDirty(6);
        return __r;
    }
    void SetCapabilityInstanceIds(const TArray<FCapabilityInstanceId> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(6);
        this.m_CapabilityInstanceIds = __Value;
        return;
    }
    FECSEntity GetEntity() const property
    {
        FECSEntity __r;
        return __r;
    }
    FECSEntity GetModify_Entity() property
    {
        FECSEntity __r;
        this.__MarkDirty(7);
        return __r;
    }
    void SetEntity(const FECSEntity &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(7);
        this.m_Entity = __Value;
        return;
    }
}

struct FC_EquipmentHolder : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    TArray<FEquipmentRuntimeInfo> m_EquipmentInfos;
    UPROPERTY()
    TSet<EEquipSlotType> m_UsedSlot;
    UPROPERTY()
    int m_EquipmentIdCounter;

    FC_EquipmentHolder()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_EquipmentHolder(const FC_EquipmentHolder &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_EquipmentHolder opAssign(const FC_EquipmentHolder &inout Other)
    {
        FC_EquipmentHolder __r;
        this.SetEquipmentInfos(Other.GetEquipmentInfos());
        this.SetUsedSlot(Other.GetUsedSlot());
        this.SetEquipmentIdCounter(Other.GetEquipmentIdCounter());
        return __r;
    }
    const TArray<FEquipmentRuntimeInfo> GetEquipmentInfos() const property
    {
        const TArray<FEquipmentRuntimeInfo> __r;
        return __r;
    }
    TArray<FEquipmentRuntimeInfo> GetModify_EquipmentInfos() property
    {
        TArray<FEquipmentRuntimeInfo> __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetEquipmentInfos(const TArray<FEquipmentRuntimeInfo> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_EquipmentInfos = __Value;
        return;
    }
    const TSet<EEquipSlotType> GetUsedSlot() const property
    {
        const TSet<EEquipSlotType> __r;
        return __r;
    }
    TSet<EEquipSlotType> GetModify_UsedSlot() property
    {
        TSet<EEquipSlotType> __r;
        this.__MarkDirty(1);
        return __r;
    }
    void SetUsedSlot(const TSet<EEquipSlotType> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_UsedSlot = __Value;
        return;
    }
    int GetEquipmentIdCounter() const property
    {
        return this.m_EquipmentIdCounter;
    }
    void SetEquipmentIdCounter(const int __Value) property
    {
        if (this.m_EquipmentIdCounter == __Value)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_EquipmentIdCounter = __Value;
        return;
    }
}

struct FEquipmentAddInfo
{
    FSubDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    int m_Id;
    UPROPERTY()
    EEquipSlotType m_EquipSlot;
    UPROPERTY()
    TDataObjectPtr<FEquipmentConfig> m_Config;
    UPROPERTY()
    TArray<FGameplayModifierConfigRefWithArgs> m_ModifierConfigs;
    UPROPERTY()
    TArray<FCapabilityConfigWithLevel> m_Capabilities;

    FEquipmentAddInfo()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FEquipmentAddInfo(const FEquipmentAddInfo &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FEquipmentAddInfo opAssign(const FEquipmentAddInfo &inout Other)
    {
        FEquipmentAddInfo __r;
        this.SetId(Other.GetId());
        this.SetEquipSlot(Other.GetEquipSlot());
        this.SetConfig(Other.GetConfig());
        this.SetModifierConfigs(Other.GetModifierConfigs());
        this.SetCapabilities(Other.GetCapabilities());
        return __r;
    }
    int GetId() const property
    {
        return this.m_Id;
    }
    void SetId(const int __Value) property
    {
        if (this.m_Id == __Value)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_Id = __Value;
        return;
    }
    EEquipSlotType GetEquipSlot() const property
    {
        return this.m_EquipSlot;
    }
    void SetEquipSlot(const EEquipSlotType __Value) property
    {
        if (int(this.m_EquipSlot) == int(__Value))
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_EquipSlot = __Value;
        return;
    }
    TDataObjectPtr<FEquipmentConfig> GetConfig() const property
    {
        TDataObjectPtr<FEquipmentConfig> __r;
        return __r;
    }
    TDataObjectPtr<FEquipmentConfig> GetModify_Config() property
    {
        TDataObjectPtr<FEquipmentConfig> __r;
        this.__MarkDirty(2);
        return __r;
    }
    void SetConfig(const TDataObjectPtr<FEquipmentConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_Config = __Value;
        return;
    }
    const TArray<FGameplayModifierConfigRefWithArgs> GetModifierConfigs() const property
    {
        const TArray<FGameplayModifierConfigRefWithArgs> __r;
        return __r;
    }
    TArray<FGameplayModifierConfigRefWithArgs> GetModify_ModifierConfigs() property
    {
        TArray<FGameplayModifierConfigRefWithArgs> __r;
        this.__MarkDirty(3);
        return __r;
    }
    void SetModifierConfigs(const TArray<FGameplayModifierConfigRefWithArgs> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(3);
        this.m_ModifierConfigs = __Value;
        return;
    }
    const TArray<FCapabilityConfigWithLevel> GetCapabilities() const property
    {
        const TArray<FCapabilityConfigWithLevel> __r;
        return __r;
    }
    TArray<FCapabilityConfigWithLevel> GetModify_Capabilities() property
    {
        TArray<FCapabilityConfigWithLevel> __r;
        this.__MarkDirty(4);
        return __r;
    }
    void SetCapabilities(const TArray<FCapabilityConfigWithLevel> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(4);
        this.m_Capabilities = __Value;
        return;
    }
}

struct FC_EquipmentUpdateRequest : FECSComponent
{
    UPROPERTY()
    TArray<FEquipmentAddInfo> AddEquipmentInfos;
    UPROPERTY()
    TArray<int> RemoveEquipmentIds;

    FC_EquipmentUpdateRequest()
    {
        return;
    }
}

struct FCE_OnWearEquipReq : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    uint AvatarId;
    UPROPERTY()
    EEquipSlotType EquipSlot;
    UPROPERTY()
    uint64 ItemUid;
    UPROPERTY()
    FEquipmentData EquipmentData;
    UPROPERTY()
    uint SwitchAvatarId;
    UPROPERTY()
    EEquipSlotType SwitchEquipSlot;
    UPROPERTY()
    uint64 SwitchItemUid;
    UPROPERTY()
    FEquipmentData SwitchEquipmentData;


}

namespace ECSFunc_FC_EquipmentHolder
{
UFUNCTION()
bool HasEquipmentHolder(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_EquipmentHolder);
}
FC_EquipmentHolder& AssignEquipmentHolder(const FECSEntity &inout Entity, const FC_EquipmentHolder &inout DefaultValue = FC_EquipmentHolder())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_EquipmentHolder, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignEquipmentHolder_BP(const FECSEntity &inout Entity, const FC_EquipmentHolder &inout DefaultValue = FC_EquipmentHolder())
{
    ECSFunc_FC_EquipmentHolder::AssignEquipmentHolder(Entity, DefaultValue);
    return;
}
FC_EquipmentHolder& ModifyEquipmentHolder(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_EquipmentHolder));
    return local_12.GetComp();
}
FC_EquipmentHolder& ModifyOrAddEquipmentHolder(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_EquipmentHolder));
    return local_12.GetComp();
}
const FC_EquipmentHolder& GetEquipmentHolder(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_EquipmentHolder));
    return local_12.GetComp();
}
UFUNCTION()
FC_EquipmentHolder GetEquipmentHolder_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_EquipmentHolder& local_4 = ECSFunc_FC_EquipmentHolder::GetEquipmentHolder(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_EquipmentHolder();
}
const FC_EquipmentHolder GetDefaultedEquipmentHolder(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_EquipmentHolder __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_EquipmentHolder);
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
FC_EquipmentHolder GetDefaultedEquipmentHolder_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_EquipmentHolder::GetDefaultedEquipmentHolder(Entity);
}
UFUNCTION()
bool RemoveEquipmentHolder(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_EquipmentHolder);
}
}
FECSMonitorRuntimeView __GetMonitorEquipmentHolderOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_EquipmentHolder, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEquipmentHolderOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_EquipmentHolder, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEquipmentHolderOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_EquipmentHolder, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEquipmentHolderOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_EquipmentHolder, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEquipmentHolderOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_EquipmentHolder, bFixedFrame, bMustHandleAll);
}
void __MonitorEquipmentHolderLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_EquipmentHolder, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEquipmentHolderActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_EquipmentHolder, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEquipmentHolderModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_EquipmentHolder, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_EquipmentUpdateRequest
{
UFUNCTION()
bool HasEquipmentUpdateRequest(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_EquipmentUpdateRequest);
}
FC_EquipmentUpdateRequest& AssignEquipmentUpdateRequest(const FECSEntity &inout Entity, const FC_EquipmentUpdateRequest &inout DefaultValue = FC_EquipmentUpdateRequest())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_EquipmentUpdateRequest, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignEquipmentUpdateRequest_BP(const FECSEntity &inout Entity, const FC_EquipmentUpdateRequest &inout DefaultValue = FC_EquipmentUpdateRequest())
{
    ECSFunc_FC_EquipmentUpdateRequest::AssignEquipmentUpdateRequest(Entity, DefaultValue);
    return;
}
FC_EquipmentUpdateRequest& ModifyEquipmentUpdateRequest(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_EquipmentUpdateRequest));
    return local_12.GetComp();
}
FC_EquipmentUpdateRequest& ModifyOrAddEquipmentUpdateRequest(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_EquipmentUpdateRequest));
    return local_12.GetComp();
}
const FC_EquipmentUpdateRequest& GetEquipmentUpdateRequest(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_EquipmentUpdateRequest));
    return local_12.GetComp();
}
UFUNCTION()
FC_EquipmentUpdateRequest GetEquipmentUpdateRequest_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_EquipmentUpdateRequest __r;
    bValid = false;
    bValid = ECSFunc_FC_EquipmentUpdateRequest::GetEquipmentUpdateRequest(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_EquipmentUpdateRequest GetDefaultedEquipmentUpdateRequest(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_EquipmentUpdateRequest __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_EquipmentUpdateRequest);
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
FC_EquipmentUpdateRequest GetDefaultedEquipmentUpdateRequest_BP(const FECSEntity &inout Entity)
{
    FC_EquipmentUpdateRequest __r;
    return __r;
}
UFUNCTION()
bool RemoveEquipmentUpdateRequest(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_EquipmentUpdateRequest);
}
}
FECSMonitorRuntimeView __GetMonitorEquipmentUpdateRequestOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_EquipmentUpdateRequest, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEquipmentUpdateRequestOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_EquipmentUpdateRequest, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEquipmentUpdateRequestOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_EquipmentUpdateRequest, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEquipmentUpdateRequestOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_EquipmentUpdateRequest, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEquipmentUpdateRequestOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_EquipmentUpdateRequest, bFixedFrame, bMustHandleAll);
}
void __MonitorEquipmentUpdateRequestLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_EquipmentUpdateRequest, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEquipmentUpdateRequestActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_EquipmentUpdateRequest, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEquipmentUpdateRequestModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_EquipmentUpdateRequest, bFixedFrame, Details);
    return;
}
namespace AutoDelta
{
FSubDirtyFlags16 GetDirtyFlags(FEquipmentRuntimeInfo &inout Data)
{
    FSubDirtyFlags16 __r;
    return __r;
}
void ClearDirtyFlags(FEquipmentRuntimeInfo &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FEquipmentRuntimeInfo
{
int __IndexOf_Id()
{
    return 0;
}
int __IndexOf_EquipSlot()
{
    return 1;
}
int __IndexOf_Config()
{
    return 2;
}
int __IndexOf_ModifierConfigs()
{
    return 3;
}
int __IndexOf_ModifierInstanceIds()
{
    return 4;
}
int __IndexOf_Capabilities()
{
    return 5;
}
int __IndexOf_CapabilityInstanceIds()
{
    return 6;
}
int __IndexOf_Entity()
{
    return 7;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_EquipmentHolder &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_EquipmentHolder &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_EquipmentHolder &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_EquipmentHolder
{
int __IndexOf_EquipmentInfos()
{
    return 0;
}
int __IndexOf_UsedSlot()
{
    return 1;
}
int __IndexOf_EquipmentIdCounter()
{
    return 2;
}
}
namespace AutoDelta
{
FSubDirtyFlags8 GetDirtyFlags(FEquipmentAddInfo &inout Data)
{
    FSubDirtyFlags8 __r;
    return __r;
}
void ClearDirtyFlags(FEquipmentAddInfo &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FEquipmentAddInfo
{
int __IndexOf_Id()
{
    return 0;
}
int __IndexOf_EquipSlot()
{
    return 1;
}
int __IndexOf_Config()
{
    return 2;
}
int __IndexOf_ModifierConfigs()
{
    return 3;
}
int __IndexOf_Capabilities()
{
    return 4;
}
}
