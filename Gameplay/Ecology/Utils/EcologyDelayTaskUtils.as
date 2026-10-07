
namespace FDelayTaskConst
{
    const int BaseCost = 100;
    const FDelayTaskHandle EmptyDelayTaskHandle = FDelayTaskHandle();

}
namespace FEcologyDelayTaskUtils
{
void AddTaskToSpawnLayer(const FDelayTaskHandle &inout Handle, const EDelayTaskPriority Priority = EDelayTaskPriority::Common)
{
    FECSWorldPtr local_2 = ECS::GetECSWorld();
    0.SpawnTaskLayer.AddTask(Handle, EDelayTaskPriority(Priority));
    return;
}
void AddTaskToUpdateTargetLayer(const FDelayTaskHandle &inout Handle, const EDelayTaskPriority Priority = EDelayTaskPriority::Common)
{
    FECSWorldPtr local_2 = ECS::GetECSWorld();
    0.TargetUpdateLayer.AddTask(Handle, EDelayTaskPriority(Priority));
    return;
}
void AddSpawnTaskToCurrentTask(const FDelayTaskHandle &inout Handle)
{
    int local_8 = 0;
    FECSWorldPtr local_2 = ECS::GetECSWorld();
    FDelayTaskHandle local_10 = local_8.GetCurrentTaskHandle();
    if (local_8.HandleValid(local_10))
    {
        local_8.AddSubTask(local_10, Handle);
        return;
    }
    return;
}
}
