
enum ENumLimitManagerType
{
    OwnerEntity,
}

namespace __INTENRAL_FC_NumLimited_NS
{
    const TECSComponentDerivedPtr<FC_NumLimited> DerivedPtr = TECSComponentDerivedPtr<FC_NumLimited>();
    const FC_NumLimited DefaultValue = FC_NumLimited();
}
namespace __INTENRAL_FC_NumLimitedOverrides_NS
{
    const TECSComponentDerivedPtr<FC_NumLimitedOverrides> DerivedPtr = TECSComponentDerivedPtr<FC_NumLimitedOverrides>();
    const FC_NumLimitedOverrides DefaultValue = FC_NumLimitedOverrides();
}
namespace __INTENRAL_FC_NumLimitManager_NS
{
    const TECSComponentDerivedPtr<FC_NumLimitManager> DerivedPtr = TECSComponentDerivedPtr<FC_NumLimitManager>();
    const FC_NumLimitManager DefaultValue = FC_NumLimitManager();
}
namespace __INTENRAL_FC_NumLimitManagerChanged_NS
{
    const TECSComponentDerivedPtr<FC_NumLimitManagerChanged> DerivedPtr = TECSComponentDerivedPtr<FC_NumLimitManagerChanged>();
    const FC_NumLimitManagerChanged DefaultValue = FC_NumLimitManagerChanged();

}
struct FC_NumLimited : FECSComponent
{
    UPROPERTY()
    int LimitNum = 1;
    UPROPERTY()
    ENumLimitManagerType ManagerType;


}

struct FNumLimitedPairItem
{
    UPROPERTY()
    FName m_Identifier;
    UPROPERTY()
    int m_LimitNum = 1;


    FName GetIdentifier() const property
    {
        return this;
    }
    void SetIdentifier(const FName &inout __Value) property
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    int GetLimitNum() const property
    {
        return this.m_LimitNum;
    }
    void SetLimitNum(const int __Value) property
    {
        this.m_LimitNum = __Value;
        return;
    }
}

struct FC_NumLimitedOverrides : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    TArray<FNumLimitedPairItem> m_ModifierItems;
    UPROPERTY()
    TArray<FNumLimitedPairItem> m_DefaultItems;

    FC_NumLimitedOverrides()
    {
        this.__InitDirtyFlags();
        return;
    }
    FC_NumLimitedOverrides(const FC_NumLimitedOverrides &inout Other)
    {
        this.__InitDirtyFlags();
        this.m_ModifierItems = Other.m_ModifierItems;
        this.m_DefaultItems = Other.m_DefaultItems;
        return;
    }
    FC_NumLimitedOverrides opAssign(const FC_NumLimitedOverrides &inout Other)
    {
        FC_NumLimitedOverrides __r;
        this.SetModifierItems(Other.GetModifierItems());
        this.SetDefaultItems(Other.GetDefaultItems());
        return __r;
    }
    int FindModifierItemIdx(const FName &inout Identifier) const
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
        int __r; return __r;
    }
    int FindDefaultItemIdx(const FName &inout Identifier) const
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
        int __r; return __r;
    }
    bool TryGetRealLimitedNum(const FName &inout Identifier, int &inout RealLimitedNum) const
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
        bool __r; return __r;
    }
    const TArray<FNumLimitedPairItem> GetModifierItems() const property
    {
        const TArray<FNumLimitedPairItem> __r;
        return __r;
    }
    TArray<FNumLimitedPairItem> GetModify_ModifierItems() property
    {
        TArray<FNumLimitedPairItem> __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetModifierItems(const TArray<FNumLimitedPairItem> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_ModifierItems = __Value;
        return;
    }
    const TArray<FNumLimitedPairItem> GetDefaultItems() const property
    {
        const TArray<FNumLimitedPairItem> __r;
        return __r;
    }
    TArray<FNumLimitedPairItem> GetModify_DefaultItems() property
    {
        TArray<FNumLimitedPairItem> __r;
        this.__MarkDirty(1);
        return __r;
    }
    void SetDefaultItems(const TArray<FNumLimitedPairItem> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_DefaultItems = __Value;
        return;
    }
}

struct FNumLimitedItem
{
    UPROPERTY()
    FName m_Identifier;
    UPROPERTY()
    FECSEntityId m_Entity;

    FNumLimitedItem()
    {
        return;
    }
    FName GetIdentifier() const property
    {
        return this;
    }
    void SetIdentifier(const FName &inout __Value) property
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FECSEntityId GetEntity() const property
    {
        FECSEntityId __r;
        return __r;
    }
    FECSEntityId GetEntity() property
    {
        FECSEntityId __r;
        return __r;
    }
    void SetEntity(const FECSEntityId &inout __Value) property
    {
        this.m_Entity = __Value;
        return;
    }
}

struct FC_NumLimitManager : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    TArray<FNumLimitedItem> m_ManagerItems;

    FC_NumLimitManager()
    {
        this.__InitDirtyFlags();
        return;
    }
    FC_NumLimitManager(const FC_NumLimitManager &inout Other)
    {
        this.__InitDirtyFlags();
        this.m_ManagerItems = Other.m_ManagerItems;
        return;
    }
    FC_NumLimitManager opAssign(const FC_NumLimitManager &inout Other)
    {
        FC_NumLimitManager __r;
        this.SetManagerItems(Other.GetManagerItems());
        return __r;
    }
    const TArray<FNumLimitedItem> GetManagerItems() const property
    {
        const TArray<FNumLimitedItem> __r;
        return __r;
    }
    TArray<FNumLimitedItem> GetModify_ManagerItems() property
    {
        TArray<FNumLimitedItem> __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetManagerItems(const TArray<FNumLimitedItem> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_ManagerItems = __Value;
        return;
    }
}

struct FC_NumLimitManagerChanged : FECSComponent
{
    UPROPERTY()
    TMap<FName, int> LimitNums;

    FC_NumLimitManagerChanged()
    {
        return;
    }
}

namespace ECSFunc_FC_NumLimited
{
UFUNCTION()
bool HasNumLimited(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_NumLimited);
}
FC_NumLimited& AssignNumLimited(const FECSEntity &inout Entity, const FC_NumLimited &inout DefaultValue = FC_NumLimited())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_NumLimited, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignNumLimited_BP(const FECSEntity &inout Entity, const FC_NumLimited &inout DefaultValue = FC_NumLimited())
{
    ECSFunc_FC_NumLimited::AssignNumLimited(Entity, DefaultValue);
    return;
}
FC_NumLimited& ModifyNumLimited(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_NumLimited));
    return local_12.GetComp();
}
FC_NumLimited& ModifyOrAddNumLimited(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_NumLimited));
    return local_12.GetComp();
}
const FC_NumLimited& GetNumLimited(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_NumLimited));
    return local_12.GetComp();
}
UFUNCTION()
FC_NumLimited GetNumLimited_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_NumLimited& local_4 = ECSFunc_FC_NumLimited::GetNumLimited(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_NumLimited();
}
const FC_NumLimited GetDefaultedNumLimited(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_NumLimited __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_NumLimited);
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
FC_NumLimited GetDefaultedNumLimited_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_NumLimited::GetDefaultedNumLimited(Entity);
}
UFUNCTION()
bool RemoveNumLimited(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_NumLimited);
}
}
FECSMonitorRuntimeView __GetMonitorNumLimitedOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_NumLimited, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorNumLimitedOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_NumLimited, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorNumLimitedOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_NumLimited, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorNumLimitedOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_NumLimited, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorNumLimitedOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_NumLimited, bFixedFrame, bMustHandleAll);
}
void __MonitorNumLimitedLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_NumLimited, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorNumLimitedActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_NumLimited, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorNumLimitedModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_NumLimited, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_NumLimitedOverrides
{
UFUNCTION()
bool HasNumLimitedOverrides(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_NumLimitedOverrides);
}
FC_NumLimitedOverrides& AssignNumLimitedOverrides(const FECSEntity &inout Entity, const FC_NumLimitedOverrides &inout DefaultValue = FC_NumLimitedOverrides())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_NumLimitedOverrides, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignNumLimitedOverrides_BP(const FECSEntity &inout Entity, const FC_NumLimitedOverrides &inout DefaultValue = FC_NumLimitedOverrides())
{
    ECSFunc_FC_NumLimitedOverrides::AssignNumLimitedOverrides(Entity, DefaultValue);
    return;
}
FC_NumLimitedOverrides& ModifyNumLimitedOverrides(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_NumLimitedOverrides));
    return local_12.GetComp();
}
FC_NumLimitedOverrides& ModifyOrAddNumLimitedOverrides(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_NumLimitedOverrides));
    return local_12.GetComp();
}
const FC_NumLimitedOverrides& GetNumLimitedOverrides(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_NumLimitedOverrides));
    return local_12.GetComp();
}
UFUNCTION()
FC_NumLimitedOverrides GetNumLimitedOverrides_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_NumLimitedOverrides& local_4 = ECSFunc_FC_NumLimitedOverrides::GetNumLimitedOverrides(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_NumLimitedOverrides();
}
const FC_NumLimitedOverrides GetDefaultedNumLimitedOverrides(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_NumLimitedOverrides __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_NumLimitedOverrides);
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
FC_NumLimitedOverrides GetDefaultedNumLimitedOverrides_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_NumLimitedOverrides::GetDefaultedNumLimitedOverrides(Entity);
}
UFUNCTION()
bool RemoveNumLimitedOverrides(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_NumLimitedOverrides);
}
}
FECSMonitorRuntimeView __GetMonitorNumLimitedOverridesOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_NumLimitedOverrides, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorNumLimitedOverridesOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_NumLimitedOverrides, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorNumLimitedOverridesOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_NumLimitedOverrides, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorNumLimitedOverridesOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_NumLimitedOverrides, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorNumLimitedOverridesOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_NumLimitedOverrides, bFixedFrame, bMustHandleAll);
}
void __MonitorNumLimitedOverridesLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_NumLimitedOverrides, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorNumLimitedOverridesActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_NumLimitedOverrides, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorNumLimitedOverridesModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_NumLimitedOverrides, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_NumLimitManager
{
UFUNCTION()
bool HasNumLimitManager(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_NumLimitManager);
}
FC_NumLimitManager& AssignNumLimitManager(const FECSEntity &inout Entity, const FC_NumLimitManager &inout DefaultValue = FC_NumLimitManager())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_NumLimitManager, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignNumLimitManager_BP(const FECSEntity &inout Entity, const FC_NumLimitManager &inout DefaultValue = FC_NumLimitManager())
{
    ECSFunc_FC_NumLimitManager::AssignNumLimitManager(Entity, DefaultValue);
    return;
}
FC_NumLimitManager& ModifyNumLimitManager(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_NumLimitManager));
    return local_12.GetComp();
}
FC_NumLimitManager& ModifyOrAddNumLimitManager(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_NumLimitManager));
    return local_12.GetComp();
}
const FC_NumLimitManager& GetNumLimitManager(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_NumLimitManager));
    return local_12.GetComp();
}
UFUNCTION()
FC_NumLimitManager GetNumLimitManager_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_NumLimitManager& local_4 = ECSFunc_FC_NumLimitManager::GetNumLimitManager(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_NumLimitManager();
}
const FC_NumLimitManager GetDefaultedNumLimitManager(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_NumLimitManager __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_NumLimitManager);
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
FC_NumLimitManager GetDefaultedNumLimitManager_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_NumLimitManager::GetDefaultedNumLimitManager(Entity);
}
UFUNCTION()
bool RemoveNumLimitManager(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_NumLimitManager);
}
}
FECSMonitorRuntimeView __GetMonitorNumLimitManagerOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_NumLimitManager, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorNumLimitManagerOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_NumLimitManager, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorNumLimitManagerOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_NumLimitManager, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorNumLimitManagerOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_NumLimitManager, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorNumLimitManagerOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_NumLimitManager, bFixedFrame, bMustHandleAll);
}
void __MonitorNumLimitManagerLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_NumLimitManager, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorNumLimitManagerActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_NumLimitManager, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorNumLimitManagerModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_NumLimitManager, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_NumLimitManagerChanged
{
UFUNCTION()
bool HasNumLimitManagerChanged(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_NumLimitManagerChanged);
}
FC_NumLimitManagerChanged& AssignNumLimitManagerChanged(const FECSEntity &inout Entity, const FC_NumLimitManagerChanged &inout DefaultValue = FC_NumLimitManagerChanged())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_NumLimitManagerChanged, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignNumLimitManagerChanged_BP(const FECSEntity &inout Entity, const FC_NumLimitManagerChanged &inout DefaultValue = FC_NumLimitManagerChanged())
{
    ECSFunc_FC_NumLimitManagerChanged::AssignNumLimitManagerChanged(Entity, DefaultValue);
    return;
}
FC_NumLimitManagerChanged& ModifyNumLimitManagerChanged(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_NumLimitManagerChanged));
    return local_12.GetComp();
}
FC_NumLimitManagerChanged& ModifyOrAddNumLimitManagerChanged(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_NumLimitManagerChanged));
    return local_12.GetComp();
}
const FC_NumLimitManagerChanged& GetNumLimitManagerChanged(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_NumLimitManagerChanged));
    return local_12.GetComp();
}
UFUNCTION()
FC_NumLimitManagerChanged GetNumLimitManagerChanged_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_NumLimitManagerChanged __r;
    bValid = false;
    bValid = ECSFunc_FC_NumLimitManagerChanged::GetNumLimitManagerChanged(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_NumLimitManagerChanged GetDefaultedNumLimitManagerChanged(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_NumLimitManagerChanged __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_NumLimitManagerChanged);
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
FC_NumLimitManagerChanged GetDefaultedNumLimitManagerChanged_BP(const FECSEntity &inout Entity)
{
    FC_NumLimitManagerChanged __r;
    return __r;
}
UFUNCTION()
bool RemoveNumLimitManagerChanged(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_NumLimitManagerChanged);
}
}
FECSMonitorRuntimeView __GetMonitorNumLimitManagerChangedOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_NumLimitManagerChanged, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorNumLimitManagerChangedOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_NumLimitManagerChanged, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorNumLimitManagerChangedOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_NumLimitManagerChanged, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorNumLimitManagerChangedOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_NumLimitManagerChanged, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorNumLimitManagerChangedOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_NumLimitManagerChanged, bFixedFrame, bMustHandleAll);
}
void __MonitorNumLimitManagerChangedLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_NumLimitManagerChanged, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorNumLimitManagerChangedActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_NumLimitManagerChanged, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorNumLimitManagerChangedModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_NumLimitManagerChanged, bFixedFrame, Details);
    return;
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_NumLimitedOverrides &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_NumLimitedOverrides &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_NumLimitedOverrides &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_NumLimitedOverrides
{
int __IndexOf_ModifierItems()
{
    return 0;
}
int __IndexOf_DefaultItems()
{
    return 1;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_NumLimitManager &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_NumLimitManager &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_NumLimitManager &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_NumLimitManager
{
int __IndexOf_ManagerItems()
{
    return 0;
}
}
