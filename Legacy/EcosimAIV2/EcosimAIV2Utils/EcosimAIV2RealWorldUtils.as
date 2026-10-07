
namespace FEcosimAIV2Utils
{
void InitEcosimAIV2()
{
    FECSWorldPtr local_2 = ECS::GetECSWorld();
    ModifyOrAdd local_6;
    local_6.opCall();
    return;
}
FECSEntity CreateEntity(const FName &inout UnitName, const FVector &inout Location, const FRotator &inout Rotation)
{
    FEcosimAIV2UnitData local_26;
    if (FEcosimAIV2Utils::GetRealWorldEntityUnitData(UnitName, local_26))
    {
        return FEcosimAIV2Utils::CreateEntityInternal(local_26, Location, Rotation);
    }
    return ENTITY_NULL;
}
FECSEntity CreateEntityByData(const TDataObjectPtr<FEcosimAIV2UnitData> &inout Data, const FVector &inout Location, const FRotator &inout Rotation)
{
    if (!(Data) || !(Data.IsSet()))
    {
        return ENTITY_NULL;
    }
    FEcosimAIV2UnitData local_4;
    return FEcosimAIV2Utils::CreateEntityInternal(local_4, Location, Rotation);
}
FECSEntity CreateEntityInternal(const FEcosimAIV2UnitData &inout UnitData, const FVector &inout Location, const FRotator &inout Rotation)
{
    return ECS::RequestEntityByPrefabDeferred(UnitData.RealWorldEntityPrefab.Get(), (Location + FVector(0.0, 0.0, 0.0)), Rotation, EPrefabCollisionAlignment(0), EECSRegType(0), false);
}
void SpawnTradeTeam(const bool bAllowRandom = true)
{
    return;
}
bool IsEntityReachTargetLocation(const FECSEntity &inout Entity, const FVector &inout TargetLocation, const float32 ReachDistance = 100)
{
    Get local_4;
    const FC_Transform& local_6 = local_4.opCall();
    if (local_6)
    {
        return (local_6.GetPosition().DistSquared2D(TargetLocation) < (ReachDistance * ReachDistance));
    }
    return false;
}
void SetEntityMoveToTargetLocation(const FECSEntity &inout Entity, const FVector &inout TargetLocation)
{
    Modify local_4;
    FC_EcosimAIV2EntityInfo& local_6 = local_4.opCall();
    if (local_6)
    {
        local_6.MoveToTargetLocation = TargetLocation;
        local_6.bNeedMoveToTargetLocation = true;
    }
    return;
}
void StopEntityMoveToTargetLocation(const FECSEntity &inout Entity)
{
    Modify local_4;
    FC_EcosimAIV2EntityInfo& local_6 = local_4.opCall();
    if (local_6)
    {
        local_6.bNeedMoveToTargetLocation = false;
    }
    return;
}
bool PLCheckEntityHasComponent(const FECSEntity &inout Entity, const FString &inout ClassComponent)
{
    FLegacyEcoQuery local_26 = FStdPrologUtils::Context(FEcosimAIV2PrologDeclare::fn_check_entity_has_component, FPlTerm(Entity), FPlTerm::CreateAtom(ClassComponent)).CreateQuery(false);
    if (local_26.NextSolution())
    {
        local_26.Close();
        return true;
    }
    local_26.Close();
    return false;
}
bool GetEntityRidingMount(const FECSEntity &inout Entity, FECSEntity &out MountEntity)
{
    FECSEntity local_4;
    MountEntity = local_4;
    Get local_8;
    const FC_PawnRiddingMount& local_10 = local_8.opCall();
    if (local_10)
    {
        if (local_10.IsDriver())
        {
            MountEntity = local_10.GetMountEntity();
        }
    }
    return false;
}
bool IsEntityRidingMountHasClassTag(const FECSEntity &inout Entity, const FString &inout ClassTag)
{
    FECSEntity local_4;
    if (FEcosimAIV2Utils::GetEntityRidingMount(Entity, local_4))
    {
        return FEcosimAIV2Utils::PLCheckEntityHasComponent(local_4, ClassTag);
    }
    return false;
}
bool GetEntityChainingEntityList(const FECSEntity &inout Entity, TArray<FECSEntity> &out ChainingEntityList)
{
    TArray<FECSEntity> local_4;
    ChainingEntityList = local_4;
    Get local_8;
    const FC_ChainChildrenInfo& local_10 = local_8.opCall();
    if (local_10)
    {
        ChainingEntityList.Append(local_10.GetChildren());
    }
    FECSEntity local_16;
    if (FEcosimAIV2Utils::GetEntityRidingMount(Entity, local_16))
    {
        const FC_ChainChildrenInfo& local_10_2 = local_8.opCall();
        if (local_10_2)
        {
            ChainingEntityList.Append(local_10_2.GetChildren());
        }
    }
    return ChainingEntityList.IsEmpty();
}
bool IsEntityAnyChainingEntityHasClassTag(const FECSEntity &inout Entity, const FString &inout ClassTag)
{
    TArray<FECSEntity> local_4;
    if (FEcosimAIV2Utils::GetEntityChainingEntityList(Entity, local_4))
    {
        for (auto& local_20 : local_4)
        {
            if (FEcosimAIV2Utils::PLCheckEntityHasComponent(local_20, ClassTag))
            {
                return true;
            }
        }
    }
    return false;
}
}
