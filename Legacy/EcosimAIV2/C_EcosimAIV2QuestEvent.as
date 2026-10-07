
namespace __INTENRAL_FCE_EcosimAIV2StartQuest_NS
{
    const TECSEventDerivedPtr<FCE_EcosimAIV2StartQuest> DerivedPtr = TECSEventDerivedPtr<FCE_EcosimAIV2StartQuest>();

}
struct FCE_EcosimAIV2StartQuest : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FName QuestName;

    FCE_EcosimAIV2StartQuest()
    {
        return;
    }
}

