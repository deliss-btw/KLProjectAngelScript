
namespace AutoTest::API::ESMAPI
{
FString GetCurrentStateName(const uint EntityId, const int SMRuntimeIndex)
{
    int local_20 = 0;
    int local_30 = 0;
    ThrowIf(!(FECSEntity(EntityId).IsValid()), FString().Append("EntityID: ").Append(EntityId).Append(" is unvalid."));
    bool local_13 = !(local_20);
    ThrowIf(local_13, FString().Append("EntityID: ").Append(EntityId).Append(" FC_ESM is null."));
    UESMStateMachine local_24 = local_20.Asset.GetStateMachine(SMRuntimeIndex);
    FString local_12 = FString();
    ThrowIf(local_24, !((local_24 != nullptr)));
    ThrowIf(!(local_30), FString().Append("EntityID: ").Append(EntityId).Append(" FC_ESMPlayer is null."));
    FString local_12_2 = FString();
    ThrowIf((SMRuntimeIndex >= local_30.Player.GetSMRuntime().Num()), local_12_2.Append("EntityID: ").Append(EntityId).Append(" SMRuntimeIndex: ").Append(SMRuntimeIndex).Append(" is out of range."));
    local_24.GetBaseState(local_30.Player.GetSMRuntime()[local_12_2].GetStateIndex()).GetDisplayName();
    return local_12_2;
}
FString GetAvatarCurrentStateName(const int SMRuntimeIndex)
{
    FECSEntity local_8 = AutoTest::CommonUtils::GetLocalAvatarEntity();
    ThrowIf(!(local_8.IsValid()), "AvatarEntity is invalid.");
    return AutoTest::API::ESMAPI::GetCurrentStateName(local_8.GetIdValue(), SMRuntimeIndex);
}
FName GetESMAssetName(const uint EntityId)
{
    int local_20 = 0;
    ThrowIf(!(FECSEntity(EntityId).IsValid()), FString().Append("EntityID: ").Append(EntityId).Append(" is unvalid."));
    bool local_13 = !(local_20);
    ThrowIf(local_13, FString().Append("EntityID: ").Append(EntityId).Append(" FC_ESM is null."));
    return local_20.Asset.GetFName();
}
FName GetAvatarESMAssetName()
{
    FECSEntity local_8 = AutoTest::CommonUtils::GetLocalAvatarEntity();
    ThrowIf(!(local_8.IsValid()), "AvatarEntity is invalid.");
    return AutoTest::API::ESMAPI::GetESMAssetName(local_8.GetIdValue());
}
}
