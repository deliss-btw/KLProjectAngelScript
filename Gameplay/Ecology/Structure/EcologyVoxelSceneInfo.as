
enum EEcologyVoxelUnitSlot
{
    Resource,
    Creature,
    CreatureFlock,
    Point,
    Max,
}

enum ESearchCreatureSpecialFilter
{
    None,
    Corpse,
}


struct FVoxelRegionIndex
{
    UPROPERTY()
    int X = 0;
    UPROPERTY()
    int Y = 0;

    FVoxelRegionIndex(const FIntVector2 &inout InValue)
    {
        this.X = int(InValue.X);
        this.Y = int(InValue.Y);
        return;
    }
    int ToRegionIndex() const
    {
        int local_1 = (this.X << 16) + this.Y;
        return local_1;
    }
}

struct FVoxelPosition
{
    UPROPERTY()
    FVector StdPosition;
    UPROPERTY()
    int X;
    UPROPERTY()
    int Y;
    UPROPERTY()
    int Z;

    FVoxelPosition()
    {
        this.X = 0;
        this.Y = 0;
        this.Z = 0;
        return;
    }
    FVoxelPosition(const FVector &inout Position)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FVoxelRegionIndex ToRegionPos() const
    {
        FVoxelRegionIndex local_2;
        int local_3 = this.X >> 3;
        local_2.X = local_3;
        int local_3_2 = this.Y >> 3;
        local_2.Y = local_3_2;
        return local_2;
    }
    int64 ToCellIndex() const
    {
        return (::FEcologySceneInfoUtils::CombineVoxelCoordToIndex(this.X, this.Y, this.Z));
    }
    int ToRegionIndex() const
    {
        return this.ToRegionPos().ToRegionIndex();
    }
    FString ToString() const
    {
        return FString().AppendChar(int16(123)).Append((this.X - 32768)).Append(",").Append((this.Y - 32768)).Append(",").Append((this.Z - 32768)).AppendChar(int16(125));
    }
}

struct FVoxelIterator
{
    UPROPERTY()
    FVoxelPosition Min;
    UPROPERTY()
    FVoxelPosition Max;
    UPROPERTY()
    FVoxelPosition Current;
    UPROPERTY()
    FVoxelPosition Next;
    UPROPERTY()
    bool CanProceed = false;

    FVoxelIterator(const FVoxelPosition &inout inMin, const FVoxelPosition &inout inMax)
    {
        this = inMin;
        this.Max = inMax;
        this.Current = this;
        this.Next = this.Current;
        this.CanProceed = (this.Next.X <= this.Max.X && (this.Next.Y <= this.Max.Y) && (this.Next.Z <= this.Max.Z));
        return;
    }
    void CalNext()
    {
        this.Next = this.Current;
        this.Next.X += 1;
        if (this.Next.X > this.Max.X)
        {
            ++this.Next.Z;
            this.Next.X = this.X;
        }
        if (this.Next.Z > this.Max.Z)
        {
            ++this.Next.Y;
            this.Next.Z = this.Z;
        }
        this.CanProceed = (this.Next.Y <= this.Max.Y);
        return;
    }
    FVoxelIterator Proceed()
    {
        FVoxelIterator __r;
        this.Current = this.Next;
        this.CalNext();
        return __r;
    }
}

struct FVoxelRegionIterator
{
    UPROPERTY()
    FVoxelRegionIndex Min;
    UPROPERTY()
    FVoxelRegionIndex Max;
    UPROPERTY()
    FVoxelRegionIndex Current;
    UPROPERTY()
    FVoxelRegionIndex Next;
    UPROPERTY()
    bool CanProceed;

    FVoxelRegionIterator()
    {
        this.CanProceed = false;
        return;
    }
    FVoxelRegionIterator(const FVoxelRegionIndex &inout inMin, const FVoxelRegionIndex &inout inMax)
    {
        int local_3;
        this.CanProceed = false;
        this = inMin;
        this.Max = inMax;
        this.Current = this;
        this.Next = this.Current;
        if (this.Next.X > this.Max.X)
        {
            local_3 = 0;
        }
        else
        {
            local_3 = (this.Next.Y <= this.Max.Y);
        }
        this.CanProceed = (local_3 != 0);
        return;
    }
    void CalNext()
    {
        this.Next = this.Current;
        this.Next.X += 1;
        if (this.Next.X > this.Max.X)
        {
            ++this.Next.Y;
            this.Next.X = this.X;
        }
        this.CanProceed = (this.Next.Y <= this.Max.Y);
        return;
    }
    FVoxelRegionIterator Proceed()
    {
        FVoxelRegionIterator __r;
        this.Current = this.Next;
        this.CalNext();
        return __r;
    }
}

struct FVoxelRegionScope
{
    UPROPERTY()
    FVoxelRegionIndex Min;
    UPROPERTY()
    FVoxelRegionIndex Max;

    FVoxelRegionScope()
    {
        return;
    }
    FVoxelRegionScope(const FBox &inout Scope)
    {
        FVoxelPosition local_10 = FVoxelPosition(Scope.Min);
        FVoxelPosition local_20 = FVoxelPosition(Scope.Max);
        this = local_10.ToRegionPos();
        this.Max = local_20.ToRegionPos();
        return;
    }
    FVoxelRegionScope(const FVoxelPosition &inout inMin, const FVoxelPosition &inout inMax)
    {
        this = inMin.ToRegionPos();
        this.Max = inMax.ToRegionPos();
        return;
    }
    FVoxelRegionIterator Iterator() const
    {
        return FVoxelRegionIterator(this, this.Max);
    }
}

struct FVoxelScope
{
    UPROPERTY()
    FVoxelPosition Min;
    UPROPERTY()
    FVoxelPosition Max;

    FVoxelScope()
    {
        return;
    }
    FVoxelScope(const FBox &inout Scope)
    {
        FVoxelPosition local_10 = FVoxelPosition(Scope.Min);
        FVoxelPosition local_20 = FVoxelPosition(Scope.Max);
        this = local_10;
        this.Max = local_20;
        return;
    }
    FVoxelScope(const FVoxelPosition &inout inMin, const FVoxelPosition &inout inMax)
    {
        this = inMin;
        this.Max = inMax;
        return;
    }
    FVoxelIterator Iterator() const
    {
        return FVoxelIterator(this, this.Max);
    }
}

struct FEcologyVoxelSceneUnitSummary
{
    UPROPERTY()
    FECSEntityId UnitEntity;
    UPROPERTY()
    FBox Box;
    UPROPERTY()
    int SceneSpaceCost;


}

struct FEcologyVoxelSceneRegionSlot
{
    UPROPERTY()
    TMap<FECSEntityId, FEcologyVoxelSceneUnitSummary> SlotData;

    FEcologyVoxelSceneRegionSlot()
    {
        return;
    }
}

struct FEcologyVoxelSceneRegionSlotMap
{
    UPROPERTY()
    TMap<int64, FEcologyVoxelSceneRegionSlot> Data;

    FEcologyVoxelSceneRegionSlotMap()
    {
        return;
    }
}

struct FEcologyVoxelSceneCell
{
    UPROPERTY()
    TArray<FEcologyVoxelSceneRegionSlot> RegionData;

    FEcologyVoxelSceneCell()
    {
        this.SetNum(4);
        return;
    }
}

struct FRegionVolumeSummary
{
    UPROPERTY()
    bool bEffectWeather;
    UPROPERTY()
    FName WeatherName;
    UPROPERTY()
    FECSEntityId WeatherEntityId;
    UPROPERTY()
    FECSEntityId RegionEntityId;
    UPROPERTY()
    bool bHasEcologyModifier;
    UPROPERTY()
    bool bCompleteInRegion;
    UPROPERTY()
    bool bIsCombatRegion;
    UPROPERTY()
    FBoxSphereBounds Bounds;
    UPROPERTY()
    int Priority = 0;
    UPROPERTY()
    TWeakObjectPtr<AECSVolumeBase> Volume;


}

struct FEcologyVoxelSceneRegion
{
    UPROPERTY()
    TMap<FECSEntityId, FRegionVolumeSummary> VolumeData;
    UPROPERTY()
    TArray<FEcologyVoxelSceneRegionSlotMap> AllSlotCellMap;

    FEcologyVoxelSceneRegion()
    {
        this.AllSlotCellMap.SetNum(4);
        return;
    }
    bool ExitRegionData(const EEcologyVoxelUnitSlot Slot, const FVoxelPosition &inout Pos)
    {
        int local_1 = int(Slot);
        return this.AllSlotCellMap[local_1].Data.Contains(Pos.ToCellIndex());
    }
    void Remove(const FVoxelPosition &inout Pos, const FECSEntityId &inout Entity, const EEcologyVoxelUnitSlot Slot)
    {
        TMap<int64, FEcologyVoxelSceneRegionSlot> local_8;
        int local_4 = Pos.ToCellIndex();
        if (local_8.Contains(local_4))
        {
            FEcologyVoxelSceneRegionSlot& local_12 = local_8[local_4];
        }
        return;
    }
    void Add(const FVoxelPosition &inout Pos, const FEcologyVoxelSceneUnitSummary &inout Summary, const EEcologyVoxelUnitSlot Slot)
    {
        TMap<int64, FEcologyVoxelSceneRegionSlot> local_8;
        int local_4 = Pos.ToCellIndex();
        if (!(local_8.Contains(local_4)))
        {
            FEcologyVoxelSceneRegionSlot local_30;
            local_8.Add(local_4, local_30);
        }
        local_8[local_4].SlotData.FindOrAdd(Summary.UnitEntity);
        return;
    }
    int GetUnitCountInCell(const FVoxelPosition &inout Position, const EEcologyVoxelUnitSlot Slot)
    {
        int local_2 = Position.ToCellIndex();
        if (!(this.AllSlotCellMap[int(Slot)].Data.Contains(local_2)))
        {
            return 0;
        }
        return this.AllSlotCellMap[int(Slot)].Data[local_2].SlotData.Num();
    }
    TMap<int64, FEcologyVoxelSceneRegionSlot> GetCellSlotDataRef(const EEcologyVoxelUnitSlot Slot)
    {
        TMap<int64, FEcologyVoxelSceneRegionSlot> __r;
        return __r;
    }
}

struct FRegisterEntity
{
    UPROPERTY()
    FECSEntityId Entity;
    UPROPERTY()
    FBox EffectVolume;

    FRegisterEntity()
    {
        return;
    }
}

struct FEcologyVoxelScene
{
    UPROPERTY()
    TMap<int, FEcologyVoxelSceneRegion> RegionMap;

    FEcologyVoxelScene()
    {
        return;
    }
    TConstRawPtr<FEcologyVoxelSceneRegion> FindRegion(const FVoxelPosition &inout Pos) const
    {
        return this.Find(Pos.ToRegionIndex());
    }
    FEcologyVoxelSceneRegion& FindOrAddRegion(const FVoxelPosition &inout Pos)
    {
        return this.FindOrAdd(Pos.ToRegionIndex());
    }
    FEcologyVoxelSceneRegion& FindOrAddRegion(const FVoxelRegionIndex &inout Pos)
    {
        return this.FindOrAdd(Pos.ToRegionIndex());
    }
    TConstRawPtr<FEcologyVoxelSceneRegion> Find(const FVoxelPosition &inout Pos) const
    {
        return this.Find(Pos.ToRegionIndex());
    }
    TConstRawPtr<FEcologyVoxelSceneRegion> Find(const FVoxelRegionIndex &inout Pos) const
    {
        return this.Find(Pos.ToRegionIndex());
    }
    bool ExitRegion(const FVoxelPosition &inout Pos) const
    {
        if (this.Contains(Pos.ToRegionIndex()))
        {
            return true;
        }
        return false;
    }
    void RemoveEntity(const FVoxelPosition &inout Pos, const FECSEntityId &inout Entity, const EEcologyVoxelUnitSlot Slot)
    {
        int local_4 = Pos.ToCellIndex();
        int local_6 = Pos.ToRegionIndex();
        if (!(this.Contains(local_6)))
        {
            return;
        }
        FEcologyVoxelSceneRegion& local_10 = this[local_6];
        return;
    }
    void AddEntity(const FVoxelPosition &inout Pos, const FEcologyVoxelSceneUnitSummary &inout Summary, const EEcologyVoxelUnitSlot Slot)
    {
        FEcologyVoxelSceneRegion& local_2 = this.FindOrAddRegion(Pos);
        local_2.Add(Pos, Summary, EEcologyVoxelUnitSlot(Slot));
        return;
    }
    int GetUnitCountInCell(const FVoxelPosition &inout Position, const EEcologyVoxelUnitSlot Slot)
    {
        int local_1 = Position.ToRegionIndex();
        if (!(this.Contains(local_1)))
        {
            return 0;
        }
        FEcologyVoxelSceneRegion& local_6 = this[local_1];
        return local_6.GetUnitCountInCell(Position, EEcologyVoxelUnitSlot(Slot));
    }
}

struct FEntitySearchResult
{
    UPROPERTY()
    FECSEntityId EntityId;

    FEntitySearchResult()
    {
        return;
    }
    FEntitySearchResult(const FECSEntityId &inout ID)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FECSEntity GetEntity()
    {
        return FECSEntity(this);
    }
}

struct FEntitySearchResultList
{
    UPROPERTY()
    TArray<FEntitySearchResult> Results;

    FEntitySearchResultList()
    {
        return;
    }
    FEntitySearchResultList(const TArray<FEntitySearchResult> &inout InResults)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
}

struct FVolumeProxy
{
    UPROPERTY()
    TWeakObjectPtr<AECSRegionVolume> Volume;

    FVolumeProxy()
    {
        return;
    }
    FVolumeProxy(const AECSRegionVolume VolumeComponent)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    bool IsValid()
    {
        return this.IsValid();
    }
    bool QuickEncompassesPoint(const FVector &inout Point) const
    {
        if (!(this.IsValid()))
        {
            return false;
        }
        AECSRegionVolume local_4;
        return local_4.QuickEncompassesPoint(Point);
    }
    FBox GetBounds() const
    {
        if (!(this.IsValid()))
        {
            return FBox();
        }
        AECSRegionVolume local_18;
        return local_18.GetVolumeBoundsWithCache().GetBox();
    }
    FECSEntity GetRegionEntity()
    {
        if (!(this.IsValid()))
        {
            return ENTITY_NULL;
        }
        AECSRegionVolume local_4;
        return local_4.GetRegionEntity();
    }
}

struct FResourceSearchRequest
{
    UPROPERTY()
    FECSEntityId Requester;
    UPROPERTY()
    FVector Center;
    UPROPERTY()
    int SearchRadius = 1000;
    UPROPERTY()
    int MaxResultCount = 10;
    UPROPERTY()
    TSet<TDataObjectPtr<FEcologyResourceDefinitionRow>> IncludeResourceTypes;
    UPROPERTY()
    bool bFilterByCreatureType = false;
    UPROPERTY()
    TDataObjectPtr<FEcologyCreatureDefinitionRow> CreatureRow;
    UPROPERTY()
    FName WeatherName;
    UPROPERTY()
    int TimeSegments = 0;
    UPROPERTY()
    bool bCheckSpaceCost = false;
    UPROPERTY()
    bool bIncludeClaimed = false;
    UPROPERTY()
    TArray<FVolumeProxy> IncludeVolumes;
    UPROPERTY()
    TArray<FVolumeProxy> IncludeOtherVolumes;
    UPROPERTY()
    TArray<FVolumeProxy> ExcludeVolumes;
    UPROPERTY()
    FKLGameplayTagQuery TagFilter;


    bool IsInExcludeVolume(const FVector &inout Position) const
    {
        for (auto& local_16 : this.ExcludeVolumes)
        {
            if (local_16.QuickEncompassesPoint(Position))
            {
                return true;
            }
        }
        return false;
    }
    bool IsInIncludeVolume(const FVector &inout Position) const
    {
        for (auto& local_16 : this.IncludeVolumes)
        {
            if (local_16.QuickEncompassesPoint(Position))
            {
                return true;
            }
        }
        return false;
    }
    bool IsInIncludeOtherVolume(const FVector &inout Position) const
    {
        for (auto& local_16 : this.IncludeOtherVolumes)
        {
            if (local_16.QuickEncompassesPoint(Position))
            {
                return true;
            }
        }
        return false;
    }
}

struct FCreatureSearchRequest
{
    UPROPERTY()
    TDataObjectPtr<FEcologyCreatureDefinitionRow> CreatureType;
    UPROPERTY()
    FKLGameplayTagQuery CreatureTagFilter;
    UPROPERTY()
    int MaxCount;
    UPROPERTY()
    float32 Radius = 0.0f;
    UPROPERTY()
    ESearchCreatureSpecialFilter SpecialTagFilterType = ESearchCreatureSpecialFilter(0);
    UPROPERTY()
    bool bOnlyFlockMember = false;
    UPROPERTY()
    bool bIncludeDead = false;


}

