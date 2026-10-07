
namespace __INTENRAL_FCE_EcosimAIV2InitEcology_NS
{
    const TECSEventDerivedPtr<FCE_EcosimAIV2InitEcology> DerivedPtr = TECSEventDerivedPtr<FCE_EcosimAIV2InitEcology>();
}
namespace __INTENRAL_FCE_EcosimAIV2SwitchMetaRealState_NS
{
    const TECSEventDerivedPtr<FCE_EcosimAIV2SwitchMetaRealState> DerivedPtr = TECSEventDerivedPtr<FCE_EcosimAIV2SwitchMetaRealState>();

}
struct FCE_EcosimAIV2InitEcology : FECSEvent
{
    FECSEvent _base_FECSEvent;

    FCE_EcosimAIV2InitEcology()
    {
        return;
    }
}

struct FCE_EcosimAIV2SwitchMetaRealState : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    bool bToMeta = false;


}

