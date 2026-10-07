
namespace AutoTest::API::GameplayTagAPI
{
bool HasTag(const int EntityId, const FName &inout TagName)
{
    int local_20 = 0;
    ThrowIf(!(FECSEntity(EntityId).IsValid()), FString().Append("EntityID: ").Append(EntityId).Append(" is unvalid."));
    bool local_13 = !(local_20);
    ThrowIf(local_13, FString().Append("EntityID: ").Append(EntityId).Append(" FC_GameplayTags is null."));
    FGameplayTag local_24 = FGameplayTag::RequestGameplayTag(TagName, true);
    ThrowIf(!(local_24.IsValid()), FString().Append("Tag: ").Append(TagName).Append(" is invalid."));
    return local_20.GetTagContainer().HasTag(local_24);
}
}
