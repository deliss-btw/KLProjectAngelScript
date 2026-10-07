
enum EECSQueryTargetType
{
    Any,
    Character,
    PlayerPawn,
    Monster,
    Prop,
}


struct FECSQueryParam
{
    UPROPERTY()
    bool bExcludeDeath = true;
    UPROPERTY()
    int TargetType;
    UPROPERTY()
    TSubclassOf<AECSPrefab> SpecificPrefabClass;
    UPROPERTY()
    bool bFilterByFaction = false;
    UPROPERTY()
    int FactionRelation;


}

namespace ECSQueryUtils
{
void AddQueryFilterByParams(FECSRuntimeQuery &inout Query, const FECSEntity &inout Entity, const FECSQueryParam &inout Params)
{
    bool local_1 = Params.bExcludeDeath;
    if (local_1)
    {
        Exclude(Query).opCall();
    }
    if (int(Params.TargetType) == 0)
    {
        local_1 = false;
    }
    else
    {
        int local_8 = Params.TargetType & 1;
        local_1 = (local_8 == 0);
    }
    if (local_1)
    {
        TArray<TSubclassOf<AECSPrefab>> local_14;
        if ((int(Params.TargetType) & 2) != 0)
        {
            local_14.Add(ACharacterPrefab);
        }
        if ((int(Params.TargetType) & 4) != 0)
        {
            local_14.Add(AAvatarPrefab);
        }
        if ((int(Params.TargetType) & 8) != 0)
        {
            local_14.Add(AMonsterPrefab);
        }
        if ((int(Params.TargetType) & 16) != 0)
        {
            local_14.Add(APropPrefab);
        }
        Query.FilterByPrefabClasses(local_14);
    }
    else
    {
        if (Params.SpecificPrefabClass.IsValid())
        {
            Query.FilterByPrefabClass(Params.SpecificPrefabClass);
        }
    }
    if ((Params.bFilterByFaction && (int(Params.FactionRelation) != 0)))
    {
        Get local_20;
        const FC_Faction& local_22 = local_20.opCall();
        if (local_22)
        {
            FFactionBitMask local_30;
            int local_15 = 1 & int(Params.FactionRelation);
            if (local_15 != 0)
            {
                local_30.CombineFactionMask(FASCommonUtils::GetFactionBitMaskByRelation(local_22.GetFactionId(), EFactionRelation(1)));
            }
            int local_8_2 = 2 & int(Params.FactionRelation);
            if (local_8_2 != 0)
            {
                local_30.CombineFactionMask(FASCommonUtils::GetFactionBitMaskByRelation(local_22.GetFactionId(), EFactionRelation(2)));
            }
            int local_9 = 4 & int(Params.FactionRelation);
            if (local_9 != 0)
            {
                local_30.CombineFactionMask(FASCommonUtils::GetFactionBitMaskByRelation(local_22.GetFactionId(), EFactionRelation(4)));
            }
            Query.FilterByFactionBitMask(local_30);
        }
    }
    return;
}
UFUNCTION()
TArray<FECSEntity> QueryInSphere(const FECSEntity &inout Entity, const FVector &inout Center, const float32 Radius, const FECSQueryParam &inout Params, const EECSQueryRegsitryType RegType = EECSQueryRegsitryType::E_DefaultAndStatic, const bool bIncludeInactive = false)
{
    FECSRuntimeQuery local_40 = FECSRuntimeQueryHelper::RuntimeQueryInSphere(Entity, Center, Radius, EECSQueryRegsitryType(RegType), bIncludeInactive);
    ECSQueryUtils::AddQueryFilterByParams(local_40, Entity, Params);
    return local_40.GetAllEntities();
}
UFUNCTION()
TArray<FECSEntity> QueryInSphereCone(const FECSEntity &inout Entity, const FVector &inout Center, const FVector &inout Direction, const float32 Radius, const float32 Angle, const FECSQueryParam &inout Params, const EECSQueryRegsitryType RegType = EECSQueryRegsitryType::E_DefaultAndStatic, const bool bIncludeInactive = false)
{
    FECSRuntimeQuery local_40 = FECSRuntimeQueryHelper::RuntimeQueryInSphereCone(Entity, Center, Direction, Radius, Angle, EECSQueryRegsitryType(RegType), bIncludeInactive);
    ECSQueryUtils::AddQueryFilterByParams(local_40, Entity, Params);
    return local_40.GetAllEntities();
}
UFUNCTION()
TArray<FECSEntity> QueryInCylinder(const FECSEntity &inout Entity, const FVector &inout Center, const float32 Radius, const float32 HalfHeight, const bool bConsiderTargetCylinder, const FECSQueryParam &inout Params, const EECSQueryRegsitryType RegType = EECSQueryRegsitryType::E_DefaultAndStatic, const bool bIncludeInactive = false)
{
    FECSRuntimeQuery local_40 = FECSRuntimeQueryHelper::RuntimeQueryInCylinder(Entity, Center, Radius, HalfHeight, bConsiderTargetCylinder, EECSQueryRegsitryType(RegType), bIncludeInactive);
    ECSQueryUtils::AddQueryFilterByParams(local_40, Entity, Params);
    return local_40.GetAllEntities();
}
}
