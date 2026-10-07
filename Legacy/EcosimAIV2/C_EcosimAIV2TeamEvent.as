
namespace __INTENRAL_FCE_EcosimAIV2TeamInfoUpdate_NS
{
    const TECSEventDerivedPtr<FCE_EcosimAIV2TeamInfoUpdate> DerivedPtr = TECSEventDerivedPtr<FCE_EcosimAIV2TeamInfoUpdate>();
}
namespace __INTENRAL_FCE_EcosimAIV2TeamMemberBeginPlay_NS
{
    const TECSEventDerivedPtr<FCE_EcosimAIV2TeamMemberBeginPlay> DerivedPtr = TECSEventDerivedPtr<FCE_EcosimAIV2TeamMemberBeginPlay>();
}
namespace __INTENRAL_FCE_EcosimAIV2TeamMemberAllBeginPlay_NS
{
    const TECSEventDerivedPtr<FCE_EcosimAIV2TeamMemberAllBeginPlay> DerivedPtr = TECSEventDerivedPtr<FCE_EcosimAIV2TeamMemberAllBeginPlay>();

}
struct FCE_EcosimAIV2TeamInfoUpdate : FECSEvent
{
    FECSEvent _base_FECSEvent;

    FCE_EcosimAIV2TeamInfoUpdate()
    {
        return;
    }
}

struct FCE_EcosimAIV2TeamMemberBeginPlay : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FECSEntity MemberEntity;

    FCE_EcosimAIV2TeamMemberBeginPlay()
    {
        return;
    }
}

struct FCE_EcosimAIV2TeamMemberAllBeginPlay : FECSEvent
{
    FECSEvent _base_FECSEvent;

    FCE_EcosimAIV2TeamMemberAllBeginPlay()
    {
        return;
    }
}

