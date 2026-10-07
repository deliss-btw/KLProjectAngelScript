
enum EEcologySchedulerLevel
{
    PerFrame,
    High,
    Middle,
    Step,
    Max,
}

namespace __INTENRAL_FC_ControlByEcologySchedulerTag_NS
{
    const TECSComponentDerivedPtr<FC_ControlByEcologySchedulerTag> DerivedPtr = TECSComponentDerivedPtr<FC_ControlByEcologySchedulerTag>();
    const FC_ControlByEcologySchedulerTag DefaultValue = FC_ControlByEcologySchedulerTag();
}
namespace __INTENRAL_FC_EcologyAllowedToUpdateThisFrameTag_NS
{
    const TECSComponentDerivedPtr<FC_EcologyAllowedToUpdateThisFrameTag> DerivedPtr = TECSComponentDerivedPtr<FC_EcologyAllowedToUpdateThisFrameTag>();
    const FC_EcologyAllowedToUpdateThisFrameTag DefaultValue = FC_EcologyAllowedToUpdateThisFrameTag();
}
namespace __INTENRAL_FC_EcologyForceScheduledUpdateTag_NS
{
    const TECSComponentDerivedPtr<FC_EcologyForceScheduledUpdateTag> DerivedPtr = TECSComponentDerivedPtr<FC_EcologyForceScheduledUpdateTag>();
    const FC_EcologyForceScheduledUpdateTag DefaultValue = FC_EcologyForceScheduledUpdateTag();
}
namespace __INTENRAL_FC_EcologyScheduledAlwaysUpdateTag_NS
{
    const TECSComponentDerivedPtr<FC_EcologyScheduledAlwaysUpdateTag> DerivedPtr = TECSComponentDerivedPtr<FC_EcologyScheduledAlwaysUpdateTag>();
    const FC_EcologyScheduledAlwaysUpdateTag DefaultValue = FC_EcologyScheduledAlwaysUpdateTag();
}
namespace __INTENRAL_FC_EcologySchedulerUnit_NS
{
    const TECSComponentDerivedPtr<FC_EcologySchedulerUnit> DerivedPtr = TECSComponentDerivedPtr<FC_EcologySchedulerUnit>();
    const FC_EcologySchedulerUnit DefaultValue = FC_EcologySchedulerUnit();
}
namespace __INTENRAL_FCS_EcologyScheduler_NS
{
    const TECSComponentDerivedPtr<FCS_EcologyScheduler> DerivedPtr = TECSComponentDerivedPtr<FCS_EcologyScheduler>();
    const FCS_EcologyScheduler DefaultValue = FCS_EcologyScheduler();

}
struct FLegacyEntityArrayContainer
{
    UPROPERTY()
    TArray<FECSEntity> PendingActivityGroups;
    UPROPERTY()
    int Step = 0;


    FECSEntity Current()
    {
        return this[this.Step];
    }
    bool IsEmpty() const
    {
        return (this.Step >= this.Num());
    }
    bool MoveNext()
    {
        ++this.Step;
        if (this.Step >= this.Num())
        {
            this.Empty(0);
            this.Step = 0;
            return false;
        }
        return true;
    }
    void Add(const FECSEntity &inout Entity)
    {
        this.Add(Entity);
        return;
    }
    void Append(const TSet<FECSEntity> &inout Entities)
    {
        ::AppendSet(this, Entities);
        return;
    }
}

struct FEntitySchedulerContainer
{
    UPROPERTY()
    TArray<FECSEntityId> PendingStepGroups;
    UPROPERTY()
    TSet<FECSEntityId> AllEntity;
    UPROPERTY()
    bool bAutoRefreshPendingGroups = false;
    UPROPERTY()
    int Step = 0;


    FECSEntityId Current()
    {
        if (this.Step >= this.Num())
        {
            return ENTITY_ID_NULL;
        }
        return this[this.Step];
    }
    bool IsEmpty() const
    {
        return (this.Step >= this.Num());
    }
    void ResetStepGroups()
    {
        this.Empty(0);
        this.Step = 0;
        if (this.bAutoRefreshPendingGroups)
        {
            ::AppendSet(this, this.AllEntity);
        }
        return;
    }
    bool MoveNext()
    {
        ++this.Step;
        if (this.Step >= this.Num())
        {
            this.ResetStepGroups();
            return (this.Num() > 0);
        }
        return true;
    }
    void AddToPending(const FECSEntityId &inout Entity)
    {
        this.Add(Entity);
        return;
    }
    void AppendToPending(const TSet<FECSEntityId> &inout Entities)
    {
        ::AppendSet(this, Entities);
        return;
    }
    void Add(const FECSEntityId &inout Entity)
    {
        this.AllEntity.Add(Entity);
        if (this.bAutoRefreshPendingGroups)
        {
            this.Add(Entity);
        }
        return;
    }
    void Remove(const FECSEntityId &inout Entity)
    {
        return;
    }
    int AllNum()
    {
        return this.AllEntity.Num();
    }
    const TSet<FECSEntityId> GetAllEntity()
    {
        const TSet<FECSEntityId> __r;
        return __r;
    }
}

struct FC_ControlByEcologySchedulerTag : FECSComponent
{
    FC_ControlByEcologySchedulerTag()
    {
        return;
    }
}

struct FC_EcologyAllowedToUpdateThisFrameTag : FECSComponent
{
    FC_EcologyAllowedToUpdateThisFrameTag()
    {
        return;
    }
}

struct FC_EcologyForceScheduledUpdateTag : FECSComponent
{
    FC_EcologyForceScheduledUpdateTag()
    {
        return;
    }
}

struct FC_EcologyScheduledAlwaysUpdateTag : FECSComponent
{
    FC_EcologyScheduledAlwaysUpdateTag()
    {
        return;
    }
}

struct FC_EcologySchedulerUnit : FECSComponent
{
    UPROPERTY()
    EEcologySchedulerLevel CurrentScedulerLevel = EEcologySchedulerLevel(4);


}

struct FCS_EcologyScheduler : FECSSingleton
{
    UPROPERTY()
    TArray<FEntitySchedulerContainer> AllUnits;
    UPROPERTY()
    TSet<FECSEntityId> CurrentFrameUpdateEntity;

    FCS_EcologyScheduler()
    {
        return;
    }
    void Setup()
    {
        this.SetNum(4);
        this[1].bAutoRefreshPendingGroups = true;
        this[2].bAutoRefreshPendingGroups = true;
        this[3].bAutoRefreshPendingGroups = true;
        return;
    }
    void UpdateSchedulerUnit(const FECSEntity &inout Entity, const EEcologySchedulerLevel NewLevel, const EEcologySchedulerLevel OldLevel = EEcologySchedulerLevel::Max)
    {
        if (int(OldLevel) == int(NewLevel))
        {
            return;
        }
        if (int(OldLevel) != 4 && this.IsValidIndex(int(OldLevel)))
        {
            FECSEntityId local_5 = Entity.GetId();
            int local_1 = int(OldLevel);
        }
        if (int(NewLevel) != 4 && this.IsValidIndex(int(NewLevel)))
        {
            this[int(NewLevel)].Add(Entity.GetId());
        }
        if (int(NewLevel) == 0)
        {
            FC_EcologyScheduledAlwaysUpdateTag local_12;
            Assign local_10;
            local_10.opCall(local_12);
            return;
        }
        if (int(OldLevel) == 0)
        {
            Remove local_16;
            local_16.opCall();
        }
        return;
    }
}

namespace ECSFunc_FC_ControlByEcologySchedulerTag
{
UFUNCTION()
bool HasControlByEcologySchedulerTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_ControlByEcologySchedulerTag);
}
FC_ControlByEcologySchedulerTag& AssignControlByEcologySchedulerTag(const FECSEntity &inout Entity, const FC_ControlByEcologySchedulerTag &inout DefaultValue = FC_ControlByEcologySchedulerTag())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_ControlByEcologySchedulerTag, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignControlByEcologySchedulerTag_BP(const FECSEntity &inout Entity, const FC_ControlByEcologySchedulerTag &inout DefaultValue = FC_ControlByEcologySchedulerTag())
{
    ECSFunc_FC_ControlByEcologySchedulerTag::AssignControlByEcologySchedulerTag(Entity, DefaultValue);
    return;
}
FC_ControlByEcologySchedulerTag& ModifyControlByEcologySchedulerTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_ControlByEcologySchedulerTag));
    return local_12.GetComp();
}
FC_ControlByEcologySchedulerTag& ModifyOrAddControlByEcologySchedulerTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_ControlByEcologySchedulerTag));
    return local_12.GetComp();
}
const FC_ControlByEcologySchedulerTag& GetControlByEcologySchedulerTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_ControlByEcologySchedulerTag));
    return local_12.GetComp();
}
UFUNCTION()
FC_ControlByEcologySchedulerTag GetControlByEcologySchedulerTag_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_ControlByEcologySchedulerTag& local_4 = ECSFunc_FC_ControlByEcologySchedulerTag::GetControlByEcologySchedulerTag(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_ControlByEcologySchedulerTag();
}
const FC_ControlByEcologySchedulerTag GetDefaultedControlByEcologySchedulerTag(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_ControlByEcologySchedulerTag __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_ControlByEcologySchedulerTag);
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
FC_ControlByEcologySchedulerTag GetDefaultedControlByEcologySchedulerTag_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_ControlByEcologySchedulerTag::GetDefaultedControlByEcologySchedulerTag(Entity);
}
UFUNCTION()
bool RemoveControlByEcologySchedulerTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_ControlByEcologySchedulerTag);
}
}
FECSMonitorRuntimeView __GetMonitorControlByEcologySchedulerTagOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_ControlByEcologySchedulerTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorControlByEcologySchedulerTagOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_ControlByEcologySchedulerTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorControlByEcologySchedulerTagOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_ControlByEcologySchedulerTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorControlByEcologySchedulerTagOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_ControlByEcologySchedulerTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorControlByEcologySchedulerTagOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_ControlByEcologySchedulerTag, bFixedFrame, bMustHandleAll);
}
void __MonitorControlByEcologySchedulerTagLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_ControlByEcologySchedulerTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorControlByEcologySchedulerTagActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_ControlByEcologySchedulerTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorControlByEcologySchedulerTagModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_ControlByEcologySchedulerTag, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_EcologyAllowedToUpdateThisFrameTag
{
UFUNCTION()
bool HasEcologyAllowedToUpdateThisFrameTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_EcologyAllowedToUpdateThisFrameTag);
}
FC_EcologyAllowedToUpdateThisFrameTag& AssignEcologyAllowedToUpdateThisFrameTag(const FECSEntity &inout Entity, const FC_EcologyAllowedToUpdateThisFrameTag &inout DefaultValue = FC_EcologyAllowedToUpdateThisFrameTag())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_EcologyAllowedToUpdateThisFrameTag, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignEcologyAllowedToUpdateThisFrameTag_BP(const FECSEntity &inout Entity, const FC_EcologyAllowedToUpdateThisFrameTag &inout DefaultValue = FC_EcologyAllowedToUpdateThisFrameTag())
{
    ECSFunc_FC_EcologyAllowedToUpdateThisFrameTag::AssignEcologyAllowedToUpdateThisFrameTag(Entity, DefaultValue);
    return;
}
FC_EcologyAllowedToUpdateThisFrameTag& ModifyEcologyAllowedToUpdateThisFrameTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_EcologyAllowedToUpdateThisFrameTag));
    return local_12.GetComp();
}
FC_EcologyAllowedToUpdateThisFrameTag& ModifyOrAddEcologyAllowedToUpdateThisFrameTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_EcologyAllowedToUpdateThisFrameTag));
    return local_12.GetComp();
}
const FC_EcologyAllowedToUpdateThisFrameTag& GetEcologyAllowedToUpdateThisFrameTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_EcologyAllowedToUpdateThisFrameTag));
    return local_12.GetComp();
}
UFUNCTION()
FC_EcologyAllowedToUpdateThisFrameTag GetEcologyAllowedToUpdateThisFrameTag_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_EcologyAllowedToUpdateThisFrameTag& local_4 = ECSFunc_FC_EcologyAllowedToUpdateThisFrameTag::GetEcologyAllowedToUpdateThisFrameTag(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_EcologyAllowedToUpdateThisFrameTag();
}
const FC_EcologyAllowedToUpdateThisFrameTag GetDefaultedEcologyAllowedToUpdateThisFrameTag(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_EcologyAllowedToUpdateThisFrameTag __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_EcologyAllowedToUpdateThisFrameTag);
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
FC_EcologyAllowedToUpdateThisFrameTag GetDefaultedEcologyAllowedToUpdateThisFrameTag_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_EcologyAllowedToUpdateThisFrameTag::GetDefaultedEcologyAllowedToUpdateThisFrameTag(Entity);
}
UFUNCTION()
bool RemoveEcologyAllowedToUpdateThisFrameTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_EcologyAllowedToUpdateThisFrameTag);
}
}
FECSMonitorRuntimeView __GetMonitorEcologyAllowedToUpdateThisFrameTagOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_EcologyAllowedToUpdateThisFrameTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcologyAllowedToUpdateThisFrameTagOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_EcologyAllowedToUpdateThisFrameTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcologyAllowedToUpdateThisFrameTagOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_EcologyAllowedToUpdateThisFrameTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcologyAllowedToUpdateThisFrameTagOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_EcologyAllowedToUpdateThisFrameTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcologyAllowedToUpdateThisFrameTagOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_EcologyAllowedToUpdateThisFrameTag, bFixedFrame, bMustHandleAll);
}
void __MonitorEcologyAllowedToUpdateThisFrameTagLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_EcologyAllowedToUpdateThisFrameTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcologyAllowedToUpdateThisFrameTagActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_EcologyAllowedToUpdateThisFrameTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcologyAllowedToUpdateThisFrameTagModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_EcologyAllowedToUpdateThisFrameTag, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_EcologyForceScheduledUpdateTag
{
UFUNCTION()
bool HasEcologyForceScheduledUpdateTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_EcologyForceScheduledUpdateTag);
}
FC_EcologyForceScheduledUpdateTag& AssignEcologyForceScheduledUpdateTag(const FECSEntity &inout Entity, const FC_EcologyForceScheduledUpdateTag &inout DefaultValue = FC_EcologyForceScheduledUpdateTag())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_EcologyForceScheduledUpdateTag, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignEcologyForceScheduledUpdateTag_BP(const FECSEntity &inout Entity, const FC_EcologyForceScheduledUpdateTag &inout DefaultValue = FC_EcologyForceScheduledUpdateTag())
{
    ECSFunc_FC_EcologyForceScheduledUpdateTag::AssignEcologyForceScheduledUpdateTag(Entity, DefaultValue);
    return;
}
FC_EcologyForceScheduledUpdateTag& ModifyEcologyForceScheduledUpdateTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_EcologyForceScheduledUpdateTag));
    return local_12.GetComp();
}
FC_EcologyForceScheduledUpdateTag& ModifyOrAddEcologyForceScheduledUpdateTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_EcologyForceScheduledUpdateTag));
    return local_12.GetComp();
}
const FC_EcologyForceScheduledUpdateTag& GetEcologyForceScheduledUpdateTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_EcologyForceScheduledUpdateTag));
    return local_12.GetComp();
}
UFUNCTION()
FC_EcologyForceScheduledUpdateTag GetEcologyForceScheduledUpdateTag_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_EcologyForceScheduledUpdateTag& local_4 = ECSFunc_FC_EcologyForceScheduledUpdateTag::GetEcologyForceScheduledUpdateTag(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_EcologyForceScheduledUpdateTag();
}
const FC_EcologyForceScheduledUpdateTag GetDefaultedEcologyForceScheduledUpdateTag(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_EcologyForceScheduledUpdateTag __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_EcologyForceScheduledUpdateTag);
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
FC_EcologyForceScheduledUpdateTag GetDefaultedEcologyForceScheduledUpdateTag_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_EcologyForceScheduledUpdateTag::GetDefaultedEcologyForceScheduledUpdateTag(Entity);
}
UFUNCTION()
bool RemoveEcologyForceScheduledUpdateTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_EcologyForceScheduledUpdateTag);
}
}
FECSMonitorRuntimeView __GetMonitorEcologyForceScheduledUpdateTagOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_EcologyForceScheduledUpdateTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcologyForceScheduledUpdateTagOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_EcologyForceScheduledUpdateTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcologyForceScheduledUpdateTagOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_EcologyForceScheduledUpdateTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcologyForceScheduledUpdateTagOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_EcologyForceScheduledUpdateTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcologyForceScheduledUpdateTagOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_EcologyForceScheduledUpdateTag, bFixedFrame, bMustHandleAll);
}
void __MonitorEcologyForceScheduledUpdateTagLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_EcologyForceScheduledUpdateTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcologyForceScheduledUpdateTagActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_EcologyForceScheduledUpdateTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcologyForceScheduledUpdateTagModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_EcologyForceScheduledUpdateTag, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_EcologyScheduledAlwaysUpdateTag
{
UFUNCTION()
bool HasEcologyScheduledAlwaysUpdateTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_EcologyScheduledAlwaysUpdateTag);
}
FC_EcologyScheduledAlwaysUpdateTag& AssignEcologyScheduledAlwaysUpdateTag(const FECSEntity &inout Entity, const FC_EcologyScheduledAlwaysUpdateTag &inout DefaultValue = FC_EcologyScheduledAlwaysUpdateTag())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_EcologyScheduledAlwaysUpdateTag, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignEcologyScheduledAlwaysUpdateTag_BP(const FECSEntity &inout Entity, const FC_EcologyScheduledAlwaysUpdateTag &inout DefaultValue = FC_EcologyScheduledAlwaysUpdateTag())
{
    ECSFunc_FC_EcologyScheduledAlwaysUpdateTag::AssignEcologyScheduledAlwaysUpdateTag(Entity, DefaultValue);
    return;
}
FC_EcologyScheduledAlwaysUpdateTag& ModifyEcologyScheduledAlwaysUpdateTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_EcologyScheduledAlwaysUpdateTag));
    return local_12.GetComp();
}
FC_EcologyScheduledAlwaysUpdateTag& ModifyOrAddEcologyScheduledAlwaysUpdateTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_EcologyScheduledAlwaysUpdateTag));
    return local_12.GetComp();
}
const FC_EcologyScheduledAlwaysUpdateTag& GetEcologyScheduledAlwaysUpdateTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_EcologyScheduledAlwaysUpdateTag));
    return local_12.GetComp();
}
UFUNCTION()
FC_EcologyScheduledAlwaysUpdateTag GetEcologyScheduledAlwaysUpdateTag_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_EcologyScheduledAlwaysUpdateTag& local_4 = ECSFunc_FC_EcologyScheduledAlwaysUpdateTag::GetEcologyScheduledAlwaysUpdateTag(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_EcologyScheduledAlwaysUpdateTag();
}
const FC_EcologyScheduledAlwaysUpdateTag GetDefaultedEcologyScheduledAlwaysUpdateTag(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_EcologyScheduledAlwaysUpdateTag __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_EcologyScheduledAlwaysUpdateTag);
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
FC_EcologyScheduledAlwaysUpdateTag GetDefaultedEcologyScheduledAlwaysUpdateTag_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_EcologyScheduledAlwaysUpdateTag::GetDefaultedEcologyScheduledAlwaysUpdateTag(Entity);
}
UFUNCTION()
bool RemoveEcologyScheduledAlwaysUpdateTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_EcologyScheduledAlwaysUpdateTag);
}
}
FECSMonitorRuntimeView __GetMonitorEcologyScheduledAlwaysUpdateTagOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_EcologyScheduledAlwaysUpdateTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcologyScheduledAlwaysUpdateTagOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_EcologyScheduledAlwaysUpdateTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcologyScheduledAlwaysUpdateTagOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_EcologyScheduledAlwaysUpdateTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcologyScheduledAlwaysUpdateTagOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_EcologyScheduledAlwaysUpdateTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcologyScheduledAlwaysUpdateTagOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_EcologyScheduledAlwaysUpdateTag, bFixedFrame, bMustHandleAll);
}
void __MonitorEcologyScheduledAlwaysUpdateTagLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_EcologyScheduledAlwaysUpdateTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcologyScheduledAlwaysUpdateTagActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_EcologyScheduledAlwaysUpdateTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcologyScheduledAlwaysUpdateTagModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_EcologyScheduledAlwaysUpdateTag, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_EcologySchedulerUnit
{
UFUNCTION()
bool HasEcologySchedulerUnit(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_EcologySchedulerUnit);
}
FC_EcologySchedulerUnit& AssignEcologySchedulerUnit(const FECSEntity &inout Entity, const FC_EcologySchedulerUnit &inout DefaultValue = FC_EcologySchedulerUnit())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_EcologySchedulerUnit, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignEcologySchedulerUnit_BP(const FECSEntity &inout Entity, const FC_EcologySchedulerUnit &inout DefaultValue = FC_EcologySchedulerUnit())
{
    ECSFunc_FC_EcologySchedulerUnit::AssignEcologySchedulerUnit(Entity, DefaultValue);
    return;
}
FC_EcologySchedulerUnit& ModifyEcologySchedulerUnit(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_EcologySchedulerUnit));
    return local_12.GetComp();
}
FC_EcologySchedulerUnit& ModifyOrAddEcologySchedulerUnit(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_EcologySchedulerUnit));
    return local_12.GetComp();
}
const FC_EcologySchedulerUnit& GetEcologySchedulerUnit(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_EcologySchedulerUnit));
    return local_12.GetComp();
}
UFUNCTION()
FC_EcologySchedulerUnit GetEcologySchedulerUnit_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_EcologySchedulerUnit& local_4 = ECSFunc_FC_EcologySchedulerUnit::GetEcologySchedulerUnit(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_EcologySchedulerUnit();
}
const FC_EcologySchedulerUnit GetDefaultedEcologySchedulerUnit(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_EcologySchedulerUnit __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_EcologySchedulerUnit);
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
FC_EcologySchedulerUnit GetDefaultedEcologySchedulerUnit_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_EcologySchedulerUnit::GetDefaultedEcologySchedulerUnit(Entity);
}
UFUNCTION()
bool RemoveEcologySchedulerUnit(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_EcologySchedulerUnit);
}
}
FECSMonitorRuntimeView __GetMonitorEcologySchedulerUnitOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_EcologySchedulerUnit, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcologySchedulerUnitOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_EcologySchedulerUnit, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcologySchedulerUnitOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_EcologySchedulerUnit, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcologySchedulerUnitOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_EcologySchedulerUnit, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcologySchedulerUnitOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_EcologySchedulerUnit, bFixedFrame, bMustHandleAll);
}
void __MonitorEcologySchedulerUnitLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_EcologySchedulerUnit, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcologySchedulerUnitActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_EcologySchedulerUnit, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcologySchedulerUnitModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_EcologySchedulerUnit, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FCS_EcologyScheduler
{
UFUNCTION()
bool HasEcologyScheduler(const FECSWorldPtr &inout World)
{
    return ECSInternal::Has(World, ENTITY_ID_NULL, FCS_EcologyScheduler);
}
FCS_EcologyScheduler& AssignEcologyScheduler(const FECSWorldPtr &inout World, const FCS_EcologyScheduler &inout DefaultValue = FCS_EcologyScheduler())
{
    UScriptStruct local_6 = FCS_EcologyScheduler;
    FECSComponentPtr local_8;
    int local_10 = local_8 = ECSInternal::Assign(World, ENTITY_ID_NULL, local_6, FECSComponentPtr(DefaultValue));
    local_10.InternalSet(local_8);
    return local_10.GetComp();
}
UFUNCTION()
void AssignEcologyScheduler_BP(const FECSWorldPtr &inout World, const FCS_EcologyScheduler &inout DefaultValue = FCS_EcologyScheduler())
{
    ECSFunc_FCS_EcologyScheduler::AssignEcologyScheduler(World, DefaultValue);
    return;
}
FCS_EcologyScheduler& ModifyEcologyScheduler(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_EcologyScheduler;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Modify(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
FCS_EcologyScheduler& ModifyOrAddEcologyScheduler(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_EcologyScheduler;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::ModifyOrAdd(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
const FCS_EcologyScheduler& GetEcologyScheduler(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_EcologyScheduler;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Get(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
UFUNCTION()
FCS_EcologyScheduler GetEcologyScheduler_BP(const FECSWorldPtr &inout World, bool &out bValid)
{
    FCS_EcologyScheduler __r;
    bValid = false;
    bValid = ECSFunc_FCS_EcologyScheduler::GetEcologyScheduler(World);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FCS_EcologyScheduler GetDefaultedEcologyScheduler(const FECSWorldPtr &inout World)
{
    int local_10 = 0;
    const FCS_EcologyScheduler __r;
    FECSComponentPtr local_6 = ECSInternal::GetDefaulted(World, ENTITY_ID_NULL, FCS_EcologyScheduler);
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
FCS_EcologyScheduler GetDefaultedEcologyScheduler_BP(const FECSWorldPtr &inout World)
{
    FCS_EcologyScheduler __r;
    return __r;
}
UFUNCTION()
bool RemoveEcologyScheduler(const FECSWorldPtr &inout World)
{
    return ECSInternal::Remove(World, ENTITY_ID_NULL, FCS_EcologyScheduler);
}
}
void __MonitorEcologySchedulerLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FCS_EcologyScheduler, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcologySchedulerActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FCS_EcologyScheduler, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcologySchedulerModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FCS_EcologyScheduler, bFixedFrame, Details);
    return;
}
