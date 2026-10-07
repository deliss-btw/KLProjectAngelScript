
namespace __INTENRAL_FCE_DebugServerConsoleCommandEvent_NS
{
    const TECSEventDerivedPtr<FCE_DebugServerConsoleCommandEvent> DerivedPtr = TECSEventDerivedPtr<FCE_DebugServerConsoleCommandEvent>();

}
struct FCE_DebugServerConsoleCommandEvent : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FString FunctionName;
    UPROPERTY()
    FString ArgumentsStr;

    FCE_DebugServerConsoleCommandEvent()
    {
        return;
    }
}

