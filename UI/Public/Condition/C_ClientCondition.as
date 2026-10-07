
namespace __INTENRAL_FCE_ClientConditionTriggerReason_NS
{
    const TECSEventDerivedPtr<FCE_ClientConditionTriggerReason> DerivedPtr = TECSEventDerivedPtr<FCE_ClientConditionTriggerReason>();

}
struct FCE_ClientConditionTriggerReason : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    EClientConditionTriggerReason Reason = EClientConditionTriggerReason(0);


}

