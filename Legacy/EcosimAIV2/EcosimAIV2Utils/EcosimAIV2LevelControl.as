
namespace FEcosimAIV2Utils
{
void SetLevelControlMoveToSpecifiedTransform(const FECSEntity &inout Entity, const FName &inout MoveToKeyName, const FVector &inout SpecifiedLocation, const bool bSpecifiedDirection, const FVector &inout SpecifiedDirection)
{
    ModifyOrAdd local_4;
    FC_EcologyKnowledge& local_6 = local_4.opCall();
    if (local_6)
    {
        local_6.SetSpecifier(FEcologyKnowledgeKey(FName("MoveToKeyName")), MoveToKeyName);
        local_6.SetBool(FEcologyKnowledgeKey(FName("bMoveToSpecifiedLocation")), true);
        local_6.SetVector(FEcologyKnowledgeKey(FName("MoveToSpecifiedLocation")), SpecifiedLocation);
        local_6.SetBool(FEcologyKnowledgeKey(FName("bMoveToSpecifiedDirection")), bSpecifiedDirection);
        local_6.SetVector(FEcologyKnowledgeKey(FName("MoveToSpecifiedDirection")), SpecifiedDirection);
    }
    return;
}
void RemoveLevelControlMoveToSpecifiedTransform(const FECSEntity &inout Entity)
{
    Modify local_4;
    FC_EcologyKnowledge& local_6 = local_4.opCall();
    if (local_6)
    {
        local_6.SetSpecifier(FEcologyKnowledgeKey(FName("MoveToKeyName")), FName("NAME_None"));
        local_6.SetBool(FEcologyKnowledgeKey(FName("bMoveToSpecifiedLocation")), false);
        local_6.SetBool(FEcologyKnowledgeKey(FName("bMoveToSpecifiedDirection")), false);
    }
    return;
}
}
