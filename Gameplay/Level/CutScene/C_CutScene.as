
namespace __INTENRAL_FC_CutSceneLogicData_NS
{
    const TECSComponentDerivedPtr<FC_CutSceneLogicData> DerivedPtr = TECSComponentDerivedPtr<FC_CutSceneLogicData>();
    const FC_CutSceneLogicData DefaultValue = FC_CutSceneLogicData();
}
namespace __INTENRAL_FCS_CutSceneViewData_NS
{
    const TECSComponentDerivedPtr<FCS_CutSceneViewData> DerivedPtr = TECSComponentDerivedPtr<FCS_CutSceneViewData>();
    const FCS_CutSceneViewData DefaultValue = FCS_CutSceneViewData();
}
namespace __INTENRAL_FC_CutSceneRequestSpawnPoint_NS
{
    const TECSComponentDerivedPtr<FC_CutSceneRequestSpawnPoint> DerivedPtr = TECSComponentDerivedPtr<FC_CutSceneRequestSpawnPoint>();
    const FC_CutSceneRequestSpawnPoint DefaultValue = FC_CutSceneRequestSpawnPoint();
}
namespace __INTENRAL_FCE_CrossServerCutScenePlayerSpawned_NS
{
    const TECSEventDerivedPtr<FCE_CrossServerCutScenePlayerSpawned> DerivedPtr = TECSEventDerivedPtr<FCE_CrossServerCutScenePlayerSpawned>();
}
namespace __INTENRAL_FCE_SkipCutScene_NS
{
    const TECSEventDerivedPtr<FCE_SkipCutScene> DerivedPtr = TECSEventDerivedPtr<FCE_SkipCutScene>();
}
namespace __INTENRAL_FCE_PostPlayCutSceneFinished_NS
{
    const TECSEventDerivedPtr<FCE_PostPlayCutSceneFinished> DerivedPtr = TECSEventDerivedPtr<FCE_PostPlayCutSceneFinished>();

}
struct FC_CutSceneLogicData : FECSComponent
{
    FRootDirtyFlags16 __DirtyFlags;
    UPROPERTY()
    FFPTime m_StartTime;
    UPROPERTY()
    FFPTime m_Duration;
    UPROPERTY()
    TSoftObjectPtr<ULevelSequence> m_LevelSequence;
    UPROPERTY()
    TDataObjectPtr<FCutSceneData> m_CutSceneData;
    UPROPERTY()
    FVector m_OriginLocation;
    UPROPERTY()
    FRotator m_OriginRotation;
    UPROPERTY()
    bool m_bCrossDS;
    UPROPERTY()
    bool m_bPrevTeleported;
    UPROPERTY()
    bool m_bSupportSkip;
    UPROPERTY()
    FName m_PlayerTag;
    UPROPERTY()
    TMap<FName, FECSEntity> m_Entities;

    FC_CutSceneLogicData()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_CutSceneLogicData(const FC_CutSceneLogicData &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_CutSceneLogicData opAssign(const FC_CutSceneLogicData &inout Other)
    {
        FC_CutSceneLogicData __r;
        this.SetStartTime(Other.GetStartTime());
        this.SetDuration(Other.GetDuration());
        this.SetLevelSequence(Other.GetLevelSequence());
        this.SetCutSceneData(Other.GetCutSceneData());
        this.SetOriginLocation(Other.GetOriginLocation());
        this.SetOriginRotation(Other.GetOriginRotation());
        this.SetbCrossDS(Other.GetbCrossDS());
        this.SetbPrevTeleported(Other.GetbPrevTeleported());
        this.SetbSupportSkip(Other.GetbSupportSkip());
        this.SetPlayerTag(Other.GetPlayerTag());
        this.SetEntities(Other.GetEntities());
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
    FFPTime GetDuration() const property
    {
        FFPTime __r;
        return __r;
    }
    FFPTime GetModify_Duration() property
    {
        FFPTime __r;
        this.__MarkDirty(1);
        return __r;
    }
    void SetDuration(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_Duration = __Value;
        return;
    }
    TSoftObjectPtr<ULevelSequence> GetLevelSequence() const property
    {
        TSoftObjectPtr<ULevelSequence> __r;
        return __r;
    }
    TSoftObjectPtr<ULevelSequence> GetModify_LevelSequence() property
    {
        TSoftObjectPtr<ULevelSequence> __r;
        this.__MarkDirty(2);
        return __r;
    }
    void SetLevelSequence(const TSoftObjectPtr<ULevelSequence> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_LevelSequence = __Value;
        return;
    }
    const TDataObjectPtr<FCutSceneData> GetCutSceneData() const property
    {
        const TDataObjectPtr<FCutSceneData> __r;
        return __r;
    }
    TDataObjectPtr<FCutSceneData> GetModify_CutSceneData() property
    {
        TDataObjectPtr<FCutSceneData> __r;
        this.__MarkDirty(3);
        return __r;
    }
    void SetCutSceneData(const TDataObjectPtr<FCutSceneData> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(3);
        this.m_CutSceneData = __Value;
        return;
    }
    const FVector GetOriginLocation() const property
    {
        const FVector __r;
        return __r;
    }
    FVector GetModify_OriginLocation() property
    {
        FVector __r;
        this.__MarkDirty(4);
        return __r;
    }
    void SetOriginLocation(const FVector &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(4);
        this.m_OriginLocation = __Value;
        return;
    }
    const FRotator GetOriginRotation() const property
    {
        const FRotator __r;
        return __r;
    }
    FRotator GetModify_OriginRotation() property
    {
        FRotator __r;
        this.__MarkDirty(5);
        return __r;
    }
    void SetOriginRotation(const FRotator &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(5);
        this.m_OriginRotation = __Value;
        return;
    }
    bool GetbCrossDS() const property
    {
        return this.m_bCrossDS;
    }
    void SetbCrossDS(const bool __Value) property
    {
        if (!(this.m_bCrossDS) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(6);
        this.m_bCrossDS = __Value;
        return;
    }
    bool GetbPrevTeleported() const property
    {
        return this.m_bPrevTeleported;
    }
    void SetbPrevTeleported(const bool __Value) property
    {
        if (!(this.m_bPrevTeleported) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(7);
        this.m_bPrevTeleported = __Value;
        return;
    }
    bool GetbSupportSkip() const property
    {
        return this.m_bSupportSkip;
    }
    void SetbSupportSkip(const bool __Value) property
    {
        if (!(this.m_bSupportSkip) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(8);
        this.m_bSupportSkip = __Value;
        return;
    }
    FName GetPlayerTag() const property
    {
        return this.m_PlayerTag;
    }
    void SetPlayerTag(const FName &inout __Value) property
    {
        if ((this.m_PlayerTag == __Value))
        {
            return;
        }
        this.__MarkDirty(9);
        this.m_PlayerTag = __Value;
        return;
    }
    const TMap<FName, FECSEntity> GetEntities() const property
    {
        const TMap<FName, FECSEntity> __r;
        return __r;
    }
    TMap<FName, FECSEntity> GetModify_Entities() property
    {
        TMap<FName, FECSEntity> __r;
        this.__MarkDirty(10);
        return __r;
    }
    void SetEntities(const TMap<FName, FECSEntity> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(10);
        this.m_Entities = __Value;
        return;
    }
}

struct FCS_CutSceneViewData : FECSSingleton
{
    UPROPERTY()
    TWeakObjectPtr<ALevelSequenceActor> LevelSequenceActor;
    UPROPERTY()
    TMap<FECSEntity, TWeakObjectPtr<AActor>> EntityActors;
    UPROPERTY()
    TMap<TWeakObjectPtr<AActor>, FECSEntity> ActorToEntity;
    UPROPERTY()
    FName PlayerTag;
    UPROPERTY()
    TMap<FName, FECSEntity> Entities;

    FCS_CutSceneViewData()
    {
        return;
    }
}

struct FC_CutSceneRequestSpawnPoint : FECSComponent
{
    UPROPERTY()
    FVector Location;
    UPROPERTY()
    FRotator Rotation;

    FC_CutSceneRequestSpawnPoint()
    {
        return;
    }
}

struct FCE_CrossServerCutScenePlayerSpawned : FECSEvent
{
    FECSEvent _base_FECSEvent;

    FCE_CrossServerCutScenePlayerSpawned()
    {
        return;
    }
}

struct FCE_SkipCutScene : FECSEvent
{
    FECSEvent _base_FECSEvent;

    FCE_SkipCutScene()
    {
        return;
    }
}

struct FCE_PostPlayCutSceneFinished : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FECSLatentAction LatentAction;

    FCE_PostPlayCutSceneFinished()
    {
        return;
    }
}

namespace ECSFunc_FC_CutSceneLogicData
{
UFUNCTION()
bool HasCutSceneLogicData(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_CutSceneLogicData);
}
FC_CutSceneLogicData& AssignCutSceneLogicData(const FECSEntity &inout Entity, const FC_CutSceneLogicData &inout DefaultValue = FC_CutSceneLogicData())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_CutSceneLogicData, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignCutSceneLogicData_BP(const FECSEntity &inout Entity, const FC_CutSceneLogicData &inout DefaultValue = FC_CutSceneLogicData())
{
    ECSFunc_FC_CutSceneLogicData::AssignCutSceneLogicData(Entity, DefaultValue);
    return;
}
FC_CutSceneLogicData& ModifyCutSceneLogicData(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_CutSceneLogicData));
    return local_12.GetComp();
}
FC_CutSceneLogicData& ModifyOrAddCutSceneLogicData(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_CutSceneLogicData));
    return local_12.GetComp();
}
const FC_CutSceneLogicData& GetCutSceneLogicData(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_CutSceneLogicData));
    return local_12.GetComp();
}
UFUNCTION()
FC_CutSceneLogicData GetCutSceneLogicData_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_CutSceneLogicData& local_4 = ECSFunc_FC_CutSceneLogicData::GetCutSceneLogicData(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_CutSceneLogicData();
}
const FC_CutSceneLogicData GetDefaultedCutSceneLogicData(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_CutSceneLogicData __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_CutSceneLogicData);
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
FC_CutSceneLogicData GetDefaultedCutSceneLogicData_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_CutSceneLogicData::GetDefaultedCutSceneLogicData(Entity);
}
UFUNCTION()
bool RemoveCutSceneLogicData(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_CutSceneLogicData);
}
}
FECSMonitorRuntimeView __GetMonitorCutSceneLogicDataOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_CutSceneLogicData, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCutSceneLogicDataOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_CutSceneLogicData, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCutSceneLogicDataOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_CutSceneLogicData, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCutSceneLogicDataOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_CutSceneLogicData, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCutSceneLogicDataOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_CutSceneLogicData, bFixedFrame, bMustHandleAll);
}
void __MonitorCutSceneLogicDataLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_CutSceneLogicData, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCutSceneLogicDataActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_CutSceneLogicData, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCutSceneLogicDataModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_CutSceneLogicData, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FCS_CutSceneViewData
{
UFUNCTION()
bool HasCutSceneViewData(const FECSWorldPtr &inout World)
{
    return ECSInternal::Has(World, ENTITY_ID_NULL, FCS_CutSceneViewData);
}
FCS_CutSceneViewData& AssignCutSceneViewData(const FECSWorldPtr &inout World, const FCS_CutSceneViewData &inout DefaultValue = FCS_CutSceneViewData())
{
    UScriptStruct local_6 = FCS_CutSceneViewData;
    FECSComponentPtr local_8;
    int local_10 = local_8 = ECSInternal::Assign(World, ENTITY_ID_NULL, local_6, FECSComponentPtr(DefaultValue));
    local_10.InternalSet(local_8);
    return local_10.GetComp();
}
UFUNCTION()
void AssignCutSceneViewData_BP(const FECSWorldPtr &inout World, const FCS_CutSceneViewData &inout DefaultValue = FCS_CutSceneViewData())
{
    ECSFunc_FCS_CutSceneViewData::AssignCutSceneViewData(World, DefaultValue);
    return;
}
FCS_CutSceneViewData& ModifyCutSceneViewData(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_CutSceneViewData;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Modify(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
FCS_CutSceneViewData& ModifyOrAddCutSceneViewData(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_CutSceneViewData;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::ModifyOrAdd(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
const FCS_CutSceneViewData& GetCutSceneViewData(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_CutSceneViewData;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Get(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
UFUNCTION()
FCS_CutSceneViewData GetCutSceneViewData_BP(const FECSWorldPtr &inout World, bool &out bValid)
{
    FCS_CutSceneViewData __r;
    bValid = false;
    bValid = ECSFunc_FCS_CutSceneViewData::GetCutSceneViewData(World);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FCS_CutSceneViewData GetDefaultedCutSceneViewData(const FECSWorldPtr &inout World)
{
    int local_10 = 0;
    const FCS_CutSceneViewData __r;
    FECSComponentPtr local_6 = ECSInternal::GetDefaulted(World, ENTITY_ID_NULL, FCS_CutSceneViewData);
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
FCS_CutSceneViewData GetDefaultedCutSceneViewData_BP(const FECSWorldPtr &inout World)
{
    FCS_CutSceneViewData __r;
    return __r;
}
UFUNCTION()
bool RemoveCutSceneViewData(const FECSWorldPtr &inout World)
{
    return ECSInternal::Remove(World, ENTITY_ID_NULL, FCS_CutSceneViewData);
}
}
void __MonitorCutSceneViewDataLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FCS_CutSceneViewData, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCutSceneViewDataActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FCS_CutSceneViewData, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCutSceneViewDataModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FCS_CutSceneViewData, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_CutSceneRequestSpawnPoint
{
UFUNCTION()
bool HasCutSceneRequestSpawnPoint(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_CutSceneRequestSpawnPoint);
}
FC_CutSceneRequestSpawnPoint& AssignCutSceneRequestSpawnPoint(const FECSEntity &inout Entity, const FC_CutSceneRequestSpawnPoint &inout DefaultValue = FC_CutSceneRequestSpawnPoint())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_CutSceneRequestSpawnPoint, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignCutSceneRequestSpawnPoint_BP(const FECSEntity &inout Entity, const FC_CutSceneRequestSpawnPoint &inout DefaultValue = FC_CutSceneRequestSpawnPoint())
{
    ECSFunc_FC_CutSceneRequestSpawnPoint::AssignCutSceneRequestSpawnPoint(Entity, DefaultValue);
    return;
}
FC_CutSceneRequestSpawnPoint& ModifyCutSceneRequestSpawnPoint(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_CutSceneRequestSpawnPoint));
    return local_12.GetComp();
}
FC_CutSceneRequestSpawnPoint& ModifyOrAddCutSceneRequestSpawnPoint(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_CutSceneRequestSpawnPoint));
    return local_12.GetComp();
}
const FC_CutSceneRequestSpawnPoint& GetCutSceneRequestSpawnPoint(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_CutSceneRequestSpawnPoint));
    return local_12.GetComp();
}
UFUNCTION()
FC_CutSceneRequestSpawnPoint GetCutSceneRequestSpawnPoint_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_CutSceneRequestSpawnPoint& local_4 = ECSFunc_FC_CutSceneRequestSpawnPoint::GetCutSceneRequestSpawnPoint(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_CutSceneRequestSpawnPoint();
}
const FC_CutSceneRequestSpawnPoint GetDefaultedCutSceneRequestSpawnPoint(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_CutSceneRequestSpawnPoint __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_CutSceneRequestSpawnPoint);
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
FC_CutSceneRequestSpawnPoint GetDefaultedCutSceneRequestSpawnPoint_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_CutSceneRequestSpawnPoint::GetDefaultedCutSceneRequestSpawnPoint(Entity);
}
UFUNCTION()
bool RemoveCutSceneRequestSpawnPoint(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_CutSceneRequestSpawnPoint);
}
}
FECSMonitorRuntimeView __GetMonitorCutSceneRequestSpawnPointOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_CutSceneRequestSpawnPoint, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCutSceneRequestSpawnPointOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_CutSceneRequestSpawnPoint, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCutSceneRequestSpawnPointOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_CutSceneRequestSpawnPoint, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCutSceneRequestSpawnPointOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_CutSceneRequestSpawnPoint, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCutSceneRequestSpawnPointOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_CutSceneRequestSpawnPoint, bFixedFrame, bMustHandleAll);
}
void __MonitorCutSceneRequestSpawnPointLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_CutSceneRequestSpawnPoint, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCutSceneRequestSpawnPointActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_CutSceneRequestSpawnPoint, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCutSceneRequestSpawnPointModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_CutSceneRequestSpawnPoint, bFixedFrame, Details);
    return;
}
namespace AutoDelta
{
FRootDirtyFlags16 GetDirtyFlags(FC_CutSceneLogicData &inout Data)
{
    FRootDirtyFlags16 __r;
    return __r;
}
void InitDirtyFlags(FC_CutSceneLogicData &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_CutSceneLogicData &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_CutSceneLogicData
{
int __IndexOf_StartTime()
{
    return 0;
}
int __IndexOf_Duration()
{
    return 1;
}
int __IndexOf_LevelSequence()
{
    return 2;
}
int __IndexOf_CutSceneData()
{
    return 3;
}
int __IndexOf_OriginLocation()
{
    return 4;
}
int __IndexOf_OriginRotation()
{
    return 5;
}
int __IndexOf_bCrossDS()
{
    return 6;
}
int __IndexOf_bPrevTeleported()
{
    return 7;
}
int __IndexOf_bSupportSkip()
{
    return 8;
}
int __IndexOf_PlayerTag()
{
    return 9;
}
int __IndexOf_Entities()
{
    return 10;
}
}
