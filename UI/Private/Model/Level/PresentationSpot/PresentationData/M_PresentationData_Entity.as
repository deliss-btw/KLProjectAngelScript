
namespace FMS_SpotByEntityId
{
    const int ModelId = 0;

}
struct FSpotByEntityIdData
{
    UPROPERTY()
    TArray<TEUIModelWeakRef<FM_Spot>> Spots;
    UPROPERTY()
    TEUIModelWeakRef<FM_Spot> EntitySpot;

    FSpotByEntityIdData()
    {
        return;
    }
}

struct FMS_SpotByEntityId : FEUIModelSingleton
{
    FEUIModelSingleton _base_FEUIModelSingleton;
    UPROPERTY()
    TMap<FECSEntityId, FSpotByEntityIdData> m_EntityIdToSpotsMap;
    UPROPERTY()
    int m_CleanupInterval;
    UPROPERTY()
    int m_CleanupIntervalCounter;
    UPROPERTY()
    TMap<TEUIModelWeakRef<FM_Spot>, FECSEntityId> m_SpotOwnerEntityIdMap;

    FMS_SpotByEntityId()
    {
        this.m_CleanupInterval = 3000;
        this.m_CleanupIntervalCounter = 0;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FMS_SpotByEntityId(const FMS_SpotByEntityId &inout Other)
    {
        this.m_CleanupInterval = 3000;
        this.m_CleanupIntervalCounter = 0;
        this.m_EntityIdToSpotsMap = Other.m_EntityIdToSpotsMap;
        this.m_CleanupInterval = int(Other.m_CleanupInterval);
        this.m_CleanupIntervalCounter = int(Other.m_CleanupIntervalCounter);
        this.m_SpotOwnerEntityIdMap = Other.m_SpotOwnerEntityIdMap;
        return;
    }
    FMS_SpotByEntityId& opAssign(const FMS_SpotByEntityId &inout Other)
    {
        this.m_EntityIdToSpotsMap = Other.m_EntityIdToSpotsMap;
        this.m_CleanupInterval = int(Other.m_CleanupInterval);
        this.m_CleanupIntervalCounter = int(Other.m_CleanupIntervalCounter);
        return Other.m_SpotOwnerEntityIdMap;
    }
    void RegisterSpotOwnerEntityId(const FM_Spot &inout Spot, const FECSEntityId &inout OwnerEntityID)
    {
        this.GetModify_EntityIdToSpotsMap().FindOrAdd(OwnerEntityID).Spots.AddUnique(TEUIModelWeakRef<FM_Spot>(Spot));
        return;
    }
    void SetSpotOwnerEntityId(const FM_Spot &inout Spot, const FECSEntityId &inout OwnerEntityID)
    {
        if ((OwnerEntityID == ENTITY_ID_NULL))
        {
            TEUIModelWeakRef<FM_Spot> local_4 = TEUIModelWeakRef<FM_Spot>(Spot);
            return;
        }
        this.GetModify_SpotOwnerEntityIdMap().Add(TEUIModelWeakRef<FM_Spot>(Spot), OwnerEntityID);
        return;
    }
    FECSEntityId GetSpotOwnerEntityId(const TEUIModelWeakRef<FM_Spot> &inout Spot)
    {
        FECSEntityId local_1 = FECSEntityId(ENTITY_ID_NULL);
        this.GetSpotOwnerEntityIdMap().Find(Spot, local_1);
        return local_1;
    }
    void RegisterEntitySpot(const FM_Spot &inout Spot, const FECSEntityId &inout EntityID)
    {
        FSpotByEntityIdData& local_2 = this.GetModify_EntityIdToSpotsMap().FindOrAdd(EntityID);
        local_2.Spots.AddUnique(TEUIModelWeakRef<FM_Spot>(Spot));
        local_2.EntitySpot = TEUIModelWeakRef<FM_Spot>(Spot);
        return;
    }
    TArray<TEUIModelRef<FM_Spot>> GetLiveEntitySpots() const
    {
        TEUIModelWeakRef<FM_Spot> local_26;
        TArray<TEUIModelRef<FM_Spot>> local_4;
        for (auto& local_24 : this.GetEntityIdToSpotsMap())
        {
            local_24;
            if (local_26.IsValid())
            {
                TEUIModelRef<FM_Spot> local_28 = local_26.AsRef();
                if (local_28 && local_28.opArrow().IsEntitySpotLive())
                {
                    local_4.Add(local_28);
                }
            }
        }
        return local_4;
    }
    void CleanupInvalidSpots()
    {
        bool local_21;
        TArray<TEUIModelWeakRef<FM_Spot>> local_26;
        TArray<FECSEntityId> local_4;
        bool local_31 = false;
        for (auto& local_24 : this.GetModify_EntityIdToSpotsMap())
        {
            int local_30 = local_26.Num() - 1;
            for (; local_30 >= 0; --local_30)
            {
                if (!(local_26[local_30]))
                {
                    local_26.RemoveAtSwap(local_30);
                }
            }
            if (!(local_26.IsEmpty()))
            {
                local_21 = false;
            }
            else
            {
                local_31 = !local_31;
                local_21 = local_31;
            }
            if (local_21)
            {
                local_4.Add(local_24.GetKey());
            }
        }
        for (auto& local_46 : local_4)
        {
            local_46;
        }
        TArray<TEUIModelWeakRef<FM_Spot>> local_50;
        for (auto& local_68 : this.GetSpotOwnerEntityIdMap())
        {
            if (!(local_68.GetKey()))
            {
                local_50.Add(local_68.GetKey());
            }
        }
        for (auto& local_82 : local_50)
        {
            local_82;
        }
        return;
    }
    void Tick()
    {
        this.SetCleanupIntervalCounter((this.GetCleanupIntervalCounter() + 1));
        if (this.GetCleanupIntervalCounter() >= this.GetCleanupInterval())
        {
            this.CleanupInvalidSpots();
            this.SetCleanupIntervalCounter(0);
        }
        return;
    }
    void InvalidateEntityCache()
    {
        this.GetModify_EntityIdToSpotsMap().Empty(0);
        this.GetModify_SpotOwnerEntityIdMap().Empty(0);
        return;
    }
    const TMap<FECSEntityId, FSpotByEntityIdData> GetEntityIdToSpotsMap() const property
    {
        const TMap<FECSEntityId, FSpotByEntityIdData> __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    TMap<FECSEntityId, FSpotByEntityIdData> GetModify_EntityIdToSpotsMap() property
    {
        TMap<FECSEntityId, FSpotByEntityIdData> __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetEntityIdToSpotsMap(const TMap<FECSEntityId, FSpotByEntityIdData> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_EntityIdToSpotsMap = __Value;
        return;
    }
    int GetCleanupInterval() const property
    {
        this.TrackPropertyRead(1);
        return this.m_CleanupInterval;
    }
    void SetCleanupInterval(const int __Value) property
    {
        if (this.m_CleanupInterval == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_CleanupInterval = __Value;
        return;
    }
    int GetCleanupIntervalCounter() const property
    {
        this.TrackPropertyRead(2);
        return this.m_CleanupIntervalCounter;
    }
    void SetCleanupIntervalCounter(const int __Value) property
    {
        if (this.m_CleanupIntervalCounter == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_CleanupIntervalCounter = __Value;
        return;
    }
    const TMap<TEUIModelWeakRef<FM_Spot>, FECSEntityId> GetSpotOwnerEntityIdMap() const property
    {
        const TMap<TEUIModelWeakRef<FM_Spot>, FECSEntityId> __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    TMap<TEUIModelWeakRef<FM_Spot>, FECSEntityId> GetModify_SpotOwnerEntityIdMap() property
    {
        TMap<TEUIModelWeakRef<FM_Spot>, FECSEntityId> __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetSpotOwnerEntityIdMap(const TMap<TEUIModelWeakRef<FM_Spot>, FECSEntityId> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_SpotOwnerEntityIdMap = __Value;
        return;
    }
}

struct FMsg_EntitySpotRegistered : FEUIMessage
{
    UPROPERTY()
    FECSEntityId EntityId;
    UPROPERTY()
    TEUIModelRef<FM_Spot> Spot;

    FMsg_EntitySpotRegistered()
    {
        return;
    }
}

struct FMsg_EntitySpotUnregistered : FEUIMessage
{
    UPROPERTY()
    FECSEntityId EntityId;
    UPROPERTY()
    TEUIModelRef<FM_Spot> Spot;

    FMsg_EntitySpotUnregistered()
    {
        return;
    }
}

FECSEntityId GetOwnerEntityId(const FM_Spot &inout Spot)
{
    if (Spot)
    {
        return Spot.GetEntityId();
    }
    return ENTITY_ID_NULL;
}
void SetOwnerEntityId(FM_Spot &inout Spot, const FECSEntityId &inout OwnerEntityID)
{
    Spot.SetEntityIdInternal(OwnerEntityID);
    PresentationSpotUtils::GetDefaultRegistry(Spot.GetManager()).AddSpot(TEUIModelRef<FM_Spot>(Spot));
    FMS_SpotByEntityId::Get(Spot.GetContext().Manager).RegisterSpotOwnerEntityId(Spot, OwnerEntityID);
    return;
}
namespace FMS_SpotByEntityId
{
FMS_SpotByEntityId& Get(const UObject ContextObject)
{
    return FMS_SpotByEntityId::GetByManager(EUIInternal::GetContextManager(ContextObject));
}
FMS_SpotByEntityId GetByManager(const UEUIManagerSubsystem Manager)
{
    FMS_SpotByEntityId __r;
    TEUIModelRef<FMS_SpotByEntityId> local_6 = TEUIModelRef<FMS_SpotByEntityId>(EUIInternal::MakeModelWithManager(Manager, FMS_SpotByEntityId::ModelId));
    return __r;
}
void GetModelInfo(FEUIModelOnlyMetaInfo &inout Result)
{
    Result.SetbHasInvalidateEntityCache(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.TickFunction.FunctionName = "__Tick";
    return;
}
UScriptStruct GetModelStruct()
{
    return FMS_SpotByEntityId;
}
void __Tick(FMS_SpotByEntityId &inout Model)
{
    Model.Tick();
    return;
}
int __IndexOf_EntityIdToSpotsMap()
{
    return 0;
}
int __IndexOf_CleanupInterval()
{
    return 1;
}
int __IndexOf_CleanupIntervalCounter()
{
    return 2;
}
int __IndexOf_SpotOwnerEntityIdMap()
{
    return 3;
}
}
