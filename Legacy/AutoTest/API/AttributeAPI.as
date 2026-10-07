
namespace AutoTest::API::AttributeAPI
{
float32 GetAttrValue(const uint EntityId, const FName &inout AttributeName)
{
    int local_34 = 0;
    int local_38 = 0;
    int local_46 = 0;
    ThrowIf(!(FECSEntity(EntityId).IsValid()), FString().Append("EntityID: ").Append(EntityId).Append(" is invalid."));
    FGameAttributeRef local_28 = FGameAttributeRef(AttributeName);
    if (ECS::GetRuntimeInfo().IsServer)
    {
        bool local_13 = !(local_34);
        ThrowIf(local_13, FString().Append("EntityID: ").Append(EntityId).Append(", FC_GameAttributeView is null."));
        FECSWorldPtr local_36 = ECS::GetECSWorld();
        return local_34.GetAttributeValue(local_28, local_38);
    }
    else
    {
        ThrowIf(!(local_46), FString().Append("EntityID: ").Append(EntityId).Append(", FC_GameAttributeView is null."));
        FECSWorldPtr local_36_2 = ECS::GetECSWorld();
        return local_46.GetAttributeValue(local_28, local_38);
    }
}
float32 GetAvatarAttrValue(const FName &inout AttributeName)
{
    ThrowIf(ECS::GetRuntimeInfo().IsServer, "GetAvatarAttrValue can only be called on client side.");
    FECSEntity local_10 = AutoTest::CommonUtils::GetLocalAvatarEntity();
    ThrowIf(!(local_10.IsValid()), "AvatarEntity is invalid.");
    return AutoTest::API::AttributeAPI::GetAttrValue(local_10.GetIdValue(), AttributeName);
}
}
