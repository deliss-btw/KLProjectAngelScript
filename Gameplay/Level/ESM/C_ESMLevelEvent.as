
namespace __INTENRAL_FCE_ESMTriggerResponded_NS
{
    const TECSEventDerivedPtr<FCE_ESMTriggerResponded> DerivedPtr = TECSEventDerivedPtr<FCE_ESMTriggerResponded>();
}
namespace __INTENRAL_FCE_ESMLevelActionEvent_NS
{
    const TECSEventDerivedPtr<FCE_ESMLevelActionEvent> DerivedPtr = TECSEventDerivedPtr<FCE_ESMLevelActionEvent>();

}
struct FCE_ESMTriggerResponded : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FECSEntity Entity;
    UPROPERTY()
    FName TriggerName;
    UPROPERTY()
    int StateMachineIndex = -1;


}

struct FCE_ESMLevelActionEvent : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FECSEntity Entity;
    UPROPERTY()
    FName EventName;
    UPROPERTY()
    bool bIsEnter = true;


}

