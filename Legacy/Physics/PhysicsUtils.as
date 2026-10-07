
namespace FPhysicsUtils
{
UFUNCTION()
float32 GetMass(const FECSEntity &inout Entity)
{
    const AActor local_4;
    UPrimitiveComponent local_12;
    local_4 = Entity.GetActor();
    if (local_4 != nullptr)
    {
        local_12 = (Cast<UPrimitiveComponent>(local_4.GetRootComponent()));
        if (local_12 != nullptr)
        {
            return local_12.CalculateMass(NAME_None);
        }
    }
    return 0.0f;
}
}
