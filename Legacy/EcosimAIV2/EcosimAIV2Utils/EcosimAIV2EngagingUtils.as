
namespace FEcosimAIV2Utils
{
bool GetEntityEngagingTargetList(const FECSEntity &inout Entity, TArray<FTargetEntity> &out EngagingTargetEntityList)
{
    TArray<FTargetEntity> local_4;
    EngagingTargetEntityList = local_4;
    Get local_8;
    const FC_EcosimAIV2EntityEngagingInfo& local_10 = local_8.opCall();
    if (local_10)
    {
        EngagingTargetEntityList = local_10.EngagingTargetEntityList;
    }
    return !(EngagingTargetEntityList.IsEmpty());
}
}
