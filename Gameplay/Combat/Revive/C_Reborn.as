
namespace __INTENRAL_FC_PlayerWaitForReborn_NS
{
    const TECSComponentDerivedPtr<FC_PlayerWaitForReborn> DerivedPtr = TECSComponentDerivedPtr<FC_PlayerWaitForReborn>();
    const FC_PlayerWaitForReborn DefaultValue = FC_PlayerWaitForReborn();
}
namespace __INTENRAL_FC_PlayerDeathPunish_NS
{
    const TECSComponentDerivedPtr<FC_PlayerDeathPunish> DerivedPtr = TECSComponentDerivedPtr<FC_PlayerDeathPunish>();
    const FC_PlayerDeathPunish DefaultValue = FC_PlayerDeathPunish();
}
namespace __INTENRAL_FCE_PlayerRebornEvent_NS
{
    const TECSEventDerivedPtr<FCE_PlayerRebornEvent> DerivedPtr = TECSEventDerivedPtr<FCE_PlayerRebornEvent>();

}
struct FCE_PlayerRebornEvent : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    EReviveType ReviveType;


}

struct FC_PlayerWaitForReborn : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    FFPTime m_WaitEndTime;
    UPROPERTY()
    FECSEntityId m_KilledByEntity;
    UPROPERTY()
    TArray<EReviveType> m_AvailableReviveTypes;
    UPROPERTY()
    EDeathReason m_DeathReason;

    FC_PlayerWaitForReborn()
    {
        this.m_DeathReason = EDeathReason(0);
        this.__InitDirtyFlags();
        return;
    }
    FC_PlayerWaitForReborn(const FC_PlayerWaitForReborn &inout Other)
    {
        this.m_DeathReason = EDeathReason(0);
        this.__InitDirtyFlags();
        this.m_WaitEndTime = Other.m_WaitEndTime;
        this.m_KilledByEntity = Other.m_KilledByEntity;
        this.m_AvailableReviveTypes = Other.m_AvailableReviveTypes;
        this.m_DeathReason = Other.m_DeathReason;
        return;
    }
    FC_PlayerWaitForReborn opAssign(const FC_PlayerWaitForReborn &inout Other)
    {
        FC_PlayerWaitForReborn __r;
        this.SetWaitEndTime(Other.GetWaitEndTime());
        this.SetKilledByEntity(Other.GetKilledByEntity());
        this.SetAvailableReviveTypes(Other.GetAvailableReviveTypes());
        this.SetDeathReason(Other.GetDeathReason());
        return __r;
    }
    const FFPTime GetWaitEndTime() const property
    {
        const FFPTime __r;
        return __r;
    }
    FFPTime GetModify_WaitEndTime() property
    {
        FFPTime __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetWaitEndTime(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_WaitEndTime = __Value;
        return;
    }
    const FECSEntityId GetKilledByEntity() const property
    {
        const FECSEntityId __r;
        return __r;
    }
    FECSEntityId GetModify_KilledByEntity() property
    {
        FECSEntityId __r;
        this.__MarkDirty(1);
        return __r;
    }
    void SetKilledByEntity(const FECSEntityId &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_KilledByEntity = __Value;
        return;
    }
    const TArray<EReviveType> GetAvailableReviveTypes() const property
    {
        const TArray<EReviveType> __r;
        return __r;
    }
    TArray<EReviveType> GetModify_AvailableReviveTypes() property
    {
        TArray<EReviveType> __r;
        this.__MarkDirty(2);
        return __r;
    }
    void SetAvailableReviveTypes(const TArray<EReviveType> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_AvailableReviveTypes = __Value;
        return;
    }
    EDeathReason GetDeathReason() const property
    {
        return this.m_DeathReason;
    }
    void SetDeathReason(const EDeathReason __Value) property
    {
        if (int(this.m_DeathReason) == int(__Value))
        {
            return;
        }
        this.__MarkDirty(3);
        this.m_DeathReason = __Value;
        return;
    }
}

struct FC_PlayerDeathPunish : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    TArray<FFPTime> m_PunishDeathEndTime;

    FC_PlayerDeathPunish()
    {
        this.__InitDirtyFlags();
        return;
    }
    FC_PlayerDeathPunish(const FC_PlayerDeathPunish &inout Other)
    {
        this.__InitDirtyFlags();
        this.m_PunishDeathEndTime = Other.m_PunishDeathEndTime;
        return;
    }
    FC_PlayerDeathPunish opAssign(const FC_PlayerDeathPunish &inout Other)
    {
        FC_PlayerDeathPunish __r;
        this.SetPunishDeathEndTime(Other.GetPunishDeathEndTime());
        return __r;
    }
    const TArray<FFPTime> GetPunishDeathEndTime() const property
    {
        const TArray<FFPTime> __r;
        return __r;
    }
    TArray<FFPTime> GetModify_PunishDeathEndTime() property
    {
        TArray<FFPTime> __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetPunishDeathEndTime(const TArray<FFPTime> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_PunishDeathEndTime = __Value;
        return;
    }
}

namespace ECSFunc_FC_PlayerWaitForReborn
{
UFUNCTION()
bool HasPlayerWaitForReborn(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_PlayerWaitForReborn);
}
FC_PlayerWaitForReborn& AssignPlayerWaitForReborn(const FECSEntity &inout Entity, const FC_PlayerWaitForReborn &inout DefaultValue = FC_PlayerWaitForReborn())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_PlayerWaitForReborn, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignPlayerWaitForReborn_BP(const FECSEntity &inout Entity, const FC_PlayerWaitForReborn &inout DefaultValue = FC_PlayerWaitForReborn())
{
    ECSFunc_FC_PlayerWaitForReborn::AssignPlayerWaitForReborn(Entity, DefaultValue);
    return;
}
FC_PlayerWaitForReborn& ModifyPlayerWaitForReborn(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_PlayerWaitForReborn));
    return local_12.GetComp();
}
FC_PlayerWaitForReborn& ModifyOrAddPlayerWaitForReborn(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_PlayerWaitForReborn));
    return local_12.GetComp();
}
const FC_PlayerWaitForReborn& GetPlayerWaitForReborn(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_PlayerWaitForReborn));
    return local_12.GetComp();
}
UFUNCTION()
FC_PlayerWaitForReborn GetPlayerWaitForReborn_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_PlayerWaitForReborn& local_4 = ECSFunc_FC_PlayerWaitForReborn::GetPlayerWaitForReborn(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_PlayerWaitForReborn();
}
const FC_PlayerWaitForReborn GetDefaultedPlayerWaitForReborn(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_PlayerWaitForReborn __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_PlayerWaitForReborn);
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
FC_PlayerWaitForReborn GetDefaultedPlayerWaitForReborn_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_PlayerWaitForReborn::GetDefaultedPlayerWaitForReborn(Entity);
}
UFUNCTION()
bool RemovePlayerWaitForReborn(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_PlayerWaitForReborn);
}
}
FECSMonitorRuntimeView __GetMonitorPlayerWaitForRebornOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_PlayerWaitForReborn, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPlayerWaitForRebornOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_PlayerWaitForReborn, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPlayerWaitForRebornOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_PlayerWaitForReborn, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPlayerWaitForRebornOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_PlayerWaitForReborn, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPlayerWaitForRebornOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_PlayerWaitForReborn, bFixedFrame, bMustHandleAll);
}
void __MonitorPlayerWaitForRebornLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_PlayerWaitForReborn, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPlayerWaitForRebornActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_PlayerWaitForReborn, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPlayerWaitForRebornModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_PlayerWaitForReborn, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_PlayerDeathPunish
{
UFUNCTION()
bool HasPlayerDeathPunish(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_PlayerDeathPunish);
}
FC_PlayerDeathPunish& AssignPlayerDeathPunish(const FECSEntity &inout Entity, const FC_PlayerDeathPunish &inout DefaultValue = FC_PlayerDeathPunish())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_PlayerDeathPunish, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignPlayerDeathPunish_BP(const FECSEntity &inout Entity, const FC_PlayerDeathPunish &inout DefaultValue = FC_PlayerDeathPunish())
{
    ECSFunc_FC_PlayerDeathPunish::AssignPlayerDeathPunish(Entity, DefaultValue);
    return;
}
FC_PlayerDeathPunish& ModifyPlayerDeathPunish(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_PlayerDeathPunish));
    return local_12.GetComp();
}
FC_PlayerDeathPunish& ModifyOrAddPlayerDeathPunish(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_PlayerDeathPunish));
    return local_12.GetComp();
}
const FC_PlayerDeathPunish& GetPlayerDeathPunish(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_PlayerDeathPunish));
    return local_12.GetComp();
}
UFUNCTION()
FC_PlayerDeathPunish GetPlayerDeathPunish_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_PlayerDeathPunish& local_4 = ECSFunc_FC_PlayerDeathPunish::GetPlayerDeathPunish(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_PlayerDeathPunish();
}
const FC_PlayerDeathPunish GetDefaultedPlayerDeathPunish(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_PlayerDeathPunish __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_PlayerDeathPunish);
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
FC_PlayerDeathPunish GetDefaultedPlayerDeathPunish_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_PlayerDeathPunish::GetDefaultedPlayerDeathPunish(Entity);
}
UFUNCTION()
bool RemovePlayerDeathPunish(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_PlayerDeathPunish);
}
}
FECSMonitorRuntimeView __GetMonitorPlayerDeathPunishOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_PlayerDeathPunish, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPlayerDeathPunishOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_PlayerDeathPunish, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPlayerDeathPunishOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_PlayerDeathPunish, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPlayerDeathPunishOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_PlayerDeathPunish, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPlayerDeathPunishOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_PlayerDeathPunish, bFixedFrame, bMustHandleAll);
}
void __MonitorPlayerDeathPunishLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_PlayerDeathPunish, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPlayerDeathPunishActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_PlayerDeathPunish, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPlayerDeathPunishModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_PlayerDeathPunish, bFixedFrame, Details);
    return;
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_PlayerWaitForReborn &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_PlayerWaitForReborn &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_PlayerWaitForReborn &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_PlayerWaitForReborn
{
int __IndexOf_WaitEndTime()
{
    return 0;
}
int __IndexOf_KilledByEntity()
{
    return 1;
}
int __IndexOf_AvailableReviveTypes()
{
    return 2;
}
int __IndexOf_DeathReason()
{
    return 3;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_PlayerDeathPunish &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_PlayerDeathPunish &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_PlayerDeathPunish &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_PlayerDeathPunish
{
int __IndexOf_PunishDeathEndTime()
{
    return 0;
}
}
