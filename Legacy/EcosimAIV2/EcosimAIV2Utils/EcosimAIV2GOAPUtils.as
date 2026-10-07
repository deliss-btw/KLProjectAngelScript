
namespace FEcosimAIV2Utils
{
void RunGOAP(const FECSEntity &inout Entity, const TSubclassOf<UECSGOAPEcosimAIV2InstanceBase> &inout InstanceClass, const FName &inout GoalName)
{
    int local_6 = 0;
    UECSGOAPEcosimAIV2InstanceBase local_10 = local_6.Instance;
    if (local_10 != nullptr && local_6.Instance.IsExecutingAction())
    {
        local_6.Instance.AbortExecutingAction(FOnActionAborted__GOAP_InstanceBase());
    }
    UECSGOAPEcosimAIV2InstanceBase local_18 = local_6.Instance;
    if (local_18 == nullptr)
    {
        local_6.Instance = (Cast<UECSGOAPEcosimAIV2InstanceBase>(NewObject(ECS::GetUEWorld(), InstanceClass, Entity.GetEntityName(), false)));
        UEcosimAIV2GOAPSubsystem::Get().Instances.Add(local_6.Instance);
    }
    local_6.Instance.Entity = Entity;
    FGOAP_PlanContext local_34;
    bool local_7 = false;
    FGOAP_PlanContext local_35 = local_7;
    local_6.Instance.TryPlanToGoal(GoalName, local_34, local_35, false);
    if (local_35 != 0)
    {
        local_6.Instance.ExecutePlannedActions(local_34, FOnActionFinished__GOAP_InstanceBase());
    }
    return;
}
void EntityRunGOAP(const FECSEntity &inout Entity, const FName &inout GoalName)
{
    if (!(Entity.IsValid()))
    {
        return;
    }
    UClass local_12 = (Cast<UClass>(LoadObject(nullptr, FString().Append("/Game/MoleRes/Dev/AI/GOAP/EcosimAIV2/GOAP_EcosimAIV2_Test.GOAP_EcosimAIV2_Test_C"))));
    if (local_12 != nullptr)
    {
        FEcosimAIV2Utils::RunGOAP(Entity, TSubclassOf<UECSGOAPEcosimAIV2InstanceBase>(local_12), GoalName);
    }
    return;
}
}
