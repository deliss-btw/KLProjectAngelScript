
namespace FAICombatTokenUtils
{
bool GenerateSpecialToken(const FECSEntity &inout Invoker, const TDataObjectPtr<FAISpecialCombatTokenConfig> &inout SpecialTokenConfg, const TArray<FAISmart_AnyValue> &inout Params, const FFPTime &inout GenerateTokenDelay, const EAISpecialTokenDispatchMode DispatchMode = EAISpecialTokenDispatchMode::SendToAll, const TArray<FECSEntityId> &inout TargetEntities = TArray<FECSEntityId>())
{
    int local_8 = 0;
    if (!(ECS::GetRuntimeInfo().IsServer))
    {
        return false;
    }
    if (local_8)
    {
        if (FECSEntity(local_8.GroupId))
        {
            FCE_AISpecialCombatTokenGenerate local_32;
            FFPTime local_18 = FFPTime();
            if (GenerateTokenDelay.opCmp(0.0) > 0)
            {
                FFPTime local_18_3 = (ECS::GetContextTime() + GenerateTokenDelay);
            }
            local_32.TokenConfg = SpecialTokenConfg;
            local_32.ParamValues = Params;
            local_32.DispatchMode = DispatchMode;
            local_32.TargetEntities = TargetEntities;
            return true;
        }
    }
    return false;
}
void AssignSpecialToken(const FECSEntity &inout Receiver, FC_AICombatKnowledge &inout CombatKnowledge, const FAISpecialCombatTokenHandle &inout SpecialToken, const FECSEntity &inout TokenSource)
{
    CombatKnowledge.SpecialTokenSource = TokenSource.GetId();
    FECSAIUtils::DispatchAIDecoratorAbortSignal(Receiver, FAIDecoratorAbortSignal(EAIDecoratorAbortSignal(1), SpecialToken.TokenUid));
    return;
}
}
