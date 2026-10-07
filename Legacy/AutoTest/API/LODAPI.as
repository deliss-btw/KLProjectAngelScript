
namespace AutoTest::API::LODAPI
{
void SetSkeletalMeshLODByEntityId(const uint EntityId, const int LODLevel)
{
    FECSEntity local_4 = FECSEntity(EntityId);
    ThrowIf(!(local_4.IsValid()), FString().Append("EntityID: ").Append(EntityId).Append(" is invalid."));
    AActor local_18 = local_4.GetMutableActor();
    FString local_12 = FString();
    ThrowIf(local_18, !((local_18 != nullptr)));
    TArray<USkeletalMeshComponent> local_22 = local_18.GetComponentsByClass(USkeletalMeshComponent);
    for (auto local_40 : local_22)
    {
        local_40.SetForcedLOD(LODLevel);
    }
    return;
}
}
