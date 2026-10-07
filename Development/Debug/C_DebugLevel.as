
namespace __INTENRAL_FCE_DebugLoadDataLayerEvent_NS
{
    const TECSEventDerivedPtr<FCE_DebugLoadDataLayerEvent> DerivedPtr = TECSEventDerivedPtr<FCE_DebugLoadDataLayerEvent>();
}
namespace __INTENRAL_FCE_DebugUnloadDataLayerEvent_NS
{
    const TECSEventDerivedPtr<FCE_DebugUnloadDataLayerEvent> DerivedPtr = TECSEventDerivedPtr<FCE_DebugUnloadDataLayerEvent>();

}
struct FCE_DebugLoadDataLayerEvent : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FName DataLayerShortName;

    FCE_DebugLoadDataLayerEvent()
    {
        return;
    }
}

struct FCE_DebugUnloadDataLayerEvent : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FName DataLayerShortName;

    FCE_DebugUnloadDataLayerEvent()
    {
        return;
    }
}

