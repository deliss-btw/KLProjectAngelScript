
namespace BlueprintFunctions_Projectile
{
UFUNCTION()
void ProjectileAutoCalcMovement(const FECSEntityAdapter &inout OwnerEntity, const FECSEntity &inout ProjectileEntity, const FProjectileMovementCalculationData &inout AutoCalcProjectileMovementData, const FRotator3f &inout AdditionalRotation)
{
    ProjectileAutoCalcMovementUtils::AutoCalcMovement(OwnerEntity.GetEntity(), ProjectileEntity, AutoCalcProjectileMovementData, AdditionalRotation);
    return;
}
UFUNCTION()
void ProjectileIncreaseNumLimited(const FECSEntityAdapter &inout ProjectileOwner, const TSoftClassPtr<AProjectilePrefab> &inout ProjectilePrefab, const int IncreaseNum)
{
    // body not fully recovered вЂ” stub [opcode-uncovered]
}
UFUNCTION()
void ProjectileDecreaseNumLimited(const FECSEntityAdapter &inout ProjectileOwner, const TSoftClassPtr<AProjectilePrefab> &inout ProjectilePrefab, const int DecreaseNum)
{
    BlueprintFunctions_Projectile::ProjectileIncreaseNumLimited(ProjectileOwner, ProjectilePrefab, -DecreaseNum);
    return;
}
}
