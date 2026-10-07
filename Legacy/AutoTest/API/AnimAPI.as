
namespace AutoTest::API::AnimAPI
{
float32 GetAnimStateNormalizedTime(const uint EntityId, const int StateIndex)
{
    int local_20 = 0;
    int local_26 = 0;
    ThrowIf(!(FECSEntity(EntityId).IsValid()), FString().Append("EntityID: ").Append(EntityId).Append(" is unvalid."));
    bool local_13 = !(local_20);
    ThrowIf(local_13, FString().Append("EntityID: ").Append(EntityId).Append(" FC_AnimStateHistory is null."));
    FC_AnimState local_266;
    local_20.GetInterpoValue(local_26.Time, local_266);
    local_266.SampleTo(local_26.Time);
    ThrowIf((StateIndex >= local_266.GetLayerNum()), FString().Append("EntityID: ").Append(EntityId).Append(" StateIndex: ").Append(StateIndex).Append(" is out of range."));
    return GetNormalizedPlayTime();
}
}
