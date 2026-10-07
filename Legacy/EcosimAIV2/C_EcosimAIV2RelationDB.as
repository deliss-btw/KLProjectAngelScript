
namespace __INTENRAL_FCS_EcosimAIV2RelationDB_NS
{
    const TECSComponentDerivedPtr<FCS_EcosimAIV2RelationDB> DerivedPtr = TECSComponentDerivedPtr<FCS_EcosimAIV2RelationDB>();
    const FCS_EcosimAIV2RelationDB DefaultValue = FCS_EcosimAIV2RelationDB();

}
struct FEcosimAIV2RelationEntry
{
    UPROPERTY()
    FECSEntity Source;
    UPROPERTY()
    FECSEntity Target;
    UPROPERTY()
    EEcosimAIV2EntityRelation Relation = EEcosimAIV2EntityRelation(0);
    UPROPERTY()
    bool bIsPlan = false;


}

struct FEcosimAIV2InteractRelationEntry
{
    UPROPERTY()
    FECSEntity Source;
    UPROPERTY()
    FECSEntity Target;
    UPROPERTY()
    int PointIndex = -1;
    UPROPERTY()
    int BehaviorIndex = -1;
    UPROPERTY()
    bool bIsPlan = false;


}

struct FCS_EcosimAIV2RelationDB : FECSSingleton
{
    UPROPERTY()
    TArray<FEcosimAIV2RelationEntry> Relations;
    UPROPERTY()
    TArray<FEcosimAIV2InteractRelationEntry> InteractRelations;

    FCS_EcosimAIV2RelationDB()
    {
        return;
    }
    bool MatchRelationType(const bool bEntryIsPlan, const EEcosimAIV2RelationType QueryType) const
    {
        if (int(QueryType) == 1)
        {
            return !(bEntryIsPlan);
        }
        if (int(QueryType) == 2)
        {
            return bEntryIsPlan;
        }
        return true;
    }
    void AddRelation(const FECSEntity &inout Source, const FECSEntity &inout Target, const EEcosimAIV2EntityRelation Relation, const bool bIsPlan)
    {
        int local_1 = 0;
        for (; local_1 < this.Num(); ++local_1)
        {
            FEcosimAIV2RelationEntry& local_6 = this[local_1];
            if (!(!(((local_6.Source == Source) && (local_6.Target == Target) && (int(local_6.Relation) == int(Relation))))) && (!(local_6.bIsPlan) == !(bIsPlan)))
            {
                return;
            }
        }
        FEcosimAIV2RelationEntry local_24;
        local_24.Source = Source;
        local_24.Target = Target;
        local_24.Relation = Relation;
        local_24.bIsPlan = bIsPlan;
        this.Add(local_24);
        return;
    }
    void RemoveRelation(const FECSEntity &inout Source, const FECSEntity &inout Target, const EEcosimAIV2EntityRelation Relation, const bool bIsPlan)
    {
        int local_4 = this.Num() - 1;
        for (; local_4 >= 0; --local_4)
        {
            FEcosimAIV2RelationEntry& local_8 = this[local_4];
            if (!(!(((local_8.Source == Source) && (local_8.Target == Target) && (int(local_8.Relation) == int(Relation))))) && (!(local_8.bIsPlan) == !(bIsPlan)))
            {
                this.RemoveAt(local_4);
            }
        }
        return;
    }
    void RemoveRelationsBySource(const FECSEntity &inout Source, const EEcosimAIV2EntityRelation Relation, const bool bIsPlan)
    {
        int local_4 = this.Num() - 1;
        for (; local_4 >= 0; --local_4)
        {
            FEcosimAIV2RelationEntry& local_8 = this[local_4];
            if (!(!(((local_8.Source == Source) && (int(local_8.Relation) == int(Relation))))) && (!(local_8.bIsPlan) == !(bIsPlan)))
            {
                this.RemoveAt(local_4);
            }
        }
        return;
    }
    void RemoveRelationsByTarget(const FECSEntity &inout Target, const EEcosimAIV2EntityRelation Relation, const bool bIsPlan)
    {
        int local_4 = this.Num() - 1;
        for (; local_4 >= 0; --local_4)
        {
            FEcosimAIV2RelationEntry& local_8 = this[local_4];
            if (!(!(((local_8.Target == Target) && (int(local_8.Relation) == int(Relation))))) && (!(local_8.bIsPlan) == !(bIsPlan)))
            {
                this.RemoveAt(local_4);
            }
        }
        return;
    }
    void RemoveAllRelationsInvolvingEntity(const FECSEntity &inout Entity)
    {
        int local_4 = this.Num() - 1;
        for (; local_4 >= 0; --local_4)
        {
            FEcosimAIV2RelationEntry& local_8 = this[local_4];
            if (((local_8.Source == Entity) || (local_8.Target == Entity)))
            {
                this.RemoveAt(local_4);
            }
        }
        return;
    }
    bool HasRelation(const FECSEntity &inout Source, const FECSEntity &inout Target, const EEcosimAIV2EntityRelation Relation, const EEcosimAIV2RelationType QueryType) const
    {
        bool local_11;
        int local_1 = 0;
        for (; local_1 < this.Num(); ++local_1)
        {
            const FEcosimAIV2RelationEntry& local_6 = this[local_1];
            if (!(((local_6.Source == Source) && (local_6.Target == Target) && (int(local_6.Relation) == int(Relation)))))
            {
                local_11 = false;
            }
            else
            {
                local_11 = local_6.bIsPlan;
                local_11 = this.MatchRelationType(local_11, EEcosimAIV2RelationType(QueryType));
            }
            if (local_11)
            {
                return true;
            }
        }
        return false;
    }
    void GetTargets(const FECSEntity &inout Source, const EEcosimAIV2EntityRelation Relation, const EEcosimAIV2RelationType QueryType, TArray<FECSEntity> &out OutTargets) const
    {
        bool local_17;
        TArray<FECSEntity> local_4;
        OutTargets = local_4;
        OutTargets.Empty(0);
        int local_6 = 0;
        for (; local_6 < this.Num(); ++local_6)
        {
            const FEcosimAIV2RelationEntry& local_10 = this[local_6];
            if (!(((local_10.Source == Source) && (int(local_10.Relation) == int(Relation)))))
            {
                local_17 = false;
            }
            else
            {
                local_17 = local_10.bIsPlan;
                local_17 = this.MatchRelationType(local_17, EEcosimAIV2RelationType(QueryType));
            }
            if (local_17)
            {
                OutTargets.AddUnique(local_10.Target);
            }
        }
        return;
    }
    void GetSources(const FECSEntity &inout Target, const EEcosimAIV2EntityRelation Relation, const EEcosimAIV2RelationType QueryType, TArray<FECSEntity> &out OutSources) const
    {
        bool local_17;
        TArray<FECSEntity> local_4;
        OutSources = local_4;
        OutSources.Empty(0);
        int local_6 = 0;
        for (; local_6 < this.Num(); ++local_6)
        {
            const FEcosimAIV2RelationEntry& local_10 = this[local_6];
            if (!(((local_10.Target == Target) && (int(local_10.Relation) == int(Relation)))))
            {
                local_17 = false;
            }
            else
            {
                local_17 = local_10.bIsPlan;
                local_17 = this.MatchRelationType(local_17, EEcosimAIV2RelationType(QueryType));
            }
            if (local_17)
            {
                OutSources.AddUnique(local_10.Source);
            }
        }
        return;
    }
    void QueryRelations(const FECSEntity &inout Source, const bool bSourceIsVar, const FECSEntity &inout Target, const bool bTargetIsVar, const EEcosimAIV2EntityRelation Relation, const EEcosimAIV2RelationType QueryType, TArray<FEcosimAIV2RelationEntry> &out OutEntries) const
    {
        TArray<FEcosimAIV2RelationEntry> local_4;
        OutEntries = local_4;
        OutEntries.Empty(0);
        int local_6 = 0;
        for (; local_6 < this.Num(); ++local_6)
        {
            const FEcosimAIV2RelationEntry& local_10 = this[local_6];
            if (int(local_10.Relation) != int(Relation))
            {
                continue;
            }
            if (!(this.MatchRelationType(local_10.bIsPlan, EEcosimAIV2RelationType(QueryType))))
            {
                continue;
            }
            if (!(bSourceIsVar) && !((local_10.Source == Source)))
            {
                continue;
            }
            if (!(bTargetIsVar) && !((local_10.Target == Target)))
            {
                continue;
            }
            OutEntries.Add(local_10);
        }
        return;
    }
    bool HasMatchingRelation(const FECSEntity &inout Source, const bool bSourceIsVar, const FECSEntity &inout Target, const bool bTargetIsVar, const EEcosimAIV2EntityRelation Relation, const EEcosimAIV2RelationType QueryType, const FECSEntity &inout ExcludeSource) const
    {
        int local_1 = 0;
        for (; local_1 < this.Num(); ++local_1)
        {
            const FEcosimAIV2RelationEntry& local_6 = this[local_1];
            if (int(local_6.Relation) != int(Relation))
            {
                continue;
            }
            if (!(this.MatchRelationType(local_6.bIsPlan, EEcosimAIV2RelationType(QueryType))))
            {
                continue;
            }
            if (ExcludeSource.IsValid() && (local_6.Source == ExcludeSource))
            {
                continue;
            }
            if (!(bSourceIsVar) && !((local_6.Source == Source)))
            {
                continue;
            }
            if (!(bTargetIsVar) && !((local_6.Target == Target)))
            {
                continue;
            }
            return true;
        }
        return false;
    }
    bool HasRelationPath(const FECSEntity &inout Source, const bool bSourceIsVar, const FECSEntity &inout Target, const bool bTargetIsVar, const TArray<EEcosimAIV2EntityRelation> &inout RelationPath, const EEcosimAIV2RelationType QueryType, const FECSEntity &inout ExcludeSource) const
    {
        EEcosimAIV2EntityRelation local_10;
        if ((RelationPath.Num()) == 0)
        {
            return false;
        }
        TArray<FECSEntity> local_8;
        int local_9 = 0;
        for (; local_9 < RelationPath.Num(); )
        {
            local_10 = RelationPath[local_9];
            TArray<FECSEntity> local_16;
            int local_17 = 0;
            for (; local_17 < this.Num(); ++local_17)
            {
                const FEcosimAIV2RelationEntry& local_20 = this[local_17];
                if (int(local_20.Relation) != int(local_10))
                {
                    continue;
                }
                if (!(this.MatchRelationType(local_20.bIsPlan, EEcosimAIV2RelationType(QueryType))))
                {
                    continue;
                }
                if (local_9 == 0)
                {
                    if (ExcludeSource.IsValid() && (local_20.Source == ExcludeSource))
                    {
                        continue;
                    }
                    if (!(bSourceIsVar) && !((local_20.Source == Source)))
                    {
                        continue;
                    }
                }
                else
                {
                    if (!(local_8.Contains(local_20.Source)))
                    {
                        continue;
                    }
                }
                if (!(local_20.Target.IsValid()))
                {
                    continue;
                }
                local_16.AddUnique(local_20.Target);
            }
            if (local_16.Num() == 0)
            {
                return false;
            }
            local_8 = local_16;
            ++local_9;
        }
        if (bTargetIsVar)
        {
            return (local_8.Num() > 0);
        }
        return local_8.Contains(Target);
    }
    void GetControlledTargets(const FECSEntity &inout Source, const bool bIncludePlan, TArray<FECSEntity> &out OutTargets) const
    {
        TArray<FECSEntity> local_4;
        OutTargets = local_4;
        OutTargets.Empty(0);
        if (!(Source.IsValid()))
        {
            return;
        }
        TArray<FECSEntity> local_10;
        local_10.Add(Source);
        int local_11 = 0;
        while (local_11 < local_10.Num())
        {
            FECSEntity local_16 = local_10[local_11];
            ++local_11;
            int local_17 = 0;
            for (; local_17 < this.Num(); ++local_17)
            {
                const FEcosimAIV2RelationEntry& local_20 = this[local_17];
                if (!((local_20.Source == local_16)))
                {
                    continue;
                }
                if (local_20.bIsPlan && !(bIncludePlan))
                {
                    continue;
                }
                if (int(local_20.Relation) != 1 && (int(local_20.Relation) != 3) && (int(local_20.Relation) != 2))
                {
                    continue;
                }
                if (!(local_20.Target.IsValid()))
                {
                    continue;
                }
                if (OutTargets.Contains(local_20.Target))
                {
                    continue;
                }
                OutTargets.Add(local_20.Target);
                local_10.Add(local_20.Target);
            }
        }
        return;
    }
    void AddInteractRelation(const FECSEntity &inout Source, const FECSEntity &inout Target, const int PointIndex, const int BehaviorIndex, const bool bIsPlan)
    {
        int local_1 = 0;
        for (; local_1 < this.InteractRelations.Num(); ++local_1)
        {
            FEcosimAIV2InteractRelationEntry& local_6 = this.InteractRelations[local_1];
            if (!(!(((local_6.Source == Source) && (local_6.Target == Target) && (int(local_6.PointIndex) == PointIndex) && (int(local_6.BehaviorIndex) == BehaviorIndex)))) && (!(local_6.bIsPlan) == !(bIsPlan)))
            {
                return;
            }
        }
        FEcosimAIV2InteractRelationEntry local_24;
        local_24.Source = Source;
        local_24.Target = Target;
        local_24.PointIndex = PointIndex;
        local_24.BehaviorIndex = BehaviorIndex;
        local_24.bIsPlan = bIsPlan;
        this.InteractRelations.Add(local_24);
        return;
    }
    void RemoveInteractRelation(const FECSEntity &inout Source, const FECSEntity &inout Target, const int PointIndex, const int BehaviorIndex, const bool bIsPlan)
    {
        int local_4 = this.InteractRelations.Num() - 1;
        for (; local_4 >= 0; --local_4)
        {
            FEcosimAIV2InteractRelationEntry& local_8 = this.InteractRelations[local_4];
            if (!(!(((local_8.Source == Source) && (local_8.Target == Target) && (int(local_8.PointIndex) == PointIndex) && (int(local_8.BehaviorIndex) == BehaviorIndex)))) && (!(local_8.bIsPlan) == !(bIsPlan)))
            {
                this.InteractRelations.RemoveAt(local_4);
            }
        }
        return;
    }
    void RemoveInteractRelationsBySource(const FECSEntity &inout Source, const bool bIsPlan)
    {
        int local_4 = this.InteractRelations.Num() - 1;
        for (; local_4 >= 0; --local_4)
        {
            FEcosimAIV2InteractRelationEntry& local_8 = this.InteractRelations[local_4];
            if (!(!((local_8.Source == Source))) && (!(local_8.bIsPlan) == !(bIsPlan)))
            {
                this.InteractRelations.RemoveAt(local_4);
            }
        }
        return;
    }
    void RemoveAllInteractRelationsInvolvingEntity(const FECSEntity &inout Entity)
    {
        int local_4 = this.InteractRelations.Num() - 1;
        for (; local_4 >= 0; --local_4)
        {
            FEcosimAIV2InteractRelationEntry& local_8 = this.InteractRelations[local_4];
            if (((local_8.Source == Entity) || (local_8.Target == Entity)))
            {
                this.InteractRelations.RemoveAt(local_4);
            }
        }
        return;
    }
    int CountInteractSources(const FECSEntity &inout Target, const int PointIndex, const int BehaviorIndex, const EEcosimAIV2RelationType QueryType, const FECSEntity &inout ExcludeSource) const
    {
        int local_1 = 0;
        int local_3 = 0;
        for (; local_3 < this.InteractRelations.Num(); ++local_3)
        {
            const FEcosimAIV2InteractRelationEntry& local_8 = this.InteractRelations[local_3];
            if ((!((local_8.Target == Target))))
            {
                continue;
            }
            if (int(local_8.PointIndex) != PointIndex)
            {
                continue;
            }
            if (int(local_8.BehaviorIndex) != BehaviorIndex)
            {
                continue;
            }
            if (!(this.MatchRelationType(local_8.bIsPlan, EEcosimAIV2RelationType(QueryType))))
            {
                continue;
            }
            if (ExcludeSource.IsValid() && (local_8.Source == ExcludeSource))
            {
                continue;
            }
            ++local_1;
        }
        return local_1;
    }
}

namespace ECSFunc_FCS_EcosimAIV2RelationDB
{
UFUNCTION()
bool HasEcosimAIV2RelationDB(const FECSWorldPtr &inout World)
{
    return ECSInternal::Has(World, ENTITY_ID_NULL, FCS_EcosimAIV2RelationDB);
}
FCS_EcosimAIV2RelationDB& AssignEcosimAIV2RelationDB(const FECSWorldPtr &inout World, const FCS_EcosimAIV2RelationDB &inout DefaultValue = FCS_EcosimAIV2RelationDB())
{
    UScriptStruct local_6 = FCS_EcosimAIV2RelationDB;
    FECSComponentPtr local_8;
    int local_10 = local_8 = ECSInternal::Assign(World, ENTITY_ID_NULL, local_6, FECSComponentPtr(DefaultValue));
    local_10.InternalSet(local_8);
    return local_10.GetComp();
}
UFUNCTION()
void AssignEcosimAIV2RelationDB_BP(const FECSWorldPtr &inout World, const FCS_EcosimAIV2RelationDB &inout DefaultValue = FCS_EcosimAIV2RelationDB())
{
    ECSFunc_FCS_EcosimAIV2RelationDB::AssignEcosimAIV2RelationDB(World, DefaultValue);
    return;
}
FCS_EcosimAIV2RelationDB& ModifyEcosimAIV2RelationDB(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_EcosimAIV2RelationDB;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Modify(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
FCS_EcosimAIV2RelationDB& ModifyOrAddEcosimAIV2RelationDB(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_EcosimAIV2RelationDB;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::ModifyOrAdd(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
const FCS_EcosimAIV2RelationDB& GetEcosimAIV2RelationDB(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_EcosimAIV2RelationDB;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Get(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
UFUNCTION()
FCS_EcosimAIV2RelationDB GetEcosimAIV2RelationDB_BP(const FECSWorldPtr &inout World, bool &out bValid)
{
    FCS_EcosimAIV2RelationDB __r;
    bValid = false;
    bValid = ECSFunc_FCS_EcosimAIV2RelationDB::GetEcosimAIV2RelationDB(World);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FCS_EcosimAIV2RelationDB GetDefaultedEcosimAIV2RelationDB(const FECSWorldPtr &inout World)
{
    int local_10 = 0;
    const FCS_EcosimAIV2RelationDB __r;
    FECSComponentPtr local_6 = ECSInternal::GetDefaulted(World, ENTITY_ID_NULL, FCS_EcosimAIV2RelationDB);
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
FCS_EcosimAIV2RelationDB GetDefaultedEcosimAIV2RelationDB_BP(const FECSWorldPtr &inout World)
{
    FCS_EcosimAIV2RelationDB __r;
    return __r;
}
UFUNCTION()
bool RemoveEcosimAIV2RelationDB(const FECSWorldPtr &inout World)
{
    return ECSInternal::Remove(World, ENTITY_ID_NULL, FCS_EcosimAIV2RelationDB);
}
}
void __MonitorEcosimAIV2RelationDBLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FCS_EcosimAIV2RelationDB, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcosimAIV2RelationDBActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FCS_EcosimAIV2RelationDB, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcosimAIV2RelationDBModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FCS_EcosimAIV2RelationDB, bFixedFrame, Details);
    return;
}
