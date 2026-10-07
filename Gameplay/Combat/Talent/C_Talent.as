
namespace __INTENRAL_FC_PlayerTalent_NS
{
    const TECSComponentDerivedPtr<FC_PlayerTalent> DerivedPtr = TECSComponentDerivedPtr<FC_PlayerTalent>();
    const FC_PlayerTalent DefaultValue = FC_PlayerTalent();
}
namespace __INTENRAL_FC_CharacterTalent_NS
{
    const TECSComponentDerivedPtr<FC_CharacterTalent> DerivedPtr = TECSComponentDerivedPtr<FC_CharacterTalent>();
    const FC_CharacterTalent DefaultValue = FC_CharacterTalent();
}
namespace __INTENRAL_FCE_ChangeAvatarTalentEquipInfo_NS
{
    const TECSEventDerivedPtr<FCE_ChangeAvatarTalentEquipInfo> DerivedPtr = TECSEventDerivedPtr<FCE_ChangeAvatarTalentEquipInfo>();
}
namespace __INTENRAL_FCE_UpdateTalentUnlockInfo_NS
{
    const TECSEventDerivedPtr<FCE_UpdateTalentUnlockInfo> DerivedPtr = TECSEventDerivedPtr<FCE_UpdateTalentUnlockInfo>();
}
namespace __INTENRAL_FCE_ChangeAvatarTalentPassiveEffectChange_NS
{
    const TECSEventDerivedPtr<FCE_ChangeAvatarTalentPassiveEffectChange> DerivedPtr = TECSEventDerivedPtr<FCE_ChangeAvatarTalentPassiveEffectChange>();
}
namespace __INTENRAL_FCE_DebugUpdateTalentUnlockInfo_NS
{
    const TECSEventDerivedPtr<FCE_DebugUpdateTalentUnlockInfo> DerivedPtr = TECSEventDerivedPtr<FCE_DebugUpdateTalentUnlockInfo>();

}
struct FCE_ChangeAvatarTalentEquipInfo : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    uint AvatarId;
    UPROPERTY()
    uint NewFoundationId;
    UPROPERTY()
    TArray<uint> NewChooseTalentIdList;
    UPROPERTY()
    TMap<ESkillSlot, uint> NewTalentIdBySkillSlot;


}

struct FCE_UpdateTalentUnlockInfo : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    TArray<uint> NewUnlockTalentIdList;

    FCE_UpdateTalentUnlockInfo()
    {
        return;
    }
}

struct FCE_ChangeAvatarTalentPassiveEffectChange : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    uint AvatarId;


}

struct FC_PlayerTalent : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    TArray<TDataObjectPtr<FTalentConfig>> m_UnlockTalentList;

    FC_PlayerTalent()
    {
        this.__InitDirtyFlags();
        return;
    }
    FC_PlayerTalent(const FC_PlayerTalent &inout Other)
    {
        this.__InitDirtyFlags();
        this.m_UnlockTalentList = Other.m_UnlockTalentList;
        return;
    }
    FC_PlayerTalent opAssign(const FC_PlayerTalent &inout Other)
    {
        FC_PlayerTalent __r;
        this.SetUnlockTalentList(Other.GetUnlockTalentList());
        return __r;
    }
    TArray<TDataObjectPtr<FTalentConfig>> GetUnlockTalentList() const property
    {
        TArray<TDataObjectPtr<FTalentConfig>> __r;
        return __r;
    }
    TArray<TDataObjectPtr<FTalentConfig>> GetModify_UnlockTalentList() property
    {
        TArray<TDataObjectPtr<FTalentConfig>> __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetUnlockTalentList(const TArray<TDataObjectPtr<FTalentConfig>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_UnlockTalentList = __Value;
        return;
    }
}

struct FC_CharacterTalent : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    uint m_FoundationTalentId;
    UPROPERTY()
    TArray<uint> m_ChooseTalentIdList;
    UPROPERTY()
    TArray<TDataObjectPtr<FTalentConfig>> m_AllActiveTalentConfigs;
    UPROPERTY()
    TMap<uint, FCapabilityInstanceId> m_AddedCapabilityInstanceIdByTalentId;

    FC_CharacterTalent()
    {
        this.m_FoundationTalentId = 0;
        this.__InitDirtyFlags();
        return;
    }
    FC_CharacterTalent(const FC_CharacterTalent &inout Other)
    {
        this.m_FoundationTalentId = 0;
        this.__InitDirtyFlags();
        this.m_FoundationTalentId = int(Other.m_FoundationTalentId);
        this.m_ChooseTalentIdList = Other.m_ChooseTalentIdList;
        this.m_AllActiveTalentConfigs = Other.m_AllActiveTalentConfigs;
        this.m_AddedCapabilityInstanceIdByTalentId = Other.m_AddedCapabilityInstanceIdByTalentId;
        return;
    }
    FC_CharacterTalent opAssign(const FC_CharacterTalent &inout Other)
    {
        FC_CharacterTalent __r;
        this.SetFoundationTalentId(Other.GetFoundationTalentId());
        this.SetChooseTalentIdList(Other.GetChooseTalentIdList());
        this.SetAllActiveTalentConfigs(Other.GetAllActiveTalentConfigs());
        this.SetAddedCapabilityInstanceIdByTalentId(Other.GetAddedCapabilityInstanceIdByTalentId());
        return __r;
    }
    EAvatarIllustrate GetFoundationTalentIllustrate() const
    {
        int local_101 = 0;
        int local_1 = this.GetFoundationTalentId();
        if (local_1 != 0)
        {
            int local_1_2 = this.GetFoundationTalentId();
            GetDataObjectByGSDataId<FTalentConfig> local_52;
            TDataObjectPtr<FTalentConfig> local_76 = local_52.opImplConv();
            if (local_76)
            {
                return ::FASCommonUtils::TalentDivisionToIllustrate(ETalentDivision(local_101));
            }
        }
        return EAvatarIllustrate(3);
    }
    uint GetFoundationTalentId() const property
    {
        return this.m_FoundationTalentId;
    }
    void SetFoundationTalentId(const uint __Value) property
    {
        if (this.m_FoundationTalentId == __Value)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_FoundationTalentId = __Value;
        return;
    }
    const TArray<uint> GetChooseTalentIdList() const property
    {
        const TArray<uint> __r;
        return __r;
    }
    TArray<uint> GetModify_ChooseTalentIdList() property
    {
        TArray<uint> __r;
        this.__MarkDirty(1);
        return __r;
    }
    void SetChooseTalentIdList(const TArray<uint> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_ChooseTalentIdList = __Value;
        return;
    }
    const TArray<TDataObjectPtr<FTalentConfig>> GetAllActiveTalentConfigs() const property
    {
        const TArray<TDataObjectPtr<FTalentConfig>> __r;
        return __r;
    }
    TArray<TDataObjectPtr<FTalentConfig>> GetModify_AllActiveTalentConfigs() property
    {
        TArray<TDataObjectPtr<FTalentConfig>> __r;
        this.__MarkDirty(2);
        return __r;
    }
    void SetAllActiveTalentConfigs(const TArray<TDataObjectPtr<FTalentConfig>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_AllActiveTalentConfigs = __Value;
        return;
    }
    const TMap<uint, FCapabilityInstanceId> GetAddedCapabilityInstanceIdByTalentId() const property
    {
        const TMap<uint, FCapabilityInstanceId> __r;
        return __r;
    }
    TMap<uint, FCapabilityInstanceId> GetModify_AddedCapabilityInstanceIdByTalentId() property
    {
        TMap<uint, FCapabilityInstanceId> __r;
        this.__MarkDirty(3);
        return __r;
    }
    void SetAddedCapabilityInstanceIdByTalentId(const TMap<uint, FCapabilityInstanceId> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(3);
        this.m_AddedCapabilityInstanceIdByTalentId = __Value;
        return;
    }
}

struct FCE_DebugUpdateTalentUnlockInfo : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    TArray<uint> NewAllUnlockTalentIdList;

    FCE_DebugUpdateTalentUnlockInfo()
    {
        return;
    }
}

namespace ECSFunc_FC_PlayerTalent
{
UFUNCTION()
bool HasPlayerTalent(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_PlayerTalent);
}
FC_PlayerTalent& AssignPlayerTalent(const FECSEntity &inout Entity, const FC_PlayerTalent &inout DefaultValue = FC_PlayerTalent())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_PlayerTalent, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignPlayerTalent_BP(const FECSEntity &inout Entity, const FC_PlayerTalent &inout DefaultValue = FC_PlayerTalent())
{
    ECSFunc_FC_PlayerTalent::AssignPlayerTalent(Entity, DefaultValue);
    return;
}
FC_PlayerTalent& ModifyPlayerTalent(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_PlayerTalent));
    return local_12.GetComp();
}
FC_PlayerTalent& ModifyOrAddPlayerTalent(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_PlayerTalent));
    return local_12.GetComp();
}
const FC_PlayerTalent& GetPlayerTalent(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_PlayerTalent));
    return local_12.GetComp();
}
UFUNCTION()
FC_PlayerTalent GetPlayerTalent_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_PlayerTalent& local_4 = ECSFunc_FC_PlayerTalent::GetPlayerTalent(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_PlayerTalent();
}
const FC_PlayerTalent GetDefaultedPlayerTalent(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_PlayerTalent __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_PlayerTalent);
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
FC_PlayerTalent GetDefaultedPlayerTalent_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_PlayerTalent::GetDefaultedPlayerTalent(Entity);
}
UFUNCTION()
bool RemovePlayerTalent(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_PlayerTalent);
}
}
FECSMonitorRuntimeView __GetMonitorPlayerTalentOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_PlayerTalent, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPlayerTalentOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_PlayerTalent, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPlayerTalentOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_PlayerTalent, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPlayerTalentOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_PlayerTalent, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPlayerTalentOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_PlayerTalent, bFixedFrame, bMustHandleAll);
}
void __MonitorPlayerTalentLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_PlayerTalent, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPlayerTalentActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_PlayerTalent, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPlayerTalentModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_PlayerTalent, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_CharacterTalent
{
UFUNCTION()
bool HasCharacterTalent(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_CharacterTalent);
}
FC_CharacterTalent& AssignCharacterTalent(const FECSEntity &inout Entity, const FC_CharacterTalent &inout DefaultValue = FC_CharacterTalent())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_CharacterTalent, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignCharacterTalent_BP(const FECSEntity &inout Entity, const FC_CharacterTalent &inout DefaultValue = FC_CharacterTalent())
{
    ECSFunc_FC_CharacterTalent::AssignCharacterTalent(Entity, DefaultValue);
    return;
}
FC_CharacterTalent& ModifyCharacterTalent(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_CharacterTalent));
    return local_12.GetComp();
}
FC_CharacterTalent& ModifyOrAddCharacterTalent(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_CharacterTalent));
    return local_12.GetComp();
}
const FC_CharacterTalent& GetCharacterTalent(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_CharacterTalent));
    return local_12.GetComp();
}
UFUNCTION()
FC_CharacterTalent GetCharacterTalent_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_CharacterTalent& local_4 = ECSFunc_FC_CharacterTalent::GetCharacterTalent(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_CharacterTalent();
}
const FC_CharacterTalent GetDefaultedCharacterTalent(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_CharacterTalent __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_CharacterTalent);
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
FC_CharacterTalent GetDefaultedCharacterTalent_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_CharacterTalent::GetDefaultedCharacterTalent(Entity);
}
UFUNCTION()
bool RemoveCharacterTalent(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_CharacterTalent);
}
}
FECSMonitorRuntimeView __GetMonitorCharacterTalentOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_CharacterTalent, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCharacterTalentOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_CharacterTalent, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCharacterTalentOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_CharacterTalent, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCharacterTalentOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_CharacterTalent, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCharacterTalentOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_CharacterTalent, bFixedFrame, bMustHandleAll);
}
void __MonitorCharacterTalentLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_CharacterTalent, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCharacterTalentActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_CharacterTalent, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCharacterTalentModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_CharacterTalent, bFixedFrame, Details);
    return;
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_PlayerTalent &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_PlayerTalent &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_PlayerTalent &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_PlayerTalent
{
int __IndexOf_UnlockTalentList()
{
    return 0;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_CharacterTalent &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_CharacterTalent &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_CharacterTalent &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_CharacterTalent
{
int __IndexOf_FoundationTalentId()
{
    return 0;
}
int __IndexOf_ChooseTalentIdList()
{
    return 1;
}
int __IndexOf_AllActiveTalentConfigs()
{
    return 2;
}
int __IndexOf_AddedCapabilityInstanceIdByTalentId()
{
    return 3;
}
}
