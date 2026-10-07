
namespace __INTENRAL_FCE_EcosimAIV2DebugEvent_NS
{
    const TECSEventDerivedPtr<FCE_EcosimAIV2DebugEvent> DerivedPtr = TECSEventDerivedPtr<FCE_EcosimAIV2DebugEvent>();

}
struct FCE_EcosimAIV2DebugEvent : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FString DebugEventName;

    FCE_EcosimAIV2DebugEvent()
    {
        return;
    }
}

