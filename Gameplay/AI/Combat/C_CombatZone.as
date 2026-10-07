
enum EEntityCombatZoneGroupUpdateType
{
    Add,
    Remove,
}

namespace __INTENRAL_FCS_CombatZoneManager_NS
{
    const TECSComponentDerivedPtr<FCS_CombatZoneManager> DerivedPtr = TECSComponentDerivedPtr<FCS_CombatZoneManager>();
    const FCS_CombatZoneManager DefaultValue = FCS_CombatZoneManager();
}
namespace __INTENRAL_FCS_CombatZoneEntityNeedUpdateTag_NS
{
    const TECSComponentDerivedPtr<FCS_CombatZoneEntityNeedUpdateTag> DerivedPtr = TECSComponentDerivedPtr<FCS_CombatZoneEntityNeedUpdateTag>();
    const FCS_CombatZoneEntityNeedUpdateTag DefaultValue = FCS_CombatZoneEntityNeedUpdateTag();
}
namespace __INTENRAL_FC_CombatZone_NS
{
    const TECSComponentDerivedPtr<FC_CombatZone> DerivedPtr = TECSComponentDerivedPtr<FC_CombatZone>();
    const FC_CombatZone DefaultValue = FC_CombatZone();
}
namespace __INTENRAL_FC_CombatGroup_NS
{
    const TECSComponentDerivedPtr<FC_CombatGroup> DerivedPtr = TECSComponentDerivedPtr<FC_CombatGroup>();
    const FC_CombatGroup DefaultValue = FC_CombatGroup();
}
namespace __INTENRAL_FC_CombatGroupMember_NS
{
    const TECSComponentDerivedPtr<FC_CombatGroupMember> DerivedPtr = TECSComponentDerivedPtr<FC_CombatGroupMember>();
    const FC_CombatGroupMember DefaultValue = FC_CombatGroupMember();
}
namespace __INTENRAL_FC_CombatMemberInCombatVolumeTag_NS
{
    const TECSComponentDerivedPtr<FC_CombatMemberInCombatVolumeTag> DerivedPtr = TECSComponentDerivedPtr<FC_CombatMemberInCombatVolumeTag>();
    const FC_CombatMemberInCombatVolumeTag DefaultValue = FC_CombatMemberInCombatVolumeTag();

}
struct FZoneCombatEntityUpdateRequest
{
    UPROPERTY()
    FECSEntityId EntityId;
    UPROPERTY()
    FECSEntityId GroupId;
    UPROPERTY()
    EEntityCombatZoneGroupUpdateType UpdateType;


}

struct FCombatGroupHandle
{
    UPROPERTY()
    EFaction Faction;
    UPROPERTY()
    FECSEntityId GroupId;


    uint Hash() const
    {
        int local_1 = HashCombine(0, int(this.Faction));
        int local_2 = this.GroupId;
        local_1 = HashCombine(local_1, local_2);
        return local_1;
    }
}

struct FCS_CombatZoneManager : FECSSingleton
{
    UPROPERTY()
    TArray<FECSEntity> CombatZones;
    UPROPERTY()
    TArray<FZoneCombatEntityUpdateRequest> CombatZoneEntityUpdateRequests;

    FCS_CombatZoneManager()
    {
        return;
    }
    void RequestAddZoneCombatEntity(const FECSEntityId &inout EntityId, const FECSEntityId &inout CurrentGroupId = ENTITY_ID_NULL)
    {
        if ((this.FindUpdateRequest(EntityId) == nullptr))
        {
            FZoneCombatEntityUpdateRequest local_8;
            local_8.EntityId = EntityId;
            local_8.GroupId = CurrentGroupId;
            local_8.UpdateType = EEntityCombatZoneGroupUpdateType(0);
            this.CombatZoneEntityUpdateRequests.Add(local_8);
        }
        return;
    }
    void RequestRemoveZoneCombatEntity(const FECSEntityId &inout EntityId, const FECSEntityId &inout GroupId)
    {
        if ((GroupId == ENTITY_ID_NULL))
        {
            return;
        }
        TRawPtr<FZoneCombatEntityUpdateRequest> local_4 = this.FindUpdateRequest(EntityId);
        if ((local_4 == nullptr))
        {
            FZoneCombatEntityUpdateRequest local_10;
            this.CombatZoneEntityUpdateRequests.Add(local_10);
            local_4 = this.CombatZoneEntityUpdateRequests[(this.CombatZoneEntityUpdateRequests.Num() - 1)];
        }
        if ((!((local_4 == nullptr))))
        {
            local_4.opArrow().EntityId = EntityId;
            local_4.opArrow().GroupId = GroupId;
            local_4.opArrow().UpdateType = EEntityCombatZoneGroupUpdateType(1);
        }
        return;
    }
    TRawPtr<FZoneCombatEntityUpdateRequest> FindUpdateRequest(const FECSEntityId &inout EntityId)
    {
        int local_1 = 0;
        for (; local_1 < this.CombatZoneEntityUpdateRequests.Num(); ++local_1)
        {
            if ((FECSEntityId(this.CombatZoneEntityUpdateRequests[local_1].EntityId) == EntityId))
            {
                return TRawPtr<FZoneCombatEntityUpdateRequest>(this.CombatZoneEntityUpdateRequests[local_1]);
            }
        }
        return TRawPtr<FZoneCombatEntityUpdateRequest>(nullptr);
    }
}

struct FCS_CombatZoneEntityNeedUpdateTag : FECSSingleton
{
    FCS_CombatZoneEntityNeedUpdateTag()
    {
        return;
    }
}

struct FC_CombatZone : FECSComponent
{
    UPROPERTY()
    bool bMerged = false;
    UPROPERTY()
    FVector2D ZoneCenter;
    UPROPERTY()
    int ZoneEntitiesNum = 0;
    UPROPERTY()
    FVector2D ZoneEntitiesCenter;
    UPROPERTY()
    TArray<AECSRegionVolumeBase> CombatVolumes;
    UPROPERTY()
    TArray<FCombatGroupHandle> CombatGroups;


    FECSEntityId FindCombatGroup(const EFaction Faction) const
    {
        for (auto& local_16 : this.CombatGroups)
        {
            if (int(local_16.Faction) == int(Faction))
            {
                return local_16.GroupId;
            }
        }
        return ENTITY_ID_NULL;
    }
    bool RemoveCombatGroup(const FECSEntityId &inout GroupId)
    {
        int local_1 = 0;
        for (; local_1 < this.CombatGroups.Num(); ++local_1)
        {
            if ((FECSEntityId(this.CombatGroups[local_1].GroupId) == GroupId))
            {
                this.CombatGroups.RemoveAt(local_1);
                return true;
            }
        }
        return false;
    }
}

struct FC_CombatGroup : FECSComponent
{
    UPROPERTY()
    FECSEntity Zone;
    UPROPERTY()
    TArray<FECSEntity> Members;

    FC_CombatGroup()
    {
        return;
    }
}

struct FC_CombatGroupMember : FECSComponent
{
    UPROPERTY()
    FECSEntityId ZoneId;
    UPROPERTY()
    FECSEntityId GroupId;

    FC_CombatGroupMember()
    {
        return;
    }
    void UpdateBelongGroup(const FECSEntityId &inout InZoneId, const FECSEntityId &inout InGroupId)
    {
        this.GroupId = InGroupId;
        return;
    }
}

struct FC_CombatMemberInCombatVolumeTag : FECSComponent
{
    FC_CombatMemberInCombatVolumeTag()
    {
        return;
    }
}

namespace ECSFunc_FCS_CombatZoneManager
{
UFUNCTION()
bool HasCombatZoneManager(const FECSWorldPtr &inout World)
{
    return ECSInternal::Has(World, ENTITY_ID_NULL, FCS_CombatZoneManager);
}
FCS_CombatZoneManager& AssignCombatZoneManager(const FECSWorldPtr &inout World, const FCS_CombatZoneManager &inout DefaultValue = FCS_CombatZoneManager())
{
    UScriptStruct local_6 = FCS_CombatZoneManager;
    FECSComponentPtr local_8;
    int local_10 = local_8 = ECSInternal::Assign(World, ENTITY_ID_NULL, local_6, FECSComponentPtr(DefaultValue));
    local_10.InternalSet(local_8);
    return local_10.GetComp();
}
UFUNCTION()
void AssignCombatZoneManager_BP(const FECSWorldPtr &inout World, const FCS_CombatZoneManager &inout DefaultValue = FCS_CombatZoneManager())
{
    ECSFunc_FCS_CombatZoneManager::AssignCombatZoneManager(World, DefaultValue);
    return;
}
FCS_CombatZoneManager& ModifyCombatZoneManager(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_CombatZoneManager;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Modify(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
FCS_CombatZoneManager& ModifyOrAddCombatZoneManager(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_CombatZoneManager;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::ModifyOrAdd(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
const FCS_CombatZoneManager& GetCombatZoneManager(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_CombatZoneManager;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Get(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
UFUNCTION()
FCS_CombatZoneManager GetCombatZoneManager_BP(const FECSWorldPtr &inout World, bool &out bValid)
{
    FCS_CombatZoneManager __r;
    bValid = false;
    bValid = ECSFunc_FCS_CombatZoneManager::GetCombatZoneManager(World);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FCS_CombatZoneManager GetDefaultedCombatZoneManager(const FECSWorldPtr &inout World)
{
    int local_10 = 0;
    const FCS_CombatZoneManager __r;
    FECSComponentPtr local_6 = ECSInternal::GetDefaulted(World, ENTITY_ID_NULL, FCS_CombatZoneManager);
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
FCS_CombatZoneManager GetDefaultedCombatZoneManager_BP(const FECSWorldPtr &inout World)
{
    FCS_CombatZoneManager __r;
    return __r;
}
UFUNCTION()
bool RemoveCombatZoneManager(const FECSWorldPtr &inout World)
{
    return ECSInternal::Remove(World, ENTITY_ID_NULL, FCS_CombatZoneManager);
}
}
void __MonitorCombatZoneManagerLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FCS_CombatZoneManager, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCombatZoneManagerActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FCS_CombatZoneManager, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCombatZoneManagerModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FCS_CombatZoneManager, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FCS_CombatZoneEntityNeedUpdateTag
{
UFUNCTION()
bool HasCombatZoneEntityNeedUpdateTag(const FECSWorldPtr &inout World)
{
    return ECSInternal::Has(World, ENTITY_ID_NULL, FCS_CombatZoneEntityNeedUpdateTag);
}
FCS_CombatZoneEntityNeedUpdateTag& AssignCombatZoneEntityNeedUpdateTag(const FECSWorldPtr &inout World, const FCS_CombatZoneEntityNeedUpdateTag &inout DefaultValue = FCS_CombatZoneEntityNeedUpdateTag())
{
    UScriptStruct local_6 = FCS_CombatZoneEntityNeedUpdateTag;
    FECSComponentPtr local_8;
    int local_10 = local_8 = ECSInternal::Assign(World, ENTITY_ID_NULL, local_6, FECSComponentPtr(DefaultValue));
    local_10.InternalSet(local_8);
    return local_10.GetComp();
}
UFUNCTION()
void AssignCombatZoneEntityNeedUpdateTag_BP(const FECSWorldPtr &inout World, const FCS_CombatZoneEntityNeedUpdateTag &inout DefaultValue = FCS_CombatZoneEntityNeedUpdateTag())
{
    ECSFunc_FCS_CombatZoneEntityNeedUpdateTag::AssignCombatZoneEntityNeedUpdateTag(World, DefaultValue);
    return;
}
FCS_CombatZoneEntityNeedUpdateTag& ModifyCombatZoneEntityNeedUpdateTag(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_CombatZoneEntityNeedUpdateTag;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Modify(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
FCS_CombatZoneEntityNeedUpdateTag& ModifyOrAddCombatZoneEntityNeedUpdateTag(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_CombatZoneEntityNeedUpdateTag;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::ModifyOrAdd(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
const FCS_CombatZoneEntityNeedUpdateTag& GetCombatZoneEntityNeedUpdateTag(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_CombatZoneEntityNeedUpdateTag;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Get(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
UFUNCTION()
FCS_CombatZoneEntityNeedUpdateTag GetCombatZoneEntityNeedUpdateTag_BP(const FECSWorldPtr &inout World, bool &out bValid)
{
    bValid = false;
    const FCS_CombatZoneEntityNeedUpdateTag& local_4 = ECSFunc_FCS_CombatZoneEntityNeedUpdateTag::GetCombatZoneEntityNeedUpdateTag(World);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FCS_CombatZoneEntityNeedUpdateTag();
}
const FCS_CombatZoneEntityNeedUpdateTag GetDefaultedCombatZoneEntityNeedUpdateTag(const FECSWorldPtr &inout World)
{
    int local_10 = 0;
    const FCS_CombatZoneEntityNeedUpdateTag __r;
    FECSComponentPtr local_6 = ECSInternal::GetDefaulted(World, ENTITY_ID_NULL, FCS_CombatZoneEntityNeedUpdateTag);
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
FCS_CombatZoneEntityNeedUpdateTag GetDefaultedCombatZoneEntityNeedUpdateTag_BP(const FECSWorldPtr &inout World)
{
    return ECSFunc_FCS_CombatZoneEntityNeedUpdateTag::GetDefaultedCombatZoneEntityNeedUpdateTag(World);
}
UFUNCTION()
bool RemoveCombatZoneEntityNeedUpdateTag(const FECSWorldPtr &inout World)
{
    return ECSInternal::Remove(World, ENTITY_ID_NULL, FCS_CombatZoneEntityNeedUpdateTag);
}
}
void __MonitorCombatZoneEntityNeedUpdateTagLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FCS_CombatZoneEntityNeedUpdateTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCombatZoneEntityNeedUpdateTagActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FCS_CombatZoneEntityNeedUpdateTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCombatZoneEntityNeedUpdateTagModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FCS_CombatZoneEntityNeedUpdateTag, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_CombatZone
{
UFUNCTION()
bool HasCombatZone(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_CombatZone);
}
FC_CombatZone& AssignCombatZone(const FECSEntity &inout Entity, const FC_CombatZone &inout DefaultValue = FC_CombatZone())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_CombatZone, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignCombatZone_BP(const FECSEntity &inout Entity, const FC_CombatZone &inout DefaultValue = FC_CombatZone())
{
    ECSFunc_FC_CombatZone::AssignCombatZone(Entity, DefaultValue);
    return;
}
FC_CombatZone& ModifyCombatZone(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_CombatZone));
    return local_12.GetComp();
}
FC_CombatZone& ModifyOrAddCombatZone(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_CombatZone));
    return local_12.GetComp();
}
const FC_CombatZone& GetCombatZone(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_CombatZone));
    return local_12.GetComp();
}
UFUNCTION()
FC_CombatZone GetCombatZone_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_CombatZone __r;
    bValid = false;
    bValid = ECSFunc_FC_CombatZone::GetCombatZone(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_CombatZone GetDefaultedCombatZone(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_CombatZone __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_CombatZone);
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
FC_CombatZone GetDefaultedCombatZone_BP(const FECSEntity &inout Entity)
{
    FC_CombatZone __r;
    return __r;
}
UFUNCTION()
bool RemoveCombatZone(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_CombatZone);
}
}
FECSMonitorRuntimeView __GetMonitorCombatZoneOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_CombatZone, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCombatZoneOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_CombatZone, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCombatZoneOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_CombatZone, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCombatZoneOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_CombatZone, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCombatZoneOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_CombatZone, bFixedFrame, bMustHandleAll);
}
void __MonitorCombatZoneLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_CombatZone, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCombatZoneActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_CombatZone, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCombatZoneModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_CombatZone, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_CombatGroup
{
UFUNCTION()
bool HasCombatGroup(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_CombatGroup);
}
FC_CombatGroup& AssignCombatGroup(const FECSEntity &inout Entity, const FC_CombatGroup &inout DefaultValue = FC_CombatGroup())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_CombatGroup, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignCombatGroup_BP(const FECSEntity &inout Entity, const FC_CombatGroup &inout DefaultValue = FC_CombatGroup())
{
    ECSFunc_FC_CombatGroup::AssignCombatGroup(Entity, DefaultValue);
    return;
}
FC_CombatGroup& ModifyCombatGroup(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_CombatGroup));
    return local_12.GetComp();
}
FC_CombatGroup& ModifyOrAddCombatGroup(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_CombatGroup));
    return local_12.GetComp();
}
const FC_CombatGroup& GetCombatGroup(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_CombatGroup));
    return local_12.GetComp();
}
UFUNCTION()
FC_CombatGroup GetCombatGroup_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_CombatGroup __r;
    bValid = false;
    bValid = ECSFunc_FC_CombatGroup::GetCombatGroup(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_CombatGroup GetDefaultedCombatGroup(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_CombatGroup __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_CombatGroup);
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
FC_CombatGroup GetDefaultedCombatGroup_BP(const FECSEntity &inout Entity)
{
    FC_CombatGroup __r;
    return __r;
}
UFUNCTION()
bool RemoveCombatGroup(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_CombatGroup);
}
}
FECSMonitorRuntimeView __GetMonitorCombatGroupOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_CombatGroup, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCombatGroupOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_CombatGroup, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCombatGroupOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_CombatGroup, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCombatGroupOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_CombatGroup, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCombatGroupOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_CombatGroup, bFixedFrame, bMustHandleAll);
}
void __MonitorCombatGroupLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_CombatGroup, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCombatGroupActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_CombatGroup, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCombatGroupModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_CombatGroup, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_CombatGroupMember
{
UFUNCTION()
bool HasCombatGroupMember(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_CombatGroupMember);
}
FC_CombatGroupMember& AssignCombatGroupMember(const FECSEntity &inout Entity, const FC_CombatGroupMember &inout DefaultValue = FC_CombatGroupMember())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_CombatGroupMember, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignCombatGroupMember_BP(const FECSEntity &inout Entity, const FC_CombatGroupMember &inout DefaultValue = FC_CombatGroupMember())
{
    ECSFunc_FC_CombatGroupMember::AssignCombatGroupMember(Entity, DefaultValue);
    return;
}
FC_CombatGroupMember& ModifyCombatGroupMember(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_CombatGroupMember));
    return local_12.GetComp();
}
FC_CombatGroupMember& ModifyOrAddCombatGroupMember(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_CombatGroupMember));
    return local_12.GetComp();
}
const FC_CombatGroupMember& GetCombatGroupMember(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_CombatGroupMember));
    return local_12.GetComp();
}
UFUNCTION()
FC_CombatGroupMember GetCombatGroupMember_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_CombatGroupMember __r;
    bValid = false;
    bValid = ECSFunc_FC_CombatGroupMember::GetCombatGroupMember(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_CombatGroupMember GetDefaultedCombatGroupMember(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_CombatGroupMember __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_CombatGroupMember);
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
FC_CombatGroupMember GetDefaultedCombatGroupMember_BP(const FECSEntity &inout Entity)
{
    FC_CombatGroupMember __r;
    return __r;
}
UFUNCTION()
bool RemoveCombatGroupMember(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_CombatGroupMember);
}
}
FECSMonitorRuntimeView __GetMonitorCombatGroupMemberOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_CombatGroupMember, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCombatGroupMemberOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_CombatGroupMember, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCombatGroupMemberOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_CombatGroupMember, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCombatGroupMemberOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_CombatGroupMember, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCombatGroupMemberOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_CombatGroupMember, bFixedFrame, bMustHandleAll);
}
void __MonitorCombatGroupMemberLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_CombatGroupMember, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCombatGroupMemberActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_CombatGroupMember, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCombatGroupMemberModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_CombatGroupMember, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_CombatMemberInCombatVolumeTag
{
UFUNCTION()
bool HasCombatMemberInCombatVolumeTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_CombatMemberInCombatVolumeTag);
}
FC_CombatMemberInCombatVolumeTag& AssignCombatMemberInCombatVolumeTag(const FECSEntity &inout Entity, const FC_CombatMemberInCombatVolumeTag &inout DefaultValue = FC_CombatMemberInCombatVolumeTag())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_CombatMemberInCombatVolumeTag, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignCombatMemberInCombatVolumeTag_BP(const FECSEntity &inout Entity, const FC_CombatMemberInCombatVolumeTag &inout DefaultValue = FC_CombatMemberInCombatVolumeTag())
{
    ECSFunc_FC_CombatMemberInCombatVolumeTag::AssignCombatMemberInCombatVolumeTag(Entity, DefaultValue);
    return;
}
FC_CombatMemberInCombatVolumeTag& ModifyCombatMemberInCombatVolumeTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_CombatMemberInCombatVolumeTag));
    return local_12.GetComp();
}
FC_CombatMemberInCombatVolumeTag& ModifyOrAddCombatMemberInCombatVolumeTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_CombatMemberInCombatVolumeTag));
    return local_12.GetComp();
}
const FC_CombatMemberInCombatVolumeTag& GetCombatMemberInCombatVolumeTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_CombatMemberInCombatVolumeTag));
    return local_12.GetComp();
}
UFUNCTION()
FC_CombatMemberInCombatVolumeTag GetCombatMemberInCombatVolumeTag_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_CombatMemberInCombatVolumeTag& local_4 = ECSFunc_FC_CombatMemberInCombatVolumeTag::GetCombatMemberInCombatVolumeTag(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_CombatMemberInCombatVolumeTag();
}
const FC_CombatMemberInCombatVolumeTag GetDefaultedCombatMemberInCombatVolumeTag(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_CombatMemberInCombatVolumeTag __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_CombatMemberInCombatVolumeTag);
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
FC_CombatMemberInCombatVolumeTag GetDefaultedCombatMemberInCombatVolumeTag_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_CombatMemberInCombatVolumeTag::GetDefaultedCombatMemberInCombatVolumeTag(Entity);
}
UFUNCTION()
bool RemoveCombatMemberInCombatVolumeTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_CombatMemberInCombatVolumeTag);
}
}
FECSMonitorRuntimeView __GetMonitorCombatMemberInCombatVolumeTagOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_CombatMemberInCombatVolumeTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCombatMemberInCombatVolumeTagOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_CombatMemberInCombatVolumeTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCombatMemberInCombatVolumeTagOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_CombatMemberInCombatVolumeTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCombatMemberInCombatVolumeTagOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_CombatMemberInCombatVolumeTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCombatMemberInCombatVolumeTagOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_CombatMemberInCombatVolumeTag, bFixedFrame, bMustHandleAll);
}
void __MonitorCombatMemberInCombatVolumeTagLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_CombatMemberInCombatVolumeTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCombatMemberInCombatVolumeTagActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_CombatMemberInCombatVolumeTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCombatMemberInCombatVolumeTagModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_CombatMemberInCombatVolumeTag, bFixedFrame, Details);
    return;
}
