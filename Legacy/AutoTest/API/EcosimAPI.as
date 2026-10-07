
namespace AutoTest::API::EcosimAPI
{
void SetEntityBehaviorTreeRunState(const uint EntityId, const bool bRun)
{
    ThrowIf(!(FECSEntity(EntityId).IsValid()), FString().Append("EntityID: ").Append(EntityId).Append(" is unvalid."));
    return;
}
bool IsEntityInCombat(const uint EntityId)
{
    FECSEntity local_4 = FECSEntity(EntityId);
    ThrowIf(!(local_4.IsValid()), FString().Append("EntityID: ").Append(EntityId).Append(" is unvalid."));
    return FAIKnowledgeUtils::IsEntityInCombat(local_4);
}
TMap<FString, float32> GetEntityAlertnessMap(const uint EntityId)
{
    ThrowIf(!(FECSEntity(EntityId).IsValid()), FString().Append("EntityID: ").Append(EntityId).Append(" is unvalid."));
    Get local_38;
    const FC_AITargetingV2& local_40 = local_38.opCall();
    if (local_40)
    {
        for (auto& local_58 : local_40.EntityAlertnessMap)
        {
            int local_59 = local_58.GetKey().GetEntity().GetIdValue();
            FString local_12 = FString();
        }
    }
    return TMap<FString, float32>();
}
float32 GetEntityAlertnessMax(const uint EntityId)
{
    ThrowIf(!(FECSEntity(EntityId).IsValid()), FString().Append("EntityID: ").Append(EntityId).Append(" is unvalid."));
    FC_AITargetingV2 local_20;
    bool local_13 = !(local_20);
    ThrowIf(local_13, FString().Append("EntityID: ").Append(EntityId).Append(" FC_AITargetingV2 is null."));
    return local_20.AlertnessMax;
}
void SetEcosimAICreatureCombatData(const FName &inout EcosimAICreatureName, const FName &inout CombatDataType, const float32 Value)
{
    FPrologUtils::RetractFactAll(FString().Append(CombatDataType).Append("(").Append(EcosimAICreatureName).Append(", _)"), true, true);
    FPrologUtils::AddFact(FString().Append(CombatDataType).Append("(").Append(EcosimAICreatureName).Append(", ").Append(Value).Append(")"), true, true);
    return;
}
bool IsCollectableVisible(const uint EntityId)
{
    FECSEntity local_4 = FECSEntity(EntityId);
    ThrowIf(!(local_4.IsValid()), FString().Append("EntityID: ").Append(EntityId).Append(" is unvalid."));
    int local_14 = 0;
    ThrowIf(!(EcoCollectableUtils::LowLevelIsAllShowOrHidden(local_4, true, true, local_14)), FString().Append("EntityID: ").Append(EntityId).Append(" LowLevelIsAllShowOrHidden failed."));
    return (local_14 != 0);
}
}
