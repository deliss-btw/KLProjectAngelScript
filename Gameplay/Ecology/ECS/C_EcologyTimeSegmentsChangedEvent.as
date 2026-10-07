
namespace __INTENRAL_FCE_EcologyTimeSegmentsChangedEvent_NS
{
    const TECSEventDerivedPtr<FCE_EcologyTimeSegmentsChangedEvent> DerivedPtr = TECSEventDerivedPtr<FCE_EcologyTimeSegmentsChangedEvent>();

}
struct FCE_EcologyTimeSegmentsChangedEvent : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    int PreviousTimeSegments;
    UPROPERTY()
    int NewTimeSegments;
    UPROPERTY()
    bool bTimeElementsChanged;


}

