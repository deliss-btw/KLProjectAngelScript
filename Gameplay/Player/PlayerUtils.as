
namespace FPlayerUtils
{
void GetAllPlayerPawnEntitiesInRange(TArray<FECSEntity> &inout OutAllEntities, const FECSWorldPtr &inout World, const FVector &inout Location, const float32 Range, const bool bIncludeBackGround = true)
{
    OutAllEntities.Reset(0);
    FECSRuntimeQuery local_44 = FECSRuntimeQueryHelper::MakeRuntimeQuery(ENTITY_NULL, World, EECSQueryRegsitryType(1), bIncludeBackGround);
    Include local_88;
    local_88.opCall();
    Exclude(local_44).opCall();
    local_44.FilterByDistance(Location, Range);
    FECSRuntimeQueryIterator local_114 = local_44.Iterator();
    for (; local_114.CanProceed;)
    {
        OutAllEntities.Add(local_114.Proceed());
    }
    return;
}
void OverridePlayerAvatarBuild(const FECSEntity &inout PlayerEntity, const TDataObjectPtr<FAvatarBuildOverrideConfig> &inout Config)
{
    // body not fully recovered вЂ” stub [unresolved-operand]
}
}
