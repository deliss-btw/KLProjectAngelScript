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
    Has local_4;
    int local_20 = 0;
    if (local_4.opCall() && !(ProjectilePrefab.IsNull()))
    {
        FName local_14 = FName(ProjectilePrefab.ToString());
        int local_22 = local_20.FindModifierItemIdx(local_14);
        if (local_22 != INDEX_NONE)
        {
            local_20.GetModify_ModifierItems()[local_22].SetLimitNum((local_20.GetModifierItems()[local_22].GetLimitNum() + IncreaseNum));
        }
        else
        {
            FNumLimitedPairItem local_28;
            local_28.SetIdentifier(local_14);
            local_28.SetLimitNum(IncreaseNum);
            local_20.GetModify_ModifierItems().Add(local_28);
        }
        int local_21_2 = 0;
        if (local_20.TryGetRealLimitedNum(local_14, local_21_2))
        {
            ModifyOrAdd local_32;
            local_32.opCall().LimitNums.Add(local_14, local_21_2);
        }
    }
    return;
}
UFUNCTION()
void ProjectileDecreaseNumLimited(const FECSEntityAdapter &inout ProjectileOwner, const TSoftClassPtr<AProjectilePrefab> &inout ProjectilePrefab, const int DecreaseNum)
{
    BlueprintFunctions_Projectile::ProjectileIncreaseNumLimited(ProjectileOwner, ProjectilePrefab, -DecreaseNum);
    return;
}
}
