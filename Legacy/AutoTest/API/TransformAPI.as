
namespace AutoTest::API::TransformAPI
{
FVector GetLocation(const uint EntityId)
{
    int local_20 = 0;
    ThrowIf(!(FECSEntity(EntityId).IsValid()), FString().Append("EntityID: ").Append(EntityId).Append(" is unvalid."));
    bool local_13 = !(local_20);
    ThrowIf(local_13, FString().Append("EntityID: ").Append(EntityId).Append(" FC_Transform is null."));
    return local_20.GetPosition();
}
FVector GetAvatarLocation()
{
    FECSEntity local_8 = AutoTest::CommonUtils::GetLocalAvatarEntity();
    ThrowIf(!(local_8.IsValid()), "AvatarEntity is invalid.");
    return AutoTest::API::TransformAPI::GetLocation(local_8.GetIdValue());
}
FRotator GetRotation(const uint EntityId)
{
    int local_20 = 0;
    ThrowIf(!(FECSEntity(EntityId).IsValid()), FString().Append("EntityID: ").Append(EntityId).Append(" is unvalid."));
    bool local_13 = !(local_20);
    ThrowIf(local_13, FString().Append("EntityID: ").Append(EntityId).Append(" FC_Transform is null."));
    return FRotator(local_20.GetRotation());
}
FRotator GetAvatarRotation()
{
    FECSEntity local_8 = AutoTest::CommonUtils::GetLocalAvatarEntity();
    ThrowIf(!(local_8.IsValid()), "AvatarEntity is invalid.");
    return AutoTest::API::TransformAPI::GetRotation(local_8.GetIdValue());
}
}
