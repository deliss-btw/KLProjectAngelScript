
namespace FPresentationUtils
{
UFUNCTION()
bool GetLocalPlayerPawnLocation(FVector &out Location)
{
    FVector local_6;
    Location = local_6;
    FECSEntity local_14 = FASCommonUtils::GetLocalPlayerPawnEntity();
    if ((local_14 == ENTITY_NULL))
    {
        return false;
    }
    Location = FTransformUtils::GetLocation(local_14, FFPTime(-1));
    return true;
}
UFUNCTION()
float32 GetDistanceToLocalPlayerPawn(const AActor Actor)
{
    FVector local_6;
    if (!(FPresentationUtils::GetLocalPlayerPawnLocation(local_6)))
    {
        return 3.4028235e38f;
    }
    return float32(Actor.GetActorLocation().Distance(local_6));
}
}
