
namespace KLFlowLibrary
{
bool GetEntityByECSEntityId(const FECSEntityId &inout EntityId, FECSEntity &out Entity)
{
    FECSEntity local_4;
    Entity = local_4;
    Entity = FECSEntity(EntityId);
    return Entity.IsValid();
}
bool GetEntityByKLFlowECSEntityId(const FKLFlowECSEntityId &inout EntityId, FECSEntity &out Entity)
{
    FECSEntity local_4;
    Entity = local_4;
    Entity = FECSEntity(FECSEntityId(int(EntityId.Value)));
    return Entity.IsValid();
}
bool GetEntityByLevelUnitRef(const FKLFlowLevelUnitRef &inout UnitRef, FECSEntity &out Entity)
{
    FECSEntity local_4;
    int local_12 = 0;
    Entity = local_4;
    FECSWorldPtr local_6 = ECS::GetECSWorld();
    if (!(local_12))
    {
        return false;
    }
    FECSEntityId local_15;
    Entity = FECSEntity(local_15);
    return Entity.IsValid();
}
void PostFlowEvent(const FName &inout EventTag, const FInstancedStruct &inout EventData)
{
    if (!(ECS::GetRuntimeInfo().IsServer))
    {
        return;
    }
    FAngelscriptGameThreadScopeWorldContext local_4 = FAngelscriptGameThreadScopeWorldContext(ECS::GetUEWorld());
    UKLFlowSubsystem local_8 = UKLFlowSubsystem::GetFlowSubsystem(__GetWorldContext());
    if (local_8 != nullptr)
    {
        local_8.PostEvent(EventTag, EventData);
    }
    return;
}
}
