
namespace AutoTest::API::AiAPI
{
void SetBTBlackbordValueAsVector(const int EntityId, const FName &inout KeyName, const FVector &inout Value)
{
    int local_20 = 0;
    int local_32 = 0;
    ThrowIf(!(FECSEntity(EntityId).IsValid()), FString().Append("EntityID: ").Append(EntityId).Append(" is invalid."));
    bool local_13 = !(local_20);
    ThrowIf(local_13, FString().Append("EntityID: ").Append(EntityId).Append(" FC_ControlledByAI is null."));
    ThrowIf(!(FECSEntity(local_20.GetControllerEntity().GetIdValue()).IsValid()), FString().Append("ControllerEntityID: ").Append(local_20.GetControllerEntity().GetIdValue()).Append(" is invalid."));
    ThrowIf(!(local_32), FString().Append("ControllerEntityID: ").Append(local_20.GetControllerEntity().GetIdValue()).Append(" FC_BehaviorTree is null."));
    ThrowIf((local_32.GetBlackboardComponent() == nullptr), FString().Append("ControllerEntityID: ").Append(local_20.GetControllerEntity().GetIdValue()).Append(" FC_BehaviorTree BlackboardComponent is null."));
    TWeakObjectPtr<UBlackboardComponent> local_34 = local_32.GetBlackboardComponent();
    UBlackboardComponent local_36;
    local_36.SetValueAsVector(KeyName, Value);
    return;
}
void SetBTTaskFinishMark(const bool bFinish)
{
    AutoTest::BTTaskUtils::SetBTTaskFinishMark(bFinish);
    return;
}
bool GetBTTaskFinishMark()
{
    return AutoTest::BTTaskUtils::GetBTTaskFinishMark();
}
void SetBTTaskShouldStart(const bool bStart)
{
    AutoTest::BTTaskUtils::SetBTTaskShouldStart(bStart);
    return;
}
bool GetBTTaskShouldStart()
{
    return AutoTest::BTTaskUtils::GetBTTaskShouldStart();
}
float32 GetAcceptableRadius(const int EntityId)
{
    int local_20 = 0;
    float32 local_22 = 0.0f;
    ThrowIf(!(FECSEntity(EntityId).IsValid()), FString().Append("EntityID: ").Append(EntityId).Append(" is invalid."));
    if (!(local_20) || !(local_20.GetMoveAbilityConfig()))
    {
        return -1.0f;
    }
    return local_22;
}
}
