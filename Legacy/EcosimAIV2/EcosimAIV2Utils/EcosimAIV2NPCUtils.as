
namespace FEcosimAIV2Utils
{
void SetNPCMainPose(const FECSEntity &inout Entity, const EEcosimAIHumanityMainPose Pose)
{
    FESMTriggerUtils::ActivateESMTrigger(Entity, n"HumanityMainPoseTrigger", ECS::GetContextTime(), FFPTime(1), 0);
    int local_3 = int(Pose);
    ECS::GetContextTime();
    FNameHandle_EntityBBVarEnum local_12;
    local_12;
    return;
}
void SetNPCMainStance(const FECSEntity &inout Entity, const EEcosimAIHumanityMainStance Stance)
{
    FESMTriggerUtils::ActivateESMTrigger(Entity, n"HumanityMainStanceTrigger", ECS::GetContextTime(), FFPTime(1), 0);
    int local_3 = int(Stance);
    ECS::GetContextTime();
    FNameHandle_EntityBBVarEnum local_12;
    local_12;
    return;
}
}
