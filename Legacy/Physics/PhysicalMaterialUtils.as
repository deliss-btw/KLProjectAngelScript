const FConsoleVariable CVar_Physics_OptimizeWaterCheck = FConsoleVariable();
namespace PhysicalMaterialUtils
{
    const FStatID StatID_IsStandOnWater = FStatID();

UFUNCTION()
bool IsStandOnWater(const FECSEntity &inout Entity)
{
    int local_8 = 0;
    int local_14 = 0;
    const AActor local_64;
    FScopeCycleCounter local_1 = FScopeCycleCounter(PhysicalMaterialUtils::StatID_IsStandOnWater, false);
    if ((!(local_8) || !(local_14)))
    {
        return false;
    }
    if (CVar_Physics_OptimizeWaterCheck.GetBool())
    {
        return FGamePhysicsUtils::IsAtWaterSurface(ECS::GetUEWorld(), local_14.GetPosition(), local_14.GetRotation(), local_8.GetScaledShape());
    }
    FCollisionQueryParams local_60;
    local_64 = Entity.GetActor();
    if (local_64 != nullptr)
    {
        local_60.AddIgnoredActor(local_64);
    }
    local_60.bReturnPhysicalMaterial = true;
    FHitResult local_130;
    FCollisionResponseParams local_164;
    FVector local_150 = local_14.GetPosition();
    bool local_15 = FPhysicsUtils::LineTraceSingle(Entity, true, EPhysicsTraceTag(22), local_130, local_14.GetPosition(), (local_150 - FVector(0.0, 0.0, (local_8.GetScaledHalfHeight() + 10.0f))), ECollisionChannel(0), local_60, local_164);
    if (local_15)
    {
        UGamePhysicalMaterial local_170 = FHitResultUtils::GetPhysicalMaterialFromHitResult(local_130);
        if (local_170 != nullptr)
        {
            return local_170.GetbIsWater();
        }
    }
    return false;
}
}
