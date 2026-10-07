
enum EWorldEventStatus
{
    Unbegun,
    WaitActivate,
    Coming,
    Activitie,
    End,
}

namespace __INTENRAL_FCS_WorldEventMinimapIconManager_NS
{
    const TECSComponentDerivedPtr<FCS_WorldEventMinimapIconManager> DerivedPtr = TECSComponentDerivedPtr<FCS_WorldEventMinimapIconManager>();
    const FCS_WorldEventMinimapIconManager DefaultValue = FCS_WorldEventMinimapIconManager();

}
struct FWorldEventMinimapIconData
{
    FSubDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    FFPTime m_StartTime;
    UPROPERTY()
    FFPTime m_WaitDuration;
    UPROPERTY()
    FFPTime m_ActiveTime;
    UPROPERTY()
    FFPTime m_ActiveDuration;
    UPROPERTY()
    FString m_Description;
    UPROPERTY()
    EWorldEventStatus m_EventStatus;
    UPROPERTY()
    TDataObjectPtr<FDropItemConfigBase> m_DropItems;

    FWorldEventMinimapIconData()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FWorldEventMinimapIconData(const FWorldEventMinimapIconData &inout Other)
    {
        this.m_EventStatus = EWorldEventStatus(0);
        this.m_StartTime = Other.m_StartTime;
        this.m_WaitDuration = Other.m_WaitDuration;
        this.m_ActiveTime = Other.m_ActiveTime;
        this.m_ActiveDuration = Other.m_ActiveDuration;
        this.m_Description = Other.m_Description;
        this.m_EventStatus = Other.m_EventStatus;
        this.m_DropItems = Other.m_DropItems;
        return;
    }
    FWorldEventMinimapIconData opAssign(const FWorldEventMinimapIconData &inout Other)
    {
        FWorldEventMinimapIconData __r;
        this.SetStartTime(Other.GetStartTime());
        this.SetWaitDuration(Other.GetWaitDuration());
        this.SetActiveTime(Other.GetActiveTime());
        this.SetActiveDuration(Other.GetActiveDuration());
        this.SetDescription(Other.GetDescription());
        this.SetEventStatus(Other.GetEventStatus());
        this.SetDropItems(Other.GetDropItems());
        return __r;
    }
    FFPTime GetStartTime() const property
    {
        FFPTime __r;
        return __r;
    }
    FFPTime GetModify_StartTime() property
    {
        FFPTime __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetStartTime(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_StartTime = __Value;
        return;
    }
    const FFPTime GetWaitDuration() const property
    {
        const FFPTime __r;
        return __r;
    }
    FFPTime GetModify_WaitDuration() property
    {
        FFPTime __r;
        this.__MarkDirty(1);
        return __r;
    }
    void SetWaitDuration(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_WaitDuration = __Value;
        return;
    }
    const FFPTime GetActiveTime() const property
    {
        const FFPTime __r;
        return __r;
    }
    FFPTime GetModify_ActiveTime() property
    {
        FFPTime __r;
        this.__MarkDirty(2);
        return __r;
    }
    void SetActiveTime(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_ActiveTime = __Value;
        return;
    }
    const FFPTime GetActiveDuration() const property
    {
        const FFPTime __r;
        return __r;
    }
    FFPTime GetModify_ActiveDuration() property
    {
        FFPTime __r;
        this.__MarkDirty(3);
        return __r;
    }
    void SetActiveDuration(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(3);
        this.m_ActiveDuration = __Value;
        return;
    }
    FString GetDescription() const property
    {
        return this.m_Description;
    }
    void SetDescription(const FString &inout __Value) property
    {
        if ((this.m_Description == __Value))
        {
            return;
        }
        this.__MarkDirty(4);
        this.m_Description = __Value;
        return;
    }
    EWorldEventStatus GetEventStatus() const property
    {
        return this.m_EventStatus;
    }
    void SetEventStatus(const EWorldEventStatus __Value) property
    {
        if (int(this.m_EventStatus) == int(__Value))
        {
            return;
        }
        this.__MarkDirty(5);
        this.m_EventStatus = __Value;
        return;
    }
    const TDataObjectPtr<FDropItemConfigBase> GetDropItems() const property
    {
        const TDataObjectPtr<FDropItemConfigBase> __r;
        return __r;
    }
    TDataObjectPtr<FDropItemConfigBase> GetModify_DropItems() property
    {
        TDataObjectPtr<FDropItemConfigBase> __r;
        this.__MarkDirty(6);
        return __r;
    }
    void SetDropItems(const TDataObjectPtr<FDropItemConfigBase> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(6);
        this.m_DropItems = __Value;
        return;
    }
}

struct FCS_WorldEventMinimapIconManager : FECSSingleton
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    TMap<FECSEntityId, FWorldEventMinimapIconData> m_AllWorldEvents;

    FCS_WorldEventMinimapIconManager()
    {
        this.__InitDirtyFlags();
        return;
    }
    FCS_WorldEventMinimapIconManager(const FCS_WorldEventMinimapIconManager &inout Other)
    {
        this.__InitDirtyFlags();
        this.m_AllWorldEvents = Other.m_AllWorldEvents;
        return;
    }
    FCS_WorldEventMinimapIconManager opAssign(const FCS_WorldEventMinimapIconManager &inout Other)
    {
        FCS_WorldEventMinimapIconManager __r;
        this.SetAllWorldEvents(Other.GetAllWorldEvents());
        return __r;
    }
    const TMap<FECSEntityId, FWorldEventMinimapIconData> GetAllWorldEvents() const property
    {
        const TMap<FECSEntityId, FWorldEventMinimapIconData> __r;
        return __r;
    }
    TMap<FECSEntityId, FWorldEventMinimapIconData> GetModify_AllWorldEvents() property
    {
        TMap<FECSEntityId, FWorldEventMinimapIconData> __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetAllWorldEvents(const TMap<FECSEntityId, FWorldEventMinimapIconData> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_AllWorldEvents = __Value;
        return;
    }
}

namespace WorldEventMinimapIcon_Temp
{
UFUNCTION()
void EnableWorldEventIcon(const FECSEntity &inout Entity, const float32 RemainTimeToStart, const float32 ActiveDuration, const FString &inout Description, const FName &inout DropItemGroupRowName)
{
    if (!(ECS::GetRuntimeInfo().IsServer) || !(Entity.IsValid()))
    {
        return;
    }
    FFPTime local_10 = (ECS::GetContextTime() + FFPTime(RemainTimeToStart));
    FWorldEventMinimapIconData local_52;
    local_52.SetStartTime(local_10);
    local_52.SetWaitDuration(FFPTime(RemainTimeToStart));
    local_52.SetDescription(Description);
    local_52.SetActiveDuration(FFPTime(ActiveDuration));
    local_52.SetEventStatus(EWorldEventStatus(1));
    UDataTable local_76 = Cast<UDataTable>(FSoftObjectPath("/Script/Engine.DataTable'/Game/MoleRes/Dev/Data/DropItem/SDT_DropItemGroup.SDT_DropItemGroup'").ResolveObject());
    UDataTable::FindDataObject local_104;
    if ((local_104.opCall(DropItemGroupRowName) == nullptr))
    {
        return;
    }
    local_52.SetDropItems(TDataObjectPtr<FDropItemConfigBase>());
    FECSEntityId local_159 = Entity.GetId();
    FECSWorldPtr local_154 = Entity.GetWorld();
    ModifyOrAdd local_158;
    local_158.opCall().GetModify_AllWorldEvents().Add(local_159, local_52);
    return;
}
UFUNCTION()
void DisableWorldEventIcon(const FECSEntity &inout Entity)
{
    if (!(ECS::GetRuntimeInfo().IsServer) || !(Entity.IsValid()))
    {
        return;
    }
    FECSWorldPtr local_4 = Entity.GetWorld();
    Modify local_8;
    if (local_8.opCall())
    {
        FECSEntityId local_11 = Entity.GetId();
    }
    return;
}
}
namespace ECSFunc_FCS_WorldEventMinimapIconManager
{
UFUNCTION()
bool HasWorldEventMinimapIconManager(const FECSWorldPtr &inout World)
{
    return ECSInternal::Has(World, ENTITY_ID_NULL, FCS_WorldEventMinimapIconManager);
}
FCS_WorldEventMinimapIconManager& AssignWorldEventMinimapIconManager(const FECSWorldPtr &inout World, const FCS_WorldEventMinimapIconManager &inout DefaultValue = FCS_WorldEventMinimapIconManager())
{
    UScriptStruct local_6 = FCS_WorldEventMinimapIconManager;
    FECSComponentPtr local_8;
    int local_10 = local_8 = ECSInternal::Assign(World, ENTITY_ID_NULL, local_6, FECSComponentPtr(DefaultValue));
    local_10.InternalSet(local_8);
    return local_10.GetComp();
}
UFUNCTION()
void AssignWorldEventMinimapIconManager_BP(const FECSWorldPtr &inout World, const FCS_WorldEventMinimapIconManager &inout DefaultValue = FCS_WorldEventMinimapIconManager())
{
    ECSFunc_FCS_WorldEventMinimapIconManager::AssignWorldEventMinimapIconManager(World, DefaultValue);
    return;
}
FCS_WorldEventMinimapIconManager& ModifyWorldEventMinimapIconManager(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_WorldEventMinimapIconManager;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Modify(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
FCS_WorldEventMinimapIconManager& ModifyOrAddWorldEventMinimapIconManager(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_WorldEventMinimapIconManager;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::ModifyOrAdd(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
const FCS_WorldEventMinimapIconManager& GetWorldEventMinimapIconManager(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_WorldEventMinimapIconManager;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Get(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
UFUNCTION()
FCS_WorldEventMinimapIconManager GetWorldEventMinimapIconManager_BP(const FECSWorldPtr &inout World, bool &out bValid)
{
    bValid = false;
    const FCS_WorldEventMinimapIconManager& local_4 = ECSFunc_FCS_WorldEventMinimapIconManager::GetWorldEventMinimapIconManager(World);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FCS_WorldEventMinimapIconManager();
}
const FCS_WorldEventMinimapIconManager GetDefaultedWorldEventMinimapIconManager(const FECSWorldPtr &inout World)
{
    int local_10 = 0;
    const FCS_WorldEventMinimapIconManager __r;
    FECSComponentPtr local_6 = ECSInternal::GetDefaulted(World, ENTITY_ID_NULL, FCS_WorldEventMinimapIconManager);
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
FCS_WorldEventMinimapIconManager GetDefaultedWorldEventMinimapIconManager_BP(const FECSWorldPtr &inout World)
{
    return ECSFunc_FCS_WorldEventMinimapIconManager::GetDefaultedWorldEventMinimapIconManager(World);
}
UFUNCTION()
bool RemoveWorldEventMinimapIconManager(const FECSWorldPtr &inout World)
{
    return ECSInternal::Remove(World, ENTITY_ID_NULL, FCS_WorldEventMinimapIconManager);
}
}
void __MonitorWorldEventMinimapIconManagerLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FCS_WorldEventMinimapIconManager, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorWorldEventMinimapIconManagerActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FCS_WorldEventMinimapIconManager, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorWorldEventMinimapIconManagerModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FCS_WorldEventMinimapIconManager, bFixedFrame, Details);
    return;
}
namespace AutoDelta
{
FSubDirtyFlags8 GetDirtyFlags(FWorldEventMinimapIconData &inout Data)
{
    FSubDirtyFlags8 __r;
    return __r;
}
void ClearDirtyFlags(FWorldEventMinimapIconData &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FWorldEventMinimapIconData
{
int __IndexOf_StartTime()
{
    return 0;
}
int __IndexOf_WaitDuration()
{
    return 1;
}
int __IndexOf_ActiveTime()
{
    return 2;
}
int __IndexOf_ActiveDuration()
{
    return 3;
}
int __IndexOf_Description()
{
    return 4;
}
int __IndexOf_EventStatus()
{
    return 5;
}
int __IndexOf_DropItems()
{
    return 6;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FCS_WorldEventMinimapIconManager &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FCS_WorldEventMinimapIconManager &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FCS_WorldEventMinimapIconManager &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FCS_WorldEventMinimapIconManager
{
int __IndexOf_AllWorldEvents()
{
    return 0;
}
}
