
namespace FGTCUtils
{
UFUNCTION()
void TransitToESMState(const FECSEntity &inout TargetEntity, const FName &inout ToState, const float32 StateTimeOffset = 0.0f)
{
    if ((ToState == NAME_None))
    {
        return;
    }
    Get local_6;
    if (local_6.opCall())
    {
        FESMExternalTransitHandle local_16 = TargetEntity.ESMExternalTransitMainSM(ToState, NAME_None);
        if (StateTimeOffset > 0.0f)
        {
            local_16.SetToStateTimeOffset(StateTimeOffset);
        }
    }
    return;
}
UFUNCTION()
void RemoveEntity(const FECSEntity &inout TargetEntity)
{
    if (!(TargetEntity.IsValid()))
    {
        return;
    }
    FLifeCycleUtils::EntityDestroyDirectly(TargetEntity, ECS::GetContextTime());
    return;
}
UFUNCTION()
void SetLatency(const bool bEnableLatency, const float OutGoingLatency = 0, const float InComingLatency = 0)
{
    if (bEnableLatency)
    {
        NetSim::SetOutgoingLatency(float32(OutGoingLatency));
        NetSim::SetIncomingLatency(float32(InComingLatency));
        NetSim::SetEnabled(true);
        return;
    }
    NetSim::SetEnabled(bEnableLatency);
    return;
}
UFUNCTION()
void ApplyAICommandSnapshot(const FECSEntity &inout TargetEntity, const FString &inout SnapshotJson)
{
    if (!(TargetEntity.IsValid()))
    {
        return;
    }
    FECSAIUtils::ApplyAICommandSnapshot(TargetEntity, SnapshotJson);
    return;
}
UFUNCTION()
void ApplyAICommandSnapshotWithRemap(const FECSEntity &inout TargetEntity, const FString &inout SnapshotJson, const TMap<int, int> &inout EntityIdRemap)
{
    if (!(TargetEntity.IsValid()))
    {
        return;
    }
    FECSAIUtils::ApplyAICommandSnapshotWithRemap(TargetEntity, SnapshotJson, EntityIdRemap);
    return;
}
UFUNCTION()
void RegisterBehaviorTreeResource(const FECSEntity &inout Entity)
{
    FECSAIUtils::RegisterBehaviorTree(Entity);
    return;
}
}
