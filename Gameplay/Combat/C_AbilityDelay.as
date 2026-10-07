
namespace __INTENRAL_FCE_AbilityDelayEvent_NS
{
    const TECSEventDerivedPtr<FCE_AbilityDelayEvent> DerivedPtr = TECSEventDerivedPtr<FCE_AbilityDelayEvent>();
}
namespace __INTENRAL_FCE_AbilityDelayEventByClass_NS
{
    const TECSEventDerivedPtr<FCE_AbilityDelayEventByClass> DerivedPtr = TECSEventDerivedPtr<FCE_AbilityDelayEventByClass>();

}
struct FCE_AbilityDelayEvent : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FECSEntity Receiver;
    UPROPERTY()
    FName AbilityName;
    UPROPERTY()
    FName SignalName;
    UPROPERTY()
    bool bAbilityPredictable = true;


}

struct FCE_AbilityDelayEventByClass : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FECSEntity Receiver;
    UPROPERTY()
    TSoftClassPtr<UEASAbility> AbilityClass;
    UPROPERTY()
    FName SignalName;
    UPROPERTY()
    bool bAbilityPredictable = true;


}

