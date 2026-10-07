
namespace FCompanionBehaviorUitls
{
UFUNCTION()
void ShowBehaviorStringOnHead(const FECSEntity &inout PawnEntity, const FString &inout BehaviorString)
{
    0.SetShowBehaviorStringOnHead(BehaviorString);
    SendEvent local_10;
    local_10.opCall((ECS::GetContextTime() + FFPTime(5)));
    return;
}
}
