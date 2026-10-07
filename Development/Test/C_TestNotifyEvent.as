
namespace __INTENRAL_FCE_TestNotifyUploadEvent_NS
{
    const TECSEventDerivedPtr<FCE_TestNotifyUploadEvent> DerivedPtr = TECSEventDerivedPtr<FCE_TestNotifyUploadEvent>();
}
namespace __INTENRAL_FCE_TestNotifySyncEvent_NS
{
    const TECSEventDerivedPtr<FCE_TestNotifySyncEvent> DerivedPtr = TECSEventDerivedPtr<FCE_TestNotifySyncEvent>();

}
struct FCE_TestNotifyUploadEvent : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    int TestEventPayload = 0;


    bool Validate() const
    {
        return true;
    }
}

struct FCE_TestNotifySyncEvent : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    int TestEventPayload = 0;


}

