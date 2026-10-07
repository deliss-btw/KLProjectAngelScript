
namespace __INTENRAL_FCE_EcosimAIV2ActionExpression_NS
{
    const TECSEventDerivedPtr<FCE_EcosimAIV2ActionExpression> DerivedPtr = TECSEventDerivedPtr<FCE_EcosimAIV2ActionExpression>();
}
namespace __INTENRAL_FCE_EcosimAIV2RelationFactChange_NS
{
    const TECSEventDerivedPtr<FCE_EcosimAIV2RelationFactChange> DerivedPtr = TECSEventDerivedPtr<FCE_EcosimAIV2RelationFactChange>();

}
struct FCE_EcosimAIV2ActionExpression : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    EEcosimAIV2ActionExpressionMeaning ActionExpressionMeaning;


}

struct FCE_EcosimAIV2RelationFactChange : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FECSEntity RelationFactSource;
    UPROPERTY()
    FECSEntity RelationFactTarget;
    UPROPERTY()
    EEcosimAIV2EntityRelation Relation;
    UPROPERTY()
    bool bIsAdd;


}

