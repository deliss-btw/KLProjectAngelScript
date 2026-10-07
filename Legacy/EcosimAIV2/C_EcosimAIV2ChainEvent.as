
namespace __INTENRAL_FCE_EcosimAIV2ChainEvent_NS
{
    const TECSEventDerivedPtr<FCE_EcosimAIV2ChainEvent> DerivedPtr = TECSEventDerivedPtr<FCE_EcosimAIV2ChainEvent>();
}
namespace __INTENRAL_FCE_EcosimAIV2RiderChainEvent_NS
{
    const TECSEventDerivedPtr<FCE_EcosimAIV2RiderChainEvent> DerivedPtr = TECSEventDerivedPtr<FCE_EcosimAIV2RiderChainEvent>();
}
namespace __INTENRAL_FCE_EcosimAIV2UnchainEvent_NS
{
    const TECSEventDerivedPtr<FCE_EcosimAIV2UnchainEvent> DerivedPtr = TECSEventDerivedPtr<FCE_EcosimAIV2UnchainEvent>();

}
struct FCE_EcosimAIV2ChainEvent : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FECSEntity ChainParentEntity;
    UPROPERTY()
    FECSEntity ChainChildEntity;

    FCE_EcosimAIV2ChainEvent()
    {
        return;
    }
}

struct FCE_EcosimAIV2RiderChainEvent : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FECSEntity RiderEntity;
    UPROPERTY()
    FECSEntity ChainChildEntity;

    FCE_EcosimAIV2RiderChainEvent()
    {
        return;
    }
}

struct FCE_EcosimAIV2UnchainEvent : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FECSEntity TargetEntity;

    FCE_EcosimAIV2UnchainEvent()
    {
        return;
    }
}

