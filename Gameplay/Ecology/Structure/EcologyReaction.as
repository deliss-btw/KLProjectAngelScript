
namespace FEcologyReactioConst
{
    const FName ReactionRuningContextKnowledgeKey = n"ReactionRuningContextBaseKey";

}
struct FReactionRuningContextBase
{
    UPROPERTY()
    FName BaseReason;
    UPROPERTY()
    FECSEntityId SourceEntity;
    UPROPERTY()
    FName CustomKnowledgeKey;

    FReactionRuningContextBase()
    {
        return;
    }
}

